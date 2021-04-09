import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/libBooru/LoliSync.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:core';
import 'package:get/get.dart';

import '../ServiceHandler.dart';

class LoliSyncSendPage extends StatefulWidget {
  SettingsHandler settingsHandler;
  String ip = "";
  String port = "";
  LoliSyncSendPage(this.settingsHandler, this.ip, this.port);
  @override
  _LoliSyncSendPageState createState() => _LoliSyncSendPageState();
}

class _LoliSyncSendPageState extends State<LoliSyncSendPage> {
  LoliSync loliSync = new LoliSync();
  bool serverStarted = false;
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
            child: StreamBuilder<String>(
              stream: loliSync.startSync(widget.settingsHandler, widget.ip, widget.port, "Favourites"),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                String status = "";
                if (snapshot.hasError) {
                  status = "Error";
                } else {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      status = "No connection";
                      break;
                    case ConnectionState.active:
                    case ConnectionState.done:
                      status = "${snapshot.data}";
                      break;
                  }
                }
                return Center(
                  child: Column(
                    children: [
                      Icon(Icons.sync, size: 400),
                      Text(status),
                    ],
                  ),
                );
              },
            )
        ),
      ),
    );
  }
}

