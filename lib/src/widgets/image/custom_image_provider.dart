import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' show hashValues, Codec;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/services/image_writer.dart';

import '../../utils/logger.dart';


// memoryimage but with url added in attempt to not load extra copies of already loaded images
class MemoryImageTest extends ImageProvider<MemoryImageTest> {
  const MemoryImageTest(this.bytes, { this.imageUrl, this.scale = 1.0 });

  final Uint8List bytes;
  final String? imageUrl;
  final double scale;

  @override
  Future<MemoryImageTest> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<MemoryImageTest>(this);
  }

  @override
  ImageStreamCompleter load(MemoryImageTest key, DecoderCallback decode) {
    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(key, decode),
      scale: key.scale,
      debugLabel: 'MemoryImage(${describeIdentity(key.bytes)})',
    );
  }

  Future<Codec> _loadAsync(MemoryImageTest key, DecoderCallback decode) {
    assert(key == this);

    return decode(bytes);
  }

  @override
  int get hashCode {
    return hashValues(imageUrl ?? bytes.hashCode, scale);
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is MemoryImageTest
        && (imageUrl == null ? other.bytes == bytes : other.imageUrl == imageUrl)
        && other.scale == scale;
  }
}

class _SizeAwareCacheKey {
  const _SizeAwareCacheKey(this.providerCacheKey, this.width, this.height);

  final Object providerCacheKey;

  final int? width;

  final int? height;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is _SizeAwareCacheKey
        && other.providerCacheKey == providerCacheKey
        && other.width == width
        && other.height == height;
  }

  @override
  int get hashCode => hashValues(providerCacheKey, width, height);
}

// resize image with added url, didn't work in the end, failed experiment
class ResizeImageWithUrl extends ImageProvider<_SizeAwareCacheKey> {

  const ResizeImageWithUrl(
    this.imageProvider,
    {
      required this.imageUrl,
      this.width,
      this.height,
      this.allowUpscaling = false,
  }) : assert(width != null || height != null);

  final ImageProvider imageProvider;
  final String imageUrl;
  final int? width;
  final int? height;
  final bool allowUpscaling;

  @override
  int get hashCode {
    return hashValues(imageUrl, imageProvider.hashCode);
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is ResizeImageWithUrl
        && other.imageUrl == imageUrl;
  }

  @override
  ImageStreamCompleter load(_SizeAwareCacheKey key, DecoderCallback decode) {
    Future<Codec> decodeResize(Uint8List bytes, {int? cacheWidth, int? cacheHeight, bool? allowUpscaling}) {
      assert(
        cacheWidth == null && cacheHeight == null && allowUpscaling == null,
        'ResizeImage cannot be composed with another ImageProvider that applies '
        'cacheWidth, cacheHeight, or allowUpscaling.',
      );
      return decode(bytes, cacheWidth: width, cacheHeight: height, allowUpscaling: this.allowUpscaling);
    }
    final ImageStreamCompleter completer = imageProvider.load(key.providerCacheKey, decodeResize);
    if (!kReleaseMode) {
      completer.debugLabel = '${completer.debugLabel} - Resized(${key.width}×${key.height})';
    }
    return completer;
  }

  @override
  Future<_SizeAwareCacheKey> obtainKey(ImageConfiguration configuration) {
    Completer<_SizeAwareCacheKey>? completer;
    // If the imageProvider.obtainKey future is synchronous, then we will be able to fill in result with
    // a value before completer is initialized below.
    SynchronousFuture<_SizeAwareCacheKey>? result;
    imageProvider.obtainKey(configuration).then((Object key) {
      if (completer == null) {
        // This future has completed synchronously (completer was never assigned),
        // so we can directly create the synchronous result to return.
        result = SynchronousFuture<_SizeAwareCacheKey>(_SizeAwareCacheKey(key, width, height));
      } else {
        // This future did not synchronously complete.
        completer.complete(_SizeAwareCacheKey(key, width, height));
      }
    });
    if (result != null) {
      return result!;
    }
    // If the code reaches here, it means the imageProvider.obtainKey was not
    // completed sync, so we initialize the completer for completion later.
    completer = Completer<_SizeAwareCacheKey>();
    return completer.future;
  }

}

class LoliImage extends ImageProvider<LoliImage> {
  /// Creates an object that fetches the image at the given URL.
  ///
  /// The arguments [url] and [scale] must not be null.
  const LoliImage(
    this.url,
    {
      Key? key,
      this.scale = 1.0,
      this.headers = const <String, dynamic>{},
      this.cancelToken,
      this.onProgress,
      required this.fileNameExtras,
      required this.cacheEnabled,
      required this.cacheFolder,
    }
  );

