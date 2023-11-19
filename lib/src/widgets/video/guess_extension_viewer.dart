import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail.dart';

class GuessExtensionViewer extends StatefulWidget {
  const GuessExtensionViewer({
    required this.item,
    required this.index,
    required this.itemKey,
    required this.onMediaTypeGuessed,
    super.key,
  });

  final BooruItem item;
  final int index;
  final Key itemKey;
  final Function(MediaType) onMediaTypeGuessed;

  @override
  State<GuessExtensionViewer> createState() => _GuessExtensionViewerState();
}

class _GuessExtensionViewerState extends State<GuessExtensionViewer> {
  late Dio client;
  CancelToken? cancelToken;
  bool failed = false;
  String currentExtension = '';

  @override
  void initState() {
    super.initState();
    client = DioNetwork.getClient();
    cancelToken = CancelToken();

    startGuessing();
  }

  @override
  void dispose() {
    cancelToken?.cancel();
    super.dispose();
  }

  Future<void> startGuessing() async {
    final videoExtensions = ['webm', 'mp4'];
    final gifExtensions = ['gif'];
    final imageExtensions = ['jpg', 'png', 'jpeg'];
    List<String> possibleExtensions = [];

    if (widget.item.possibleExt.value == 'animation') {
      possibleExtensions = [...gifExtensions, ...videoExtensions, ...imageExtensions];
    } else if (widget.item.possibleExt.value == 'video') {
      possibleExtensions = [...videoExtensions, ...imageExtensions, ...gifExtensions];
    } else {
      // videos are still in front because realbooru can have both image (video thumbnail) and video under same url (minus extension)
      possibleExtensions = [...videoExtensions, ...imageExtensions, ...gifExtensions];
    }

    for (final String extension in possibleExtensions) {
      try {
        currentExtension = extension;
        setState(() {});

        // TODO run multiple requests at once through Future.wait? (at least from the same category)

        // HEAD request, because we don't need the actual file, just its status code
        final res = await client.head(
          '${widget.item.fileURL.replaceAll(RegExp(r'\.\w+$'), '')}.$extension',
          cancelToken: cancelToken,
        );

        if (res.statusCode == 200) {
          widget.item.fileURL = '${widget.item.fileURL.replaceAll(RegExp(r'\.\w+$'), '')}.$extension';
          widget.onMediaTypeGuessed(MediaType.fromExtension(extension));
          setState(() {});
          return;
        }

        // 30ms should be okay to not hammer their servers too much?
        await Future.delayed(const Duration(milliseconds: 30));
      } catch (e) {
        continue;
      }
    }
    failed = true;
  }

  @override
  Widget build(BuildContext context) {
    const String failedText = 'Failed to guess the file extension';
    const String defaultText = 'Guessing file extension...';

    return Material(
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Thumbnail(
            item: widget.item,
            isStandalone: false,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  failed ? failedText : defaultText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                if (failed) ...[
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                    onPressed: () {
                      failed = false;
                      startGuessing();
                      setState(() {});
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
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
                  const CircularProgressIndicator(),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
