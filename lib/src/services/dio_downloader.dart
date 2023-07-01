import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/services/image_writer.dart';
import 'package:lolisnatcher/src/services/image_writer_isolate.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

class DioDownloader {
  DioDownloader(
    this.url, {
    this.headers = const <String, dynamic>{},
    this.cancelToken,
    this.onProgress,
    this.onEvent,
    this.onError,
    this.onDone,
    this.onDoneFile,
    this.cacheEnabled = false,
    this.cacheFolder = 'other',
    this.timeoutDuration,
    this.fileNameExtras = '',
  });

  final String url;
  final Map<String, dynamic>? headers;
  final CancelToken? cancelToken;
  final void Function(int, int)? onProgress;
  final void Function(String, dynamic)? onEvent;
  final void Function(Exception)? onError;
  final void Function(Uint8List, String)? onDone;
  final void Function(File)? onDoneFile;
  final bool cacheEnabled;
  final String cacheFolder;
  final Duration? timeoutDuration;
  final String fileNameExtras;

  Isolate? isolate;
  ReceivePort receivePort = ReceivePort();
  Dio? currentClient;

  void dispose() {
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
    receivePort.listen(
      (dynamic data) async {
        if (data is SendPort) {
          data.send({
            'cacheRootPath': await ServiceHandler.getCacheDir(),
            'fileURL': url,
            'bytes': bytes,
            'typeFolder': cacheFolder,
            'fileNameExtras': fileNameExtras,
          });
        } else {
          callback(data);
        }
      },
      onDone: null,
    );
  }

  static void writeToCache(dynamic d) async {
    final ReceivePort receivePort = ReceivePort();
    d.send(receivePort.sendPort);

    final IsolateCacheConfig config = IsolateCacheConfig.fromHost(await receivePort.first);
    File? file = await (ImageWriterIsolate(config.cacheRootPath).writeCacheFromBytes(
      config.fileURL,
      config.bytes,
      config.typeFolder,
      clearName: config.typeFolder == 'favicons' ? false : true,
      fileNameExtras: config.fileNameExtras,
    ));
    d.send(file);
  }

  static void readFileFromCache(dynamic d) async {
    final ReceivePort receivePort = ReceivePort();
    d.send(receivePort.sendPort);

    final IsolateCacheConfig config = IsolateCacheConfig.fromHost(await receivePort.first);
    File? file = await (ImageWriterIsolate(config.cacheRootPath).readFileFromCache(
      config.fileURL,
      config.typeFolder,
      clearName: config.typeFolder == 'favicons' ? false : true,
      fileNameExtras: config.fileNameExtras,
    ));
    d.send(file);
  }

  static void readBytesFromCache(dynamic d) async {
    final ReceivePort receivePort = ReceivePort();
    d.send(receivePort.sendPort);

    final IsolateCacheConfig config = IsolateCacheConfig.fromHost(await receivePort.first);
    Uint8List? file = await (ImageWriterIsolate(config.cacheRootPath).readBytesFromCache(
      config.fileURL,
      config.typeFolder,
      clearName: config.typeFolder == 'favicons' ? false : true,
      fileNameExtras: config.fileNameExtras,
    ));
    d.send(file);
  }

  Future<String> getCookies() async {
    String cookieString = '';
    if (Platform.isAndroid || Platform.isIOS) {
      // TODO add when there is desktop support?
      try {
        final CookieManager cookieManager = CookieManager.instance();
        final List<Cookie> cookies = await cookieManager.getCookies(url: Uri.parse(url));
        for (Cookie cookie in cookies) {
          cookieString += '${cookie.name}=${cookie.value}; ';
        }
      } catch (e) {
        Logger.Inst().log(e.toString(), 'DioDownloader', "getCookies", LogTypes.exception);
      }
    }

    cookieString = cookieString.trim();

    return cookieString;
  }

  Future<Map<String, dynamic>> getHeaders() async {
    Map<String, dynamic> resultHeaders = {...headers ?? {}};
    String cookieString = await getCookies();
    if (cookieString.isNotEmpty) {
      resultHeaders['Cookie'] = cookieString;
    }
    return resultHeaders;
  }

