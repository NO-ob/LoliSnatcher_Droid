import 'dart:math';
import 'dart:ui';
import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:dio/dio.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/ViewUtils.dart';
import 'package:LoliSnatcher/ViewerHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/widgets/CachedThumbBetter.dart';
import 'package:LoliSnatcher/widgets/CustomImageProvider.dart';
import 'package:LoliSnatcher/widgets/DioDownloader.dart';
import 'package:LoliSnatcher/widgets/LoadingElement.dart';

class MediaViewerBetter extends StatefulWidget {
  final BooruItem booruItem;
  final int index;
  final SearchGlobal searchGlobal;
  MediaViewerBetter(Key? key, this.booruItem, this.index, this.searchGlobal) : super(key: key);

  @override
  _MediaViewerBetterState createState() => _MediaViewerBetterState();
}

class _MediaViewerBetterState extends State<MediaViewerBetter> {
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final SearchHandler searchHandler = Get.find<SearchHandler>();
  final ViewerHandler viewerHandler = Get.find<ViewerHandler>();

  PhotoViewScaleStateController scaleController = PhotoViewScaleStateController();
  PhotoViewController viewController = PhotoViewController();

  RxInt _total = 0.obs, _received = 0.obs, _startedAt = 0.obs;
  bool isStopped = false, isFromCache = false, isZoomed = false;
  List<String> stopReason = [];

  ImageProvider? mainProvider;
  late String imageURL;
  late String imageFolder;
  CancelToken _dioCancelToken = CancelToken();
  DioLoader? client;

  StreamSubscription? noScaleListener;

