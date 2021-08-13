import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:LoliSnatcher/getPerms.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/Tools.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/libBooru/DBHandler.dart';

/**
 * This class is used loading from and writing settings to files
 */
class SettingsHandler {
  ServiceHandler serviceHandler = new ServiceHandler();
  DBHandler dbHandler = new DBHandler();
  String defTags = "rating:safe", previewMode = "Sample", videoCacheMode = "Stream", prefBooru = "", cachePath = "", previewDisplay = "Waterfall", galleryMode="Full Res", shareAction = "Ask", appMode = "Mobile", galleryBarPosition = 'Top', galleryScrollDirection = 'Horizontal',extPathOverride = "";
  List<String> hatedTags = [], lovedTags = [];
  int limit = 20, portraitColumns = 2, landscapeColumns = 4, preloadCount = 2, snatchCooldown = 250, volumeButtonsScrollSpeed = 100;
  int SDKVer = 0, galleryAutoScrollTime = 4000;
  String verStr = "1.8.3";
  bool hasHydrus = false, mergeEnabled = false,showURLInThumb = false;
  List<List<String>> buttonList = [
    ["autoscroll", "AutoScroll"],
    ["snatch", "Save"],
    ["favourite", "Favourite"],
    ["info", "Display Info"],
    ["share", "Share"],
    ["open", "Open in Browser"]
  ];
  List<List<String>> buttonOrder = [
    ["autoscroll", "AutoScroll"],
    ["snatch", "Save"],
    ["favourite", "Favourite"],
    ["info", "Display Info"],
    ["share", "Share"],
    ["open", "Open in Browser"]
  ];
  List<Booru> booruList = [];
  /*static List<ThemeItem> themes = [
    new ThemeItem("Pink", Colors.pink[200], Colors.pink[300]),
    new ThemeItem("Purple", Colors.deepPurple[600], Colors.deepPurple[800]),
    new ThemeItem("Blue", Colors.lightBlue, Colors.lightBlue[600]),
    new ThemeItem("Teal", Colors.teal, Colors.teal[600]),
    new ThemeItem("Red", Colors.red[700], Colors.red[800]),
    new ThemeItem("Green", Colors.green, Colors.green[700]),
  ];*/
  String themeMode = "dark";
  String path = "";
  bool jsonWrite = false, autoPlayEnabled = true, loadingGif = false,
        imageCache = false, mediaCache = false, autoHideImageBar = false,
          dbEnabled = true, searchHistoryEnabled = true, filterHated = false,
            useVolumeButtonsForScroll = false, shitDevice = false, disableVideo = false, videoAutoMute = false;
  Future<bool> writeDefaults() async{
    if (path == ""){
      path = await getExtDir();
    }
    if (!File(path+"settings.conf").existsSync()){
      await Directory(path).create(recursive:true);
      File settingsFile = new File(path+"settings.conf");
      var writer = settingsFile.openWrite();
      writer.write("Default Tags = rating:safe\n");
      writer.write("Limit = 20\n");
      writer.write("Preview Mode = Sample\n");
      writer.close();
    }
    return true;
  }

