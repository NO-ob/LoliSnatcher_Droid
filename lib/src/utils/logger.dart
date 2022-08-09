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
      if (logType != null && !SettingsHandler.instance.enabledLogTypes.contains(logType)) {
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
  booruHandlerFetchFailed,
  booruHandlerInfo,
  booruHandlerParseFailed,
  booruHandlerRawFetched,
  booruHandlerSearchURL,
  booruHandlerTagInfo,
  booruItemLoad,
  exception,
  imageInfo,
  imageLoadingError,
  loliSyncInfo,
  networkError,
  settingsError,
  settingsLoad,
  tagHandlerInfo;

  @override
  String toString() {
    switch (this) {
      case LogTypes.booruHandlerFetchFailed:
        return 'booruHandlerFetchFailed';
      case LogTypes.booruHandlerInfo:
        return 'booruHandlerInfo';
      case LogTypes.booruHandlerParseFailed:
        return 'booruHandlerParseFailed';
      case LogTypes.booruHandlerRawFetched:
        return 'booruHandlerRawFetched';
      case LogTypes.booruHandlerSearchURL:
        return 'booruHandlerSearchURL';
      case LogTypes.booruHandlerTagInfo:
        return 'booruHandlerTagInfo';
      case LogTypes.booruItemLoad:
        return 'booruItemLoad';
      case LogTypes.exception:
        return 'exception';
      case LogTypes.imageInfo:
        return 'imageInfo';
      case LogTypes.imageLoadingError:
        return 'imageLoadingError';
      case LogTypes.loliSyncInfo:
        return 'loliSyncInfo';
      case LogTypes.networkError:
        return 'networkError';
      case LogTypes.settingsError:
        return 'settingsError';
      case LogTypes.settingsLoad:
        return 'settingsLoad';
      case LogTypes.tagHandlerInfo:
        return 'tagHandlerInfo';
      default:
        return 'exception';
    }
  }

  static LogTypes fromString(String str) {
    switch (str) {
      case 'booruHandlerFetchFailed':
        return LogTypes.booruHandlerFetchFailed;
      case 'booruHandlerInfo':
        return LogTypes.booruHandlerInfo;
      case 'booruHandlerParseFailed':
        return LogTypes.booruHandlerParseFailed;
      case 'booruHandlerRawFetched':
        return LogTypes.booruHandlerRawFetched;
      case 'booruHandlerSearchURL':
        return LogTypes.booruHandlerSearchURL;
      case 'booruHandlerTagInfo':
        return LogTypes.booruHandlerTagInfo;
      case 'booruItemLoad':
        return LogTypes.booruItemLoad;
      case 'exception':
        return LogTypes.exception;
      case 'imageInfo':
        return LogTypes.imageInfo;
      case 'imageLoadingError':
        return LogTypes.imageLoadingError;
      case 'loliSyncInfo':
        return LogTypes.loliSyncInfo;
      case 'networkError':
        return LogTypes.networkError;
      case 'settingsError':
        return LogTypes.settingsError;
      case 'settingsLoad':
        return LogTypes.settingsLoad;
      case 'tagHandlerInfo':
        return LogTypes.tagHandlerInfo;
      default:
        return LogTypes.exception;
    }
  }
}
