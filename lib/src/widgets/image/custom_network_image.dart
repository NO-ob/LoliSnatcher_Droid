// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

import 'package:dio/dio.dart';
import 'package:flutter_avif/flutter_avif.dart';

import 'package:lolisnatcher/src/services/image_writer.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/image/abstract_custom_network_image.dart' as custom_network_image;

/// Shared logic for downloading, caching, and atomic writing of images.
mixin _NetworkImageLoaderMixin {
  Future<void> _commitCacheFile(File tempFile, String destPath) async {
    final dest = File(destPath);
    try {
      await tempFile.rename(destPath);
      return;
    } catch (_) {}

    if (await dest.exists()) {
      try {
        final len = await dest.length();
        if (len > 0) {
          try {
            await tempFile.delete();
          } catch (_) {}
          return;
        }
        await dest.delete();
      } catch (e) {
        try {
          await tempFile.delete();
        } catch (_) {}
        return;
      }
    }
    for (int i = 0; i < 3; i++) {
      try {
        await tempFile.rename(destPath);
        return;
      } catch (_) {
        await Future.delayed(Duration(milliseconds: 50 * (i + 1)));
      }
    }

    if (await dest.exists()) {
      try {
        await tempFile.delete();
      } catch (_) {}
      return;
    }

    throw FileSystemException('Failed to commit cache file after retries', destPath);
  }

  Future<Uint8List> downloadAndCache({
    required String url,
    required String? cacheFolder,
    required String fileNameExtras,
    required bool withCache,
    required Map<String, String>? headers,
    required Duration? sendTimeout,
    required Duration? receiveTimeout,
    required CancelToken? cancelToken,
    required bool withCaptchaCheck,
    required StreamController<ImageChunkEvent> chunkEvents,
    required void Function(bool)? onCacheDetected,
  }) async {
    final Uri resolved = Uri.base.resolve(url);
    final String cacheFilePath = await ImageWriter().getCachePathString(
      resolved.toString(),
      cacheFolder ?? 'media',
      clearName: cacheFolder != 'favicons',
      fileNameExtras: fileNameExtras,
    );

    final String tempFilePath = '$cacheFilePath.temp_${DateTime.now().microsecondsSinceEpoch}';

    File? cacheFile;

    // Check existing cache
    if (withCache) {
      cacheFile = File(cacheFilePath);
      if (await cacheFile.exists()) {
        final int fileSize = await cacheFile.length();
        if (fileSize < 10) {
          try {
            await cacheFile.delete();
          } catch (_) {}
          cacheFile = null;
        } else {
          chunkEvents.add(
            ImageChunkEvent(
              cumulativeBytesLoaded: fileSize,
              expectedTotalBytes: fileSize,
            ),
          );
        }
      } else {
        cacheFile = null;
      }
    }

    if (onCacheDetected != null) {
      onCacheDetected(cacheFile != null);
    }

    if (cacheFile != null) {
      try {
        return await cacheFile.readAsBytes();
      } catch (e) {
        cacheFile = null;
      }
    }

    // --- Download Logic ---
    final client = DioNetwork.getClient(skipLogging: true);
    if (withCaptchaCheck) {
      DioNetwork.captchaInterceptor(
        client,
        customUserAgent: Tools.appUserAgent,
      );
    }

    Response? response;
    try {
      response = withCache
          ? await client.downloadUri(
              resolved,
              tempFilePath,
              options: Options(
                headers: headers,
                sendTimeout: sendTimeout,
                receiveTimeout: receiveTimeout,
              ),
              onReceiveProgress: (int count, int total) {
                chunkEvents.add(
                  ImageChunkEvent(
                    cumulativeBytesLoaded: count,
                    expectedTotalBytes: total <= 0 ? null : total,
                  ),
                );
              },
              cancelToken: cancelToken,
            )
          : await client.getUri(
              resolved,
              options: Options(
                headers: headers,
                responseType: ResponseType.bytes,
                sendTimeout: sendTimeout,
                receiveTimeout: receiveTimeout,
              ),
              onReceiveProgress: (int count, int total) {
                chunkEvents.add(
                  ImageChunkEvent(
                    cumulativeBytesLoaded: count,
                    expectedTotalBytes: total <= 0 ? null : total,
                  ),
                );
              },
              cancelToken: cancelToken,
            );
    } catch (e) {
      try {
        await File(tempFilePath).delete();
      } catch (_) {}
      rethrow;
    } finally {
      client.close();
    }

    if (!Tools.isGoodResponse(response)) {
      try {
        await File(tempFilePath).delete();
      } catch (_) {}

      throw NetworkImageLoadException(
        statusCode: response.statusCode ?? 0,
        uri: resolved,
      );
    }

    if (withCache) {
      final tempFile = File(tempFilePath);
      if (await tempFile.exists()) {
        final actualLen = await tempFile.length();

        // Validate Content-Length
        final headerLen = int.tryParse(response.headers.value(HttpHeaders.contentLengthHeader) ?? '');
        if (headerLen != null && headerLen > 0 && actualLen != headerLen) {
          await tempFile.delete();
          throw Exception('Download incomplete: Expected $headerLen bytes, got $actualLen');
        }

        // Validate JPEG EOI (End of Image)
        if (actualLen > 2 && (url.toLowerCase().endsWith('.jpg') || url.toLowerCase().endsWith('.jpeg'))) {
          final handle = await tempFile.open();
          try {
            await handle.setPosition(actualLen - 2);
            final endBytes = await handle.read(2);
            if (endBytes.length == 2 && (endBytes[0] != 0xFF || endBytes[1] != 0xD9)) {
              throw Exception('Image file is truncated (missing JPEG EOI marker)');
            }
          } catch (e) {
            await tempFile.delete();
            rethrow;
          } finally {
            await handle.close();
          }
        }

        try {
          await _commitCacheFile(tempFile, cacheFilePath);
          return File(cacheFilePath).readAsBytes();
        } catch (_) {
          try {
            await tempFile.delete();
          } catch (_) {}
          rethrow;
        }
      }
    }

    return response.data as Uint8List;
  }

  Future<Uint8List> tryFixGifSpeed(String url, Uint8List image) async {
    if (!url.toLowerCase().endsWith('.gif') && !url.toLowerCase().contains('.gif')) {
      return image;
    }

    try {
      final int len = image.length - 6;
      for (int i = 0; i < len; i++) {
        if (image[i] == 0x21 && image[i + 1] == 0xF9 && image[i + 2] == 0x04) {
          final int delay = image[i + 4] | (image[i + 5] << 8);
          if (delay < 10) {
            image[i + 4] = 0x0A;
          }
          i += 5;
        }
      }
    } catch (_) {}
    return image;
  }

  Future<void> deleteCache(String url, String? cacheFolder, String fileNameExtras) async {
    final Uri resolved = Uri.base.resolve(url);
    final String cacheFilePath = await ImageWriter().getCachePathString(
      resolved.toString(),
      cacheFolder ?? 'media',
      clearName: cacheFolder != 'favicons',
      fileNameExtras: fileNameExtras,
    );
    final File cacheFile = File(cacheFilePath);
    try {
      if (await cacheFile.exists()) {
        await cacheFile.delete();
      }
      // Note: We can't easily delete unique temp files here as their names are random.
      // But they are cleaned up in the try/catch blocks of downloadAndCache.
      // We can try deleting the legacy fixed temp file just in case.
      final legacyTemp = File('$cacheFilePath.temp');
      if (await legacyTemp.exists()) {
        await legacyTemp.delete();
      }
    } catch (e) {
      print('NetworkImage Exception :: delete cache file :: $e');
    }
  }
}

