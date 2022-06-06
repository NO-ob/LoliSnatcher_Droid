import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

import 'package:LoliSnatcher/src/handlers/settings_handler.dart';
import 'package:LoliSnatcher/src/handlers/service_handler.dart';
import 'package:LoliSnatcher/src/pages/settings/logger_page.dart';
import 'package:LoliSnatcher/src/utils/http_overrides.dart';
import 'package:LoliSnatcher/src/widgets/common/settings_widgets.dart';
import 'package:LoliSnatcher/src/widgets/tags_manager/tm_dialog.dart';

class DebugPage extends StatefulWidget {
  const DebugPage({Key? key}) : super(key: key);

  @override
  State<DebugPage> createState() => _DebugPageState();
}

class _DebugPageState extends State<DebugPage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  bool allowSelfSignedCerts = false;
  
  double vDuration = 0;
  double vAmplitude = -1;
  bool vFlutterway = false;

  @override
  void initState() {
    super.initState();
    allowSelfSignedCerts = settingsHandler.allowSelfSignedCerts;
  }

  Future<bool> showTagsManager(BuildContext context) async {
    return await SettingsPageOpen(
      context: context,
      page: () => const TagsManagerDialog(),
    ).open();
  }

  //called when page is closed, sets settingshandler variables and then writes settings to disk
  Future<bool> _onWillPop() async {
    settingsHandler.allowSelfSignedCerts = allowSelfSignedCerts;
    bool result = await settingsHandler.saveSettings(restate: false);
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
          title: const Text("Debug"),
        ),
        body: Center(
          child: ListView(
            children: [
              SettingsToggle(
                value: settingsHandler.showPerf.value,
                onChanged: (newValue) {
                  setState(() {
                    settingsHandler.showPerf.value = newValue;
                  });
                },
                title: 'Show Performance graph'
              ),
              SettingsToggle(
                value: settingsHandler.showFPS.value,
                onChanged: (newValue) {
                  setState(() {
                    settingsHandler.showFPS.value = newValue;
                  });
                },
                title: 'Show FPS graph'
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
                value: settingsHandler.disableImageScaling,
                onChanged: (newValue) {
                  setState(() {
                    settingsHandler.disableImageScaling = newValue;
                  });
                },
                title: "Don't scale images"
              ),
              SettingsToggle(
                value: settingsHandler.disableImageIsolates,
                onChanged: (newValue) {
                  setState(() {
                    settingsHandler.disableImageIsolates = newValue;
                  });
                },
                title: "Disable Isolates"
              ),
              SettingsToggle(
                value: settingsHandler.showURLOnThumb,
                onChanged: (newValue) {
                  setState(() {
                    settingsHandler.showURLOnThumb = newValue;
                  });
                },
                title: 'Show URL on thumb'
              ),
              SettingsToggle(
                  value: allowSelfSignedCerts,
                  onChanged: (newValue) {
                    setState(() {
                      allowSelfSignedCerts = newValue;
                    });
                  },
                  title: 'Enable Self Signed SSL Certificates'
              ),
              SettingsToggle(
                value: settingsHandler.desktopListsDrag,
                onChanged: (newValue) {
                  setState(() {
                    settingsHandler.desktopListsDrag = newValue;
                  });
                },
                title: "Enable drag scroll on lists [Desktop only]"
              ),

              SettingsButton(
                name: 'Animation speed ($timeDilation)',
                icon: const Icon(Icons.timelapse),
                action: () {
                  const List<double> speeds = [0.25, 0.5, 0.75, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 20];
                  int currentIndex = speeds.indexOf(timeDilation);
                  int newIndex = 0;
                  if((currentIndex + 1) <= (speeds.length - 1)) {
                    newIndex = currentIndex + 1;
                  }
                  timeDilation = speeds[newIndex];
                  setState(() { });
                },
              ),

              SettingsButton(
                name: 'Tags Manager',
                icon: const Icon(CupertinoIcons.tag),
                action: () {
                  showTagsManager(context);
                },
              ),

              const SettingsButton(name: '', enabled: false),
              const SettingsButton(
                name: 'Vibration tests',
              ),
              SettingsButton(
                name: 'Duration',
                subtitle: Row(
                  children: [
                    ElevatedButton(
                      child: const Text('-1'),
                      onPressed: () {
                        setState(() {
                          if((vDuration - 1) <= 0) {
                            vDuration = 0;
                          } else {
                            vDuration -= 1;
                          }
                        });
                      },
                    ),
                    Expanded(
                      child: Slider(
                        value: vDuration,
                        onChanged: (newValue) {
                          setState(() {
                            vDuration = newValue;
                          });
                        },
                        min: 0,
                        max: 500,
                        divisions: 500,
                        label: '$vDuration',
                        activeColor: Theme.of(context).colorScheme.secondary,
                        thumbColor: Theme.of(context).colorScheme.secondary,
                        inactiveColor: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                    ElevatedButton(
                      child: const Text('+1'),
                      onPressed: () {
                        setState(() {
                          if((vDuration + 1) >= 500) {
                            vDuration = 500;
                          } else {
                            vDuration += 1;
                          }
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('$vDuration'),
                    ),
                  ],
                ),
              ),
              SettingsButton(
                name: 'Amplitude',
                subtitle: Row(
                  children: [
                    ElevatedButton(
                      child: const Text('-1'),
                      onPressed: () {
                        setState(() {
                          if((vAmplitude - 1) <= -1) {
                            vAmplitude = -1;
                          } else {
                            vAmplitude -= 1;
                          }
                        });
                      },
                    ),
                    Expanded(
                      child: Slider(
                        value: vAmplitude,
                        onChanged: (newValue) {
                          setState(() {
                            vAmplitude = newValue;
                          });
                        },
                        min: -1,
                        max: 255,
                        divisions: 256,
                        label: '$vAmplitude',
                        activeColor: Theme.of(context).colorScheme.secondary,
                        thumbColor: Theme.of(context).colorScheme.secondary,
                        inactiveColor: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                    ElevatedButton(
                      child: const Text('+1'),
                      onPressed: () {
                        setState(() {
                          if((vAmplitude + 1) >= 255) {
                            vAmplitude = 255;
                          } else {
                            vAmplitude += 1;
                          }
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('$vAmplitude'),
                    ),
                  ],
                ),
              ),
              SettingsToggle(
                value: vFlutterway,
                onChanged: (newValue) {
                  setState(() {
                    vFlutterway = newValue;
                  });
                },
                title: 'Flutterway',
              ),
              SettingsButton(
                name: 'Vibrate',
                action: () {
                  print('Vibrate $vDuration $vAmplitude');
                  ServiceHandler.vibrate(flutterWay: vFlutterway, duration: vDuration.round(), amplitude: vAmplitude.round());
                },
              ),
              const SettingsButton(name: '', enabled: false),

              SettingsButton(name: 'Res: ${MediaQuery.of(context).size.width.toPrecision(4)}x${MediaQuery.of(context).size.height.toPrecision(4)}'),
              SettingsButton(name: 'Pixel Ratio: ${MediaQuery.of(context).devicePixelRatio.toPrecision(4)}'),
              SettingsButton(
                name: 'Logger',
                icon: const Icon(Icons.print),
                page: () => const LoggerPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

