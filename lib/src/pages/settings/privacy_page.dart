import 'dart:io';

import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

// TODO app lock

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});
  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  bool incognitoKeyboard = false;

  @override
  void initState() {
    super.initState();

    incognitoKeyboard = settingsHandler.incognitoKeyboard;
  }

  Future<void> _onPopInvoked(bool didPop) async {
    if (didPop) {
      return;
    }

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
      onPopInvoked: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Privacy'),
        ),
        body: Center(
          child: ListView(
            children: [
              if (Platform.isAndroid)
                SettingsToggle(
                  value: incognitoKeyboard,
                  onChanged: (newValue) {
                    setState(() {
                      incognitoKeyboard = newValue;
                    });
                  },
                  title: 'Incognito keyboard',
                  subtitle: const Text('Tells your keyboard to disable typing history and learning based on your input.'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
