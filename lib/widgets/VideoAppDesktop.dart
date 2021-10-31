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
import 'package:dart_vlc/dart_vlc.dart';

import 'package:LoliSnatcher/ViewUtils.dart';
import 'package:LoliSnatcher/widgets/CachedThumbBetter.dart';
import 'package:LoliSnatcher/widgets/DioDownloader.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/ViewerHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/widgets/LoadingElement.dart';

class VideoAppDesktop extends StatefulWidget {
  final BooruItem booruItem;
  final int index;
  final SearchGlobal searchGlobal;
  VideoAppDesktop(Key? key, this.booruItem, this.index, this.searchGlobal) : super(key: key);
  @override
  _VideoAppDesktopState createState() => _VideoAppDesktopState();
}

class _VideoAppDesktopState extends State<VideoAppDesktop> {
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final SearchHandler searchHandler = Get.find<SearchHandler>();
  final ViewerHandler viewerHandler = Get.find<ViewerHandler>();

  PhotoViewScaleStateController scaleController = PhotoViewScaleStateController();
  PhotoViewController viewController = PhotoViewController();
  Player? _videoController;
  Media? media;

  Timer? _firstViewFixDelay;

  RxInt _total = 0.obs, _received = 0.obs, _startedAt = 0.obs;
  int _lastViewedIndex = -1;
  bool isFromCache = false, isStopped = false, firstViewFix = false, isZoomed = false;
  List<String> stopReason = [];

  CancelToken? _dioCancelToken;
  DioLoader? client;
  File? _video;

