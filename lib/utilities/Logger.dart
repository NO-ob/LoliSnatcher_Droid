import 'package:flutter/foundation.dart';

class Logger {
  static Logger? _loggerInstance;
  // Needs to be moved to settings at some point
  List<LogTypes> ignoreLogTypes = [LogTypes.booruHandlerInfo, LogTypes.booruHandlerRawFetched,LogTypes.settingsLoad,LogTypes.booruItemLoad];
  static Logger Inst(){
    if (_loggerInstance == null){
      _loggerInstance = Logger();
    }
    return _loggerInstance!;
  }
  void log(var logStr, String callerClass, String callerFunction, LogTypes logType){
    // Only log on debug builds
    if (kDebugMode) {
      //Using != val was still printing for some reason so else is used
      if (ignoreLogTypes.any((val) => logType == val)){

      } else {
        print("$callerClass::$callerFunction::$logType::$logStr");
      }
    }
  }
}

enum LogTypes{
  settingsLoad,
  booruItemLoad,
  booruHandlerSearchURL,
  booruHandlerFetchFailed,
  booruHandlerRawFetched,
  booruHandlerInfo,
  exception,
  loliSyncInfo,
}