  Future<void> runRequestIsolate() async {
    try {
      final String resolved = Uri.base.resolve(url).toString();

      final String? filePath =
          await ImageWriter().getCachePath(resolved, cacheFolder, clearName: cacheFolder == 'favicons' ? false : true, fileNameExtras: fileNameExtras);
      if (filePath != null) {
        // read from cache
        final File fileToCache = File(filePath);
        final int fileSize = await fileToCache.length();
        onEvent?.call('isFromCache', null);
        onProgress?.call(fileSize, fileSize);

        if (onDoneFile != null) {
          await start(null, readFileFromCache, (dynamic file) async {
            if (file != null) {
              onEvent?.call('loaded', null);
              onDoneFile?.call(file as File);
            }
            dispose();
          });
        } else if (onDone != null) {
          await start(null, readBytesFromCache, (dynamic bytes) async {
            if (bytes != null) {
              onEvent?.call('loaded', null);
              onDone?.call(bytes as Uint8List, url);
            }
            dispose();
          });
        }
        return;
      }
    } catch (e) {
      Logger.Inst().log('Error getting from cache $url :: $e', runtimeType.toString(), 'runRequestIsolate', LogTypes.imageLoadingError);
      if (e is Exception) {
        onError?.call(e);
      } else {
        //
      }
      // dispose();
    }

    try {
      final String resolved = Uri.base.resolve(url).toString();

      // load from network and cache if enabled
      onEvent?.call('isFromNetwork', null);
      currentClient = DioNetwork.getClient();
      final Response response = await currentClient!.get(
        resolved.toString(),
        options: Options(responseType: ResponseType.bytes, headers: await getHeaders(), sendTimeout: timeoutDuration, receiveTimeout: timeoutDuration),
        cancelToken: cancelToken,
        onReceiveProgress: onProgress,
      );

      if (response.isRedirect == true && isRedirectBroken(response.realUri.toString())) {
        throw DioLoadException(url: response.realUri.toString(), message: 'Image was redirected to a broken link, url should be: $resolved');
      }

      if (Tools.isGoodStatusCode(response.statusCode) == false) {
        throw DioLoadException(url: resolved, statusCode: response.statusCode);
      }

      if (response.data == null || response.data.lengthInBytes == 0) {
        throw DioLoadException(url: resolved, message: "File did not load");
      }

      if (cacheEnabled) {
        if (onDoneFile == null && onDone != null) {
          // return bytes if file is not requested
          onEvent?.call('loaded', null);
          onDone?.call(response.data as Uint8List, url);
        }
        await start(response.data as Uint8List?, writeToCache, (dynamic file) {
          if (file != null) {
            // onEvent?.call('isFromCache');
            onEvent?.call('loaded', null);
            onDoneFile?.call(file as File);
          }
          dispose();
        });
      } else {
        onEvent?.call('loaded', null);
        onDone?.call(response.data as Uint8List, url);
        dispose();
      }
      return;
    } catch (e) {
      bool isCancelError = e is DioException && CancelToken.isCancel(e);
      if (!isCancelError) Logger.Inst().log('Error downloading $url :: $e', runtimeType.toString(), 'runRequestIsolate', LogTypes.imageLoadingError);
      if (e is Exception) {
        onError?.call(e);
      } else {
        //
      }
      dispose();
    }
  }

  Future<void> runRequest() async {
    final ImageWriter imageWriter = ImageWriter();
    try {
      final String resolved = Uri.base.resolve(url).toString();

      final String? filePath =
          await imageWriter.getCachePath(resolved, cacheFolder, clearName: cacheFolder == 'favicons' ? false : true, fileNameExtras: fileNameExtras);
      if (filePath != null) {
        // read from cache
        final File file = File(filePath);
        final int fileSize = await file.length();
        onEvent?.call('isFromCache', null);
        onProgress?.call(fileSize, fileSize);
        onEvent?.call('loaded', null);

        if (onDoneFile != null) {
          onDoneFile?.call(file);
          dispose();
        } else if (onDone != null) {
          onDone?.call(await file.readAsBytes(), url);
          dispose();
        }
        return;
      }
    } catch (e) {
      Logger.Inst().log('Error getting from cache $url :: $e', runtimeType.toString(), 'runRequest', LogTypes.imageLoadingError);
      if (e is Exception) {
        onError?.call(e);
      } else {
        //
      }
      // dispose();
    }

    try {
      final String resolved = Uri.base.resolve(url).toString();
      // load from network and cache if enabled
      onEvent?.call('isFromNetwork', null);
      currentClient = DioNetwork.getClient();
      final Response response = await currentClient!.get(
        resolved.toString(),
        options: Options(responseType: ResponseType.bytes, headers: await getHeaders(), sendTimeout: timeoutDuration, receiveTimeout: timeoutDuration),
        cancelToken: cancelToken,
        onReceiveProgress: onProgress,
      );

      if (response.isRedirect == true && isRedirectBroken(response.realUri.toString())) {
        throw DioLoadException(url: response.realUri.toString(), message: 'Image was redirected to a broken link, url should be: $resolved');
      }

      if (Tools.isGoodStatusCode(response.statusCode) == false) {
        throw DioLoadException(url: resolved, statusCode: response.statusCode);
      }

      if (response.data == null || response.data.lengthInBytes == 0) {
        throw DioLoadException(url: resolved, message: "File did not load");
      }

      File? tempFile;
      if (cacheEnabled) {
        tempFile = await imageWriter.writeCacheFromBytes(resolved, response.data as Uint8List, cacheFolder,
            clearName: cacheFolder == 'favicons' ? false : true, fileNameExtras: fileNameExtras);
        if (tempFile != null) {
          // onEvent?.call('isFromCache');
        }
      }

      onEvent?.call('loaded', null);
      if (onDoneFile != null && tempFile != null) {
        onDoneFile?.call(tempFile);
        dispose();
      } else if (onDone != null) {
        onDone?.call(response.data as Uint8List, url);
        dispose();
      }
      return;
    } catch (e) {
      bool isCancelError = e is DioException && CancelToken.isCancel(e);
      if (!isCancelError) Logger.Inst().log('Error downloading $url :: $e', runtimeType.toString(), 'runRequest', LogTypes.imageLoadingError);
      if (e is Exception) {
        onError?.call(e);
      } else {
        //
      }
      dispose();
    }
  }

