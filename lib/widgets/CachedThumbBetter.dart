import 'dart:ui';
import 'dart:async';
import 'dart:typed_data';

import 'package:LoliSnatcher/widgets/CustomImageProvider.dart';
import 'package:LoliSnatcher/widgets/DioDownloader.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/ViewUtils.dart';


class CachedThumbBetter extends StatefulWidget {
  final BooruItem booruItem;
  final int index;
  final int columnCount;
  final SearchGlobal searchGlobal;
  final bool isStandalone; // set to true when used in gallery preview to enable hero animation
  CachedThumbBetter(this.booruItem, this.index, this.searchGlobal, this.columnCount, this.isStandalone);

  @override
  _CachedThumbBetterState createState() => _CachedThumbBetterState();
}

class _CachedThumbBetterState extends State<CachedThumbBetter> {
  final SettingsHandler settingsHandler = Get.find();

  int _total = 0, _received = 0, _restartedCount = 0, _startedAt = 0;
  bool? isFromCache;
  // isFailed - loading error, isVisible - controls fade in
  bool isFailed = false, isForVideo = false;
  Timer? _debounceBytes, _restartDelay, _debounceStart;
  CancelToken _dioCancelToken = CancelToken();
  DioLoader? client, extraClient;

  bool? isThumbQuality;
  late String thumbURL;
  late String thumbFolder;

  ImageProvider? mainProvider;
  ImageProvider? extraProvider;

  StreamSubscription? hateListener;

