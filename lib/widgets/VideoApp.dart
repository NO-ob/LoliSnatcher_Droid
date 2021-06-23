import 'dart:io';
import 'dart:ui';
import 'dart:async';

import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/ViewUtils.dart';
import 'package:LoliSnatcher/widgets/HideableControlsPadding.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:photo_view/photo_view.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/ImageWriter.dart';
import 'package:LoliSnatcher/Tools.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/widgets/LoliControls.dart';
import 'package:LoliSnatcher/widgets/BorderedText.dart';

class VideoApp extends StatefulWidget {
  final BooruItem booruItem;
  final int index;
  final SearchGlobals searchGlobals;
  final SettingsHandler settingsHandler;
  final bool enableFullscreen;
  VideoApp(this.booruItem, this.index, this.searchGlobals, this.settingsHandler, this.enableFullscreen);
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  PhotoViewScaleStateController scaleController = PhotoViewScaleStateController();
  PhotoViewController viewController = PhotoViewController();
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;
  ValueNotifier<bool> isFullscreen = ValueNotifier(false);

  // VideoPlayerValue _latestValue;
  ImageProvider? thumbProvider;
  double thumbnailBlur = 1;
  String? cacheMode;
  final ImageWriter imageWriter = ImageWriter();
  int _total = 0, _received = 0, _lastViewedIndex = -1;
  int _prevReceivedAmount = 0, _lastReceivedAmount = 0, _lastReceivedTime = 0, _startedAt = 0;
  Timer? _checkInterval, _debounceBytes;
  bool isFromCache = false, isStopped = false, isHated = false, isZoomed = false, isZoomButtonVisible = true;
  List<String> stopReason = [];

  Dio? _client;
  CancelToken? _dioCancelToken;
  // Uint8List _totalBytes = Uint8List(0);
  File? _video;

