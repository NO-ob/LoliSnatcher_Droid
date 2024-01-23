import 'dart:io';

import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/data/constants.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/http_overrides.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});
  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  bool allowSelfSignedCerts = false;

  final TextEditingController userAgentController = TextEditingController();

  @override
  void initState() {
    super.initState();

    allowSelfSignedCerts = settingsHandler.allowSelfSignedCerts;
    userAgentController.text = settingsHandler.customUserAgent;
  }

  Future<void> _onPopInvoked(bool didPop) async {
    if (didPop) {
      return;
    }

    settingsHandler.allowSelfSignedCerts = allowSelfSignedCerts;
    settingsHandler.customUserAgent = userAgentController.text;
    final bool result = await settingsHandler.saveSettings(restate: false);

    if (allowSelfSignedCerts) {
      HttpOverrides.global = MyHttpOverrides();
    } else {
      HttpOverrides.global = null;
    }

    if (result) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Network'),
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
                title: 'Enable Self Signed SSL Certificates',
              ),
              const SettingsButton(name: '', enabled: false),
              SettingsTextInput(
                controller: userAgentController,
                title: 'Custom User Agent',
                clearable: true,
                resetText: () => '',
                drawBottomBorder: false,
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const SettingsDialog(
                          title: Text('Custom User Agent'),
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
              SettingsButton(
                name: 'Tap here to use suggested browser user agent:',
                subtitle: const Text(Constants.defaultBrowserUserAgent),
                action: () {
                  userAgentController.text = Constants.defaultBrowserUserAgent;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
