// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

import 'package:dio/dio.dart';

import 'package:lolisnatcher/src/services/image_writer.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/image/abstract_custom_network_image.dart' as custom_network_image;

@immutable
class CustomNetworkImage extends ImageProvider<custom_network_image.CustomNetworkImage> implements custom_network_image.CustomNetworkImage {
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

  @override
  Future<CustomNetworkImage> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<CustomNetworkImage>(this);
  }

  @override
  ImageStreamCompleter load(custom_network_image.CustomNetworkImage key, DecoderCallback decode) {
    final StreamController<ImageChunkEvent> chunkEvents = StreamController<ImageChunkEvent>();

    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(key as CustomNetworkImage, chunkEvents, null, decode),
      chunkEvents: chunkEvents.stream,
      scale: key.scale,
      debugLabel: key.url,
      informationCollector: () => <DiagnosticsNode>[
        DiagnosticsProperty<ImageProvider>('Image provider', this),
        DiagnosticsProperty<custom_network_image.CustomNetworkImage>('Image key', key),
      ],
    );
  }

  @override
  ImageStreamCompleter loadBuffer(custom_network_image.CustomNetworkImage key, DecoderBufferCallback decode) {
    final StreamController<ImageChunkEvent> chunkEvents = StreamController<ImageChunkEvent>();

    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(key as CustomNetworkImage, chunkEvents, decode, null),
      chunkEvents: chunkEvents.stream,
      scale: key.scale,
      debugLabel: key.url,
      informationCollector: () => <DiagnosticsNode>[
        DiagnosticsProperty<ImageProvider>('Image provider', this),
        DiagnosticsProperty<custom_network_image.CustomNetworkImage>('Image key', key),
      ],
    );
  }

  static Dio get _httpClient {
    final Dio client = DioNetwork.getClient();
    return client;
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
      print(e);
      return false;
    }
    return false;
  }

  Future<ui.Codec> _loadAsync(
    CustomNetworkImage key,
    StreamController<ImageChunkEvent> chunkEvents,
    DecoderBufferCallback? decode,
    DecoderCallback? decodeDepreacted,
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

      Response? response;
      if (cacheFile == null) {
        response = withCache
            ? await _httpClient.downloadUri(
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
            : await _httpClient.getUri(
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

        if (Tools.isGoodStatusCode(response.statusCode) == false) {
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

      if (decode != null) {
        final ui.ImmutableBuffer buffer = await ui.ImmutableBuffer.fromUint8List(bytes);
        return decode(buffer);
      } else {
        assert(decodeDepreacted != null, 'decodeDepreacted must not be null');
        return decodeDepreacted!(bytes);
      }
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
    return other is CustomNetworkImage && other.url == url && other.scale == scale;
  }

  @override
  int get hashCode => Object.hash(url, scale);

  @override
  String toString() => '${objectRuntimeType(this, 'CustomNetworkImage')}("$url", scale: $scale)';
}
