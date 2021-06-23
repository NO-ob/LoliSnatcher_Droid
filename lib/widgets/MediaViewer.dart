import 'dart:io';
import 'dart:ui';
import 'dart:async';
import 'dart:typed_data';

import 'package:LoliSnatcher/ViewUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:dio/dio.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/Tools.dart';
import 'package:LoliSnatcher/ImageWriter.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/widgets/BorderedText.dart';

class MediaViewer extends StatefulWidget {
  final BooruItem booruItem;
  final int index;
  final SearchGlobals searchGlobals;
  final SettingsHandler settingsHandler;
  MediaViewer(this.booruItem, this.index, this.searchGlobals, this.settingsHandler);

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
  bool isFromCache = false, isStopped = false, isHated = false, isZoomed = false, isZoomButtonVisible = true;
  List<String> stopReason = [];

  ImageProvider? thumbProvider;
  ImageProvider? mainProvider;
  String? imageURL;
  String? imageType;
  String? thumbnailFileURL;
  String? thumbnailFolder;
  double thumbnailBlur = 1;
  Dio? _client;
  CancelToken? _dioCancelToken;

  /// Author: [Nani-Sore] ///
  Future<void> _downloadImage() async {
    final String? filePath = await imageWriter.getCachePath(imageURL!, imageType!,widget.settingsHandler);

    // If file is in cache - load
    // print(filePath);
    if (filePath != null) {
      final File file = File(filePath);
      setState(() {
        // print("setSt MediaViewer::_downloadsImage");
        // multiple restates in the same function is usually bad practice, but we need this to notify user how the file is loaded while we await for bytes
        isFromCache = true;
      });
      // add a small delay to let preview load
      await Future.delayed(Duration(milliseconds: 500), () => true);
      // load bytes first, then trigger an empty restate
      mainProvider = getImageProvider(await file.readAsBytes());
      if(this.mounted) setState(() {});
      return;
    }

    // Otherwise start loading and subscribe to progress
    _client = Dio();
    _dioCancelToken = CancelToken();

    try {
      //// GET request
      Response<dynamic> response = await _client!.get(
        imageURL!,
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
        mainProvider = getImageProvider(Uint8List.fromList(response.data!));
        if(this.mounted) setState((){ });

        _checkInterval?.cancel();

        if(widget.settingsHandler.mediaCache) {
          imageWriter.writeCacheFromBytes(imageURL!, response.data!, imageType!,widget.settingsHandler);
        }
      } else {
        print('Image load incomplete');
        throw('Load Incomplete');
      }
    } on DioError catch(e) {
      //// Error handling
      if (CancelToken.isCancel(e)) {
        // print('Canceled by user: $imageURL | $e');
      } else {
        killLoading(['Loading Error: ${e.message}']);
        print('Dio request cancelled: $e');
      }
    }
  }

  /// Author: [Nani-Sore] ///
  void _onBytesAdded(int received) {
    // always save incoming bytes, but restate only after [debounceDelay]MS
    const int debounceDelay = 100;
    bool isActive = _debounceBytes?.isActive ?? false;
    if (isActive) {
      _received = received;
    } else {
      if(this.mounted) setState(() {
        _received = received;
      });
      _debounceBytes = Timer(const Duration(milliseconds: debounceDelay), () {});
    }
  }

  @override
  void initState() {
    super.initState();
    widget.searchGlobals.displayAppbar.addListener(setZoomVisibility);
    initViewer(false);
  }