@immutable
class CustomNetworkImage extends ImageProvider<custom_network_image.CustomNetworkImage>
    with _NetworkImageLoaderMixin
    implements custom_network_image.CustomNetworkImage {
  const CustomNetworkImage(
    this.url, {
    this.scale = 1.0,
    this.headers,
    this.cancelToken,
    this.withCache = false,
    this.cacheFolder,
    this.fileNameExtras = '',
    this.onCacheDetected,
    this.onError,
    this.sendTimeout,
    this.receiveTimeout,
    this.withCaptchaCheck = false,
  }) : assert(!withCache || cacheFolder != null, 'cacheFolder must be set when withCache is true');

  @override
  final String url;
  @override
  final double scale;
  @override
  final Map<String, String>? headers;
  final CancelToken? cancelToken;
  final bool withCache;
  final String? cacheFolder;
  final String fileNameExtras;
  final void Function(bool)? onCacheDetected;
  final void Function(Object)? onError;
  final Duration? sendTimeout;
  final Duration? receiveTimeout;
  final bool withCaptchaCheck;

  @override
  Future<CustomNetworkImage> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<CustomNetworkImage>(this);
  }

  @override
  ImageStreamCompleter loadImage(
    custom_network_image.CustomNetworkImage key,
    ImageDecoderCallback decode,
  ) {
    final StreamController<ImageChunkEvent> chunkEvents = StreamController<ImageChunkEvent>();

    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(key as CustomNetworkImage, chunkEvents, decode),
      chunkEvents: chunkEvents.stream,
      scale: key.scale,
      debugLabel: key.url,
      informationCollector: () => <DiagnosticsNode>[
        DiagnosticsProperty<ImageProvider>('Image provider', this),
        DiagnosticsProperty<custom_network_image.CustomNetworkImage>('Image key', key),
      ],
    );
  }

  Future<bool> deleteCacheFile() async {
    await deleteCache(url, cacheFolder, fileNameExtras);
    return true;
  }

  Future<ui.Codec> _loadAsync(
    CustomNetworkImage key,
    StreamController<ImageChunkEvent> chunkEvents,
    ImageDecoderCallback decode,
  ) async {
    try {
      assert(key == this, 'The $runtimeType cannot be reused after disposing.');

      final Uint8List bytes = await downloadAndCache(
        url: key.url,
        cacheFolder: cacheFolder,
        fileNameExtras: fileNameExtras,
        withCache: withCache,
        headers: headers,
        sendTimeout: sendTimeout,
        receiveTimeout: receiveTimeout,
        cancelToken: cancelToken,
        withCaptchaCheck: withCaptchaCheck,
        chunkEvents: chunkEvents,
        onCacheDetected: onCacheDetected,
      );

      if (bytes.isEmpty) {
        await deleteCacheFile();
        throw Exception('CustomNetworkImage is an empty file: ${key.url}');
      }

      final fixedBytes = await tryFixGifSpeed(key.url, bytes);

      final ui.ImmutableBuffer buffer = await ui.ImmutableBuffer.fromUint8List(fixedBytes);
      return decode(buffer);
    } catch (e) {
      if (onError != null) {
        onError?.call(e);
      }
      scheduleMicrotask(() {
        PaintingBinding.instance.imageCache.evict(key);
      });
      rethrow;
    } finally {
      await chunkEvents.close();
    }
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is CustomNetworkImage &&
        other.url == url &&
        other.scale == scale &&
        other.headers == headers &&
        other.withCache == withCache &&
        other.cacheFolder == cacheFolder &&
        other.fileNameExtras == fileNameExtras &&
        other.sendTimeout == sendTimeout &&
        other.receiveTimeout == receiveTimeout &&
        other.withCaptchaCheck == withCaptchaCheck;
  }

  @override
  int get hashCode => Object.hash(
    url,
    scale,
    headers,
    withCache,
    cacheFolder,
    fileNameExtras,
    sendTimeout,
    receiveTimeout,
    withCaptchaCheck,
  );

  @override
  String toString() => '${objectRuntimeType(this, 'CustomNetworkImage')}("$url", scale: $scale)';
}

