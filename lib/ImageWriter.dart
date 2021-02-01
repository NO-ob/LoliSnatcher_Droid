import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'libBooru/BooruItem.dart';
import 'ServiceHandler.dart';
import 'dart:convert';
class ImageWriter{
  String path = "";
  String cachePath = "";
  ServiceHandler serviceHandler = new ServiceHandler();
  int SDKVer = 0;
  /**
   * return null - file already exists
   * return String - file saved
   * return Error - something went wrong
   */
  Future write(BooruItem item, bool jsonWrite, String booruName) async{
    int queryLastIndex = item.fileURL.lastIndexOf("?");
    int lastIndex = queryLastIndex != -1 ? queryLastIndex : item.fileURL.length;
    String fileName = booruName + '_' + item.fileURL.substring(item.fileURL.lastIndexOf("/") + 1, lastIndex);
    // print(fileName);

    if(path == ""){
      if (Platform.isAndroid){
        path = await serviceHandler.getExtDir() + "/Pictures/LoliSnatcher/";
      } else if (Platform.isLinux){
        path = Platform.environment['HOME'] + "/Pictures/LoliSnatcher/";
      }
    }
    if(SDKVer == 0){
      if (Platform.isAndroid){
        SDKVer = await serviceHandler.getSDKVersion();
        print(SDKVer);
      } else if (Platform.isLinux){
        SDKVer = 1;
      }
    }

    // Don't do anything if file already exists
    File image = new File(path+fileName);
    bool fileExists = await image.exists();
    if(fileExists) return null;

    try {
      var response = await http.get(item.fileURL);
      if(SDKVer < 30){
        await Directory(path).create(recursive:true);
        await image.writeAsBytes(response.bodyBytes);
        print("Image written: " + path+fileName);
        if (jsonWrite){
          File json = new File(path+fileName.split(".")[0]+".json");
          await json.writeAsString(jsonEncode(item.toJSON()));
        }
        try {
          serviceHandler.callMediaScanner(image.path);
        } catch (e){
          print("Image not found");
          return e;
        }
      } else {
        print("files ext is " + item.fileExt);
        if (item.fileExt.toUpperCase() == "PNG" || item.fileExt.toUpperCase() == "JPEG" || item.fileExt.toUpperCase() == "JPG"){
          var writeResp = await serviceHandler.writeImage(response.bodyBytes,fileName.split(".")[0],"image", item.fileExt);
          if (writeResp != null){
            print("write response: $writeResp");
            return (fileName);
          }
        } else {
          Get.snackbar("File write error","Only jpg and png can be saved on android 11 currently",snackPosition: SnackPosition.BOTTOM,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Colors.pink[200]);
          return 0;
        }

      }
    } catch (e){
      print("Image Writer Exception");
      print(e);
      return e;
    }
    return (fileName);
  }

  Stream<int> writeMultiple (List<BooruItem> snatched, bool jsonWrite, String booruName) async*{
    int snatchedCounter = 1;
    for (int i = 0; i < snatched.length ; i++){
      yield snatchedCounter++;
      await write(snatched.elementAt(i), jsonWrite, booruName);
    }
    Get.snackbar("Snatching Complete","¡¡¡( •̀ ᴗ •́ )و!!!",snackPosition: SnackPosition.BOTTOM,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Colors.pink[200]);
  }

  Future writeCache(String fileURL, String typeFolder) async{
    try {
      var response = await http.get(fileURL);
      if(cachePath == ""){
        if (Platform.isAndroid){
          cachePath = await serviceHandler.getCacheDir() + typeFolder + "/";
        } else if (Platform.isLinux){
          cachePath = Platform.environment['HOME'] + "/.loliSnatcher/cache/$typeFolder/";
        }
      }
      await Directory(cachePath).create(recursive:true);
      String fileName = fileURL.substring(fileURL.lastIndexOf("/") + 1);
      File image = new File(cachePath+fileName);
      await image.writeAsBytes(response.bodyBytes);
    } catch (e){
      print("Image Writer Exception:: cache write");
      print(e);
    }
    return (cachePath+fileURL.substring(fileURL.lastIndexOf("/") + 1));
  }

  Future getCachePath(String fileURL, String typeFolder) async{
    try {
      if(cachePath == ""){
        if (Platform.isAndroid){
          cachePath = await serviceHandler.getCacheDir() + typeFolder + "/";
        } else if (Platform.isLinux){
          cachePath = Platform.environment['HOME'] + "/.loliSnatcher/cache/$typeFolder/";
        }
      }
      String fileName = fileURL.substring(fileURL.lastIndexOf("/") + 1);
      bool fileExists = await File(cachePath+fileName).exists();
      if (fileExists){
        return cachePath+fileName;
      } else {
        return null;
      }
    } catch (e){
      print("Image Writer Exception");
      print(e);
      return null;
    }
  }
}