  Future<bool> loadSettings() async{
    if (path == ""){
      path = await getExtDir();
      print("found path $path");
    }
    if (SDKVer == 0){
      SDKVer = await getSDKVer();
    }
    if (cachePath == ""){
      cachePath = await serviceHandler.getCacheDir();
    }
    if(Platform.isLinux){
      appMode = "Desktop";
    }
    File settingsFile = new File(path+"settings.conf");
    if (settingsFile.existsSync()){
      List<String> settings = settingsFile.readAsLinesSync();
      for (int i=0;i < settings.length; i++){
        switch(settings[i].split(" = ")[0]){
          case("Default Tags"):
            if (settings[i].split(" = ").length > 1){
              defTags = settings[i].split(" = ")[1];
              // print("Found Default Tags " + settings[i].split(" = ")[1]);
            }
            break;
          case("Limit"):
            if (settings[i].split(" = ").length > 1){
              limit = int.parse(settings[i].split(" = ")[1]);
              // print("Found Limit " + settings[i].split(" = ")[1] );
            }
            break;
          case("Preview Mode"):
            if (settings[i].split(" = ").length > 1){
              previewMode = settings[i].split(" = ")[1];
              // print("Found Preview Mode " + settings[i].split(" = ")[1] );
            }
            break;
          case("Portrait Columns"):
            if (settings[i].split(" = ").length > 1){
              portraitColumns = int.parse(settings[i].split(" = ")[1]);
              // print("Found Portrait Columns " + settings[i].split(" = ")[1] );
            }
            break;
          case("Landscape Columns"):
            if (settings[i].split(" = ").length > 1){
              landscapeColumns = int.parse(settings[i].split(" = ")[1]);
              // print("Found Landscape Columns " + settings[i].split(" = ")[1] );
            }
            break;
          case("Preload Count"):
            if (settings[i].split(" = ").length > 1){
              preloadCount = int.parse(settings[i].split(" = ")[1]);
              // print("Found Preload Count " + settings[i].split(" = ")[1] );
            }
            break;
          case("Write Json"):
            if (settings[i].split(" = ").length > 1){
              if (settings[i].split(" = ")[1] == "true"){
                jsonWrite = true;
              } else {
                jsonWrite = false;
              }
              // print("Found jsonWrite " + settings[i].split(" = ")[1] );
            }
            break;
          case("Auto Play"):
            if (settings[i].split(" = ").length > 1){
              if (settings[i].split(" = ")[1] == "true"){
                autoPlayEnabled = true;
              } else {
                autoPlayEnabled = false;
              }
              // print("Found Auto Play " + settings[i].split(" = ")[1] );
            }
            break;
          case("Loading Gif"):
            if (settings[i].split(" = ").length > 1){
              if (settings[i].split(" = ")[1] == "true"){
                loadingGif = true;
              } else {
                loadingGif = false;
              }
              // print("Found Loading gif " + settings[i].split(" = ")[1] );
            }
            break;
          case("Image Cache"):
            if (settings[i].split(" = ").length > 1){
              if (settings[i].split(" = ")[1] == "true"){
                imageCache = true;
              } else {
                imageCache = false;
              }
              // print("Found Image Cache " + settings[i].split(" = ")[1] );
            }
            break;
          case("Media Cache"):
            if (settings[i].split(" = ").length > 1){
              if (settings[i].split(" = ")[1] == "true"){
                mediaCache = true;
              } else {
                mediaCache = false;
              }
              // print("Found Image Cache " + settings[i].split(" = ")[1] );
            }
            break;
          case("Video Cache Mode"):
            if (settings[i].split(" = ").length > 1){
              videoCacheMode = settings[i].split(" = ")[1];
              // print("Found Video Cache Mode " + settings[i].split(" = ")[1] );
            }
            break;
          case("Share Action"):
            if (settings[i].split(" = ").length > 1){
              shareAction = settings[i].split(" = ")[1];
              // print("Found Share Action " + settings[i].split(" = ")[1] );
            }
            break;
          case("Pref Booru"):
            if (settings[i].split(" = ").length > 1){
              prefBooru = settings[i].split(" = ")[1];
              if(prefBooru.isEmpty){
                prefBooru = "";
              }
              // print("Found Pref Booru " + settings[i].split(" = ")[1] );
            }
            break;
          case ("Autohide Bar"):
            if (settings[i].split(" = ").length > 1){
              if (settings[i].split(" = ")[1] == "true"){
                autoHideImageBar = true;
              } else {
                autoHideImageBar = false;
              }
              // print("Auto hide image bar " + settings[i].split(" = ")[1] );
            }
            break;
          case("Snatch Cooldown"):
            if (settings[i].split(" = ").length > 1){
              snatchCooldown = int.parse(settings[i].split(" = ")[1]);
              // print("Found Snatch cooldown " + settings[i].split(" = ")[1] );
            }
            break;
          case ("Preview Display"):
            if (settings[i].split(" = ").length > 1){
              previewDisplay = settings[i].split(" = ")[1];
              // print("Found Preview Display Mode " + settings[i].split(" = ")[1] );
            }
            break;
          case ("Gallery Mode"):
            if (settings[i].split(" = ").length > 1){
              galleryMode = settings[i].split(" = ")[1];
              // print("Found Gallery Mode " + settings[i].split(" = ")[1] );
            }
            break;
          case ("Gallery Bar Position"):
            if (settings[i].split(" = ").length > 1){
              galleryBarPosition = settings[i].split(" = ")[1];
              // print("Found Gallery Bar Position " + settings[i].split(" = ")[1] );
            }
            break;
          case ("Gallery Scroll Direction"):
            if (settings[i].split(" = ").length > 1){
              galleryScrollDirection = settings[i].split(" = ")[1];
              // print("Found Gallery Scroll Direction " + settings[i].split(" = ")[1] );
            }
            break;
          case ("Enable Database"):
            if (settings[i].split(" = ").length > 1){
              if (settings[i].split(" = ")[1] == "true"){
                dbEnabled = true;
              } else {
                dbEnabled = false;
              }
              // print("Found dbEnabled " + settings[i].split(" = ")[1] );
            }
            break;
          case ("Search History"):
            if (settings[i].split(" = ").length > 1){
              if (settings[i].split(" = ")[1] == "true"){
                searchHistoryEnabled = true;
              } else {
                searchHistoryEnabled = false;
              }
              // print("Found searchHistoryEnabled " + settings[i].split(" = ")[1] );
            }
            break;
          case ("App Mode"):
            if (settings[i].split(" = ").length > 1){
              appMode = settings[i].split(" = ")[1];
              // print("App mode found " + settings[i].split(" = ")[1] );
            }
            break;
          case("Buttons Order"):
            if (settings[i].split(" = ").length > 1){
              buttonOrder = settings[i].split(" = ")[1].split(',').map((bstr) {
                List<String> button = buttonList.singleWhere((el) => el[0] == bstr, orElse: () => ['null', 'null']);
                return button;
              }).where((el) => el[0] != 'null').toList(); // split button names string, get their [name, label] list, filter all wrong values
              // print("Found Gallery Buttons Order " + settings[i].split(" = ")[1]);
            }
            break;
          case("Hated Tags"):
            if (settings[i].split(" = ").length > 1){
              hatedTags = cleanTagsList(settings[i].split(" = ")[1].split(','));
              // print("Found Hated Tags " + settings[i].split(" = ")[1]);
            }
            break;
          case ("Filter Hated"):
            if (settings[i].split(" = ").length > 1){
              if (settings[i].split(" = ")[1] == "true"){
                filterHated = true;
              } else {
                filterHated = false;
              }
              // print("Found filterHated " + settings[i].split(" = ")[1] );
            }
            break;
          case("Loved Tags"):
            if (settings[i].split(" = ").length > 1){
              lovedTags = cleanTagsList(settings[i].split(" = ")[1].split(','));
              // print("Found Loved Tags " + settings[i].split(" = ")[1]);
            }
            break;
          case ("Volume Buttons Scroll"):
            if (settings[i].split(" = ").length > 1){
              if (settings[i].split(" = ")[1] == "true"){
                useVolumeButtonsForScroll = true;
              } else {
                useVolumeButtonsForScroll = false;
              }
              // print("Found useVolumeButtonsForScroll " + settings[i].split(" = ")[1] );
            }
            break;
          case("Volume Buttons Scroll Speed"):
            if (settings[i].split(" = ").length > 1){
              volumeButtonsScrollSpeed = int.parse(settings[i].split(" = ")[1]);
              // print("Volume Buttons Scroll Speed " + settings[i].split(" = ")[1] );
            }
            break;
          case ("Shit Device"):
            if (settings[i].split(" = ").length > 1){
              if (settings[i].split(" = ")[1] == "true"){
                shitDevice = true;
              } else {
                shitDevice = false;
              }
            }
            break;
          case ("Disable Video"):
            if (settings[i].split(" = ").length > 1){
              if (settings[i].split(" = ")[1] == "true"){
                disableVideo = true;
              } else {
                disableVideo = false;
              }
            }
            break;
          case ("Ext Path"):
            if (settings[i].split(" = ").length > 1){
              extPathOverride = settings[i].split(" = ")[1];
            }
            break;
          case ("Gallery Auto Scroll"):
            if (settings[i].split(" = ").length > 1){
              galleryAutoScrollTime = int.parse(settings[i].split(" = ")[1]);
            }
            break;
        }
      }
    }
    if(dbEnabled){
      await dbHandler.dbConnect(path);
    } else {
      dbHandler = new DBHandler();
    }
    return true;
  }
  Map toJSON() {
    //Dont add prefbooru or appmode since,appmode will mess up syncing between desktop and mobile
    // prefbooru will mess up if the booru configs aren't synced
    return {
      "defTags": "$defTags",
      "previewMode": "$previewMode",
      "videoCacheMode": "$videoCacheMode",
      "previewDisplay": "$previewDisplay",
      "galleryMode": "$galleryMode",
      "shareAction" : "$shareAction",
      "limit" : "$limit",
      "portraitColumns" : "$portraitColumns",
      "landscapeColumns" : "$landscapeColumns",
      "preloadCount" : "$preloadCount",
      "snatchCooldown" : "$snatchCooldown",
      "galleryBarPosition" : "$galleryBarPosition",
      "galleryScrollDirection" : "$galleryScrollDirection",
      "buttonOrder": "${buttonOrder.map((e) => e[0]).join(',')}",
      "hatedTags": cleanTagsList(hatedTags),
      "lovedTags": cleanTagsList(lovedTags),
      "jsonWrite" : "${jsonWrite.toString()}",
      "autoPlayEnabled" : "${autoPlayEnabled.toString()}",
      "loadingGif" : "${loadingGif.toString()}",
      "imageCache" : "${imageCache.toString()}",
      "mediaCache": "${mediaCache.toString()}",
      "autoHideImageBar" : "${autoHideImageBar.toString()}",
      "dbEnabled" : "${dbEnabled.toString()}",
      "searchHistoryEnabled" : "${searchHistoryEnabled.toString()}",
      "filterHated" : "${filterHated.toString()}",
      "useVolumeButtonsForScroll" : "${useVolumeButtonsForScroll.toString()}",
      "volumeButtonsScrollSpeed" : "${volumeButtonsScrollSpeed.toString()}",
      "disableVideo" : "${disableVideo.toString()}",
      "shitDevice" : "${shitDevice.toString()}",
      "galleryAutoScrollTime" : "${galleryAutoScrollTime.toString()}",
    };
  }
  Future<bool> loadFromJSON(String jsonString) async{
    Map<String, dynamic> json = jsonDecode(jsonString);
    List<List<String>> btnOrder = json["buttonorder"].map((bstr) {
      List<String> button = buttonList.singleWhere((el) => el[0] == bstr, orElse: () => ['null', 'null']);
      return button;
    }).where((el) => el[0] != 'null').toList();
    buttonOrder = btnOrder;

    List hateTags = json["hatedTags"];
    List loveTags = json["lovedTags"];
    for (int i = 0; i < hateTags.length; i++){
        if (!hatedTags.contains(hateTags.elementAt(i))){
          hatedTags.add(hateTags.elementAt(i));
        }
    }
    for (int i = 0; i < loveTags.length; i++){
      if (!lovedTags.contains(loveTags.elementAt(i))){
        lovedTags.add(loveTags.elementAt(i));
      }
    }
    defTags = json["defTags"];
    previewMode = json["previewMode"];
    videoCacheMode = json["videoCacheMode"];
    previewDisplay = json["previewDisplay"];
    galleryMode = json["galleryMode"];
    shareAction = json["shareAction"];
    galleryBarPosition = json["galleryBarPosition"];
    galleryScrollDirection = json["galleryScrollDirection"];
    limit = int.parse(json["limit"]);
    portraitColumns = int.parse(json["portraitColumns"]);
    landscapeColumns = int.parse(json["landscapeColumns"]);
    preloadCount = int.parse(json["preloadCount"]);
    snatchCooldown = int.parse(json["snatchCooldown"]);
    jsonWrite = Tools.stringToBool(json["jsonWrite"]);
    autoPlayEnabled = Tools.stringToBool(json["autoPlayEnabled"]);
    loadingGif = Tools.stringToBool(json["loadingGif"]);
    imageCache = Tools.stringToBool(json["imageCache"]);
    mediaCache = Tools.stringToBool(json["mediaCache"]);
    autoHideImageBar = Tools.stringToBool(json["autoHideImageBar"]);
    dbEnabled = Tools.stringToBool(json["dbEnabled"]);
    searchHistoryEnabled = Tools.stringToBool(json["searchHistoryEnabled"]);
    filterHated = Tools.stringToBool(json["filterHated"]);
    useVolumeButtonsForScroll = Tools.stringToBool(json["useVolumeButtonsForScroll"]);
    volumeButtonsScrollSpeed = int.parse(json["volumeButtonsScrollSpeed"]);
    disableVideo = Tools.stringToBool(json["disableVideo"]);
    shitDevice = Tools.stringToBool(json["shitDevice"]);
    galleryAutoScrollTime = int.parse(json["galleryAutoScrollTime"]);
    print(toJSON());
    await saveSettings();
    return true;
  }