  /// Author: [Nani-Sore] ///
  Future<void> _downloadVideo() async {
    _checkInterval?.cancel();
    _checkInterval = Timer.periodic(const Duration(seconds: 1), (timer) {
      // force restate every second to refresh all timers/indicators, even when loading has stopped
      setState(() {});
    });
    isStopped = false;
    _startedAt = DateTime.now().millisecondsSinceEpoch;

    final String? filePath = await imageWriter.getCachePath(widget.booruItem.fileURL, 'media',widget.settingsHandler);
    // If file is in cache - load
    // print(filePath);
    if (filePath != null) {
      final File file = File(filePath);
      await file.readAsBytes();
      setState(() {
        _video = file;
        isFromCache = true;
      });

      // Start video if already cached
      initPlayer();
      return;
    }

    // Start video now if stream mode is involved
    if(!widget.settingsHandler.mediaCache) {
      // Media caching disabled - don't cache videos
      initPlayer();
      return;
    } else {
      switch (cacheMode) {
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
    }

    // Otherwise start loading and subscribe to progress
    _client = Dio();
    _dioCancelToken = CancelToken();

    try {
      //// GET request
      Response<dynamic> response = await _client!.get(
        widget.booruItem.fileURL,
        options: Options(responseType: ResponseType.bytes, headers: ViewUtils.getFileCustomHeaders(widget.searchGlobals, checkForReferer: true)),
        cancelToken: _dioCancelToken,
        onReceiveProgress: (received, total) {
          _total = total;
          _onBytesAdded(received);
        },
      );

      //// Parse response
      // Sometimes stream ends before fully loading, so we require at least 95% loaded to write to cache
      if (response.data != null && _received > (_total * 0.95)) {
        final File? cacheFile = await imageWriter.writeCacheFromBytes(widget.booruItem.fileURL, response.data!, 'media',widget.settingsHandler);
        if (cacheFile != null) {
          //Restate only when just Caching
          if (cacheMode == 'Cache') {
            setState(() {
              _video = cacheFile;
              // Start video after caching
              initPlayer();
            });
          } else {
            _video = cacheFile;
          }
        }
      } else {
        print('Video load incomplete');
        throw('Load Incomplete');
      }
    } on DioError catch(e) {
      //// Error handling
      if (CancelToken.isCancel(e)) {
        // print('Canceled by user: ${widget.booruItem.fileURL} | $e');
      } else {
        killLoading(['Loading Error: ${e.message}']);
        print('Dio request cancelled: $e');
      }
    }
  }

  /// Author: [Nani-Sore] ///
  void _onBytesAdded(int received) {
    // always save incoming bytes, but restate only after [debounceDelay]MS
    const int debounceDelay = 50;
    bool isActive = _debounceBytes?.isActive ?? false;
    bool isAllowedToRestate = cacheMode == 'Cache' || !(_videoController != null && _videoController!.value.isInitialized);
    if (isActive || !isAllowedToRestate) {
      _received = received;
    } else {
      setState(() {
        _received = received;
      });
      _debounceBytes = Timer(const Duration(milliseconds: debounceDelay), () {});
    }
  }

  @override
  void initState() {
    super.initState();
    widget.searchGlobals.displayAppbar.addListener(setZoomVisibility);
    initVideo(false);
  }

  void initVideo(ignoreTagsCheck) {
    // viewController..outputStateStream.listen(onViewStateChanged);
    scaleController..outputScaleStateStream.listen(onScaleStateChanged);
    cacheMode = widget.settingsHandler.videoCacheMode;

    // load thumbnail preview
    getThumbnail();

    List<List<String>> hatedAndLovedTags = widget.settingsHandler.parseTagsList(widget.booruItem.tagsList, isCapped: true);
    if (hatedAndLovedTags[0].length > 0 && !ignoreTagsCheck) {
      isHated = true;
      thumbnailBlur = 20;
      killLoading(['Contains Hated tags:', ...hatedAndLovedTags[0]]);
    } else {
      _downloadVideo();
    }
  }

  void getThumbnail() async {
    String thumbnailFileURL = widget.booruItem.thumbnailURL; // sample can be a video
    // widget.settingsHandler.previewMode == "Sample"
    //     ? widget.booruItem.sampleURL
    //     : widget.booruItem.thumbnailURL;
    String? previewPath = await imageWriter.getCachePath(thumbnailFileURL, 'thumbnails',widget.settingsHandler);
    File? preview = previewPath != null ? File(previewPath) : null;

    if (preview != null){
      thumbProvider = ResizeImage(MemoryImage(await preview.readAsBytes()), width: 4096); // FileImage(preview);
    } else {
      thumbProvider = NetworkImage(thumbnailFileURL);
    }
    setState(() { });
  }

  void killLoading(List<String> reason) {
    disposables();

    setState(() {
      _total = 0;
      _received = 0;

      _prevReceivedAmount = 0;
      _lastReceivedAmount = 0;
      _lastReceivedTime = 0;
      _startedAt = 0;

      isFromCache = false;
      isStopped = true;
      stopReason = reason;

      _video = null;
    });
  }
  @override
  void dispose() {
    disposables();
    super.dispose();
  }

  void disposables() {
    thumbProvider?.evict();
    _debounceBytes?.cancel();
    _checkInterval?.cancel();

    _videoController?.setVolume(0);
    _videoController?.pause();
    _videoController?.dispose();
    _chewieController?.dispose();

    widget.searchGlobals.displayAppbar.removeListener(setZoomVisibility);

    if (!(_dioCancelToken != null && _dioCancelToken!.isCancelled)){
      _dioCancelToken?.cancel();
    }
    // _client?.close(force: true);
  }


  // debug functions
  void onScaleStateChanged(PhotoViewScaleState scaleState) {
    print(scaleState);

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
    viewController.scale = 2;
    // scaleController.scaleState = PhotoViewScaleState.originalSize;
    setState(() { });
  }

  void setZoomVisibility() {
    isZoomButtonVisible = widget.searchGlobals.displayAppbar.value;
    setState(() { });
  }

  Widget zoomButtonBuild() {
    if(isZoomButtonVisible && (_videoController != null && _videoController!.value.isInitialized)) {
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

  void _updateState() {
    // print(_videoController?.value);
    // setState(() {
    //   _latestValue = _videoController?.value;
    // });
    if(_chewieController == null) return;

    isFullscreen.value = _chewieController!.isFullScreen;
    if(widget.searchGlobals.viewedIndex.value == widget.index) {
      if(_chewieController!.isFullScreen || !widget.settingsHandler.useVolumeButtonsForScroll) {
        ServiceHandler.setVolumeButtons(true); // in full screen or volumebuttons scroll setting is disabled
      } else {
        ServiceHandler.setVolumeButtons(widget.searchGlobals.displayAppbar.value); // same as app bar value
      }
    }
  }


  Future<void> initPlayer() async {
    // Start from cache if was already cached or only caching is allowed
    // mixWithOthers: true, allows to not interrupt audio sources from other apps
    if(_video != null) { // if (widget.settingsHandler.mediaCache || _video != null) {
      _videoController = VideoPlayerController.file(
        _video!,
        videoPlayerOptions: Platform.isAndroid ? VideoPlayerOptions(mixWithOthers: true) : null,
      );
    } else {
      // Otherwise load from network
      _videoController = VideoPlayerController.network(
        widget.booruItem.fileURL,
        videoPlayerOptions: Platform.isAndroid ? VideoPlayerOptions(mixWithOthers: true) : null,
        httpHeaders: ViewUtils.getFileCustomHeaders(widget.searchGlobals, checkForReferer: true),
      );
    }
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
      showControlsOnInitialize: widget.searchGlobals.displayAppbar.value,
      customControls:
        widget.settingsHandler.galleryBarPosition == 'Bottom'
          ? HideableControlsPadding(widget.searchGlobals, isFullscreen, LoliControls(settingsHandler:widget.settingsHandler))
          : LoliControls(settingsHandler:widget.settingsHandler),
        // MaterialControls(),
        // CupertinoControls(
        //   backgroundColor: Color.fromRGBO(41, 41, 41, 0.7),
        //   iconColor: Color.fromARGB(255, 200, 200, 200)
        // ),
      materialProgressColors: ChewieProgressColors(
        playedColor: Theme.of(context).colorScheme.primary,
        handleColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.white,
      ),
      placeholder: Container(
        color: Colors.black,
      ),
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
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
    setState(() {});
  }

  /// Author: [Nani-Sore] ///
  Widget loadingElementBuilder() {
    bool hasProgressData = widget.settingsHandler.mediaCache && _total > 0;
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
        : 'Loading${isFromCache ? ' from cache' : ''}...';
    String filesizeText = hasProgressData ? ('$loadedSize / $expectedSize') : '';

    // start opacity from 20%
    double opacityValue = hasProgressData
        ? 0.2 + 0.8 * lerpDouble(0.0, 1.0, percentDone ?? 0.66)!
        : 0.66;

    return Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: thumbProvider != null
            ? DecorationImage(
              image: thumbProvider!,
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(opacityValue), BlendMode.dstATop)
            )
            : null,
        ),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: thumbnailBlur, sigmaY: thumbnailBlur),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: LinearProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.pink[300]!),
                          value: percentDone),
                    ),
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.settingsHandler.loadingGif
                          ? [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  constraints: BoxConstraints(minWidth: 10, maxWidth: 300),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/loading.gif'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ]
                          : (isStopped
                            ? [
                                ...stopReason.map((reason){
                                  return BorderedText(
                                    child: Text(
                                      reason,
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    )
                                  );
                                }),
                                TextButton.icon(
                                  icon: Icon(Icons.play_arrow, size: 44),
                                  label: BorderedText(
                                    child: Text(
                                      isHated ? 'Load Anyway' : 'Restart Loading',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    )
                                  ),
                                  onPressed: () {
                                    setState(() { initVideo(true); });
                                  },
                                ),
                              ]
                            : [
                              if(percentDoneText != '')
                                BorderedText(
                                  child: Text(
                                    percentDoneText,
                                    style: TextStyle(
                                      fontSize: 28,
                                    ),
                                  )
                                ),
                              if(filesizeText != '')
                                BorderedText(
                                  child: Text(
                                    filesizeText,
                                    style: TextStyle(
                                      fontSize: 24,
                                    ),
                                  )
                                ),
                              if(expectedSpeedText != '')
                                BorderedText(
                                  child: Text(
                                    expectedSpeedText,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  )
                                ),
                              if(expectedTimeText != '')
                                BorderedText(
                                  child: Text(
                                    expectedTimeText,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  )
                                ),
                              if(sinceStartText != '')
                                BorderedText(
                                  child: Text(
                                    sinceStartText,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  )
                                ),
                              const SizedBox(height: 10),
                              if(widget.settingsHandler.mediaCache && cacheMode != 'Stream')
                                TextButton.icon(
                                  icon: Icon(Icons.stop, size: 44, color: Colors.red),
                                  label: BorderedText(
                                    child: Text(
                                      'Stop Loading',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.red,
                                      ),
                                    )
                                  ),
                                  onPressed: () {
                                    killLoading(['Stopped by User']);
                                  },
                                ),
                            ]
                          )
                  ),
                  SizedBox(
                    width: 10,
                    child: RotatedBox(
                      quarterTurns: percentDone != null ? -1 : 1,
                      child: LinearProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.pink[300]!),
                          value: percentDone),
                    ),
                  ),
                ],
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    int viewedIndex = widget.searchGlobals.viewedIndex.value;
    bool isViewed = viewedIndex == widget.index;
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
        if (widget.settingsHandler.autoPlayEnabled) {
          // autoplay if viewed and setting is enabled
          _videoController!.play();
        }
        if (widget.settingsHandler.videoAutoMute){
          _videoController!.setVolume(0);
        }
      } else {
        _videoController!.pause();
      }
    }

    if(needsRestart) {
      _lastViewedIndex = viewedIndex;
    }

    // TODO move controls outside of chewie, to exclude them from zoom

    return Hero(
      tag: 'imageHero' + (isViewed ? '' : 'ignore') + widget.index.toString(),
      child: Material(
        child: Stack(
          children: [
            PhotoView.customChild(
              child: initialized ? Chewie(controller: _chewieController!) : loadingElementBuilder(),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 8,
              initialScale: PhotoViewComputedScale.contained,
              enableRotation: false,
              basePosition: Alignment.center,
              controller: viewController,
              // tightMode: true,
              // heroAttributes: PhotoViewHeroAttributes(tag: 'imageHero' + (widget.searchGlobals.viewedIndex.value == widget.index ? '' : 'ignore') + widget.index.toString()),
              scaleStateController: scaleController,
            ),

            zoomButtonBuild(),
          ]
        )
      )
    );
  }
}
