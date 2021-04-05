import 'dart:io';
import 'dart:ui';
import 'dart:async';
import 'dart:typed_data';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:LoliSnatcher/ImageWriter.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';

class CachedThumb extends StatefulWidget {
  final String thumbURL;
  final String thumbType;
  final int columnCount;
  final SettingsHandler settingsHandler;
  CachedThumb(this.thumbURL,this.thumbType, this.settingsHandler, this.columnCount);
  @override
  _CachedThumbState createState() => _CachedThumbState();
}

class _CachedThumbState extends State<CachedThumb> {
  final ImageWriter imageWriter = ImageWriter();
  int _total = 0, _received = 0, _restartedCount = 0;
  bool? isFromCache;
  bool isFailed = false;
  Timer? _debounceBytes, _restartDelay;
  Dio? _client;
  CancelToken? _dioCancelToken;
  ImageProvider? thumbProvider;

  /// Author: [Nani-Sore] ///
  Future<void> _downloadImage() async {
    final String? filePath = await imageWriter.getCachePath(widget.thumbURL, 'thumbnails');

    // If file is in cache - load
    if (filePath != null) {
      final File file = File(filePath);
      setState(() {
        // multiple restates in the same function is usually bad practice, but we need this to notify user how the file is loaded while we await for bytes
        isFromCache = true;
      });
      // load bytes first, then trigger an empty restate
      thumbProvider = ResizeImage(MemoryImage(await file.readAsBytes()), width: 500); // allowUpscaling: true
      setState(() {});
      return;
    } else {
      setState(() {
        isFromCache = false;
      });
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
        _total = total;
        _onBytesAdded(received);
      },
    ).then((value) {
      // Sometimes stream ends before fully loading, so we require at least 95% loaded to write to cache
      if (value.data != null && _received > (_total * 0.95)) {
        // Sometimes stream ends before fully loading, so we require at least 95% loaded to write to cache
        thumbProvider = ResizeImage(MemoryImage(Uint8List.fromList(value.data!)), width: 500); // allowUpscaling: true
        setState((){ });
        if (widget.settingsHandler.imageCache) {
          imageWriter.writeCacheFromBytes(widget.thumbURL, value.data!, 'thumbnails');
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
          setState(() {
            isFailed = true;
          });
        }
        print('Dio request cancelled: $e');
      }
    });
  }

  /// Author: [Nani-Sore] ///
  void _onBytesAdded(int addedBytes) {
    // always save incoming bytes, but restate only after [debounceDelay]MS
    const int debounceDelay = 50;
    bool isActive = _debounceBytes?.isActive ?? false;
    if (isActive) {
      _received = addedBytes;
    } else {
      setState(() {
        _received = addedBytes;
      });
      _debounceBytes = Timer(const Duration(milliseconds: debounceDelay), () {});
    }
  }

  @override
  void initState() {
    super.initState();

    _downloadImage();
  }

  void restartLoading() {
    disposables();

    setState(() {
      _total = 0;
      _received = 0;

      isFromCache = false;
    });

    _downloadImage();
  }

  @override
  void dispose() {
    disposables();
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

  Widget loadingElementBuilder(BuildContext ctx, Widget child, ImageChunkEvent? loadingProgress) {
    // if (loadingProgress == null && !widget.settingsHandler.imageCache) {
    //   // Resulting image for network loaded thumbnail
    //   return child;
    // }

    if(isFailed) {
      return child;
    }

    bool hasProgressData = (loadingProgress != null && loadingProgress.expectedTotalBytes != null) || (_total > 0);
    bool isProgressFromCaching = hasProgressData && _total > 0;
    int? expectedBytes = (hasProgressData ? (isProgressFromCaching ? _received : loadingProgress!.cumulativeBytesLoaded) : null);
    int? totalBytes = (hasProgressData ? (isProgressFromCaching ? _total : loadingProgress!.expectedTotalBytes) : null);

    double? percentDone = (hasProgressData ? expectedBytes! / totalBytes! : null);
    String percentDoneText = hasProgressData ? ((percentDone! * 100).toStringAsFixed(2) + '%') : 'Loading...';
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: (isFromCache == null || isFromCache == true) ? [] : [
        SizedBox(
          height: 100 / widget.columnCount,
          width: 100 / widget.columnCount,
          child: CircularProgressIndicator(
            strokeWidth: 16 / widget.columnCount,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.pink[300]!),
            value: percentDone,
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 10)),
        widget.columnCount < 4 // Text element overflows if too many thumbnails are shown
            ? Text(
          percentDoneText,
          style: TextStyle(
            fontSize: 12,
          ),
        )
            : Container(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.thumbType == "video" &&
        (widget.thumbURL.endsWith(".webm") || widget.thumbURL.endsWith(".mp4"))){
      ServiceHandler serviceHandler = ServiceHandler();
      return FutureBuilder(
          future: serviceHandler.makeVidThumb(widget.thumbURL), // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData){
              return Image(
                image: ResizeImage(MemoryImage(Uint8List.fromList(snapshot.data!)), width: 500), //ResizeImage(MemoryImage(_totalBytes), width: 500, allowUpscaling: true),
                fit: widget.settingsHandler.previewDisplay == "Waterfall" ? BoxFit.cover : BoxFit.contain ,
                width: widget.settingsHandler.previewDisplay == "Waterfall" ? double.infinity : Get.width,
                height: widget.settingsHandler.previewDisplay == "Waterfall" ? double.infinity : null,
              );
            } else {
              return CircularProgressIndicator();
            }
          }
      );
    } else if (thumbProvider == null) { // (_totalBytes.length == 0) {
      return loadingElementBuilder(context, Center(child: Text("Error")), null);
    } else {
      return Image(
        image: thumbProvider!, //ResizeImage(MemoryImage(_totalBytes), width: 500, allowUpscaling: true),
        fit: widget.settingsHandler.previewDisplay == "Waterfall" ? BoxFit.cover : BoxFit.contain ,
        width: widget.settingsHandler.previewDisplay == "Waterfall" ? double.infinity : Get.width,
        height: widget.settingsHandler.previewDisplay == "Waterfall" ? double.infinity : null,
      );
    }
  }
}
