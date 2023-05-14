import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/snatch_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/widgets/gallery/notes_renderer.dart';
import 'package:lolisnatcher/src/widgets/image/image_viewer.dart';
import 'package:lolisnatcher/src/widgets/video/guess_extension_viewer.dart';
import 'package:lolisnatcher/src/widgets/video/unknown_viewer_placeholder.dart';
import 'package:lolisnatcher/src/widgets/video/video_viewer.dart';
import 'package:lolisnatcher/src/widgets/video/video_viewer_desktop.dart';
import 'package:lolisnatcher/src/widgets/video/video_viewer_placeholder.dart';

/// This class will listen for the value of viewedItem in searchtabs
/// It will return an empty container if that item has no file URL.
/// If the file url isn't empty it will return a current media widget for the fileURL
///
class DesktopImageListener extends StatefulWidget {
  const DesktopImageListener(this.searchTab, {Key? key}) : super(key: key);
  final SearchTab searchTab;

  @override
  State<DesktopImageListener> createState() => _DesktopImageListenerState();
}

class _DesktopImageListenerState extends State<DesktopImageListener> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SnatchHandler snatchHandler = SnatchHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;
  final ViewerHandler viewerHandler = ViewerHandler.instance;

  late BooruItem item;
  StreamSubscription? itemListener;

  Timer? itemDelay;
  bool isDelayed = false;

  // TODO fix key duplicate exception when entering exiting fullscreen

  //This function decides what media widget to return
  Widget getImageWidget(BooruItem value) {
    if (value.mediaType.value.isImageOrAnimation) {
      return ImageViewer(value, 1, key: value.key);
    } else if (value.mediaType.value.isVideo) {
      if (Platform.isAndroid || Platform.isIOS) {
        return VideoViewer(value.key, value, 1, true);
      } else if (Platform.isWindows || Platform.isLinux) {
        // return VideoViewerPlaceholder(item: value, index: 1);
        return VideoViewerDesktop(value.key, value, 1);
      } else {
        return VideoViewerPlaceholder(item: value, index: 1);
      }
    } else if (value.mediaType.value.isNeedsExtraRequest) {
      return GuessExtensionViewer(
        item: value,
        index: 1,
        itemKey: value.key,
        onMediaTypeGuessed: (MediaType mediaType) {
          value.mediaType.value = mediaType;
          updateState();
        },
      );
    } else {
      return UnknownViewerPlaceholder(item: value, index: 1);
    }
  }

  @override
  void initState() {
    super.initState();
    updateListener();
  }

  @override
  void didUpdateWidget(DesktopImageListener oldWidget) {
    // force redraw on tab change
    if (oldWidget.searchTab != widget.searchTab) {
      updateListener();
    }
    super.didUpdateWidget(oldWidget);
  }

  void updateListener() {
    // listen to changes of selected item
    itemListener?.cancel();
    item = searchHandler.viewedItem.value;
    itemListener = searchHandler.viewedItem.listen((BooruItem newItem) {
      // because all items have unique globalkey, we need to force full recreation of widget by adding a small delay between builds
      isDelayed = true;
      updateState();
      item = newItem;
      itemDelay = Timer(const Duration(milliseconds: 50), () {
        isDelayed = false;
        updateState();
      });
    });
  }

  void updateState() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    itemListener?.cancel();
    super.dispose();
  }

  void delayedZoomReset() async {
    await Future.delayed(const Duration(milliseconds: 200));
    viewerHandler.resetZoom();
  }

  @override
  Widget build(BuildContext context) {
    if (searchHandler.list.isEmpty) {
      return const SizedBox();
    }

    if (item.fileURL == "") {
      return const SizedBox();
    }

    Widget itemWidget = isDelayed ? const SizedBox() : getImageWidget(item);

    return Stack(
      children: [
        if (!viewerHandler.isDesktopFullscreen.value) itemWidget,
        if (!viewerHandler.isDesktopFullscreen.value) const NotesRenderer(null),

        Container(
          alignment: Alignment.topRight,
          child: Column(
            children: [
              Container(
                width: 35,
                height: 35,
                margin: const EdgeInsets.all(10),
                child: FloatingActionButton(
                  onPressed: () {
                    snatchHandler.queue(
                      [item],
                      searchHandler.currentBooru,
                      0,
                      false,
                    );
                  },
                  child: const Icon(Icons.save),
                ),
              ),
              Container(
                width: 32,
                height: 32,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: FloatingActionButton(
                  onPressed: () {
                    if (item.isFavourite.value != null) {
                      item.isFavourite.toggle();
                      settingsHandler.dbHandler.updateBooruItem(item, "local");
                    }
                  },
                  child: Obx(() => Icon(item.isFavourite.value == true
                      ? Icons.favorite
                      : (item.isFavourite.value == false ? Icons.favorite_border : CupertinoIcons.heart_slash))),
                ),
              ),
              SizedBox(
                width: 30,
                height: 30,
                child: FloatingActionButton(
                  onPressed: () async {
                    viewerHandler.isDesktopFullscreen.value = true;
                    updateState();
                    delayedZoomReset();

                    await showDialog(
                      context: context,
                      // transitionDuration: Duration(milliseconds: 200),
                      barrierColor: Colors.black,
                      builder: (BuildContext context) {
                        return Stack(
                          children: [
                            Obx(() => viewerHandler.isDesktopFullscreen.value ? itemWidget : const SizedBox()),
                            const NotesRenderer(null),
                            Container(
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.topRight,
                              child: SizedBox(
                                width: 30,
                                height: 30,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Icon(Icons.fullscreen_exit),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );

                    viewerHandler.isDesktopFullscreen.value = false;
                    updateState();
                    delayedZoomReset();
                  },
                  child: const Icon(Icons.fullscreen),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
