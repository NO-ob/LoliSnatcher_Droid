import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/navigation_handler.dart';
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
    Key? key,
    required this.item,
    required this.index,
    required this.isStandalone,
    this.ignoreColumnsCount = false,
  }) : super(key: key);

  final BooruItem item;
  final int index;

  /// set to true when used in gallery preview to enable hero animation
  final bool isStandalone;
  final bool ignoreColumnsCount;

  @override
  State<Thumbnail> createState() => _ThumbnailState();
}

class _ThumbnailState extends State<Thumbnail> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;

  final RxInt total = 0.obs, received = 0.obs, startedAt = 0.obs;
  int restartedCount = 0;
  bool? isFromCache;
  // isFailed - loading error, isVisible - controls fade in
  bool isFailed = false, isLoaded = false, isLoadedExtra = false, failedRendering = false;
  String? errorCode;
  CancelToken? cancelToken;

  bool? isThumbQuality;
  late String thumbURL;
  late String thumbFolder;

  ImageProvider? mainProvider;
  ImageProvider? extraProvider;
  ImageStreamListener? mainImageListener, extraImageListener;
  ImageStream? mainImageStream, extraImageStream;

  StreamSubscription? hateListener;

  @override
  void didUpdateWidget(Thumbnail oldWidget) {
    // force redraw on tab change
    if (oldWidget.item != widget.item) {
      restartLoading();
    }
    super.didUpdateWidget(oldWidget);
  }

  int columnsCount() {
    if (widget.ignoreColumnsCount) {
      return 1;
    }

    return settingsHandler.currentColumnCount(context);
  }

  Future<ImageProvider> getImageProvider(bool isMain) async {
    // if(widget.item.isHated.value) {
    //   // pixelate hated images
    //   // flutter 3.3 broke image pixelazation from very small width memoryimage
    //   return ResizeImage(MemoryImageTest(bytes, imageUrl: url), width: 10);
    // }

    cancelToken ??= CancelToken();
    ImageProvider provider = CustomNetworkImage(
      isMain ? thumbURL : widget.item.thumbnailURL,
      cancelToken: cancelToken,
      headers: await Tools.getFileCustomHeaders(searchHandler.currentBooru, checkForReferer: true),
      withCache: settingsHandler.thumbnailCache,
      cacheFolder: isMain ? thumbFolder : 'thumbnails',
      fileNameExtras: widget.item.fileNameExtras,
      sendTimeout: widget.isStandalone ? 20000 : null,
      receiveTimeout: widget.isStandalone ? 20000 : null,
      onError: isMain ? onError : null,
      onCacheDetected: (bool didDetectCache) {
        if (isMain) {
          isFromCache = didDetectCache;
          updateState();
        }
      },
    );

    double? thumbWidth;
    double? thumbHeight;
    if (mounted) {
      // mediaquery will throw an exception if we try to read it after disposing => check if mounted
      final MediaQueryData mQuery = NavigationHandler.instance.navigatorKey.currentContext!.mediaQuery;
      final double widthLimit = (mQuery.size.width / columnsCount()) * mQuery.devicePixelRatio * 1;
      double thumbRatio = 1;
      bool hasSizeData = widget.item.fileHeight != null && widget.item.fileWidth != null;

      if (widget.isStandalone) {
        thumbWidth = widthLimit;
      } else {
        switch (settingsHandler.previewDisplay) {
          case 'Rectangle':
          case 'Staggered':
            // thumbRatio = 16 / 9;
            if (hasSizeData) {
              // if api gives size data
              thumbRatio = widget.item.fileAspectRatio!;
              if (thumbRatio < 1) {
                // vertical image - resize to width
                thumbWidth = widthLimit;
              } else {
                // horizontal image - resize to height
                thumbHeight = widthLimit * thumbRatio;
              }
            } else {
              thumbWidth = widthLimit;
            }
            break;

          case 'Square':
          default:
            // otherwise resize to widthLimit
            thumbWidth = widthLimit;
            break;
        }
      }
    }

    // debugPrint('ThumbWidth: $thumbWidth');

    // return empty image if no size rectrictions were calculated (propably happens because widget is not mounted)
    if (settingsHandler.disableImageScaling || (thumbWidth == null && thumbHeight == null)) {
      return provider;
    }

    return ResizeImage(
      provider,
      width: thumbWidth?.round(),
      height: thumbWidth == null ? thumbHeight?.round() : null,
      allowUpscaling: false,
    );
  }

  void onBytesAdded(int receivedNew, int? totalNew) {
    received.value = receivedNew;
    total.value = totalNew ?? 0;
  }

  void onError(Object error, {bool delayed = false}) {
    /// Error handling
    if (error is DioError && CancelToken.isCancel(error)) {
      // print('Canceled by user: $error');
    } else {
      if (restartedCount < 5) {
        // attempt to reload 5 times with a second delay
        Debounce.debounce(
          tag: 'thumbnail_reload_${searchHandler.currentTab.id.toString()}#${widget.index.toString()}',
          callback: () {
            restartLoading();
            restartedCount++;
          },
          duration: const Duration(seconds: 1),
        );
      } else {
        //show error
        isFailed = true;
        if (error is DioError) {
          errorCode = error.response?.statusCode?.toString();
        } else {
          errorCode = null;
        }
        if (delayed) {
          // onError can happen while widget restates, which will cause an exception, this will delay the restate until the other one is done
          WidgetsBinding.instance.addPostFrameCallback((_) {
            updateState();
          });
        } else {
          updateState();
        }
        // this.mounted prevents exceptions when using staggered view
      }
      // print('Dio request cancelled: $thumbURL $error');
    }
  }

  @override
  void initState() {
    super.initState();
    selectThumbProvider();
  }

  void selectThumbProvider() {
    startedAt.value = DateTime.now().millisecondsSinceEpoch;

    // if scaling is disabled - allow gifs as thumbnails, but only if they are not hated (resize image doesnt work with gifs)
    final bool isGifSampleNotAllowed =
        widget.item.isAnimation && ((settingsHandler.disableImageScaling && settingsHandler.gifsAsThumbnails) ? widget.item.isHated.value : true);

    isThumbQuality = settingsHandler.previewMode == "Thumbnail" ||
        (isGifSampleNotAllowed || widget.item.mediaType == 'video') ||
        (!widget.isStandalone && widget.item.fileURL == widget.item.sampleURL);
    thumbURL = isThumbQuality == true ? widget.item.thumbnailURL : widget.item.sampleURL;
    thumbFolder = isThumbQuality == true ? 'thumbnails' : 'samples';

    // restart loading if item was marked as hated
    hateListener = widget.item.isHated.listen((bool value) {
      if (value == true) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          restartLoading();
        });
      }
    });

    // delay loading a little to improve performance when scrolling fast, ignore delay if it's a standalone widget (i.e. not in a list)
    Debounce.debounce(
      tag: 'thumbnail_start_${searchHandler.currentTab.id.toString()}#${widget.index.toString()}',
      callback: () {
        startDownloading();
      },
      duration: Duration(milliseconds: widget.isStandalone ? 200 : 0),
    );
    return;
  }

  void startDownloading() async {
    final bool useExtra = isThumbQuality == false && !widget.item.isHated.value;

    mainProvider = await getImageProvider(true);
    mainImageStream?.removeListener(mainImageListener!);
    mainImageStream = mainProvider!.resolve(const ImageConfiguration());
    mainImageListener = ImageStreamListener(
      (imageInfo, syncCall) {
        isLoaded = true;
        if (!syncCall) {
          updateState();
        }
      },
      onChunk: (event) {
        onBytesAdded(event.cumulativeBytesLoaded, event.expectedTotalBytes);
      },
      onError: (e, stack) {
        if (e is! DioError) {
          failedRendering = true;
        }
        Logger.Inst().log('Error loading thumbnail: ${widget.item.sampleURL} ${widget.item.thumbnailURL}', 'Thumbnail', 'build', LogTypes.imageLoadingError);
        onError(e, delayed: true);
      },
    );
    mainImageStream!.addListener(mainImageListener!);

    if (useExtra) {
      extraProvider = await getImageProvider(false);
      extraImageStream?.removeListener(extraImageListener!);
      extraImageStream = extraProvider!.resolve(const ImageConfiguration());
      extraImageListener = ImageStreamListener(
        (imageInfo, syncCall) {
          isLoadedExtra = true;
          if (!syncCall) {
            updateState();
          }
        },
        onError: (e, stack) {
          if (e is! DioError) {
            failedRendering = true;
          }
          Logger.Inst().log('Error loading extra thumbnail: ${widget.item.thumbnailURL}', 'Thumbnail', 'build', LogTypes.imageLoadingError);
        },
      );
      extraImageStream!.addListener(extraImageListener!);
    }

    updateState();
  }

  void restartLoading() {
    if (failedRendering) {
      failedRendering = false;
      cleanProviderCache();
    }

    disposables();

    total.value = 0;
    received.value = 0;
    startedAt.value = 0;

    isLoaded = false;
    isLoadedExtra = false;
    isFromCache = null;
    isFailed = false;
    errorCode = null;

    hateListener?.cancel();

    updateState();

    selectThumbProvider();
  }

  void cleanProviderCache() async {
    if (mainProvider != null) {
      final CustomNetworkImage usedMainProvider =
          (mainProvider is ResizeImage ? (mainProvider as ResizeImage).imageProvider : mainProvider) as CustomNetworkImage;
      await usedMainProvider.deleteCacheFile();
    }
    if (extraProvider != null) {
      final CustomNetworkImage usedExtraProvider =
          (extraProvider is ResizeImage ? (extraProvider as ResizeImage).imageProvider : extraProvider) as CustomNetworkImage;
      await usedExtraProvider.deleteCacheFile();
    }
  }

  void updateState() {
    if (mounted) setState(() {});
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

    if (!(cancelToken?.isCancelled ?? true)) {
      cancelToken?.cancel();
    }
    cancelToken = null;

    // evict from memory cache only when in grid
    if (widget.isStandalone) {
      mainProvider?.evict();
      mainProvider = null;
      extraProvider?.evict();
      extraProvider = null;
    }

    Debounce.cancel('thumbnail_start_${searchHandler.currentTab.id.toString()}#${widget.index.toString()}');
    Debounce.cancel('thumbnail_reload_${searchHandler.currentTab.id.toString()}#${widget.index.toString()}');
  }

  Widget renderImages(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double iconSize = (screenWidth / columnsCount()) * 0.75;

    final bool showShimmer = !(isLoaded || isLoadedExtra) && !isFailed;
    final bool useExtra = isThumbQuality == false && !widget.item.isHated.value;

    return Stack(
      alignment: Alignment.center,
      children: [
        if (useExtra) // fetch small low quality thumbnail while loading a sample
          AnimatedSwitcher(
            // fade in image
            duration: Duration(milliseconds: widget.isStandalone ? 200 : 0),
            child: extraProvider != null
                ? ImageFiltered(
                    enabled: widget.item.isHated.value,
                    imageFilter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                      tileMode: TileMode.decal,
                    ),
                    child: Image(
                      image: extraProvider!,
                      fit: widget.isStandalone ? BoxFit.cover : BoxFit.contain,
                      isAntiAlias: true,
                      width: double.infinity,
                      height: double.infinity,
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        if (widget.isStandalone) {
                          return Icon(Icons.broken_image, size: 30, color: Colors.yellow.withOpacity(0.5));
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  )
                : const SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                  ),
          ),
        AnimatedSwitcher(
          // fade in image
          duration: Duration(milliseconds: widget.isStandalone ? 300 : 0),
          child: mainProvider != null
              ? ImageFiltered(
                  enabled: widget.item.isHated.value,
                  imageFilter: ImageFilter.blur(
                    sigmaX: 10,
                    sigmaY: 10,
                    tileMode: TileMode.decal,
                  ),
                  child: Image(
                    image: mainProvider!,
                    fit: widget.isStandalone ? BoxFit.cover : BoxFit.contain,
                    isAntiAlias: true,
                    filterQuality: FilterQuality.medium,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      if (widget.isStandalone) {
                        return Icon(Icons.broken_image, size: 30, color: Colors.white.withOpacity(0.5));
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                )
              : const SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: (isLoaded || isLoadedExtra)
              ? const SizedBox.shrink()
              : ShimmerCard(
                  isLoading: showShimmer,
                  child: showShimmer ? null : Container(),
                ),
        ),
        if (widget.isStandalone)
          ThumbnailLoading(
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
          ),
        if (widget.item.isHated.value)
          Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(iconSize * 0.1),
              ),
              width: iconSize,
              height: iconSize,
              child: const Icon(CupertinoIcons.eye_slash, color: Colors.white)),
        if (settingsHandler.showURLOnThumb)
          Container(
            color: Colors.black,
            child: Text(thumbURL),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isStandalone) {
      return Hero(
        tag: 'imageHero${widget.index}',
        placeholderBuilder: (BuildContext context, Size heroSize, Widget child) {
          // keep building the image since the images can be visible in the
          // background of the image gallery
          return Thumbnail(
            item: widget.item,
            index: widget.index,
            isStandalone: false,
          );
        },
        child: renderImages(context),
      );
    } else {
      // print('building thumb ${widget.index}');
      return Container(color: Colors.black, child: renderImages(context));
    }
  }
}
