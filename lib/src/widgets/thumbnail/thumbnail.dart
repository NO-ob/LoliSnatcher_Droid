import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/boorus/idol_sankaku_handler.dart';
import 'package:lolisnatcher/src/boorus/sankaku_handler.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler_factory.dart';
import 'package:lolisnatcher/src/handlers/database_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/debouncer.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
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
  CancelToken? mainCancelToken, extraCancelToken, loadItemCancelToken;

  late String currentUrl;

  Timer? debounceLoading;

  bool? isThumbQuality;
  late String thumbURL;
  late String thumbFolder;
  double? thumbWidth, thumbHeight;

  final ValueNotifier<ImageProvider?> mainProvider = ValueNotifier(null), extraProvider = ValueNotifier(null);
  ImageStreamListener? mainImageListener, extraImageListener;
  ImageStream? mainImageStream, extraImageStream;

  bool isBlurred = true;

  @override
  void initState() {
    super.initState();

    currentUrl = widget.item.thumbnailURL;
  }

  @override
  void didUpdateWidget(Thumbnail oldWidget) {
    // force redraw on tab change
    if (oldWidget.item != widget.item) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await restartLoading();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<ImageProvider> getImageProvider(
    bool isMain, {
    bool withCaptchaCheck = false,
  }) async {
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
            withCaptchaCheck: withCaptchaCheck,
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
            withCaptchaCheck: withCaptchaCheck,
          );

    // on desktop devicePixelRatio is not working?
    final bool shouldResize = (thumbWidth != null || thumbHeight != null) && !SettingsHandler.isDesktopPlatform;
    final bool shouldPixelate = widget.item.isHidden && settingsHandler.shitDevice;

    if (shouldResize || shouldPixelate) {
      return ResizeImage(
        provider,
        // when in low performance mode - resize hidden images to 10px to simulate blur effect
        width: shouldPixelate ? 10 : thumbWidth?.round(),
        height: shouldPixelate ? 10 : thumbHeight?.round(),
        policy: ResizeImagePolicy.fit,
        allowUpscaling: false,
      );
    }

    return provider;
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
      case .rectangle:
        thumbRatio = 16 / 9;
        thumbWidth = widthLimit;
        thumbHeight = widthLimit * thumbRatio;
        break;

      case .staggered:
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

      case .square:
        thumbWidth = widthLimit;
        thumbHeight = widthLimit;
        break;
    }
  }

  void onBytesAdded(int receivedNew, int? totalNew) {
    received.value = receivedNew;
    total.value = totalNew ?? 0;
  }

  void onError(Object error) {
    if (error is DioException && CancelToken.isCancel(error)) {
      //
    } else {
      final int retryLimit = (kDebugMode || settingsHandler.shitDevice) ? 4 : 8;

      if (restartedCount < retryLimit) {
        // attempt to reload N times with a 1s delay
        Debounce.debounce(
          tag: 'thumbnail_reload_${widget.item.hashCode}',
          callback: () async {
            await restartLoading();
            restartedCount++;
          },
          duration: Duration(milliseconds: settingsHandler.shitDevice ? 1000 : 500),
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

  void selectThumbProvider({
    bool withCaptchaCheck = false,
  }) {
    startedAt.value = DateTime.now().millisecondsSinceEpoch;

    // if scaling is disabled - allow gifs as thumbnails, but only if they are not hidden (resize image doesnt work with gifs)
    final bool isSampleGif = widget.item.sampleURL.contains('.gif');
    final bool isGifSampleNotAllowed =
        widget.item.mediaType.value.isAnimation &&
        ((settingsHandler.disableImageScaling && settingsHandler.gifsAsThumbnails) ? widget.item.isHidden : true);

    isThumbQuality =
        settingsHandler.previewMode.isThumbnail ||
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
      () => startDownloading(withCaptchaCheck: withCaptchaCheck),
    );
    return;
  }

  Future<void> startDownloading({
    bool withCaptchaCheck = false,
  }) async {
    final bool useExtra = isThumbQuality == false && !widget.item.isHidden && !settingsHandler.shitDevice;

    mainProvider.value = await getImageProvider(
      true,
      withCaptchaCheck: withCaptchaCheck,
    );
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
        onError(e);
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

  Future<void> restartLoading({bool withItemLoad = false}) async {
    if (failedRendering.value) {
      failedRendering.value = false;
      unawaited(cleanProviderCache());
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

    bool? updateRes;
    if (withItemLoad) {
      updateRes = await tryToLoadAndUpdateItem(
        widget.item,
        loadItemCancelToken,
      );
    }

    selectThumbProvider(
      withCaptchaCheck: withItemLoad && updateRes != true,
    );
  }

  Future<void> cleanProviderCache() async {
    for (final provider in [
      if (mainProvider.value != null && mainProvider.value is ResizeImage)
        (mainProvider.value! as ResizeImage).imageProvider
      else
        mainProvider.value,
      //
      if (extraProvider.value != null && extraProvider.value is ResizeImage)
        (extraProvider.value! as ResizeImage).imageProvider
      else
        extraProvider.value,
    ]) {
      if (provider == null) {
        continue;
      }

      switch (provider) {
        case CustomNetworkImage _:
          await provider.deleteCacheFile();
          break;
        case CustomNetworkAvifImage _:
          await provider.deleteCacheFile();
          break;
      }
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

    if (!(loadItemCancelToken?.isCancelled ?? true)) {
      loadItemCancelToken?.cancel();
    }
    loadItemCancelToken = null;

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

          if (currentUrl != widget.item.thumbnailURL) {
            currentUrl = widget.item.thumbnailURL;
            restartLoading();
          }
        });

        // take smallest dimension for hidden icon container
        final double iconSize =
            (constraints.maxHeight < constraints.maxWidth ? constraints.maxHeight : constraints.maxWidth) * 0.75;

        final bool useExtra = isThumbQuality == false && !widget.item.isHidden && !settingsHandler.shitDevice;

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
                child: ImageFiltered(
                  enabled: settingsHandler.blurImages || widget.item.isHidden,
                  imageFilter: ImageFilter.blur(
                    sigmaX: (settingsHandler.blurImages && !widget.isStandalone) ? 30 : 10,
                    sigmaY: (settingsHandler.blurImages && !widget.isStandalone) ? 30 : 10,
                    tileMode: TileMode.decal,
                  ),
                  child: ValueListenableBuilder(
                    valueListenable: extraProvider,
                    builder: (context, extraProvider, _) {
                      Widget child = const SizedBox.shrink();

                      if (extraProvider != null) {
                        child = Image(
                          image: extraProvider,
                          fit: widget.isStandalone ? BoxFit.cover : BoxFit.contain,
                          isAntiAlias: true,
                          filterQuality: FilterQuality.medium,
                          width: double.infinity,
                          height: double.infinity,
                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                            if (widget.isStandalone) {
                              return Icon(
                                Icons.broken_image,
                                size: 30,
                                color: Colors.yellow.withValues(alpha: 0.5),
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        );
                      }

                      return AnimatedSwitcher(
                        duration: Duration(milliseconds: widget.isStandalone ? 100 : 0),
                        child: child,
                      );
                    },
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
              child: GestureDetector(
                // TODO reenable after filters rework (when blur/hide will be separate for each filter)
                // ignore: dead_code
                onTap: false && (widget.item.isHidden && !settingsHandler.shitDevice && widget.isStandalone)
                    // ignore: dead_code
                    ? () => setState(() => isBlurred = !isBlurred)
                    : null,
                child: ImageFiltered(
                  enabled:
                      isBlurred &&
                      (settingsHandler.blurImages || (widget.item.isHidden && !settingsHandler.shitDevice)),
                  imageFilter: ImageFilter.blur(
                    sigmaX: (settingsHandler.blurImages && !widget.isStandalone) ? 30 : 10,
                    sigmaY: (settingsHandler.blurImages && !widget.isStandalone) ? 30 : 10,
                    tileMode: TileMode.decal,
                  ),
                  child: ValueListenableBuilder(
                    valueListenable: mainProvider,
                    builder: (context, mainProvider, _) {
                      Widget child = const SizedBox.shrink();

                      if (mainProvider != null) {
                        child = Image(
                          image: mainProvider,
                          fit: widget.isStandalone ? BoxFit.cover : BoxFit.contain,
                          isAntiAlias: true,
                          filterQuality: FilterQuality.medium,
                          width: double.infinity,
                          height: double.infinity,
                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                            if (widget.isStandalone) {
                              return Icon(
                                Icons.broken_image,
                                size: 30,
                                color: Colors.white.withValues(alpha: 0.5),
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        );
                      }

                      return AnimatedSwitcher(
                        duration: Duration(milliseconds: widget.isStandalone ? 200 : 0),
                        child: child,
                      );
                    },
                  ),
                ),
              ),
            ),
            //
            if (widget.isStandalone && !settingsHandler.shitDevice)
              ListenableBuilder(
                listenable: Listenable.merge([isLoaded, isLoadedExtra, isFailed]),
                builder: (context, _) {
                  final bool isAnyLoaded = isLoaded.value || isLoadedExtra.value;
                  final bool showShimmer = !isAnyLoaded && !isFailed.value;

                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: showShimmer ? const ShimmerCard() : const SizedBox.shrink(),
                  );
                },
              ),
            //
            if (widget.isStandalone && widget.item.isHidden)
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
            if (widget.isStandalone)
              ValueListenableBuilder(
                valueListenable: isLoaded,
                builder: (context, isLoadedVal, child) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: isLoadedVal ? const SizedBox.shrink() : child,
                  );
                },
                child: ListenableBuilder(
                  listenable: Listenable.merge([isLoaded, isFromCache, isFailed, errorCode]),
                  builder: (context, child) {
                    final bool isFavOrDlsOrHasLoad =
                        widget.booru.type?.isFavouritesOrDownloads == true ||
                        BooruHandlerFactory().getBooruHandler([widget.booru], null).booruHandler.hasLoadItemSupport;

                    return ThumbnailLoading(
                      item: widget.item,
                      hasProgress: true,
                      isFromCache: isFromCache.value,
                      isDone: isLoaded.value && !isFailed.value,
                      isFailed: isFailed.value,
                      total: total,
                      received: received,
                      startedAt: startedAt,
                      retryText: isFavOrDlsOrHasLoad ? 'Tap to update or retry' : null,
                      retryIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 4,
                        children: isFavOrDlsOrHasLoad
                            ? const [
                                Icon(Icons.download),
                                Text('/', style: TextStyle(fontSize: 20)),
                                Icon(Icons.refresh),
                              ]
                            : const [
                                Icon(Icons.refresh),
                              ],
                      ),
                      restartAction: () async {
                        restartedCount = 0;

                        await restartLoading(withItemLoad: isFavOrDlsOrHasLoad);
                      },
                      errorCode: errorCode.value,
                    );
                  },
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

/// Returns true if successful, false on error and null on skip
Future<bool?> tryToLoadAndUpdateItem(
  BooruItem item,
  CancelToken? cancelToken,
) async {
  try {
    final itemFileHost = Uri.tryParse(item.fileURL)?.host;
    final itemPostHost = Uri.tryParse(item.postURL)?.host;
    final Booru? possibleBooru = SettingsHandler.instance.booruList.firstWhereOrNull((e) {
      final booruHost = Uri.tryParse(e.baseURL ?? '')?.host;

      return (itemPostHost?.isNotEmpty == true &&
              booruHost?.isNotEmpty == true &&
              (itemPostHost! == booruHost! ||
                  switch (e.type) {
                    BooruType.IdolSankaku => IdolSankakuHandler.knownUrls.contains(itemPostHost),
                    BooruType.Sankaku => SankakuHandler.knownPostUrls.contains(itemPostHost),
                    _ => false,
                  })) ||
          (itemFileHost?.isNotEmpty == true && booruHost?.isNotEmpty == true && itemFileHost! == booruHost!);
    });

    cancelToken?.cancel();
    cancelToken = CancelToken();
    if (possibleBooru != null) {
      final handler = BooruHandlerFactory().getBooruHandler([possibleBooru], null).booruHandler;
      if (handler.hasLoadItemSupport) {
        final result = await handler.loadItem(
          item: item,
          cancelToken: cancelToken,
          withCapcthaCheck: true,
        );

        if (!result.failed &&
            result.item != null &&
            (result.item?.isSnatched.value == true || result.item?.isFavourite.value == true)) {
          unawaited(
            SettingsHandler.instance.dbHandler.updateBooruItem(
              result.item!,
              BooruUpdateMode.urlUpdate,
            ),
          );
          return true;
        } else {
          return false;
        }
      }
    }
    return null;
  } catch (_) {}
  return null;
}
