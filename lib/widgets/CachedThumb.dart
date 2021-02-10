import 'dart:io';
import 'dart:ui';
import 'dart:async';
import 'package:get/get.dart';
import 'package:http/http.dart';
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
  bool isFromCache = false;
  StreamedResponse _response;
  File _image;
  List<int> _bytes = [];
  StreamSubscription _subscription;

  Future<void> _downloadImage() async {
    final String filePath =
        await imageWriter.getCachePath(widget.thumbURL, 'thumbnails');

    // If file is in cache - load
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
    _response = await Client().send(Request('GET', Uri.parse(widget.thumbURL)));
    _total = _response.contentLength;

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
            widget.thumbURL, _bytes, 'thumbnails');
        if (cacheFile != null) {
          setState(() {
            _image = cacheFile;
          });
        }
      } else {
        print('Thumbnail load incomplete'); // Throw an error, allow to retry?
      }
    });
  }

  @override
  void initState() {
    super.initState();

    if (widget.settingsHandler.imageCache) {
      _downloadImage();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

  Widget loadingElementBuilder(
      BuildContext ctx, Widget child, ImageChunkEvent loadingProgress) {
    if (loadingProgress == null && !widget.settingsHandler.imageCache) {
      // Resulting image for network loaded thumbnail
      return child;
    }
    bool hasProgressData = (loadingProgress != null && loadingProgress.expectedTotalBytes != null) || (widget.settingsHandler.imageCache && _total != null && _total > 0);
    bool isProgressFromCaching = widget.settingsHandler.imageCache && hasProgressData && _total != null && _total > 0;
    int expectedBytes = hasProgressData ? (isProgressFromCaching ? _received : loadingProgress.cumulativeBytesLoaded) : null;
    int totalBytes = hasProgressData ? (isProgressFromCaching ? _total : loadingProgress.expectedTotalBytes) : null;

    double percentDone = hasProgressData ? expectedBytes / totalBytes : null;
    String percentDoneText = hasProgressData ? ((percentDone * 100).toStringAsFixed(2) + '%') : 'Loading...';
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 100 / widget.columnCount,
          width: 100 / widget.columnCount,
          child: CircularProgressIndicator(
            strokeWidth: 16 / widget.columnCount,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.pink[300]),
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
    // Load from network if caching is disabled
    if (!widget.settingsHandler.imageCache) {
      return Image.network(widget.thumbURL,
          fit: widget.settingsHandler.previewDisplay == "Waterfall" ? BoxFit.cover : BoxFit.contain,
          width: widget.settingsHandler.previewDisplay == "Waterfall" ? double.infinity : Get.width,
          height: widget.settingsHandler.previewDisplay == "Waterfall" ? double.infinity : null,
          loadingBuilder: loadingElementBuilder);
    } else {
      // Show progress until image is saved to/retrieved from cache
      if (_image == null) {
        return Center(child: loadingElementBuilder(context, null, null));
      } else {
        return Image.file(
          _image,
          fit: widget.settingsHandler.previewDisplay == "Waterfall" ? BoxFit.cover : BoxFit.contain ,
          width: widget.settingsHandler.previewDisplay == "Waterfall" ? double.infinity : Get.width,
          height: widget.settingsHandler.previewDisplay == "Waterfall" ? double.infinity : null,
        );
      }
    }
  }
}
