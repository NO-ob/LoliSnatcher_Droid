import 'package:flutter/foundation.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';

// TODO save/load selected log types to persistent storage to get logs from the very start of the app

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

    // protect from exceptions when logStr is not a stringifiable object
    // TODO still could throw exception for some objects? needs more testing
    logStr = logStr is String ? logStr : '$logStr';

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

// TODO more types
enum LogTypes {
  settingsLoad,
  settingsError,
  booruItemLoad,
  booruHandlerSearchURL,
  booruHandlerFetchFailed,
  booruHandlerParseFailed,
  booruHandlerRawFetched,
  booruHandlerInfo,
  booruHandlerTagInfo,
  tagHandlerInfo,
  exception,
  loliSyncInfo,
  networkError,
}
