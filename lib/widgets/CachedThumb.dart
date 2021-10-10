import 'dart:io';
import 'dart:ui';
import 'dart:async';
import 'dart:typed_data';

import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as GET;

import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/ImageWriter.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/ViewUtils.dart';
import 'package:LoliSnatcher/widgets/CustomImageProvider.dart';


class CachedThumb extends StatefulWidget {
  final BooruItem booruItem;
  final int index;
  final int columnCount;
  final SearchGlobal searchGlobal;
  final bool isHated;
  final bool isHero;
  CachedThumb(this.booruItem, this.index, this.searchGlobal, this.columnCount, this.isHated, this.isHero);

  @override
  _CachedThumbState createState() => _CachedThumbState();
}

class _CachedThumbState extends State<CachedThumb> {
  final SettingsHandler settingsHandler = GET.Get.find();
  final ImageWriter imageWriter = ImageWriter();
  int _total = 0, _received = 0, _restartedCount = 0;
  bool? isFromCache;
  // isFailed - loading error, isVisible - controls fade in
  bool isFailed = false, isVisible = false, isForVideo = false;
  Timer? _debounceBytes, _restartDelay, _debounceStart;
  Dio? _client;
  CancelToken? _dioCancelToken;
  ImageProvider? thumbProvider;
  bool? isThumbQuality;
  late String thumbURL;

