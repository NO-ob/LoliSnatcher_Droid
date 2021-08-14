import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import 'package:LoliSnatcher/ImageWriter.dart';

class DioLoader {
  DioLoader(
    this.url, {
    this.headers = const <String, dynamic>{},
    this.cancelToken,
    this.onProgress,
    this.onEvent,
    this.onError,
    required this.onDone,
    required this.cacheEnabled,
    required this.cacheFolder,
    this.timeoutTime,
  });

  final String url;
  final Map<String, dynamic>? headers;
  final CancelToken? cancelToken;
  final void Function(int, int)? onProgress;
  final void Function(String)? onEvent;
  final void Function(Exception)? onError;
  final void Function(Uint8List, String) onDone;
  final bool cacheEnabled;
  final String cacheFolder;
  final int? timeoutTime;

  static Dio get _httpClient {
    Dio client = Dio();
    return client;
  }

  bool isRedirectBroken(String redirect) {
    // TODO add checks for sankaku outdated links and others
    return false;
  }

  void runRequest() async {
    try {
      final String resolved = Uri.base.resolve(url).toString();

      final ImageWriter imageWriter = ImageWriter();

      final String? filePath = await imageWriter.getCachePath(resolved, cacheFolder, clearName: cacheFolder == 'favicons' ? false : true);
      // print('path found: $filePath');
      if (filePath != null) {
        // read from cache
        final File file = File(filePath);
        onEvent?.call('isFromCache');
        onEvent?.call('loaded');
        onDone.call(await file.readAsBytes(), url);
      } else {
        onEvent?.call('isFromNetwork');
        // load from network and cache if enabled
        final Response response = await _httpClient.get(
          resolved.toString(),
          options: Options(responseType: ResponseType.bytes, headers: headers, sendTimeout: timeoutTime, receiveTimeout: timeoutTime),
          cancelToken: cancelToken,
          onReceiveProgress: onProgress,
        );

        if(response.isRedirect == true && isRedirectBroken(response.realUri.toString())) {
          throw DioLoadException(url: response.realUri.toString(), message: 'Image was redirected to a broken link, url should be: $resolved');
        }

        if (response.statusCode != HttpStatus.ok) {
          throw DioLoadException(url: resolved, statusCode: response.statusCode);
        }

        if (response.data == null || response.data.lengthInBytes == 0) {
          throw DioLoadException(url: resolved, message: "File didn\'t load");
        }

        if (cacheEnabled) {
          imageWriter.writeCacheFromBytes(resolved, response.data, cacheFolder, clearName: cacheFolder == 'favicons' ? false : true);
        }

        onEvent?.call('loaded');
        onDone.call(response.data, url);
      }
    } catch (e) {
      if(e is Exception) {
        onError?.call(e);
      } else {
        print('Exception: $e');
      }
    }
  }
}

class DioLoadException implements Exception {
  DioLoadException({required this.url, this.statusCode, this.message});

  final int? statusCode;
  final String? message;
  final String url;

  @override
  String toString() => 'Dio Request failed, statusCode: $statusCode, url: $url, msg: $message';

  String toStringShort() => '${statusCode ?? message ?? 'Error'}';
}
