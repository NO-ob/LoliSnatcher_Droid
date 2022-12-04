import 'package:dio/dio.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

class DioNetwork {
  DioNetwork._();

  static Dio getClient({String? baseUrl}) {
    final dio = Dio();
    dio.options.baseUrl = baseUrl ?? '';
    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 30000;
    dio.options.sendTimeout = 10000;
    // dio.interceptors.add(CustomPrettyDioLogger(
    //   request: true,
    //   requestBody: true,
    //   requestHeader: true,
    //   responseBody: true,
    //   responseHeader: true,
    //   logPrint: (Object object) {
    //     if(Tools.isTestMode || SettingsHandler.instance.isDebug.value) {
    //       return print(object);
    //     } 
    //   }
    // ));
    if(!Tools.isTestMode && SettingsHandler.instance.isDebug.value) {
      dio.interceptors.add(SettingsHandler.instance.alice.getDioInterceptor());
    }
    return dio;
  }

  static Options mergeOptions(Options? options, Map<String, dynamic>? headers) {
    return (options ?? defaultOptions).copyWith(
      headers: headers != null ? {
        ...defaultOptions.headers!,
        ...headers, 
      } : null,
    );
  }

  /// used to force alice to intercept query params, because if they are not separate from the url - dio doesn't give them to alice
  static Map<String, dynamic> separateUrlAndQueryParams(String url, Map<String, dynamic>? givenQueryParams) {
    final temp = Uri.tryParse(url);
    if(temp == null) {
      throw Exception('Url parsing failed: $url');
    }

    final String cleanUrl = temp.replace(queryParameters: {}).toString();
    final Map<String, dynamic> queryParams = {
        ...temp.queryParameters,
        ...(givenQueryParams ?? {}),
      };

    // TODO create a separate class for this?
    return {
      "url": Uri.encodeFull(cleanUrl),
      "query": queryParams.isEmpty ? null : queryParams,
    };
  }

  static CancelToken get cancelToken {
    return CancelToken();
  }

  static Options get defaultOptions {
    final options = Options(
      responseType: ResponseType.json,
      contentType: 'application/json',
      sendTimeout: 10000,
      receiveTimeout: 0,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    return options;
  }

  static Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers = const {},
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final urlAndQuery = separateUrlAndQueryParams(url, queryParameters);
    return getClient().get(
      urlAndQuery['url'],
      queryParameters: urlAndQuery['query'],
      options: mergeOptions(options, headers),
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  static Future<Response> post(
    String url, {
    Map<String, dynamic> data = const {},
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers = const {},
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
  }) async {
    final urlAndQuery = separateUrlAndQueryParams(url, queryParameters);
    return getClient().post(
      urlAndQuery['url'],
      data: data,
      queryParameters: urlAndQuery['query'],
      options: mergeOptions(options, headers),
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      onSendProgress: onSendProgress,
    );
  }

  static Future<Response> head(
    String url, {
    Map<String, dynamic> data = const {},
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers = const {},
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
  }) async {
    final urlAndQuery = separateUrlAndQueryParams(url, queryParameters);
    return getClient().head(
      urlAndQuery['url'],
      data: data,
      queryParameters: urlAndQuery['query'],
      options: mergeOptions(options, headers),
      cancelToken: cancelToken,
    );
  }

  static download(
    String url,
    String savePath, {
    Map<String, dynamic> data = const {},
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers = const {},
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    bool deleteOnError = true,
  }) async {
    final urlAndQuery = separateUrlAndQueryParams(url, queryParameters);
    return getClient().download(
      urlAndQuery['url'],
      savePath,
      data: data,
      queryParameters: urlAndQuery['query'],
      options: mergeOptions(options, headers),
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      deleteOnError: deleteOnError,
    );
  }
}
