import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/ViewUtils.dart';
import 'package:LoliSnatcher/widgets/CachedThumbBetter.dart';
import 'package:LoliSnatcher/widgets/DioDownloader.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/Tools.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/widgets/LoliControls.dart';
import 'package:LoliSnatcher/widgets/BorderedText.dart';

class VideoApp extends StatefulWidget {
  final BooruItem booruItem;
  final int index;
  final SearchGlobal searchGlobal;
  final bool enableFullscreen;
  VideoApp(Key? key, this.booruItem, this.index, this.searchGlobal, this.enableFullscreen) : super(key: key);
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final SearchHandler searchHandler = Get.find<SearchHandler>();

  PhotoViewScaleStateController scaleController = PhotoViewScaleStateController();
  PhotoViewController viewController = PhotoViewController();
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;

  StreamSubscription<bool>? appbarListener;

  // VideoPlayerValue _latestValue;
  int _total = 0, _received = 0, _lastViewedIndex = -1;
  int _prevReceivedAmount = 0, _lastReceivedAmount = 0, _lastReceivedTime = 0, _startedAt = 0;
  Timer? _checkInterval, _debounceBytes;
  bool isFromCache = false, isStopped = false, isZoomed = false, isZoomButtonVisible = true;
  List<String> stopReason = [];

  CancelToken? _dioCancelToken;
  DioLoader? client;
  File? _video;

