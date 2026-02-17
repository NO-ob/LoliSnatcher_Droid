import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:photo_view/photo_view.dart';
import 'package:image/image.dart' as img;

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/navigation_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/services/image_writer.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/media_loading.dart';
import 'package:lolisnatcher/src/widgets/image/custom_network_image.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail.dart';

// TODO optimize tiling ("too long") blocker to not force download again

enum ViewerStopReason {
  user,
  error,
  tooBig,
  hidden,
  videoError,
  reset,
  ;

  bool get isUser => this == user;
  bool get isError => this == error;
  bool get isTooBig => this == tooBig;
  bool get isHidden => this == hidden;
  bool get isVideoError => this == videoError;
  bool get isReset => this == reset;
}

enum PreloadBlockState {
  tooBig,
  ignore,
  initial,
  ;

  bool get isTooBig => this == tooBig;
  bool get isIgnore => this == ignore;
  bool get isInitial => this == initial;
}

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
  final ValueNotifier<bool> showLoading = ValueNotifier(true);

  PreloadBlockState blockPreloadState = .initial;
  final ValueNotifier<ViewerStopReason?> stopReason = ValueNotifier(null);
  final ValueNotifier<String?> stopDetails = ValueNotifier(null);

  final ValueNotifier<ImageProvider?> mainProvider = ValueNotifier(null);
  ImageStreamListener? imageListener;
  ImageStream? imageStream;

  String imageFolder = 'media';
  int? widthLimit;
  CancelToken? cancelToken;
  CancelToken? loadItemCancelToken;

  static const int kMaxTextureHeight = 4096;
  static const int kMaxTileMemoryBudget = 512 * 1024 * 1024; // max GPU texture memory for all tiles
  static const int kMaxPixelsHeight = 80000;
  bool isTiled = false;
  List<ImageProvider>? tiledProviders;
  ValueNotifier<bool?> isTilingProcessing = ValueNotifier(null);
  Size? tiledSize;

  bool get isProviderLoaded {
    if (isTilingProcessing.value != false) {
      return false;
    }

    if (isTiled && tiledProviders?.isNotEmpty == true) {
      return true;
    } else {
      return mainProvider.value != null;
    }
  }

  void onSize(int? size) {
    // TODO find a way to stop loading based on size when caching is enabled
    final int? maxSize = settingsHandler.preloadSizeLimit == 0
        ? null
        : (1024 * 1024 * settingsHandler.preloadSizeLimit * 1000).round();
    if (size == null) {
      return;
    } else if (size == 0) {
      stopLoading(
        reason: .error,
        title: context.loc.media.loading.fileIsZeroBytes,
      );
    } else if (maxSize != null && (size > maxSize) && !blockPreloadState.isIgnore) {
      stopLoading(
        reason: .tooBig,
        details:
            '${context.loc.media.loading.fileSize(size: Tools.formatBytes(size, 2))}\n'
            '${context.loc.media.loading.sizeLimit(limit: Tools.formatBytes(maxSize, 2, withTrailingZeroes: false))}',
      );
    }

    if (size > 0) {
      widget.booruItem.fileSize = size;
    }
  }

  void onBytesAdded(int receivedNew, int? totalNew) {
    received.value = receivedNew;
    if (totalNew != null) {
      total.value = totalNew;
      onSize(totalNew);
    }
  }

  void onError(Object error) {
    if (error is DioException && CancelToken.isCancel(error)) {
      //
    } else {
      if (error is DioException) {
        stopLoading(
          reason: .error,
          title: error.type.name,
          details: (error.response?.statusCode != null)
              ? '${error.response?.statusCode} - ${error.response?.statusMessage ?? DioNetwork.badResponseExceptionMessage(error.response?.statusCode)}'
              : null,
        );
      } else {
        stopLoading(reason: .error);
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

    calcWidthLimit(MediaQuery.sizeOf(NavigationHandler.instance.navContext).width);

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
        stopLoading(reason: .reset);
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

  bool get useFullImage => settingsHandler.galleryMode.isFullRes
      ? !widget.booruItem.toggleQuality.value
      : widget.booruItem.toggleQuality.value;

  Future<void> initViewer(
    bool ignoreTagsCheck, {
    bool withCaptchaCheck = false,
  }) async {
    widget.booruItem.isNoScale.addListener(noScaleListener);

    widget.booruItem.toggleQuality.addListener(toggleQualityListener);

    if (widget.booruItem.isHidden && !ignoreTagsCheck) {
      if (widget.booruItem.isHidden) {
        stopLoading(
          reason: .hidden,
          details: settingsHandler
              .parseTagsList(
                widget.booruItem.tagsList,
                isCapped: true,
              )
              .hiddenTags
              .join('\n'),
        );
        return;
      }
    }

    isStopped.value = false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewerHandler.setStopped(widget.key, false);
    });

    startedAt.value = DateTime.now().millisecondsSinceEpoch;

    final mQuery = MediaQuery.of(NavigationHandler.instance.navContext);
    widthLimit = settingsHandler.disableImageScaling ? null : (mQuery.size.width * mQuery.devicePixelRatio * 2).round();

    mainProvider.value ??= await getImageProvider(
      withCaptchaCheck: withCaptchaCheck,
    );

    imageStream?.removeListener(imageListener!);
    imageStream = mainProvider.value!.resolve(ImageConfiguration.empty);
    imageListener = ImageStreamListener(
      (imageInfo, syncCall) async {
        if (imageInfo.image.height >= settingsHandler.preloadHeight) {
          await checkAndPrepareTiles();
        } else {
          isTilingProcessing.value = false;
        }

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

  void forceLoad() {
    if (isStopped.value) {
      onManualRestart();
    }
  }

  void noScaleListener() {
    stopLoading(reason: .reset);
    initViewer(false);
  }

  void toggleQualityListener() {
    stopLoading(reason: .reset);
    initViewer(false);
  }

  void calcWidthLimit(double maxWidth) {
    if (!mounted) {
      return;
    }

    widthLimit = settingsHandler.disableImageScaling
        ? null
        : (maxWidth * MediaQuery.devicePixelRatioOf(NavigationHandler.instance.navContext) * 2).round();
  }

  Future<ImageProvider> getImageProvider({
    bool withCaptchaCheck = false,
  }) async {
    if ((settingsHandler.galleryMode.isSample &&
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
    cancelToken?.cancel();
    cancelToken = CancelToken();

    final String url = useFullImage ? widget.booruItem.fileURL : widget.booruItem.sampleURL;
    final bool isAvif = url.contains('.avif');

    provider = isAvif
        ? CustomNetworkAvifImage(
            url,
            cancelToken: cancelToken,
            headers: await Tools.getFileCustomHeaders(
              widget.booru,
              item: widget.booruItem,
              checkForReferer: true,
            ),
            withCache: settingsHandler.mediaCache,
            cacheFolder: imageFolder,
            fileNameExtras: widget.booruItem.fileNameExtras,
            onError: onError,
            onCacheDetected: (bool didDetectCache) {
              isFromCache.value = didDetectCache;
            },
            withCaptchaCheck: withCaptchaCheck,
          )
        : CustomNetworkImage(
            url,
            cancelToken: cancelToken,
            headers: await Tools.getFileCustomHeaders(
              widget.booru,
              item: widget.booruItem,
              checkForReferer: true,
            ),
            withCache: settingsHandler.mediaCache,
            cacheFolder: imageFolder,
            fileNameExtras: widget.booruItem.fileNameExtras,
            onError: onError,
            onCacheDetected: (bool didDetectCache) {
              isFromCache.value = didDetectCache;
            },
            withCaptchaCheck: withCaptchaCheck,
          );

    // scale image only if it's not an animation, scaling is allowed, not on desktop and item is not marked as noScale
    if (!widget.booruItem.mediaType.value.isAnimation &&
        !settingsHandler.disableImageScaling &&
        !SettingsHandler.isDesktopPlatform &&
        !widget.booruItem.isNoScale.value &&
        (widthLimit ?? 0) > 0) {
      // resizeimage if resolution is too high (in attempt to fix crashes if multiple very HQ images are loaded), only check by width, otherwise looooooong/thin images could look bad
      provider = ResizeImage(
        provider,
        width: widthLimit,
        policy: ResizeImagePolicy.fit,
        allowUpscaling: false,
      );
    }
    return provider;
  }

  void stopLoading({
    required ViewerStopReason reason,
    String? title,
    String? details,
  }) {
    disposables();

    total.value = 0;
    received.value = 0;

    startedAt.value = 0;

    isLoaded.value = false;
    isFromCache.value = false;
    isStopped.value = true;
    stopReason.value = reason;
    stopDetails.value = '${title != null ? '$title\n' : ''}${details ?? ''}';

    if (reason.isTooBig) {
      blockPreloadState = .tooBig;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewerHandler.setStopped(widget.key, true);
      viewerHandler.setLoaded(widget.key, false);
    });
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

    if (!(loadItemCancelToken?.isCancelled ?? true)) {
      loadItemCancelToken?.cancel();
    }
    loadItemCancelToken = null;

    tiledProviders = null;
    isTiled = false;
    isTilingProcessing.value = null;
    tiledSize = null;

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

  Future<void> onManualRestart() async {
    if (blockPreloadState.isTooBig) {
      blockPreloadState = .ignore;
    }

    isStopped.value = false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewerHandler.setStopped(widget.key, false);
    });

    startedAt.value = DateTime.now().millisecondsSinceEpoch;

    final bool shouldUpdate = switch (stopReason.value) {
      .error => true,
      _ => false,
    };
    bool shouldDoCaptchaCheck = false;
    if (shouldUpdate) {
      final updateRes = await tryToLoadAndUpdateItem(
        widget.booruItem,
        loadItemCancelToken,
      );

      shouldDoCaptchaCheck = updateRes != true;

      if (updateRes != true && widget.booru.baseURL?.isNotEmpty == true) {
        await DioNetwork.get(
          widget.booru.baseURL ?? '',
          headers: await Tools.getFileCustomHeaders(
            widget.booru,
            item: widget.booruItem,
            checkForReferer: true,
          ),
          customInterceptor: (dio) => DioNetwork.captchaInterceptor(
            dio,
            customUserAgent: Tools.appUserAgent,
          ),
        );
      }
    }

    await initViewer(
      true,
      withCaptchaCheck: shouldDoCaptchaCheck,
    );
  }

  Future<void> onManualStop() async {
    stopLoading(reason: .user);
  }

  Future<void> checkAndPrepareTiles() async {
    if (isTiled || isTilingProcessing.value == true) return;

    try {
      final String url = useFullImage ? widget.booruItem.fileURL : widget.booruItem.sampleURL;

      final String cachePath = await ImageWriter().getCachePathString(
        Uri.base.resolve(url).toString(),
        imageFolder,
        clearName: imageFolder != 'favicons',
        fileNameExtras: widget.booruItem.fileNameExtras,
      );

      final File file = File(cachePath);
      if (!await file.exists()) return;

      final buffer = await ImmutableBuffer.fromFilePath(cachePath);
      final descriptor = await ImageDescriptor.encoded(buffer);

      final size = Size(descriptor.width.toDouble(), descriptor.height.toDouble());

      final heightLimit = settingsHandler.preloadHeight;
      // block loading if image is too long
      if (heightLimit != 0 && descriptor.height >= heightLimit && !blockPreloadState.isIgnore) {
        stopLoading(
          reason: .tooBig,
          details:
              '${context.loc.media.loading.fileSize(size: '${size.width.toInt().toFormattedString()}x${size.height.toInt().toFormattedString()}')}\n'
              '${context.loc.media.loading.sizeLimit(limit: '...x${heightLimit.toFormattedString()}')}',
        );

        isTilingProcessing.value = false;

        descriptor.dispose();
        buffer.dispose();
        return;
      }

      // skip tiling if image height is absurd, will use default decoding instead (will be very low quality, but it's better than OOM crash)
      if (descriptor.height > kMaxPixelsHeight) {
        isTilingProcessing.value = false;

        descriptor.dispose();
        buffer.dispose();
        return;
      }

      if (descriptor.height >= kMaxTextureHeight) {
        await mainProvider.value?.evict();

        isTilingProcessing.value = true;

        // Try native region decoding on Android (uses BitmapRegionDecoder)
        List<Uint8List>? nativeSlices;
        if (!SettingsHandler.isDesktopPlatform) {
          nativeSlices = await ServiceHandler.sliceImage(cachePath, kMaxTextureHeight);
        }

        // Fallback: Dart isolate with JPEG encoding (desktop or if native fails)
        final List<Uint8List> slices =
            nativeSlices ??
            await compute(
          sliceImageOnIsolate,
          {
            'path': cachePath,
            'sliceHeight': kMaxTextureHeight,
          },
        );

        if (mounted) {
          // Adaptive tile width: cap total GPU texture memory at kMaxTileMemoryBudget
          // Each tile decoded as: tileWidth × kMaxTextureHeight × 4 bytes (RGBA)
          final int adaptiveWidth = kMaxTileMemoryBudget ~/ (kMaxTextureHeight * 4 * slices.length);
          final int tileWidth = adaptiveWidth.clamp(256, widthLimit ?? 4096);

          tiledProviders = slices.map((s) {
              return ResizeImage(
                    MemoryImage(s),
                  width: tileWidth,
                    policy: ResizeImagePolicy.fit,
                    allowUpscaling: false,
                  )
                  as ImageProvider;
          }).toList();
          final double maxWidth = min(size.width, tileWidth.toDouble());
          tiledSize = Size(maxWidth, maxWidth / size.aspectRatio);
          isTiled = true;
          isTilingProcessing.value = false;
        }
      } else {
        isTiled = false;
        isTilingProcessing.value = false;
      }
      descriptor.dispose();
      buffer.dispose();
    } catch (e, s) {
      Logger.Inst().log(
        e,
        'ImageViewer',
        'checkAndPrepareTiles',
        LogTypes.exception,
        s: s,
      );
      isTilingProcessing.value = false;
    }
  }

  static Future<List<Uint8List>> sliceImageOnIsolate(Map<String, dynamic> params) async {
    final String path = params['path'];
    final int sliceHeight = params['sliceHeight'];

    final File file = File(path);
    final bytes = await file.readAsBytes();

    final img.Image? original = img.decodeImage(bytes);
    if (original == null) throw Exception('Failed to decode image for slicing');

    final List<Uint8List> chunks = [];
    int y = 0;

    while (y < original.height) {
      final int remaining = original.height - y;
      final int currentHeight = remaining < sliceHeight ? remaining : sliceHeight;

      final img.Image slice = img.copyCrop(original, x: 0, y: y, width: original.width, height: currentHeight);

      chunks.add(Uint8List.fromList(img.encodeJpg(slice, quality: 90)));
      y += currentHeight;
    }

    return chunks;
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
          ListenableBuilder(
            listenable: Listenable.merge([isTilingProcessing, isLoaded, isViewed]),
            builder: (context, child) {
              return AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: (isLoaded.value && isProviderLoaded) ? 0 : 1,
                child: Hero(
                  tag: 'imageHero${isViewed.value ? '' : '-ignore-'}${widget.booruItem.hashCode}',
                  child: child!,
                ),
              );
            },
            child: Thumbnail(
              item: widget.booruItem,
              booru: widget.booru,
              isStandalone: false,
              useHero: false,
            ),
          ),
          //
          ValueListenableBuilder(
            valueListenable: showLoading,
            builder: (context, showLoadingVal, child) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: showLoadingVal ? child : const SizedBox.shrink(),
              );
            },
            child: ListenableBuilder(
              listenable: Listenable.merge([
                isTilingProcessing,
                isLoaded,
                isViewed,
                isStopped,
                isFromCache,
                stopReason,
                stopDetails,
              ]),
              builder: (context, _) {
                return MediaLoading(
                  item: widget.booruItem,
                  hasProgress: true,
                  isFromCache: isFromCache.value,
                  isDone: isLoaded.value && isProviderLoaded,
                  isTooBig: blockPreloadState.isTooBig,
                  isStopped: isStopped.value,
                  stopReason: stopReason.value,
                  stopDetails: stopDetails.value,
                  isViewed: isViewed.value,
                  total: total,
                  received: received,
                  startedAt: startedAt,
                  onRestart: onManualRestart,
                  onStop: onManualStop,
                );
              },
            ),
          ),
          //
          Listener(
            onPointerSignal: (pointerSignal) {
              if (!isProviderLoaded || !SettingsHandler.isDesktopPlatform) {
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
              child: ListenableBuilder(
                listenable: Listenable.merge([isLoaded, isTilingProcessing, mainProvider]),
                builder: (context, _) {
                  return AnimatedOpacity(
                    opacity: (settingsHandler.shitDevice || isLoaded.value) ? 1 : 0,
                    duration: Duration(
                      milliseconds: (settingsHandler.appMode.value.isDesktop || isViewed.value) ? 50 : 300,
                    ),
                    child: AnimatedSwitcher(
                      duration: Duration(
                        milliseconds: (settingsHandler.appMode.value.isDesktop || isViewed.value) ? 50 : 300,
                      ),
                      child: !isProviderLoaded
                          ? const SizedBox.shrink()
                          : ((isTiled && tiledProviders != null)
                                ? PhotoView.customChild(
                                    childSize: tiledSize,
                                    backgroundDecoration: const BoxDecoration(color: Colors.transparent),
                                    customSize: MediaQuery.sizeOf(context),
                                    minScale: PhotoViewComputedScale.contained,
                                    maxScale: PhotoViewComputedScale.covered * 8,
                                    initialScale: PhotoViewComputedScale.contained,
                                    enableRotation: settingsHandler.allowRotation,
                                    basePosition: Alignment.center,
                                    controller: viewController,
                                    scaleStateController: scaleController,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: tiledProviders!
                                          .map(
                                            (provider) => Image(
                                              image: provider,
                                              gaplessPlayback: true,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  )
                                : PhotoView(
                                    imageProvider: mainProvider.value,
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
                                    filterQuality: FilterQuality.medium,
                                    minScale: PhotoViewComputedScale.contained,
                                    maxScale: PhotoViewComputedScale.covered * 8,
                                    initialScale: PhotoViewComputedScale.contained,
                                    enableRotation: settingsHandler.allowRotation,
                                    basePosition: Alignment.center,
                                    controller: viewController,
                                    scaleStateController: scaleController,
                                  )),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
