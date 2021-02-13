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
  String cacheRootPath = "";
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

    await setPaths();

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
        //if (item.fileExt.toUpperCase() == "PNG" || item.fileExt.toUpperCase() == "JPEG" || item.fileExt.toUpperCase() == "JPG"){
          var writeResp = await serviceHandler.writeImage(response.bodyBytes, fileName.split(".")[0], item.mediaType, item.fileExt);
          if (writeResp != null){
            print("write response: $writeResp");
            return (fileName);
          }
        //} else {
         // Get.snackbar("File write error","Only jpg and png can be saved on android 11 currently",snackPosition: SnackPosition.BOTTOM,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context.theme.primaryColor);
         // return 0;
        //}

      }
    } catch (e){
      print("Image Writer Exception");
      print(e);
      return e;
    }
    return (fileName);
  }

  Stream<int> writeMultiple (List<BooruItem> snatched, bool jsonWrite, String booruName, int cooldown) async*{
    int snatchedCounter = 1;
    List<String> existsList = new List();
    List<String> failedList = new List();
    for (int i = 0; i < snatched.length ; i++){
      await Future.delayed(Duration(milliseconds: cooldown), () async{
        var snatchResult = await write(snatched.elementAt(i), jsonWrite, booruName);
        if (snatchResult == null){
        existsList.add(snatched[i].fileURL);
        } else if (snatchResult is !String) {
        failedList.add(snatched[i].fileURL);
        }
      });
      yield snatchedCounter++;
    }
    Get.snackbar("Snatching Complete","¡¡¡( •̀ ᴗ •́ )و!!!",snackPosition: SnackPosition.BOTTOM,duration: Duration(seconds: 2),colorText: Colors.black, backgroundColor: Get.context.theme.primaryColor);
    if (existsList.length > 0){
      Get.snackbar("Some files were already snatched!", "File Count: ${existsList.length}", snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: Colors.black, backgroundColor: Get.context.theme.primaryColor);
    }
    if (failedList.length > 0){
      Get.snackbar("Snatching failed for some files! ", "File Count: ${failedList.length}", snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: Colors.white, backgroundColor: Colors.red);
    }

  }

  Future writeCache(String fileURL, String typeFolder) async{
    String cachePath;
    try {
      var response = await http.get(fileURL);
      await setPaths();
      cachePath = cacheRootPath + typeFolder + "/";
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

  Future writeCacheFromBytes(String fileURL, List<int> bytes, String typeFolder) async{
    File image;
    String cachePath;
    try {
      await setPaths();
      cachePath = cacheRootPath + typeFolder + "/";
      await Directory(cachePath).create(recursive:true);

      String fileName = fileURL.substring(fileURL.lastIndexOf("/") + 1);
      image = new File(cachePath+fileName);
      await image.writeAsBytes(bytes);
    } catch (e){
      print("Image Writer Exception:: cache write");
      print(e);
      return null;
    }
    return image;
  }

  Future getCachePath(String fileURL, String typeFolder) async{
    String cachePath;
    try {
      await setPaths();
      cachePath = cacheRootPath + typeFolder + "/";
      print(cachePath);

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


  void setPaths() async {
    if(path == ""){
      if (Platform.isAndroid){
        path = await serviceHandler.getExtDir() + "/Pictures/LoliSnatcher/";
      } else if (Platform.isLinux){
        path = Platform.environment['HOME'] + "/Pictures/LoliSnatcher/";
      }
    }

    if(cacheRootPath == ""){
      if (Platform.isAndroid){
        cacheRootPath = await serviceHandler.getCacheDir();
      } else if (Platform.isLinux){
        cacheRootPath = Platform.environment['HOME'] + "/.loliSnatcher/cache/";
      }
    }

    return;
  }
}