import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class SettingsTemplate extends StatefulWidget {
  const SettingsTemplate({super.key});
  @override
  State<SettingsTemplate> createState() => _SettingsTemplateState();
}

class _SettingsTemplateState extends State<SettingsTemplate> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  @override
  void initState() {
    super.initState();
  }

  //called when page is clsoed, sets settingshandler variables and then writes settings to disk
  Future<void> _onPopInvoked(bool didPop, _) async {
    if (didPop) {
      return;
    }

    // Set settingshandler values here
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
        appBar: const SettingsAppBar(
          title: 'Title',
        ),
        body: Center(
          child: ListView(
            children: const [
              // Add settings here
            ],
          ),
        ),
      ),
    );
  }
}