  @override
  void didUpdateWidget(VideoAppDesktop oldWidget) {
    // force redraw on item data change
    if(oldWidget.booruItem != widget.booruItem) {
      // reset stuff here
      firstViewFix = false;
      resetZoom();
      switch (settingsHandler.videoCacheMode) {
        case 'Cache':
          // TODO load video in bg without destroying the player object, then replace with a new one
          killLoading([]);
          initVideo(false);
          break;

        case 'Stream+Cache':
          changeNetworkVideo();
          break;

        case 'Stream':
        default:
          changeNetworkVideo();
          break;
      }
      updateState();
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<void> _downloadVideo() async {
    isStopped = false;
    _startedAt.value = DateTime.now().millisecondsSinceEpoch;

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
        if(_videoController == null) {
          _firstViewFixDelay?.cancel();
          _firstViewFixDelay = Timer(
            Duration(milliseconds: 300),
            () {
              initPlayer();
              updateState();
            }
          );
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
    // bool isAllowedToRestate = settingsHandler.videoCacheMode == 'Cache' || _video == null;

    _received.value = received;
    _total.value = total;
    if (total > 0 && widget.booruItem.fileSize == null) {
      // set item file size if it wasn't received from api
      widget.booruItem.fileSize = total;
      // if(isAllowedToRestate) updateState();
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

    _videoController?.pause();
    _videoController?.dispose();
    _video = null;
    media = null;

    _total.value = 0;
    _received.value = 0;
    _startedAt.value = 0;

    isFromCache = false;
    isStopped = true;
    stopReason = reason;

    firstViewFix = false;

    resetZoom();

    updateState();
  }

  @override
  void dispose() {
    disposables();
    viewerHandler.removeViewed(widget.key);
    super.dispose();
  }

  void disposeClient() {
    client?.dispose();
    client = null;
  }

  void disposables() {
    _firstViewFixDelay?.cancel();

    // _videoController?.setVolume(0);
    _videoController?.pause();
    _videoController?.dispose();
    _videoController = null;

    if (!(_dioCancelToken != null && _dioCancelToken!.isCancelled)){
      _dioCancelToken?.cancel();
    }
    disposeClient();
  }


  // debug functions
  void onScaleStateChanged(PhotoViewScaleState scaleState) {
    // print(scaleState);

    isZoomed = scaleState == PhotoViewScaleState.zoomedIn || scaleState == PhotoViewScaleState.covering || scaleState == PhotoViewScaleState.originalSize;
    viewerHandler.setZoomed(widget.key, isZoomed);
  }

  void onViewStateChanged(PhotoViewControllerValue viewState) {
    // print(viewState);
  }

  void resetZoom() {
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
    viewController.scale = 2;
    // scaleController.scaleState = PhotoViewScaleState.originalSize;
  }

  Future<void> changeNetworkVideo() async {
    if(_video != null) { // if (settingsHandler.mediaCache || _video != null) {
      // Start from cache if was already cached or only caching is allowed
      media = Media.file(
        _video!,
        startTime: Duration(milliseconds: 100),
      );
    } else {
      // Otherwise load from network
      // print('uri: ${widget.booruItem.fileURL}');
      media = Media.network(
        widget.booruItem.fileURL,
        extras: ViewUtils.getFileCustomHeaders(widget.searchGlobal, checkForReferer: true),
        startTime: Duration(milliseconds: 100),
      );
    }
    _videoController!.open(
      media!,
      autoStart: settingsHandler.autoPlayEnabled,
    );
  }

  Future<void> initPlayer() async {
    if(_video != null) { // if (settingsHandler.mediaCache || _video != null) {
      // Start from cache if was already cached or only caching is allowed
      media = Media.file(
        _video!,
        startTime: Duration(milliseconds: 100),
      );
    } else {
      // Otherwise load from network
      //print('uri: ${widget.booruItem.fileURL}');
      media = Media.network(
        widget.booruItem.fileURL,
        extras: ViewUtils.getFileCustomHeaders(widget.searchGlobal, checkForReferer: true),
        startTime: Duration(milliseconds: 100),
      );
    }
    _videoController = Player(id: widget.index);
    _videoController!.setUserAgent(ViewUtils.getFileCustomHeaders(widget.searchGlobal, checkForReferer: false).entries.first.value);
    _videoController!.setVolume(viewerHandler.videoVolume);
    _videoController!.open(
      media!,
      autoStart: settingsHandler.autoPlayEnabled,
    );

    _videoController!.playbackStream.listen((PlaybackState state) {
      // dart_vlc has loop logic integrated into playlists, but it is not working?
      // this will force restart videos on completion
      if(state.isCompleted && state.isPlaying) {
        _videoController!.play();
      }
    });

    
    _videoController!.generalStream.listen((GeneralState state) {
      viewerHandler.videoVolume = state.volume;
    });

    // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    updateState();
  }

  @override
  Widget build(BuildContext context) {
    int viewedIndex = widget.searchGlobal.viewedIndex.value;
    final bool isViewed = settingsHandler.appMode == 'Mobile'
      ? widget.searchGlobal.viewedIndex.value == widget.index
      : widget.searchGlobal.currentItem.value.fileURL == widget.booruItem.fileURL;
    bool initialized = _videoController != null;

    // protects from video restart when something forces restate here while video is active (example: favoriting from appbar)
    bool needsRestart = _lastViewedIndex != viewedIndex;

    if (!isViewed) {
      // reset zoom if not viewed
      resetZoom();
    } else {
      viewerHandler.setCurrent(widget.key);
    }

    if (initialized) {
      if (isViewed) {
        // Reset video time if came into view
        if(needsRestart) {
          _videoController!.seek(Duration.zero);
        }

        // TODO managed to fix videos starting, but needs more fixing to make sure everything is okay
        // if (settingsHandler.autoPlayEnabled) {
        //   // autoplay if viewed and setting is enabled
        //   // if(!firstViewFix) {
        //   //   // crutch to fix video feed not working after changing videos
        //   //   _firstViewFixDelay?.cancel();
        //   //   _firstViewFixDelay = Timer(
        //   //     Duration(milliseconds: 400),
        //   //     () {
        //   //       print('first view fix ${widget.booruItem.fileURL}');
        //   //       _videoController!.seek(Duration(milliseconds: 100));
        //   //       _videoController!.play();
        //   //       firstViewFix = true;
        //   //     }
        //   //   );
        //   // } else {
        //     _videoController!.play();
        //   // }
        // } else {
        //   _videoController!.pause();
        // }

        // if (viewerHandler.videoAutoMute){
        //   _videoController!.setVolume(0);
        // }
      } else {
        // _videoController!.pause();
      }
    }

    if(needsRestart) {
      _lastViewedIndex = viewedIndex;
    }

    // print('!!! Build video desktop !!!');

    // TODO move controls outside, to exclude them from zoom

    return Hero(
      tag: 'imageHero' + (isViewed ? '' : 'ignore') + widget.index.toString(),
      child: Material(
        child: Listener(
          onPointerSignal: (pointerSignal) {
            if(pointerSignal is PointerScrollEvent) {
              scrollZoomImage(pointerSignal.scrollDelta.dy);
            }
          },
          child: PhotoView.customChild(
            child: initialized
              ? Video(
                  player: _videoController,
                  scale: 1.0,
                  showControls: true,
                  progressBarInactiveColor: Colors.grey,
                  progressBarActiveColor: Get.theme.colorScheme.secondary,
                  progressBarThumbColor: Get.theme.colorScheme.secondary,
                  volumeThumbColor: Get.theme.colorScheme.secondary,
                  volumeActiveColor: Get.theme.colorScheme.secondary,
                )
              : Stack(children: [
                  CachedThumbBetter(widget.booruItem, widget.index, widget.searchGlobal, 1, false),
                  LoadingElement(
                    item: widget.booruItem,
                    hasProgress: settingsHandler.mediaCache && settingsHandler.videoCacheMode != 'Stream',
                    isFromCache: isFromCache,
                    isDone: initialized,
                    isStopped: isStopped,
                    stopReasons: stopReason,
                    isViewed: isViewed,
                    total: _total,
                    received: _received,
                    startedAt: _startedAt,
                    startAction: () {
                      initVideo(true);
                      updateState();
                    },
                    stopAction: () {
                      killLoading(['Stopped by User']);
                    },
                  ),
                ]),
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
      )
    );
  }
}
