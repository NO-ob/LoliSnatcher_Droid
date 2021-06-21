import 'package:LoliSnatcher/pages/settings/BehaviourPage.dart';
import 'package:LoliSnatcher/pages/settings/BooruPage.dart';
import 'package:LoliSnatcher/pages/settings/DatabasePage.dart';
import 'package:LoliSnatcher/pages/settings/GalleryPage.dart';
import 'package:LoliSnatcher/pages/settings/UserInterfacePage.dart';
import 'package:LoliSnatcher/pages/settings/FilterTagsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../SettingsHandler.dart';
import 'package:get/get.dart';

import 'AboutPage.dart';
import 'help/BooruHelpPage.dart';
/**
 * Then settings page is pretty self explanatory it will display, allow the user to edit and save settings
 */
class SettingsPage extends StatefulWidget {
  SettingsHandler settingsHandler;
  SettingsPage(this.settingsHandler);
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  // These lines are done in init state as they only need to be run once when the widget is first loaded
  void initState() {
    super.initState();
  }
  Future<bool> _onWillPop() async {
    bool result = await widget.settingsHandler.saveSettings();
    await widget.settingsHandler.loadSettings();
    await widget.settingsHandler.getBooru();
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Settings"),
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () async{
                await widget.settingsHandler.getBooru();
                Get.back();
              }
          ),
        ),
        body:Center(
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                child: Text(
                    "Settings are now saved when closing the settings pages"
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: Get.context!.theme.accentColor),
                    ),
                  ),
                  onPressed: (){
                    if(widget.settingsHandler.appMode == "Desktop"){
                      Get.dialog(Dialog(
                        child: Container(
                          width: 500,
                          child: BooruPage(widget.settingsHandler),
                        ),
                      ));
                    } else {
                      Get.to(() => BooruPage(widget.settingsHandler));
                    }

                  },
                  child: Text("Booru/Search", style: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: Get.context!.theme.accentColor),
                    ),
                  ),
                  onPressed: (){
                    if(widget.settingsHandler.appMode == "Desktop"){
                      Get.dialog(Dialog(
                        child: Container(
                          width: 500,
                          child: UserInterfacePage(widget.settingsHandler),
                        ),
                      ));
                    } else {
                      Get.to(() => UserInterfacePage(widget.settingsHandler));
                    }

                  },
                  child: Text("User Interface", style: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: Get.context!.theme.accentColor),
                    ),
                  ),
                  onPressed: (){
                    if(widget.settingsHandler.appMode == "Desktop"){
                      Get.dialog(Dialog(
                        child: Container(
                          width: 500,
                          child: GalleryPage(widget.settingsHandler),
                        ),
                      ));
                    } else {
                      Get.to(() => GalleryPage(widget.settingsHandler));
                    }
                  },
                  child: Text("Gallery/Viewer", style: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: Get.context!.theme.accentColor),
                    ),
                  ),
                  onPressed: (){
                    if(widget.settingsHandler.appMode == "Desktop"){
                      Get.dialog(Dialog(
                        child: Container(
                          width: 500,
                          child:BehaviourPage(widget.settingsHandler),
                        ),
                      ));
                    } else {
                      Get.to(() => BehaviourPage(widget.settingsHandler));
                    }
                  },
                  child: Text("Behaviour", style: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: Get.context!.theme.accentColor),
                    ),
                  ),
                  onPressed: (){
                    if(widget.settingsHandler.appMode == "Desktop"){
                      Get.dialog(Dialog(
                        child: Container(
                          width: 500,
                          child:FiltersEdit(widget.settingsHandler),
                        ),
                      ));
                    } else {
                      Get.to(() => FiltersEdit(widget.settingsHandler));
                    }

                  },
                  child: Text("Tag Filters", style: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: Get.context!.theme.accentColor),
                    ),
                  ),
                  onPressed: (){
                    if(widget.settingsHandler.appMode == "Desktop"){
                      Get.dialog(Dialog(
                        child: Container(
                          width: 500,
                          child:DatabasePage(widget.settingsHandler),
                        ),
                      ));
                    } else {
                      Get.to(() => DatabasePage(widget.settingsHandler));
                    }

                  },
                  child: Text("Database", style: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: Get.context!.theme.accentColor),
                    ),
                  ),
                  onPressed: (){
                    if(widget.settingsHandler.appMode == "Desktop"){
                      Get.dialog(Dialog(
                        child: Container(
                          width: 500,
                          child:AboutPage(),
                        ),
                      ));
                    } else {
                      Get.to(() => AboutPage());
                    }
                  },
                  child: Text("About", style: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: Get.context!.theme.accentColor),
                    ),
                  ),
                  onPressed: (){
                    if(widget.settingsHandler.appMode == "Desktop"){
                      Get.dialog(Dialog(
                        child: Container(
                          width: 500,
                          child:BooruHelpPage(),
                        ),
                      ));
                    } else {
                      Get.to(() => BooruHelpPage());
                    }
                  },
                  child: Text("Help", style: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                child: Text("Version: ${widget.settingsHandler.verStr}" ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