  Future<bool> saveSettings() async {
    await getPerms();
    if (path == ""){
     path = await getExtDir();
    }
    print("writing settings------------------------------------------------------------------------------------");
    await Directory(path).create(recursive:true);
    File settingsFile = new File(path+"settings.conf");
    var writer = settingsFile.openWrite();

    writer.write("Default Tags = $defTags\n");
    this.defTags = defTags;

    writer.write("Buttons Order = ${buttonOrder.map((e) => e[0]).join(',')}\n");
    this.buttonOrder = buttonOrder;

    writer.write("Hated Tags = ${cleanTagsList(hatedTags).join(',')}\n");
    this.hatedTags = hatedTags;

    writer.write("Filter Hated = $filterHated\n");

    writer.write("Loved Tags = ${cleanTagsList(lovedTags).join(',')}\n");
    this.lovedTags = lovedTags;

    writer.write("Volume Buttons Scroll = $useVolumeButtonsForScroll\n");
    writer.write("Volume Buttons Scroll Speed = $volumeButtonsScrollSpeed\n");

    // Write limit if its between 0-100
    if (limit <= 100 && limit >= 5){
      writer.write("Limit = $limit\n");
    } else {
      // Close writer and alert user
      writer.write("Limit = 20\n");
      ServiceHandler.displayToast("Settings Error \n $limit is not a valid Limit amount, Defaulting to 20");
      //Get.snackbar("Settings Error","$limit is not a valid Limit",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context!.theme.primaryColor);
    }
    writer.write("Landscape Columns = $landscapeColumns\n");
    writer.write("Portrait Columns = $portraitColumns\n");
    writer.write("Preview Mode = $previewMode\n");
    writer.write("Preload Count = $preloadCount\n");
    writer.write("Write Json = $jsonWrite\n");
    writer.write("Pref Booru = $prefBooru\n");
    writer.write("Auto Play = $autoPlayEnabled\n");
    writer.write("Loading Gif = $loadingGif\n");
    writer.write("Image Cache = $imageCache\n");
    writer.write("Media Cache = $mediaCache\n");
    writer.write("Video Cache Mode = $videoCacheMode\n");
    writer.write("Share Action = $shareAction\n");
    writer.write("Autohide Bar = $autoHideImageBar\n");
    writer.write("Snatch Cooldown = $snatchCooldown\n");
    writer.write("Preview Display = $previewDisplay\n");
    writer.write("Gallery Mode = $galleryMode\n");
    writer.write("Gallery Bar Position = $galleryBarPosition\n");
    writer.write("Gallery Scroll Direction = $galleryScrollDirection\n");
    writer.write("Enable Database = $dbEnabled\n");
    writer.write("Search History = $searchHistoryEnabled\n");
    writer.write("App Mode = $appMode\n");
    writer.write("Shit Device = $shitDevice\n");
    writer.write("Disable Video = $disableVideo\n");
    writer.write("Ext Path = $extPathOverride\n");
    writer.write("Gallery Auto Scroll = $galleryAutoScrollTime\n");
    writer.close();
    ServiceHandler.displayToast("Settings Saved!\nSome changes may not take effect until the search is refreshed or the app is restarted");
    //Get.snackbar("Settings Saved!","Some changes may not take effect until the search is refreshed or the app is restarted",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context!.theme.primaryColor);
    return true;
  }

