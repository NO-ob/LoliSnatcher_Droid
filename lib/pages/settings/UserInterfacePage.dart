import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../SettingsHandler.dart';

class UserInterfacePage extends StatefulWidget {
  UserInterfacePage();
  @override
  _UserInterfacePageState createState() => _UserInterfacePageState();
}

class _UserInterfacePageState extends State<UserInterfacePage> {
  final SettingsHandler settingsHandler = Get.find();
  final TextEditingController columnsLandscapeController = TextEditingController();
  final TextEditingController columnsPortraitController = TextEditingController();
  late String appMode, previewMode, previewDisplay;

  @override
  void initState(){
    super.initState();
    columnsPortraitController.text = settingsHandler.portraitColumns.toString();
    columnsLandscapeController.text = settingsHandler.landscapeColumns.toString();
    appMode = settingsHandler.appMode;
    previewDisplay = settingsHandler.previewDisplay;
    previewMode = settingsHandler.previewMode;
  }

  //called when page is clsoed, sets settingshandler variables and then writes settings to disk
  Future<bool> _onWillPop() async {
    settingsHandler.appMode = appMode;
    settingsHandler.previewMode = previewMode;
    settingsHandler.previewDisplay = previewDisplay;
    if (int.parse(columnsLandscapeController.text) < 1){
      columnsLandscapeController.text = 1.toString();
    }
    if (int.parse(columnsPortraitController.text) < 1){
      columnsPortraitController.text = 1.toString();
    }
    settingsHandler.landscapeColumns = int.parse(columnsLandscapeController.text);
    settingsHandler.portraitColumns = int.parse(columnsPortraitController.text);
    bool result = await settingsHandler.saveSettings();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Interface"),
        ),
        body: Center(
          child: ListView(
            children: [
              SettingsDropdown(
                selected: appMode,
                values: settingsHandler.map['appMode']?['options'],
                onChanged: (String? newValue){
                  setState((){
                    appMode = newValue ?? settingsHandler.map['appMode']?['default'];
                  });
                },
                title: 'App UI Mode',
                trailingIcon: IconButton(
                  icon: Icon(Icons.info, color: Get.theme.accentColor),
                  onPressed: () {
                    Get.dialog(
                      SettingsDialog(
                        title: const Text('App UI Mode'),
                        contentItems: [
                          Text("- Mobile - Normal Mobile UI"),
                          Text("- Desktop - Ahoviewer Style UI"),
                          const SizedBox(height: 10),
                          Text("[Warning]: Do not set UI Mode to Desktop on a phone you might break the app and might have to wipe your settings including booru configs."),
                          Text("If you are on android versions smaller than 11 you can remove the App Mode line from /LoliSnatcher/config/settings.conf"),
                          Text("If you are on android 11 or higher you will have to wipe app data via system settings"),
                        ]
                      ),
                    );
                  },
                ),
              ),
              SettingsTextInput(
                controller: columnsPortraitController,
                title: 'Preview Columns Portrait',
                hintText: "Columns in Portrait orientation",
                inputType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (String? value) {
                  int? parse = int.tryParse(value ?? '');
                  if(value == null || value.isEmpty) {
                    return 'Please enter a value';
                  } else if(parse == null) {
                    return 'Please enter a valid numeric value';
                  } else {
                    return null;
                  }
                }
              ),
              SettingsTextInput(
                controller: columnsLandscapeController,
                title: 'Preview Columns Landscape',
                hintText: "Columns in Landscape orientation",
                inputType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (String? value) {
                  int? parse = int.tryParse(value ?? '');
                  if(value == null || value.isEmpty) {
                    return 'Please enter a value';
                  } else if(parse == null) {
                    return 'Please enter a valid numeric value';
                  } else {
                    return null;
                  }
                }
              ),
              SettingsDropdown(
                selected: previewMode,
                values: settingsHandler.map['previewMode']?['options'],
                onChanged: (String? newValue){
                  setState((){
                    previewMode = newValue ?? settingsHandler.map['previewMode']?['default'];
                  });
                },
                title: 'Preview Quality',
                trailingIcon: IconButton(
                  icon: Icon(Icons.info, color: Get.theme.accentColor),
                  onPressed: () {
                    Get.dialog(
                      SettingsDialog(
                        title: const Text('Preview Quality'),
                        contentItems: [
                          Text("This setting changes the resolution of images in the preview grid"),
                          Text(" - Sample - Medium resolution, app will also load a Thumbnail quality as a placeholder while higher quality loads"),
                          Text(" - Thumbnail - Low resolution"),
                          Text(" "),
                          Text("[Note]: Sample quality can noticeably degrade performance, especially if you have too many columns in preview grid")
                        ]
                      ),
                    );
                  },
                ),
              ),
              SettingsDropdown(
                selected: previewDisplay,
                values: settingsHandler.map['previewDisplay']?['options'],
                onChanged: (String? newValue){
                  setState((){
                    previewDisplay = newValue ?? settingsHandler.map['previewDisplay']?['default'];
                  });
                },
                title: 'Preview Display',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
