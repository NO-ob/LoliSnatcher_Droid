import 'dart:async';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/image/custom_network_image.dart';
import 'package:lolisnatcher/src/widgets/preview/shimmer_builder.dart';

class Favicon extends StatefulWidget {
  const Favicon(
    this.booru, {
    this.size = iconSize,
    this.color,
    super.key,
  });

  final Booru booru;
  final double size;
  final Color? color;

  static const double iconSize = 20;

  @override
  State<Favicon> createState() => _FaviconState();
}

class _FaviconState extends State<Favicon> {
  bool isFailed = false, isLoaded = false, manualReloadTapped = false;
  CancelToken? cancelToken;
  ImageProvider? mainProvider;
  ImageStream? imageStream;
  ImageStreamListener? imageListener;
  String? errorCode;

  double get size => widget.size;

  @override
  void didUpdateWidget(Favicon oldWidget) {
    // force redraw on tab change
    if (oldWidget.booru.faviconURL != widget.booru.faviconURL) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        restartLoading();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<ImageProvider> getImageProvider() async {
    cancelToken ??= CancelToken();
    return ResizeImage(
      CustomNetworkImage(
        widget.booru.faviconURL!,
        withCache: true,
        headers: await Tools.getFileCustomHeaders(widget.booru),
        cacheFolder: 'favicons',
        fileNameExtras: 'favicon_',
        cancelToken: cancelToken,
        sendTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        onError: onError,
      ),
      width: (size * 5).toInt(),
      height: (size * 5).toInt(),
    );
  }

  Future<void> onError(Object error) async {
    //// Error handling
    if (error is DioException && CancelToken.isCancel(error)) {
      //
    } else {
      if (error is Exception && (error as dynamic).message == 'Invalid image data') {
        await ((mainProvider! as ResizeImage).imageProvider as CustomNetworkImage).deleteCacheFile();
        disposables();
      }
      if (error is DioException && error.response != null && Tools.isGoodStatusCode(error.response!.statusCode) == false) {
        if (manualReloadTapped && (error.response!.statusCode == 403 || error.response!.statusCode == 503)) {
          await Tools.checkForCaptcha(error.response, error.requestOptions.uri);
          unawaited(restartLoading());
          manualReloadTapped = false;
        }
        errorCode = error.response!.statusCode.toString();
      }

      isFailed = true;
      Future.delayed(const Duration(milliseconds: 300), updateState);
    }
  }

  @override
  void initState() {
    super.initState();
    restartLoading();
  }

  void updateState() {
    if (mounted) setState(() {});
  }

  Future<void> restartLoading() async {
    if (mounted) {
      await mainProvider?.evict();
    }
    disposables();

    isFailed = false;
    errorCode = null;

    updateState();

    mainProvider ??= await getImageProvider();

    imageStream?.removeListener(imageListener!);
    imageStream = mainProvider!.resolve(ImageConfiguration.empty);
    imageListener = ImageStreamListener(
      (imageInfo, syncCall) {
        isLoaded = true;
        if (!syncCall) {
          updateState();
        }
      },
      onError: (e, s) {
        Logger.Inst().log(
          'Failed to load favicon: ${widget.booru.faviconURL}',
          'Favicon',
          'build',
          LogTypes.imageLoadingError,
          s: s,
        );
        onError(e);
      },
    );
    imageStream!.addListener(imageListener!);

    updateState();
  }

  @override
  void dispose() {
    disposables();
    super.dispose();
  }

  void disposables() {
    imageStream?.removeListener(imageListener!);
    imageStream = null;
    imageListener = null;

    mainProvider = null;

    if (!(cancelToken != null && cancelToken!.isCancelled)) {
      cancelToken?.cancel();
    }
    cancelToken = null;
  }

  @override
  Widget build(BuildContext context) {
    // print('Favicon build ${widget.faviconURL}');

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(size / 5),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (mainProvider != null)
            Image(
              image: mainProvider!,
              width: size,
              height: size,
              fit: BoxFit.fill,
              filterQuality: FilterQuality.medium,
              isAntiAlias: true,
              errorBuilder: (_, Object exception, ___) {
                return FaviconError(
                  iconSize: size,
                  color: widget.color ?? Theme.of(context).colorScheme.onSurface,
                  code: errorCode,
                  onRestart: () {
                    manualReloadTapped = true;
                    restartLoading();
                  },
                );
              },
            )
          else if (isFailed)
            FaviconError(
              iconSize: size,
              color: Colors.grey,
              code: errorCode,
              onRestart: () {
                manualReloadTapped = true;
                restartLoading();
              },
            ),
          //
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: (isLoaded || isFailed)
                ? const SizedBox.shrink()
                : ClipRRect(
                    borderRadius: BorderRadius.circular(size / 5),
                    child: ShimmerCard(
                      isLoading: !isLoaded && !isFailed,
                      child: !isLoaded && !isFailed ? null : const SizedBox.shrink(),
                    ),
                  ),
          ),

          // Image(
          //   image: NetworkImage(widget.booru.faviconURL!),
          //   width: size,
          //   height: size,
          //   errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
          //     return const Icon(Icons.broken_image, size: size);
          //   },
          // ),
        ],
      ),
    );
  }
}

class FaviconError extends StatelessWidget {
  const FaviconError({
    this.iconSize = Favicon.iconSize,
    this.color = Colors.grey,
    this.code,
    this.onRestart,
    super.key,
  });

  final double iconSize;
  final Color color;
  final String? code;
  final VoidCallback? onRestart;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onRestart,
        child: Stack(
          children: [
            Center(
              child: Icon(
                Icons.broken_image,
                size: iconSize,
                color: color,
              ),
            ),
            if (code != null)
              Center(
                child: FittedBox(
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.error,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      code!,
                      style: TextStyle(
                        fontSize: 10,
                        color: Theme.of(context).colorScheme.onError,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
