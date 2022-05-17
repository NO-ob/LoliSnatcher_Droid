import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import 'package:LoliSnatcher/ImageWriter.dart';
import 'package:LoliSnatcher/ImageWriterIsolate.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';

class DioLoader {
  DioLoader(
    this.url,
    {
      this.headers = const <String, dynamic>{},
      this.cancelToken,
      this.onProgress,
      this.onEvent,
      this.onError,
      this.onDone,
      this.onDoneFile,
      this.cacheEnabled = false,
      this.cacheFolder = 'other',
      this.timeoutTime,
    }
  );

  final String url;
  final Map<String, dynamic>? headers;
  final CancelToken? cancelToken;
  final void Function(int, int)? onProgress;
  final void Function(String, dynamic?)? onEvent;
  final void Function(Exception)? onError;
  final void Function(Uint8List, String)? onDone;
  final void Function(File, String)? onDoneFile;
  final bool cacheEnabled;
  final String cacheFolder;
  final int? timeoutTime;

  Isolate? isolate;
  ReceivePort receivePort = ReceivePort();
  Dio? currentClient;

  static Dio get _httpClient {
    Dio client = Dio();
    // TODO bad certificate ignore, FIX AND REMOVE LATER
    // https://stackoverflow.com/questions/54285172/how-to-solve-flutter-certificate-verify-failed-error-while-performing-a-post-req
    // (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    // (HttpClient client) {
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) => true;
    //   return client;
    // };
    return client;
  }

  void dispose() {
    // print('disposed class');
    receivePort.close();
    isolate?.kill(priority: Isolate.immediate);
    isolate = null;
    currentClient?.close(force: true);
    currentClient = null;
  }

  bool isRedirectBroken(String redirect) {
    // TODO add checks for sankaku outdated links and others
    return false;
  }

  Future<void> start(Uint8List? bytes, void Function(dynamic) func, void Function(dynamic) callback) async {
    isolate = await Isolate.spawn(func, receivePort.sendPort);
    receivePort.listen((dynamic data) async {
      if (data is SendPort) {
        data.send({
          'cacheRootPath': await ServiceHandler().getCacheDir(),
          'fileURL': url,
          'bytes': bytes,
          'typeFolder': cacheFolder,
        });
      } else {
        callback(data);
      }
    },
    onDone: null
    // () {
    //     print("Done!");
    // }
    );
  }

  static void writeToCache(dynamic d) async {
    final ReceivePort receivePort = ReceivePort();
    d.send(receivePort.sendPort);

    final IsolateCacheConfig config = IsolateCacheConfig.fromHost(await receivePort.first);
    File? file = await (ImageWriterIsolate(
      config.cacheRootPath
    ).writeCacheFromBytes(
      config.fileURL,
      config.bytes, 
      config.typeFolder,
      clearName: config.typeFolder == 'favicons' ? false : true
    ));
    d.send(file);
  }

  static void readFileFromCache(dynamic d) async {
    final ReceivePort receivePort = ReceivePort();
    d.send(receivePort.sendPort);

    final IsolateCacheConfig config = IsolateCacheConfig.fromHost(await receivePort.first);
    File? file = await (ImageWriterIsolate(
      config.cacheRootPath
    ).readFileFromCache(
      config.fileURL,
      config.typeFolder,
      clearName: config.typeFolder == 'favicons' ? false : true
    ));
    d.send(file);
  }

  static void readBytesFromCache(dynamic d) async {
    final ReceivePort receivePort = ReceivePort();
    d.send(receivePort.sendPort);

    final IsolateCacheConfig config = IsolateCacheConfig.fromHost(await receivePort.first);
    Uint8List? file = await (ImageWriterIsolate(
      config.cacheRootPath
    ).readBytesFromCache(
      config.fileURL,
      config.typeFolder,
      clearName: config.typeFolder == 'favicons' ? false : true
    ));
    d.send(file);
  }

  Future<void> runRequestIsolate() async {
    try {
      final String resolved = Uri.base.resolve(url).toString();

      final String? filePath = await ImageWriter().getCachePath(resolved, cacheFolder, clearName: cacheFolder == 'favicons' ? false : true);
      // print('path found: $filePath');
      if (filePath != null) {
        // read from cache
        final File fileToCache = File(filePath);
        final FileStat fileStat = await fileToCache.stat();
        onEvent?.call('isFromCache', null);
        onProgress?.call(fileStat.size, fileStat.size);

        if(onDoneFile != null) {
          start(null, readFileFromCache, (dynamic file) async {
            if(file != null) {
              onEvent?.call('loaded', null);
              onDoneFile?.call(file as File, url);
            }
            dispose();
          });
        } else if (onDone != null) {
          start(null, readBytesFromCache, (dynamic bytes) async {
            if(bytes != null) {
              onEvent?.call('loaded', null);
              onDone?.call(bytes as Uint8List, url);
            }
            dispose();
          });
        }
        return;
      } else {
        // load from network and cache if enabled
        onEvent?.call('isFromNetwork', null);
        currentClient = _httpClient;
        final Response response = await currentClient!.get(
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
          if(onDoneFile == null && onDone != null) {
            // return bytes if file is not requested
            onEvent?.call('loaded', null);
            onDone?.call(response.data as Uint8List, url);
          }
          start(response.data as Uint8List?, writeToCache, (dynamic file) {
            if(file != null) {
              // onEvent?.call('isFromCache');
              onEvent?.call('loaded', null);
              onDoneFile?.call(file as File, url);
            }
            dispose();
          });
        } else {
          onEvent?.call('loaded', null);
          onDone?.call(response.data as Uint8List, url);
          dispose();
        }
        return;
      }
    } catch (e) {
      if(e is Exception) {
        onError?.call(e);
      } else {
        print('Exception: $e');
      }
      dispose();
    }
  }

  Future<void> runRequest() async {
    try {
      final String resolved = Uri.base.resolve(url).toString();

      final ImageWriter imageWriter = ImageWriter();

      final String? filePath = await imageWriter.getCachePath(resolved, cacheFolder, clearName: cacheFolder == 'favicons' ? false : true);
      // print('path found: $filePath');
      if (filePath != null) {
        // read from cache
        final File file = File(filePath);
        final FileStat fileStat = await file.stat();
        onEvent?.call('isFromCache', null);
        onProgress?.call(fileStat.size, fileStat.size);
        onEvent?.call('loaded', null);

        if (onDoneFile != null) {
          await file.readAsBytes();
          onDoneFile?.call(file, url);
          dispose();
        } else if(onDone != null) {
          onDone?.call(await file.readAsBytes(), url);
          dispose();
        }
        return;
      } else {
        // load from network and cache if enabled
        onEvent?.call('isFromNetwork', null);
        currentClient = _httpClient;
        final Response response = await currentClient!.get(
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

        File? tempFile;
        if (cacheEnabled) {
          tempFile = await imageWriter.writeCacheFromBytes(resolved, response.data as Uint8List, cacheFolder, clearName: cacheFolder == 'favicons' ? false : true);
          if(tempFile != null) {
            // onEvent?.call('isFromCache');
          }
        }

        onEvent?.call('loaded', null);
        if (onDoneFile != null && tempFile != null) {
          onDoneFile?.call(tempFile, url);
          dispose();
        } else if(onDone != null) {
          onDone?.call(response.data as Uint8List, url);
          dispose();
        }
        return;
      }
    } catch (e) {
      if(e is Exception) {
        onError?.call(e);
      } else {
        print('Exception: $e');
      }
      dispose();
    }
  }


  // get only the file size
  Future<void> runRequestSize() async {
    try {
      final String resolved = Uri.base.resolve(url).toString();

      currentClient = _httpClient;
      final Response response = await currentClient!.head(
        resolved.toString(),
        options: Options(responseType: ResponseType.bytes, headers: headers, sendTimeout: timeoutTime, receiveTimeout: timeoutTime),
        cancelToken: cancelToken,
      );

      // print('response size: ${response.headers['content-length']}');

      if(response.isRedirect == true && isRedirectBroken(response.realUri.toString())) {
        throw DioLoadException(url: response.realUri.toString(), message: 'Image was redirected to a broken link, url should be: $resolved');
      }

      if (response.statusCode != HttpStatus.ok) {
        throw DioLoadException(url: resolved, statusCode: response.statusCode);
      }

      onEvent?.call('size', int.tryParse(response.headers['content-length']?.first ?? '') ?? 0);
      dispose();
      return;
    } catch (e) {
      if(e is Exception) {
        onError?.call(e);
      } else {
        print('Exception: $e');
      }
      dispose();
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


class IsolateCacheConfig {
  final String cacheRootPath;
  final String fileURL;
  final List<int> bytes;
  final String typeFolder;

  IsolateCacheConfig({required this.cacheRootPath, required this.fileURL, required this.bytes, required this.typeFolder});

  IsolateCacheConfig.fromHost(dynamic data)
    : cacheRootPath = data['cacheRootPath'] as String,
      fileURL = data['fileURL'] as String,
      bytes = data['bytes'] as List<int>? ?? [],
      typeFolder = data['typeFolder'] as String;

}