import 'dart:io';
import 'dart:ui';
import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

import 'package:LoliSnatcher/ImageWriter.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';


class CachedThumb extends StatefulWidget {
  final String thumbURL;
  final String thumbType;
  final int columnCount;
  final SettingsHandler settingsHandler;
  final bool isHated;
  CachedThumb(this.thumbURL, this.thumbType, this.settingsHandler, this.columnCount, this.isHated);
  @override
  _CachedThumbState createState() => _CachedThumbState();
}

class _CachedThumbState extends State<CachedThumb> {
  final ImageWriter imageWriter = ImageWriter();
  int _total = 0, _received = 0, _restartedCount = 0;
  bool? isFromCache;
  // isFailed - loading error, isVisible - controls fade in
  bool isFailed = false, isVisible = false, isForVideo = false;
  Timer? _debounceBytes, _restartDelay;
  Dio? _client;
  CancelToken? _dioCancelToken;
  ImageProvider? thumbProvider;

  /// Author: [Nani-Sore] ///
  Future<void> downloadThumb() async {
    final String? filePath = await imageWriter.getCachePath(widget.thumbURL, widget.settingsHandler.previewMode == 'Sample' ? 'samples' : 'thumbnails');

    int widthLimit = this.mounted ? ((MediaQuery.of(context).size.width / widget.columnCount) * MediaQuery.of(context).devicePixelRatio).round() : 200;

    // If file is in cache - load
    if (filePath != null) {
      final File file = File(filePath);

      // multiple restates in the same function is usually bad practice, but we need this to notify user how the file is loaded while we await for bytes
      isFromCache = true;
      if(this.mounted) setState(() { });
      // load bytes first, then trigger an empty restate
      Uint8List bytes = await file.readAsBytes();
      _total = bytes.lengthInBytes;
      thumbProvider = ResizeImage(MemoryImage(bytes), width: widget.isHated ? 6 : widthLimit); // allowUpscaling: true

      isVisible = true;
      if(this.mounted) setState(() {});
      return;
    } else {
      isFromCache = false;
      if(this.mounted) setState(() { });
    }

    //a few boorus doesn't work without a browser useragent
    Map<String,String> headers = {"user-agent": "Mozilla/5.0 (Linux x86_64; rv:86.0) Gecko/20100101 Firefox/86.0"};

    // Otherwise start loading and subscribe to progress
    _client = Dio();
    _dioCancelToken = CancelToken();
    _client!.get<List<int>>(
      widget.thumbURL,
      options: Options(responseType: ResponseType.bytes, headers: headers),
      cancelToken: _dioCancelToken,
      onReceiveProgress: (received, total) {
        if(total > 0) _total = total;
        _onBytesAdded(received);
      },
    ).then((value) async {
      // Sometimes stream ends before fully loading, so we require at least 95% loaded to write to cache
      if (value.data != null && _received > (_total * 0.95)) {
        // resize thumbnail to 500px if wider OR 10px if contains hated tags
        thumbProvider = ResizeImage(MemoryImage(Uint8List.fromList(value.data!)), width: widget.isHated ? 6 : widthLimit); // allowUpscaling: true

        isVisible = true;
        if(this.mounted) setState(() { });
        if (widget.settingsHandler.imageCache) {
          imageWriter.writeCacheFromBytes(widget.thumbURL, value.data!, widget.settingsHandler.previewMode == 'Sample' ? 'samples' : 'thumbnails');
        }
      } else {
        print('Thumbnail load incomplete');
      }
      return value;
    }).catchError((e) {
      if (CancelToken.isCancel(e)) {
        // print('Canceled by user: $e');
      } else {
        if(_restartedCount < 5) {
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
    });
  }

  /// Author: [Nani-Sore] ///
  void _onBytesAdded(int addedBytes) {
    // always save incoming bytes, but restate only after [debounceDelay]MS
    const int debounceDelay = 250;
    bool isActive = _debounceBytes?.isActive ?? false;
    _received = addedBytes;
    if (isActive) {
      // 
    } else {
      if(this.mounted) setState(() { });
      _debounceBytes = Timer(const Duration(milliseconds: debounceDelay), () {});
    }
  }

  @override
  void initState() {
    super.initState();

    selectThumbProvider();
  }

  void selectThumbProvider() async {
    // bool isVideo = widget.thumbType == "video" && (widget.thumbURL.endsWith(".webm") || widget.thumbURL.endsWith(".mp4"));
    // if (isVideo) {
    //   isForVideo = true; // disabled - hangs the app
    // } else {
    //   downloadThumb();
    // }

    downloadThumb();
  }

  Future<Uint8List?> getVideoThumb() async {
    ServiceHandler serviceHandler = ServiceHandler();
    Uint8List? bytes = await serviceHandler.makeVidThumb(widget.thumbURL);
    return bytes;
  }

  void restartLoading() {
    disposables();

    _total = 0;
    _received = 0;
    isFromCache = false;
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
    if (!(_dioCancelToken != null && _dioCancelToken!.isCancelled)){
      _dioCancelToken?.cancel();
    }
    // _client?.close(force: true);
  }

  Widget loadingElementBuilder(BuildContext ctx, Widget? child, ImageChunkEvent? loadingProgress) {
    // if (loadingProgress == null && !widget.settingsHandler.imageCache) {
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
              valueColor: AlwaysStoppedAnimation<Color>(Colors.pink[300]!),
              value: percentDone,
            ),
          ),
          if(widget.columnCount < 4 && percentDoneText != null) // Text element overflows if too many thumbnails are shown
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

  @override
  Widget build(BuildContext context) {
    // set max width after which the image will be resized
    // int widthLimit = this.mounted ? ((MediaQuery.of(context).size.width / widget.columnCount) * MediaQuery.of(context).devicePixelRatio).round() : 200;

    // if(isForVideo) {
    //   ServiceHandler serviceHandler = ServiceHandler();
    //   return FutureBuilder(
    //       future: serviceHandler.makeVidThumb(widget.thumbURL), // a previously-obtained Future<String> or null
    //       builder: (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
    //         if (snapshot.connectionState == ConnectionState.done && snapshot.hasData){
    //           return Image(
    //             image: ResizeImage(MemoryImage(Uint8List.fromList(snapshot.data!)), width: 500), //ResizeImage(MemoryImage(_totalBytes), width: 500, allowUpscaling: true),
    //             fit: widget.settingsHandler.previewDisplay == "Waterfall" ? BoxFit.cover : BoxFit.contain ,
    //             width: widget.settingsHandler.previewDisplay == "Waterfall" ? double.infinity : Get.width,
    //             height: widget.settingsHandler.previewDisplay == "Waterfall" ? double.infinity : null,
    //           );
    //         } else {
    //           return CircularProgressIndicator();
    //         }
    //       }
    //   );
    // }

    return Stack(
      alignment: Alignment.center,
      children: [
        if(thumbProvider == null)
          loadingElementBuilder(context, null, null),

        AnimatedOpacity(
          opacity: isVisible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 300),
          child: thumbProvider != null
            ? Image(
              image: thumbProvider!, //ResizeImage(MemoryImage(_totalBytes), width: 500, allowUpscaling: true),
              fit: BoxFit.contain, //widget.settingsHandler.previewDisplay == "Waterfall" ? BoxFit.cover : BoxFit.contain,
              width: double.infinity, //widget.settingsHandler.previewDisplay == "Waterfall" ? double.infinity : null,
              height: double.infinity, //widget.settingsHandler.previewDisplay == "Waterfall" ? double.infinity : null,
            )
            : null
          ),

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
      ]
    );
  }
}
