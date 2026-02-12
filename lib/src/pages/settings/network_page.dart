import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/constants.dart';
import 'package:lolisnatcher/src/data/settings/proxy_type.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
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
    proxyType = settingsHandler.proxyType;
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

  Future<void> _onPopInvoked(_, _) async {
    settingsHandler.allowSelfSignedCerts = allowSelfSignedCerts;
    settingsHandler.customUserAgent = userAgentController.text;
    settingsHandler.proxyType = proxyType;
    settingsHandler.proxyAddress = proxyAddressController.text;
    settingsHandler.proxyUsername = proxyUsernameController.text;
    settingsHandler.proxyPassword = proxyPasswordController.text;
    await settingsHandler.saveSettings(restate: false);

    await initProxy();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: SettingsAppBar(
          title: context.loc.settings.network.title,
        ),
        body: Center(
          child: ListView(
            children: [
              SettingsToggle(
                value: allowSelfSignedCerts,
                onChanged: (newValue) {
                  setState(() {
                    allowSelfSignedCerts = newValue;
                  });
                },
                title: context.loc.settings.network.enableSelfSignedSSLCertificates,
              ),
              const SettingsButton(name: '', enabled: false),
              SettingsDropdown<ProxyType>(
                value: proxyType,
                items: ProxyType.values,
                onChanged: (ProxyType? newValue) {
                  setState(() {
                    proxyType = newValue ?? ProxyType.defaultValue;
                  });
                },
                title: context.loc.settings.network.proxy,
                subtitle: Text(context.loc.settings.network.proxySubtitle),
                itemTitleBuilder: (e) => e?.locName ?? '',
              ),
              if (!proxyType.isDirect && !proxyType.isSystem) ...[
                SettingsTextInput(
                  controller: proxyAddressController,
                  title: context.loc.address,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  resetText: () => '',
                  pasteable: true,
                  enableIMEPersonalizedLearning: !settingsHandler.incognitoKeyboard,
                ),
                SettingsTextInput(
                  controller: proxyUsernameController,
                  title: context.loc.username,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  resetText: () => '',
                  pasteable: true,
                  enableIMEPersonalizedLearning: !settingsHandler.incognitoKeyboard,
                ),
                SettingsTextInput(
                  controller: proxyPasswordController,
                  title: context.loc.password,
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
                title: context.loc.settings.network.customUserAgent,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                resetText: () => '',
                onChanged: (_) => setState(() {}),
                pasteable: true,
                drawBottomBorder: false,
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SettingsDialog(
                          title: Text(context.loc.settings.network.customUserAgentTitle),
                          contentItems: [
                            Text(context.loc.settings.network.keepEmptyForDefault),
                            Text(context.loc.settings.network.defaultUserAgent(agent: Tools.appUserAgent)),
                            Text(context.loc.settings.network.userAgentUsedOnRequests),
                            Text(context.loc.settings.network.valueSavedAfterLeaving),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              if (userAgentController.text != Constants.defaultBrowserUserAgent)
                SettingsButton(
                  name: context.loc.settings.network.setBrowserUserAgent,
                  subtitle: const Text(Constants.defaultBrowserUserAgent),
                  action: () {
                    userAgentController.text = Constants.defaultBrowserUserAgent;
                    setState(() {});
                  },
                ),
              const SettingsButton(name: '', enabled: false),
              SettingsButton(
                name: context.loc.settings.network.cookieCleaner,
                icon: const Icon(Icons.cookie_rounded),
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
                title: context.loc.settings.network.booru,
                subtitle: Text(context.loc.settings.network.selectBooruToClearCookies),
              ),
              if (selectedBooruCookies.isNotEmpty) ...[
                SettingsButton(
                  name: context.loc.settings.network.cookiesFor(booruName: selectedBooru?.name ?? ''),
                  enabled: false,
                ),
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
                        title: Text(context.loc.settings.network.cookieDeleted(cookieName: cookie.name)),
                      );
                    },
                  ),
                ],
              ],
              SettingsButton(
                name: selectedBooru != null
                    ? context.loc.settings.network.clearCookiesFor(booruName: selectedBooru!.name!)
                    : context.loc.settings.network.clearCookies,
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
                      title: Text(
                        context.loc.settings.network.cookiesForBooruDeleted(booruName: selectedBooru?.name ?? ''),
                      ),
                    );
                  } else {
                    await CookieManager.instance(webViewEnvironment: webViewEnvironment).deleteAllCookies();
                    globalWindowsCookies.clear();
                    FlashElements.showSnackbar(
                      context: context,
                      title: Text(context.loc.settings.network.allCookiesDeleted),
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
