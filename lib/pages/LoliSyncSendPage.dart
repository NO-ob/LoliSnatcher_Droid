import 'dart:core';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:LoliSnatcher/libBooru/LoliSync.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';

class LoliSyncSendPage extends StatefulWidget {
  final String ip, port, tabsMode;
  final bool favourites, settings, booru, tabs;
  final int favSkip;

  LoliSyncSendPage({
    required this.ip,
    required this.port,
    required this.settings,
    required this.favourites,
    required this.booru,
    required this.favSkip,
    required this.tabs,
    required this.tabsMode,
  });

  @override
  _LoliSyncSendPageState createState() => _LoliSyncSendPageState();
}

class _LoliSyncSendPageState extends State<LoliSyncSendPage> {
  final LoliSync loliSync = LoliSync();
  List<String> toSync = [];
  bool serverStarted = false;

  List<String> messagesHistory = [];
  int maxHistoryLength = 10;

  void addMessage(String message) {
    // add new message to history but limit it to 10 items
    if(message.startsWith('Server active at') && messagesHistory.indexWhere((msg) => msg.startsWith('Server active at')) != -1) {
      return;
    }
    messagesHistory.insert(0, message);
    if (messagesHistory.length > maxHistoryLength) {
      messagesHistory.removeLast();
    }
  }

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
    if(widget.tabs){
      toSync.add("Tabs");
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
            ElevatedButton(
              child: Text('Yes'),
              onPressed: () {
                loliSync.killSync();
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
              stream: loliSync.startSync(widget.ip, widget.port, toSync, widget.favSkip, widget.tabsMode),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                String status = "";
                if (snapshot.hasError) {
                  status = "Error ${snapshot.error}";
                } else {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      status = "No connection";
                      break;
                    case ConnectionState.active:
                    case ConnectionState.done:
                      status = "${snapshot.data}";
                      addMessage(status);
                      break;
                  }
                }
                return Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Icon(Icons.sync, size: 250),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          loliSync.sendTest();
                        },
                        child: Text('Send test'),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(status, style: TextStyle(fontSize: 18)),
                      ),
                      // show history of messages with last items fading away in color
                      if(messagesHistory.length > 1)
                        Expanded(
                          child: ListView.builder(
                            itemCount: messagesHistory.length - 1,
                            itemBuilder: (BuildContext context, int index) {
                              final int indexWoutStart = index + 1;
                              return Opacity(
                                opacity: 1 - (indexWoutStart / maxHistoryLength),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(child: Text(messagesHistory[indexWoutStart], style: TextStyle(fontSize: 18))),
                                ),
                              );
                            },
                          ),
                        ),
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

