import 'package:flutter/foundation.dart';

import 'package:lolisnatcher/src/data/constants.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

// TODO save/load selected log types to persistent storage to get logs from the very start of the app

class Logger {
  static Logger? _loggerInstance;

  static Logger Inst() {
    _loggerInstance ??= Logger();
    return _loggerInstance!;
  }

  void log(dynamic logStr, String callerClass, String callerFunction, LogTypes? logType) {
    if (!Tools.isTestMode()) {
      //  don't call handlers when in test mode
      // don't check which types are ignored in test mode and output everything
      if (SettingsHandler.instance.ignoreLogTypes.any((val) => logType == val)) {
        // Ignore unselected log types
        return;
      }
    }

    // protect from exceptions when logStr is not a stringifiable object
    // TODO still could throw exception for some objects? needs more testing
    logStr = logStr is String ? logStr : '$logStr';

    if (kDebugMode) {
      // don't print app name on debug builds
      // print("$callerClass::$callerFunction::$logType::$logStr");
      printWrapped(logStr, "$callerClass::$callerFunction::$logType::");
    } else {
      // debugPrint("[$Constants.appName]::$callerClass::$callerFunction::$logType::$logStr");
      printWrapped(logStr, "[${Constants.appName}]::$callerClass::$callerFunction::$logType::");
    }
  }

  void printWrapped(String text, String preText) => RegExp('.{1,800}') // print in chunks of 800 chars
      .allMatches(text)
      .map((m) => m.group(0))
      .forEach((String? str) => debugPrint("$preText$str"));
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
  imageInfo,
}
