import 'dart:io';

import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  bool blurOnLeave = false, useLockscreen = false, incognitoKeyboard = false;
  final TextEditingController autoLockTimeoutController = TextEditingController();

  @override
  void initState() {
    super.initState();

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
    settingsHandler.autoLockTimeout = int.tryParse(autoLockTimeoutController.text) ?? settingsHandler.map['autoLockTimeout']!['default'];
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
          title: const Text('Privacy'),
        ),
        body: Center(
          child: ListView(
            children: [
              if (Platform.isAndroid || Platform.isIOS)
                SettingsToggle(
                  value: useLockscreen,
                  onChanged: (newValue) {
                    setState(() {
                      useLockscreen = newValue;
                    });
                  },
                  title: 'App lock',
                  subtitle: const Text(
                    'Allows to lock the app manually or if left for too long',
                  ),
                ),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                alignment: Alignment.bottomCenter,
                child: useLockscreen
                    ? SettingsTextInput(
                        controller: autoLockTimeoutController,
                        title: 'Auto lock after',
                        subtitle: const Text('in seconds, 0 to disable'),
                        inputType: TextInputType.number,
                        resetText: () => settingsHandler.map['autoLockTimeout']!['default']!.toString(),
                        numberButtons: true,
                        numberStep: (settingsHandler.map['autoLockTimeout']!['step']! as int).toDouble(),
                        numberMin: (settingsHandler.map['autoLockTimeout']!['lowerLimit']! as int).toDouble(),
                        numberMax: settingsHandler.map['autoLockTimeout']!['upperLimit']!,
                        validator: (String? value) {
                          final double? parse = double.tryParse(value ?? '');
                          if (value == null || value.isEmpty) {
                            return 'Please enter a value';
                          } else if (parse == null) {
                            return 'Please enter a valid numeric value';
                          } else if (parse < settingsHandler.map['autoLockTimeout']!['lowerLimit']! ||
                              parse > settingsHandler.map['autoLockTimeout']!['upperLimit']!) {
                            return 'Please enter a value between ${settingsHandler.map['autoLockTimeout']!['lowerLimit']!} and ${settingsHandler.map['autoLockTimeout']!['upperLimit']!}';
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
                title: 'Blur screen when leaving the app',
                subtitle: const Text('May not work on some devices due to system limitations'),
              ),
              if (Platform.isAndroid)
                SettingsToggle(
                  value: incognitoKeyboard,
                  onChanged: (newValue) {
                    setState(() {
                      incognitoKeyboard = newValue;
                    });
                  },
                  title: 'Incognito keyboard',
                  subtitle: const Text(
                    "Tells system keyboard to don't save your typing history and disable learning based on your input.\nWill be applied to most of app's text inputs.",
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
