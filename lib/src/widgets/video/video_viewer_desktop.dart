import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:photo_view/photo_view.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/constants.dart';
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

  Player? player;
  VideoController? controller;
  Media? media;

  final RxInt _total = 0.obs, _received = 0.obs, _startedAt = 0.obs;
  int _lastViewedIndex = -1;
  int isTooBig = 0; // 0 = not too big, 1 = too big, 2 = too big, but allow downloading
  bool isFromCache = false, isStopped = false, isViewed = false, isZoomed = false, isLoaded = false, didAutoplay = false;
  List<String> stopReason = [];

  StreamSubscription? indexListener;

  CancelToken? _cancelToken, _sizeCancelToken;
  DioDownloader? client, sizeClient;
  File? _video;

  Color get accentColor => Theme.of(context).colorScheme.secondary;

  @override
  void didUpdateWidget(VideoViewerDesktop oldWidget) {
    // force redraw on item data change
    if (oldWidget.booruItem != widget.booruItem) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // reset stuff here
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
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<void> _downloadVideo() async {
    isStopped = false;
    _startedAt.value = DateTime.now().millisecondsSinceEpoch;

    if (!settingsHandler.mediaCache) {
      // Media caching disabled - don't cache videos
      unawaited(initPlayer());
      unawaited(getSize());
      return;
    }
    switch (settingsHandler.videoCacheMode) {
      case 'Cache':
        // Cache to device from custom request
        break;

      case 'Stream+Cache':
        // Load and stream from default player network request, cache to device from custom request
        // TODO: change video handler to allow viewing and caching from single network request
        unawaited(initPlayer());
        break;

      case 'Stream':
      default:
        // Only stream, notice the return
        unawaited(initPlayer());
        unawaited(getSize());
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
      fileNameExtras: widget.booruItem.fileNameExtras,
    );
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
      fileNameExtras: widget.booruItem.fileNameExtras,
    );
    unawaited(sizeClient!.runRequestSize());
    return;
  }

  void onSize(int size) {
    // TODO find a way to stop loading based on size when caching is enabled
    const int maxSize = 1024 * 1024 * 200;
    // print('onSize: $size $maxSize ${size > maxSize}');
    if (size == 0) {
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
    if (error is DioException && CancelToken.isCancel(error)) {
      // print('Canceled by user: $imageURL | $error');
    } else {
      if (error is DioException) {
        killLoading([
          'Loading Error: ${error.type.name}',
          if (error.response?.statusCode != null) '${error.response?.statusCode} - ${error.response?.statusMessage}',
        ]);
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

    viewController.outputStateStream.listen(onViewStateChanged);
    scaleController.outputScaleStateStream.listen(onScaleStateChanged);

    isViewed = settingsHandler.appMode.value.isMobile
        ? searchHandler.viewedIndex.value == searchHandler.getItemIndex(widget.booruItem)
        : searchHandler.viewedItem.value.fileURL == widget.booruItem.fileURL;
    indexListener = searchHandler.viewedIndex.listen((int value) {
      final bool prevViewed = isViewed;
      final bool isCurrentIndex = value == searchHandler.getItemIndex(widget.booruItem);
      final bool isCurrentItem = searchHandler.viewedItem.value.fileURL == widget.booruItem.fileURL;
      if (settingsHandler.appMode.value.isMobile ? isCurrentIndex : isCurrentItem) {
        isViewed = true;
      } else {
        didAutoplay = false;
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
    if (mounted) {
      setState(() {});
    }
  }

  void initVideo(bool ignoreTagsCheck) {
    if (widget.booruItem.isHated && !ignoreTagsCheck) {
      final tagsData = settingsHandler.parseTagsList(widget.booruItem.tagsList, isCapped: true);
      killLoading(['Contains Hated tags:', ...tagsData.hatedTags]);
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
    player?.pause();
    player?.dispose();

    if (!(_cancelToken != null && _cancelToken!.isCancelled)) {
      _cancelToken?.cancel();
    }
    if (!(_sizeCancelToken != null && _sizeCancelToken!.isCancelled)) {
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
    viewerHandler.setViewValue(widget.key, viewState);
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
    if (lowerLimit == 0.75 && value < 0) {
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
    if (_video != null) {
      // Start from cache if was already cached or only caching is allowed
      media = Media(
        _video!.path,
      );
    } else {
      // Otherwise load from network
      media = Media(
        // widget.booruItem.fileURL,
        Uri.encodeFull(widget.booruItem.fileURL),
        httpHeaders: await Tools.getFileCustomHeaders(searchHandler.currentBooru, checkForReferer: true),
      );
    }

    await player!.open(
      media!,
      play: settingsHandler.autoPlayEnabled && isViewed,
    );
  }

  Future<void> initPlayer() async {
    if (_video != null) {
      // Start from cache if was already cached or only caching is allowed
      media = Media(
        _video!.path,
      );
    } else {
      // Otherwise load from network
      media = Media(
        Uri.encodeFull(widget.booruItem.fileURL),
        httpHeaders: await Tools.getFileCustomHeaders(searchHandler.currentBooru, checkForReferer: true),
      );
    }

    player = Player(
      configuration: PlayerConfiguration(
        muted: settingsHandler.startVideosMuted,
        ready: () {
          isLoaded = true;
          updateState();
        },
      ),
    );
    await player!.setPlaylistMode(PlaylistMode.loop);
    controller = VideoController(
      player!,
      configuration: const VideoControllerConfiguration(
        enableHardwareAcceleration: true,
        vo: 'mediacodec_embed',
        hwdec: 'mediacodec',
      ),
    );

    player!.stream.error.listen((String error) {
      if (error.isNotEmpty) {
        killLoading(['Error:', error]);
      }
    });

    await player!.open(
      media!,
      play: settingsHandler.autoPlayEnabled && isViewed,
    );

    // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    updateState();
  }

  MaterialDesktopVideoControlsThemeData get _controlsTheme {
    return MaterialDesktopVideoControlsThemeData(
      seekBarPositionColor: accentColor,
      seekBarThumbColor: accentColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool initialized = player != null && controller != null && isLoaded;

    // protects from video restart when something forces restate here while video is active (example: favoriting from appbar)
    final int viewedIndex = searchHandler.viewedIndex.value;
    final bool needsRestart = _lastViewedIndex != viewedIndex;

    if (initialized) {
      if (isViewed) {
        // Reset video time if came into view
        if (needsRestart) {
          player?.seek(Duration.zero);
        }

        if (!didAutoplay) {
          if (settingsHandler.autoPlayEnabled) {
            // autoplay if viewed and setting is enabled
            player?.play();
          } else {
            player?.pause();
          }
          didAutoplay = true;
        }

        if (viewerHandler.videoAutoMute) {
          player?.setVolume(0);
        }
      } else {
        player?.pause();
      }
    }

    if (needsRestart) {
      _lastViewedIndex = viewedIndex;
    }

    const double fullOpacity = Constants.imageDefaultOpacity;

    // TODO move controls outside, to exclude them from zoom

    return Hero(
      tag: 'imageHero${isViewed ? '' : '-ignore-'}${widget.booruItem.hashCode}',
      child: Material(
        child: Listener(
          onPointerSignal: (pointerSignal) {
            if (pointerSignal is PointerScrollEvent) {
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
            enableDoubleTapZoom: false,
            enableTapDragZoom: false,
            child: Stack(
              children: [
                Thumbnail(
                  item: widget.booruItem,
                  isStandalone: false,
                ),
                MediaLoading(
                  item: widget.booruItem,
                  hasProgress: settingsHandler.mediaCache && settingsHandler.videoCacheMode != 'Stream',
                  isFromCache: isFromCache,
                  isDone: initialized,
                  isTooBig: isTooBig > 0,
                  isStopped: isStopped,
                  stopReasons: stopReason,
                  isViewed: isViewed,
                  total: _total,
                  received: _received,
                  startedAt: _startedAt,
                  startAction: () {
                    if (isTooBig == 1) {
                      isTooBig = 2;
                    }
                    initVideo(true);
                    updateState();
                  },
                  stopAction: () {
                    killLoading(['Stopped by User']);
                  },
                ),
                if (isViewed && initialized)
                  Opacity(
                    opacity: fullOpacity,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
                      child: MaterialDesktopVideoControlsTheme(
                        normal: _controlsTheme,
                        fullscreen: _controlsTheme,
                        child: Video(
                          controller: controller!,
                          filterQuality: FilterQuality.medium,
                          controls: MaterialDesktopVideoControls,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
