import 'dart:async';
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/navigation_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/media_loading.dart';
import 'package:lolisnatcher/src/widgets/image/custom_network_image.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail.dart';

class ImageViewer extends StatefulWidget {
  const ImageViewer(
    this.booruItem,
    this.index, {
    super.key,
  });

  final BooruItem booruItem;
  final int index;

  @override
  State<ImageViewer> createState() => ImageViewerState();
}

class ImageViewerState extends State<ImageViewer> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;
  final ViewerHandler viewerHandler = ViewerHandler.instance;

  PhotoViewScaleStateController scaleController = PhotoViewScaleStateController();
  PhotoViewController viewController = PhotoViewController();

  final RxInt total = 0.obs, received = 0.obs, startedAt = 0.obs;
  bool isStopped = false, isFromCache = false, isLoaded = false, isViewed = false, isZoomed = false;
  int isTooBig = 0; // 0 = not too big, 1 = too big, 2 = too big, but allow downloading
  List<String> stopReason = [];

  ImageProvider? mainProvider;
  ImageStreamListener? imageListener;
  ImageStream? imageStream;
  String imageFolder = 'media';
  int? widthLimit;
  CancelToken? cancelToken;

  StreamSubscription? noScaleListener, indexListener;

  @override
  void didUpdateWidget(ImageViewer oldWidget) {
    // force redraw on item data change
    if (oldWidget.booruItem != widget.booruItem) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        killLoading([]);
        initViewer(false);
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  void onSize(int? size) {
    // TODO find a way to stop loading based on size when caching is enabled
    const int maxSize = 1024 * 1024 * 200;
    if (size == null) {
      return;
    } else if (size == 0) {
      killLoading(['File is zero bytes']);
    } else if ((size > maxSize) && isTooBig != 2) {
      // TODO add check if resolution is too big
      isTooBig = 1;
      killLoading(['File is too big', 'File size: ${Tools.formatBytes(size, 2)}', 'Limit: ${Tools.formatBytes(maxSize, 2)}']);
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
    if (error is DioError && CancelToken.isCancel(error)) {
      //
    } else {
      if (error is DioError) {
        killLoading(['Loading Error: ${error.message}']);
      } else {
        killLoading(['Loading Error: $error']);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    viewerHandler.addViewed(widget.key);

    isViewed = settingsHandler.appMode.value.isMobile
        ? searchHandler.viewedIndex.value == widget.index
        : searchHandler.viewedItem.value.fileURL == widget.booruItem.fileURL;
    indexListener = searchHandler.viewedIndex.listen((int value) {
      final bool prevViewed = isViewed;
      final bool isCurrentIndex = value == widget.index;
      final bool isCurrentItem = searchHandler.viewedItem.value.fileURL == widget.booruItem.fileURL;
      if (settingsHandler.appMode.value.isMobile ? isCurrentIndex : isCurrentItem) {
        isViewed = true;
      } else {
        isViewed = false;
      }

      if (prevViewed != isViewed) {
        if (!isViewed) {
          // reset zoom if not viewed
          resetZoom();
        }
        updateState();
      }
    });

    // debug output
    viewController.outputStateStream.listen(onViewStateChanged);
    scaleController.outputScaleStateStream.listen(onScaleStateChanged);

    initViewer(false);
  }

  void initViewer(bool ignoreTagsCheck) async {
    if ((settingsHandler.galleryMode == "Sample" && widget.booruItem.sampleURL.isNotEmpty && widget.booruItem.sampleURL != widget.booruItem.thumbnailURL) ||
        widget.booruItem.sampleURL == widget.booruItem.fileURL) {
      // use sample file if (sample gallery quality && sampleUrl exists && sampleUrl is not the same as thumbnailUrl) OR sampleUrl is the same as full res fileUrl
      imageFolder = 'samples';
    } else {
      imageFolder = 'media';
    }

    noScaleListener = widget.booruItem.isNoScale.listen((bool value) {
      killLoading([]);
      initViewer(false);
    });

    if (widget.booruItem.isHated.value && !ignoreTagsCheck) {
      List<List<String>> hatedAndLovedTags = settingsHandler.parseTagsList(widget.booruItem.tagsList, isCapped: true);
      if (hatedAndLovedTags[0].isNotEmpty) {
        killLoading(['Contains Hated tags:', ...hatedAndLovedTags[0]]);
        return;
      }
    }

    isStopped = false;

    startedAt.value = DateTime.now().millisecondsSinceEpoch;

    final MediaQueryData mQuery = NavigationHandler.instance.navigatorKey.currentContext!.mediaQuery;
    widthLimit = settingsHandler.disableImageScaling ? null : (mQuery.size.width * mQuery.devicePixelRatio * 2).round();

    mainProvider ??= await getImageProvider();

    imageStream?.removeListener(imageListener!);
    imageStream = mainProvider!.resolve(const ImageConfiguration());
    imageListener = ImageStreamListener(
      (imageInfo, syncCall) {
        isLoaded = true;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          viewerHandler.setLoaded(widget.key, true);
        });
        if (!syncCall) {
          updateState();
        }
      },
      onChunk: (event) {
        onBytesAdded(event.cumulativeBytesLoaded, event.expectedTotalBytes);
      },
      onError: (e, stack) => onError(e),
    );
    imageStream!.addListener(imageListener!);

    updateState();
  }

  Future<ImageProvider> getImageProvider() async {
    ImageProvider provider;
    cancelToken = CancelToken();
    provider = CustomNetworkImage(
      (settingsHandler.galleryMode == "Sample")
        ? widget.booruItem.sampleURL
        : widget.booruItem.fileURL,
      cancelToken: cancelToken,
      headers: await Tools.getFileCustomHeaders(
        searchHandler.currentBooru,
        checkForReferer: true,
      ),
      withCache: settingsHandler.mediaCache,
      cacheFolder: imageFolder,
      fileNameExtras: widget.booruItem.fileNameExtras,
      onError: onError,
      onCacheDetected: (bool didDetectCache) {
        if (didDetectCache) {
          isFromCache = true;
          updateState();
        }
      },
    );

    // scale image only if it's not an animation, scaling is allowed and item is not marked as noScale
    if (!widget.booruItem.isAnimation && !settingsHandler.disableImageScaling && !widget.booruItem.isNoScale.value && (widthLimit ?? 0) > 0) {
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

    isLoaded = false;
    isFromCache = false;
    isStopped = true;
    stopReason = reason;

    viewerHandler.setLoaded(widget.key, false);

    resetZoom();

    updateState();
  }

  @override
  void dispose() {
    disposables();

    indexListener?.cancel();
    indexListener = null;

    viewerHandler.removeViewed(widget.key);
    super.dispose();
  }

  void updateState() {
    if (mounted) setState(() {});
  }

  void disposables() {
    imageStream?.removeListener(imageListener!);
    imageStream = null;
    imageListener = null;

    if (!(cancelToken?.isCancelled ?? true)) {
      cancelToken?.cancel();
    }
    cancelToken = null;

    // evict image from memory cache it it's media type or it's an animation and gifsAsThumbnails is disabled
    if (imageFolder == 'media' || (!widget.booruItem.isAnimation || !settingsHandler.gifsAsThumbnails)) {
      mainProvider?.evict();
      // mainProvider?.evict().then((bool success) {
      //   if(success) {
      //     print('main image evicted');
      //   } else {
      //     print('main image eviction failed');
      //   }
      // });
    }
    mainProvider = null;

    noScaleListener?.cancel();
    noScaleListener = null;
  }

  // debug functions
  void onScaleStateChanged(PhotoViewScaleState scaleState) {
    // print(scaleState);

    // manual zoom || double tap || double tap AFTER double tap
    isZoomed = scaleState == PhotoViewScaleState.zoomedIn || scaleState == PhotoViewScaleState.covering || scaleState == PhotoViewScaleState.originalSize;
    viewerHandler.setZoomed(widget.key, isZoomed);
  }

  void onViewStateChanged(PhotoViewControllerValue viewState) {
    // print(viewState);
    viewerHandler.setViewState(widget.key, viewState);
  }

  void resetZoom() {
    // Don't zoom until image is loaded
    if (!isLoaded) return;
    scaleController.scaleState = PhotoViewScaleState.initial;
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
    if (!isLoaded) return;
    scaleController.scaleState = PhotoViewScaleState.covering;
  }

  @override
  Widget build(BuildContext context) {
    // print('!!! Build media ${widget.index} $isViewed !!!');

    return Hero(
      tag: 'imageHero${isViewed ? '' : '-ignore-'}${widget.index}#${widget.booruItem.fileURL}',
      // without this every text element will have broken styles on first frames
      child: Material(
        color: Colors.black,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // TODO find a way to detect when main image is fully rendered to dispose this widget to free up memory
            Thumbnail(
              item: widget.booruItem,
              index: widget.index,
              isStandalone: false,
              ignoreColumnsCount: true,
            ),
            //
            MediaLoading(
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
            ),
            //
            AnimatedSwitcher(
              duration: Duration(milliseconds: settingsHandler.appMode.value.isDesktop ? 50 : 300),
              child: mainProvider != null
                  ? Listener(
                      onPointerSignal: (pointerSignal) {
                        if (pointerSignal is PointerScrollEvent) {
                          scrollZoomImage(pointerSignal.scrollDelta.dy);
                        }
                      },
                      child: AnimatedOpacity(
                        opacity: isLoaded ? 1 : 0,
                        duration: Duration(milliseconds: settingsHandler.appMode.value.isDesktop ? 50 : 300),
                        child: PhotoView(
                          imageProvider: mainProvider,
                          gaplessPlayback: true,
                          loadingBuilder: (context, event) {
                            return const SizedBox.shrink();
                          },
                          errorBuilder: (context, error, stackTrace) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              onError(error);
                            });
                            return const SizedBox.shrink();
                          },
                          // TODO FilterQuality.high somehow leads to a worse looking image on desktop
                          filterQuality: widget.booruItem.isLong ? FilterQuality.medium : FilterQuality.medium,
                          minScale: PhotoViewComputedScale.contained,
                          maxScale: PhotoViewComputedScale.covered * 8,
                          initialScale: PhotoViewComputedScale.contained,
                          enableRotation: false,
                          basePosition: Alignment.center,
                          controller: viewController,
                          scaleStateController: scaleController,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
