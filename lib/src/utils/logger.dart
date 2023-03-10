import 'dart:math' as math;

import 'package:dio/dio.dart';
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
    if (!Tools.isTestMode) {
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
      if (!Tools.isTestMode) {
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
    if (Tools.isTestMode) {
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

class CustomPrettyDioLogger extends Interceptor {
  /// Print request [Options]
  final bool request;

  /// Print request header [Options.headers]
  final bool requestHeader;

  /// Print request data [Options.data]
  final bool requestBody;

  /// Print [Response.data]
  final bool responseBody;

  /// Print [Response.headers]
  final bool responseHeader;

  /// Print error message
  final bool error;

  /// InitialTab count to logPrint json response
  static const int initialTab = 1;

  /// 1 tab length
  static const String tabStep = '    ';

  /// Print compact json response
  final bool compact;

  /// Width size per logPrint
  final int maxWidth;

  /// Log printer; defaults logPrint log to console.
  /// In flutter, you'd better use debugPrint.
  /// you can also write log in a file.
  void Function(Object object) logPrint;

  CustomPrettyDioLogger(
      {this.request = true,
      this.requestHeader = false,
      this.requestBody = false,
      this.responseHeader = false,
      this.responseBody = true,
      this.error = true,
      this.maxWidth = 90,
      this.compact = true,
      this.logPrint = print});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (request) {
      _printRequestHeader(options);
    }
    if (requestHeader) {
      _printMapAsTable(options.queryParameters, header: 'Query Parameters');
      final requestHeaders = <String, dynamic>{};
      requestHeaders.addAll(options.headers);
      requestHeaders['contentType'] = options.contentType?.toString();
      requestHeaders['responseType'] = options.responseType.toString();
      requestHeaders['followRedirects'] = options.followRedirects;
      requestHeaders['connectTimeout'] = options.connectTimeout;
      requestHeaders['receiveTimeout'] = options.receiveTimeout;
      _printMapAsTable(requestHeaders, header: 'Headers');
      _printMapAsTable(options.extra, header: 'Extras');
    }
    if (requestBody && options.method != 'GET') {
      final dynamic data = options.data;
      if (data != null) {
        if (data is Map) _printMapAsTable(options.data as Map?, header: 'Body');
        if (data is FormData) {
          final formDataMap = <String, dynamic>{}
            ..addEntries(data.fields)
            ..addEntries(data.files);
          _printMapAsTable(formDataMap, header: 'Form data | ${data.boundary}');
        } else {
          _printBlock(data.toString());
        }
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (error) {
      if (err.type == DioErrorType.badResponse) {
        final uri = err.response?.requestOptions.uri;
        _printBoxed(
            header:
                'DioError ║ Status: ${err.response?.statusCode} ${err.response?.statusMessage}',
            text: uri.toString());
        if (err.response != null && err.response?.data != null) {
          logPrint('╔ ${err.type.toString()}');
          _printResponse(err.response!);
        }
        _printLine('╚');
        logPrint('');
      } else {
        _printBoxed(header: 'DioError ║ ${err.type}', text: err.message);
      }
    }
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _printResponseHeader(response);
    if (responseHeader) {
      final responseHeaders = <String, String>{};
      response.headers
          .forEach((k, list) => responseHeaders[k] = list.toString());
      _printMapAsTable(responseHeaders, header: 'Headers');
    }

    if (responseBody) {
      logPrint('╔ Body');
      logPrint('║');
      _printResponse(response);
      logPrint('║');
      _printLine('╚');
    }
    super.onResponse(response, handler);
  }

  void _printBoxed({String? header, String? text}) {
    logPrint('');
    logPrint('╔╣ $header');
    logPrint('║  $text');
    _printLine('╚');
  }

  void _printResponse(Response response) {
    if (response.data != null) {
      if (response.data is Map) {
        _printPrettyMap(response.data as Map);
      } else if (response.data is List) {
        logPrint('║${_indent()}[');
        if(response.data is List<int> && response.requestOptions.responseType == ResponseType.bytes) {
          _printBlock('[response bytes list]');
        } else {
          _printList(response.data as List);
        }
        logPrint('║${_indent()}[');
      } else {
        _printBlock(response.data.toString());
      }
    }
  }

  void _printResponseHeader(Response response) {
    final uri = response.requestOptions.uri;
    final method = response.requestOptions.method;
    _printBoxed(
        header:
            'Response ║ $method ║ Status: ${response.statusCode} ${response.statusMessage}',
        text: uri.toString());
  }

  void _printRequestHeader(RequestOptions options) {
    final uri = options.uri;
    final method = options.method;
    _printBoxed(header: 'Request ║ $method ', text: uri.toString());
  }

  void _printLine([String pre = '', String suf = '╝']) =>
      logPrint('$pre${'═' * maxWidth}$suf');

  void _printKV(String? key, Object? v) {
    final pre = '╟ $key: ';
    final msg = v.toString();

    if (pre.length + msg.length > maxWidth) {
      logPrint(pre);
      _printBlock(msg);
    } else {
      logPrint('$pre$msg');
    }
  }

  void _printBlock(String msg) {
    final lines = (msg.length / maxWidth).ceil();
    for (var i = 0; i < lines; ++i) {
      logPrint((i >= 0 ? '║ ' : '') +
          msg.substring(i * maxWidth,
              math.min<int>(i * maxWidth + maxWidth, msg.length)));
    }
  }

  String _indent([int tabCount = initialTab]) => tabStep * tabCount;

  void _printPrettyMap(
    Map data, {
    int tabs = initialTab,
    bool isListItem = false,
    bool isLast = false,
  }) {
    var _tabs = tabs;
    final isRoot = _tabs == initialTab;
    final initialIndent = _indent(_tabs);
    _tabs++;

    if (isRoot || isListItem) logPrint('║$initialIndent{');

    data.keys.toList().asMap().forEach((index, dynamic key) {
      final isLast = index == data.length - 1;
      dynamic value = data[key];
      if (value is String) {
        value = '"${value.toString().replaceAll(RegExp(r'(\r|\n)+'), " ")}"';
      }
      if (value is Map) {
        if (compact && _canFlattenMap(value)) {
          logPrint('║${_indent(_tabs)} $key: $value${!isLast ? ',' : ''}');
        } else {
          logPrint('║${_indent(_tabs)} $key: {');
          _printPrettyMap(value, tabs: _tabs);
        }
      } else if (value is List) {
        if (compact && _canFlattenList(value)) {
          logPrint('║${_indent(_tabs)} $key: ${value.toString()}');
        } else {
          logPrint('║${_indent(_tabs)} $key: [');
          _printList(value, tabs: _tabs);
          logPrint('║${_indent(_tabs)} ]${isLast ? '' : ','}');
        }
      } else {
        final msg = value.toString().replaceAll('\n', '');
        final indent = _indent(_tabs);
        final linWidth = maxWidth - indent.length;
        if (msg.length + indent.length > linWidth) {
          final lines = (msg.length / linWidth).ceil();
          for (var i = 0; i < lines; ++i) {
            logPrint(
                '║${_indent(_tabs)} ${msg.substring(i * linWidth, math.min<int>(i * linWidth + linWidth, msg.length))}');
          }
        } else {
          logPrint('║${_indent(_tabs)} $key: $msg${!isLast ? ',' : ''}');
        }
      }
    });

    logPrint('║$initialIndent}${isListItem && !isLast ? ',' : ''}');
  }

  void _printList(List list, {int tabs = initialTab}) {
    list.asMap().forEach((i, dynamic e) {
      final isLast = i == list.length - 1;
      if (e is Map) {
        if (compact && _canFlattenMap(e)) {
          logPrint('║${_indent(tabs)}  $e${!isLast ? ',' : ''}');
        } else {
          _printPrettyMap(e, tabs: tabs + 1, isListItem: true, isLast: isLast);
        }
      } else {
        logPrint('║${_indent(tabs + 2)} $e${isLast ? '' : ','}');
      }
    });
  }

  bool _canFlattenMap(Map map) {
    return map.values
            .where((dynamic val) => val is Map || val is List)
            .isEmpty &&
        map.toString().length < maxWidth;
  }

  bool _canFlattenList(List list) {
    return list.length < 10 && list.toString().length < maxWidth;
  }

  void _printMapAsTable(Map? map, {String? header}) {
    if (map == null || map.isEmpty) return;
    logPrint('╔ $header ');
    map.forEach(
        (dynamic key, dynamic value) => _printKV(key.toString(), value));
    _printLine('╚');
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
    return name;
  }

  static LogTypes fromString(String str) {
    return LogTypes.values.firstWhere((element) => element.name == str,orElse: () => LogTypes.exception);
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
