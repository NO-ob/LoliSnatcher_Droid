import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../SettingsHandler.dart';

class SettingsTemplate extends StatefulWidget {
  SettingsTemplate();
  @override
  _SettingsTemplateState createState() => _SettingsTemplateState();
}

class _SettingsTemplateState extends State<SettingsTemplate> {
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();

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
          title: Text("Title"),
        ),
        body: Center(
          child: ListView(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