  @override
  void didUpdateWidget(CachedThumb oldWidget) {
    // force redraw on tab change
    if(oldWidget.booruItem != widget.booruItem) {
      restartLoading();
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<void> downloadThumb() async {
    final String? filePath = await imageWriter.getCachePath(thumbURL, isThumbQuality == true ? 'thumbnails' : 'samples');

    // If file is in cache - load
    if (filePath != null) {
      final File file = File(filePath);

      // multiple restates in the same function is usually bad practice, but we need this to notify user how the file is loaded while we await for bytes
      isFromCache = true;
      if(this.mounted) setState(() { });
      // load bytes first, then trigger an empty restate
      Uint8List bytes = await file.readAsBytes();
      _total = bytes.lengthInBytes;
      thumbProvider = getImageProvider(bytes);

      isVisible = true;
      if(this.mounted) setState(() {});
      return;
    } else {
      isFromCache = false;
      if(this.mounted) setState(() { });
    }

    // Otherwise start loading and subscribe to progress
    _client = Dio();
    _dioCancelToken = CancelToken();

    try {
      //// GET request
      Response<dynamic> response = await _client!.get(
        thumbURL,
        options: Options(responseType: ResponseType.bytes, headers: ViewUtils.getFileCustomHeaders(widget.searchGlobal, checkForReferer: true)),
        cancelToken: _dioCancelToken,
        onReceiveProgress: (received, total) {
          if(total > 0) _total = total;
          _onBytesAdded(received);
        },
      );

      //// Parse response
      // Sometimes stream ends before fully loading, so we require at least 95% loaded to write to cache
      if (response.data != null && _received > (_total * 0.95)) {
        // resize thumbnail to 500px if wider OR 10px if contains hated tags
        Uint8List temp = Uint8List.fromList(response.data!);
        thumbProvider = getImageProvider(temp);

        isVisible = true;
        if(this.mounted) setState(() { });
        if (settingsHandler.thumbnailCache) {
          imageWriter.writeCacheFromBytes(thumbURL, response.data!, isThumbQuality == true ? 'thumbnails' : 'samples');
        }
      } else {
        print('Thumbnail load incomplete');
        throw('Load Incomplete');
      }
      return;
    } on DioError catch(e) {
      //// Error handling
      if (CancelToken.isCancel(e)) {
        // print('Canceled by user: $e');
      } else {
        if (_restartedCount < 5) {
          // attempt to reload 5 times with a second delay
          _restartDelay?.cancel();
          _restartDelay = Timer(const Duration(seconds: 1), () {
            restartLoading();
          });
          _restartedCount++;
        } else {
          //show error
          isFailed = true;
          if(this.mounted) setState(() { });
          // this.mounted prevents exceptions when using staggered view
        }
        print('Dio request cancelled: $e');
      }
      return;
    }
  }

  ImageProvider getImageProvider(Uint8List bytes) {
    double? thumbWidth = 100; // set minimum value to avoid exceptions when it attempts to render outside of the view
    double? thumbHeight;
    if (this.mounted) {
      // mediaquery will throw an exception if we try to read it after disposing => check mounted
      final MediaQueryData mQuery = MediaQuery.of(context);
      final double widthLimit = (mQuery.size.width / widget.columnCount) * mQuery.devicePixelRatio * 1;
      double thumbRatio = 1;

      if (widget.isHated) {
        // pixelate hated images
        thumbWidth = mQuery.size.width * 0.01; // thumbHeight = 6;
      } else {
        switch (settingsHandler.previewDisplay) {
          case 'Rectangle':
            thumbRatio = 16 / 9;
            // thumbHeight = widthLimit * thumbRatio;
            thumbWidth = widthLimit;
            break;
          case 'Staggered':
            bool hasSizeData = widget.booruItem.fileHeight != null && widget.booruItem.fileWidth != null;
            if (hasSizeData) { // if api gives size data
              thumbRatio = widget.booruItem.fileWidth! / widget.booruItem.fileHeight!;
              if(thumbRatio < 1) { // vertical image - resize to width
                thumbWidth = widthLimit;
              } else { // horizontal image - resize to height
                thumbHeight = widthLimit * thumbRatio;
              }
            } else {
              thumbWidth = widthLimit;
            }
            break;
          case 'Square':
          default:
            // otherwise resize to widthLimit
            thumbWidth = widthLimit;
            break;
        }
      }
    }

    // debugPrint('ThumbWidth: $thumbWidth');

    return MemoryImageTest(bytes, imageUrl: thumbURL);
    // return ResizeImage(
    //   MemoryImage(bytes),
    //   width: thumbWidth.round(), // ?.
    //   height: thumbHeight?.round(),
    // );
  }

  void _onBytesAdded(int addedBytes) {
    // always save incoming bytes, but restate only after [debounceDelay]MS
    const int debounceDelay = 250;
    bool isActive = _debounceBytes?.isActive ?? false;
    _received = addedBytes;
    if (!isActive) {
      if(this.mounted) setState(() { });
      _debounceBytes = Timer(const Duration(milliseconds: debounceDelay), () {});
    }
  }

  @override
  void initState() {
    super.initState();
    selectThumbProvider();
  }

  void selectThumbProvider() {
    // bool isVideo = widget.thumbType == "video" && (thumbURL.endsWith(".webm") || thumbURL.endsWith(".mp4"));
    // if (isVideo) {
    //   isForVideo = true; // disabled - hangs the app
    // } else {
    //   downloadThumb();
    // }

    isThumbQuality = settingsHandler.previewMode == "Thumbnail" || (widget.booruItem.mediaType == 'animation' || widget.booruItem.mediaType == 'video');
    thumbURL = isThumbQuality == true ? widget.booruItem.thumbnailURL : widget.booruItem.sampleURL;

    // delay loading a little to improve performance when scrolling fast
    _debounceStart = Timer(Duration(milliseconds: 200), () {
      downloadThumb();
    });
    return;
  }

  Future<Uint8List?> getVideoThumb() async {
    ServiceHandler serviceHandler = ServiceHandler();
    Uint8List? bytes = await serviceHandler.makeVidThumb(thumbURL);
    return bytes;
  }

  void restartLoading() {
    disposables();

    _total = 0;
    _received = 0;
    isFromCache = false;
    thumbProvider?.evict();
    thumbProvider = null;
    if(this.mounted) setState(() { });

    selectThumbProvider();
  }

  @override
  void dispose() {
    disposables();
    isVisible = false;
    super.dispose();
  }

  void disposables() {
    thumbProvider?.evict();
    _restartDelay?.cancel();
    _debounceBytes?.cancel();
    _debounceStart?.cancel();
    if (!(_dioCancelToken != null && _dioCancelToken!.isCancelled)){
      _dioCancelToken?.cancel();
    }
    _client?.close(force: true);
  }

  Widget loadingElementBuilder(BuildContext ctx, Widget? child, ImageChunkEvent? loadingProgress) {
    // if (loadingProgress == null && !settingsHandler.thumbnailCache) {
    //   // Resulting image for network loaded thumbnail
    //   return child;
    // }

    if (isFailed) {
      return Center(
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.broken_image),
              Text("ERROR"),
              Text("Tap to retry!"),
            ]
          ),
          onTap: () => setState(() {
            _restartedCount = 0;
            isFailed = false;
            restartLoading();
          }),
        )
      );
    }

    bool hasProgressData = (loadingProgress != null && loadingProgress.expectedTotalBytes != null) || (_total > 0);
    bool isProgressFromCaching = hasProgressData && _total > 0;
    int? expectedBytes = (hasProgressData ? (isProgressFromCaching ? _received : loadingProgress!.cumulativeBytesLoaded) : null);
    int? totalBytes = (hasProgressData ? (isProgressFromCaching ? _total : loadingProgress!.expectedTotalBytes) : null);

    double? percentDone = (hasProgressData ? expectedBytes! / totalBytes! : null);
    String? percentDoneText = hasProgressData
        ? ((percentDone ?? 0) == 1 ? null : '${(percentDone! * 100).toStringAsFixed(2)}%')
        : (isFromCache == true ? '...' : null);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: isFromCache == false
        ? [
          SizedBox(
            height: 100 / widget.columnCount,
            width: 100 / widget.columnCount,
            child: CircularProgressIndicator(
              strokeWidth: 14 / widget.columnCount,
              valueColor: AlwaysStoppedAnimation<Color>(GET.Get.theme.colorScheme.secondary),
              value: percentDone,
            ),
          ),
          if(widget.columnCount < 5 && percentDoneText != null) // Text element overflows if too many thumbnails are shown
            ...[
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                percentDoneText,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
        ]
        : [],
    );
  }

  Widget renderImages(BuildContext context, bool isHero) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if(isThumbQuality == false && !widget.isHated) // fetch thumbnail from network while loading a sample
          AnimatedSwitcher(
            duration: Duration(milliseconds: 1000),
            child: isVisible // hide temp thumbnail when sample is loaded
              ? null
              : FadeInImage( // fade in thumbnail
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(widget.booruItem.thumbnailURL, headers: ViewUtils.getFileCustomHeaders(widget.searchGlobal, checkForReferer: true)),
                fadeInDuration: Duration(milliseconds: 200),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              )
          ),

        // Image( // just load image from network - debug
        //   image: ResizeImage(
        //     NetworkImage(thumbURL, headers: ViewUtils.getFileCustomHeaders(widget.searchGlobal, checkForReferer: true)),
        //     width: ((MediaQuery.of(context).size.width / widget.columnCount) * MediaQuery.of(context).devicePixelRatio).round()
        //   ),
        //   fit: BoxFit.cover,
        //   width: double.infinity,
        //   height: double.infinity,
        // ),

        AnimatedOpacity( // fade in image
          opacity: isVisible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 300),
          child: thumbProvider != null
            ? Image(
                image: thumbProvider!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              )
            : null
        ),

        if(thumbProvider == null && isHero)
          loadingElementBuilder(context, null, null),

        if(widget.isHated)
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.66),
              borderRadius: BorderRadius.circular(5),
            ),
            width: 50,
            height: 50,
            child: Icon(CupertinoIcons.eye_slash, color: Colors.white)
          ),

        if (settingsHandler.showURLOnThumb.value)
          Container(
            color: Colors.black,
            child: Text(thumbURL),
          ),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    // set max width after which the image will be resized
    // int widthLimit = this.mounted ? ((MediaQuery.of(context).size.width / widget.columnCount) * MediaQuery.of(context).devicePixelRatio).round() : 200;

    // if(isForVideo) {
    //   ServiceHandler serviceHandler = ServiceHandler();
    //   return FutureBuilder(
    //       future: serviceHandler.makeVidThumb(thumbURL), // a previously-obtained Future<String> or null
    //       builder: (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
    //         if (snapshot.connectionState == ConnectionState.done && snapshot.hasData){
    //           return Image(
    //             image: ResizeImage(MemoryImage(Uint8List.fromList(snapshot.data!)), width: 500), //ResizeImage(MemoryImage(_totalBytes), width: 500, allowUpscaling: true),
    //             fit: settingsHandler.previewDisplay == "Waterfall" ? BoxFit.cover : BoxFit.contain ,
    //             width: settingsHandler.previewDisplay == "Waterfall" ? double.infinity : Get.width,
    //             height: settingsHandler.previewDisplay == "Waterfall" ? double.infinity : null,
    //           );
    //         } else {
    //           return CircularProgressIndicator();
    //         }
    //       }
    //   );
    // }

    if(widget.isHero) {
      return Hero(
        tag: 'imageHero' + widget.index.toString(),
        child: renderImages(context, widget.isHero),
      );
    } else {
      return renderImages(context, widget.isHero);
    }
  }
}
