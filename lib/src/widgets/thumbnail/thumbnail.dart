import 'dart:async';
import 'dart:typed_data';


import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/widgets/image/custom_image_provider.dart';
import 'package:lolisnatcher/src/services/dio_downloader.dart';
import 'package:lolisnatcher/src/widgets/common/thumbnail_loading.dart';
import 'package:lolisnatcher/src/utils/debouncer.dart';
import 'package:lolisnatcher/src/utils/tools.dart';


class Thumbnail extends StatefulWidget {
  final BooruItem booruItem;
  final int index;
  final int columnCount;
  final SearchTab searchGlobal;
  final bool isStandalone; // set to true when used in gallery preview to enable hero animation
  const Thumbnail(this.booruItem, this.index, this.searchGlobal, this.columnCount, this.isStandalone, {Key? key}) : super(key: key);

  @override
  State<Thumbnail> createState() => _ThumbnailState();
}

class _ThumbnailState extends State<Thumbnail> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  final RxInt _total = 0.obs, _received = 0.obs, _startedAt = 0.obs;
  int _restartedCount = 0;
  bool? isFromCache;
  // isFailed - loading error, isVisible - controls fade in
  bool isFailed = false, isForVideo = false;
  CancelToken _dioCancelToken = CancelToken();
  DioDownloader? client, extraClient;

  bool? isThumbQuality;
  late String thumbURL;
  late String thumbFolder;

  ImageProvider? mainProvider;
  ImageProvider? extraProvider;

  // required for scrollawareimageprovider
  DisposableBuildContext? disposableBuildContext;

  StreamSubscription? hateListener;

  @override
  void didUpdateWidget(Thumbnail oldWidget) {
    // force redraw on tab change
    if(oldWidget.booruItem != widget.booruItem) {
      restartLoading();
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<void> downloadThumb(bool isMain) async {
    _dioCancelToken = CancelToken();
    DioDownloader newClient = DioDownloader(
      isMain ? thumbURL : widget.booruItem.thumbnailURL,
      headers: Tools.getFileCustomHeaders(widget.searchGlobal.selectedBooru.value, checkForReferer: true),
      cancelToken: _dioCancelToken,
      onProgress: _onBytesAdded,
      onEvent: _onEvent,
      onError: (error) => _onError(error, delayed: false),
      onDone: (Uint8List bytes, String url) {
        if(isMain) {
          mainProvider = getImageProvider(bytes, url);
        } else {
          extraProvider = getImageProvider(bytes, url);
        }
        // if(!widget.isStandalone) print('$url $mainProvider ${bytes.lengthInBytes}');
        updateState();
      },
      cacheEnabled: settingsHandler.thumbnailCache,
      cacheFolder: isMain ? thumbFolder : 'thumbnails',
      timeoutTime: 20000,
    );
    if(isMain) {
      client = newClient;

      if(settingsHandler.disableImageIsolates) {
        client!.runRequest();
      } else {
        client!.runRequestIsolate();
      }
    } else {
      extraClient = newClient;
      extraClient!.runRequest();
    }
    return;
  }

  ImageProvider getImageProvider(Uint8List bytes, String url) {
    if(widget.booruItem.isHated.value) {
      // pixelate hated images
      return ResizeImage(MemoryImageTest(bytes, imageUrl: url), width: 10);
    }

    if(settingsHandler.disableImageScaling) {
      // if resizing is disabled => huge memory usage
      return MemoryImageTest(bytes, imageUrl: url);
    }

    double? thumbWidth;
    double? thumbHeight;

    if (mounted) {
      // mediaquery will throw an exception if we try to read it after disposing => check if mounted
      final MediaQueryData mQuery = MediaQuery.of(context);
      final double widthLimit = (mQuery.size.width / widget.columnCount) * mQuery.devicePixelRatio * 1;
      double thumbRatio = 1;
      bool hasSizeData = widget.booruItem.fileHeight != null && widget.booruItem.fileWidth != null;

      if(widget.isStandalone) {
        thumbWidth = widthLimit;
      } else {
        switch (settingsHandler.previewDisplay) {
          case 'Rectangle':
          case 'Staggered':
            // thumbRatio = 16 / 9;
            if (hasSizeData) { // if api gives size data
              thumbRatio = widget.booruItem.fileWidth! / widget.booruItem.fileHeight!;
              if(thumbRatio < 1) { // vertical image - resize to width
                thumbWidth = widthLimit;
              } else { // horizontal image - resize to height
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
    if(thumbWidth == null && thumbHeight == null) {
      return MemoryImage(kTransparentImage);
    }

    return ResizeImage(
      MemoryImageTest(bytes, imageUrl: url),
      width: thumbWidth?.round(),
      height: thumbWidth == null ? thumbHeight?.round() : null,
    );
  }

  void _onBytesAdded(int received, int total) {
    _received.value = received;
    _total.value = total;
  }

  void _onEvent(String event, dynamic value) {
    switch (event) {
      case 'loaded':
        // 
        break;
      case 'isFromCache':
        isFromCache = true;
        break;
      case 'isFromNetwork':
        isFromCache = false;
        break;
      default:
    }
    updateState();
  }

  void _onError(Exception error, {bool delayed = false}) {
    /// Error handling
    if (error is DioError && CancelToken.isCancel(error)) {
      // print('Canceled by user: $error');
    } else {
      if (_restartedCount < 5) {
        // attempt to reload 5 times with a second delay
        Debounce.debounce(
          tag: 'thumbnail_reload_${widget.searchGlobal.id.toString()}#${widget.index.toString()}',
          callback: () {
            restartLoading();
            _restartedCount++;
          },
          duration: const Duration(seconds: 1),
        );
      } else {
        //show error
        isFailed = true;
        if(delayed) {
          // _onError can happen while widget restates, which will cause an exception, this will delay the restate until the other one is done
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
    disposableBuildContext = DisposableBuildContext(this);
    selectThumbProvider();
  }

  void selectThumbProvider() {
    // bool isVideo = widget.thumbType == "video" && (thumbURL.endsWith(".webm") || thumbURL.endsWith(".mp4"));
    // if (isVideo) {
    //   isForVideo = true; // disabled - hangs the app
    // } else {
    //   downloadThumb();
    // }

    _startedAt.value = DateTime.now().millisecondsSinceEpoch;

    // if scaling is disabled - allow gifs as thumbnails, but only if they are not hated (resize image doesnt work with gifs)
    final bool isGifSampleNotAllowed = widget.booruItem.mediaType == 'animation' && (settingsHandler.disableImageScaling ? widget.booruItem.isHated.value : true);

    isThumbQuality = settingsHandler.previewMode == "Thumbnail" || (isGifSampleNotAllowed || widget.booruItem.mediaType == 'video') || (!widget.isStandalone && widget.booruItem.fileURL == widget.booruItem.sampleURL);
    thumbURL = isThumbQuality == true ? widget.booruItem.thumbnailURL : widget.booruItem.sampleURL;
    thumbFolder = isThumbQuality == true ? 'thumbnails' : 'samples';

    // restart loading if item was marked as hated
    hateListener = widget.booruItem.isHated.listen((bool value) {
      if(value == true) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          restartLoading();
        });
      }
    });

    // delay loading a little to improve performance when scrolling fast, ignore delay if it's a standalone widget (i.e. not in a list)
    Debounce.debounce(
      tag: 'thumbnail_start_${widget.searchGlobal.id.toString()}#${widget.index.toString()}',
      callback: () {
        startDownloading(isThumbQuality);
      },
      duration: Duration(milliseconds: widget.isStandalone ? 200 : 0),
    );
    return;
  }

  void startDownloading(isThumbQuality) {
    if(isThumbQuality == false && !widget.booruItem.isHated.value) {
      Future.wait([
        downloadThumb(false),
        downloadThumb(true)
      ]);
    } else {
      downloadThumb(true);
    }
  }

  Future<Uint8List?> getVideoThumb() async {
    Uint8List? bytes = await ServiceHandler.makeVidThumb(thumbURL);
    return bytes;
  }

  void restartLoading() {
    disposables();

    _total.value = 0;
    _received.value = 0;
    _startedAt.value = 0;

    isFromCache = null;

    hateListener?.cancel();

    updateState();

    selectThumbProvider();
  }

  void updateState() {
    if(mounted) setState(() { });
  }

  void disposeClients(bool? isMain) {
    // print('disposing class ${widget.index} $isMain');
    // dispose given or many clients
    if(isMain == true) {
      client?.dispose();
      client = null;
    } else if (isMain == false) {
      extraClient?.dispose();
      extraClient = null;
    } else {
      client?.dispose();
      client = null;
      extraClient?.dispose();
      extraClient = null;
    }
  }

  @override
  void dispose() {
    disposables();
    disposableBuildContext?.dispose();
    super.dispose();
  }

  void disposables() {
    // if(widget.isStandalone) { // evict from cache only when in grid
    mainProvider?.evict();
    mainProvider = null;
    // }
    extraProvider?.evict();
    extraProvider = null;

    Debounce.cancel('thumbnail_start_${widget.searchGlobal.id.toString()}#${widget.index.toString()}');
    Debounce.cancel('thumbnail_reload_${widget.searchGlobal.id.toString()}#${widget.index.toString()}');

    if (!(_dioCancelToken.isCancelled)){
      _dioCancelToken.cancel();
    }
    disposeClients(null);
  }

  Widget renderImages(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = (screenWidth / widget.columnCount) * 0.55;

    return Stack(
      alignment: Alignment.center,
      children: [
        if(isThumbQuality == false && !widget.booruItem.isHated.value) // fetch thumbnail from network while loading a sample
          AnimatedSwitcher( // fade in image
            duration: Duration(milliseconds: widget.isStandalone ? 600 : 0),
            child: extraProvider != null
              ? Image(
                image: ScrollAwareImageProvider(context: disposableBuildContext!, imageProvider: extraProvider!),
                fit: widget.isStandalone ? BoxFit.cover : BoxFit.contain,
                isAntiAlias: true,
                width: double.infinity, // widget.isStandalone ? double.infinity : null,
                height: double.infinity, // widget.isStandalone ? double.infinity : null,
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  print('failed to load thumb: ${widget.booruItem.thumbnailURL}');
                  return const Icon(Icons.broken_image, size: 30);
                },
              )
              : const SizedBox(
                width: double.infinity,
                height: double.infinity,
              ),
          ),

        AnimatedSwitcher( // fade in image
          duration: Duration(milliseconds: widget.isStandalone ? 300 : 0),
          child: mainProvider != null
            ? Image(
              image: ScrollAwareImageProvider(context: disposableBuildContext!, imageProvider: mainProvider!),
              fit: widget.isStandalone ? BoxFit.cover : BoxFit.contain,
              isAntiAlias: true,
              filterQuality: FilterQuality.medium,
              width: double.infinity,
              height: double.infinity,
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                print('failed to load sample: ${widget.booruItem.sampleURL}');
                _onError(exception as Exception, delayed: true);
                return const Icon(Icons.broken_image, size: 30);
              },
            )
            : const SizedBox(
              width: double.infinity,
              height: double.infinity,
            ),
        ),

        if(widget.isStandalone)
          ThumbnailLoading(
            item: widget.booruItem,
            hasProgress: true,
            isFromCache: isFromCache,
            isDone: mainProvider != null && !isFailed,
            isFailed: isFailed,
            total: _total,
            received: _received,
            startedAt: _startedAt,
            restartAction: () {
              _restartedCount = 0;
              isFailed = false;
              restartLoading();
            },
          ),

        if(widget.booruItem.isHated.value)
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.66),
              borderRadius: BorderRadius.circular(iconSize * 0.1),
            ),
            width: iconSize,
            height: iconSize,
            child: const Icon(CupertinoIcons.eye_slash, color: Colors.white)
          ),

        if (settingsHandler.showURLOnThumb)
          Container(
            color: Colors.black,
            child: Text(thumbURL),
          ),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    if(widget.isStandalone) {
      return Hero(
        tag: 'imageHero${widget.index}',
        placeholderBuilder: (BuildContext context, Size heroSize, Widget child) {
          // keep building the image since the images can be visible in the
          // background of the image gallery
          return child;
        },
        child: renderImages(context),
      );
    } else {
      // print('building thumb ${widget.index}');
      return renderImages(context);
    }
  }
}
