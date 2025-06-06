import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/debouncer.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/thumbnail_loading.dart';
import 'package:lolisnatcher/src/widgets/image/custom_network_image.dart';
import 'package:lolisnatcher/src/widgets/preview/shimmer_builder.dart';

class Thumbnail extends StatefulWidget {
  const Thumbnail({
    required this.item,
    required this.booru,
    this.isStandalone = false,
    this.useHero = true,
    super.key,
  });

  final BooruItem item;
  final Booru booru;

  /// set to true when used in a list
  final bool isStandalone;
  final bool useHero;

  @override
  State<Thumbnail> createState() => _ThumbnailState();
}

class _ThumbnailState extends State<Thumbnail> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  final ValueNotifier<int> total = ValueNotifier(0), received = ValueNotifier(0), startedAt = ValueNotifier(0);
  int restartedCount = 0;
  final ValueNotifier<bool?> isFromCache = ValueNotifier(null);
  final ValueNotifier<bool> isFirstBuild = ValueNotifier(true);
  final ValueNotifier<bool> isFailed = ValueNotifier(false);
  final ValueNotifier<bool> isLoaded = ValueNotifier(false);
  final ValueNotifier<bool> isLoadedExtra = ValueNotifier(false);
  final ValueNotifier<bool> failedRendering = ValueNotifier(false);
  final ValueNotifier<String?> errorCode = ValueNotifier(null);
  CancelToken? mainCancelToken, extraCancelToken;

  Timer? debounceLoading;

  bool? isThumbQuality;
  late String thumbURL;
  late String thumbFolder;
  double? thumbWidth, thumbHeight;

  final ValueNotifier<ImageProvider?> mainProvider = ValueNotifier(null), extraProvider = ValueNotifier(null);
  ImageStreamListener? mainImageListener, extraImageListener;
  ImageStream? mainImageStream, extraImageStream;

  @override
  void didUpdateWidget(Thumbnail oldWidget) {
    // force redraw on tab change
    if (oldWidget.item != widget.item) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        restartLoading();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<ImageProvider> getImageProvider(bool isMain) async {
    if (isMain) {
      mainCancelToken ??= CancelToken();
    } else {
      extraCancelToken ??= CancelToken();
    }
    final String url = isMain ? thumbURL : widget.item.thumbnailURL;
    final bool isAvif = url.contains('.avif');
    final ImageProvider provider = isAvif
        ? CustomNetworkAvifImage(
            url,
            cancelToken: isMain ? mainCancelToken : extraCancelToken,
            headers: await Tools.getFileCustomHeaders(
              widget.booru,
              item: widget.item,
              checkForReferer: true,
            ),
            withCache: settingsHandler.thumbnailCache,
            cacheFolder: isMain ? thumbFolder : 'thumbnails',
            fileNameExtras: widget.item.fileNameExtras,
            sendTimeout: widget.isStandalone ? const Duration(seconds: 20) : null,
            receiveTimeout: widget.isStandalone ? const Duration(seconds: 20) : null,
            onError: isMain ? onError : null,
            onCacheDetected: (bool didDetectCache) {
              if (isMain) {
                isFromCache.value = didDetectCache;
              }
            },
          )
        : CustomNetworkImage(
            url,
            cancelToken: isMain ? mainCancelToken : extraCancelToken,
            headers: await Tools.getFileCustomHeaders(
              widget.booru,
              item: widget.item,
              checkForReferer: true,
            ),
            withCache: settingsHandler.thumbnailCache,
            cacheFolder: isMain ? thumbFolder : 'thumbnails',
            fileNameExtras: widget.item.fileNameExtras,
            sendTimeout: widget.isStandalone ? const Duration(seconds: 20) : null,
            receiveTimeout: widget.isStandalone ? const Duration(seconds: 20) : null,
            onError: isMain ? onError : null,
            onCacheDetected: (bool didDetectCache) {
              if (isMain) {
                isFromCache.value = didDetectCache;
              }
            },
          );

    if (thumbWidth == null && thumbHeight == null) {
      return provider;
    }

    return ResizeImage(
      provider,
      // when in low performance mode - resize hated images to 10px to simulate blur effect
      width: (widget.item.isHated && settingsHandler.shitDevice) ? 10 : thumbWidth?.round(),
      height: (widget.item.isHated && settingsHandler.shitDevice) ? 10 : thumbHeight?.round(),
      policy: ResizeImagePolicy.fit,
      allowUpscaling: false,
    );
  }

  void calcThumbWidth(BoxConstraints constraints) {
    if (!mounted) {
      return;
    }

    final double widthLimit = constraints.maxWidth * MediaQuery.devicePixelRatioOf(context);
    double thumbRatio = 1;
    final bool hasSizeData = widget.item.fileHeight != null && widget.item.fileWidth != null;

    if (!widget.isStandalone) {
      thumbWidth = widthLimit;
      return;
    }

    switch (settingsHandler.previewDisplay) {
      case 'Rectangle':
        thumbRatio = 16 / 9;
        thumbWidth = widthLimit;
        thumbHeight = widthLimit * thumbRatio;
        break;

      case 'Staggered':
        if (hasSizeData) {
          thumbRatio = widget.item.fileAspectRatio!;
          if (thumbRatio < 1) {
            // vertical image - resize to width
            thumbWidth = widthLimit;
          } else {
            // horizontal image - resize to height
            thumbHeight = widthLimit * thumbRatio;
          }
        } else {
          thumbRatio = 16 / 9;
          thumbWidth = widthLimit;
          thumbHeight = widthLimit * thumbRatio;
        }
        break;

      case 'Square':
      default:
        thumbWidth = widthLimit;
        thumbHeight = widthLimit;
        break;
    }
  }

  void onBytesAdded(int receivedNew, int? totalNew) {
    received.value = receivedNew;
    total.value = totalNew ?? 0;
  }

  void onError(Object error, {bool delayed = false}) {
    if (error is DioException && CancelToken.isCancel(error)) {
      //
    } else {
      if (restartedCount < (kDebugMode ? 1 : 3)) {
        // attempt to reload 3 times with a 1s delay
        Debounce.debounce(
          tag: 'thumbnail_reload_${widget.item.hashCode}',
          callback: () {
            restartLoading();
            restartedCount++;
          },
          duration: const Duration(seconds: 1),
        );
      } else {
        isFailed.value = true;
        if (error is DioException) {
          errorCode.value = error.response?.statusCode?.toString();
        } else {
          errorCode.value = null;
        }
      }
    }
  }

  void selectThumbProvider() {
    startedAt.value = DateTime.now().millisecondsSinceEpoch;

    // if scaling is disabled - allow gifs as thumbnails, but only if they are not hated (resize image doesnt work with gifs)
    final bool isSampleGif = widget.item.sampleURL.contains('.gif');
    final bool isGifSampleNotAllowed =
        widget.item.mediaType.value.isAnimation &&
        ((settingsHandler.disableImageScaling && settingsHandler.gifsAsThumbnails) ? widget.item.isHated : true);

    isThumbQuality =
        settingsHandler.previewMode == 'Thumbnail' ||
        (isGifSampleNotAllowed ||
            widget.item.mediaType.value.isVideo ||
            widget.item.mediaType.value.isNeedToGuess ||
            widget.item.mediaType.value.isNeedToLoadItem) ||
        (!widget.isStandalone && widget.item.fileURL == widget.item.sampleURL);
    thumbURL = isThumbQuality == true
        ? widget.item.thumbnailURL
        : (!isSampleGif || isGifSampleNotAllowed ? widget.item.sampleURL : widget.item.thumbnailURL);
    thumbFolder = (isThumbQuality == true || thumbURL == widget.item.thumbnailURL) ? 'thumbnails' : 'samples';

    // delay loading a little to improve performance when scrolling fast, ignore delay if it's a standalone widget (i.e. not in a list)
    debounceLoading = Timer(
      Duration(milliseconds: widget.isStandalone ? 200 : 0),
      startDownloading,
    );
    return;
  }

  Future<void> startDownloading() async {
    final bool useExtra = isThumbQuality == false && !widget.item.isHated && !settingsHandler.shitDevice;

    mainProvider.value = await getImageProvider(true);
    mainImageStream?.removeListener(mainImageListener!);
    mainImageStream = mainProvider.value!.resolve(ImageConfiguration.empty);
    mainImageListener = ImageStreamListener(
      (imageInfo, syncCall) {
        isLoaded.value = true;
      },
      onChunk: (event) {
        onBytesAdded(event.cumulativeBytesLoaded, event.expectedTotalBytes);
      },
      onError: (e, s) {
        if (e is! DioException) {
          failedRendering.value = true;
        }
        Logger.Inst().log(
          'Error loading thumbnail: ${widget.item.sampleURL} ${widget.item.thumbnailURL}',
          'Thumbnail',
          'build',
          LogTypes.imageLoadingError,
          s: s,
        );
        onError(e, delayed: true);
      },
    );
    mainImageStream!.addListener(mainImageListener!);

    if (useExtra) {
      extraProvider.value = await getImageProvider(false);
      extraImageStream?.removeListener(extraImageListener!);
      extraImageStream = extraProvider.value!.resolve(ImageConfiguration.empty);
      extraImageListener = ImageStreamListener(
        (imageInfo, syncCall) {
          isLoadedExtra.value = true;
        },
        onError: (e, s) {
          if (e is! DioException) {
            failedRendering.value = true;
          }
          Logger.Inst().log(
            'Error loading extra thumbnail: ${widget.item.thumbnailURL}',
            'Thumbnail',
            'build',
            LogTypes.imageLoadingError,
            s: s,
          );
        },
      );
      extraImageStream!.addListener(extraImageListener!);
    }
  }

  void restartLoading() {
    if (failedRendering.value) {
      failedRendering.value = false;
      cleanProviderCache();
    }

    disposables();

    total.value = 0;
    received.value = 0;
    startedAt.value = 0;

    isLoaded.value = false;
    isLoadedExtra.value = false;
    isFromCache.value = null;
    isFailed.value = false;
    errorCode.value = null;

    selectThumbProvider();
  }

  Future<void> cleanProviderCache() async {
    if (mainProvider.value != null) {
      final CustomNetworkImage usedMainProvider =
          (mainProvider.value is ResizeImage ? (mainProvider.value! as ResizeImage).imageProvider : mainProvider.value!)
              as CustomNetworkImage;
      await usedMainProvider.deleteCacheFile();
    }
    if (extraProvider.value != null) {
      final CustomNetworkImage usedExtraProvider =
          (extraProvider.value is ResizeImage
                  ? (extraProvider.value! as ResizeImage).imageProvider
                  : extraProvider.value!)
              as CustomNetworkImage;
      await usedExtraProvider.deleteCacheFile();
    }
  }

  @override
  void dispose() {
    disposables();
    super.dispose();
  }

  void disposables() {
    mainImageStream?.removeListener(mainImageListener!);
    mainImageListener = null;
    mainImageStream = null;
    extraImageStream?.removeListener(extraImageListener!);
    extraImageListener = null;
    extraImageStream = null;

    if (!(mainCancelToken?.isCancelled ?? true)) {
      mainCancelToken?.cancel();
    }
    mainCancelToken = null;

    if (!(extraCancelToken?.isCancelled ?? true)) {
      extraCancelToken?.cancel();
    }
    extraCancelToken = null;

    // evict from memory cache only when in grid
    if (widget.isStandalone) {
      mainProvider.value?.evict();
      mainProvider.value = null;
      extraProvider.value?.evict();
      extraProvider.value = null;
    }

    debounceLoading?.cancel();
    Debounce.cancel('thumbnail_reload_${widget.item.hashCode}');
  }

  @override
  Widget build(BuildContext context) {
    Widget imageStack = LayoutBuilder(
      builder: (context, constraints) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          calcThumbWidth(constraints);
          if (isFirstBuild.value) {
            isFirstBuild.value = false;
            selectThumbProvider();
          }
        });

        // take smallest dimension for hated icon container
        final double iconSize =
            (constraints.maxHeight < constraints.maxWidth ? constraints.maxHeight : constraints.maxWidth) * 0.75;

        final bool useExtra = isThumbQuality == false && !widget.item.isHated && !settingsHandler.shitDevice;

        return Stack(
          alignment: Alignment.center,
          children: [
            if (widget.isStandalone)
              ValueListenableBuilder(
                valueListenable: isFailed,
                builder: (context, isFailed, _) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    color: isFailed ? Colors.red.withValues(alpha: 0.1) : Colors.transparent,
                  );
                },
              ),
            //
            if (useExtra) // fetch small low quality thumbnail while loading a sample
              ValueListenableBuilder(
                valueListenable: isLoadedExtra,
                builder: (context, isLoadedExtra, child) {
                  return AnimatedOpacity(
                    // fade in image
                    opacity: (!widget.isStandalone || isLoadedExtra) ? 1 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: child,
                  );
                },
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: widget.isStandalone ? 100 : 0),
                  child: ImageFiltered(
                    enabled: settingsHandler.blurImages || widget.item.isHated,
                    imageFilter: ImageFilter.blur(
                      sigmaX: (settingsHandler.blurImages && !widget.isStandalone) ? 30 : 10,
                      sigmaY: (settingsHandler.blurImages && !widget.isStandalone) ? 30 : 10,
                      tileMode: TileMode.decal,
                    ),
                    child: ValueListenableBuilder(
                      valueListenable: extraProvider,
                      builder: (context, extraProvider, _) {
                        if (extraProvider == null) {
                          return const SizedBox.shrink();
                        }

                        return Image(
                          image: extraProvider,
                          fit: widget.isStandalone ? BoxFit.cover : BoxFit.contain,
                          isAntiAlias: true,
                          filterQuality: FilterQuality.medium,
                          width: double.infinity,
                          height: double.infinity,
                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                            if (widget.isStandalone) {
                              return Icon(Icons.broken_image, size: 30, color: Colors.yellow.withValues(alpha: 0.5));
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            //
            ValueListenableBuilder(
              valueListenable: isLoaded,
              builder: (context, isLoaded, child) {
                return AnimatedOpacity(
                  // fade in image
                  opacity: (settingsHandler.shitDevice || !widget.isStandalone || isLoaded) ? 1 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: child,
                );
              },
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: widget.isStandalone ? 200 : 0),
                child: ImageFiltered(
                  enabled: settingsHandler.blurImages || (widget.item.isHated && !settingsHandler.shitDevice),
                  imageFilter: ImageFilter.blur(
                    sigmaX: (settingsHandler.blurImages && !widget.isStandalone) ? 30 : 10,
                    sigmaY: (settingsHandler.blurImages && !widget.isStandalone) ? 30 : 10,
                    tileMode: TileMode.decal,
                  ),
                  child: ValueListenableBuilder(
                    valueListenable: mainProvider,
                    builder: (context, mainProvider, _) {
                      if (mainProvider == null) {
                        return const SizedBox.shrink();
                      }

                      return Image(
                        image: mainProvider,
                        fit: widget.isStandalone ? BoxFit.cover : BoxFit.contain,
                        isAntiAlias: true,
                        filterQuality: FilterQuality.medium,
                        width: double.infinity,
                        height: double.infinity,
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                          if (widget.isStandalone) {
                            return Icon(Icons.broken_image, size: 30, color: Colors.white.withValues(alpha: 0.5));
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            //
            if (widget.isStandalone && !settingsHandler.shitDevice)
              ValueListenableBuilder(
                valueListenable: isLoaded,
                builder: (context, isLoaded, _) {
                  return ValueListenableBuilder(
                    valueListenable: isLoadedExtra,
                    builder: (context, isLoadedExtra, _) {
                      return ValueListenableBuilder(
                        valueListenable: isFailed,
                        builder: (context, isFailed, _) {
                          final bool isAnyLoaded = isLoaded || isLoadedExtra;
                          final bool showShimmer = !isAnyLoaded && !isFailed;

                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            child: isAnyLoaded
                                ? const SizedBox.shrink()
                                : ShimmerCard(
                                    isLoading: showShimmer,
                                    child: showShimmer ? null : const SizedBox.shrink(),
                                  ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            //
            if (widget.isStandalone)
              ValueListenableBuilder(
                valueListenable: isLoaded,
                builder: (context, isLoaded, child) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: isLoaded ? const SizedBox.shrink() : child,
                  );
                },
                child: ValueListenableBuilder(
                  valueListenable: isLoaded,
                  builder: (context, isLoaded, child) {
                    return ValueListenableBuilder(
                      valueListenable: isFromCache,
                      builder: (context, isFromCache, child) {
                        return ValueListenableBuilder(
                          valueListenable: isFailed,
                          builder: (context, isFailed, child) {
                            return ValueListenableBuilder(
                              valueListenable: errorCode,
                              builder: (context, errorCode, child) {
                                return ThumbnailLoading(
                                  item: widget.item,
                                  hasProgress: true,
                                  isFromCache: isFromCache,
                                  isDone: isLoaded && !isFailed,
                                  isFailed: isFailed,
                                  total: total,
                                  received: received,
                                  startedAt: startedAt,
                                  restartAction: () {
                                    restartedCount = 0;
                                    restartLoading();
                                  },
                                  errorCode: errorCode,
                                );
                              },
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            //
            if (widget.isStandalone && widget.item.isHated)
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(iconSize * 0.1),
                ),
                width: iconSize,
                height: iconSize,
                child: const Icon(
                  CupertinoIcons.eye_slash,
                  color: Colors.white,
                ),
              ),
          ],
        );
      },
    );

    imageStack = Material(
      color: Colors.transparent,
      child: imageStack,
    );

    if (widget.isStandalone && widget.useHero) {
      return HeroMode(
        enabled: settingsHandler.enableHeroTransitions && !settingsHandler.shitDevice,
        child: Hero(
          tag: 'imageHero${widget.item.hashCode}',
          placeholderBuilder: (BuildContext context, Size heroSize, Widget child) {
            // keep building the image since the images can be visible in the
            // background of the image gallery
            return child;
          },
          child: imageStack,
        ),
      );
    } else {
      return imageStack;
    }
  }
}
