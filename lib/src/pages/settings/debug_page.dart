import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/services.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/pages/settings/logger_page.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/tags_manager/tm_dialog.dart';
import 'package:lolisnatcher/src/widgets/webview/webview_page.dart';

class DebugPage extends StatefulWidget {
  const DebugPage({super.key});

  @override
  State<DebugPage> createState() => _DebugPageState();
}

class _DebugPageState extends State<DebugPage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  double vDuration = 0;
  double vAmplitude = -1;
  bool vFlutterway = false;

  final TextEditingController sessionStrController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<dynamic> showTagsManager(BuildContext context) async {
    return SettingsPageOpen(
      context: context,
      page: () => const TagsManagerDialog(),
    ).open();
  }

  //called when page is closed, sets settingshandler variables and then writes settings to disk
  Future<void> _onPopInvoked(bool didPop, _) async {
    if (didPop) {
      return;
    }

    final bool result = await settingsHandler.saveSettings(restate: false);

    if (result) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Debug'),
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
                title: 'Show Performance graph',
              ),
              SettingsToggle(
                value: settingsHandler.showFPS.value,
                onChanged: (newValue) {
                  setState(() {
                    settingsHandler.showFPS.value = newValue;
                  });
                },
                title: 'Show FPS graph',
              ),
              SettingsToggle(
                value: settingsHandler.showImageStats.value,
                onChanged: (newValue) {
                  setState(() {
                    settingsHandler.showImageStats.value = newValue;
                  });
                },
                title: 'Show Image Stats',
              ),
              SettingsToggle(
                value: settingsHandler.desktopListsDrag,
                onChanged: (newValue) {
                  setState(() {
                    settingsHandler.desktopListsDrag = newValue;
                  });
                },
                title: 'Enable drag scroll on lists [Desktop only]',
              ),

              SettingsButton(
                name: 'Animation speed ($timeDilation)',
                icon: const Icon(Icons.timelapse),
                action: () {
                  const List<double> speeds = [0.25, 0.5, 0.75, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 20];
                  final int currentIndex = speeds.indexOf(timeDilation);
                  int newIndex = 0;
                  if ((currentIndex + 1) <= (speeds.length - 1)) {
                    newIndex = currentIndex + 1;
                  }
                  timeDilation = speeds[newIndex];
                  setState(() {});
                },
              ),

              SettingsButton(
                name: 'Tags Manager',
                icon: const Icon(CupertinoIcons.tag),
                action: () {
                  showTagsManager(context);
                },
              ),

              if (kDebugMode && (Platform.isAndroid || Platform.isIOS)) ...[
                const SettingsButton(name: 'Vibration', enabled: false),
                Column(
                  children: [
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
                                if ((vDuration - 1) <= 0) {
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
                            ),
                          ),
                          ElevatedButton(
                            child: const Text('+1'),
                            onPressed: () {
                              setState(() {
                                if ((vDuration + 1) >= 500) {
                                  vDuration = 500;
                                } else {
                                  vDuration += 1;
                                }
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
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
                                if ((vAmplitude - 1) <= -1) {
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
                            ),
                          ),
                          ElevatedButton(
                            child: const Text('+1'),
                            onPressed: () {
                              setState(() {
                                if ((vAmplitude + 1) >= 255) {
                                  vAmplitude = 255;
                                } else {
                                  vAmplitude += 1;
                                }
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
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
                  ],
                ),
              ],

              SettingsButton(name: 'Res: ${MediaQuery.of(context).size.width.toPrecision(4)}x${MediaQuery.of(context).size.height.toPrecision(4)}'),
              SettingsButton(name: 'Pixel Ratio: ${MediaQuery.of(context).devicePixelRatio.toPrecision(4)}'),

              const SettingsButton(name: '', enabled: false),

              SettingsButton(
                name: 'Logger',
                icon: const Icon(Icons.print),
                page: () => const LoggerPage(),
              ),

              SettingsButton(
                name: 'Webview',
                icon: const Icon(Icons.public),
                page: () => const InAppWebviewView(initialUrl: 'gelbooru.com'),
              ),
              SettingsButton(
                name: 'Delete All Cookies',
                icon: const Icon(Icons.cookie_outlined),
                action: () async {
                  await CookieManager.instance().deleteAllCookies();
                },
              ),

              const SettingsButton(name: '', enabled: false),

              SettingsButton(
                name: 'Get Session String',
                icon: const Icon(Icons.copy),
                action: () async {
                  final str = SearchHandler.instance.generateBackupJson() ?? '';
                  await Clipboard.setData(ClipboardData(text: str));
                  FlashElements.showSnackbar(
                    context: context,
                    duration: const Duration(seconds: 2),
                    title: const Text('Copied to clipboard!', style: TextStyle(fontSize: 20)),
                    content: Text(
                      str,
                      style: const TextStyle(fontSize: 16),
                    ),
                    leadingIcon: Icons.copy,
                    sideColor: Colors.green,
                  );
                },
              ),
              SettingsButton(
                name: 'Set Session String',
                icon: const Icon(Icons.restore),
                action: () async {
                  await showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        content: Column(
                          children: [
                            SettingsTextInput(
                              controller: sessionStrController,
                              title: 'Session string',
                              onlyInput: true,
                              pasteable: true,
                            ),
                          ],
                        ),
                        actions: [
                          const CancelButton(),
                          ElevatedButton(
                            onPressed: () async {
                              if (sessionStrController.text.isNotEmpty) {
                                SearchHandler.instance.replaceTabs(sessionStrController.text);

                                FlashElements.showSnackbar(
                                  context: context,
                                  duration: const Duration(seconds: 2),
                                  title: const Text('Restored session from string!', style: TextStyle(fontSize: 20)),
                                  content: Text(
                                    sessionStrController.text,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  leadingIcon: Icons.copy,
                                  sideColor: Colors.green,
                                );
                              }
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),

              // dummy button to use at least one icon from fontawesome regular and solid packs (brands pack is used in discord button)
              // this is required because flutter doesn't tree-shake resources correctly if they are not used at all
              // more on that here: https://pub.dev/packages/font_awesome_flutter#faq
              const Opacity(
                opacity: 0,
                child: SettingsButton(
                  name: '',
                  enabled: false,
                  icon: FaIcon(FontAwesomeIcons.addressBook),
                  trailingIcon: FaIcon(FontAwesomeIcons.solidAddressBook),
                  drawTopBorder: false,
                  drawBottomBorder: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
