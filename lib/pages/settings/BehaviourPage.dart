import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/widgets/InfoDialog.dart';
import 'package:LoliSnatcher/ImageWriter.dart';
import 'package:LoliSnatcher/Tools.dart';

import 'DirPicker.dart';

class BehaviourPage extends StatefulWidget {
  SettingsHandler settingsHandler;
  BehaviourPage(this.settingsHandler);
  @override
  _BehaviourPageState createState() => _BehaviourPageState();
}

class _BehaviourPageState extends State<BehaviourPage> {
  String? shareAction,videoCacheMode;
  TextEditingController snatchCooldownController = new TextEditingController();
  ServiceHandler serviceHandler = new ServiceHandler();
  bool jsonWrite = false,imageCache = false, mediaCache = false;

  ImageWriter imageWriter = ImageWriter();
  List<List<String?>> cacheTypes = [[null, 'Total'], ['thumbnails', 'Thumbnails'], ['samples', 'Samples'], ['media', 'Media']]; // [cache folder, displayed name]
  List<Map<String,int>> cacheStats = [];

  @override
  void initState() {
    super.initState();
    shareAction = widget.settingsHandler.shareAction;
    snatchCooldownController.text = widget.settingsHandler.snatchCooldown.toString();
    imageCache = widget.settingsHandler.imageCache;
    mediaCache = widget.settingsHandler.mediaCache;
    videoCacheMode = widget.settingsHandler.videoCacheMode;
    jsonWrite = widget.settingsHandler.jsonWrite;

    getCacheStats();
  }

  void getCacheStats() async {
    cacheStats = [];
    for(List<String?> type in cacheTypes) {
      cacheStats.add(await imageWriter.getCacheStat(type[0],widget.settingsHandler));
    }
    setState(() { });
    return;
  }
  //called when page is closed, sets settingshandler variables and then writes settings to disk
  Future<bool> _onWillPop() async {
    widget.settingsHandler.shareAction = shareAction!;
    widget.settingsHandler.snatchCooldown = int.parse(snatchCooldownController.text);
    widget.settingsHandler.jsonWrite = jsonWrite;
    widget.settingsHandler.mediaCache = mediaCache;
    widget.settingsHandler.imageCache = imageCache;
    widget.settingsHandler.videoCacheMode = videoCacheMode!;
    bool result = await widget.settingsHandler.saveSettings();
    return result;
  }
  void setPath(String path){
    print("path is $path");
    if (path.isNotEmpty){
      print(path);
      widget.settingsHandler.extPathOverride = path;
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
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("Snatch Cooldown (MS):      "),
                    new Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10,0,0,0),
                        child: TextField(
                          controller: snatchCooldownController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            hintText:"Timeout between snatching images",
                            contentPadding: new EdgeInsets.fromLTRB(15,0,0,0), // left,right,top,bottom
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(50),
                              gapPadding: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("Default Share Action :     "),
                    DropdownButton<String>(
                      value: shareAction,
                      icon: Icon(Icons.arrow_downward),
                      onChanged: (String? newValue){
                        setState((){
                          shareAction = newValue;
                        });
                      },
                      items: <String>["Ask", "Post URL", "File URL", "File"].map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    IconButton(
                      icon: Icon(Icons.info, color: Get.context!.theme.accentColor),
                      onPressed: () {
                        Get.dialog(
                            InfoDialog("Share Actions",
                              [
                                Text("- Ask - always ask what to share"),
                                Text("- Post URL"),
                                Text("- File URL - shares direct link to the original file (may not work with some sites, e.g. Sankaku)"),
                                Text("- File - shares viewed file itself"),
                                const SizedBox(height: 10),
                                Text("[Note]: If File is saved in cache, it will be loaded from there. Otherwise it will be loaded again from network which can take some time."),
                                Text("[Tip]: You can open Share Actions Menu by long pressing Share button")
                              ],
                              CrossAxisAlignment.start,
                            )
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(10,10,10,10),
                  child: Row(children: [
                    Text("Write Image JSON: "),
                    Checkbox(
                      value: jsonWrite,
                      onChanged: (newValue) {
                        setState(() {
                          jsonWrite = newValue!;
                        });
                      },
                      activeColor: Get.context!.theme.primaryColor,
                    )
                  ],)
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(10,10,10,2),
                  child: Row(children: [
                    Text("Thumbnail Cache: "),
                    Checkbox(
                      value: imageCache,
                      onChanged: (newValue) {
                        setState(() {
                          imageCache = newValue!;
                        });
                      },
                      activeColor: Get.context!.theme.primaryColor,
                    )
                  ],)
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
                  child: Row(children: [
                    Text("Media Cache: "),
                    Checkbox(
                      value: mediaCache,
                      onChanged: (newValue) {
                        setState(() {
                          mediaCache = newValue!;
                        });
                      },
                      activeColor: Get.context!.theme.primaryColor,
                    )
                  ],)
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
                width: double.infinity,
                // This dropdown is used to change how we fetch and cache videos
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("Video Cache Mode :     "),
                    DropdownButton<String>(
                      value: videoCacheMode,
                      icon: Icon(Icons.arrow_downward),
                      onChanged: (String? newValue){
                        setState((){
                          videoCacheMode = newValue;
                        });
                      },
                      items: <String>["Stream","Cache","Stream+Cache"].map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    IconButton(
                      icon: Icon(Icons.info, color: Get.context!.theme.accentColor),
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
                  ],
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(20,10,20,10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: Get.context!.theme.accentColor),
                    ),
                  ),
                  onPressed: (){
                    serviceHandler.emptyCache();
                    ServiceHandler.displayToast("Cache cleared! \n Restart may be required!");
                    //Get.snackbar("Cache cleared!","Restart may be required!",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context!.theme.primaryColor);
                    Timer(Duration(seconds: 2), () {getCacheStats();});
                  },
                  child: Text("Clear cache", style: TextStyle(color: Colors.white)),
                ),
              ),
              ...cacheStats.map((stat) {
                int index = cacheStats.indexOf(stat);
                String name = cacheTypes[index][1]!;
                String size = Tools.formatBytes(stat['totalSize']!, 2);
                int count = stat['fileNum'] ?? 0;
                bool isEmpty = stat['fileNum'] == 0;
                String text = isEmpty ? 'Empty' : '$size in ${count.toString()} file${count == 1 ? '' : 's'}';
                return Text('$name: $text', style: TextStyle(color: Colors.white));
              }),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(20,10,20,10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: Get.context!.theme.accentColor),
                    ),
                  ),
                  onPressed: () async{
                    //String url = await ServiceHandler.setExtDir();
                    int SDKVer = 0;
                    String path = await serviceHandler.getExtDir();
                    if (Platform.isAndroid){
                      SDKVer = await serviceHandler.getSDKVersion();
                      print(SDKVer);
                    }
                    if (SDKVer < 30){
                      if(widget.settingsHandler.appMode == "Desktop"){
                        Get.dialog(Dialog(
                          child: Container(
                            width: 500,
                            child:DirPicker(widget.settingsHandler,path),
                          ),
                        )).then((value) => {setPath(value == null ? "" : value)});
                      } else {
                        Get.to(() => DirPicker(widget.settingsHandler,path))!.then((value) => {setPath(value == null ? "" : value)});
                      }
                    } else {
                      ServiceHandler.displayToast("Not available on android 11+");
                    }
                  },
                  child: Text("Set Storage Directory", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

