import 'dart:async';
import 'dart:io';

import 'package:LoliSnatcher/pages/settings/LoggerPage.dart';
import 'package:LoliSnatcher/utilities/MyHttpOverrides.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';

class DebugPage extends StatefulWidget {
  DebugPage();
  @override
  _DebugPageState createState() => _DebugPageState();
}

class _DebugPageState extends State<DebugPage> {
  final SettingsHandler settingsHandler = Get.find();
  ServiceHandler serviceHandler = ServiceHandler();
  bool allowSelfSignedCerts = false;
  @override
  void initState() {
    super.initState();
    allowSelfSignedCerts = settingsHandler.allowSelfSignedCerts;
  }

  //called when page is closed, sets settingshandler variables and then writes settings to disk
  Future<bool> _onWillPop() async {
    settingsHandler.allowSelfSignedCerts = allowSelfSignedCerts;
    bool result = await settingsHandler.saveSettings(restate: true);
    if (allowSelfSignedCerts){
      HttpOverrides.global = MyHttpOverrides();
    } else {
      HttpOverrides.global = null;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Debug"),
        ),
        body: Center(
          child: ListView(
            children: [
              SettingsToggle(
                value: settingsHandler.showFPS.value,
                onChanged: (newValue) {
                  setState(() {
                    settingsHandler.showFPS.value = newValue;
                  });
                },
                title: 'Show FPS Info'
              ),
              SettingsToggle(
                value: settingsHandler.showImageStats.value,
                onChanged: (newValue) {
                  setState(() {
                    settingsHandler.showImageStats.value = newValue;
                  });
                },
                title: 'Show Image Stats'
              ),
              SettingsToggle(
                value: settingsHandler.disableImageScaling.value,
                onChanged: (newValue) {
                  setState(() {
                    settingsHandler.disableImageScaling.value = newValue;
                  });
                },
                title: "Don't scale images"
              ),
              SettingsToggle(
                value: settingsHandler.showURLOnThumb.value,
                onChanged: (newValue) {
                  setState(() {
                    settingsHandler.showURLOnThumb.value = newValue;
                  });
                },
                title: 'Show URL on thumb'
              ),
              SettingsToggle(
                value: settingsHandler.hideSystemUIinViewer.value,
                onChanged: (newValue) {
                  setState(() {
                    settingsHandler.hideSystemUIinViewer.value = newValue;
                  });
                },
                title: 'Hide System UI in Viewer'
              ),
              // SettingsToggle(
              //   value: settingsHandler.isMemeTheme.value,
              //   onChanged: (newValue) {
              //     setState(() {
              //       settingsHandler.isMemeTheme.value = newValue;
              //     });
              //   },
              //   title: 'Meme Theme'
              // ),
              SettingsButton(
                name: 'Load and Save Legacy Settings',
                action: () {
                  settingsHandler.debugLoadAndSaveLegacy();
                }
              ),

              SettingsButton(
                name: 'Animation speed ($timeDilation)',
                icon: Icon(Icons.timelapse),
                action: () {
                  const List<double> speeds = [0.25, 0.5, 0.75, 1, 2, 3, 4];
                  int currentIndex = speeds.indexOf(timeDilation);
                  int newIndex = 0;
                  if((currentIndex + 1) <= (speeds.length - 1)) {
                    newIndex = currentIndex + 1;
                  }
                  timeDilation = speeds[newIndex];
                  setState(() { });
                },
              ),

              SettingsButton(name: 'Res: ${Get.mediaQuery.size.width.toPrecision(4)}x${Get.mediaQuery.size.height.toPrecision(4)}'),
              SettingsButton(name: 'Pixel Ratio: ${Get.mediaQuery.devicePixelRatio.toPrecision(4)}'),
              SettingsToggle(
                  value: allowSelfSignedCerts,
                  onChanged: (newValue) {
                    setState(() {
                      allowSelfSignedCerts = newValue;
                    });
                  },
                  title: 'Enable Self Signed SSL Certificates'
              ),
              SettingsButton(
                name: 'Logger',
                icon: Icon(Icons.print),
                page: () => LoggerPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

