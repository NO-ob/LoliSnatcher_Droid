import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//import 'package:dart_vlc/dart_vlc.dart';

import 'package:media_kit/media_kit.dart'; 
import 'package:media_kit_video/media_kit_video.dart';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

import 'package:path/path.dart' as path;

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/services/dio_downloader.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/media_loading.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail.dart';

class VideoViewerDesktop extends StatefulWidget {
  const VideoViewerDesktop(this.booruItem, {super.key});

  final BooruItem booruItem;

  @override
  State<VideoViewerDesktop> createState() => VideoViewerDesktopState();
}

class VideoViewerDesktopState extends State<VideoViewerDesktop> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;
  final ViewerHandler viewerHandler = ViewerHandler.instance;

  PhotoViewScaleStateController scaleController = PhotoViewScaleStateController();
  PhotoViewController viewController = PhotoViewController();
  
  //final player = Player();
  Player? player;
  VideoController? controller;
  //  configuration: PlayerConfiguration(
  //    title: 'Lolisnatcher',
  //  ),
  //);
  final configuration = ValueNotifier<VideoControllerConfiguration>(
    const VideoControllerConfiguration(enableHardwareAcceleration: true),
  );
  //late final VideoController controller = VideoController(
  //  player!,
  //  configuration: configuration.value,
  //);

  Media? media;

  final RxInt _total = 0.obs, _received = 0.obs, _startedAt = 0.obs;
  int _lastViewedIndex = -1;
  int isTooBig = 0; // 0 = not too big, 1 = too big, 2 = too big, but allow downloading
  bool isFromCache = false, isStopped = false, firstViewFix = false, isViewed = false, isZoomed = false, isLoaded = false;
  List<String> stopReason = [];

  StreamSubscription? indexListener;

  CancelToken? _cancelToken, _sizeCancelToken;
  DioDownloader? client, sizeClient;
  File? _video;


  Color get accentColor => Theme.of(context).colorScheme.secondary;

  @override
  void didUpdateWidget(VideoViewerDesktop oldWidget) {
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
      getSize();
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
        getSize();
        return;
    }

    _cancelToken = CancelToken();
    client = DioDownloader(
      widget.booruItem.fileURL,
      headers: await Tools.getFileCustomHeaders(searchHandler.currentBooru, checkForReferer: true),
      cancelToken: _cancelToken,
      onProgress: _onBytesAdded,
      onEvent: _onEvent,
      onError: _onError,
      onDoneFile: (File file) async {
        _video = file;
        // save video from cache, but restate only if player is not initialized yet
        if (player == null && !isLoaded) {
          unawaited(initPlayer());
          updateState();
        }
      },
      cacheEnabled: settingsHandler.mediaCache,
      cacheFolder: 'media',
      fileNameExtras: widget.booruItem.fileNameExtras
    );
    // client!.runRequest();
    unawaited(client!.runRequest());
    return;
  }

  Future<void> getSize() async {
    _sizeCancelToken = CancelToken();
    sizeClient = DioDownloader(
      widget.booruItem.fileURL,
      headers: await Tools.getFileCustomHeaders(searchHandler.currentBooru, checkForReferer: true),
      cancelToken: _sizeCancelToken,
      onEvent: _onEvent,
      fileNameExtras: widget.booruItem.fileNameExtras
    );
    sizeClient!.runRequestSize();
    return;
  }

  void onSize(int size) {
    // TODO find a way to stop loading based on size when caching is enabled
    const int maxSize = 1024 * 1024 * 200;
    // print('onSize: $size $maxSize ${size > maxSize}');
    if(size == 0) {
      killLoading(['File is zero bytes']);
    } else if ((size > maxSize) && isTooBig != 2) {
      // TODO add check if resolution is too big
      isTooBig = 1;
      killLoading(['File is too big', 'File size: ${Tools.formatBytes(size, 2)}', 'Limit: ${Tools.formatBytes(maxSize, 2)}']);
    }

    if (size > 0 && widget.booruItem.fileSize == null) {
      // set item file size if it wasn't received from api
      widget.booruItem.fileSize = size;
      // if(isAllowedToRestate) updateState();
    }
  }

  void _onBytesAdded(int received, int total) {
    // bool isAllowedToRestate = settingsHandler.videoCacheMode == 'Cache' || _video == null;

    _received.value = received;
    _total.value = total;
    onSize(total);
  }

  void _onEvent(String event, dynamic data) {
    switch (event) {
      case 'loaded':
        // 
        break;
      case 'size':
        onSize(data as int);
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
      if(error is DioError) {
        killLoading(['Loading Error: ${error.message}']);
      } else {
        killLoading(['Loading Error: $error']);
      }
      // print('Dio request cancelled: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    viewerHandler.addViewed(widget.key);

    viewController..outputStateStream.listen(onViewStateChanged);
    scaleController..outputScaleStateStream.listen(onScaleStateChanged);

    isViewed = settingsHandler.appMode.value.isMobile
        ? searchHandler.viewedIndex.value == searchHandler.getItemIndex(widget.booruItem)
        : searchHandler.viewedItem.value.fileURL == widget.booruItem.fileURL;
      //? searchHandler.viewedIndex.value == widget.index
      //: searchHandler.viewedItem.value.fileURL == widget.booruItem.fileURL; //rebase

    indexListener = searchHandler.viewedIndex.listen((int value) {
      final bool prevViewed = isViewed;
      final bool isCurrentIndex = value == searchHandler.getItemIndex(widget.booruItem);
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

    initVideo(false);
  }

  void updateState() {
    if(mounted) {
      //final controller = VideoController.create(controller.handle);
      setState(() { });
    }
  }

  void initVideo(bool ignoreTagsCheck) {
    if (widget.booruItem.isHated.value && !ignoreTagsCheck) {
      List<List<String>> hatedAndLovedTags = settingsHandler.parseTagsList(widget.booruItem.tagsList, isCapped: true);
      killLoading(['Contains Hated tags:', ...hatedAndLovedTags[0]]);
    } else {
      _downloadVideo();
    }
  }

  void killLoading(List<String> reason) {
    disposables();

    _video = null;
    media = null;

    _total.value = 0;
    _received.value = 0;
    _startedAt.value = 0;

    isLoaded = false;
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

    indexListener?.cancel();
    indexListener = null;

    viewerHandler.removeViewed(widget.key);
    super.dispose();
  }

  void disposeClient() {
    client?.dispose();
    client = null;
    sizeClient?.dispose();
    sizeClient = null;
  }

  void disposables() {
    // controller?.setVolume(0);
    player?.pause();
    player?.dispose();
    //controller = null;

    if (!(_cancelToken != null && _cancelToken!.isCancelled)){
      _cancelToken?.cancel();
    }
    if (!(_sizeCancelToken != null && _sizeCancelToken!.isCancelled)){
      _sizeCancelToken?.cancel();
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
    viewerHandler.setViewState(widget.key, viewState);
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
    if(_video != null) { 
      // if (settingsHandler.mediaCache || _video != null) {
      // Start from cache if was already cached or only caching is allowed
      media = Media(
        _video!.path,
      );
    } else {
      // Otherwise load from network
      // print('uri: ${widget.booruItem.fileURL}');
      media = Media(
        //widget.booruItem.fileURL,
        Uri.encodeFull(widget.booruItem.fileURL),

      );
    }
    isLoaded = true;

    await player?.open(
      media!,
      play: settingsHandler.autoPlayEnabled,
      );
  }

  Future<void> initPlayer() async {
    if(_video != null) { 
      print(_video!.path);  // if (settingsHandler.mediaCache || _video != null) {
      // Start from cache if was already cached or only caching is allowed
      media = Media(
        _video!.path,
      );
    } else {
      print(widget.booruItem.fileURL);
      // Otherwise load from network
      // print('uri: ${widget.booruItem.fileURL}');
      media = Media(
        Uri.encodeFull(widget.booruItem.fileURL),
      );
    }
    isLoaded = true;

    //final player = Player(
    //  configuration: PlayerConfiguration(
    //    title: 'Lolisnatcher',
    //   ),
    //);
    player = Player();
    controller = VideoController(
      player!,
      configuration: configuration.value,
    );
    //await player.setPlaylistMode(PlaylistMode.single); //TODO: this needs to be toggleable

    updateState();
    
  }

  @override
  Widget build(BuildContext context) {
    // print('!!! Build video desktop ${widget.index}!!!');
    
    bool initialized = isLoaded; // controller != null;

    // protects from video restart when something forces restate here while video is active (example: favoriting from appbar)
    int viewedIndex = searchHandler.viewedIndex.value;
    bool needsRestart = _lastViewedIndex != viewedIndex;

    if (initialized) {
      if (isViewed) {
        // Reset video time if came into view
        if(needsRestart) {
          player?.seek(Duration.zero);
        }

        if(!firstViewFix) {
          player?.open(
              media!,
              play: settingsHandler.autoPlayEnabled,
              );
          //player.open(
          //  Playlist(
          //    [
          //    media!//,
          //    //autoStart: settingsHandler.autoPlayEnabled,
          //    ],
          //  ),
          //);
          firstViewFix = true;
        }

        // TODO managed to fix videos starting, but needs more fixing to make sure everything is okay
        if (settingsHandler.autoPlayEnabled) {
          // autoplay if viewed and setting is enabled
            player?.play();
        } else {
          player?.pause();
        }

        //if (viewerHandler.videoAutoMute) {
        //  controller!.volume = 0;
        //}
      } else {
        player?.pause();
      }
    }

    if(needsRestart) {
      _lastViewedIndex = viewedIndex;
    }

    // TODO move controls outside, to exclude them from zoom

    return Hero(
      tag: 'imageHero${isViewed ? '' : '-ignore-'}${searchHandler.getItemIndex(widget.booruItem)}#${widget.booruItem.fileURL}',
      //tag: 'imageHero${isViewed ? '' : 'ignore'}${widget.index}', //rebase
      child: Material(
        child: Listener(
          onPointerSignal: (pointerSignal) {
            if(pointerSignal is PointerScrollEvent) {
              scrollZoomImage(pointerSignal.scrollDelta.dy);
            }
          },
          child: PhotoView.customChild(
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 8,
            initialScale: PhotoViewComputedScale.contained,
            enableRotation: false,
            basePosition: Alignment.center,
            controller: viewController,
            // tightMode: true,
            scaleStateController: scaleController,
            child: Stack(
              children: [
                Thumbnail(
                  item: widget.booruItem,
                  isStandalone: false,
                  ignoreColumnsCount: true,
                ),
                MediaLoading(
                  item: widget.booruItem,
                  hasProgress: settingsHandler.mediaCache && settingsHandler.videoCacheMode != 'Stream',
                  isFromCache: isFromCache,
                  isDone: initialized && firstViewFix,
                  isTooBig: isTooBig > 0,
                  isStopped: isStopped,
                  stopReasons: stopReason,
                  isViewed: isViewed,
                  total: _total,
                  received: _received,
                  startedAt: _startedAt,
                  startAction: () {
                    if(isTooBig == 1) {
                      isTooBig = 2;
                    }
                    initVideo(true);
                    updateState();
                  },
                  stopAction: () {
                    killLoading(['Stopped by User']);
                  },
                ),

                if(isViewed && initialized)
                  Video(
                    controller: controller!,
                    controls: MaterialDesktopVideoControls,
                  ),
              ],
            ),
          )
        )
      )
    );
  }
}