@immutable
class CustomNetworkAvifImage extends ImageProvider<custom_network_image.CustomNetworkImage>
    with _NetworkImageLoaderMixin
    implements custom_network_image.CustomNetworkImage {
  const CustomNetworkAvifImage(
    this.url, {
    this.scale = 1.0,
    this.headers,
    this.cancelToken,
    this.withCache = false,
    this.cacheFolder,
    this.fileNameExtras = '',
    this.onCacheDetected,
    this.onError,
    this.sendTimeout,
    this.receiveTimeout,
    this.withCaptchaCheck = false,
  }) : assert(!withCache || cacheFolder != null, 'cacheFolder must be set when withCache is true');

  @override
  final String url;
  @override
  final double scale;
  @override
  final Map<String, String>? headers;
  final CancelToken? cancelToken;
  final bool withCache;
  final String? cacheFolder;
  final String fileNameExtras;
  final void Function(bool)? onCacheDetected;
  final void Function(Object)? onError;
  final Duration? sendTimeout;
  final Duration? receiveTimeout;
  final bool withCaptchaCheck;

  @override
  Future<CustomNetworkAvifImage> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<CustomNetworkAvifImage>(this);
  }

  @override
  ImageStreamCompleter loadImage(
    custom_network_image.CustomNetworkImage key,
    ImageDecoderCallback decode,
  ) {
    final StreamController<ImageChunkEvent> chunkEvents = StreamController<ImageChunkEvent>();

    return AvifImageStreamCompleter(
      key: key,
      codec: _loadAsync(key as CustomNetworkAvifImage, chunkEvents, decode),
      scale: key.scale,
      debugLabel: key.url,
      informationCollector: () => <DiagnosticsNode>[
        ErrorDescription('Url: $url'),
      ],
      chunkEvents: chunkEvents.stream,
    );
  }

  Future<bool> deleteCacheFile() async {
    await deleteCache(url, cacheFolder, fileNameExtras);
    return true;
  }

  Future<AvifCodec> _loadAsync(
    CustomNetworkAvifImage key,
    StreamController<ImageChunkEvent> chunkEvents,
    ImageDecoderCallback decode,
  ) async {
    try {
      assert(key == this, 'The $runtimeType cannot be reused after disposing.');

      final Uint8List bytes = await downloadAndCache(
        url: key.url,
        cacheFolder: cacheFolder,
        fileNameExtras: fileNameExtras,
        withCache: withCache,
        headers: headers,
        sendTimeout: sendTimeout,
        receiveTimeout: receiveTimeout,
        cancelToken: cancelToken,
        withCaptchaCheck: withCaptchaCheck,
        chunkEvents: chunkEvents,
        onCacheDetected: onCacheDetected,
      );

      if (bytes.isEmpty) {
        await deleteCacheFile();
        throw Exception('CustomNetworkAvifImage is an empty file: ${key.url}');
      }

      final fType = isAvifFile(bytes.sublist(0, 16));
      if (fType == AvifFileType.unknown) {
        throw Exception('CustomNetworkAvifImage is not an avif file: ${key.url}');
      }

      final codec = fType == AvifFileType.avif
          ? SingleFrameAvifCodec(bytes: bytes)
          : MultiFrameAvifCodec(
              key: hashCode,
              avifBytes: bytes,
              overrideDurationMs: -1,
            );
      await codec.ready();
      return codec;
    } catch (e) {
      if (onError != null) {
        onError?.call(e);
      }
      scheduleMicrotask(() {
        PaintingBinding.instance.imageCache.evict(key);
      });
      rethrow;
    } finally {
      await chunkEvents.close();
    }
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is CustomNetworkAvifImage &&
        other.url == url &&
        other.scale == scale &&
        other.headers == headers &&
        other.withCache == withCache &&
        other.cacheFolder == cacheFolder &&
        other.fileNameExtras == fileNameExtras &&
        other.sendTimeout == sendTimeout &&
        other.receiveTimeout == receiveTimeout &&
        other.withCaptchaCheck == withCaptchaCheck;
  }

  @override
  int get hashCode => Object.hash(
    url,
    scale,
    headers,
    withCache,
    cacheFolder,
    fileNameExtras,
    sendTimeout,
    receiveTimeout,
    withCaptchaCheck,
  );

  @override
  String toString() => '${objectRuntimeType(this, 'CustomNetworkAvifImage')}("$url", scale: $scale)';
}
