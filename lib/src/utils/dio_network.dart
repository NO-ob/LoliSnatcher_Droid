import 'package:dio/dio.dart';

class DioNetwork {
  DioNetwork._();

  static Dio createDio({String? baseUrl}) {
    final dio = Dio();
    dio.options.baseUrl = baseUrl ?? '';
    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 0;
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    dio.interceptors.add(LogInterceptor(responseBody: true));
    return dio;
  }

  static CancelToken createCancelToken() {
    return CancelToken();
  }

  static Options defaultOptions() {
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
    Map<String, dynamic> queryParameters = const {},
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final dio = createDio();
    return dio.get(
      url,
      queryParameters: queryParameters,
      options: options ?? defaultOptions(),
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  static Future<Response> post(
    String url, {
    Map<String, dynamic> data = const {},
    Map<String, dynamic> queryParameters = const {},
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
  }) async {
    final dio = createDio();
    return dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options ?? defaultOptions(),
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      onSendProgress: onSendProgress,
    );
  }

  static Future<Response> head(
    String url, {
    Map<String, dynamic> data = const {},
    Map<String, dynamic> queryParameters = const {},
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
  }) async {
    final dio = createDio();
    return dio.head(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options ?? defaultOptions(),
      cancelToken: cancelToken,
    );
  }

  static download(
    String url,
    String savePath, {
    Map<String, dynamic> data = const {},
    Map<String, dynamic> queryParameters = const {},
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    bool deleteOnError = true,
  }) async {
    final dio = createDio();
    return dio.download(
      url,
      savePath,
      data: data,
      queryParameters: queryParameters,
      options: options ?? defaultOptions(),
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      deleteOnError: deleteOnError,
    );
  }
}
