import 'dart:io';
import 'dart:ui';
import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ImageWriter.dart';
import 'package:LoliSnatcher/Tools.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/widgets/LoliControls.dart';

class VideoApp extends StatefulWidget {
  final BooruItem booruItem;
  final int index;
  final int viewedIndex;
  final SettingsHandler settingsHandler;
  VideoApp(this.booruItem, this.index, this.viewedIndex, this.settingsHandler);
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  PhotoViewScaleStateController scaleController = PhotoViewScaleStateController();
  PhotoViewController viewController = PhotoViewController();
  late VideoPlayerController _videoController;
  ChewieController? _chewieController;

  // VideoPlayerValue _latestValue;

  String? cacheMode;
  final ImageWriter imageWriter = ImageWriter();
  int _total = 0, _received = 0;
  int _prevReceivedAmount = 0, _lastReceivedAmount = 0, _lastReceivedTime = 0, _startedAt = 0;
  Timer? _checkInterval, _debounceBytes;
  bool isFromCache = false, isStopped = false;

  Dio? _client;
  CancelToken? _dioCancelToken;
  // Uint8List _totalBytes = Uint8List(0);
  File? _video;

  /// Author: [Nani-Sore] ///
  Future<void> _downloadVideo() async {
    _checkInterval?.cancel();
    _checkInterval = Timer.periodic(new Duration(seconds: 1), (timer) {
      // force restate every second to refresh all timers/indicators, even when loading has stopped
      setState(() {});
    });
    isStopped = false;
    _startedAt = DateTime.now().millisecondsSinceEpoch;

    final String? filePath = await imageWriter.getCachePath(widget.booruItem.fileURL!, 'media');
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
    _client!.get<List<int>>(
      widget.booruItem.fileURL!,
      options: Options(responseType: ResponseType.bytes),
      cancelToken: _dioCancelToken,
      onReceiveProgress: (received, total) {
        _total = total;
        _onBytesAdded(received);
      },
    ).then((value) async {
      // Sometimes stream ends before fully loading, so we require at least 95% loaded to write to cache
      if (value.data != null && _received > (_total * 0.95)) {
        final File? cacheFile = await imageWriter.writeCacheFromBytes(
            widget.booruItem.fileURL!, value.data!, 'media');
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
        //TODO: show error message
        killLoading();
        print('Video load incomplete'); // Throw an error, allow to retry?
      }
      return value;
    }).catchError((e) {
      if (CancelToken.isCancel(e)) {
        // print('Canceled by user: ${widget.booruItem.fileURL} | $e');
      } else {
        killLoading();
        print('Dio request cancelled: $e');
      }
    });
  }

  /// Author: [Nani-Sore] ///
  void _onBytesAdded(int received) {
    // always save incoming bytes, but restate only after [debounceDelay]MS
    const int debounceDelay = 50;
    bool isActive = _debounceBytes?.isActive ?? false;
    bool isAllowedToRestate = cacheMode == 'Cache' || !(_videoController.value.isInitialized);
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
    initVideo();
  }

  void initVideo() {
    // viewController..outputStateStream.listen(onViewStateChanged);
    // scaleController..outputScaleStateStream.listen(onScaleStateChanged);
    cacheMode = widget.settingsHandler.videoCacheMode!;
    _downloadVideo();
  }

  void killLoading() {
    _debounceBytes?.cancel();
    _checkInterval?.cancel();
    _dioCancelToken?.cancel();
    // _client?.close(force: true);

    setState(() {
      _total = 0;
      _received = 0;

      _prevReceivedAmount = 0;
      _lastReceivedAmount = 0;
      _lastReceivedTime = 0;
      _startedAt = 0;

      isFromCache = false;
      isStopped = true;

      _video = null;
    });
  }

  @override
  void dispose() {
    _debounceBytes?.cancel();
    _checkInterval?.cancel();

    _videoController.pause();
    _videoController.dispose();
    _chewieController?.dispose();

    _dioCancelToken?.cancel();
    // _client?.close(force: true);
    super.dispose();
  }


  // debug functions
  void onScaleStateChanged(PhotoViewScaleState scaleState) {
    print(scaleState);
  }

  void onViewStateChanged(PhotoViewControllerValue viewState) {
    print(viewState);
  }

  // void _updateState() {
  //   print(_videoController.value);
  //   setState(() {
  //     _latestValue = _videoController.value;
  //   });
  // }


