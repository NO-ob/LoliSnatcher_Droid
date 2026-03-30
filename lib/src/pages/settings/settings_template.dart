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

  Future<void> _onPopInvoked(_, _) async {
    await settingsHandler.saveSettings(restate: false);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
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
