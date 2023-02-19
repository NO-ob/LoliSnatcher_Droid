import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

class DioNetwork {
  DioNetwork._();

  static Dio getClient({String? baseUrl}) {
    final dio = Dio();
    dio.options.baseUrl = baseUrl ?? '';
    // dio.options.connectTimeout = 10000;
    // dio.options.receiveTimeout = 30000;
    // dio.options.sendTimeout = 10000;
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
    if (!Tools.isTestMode && SettingsHandler.instance.isDebug.value) {
      dio.interceptors.add(SettingsHandler.instance.alice.getDioInterceptor());
    }
    return dio;
  }

  static Options mergeOptions(Options? options, Map<String, dynamic>? headers) {
    final usedOptions = options ?? defaultOptions;
    return usedOptions.copyWith(
      headers: {
        ...(headers ?? usedOptions.headers ?? defaultOptions.headers!),
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

  static Future<Response> downloadCustom(
    String url,
    String savePath,
    String fileNameWoutExt,
    String fileExt,
    String mediaType, {
    Map<String, dynamic> data = const {},
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers = const {},
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    String lengthHeader = Headers.contentLengthHeader,
    bool deleteOnError = true,
  }) async {
    final urlAndQuery = separateUrlAndQueryParams(url, queryParameters);

    options = DioMixin.checkOptions('GET', mergeOptions(options, headers));
    options.responseType = ResponseType.stream;
    Response<ResponseBody> response;
    try {
      response = await getClient().request<ResponseBody>(
        urlAndQuery['url'],
        data: data,
        options: options,
        queryParameters: urlAndQuery['query'],
        cancelToken: cancelToken ?? CancelToken(),
      );
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        e.response!.data = null;
      }
      rethrow;
    }

    response.headers = Headers.fromMap(response.data!.headers);

    var completer = Completer<Response>();
    var future = completer.future;
    var received = 0;

    var stream = response.data!.stream;
    var compressed = false;
    var total = 0;
    var contentEncoding = response.headers.value(Headers.contentEncodingHeader);
    if (contentEncoding != null) {
      compressed = ['gzip', 'deflate', 'compress'].contains(contentEncoding);
    }
    if (lengthHeader == Headers.contentLengthHeader && compressed) {
      total = -1;
    } else {
      total = int.parse(response.headers.value(lengthHeader) ?? '-1');
    }

    String? fileUri = await ServiceHandler.createFileStreamFromSAFDirectory(fileNameWoutExt, mediaType, fileExt, savePath);

    late StreamSubscription subscription;
    Future? asyncWrite;
    var closed = false;
    Future _closeAndDelete() async {
      if (!closed) {
        closed = true;
        await asyncWrite;
        if (deleteOnError && await ServiceHandler.existsFileStreamFromSAFDirectory(fileUri!)) {
          await ServiceHandler.deleteStreamToFileFromSAFDirectory(fileUri);
        }
      }
    }

    if(fileUri == null) {
      completer.completeError(DioMixin.assureDioError(
        Exception('Error creating saf file'),
        response.requestOptions,
      ));
    }

    subscription = stream.listen(
      (data) {
        subscription.pause();
        
        // Write file asynchronously
        asyncWrite = ServiceHandler.writeStreamToFileFromSAFDirectory(fileUri!, data).then((result) {
          if(!result) {
            throw Exception('Did not write file bytes');
          }

          // Notify progress
          received += data.length;

          onReceiveProgress?.call(received, total);

          if (cancelToken == null || !cancelToken.isCancelled) {
            subscription.resume();
          }
        }).catchError((err, StackTrace stackTrace) async {
          try {
            await subscription.cancel();
          } finally {
            completer.completeError(DioMixin.assureDioError(
              err,
              response.requestOptions,
            ));
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
          completer.completeError(DioMixin.assureDioError(
            e,
            response.requestOptions,
          ));
        }
      },
      onError: (e) async {
        try {
          await _closeAndDelete();
        } finally {
          completer.completeError(DioMixin.assureDioError(
            e,
            response.requestOptions,
          ));
        }
      },
      cancelOnError: true,
    );
    // ignore: unawaited_futures
    cancelToken?.whenCancel.then((_) async {
      await subscription.cancel();
      await _closeAndDelete();
    });

    if (response.requestOptions.receiveTimeout > 0) {
      future = future
          .timeout(Duration(
        milliseconds: response.requestOptions.receiveTimeout,
      ))
          .catchError((Object err) async {
        await subscription.cancel();
        await _closeAndDelete();
        if (err is TimeoutException) {
          throw DioError(
            requestOptions: response.requestOptions,
            error: 'Receiving data timeout[${response.requestOptions.receiveTimeout}ms]',
            type: DioErrorType.receiveTimeout,
          );
        } else {
          throw err;
        }
      });
    }

    return DioMixin.listenCancelForAsyncTask(cancelToken, future);
  }
}
