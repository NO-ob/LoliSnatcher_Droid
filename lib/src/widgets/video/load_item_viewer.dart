import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail.dart';

class LoadItemViewer extends StatefulWidget {
  const LoadItemViewer({
    required this.item,
    required this.handler,
    required this.onItemLoaded,
    super.key,
  });

  final BooruItem item;
  final BooruHandler handler;
  final Function(BooruItem) onItemLoaded;

  @override
  State<LoadItemViewer> createState() => _LoadItemViewerState();
}

class _LoadItemViewerState extends State<LoadItemViewer> {
  CancelToken? cancelToken;
  bool failed = false;

  @override
  void initState() {
    super.initState();

    initLoading();
  }

  @override
  void dispose() {
    cancelToken?.cancel();
    super.dispose();
  }

  Future<void> initLoading() async {
    try {
      failed = false;
      cancelToken?.cancel();
      cancelToken = CancelToken();
      setState(() {});

      if (widget.handler.hasLoadItemSupport) {
        final res = await widget.handler.loadItem(
          item: widget.item,
          cancelToken: cancelToken,
          withCapcthaCheck: true,
        );
        if (!res.failed) {
          if (res.item != null) {
            widget.onItemLoaded(res.item!);
            safeSetState();
            return;
          }
        }
      }
    } catch (e) {
      //
    }
    await Future.delayed(const Duration(milliseconds: 30));
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
    final String failedText = context.loc.media.video.failedToLoadItemData;
    final String defaultText = context.loc.media.video.loadingItemData;

    return Material(
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Thumbnail(
            item: widget.item,
            booru: widget.handler.booru,
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
                if (!failed)
                  const Center(
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(),
                    ),
                  )
                else ...[
                  ElevatedButton.icon(
                    onPressed: initLoading,
                    icon: const Icon(Icons.refresh),
                    label: Text(context.loc.media.video.retry),
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
                    label: Text(context.loc.media.video.openFileInBrowser),
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
                    label: Text(context.loc.media.video.openPostInBrowser),
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