  Future<void> runRequestDownload() async {
    final ImageWriter imageWriter = ImageWriter();
    try {
      final String resolved = Uri.base.resolve(url).toString();

      final String? filePath =
          await imageWriter.getCachePath(resolved, cacheFolder, clearName: cacheFolder == 'favicons' ? false : true, fileNameExtras: fileNameExtras);
      if (filePath != null) {
        // read from cache
        final File file = File(filePath);
        final int fileSize = await file.length();
        onEvent?.call('isFromCache', null);
        onProgress?.call(fileSize, fileSize);
        onEvent?.call('loaded', null);

        if (onDoneFile != null) {
          onDoneFile?.call(file);
          dispose();
        }
        return;
      }
    } catch (e) {
      Logger.Inst().log('Error getting from cache $url :: $e', runtimeType.toString(), 'runRequest', LogTypes.imageLoadingError);
      if (e is Exception) {
        onError?.call(e);
      } else {
        //
      }
      // dispose();
    }

    try {
      final String resolved = Uri.base.resolve(url).toString();
      // load from network and cache if enabled
      onEvent?.call('isFromNetwork', null);
      currentClient = DioNetwork.getClient();
      final Response response = await currentClient!.download(
        resolved.toString(),
        await imageWriter.getCachePathString(resolved.toString(), cacheFolder, clearName: cacheFolder == 'favicons' ? false : true, fileNameExtras: fileNameExtras),
        options: Options(headers: await getHeaders(), sendTimeout: timeoutDuration, receiveTimeout: timeoutDuration),
        cancelToken: cancelToken,
        onReceiveProgress: onProgress,
        deleteOnError: true,
      );

      if (response.isRedirect == true && isRedirectBroken(response.realUri.toString())) {
        throw DioLoadException(url: response.realUri.toString(), message: 'Image was redirected to a broken link, url should be: $resolved');
      }

      if (Tools.isGoodStatusCode(response.statusCode) == false) {
        throw DioLoadException(url: resolved, statusCode: response.statusCode);
      }

      File? tempFile;
      if (cacheEnabled) {
        final String? tempFilePath =
            await imageWriter.getCachePath(resolved, cacheFolder, clearName: cacheFolder == 'favicons' ? false : true, fileNameExtras: fileNameExtras);
        if (tempFilePath != null) {
          tempFile = File(tempFilePath);
          // onEvent?.call('isFromCache');
        }
      }

      onEvent?.call('loaded', null);
      if (onDoneFile != null && tempFile != null && await tempFile.exists()) {
        onDoneFile?.call(tempFile);
        dispose();
      }
      return;
    } catch (e) {
      bool isCancelError = e is DioException && CancelToken.isCancel(e);
      if (!isCancelError) Logger.Inst().log('Error downloading $url :: $e', runtimeType.toString(), 'runRequest', LogTypes.imageLoadingError);
      if (e is Exception) {
        onError?.call(e);
      } else {
        //
      }
      dispose();
    }
  }

  // get only the file size
  Future<void> runRequestSize() async {
    try {
      final String resolved = Uri.base.resolve(url).toString();

      currentClient = DioNetwork.getClient();
      final Response response = await currentClient!.head(
        resolved.toString(),
        options: Options(responseType: ResponseType.bytes, headers: await getHeaders(), sendTimeout: timeoutDuration, receiveTimeout: timeoutDuration),
        cancelToken: cancelToken,
      );

      // print('response size: ${response.headers['content-length']}');

      if (response.isRedirect == true && isRedirectBroken(response.realUri.toString())) {
        throw DioLoadException(url: response.realUri.toString(), message: 'Image was redirected to a broken link, url should be: $resolved');
      }

      if (Tools.isGoodStatusCode(response.statusCode) == false) {
        throw DioLoadException(url: resolved, statusCode: response.statusCode);
      }

      onEvent?.call('size', int.tryParse(response.headers['content-length']?.first ?? '') ?? 0);
      dispose();
      return;
    } catch (e) {
      bool isCancelError = e is DioException && CancelToken.isCancel(e);
      if (!isCancelError) Logger.Inst().log('Error downloading $url :: $e', runtimeType.toString(), 'runRequestSize', LogTypes.imageLoadingError);
      if (e is Exception) {
        onError?.call(e);
      } else {
        //
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
  final String fileNameExtras;

  IsolateCacheConfig({required this.cacheRootPath, required this.fileURL, required this.bytes, required this.typeFolder, required this.fileNameExtras});

  IsolateCacheConfig.fromHost(dynamic data)
      : cacheRootPath = data['cacheRootPath'] as String,
        fileURL = data['fileURL'] as String,
        bytes = data['bytes'] as List<int>? ?? [],
        typeFolder = data['typeFolder'] as String,
        fileNameExtras = data['fileNameExtras'] as String;
}
