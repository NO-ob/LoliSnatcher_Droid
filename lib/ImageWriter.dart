import 'dart:io';
import 'dart:async';
import 'dart:convert';
// import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';

import 'libBooru/Booru.dart';

// move writing to separate thread, so the app won't hang while it saves - Leads to memory leak!
// Future<void> writeBytesIsolate(Map<String, dynamic> map) async {
//   await map['file'].writeAsBytes(map['bytes']);
//   return;
// }

class ImageWriter{
  String? path = "";
  String? cacheRootPath = "";
  ServiceHandler serviceHandler = new ServiceHandler();
  int SDKVer = 0;
  /**
   * return null - file already exists
   * return String - file saved
   * return Error - something went wrong
   */
  Future write(BooruItem item, SettingsHandler settingsHandler, Booru booru) async{
    int queryLastIndex = item.fileURL.lastIndexOf("?");
    int lastIndex = queryLastIndex != -1 ? queryLastIndex : item.fileURL.length;
    String fileName = "";
    if (booru.type == ("BooruOnRails") || booru.type == "Philomena"){
      fileName = booru.name! + '_' + item.serverId! + "." + item.fileExt!;
    } else if (booru.type == "Hydrus"){
      fileName = "Hydrus_${item.md5String}.${item.fileExt}";
    }
    else{
      fileName = booru.name! + '_' + item.fileURL.substring(item.fileURL.lastIndexOf("/") + 1, lastIndex);
    }
    print("out file is $fileName");
    // print(fileName);
    await setPaths(settingsHandler);

    if(SDKVer == 0){
      if (Platform.isAndroid){
        SDKVer = await serviceHandler.getSDKVersion();
        print(SDKVer);
      } else if (Platform.isLinux){
        SDKVer = 1;
      } else if (Platform.isWindows){
        SDKVer = 2;
      }
    }

    // Don't do anything if file already exists
    File image = new File(path!+fileName);
    bool fileExists = await image.exists();
    if(fileExists || item.isSnatched) return null;
    try {
      Uri fileURI = Uri.parse(item.fileURL);
      var response = await http.get(fileURI);
      if(SDKVer < 30){
        await Directory(path!).create(recursive:true);
        await image.writeAsBytes(response.bodyBytes, flush: true);
        print("Image written: " + path!+fileName);
        if (settingsHandler.jsonWrite){
          File json = new File(path!+fileName.split(".")[0]+".json");
          await json.writeAsString(jsonEncode(item.toJSON()), flush: true);
        }
        item.isSnatched = true;
        if (settingsHandler.dbEnabled){
          settingsHandler.dbHandler.updateBooruItem(item,"local");
        }
        try {
          if(Platform.isAndroid){
            serviceHandler.callMediaScanner(image.path);
          }
        } catch (e){
          print("Image not found");
          return e;
        }
      } else {
        print("files ext is " + item.fileExt!);
        //if (item.fileExt.toUpperCase() == "PNG" || item.fileExt.toUpperCase() == "JPEG" || item.fileExt.toUpperCase() == "JPG"){
          var writeResp = await serviceHandler.writeImage(response.bodyBytes, fileName.split(".")[0], item.mediaType, item.fileExt);
          if (writeResp != null){
            print("write response: $writeResp");
            item.isSnatched = true;
            if (settingsHandler.dbEnabled){
              settingsHandler.dbHandler.updateBooruItem(item,"local");
            }
            return (fileName);
          }
        //} else {
         // Get.snackbar("File write error","Only jpg and png can be saved on android 11 currently",snackPosition: SnackPosition.BOTTOM,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context!.theme.primaryColor);
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

  Stream<int> writeMultiple (List<BooruItem> snatched, SettingsHandler settingsHandler, Booru booru, int cooldown) async*{
    int snatchedCounter = 1;
    List<String> existsList = [];
    List<String> failedList = [];
    for (int i = 0; i < snatched.length ; i++){
      await Future.delayed(Duration(milliseconds: cooldown), () async{
        var snatchResult = await write(snatched.elementAt(i), settingsHandler, booru);
        if (snatchResult == null){
          existsList.add(snatched[i].fileURL);
        } else if (snatchResult is !String) {
          failedList.add(snatched[i].fileURL);
        }
      });
      yield snatchedCounter++;
    }
    String toastString = "Snatching Complete ¡¡¡( •̀ ᴗ •́ )و!!! \n";
    //Get.snackbar("Snatching Complete","¡¡¡( •̀ ᴗ •́ )و!!!",snackPosition: SnackPosition.BOTTOM,duration: Duration(seconds: 2),colorText: Colors.black, backgroundColor: Get.context!.theme.primaryColor);
    if (existsList.length > 0){
      toastString += "Some files were already snatched! \n File Count: ${existsList.length} \n";
      //Get.snackbar("Some files were already snatched!", "File Count: ${existsList.length}", snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: Colors.black, backgroundColor: Get.context!.theme.primaryColor);
    }
    if (failedList.length > 0){
      toastString += "Snatching failed for some files!  \n File Count: ${failedList.length} \n";
      //Get.snackbar("Snatching failed for some files! ", "File Count: ${failedList.length}", snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: Colors.white, backgroundColor: Colors.red);
    }
    ServiceHandler.displayToast(toastString);
  }

  Future writeCache(String fileURL, String typeFolder,SettingsHandler settingsHandler) async{
    String? cachePath;
    Uri fileURI = Uri.parse(fileURL);
    try {
      var response = await http.get(fileURI);
      await setPaths(settingsHandler);
      cachePath = cacheRootPath! + typeFolder + "/";
      await Directory(cachePath).create(recursive:true);

      String fileName = parseThumbUrlToName(fileURL);
      File image = new File(cachePath+fileName);
      await image.writeAsBytes(response.bodyBytes, flush: true);
    } catch (e){
      print("Image Writer Exception:: cache write");
      print(e);
    }
    return (cachePath!+fileURL.substring(fileURL.lastIndexOf("/") + 1));
  }

  Future<File?> writeCacheFromBytes(String fileURL, List<int> bytes, String typeFolder, SettingsHandler settingsHandler) async{
    File? image;
    String cachePath;
    try {
      await setPaths(settingsHandler);
      cachePath = cacheRootPath! + typeFolder + "/";
      // print("write cahce from bytes:: cache path is $cachePath");
      await Directory(cachePath).create(recursive:true);

      String fileName = parseThumbUrlToName(fileURL);
      image = new File(cachePath+fileName);
      await image.writeAsBytes(bytes, flush: true);

      // move writing to separate thread, so the app won't hang while it saves - Leads to memory leak!
      // await compute(writeBytesIsolate, {"file": image, "bytes": bytes});
    } catch (e){
      print("Image Writer Exception:: cache write");
      print(e);
      return null;
    }
    return image;
  }

  // Deletes file from given cache folder
  // returns true if successful, false if there was an exception and null if file didn't exist
  Future deleteFromCache(String fileURL, String typeFolder, SettingsHandler settingsHandler) async{
    File file;
    String cachePath;
    try {
      await setPaths(settingsHandler);
      cachePath = cacheRootPath! + typeFolder + "/";

      String fileName = parseThumbUrlToName(fileURL);
      bool fileExists = await File(cachePath+fileName).exists();
      if (fileExists){
        file = new File(cachePath+fileName);
        file.delete();
        return true;
      } else {
        return null;
      }
    } catch (e){
      print("Image Writer Exception");
      print(e);
      return false;
    }
  }

  Future<String?> getCachePath(String fileURL, String typeFolder, SettingsHandler settingsHandler) async{
    String cachePath;
    try {
      await setPaths(settingsHandler);
      cachePath = cacheRootPath! + typeFolder + "/";

      String fileName = parseThumbUrlToName(fileURL);
      File cacheFile = File(cachePath+fileName);
      bool fileExists = await cacheFile.exists();
      bool fileIsNotEmpty = (await cacheFile.stat()).size > 0;
      if (fileExists){
        if(fileIsNotEmpty) {
          return cachePath+fileName;
        } else {
          // somehow some files can save with zero bytes - we remove them
          cacheFile.delete();
          return null;
        }
      } else {
        return null;
      }
    } catch (e){
      print("Image Writer Exception");
      print(e);
      return null;
    }
  }

  // calculates cache (total or by type) size and file count
  Future<Map<String,int>> getCacheStat(String? typeFolder, SettingsHandler settingsHandler) async {
    String cacheDirPath;
    int fileNum = 0;
    int totalSize = 0;
    if(typeFolder == null) typeFolder = '';
    try {
      await setPaths(settingsHandler);
      cacheDirPath = cacheRootPath! + typeFolder + "/";

      Directory cacheDir = Directory(cacheDirPath);
      bool dirExists = await cacheDir.exists();
      if (dirExists) {
        cacheDir.listSync(recursive: true, followLinks: false)
          .forEach((FileSystemEntity entity) {
            if (entity is File) {
              fileNum++;
              totalSize += entity.lengthSync();
            }
          });
      }
    } catch (e){
      print("Image Writer Exception");
      print(e);
    }

    return {'fileNum': fileNum, 'totalSize': totalSize};
  }

  String parseThumbUrlToName(thumbURL) {
    int queryLastIndex = thumbURL.lastIndexOf("?"); // Sankaku fix
    int lastIndex = queryLastIndex != -1 ? queryLastIndex : thumbURL.length;
    String result = thumbURL.substring(thumbURL.lastIndexOf("/") + 1, lastIndex);
    if(result.startsWith('thumb.')) { //Paheal/shimmie(?) fix
      String unthumbedURL = thumbURL.replaceAll('/thumb', '');
      result = unthumbedURL.substring(unthumbedURL.lastIndexOf("/") + 1);
    }
    return result;
  }

  Future<bool> setPaths(SettingsHandler settingsHandler) async{
    if(path == ""){
      if (settingsHandler.extPathOverride.isEmpty){
        if (Platform.isAndroid){
          path = await serviceHandler.getExtDir() + "/Pictures/LoliSnatcher/";
        } else if (Platform.isLinux){
          path = "${Platform.environment['HOME']}/Pictures/LoliSnatcher/";
        } else if (Platform.isWindows){
          path = "${Platform.environment['LOCALAPPDATA']}/LoliSnatcher/Pictures/";
        }
      } else {
        path = settingsHandler.extPathOverride;
      }


    }

    if(cacheRootPath == ""){
      if (Platform.isAndroid){
        cacheRootPath = await serviceHandler.getCacheDir();
      } else if (Platform.isLinux){
        cacheRootPath =  "${Platform.environment['HOME']}/.loliSnatcher/cache/";
      } else if (Platform.isWindows){
        path = "${Platform.environment['LOCALAPPDATA']}/LoliSnatcher/cache/";
      }
    }
    return true;
  }
}