  @override
  void didUpdateWidget(CachedThumbBetter oldWidget) {
    // force redraw on tab change
    if(oldWidget.booruItem != widget.booruItem) {
      restartLoading();
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<void> downloadThumb(bool isMain) async {
    _dioCancelToken = CancelToken();
    DioLoader newClient = DioLoader(
      isMain ? thumbURL : widget.booruItem.thumbnailURL,
      headers: ViewUtils.getFileCustomHeaders(widget.searchGlobal, checkForReferer: true),
      cancelToken: _dioCancelToken,
      onProgress: _onBytesAdded,
      onEvent: _onEvent,
      onError: _onError,
      onDone: (Uint8List bytes, String url) {
        if(isMain) {
          mainProvider = getImageProvider(bytes, url);
        } else {
          extraProvider = getImageProvider(bytes, url);
        }
        // if(!widget.isStandalone) print('$url $mainProvider ${bytes.lengthInBytes}');
        disposeClients(isMain);
        updateState();
      },
      cacheEnabled: settingsHandler.imageCache,
      cacheFolder: isMain ? thumbFolder : 'thumbnails',
      timeoutTime: 20000,
    );
    if(isMain) {
      client = newClient;
    } else {
      extraClient = newClient;
    }
    // newClient.runRequest();
    newClient.runRequestIsolate();
    return;
  }

  ImageProvider getImageProvider(Uint8List bytes, String url) {
    if(widget.booruItem.isHated.value) {
      // pixelate hated images
      return ResizeImage(MemoryImageTest(bytes, imageUrl: url), width: 10);
    }

    if(settingsHandler.disableImageScaling.value) {
      // if resizing is disabled => huge memory usage
      return MemoryImageTest(bytes, imageUrl: url);
    }

    double? thumbWidth;
    double? thumbHeight;

    if (this.mounted) {
      // mediaquery will throw an exception if we try to read it after disposing => check if mounted
      final MediaQueryData mQuery = MediaQuery.of(context);
      final double widthLimit = (mQuery.size.width / widget.columnCount) * mQuery.devicePixelRatio * 1;
      double thumbRatio = 1;
      bool hasSizeData = widget.booruItem.fileHeight != null && widget.booruItem.fileWidth != null;

      if(widget.isStandalone) {
        thumbWidth = widthLimit;
      } else {
        switch (settingsHandler.previewDisplay) {
          case 'Rectangle':
          case 'Staggered':
            // thumbRatio = 16 / 9;
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

    // return empty image if no size rectrictions were calculated (propably happens because widget is not mounted)
    if(thumbWidth == null && thumbHeight == null) {
      return MemoryImage(kTransparentImage);
    }

    return ResizeImage(
      MemoryImageTest(bytes, imageUrl: url),
      width: thumbWidth?.round(),
      height: thumbWidth == null ? thumbHeight?.round() : null,
    );
  }

  void _onBytesAdded(int received, int total) {
    // always save incoming bytes, but restate only after [debounceDelay]MS
    const int debounceDelay = 250;
    bool isActive = _debounceBytes?.isActive ?? false;
    _received = received;
    _total = total;
    if (!isActive) {
      updateState();
      _debounceBytes = Timer(const Duration(milliseconds: debounceDelay), () {});
    }
  }

  void _onEvent(String event) {
    switch (event) {
      case 'loaded':
        // 
        break;
      case 'isFromCache':
        isFromCache = true;
        break;
      case 'isFromNetwork':
        isFromCache = false;
        break;
      default:
    }
    updateState();
  }

  void _onError(Exception error) {
    //// Error handling
    if (error is DioError && CancelToken.isCancel(error)) {
      // print('Canceled by user: $error');
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
        updateState();
        // this.mounted prevents exceptions when using staggered view
      }
      print('Dio request cancelled: $error');
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

    _startedAt = DateTime.now().millisecondsSinceEpoch;

    isThumbQuality = settingsHandler.previewMode == "Thumbnail" || (widget.booruItem.mediaType == 'animation' || widget.booruItem.mediaType == 'video') || (!widget.isStandalone && widget.booruItem.fileURL == widget.booruItem.sampleURL);
    thumbURL = isThumbQuality == true ? widget.booruItem.thumbnailURL : widget.booruItem.sampleURL;
    thumbFolder = isThumbQuality == true ? 'thumbnails' : 'samples';

    // restart loading if item was marked as hated
    hateListener = widget.booruItem.isHated.listen((bool value) {
      if(value == true) {
        restartLoading();
      }
    });

    // delay loading a little to improve performance when scrolling fast
    if(widget.isStandalone) {
    _debounceStart = Timer(Duration(milliseconds: 200), () {
      if(isThumbQuality == false && !widget.booruItem.isHated.value) {
        Future.wait([
          downloadThumb(false),
          downloadThumb(true)
        ]);
      } else {
        downloadThumb(true);
      }
    });
    } else {
      if(isThumbQuality == false && !widget.booruItem.isHated.value) {
        Future.wait([
          downloadThumb(false),
          downloadThumb(true)
        ]);
      } else {
        downloadThumb(true);
      }
    }
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
    _startedAt = 0;

    isFromCache = false;

    hateListener?.cancel();

    updateState();

    selectThumbProvider();
  }

  void updateState() {
    if(this.mounted) setState(() { });
  }

  void disposeClients(bool? isMain) {
    // print('disposing class ${widget.index} $isMain');
    // dispose given or many clients
    if(isMain == true) {
      client?.dispose();
      client = null;
    } else if (isMain == false) {
      extraClient?.dispose();
      extraClient = null;
    } else {
      client?.dispose();
      client = null;
      extraClient?.dispose();
      extraClient = null;
    }
  }

  @override
  void dispose() {
    disposables();
    super.dispose();
  }

  void disposables() {
    // if(widget.isStandalone) { // evict from cache only when in grid
    mainProvider?.evict();
    mainProvider = null;
    // }
    extraProvider?.evict();
    extraProvider = null;

    _restartDelay?.cancel();
    _debounceBytes?.cancel();
    _debounceStart?.cancel();

    if (!(_dioCancelToken.isCancelled)){
      _dioCancelToken.cancel();
    }
    disposeClients(null);
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: isFromCache == false
        ? [
          SizedBox(
            width: 2,
            child: RotatedBox(
              quarterTurns: -1,
              child: LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Get.theme.accentColor),
                  backgroundColor: Colors.transparent,
                  value: percentDone),
            ),
          ),

          SizedBox(
            width: 2,
            child: RotatedBox(
              quarterTurns: -1,
              child: LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Get.theme.accentColor),
                  backgroundColor: Colors.transparent,
                  value: percentDone),
            ),
          ),
          // SizedBox(
          //   height: 100 / widget.columnCount,
          //   width: 100 / widget.columnCount,
          //   child: CircularProgressIndicator(
          //     strokeWidth: 14 / widget.columnCount,
          //     valueColor: AlwaysStoppedAnimation<Color>(GET.Get.theme.accentColor),
          //     value: percentDone,
          //   ),
          // ),
          // if(widget.columnCount < 5 && percentDoneText != null) // Text element overflows if too many thumbnails are shown
          //   ...[
          //     Padding(padding: EdgeInsets.only(bottom: 10)),
          //     Text(
          //       percentDoneText,
          //       style: TextStyle(
          //         fontSize: 12,
          //       ),
          //     ),
          //   ],
        ]
        : [],
    );
  }