  @override
  void didUpdateWidget(MediaViewerBetter oldWidget) {
    // force redraw on item data change
    if(oldWidget.booruItem != widget.booruItem) {
      killLoading([]);
      initViewer(false);
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<void> _downloadImage() async {
    _dioCancelToken = CancelToken();
    client = DioLoader(
      imageURL,
      headers: ViewUtils.getFileCustomHeaders(widget.searchGlobal, checkForReferer: true),
      cancelToken: _dioCancelToken,
      onProgress: _onBytesAdded,
      onEvent: _onEvent,
      onError: _onError,
      onDone: (Uint8List bytes, String url) {
        mainProvider = getImageProvider(bytes, url);
        updateState();
      },
      cacheEnabled: settingsHandler.mediaCache,
      cacheFolder: imageFolder,
    );
    // client.runRequest();
    client!.runRequestIsolate();
    return;
  }

  void _onBytesAdded(int received, int total) {
    _received.value = received;
    _total.value = total;
    if (total > 0 && widget.booruItem.fileSize == null) {
      // set item file size if it wasn't received from api
      widget.booruItem.fileSize = total;
      // updateState();
    }
  }

  void _onEvent(String event) {
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

  void _onError(Exception error) {
    //// Error handling
    if (error is DioError && CancelToken.isCancel(error)) {
      // print('Canceled by user: $imageURL | $error');
    } else {
      killLoading(['Loading Error: $error']);
      print('Dio request cancelled: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    viewerHandler.addViewed(widget.key);
    initViewer(false);
  }

  void initViewer(bool ignoreTagsCheck) {
    if ((settingsHandler.galleryMode == "Sample" && widget.booruItem.sampleURL.isNotEmpty && widget.booruItem.sampleURL != widget.booruItem.thumbnailURL) || widget.booruItem.sampleURL == widget.booruItem.fileURL){
      // use sample file if (sample gallery quality && sampleUrl exists && sampleUrl is not the same as thumbnailUrl) OR sampleUrl is the same as full res fileUrl
      imageURL = widget.booruItem.sampleURL;
      imageFolder = 'samples';
    } else {
      imageURL = widget.booruItem.fileURL;
      imageFolder = 'media';
    }

    noScaleListener = widget.booruItem.isNoScale.listen((bool value) {
      killLoading([]);
      initViewer(false);
    });

    if(widget.booruItem.isHated.value && !ignoreTagsCheck) {
      List<List<String>> hatedAndLovedTags = settingsHandler.parseTagsList(widget.booruItem.tagsList, isCapped: true);
      if (hatedAndLovedTags[0].length > 0) {
        killLoading(['Contains Hated tags:', ...hatedAndLovedTags[0]]);
        return;
      }
    }

    // debug output
    // viewController..outputStateStream.listen(onViewStateChanged);
    scaleController..outputScaleStateStream.listen(onScaleStateChanged);

    isStopped = false;

    _startedAt.value = DateTime.now().millisecondsSinceEpoch;

    updateState();

    _downloadImage();
  }

  ImageProvider getImageProvider(Uint8List bytes, String url) {
    if(settingsHandler.disableImageScaling.value || widget.booruItem.isNoScale.value) {
      return MemoryImageTest(bytes, imageUrl: url);
    } else {
      int? widthLimit = settingsHandler.disableImageScaling.value ? null : (Get.mediaQuery.size.width * Get.mediaQuery.devicePixelRatio * 2).round();
      return ResizeImage(
        MemoryImageTest(bytes, imageUrl: url),
        width: widthLimit,
      );
    }
  }

  void killLoading(List<String> reason) {
    disposables();

    _total.value = 0;
    _received.value = 0;

    _startedAt.value = 0;

    isFromCache = false;
    isStopped = true;
    stopReason = reason;

    resetZoom();

    updateState();
  }

  @override
  void dispose() {
    disposables();
    viewerHandler.removeViewed(widget.key);
    super.dispose();
  }

  void updateState() {
    if(this.mounted) setState(() { });
  }

  void disposeClient() {
    client?.dispose();
    client = null;
  }

  void disposables() {
    mainProvider?.evict();
    mainProvider = null;
    // mainProvider?.evict().then((bool success) {
    //   if(success) {
    //     ServiceHandler.displayToast('main image evicted');
    //     print('main image evicted');
    //   } else {
    //     ServiceHandler.displayToast('main image eviction failed');
    //     print('main image eviction failed');
    //   }
    // });

    noScaleListener?.cancel();

    if (!(_dioCancelToken.isCancelled)){
      _dioCancelToken.cancel();
    }
    disposeClient();
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
  }

  void resetZoom() {
    // Don't zoom until image is loaded
    if(mainProvider == null) return;
    scaleController.scaleState = PhotoViewScaleState.initial;
  }

  void scrollZoomImage(double value) {
    final double upperLimit = min(8, (viewController.scale ?? 1) + (value / 200));
    // zoom on which image fits to container can be less than limit
    // therefore don't clump the value to lower limit if we are zooming in to avoid unnecessary zoom jumps
    final double lowerLimit = value > 0 ? upperLimit : max(0.75, upperLimit);

    // print('ll $lowerLimit $value');
    // if zooming out and zoom is smaller than limit - reset to container size
    // TODO minimal scale to fit can be different from limit
    if(lowerLimit == 0.75 && value < 0) {
      scaleController.scaleState = PhotoViewScaleState.initial;
    } else {
      viewController.scale = lowerLimit;
    }
  }

  void doubleTapZoom() {
    if(mainProvider == null) return;
    scaleController.scaleState = PhotoViewScaleState.covering;
  }

  Widget build(BuildContext context) {
    final bool isViewed = settingsHandler.appMode == 'Mobile'
      ? widget.searchGlobal.viewedIndex.value == widget.index
      : widget.searchGlobal.currentItem.value.fileURL == widget.booruItem.fileURL;

    if (!isViewed) {
      // reset zoom if not viewed
      resetZoom();
    } else {
      viewerHandler.setCurrent(widget.key);
    }

    // print('!!! Build media !!!');

    return Hero(
      tag: 'imageHero' + (isViewed ? '' : 'ignore') + widget.index.toString(),
      child: Material( // without this every text element will have broken styles on first frames
        color: Colors.black,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CachedThumbBetter(widget.booruItem, widget.index, widget.searchGlobal, 1, false),
            LoadingElement(
              item: widget.booruItem,
              hasProgress: true,
              isFromCache: isFromCache,
              isDone: mainProvider != null,
              isStopped: isStopped,
              stopReasons: stopReason,
              isViewed: isViewed,
              total: _total,
              received: _received,
              startedAt: _startedAt,
              startAction: () {
                initViewer(true);
              },
              stopAction: () {
                killLoading(['Stopped by User']);
              },
            ),
            AnimatedSwitcher(
              child: mainProvider != null
                ? Listener(
                    onPointerSignal: (pointerSignal) {
                      if(pointerSignal is PointerScrollEvent) {
                        scrollZoomImage(pointerSignal.scrollDelta.dy);
                      }
                    },
                    child: PhotoView(
                      //resizeimage if resolution is too high (in attempt to fix crashes if multiple very HQ images are loaded), only check by width, otherwise looooooong/thin images could look bad
                      imageProvider: mainProvider,
                      // TODO FilterQuality.high somehow leads to a worse looking image on desktop
                      filterQuality: FilterQuality.medium,
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered * 8,
                      initialScale: PhotoViewComputedScale.contained,
                      enableRotation: false,
                      basePosition: Alignment.center,
                      controller: viewController,
                      // tightMode: true,
                      scaleStateController: scaleController,
                    )
                  )
                : null,
              duration: Duration(milliseconds: settingsHandler.appMode == 'Desktop' ? 50 : 300)
            ),
          ]
        )
      )
    );
  }
}
