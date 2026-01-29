import 'dart:io';

import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/data/settings/app_alias.dart';
import 'package:lolisnatcher/src/handlers/local_auth_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
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
  AppAlias appAlias = AppAlias.defaultValue;
  final TextEditingController autoLockTimeoutController = TextEditingController();

  @override
  void initState() {
    super.initState();

    localAuthHandler.canCheckBiometrics().then((_) => setState(() {}));

    blurOnLeave = settingsHandler.blurOnLeave.value;
    useLockscreen = settingsHandler.useLockscreen.value;
    autoLockTimeoutController.text = settingsHandler.autoLockTimeout.toString();
    incognitoKeyboard = settingsHandler.incognitoKeyboard;
    appAlias = settingsHandler.appAlias;
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

  Future<void> _changeAppAlias(AppAlias? newAlias) async {
    if (newAlias == null || newAlias == appAlias) return;

    await Future.delayed(const Duration(milliseconds: 100));
    final result = await showDialog(
      context: context,
      builder: (context) => SettingsDialog(
        title: Text(context.loc.settings.privacy.appAliasChanged),
        contentItems: [
          Text(context.loc.settings.privacy.appAliasRestartHint),
        ],
        actionButtons: [
          const CancelButton(
            withIcon: true,
            returnData: false,
          ),
          ElevatedButton.icon(
            onPressed: () => Navigator.of(context).pop(true),
            icon: const Icon(Icons.restart_alt),
            label: Text(context.loc.settings.privacy.restartNow),
          ),
        ],
      ),
    );

    if (result == null || !result) {
      return;
    }

    final prevAlias = appAlias;
    setState(() => appAlias = newAlias);
    settingsHandler.appAlias = newAlias;
    await settingsHandler.saveSettings(restate: false);

    final success = await ServiceHandler.setAppAlias(newAlias.toJson());
    if (success) {
      await ServiceHandler.restartApp();
    } else {
      setState(() => appAlias = prevAlias);
      settingsHandler.appAlias = prevAlias;
      await settingsHandler.saveSettings(restate: false);

      if (!mounted) return;

      FlashElements.showSnackbar(
        context: context,
        title: Text(context.loc.errorExclamation),
        content: Text(context.loc.settings.privacy.appAliasChangeFailed),
        sideColor: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: SettingsAppBar(
          title: context.loc.settings.privacy.title,
        ),
        body: Center(
          child: ListView(
            children: [
              if (Platform.isAndroid)
                SettingsDropdown<AppAlias>(
                  value: appAlias,
                  items: AppAlias.values,
                  onChanged: _changeAppAlias,
                  title: context.loc.settings.privacy.appDisplayName,
                  subtitle: Text(context.loc.settings.privacy.appDisplayNameDescription),
                  itemTitleBuilder: (item) => item?.displayName ?? '',
                ),
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
