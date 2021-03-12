import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruHandlerFactory.dart';
import 'package:LoliSnatcher/libBooru/DBHandler.dart';
import 'package:LoliSnatcher/pages/settings/BehaviourPage.dart';
import 'package:LoliSnatcher/pages/settings/BooruPage.dart';
import 'package:LoliSnatcher/pages/settings/DatabasePage.dart';
import 'package:LoliSnatcher/pages/settings/GalleryPage.dart';
import 'package:LoliSnatcher/pages/settings/UserInterfacePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../libBooru/BooruOnRailsHandler.dart';
import '../libBooru/GelbooruHandler.dart';
import '../libBooru/GelbooruV1Handler.dart';
import '../libBooru/MoebooruHandler.dart';
import '../libBooru/PhilomenaHandler.dart';
import '../libBooru/DanbooruHandler.dart';
import '../libBooru/ShimmieHandler.dart';
import '../libBooru/HydrusHandler.dart';
import '../libBooru/SankakuHandler.dart';
import '../libBooru/BooruHandler.dart';
import '../libBooru/BooruItem.dart';
import '../libBooru/e621Handler.dart';
import '../libBooru/SzurubooruHandler.dart';
import '../libBooru/Booru.dart';
import '../widgets/InfoDialog.dart';
import '../getPerms.dart';
import '../SettingsHandler.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

import 'AboutPage.dart';
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
                    Get.to(() => BooruPage(widget.settingsHandler));
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
                    Get.to(() => UserInterfacePage(widget.settingsHandler));
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
                    Get.to(() => GalleryPage(widget.settingsHandler));
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
                    Get.to(() => BehaviourPage(widget.settingsHandler));
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
                    Get.to(() => DatabasePage(widget.settingsHandler));
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
                    Get.to(() => AboutPage());
                  },
                  child: Text("About", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


