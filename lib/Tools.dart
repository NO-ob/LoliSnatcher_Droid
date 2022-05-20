import 'dart:math';
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

  static void forceClearMemoryCache({bool withLive = false}) {
    // clears memory image cache on timer or when changing tabs
    PaintingBinding.instance.imageCache.clear();
    if(withLive) PaintingBinding.instance.imageCache.clearLiveImages();
  }

  static String pluralize(String str, int count) {
    return count == 1 ? str : '${str}s';
  }
}
