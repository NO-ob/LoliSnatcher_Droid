import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';


import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/Tools.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';

// move writing to separate thread, so the app won't hang while it saves - Leads to memory leak!
// Future<void> writeBytesIsolate(Map<String, dynamic> map) async {
//   await map['file'].writeAsBytes(map['bytes']);
//   return;
// }

class ImageWriter {
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  String? path = "";
  String? cacheRootPath = "";
  ServiceHandler serviceHandler = ServiceHandler();
  int SDKVer = 0;

  ImageWriter() {
    setPaths();
  }

  /**
   * return null - file already exists
   * return String - file saved
   * return Error - something went wrong
   */
  Future write(BooruItem item, Booru booru) async {
    int queryLastIndex = item.fileURL.lastIndexOf("?");
    int lastIndex = queryLastIndex != -1 ? queryLastIndex : item.fileURL.length;
    String fileName = "";
    if (booru.type == ("BooruOnRails") || booru.type == "Philomena"){
      fileName = booru.name! + '_' + item.serverId! + "." + item.fileExt!;
    } else if (booru.type == "Hydrus"){
      fileName = "Hydrus_${item.md5String}.${item.fileExt}";
    } else {
      fileName = booru.name! + '_' + item.fileURL.substring(item.fileURL.lastIndexOf("/") + 1, lastIndex);
    }
    print("out file is $fileName");
    // print(fileName);
    await setPaths();

    if(SDKVer == 0){
        SDKVer = await serviceHandler.getSDKVersion();
        print(SDKVer);
    }

    // Don't do anything if file already exists
    File image = File(path! + fileName);
    // print(path! + fileName);
    bool fileExists = await image.exists();
    if(fileExists || item.isSnatched.value == true) return null;
    try {
      Uri fileURI = Uri.parse(item.fileURL);
      var response = await http.get(fileURI);
      if (SDKVer < 30 && settingsHandler.extPathOverride.isEmpty) {
        await Directory(path!).create(recursive:true);
        await image.writeAsBytes(response.bodyBytes, flush: true);
        print("Image written: " + path! + fileName);
        if (settingsHandler.jsonWrite){
          File json = File(path! + fileName.split(".")[0]+".json");
          await json.writeAsString(jsonEncode(item.toJson()), flush: true);
        }
        item.isSnatched.value = true;
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
          print("Ext path override is: ${settingsHandler.extPathOverride}");
          var writeResp = await serviceHandler.writeImage(response.bodyBytes, fileName.split(".")[0], item.mediaType, item.fileExt,settingsHandler.extPathOverride);
          if (writeResp != null){
            print("write response: $writeResp");
            item.isSnatched.value = true;
            if (settingsHandler.dbEnabled){
              settingsHandler.dbHandler.updateBooruItem(item,"local");
            }
            return (fileName);
          }
        //} else {
         // Get.snackbar("File write error","Only jpg and png can be saved on android 11 currently",snackPosition: SnackPosition.BOTTOM,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.theme.primaryColor);
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

  Stream<Map<String, int>> writeMultiple(List<BooruItem> snatched, Booru booru, int cooldown) async* {
    int snatchedCounter = 1;
    List<String> existsList = [];
    List<String> failedList = [];
    for (int i = 0; i < snatched.length ; i++){
      await Future.delayed(Duration(milliseconds: cooldown), () async{
        var snatchResult = await write(snatched.elementAt(i), booru);
        if (snatchResult == null) {
          existsList.add(snatched[i].fileURL);
        } else if (snatchResult is !String) {
          failedList.add(snatched[i].fileURL);
        }
      });
      snatchedCounter++;
      yield {
        "snatched": snatchedCounter,
      };
    }

    yield {
      "snatched": snatchedCounter,
      "exists": existsList.length,
      "failed": failedList.length
    };
  }

  Future writeCache(String fileURL, String typeFolder) async{
    String? cachePath;
    Uri fileURI = Uri.parse(fileURL);
    try {
      var response = await http.get(fileURI);
      await setPaths();
      cachePath = cacheRootPath! + typeFolder + "/";
      await Directory(cachePath).create(recursive:true);

      String fileName = sanitizeName(parseThumbUrlToName(fileURL));
      File image = File(cachePath+fileName);
      await image.writeAsBytes(response.bodyBytes, flush: true);
    } catch (e){
      print("Image Writer Exception:: cache write");
      print(e);
    }
    return (cachePath!+fileURL.substring(fileURL.lastIndexOf("/") + 1));
  }

  Future<File?> writeCacheFromBytes(String fileURL, List<int> bytes, String typeFolder, {bool clearName = true}) async{
    File? image;
    try {
      await setPaths();
      String cachePath = cacheRootPath! + typeFolder + "/";
      // print("write cahce from bytes:: cache path is $cachePath");
      await Directory(cachePath).create(recursive:true);

      String fileName = sanitizeName(clearName ? parseThumbUrlToName(fileURL) : fileURL);
      image = File(cachePath + fileName);
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
  Future deleteFileFromCache(String fileURL, String typeFolder) async {
    try {
      await setPaths();
      String cachePath = cacheRootPath! + typeFolder + "/";
      String fileName = sanitizeName(parseThumbUrlToName(fileURL));
      File file = File(cachePath + fileName);
      if (await file.exists()) {
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

  Future deleteCacheFolder(String typeFolder) async {
    try {
      await setPaths();
      String cachePath = cacheRootPath! + typeFolder + "/";
      Directory folder = Directory(cachePath);
      if (await folder.exists()) {
        folder.delete(recursive: true);
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

  Future<String?> getCachePath(String fileURL, String typeFolder, {bool clearName = true}) async{
    String cachePath;
    try {
      await setPaths();
      cachePath = cacheRootPath! + typeFolder + "/";

      String fileName = sanitizeName(clearName ? parseThumbUrlToName(fileURL) : fileURL);
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
  Future<Map<String,int>> getCacheStat(String? typeFolder) async {
    String cacheDirPath;
    int fileNum = 0;
    int totalSize = 0;
    try {
      await setPaths();
      cacheDirPath = cacheRootPath! + (typeFolder ?? '') + "/";

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

  // TODO move to isolate
  Future<void> clearStaleCache() async {
    if(settingsHandler.cacheDuration.inMilliseconds == 0) {
      return;
    }

    String cacheDirPath;
    try {
      await setPaths();
      cacheDirPath = cacheRootPath! + "/";

      Directory cacheDir = Directory(cacheDirPath);
      bool dirExists = await cacheDir.exists();
      if (dirExists) {
        cacheDir.listSync(recursive: true, followLinks: false)
          .forEach((FileSystemEntity entity) {
            final bool isNotExcludedExt = Tools.getFileExt(entity.path) != 'ico';
            final bool isStale = (entity.statSync().modified.millisecondsSinceEpoch + settingsHandler.cacheDuration.inMilliseconds) < DateTime.now().millisecondsSinceEpoch;
            if (entity is File && isNotExcludedExt && isStale) {
              entity.delete();
            }
          });
      }
    } catch (e){
      print("Image Writer Exception");
      print(e);
    }
    return;
  }

  // TODO move to isolate
  Future<void> clearCacheOverflow() async {
    if(settingsHandler.cacheSize == 0) {
      return;
    }

    String cacheDirPath;
    List<FileSystemEntity> toDelete = [];
    int toDeleteSize = 0;
    int currentCacheSize = 0;
    try {
      await setPaths();
      cacheDirPath = cacheRootPath! + "/";

      Directory cacheDir = Directory(cacheDirPath);
      bool dirExists = await cacheDir.exists();
      if (dirExists) {
        cacheDir.listSync(recursive: true, followLinks: false)
          .forEach((FileSystemEntity entity) {
            if (entity is File) {
              currentCacheSize += entity.lengthSync();
            }
          });

        final int limitSize = settingsHandler.cacheSize * pow(1024, 3) as int;
        final int overflowSize = currentCacheSize - limitSize;
        if(overflowSize > 0) {
          List<FileSystemEntity> files = cacheDir.listSync(recursive: true, followLinks: false).whereType<File>().toList();
          files.sort((FileSystemEntity a, FileSystemEntity b) {
            return a.statSync().modified.millisecondsSinceEpoch.compareTo(b.statSync().modified.millisecondsSinceEpoch);
          });
          for (var entity in files) {
            final bool isNotExcludedExt = Tools.getFileExt(entity.path) != 'ico';
            final FileStat stat = entity.statSync();
            final bool stillOverflows = toDeleteSize < overflowSize;
            if (entity is File && isNotExcludedExt && stillOverflows) {
              toDelete.add(entity);
              toDeleteSize += stat.size;
            }
          }
        }
      }
    } catch (e) {
      print("Image Writer Exception");
      print(e);
    }

    // print(toDelete);
    // print(toDeleteSize);
    for (var file in toDelete) {
      file.delete();
    }
    return;
  }

  String parseThumbUrlToName(String thumbURL) {
    String result = "";
    if (thumbURL.contains("Hydrus-Client")){
      result = "hydrusThumb_${thumbURL.split("&")[0].split("=")[1]}";
    } else {
      int queryLastIndex = thumbURL.lastIndexOf("?"); // Sankaku fix
      int lastIndex = queryLastIndex != -1 ? queryLastIndex : thumbURL.length;
      result = thumbURL.substring(thumbURL.lastIndexOf("/") + 1, lastIndex);
      if(result.startsWith('thumb.')) { //Paheal/shimmie(?) fix
        String unthumbedURL = thumbURL.replaceAll('/thumb', '');
        result = unthumbedURL.substring(unthumbedURL.lastIndexOf("/") + 1);
      }
    }

    return result;
  }

  String sanitizeName(String fileName, {String replacement = ''}) {
    RegExp illegalRe = RegExp(r'[\/\?<>\\:\*\|"]');
    RegExp controlRe = RegExp(r'[\x00-\x1f\x80-\x9f]');
    RegExp reservedRe = RegExp(r'^\.+$');
    RegExp windowsReservedRe = RegExp(r'^(con|prn|aux|nul|com[0-9]|lpt[0-9])(\..*)?$', caseSensitive: false);
    RegExp windowsTrailingRe = RegExp(r'[\. ]+$');

    return fileName
      .replaceAll(illegalRe, replacement)
      .replaceAll(controlRe, replacement)
      .replaceAll(reservedRe, replacement)
      .replaceAll(windowsReservedRe, replacement)
      .replaceAll(windowsTrailingRe, replacement);
    // TODO truncate to 255 symbols for windows?
  }

  Future<String> writeMascotImage(String contentUri) async{
    await setPaths();
    if (contentUri.isNotEmpty){
      Uint8List? fileBytes = await ServiceHandler.getSAFFile(contentUri);
      String fileExt = await ServiceHandler.getSAFFileExtension(contentUri);
        if (fileBytes != null && fileExt.isNotEmpty){
          String path = await serviceHandler.getConfigDir();
          File(path + "mascot." + fileExt).writeAsBytes(fileBytes);
          return (path + "mascot." + fileExt);
        }
    }
    return "";
  }

  Future<bool> setPaths() async {
    if(path == ""){
      if (settingsHandler.extPathOverride.isEmpty){
        path = await serviceHandler.getPicturesDir();
      } else {
        path = settingsHandler.extPathOverride;
      }
    }

    if(cacheRootPath == ""){
      cacheRootPath = await serviceHandler.getCacheDir();
    }
    // print('path: $path');
    // print(cache'path: $cacheRootPath');
    return true;
  }
}