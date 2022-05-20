import 'package:flutter/foundation.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';

class Logger {
  static Logger? _loggerInstance;
  // Needs to be moved to settings at some point
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  static Logger Inst() {
    _loggerInstance ??= Logger();
    return _loggerInstance!;
  }

  void log(dynamic logStr, String callerClass, String callerFunction, LogTypes? logType) {
    String appName = settingsHandler.appName;
    //Using != val was still printing for some reason so else is used

    void printWrapped(String text, String preText) => RegExp('.{1,800}') // print in chunks of 800 chars
        .allMatches(text)
        .map((m) => m.group(0))
        .forEach((String? str) => debugPrint("$preText$str"));

    if (settingsHandler.ignoreLogTypes.any((val) => logType == val)) {
      // Ignore
    } else {
      if (kDebugMode) {
        // don't print app name on debug builds
        // print("$callerClass::$callerFunction::$logType::$logStr");
        printWrapped(logStr, "$callerClass::$callerFunction::$logType::");
      } else {
        // debugPrint("[$appName]::$callerClass::$callerFunction::$logType::$logStr");
        printWrapped(logStr, "[$appName]::$callerClass::$callerFunction::$logType::");
      }
    }
  }
}

enum LogTypes {
  settingsLoad,
  settingsError,
  booruItemLoad,
  booruHandlerSearchURL,
  booruHandlerFetchFailed,
  booruHandlerRawFetched,
  booruHandlerInfo,
  booruHandlerTagInfo,
  tagHandlerInfo,
  exception,
  loliSyncInfo,
}