  Future<void> initPlayer() async {
    // Start from cache if was already cached or only caching is allowed
    // mixWithOthers: true, allows to not interrupt audio sources from other apps
    if (widget.settingsHandler.mediaCache && _video != null) {
      _videoController = VideoPlayerController.file(_video!, videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true));
    } else {
      // Otherwise load from network
      _videoController = VideoPlayerController.network(widget.booruItem.fileURL!, videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true));
    }
    await Future.wait([_videoController.initialize()]);
    // _videoController.addListener(_updateState);

    // Stop force restating loading indicators when video is initialized
    _checkInterval?.cancel();

    // Player wrapper to allow controls, looping...
    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      // autoplay is disabled here, because videos started playing randomly, but videos will still autoplay when in view (see isViewed check later)
      autoPlay: false,
      allowedScreenSleep: false,
      looping: true,
      showControls: true,
      customControls:
        LoliControls(),
        // MaterialControls(),
        // CupertinoControls(
        //   backgroundColor: Color.fromRGBO(41, 41, 41, 0.7),
        //   iconColor: Color.fromARGB(255, 200, 200, 200)
        // ),
      materialProgressColors: ChewieProgressColors(
        playedColor: Get.context!.theme.primaryColor,
        handleColor: Get.context!.theme.primaryColor,
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
    String expectedSpeedText = hasProgressData ? (Tools.formatBytes(expectedSpeed, 1) + '/s') : '';
    double expectedTime = hasProgressData ? ((totalBytes - expectedBytes) / expectedSpeed) : 0;
    String expectedTimeText = (hasProgressData && expectedTime > 0) ? ("~" + expectedTime.toStringAsFixed(1) + " second${expectedTime == 1 ? '' : 's'} left") : '';
    int sinceStart = Duration(milliseconds: nowMils - _startedAt).inSeconds;
    String sinceStartText = "Started " + sinceStart.toString() + " second${sinceStart == 1 ? '' : 's'} ago";

    String percentDoneText = hasProgressData
        ? (percentDone == 1 ? 'Rendering...' : '${(percentDone! * 100).toStringAsFixed(2)}%')
        : 'Loading${isFromCache ? ' from cache' : ''}...';
    String filesizeText = hasProgressData ? ('$loadedSize / $expectedSize') : '';

    String thumbnailFileURL = widget.booruItem.thumbnailURL!; // sample can be a video
    // widget.settingsHandler.previewMode == "Sample"
    //     ? widget.booruItem.sampleURL
    //     : widget.booruItem.thumbnailURL;
    File preview = File(
        "${widget.settingsHandler.cachePath}thumbnails/${thumbnailFileURL.substring(thumbnailFileURL.lastIndexOf("/") + 1)}");
    // start opacity from 20%
    double opacityValue = hasProgressData
        ? 0.2 + 0.8 * lerpDouble(0.0, 1.0, percentDone ?? 0.66)!
        : 0.66;
    // print(widget.settingsHandler.cachePath + "thumbnails/" + thumbnailFileURL.substring(thumbnailFileURL.lastIndexOf("/") + 1));
    // print(opacityValue);


    late ImageProvider provider;
    if (preview.existsSync()){
      provider = FileImage(preview);
    } else {
      provider = NetworkImage(thumbnailFileURL);
    }
    return Container(
        decoration: new BoxDecoration(
          color: Colors.black,
          image: new DecorationImage(
              image: provider,
              fit: BoxFit.contain,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(opacityValue), BlendMode.dstATop)),
        ),
        child: new BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
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
                              Container(
                                  width: MediaQuery.of(context).size.width - 30,
                                  child: Image(image: AssetImage('assets/images/loading.gif')))
                            ]
                          : (isStopped
                            ? [TextButton.icon(
                                icon: Icon(Icons.play_arrow),
                                label: Text('Restart loading', style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  setState(() { initVideo(); });
                                },
                              )]
                            : [
                              Stack(children: [
                                Text(
                                  percentDoneText,
                                  style: TextStyle(
                                    fontSize: 28,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 4
                                      ..color = Colors.black,
                                  ),
                                ),
                                Text(
                                  percentDoneText,
                                  style: TextStyle(
                                    fontSize: 28,
                                  ),
                                ),
                              ]),
                              Stack(children: [
                                Text(
                                  filesizeText,
                                  style: TextStyle(
                                    fontSize: 24,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 4
                                      ..color = Colors.black,
                                  ),
                                ),
                                Text(
                                  filesizeText,
                                  style: TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                              ]),
                              Stack(children: [
                                Text(
                                  expectedSpeedText,
                                  style: TextStyle(
                                    fontSize: 16,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 4
                                      ..color = Colors.black,
                                  ),
                                ),
                                Text(
                                  expectedSpeedText,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ]),
                              Stack(children: [
                                Text(
                                  expectedTimeText,
                                  style: TextStyle(
                                    fontSize: 16,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 4
                                      ..color = Colors.black,
                                  ),
                                ),
                                Text(
                                  expectedTimeText,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ]),
                              Stack(children: [
                                Text(
                                  sinceStartText,
                                  style: TextStyle(
                                    fontSize: 16,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 4
                                      ..color = Colors.black,
                                  ),
                                ),
                                Text(
                                  sinceStartText,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ]),
                              (widget.settingsHandler.mediaCache && cacheMode != 'Stream')
                                ? TextButton.icon(
                                  icon: Icon(Icons.stop),
                                  label: Text('Stop loading', style: TextStyle(color: Colors.white)),
                                  onPressed: killLoading,
                                )
                                : Text('')
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
    bool isViewed = widget.viewedIndex == widget.index;
    bool initialized = _chewieController != null && _chewieController!.videoPlayerController.value.isInitialized;

    if (!isViewed) {
      // reset zoom if not viewed
      setState(() {
        scaleController.scaleState = PhotoViewScaleState.initial;
      });
    }

    if (initialized) {
      if (isViewed) {
        // Reset video time if in view
        _videoController.seekTo(Duration());
        if (widget.settingsHandler.autoPlayEnabled) {
          // autoplay if viewed and setting is enabled
          _videoController.play();
        }
      } else {
        _videoController.pause();
      }
    }

    return initialized
      ? PhotoView.customChild(
          child: Chewie(controller: _chewieController!),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 8,
          initialScale: PhotoViewComputedScale.contained,
          enableRotation: false,
          basePosition: Alignment.center,
          controller: viewController,
          // tightMode: true,
          heroAttributes: PhotoViewHeroAttributes(tag: 'imageHero' + widget.index.toString()),
          scaleStateController: scaleController,
        )
      : loadingElementBuilder();
  }
}
