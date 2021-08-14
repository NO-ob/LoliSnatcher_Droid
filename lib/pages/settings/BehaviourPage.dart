import 'dart:async';
import 'dart:io';

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

import 'DirPicker.dart';

class BehaviourPage extends StatefulWidget {
  BehaviourPage();
  @override
  _BehaviourPageState createState() => _BehaviourPageState();
}

class _BehaviourPageState extends State<BehaviourPage> {
  final SettingsHandler settingsHandler = Get.find();
  late String shareAction, videoCacheMode;
  final TextEditingController snatchCooldownController = TextEditingController();
  final ServiceHandler serviceHandler = ServiceHandler();
  bool jsonWrite = false, imageCache = false, mediaCache = false;

  final ImageWriter imageWriter = ImageWriter();
  final List<List<String?>> cacheTypes = [
    [null, 'Total'],
    // TODO ask before deleting favicons, since they cause unneeded network requests on each render if not cached
    ['favicons', 'Favicons'],
    ['thumbnails', 'Thumbnails'],
    ['samples', 'Samples'],
    ['media', 'Media']
  ]; // [cache folder, displayed name]
  List<Map<String,int>> cacheStats = [];

  @override
  void initState() {
    super.initState();
    shareAction = settingsHandler.shareAction;
    snatchCooldownController.text = settingsHandler.snatchCooldown.toString();
    imageCache = settingsHandler.imageCache;
    mediaCache = settingsHandler.mediaCache;
    videoCacheMode = settingsHandler.videoCacheMode;
    jsonWrite = settingsHandler.jsonWrite;

    getCacheStats();
  }

  Future<void> getCacheStats() async {
    cacheStats = [];
    for(List<String?> type in cacheTypes) {
      // TODO isolate to fix lags on open?
      cacheStats.add(await imageWriter.getCacheStat(type[0]));
    }
    setState(() { });
    return;
  }

  //called when page is closed, sets settingshandler variables and then writes settings to disk
  Future<bool> _onWillPop() async {
    settingsHandler.shareAction = shareAction;
    settingsHandler.snatchCooldown = int.parse(snatchCooldownController.text);
    settingsHandler.jsonWrite = jsonWrite;
    settingsHandler.mediaCache = mediaCache;
    settingsHandler.imageCache = imageCache;
    settingsHandler.videoCacheMode = videoCacheMode;
    bool result = await settingsHandler.saveSettings();
    return result;
  }

  void setPath(String path) {
    print("path is $path");
    if (path.isNotEmpty){
      print(path);
      settingsHandler.extPathOverride = path;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child:Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Behaviour"),
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
              SettingsDropdown(
                selected: shareAction,
                values: settingsHandler.map['shareAction']?['options'],
                onChanged: (String? newValue){
                  setState((){
                    shareAction = newValue ?? settingsHandler.map['shareAction']?['default'];
                  });
                },
                title: 'Default Share Action',
                trailingIcon: IconButton(
                  icon: Icon(Icons.info, color: Get.theme.accentColor),
                  onPressed: () {
                    Get.dialog(
                        InfoDialog("Share Actions",
                          [
                            Text("- Ask - always ask what to share"),
                            Text("- Post URL"),
                            Text("- File URL - shares direct link to the original file (may not work with some sites, e.g. Sankaku)"),
                            Text("- File - shares viewed file itself"),
                            Text("- Hydrus - sends the post url to Hydrus for import"),
                            const SizedBox(height: 10),
                            Text("[Note]: If File is saved in cache, it will be loaded from there. Otherwise it will be loaded again from network which can take some time."),
                            Text("[Tip]: You can open Share Actions Menu by long pressing Share button")
                          ],
                          CrossAxisAlignment.start,
                        )
                    );
                  },
                ),
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
              SettingsToggle(
                value: imageCache,
                onChanged: (newValue) {
                  setState(() {
                    imageCache = newValue;
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
                onChanged: (String? newValue){
                  setState((){
                    videoCacheMode = newValue ?? settingsHandler.map['videoCacheMode']?['default'];
                  });
                },
                title: 'Video Cache Mode',
                trailingIcon: IconButton(
                  icon: Icon(Icons.info, color: Get.theme.accentColor),
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

              SettingsButton(name: '', enabled: false),
              SettingsButton(
                name: 'Set Storage Directory',
                icon: Icon(Icons.folder_outlined),
                action: () async {
                  //String url = await ServiceHandler.setExtDir();
                  int SDKVer = await serviceHandler.getSDKVersion();
                  String path = await serviceHandler.getExtDir();

                  if (SDKVer < 30){
                    if(settingsHandler.appMode == "Desktop"){
                      Get.dialog(Dialog(
                        child: Container(
                          width: 500,
                          child: DirPicker(path),
                        ),
                      )).then((value) => {setPath(value == null ? "" : value)});
                    } else {
                      Get.to(() => DirPicker(path))!.then((value) => {setPath(value == null ? "" : value)});
                    }
                  } else {
                    ServiceHandler.displayToast("Not available on android 11+");
                  }
                },
              ),
              SettingsButton(name: '', enabled: false),

              // TODO
              SettingsButton(name: 'Delete cache after X days [TODO]', action: () { ServiceHandler.displayToast('WIP'); }),
              SettingsButton(name: 'Max Cache size [TODO]', action: () { ServiceHandler.displayToast('WIP'); }),

              SettingsButton(name: 'Cache Stats:'),
              ...cacheStats.map((stat) {
                int index = cacheStats.indexOf(stat);
                String? name = cacheTypes[index][0];
                String label = cacheTypes[index][1]!;
                String size = Tools.formatBytes(stat['totalSize']!, 2);
                int count = stat['fileNum'] ?? 0;
                bool isEmpty = stat['fileNum'] == 0;
                String text = isEmpty ? 'Empty' : '$size in ${count.toString()} file${count == 1 ? '' : 's'}';
                return SettingsButton(
                  name: '$label: $text',
                  icon: Icon(null),
                  action: () async {
                    if(name != null){
                      await imageWriter.deleteCacheFolder(name);
                      ServiceHandler.displayToast('Cleared $label cache');
                      getCacheStats();
                    }
                  }
                );
              }),
              SettingsButton(
                name: 'Clear Cache',
                icon: Icon(Icons.delete_forever, color: Get.theme.errorColor),
                action: (){
                  serviceHandler.emptyCache();
                  ServiceHandler.displayToast("Cache cleared!\nRestart may be required!");
                  Timer(Duration(seconds: 2), () {getCacheStats();});
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

