import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/image/custom_network_image.dart';
import 'package:lolisnatcher/src/widgets/preview/shimmer_builder.dart';

@immutable
class _BooruFaviconCacheKey {
  const _BooruFaviconCacheKey({
    required this.url,
    required this.baseUrl,
    required this.booruName,
    required this.booruType,
    required this.apiKey,
    required this.userId,
    required this.pixelSize,
  });

  factory _BooruFaviconCacheKey.fromWidget(BooruFavicon widget) {
    final baseUrl = widget.booru?.baseURL?.trim() ?? '';
    return _BooruFaviconCacheKey(
      url: (widget.booru?.faviconURL ?? widget.customFaviconUrl ?? '').trim(),
      baseUrl: baseUrl.endsWith('/') ? baseUrl.substring(0, baseUrl.length - 1) : baseUrl,
      booruName: widget.booru?.name?.trim() ?? '',
      booruType: widget.booru?.type?.name ?? '',
      apiKey: widget.booru?.apiKey ?? '',
      userId: widget.booru?.userID ?? '',
      pixelSize: (widget.size * 5).round(),
    );
  }

  final String url;
  final String baseUrl;
  final String booruName;
  final String booruType;
  final String apiKey;
  final String userId;
  final int pixelSize;

  bool get isAvif => url.toLowerCase().contains('.avif');

  @override
  bool operator ==(Object other) {
    return other is _BooruFaviconCacheKey &&
        other.url == url &&
        other.baseUrl == baseUrl &&
        other.booruName == booruName &&
        other.booruType == booruType &&
        other.apiKey == apiKey &&
        other.userId == userId &&
        other.pixelSize == pixelSize;
  }

  @override
  int get hashCode => Object.hash(
    url,
    baseUrl,
    booruName,
    booruType,
    apiKey,
    userId,
    pixelSize,
  );
}

/// Shares favicon providers between every instance that renders the same
/// booru. Flutter's image cache can then reuse one download, decode, and image
/// stream instead of repeating that work for each tab row.
class _BooruFaviconProviderCache {
  static const int _maximumEntries = 64;
  static final LinkedHashMap<_BooruFaviconCacheKey, Future<ImageProvider>> _providers =
      LinkedHashMap<_BooruFaviconCacheKey, Future<ImageProvider>>();

  static Future<ImageProvider> obtain(_BooruFaviconCacheKey key, Booru? booru) {
    final cached = _providers.remove(key);
    if (cached != null) {
      // Reinsert to keep the map in least-recently-used order.
      _providers[key] = cached;
      return cached;
    }

    final created = _createProvider(key, booru);
    _providers[key] = created;
    unawaited(
      created.then<void>(
        (_) {},
        onError: (Object _, StackTrace _) {
          if (identical(_providers[key], created)) {
            _providers.remove(key);
          }
        },
      ),
    );

    while (_providers.length > _maximumEntries) {
      _providers.remove(_providers.keys.first);
    }
    return created;
  }

  static int get length => _providers.length;

  static void clear() => _providers.clear();

  static Future<ImageProvider> _createProvider(_BooruFaviconCacheKey key, Booru? booru) async {
    final headers = await Tools.getFileCustomHeaders(booru);
    final ImageProvider provider = key.isAvif
        ? CustomNetworkAvifImage(
            key.url,
            withCache: true,
            headers: headers,
            cacheFolder: 'favicons',
            fileNameExtras: 'favicon_',
            sendTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
          )
        : CustomNetworkImage(
            key.url,
            withCache: true,
            headers: headers,
            cacheFolder: 'favicons',
            fileNameExtras: 'favicon_',
            sendTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
          );
    return ResizeImage(
      provider,
      width: key.pixelSize,
      height: key.pixelSize,
    );
  }

  static void forget(_BooruFaviconCacheKey? key) {
    if (key != null) {
      _providers.remove(key);
    }
  }

  static Future<void> evict(
    _BooruFaviconCacheKey? key, {
    ImageProvider? fallbackProvider,
  }) async {
    final cached = key == null ? null : _providers.remove(key);
    ImageProvider? cachedProvider;
    if (cached != null) {
      try {
        cachedProvider = await cached;
      } catch (_) {}
    }

    await cachedProvider?.evict();
    if (fallbackProvider != null && !identical(fallbackProvider, cachedProvider)) {
      await fallbackProvider.evict();
    }
  }
}

class BooruFavicon extends StatefulWidget {
  const BooruFavicon(
    this.booru, {
    this.size = defaultSize,
    this.color,
    this.customFaviconUrl,
    super.key,
  });

