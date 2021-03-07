import 'dart:io';
import 'dart:ui';
import 'dart:async';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:LoliSnatcher/ImageWriter.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';

class CachedThumb extends StatefulWidget {
  final String thumbURL;
  final int columnCount;
  final SettingsHandler settingsHandler;
  CachedThumb(this.thumbURL, this.settingsHandler, this.columnCount);
  @override
  _CachedThumbState createState() => _CachedThumbState();
}

class _CachedThumbState extends State<CachedThumb> {
  final ImageWriter imageWriter = ImageWriter();
  int _total = 0, _received = 0;
  bool? isFromCache;
  IOClient? _client;
  StreamedResponse? _response;
  StreamSubscription? _subscription;
  List<int> _bytes = [];
  Uint8List _totalBytes = Uint8List(0);

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
      Uint8List tempBytes = await file.readAsBytes();
      setState(() {
        _totalBytes = tempBytes;
      });
      return;
    }

    // Otherwise start loading and subscribe to progress
    _client = IOClient();
    _response = await _client!.send(Request('GET', Uri.parse(widget.thumbURL)));
    _total = _response!.contentLength!;

    setState(() {
      isFromCache = false;
    });

    _subscription = _response!.stream.listen(
      (value) {
        setState(() {
          _bytes.addAll(value);
          _received += value.length;
        });
      },
      onError: (e) {
        print(e);
      },
      cancelOnError: true,
      onDone: () async {
        if (_received > (_total * 0.95)) {
          // Sometimes stream ends before fully loading, so we require at least 95% loaded to write to cache
          setState((){
            _totalBytes = Uint8List.fromList(_bytes);
          });
          if (widget.settingsHandler.imageCache) {
            await imageWriter.writeCacheFromBytes(widget.thumbURL, _bytes, 'thumbnails');
          }
        } else {
          print('Thumbnail load incomplete');
        }
      }
    );
  }

  @override
  void initState() {
    super.initState();

    _downloadImage();
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
    _client?.close();
  }

  Widget loadingElementBuilder(BuildContext ctx, Widget child, ImageChunkEvent? loadingProgress) {
    // if (loadingProgress == null && !widget.settingsHandler.imageCache) {
    //   // Resulting image for network loaded thumbnail
    //   return child;
    // }
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
    // Show progress until image bytes are fetched (either from network or cache)
    if (_totalBytes.length == 0) {
      return loadingElementBuilder(context, Center(child: Text("Error")), null);
    } else {
      return Image.memory(
        _totalBytes,
        fit: widget.settingsHandler.previewDisplay == "Waterfall" ? BoxFit.cover : BoxFit.contain ,
        width: widget.settingsHandler.previewDisplay == "Waterfall" ? double.infinity : Get.width,
        height: widget.settingsHandler.previewDisplay == "Waterfall" ? double.infinity : null,
      );
    }
  }
}
