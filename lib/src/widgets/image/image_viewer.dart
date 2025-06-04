import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:photo_view/photo_view.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/navigation_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/media_loading.dart';
import 'package:lolisnatcher/src/widgets/image/custom_network_image.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail.dart';

class ImageViewer extends StatefulWidget {
  const ImageViewer(
    this.booruItem, {
    required this.booru,
    required this.isViewed,
    super.key,
  });

  final BooruItem booruItem;
  final Booru booru;
  final bool isViewed;

  @override
  State<ImageViewer> createState() => ImageViewerState();
}

class ImageViewerState extends State<ImageViewer> {
  final settingsHandler = SettingsHandler.instance;
  final viewerHandler = ViewerHandler.instance;

  PhotoViewScaleStateController scaleController = PhotoViewScaleStateController();
  PhotoViewController viewController = PhotoViewController();

  final ValueNotifier<int> total = ValueNotifier(0), received = ValueNotifier(0), startedAt = ValueNotifier(0);
  final ValueNotifier<bool> isFirstBuild = ValueNotifier(true);
  final ValueNotifier<bool> isLoaded = ValueNotifier(false);
  final ValueNotifier<bool> isViewed = ValueNotifier(false);
  final ValueNotifier<bool> isFromCache = ValueNotifier(false);
  final ValueNotifier<bool> isZoomed = ValueNotifier(false);
  final ValueNotifier<bool> isStopped = ValueNotifier(false);
  int isTooBig = 0; // 0 = not too big, 1 = too big, 2 = too big, but allow downloading
  final ValueNotifier<List<String>> stopReason = ValueNotifier([]);

  final ValueNotifier<ImageProvider?> mainProvider = ValueNotifier(null);
  ImageStreamListener? imageListener;
  ImageStream? imageStream;
  String imageFolder = 'media';
  int? widthLimit;
  CancelToken? cancelToken;

  void onSize(int? size) {
    // TODO find a way to stop loading based on size when caching is enabled
    final int? maxSize = settingsHandler.preloadSizeLimit == 0
        ? null
        : (1024 * 1024 * settingsHandler.preloadSizeLimit * 1000).round();
    if (size == null) {
      return;
    } else if (size == 0) {
      killLoading(['File is zero bytes']);
    } else if (maxSize != null && (size > maxSize) && isTooBig != 2) {
      // TODO add check if resolution is too big
      isTooBig = 1;
      killLoading([
        'File is too big',
        'File size: ${Tools.formatBytes(size, 2)}',
        'Limit: ${Tools.formatBytes(maxSize, 2, withTrailingZeroes: false)}',
      ]);
    }

    if (size > 0 && widget.booruItem.fileSize == null) {
      // set item file size if it wasn't received from api
      widget.booruItem.fileSize = size;
    }
  }

  void onBytesAdded(int receivedNew, int? totalNew) {
    received.value = receivedNew;
    if (totalNew != null) {
      total.value = totalNew;
    }
    onSize(totalNew);
  }

  void onError(Object error) {
    //// Error handling
    if (error is DioException && CancelToken.isCancel(error)) {
      //
    } else {
      if (error is DioException) {
        killLoading([
          'Loading Error: ${error.type.name}',
          if (error.response?.statusCode != null) '${error.response?.statusCode} - ${error.response?.statusMessage}',
        ]);
      } else {
        killLoading(['Loading Error: $error']);
      }
    }
  }

  @override
  void initState() {
    super.initState();

    isViewed.value = widget.isViewed;

    viewerHandler.addViewed(widget.key);

    // debug output
    viewController.outputStateStream.listen(onViewStateChanged);
    scaleController.outputScaleStateStream.listen(onScaleStateChanged);

    // calcWidthLimit(MediaQuery.sizeOf(context).width);
    calcWidthLimit(WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width);

    if (isFirstBuild.value) {
      isFirstBuild.value = false;
      initViewer(false);
    }
  }

