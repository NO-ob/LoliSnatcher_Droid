import 'package:logger_fork/logger_fork.dart' as LogLib;

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

// TODO move everything to newLog, drop Inst()

class Logger {
  static Logger? _loggerInstance;

  static Logger Inst() {
    _loggerInstance ??= Logger();
    return _loggerInstance!;
  }

  void log(dynamic logStr, String callerClass, String callerFunction,
      LogTypes? logType) {
    if (!Tools.isTestMode()) {
      //  don't call handlers when in test mode
      // don't check which types are ignored in test mode and output everything
      final bool allowedToLog = logType == null ||
          SettingsHandler.instance.enabledLogTypes.contains(logType);
      if (!allowedToLog) {
        // Ignore unselected log types
        return;
      }
    }

    // protect from exceptions when logStr is not a stringifiable object
    // TODO still could throw exception for some objects? needs more testing
    logStr = logStr is String ? logStr : '$logStr';

    final logLevel = logType?.logLevel ?? LogLib.Level.wtf;
    if (logLevel == LogLib.Level.info) {
      _logger.i(logStr, logType);
    } else if (logLevel == LogLib.Level.error) {
      _logger.e(logStr, logType);
    } else if (logLevel == LogLib.Level.warning) {
      _logger.w(logStr, logType);
    } else if (logLevel == LogLib.Level.debug) {
      _logger.d(logStr, logType);
    } else if (logLevel == LogLib.Level.verbose) {
      _logger.v(logStr, logType);
    } else if (logLevel == LogLib.Level.wtf) {
      _logger.wtf(logStr, logType);
    } else {
      _logger.wtf(logStr, logType);
    }
  }

  static final _logger = LogLib.Logger(
    filter: CustomLogFilter(),
    printer: LogLib.PrettyPrinter(
      methodCount: 4,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true,
      stackTraceBeginIndex: 1,
    ),
    output: CustomConsoleOutput(),
  );

  static final _loggerNoStack = LogLib.Logger(
    filter: CustomLogFilter(),
    printer: LogLib.PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 0,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true,
      stackTraceBeginIndex: 1,
    ),
    output: CustomConsoleOutput(),
  );

  /// [m] is the message to be printed, can be anything but should be convertable to string / have toString()
  ///
  /// [e] is the error object / title
  ///
  /// [s] is the stacktrace object
  ///
  /// [t] is the log type, can be null
  ///
  /// [ignoreTypeCheck] to force log even if given log type is disabled (won't work if there are no enabled log types)
  ///
  /// [withStack] should the stacktrace be printed
  static void newLog({
    required dynamic m,
    required dynamic e,
    required StackTrace? s,
    required LogTypes? t,
    bool ignoreTypeCheck = false,
    bool withStack = true,
  }) {
    try {
      if (!Tools.isTestMode()) {
        // don't call handlers when in test mode
        // don't check which types are ignored in test mode and output everything
        final bool allowedToLog = ignoreTypeCheck ||
            t == null ||
            SettingsHandler.instance.enabledLogTypes.contains(t);
        if (!allowedToLog) {
          // Ignore unselected log types
          return;
        }
      }

      final logLevel = t?.logLevel ?? LogLib.Level.wtf;
      final usedLogger = withStack ? _logger : _loggerNoStack;
      final title = e == null ? '$t' : '$e :: $t';
      // string/list/map/set can be handled automatically, other objects need to be converted to string
      final message =
          (m is String || m is List || m is Map || m is Set) ? m : '$m';

      if (logLevel == LogLib.Level.info) {
        usedLogger.i(message, title, s);
      } else if (logLevel == LogLib.Level.error) {
        usedLogger.e(message, title, s);
      } else if (logLevel == LogLib.Level.warning) {
        usedLogger.w(message, title, s);
      } else if (logLevel == LogLib.Level.debug) {
        usedLogger.d(message, title, s);
      } else if (logLevel == LogLib.Level.verbose) {
        usedLogger.v(message, title, s);
      } else if (logLevel == LogLib.Level.wtf) {
        usedLogger.wtf(message, title, s);
      } else {
        usedLogger.wtf(message, title, s);
      }
    } catch (e, s) {
      // try/catch to prevent logging errors from affecting the app
      _logger.wtf(e, 'Failed to log message', s);
    }

    // Log Levels (higher include everything from lower)
    // verbose - detailed data, json contents...
    // debug - debug messages
    // info - general info
    // warning - warnings, errors that can be recovered from
    // error
    // wtf - unexpected errors, null LogType
  }
}

class CustomConsoleOutput extends LogLib.LogOutput {
  @override
  void output(LogLib.OutputEvent event) {
    event.lines.forEach(print);
  }
}

class CustomLogFilter extends LogLib.LogFilter {
  @override
  bool shouldLog(LogLib.LogEvent event) {
    if (Tools.isTestMode()) {
      return event.level.index >= level!.index;
    } else {
      final settingsHandler = SettingsHandler.instance;
      if (settingsHandler.enabledLogTypes.isNotEmpty) {
        return event.level.index >= level!.index;
      } else {
        return false;
      }
    }
  }
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

  LogLib.Level get logLevel {
    switch (this) {
      case LogTypes.booruHandlerFetchFailed:
        return LogLib.Level.error;
      case LogTypes.booruHandlerInfo:
        return LogLib.Level.info;
      case LogTypes.booruHandlerParseFailed:
        return LogLib.Level.error;
      case LogTypes.booruHandlerRawFetched:
        return LogLib.Level.info;
      case LogTypes.booruHandlerSearchURL:
        return LogLib.Level.info;
      case LogTypes.booruHandlerTagInfo:
        return LogLib.Level.info;
      case LogTypes.booruItemLoad:
        return LogLib.Level.info;
      case LogTypes.exception:
        return LogLib.Level.error;
      case LogTypes.imageInfo:
        return LogLib.Level.info;
      case LogTypes.imageLoadingError:
        return LogLib.Level.error;
      case LogTypes.loliSyncInfo:
        return LogLib.Level.info;
      case LogTypes.networkError:
        return LogLib.Level.error;
      case LogTypes.settingsError:
        return LogLib.Level.error;
      case LogTypes.settingsLoad:
        return LogLib.Level.info;
      case LogTypes.tagHandlerInfo:
        return LogLib.Level.info;
      default:
        return LogLib.Level.wtf;
    }
  }
}
