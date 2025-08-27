// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_avif/flutter_avif.dart';

import 'package:lolisnatcher/src/services/image_writer.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/image/abstract_custom_network_image.dart' as custom_network_image;

@immutable
class CustomNetworkImage extends ImageProvider<custom_network_image.CustomNetworkImage>
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
      codec: _loadAsync(
        key as CustomNetworkImage,
        chunkEvents,
        decode,
      ),
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
    final key = this;
    final Uri resolved = Uri.base.resolve(key.url);
    final String cacheFilePath = await ImageWriter().getCachePathString(
      resolved.toString(),
      cacheFolder ?? 'media',
      clearName: cacheFolder != 'favicons',
      fileNameExtras: fileNameExtras,
    );
    final File cacheFile = File(cacheFilePath);

    try {
      assert(key == this, 'The $runtimeType cannot be reused after disposing.');

      if (await cacheFile.exists()) {
        await cacheFile.delete();
        return true;
      }
    } catch (e) {
      print('CustomNetworkImage Exception :: delete cache file :: $e');
      return false;
    }
    return false;
  }

  Future<ui.Codec> _loadAsync(
    CustomNetworkImage key,
    StreamController<ImageChunkEvent> chunkEvents,
    ImageDecoderCallback decode,
  ) async {
    final Uri resolved = Uri.base.resolve(key.url);
    final String cacheFilePath = await ImageWriter().getCachePathString(
      resolved.toString(),
      cacheFolder ?? 'media',
      clearName: cacheFolder != 'favicons',
      fileNameExtras: fileNameExtras,
    );
    File? cacheFile;
    try {
      assert(key == this, 'The $runtimeType cannot be reused after disposing.');

      // file already cached
      if (withCache) {
        cacheFile = File(cacheFilePath);
        int fileSize = 0;

        if (await cacheFile.exists()) {
          fileSize = await cacheFile.length();
          if (fileSize == 0) {
            await cacheFile.delete();
            cacheFile = null;
          } else {
            chunkEvents.add(
              ImageChunkEvent(
                cumulativeBytesLoaded: fileSize,
                expectedTotalBytes: fileSize <= 0 ? null : fileSize,
              ),
            );
          }
        } else {
          cacheFile = null;
        }
      }

      if (onCacheDetected != null) {
        onCacheDetected?.call(cacheFile != null);
      }

      final client = DioNetwork.getClient();
      if (withCaptchaCheck) {
        DioNetwork.captchaInterceptor(
          client,
          customUserAgent: Tools.appUserAgent,
        );
      }

      Response? response;
      if (cacheFile == null) {
        response = withCache
            ? await client.downloadUri(
                resolved,
                cacheFilePath,
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
        client.close();

        if (!Tools.isGoodResponse(response)) {
          try {
            final testFile = File(cacheFilePath);
            if (await testFile.exists()) {
              await testFile.delete();
            }
          } catch (_) {}

          throw NetworkImageLoadException(
            statusCode: response.statusCode ?? 0,
            uri: resolved,
          );
        }
      }

      if (withCache) {
        if (cacheFile == null) {
          cacheFile = File(cacheFilePath);
        } else {
          // remove file when download wasn't finished
          // TODO problematic?
          // if (cancelToken?.isCancelled == true) {
          //   if (lastChunk != null) {
          //     if (lastChunk!.expectedTotalBytes != 0 && lastChunk!.expectedTotalBytes != lastChunk!.cumulativeBytesLoaded) {
          //       await cacheFile.delete();
          //       throw Exception('CustomNetworkImage cancelled: $resolved');
          //     }
          //   }
          // }
        }
      }

      final Uint8List bytes = cacheFile != null ? await cacheFile.readAsBytes() : response!.data;
      if (bytes.lengthInBytes == 0) {
        throw Exception('CustomNetworkImage is an empty file: $resolved');
      }

      final ui.ImmutableBuffer buffer = await ui.ImmutableBuffer.fromUint8List(await _tryFixGifSpeed(bytes));
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

  /// Try to fix gifs without proper frame timings and therefore are played too fast due to a bug in flutter (https://github.com/flutter/flutter/issues/29130)
  ///
  /// Source: https://github.com/fluttercandies/extended_image_library/pull/69
  Future<Uint8List> _tryFixGifSpeed(Uint8List image) async {
    return compute(
      (Uint8List image) {
        bool handled = false;
        if (!handled) {
          try {
            for (int i = 0; i < image.length - 2; i++) {
              final Uint8List slice = image.sublist(i, i + 3);
              if (const ListEquality<int>().equals(slice, <int>[0x21, 0xF9, 0x04])) {
                final int delay1 = image[i + 4];
                final int delay2 = image[i + 5];
                final int delay = delay1 | (delay2 << 8);
                // min 100ms
                if (delay < 10) {
                  image[i + 4] = 0x0A;
                }
              }
            }
            handled = true;
          } catch (_) {
            //
          }
        }
        return image;
      },
      image,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is CustomNetworkImage &&
        other.url == url &&
        other.scale == scale &&
        other.headers == headers &&
        other.withCache == withCache &&
        other.cacheFolder == cacheFolder &&
        other.fileNameExtras == fileNameExtras &&
        other.onCacheDetected == onCacheDetected &&
        other.onError == onError &&
        other.sendTimeout == sendTimeout &&
        other.receiveTimeout == receiveTimeout &&
        other.withCaptchaCheck == withCaptchaCheck &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode => Object.hash(url, scale);

  @override
  String toString() => '${objectRuntimeType(this, 'CustomNetworkImage')}("$url", scale: $scale)';
}

@immutable
class CustomNetworkAvifImage extends ImageProvider<custom_network_image.CustomNetworkImage>
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
      codec: _loadAsync(
        key as CustomNetworkAvifImage,
        chunkEvents,
        decode,
      ),
      scale: key.scale,
      debugLabel: key.url,
      informationCollector: () => <DiagnosticsNode>[
        ErrorDescription('Url: $url'),
      ],
      chunkEvents: chunkEvents.stream,
    );
  }

  Future<bool> deleteCacheFile() async {
    final key = this;
    final Uri resolved = Uri.base.resolve(key.url);
    final String cacheFilePath = await ImageWriter().getCachePathString(
      resolved.toString(),
      cacheFolder ?? 'media',
      clearName: cacheFolder != 'favicons',
      fileNameExtras: fileNameExtras,
    );
    final File cacheFile = File(cacheFilePath);

    try {
      assert(key == this, 'The $runtimeType cannot be reused after disposing.');

      if (await cacheFile.exists()) {
        await cacheFile.delete();
        return true;
      }
    } catch (e) {
      print('CustomNetworkAvifImage Exception :: delete cache file :: $e');
      return false;
    }
    return false;
  }

  Future<AvifCodec> _loadAsync(
    CustomNetworkAvifImage key,
    StreamController<ImageChunkEvent> chunkEvents,
    ImageDecoderCallback decode,
  ) async {
    final Uri resolved = Uri.base.resolve(key.url);
    final String cacheFilePath = await ImageWriter().getCachePathString(
      resolved.toString(),
      cacheFolder ?? 'media',
      clearName: cacheFolder != 'favicons',
      fileNameExtras: fileNameExtras,
    );
    File? cacheFile;
    try {
      assert(key == this, 'The $runtimeType cannot be reused after disposing.');

      // file already cached
      if (withCache) {
        cacheFile = File(cacheFilePath);
        int fileSize = 0;

        if (await cacheFile.exists()) {
          fileSize = await cacheFile.length();
          if (fileSize == 0) {
            await cacheFile.delete();
            cacheFile = null;
          } else {
            chunkEvents.add(
              ImageChunkEvent(
                cumulativeBytesLoaded: fileSize,
                expectedTotalBytes: fileSize <= 0 ? null : fileSize,
              ),
            );
          }
        } else {
          cacheFile = null;
        }
      }

      if (onCacheDetected != null) {
        onCacheDetected?.call(cacheFile != null);
      }

      final client = DioNetwork.getClient();
      if (withCaptchaCheck) {
        DioNetwork.captchaInterceptor(
          client,
          customUserAgent: Tools.appUserAgent,
        );
      }

      Response? response;
      if (cacheFile == null) {
        response = withCache
            ? await client.downloadUri(
                resolved,
                cacheFilePath,
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
        client.close();

        if (!Tools.isGoodResponse(response)) {
          try {
            final testFile = File(cacheFilePath);
            if (await testFile.exists()) {
              await testFile.delete();
            }
          } catch (_) {}

          throw NetworkImageLoadException(
            statusCode: response.statusCode ?? 0,
            uri: resolved,
          );
        }
      }

      if (withCache) {
        if (cacheFile == null) {
          cacheFile = File(cacheFilePath);
        } else {
          // remove file when download wasn't finished
          // TODO problematic?
          // if (cancelToken?.isCancelled == true) {
          //   if (lastChunk != null) {
          //     if (lastChunk!.expectedTotalBytes != 0 && lastChunk!.expectedTotalBytes != lastChunk!.cumulativeBytesLoaded) {
          //       await cacheFile.delete();
          //       throw Exception('CustomNetworkAvifImage cancelled: $resolved');
          //     }
          //   }
          // }
        }
      }

      final Uint8List bytes = cacheFile != null ? await cacheFile.readAsBytes() : response!.data;
      if (bytes.lengthInBytes == 0) {
        throw Exception('CustomNetworkAvifImage is an empty file: $resolved');
      }

      final fType = isAvifFile(bytes.sublist(0, 16));
      if (fType == AvifFileType.unknown) {
        throw Exception('CustomNetworkAvifImage is not an avif file: $resolved');
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
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is CustomNetworkAvifImage &&
        other.url == url &&
        other.scale == scale &&
        other.headers == headers &&
        other.withCache == withCache &&
        other.cacheFolder == cacheFolder &&
        other.fileNameExtras == fileNameExtras &&
        other.onCacheDetected == onCacheDetected &&
        other.onError == onError &&
        other.sendTimeout == sendTimeout &&
        other.receiveTimeout == receiveTimeout &&
        other.withCaptchaCheck == withCaptchaCheck &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode => Object.hash(url, scale);

  @override
  String toString() => '${objectRuntimeType(this, 'CustomNetworkAvifImage')}("$url", scale: $scale)';
}
