import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';

class SettingsTemplate extends StatefulWidget {
  const SettingsTemplate({Key? key}) : super(key: key);
  @override
  State<SettingsTemplate> createState() => _SettingsTemplateState();
}

class _SettingsTemplateState extends State<SettingsTemplate> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  @override
  void initState(){
    super.initState();
  }

  //called when page is clsoed, sets settingshandler variables and then writes settings to disk
  Future<bool> _onWillPop() async {
    // Set settingshandler values here
    bool result = await settingsHandler.saveSettings(restate: false);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child:Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Title"),
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
