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
  String defTags = "rating:safe",previewMode = "Sample";
  int limit = 20, portraitColumns = 2,landscapeColumns = 4;
  List<Booru> booruList;
  var path = "";
  Future writeDefaults() async{
    if (Platform.isAndroid){
      path = await serviceHandler.getExtDir() + "/LoliSnatcher/config/";
    } else if (Platform.isLinux){
      path = Platform.environment['HOME'] + "/.loliSnatcher/config/";
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
    if (Platform.isAndroid){
      path = await serviceHandler.getExtDir() + "/LoliSnatcher/config/";
    } else if (Platform.isLinux){
      path = Platform.environment['HOME'] + "/.loliSnatcher/config/";
    }
    File settingsFile = new File(path+"settings.conf");
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
      }
    }
    return true;
  }
  //to-do: Change to scoped storage to be compliant with googles new rules https://www.androidcentral.com/what-scoped-storage
  void saveSettings(String defTags, String limit, String previewMode, String portraitColumns, String landscapeColumns) async{
    if (Platform.isAndroid){
      path = await serviceHandler.getExtDir() + "/LoliSnatcher/config/";
    } else if (Platform.isLinux){
      path = Platform.environment['HOME'] + "/.loliSnatcher/config/";
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
    writer.close();
    await this.loadSettings();
    Get.snackbar("Settings Saved!","Some changes may not take effect until the app is restarted",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Colors.pink[200]);
  }
  Future getBooru() async{
    booruList = ([new Booru("Gelbooru","Gelbooru","https://gelbooru.com/favicon.ico","https://gelbooru.com/","")]);
    try {
      if (Platform.isAndroid){
        path = await serviceHandler.getExtDir() + "/LoliSnatcher/config/";
      } else if (Platform.isLinux){
        path = Platform.environment['HOME'] + "/.loliSnatcher/config/";
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
    } catch (e){
      print(e);
    }

    return true;
  }
  Future saveBooru(Booru booru) async{
    if (Platform.isAndroid){
      path = await serviceHandler.getExtDir() + "/LoliSnatcher/config/";
    } else if (Platform.isLinux){
      path = Platform.environment['HOME'] + "/.loliSnatcher/config/";
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
    return true;
  }
}