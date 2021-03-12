import 'package:LoliSnatcher/widgets/InfoDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../SettingsHandler.dart';

class UserInterfacePage extends StatefulWidget {
  SettingsHandler settingsHandler;
  UserInterfacePage(this.settingsHandler);
  @override
  _UserInterfacePageState createState() => _UserInterfacePageState();
}

class _UserInterfacePageState extends State<UserInterfacePage> {
  TextEditingController columnsLandscapeController = TextEditingController();
  TextEditingController columnsPortraitController = TextEditingController();
  String? appMode, previewMode,previewDisplay;
  void initState(){
    columnsPortraitController.text = widget.settingsHandler.portraitColumns.toString();
    columnsLandscapeController.text = widget.settingsHandler.landscapeColumns.toString();
    appMode = widget.settingsHandler.appMode;
    previewDisplay = widget.settingsHandler.previewDisplay;
    previewMode = widget.settingsHandler.previewMode;
  }
  //called when page is clsoed, sets settingshandler variables and then writes settings to disk
  Future<bool> _onWillPop() async {
    widget.settingsHandler.appMode = appMode!;
    widget.settingsHandler.previewMode = previewMode!;
    widget.settingsHandler.previewDisplay = previewDisplay!;
    if (int.parse(columnsLandscapeController.text) < 1){
      columnsLandscapeController.text = 1.toString();
    }
    if (int.parse(columnsPortraitController.text) < 1){
      columnsPortraitController.text = 1.toString();
    }
    widget.settingsHandler.landscapeColumns = int.parse(columnsLandscapeController.text);
    widget.settingsHandler.portraitColumns = int.parse(columnsPortraitController.text);
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
          title: Text("User Interface"),
        ),
        body: Center(
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("Preview Columns Portrait:      "),
                    new Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10,0,0,0),
                        child: TextField(
                          controller: columnsPortraitController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            hintText:"Amount of images to show horizonatally",
                            contentPadding: new EdgeInsets.fromLTRB(15,0,0,0), // left,right,top,bottom
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(50),
                              gapPadding: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("Preview Columns Landscape:      "),
                    new Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10,0,0,0),
                        child: TextField(
                          controller: columnsLandscapeController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            hintText:"Amount of images to show horizonatally",
                            contentPadding: new EdgeInsets.fromLTRB(15,0,0,0), // left,right,top,bottom
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(50),
                              gapPadding: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                width: double.infinity,
                // This dropdown is used to change the quality of the images displayed on the home page
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("Preview Quality :     "),
                    DropdownButton<String>(
                      value: previewMode,
                      icon: Icon(Icons.arrow_downward),
                      onChanged: (String? newValue){
                        setState((){
                          previewMode = newValue;
                        });
                      },
                      items: <String>["Sample","Thumbnail"].map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    IconButton(
                      icon: Icon(Icons.info, color: Get.context!.theme.accentColor),
                      onPressed: () {
                        Get.dialog(
                            InfoDialog("Preview Quality",
                              [
                                Text("The preview quality changes the resolution of images in the preview grid"),
                                Text(" - Sample - Medium resolution"),
                                Text(" - Thumbnail - Low resolution"),
                              ],
                              CrossAxisAlignment.start,
                            )
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                width: double.infinity,
                // This dropdown is used to change the display mode of the preview grid
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("Preview Display :     "),
                    DropdownButton<String>(
                      value: previewDisplay,
                      icon: Icon(Icons.arrow_downward),
                      onChanged: (String? newValue){
                        setState((){
                          previewDisplay = newValue;
                        });
                      },
                      items: <String>["Waterfall","Staggered"].map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                width: double.infinity,
                // This dropdown is used to change the display mode of the preview grid
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("App UI Mode :     "),
                    DropdownButton<String>(
                      value: appMode,
                      icon: Icon(Icons.arrow_downward),
                      onChanged: (String? newValue){
                        setState((){
                          appMode = newValue;
                        });
                      },
                      items: <String>["Mobile","Desktop"].map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    IconButton(
                      icon: Icon(Icons.info, color: Get.context!.theme.accentColor),
                      onPressed: () {
                        Get.dialog(
                            InfoDialog("App UI Mode",
                              [
                                Text("- Mobile - Normal Mobile UI"),
                                Text("- Desktop - Ahoviewer Style UI"),
                                const SizedBox(height: 10),
                                Text("[Warning]: Do not set UI Mode to Desktop on a phone you might break the app and might have to wipe your settings including booru configs."),
                                Text("If you are on android versions smaller than 11 you can remove the App Mode line from /LoliSnatcher/config/settings.conf"),
                                Text("If you are on android 11 or higher you will have to wipe app data via system settings"),
                              ],
                              CrossAxisAlignment.start,
                            )
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
