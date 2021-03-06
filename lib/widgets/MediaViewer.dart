import 'dart:io';
import 'dart:ui';
import 'dart:async';
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  MediaViewer(
      this.booruItem, this.index, this.viewedIndex, this.settingsHandler);

  @override
  _MediaViewerState createState() => _MediaViewerState();
}

class _MediaViewerState extends State<MediaViewer> {
  late PhotoViewScaleStateController scaleController;
  late PhotoViewController viewController;

  final ImageWriter imageWriter = ImageWriter();
  int _total = 0, _received = 0;
  bool isFromCache = false;
  late StreamedResponse _response;
  late File _image;
  List<int> _bytes = [];
  late StreamSubscription _subscription;
  late String imageURL;
  Future<void> _downloadImage() async {
    final String filePath =
        await imageWriter.getCachePath(imageURL, 'media');

    // If file is in cache - load
    print(filePath);
    if (filePath != null) {
      final File file = File(filePath);
      await file.readAsBytes();
      setState(() {
        _image = file;
        isFromCache = true;
      });
      return;
    }

    // Otherwise start loading and subscribe to progress
    _response = await Client()
        .send(Request('GET', Uri.parse(imageURL)));
    _total = _response.contentLength!;

    _subscription = _response.stream.listen((value) {
      setState(() {
        _bytes.addAll(value);
        _received += value.length;
      });
    });
    _subscription.onDone(() async {
      if (_received > (_total * 0.95)) {
        // Sometimes stream ends before fully loading, so we require at least 95% loaded to write to cache
        final File cacheFile = await imageWriter.writeCacheFromBytes(
            imageURL, _bytes, 'media');
        if (cacheFile != null) {
          setState(() {
            _image = cacheFile;
          });
        }
      } else {
        print('Image load incomplete'); // Throw an error, allow to retry?
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.settingsHandler.galleryMode == "Sample" && widget.booruItem.sampleURL!.isNotEmpty && widget.booruItem.sampleURL != widget.booruItem.thumbnailURL){
      imageURL = widget.booruItem.sampleURL!;
    } else {
      imageURL = widget.booruItem.fileURL!;
    }
    viewController =
        PhotoViewController(); //..outputStateStream.listen(onViewStateChanged);
    scaleController =
        PhotoViewScaleStateController(); //..outputScaleStateStream.listen(onScaleStateChanged);

    if (widget.settingsHandler.mediaCache) {
      _downloadImage();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

  // debug functions
  void onScaleStateChanged(PhotoViewScaleState scaleState) {
    print(scaleState);
  }

  void onViewStateChanged(PhotoViewControllerValue viewState) {
    print(viewState);
  }

  Widget loadingElementBuilder(
      BuildContext ctx, ImageChunkEvent loadingProgress) {
    bool hasProgressData = (loadingProgress != null &&
            loadingProgress.expectedTotalBytes != null) ||
        (widget.settingsHandler.mediaCache && _total != null && _total > 0);
    bool isProgressFromCaching =
        widget.settingsHandler.mediaCache && hasProgressData && _total != null && _total > 0;
    int expectedBytes = (hasProgressData
        ? (isProgressFromCaching
            ? _received
            : loadingProgress.cumulativeBytesLoaded)
        : null)!;
    int totalBytes = (hasProgressData
        ? (isProgressFromCaching ? _total : loadingProgress.expectedTotalBytes)
        : null)!;

    double percentDone = (hasProgressData ? (expectedBytes / totalBytes) : null)!;
    String loadedSize = hasProgressData ? Tools.formatBytes(expectedBytes, 1) : '';
    String expectedSize = hasProgressData ? Tools.formatBytes(totalBytes, 1) : '';

    String percentDoneText = hasProgressData
        ? ('${(percentDone * 100).toStringAsFixed(2)}%')
        : 'Loading...';
    String filesizeText =
        hasProgressData ? ('$loadedSize / $expectedSize') : '';

    String thumbnailFileURL = (widget.settingsHandler.previewMode == "Sample"
        ? widget.booruItem.sampleURL
        : widget.booruItem.thumbnailURL)!;
    File preview = File(
        "${widget.settingsHandler.cachePath}thumbnails/${thumbnailFileURL.substring(thumbnailFileURL.lastIndexOf("/") + 1)}");
    // start opacity from 20%
    double opacityValue = 0.2 +
        0.8 * lerpDouble(0.0, 1.0, (percentDone == null ? 0 : percentDone))!.toDouble();

    // print(widget.settingsHandler.cachePath + "thumbnails/" + thumbnailFileURL.substring(thumbnailFileURL.lastIndexOf("/") + 1));
    // print(opacityValue);

    return Container(
        decoration: new BoxDecoration(
          color: Colors.black,
          image: new DecorationImage(
              image: preview.existsSync()
                  ? FileImage(preview)
                  : NetworkImage(thumbnailFileURL),
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
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/loading.gif')))
                            ]
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
                            ]),
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

    return (_image == null && widget.settingsHandler.mediaCache)
        ? Center(
            child: loadingElementBuilder(context, null),
          )
        : PhotoView(
            imageProvider: widget.settingsHandler.mediaCache
                ? FileImage(_image)
                : NetworkImage(imageURL),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 8,
            initialScale: PhotoViewComputedScale.contained,
            enableRotation: false,
            basePosition: Alignment.center,
            controller: viewController,
            // tightMode: true,
            heroAttributes: PhotoViewHeroAttributes(
                tag: 'imageHero' + widget.index.toString()),
            scaleStateController: scaleController,
            loadingBuilder: loadingElementBuilder,
          );
  }
}
