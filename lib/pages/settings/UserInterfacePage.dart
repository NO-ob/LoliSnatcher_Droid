import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';

class UserInterfacePage extends StatefulWidget {
  const UserInterfacePage({Key? key}) : super(key: key);

  @override
  State<UserInterfacePage> createState() => _UserInterfacePageState();
}

class _UserInterfacePageState extends State<UserInterfacePage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  final TextEditingController columnsLandscapeController = TextEditingController();
  final TextEditingController columnsPortraitController = TextEditingController();

  late String previewMode, previewDisplay;
  late AppMode appMode;

  @override
  void initState(){
    super.initState();
    columnsPortraitController.text = settingsHandler.portraitColumns.toString();
    columnsLandscapeController.text = settingsHandler.landscapeColumns.toString();
    appMode = settingsHandler.appMode.value;
    previewDisplay = settingsHandler.previewDisplay;
    previewMode = settingsHandler.previewMode;
  }

  //called when page is clsoed, sets settingshandler variables and then writes settings to disk
  Future<bool> _onWillPop() async {
    settingsHandler.appMode.value = appMode;
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
    bool result = await settingsHandler.saveSettings(restate: false);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text("Interface"),
        ),
        body: Center(
          child: ListView(
            children: [
              SettingsDropdown(
                selected: appMode.toName(),
                values: AppMode.values.map((e) => e.toName()).toList(),
                onChanged: (String? newValue){
                  setState((){
                    appMode = AppMode.fromName(newValue ?? '');
                  });
                },
                title: 'App UI Mode',
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const SettingsDialog(
                          title: Text('App UI Mode'),
                          contentItems: [
                            Text("- Mobile - Normal Mobile UI"),
                            Text("- Desktop - Ahoviewer Style UI"),
                            SizedBox(height: 10),
                            Text("[Warning]: Do not set UI Mode to Desktop on a phone you might break the app and might have to wipe your settings including booru configs."),
                            Text("If you are on android versions smaller than 11 you can remove the appMode line from /LoliSnatcher/config/settings.json"),
                            Text("If you are on android 11 or higher you will have to wipe app data via system settings"),
                          ]
                        );
                      },
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
                onChanged: (String? text) {
                  setState(() { });
                },
                resetText: () => settingsHandler.map['portraitColumns']?['default']?.toString() ?? "2",
                numberButtons: true,
                numberStep: 1,
                numberMin: 1,
                numberMax: double.infinity,
                validator: (String? value) {
                  int? parse = int.tryParse(value ?? '');
                  if(value == null || value.isEmpty) {
                    return 'Please enter a value';
                  } else if(parse == null) {
                    return 'Please enter a valid numeric value';
                  } else if(parse > 3 && (Platform.isAndroid || Platform.isIOS)) {
                    return 'More than 3 columns could affect performance';
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
                resetText: () => settingsHandler.map['landscapeColumns']?['default']?.toString() ?? "4",
                numberButtons: true,
                numberStep: 1,
                numberMin: 1,
                numberMax: double.infinity,
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
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const SettingsDialog(
                          title: Text('Preview Quality'),
                          contentItems: [
                            Text("This setting changes the resolution of images in the preview grid"),
                            Text(" - Sample - Medium resolution, app will also load a Thumbnail quality as a placeholder while higher quality loads"),
                            Text(" - Thumbnail - Low resolution"),
                            Text(" "),
                            Text("[Note]: Sample quality can noticeably degrade performance, especially if you have too many columns in preview grid")
                          ]
                        );
                      },
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