  @override
  void didUpdateWidget(VideoApp oldWidget) {
    // force redraw on item data change
    if(oldWidget.booruItem != widget.booruItem) {
      killLoading([]);
      initVideo(false);
      updateState();
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<void> _downloadVideo() async {
    _checkInterval?.cancel();
    _checkInterval = Timer.periodic(const Duration(seconds: 1), (timer) {
      // force restate every second to refresh all timers/indicators, even when loading has stopped
      updateState();
    });
    isStopped = false;
    _startedAt = DateTime.now().millisecondsSinceEpoch;

    if(!settingsHandler.mediaCache) {
      // Media caching disabled - don't cache videos
      initPlayer();
      return;
    }
    switch (settingsHandler.videoCacheMode) {
      case 'Cache':
        // Cache to device from custom request
        break;

      case 'Stream+Cache':
        // Load and stream from default player network request, cache to device from custom request
        // TODO: change video handler to allow viewing and caching from single network request
        initPlayer();
        break;

      case 'Stream':
      default:
        // Only stream, notice the return
        initPlayer();
        return;
    }

    _dioCancelToken = CancelToken();
    client = DioLoader(
      widget.booruItem.fileURL,
      headers: ViewUtils.getFileCustomHeaders(widget.searchGlobal, checkForReferer: true),
      cancelToken: _dioCancelToken,
      onProgress: _onBytesAdded,
      onEvent: _onEvent,
      onError: _onError,
      onDoneFile: (File file, String url) {
        _video = file;
        // save video from cache, but restate only if player is not initialized yet
        if(!(_videoController?.value.isInitialized ?? false)) {
          initPlayer();
          updateState();
        }
      },
      cacheEnabled: settingsHandler.mediaCache,
      cacheFolder: 'media',
    );
    // client!.runRequest();
    client!.runRequestIsolate();
    return;
  }

  void _onBytesAdded(int received, int total) {
    // always save incoming bytes, but restate only after [debounceDelay]MS
    const int debounceDelay = 50;
    bool isActive = _debounceBytes?.isActive ?? false;
    bool isAllowedToRestate = settingsHandler.videoCacheMode == 'Cache' || !(_videoController != null && _videoController!.value.isInitialized);

    _received = received;
    _total = total;
    if (total > 0 && widget.booruItem.fileSize == null) {
      // set item file size if it wasn't received from api
      widget.booruItem.fileSize = total;
      if(isAllowedToRestate) updateState();
    }

    if (!isActive) {
      if(isAllowedToRestate) updateState();
      _debounceBytes = Timer(const Duration(milliseconds: debounceDelay), () {});
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
    isZoomButtonVisible = settingsHandler.zoomButtonPosition != "Disabled" && settingsHandler.appMode != "Desktop";
    appbarListener = searchHandler.displayAppbar.listen((bool value) {
      if (settingsHandler.zoomButtonPosition != "Disabled" && settingsHandler.appMode != "Desktop") {
        isZoomButtonVisible = value;
      }
      updateState();
    });
    initVideo(false);
  }

  void updateState() {
    if(this.mounted) {
      setState(() { });
    }
  }

  void initVideo(ignoreTagsCheck) {
    // viewController..outputStateStream.listen(onViewStateChanged);
    scaleController..outputScaleStateStream.listen(onScaleStateChanged);

    if (widget.booruItem.isHated.value && !ignoreTagsCheck) {
      List<List<String>> hatedAndLovedTags = settingsHandler.parseTagsList(widget.booruItem.tagsList, isCapped: true);
      killLoading(['Contains Hated tags:', ...hatedAndLovedTags[0]]);
    } else {
      _downloadVideo();
    }
  }

  void killLoading(List<String> reason) {
    disposables();

    _total = 0;
    _received = 0;

    _prevReceivedAmount = 0;
    _lastReceivedAmount = 0;
    _lastReceivedTime = 0;
    _startedAt = 0;

    isFromCache = false;
    isStopped = true;
    stopReason = reason;

    resetZoom();

    _video = null;

    updateState();
  }

  @override
  void dispose() {
    disposables();
    super.dispose();
  }

  void disposeClient() {
    client?.dispose();
    client = null;
  }

  void disposables() {
    _debounceBytes?.cancel();
    _checkInterval?.cancel();

    _videoController?.setVolume(0);
    _videoController?.pause();
    _videoController?.dispose();
    _chewieController?.dispose();

    appbarListener?.cancel();

    if (!(_dioCancelToken != null && _dioCancelToken!.isCancelled)){
      _dioCancelToken?.cancel();
    }
    disposeClient();
  }


  // debug functions
  void onScaleStateChanged(PhotoViewScaleState scaleState) {
    // print(scaleState);

    isZoomed = scaleState == PhotoViewScaleState.zoomedIn || scaleState == PhotoViewScaleState.covering || scaleState == PhotoViewScaleState.originalSize;
    updateState();
  }

  void onViewStateChanged(PhotoViewControllerValue viewState) {
    // print(viewState);
  }

  void resetZoom() {
    scaleController.scaleState = PhotoViewScaleState.initial;
    updateState();
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
    viewController.scale = 2;
    // scaleController.scaleState = PhotoViewScaleState.originalSize;
    updateState();
  }

  Widget zoomButtonBuild() {
    if(isZoomButtonVisible && (_videoController != null && _videoController!.value.isInitialized)) {
      return Positioned(
        bottom: 180,
        right: settingsHandler.zoomButtonPosition == "Right" ? -10 : null,
        left: settingsHandler.zoomButtonPosition == "Left" ? -10 : null,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Get.theme.colorScheme.secondary.withOpacity(0.33),
            minimumSize: Size(28, 28),
            padding: EdgeInsets.all(3),
          ),
          child: Icon(
            isZoomed ? Icons.zoom_out : Icons.zoom_in,
            size: 28,
            color: Get.theme.colorScheme.onSecondary
          ),
          onPressed: isZoomed ? resetZoom : doubleTapZoom,
        )
      );
    } else {
      return const SizedBox();
    }
  }

  void _updateState() {
    // print(_videoController?.value);
    // setState(() {
    //   _latestValue = _videoController?.value;
    // });
    if(_chewieController == null) return;

    searchHandler.isFullscreen.value = _chewieController!.isFullScreen;
    if(widget.searchGlobal.viewedIndex.value == widget.index) {
      if(_chewieController!.isFullScreen || !settingsHandler.useVolumeButtonsForScroll) {
        ServiceHandler.setVolumeButtons(true); // in full screen or volumebuttons scroll setting is disabled
      } else {
        ServiceHandler.setVolumeButtons(searchHandler.displayAppbar.value); // same as app bar value
      }
    }
  }


  Future<void> initPlayer() async {
    // Start from cache if was already cached or only caching is allowed
    if(_video != null) { // if (settingsHandler.mediaCache || _video != null) {
      _videoController = VideoPlayerController.file(
        _video!,
        videoPlayerOptions: Platform.isAndroid ? VideoPlayerOptions(mixWithOthers: true) : null,
      );
    } else {
      // Otherwise load from network
      _videoController = VideoPlayerController.network(
        widget.booruItem.fileURL,
        videoPlayerOptions: Platform.isAndroid ? VideoPlayerOptions(mixWithOthers: true) : null,
        httpHeaders: ViewUtils.getFileCustomHeaders(widget.searchGlobal, checkForReferer: true),
      );
    }
    // mixWithOthers: true, allows to not interrupt audio sources from other apps
    await Future.wait([_videoController!.initialize()]);
    _videoController?.addListener(_updateState);

    // Stop force restating loading indicators when video is initialized
    _checkInterval?.cancel();

    // Player wrapper to allow controls, looping...
    _chewieController = ChewieController(
      videoPlayerController: _videoController!,
      // autoplay is disabled here, because videos started playing randomly, but videos will still autoplay when in view (see isViewed check later)
      autoPlay: false,
      allowedScreenSleep: false,
      looping: true,
      allowFullScreen: widget.enableFullscreen,
      showControls: true,
      showControlsOnInitialize: searchHandler.displayAppbar.value,
      customControls: SafeArea(child: LoliControls()),
      // TODO safe area replaces hideable padding?
        // settingsHandler.galleryBarPosition == 'Bottom'
        //   ? SafeArea(child: HideableControlsPadding(LoliControls()))
        //   : SafeArea(child: LoliControls()),

        // MaterialControls(),
        // CupertinoControls(
        //   backgroundColor: Color.fromRGBO(41, 41, 41, 0.7),
        //   iconColor: Color.fromARGB(255, 200, 200, 200)
        // ),
      materialProgressColors: ChewieProgressColors(
        playedColor: Get.theme.colorScheme.secondary,
        handleColor: Get.theme.colorScheme.secondary,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.white,
      ),
      // placeholder: Container(
      //   color: Colors.black,
      // ),
      systemOverlaysOnEnterFullScreen: [],
      systemOverlaysAfterFullScreen: [],
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(errorMessage, style: TextStyle(color: Colors.white)),
        );
      },

      // Specify this to allow any orientation in fullscreen, otherwise it will decide for itself based on video dimensions
      // deviceOrientationsOnEnterFullScreen: [
      //     DeviceOrientation.landscapeLeft,
      //     DeviceOrientation.landscapeRight,
      //     DeviceOrientation.portraitUp,
      //     DeviceOrientation.portraitDown,
      // ],
    );

    // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    updateState();
  }

  /// Author: [Nani-Sore] ///
  Widget loadingElementBuilder() {
    if(settingsHandler.shitDevice) {
      if(settingsHandler.loadingGif) {
        return Center(child: Image(image: AssetImage('assets/images/loading.gif')));
      } else {
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Get.theme.colorScheme.secondary)
          )
        );
      }
    }


    bool hasProgressData = settingsHandler.mediaCache && _total > 0;
    int expectedBytes = hasProgressData ? _received : 0;
    int totalBytes = hasProgressData ? _total : 0;

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
        : '${isFromCache ? 'Loading from cache' : 'Buffering'}...';
    String filesizeText = hasProgressData ? ('$loadedSize / $expectedSize') : '';

    bool isMovedBelow = settingsHandler.previewMode == 'Sample' && !widget.booruItem.isHated.value;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 6,
            child: RotatedBox(
              quarterTurns: -1,
              child: LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Get.theme.colorScheme.secondary),
                backgroundColor: Colors.transparent,
                value: percentDone
              ),
            ),
          ),
          Expanded(
            child: Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 30), child: Column(
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
                            color: Colors.white,
                          ),
                        )
                      );
                    }),
                    TextButton.icon(
                      icon: Icon(Icons.play_arrow, size: 44, color: Colors.blue),
                      label: BorderedText(
                        strokeWidth: 3,
                        child: Text(
                          widget.booruItem.isHated.value ? 'Load Anyway' : 'Restart Loading',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        )
                      ),
                      onPressed: () {
                        initVideo(true);
                        updateState();
                      },
                    ),
                    if(isMovedBelow) const SizedBox(height: 60),
                  ]
                : (settingsHandler.loadingGif
                  ? [
                    Center(child: Image(image: AssetImage('assets/images/loading.gif'))),
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
                            color: Colors.white,
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
                            color: Colors.white,
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
                            color: Colors.white,
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
                            color: Colors.white,
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
                            color: Colors.white,
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
            ))
          ),
          SizedBox(
            width: 6,
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

  @override
  Widget build(BuildContext context) {
    int viewedIndex = widget.searchGlobal.viewedIndex.value;
    final bool isViewed = settingsHandler.appMode == 'Mobile'
      ? widget.searchGlobal.viewedIndex.value == widget.index
      : widget.searchGlobal.currentItem.value.fileURL == widget.booruItem.fileURL;
    bool initialized = _chewieController != null && _chewieController!.videoPlayerController.value.isInitialized;

    // protects from video restart when something forces restate here while video is active (example: favoriting from appbar)
    bool needsRestart = _lastViewedIndex != viewedIndex;

    if (!isViewed) {
      // reset zoom if not viewed
      resetZoom();
    }

    if (initialized) {
      if (isViewed) {
        // Reset video time if came into view
        if(needsRestart) {
          _videoController!.seekTo(Duration());
        }
        if (settingsHandler.autoPlayEnabled) {
          // autoplay if viewed and setting is enabled
          _videoController!.play();
        }
        if (settingsHandler.videoAutoMute){
          _videoController!.setVolume(0);
        }
      } else {
        _videoController!.pause();
      }
    }

    if(needsRestart) {
      _lastViewedIndex = viewedIndex;
    }

    int nowMils = DateTime.now().millisecondsSinceEpoch;
    int sinceStart = nowMils - _startedAt;
    bool showLoading = isViewed && sinceStart > 500;
    // delay showing loading info a bit, so we don't clutter interface for fast loading files

    // TODO move controls outside of chewie, to exclude them from zoom

    return Hero(
      tag: 'imageHero' + (isViewed ? '' : 'ignore') + widget.index.toString(),
      child: Material(
        child: Stack(
          children: [
            Listener(
              onPointerSignal: (pointerSignal) {
                if(pointerSignal is PointerScrollEvent) {
                  scrollZoomImage(pointerSignal.scrollDelta.dy);
                }
              },
              child: PhotoView.customChild(
                child: initialized
                  ? Chewie(controller: _chewieController!)
                  : Stack(children: [
                      CachedThumbBetter(widget.booruItem, widget.index, widget.searchGlobal, 1, false),
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear,
                        opacity: showLoading ? 1 : 0,
                        child: loadingElementBuilder(),
                      ),
                    ]),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 8,
                initialScale: PhotoViewComputedScale.contained,
                enableRotation: false,
                basePosition: Alignment.center,
                controller: viewController,
                // tightMode: true,
                // heroAttributes: PhotoViewHeroAttributes(tag: 'imageHero' + (widget.searchGlobal.viewedIndex.value == widget.index ? '' : 'ignore') + widget.index.toString()),
                scaleStateController: scaleController,
              )
            ),

            zoomButtonBuild(),
          ]
        )
      )
    );
  }
}
