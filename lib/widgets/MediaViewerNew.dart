import 'dart:math';
import 'dart:ui';
import 'dart:async';

import 'package:LoliSnatcher/ViewUtils.dart';
import 'package:LoliSnatcher/widgets/CachedThumb.dart';
import 'package:LoliSnatcher/widgets/CachedThumbBetter.dart';
import 'package:LoliSnatcher/widgets/CachedThumbNew.dart';
import 'package:LoliSnatcher/widgets/CustomImageProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:dio/dio.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/Tools.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/widgets/BorderedText.dart';

// attempt to move all image loading to custom ImageProvider, failed experiment 
class MediaViewerNew extends StatefulWidget {
  final BooruItem booruItem;
  final int index;
  final SearchGlobal searchGlobal;
  MediaViewerNew(this.booruItem, this.index, this.searchGlobal);

  @override
  _MediaViewerNewState createState() => _MediaViewerNewState();
}

class _MediaViewerNewState extends State<MediaViewerNew> {
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final SearchHandler searchHandler = Get.find<SearchHandler>();

  PhotoViewScaleStateController scaleController = PhotoViewScaleStateController();
  PhotoViewController viewController = PhotoViewController();
  StreamSubscription<bool>? appbarListener;

  int _total = 0, _received = 0;
  int _prevReceivedAmount = 0, _lastReceivedAmount = 0, _lastReceivedTime = 0, _startedAt = 0;
  Timer? _checkInterval, _debounceBytes;
  bool isFromCache = false, isStopped = false, isLoaded = false, isZoomed = false, isZoomButtonVisible = true;
  List<String> stopReason = [];
  CancelToken _dioCancelToken = CancelToken();
  late ImageProvider imageProvider;

  late String imageURL;
  late String imageFolder;
  late String thumbnailURL;
  late String thumbnailFolder;

