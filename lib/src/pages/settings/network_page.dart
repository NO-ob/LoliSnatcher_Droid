import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/constants.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/utils/http_overrides.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/webview/webview_page.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});
  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  bool allowSelfSignedCerts = false;
  Booru? selectedBooru;
  List<Cookie> selectedBooruCookies = [];
  ProxyType proxyType = ProxyType.direct;

  final TextEditingController userAgentController = TextEditingController(),
      proxyAddressController = TextEditingController(),
      proxyUsernameController = TextEditingController(),
      proxyPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    allowSelfSignedCerts = settingsHandler.allowSelfSignedCerts;
    userAgentController.text = settingsHandler.customUserAgent;
    proxyType = ProxyType.fromName(settingsHandler.proxyType);
    proxyAddressController.text = settingsHandler.proxyAddress;
    proxyUsernameController.text = settingsHandler.proxyUsername;
    proxyPasswordController.text = settingsHandler.proxyPassword;
  }

  @override
  void dispose() {
    userAgentController.dispose();
    proxyAddressController.dispose();
    proxyUsernameController.dispose();
    proxyPasswordController.dispose();
    super.dispose();
  }

  Future<void> _onPopInvoked(bool didPop, _) async {
    if (didPop) {
      return;
    }

    settingsHandler.allowSelfSignedCerts = allowSelfSignedCerts;
    settingsHandler.customUserAgent = userAgentController.text;
    settingsHandler.proxyType = proxyType.name;
    settingsHandler.proxyAddress = proxyAddressController.text;
    settingsHandler.proxyUsername = proxyUsernameController.text;
    settingsHandler.proxyPassword = proxyPasswordController.text;
    final bool result = await settingsHandler.saveSettings(restate: false);

    await initProxy();

    if (result) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Network'),
        ),
        body: Center(
          child: ListView(
            children: [
              SettingsToggle(
                value: settingsHandler.useHttp2,
                onChanged: (newValue) {
                  setState(() {
                    settingsHandler.useHttp2 = newValue;
                  });
                },
                title: 'Use HTTP2',
                subtitle: const Text(
                  'Can improve loading times, but some sites may not support it. Disable this if you encounter issues.',
                ),
              ),
              SettingsToggle(
                value: allowSelfSignedCerts,
                onChanged: (newValue) {
                  setState(() {
                    allowSelfSignedCerts = newValue;
                  });
                },
                title: 'Enable self signed SSL certificates',
              ),
              const SettingsButton(name: '', enabled: false),
              SettingsDropdown<ProxyType>(
                value: proxyType,
                items: (settingsHandler.map['proxyType']!['options'] as List<String>).map(ProxyType.fromName).toList(),
                onChanged: (ProxyType? newValue) {
                  setState(() {
                    proxyType = newValue ?? ProxyType.direct;
                  });
                },
                title: 'Proxy',
                subtitle: const Text('Does not apply to streaming video mode, use caching video mode instead'),
                itemBuilder: (item) => Text(item?.name.capitalizeFirst ?? ''),
              ),
              if (!proxyType.isDirect && !proxyType.isSystem) ...[
                SettingsTextInput(
                  controller: proxyAddressController,
                  title: 'Address',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  resetText: () => '',
                  pasteable: true,
                  enableIMEPersonalizedLearning: !settingsHandler.incognitoKeyboard,
                ),
                SettingsTextInput(
                  controller: proxyUsernameController,
                  title: 'Username',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  resetText: () => '',
                  pasteable: true,
                  enableIMEPersonalizedLearning: !settingsHandler.incognitoKeyboard,
                ),
                SettingsTextInput(
                  controller: proxyPasswordController,
                  title: 'Password',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  resetText: () => '',
                  pasteable: true,
                  obscureable: true,
                  enableIMEPersonalizedLearning: !settingsHandler.incognitoKeyboard,
                ),
              ],
              const SettingsButton(name: '', enabled: false),
              SettingsTextInput(
                controller: userAgentController,
                title: 'Custom user agent',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                resetText: () => '',
                pasteable: true,
                drawBottomBorder: false,
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const SettingsDialog(
                          title: Text('Custom user agent'),
                          contentItems: [
                            Text('Keep empty to use default value'),
                            Text('Default: ${Tools.appUserAgent}'),
                            Text('Will be used on requests for almost all boorus and on the webview'),
                            Text('Value is saved after leaving this page'),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              if (userAgentController.text != Constants.defaultBrowserUserAgent)
                SettingsButton(
                  name: 'Tap here to use suggested browser user agent:',
                  subtitle: const Text(Constants.defaultBrowserUserAgent),
                  action: () {
                    userAgentController.text = Constants.defaultBrowserUserAgent;
                  },
                ),
              const SettingsButton(name: '', enabled: false),
              const SettingsButton(
                name: 'Cookie cleaner',
                icon: Icon(Icons.cookie_rounded),
              ),
              SettingsBooruDropdown(
                value: selectedBooru,
                nullable: true,
                onChanged: (newValue) async {
                  selectedBooru = newValue;
                  if (newValue != null) {
                    selectedBooruCookies = await CookieManager.instance(
                      webViewEnvironment: webViewEnvironment,
                    ).getCookies(url: WebUri(selectedBooru!.baseURL!));
                    if (Platform.isWindows) {
                      selectedBooruCookies.addAll(globalWindowsCookies[selectedBooru!.baseURL!] ?? []);
                    }
                  } else {
                    selectedBooruCookies = [];
                  }
                  setState(() {});
                },
                title: 'Booru',
                subtitle: const Text('Select a booru to clear cookies for or leave empty to clear all'),
              ),
              if (selectedBooruCookies.isNotEmpty) ...[
                SettingsButton(name: 'Cookies for ${selectedBooru?.name}:', enabled: false),
                for (final Cookie cookie in selectedBooruCookies) ...[
                  SettingsButton(
                    name:
                        '${cookie.name} = ${cookie.value}${cookie.expiresDate != null ? '\nExpires: ${DateTime.fromMillisecondsSinceEpoch(cookie.expiresDate!)}' : ''}',
                    action: () {
                      CookieManager.instance(webViewEnvironment: webViewEnvironment).deleteCookie(
                        url: WebUri(selectedBooru!.baseURL!),
                        name: cookie.name,
                      );
                      globalWindowsCookies[selectedBooru!.baseURL!]?.remove(cookie);
                      selectedBooruCookies.removeAt(selectedBooruCookies.indexOf(cookie));
                      setState(() {});
                      FlashElements.showSnackbar(
                        context: context,
                        title: Text('"${cookie.name}" cookie deleted'),
                      );
                    },
                  ),
                ],
              ],
              SettingsButton(
                name: 'Clear cookies${selectedBooru != null ? ' for ${selectedBooru!.name}' : ''}',
                icon: const Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                ),
                action: () async {
                  if (selectedBooru != null) {
                    await CookieManager.instance(
                      webViewEnvironment: webViewEnvironment,
                    ).deleteCookies(url: WebUri(selectedBooru!.baseURL!));
                    globalWindowsCookies[selectedBooru!.baseURL!]?.clear();
                    FlashElements.showSnackbar(
                      context: context,
                      title: Text('Cookies for ${selectedBooru?.name} deleted'),
                    );
                  } else {
                    await CookieManager.instance(webViewEnvironment: webViewEnvironment).deleteAllCookies();
                    globalWindowsCookies.clear();
                    FlashElements.showSnackbar(
                      context: context,
                      title: const Text('All cookies deleted'),
                    );
                  }

                  selectedBooru = null;
                  selectedBooruCookies.clear();
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum ProxyType {
  direct,
  system,
  http,
  socks5,
  socks4;

  bool get isDirect => this == direct;
  bool get isSystem => this == system;
  bool get isHttp => this == http;
  bool get isSocks5 => this == socks5;
  bool get isSocks4 => this == socks4;

  static ProxyType fromName(String name) {
    return ProxyType.values.firstWhereOrNull((e) => e.name == name) ?? direct;
  }
}