  void initViewer(bool ignoreTagsCheck) {
    if ((widget.settingsHandler.galleryMode == "Sample" && widget.booruItem.sampleURL.isNotEmpty && widget.booruItem.sampleURL != widget.booruItem.thumbnailURL) || widget.booruItem.sampleURL == widget.booruItem.fileURL){
      // use sample file if (sample gallery quality && sampleUrl exists && sampleUrl is not the same as thumbnailUrl) OR sampleUrl is the same as full res fileUrl
      imageURL = widget.booruItem.sampleURL;
      imageType = 'samples';
    } else {
      imageURL = widget.booruItem.fileURL;
      imageType = 'media';
    }

    // load thumbnail preview
    bool isThumbSample = widget.settingsHandler.previewMode == "Sample" && widget.booruItem.mediaType != "animation" && widget.booruItem.sampleURL != widget.booruItem.thumbnailURL;
    thumbnailFileURL = isThumbSample ? widget.booruItem.sampleURL : widget.booruItem.thumbnailURL;
    thumbnailFolder = isThumbSample ? 'samples' : 'thumbnails';
    bool isPreviewEqualToFull = thumbnailFileURL == widget.booruItem.fileURL;
    if(!isPreviewEqualToFull) getThumbnail();

    List<List<String>> hatedAndLovedTags = widget.settingsHandler.parseTagsList(widget.booruItem.tagsList, isCapped: true);
    if (hatedAndLovedTags[0].length > 0 && !ignoreTagsCheck) {
      isHated = true;
      thumbnailBlur = 20;
      killLoading(['Contains Hated tags:', ...hatedAndLovedTags[0]]);
      return;
    } else if (thumbnailFolder == 'samples') {
      thumbnailBlur = 0;
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

    _downloadImage();
  }

  void getThumbnail() async {
    String? previewPath = await imageWriter.getCachePath(thumbnailFileURL!, thumbnailFolder!,widget.settingsHandler);
    File? preview = previewPath != null ? File(previewPath) : null;

    if (preview != null){
      thumbProvider = ResizeImage(MemoryImage(await preview.readAsBytes()), width: 4096); // FileImage(preview);
    } else {
      thumbProvider = NetworkImage(thumbnailFileURL!);
    }
    if(this.mounted) setState(() { });
  }

  ImageProvider getImageProvider(Uint8List bytes) {
    return ResizeImage(MemoryImage(bytes), width: 4096);
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
    });
  }

  @override
  void dispose() {
    disposables();
    super.dispose();
  }

  void disposables() {
    thumbProvider?.evict();
    mainProvider?.evict().then((bool success) {
      // if(success) {
      //   ServiceHandler.displayToast('main image evicted');
      //   print('main image evicted');
      // } else {
      //   ServiceHandler.displayToast('main image eviction failed');
      //   print('main image eviction failed');
      // }
    });

    _debounceBytes?.cancel();
    _checkInterval?.cancel();

    widget.searchGlobals.displayAppbar.removeListener(setZoomVisibility);

    if (!(_dioCancelToken != null && _dioCancelToken!.isCancelled)){
      _dioCancelToken?.cancel();
    }
    // _client?.close(force: true);
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

  void setZoomVisibility() {
    isZoomButtonVisible = widget.searchGlobals.displayAppbar.value;
    setState(() { });
  }

  Widget zoomButtonBuild() {
    if(isZoomButtonVisible && mainProvider != null) {
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

  /// Author: [Nani-Sore] ///
  Widget loadingElementBuilder(BuildContext ctx, ImageChunkEvent? loadingProgress) {
    if(widget.settingsHandler.loadingGif) {
      return Container(
        width: MediaQuery.of(context).size.width - 30,
        child: Image(image: AssetImage('assets/images/loading.gif'))
      );
    } else if(widget.settingsHandler.shitDevice) {
      return Center(child: CircularProgressIndicator());
    }


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
    bool isMovedBelow = thumbnailFolder == 'samples' && !isHated;
    double startOpacity = isHated ? 0.0 : (isMovedBelow ? 0.5 : 0.2);
    double opacityValue = startOpacity + (1 - startOpacity) * lerpDouble(0.0, 1.0, percentDone ?? 0.33)!;

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
                      // move loading info lower if preview is of sample quality (except when item is hated)
                      mainAxisAlignment: isMovedBelow ? MainAxisAlignment.end : MainAxisAlignment.center,
                      children: widget.settingsHandler.loadingGif
                          ? [
                              Container(
                                width: MediaQuery.of(context).size.width - 30,
                                child: Image(image: AssetImage('assets/images/loading.gif'))
                              ),
                              const SizedBox(height: 30),
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
                                    setState(() { initViewer(true); });
                                  },
                                ),
                                if(isMovedBelow) const SizedBox(height: 60),
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
                              if(isMovedBelow) const SizedBox(height: 60),
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
    final bool isViewed = widget.searchGlobals.viewedIndex.value == widget.index;
    if (!isViewed) {
      // reset zoom if not viewed
      resetZoom();
    }

    return Hero(
      tag: 'imageHero' + (isViewed ? '' : 'ignore') + widget.index.toString(),
      child: Material( // without this every text element will have broken styles on first frames
        child: Stack(
          children: [
            if(mainProvider == null)
              loadingElementBuilder(context, null)
            else
              PhotoView(
                //resizeimage if resolution is too high (in attempt to fix crashes if multiple very HQ images are loaded), only check by width, otherwise looooooong/thin images could look bad
                imageProvider: mainProvider,
                filterQuality: FilterQuality.high,
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 8,
                initialScale: PhotoViewComputedScale.contained,
                enableRotation: false,
                basePosition: Alignment.center,
                controller: viewController,
                // tightMode: true,
                // heroAttributes: PhotoViewHeroAttributes(tag: 'imageHero' + (widget.viewedIndex == widget.index ? '' : 'ignore') + widget.index.toString()),
                scaleStateController: scaleController,
                loadingBuilder: loadingElementBuilder,
              ),

            zoomButtonBuild(),
          ]
        )
      )
    );
  }
}
