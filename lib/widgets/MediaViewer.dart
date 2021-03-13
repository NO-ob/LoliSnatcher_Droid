import 'dart:io';
import 'dart:ui';
import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:dio/dio.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/Tools.dart';
import 'package:LoliSnatcher/ImageWriter.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';

class MediaViewer extends StatefulWidget {
  final BooruItem booruItem;
  final int index;
  final int viewedIndex;
  final SettingsHandler settingsHandler;
  MediaViewer(this.booruItem, this.index, this.viewedIndex, this.settingsHandler);

  @override
  _MediaViewerState createState() => _MediaViewerState();
}

class _MediaViewerState extends State<MediaViewer> {
  PhotoViewScaleStateController scaleController = PhotoViewScaleStateController();
  PhotoViewController viewController = PhotoViewController();

  final ImageWriter imageWriter = ImageWriter();
  int _total = 0, _received = 0;
  int _prevReceivedAmount = 0, _lastReceivedAmount = 0, _lastReceivedTime = 0, _startedAt = 0;
  Timer? _checkInterval, _debounceBytes;
  bool isFromCache = false, isStopped = false;

  ImageProvider? thumbProvider;
  String? imageURL;
  Dio? _client;
  CancelToken? _dioCancelToken;
  Uint8List _totalBytes = Uint8List(0);

