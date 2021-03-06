import 'dart:math';
import 'package:LoliSnatcher/widgets/CachedThumb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'SettingsHandler.dart';
import 'libBooru/BooruItem.dart';

class Tools {
  // code taken from: https://gist.github.com/zzpmaster/ec51afdbbfa5b2bf6ced13374ff891d9
  static String formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }
  static int boolToInt(bool boolean){
    return boolean ? 1 : 0;
  }
  static bool intToBool(int boolean){
    return boolean != 0 ? true : false;
  }
}