  @override
  void didUpdateWidget(MediaViewerNew oldWidget) {
    // force redraw on tab change
    if(oldWidget.booruItem != widget.booruItem) {
      setState(() {
        disposables();
        resetValues(withRestate: false);
        isStopped = true;
        initViewer();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  void _onBytesAdded(int received, int total) {
    // always save incoming bytes, but restate only after [debounceDelay]MS
    const int debounceDelay = 100;
    bool isActive = _debounceBytes?.isActive ?? false;
    if(received == -1 && total == -1) {
      _checkInterval?.cancel();
      isLoaded = true;
    } else if(received >= total) {
      if(received == 133769420 && total == 133769420) {
        isFromCache = true;
      }
    } else {
      _received = received;
      _total = total;
    }

    if (isActive) {
      // 
    } else {
      if(this.mounted) setState(() { });
      _debounceBytes = Timer(const Duration(milliseconds: debounceDelay), () {});
    }
  }

  @override
  void initState() {
    super.initState();
    appbarListener = searchHandler.displayAppbar.listen((bool value) {
      isZoomButtonVisible = value;
      setState(() { });
    });
    initViewer();
  }

  void initViewer() {
    if ((settingsHandler.galleryMode == "Sample" && widget.booruItem.sampleURL.isNotEmpty && widget.booruItem.sampleURL != widget.booruItem.thumbnailURL) || widget.booruItem.sampleURL == widget.booruItem.fileURL){
      // use sample file if (sample gallery quality && sampleUrl exists && sampleUrl is not the same as thumbnailUrl) OR sampleUrl is the same as full res fileUrl
      imageURL = widget.booruItem.sampleURL;
      imageFolder = 'samples';
    } else {
      imageURL = widget.booruItem.fileURL;
      imageFolder = 'media';
    }

    imageProvider = ResizeImage(
      LoliImage(
        imageURL,
        headers: ViewUtils.getFileCustomHeaders(widget.searchGlobal, checkForReferer: true),
        cancelToken: _dioCancelToken,
        cacheEnabled: settingsHandler.mediaCache,
        cacheFolder: imageFolder,
        onProgress: (int received, int total) => _onBytesAdded(received, total)
      ),
      width: (Get.mediaQuery.size.width * Get.mediaQuery.devicePixelRatio * 1.5).round(),
    );

    // load thumbnail preview
    bool isThumbSample = settingsHandler.previewMode == "Sample" && widget.booruItem.mediaType != "animation" && widget.booruItem.sampleURL != widget.booruItem.thumbnailURL;
    thumbnailURL = isThumbSample ? widget.booruItem.sampleURL : widget.booruItem.thumbnailURL;
    thumbnailFolder = isThumbSample ? 'samples' : 'thumbnails';

    scaleController = PhotoViewScaleStateController();
    viewController = PhotoViewController();

    if(widget.booruItem.isHated.value) {
      List<List<String>> hatedAndLovedTags = settingsHandler.parseTagsList(widget.booruItem.tagsList, isCapped: true);
      killLoading(['Contains Hated tags:', ...hatedAndLovedTags[0]]);
      return;
    }

    // debug output
    // viewController..outputStateStream.listen(onViewStateChanged);
    scaleController..outputScaleStateStream.listen(onScaleStateChanged);

    _checkInterval?.cancel();
    _checkInterval = Timer.periodic(const Duration(seconds: 1), (timer) {
      // force restate every second to refresh all timers/indicators, even when loading has stopped
      if(this.mounted) setState(() {});
    });

    isStopped = false;
    _startedAt = DateTime.now().millisecondsSinceEpoch;

    if(this.mounted) setState(() { });
  }

  void killLoading(List<String> reason) {
    disposables();
    resetValues(withRestate: false);
    stopReason = reason;
    isStopped = true;
    setState(() { });
  }

  @override
  void dispose() {
    disposables();
    super.dispose();
  }

  void resetValues({bool withRestate = true}) {
    _total = 0;
    _received = 0;

    _prevReceivedAmount = 0;
    _lastReceivedAmount = 0;
    _lastReceivedTime = 0;
    _startedAt = 0;

    isLoaded = false;
    isFromCache = false;
    isStopped = false;
    stopReason = [];

    if(this.mounted && withRestate) {
      setState(() { });
    }
  }

  void disposables() {
    imageProvider.evict();
    _debounceBytes?.cancel();
    _checkInterval?.cancel();

    appbarListener?.cancel();

    if (!_dioCancelToken.isCancelled){
      _dioCancelToken.cancel();
    }
  }

  // debug functions
  void onScaleStateChanged(PhotoViewScaleState scaleState) {
    print(scaleState);

    // manual zoom || double tap || double tap AFTER double tap
    isZoomed = scaleState == PhotoViewScaleState.zoomedIn || scaleState == PhotoViewScaleState.covering || scaleState == PhotoViewScaleState.originalSize;
    setState(() { });
  }
  void onViewStateChanged(PhotoViewControllerValue viewState) {
    print(viewState);
  }

  void resetZoom() {
    scaleController.scaleState = PhotoViewScaleState.initial;
    setState(() { });
  }

  void doubleTapZoom() {
    scaleController.scaleState = PhotoViewScaleState.covering;
    setState(() { });
  }

  void zoomImage(double value) {
    viewController.scale = max(0.1, min(8, viewController.scale ?? 1 + (value/100)));
  }

  Widget zoomButtonBuild() {
    if(isZoomButtonVisible) {
      return Positioned(
        bottom: 150,
        right: -15,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).colorScheme.secondary.withOpacity(0.33),
            minimumSize: Size(28, 28),
            padding: EdgeInsets.all(3),
          ),
          icon: Icon(isZoomed ? Icons.zoom_out : Icons.zoom_in, size: 28),
          label: Text(''),
          onPressed: isZoomed ? resetZoom : doubleTapZoom,
        )
      );
    } else {
      return const SizedBox();
    }
  }

  Widget loadingElementBuilder(BuildContext ctx, Widget? child, ImageChunkEvent? loadingProgress) {
    if(settingsHandler.loadingGif) {
      return Container(
        width: MediaQuery.of(context).size.width - 30,
        child: Image(image: AssetImage('assets/images/loading.gif'))
      );
    } else if(settingsHandler.shitDevice) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Get.theme.colorScheme.secondary)
        )
      );
    }

    // if(loadingProgress != null) {
    //   _received = loadingProgress.cumulativeBytesLoaded;
    //   _total = loadingProgress.expectedTotalBytes ?? _total;
    // }

    // if(loadingProgress == null) {
    //   _checkInterval?.cancel();
    //   isLoaded = true;
    //   if(this.mounted) setState(() { });
    // }


    bool hasProgressData = (loadingProgress != null && loadingProgress.expectedTotalBytes != null) || (_total > 0);
    int expectedBytes = hasProgressData
        ? _received
        : 0;
    int totalBytes = hasProgressData
        ? _total
        : 0;

        print('$expectedBytes |||| $totalBytes');

    double speedCheckInterval = 1000 / 4;
    int nowMils = DateTime.now().millisecondsSinceEpoch;
    if((nowMils - _lastReceivedTime) > speedCheckInterval && hasProgressData) {
      _prevReceivedAmount = _lastReceivedAmount;
      _lastReceivedAmount = expectedBytes;

      _lastReceivedTime = nowMils;
    }

    double? percentDone = hasProgressData ? (expectedBytes / totalBytes) : null;
    String loadedSize = hasProgressData ? Tools.formatBytes(expectedBytes, 1) : '';
    String expectedSize = hasProgressData ? Tools.formatBytes(totalBytes, 1) : '';

    int expectedSpeed = hasProgressData ? ((_lastReceivedAmount - _prevReceivedAmount) * (1000 / speedCheckInterval).round()) : 0;
    String expectedSpeedText = (hasProgressData && percentDone! < 1) ? (Tools.formatBytes(expectedSpeed, 1) + '/s') : '';
    double expectedTime = hasProgressData ? ((totalBytes - expectedBytes) / expectedSpeed) : 0;
    String expectedTimeText = (hasProgressData && expectedTime > 0 && percentDone! < 1) ? ("~" + expectedTime.toStringAsFixed(1) + " second${expectedTime == 1 ? '' : 's'} left") : '';
    int sinceStart = Duration(milliseconds: nowMils - _startedAt).inSeconds;
    String sinceStartText = "Started " + sinceStart.toString() + " second${sinceStart == 1 ? '' : 's'} ago";

    String percentDoneText = hasProgressData
        ? (percentDone == 1 ? 'Rendering...' : '${(percentDone! * 100).toStringAsFixed(2)}%')
        : 'Loading${isFromCache ? ' from cache' : ''}...';
    String filesizeText = hasProgressData ? ('$loadedSize / $expectedSize') : '';

    // start opacity from (0% if hated) OR (50% if of sample qulaity) OR (33% if no progress data) OR 20%
    bool isMovedBelow = thumbnailFolder == 'samples' && !widget.booruItem.isHated.value;
    double startOpacity = widget.booruItem.isHated.value ? 0.0 : (isMovedBelow ? 0.5 : 0.2);
    double opacityValue = startOpacity + (1 - startOpacity) * lerpDouble(0.0, 1.0, percentDone ?? 0.33)!;

    if(_received >= _total && child != null) {
      return child;
    }

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 10,
            child: RotatedBox(
              quarterTurns: -1,
              child: LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Get.theme.colorScheme.secondary),
                  backgroundColor: Colors.transparent,
                  value: percentDone),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 80,
            child: Column(
              // move loading info lower if preview is of sample quality (except when item is hated)
              mainAxisAlignment: isMovedBelow ? MainAxisAlignment.end : MainAxisAlignment.center,
              children: isStopped
                ? [
                    ...stopReason.map((reason){
                      return BorderedText(
                        strokeWidth: 3,
                        child: Text(
                          reason,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )
                      );
                    }),
                    TextButton.icon(
                      icon: Icon(Icons.play_arrow, size: 44),
                      label: BorderedText(
                        strokeWidth: 3,
                        child: Text(
                          widget.booruItem.isHated.value ? 'Load Anyway' : 'Restart Loading',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ),
                      onPressed: () {
                        setState(() { initViewer(); });
                      },
                    ),
                    if(isMovedBelow) const SizedBox(height: 60),
                  ]
                : (settingsHandler.loadingGif
                  ? [
                    // TODO redo
                    Center(child: Container(
                      width: MediaQuery.of(context).size.width - 30,
                      child: Image(image: AssetImage('assets/images/loading.gif'))
                    )),
                    const SizedBox(height: 30),
                  ]
                  : [
                    if(percentDoneText != '')
                      BorderedText(
                        strokeWidth: 3,
                        child: Text(
                          percentDoneText,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ),
                    if(filesizeText != '')
                      BorderedText(
                        strokeWidth: 3,
                        child: Text(
                          filesizeText,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ),
                    if(expectedSpeedText != '')
                      BorderedText(
                        strokeWidth: 3,
                        child: Text(
                          expectedSpeedText,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ),
                    if(expectedTimeText != '')
                      BorderedText(
                        strokeWidth: 3,
                        child: Text(
                          expectedTimeText,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ),
                    if(sinceStartText != '')
                      BorderedText(
                        strokeWidth: 3,
                        child: Text(
                          sinceStartText,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ),
                    const SizedBox(height: 10),
                    TextButton.icon(
                      icon: Icon(Icons.stop, size: 44, color: Colors.red),
                      label: BorderedText(
                        strokeWidth: 3,
                        child: Text(
                          'Stop Loading',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                          ),
                        )
                      ),
                      onPressed: () {
                        killLoading(['Stopped by User']);
                      },
                    ),
                    if(isMovedBelow) const SizedBox(height: 60),
                  ]
                )
            )
          ),
          SizedBox(
            width: 10,
            child: RotatedBox(
              quarterTurns: percentDone != null ? -1 : 1,
              child: LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Get.theme.colorScheme.secondary),
                  backgroundColor: Colors.transparent,
                  value: percentDone),
            ),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    final bool isViewed = widget.searchGlobal.viewedIndex.value == widget.index;
    if (!isViewed && settingsHandler.appMode == 'Mobile') {
      // reset zoom if not viewed
      resetZoom();
    }

    print('BUILDED');

    return Hero(
      tag: 'imageHero' + (isViewed ? '' : 'ignore') + widget.index.toString(),
      child: Material(
          child: Stack(
            alignment: Alignment.center,
            children: [
              if(!isStopped)
                AnimatedCrossFade(
                  firstChild: Stack(
                    alignment: Alignment.center,
                    children: [
                      // CachedThumb(widget.booruItem, widget.index, widget.searchGlobal, 1, isHated, false),
                      // CachedThumbNew(widget.booruItem, widget.index, widget.searchGlobal, 1, false),
                      CachedThumbBetter(widget.booruItem, widget.index, widget.searchGlobal, 1, false),
                      loadingElementBuilder(context, null, null),
                    ]
                  ),
                  secondChild: Listener(
                    onPointerSignal: (pointerSignal) {
                      if(pointerSignal is PointerScrollEvent) {
                        zoomImage(pointerSignal.scrollDelta.dy);
                      }
                    },
                    child: PhotoView(
                      //resizeimage if resolution is too high (in attempt to fix crashes if multiple very HQ images are loaded), only check by width, otherwise looooooong/thin images could look bad
                      imageProvider: imageProvider,
                      filterQuality: FilterQuality.high,
                      backgroundDecoration: BoxDecoration(color: Colors.transparent),
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered * 8,
                      initialScale: PhotoViewComputedScale.contained,
                      enableRotation: false,
                      basePosition: Alignment.center,
                      controller: viewController,
                      // tightMode: true,
                      // heroAttributes: PhotoViewHeroAttributes(tag: 'imageHero' + (widget.viewedIndex == widget.index ? '' : 'ignore') + widget.index.toString()),
                      scaleStateController: scaleController,
                      // gaplessPlayback: true,
                      // loadingBuilder: (_, __) => loadingElementBuilder(_, null, __),
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        print(exception);
                        return Text('${exception.toString()}');
                      },
                    )
                  ),
                  crossFadeState: isLoaded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  duration: Duration(milliseconds: 400)
                ),

              zoomButtonBuild(),
            ]
          )
        )
    );
  }
}