  @override
  void didUpdateWidget(ImageViewer oldWidget) {
    // force redraw on item data change
    if (oldWidget.booruItem != widget.booruItem) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        killLoading([]);
        initViewer(false);
      });
    }

    if (oldWidget.isViewed != widget.isViewed) {
      isViewed.value = widget.isViewed;
      if (!isViewed.value) {
        // reset zoom if not viewed
        resetZoom();
      }
    }

    super.didUpdateWidget(oldWidget);
  }

  bool get useFullImage => settingsHandler.galleryMode == 'Full Res'
      ? !widget.booruItem.toggleQuality.value
      : widget.booruItem.toggleQuality.value;

  Future<void> initViewer(bool ignoreTagsCheck) async {
    widget.booruItem.isNoScale.addListener(noScaleListener);

    widget.booruItem.toggleQuality.addListener(toggleQualityListener);

    if (widget.booruItem.isHated && !ignoreTagsCheck) {
      if (widget.booruItem.isHated) {
        killLoading([
          'Contains Hated tags:',
          ...settingsHandler.parseTagsList(widget.booruItem.tagsList, isCapped: true).hatedTags,
        ]);
        return;
      }
    }

    isStopped.value = false;

    startedAt.value = DateTime.now().millisecondsSinceEpoch;

    final MediaQueryData mQuery = MediaQuery.of(NavigationHandler.instance.navigatorKey.currentContext!);
    widthLimit = settingsHandler.disableImageScaling ? null : (mQuery.size.width * mQuery.devicePixelRatio * 2).round();

    mainProvider.value ??= await getImageProvider();

    imageStream?.removeListener(imageListener!);
    imageStream = mainProvider.value!.resolve(ImageConfiguration.empty);
    imageListener = ImageStreamListener(
      (imageInfo, syncCall) {
        final prevIsLoaded = isLoaded.value;
        isLoaded.value = true;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          // without this check gifs will keep resetting zoom on every frame change
          // because every frame is considered as new image
          if (prevIsLoaded == false) {
            resetZoom();
          }
          viewerHandler.setLoaded(widget.key, true);
        });
      },
      onChunk: (event) {
        onBytesAdded(event.cumulativeBytesLoaded, event.expectedTotalBytes);
      },
      onError: (e, stack) => onError(e),
    );
    imageStream!.addListener(imageListener!);
  }

  void noScaleListener() {
    killLoading([]);
    initViewer(false);
  }

  void toggleQualityListener() {
    killLoading([]);
    initViewer(false);
  }

  void calcWidthLimit(double maxWidth) {
    if (!mounted) {
      return;
    }

    widthLimit = settingsHandler.disableImageScaling
        ? null
        : (maxWidth * MediaQuery.devicePixelRatioOf(context) * 2).round();
  }

  Future<ImageProvider> getImageProvider() async {
    if ((settingsHandler.galleryMode == 'Sample' &&
            widget.booruItem.sampleURL.isNotEmpty &&
            widget.booruItem.sampleURL != widget.booruItem.thumbnailURL) ||
        widget.booruItem.sampleURL == widget.booruItem.fileURL) {
      // use sample file if (sample gallery quality && sampleUrl exists && sampleUrl is not the same as thumbnailUrl) OR sampleUrl is the same as full res fileUrl
      imageFolder = 'samples';
    } else {
      imageFolder = 'media';
    }

    if (useFullImage) {
      if (imageFolder != 'media') {
        imageFolder = 'media';
      }
    } else {
      if (imageFolder != 'samples') {
        imageFolder = 'samples';
      }
    }

    ImageProvider provider;
    cancelToken = CancelToken();
    final String url = useFullImage ? widget.booruItem.fileURL : widget.booruItem.sampleURL;
    final bool isAvif = url.contains('.avif');
    provider = isAvif
        ? CustomNetworkAvifImage(
            url,
            cancelToken: cancelToken,
            headers: await Tools.getFileCustomHeaders(
              widget.booru,
              checkForReferer: true,
            ),
            withCache: settingsHandler.mediaCache,
            cacheFolder: imageFolder,
            fileNameExtras: widget.booruItem.fileNameExtras,
            onError: onError,
            onCacheDetected: (bool didDetectCache) {
              isFromCache.value = didDetectCache;
            },
          )
        : CustomNetworkImage(
            url,
            cancelToken: cancelToken,
            headers: await Tools.getFileCustomHeaders(
              widget.booru,
              checkForReferer: true,
            ),
            withCache: settingsHandler.mediaCache,
            cacheFolder: imageFolder,
            fileNameExtras: widget.booruItem.fileNameExtras,
            onError: onError,
            onCacheDetected: (bool didDetectCache) {
              isFromCache.value = didDetectCache;
            },
          );

    // scale image only if it's not an animation, scaling is allowed and item is not marked as noScale
    if (!widget.booruItem.mediaType.value.isAnimation &&
        !settingsHandler.disableImageScaling &&
        !widget.booruItem.isNoScale.value &&
        (widthLimit ?? 0) > 0) {
      // resizeimage if resolution is too high (in attempt to fix crashes if multiple very HQ images are loaded), only check by width, otherwise looooooong/thin images could look bad
      provider = ResizeImage(
        provider,
        width: widthLimit,
        allowUpscaling: false,
      );
    }
    return provider;
  }

  void killLoading(List<String> reason) {
    disposables();

    total.value = 0;
    received.value = 0;

    startedAt.value = 0;

    isLoaded.value = false;
    isFromCache.value = false;
    isStopped.value = true;
    stopReason.value = reason;

    viewerHandler.setLoaded(widget.key, false);
  }

  @override
  void dispose() {
    disposables();

    viewerHandler.removeViewed(widget.key);
    super.dispose();
  }

  void disposables() {
    imageStream?.removeListener(imageListener!);
    imageStream = null;
    imageListener = null;

    if (!(cancelToken?.isCancelled ?? true)) {
      cancelToken?.cancel();
    }
    cancelToken = null;

    // evict image from memory cache if it's media type or it's an animation and gifsAsThumbnails is disabled
    if (imageFolder == 'media' ||
        (!widget.booruItem.mediaType.value.isAnimation || !settingsHandler.gifsAsThumbnails)) {
      mainProvider.value?.evict();
      // mainProvider.value?.evict().then((bool success) {
      //   if(success) {
      //     print('main image evicted');
      //   } else {
      //     print('main image eviction failed');
      //   }
      // });
    }
    mainProvider.value = null;

    widget.booruItem.isNoScale.removeListener(noScaleListener);
    widget.booruItem.toggleQuality.removeListener(toggleQualityListener);
  }

  // debug functions
  void onScaleStateChanged(PhotoViewScaleState scaleState) {
    // print(scaleState);

    // manual zoom || double tap || double tap AFTER double tap
    isZoomed.value =
        scaleState == PhotoViewScaleState.zoomedIn ||
        scaleState == PhotoViewScaleState.covering ||
        scaleState == PhotoViewScaleState.originalSize;
    viewerHandler.setZoomed(widget.key, isZoomed.value);
  }

  void onViewStateChanged(PhotoViewControllerValue viewState) {
    // print(viewState);
    viewerHandler.setViewValue(widget.key, viewState);
  }

  void resetZoom() {
    scaleController.scaleState = PhotoViewScaleState.initial;
    viewerHandler.setZoomed(widget.key, false);
  }

  void scrollZoomImage(double value) {
    final double upperLimit = min(8, (viewController.scale ?? 1) + (value / 200));
    // zoom on which image fits to container can be less than limit
    // therefore don't clump the value to lower limit if we are zooming in to avoid unnecessary zoom jumps
    final double lowerLimit = value > 0 ? upperLimit : max(0.75, upperLimit);

    // if zooming out and zoom is smaller than limit - reset to container size
    // TODO minimal scale to fit can be different from limit
    if (lowerLimit == 0.75 && value < 0) {
      scaleController.scaleState = PhotoViewScaleState.initial;
    } else {
      viewController.scale = lowerLimit;
    }
  }

  void doubleTapZoom() {
    if (!isLoaded.value) return;
    scaleController.scaleState = PhotoViewScaleState.covering;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      // without this every text element will have broken styles on first frames
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          ValueListenableBuilder(
            valueListenable: isLoaded,
            builder: (context, isLoaded, child) {
              return AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: isLoaded ? 0 : 1,
                child: child,
              );
            },
            child: ValueListenableBuilder(
              valueListenable: isViewed,
              builder: (context, isViewed, child) {
                return Hero(
                  tag: 'imageHero${isViewed ? '' : '-ignore-'}${widget.booruItem.hashCode}',
                  child: child!,
                );
              },
              child: Thumbnail(
                item: widget.booruItem,
                isStandalone: false,
                useHero: false,
              ),
            ),
          ),
          //
          ValueListenableBuilder(
            valueListenable: isLoaded,
            builder: (context, isLoaded, _) {
              return ValueListenableBuilder(
                valueListenable: isViewed,
                builder: (context, isViewed, _) {
                  return ValueListenableBuilder(
                    valueListenable: isStopped,
                    builder: (context, isStopped, _) {
                      return ValueListenableBuilder(
                        valueListenable: isFromCache,
                        builder: (context, isFromCache, _) {
                          return ValueListenableBuilder(
                            valueListenable: stopReason,
                            builder: (context, stopReason, _) {
                              return MediaLoading(
                                item: widget.booruItem,
                                hasProgress: true,
                                isFromCache: isFromCache,
                                isDone: isLoaded,
                                isTooBig: isTooBig > 0,
                                isStopped: isStopped,
                                stopReasons: stopReason,
                                isViewed: isViewed,
                                total: total,
                                received: received,
                                startedAt: startedAt,
                                startAction: () {
                                  if (isTooBig == 1) {
                                    isTooBig = 2;
                                  }
                                  initViewer(true);
                                },
                                stopAction: () {
                                  killLoading(['Stopped by User']);
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
          //
          Listener(
            onPointerSignal: (pointerSignal) {
              if (mainProvider.value == null || !SettingsHandler.isDesktopPlatform) {
                return;
              }
              if (pointerSignal is PointerScrollEvent) {
                scrollZoomImage(pointerSignal.scrollDelta.dy);
              }
            },
            child: ImageFiltered(
              enabled: settingsHandler.blurImages,
              imageFilter: ImageFilter.blur(
                sigmaX: 30,
                sigmaY: 30,
                tileMode: TileMode.decal,
              ),
              child: ValueListenableBuilder(
                valueListenable: isLoaded,
                builder: (context, isLoaded, child) {
                  return AnimatedOpacity(
                    opacity: isLoaded ? 1 : 0,
                    duration: Duration(
                      milliseconds: (settingsHandler.appMode.value.isDesktop || isViewed.value) ? 50 : 300,
                    ),
                    child: child,
                  );
                },
                child: ValueListenableBuilder(
                  valueListenable: mainProvider,
                  builder: (context, mainProvider, _) {
                    return AnimatedSwitcher(
                      duration: Duration(
                        milliseconds: (settingsHandler.appMode.value.isDesktop || isViewed.value) ? 50 : 300,
                      ),
                      child: mainProvider == null
                          ? const SizedBox.shrink()
                          : PhotoView(
                              imageProvider: mainProvider,
                              gaplessPlayback: true,
                              loadingBuilder: (context, event) {
                                return const SizedBox.shrink();
                              },
                              errorBuilder: (_, error, _) {
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  onError(error);
                                });
                                return const SizedBox.shrink();
                              },
                              backgroundDecoration: const BoxDecoration(color: Colors.transparent),
                              // to avoid flickering during hero transition
                              // TODO will cause scaling issues on desktop, fix when we'll get back to it
                              customSize: MediaQuery.sizeOf(context),
                              // TODO FilterQuality.high somehow leads to a worse looking image on desktop
                              filterQuality: widget.booruItem.isLong ? FilterQuality.medium : FilterQuality.medium,
                              minScale: PhotoViewComputedScale.contained,
                              maxScale: PhotoViewComputedScale.covered * 8,
                              initialScale: PhotoViewComputedScale.contained,
                              enableRotation: settingsHandler.allowRotation,
                              basePosition: Alignment.center,
                              controller: viewController,
                              scaleStateController: scaleController,
                            ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