  Future<bool> getBooru() async{
    booruList = [];
    print("in getBooru");
    int prefIndex = 0;
    try {
      if (path == ""){
        path = await getExtDir();
      }
      var directory = new Directory(path);
      List files = directory.listSync();
      if (files.length > 0) {
        for (int i = 0; i < files.length; i++) {
          if (files[i].path.contains(".booru")) {
            print(files[i].toString());
            booruList.add(Booru.fromFile(files[i]));
            if (booruList.last.type == "Hydrus"){
              hasHydrus = true;
            }
          }
        }
      }
      if (dbEnabled && booruList.isNotEmpty){
        booruList.add(new Booru("Favourites", "Favourites", "", "", ""));
      }
      if (prefBooru != "" && booruList.isNotEmpty){
        booruList = await sortList();
      } else{
        print("NOT SORTING ===============");
        print(prefBooru);
        print(booruList.isNotEmpty);
      }
    } catch (e){
      print(e);
    }
    return true;
  }
  Future<List<Booru>> sortList() async{
    List<Booru> sorted = booruList;
    booruList.sort((a, b) {
      // sort alphabetically
      return a.name!.toLowerCase().compareTo(b.name!.toLowerCase());
    });

    int prefIndex = 0;
    for (int i = 0; i < sorted.length; i++){
      if (sorted[i].name == prefBooru){
        prefIndex = i;
        print("prefIndex is" + prefIndex.toString());
      }
    }
    if (prefIndex != 0){
      // move default booru to top
      // print("Booru pref found in booruList");
      Booru tmp = sorted.elementAt(prefIndex);
      sorted.remove(tmp);
      sorted.insert(0, tmp);
      // print("booruList is");
      // print(sorted);
    }

    int favsIndex = sorted.indexWhere((el) => el.type == 'Favourites');
    if(favsIndex != -1) {
      // move favourites to the end
      Booru tmp = sorted.elementAt(favsIndex);
      sorted.remove(tmp);
      sorted.add(tmp);
    }
    return sorted;
  }
  Future saveBooru(Booru booru) async{
    if (path == ""){
      path = await getExtDir();
    }
    await Directory(path).create(recursive:true);
    File booruFile = new File(path+"${booru.name}.booru");
    var writer = booruFile.openWrite();
    writer.write("Booru Name = ${booru.name}\n");
    writer.write("Booru Type = ${booru.type}\n");
    writer.write("Favicon URL = ${booru.faviconURL}\n");
    writer.write("Base URL = ${booru.baseURL}\n");
    writer.write("API Key = ${booru.apiKey}\n");
    writer.write("User ID = ${booru.userID}\n");
    writer.write("Default Tags = ${booru.defTags}\n");
    writer.close();
    booruList.add(booru);
    return true;
  }
  bool deleteBooru(Booru booru){
    File booruFile = File(path+"${booru.name}.booru");
    booruFile.deleteSync();
    if (prefBooru == booru.name){
      prefBooru = "";
      saveSettings();
    }
    booruList.remove(booru);
    return true;
  }