  /// Author: [Nani-Sore] ///
  Future<void> _downloadImage() async {
    final String? filePath = await imageWriter.getCachePath(imageURL!, 'media');

    // If file is in cache - load
    // print(filePath);
    if (filePath != null) {
      final File file = File(filePath);
      setState(() {
        print("setSt MediaViewer::_downloadsImage");
        // multiple restates in the same function is usually bad practice, but we need this to notify user how the file is loaded while we await for bytes
        isFromCache = true;
      });
      // load bytes first, then trigger an empty restate
      _totalBytes = await file.readAsBytes();
      setState(() {});
      return;
    }
    //a few boorus doesn't work without a browser useragent
    Map<String,String> headers = {"user-agent": "Mozilla/5.0 (Linux x86_64; rv:86.0) Gecko/20100101 Firefox/86.0"};
    // Otherwise start loading and subscribe to progress
    _client = Dio();
    _dioCancelToken = CancelToken();
    _client!.get<List<int>>(
      imageURL!,
      options: Options(responseType: ResponseType.bytes,headers: headers),
      cancelToken: _dioCancelToken,
      onReceiveProgress: (received, total) {
        _total = total;
        _onBytesAdded(received);
      },
    ).then((value) {
      // Sometimes stream ends before fully loading, so we require at least 95% loaded to write to cache
      if (_received > (_total * 0.95)) {
        setState((){
          _totalBytes = Uint8List.fromList(value.data!);
        });

        _checkInterval?.cancel();

        if(widget.settingsHandler.mediaCache) {
          // final File cacheFile = await
          imageWriter.writeCacheFromBytes(imageURL!, value.data!, 'media');
        }
      } else {
        //TODO: show error message
        killLoading();
        print('Image load incomplete'); // Throw an error, allow to retry?
      }
      return value;
    }).catchError((e) {
      if (CancelToken.isCancel(e)) {
        // print('Canceled by user: $imageURL | $e');
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
    if (isActive) {
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
    initViewer();
  }

  void initViewer() {
    if (widget.settingsHandler.galleryMode == "Sample" && widget.booruItem.sampleURL.isNotEmpty && widget.booruItem.sampleURL != widget.booruItem.thumbnailURL){
      imageURL = widget.booruItem.sampleURL;
    } else {
      imageURL = widget.booruItem.fileURL;
    }

    // load thumbnail preview
    () async {
      String thumbnailFileURL = (widget.settingsHandler.previewMode == "Sample"
          ? widget.booruItem.sampleURL
          : widget.booruItem.thumbnailURL);
      String? previewPath = await imageWriter.getCachePath(thumbnailFileURL, 'thumbnails');
      File? preview = previewPath != null ? File(previewPath) : null;

      setState(() {
        if (preview != null){
          thumbProvider = FileImage(preview);
        } else {
          thumbProvider = NetworkImage(thumbnailFileURL);
        }
      });
    }();

    // debug output
    // viewController..outputStateStream.listen(onViewStateChanged);
    // scaleController..outputScaleStateStream.listen(onScaleStateChanged);

    _checkInterval?.cancel();
    _checkInterval = Timer.periodic(const Duration(seconds: 1), (timer) {
      // force restate every second to refresh all timers/indicators, even when loading has stopped
      setState(() {});
    });

    isStopped = false;
    _startedAt = DateTime.now().millisecondsSinceEpoch;

    // if (widget.settingsHandler.mediaCache) {
    _downloadImage();
    // }
  }

  void killLoading() {
    _debounceBytes?.cancel();
    _checkInterval?.cancel();
    if (!(_dioCancelToken != null && _dioCancelToken!.isCancelled)){
      _dioCancelToken?.cancel();
    }
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

      _totalBytes = Uint8List(0);
    });
  }

  @override
  void dispose() {
    super.dispose();
    thumbProvider?.evict();
    _debounceBytes?.cancel();
    _checkInterval?.cancel();
    if (!(_dioCancelToken != null && _dioCancelToken!.isCancelled)){
      _dioCancelToken?.cancel();
    }
    // _client?.close(force: true);
  }

  // debug functions
  void onScaleStateChanged(PhotoViewScaleState scaleState) {
    print(scaleState);
  }
  void onViewStateChanged(PhotoViewControllerValue viewState) {
    print(viewState);
  }

  /// Author: [Nani-Sore] ///
  Widget loadingElementBuilder(BuildContext ctx, ImageChunkEvent? loadingProgress) {
    bool hasProgressData = (loadingProgress != null && loadingProgress.expectedTotalBytes != null) || (_total > 0);
    int expectedBytes = hasProgressData
        ? _received
        : 0;
    int totalBytes = hasProgressData
        ? _total
        : 0;

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
    String expectedTimeText = (hasProgressData && expectedTime != 0 && expectedTime > 0) ? ("~" + expectedTime.toStringAsFixed(1) + " second${expectedTime == 1 ? '' : 's'} left") : '';
    int sinceStart = Duration(milliseconds: nowMils - _startedAt).inSeconds;
    String sinceStartText = "Started " + sinceStart.toString() + " second${sinceStart == 1 ? '' : 's'} ago";

    String percentDoneText = hasProgressData
        ? (percentDone == 1 ? 'Rendering...' : '${(percentDone! * 100).toStringAsFixed(2)}%')
        : 'Loading${isFromCache ? ' from cache' : ''}...';
    String filesizeText = hasProgressData ? ('$loadedSize / $expectedSize') : '';

    // start opacity from 20%
    double opacityValue = 0.2 + 0.8 * lerpDouble(0.0, 1.0, percentDone ?? 0.66)!;

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
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
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
                                  setState(() { initViewer(); });
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
                              TextButton.icon(
                                icon: Icon(Icons.stop),
                                label: Text('Stop loading', style: TextStyle(color: Colors.white)),
                                onPressed: killLoading,
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

  Widget build(BuildContext context) {
    if (widget.viewedIndex != widget.index) {
      // reset zoom if not viewed
      setState(() {
        scaleController.scaleState = PhotoViewScaleState.initial;
      });
    }

    // Scaffold(
    //   floatingActionButton: FloatingActionButton.extended(
    //     label: Text("${_received ~/ 1024}/${_total ~/ 1024} KB"),
    //     icon: Icon(Icons.file_download),
    //     // onPressed: _downloadImage,
    //   ),
    //   body: Center(
    //     child: loadingElementBuilder(context, null),
    //   ),
    // )

    return (_totalBytes.length == 0)
      ? Center(child: loadingElementBuilder(context, null))
      : PhotoView(
        //resizeimage if resolution is too high (in attempt to fix crashes if multiple very HQ images are loaded), only check by width, otherwise looooooong/thin images could look bad
        imageProvider: ResizeImage(MemoryImage(_totalBytes), width: 4096), //MemoryImage(_totalBytes),
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.covered * 8,
        initialScale: PhotoViewComputedScale.contained,
        enableRotation: false,
        basePosition: Alignment.center,
        controller: viewController,
        // tightMode: true,
        heroAttributes: PhotoViewHeroAttributes(tag: 'imageHero' + widget.index.toString()),
        scaleStateController: scaleController,
        loadingBuilder: loadingElementBuilder,
      );
  }
}
