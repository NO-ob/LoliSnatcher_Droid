// ignore_for_file: invalid_use_of_internal_member

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';

import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/pages/settings/network_page.dart';
import 'package:lolisnatcher/src/utils/http_overrides.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

class DioNetwork {
  DioNetwork._();

  static Dio getClient({String? baseUrl}) {
    final dio = Dio();
    // dio.httpClientAdapter = NativeAdapter();
    dio.options.baseUrl = baseUrl ?? '';
    // dio.options.connectTimeout = Duration(seconds: 10);
    // dio.options.receiveTimeout = Duration(seconds: 30);
    // dio.options.sendTimeout = Duration(seconds: 10);

    final settingsHandler = SettingsHandler.instance;
    final proxyType = ProxyType.fromName(settingsHandler.proxyType);
    if (proxyType.isDirect || (proxyType.isSystem && systemProxyAddress.isEmpty) || getProxyConfigAddress().isEmpty) {
      dio.httpClientAdapter = Http2Adapter(
        ConnectionManager(
          idleTimeout: const Duration(seconds: 30),
        ),
      );
    }

    if (Tools.isTestMode || settingsHandler.isDebug.value) {
      dio.interceptors.add(Logger.dioInterceptor!);
      dio.interceptors.add(settingsHandler.alice.getDioInterceptor());
    }
    return dio;
  }

  static Options mergeOptions(Options? options, Map<String, dynamic>? headers) {
    final usedOptions = options ?? defaultOptions;
    return usedOptions.copyWith(
      headers: {
        ...headers ?? usedOptions.headers ?? defaultOptions.headers!,
      },
    );
  }

  /// used to force alice to intercept query params, because if they are not separate from the url - dio doesn't give them to alice
  static Map<String, dynamic> separateUrlAndQueryParams(String url, Map<String, dynamic>? givenQueryParams) {
    final temp = Uri.tryParse(url);
    if (temp == null) {
      throw Exception('Url parsing failed: $url');
    }

    final String cleanUrl = temp.replace(queryParameters: {}).toString();
    final Map<String, dynamic> queryParams = {
      ...temp.queryParameters,
      ...givenQueryParams ?? {},
    };

    // TODO create a separate class for this?
    return {
      'url': Uri.encodeFull(cleanUrl).replaceAll('%25', '%'),
      'query': queryParams.isEmpty ? null : queryParams,
    };
  }

  static Dio captchaInterceptor(Dio client, {String? customUserAgent}) {
    client.interceptors.add(
      InterceptorsWrapper(
        onResponse: (Response response, ResponseInterceptorHandler handler) async {
          // print('[response]');
          final bool captchaWasDetected = await Tools.checkForCaptcha(
            response,
            response.realUri,
            customUserAgent: customUserAgent,
          );
          if (!captchaWasDetected) {
            return handler.next(response);
          }

          final String oldCookie = response.requestOptions.headers['Cookie'] as String? ?? '';
          final String newCookie = await Tools.getCookies(response.requestOptions.uri.toString());
          final headers = {
            ...response.requestOptions.headers,
            'Cookie': '${oldCookie.replaceAll('cf_clearance', 'cf_clearance_old')} $newCookie'.trim(),
            Tools.captchaCheckHeader: 'done',
          };

          final opts = Options(
            method: response.requestOptions.method,
            headers: headers,
          );

          try {
            final cloneReq = await client.request(
              response.requestOptions.path,
              options: opts,
              data: response.requestOptions.data,
              queryParameters: response.requestOptions.queryParameters,
            );
            return handler.resolve(cloneReq);
          } catch (e) {
            return handler.next(response);
          }
        },
        onError: (DioException error, ErrorInterceptorHandler handler) async {
          // print('[error]: ${error.message} ${error.response?.statusCode}');
          final bool captchaWasDetected = await Tools.checkForCaptcha(error.response, error.requestOptions.uri);
          if (!captchaWasDetected) {
            return handler.next(error);
          }

          final String oldCookie = error.requestOptions.headers['Cookie'] as String? ?? '';
          final String newCookie = await Tools.getCookies(error.requestOptions.uri.toString());
          final headers = {
            ...error.requestOptions.headers,
            'Cookie': '${oldCookie.replaceAll('cf_clearance', 'cf_clearance_old')} $newCookie'.trim(),
            Tools.captchaCheckHeader: 'done',
          };

          final opts = Options(
            method: error.requestOptions.method,
            headers: headers,
          );

          try {
            final cloneReq = await client.request(
              error.requestOptions.path,
              options: opts,
              data: error.requestOptions.data,
              queryParameters: error.requestOptions.queryParameters,
            );
            return handler.resolve(cloneReq);
          } catch (e) {
            return handler.next(error);
          }
        },
      ),
    );
    return client;
  }

  static Options get defaultOptions {
    final options = Options(
      responseType: ResponseType.json,
      contentType: 'application/json',
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
    Dio Function(Dio)? customInterceptor,
  }) async {
    final client = customInterceptor != null ? customInterceptor(getClient()) : getClient();
    final urlAndQuery = separateUrlAndQueryParams(url, queryParameters);

    final res = await client.get(
      urlAndQuery['url'],
      queryParameters: urlAndQuery['query'],
      options: mergeOptions(options, headers),
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    client.close();
    return res;
  }

  static Future<Response> post(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers = const {},
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
    Dio Function(Dio)? customInterceptor,
  }) async {
    final client = customInterceptor != null ? customInterceptor(getClient()) : getClient();
    final urlAndQuery = separateUrlAndQueryParams(url, queryParameters);

    final res = await client.post(
      urlAndQuery['url'],
      data: data,
      queryParameters: urlAndQuery['query'],
      options: mergeOptions(options, headers),
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      onSendProgress: onSendProgress,
    );
    client.close();
    return res;
  }

