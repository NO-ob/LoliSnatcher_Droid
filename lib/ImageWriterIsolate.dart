import 'dart:io';
import 'dart:async';
import 'dart:typed_data';

class ImageWriterIsolate {
  final String cacheRootPath;

  ImageWriterIsolate(this.cacheRootPath);

  Future<File?> writeCacheFromBytes(String fileURL, List<int> bytes, String typeFolder, {bool clearName = true}) async{
    File? image;
    try {
      String cachePath = cacheRootPath + typeFolder + "/";
      await Directory(cachePath).create(recursive:true);

      String fileName = sanitizeName(clearName ? parseThumbUrlToName(fileURL) : fileURL);
      image = File(cachePath + fileName);
      await image.writeAsBytes(bytes, flush: true);
    } catch (e) {
      print("Image Writer Exception:: cache write");
      print(e);
      return null;
    }
    return image;
  }

  Future<File?> readFileFromCache(String fileURL, String typeFolder, {bool clearName = true}) async {
    File? image;
    try {
      String cachePath = cacheRootPath + typeFolder + "/";
      String fileName = sanitizeName(clearName ? parseThumbUrlToName(fileURL) : fileURL);
      image = File(cachePath + fileName);
      // TODO is readBytes required here?
      if(await image.exists()) {
        await image.readAsBytes();
      }
    } catch (e){
      print("Image Writer Exception:: cache write");
      print(e);
      return null;
    }
    return image;
  }

  Future<Uint8List?> readBytesFromCache(String fileURL, String typeFolder, {bool clearName = true}) async {
    Uint8List? imageBytes;
    try {
      String cachePath = cacheRootPath + typeFolder + "/";
      String fileName = sanitizeName(clearName ? parseThumbUrlToName(fileURL) : fileURL);
      File image = File(cachePath + fileName);
      if(await image.exists()) {
        imageBytes = await image.readAsBytes();
      }
    } catch (e){
      print("Image Writer Exception:: cache write");
      print(e);
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
}