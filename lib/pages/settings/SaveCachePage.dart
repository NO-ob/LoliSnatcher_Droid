import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:LoliSnatcher/ImageWriterIsolate.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/widgets/InfoDialog.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:LoliSnatcher/ImageWriter.dart';
import 'package:LoliSnatcher/Tools.dart';
import 'package:LoliSnatcher/pages/settings/DirPicker.dart';

class SaveCachePage extends StatefulWidget {
  SaveCachePage();
  @override
  _SaveCachePageState createState() => _SaveCachePageState();
}

class _SaveCachePageState extends State<SaveCachePage> {
  final SettingsHandler settingsHandler = Get.find();
  late String videoCacheMode;
  final TextEditingController snatchCooldownController = TextEditingController();
  final TextEditingController cacheSizeController = TextEditingController();
  final ServiceHandler serviceHandler = ServiceHandler();
  String extPathOverride = "";
  bool jsonWrite = false, thumbnailCache = true, mediaCache = false;

  final ImageWriter imageWriter = ImageWriter();
  
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
    jsonWrite = settingsHandler.jsonWrite;
    cacheDuration = settingsHandler.cacheDuration;
    cacheDurationSelected = settingsHandler.map['cacheDuration']?['options'].firstWhere((dur) {
      return dur["value"].inSeconds == cacheDuration.inSeconds;
    });
    cacheSizeController.text = settingsHandler.cacheSize.toString();

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
              'path': await serviceHandler.getCacheDir(),
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
    bool result = await settingsHandler.saveSettings(restate: true);
    return result;
  }

  void setPath(String path) {
    print("path is $path");
    if (path.isNotEmpty) {
      settingsHandler.extPathOverride = path;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child:Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Snatching & Caching"),
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
                icon: Icon(Icons.folder_outlined),
                action: () async {
                  //String url = await ServiceHandler.setExtDir();

                  if (Platform.isAndroid) {
                    extPathOverride = await ServiceHandler.setExtDir();
                    // TODO Store uri in settings and make another button so can set seetings dir and pictures dir
                  } else {
                    // TODO need to update dir picker to work on desktop
                    /*if(widget.settingsHandler.appMode == "Desktop") {
                      Get.dialog(Dialog(
                        child: Container(
                          width: 500,
                          child: DirPicker(path),
                        ),
                      )).then((value) => {setPath(value == null ? "" : value)});
                    } else {
                      Get.to(() => DirPicker(path))!.then((value) => {setPath(value == null ? "" : value)});
                    }*/
                    FlashElements.showSnackbar(
                      context: context,
                      title: Text(
                        'Error!',
                        style: TextStyle(fontSize: 20)
                      ),
                      content: Text(
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
              SettingsButton(name: '', enabled: false),

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
                selected: videoCacheMode,
                values: settingsHandler.map['videoCacheMode']?['options'],
                onChanged: (String? newValue) {
                  setState(() {
                    videoCacheMode = newValue ?? settingsHandler.map['videoCacheMode']?['default'];
                  });
                },
                title: 'Video Cache Mode',
                trailingIcon: IconButton(
                  icon: Icon(Icons.info, color: Get.theme.colorScheme.secondary),
                  onPressed: () {
                    Get.dialog(
                        InfoDialog("Video Cache Modes",
                          [
                            Text("- Stream - Don't cache, start playing as soon as possible"),
                            Text("- Cache - Saves to device storage, plays only when download is complete"),
                            Text("- Stream+Cache - Mix of both, but currently leads to double download"),
                            const SizedBox(height: 10),
                            Text("[Note]: Videos will cache only if Media Cache is enabled")
                          ],
                          CrossAxisAlignment.start,
                        )
                    );
                  },
                ),
              ),

              SettingsDropdown(
                selected: cacheDurationSelected?["label"] ?? '',
                values: List<String>.from(settingsHandler.map['cacheDuration']?['options'].map((dur) {
                  return dur["label"];
                })),
                onChanged: (String? newValue) {
                  setState(() {
                    cacheDurationSelected = settingsHandler.map['cacheDuration']?['options'].firstWhere((dur) {
                      return dur["label"] == newValue;
                    });
                    cacheDuration = cacheDurationSelected!["value"];
                  });
                },
                title: 'Delete Cache older than:',
              ),

              SettingsTextInput(
                controller: cacheSizeController,
                title: 'Cache Size Limit (GB)',
                hintText: "Maximum Total Cache Size",
                inputType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),

              SettingsButton(name: '', enabled: false),

              SettingsButton(name: 'Cache Stats:'),
              ...cacheTypes.map((type) {
                Map<String, dynamic> stat = cacheStats.firstWhere((stat) => stat['type'] == type['folder'], orElse: () => ({'type': 'loading', 'totalSize': -1, 'fileNum': -1}));
                String? folder = type['folder'];
                String label = type['label'] ?? '???';
                String size = Tools.formatBytes(stat['totalSize']!, 2);
                int fileCount = stat['fileNum'] ?? 0;
                bool isEmpty = stat['fileNum'] == 0 || stat['totalSize'] == 0;
                bool isLoading = stat['type'] == 'loading';
                String text = isLoading
                  ? 'Loading...'
                  : (isEmpty ? 'Empty' : '$size in ${fileCount.toString()} file${fileCount == 1 ? '' : 's'}');

                bool allowedToClear = folder != null && folder != 'favicons' && !isEmpty;

                return SettingsButton(
                  name: '$label: $text',
                  icon: isLoading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Get.theme.colorScheme.secondary)
                      )
                    : Icon(allowedToClear ? Icons.delete : null),
                  action: () async {
                    if (allowedToClear) {
                      FlashElements.showSnackbar(
                        context: context,
                        duration: Duration(seconds: 2),
                        title: Text(
                          'Cache cleared!',
                          style: TextStyle(fontSize: 20)
                        ),
                        content: Text(
                          'Cleared $label cache!',
                          style: TextStyle(fontSize: 16)
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
              }),

              SettingsButton(
                name: 'Clear cache completely',
                icon: Icon(Icons.delete_forever, color: Get.theme.errorColor),
                action: () async {
                  FlashElements.showSnackbar(
                    context: context,
                    title: Text(
                      'Cache cleared!',
                      style: TextStyle(fontSize: 20)
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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

