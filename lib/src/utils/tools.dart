import 'dart:math';
import 'package:LoliSnatcher/src/data/booru.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tools {
  // code taken from: https://gist.github.com/zzpmaster/ec51afdbbfa5b2bf6ced13374ff891d9
  static String formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  static int boolToInt(bool boolean){
    return boolean ? 1 : 0;
  }
  static bool intToBool(int boolean){
    return boolean != 0 ? true : false;
  }
  static bool stringToBool(String boolean){
    return boolean == "true" ? true : false;
  }

  static String getFileExt(String fileURL){
    int queryLastIndex = fileURL.lastIndexOf("?"); // if has GET query parameters
    int lastIndex = queryLastIndex != -1 ? queryLastIndex : fileURL.length;
    String fileExt = fileURL.substring(fileURL.lastIndexOf(".") + 1, lastIndex);
    return fileExt;
  }

  static String getFileName(String fileURL){
    int queryLastIndex = fileURL.lastIndexOf("?"); // if has GET query parameters
    int lastIndex = queryLastIndex != -1 ? queryLastIndex : fileURL.length;
    String fileExt = fileURL.substring(fileURL.lastIndexOf("/") + 1, lastIndex);
    return fileExt;
  }

  // unified http headers list generator for dio in thumb/media/video loaders
  static Map<String, String> getFileCustomHeaders(Booru booru, {bool checkForReferer = false}) {
    // a few boorus doesn't work without a browser useragent
    Map<String,String> headers = {"user-agent": "Mozilla/5.0 (Linux x86_64; rv:86.0) Gecko/20100101 Firefox/86.0"};
    // some boorus require referer header
    if(checkForReferer) {
      switch (booru.type) {
        case 'World':
          if(booru.baseURL!.contains('rule34.xyz')) {
            headers["referer"] = "https://rule34xyz.b-cdn.net";
          } else if(booru.baseURL!.contains('rule34.world')) {
            headers["referer"] = "https://rule34storage.b-cdn.net";
          }
          break;

        default:
          break;
      }
    }

    return headers;
  }

  static IconData getFileIcon(String? mediaType) {
    switch (mediaType) {
      case 'image':
        return Icons.photo;
      case 'video':
        return CupertinoIcons.videocam_fill;
      case 'animation':
        return CupertinoIcons.play_fill;
      case 'not_supported_animation':
        return Icons.play_disabled;
      default:
        return CupertinoIcons.question;
    }
  }


  static void forceClearMemoryCache({bool withLive = false}) {
    // clears memory image cache on timer or when changing tabs
    PaintingBinding.instance.imageCache.clear();
    if(withLive) PaintingBinding.instance.imageCache.clearLiveImages();
  }

  static String pluralize(String str, int count) {
    return count == 1 ? str : '${str}s';
  }
}
