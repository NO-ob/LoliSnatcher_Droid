import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

// move writing to separate thread, so the app won't hang while it saves - Leads to memory leak!
// Future<void> writeBytesIsolate(Map<String, dynamic> map) async {
//   await map['file'].writeAsBytes(map['bytes']);
//   return;
// }

class ImageWriter {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  String? path = "";
  String? cacheRootPath = "";
  int SDKVer = 0;

  ImageWriter() {
    setPaths();
  }

  /// return null - file already exists
  /// return String - file saved
  /// return Error - something went wrong
  Future write(BooruItem item, Booru booru) async {
    int queryLastIndex = item.fileURL.lastIndexOf("?");
    int lastIndex = queryLastIndex != -1 ? queryLastIndex : item.fileURL.length;
    String fileName = "";
    if (booru.type == ("BooruOnRails") || booru.type == "Philomena"){
      fileName = "${item.fileNameExtras}.${item.fileExt!}";
    } else if (booru.type == "Hydrus"){
      fileName = "${item.fileNameExtras}_${item.md5String}.${item.fileExt}";
    } else if (booru.baseURL!.contains("yande.re")) {
      fileName = "yandere_${item.md5String}.${item.fileExt}";
    } else {
      fileName = '${booru.name!}_${item.fileURL.substring(item.fileURL.lastIndexOf("/") + 1, lastIndex)}';
    }
    print("out file is $fileName");
    // print(fileName);
    await setPaths();

    if(SDKVer == 0){
        SDKVer = await ServiceHandler.getSDKVersion();
        print(SDKVer);
    }

    // Don't do anything if file already exists
    File image = File(path! + fileName);
    // print(path! + fileName);
    bool fileExists = await image.exists();
    // if (fileExists) return null;
    if (fileExists || item.isSnatched.value == true) return null;
    try {
      Uri fileURI = Uri.parse(item.fileURL);
      var response = await http.get(fileURI,headers: Tools.getFileCustomHeaders(booru,checkForReferer: true));
      if (SDKVer < 30 && settingsHandler.extPathOverride.isEmpty) {
        await Directory(path!).create(recursive:true);
        await image.writeAsBytes(response.bodyBytes, flush: true);
        print("Image written: ${path!}$fileName");
        if (settingsHandler.jsonWrite){
          File json = File("${path!}${fileName.split(".")[0]}.json");
          await json.writeAsString(jsonEncode(item.toJson()), flush: true);
        }
        item.isSnatched.value = true;
        if (settingsHandler.dbEnabled){
          settingsHandler.dbHandler.updateBooruItem(item,"local");
        }
        try {
          if(Platform.isAndroid){
            ServiceHandler.callMediaScanner(image.path);
          }
        } catch (e){
          print("Image not found $e");
          return e;
        }
      } else {
        print("files ext is ${item.fileExt!}");
        print("Ext path override is: ${settingsHandler.extPathOverride}");
        var writeResp = await ServiceHandler.writeImage(
          response.bodyBytes,
          fileName.split(".")[0],
          item.mediaType,
          item.fileExt,
          settingsHandler.extPathOverride,
        );
        // var writeResp = await compute(ServiceHandler.writeImageCompute, {
        //   "bytes": response.bodyBytes,
        //   "fileName": fileName.split(".")[0],
        //   "mediaType": item.mediaType,
        //   "fileExt": item.fileExt,
        //   "extPathOverride": settingsHandler.extPathOverride
        // });
        if (writeResp != null){
          print("write response: $writeResp");
          item.isSnatched.value = true;
          if (settingsHandler.dbEnabled){
            settingsHandler.dbHandler.updateBooruItem(item,"local");
          }
          return (fileName);
        }
      }
    } catch (e){
      print("Image Writer Exception :: write :: $e");
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

  Future writeCache(String fileURL, String typeFolder,{required String fileNameExtras}) async{
    String? cachePath;
    Uri fileURI = Uri.parse(fileURL);
    try {
      var response = await http.get(fileURI);
      await setPaths();
      cachePath = "${cacheRootPath!}$typeFolder/";
      await Directory(cachePath).create(recursive:true);

      String fileName = sanitizeName(parseThumbUrlToName(fileURL), fileNameExtras: fileNameExtras);
      File image = File(cachePath+fileName);
      await image.writeAsBytes(response.bodyBytes, flush: true);
    } catch (e){
      print("Image Writer Exception :: cache write :: $e");
    }
    return (cachePath!+fileURL.substring(fileURL.lastIndexOf("/") + 1));
  }

  Future<File?> writeCacheFromBytes(String fileURL, List<int> bytes, String typeFolder, {bool clearName = true, required String fileNameExtras}) async{
    File? image;
    try {
      await setPaths();
      String cachePath = "${cacheRootPath!}$typeFolder/";
      // print("write cahce from bytes:: cache path is $cachePath");
      await Directory(cachePath).create(recursive:true);

      String fileName = sanitizeName(clearName ? parseThumbUrlToName(fileURL) : fileURL, fileNameExtras: fileNameExtras);
      image = File(cachePath + fileName);
      await image.writeAsBytes(bytes, flush: true);

      // move writing to separate thread, so the app won't hang while it saves - Leads to memory leak!
      // await compute(writeBytesIsolate, {"file": image, "bytes": bytes});
    } catch (e){
      print("Image Writer Exception :: cache write bytes :: $e");
      return null;
    }
    return image;
  }

  // Deletes file from given cache folder
  // returns true if successful, false if there was an exception and null if file didn't exist
  Future deleteFileFromCache(String fileURL, String typeFolder, {required String fileNameExtras}) async {
    try {
      await setPaths();
      String cachePath = "${cacheRootPath!}$typeFolder/";
      String fileName = sanitizeName(parseThumbUrlToName(fileURL), fileNameExtras: fileNameExtras);
      File file = File(cachePath + fileName);
      if (await file.exists()) {
        file.delete();
        return true;
      } else {
        return null;
      }
    } catch (e){
      print("Image Writer Exception :: delete from cache :: $e");
      return false;
    }
  }

  Future deleteCacheFolder(String typeFolder) async {
    try {
      await setPaths();
      String cachePath = "${cacheRootPath!}$typeFolder/";
      Directory folder = Directory(cachePath);
      if (await folder.exists()) {
        folder.delete(recursive: true);
        return true;
      } else {
        return null;
      }
    } catch (e){
      print("Image Writer Exception :: delete cache folder :: $e");
      return false;
    }
  }

  Future<String?> getCachePath(String fileURL, String typeFolder, {bool clearName = true, required String fileNameExtras}) async{
    String cachePath;
    try {
      await setPaths();
      cachePath = "${cacheRootPath!}$typeFolder/";

      String fileName = sanitizeName(clearName ? parseThumbUrlToName(fileURL) : fileURL, fileNameExtras: fileNameExtras);
      File cacheFile = File(cachePath+fileName);
      if (await cacheFile.exists()){
        if(await cacheFile.length() > 0) {
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
      print("Image Writer Exception :: get cache path :: $e");
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
      cacheDirPath = "${cacheRootPath!}${typeFolder ?? ''}/";

      Directory cacheDir = Directory(cacheDirPath);
      if (await cacheDir.exists()) {
        List<FileSystemEntity> files = await cacheDir.list(recursive: true, followLinks: false).toList();
        for (FileSystemEntity file in files) {
          if (file is File) {
            fileNum++;
            totalSize += await file.length();
          }
        }
      }
    } catch (e){
      print("Image Writer Exception :: get cache stat :: $e");
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
      cacheDirPath = "${cacheRootPath!}/";

      Directory cacheDir = Directory(cacheDirPath);
      if (await cacheDir.exists()) {
        List<FileSystemEntity> files = await cacheDir.list(recursive: true, followLinks: false).toList();
        for (FileSystemEntity file in files) {
          if (file is File) {
            final bool isNotExcludedExt = Tools.getFileExt(file.path) != 'ico';
            final DateTime lastModified = await file.lastModified();
            final bool isStale = (lastModified.millisecondsSinceEpoch + settingsHandler.cacheDuration.inMilliseconds) < DateTime.now().millisecondsSinceEpoch;
            if (isNotExcludedExt && isStale) {
              file.delete();
            }
          }
        }
      }
    } catch (e){
      print("Image Writer Exception :: clear stale cache :: $e");
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
      cacheDirPath = "${cacheRootPath!}/";

      Directory cacheDir = Directory(cacheDirPath);
      if (await cacheDir.exists()) {
        List<File> files = (await cacheDir.list(recursive: true, followLinks: false).toList()).whereType<File>().toList();
        for (File file in files) {
          currentCacheSize += await file.length();
        }

        final int limitSize = settingsHandler.cacheSize * pow(1024, 3) as int;
        final int overflowSize = currentCacheSize - limitSize;
        if(overflowSize > 0) {
          files.sort((a, b) => a.lastModifiedSync().compareTo(b.lastModifiedSync()));

          for (File file in files) {
            final bool isNotExcludedExt = Tools.getFileExt(file.path) != 'ico';
            final bool stillOverflows = toDeleteSize < overflowSize;
            if (isNotExcludedExt && stillOverflows) {
              toDelete.add(file);
              toDeleteSize += await file.length();
            }
          }
        }
      }
    } catch (e) {
      print("Image Writer Exception :: clear cache overflow :: $e");
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

  String sanitizeName(String fileName, {String replacement = '',required String fileNameExtras}) {
    RegExp illegalRe = RegExp(r'[\/\?<>\\:\*\|"]');
    RegExp controlRe = RegExp(r'[\x00-\x1f\x80-\x9f]');
    RegExp reservedRe = RegExp(r'^\.+$');
    RegExp windowsReservedRe = RegExp(r'^(con|prn|aux|nul|com[0-9]|lpt[0-9])(\..*)?$', caseSensitive: false);
    RegExp windowsTrailingRe = RegExp(r'[\. ]+$');

    return "${fileNameExtras.replaceAll(illegalRe, replacement)
        .replaceAll(controlRe, replacement)
        .replaceAll(reservedRe, replacement)
        .replaceAll(windowsReservedRe, replacement)
        .replaceAll(windowsTrailingRe, replacement)}${fileName
        .replaceAll(illegalRe, replacement)
        .replaceAll(controlRe, replacement)
        .replaceAll(reservedRe, replacement)
        .replaceAll(windowsReservedRe, replacement)
        .replaceAll(windowsTrailingRe, replacement).replaceAll("%20", "_")}";
    // TODO truncate to 255 symbols for windows?
  }

  Future<String> writeMascotImage(String contentUri) async{
    await setPaths();
    if (contentUri.isNotEmpty){
      Uint8List? fileBytes = await ServiceHandler.getSAFFile(contentUri);
      String fileExt = await ServiceHandler.getSAFFileExtension(contentUri);
        if (fileBytes != null && fileExt.isNotEmpty){
          String path = await ServiceHandler.getConfigDir();
          File("${path}mascot.$fileExt").writeAsBytes(fileBytes);
          return ("${path}mascot.$fileExt");
        }
    }
    return "";
  }

  Future<bool> setPaths() async {
    if(path == ""){
      if (settingsHandler.extPathOverride.isEmpty){
        path = await ServiceHandler.getPicturesDir();
      } else {
        path = settingsHandler.extPathOverride;
      }
    }

    if(cacheRootPath == ""){
      cacheRootPath = await ServiceHandler.getCacheDir();
    }
    // print('path: $path');
    // print(cache'path: $cacheRootPath');
    return true;
  }
}