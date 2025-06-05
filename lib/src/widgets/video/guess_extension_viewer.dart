import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail.dart';

class GuessExtensionViewer extends StatefulWidget {
  const GuessExtensionViewer({
    required this.item,
    required this.booru,
    required this.onMediaTypeGuessed,
    super.key,
  });

  final BooruItem item;
  final Booru booru;
  final Function(MediaType) onMediaTypeGuessed;

  @override
  State<GuessExtensionViewer> createState() => _GuessExtensionViewerState();
}

class _GuessExtensionViewerState extends State<GuessExtensionViewer> {
  CancelToken? cancelToken;
  bool failed = false;
  String currentExtension = 'head content-type';

  @override
  void initState() {
    super.initState();

    startGuessing();
  }

  @override
  void dispose() {
    cancelToken?.cancel();
    super.dispose();
  }

  Future<void> startGuessing() async {
    // check mimetype of original file url
    try {
      failed = false;
      cancelToken?.cancel();
      cancelToken = CancelToken();
      currentExtension = 'head content-type';
      safeSetState();
      final mimeRes = await DioNetwork.head(
        widget.item.fileURL,
        cancelToken: cancelToken,
      );
      if (mimeRes.statusCode == 200) {
        if (mimeRes.headers['content-type'] != null) {
          final contentType = mimeRes.headers['content-type']?[0];
          MediaType? mediaType;
          if (contentType?.contains('video') == true) {
            mediaType = MediaType.video;
          } else if (contentType?.contains('image') == true) {
            if (contentType?.contains('gif') == true) {
              mediaType = MediaType.animation;
            } else {
              mediaType = MediaType.image;
            }
          }
          //
          if (mediaType != null) {
            widget.item.fileExt = contentType!.split('/')[1];
            widget.onMediaTypeGuessed(mediaType);
            safeSetState();
            return;
          }
        }
      }
    } catch (e) {
      //
    }
    await Future.delayed(const Duration(milliseconds: 30));

    // or go through each possible file ext until one of them loads successfully
    final videoExtensions = ['webm', 'mp4'];
    final gifExtensions = ['gif'];
    final imageExtensions = ['jpg', 'png', 'jpeg'];
    List<String> possibleExtensions = [];

    if (widget.item.possibleMediaType.value?.isAnimation == true) {
      possibleExtensions = [...gifExtensions, ...videoExtensions, ...imageExtensions];
    } else if (widget.item.possibleMediaType.value?.isVideo == true) {
      possibleExtensions = [...videoExtensions, ...imageExtensions, ...gifExtensions];
    } else if (widget.item.fileURL.contains('realbooru.com')) {
      // videos are still in front because realbooru can have both image (video thumbnail) and video under same url (minus extension)
      possibleExtensions = [...videoExtensions, ...imageExtensions, ...gifExtensions];
    } else {
      possibleExtensions = [...imageExtensions, ...gifExtensions, ...videoExtensions];
    }

    for (final String extension in possibleExtensions) {
      try {
        currentExtension = extension;
        safeSetState();

        // TODO run multiple requests at once through Future.wait? (at least from the same category)

        // HEAD request, because we don't need the actual file, just its status code
        final res = await DioNetwork.head(
          '${widget.item.fileURL.replaceAll(RegExp(r'\.\w+$'), '')}.$extension',
          cancelToken: cancelToken,
        );

        if (res.statusCode == 200) {
          widget.item.fileURL = '${widget.item.fileURL.replaceAll(RegExp(r'\.\w+$'), '')}.$extension';
          widget.onMediaTypeGuessed(MediaType.fromExtension(extension));
          safeSetState();
          return;
        }

        // 30ms should be okay to not hammer their servers too much?
        await Future.delayed(const Duration(milliseconds: 30));
      } catch (e) {
        continue;
      }
    }
    failed = true;
    safeSetState();
  }

  void safeSetState() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    const String failedText = 'Failed to guess the file extension/Unknown file type';
    const String defaultText = 'Guessing file extension...';

    return Material(
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Thumbnail(
            item: widget.item,
            booru: widget.booru,
            isStandalone: false,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  failed ? failedText : defaultText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                if (failed) ...[
                  ElevatedButton.icon(
                    onPressed: startGuessing,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      launchUrlString(
                        widget.item.fileURL,
                        mode: LaunchMode.externalApplication,
                      );
                    },
                    icon: const Icon(Icons.public),
                    label: const Text('Open file in browser'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      launchUrlString(
                        widget.item.postURL,
                        mode: LaunchMode.externalApplication,
                      );
                    },
                    icon: const Icon(Icons.public),
                    label: const Text('Open post in browser'),
                  ),
                ] else ...[
                  const Text(
                    'Currently checking:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    currentExtension,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
