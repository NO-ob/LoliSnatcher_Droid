import 'package:LoliSnatcher/widgets/InfoDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../SettingsHandler.dart';

class SettingsTemplate extends StatefulWidget {
  SettingsHandler settingsHandler;
  SettingsTemplate(this.settingsHandler);
  @override
  _SettingsTemplateState createState() => _SettingsTemplateState();
}

class _SettingsTemplateState extends State<SettingsTemplate> {
  @override
  void initState(){
    super.initState();
  }
  //called when page is clsoed, sets settingshandler variables and then writes settings to disk
  Future<bool> _onWillPop() async {
    // Set settingshandler values here
    bool result = await widget.settingsHandler.saveSettings();
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
