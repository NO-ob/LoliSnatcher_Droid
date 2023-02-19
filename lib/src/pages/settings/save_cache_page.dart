import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/services/image_writer.dart';
import 'package:lolisnatcher/src/services/image_writer_isolate.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class SaveCachePage extends StatefulWidget {
  const SaveCachePage({Key? key}) : super(key: key);

  @override
  State<SaveCachePage> createState() => _SaveCachePageState();
}

class _SaveCachePageState extends State<SaveCachePage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final ImageWriter imageWriter = ImageWriter();

  final TextEditingController snatchCooldownController = TextEditingController();
  final TextEditingController cacheSizeController = TextEditingController();
  
  late String videoCacheMode, extPathOverride;
  bool jsonWrite = false, thumbnailCache = true, mediaCache = false, downloadNotifications = true;
  
  final List<Map<String, String?>> cacheTypes = [
    {'folder': null, 'label': 'Total'},
    // TODO ask before deleting favicons, since they cause unneeded network requests on each render if not cached
    {'folder': 'favicons', 'label': 'Favicons'},
    {'folder': 'thumbnails', 'label': 'Thumbnails'},
    {'folder': 'samples', 'label': 'Samples'},
    {'folder': 'media', 'label': 'Media'}
  ]; // [cache folder, displayed name]
  List<Map<String, dynamic>> cacheStats = [];
  Map<String, dynamic>? cacheDurationSelected;
  late Duration cacheDuration;
  Isolate? isolate;

  @override
  void initState() {
    super.initState();
    snatchCooldownController.text = settingsHandler.snatchCooldown.toString();
    thumbnailCache = settingsHandler.thumbnailCache;
    mediaCache = settingsHandler.mediaCache;
    videoCacheMode = settingsHandler.videoCacheMode;
    extPathOverride = settingsHandler.extPathOverride;
    jsonWrite = settingsHandler.jsonWrite;
    cacheDuration = settingsHandler.cacheDuration;
    cacheDurationSelected = settingsHandler.map['cacheDuration']!['options']!.firstWhere((dur) {
      return dur["value"].inSeconds == cacheDuration.inSeconds;
    });
    cacheSizeController.text = settingsHandler.cacheSize.toString();
    downloadNotifications = settingsHandler.downloadNotifications;

    getCacheStats();
  }

  @override
  void dispose() {
    isolate?.kill(priority: Isolate.immediate);
    isolate = null;
    super.dispose();
  }

  void getCacheStats() async {
    cacheStats = [];
    for(Map<String, String?> type in cacheTypes) {
      final ReceivePort receivePort = ReceivePort();
      isolate = await Isolate.spawn(_isolateEntry, receivePort.sendPort);

      receivePort.listen((dynamic data) async {
        if (mounted) {
          if (data is SendPort) {
            data.send({
              'path': await ServiceHandler.getCacheDir(),
              'type': type['folder'],
            });
          }else {
            cacheStats.add(data);
            setState(() { });
          }
        }
      });
    }
    return;
  }

  static _isolateEntry(dynamic d) async {
    final ReceivePort receivePort = ReceivePort();
    d.send(receivePort.sendPort);

    final config = await receivePort.first;
    d.send(await ImageWriterIsolate(config['path']).getCacheStat(config['type']));
  }

  //called when page is closed, sets settingshandler variables and then writes settings to disk
  Future<bool> _onWillPop() async {
    settingsHandler.snatchCooldown = int.parse(snatchCooldownController.text);
    settingsHandler.jsonWrite = jsonWrite;
    settingsHandler.mediaCache = mediaCache;
    settingsHandler.thumbnailCache = thumbnailCache;
    settingsHandler.videoCacheMode = videoCacheMode;
    settingsHandler.cacheDuration = cacheDuration;
    settingsHandler.cacheSize = int.parse(cacheSizeController.text);
    settingsHandler.extPathOverride = extPathOverride;
    settingsHandler.downloadNotifications = downloadNotifications;
    bool result = await settingsHandler.saveSettings(restate: false);
    return result;
  }

  void setPath(String path) {
    print("path is $path");
    if (path.isNotEmpty) {
      settingsHandler.extPathOverride = path;
    }
  }

  Widget buildCacheButton(Map<String, String?> type) {
    Map<String, dynamic> stat = cacheStats.firstWhere((stat) => stat['type'] == type['folder'], orElse: () => ({'type': 'loading', 'totalSize': -1, 'fileNum': -1}));
    String? folder = type['folder'];
    String label = type['label'] ?? '???';
    String size = Tools.formatBytes(stat['totalSize']!, 2);
    int fileCount = stat['fileNum'] ?? 0;
    bool isEmpty = stat['fileNum'] == 0 || stat['totalSize'] == 0;
    bool isLoading = stat['type'] == 'loading';
    String text = isLoading
      ? 'Loading...'
      : (isEmpty ? 'Empty' : '$size in ${fileCount.toString()} ${Tools.pluralize('file', fileCount)}');

    bool allowedToClear = folder != null && folder != 'favicons' && !isEmpty;

    return SettingsButton(
      name: '$label: $text',
      icon: isLoading
        ? const CircularProgressIndicator()
        : Icon(allowedToClear ? Icons.delete_forever : null),
      action: () async {
        if (allowedToClear) {
          FlashElements.showSnackbar(
            context: context,
            position: Positions.top,
            duration: const Duration(seconds: 2),
            title: const Text(
              'Cache cleared!',
              style: TextStyle(fontSize: 20)
            ),
            content: Text(
              'Cleared $label cache!',
              style: const TextStyle(fontSize: 16)
            ),
            leadingIcon: Icons.delete_forever,
            leadingIconColor: Colors.red,
            leadingIconSize: 40,
            sideColor: Colors.yellow,
          );
          await imageWriter.deleteCacheFolder(folder);
          getCacheStats();
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child:Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text("Snatching & Caching"),
        ),
        body: Center(
          child: ListView(
            children: [
              SettingsTextInput(
                controller: snatchCooldownController,
                title: 'Snatch Cooldown (ms)',
                hintText: "Timeout between snatching images in ms",
                inputType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                resetText: () => settingsHandler.map['snatchCooldown']!['default']!.toString(),
                numberButtons: true,
                numberStep: 50,
                numberMin: 0,
                numberMax: double.infinity,
                validator: (String? value) {
                  int? parse = int.tryParse(value ?? '');
                  if(value == null || value.isEmpty) {
                    return 'Please enter a value';
                  } else if(parse == null) {
                    return 'Please enter a valid timeout value';
                  } else if(parse < 10) {
                    return 'Please enter a value bigger than 10ms';
                  } else {
                    return null;
                  }
                }
              ),
              SettingsToggle(
                value: downloadNotifications,
                onChanged: (newValue) {
                  setState(() {
                    downloadNotifications = newValue;
                  });
                },
                title: 'Show Download Notifications',
              ),
              SettingsToggle(
                value: jsonWrite,
                onChanged: (newValue) {
                  setState(() {
                    jsonWrite = newValue;
                  });
                },
                title: 'Write Image Data to JSON on save',
              ),

              SettingsButton(
                name: 'Set Storage Directory',
                subtitle: Text(extPathOverride.isEmpty ? '...' : 'Current: $extPathOverride'),
                icon: const Icon(Icons.folder_outlined),
                action: () async {
                  //String url = await ServiceHandler.setExtDir();

                  if (Platform.isAndroid) {
                    final String newPath = await ServiceHandler.setExtDir();
                    extPathOverride = newPath;
                    setState(() { });
                    // TODO Store uri in settings and make another button so can set seetings dir and pictures dir
                  } else {
                    // TODO need to update dir picker to work on desktop
                    // String? value;
                    // if(settingsHandler.appMode.value.isDesktop) {
                    //   value = await showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return Dialog(
                    //         child: SizedBox(
                    //           width: 500,
                    //           child: DirPicker(path),
                    //         ),
                    //       );
                    //     },
                    //   );
                    // } else {
                    // TODO remove this Get
                    //   value = await Get.to(() => DirPicker(path))!;
                    // }
                    // setPath(value ?? "");


                    FlashElements.showSnackbar(
                      context: context,
                      title: const Text(
                        'Error!',
                        style: TextStyle(fontSize: 20)
                      ),
                      content: const Text(
                        'Currently not available for this platform',
                        style: TextStyle(fontSize: 16)
                      ),
                      leadingIcon: Icons.error_outline,
                      leadingIconColor: Colors.red,
                      sideColor: Colors.red,
                    );
                  }
                },
              ),
              if(extPathOverride.isNotEmpty)
                SettingsButton(
                  name: 'Reset Storage Directory',
                  icon: const Icon(Icons.refresh),
                  action: () {
                    setState(() {
                      extPathOverride = '';
                    });
                  },
                ),
              const SettingsButton(name: '', enabled: false),

              SettingsToggle(
                value: thumbnailCache,
                onChanged: (newValue) {
                  setState(() {
                    thumbnailCache = newValue;
                  });
                },
                title: 'Cache Thumbnails',
              ),
              SettingsToggle(
                value: mediaCache,
                onChanged: (newValue) {
                  setState(() {
                    mediaCache = newValue;
                  });
                },
                title: 'Cache Media',
              ),
              SettingsDropdown(
                value: videoCacheMode,
                items: settingsHandler.map['videoCacheMode']!['options'],
                onChanged: (String? newValue) {
                  setState(() {
                    videoCacheMode = newValue ?? settingsHandler.map['videoCacheMode']!['default'];
                  });
                },
                title: 'Video Cache Mode',
                trailingIcon: IconButton(
                  icon: const Icon(Icons.help_outline),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const SettingsDialog(
                          title: Text('Video Cache Modes'),
                          contentItems: <Widget>[
                            Text("- Stream - Don't cache, start playing as soon as possible"),
                            Text("- Cache - Saves the file to device storage, plays only when download is complete"),
                            Text("- Stream+Cache - Mix of both, but currently leads to double download"),
                            Text(''),
                            Text("[Note]: Videos will cache only if 'Cache Media' is enabled."),
                            Text(''),
                            Text("[Warning]: On desktop builds Stream mode can work incorrectly for some Boorus.")
                          ],
                        );
                      }
                    );
                  },
                ),
              ),

              SettingsDropdown(
                value: (cacheDurationSelected?["label"] ?? '') as String,
                items: List<String>.from(settingsHandler.map['cacheDuration']!['options'].map((dur) {
                  return dur["label"];
                })),
                onChanged: (String? newValue) {
                  setState(() {
                    cacheDurationSelected = settingsHandler.map['cacheDuration']!['options'].firstWhere((dur) {
                      return dur["label"] == newValue;
                    });
                    cacheDuration = cacheDurationSelected!["value"];
                  });
                },
                title: 'Delete Cache after:',
              ),

              SettingsTextInput(
                controller: cacheSizeController,
                title: 'Cache Size Limit (in GB)',
                hintText: "Maximum Total Cache Size",
                inputType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                resetText: () => settingsHandler.map['cacheSize']!['default']!.toString(),
                numberButtons: true,
                numberStep: 1,
                numberMin: 0,
                numberMax: double.infinity,
              ),

              const SettingsButton(name: '', enabled: false),

              const SettingsButton(name: 'Cache Stats:'),
              ...cacheTypes.map(buildCacheButton),

              SettingsButton(
                name: 'Clear cache completely',
                icon: Icon(Icons.delete_forever, color: Theme.of(context).colorScheme.error),
                action: () async {
                  FlashElements.showSnackbar(
                    context: context,
                    position: Positions.top,
                    title: const Text(
                      'Cache cleared!',
                      style: TextStyle(fontSize: 20)
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Cleared cache completely!',
                          style: TextStyle(fontSize: 16)
                        ),
                        Text(
                          'App Restart may be required!',
                          style: TextStyle(fontSize: 16)
                        ),
                      ]
                    ),
                    leadingIcon: Icons.delete_forever,
                    leadingIconColor: Colors.red,
                    leadingIconSize: 40,
                    sideColor: Colors.yellow,
                  );
                  await imageWriter.deleteCacheFolder('');
                  // await serviceHandler.emptyCache();
                  getCacheStats();
                },
                drawBottomBorder: false
              ),
            ],
          ),
        ),
      ),
    );
  }
}

