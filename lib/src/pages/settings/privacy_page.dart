import 'dart:io';

import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/local_auth_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final LocalAuthHandler localAuthHandler = LocalAuthHandler.instance;

  bool blurOnLeave = false, useLockscreen = false, incognitoKeyboard = false;
  final TextEditingController autoLockTimeoutController = TextEditingController();

  @override
  void initState() {
    super.initState();

    localAuthHandler.canCheckBiometrics().then((_) => setState(() {}));

    blurOnLeave = settingsHandler.blurOnLeave.value;
    useLockscreen = settingsHandler.useLockscreen.value;
    autoLockTimeoutController.text = settingsHandler.autoLockTimeout.toString();
    incognitoKeyboard = settingsHandler.incognitoKeyboard;
  }

  Future<void> _onPopInvoked(bool didPop, _) async {
    if (didPop) {
      return;
    }

    settingsHandler.blurOnLeave.value = blurOnLeave;
    settingsHandler.useLockscreen.value = useLockscreen;
    settingsHandler.autoLockTimeout =
        int.tryParse(autoLockTimeoutController.text) ?? settingsHandler.map['autoLockTimeout']!['default'];
    settingsHandler.incognitoKeyboard = incognitoKeyboard;
    final bool result = await settingsHandler.saveSettings(restate: false);

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
          title: Text(context.loc.settings.privacy.title),
        ),
        body: Center(
          child: ListView(
            children: [
              if (localAuthHandler.isSupportedPlatform)
                SettingsToggle(
                  value: useLockscreen,
                  onChanged: (newValue) {
                    setState(() {
                      useLockscreen = newValue;
                    });
                  },
                  title: context.loc.settings.privacy.appLock,
                  subtitle: Text(context.loc.settings.privacy.appLockMsg),
                ),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                alignment: Alignment.bottomCenter,
                child: useLockscreen
                    ? SettingsTextInput(
                        controller: autoLockTimeoutController,
                        title: context.loc.settings.privacy.autoLockAfter,
                        subtitle: Text(context.loc.settings.privacy.autoLockAfterTip),
                        inputType: TextInputType.number,
                        resetText: () => settingsHandler.map['autoLockTimeout']!['default']!.toString(),
                        numberButtons: true,
                        numberStep: (settingsHandler.map['autoLockTimeout']!['step']! as int).toDouble(),
                        numberMin: (settingsHandler.map['autoLockTimeout']!['lowerLimit']! as int).toDouble(),
                        numberMax: settingsHandler.map['autoLockTimeout']!['upperLimit']!,
                        validator: (String? value) {
                          final double? parse = double.tryParse(value ?? '');
                          if (value == null || value.isEmpty) {
                            return context.loc.validationErrors.required;
                          } else if (parse == null) {
                            return context.loc.validationErrors.invalidNumericValue;
                          } else if (parse < settingsHandler.map['autoLockTimeout']!['lowerLimit']! ||
                              parse > settingsHandler.map['autoLockTimeout']!['upperLimit']!) {
                            return context.loc.validationErrors.rangeError(
                              min: settingsHandler.map['autoLockTimeout']!['lowerLimit']!,
                              max: settingsHandler.map['autoLockTimeout']!['upperLimit']!,
                            );
                          } else {
                            return null;
                          }
                        },
                      )
                    : const SizedBox.shrink(),
              ),
              SettingsToggle(
                value: blurOnLeave,
                onChanged: (newValue) {
                  setState(() {
                    blurOnLeave = newValue;
                  });
                },
                title: context.loc.settings.privacy.bluronLeave,
                subtitle: Text(context.loc.settings.privacy.bluronLeaveMsg),
              ),
              if (Platform.isAndroid)
                SettingsToggle(
                  value: incognitoKeyboard,
                  onChanged: (newValue) {
                    setState(() {
                      incognitoKeyboard = newValue;
                    });
                  },
                  title: context.loc.settings.privacy.incognitoKeyboard,
                  subtitle: Text(context.loc.settings.privacy.incognitoKeyboardMsg),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
