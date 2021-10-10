import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/LoliSync.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:core';
import 'package:get/get.dart';

class LoliSyncSendPage extends StatefulWidget {
  String ip = "";
  String port = "";
  bool favourites = false, settings = false, booru = false;
  LoliSyncSendPage(this.ip, this.port, this.settings, this.favourites, this.booru);
  @override
  _LoliSyncSendPageState createState() => _LoliSyncSendPageState();
}

class _LoliSyncSendPageState extends State<LoliSyncSendPage> {
  final SettingsHandler settingsHandler = Get.find();
  LoliSync loliSync = LoliSync();
  List<String> toSync = [];
  bool serverStarted = false;

  @override
  // These lines are done in init state as they only need to be run once when the widget is first loaded
  void initState() {
    if(widget.favourites){
      toSync.add("Favourites");
    }
    if(widget.settings){
      toSync.add("Settings");
    }
    if(widget.booru){
      toSync.add("Booru");
    }
    super.initState();
  }

  Future<bool> _onWillPop() async {
    final shouldPop = await showDialog(
      context: context,
      builder: (context) {
        return SettingsDialog(
          title: Text('Are you sure?'),
          contentItems: <Widget>[Text('Do you want to stop syncing?')],
          actionButtons: <Widget>[
            TextButton(
              child: Text('Yes', style: TextStyle(color: Get.theme.colorScheme.onSurface)),
              onPressed: () {
                loliSync.killSync();
                Navigator.of(context).pop(true);
              },
            ),
            TextButton(
              child: Text('No', style: TextStyle(color: Get.theme.colorScheme.onSurface)),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );
    return shouldPop;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("LoliSync"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () async{
                if (await _onWillPop()){
                  Get.back();
                }
              }
          ),
        ),
        body:Center(
            child: StreamBuilder<String>(
              stream: loliSync.startSync(settingsHandler, widget.ip, widget.port, toSync),
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
                      const SizedBox(height: 10),
                      Icon(Icons.sync, size: 250),
                      const SizedBox(height: 10),
                      Text(status,style: TextStyle(fontSize: 18)),
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

