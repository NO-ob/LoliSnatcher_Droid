import 'dart:ui';
import 'dart:async';

import 'package:LoliSnatcher/widgets/CustomImageProvider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as GET;

import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/ViewUtils.dart';

// attempt to move all image loading to custom ImageProvider, failed experiment 
class CachedThumbNew extends StatefulWidget {
  final BooruItem booruItem;
  final int index;
  final int columnCount;
  final SearchGlobal searchGlobal;
  final bool isHero;
  CachedThumbNew(this.booruItem, this.index, this.searchGlobal, this.columnCount, this.isHero);

  @override
  _CachedThumbNewState createState() => _CachedThumbNewState();
}

class _CachedThumbNewState extends State<CachedThumbNew> {
  final SettingsHandler settingsHandler = GET.Get.find();
  int _total = 0, _received = 0, _restartedCount = 0;
  bool? isFromCache;
  // isFailed - loading error
  bool isFailed = false;
  Timer? _debounceBytes, _restartDelay, _debounceStart;
  CancelToken _dioCancelToken = CancelToken();
  bool? isThumbQuality;
  late String thumbURL;
  late String thumbFolder;

  ImageProvider? mainProvider;
  ImageProvider? extraProvider;

  @override
  void didUpdateWidget(CachedThumbNew oldWidget) {
    // force redraw on tab change
    if(oldWidget.booruItem != widget.booruItem) {
      restartLoading();
    }
    super.didUpdateWidget(oldWidget);
  }

  void _onBytesAdded(int addedBytes, int total) {
    // always save incoming bytes, but restate only after [debounceDelay]MS
    const int debounceDelay = 250;
    bool isActive = _debounceBytes?.isActive ?? false;
    _received = addedBytes;
    _total = total;
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

    isThumbQuality = settingsHandler.previewMode == "Thumbnail" || (widget.booruItem.mediaType == 'animation' || widget.booruItem.mediaType == 'video') || (!widget.isHero && widget.booruItem.fileURL == widget.booruItem.sampleURL);
    thumbURL = isThumbQuality == true ? widget.booruItem.thumbnailURL : widget.booruItem.sampleURL;
    thumbFolder = isThumbQuality == true ? 'thumbnails' : 'samples';

    mainProvider = ResizeImage(
      LoliImage(
        thumbURL,
        headers: ViewUtils.getFileCustomHeaders(widget.searchGlobal, checkForReferer: true),
        cacheEnabled: settingsHandler.imageCache,
        cacheFolder: thumbFolder,
        onProgress: _onBytesAdded
      ),
      width: getMaxWidth().round(),
    );
    return;
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
    super.dispose();
  }

  void disposables() {
    mainProvider?.evict();
    extraProvider?.evict();
    _restartDelay?.cancel();
    _debounceBytes?.cancel();
    _debounceStart?.cancel();
    if (!(_dioCancelToken.isCancelled)){
      _dioCancelToken.cancel();
    }
  }

  double getMaxWidth() {
    double? thumbWidth = 100; // set minimum value to avoid exceptions when it attempts to render outside of the view
    final double widthLimit = (GET.Get.mediaQuery.size.width / widget.columnCount) * GET.Get.mediaQuery.devicePixelRatio * 1;
    double thumbRatio = 1;

    if (widget.booruItem.isHated.value) {
      // pixelate hated images
      thumbWidth = GET.Get.mediaQuery.size.width * 0.01; // thumbHeight = 6;
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
            // if(thumbRatio < 1) { // vertical image - resize to width
              thumbWidth = widthLimit;
            // } else { // horizontal image - resize to height
            //   thumbHeight = widthLimit * thumbRatio;
            // }
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

    // debugPrint('ThumbWidth: $thumbWidth');

    return thumbWidth;
  }

  Widget loadingElementBuilder(BuildContext ctx, Widget? child, ImageChunkEvent? loadingProgress) {
    // if (loadingProgress == null && !settingsHandler.imageCache) {
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

  Widget renderImages(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if(isThumbQuality == false && !widget.booruItem.isHated.value) // fetch thumbnail from network while loading a sample
          FadeInImage( // fade in thumbnail
            placeholder: MemoryImage(kTransparentImage),
            image: LoliImage(
              widget.booruItem.thumbnailURL,
              headers: ViewUtils.getFileCustomHeaders(widget.searchGlobal, checkForReferer: true),
              cacheEnabled: settingsHandler.imageCache,
              cacheFolder: 'thumbnails',
            ),
            fadeInDuration: Duration(milliseconds: 200),
            fit: widget.isHero ? BoxFit.cover : BoxFit.contain,
            width: widget.isHero ? double.infinity : null,
            height: widget.isHero ? double.infinity : null,
          ),

        FadeInImage( // fade in thumbnail
          placeholder: MemoryImage(kTransparentImage),
          image: mainProvider!,
          fadeInDuration: Duration(milliseconds: 200),
          fit: widget.isHero ? BoxFit.cover : BoxFit.contain,
          width: widget.isHero ? double.infinity : null,
          height: widget.isHero ? double.infinity : null,
        ),

        // if(thumbProvider == null && isHero)
        //   loadingElementBuilder(context, null, null),

        if(widget.booruItem.isHated.value)
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

  @override
  Widget build(BuildContext context) {
    if(widget.isHero) {
      return Hero(
        tag: 'imageHero' + widget.index.toString(),
        child: renderImages(context),
      );
    } else {
      return renderImages(context);
    }
  }
}
