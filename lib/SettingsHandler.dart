import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';

import 'ServiceHandler.dart';
import 'package:get/get.dart';
import 'libBooru/Booru.dart';
import 'dart:io' show Platform;
/**
 * This class is used loading from and writing settings to files
 */
class SettingsHandler {
  ServiceHandler serviceHandler = new ServiceHandler();
  String defTags = "rating:safe",previewMode = "Sample",prefBooru = "";
  int limit = 20, portraitColumns = 2,landscapeColumns = 4, preloadCount = 2;
  List<Booru> booruList = new List<Booru>();
  var path = "";
  bool jsonWrite = false, autoPlayEnabled = true, loadingGif = false, imageCache = false;
  Future writeDefaults() async{
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
      writer.close;
    }
    return true;
  }

  Future loadSettings() async{
    if (path == ""){
      path = await getExtDir();
    }
    //await getBooru();
    File settingsFile = new File(path+"settings.conf");
    if (settingsFile.existsSync()){
      List<String> settings = settingsFile.readAsLinesSync();
      for (int i=0;i < settings.length; i++){
        switch(settings[i].split(" = ")[0]){
          case("Default Tags"):
            if (settings[i].split(" = ").length > 1){
              defTags = settings[i].split(" = ")[1];
              print("Found Default Tags " + settings[i].split(" = ")[1]);
            }
            break;
          case("Limit"):
            if (settings[i].split(" = ").length > 1){
              limit = int.parse(settings[i].split(" = ")[1]);
              print("Found Limit " + settings[i].split(" = ")[1] );
            }
            break;
          case("Preview Mode"):
            if (settings[i].split(" = ").length > 1){
              previewMode = settings[i].split(" = ")[1];
              print("Found Preview Mode " + settings[i].split(" = ")[1] );
            }
            break;
          case("Portrait Columns"):
            if (settings[i].split(" = ").length > 1){
              portraitColumns = int.parse(settings[i].split(" = ")[1]);
              print("Found Portrait Columns " + settings[i].split(" = ")[1] );
            }
            break;
          case("Landscape Columns"):
            if (settings[i].split(" = ").length > 1){
              landscapeColumns = int.parse(settings[i].split(" = ")[1]);
              print("Found Landscape Columns " + settings[i].split(" = ")[1] );
            }
            break;
          case("Preload Count"):
            if (settings[i].split(" = ").length > 1){
              preloadCount = int.parse(settings[i].split(" = ")[1]);
              print("Found Preload Count " + settings[i].split(" = ")[1] );
            }
            break;
          case("Write Json"):
            if (settings[i].split(" = ").length > 1){
              if (settings[i].split(" = ")[1] == "true"){
                jsonWrite = true;
              } else {
                jsonWrite = false;
              }
              print("Found jsonWrite " + settings[i].split(" = ")[1] );
            }
            break;
          case("Auto Play"):
            if (settings[i].split(" = ").length > 1){
              if (settings[i].split(" = ")[1] == "true"){
                autoPlayEnabled = true;
              } else {
                autoPlayEnabled = false;
              }
              print("Found Auto Play " + settings[i].split(" = ")[1] );
            }
            break;
          case("Loading Gif"):
            if (settings[i].split(" = ").length > 1){
              if (settings[i].split(" = ")[1] == "true"){
                loadingGif = true;
              } else {
                loadingGif = false;
              }
              print("Found Loading gif " + settings[i].split(" = ")[1] );
            }
            break;
          case("Image Cache"):
            if (settings[i].split(" = ").length > 1){
              if (settings[i].split(" = ")[1] == "true"){
                imageCache = true;
              } else {
                imageCache = false;
              }
              print("Found Image Cache " + settings[i].split(" = ")[1] );
            }
            break;
          case("Pref Booru"):
            if (settings[i].split(" = ").length > 1){
              prefBooru = settings[i].split(" = ")[1];
              print("Found Pref Booru " + settings[i].split(" = ")[1] );
            }
            break;
        }
      }
    }

    return true;
  }
  //to-do: Change to scoped storage to be compliant with googles new rules https://www.androidcentral.com/what-scoped-storage
  void saveSettings(String defTags, String limit, String previewMode, String portraitColumns, String landscapeColumns, String preloadCount,bool jsonWrite, String prefBooru, bool autoPlay, bool loadingGif, bool imageCache) async{
    if (path == ""){
     path = await getExtDir();
    }
    await Directory(path).create(recursive:true);
    File settingsFile = new File(path+"settings.conf");
    var writer = settingsFile.openWrite();
    writer.write("Default Tags = $defTags\n");
    this.defTags = defTags;
    if (limit != ""){
      // Write limit if it between 0-100
      if (int.parse(limit) <= 100 && int.parse(limit) > 0){
        await writer.write("Limit = ${int.parse(limit)}\n");
        this.limit = int.parse(limit);
      } else {
        // Close writer and alert user
        writer.close();
        Get.snackbar("Settings Error","$limit is not a valid Limit",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Colors.pink[200]);
        return;
      }
    }
    writer.write("Landscape Columns = $landscapeColumns\n");
    this.landscapeColumns = int.parse(landscapeColumns);
    writer.write("Portrait Columns = $portraitColumns\n");
    this.portraitColumns = int.parse(portraitColumns);
    writer.write("Preview Mode = $previewMode\n");
    this.previewMode = previewMode;
    writer.write("Preload Count = $preloadCount\n");
    this.preloadCount = int.parse(preloadCount);
    writer.write("Write Json = $jsonWrite\n");
    this.jsonWrite = jsonWrite;
    writer.write("Pref Booru = $prefBooru\n");
    this.prefBooru = prefBooru;
    writer.write("Auto Play = $autoPlay\n");
    this.autoPlayEnabled = autoPlay;
    writer.write("Loading Gif = $loadingGif\n");
    this.loadingGif = loadingGif;
    writer.write("Image Cache = $imageCache\n");
    this.imageCache = imageCache;
    writer.close();
    await this.loadSettings();
    await getBooru();
    Get.snackbar("Settings Saved!","Some changes may not take effect until the app is restarted",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Colors.pink[200]);
  }
  Future getBooru() async{
    booruList = new List<Booru>();
    print("in getBooru");
    int prefIndex = 0;
    try {
      if (path == ""){
        path = await getExtDir();
      }
      var directory = new Directory(path);
      List files = directory.listSync();
      if (files != null) {
        for (int i = 0; i < files.length; i++) {
          if (files[i].path.contains(".booru")) {
            print(files[i].toString());
            booruList.add(Booru.fromFile(files[i]));
          }
        }
      }
      if (prefBooru != ""){
        int prefIndex = booruList.indexWhere((booru)=>booru.name == prefBooru);
        if (prefIndex != 0){
          print("Booru pref found in booruList");
          Booru tmp = booruList.elementAt(0);
          Booru tmp2 = booruList.elementAt(prefIndex);
          booruList.remove(tmp);
          booruList.remove(tmp2);
          booruList.insert(0, tmp2);
          booruList.insert(prefIndex, tmp);
          print(booruList);
        }
      }
    } catch (e){
      print(e);
    }

    return true;
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
    booruList.remove(booru);
    return true;
  }

  Future getExtDir() async{
    if (Platform.isAndroid){
      return await serviceHandler.getExtDir() + "/LoliSnatcher/config/";
    } else if (Platform.isLinux){
      return Platform.environment['HOME'] + "/.loliSnatcher/config/";
    }
  }
}