  static Future<Response> head(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers = const {},
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
    Dio Function(Dio)? customInterceptor,
  }) async {
    final client = customInterceptor != null ? customInterceptor(getClient()) : getClient();
    final urlAndQuery = separateUrlAndQueryParams(url, queryParameters);

    final res = await client.head(
      urlAndQuery['url'],
      data: data,
      queryParameters: urlAndQuery['query'],
      options: mergeOptions(options, headers),
      cancelToken: cancelToken,
    );
    client.close();
    return res;
  }

  static Future<Response> download(
    String url,
    String savePath, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers = const {},
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    bool deleteOnError = true,
    Dio Function(Dio)? customInterceptor,
  }) async {
    final client = customInterceptor != null ? customInterceptor(getClient()) : getClient();
    final urlAndQuery = separateUrlAndQueryParams(url, queryParameters);

    final res = await client.download(
      urlAndQuery['url'],
      savePath,
      data: data,
      queryParameters: urlAndQuery['query'],
      options: mergeOptions(options, headers),
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      deleteOnError: deleteOnError,
    );
    client.close();
    return res;
  }

  static Future<Response> downloadCustom(
    String url,
    String savePath,
    String fileNameWoutExt,
    String fileExt,
    String mediaType, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers = const {},
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    String lengthHeader = Headers.contentLengthHeader,
    bool deleteOnError = true,
    Dio Function(Dio)? customInterceptor,
  }) async {
    final client = customInterceptor != null ? customInterceptor(getClient()) : getClient();
    final urlAndQuery = separateUrlAndQueryParams(url, queryParameters);

    options = DioMixin.checkOptions('GET', mergeOptions(options, headers));
    options.responseType = ResponseType.stream;
    Response<ResponseBody> response;
    try {
      response = await client.request<ResponseBody>(
        urlAndQuery['url'],
        data: data,
        options: options,
        queryParameters: urlAndQuery['query'],
        cancelToken: cancelToken ?? CancelToken(),
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        e.response!.data = null;
      }
      rethrow;
    } finally {
      client.close();
    }

    response.headers = Headers.fromMap(response.data!.headers);

    final completer = Completer<Response>();
    Future<Response> future = completer.future;
    int received = 0;

    final stream = response.data!.stream;
    bool compressed = false;
    int total = 0;
    final contentEncoding = response.headers.value(
      Headers.contentEncodingHeader,
    );
    if (contentEncoding != null) {
      compressed = ['gzip', 'deflate', 'compress'].contains(contentEncoding);
    }
    if (lengthHeader == Headers.contentLengthHeader && compressed) {
      total = -1;
    } else {
      total = int.parse(response.headers.value(lengthHeader) ?? '-1');
    }

    final String? fileUri = await ServiceHandler.createFileStreamFromSAFDirectory(
      fileNameWoutExt,
      mediaType,
      fileExt,
      savePath,
    );

    Future<void>? asyncWrite;
    bool closed = false;
    Future<void> closeAndDelete() async {
      if (!closed) {
        closed = true;
        await asyncWrite;
        if (deleteOnError && await ServiceHandler.existsFileStreamFromSAFDirectory(fileUri!)) {
          await ServiceHandler.deleteStreamToFileFromSAFDirectory(fileUri);
        }
      }
    }

    if (fileUri == null) {
      completer.completeError(
        DioMixin.assureDioException(Exception('Error creating saf file'), response.requestOptions),
      );
    }

    late StreamSubscription subscription;
    subscription = stream.listen(
      (data) {
        subscription.pause();

        // Write file asynchronously
        asyncWrite = ServiceHandler.writeStreamToFileFromSAFDirectory(fileUri!, data)
            .then((result) {
              if (!result) {
                throw Exception('Did not write file bytes');
              }

              // Notify progress
              received += data.length;

              onReceiveProgress?.call(received, total);

              if (cancelToken == null || !cancelToken.isCancelled) {
                subscription.resume();
              }
            })
            .catchError((dynamic e, StackTrace s) async {
              try {
                await subscription.cancel();
              } finally {
                completer.completeError(
                  DioMixin.assureDioException(e, response.requestOptions),
                );
              }
            });
      },
      onDone: () async {
        try {
          await asyncWrite;
          closed = true;
          await ServiceHandler.closeStreamToFileFromSAFDirectory(fileUri!);
          completer.complete(response);
        } catch (e) {
          completer.completeError(
            DioMixin.assureDioException(e, response.requestOptions),
          );
        }
      },
      onError: (e, s) async {
        try {
          await closeAndDelete();
        } finally {
          completer.completeError(
            DioMixin.assureDioException(e, response.requestOptions),
          );
        }
      },
      cancelOnError: true,
    );
    unawaited(
      cancelToken?.whenCancel.then((_) async {
        await subscription.cancel();
        await closeAndDelete();
      }),
    );

    final timeout = response.requestOptions.receiveTimeout;
    if (timeout != null) {
      future = future.timeout(timeout).catchError((dynamic e, StackTrace s) async {
        await subscription.cancel();
        await closeAndDelete();
        if (e is TimeoutException) {
          throw DioException.receiveTimeout(
            timeout: timeout,
            requestOptions: response.requestOptions,
          );
        } else {
          throw e;
        }
      });
    }

    return DioMixin.listenCancelForAsyncTask(cancelToken, future);
  }
}
