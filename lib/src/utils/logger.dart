import 'dart:developer' as dev;
import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:dio/dio.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
// ignore: implementation_imports
import 'package:talker_flutter/src/controller/talker_view_controller.dart';

class Logger {
  static Logger? _loggerInstance;

  // ignore: non_constant_identifier_names
  static Logger Inst() {
    final bool isInit = _loggerInstance == null;

    _loggerInstance ??= Logger();
    _talkerInstance ??= Talker(
      settings: TalkerSettings(
        enabled: true,
        maxHistoryItems: 100000,
        useConsoleLogs: kDebugMode,
        useHistory: true,
      ),
      logger: TalkerLogger(
        output: (String message) {
          final StringBuffer buffer = StringBuffer();
          final lines = message.split('\n');
          lines.forEach(buffer.writeln);
          Platform.isIOS ? lines.forEach(print) : dev.log(buffer.toString());
        },
      ),
    );

    viewController ??= TalkerViewController()..toggleExpandedLogs();

    if (isInit) {
      FlutterError.onError = (FlutterErrorDetails details) {
        if (details.exception is DioException && CancelToken.isCancel(details.exception as DioException)) {
          // ignore exceptions caused by cancelling dio requests (mostly for image loading)
          return;
        }
        FlutterError.presentError(details);

        Logger.Inst().log('$details', 'FlutterError', 'onError', LogTypes.exception);
      };

      PlatformDispatcher.instance.onError = (error, stack) {
        Logger.Inst().log(
          error,
          'PlatformDispatcherError',
          'onError',
          LogTypes.exception,
        );
        return true;
      };
    }

    return _loggerInstance!;
  }

  static Talker? _talkerInstance;

  static Talker get talker => _talkerInstance!;

  static TalkerViewController? viewController;

  void log(
    dynamic object,
    String callerClass,
    String callerFunction,
    LogTypes? logType, {
    StackTrace? s,
  }) {
    String logStr = '';
    try {
      logStr = object is String ? object : '$object';
    } catch (_) {
      logStr = object.runtimeType.toString();
    }

    if (logStr.length > 10000) {
      logStr = '${logStr.substring(0, 10000)}...';
    }

    final logLevel = logType?.logLevel ?? LogLevel.wtf;
    if (logLevel == LogLevel.info) {
      _talkerInstance?.info(logStr, null, s);
    } else if (logLevel == LogLevel.error) {
      _talkerInstance?.error(logStr, null, s);
    } else if (logLevel == LogLevel.warning) {
      _talkerInstance?.warning(logStr, null, s);
    } else if (logLevel == LogLevel.debug) {
      _talkerInstance?.debug(logStr, null, s);
    } else if (logLevel == LogLevel.verbose) {
      _talkerInstance?.verbose(logStr, null, s);
    } else if (logLevel == LogLevel.wtf) {
      _talkerInstance?.verbose(logStr, null, s);
    } else {
      _talkerInstance?.verbose(logStr, null, s);
    }
  }

  static TalkerDioLogger? get dioInterceptor => _talkerInstance != null
      ? TalkerDioLogger(
          talker: _talkerInstance,
          settings: const TalkerDioLoggerSettings(
            printResponseData: false,
            printRequestData: true,
            printErrorData: true,
            printResponseHeaders: true,
            printRequestHeaders: true,
            printErrorHeaders: true,
            printResponseMessage: true,
            printErrorMessage: true,
          ),
        )
      : null;
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
    return name;
  }

  static LogTypes fromString(String str) {
    return LogTypes.values.firstWhere((element) => element.name == str, orElse: () => LogTypes.exception);
  }

  LogLevel get logLevel {
    switch (this) {
      case LogTypes.booruHandlerFetchFailed:
      case LogTypes.booruHandlerParseFailed:
      case LogTypes.exception:
      case LogTypes.imageLoadingError:
      case LogTypes.networkError:
      case LogTypes.settingsError:
        return LogLevel.error;
      //
      case LogTypes.booruHandlerInfo:
      case LogTypes.booruHandlerRawFetched:
      case LogTypes.booruHandlerSearchURL:
      case LogTypes.booruHandlerTagInfo:
      case LogTypes.booruItemLoad:
      case LogTypes.imageInfo:
      case LogTypes.loliSyncInfo:
      case LogTypes.settingsLoad:
      case LogTypes.tagHandlerInfo:
        return LogLevel.info;
      // ignore: unreachable_switch_default
      default:
        return LogLevel.wtf;
    }
  }
}

enum LogLevel {
  info,
  warning,
  error,
  debug,
  verbose,
  wtf,
}
