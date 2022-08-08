import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import '../utils/logger.dart';

class ImageWriterIsolate {
  final String cacheRootPath;

  ImageWriterIsolate(this.cacheRootPath);

  Future<File?> writeCacheFromBytes(String fileURL, List<int> bytes, String typeFolder, {bool clearName = true, required String fileNameExtras}) async{
    File? image;
    try {
      String cachePath = "$cacheRootPath$typeFolder/";
      await Directory(cachePath).create(recursive:true);

      String fileName = sanitizeName(clearName ? parseThumbUrlToName(fileURL) : fileURL, fileNameExtras: fileNameExtras);
      image = File(cachePath + fileName);
      Logger.Inst().log("found image at: ${cachePath + fileName} for $fileURL", "ImageWriterIsolate", "readFileFromCache", LogTypes.imageInfo);
      print("Image Writer Isolate Exception :: read bytes cache :: ");
      await image.writeAsBytes(bytes, flush: true);
    } catch (e) {
      print("Image Writer Isolate Exception :: cache write bytes :: $e");
      return null;
    }
    return image;
  }

  Future<File?> readFileFromCache(String fileURL, String typeFolder, {bool clearName = true,required String fileNameExtras}) async {
    File? image;
    try {
      String cachePath = "$cacheRootPath$typeFolder/";
      String fileName = sanitizeName(clearName ? parseThumbUrlToName(fileURL) : fileURL, fileNameExtras: fileNameExtras);
      image = File(cachePath + fileName);
      // TODO is readBytes required here?
      Logger.Inst().log("found image at: ${cachePath + fileName} for $fileURL", "ImageWriterIsolate", "readFileFromCache", LogTypes.imageInfo);
      print("Image Writer Isolate Exception :: read bytes cache :: ");
      if(await image.exists()) {
        await image.readAsBytes();
      }
    } catch (e){
      print("Image Writer Isolate Exception :: cache write :: $e");
      return null;
    }
    return image;
  }

  Future<Uint8List?> readBytesFromCache(String fileURL, String typeFolder, {bool clearName = true, required String fileNameExtras}) async {
    Uint8List? imageBytes;
    try {
      String cachePath = "$cacheRootPath$typeFolder/";
      String fileName = sanitizeName(clearName ? parseThumbUrlToName(fileURL) : fileURL, fileNameExtras: fileNameExtras);
      File image = File(cachePath + fileName);

      if(await image.exists()) {
        imageBytes = await image.readAsBytes();
        Logger.Inst().log("found image at: ${cachePath + fileName} for $fileURL", "ImageWriterIsolate", "readBytesFromCache", LogTypes.imageInfo);
        print("Image Writer Isolate Exception :: read bytes cache :: ");
      } else {
        Logger.Inst().log("couldn't find image at: ${cachePath + fileName} for $fileURL", "ImageWriterIsolate", "readBytesFromCache", LogTypes.imageInfo);
        print("Image Writer Isolate Exception :: read bytes cache ::");
      }
    } catch (e){
      print("Image Writer Isolate Exception :: read bytes cache :: $e");
      return null;
    }
    return imageBytes;
  }

  String parseThumbUrlToName(String thumbURL) {
    int queryLastIndex = thumbURL.lastIndexOf("?"); // Sankaku fix
    int lastIndex = queryLastIndex != -1 ? queryLastIndex : thumbURL.length;
    String result = thumbURL.substring(thumbURL.lastIndexOf("/") + 1, lastIndex);
    if(result.startsWith('thumb.')) { //Paheal/shimmie(?) fix
      String unthumbedURL = thumbURL.replaceAll('/thumb', '');
      result = unthumbedURL.substring(unthumbedURL.lastIndexOf("/") + 1);
    }
    Logger.Inst().log("thumbUrlName: $result, thumbUrl: $thumbURL", "ImageWriterIsolate", "parseThumbUrlToName", LogTypes.imageInfo);
    return result;

  }

  // calculates cache (total or by type) size and file count
  Future<Map<String, dynamic>> getCacheStat(String? typeFolder) async {
    String cacheDirPath;
    int fileNum = 0;
    int totalSize = 0;
    try {
      cacheDirPath = "$cacheRootPath${typeFolder ?? ''}/";

      Directory cacheDir = Directory(cacheDirPath);
      bool dirExists = await cacheDir.exists();
      if (dirExists) {
        List<FileSystemEntity> files = await cacheDir.list(recursive: true, followLinks: false).toList();
        for (FileSystemEntity file in files) {
          if (file is File) {
            fileNum++;
            totalSize += await file.length();
          }
        }
      }
    } catch (e) {
      print("Image Writer Isolate Exception :: cache stat :: $e");
    }

    return {
      'type': typeFolder,
      'fileNum': fileNum,
      'totalSize': totalSize,
    };
  }

  String sanitizeName(String fileName, {String replacement = '', required String fileNameExtras}) {
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
}