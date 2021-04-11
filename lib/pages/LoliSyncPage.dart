import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/libBooru/LoliSync.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:core';
import 'package:get/get.dart';

import '../ServiceHandler.dart';
import 'LoliSyncSendPage.dart';
import 'LoliSyncServerPage.dart';

class LoliSyncPage extends StatefulWidget {
  SettingsHandler settingsHandler;
  LoliSyncPage(this.settingsHandler);
  @override
  _LoliSyncPageState createState() => _LoliSyncPageState();
}

class _LoliSyncPageState extends State<LoliSyncPage> {
  final ipController = TextEditingController();
  final portController = TextEditingController();
  bool favourites = false, settings = false, booru = false;
  LoliSync loliSync = new LoliSync();
  @override
  // These lines are done in init state as they only need to be run once when the widget is first loaded
  void initState() {
    super.initState();
  }
  Future<bool> _onWillPop() async {
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Loli Sync"),
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () async{
                Get.back();
              }
          ),
        ),
        body:Center(
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                child: Text("Start the server on another device it will show an ip and port, fill those in and then hit start sync to send data from this device to the other"),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("IP Addr:"),
                    Container(width: 10),
                    new Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10,0,0,0),
                        child: TextField(
                          controller: ipController,
                          //The keyboard type and input formatter are used to make sure the user can only input a numerical value
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9.]'))
                          ],
                          decoration: InputDecoration(
                            hintText: "Host IP Address",
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
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("Port:"),
                    Container(width: 10),
                    new Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10,0,0,0),
                        child: TextField(
                          controller: portController,
                          //The keyboard type and input formatter are used to make sure the user can only input a numerical value
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            hintText: "Host Port",
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
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child:
                Row(children: [
                    Text("Send Favourites: "),
                    Checkbox(
                    value: favourites,
                    onChanged: (newValue) {
                      setState(() {
                        favourites = newValue!;
                      });
                    },
                   activeColor: Get.context!.theme.primaryColor,
                  ),
                  ]
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child:
                Row(children: [
                  Text("Send settings: "),
                  Checkbox(
                    value: settings,
                    onChanged: (newValue) {
                      setState(() {
                        settings = newValue!;
                      });
                    },
                    activeColor: Get.context!.theme.primaryColor,
                  ),
                ]
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child:
                Row(children: [
                  Text("Send Booru Configs: "),
                  Checkbox(
                    value: booru,
                    onChanged: (newValue) {
                      setState(() {
                        booru = newValue!;
                      });
                    },
                    activeColor: Get.context!.theme.primaryColor,
                  ),
                ]
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
                  onPressed: () async{
                    if (ipController.text == "" && portController.text == ""){
                      ServiceHandler.displayToast("The port and ip fields must be filled");
                    } else if(!favourites && !settings && !booru){
                      ServiceHandler.displayToast("You haven't selected anything to sync");
                    } else {
                      if(widget.settingsHandler.appMode == "Desktop"){
                        Get.dialog(Dialog(
                          child: Container(
                            width: 500,
                            child: LoliSyncSendPage(widget.settingsHandler,ipController.text,portController.text, settings, favourites, booru),
                          ),
                        ));
                      } else {
                        Get.to(() => LoliSyncSendPage(widget.settingsHandler,ipController.text,portController.text, settings, favourites, booru));
                      }
                    }
                  },
                  child: Text("Start Sync", style: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                child: Text("Start the server if you want your device to recieve data from another, do not use this on public wifi as you might get pozzed"),
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
                          child: LoliSyncServerPage(widget.settingsHandler),
                        ),
                      ));
                    } else {
                      Get.to(() => LoliSyncServerPage(widget.settingsHandler));
                    }
                  },
                  child: Text("Start Server", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