  final String url;

  final double scale;

  final Map<String, dynamic>? headers;

  final CancelToken? cancelToken;

  final void Function(int, int)? onProgress;

  final bool cacheEnabled;

  final String cacheFolder;

  final String fileNameExtras;

  @override
  Future<LoliImage> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<LoliImage>(this);
  }

  @override
  ImageStreamCompleter load(LoliImage key, DecoderCallback decode) {
    // Ownership of this controller is handed off to [_loadAsync]; it is that
    // method's responsibility to close the controller's stream when the image
    // has been loaded or an error is thrown.
    final StreamController<ImageChunkEvent> chunkEvents = StreamController<ImageChunkEvent>();

    print(key.runtimeType);

    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(key, chunkEvents, decode),
      chunkEvents: chunkEvents.stream,
      scale: key.scale,
      debugLabel: key.url,
      informationCollector: () {
        return <DiagnosticsNode>[
          DiagnosticsProperty<ImageProvider>('Image provider', this),
          DiagnosticsProperty<LoliImage>('Image key', key),
        ];
      },
    );
  }

  static void evictImageByUrl(Object key) {
    PaintingBinding.instance.imageCache.containsKey(key);
  }

  static Dio get _httpClient {
    Dio client = Dio();
    return client;
  }

  Future<Codec> _loadAsync(
    LoliImage key,
    StreamController<ImageChunkEvent> chunkEvents,
    DecoderCallback decode,
  ) async {
    try {
      assert(key == this);

      late Uint8List bytes;

      final String resolved = Uri.base.resolve(key.url).toString();

      final ImageWriter imageWriter = ImageWriter();

      final String? filePath = await imageWriter.getCachePath(resolved, cacheFolder, fileNameExtras: fileNameExtras);
      Logger.Inst().log("path found: $filePath for: $resolved", "LoliImage", "_loadAsync", LogTypes.imageInfo);
      if (filePath != null) {
        Logger.Inst().log("image found at: $filePath for $resolved", "LoliImage", "_loadAsync", LogTypes.imageInfo);
        // read from cache
        final File file = File(filePath);
        // meme number to differtiate it from any other request
        // TODO invent other way to do this
        chunkEvents.add(const ImageChunkEvent(
          cumulativeBytesLoaded: 133769420,
          expectedTotalBytes: 133769420
        ));
        if(onProgress != null) {
          onProgress!(133769420, 133769420);
        }
        bytes = await file.readAsBytes();
      } else {
        Logger.Inst().log("image not found for: $resolved", "LoliImage", "_loadAsync", LogTypes.imageInfo);
        // load from network and cache if enabled
        final Response response = await _httpClient.get(
          resolved.toString(),
          options: Options(responseType: ResponseType.bytes, headers: headers),
          cancelToken: cancelToken,
          onReceiveProgress: (int received, int total){
            chunkEvents.add(ImageChunkEvent(
              cumulativeBytesLoaded: received,
              expectedTotalBytes: total,
            ));

            if(onProgress != null) {
              onProgress!(received, total);
            }
          },
        );

        if (response.statusCode != HttpStatus.ok) {
          throw LoliImageLoadException(url: resolved, statusCode: response.statusCode);
        }

        if (response.data == null || response.data.lengthInBytes == 0) {
          throw LoliImageLoadException(url: resolved, message: "File didn't load");
        }

        if(cacheEnabled) imageWriter.writeCacheFromBytes(resolved, response.data as Uint8List, cacheFolder, fileNameExtras: fileNameExtras);

        bytes = response.data as Uint8List;
      }

      return decode(bytes);
    } catch (e) {
      // Depending on where the exception was thrown, the image cache may not
      // have had a chance to track the key in the cache at all.
      // Schedule a microtask to give the cache a chance to add the key.
      scheduleMicrotask(() {
        PaintingBinding.instance.imageCache.evict(key);
      });
      rethrow;
    } finally {
      // motify that loading ended
      onProgress?.call(-1, -1);
      chunkEvents.close();
    }
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is LoliImage
        && other.url == url
        && other.scale == scale;
  }

  @override
  int get hashCode => hashValues(url, scale);

  @override
  String toString() => '${objectRuntimeType(this, 'LoliImage')}("$url", scale: $scale)';
}

class LoliImageLoadException implements Exception {
  LoliImageLoadException({required this.url, this.statusCode, this.message})
      : assert(statusCode != null);

  final int? statusCode;
  final String? message;
  final String url;

  @override
  String toString() => 'LoliImage Request failed, statusCode: $statusCode, url: $url, msg: $message';
}
