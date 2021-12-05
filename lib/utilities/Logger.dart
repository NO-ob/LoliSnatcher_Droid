import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class Logger {
  static Logger? _loggerInstance;
  // Needs to be moved to settings at some point
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();

  static Logger Inst() {
    if (_loggerInstance == null) {
      _loggerInstance = Logger();
    }
    return _loggerInstance!;
  }
  void log(var logStr, String callerClass, String callerFunction, LogTypes logType) {
    String appName = settingsHandler.appName;
    //Using != val was still printing for some reason so else is used
    if (settingsHandler.ignoreLogTypes.any((val) => logType == val)) {
      // Ignore
    } else {
      if (kDebugMode) {
        // don't print app name on debug builds
        print("$callerClass::$callerFunction::$logType::$logStr");
      } else {
        debugPrint("[$appName]::$callerClass::$callerFunction::$logType::$logStr");
      }
    }
  }
}

enum LogTypes{
  settingsLoad,
  settingsError,
  booruItemLoad,
  booruHandlerSearchURL,
  booruHandlerFetchFailed,
  booruHandlerRawFetched,
  booruHandlerInfo,
  exception,
  loliSyncInfo,
}