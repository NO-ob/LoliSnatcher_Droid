import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/LoliSync.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:get/get.dart';

class LoliSyncServerPage extends StatelessWidget {
  final String? selectedIP;
  final String customPort;
  LoliSyncServerPage(this.selectedIP, this.customPort);

  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final LoliSync loliSync = LoliSync();

  Future<bool> _onWillPop(BuildContext context) async {
    final shouldPop = await showDialog(
      context: context,
      builder: (context) {
        return SettingsDialog(
          title: Text('Are you sure?'),
          contentItems: <Widget>[Text('Do you want to stop the server?')],
          actionButtons: <Widget>[
            ElevatedButton(
              child: Text('Yes'),
              onPressed: () {
                loliSync.killServer();
                Navigator.of(context).pop(true);
              },
            ),
            ElevatedButton(
              child: Text('No'),
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
      onWillPop: () {return _onWillPop(context);},
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("LoliSync"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () async{
                if (await _onWillPop(context)){
                  Get.back();
                }
              }
          ),
        ),
        body:Center(
            child: StreamBuilder<String>(
              stream: loliSync.startServer(settingsHandler, selectedIP, customPort),
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
                      Icon(Icons.electrical_services, size: 250),
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