  final Booru? booru;
  final double size;
  final Color? color;
  final String? customFaviconUrl;

  static const double defaultSize = 20;

  @visibleForTesting
  static Future<ImageProvider> debugCachedProviderFor(
    Booru? booru, {
    double size = defaultSize,
    String? customFaviconUrl,
  }) {
    final widget = BooruFavicon(
      booru,
      size: size,
      customFaviconUrl: customFaviconUrl,
    );
    return _BooruFaviconProviderCache.obtain(
      _BooruFaviconCacheKey.fromWidget(widget),
      booru,
    );
  }

  @visibleForTesting
  static int get debugCachedProviderCount => _BooruFaviconProviderCache.length;

  @visibleForTesting
  static void debugClearProviderCache() => _BooruFaviconProviderCache.clear();

  @override
  State<BooruFavicon> createState() => _BooruFaviconState();
}

class _BooruFaviconState extends State<BooruFavicon> {
  bool isIcon = false, isFailed = false, isLoaded = false, manualReloadTapped = false;
  ImageProvider? mainProvider;
  ImageStream? imageStream;
  late ImageStreamListener imageListener;
  _BooruFaviconCacheKey? activeCacheKey;
  int loadGeneration = 0;
  String? errorCode;

  double get size => widget.size;

  @override
  void didUpdateWidget(BooruFavicon oldWidget) {
    // Switch providers only when the image identity changes. Color-only parent
    // rebuilds keep the already-resolved shared provider.
    if (oldWidget.booru?.faviconURL != widget.booru?.faviconURL ||
        oldWidget.booru?.baseURL != widget.booru?.baseURL ||
        oldWidget.booru?.name != widget.booru?.name ||
        oldWidget.booru?.type != widget.booru?.type ||
        oldWidget.booru?.apiKey != widget.booru?.apiKey ||
        oldWidget.booru?.userID != widget.booru?.userID ||
        oldWidget.customFaviconUrl != widget.customFaviconUrl ||
        oldWidget.size != widget.size) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          unawaited(restartLoading());
        }
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<void> onError(
    Object error, {
    required int generation,
    _BooruFaviconCacheKey? cacheKey,
  }) async {
    if (!mounted || generation != loadGeneration) {
      return;
    }

    //// Error handling
    if (error is DioException && CancelToken.isCancel(error)) {
      //
    } else {
      final failedCacheKey = cacheKey ?? activeCacheKey;
      _BooruFaviconProviderCache.forget(failedCacheKey);

      if (error.toString().contains('Invalid image data') && mainProvider is ResizeImage) {
        final imageProvider = (mainProvider! as ResizeImage).imageProvider;
        if (imageProvider is CustomNetworkImage) {
          await imageProvider.deleteCacheFile();
        } else if (imageProvider is CustomNetworkAvifImage) {
          await imageProvider.deleteCacheFile();
        }
        if (!mounted || generation != loadGeneration) {
          return;
        }
        _removeImageListener();
      }
      if (error is DioException &&
          error.response != null &&
          Tools.isGoodStatusCode(error.response!.statusCode) == false) {
        if (manualReloadTapped && (error.response!.statusCode == 403 || error.response!.statusCode == 503)) {
          await Tools.checkForCaptcha(error.response, error.requestOptions.uri);
          if (!mounted || generation != loadGeneration) {
            return;
          }

          manualReloadTapped = false;
          if (failedCacheKey == activeCacheKey) {
            unawaited(restartLoading(evictSharedProvider: true));
            return;
          }
        }
        errorCode = error.response!.statusCode.toString();
      }

      if (!mounted || generation != loadGeneration) {
        return;
      }
      isFailed = true;
      isLoaded = false;
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted && generation == loadGeneration) {
          updateState();
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    imageListener = ImageStreamListener((imageInfo, syncCall) {});
    unawaited(restartLoading());
  }

  void updateState() {
    if (mounted) setState(() {});
  }

  Future<void> restartLoading({bool evictSharedProvider = false}) async {
    final generation = ++loadGeneration;
    final previousProvider = mainProvider;
    final previousCacheKey = activeCacheKey;
    _removeImageListener();
    mainProvider = null;
    activeCacheKey = null;

    if (evictSharedProvider) {
      await _BooruFaviconProviderCache.evict(
        previousCacheKey,
        fallbackProvider: previousProvider,
      );
    }

    if (!mounted || generation != loadGeneration) {
      return;
    }

    isIcon =
        widget.booru?.type?.isFavouritesOrDownloads == true ||
        (widget.booru?.type == null && widget.customFaviconUrl == null);

    isFailed = false;
    isLoaded = false;
    errorCode = null;

    updateState();

    if (isIcon) {
      isLoaded = true;
      updateState();
    } else {
      final cacheKey = _BooruFaviconCacheKey.fromWidget(widget);
      activeCacheKey = cacheKey;
      try {
        final provider = await _BooruFaviconProviderCache.obtain(cacheKey, widget.booru);
        if (!mounted || generation != loadGeneration) {
          return;
        }
        mainProvider = provider;
      } catch (e, s) {
        if (!mounted || generation != loadGeneration) {
          return;
        }
        Logger.Inst().log(
          'Failed to create favicon provider: ${cacheKey.url}',
          'Favicon',
          'build',
          LogTypes.imageLoadingError,
          s: s,
        );
        await onError(e, generation: generation, cacheKey: cacheKey);
        return;
      }

      imageStream = mainProvider!.resolve(ImageConfiguration.empty);
      imageListener = ImageStreamListener(
        (imageInfo, syncCall) {
          isLoaded = true;
          isFailed = false;
          errorCode = null;
          manualReloadTapped = false;
          if (!syncCall) {
            updateState();
          }
        },
        onError: (e, s) {
          if (!mounted || generation != loadGeneration) {
            return;
          }
          Logger.Inst().log(
            'Failed to load favicon: ${widget.booru?.faviconURL ?? widget.customFaviconUrl}',
            'Favicon',
            'build',
            LogTypes.imageLoadingError,
            s: s,
          );
          unawaited(onError(e, generation: generation, cacheKey: cacheKey));
        },
      );
      imageStream?.addListener(imageListener);

      updateState();
    }
  }

  @override
  void dispose() {
    loadGeneration++;
    _removeImageListener();
    mainProvider = null;
    activeCacheKey = null;
    super.dispose();
  }

  void _removeImageListener() {
    imageStream?.removeListener(imageListener);
    imageStream = null;
    imageListener = ImageStreamListener((imageInfo, syncCall) {});
  }

  @override
  Widget build(BuildContext context) {
    // print('Favicon build ${widget.faviconURL}');

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(size / 5),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isIcon)
            switch (widget.booru?.type) {
              BooruType.Favourites => Icon(Icons.favorite, color: Colors.red, size: size),
              BooruType.Downloads => Icon(Icons.file_download_outlined, size: size),
              _ => Icon(CupertinoIcons.question, size: size),
            }
          else if (mainProvider != null)
            Image(
              image: mainProvider!,
              width: size,
              height: size,
              fit: BoxFit.fill,
              filterQuality: FilterQuality.medium,
              isAntiAlias: true,
              gaplessPlayback: true,
              errorBuilder: (_, _, _) {
                return FaviconError(
                  iconSize: size,
                  color: widget.color ?? Theme.of(context).colorScheme.onSurface,
                  code: errorCode,
                  onRestart: () {
                    manualReloadTapped = true;
                    unawaited(restartLoading(evictSharedProvider: true));
                  },
                );
              },
            )
          else if (isFailed)
            FaviconError(
              iconSize: size,
              color: Colors.grey,
              code: errorCode,
              onRestart: () {
                manualReloadTapped = true;
                unawaited(restartLoading(evictSharedProvider: true));
              },
            ),
          //
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: (isLoaded || isFailed)
                ? const SizedBox.shrink()
                : ShimmerWrap(
                    enabled: !SettingsHandler.instance.shitDevice,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(size / 5),
                      child: ShimmerCard(
                        isLoading: !isLoaded && !isFailed,
                        child: !isLoaded && !isFailed ? null : const SizedBox.shrink(),
                      ),
                    ),
                  ),
          ),

          // Image(
          //   image: NetworkImage(widget.booru.faviconURL!),
          //   width: size,
          //   height: size,
          //   errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
          //     return const Icon(Icons.broken_image, size: size);
          //   },
          // ),
        ],
      ),
    );
  }
}

class FaviconError extends StatelessWidget {
  const FaviconError({
    this.iconSize = BooruFavicon.defaultSize,
    this.color = Colors.grey,
    this.code,
    this.onRestart,
    super.key,
  });

  final double iconSize;
  final Color color;
  final String? code;
  final VoidCallback? onRestart;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onRestart,
        child: Stack(
          children: [
            Center(
              child: Icon(
                Icons.broken_image,
                size: iconSize,
                color: color,
              ),
            ),
            if (code != null)
              Center(
                child: FittedBox(
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.error,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      code!,
                      style: TextStyle(
                        fontSize: 10,
                        color: Theme.of(context).colorScheme.onError,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