  Widget renderImages(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = (screenWidth / widget.columnCount) * 0.55;

    int nowMils = DateTime.now().millisecondsSinceEpoch;
    int sinceStart = nowMils - _startedAt;
    bool showLoading = sinceStart > 500;

    return Obx(() => Stack(
      alignment: Alignment.center,
      children: [
        if(isThumbQuality == false && !widget.booruItem.isHated.value) // fetch thumbnail from network while loading a sample
          AnimatedSwitcher( // fade in image
            duration: Duration(milliseconds: widget.isStandalone ? 600 : 0),
            child: Image(
              image: extraProvider ?? MemoryImage(kTransparentImage),
              fit: widget.isStandalone ? BoxFit.cover : BoxFit.contain,
              isAntiAlias: true,
              width: double.infinity, // widget.isStandalone ? double.infinity : null,
              height: double.infinity, // widget.isStandalone ? double.infinity : null,
              key: ValueKey<bool>(extraProvider != null),
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return const Icon(Icons.broken_image, size: 30);
              },
            )
          ),

        AnimatedSwitcher( // fade in image
          duration: Duration(milliseconds: widget.isStandalone ? 300 : 10),
          child: Image(
            image: mainProvider ?? MemoryImage(kTransparentImage),
            fit: widget.isStandalone ? BoxFit.cover : BoxFit.contain,
            isAntiAlias: true,
            width: double.infinity,
            height: double.infinity,
            key: ValueKey<bool>(mainProvider != null),
            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
              _onError(exception as Exception);
              return const Icon(Icons.broken_image, size: 30);
            },
          )
        ),

        if(mainProvider == null && widget.isStandalone)
          AnimatedOpacity(
            duration: Duration(milliseconds: 200),
            curve: Curves.linear,
            opacity: showLoading ? 1 : 0,
            child: loadingElementBuilder(context, null, null),
          ),

        if(widget.booruItem.isHated.value)
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.66),
              borderRadius: BorderRadius.circular(iconSize * 0.1),
            ),
            width: iconSize,
            height: iconSize,
            child: Icon(CupertinoIcons.eye_slash, color: Colors.white)
          ),

        if (settingsHandler.showURLOnThumb.value)
          Container(
            color: Colors.black,
            child: Text(thumbURL),
          ),
      ]
    ));
  }

  @override
  Widget build(BuildContext context) {
    if(widget.isStandalone) {
      return Hero(
        tag: 'imageHero' + widget.index.toString(),
        placeholderBuilder: (BuildContext context, Size heroSize, Widget child) {
          // keep building the image since the images can be visible in the
          // background of the image gallery
          return child;
        },
        child: renderImages(context),
      );
    } else {
      return renderImages(context);
    }
  }
}