  List<List<String>> parseTagsList(List<String> itemTags, {bool isCapped = true}) {
    List<String> cleanItemTags = cleanTagsList(itemTags);
    List<String> hatedInItem = this.hatedTags.where((tag) => cleanItemTags.contains(tag)).toList();
    List<String> lovedInItem = this.lovedTags.where((tag) => cleanItemTags.contains(tag)).toList();
    List<String> soundInItem = ['sound', 'sound_edit', 'has_audio', 'voice_acted'].where((tag) => cleanItemTags.contains(tag)).toList();
    // TODO add more sound tags?

    if(isCapped) {
      if(hatedInItem.length > 5) {
        hatedInItem = [...hatedInItem.take(5), '...'];
      }
      if(lovedInItem.length > 5) {
        lovedInItem = [...lovedInItem.take(5), '...'];
      }
    }

    return [hatedInItem, lovedInItem, soundInItem];
  }

  List<String> cleanTagsList(List<String> tags) {
    return tags.where((tag) => tag != "").map((tag) => tag.trim().toLowerCase()).toList();
  }

  Future<String> getExtDir() async{
    String path = "";
    if (Platform.isAndroid){
      path = await serviceHandler.getExtDir() + "/LoliSnatcher/config/";
    } else if (Platform.isLinux){
      path = Platform.environment['HOME']! + "/.loliSnatcher/config/";
    } else if (Platform.isWindows) {
      path = Platform.environment['LOCALAPPDATA']! + "/LoliSnatcher/config/";
    }
    return path;
  }
  Future getSDKVer() async{
    if (Platform.isAndroid){
      return await serviceHandler.getSDKVersion();
    } else if (Platform.isLinux){
      return 1;
    } else if (Platform.isWindows) {
      return 2;
    } else {
      return -1;
    }
  }
  Future getDocumentsDir() async{
    if (Platform.isAndroid){
      return await serviceHandler.getDocumentsDir() + "/LoliSnatcher/config/";
    } else if (Platform.isLinux){
      return Platform.environment['HOME']! + "/.loliSnatcher/config/";
    } else if (Platform.isWindows) {
      path = Platform.environment['LOCALAPPDATA']! + "/LoliSnatcher/config/";
    }
  }
  Future<bool> initialize() async{
    await getPerms();
    await loadSettings();
    if (booruList.isEmpty){
      await getBooru();
    }
    return true;
  }
}