import 'dart:io';
import 'dart:ui';
import 'dart:async';
import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:photo_view/photo_view.dart';

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

  String? imageURL;
  IOClient? _client;
  StreamedResponse? _response;
  StreamSubscription? _subscription;

  List<int> _bytes = [];
  Uint8List _totalBytes = Uint8List(0);

  /// Author: [Nani-Sore] ///
  Future<void> _downloadImage() async {
    final String? filePath = await imageWriter.getCachePath(imageURL!, 'media');

    // If file is in cache - load
    // print(filePath);
    if (filePath != null) {
      final File file = File(filePath);
      setState(() {
        // multiple restates in the same function is usually bad practice, but we need this to notify user how the file is loaded while we await for bytes
        isFromCache = true;
      });
      Uint8List tempBytes = await file.readAsBytes();
      setState(() {
        _totalBytes = tempBytes;
      });
      return;
    }

    // Otherwise start loading and subscribe to progress
    _client = IOClient();
    _response = await _client!.send(Request('GET', Uri.parse(imageURL!)));
    _total = _response!.contentLength!;

    _subscription = _response!.stream.listen(
      _onBytesAdded,
      onError: (e) {
        killLoading();
        print(e);
      },
      cancelOnError: true,
      onDone: () async {
        // Sometimes stream ends before fully loading, so we require at least 95% loaded to write to cache
        if (_received > (_total * 0.95)) {
          setState((){
            _totalBytes = Uint8List.fromList(_bytes);
          });

          _checkInterval?.cancel();

          if(widget.settingsHandler.mediaCache) {
            // final File cacheFile = await
            imageWriter.writeCacheFromBytes(imageURL!, _bytes, 'media');
          }
          // clear bytes array, because everything is saved in _totalBytes now
          _bytes = [];
        } else {
          //TODO: show error message
          killLoading();
          print('Image load incomplete'); // Throw an error, allow to retry?
        }
      }
    );
  }

  /// Author: [Nani-Sore] ///
  void _onBytesAdded(List<int> addedBytes) {
    // always save incoming bytes, but restate only after [debounceDelay]MS
    const int debounceDelay = 50;
    bool isActive = _debounceBytes?.isActive ?? false;
    if (isActive) {
      _bytes.addAll(addedBytes);
      _received += addedBytes.length;
    } else {
      setState(() {
        _bytes.addAll(addedBytes);
        _received += addedBytes.length;
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
    if (widget.settingsHandler.galleryMode == "Sample" && widget.booruItem.sampleURL!.isNotEmpty && widget.booruItem.sampleURL != widget.booruItem.thumbnailURL){
      imageURL = widget.booruItem.sampleURL!;
    } else {
      imageURL = widget.booruItem.fileURL!;
    }

    // debug output
    // viewController..outputStateStream.listen(onViewStateChanged);
    // scaleController..outputScaleStateStream.listen(onScaleStateChanged);

    _checkInterval?.cancel();
    _checkInterval = Timer.periodic(new Duration(seconds: 1), (timer) {
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
    _subscription?.cancel();
    _client?.close();

    setState(() {
      _total = 0;
      _received = 0;

      _prevReceivedAmount = 0;
      _lastReceivedAmount = 0;
      _lastReceivedTime = 0;
      _startedAt = 0;

      isFromCache = false;
      isStopped = true;

      _bytes = [];
      _totalBytes = Uint8List(0);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _debounceBytes?.cancel();
    _checkInterval?.cancel();
    _subscription?.cancel();
    _client?.close();
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

    String thumbnailFileURL = (widget.settingsHandler.previewMode == "Sample"
        ? widget.booruItem.sampleURL
        : widget.booruItem.thumbnailURL)!;
    File preview = File(
        "${widget.settingsHandler.cachePath}thumbnails/${thumbnailFileURL.substring(thumbnailFileURL.lastIndexOf("/") + 1)}");
    // start opacity from 20%
    double opacityValue = 0.2 + 0.8 * lerpDouble(0.0, 1.0, percentDone ?? 0.66)!;

    // print(widget.settingsHandler.cachePath + "thumbnails/" + thumbnailFileURL.substring(thumbnailFileURL.lastIndexOf("/") + 1));
    // print(opacityValue);
    ImageProvider? provider;
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

    return _totalBytes.length == 0
        ? Center(
          child: loadingElementBuilder(context, null),
        )
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
