import 'dart:math';

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

  static String getFileExt(fileURL){
    int queryLastIndex = fileURL.lastIndexOf("?"); // if has GET query parameters
    int lastIndex = queryLastIndex != -1 ? queryLastIndex : fileURL.length;
    String fileExt = fileURL.substring(fileURL.lastIndexOf(".") + 1, lastIndex);
    return fileExt;
  }

  static String getFileName(fileURL){
    int queryLastIndex = fileURL.lastIndexOf("?"); // if has GET query parameters
    int lastIndex = queryLastIndex != -1 ? queryLastIndex : fileURL.length;
    String fileExt = fileURL.substring(fileURL.lastIndexOf("/") + 1, lastIndex);
    return fileExt;
  }
}
