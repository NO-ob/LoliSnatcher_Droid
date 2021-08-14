import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/LoliSync.dart';
import 'package:LoliSnatcher/pages/LoliSyncSendPage.dart';
import 'package:LoliSnatcher/pages/LoliSyncServerPage.dart';

class LoliSyncPage extends StatelessWidget {
  final SettingsHandler settingsHandler = Get.find();
  final ipController = TextEditingController();
  final portController = TextEditingController();
  bool favourites = false, settings = false, booru = false;
  final LoliSync loliSync = LoliSync();

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
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
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
                    Expanded(
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
                            contentPadding: EdgeInsets.fromLTRB(15,0,0,0), // left,right,top,bottom
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
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
                    Expanded(
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
                            contentPadding: EdgeInsets.fromLTRB(15,0,0,0), // left,right,top,bottom
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
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
                      favourites = newValue!;
                    },
                   activeColor: Get.theme.primaryColor,
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
                      settings = newValue!;
                    },
                    activeColor: Get.theme.primaryColor,
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
                      booru = newValue!;
                    },
                    activeColor: Get.theme.primaryColor,
                  ),
                ]
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Get.theme.accentColor),
                    ),
                  ),
                  onPressed: () async{
                    if (ipController.text == "" && portController.text == ""){
                      ServiceHandler.displayToast("The port and ip fields must be filled");
                    } else if(!favourites && !settings && !booru){
                      ServiceHandler.displayToast("You haven't selected anything to sync");
                    } else {
                      if(settingsHandler.appMode == "Desktop"){
                        Get.dialog(Dialog(
                          child: Container(
                            width: 500,
                            child: LoliSyncSendPage(ipController.text, portController.text, settings, favourites, booru),
                          ),
                        ));
                      } else {
                        Get.to(() => LoliSyncSendPage(ipController.text, portController.text, settings, favourites, booru));
                      }
                    }
                  },
                  child: Text("Start Sync"),
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
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Get.theme.accentColor),
                    ),
                  ),
                  onPressed: (){
                    if(settingsHandler.appMode == "Desktop"){
                      Get.dialog(Dialog(
                        child: Container(
                          width: 500,
                          child: LoliSyncServerPage(),
                        ),
                      ));
                    } else {
                      Get.to(() => LoliSyncServerPage());
                    }
                  },
                  child: Text("Start Server"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

