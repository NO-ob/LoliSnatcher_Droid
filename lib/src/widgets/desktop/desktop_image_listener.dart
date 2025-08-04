import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/database_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/snatch_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/widgets/gallery/notes_renderer.dart';
import 'package:lolisnatcher/src/widgets/image/image_viewer.dart';
import 'package:lolisnatcher/src/widgets/video/guess_extension_viewer.dart';
import 'package:lolisnatcher/src/widgets/video/load_item_viewer.dart';
import 'package:lolisnatcher/src/widgets/video/video_viewer.dart';
import 'package:lolisnatcher/src/widgets/video/video_viewer_placeholder.dart';

/// This class will listen for the value of viewedItem in searchtabs
/// It will return an empty container if that item has no file URL.
/// If the file url isn't empty it will return a current media widget for the fileURL
///
class DesktopImageListener extends StatefulWidget {
  const DesktopImageListener(this.searchTab, {super.key});
  final SearchTab searchTab;

  @override
  State<DesktopImageListener> createState() => _DesktopImageListenerState();
}

class _DesktopImageListenerState extends State<DesktopImageListener> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SnatchHandler snatchHandler = SnatchHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;
  final ViewerHandler viewerHandler = ViewerHandler.instance;

  // TODO fix key duplicate exception when entering exiting fullscreen

  //This function decides what media widget to return
  Widget? getImageWidget(BooruItem? item) {
    if (item == null) {
      return null;
    }

    if (item.mediaType.value.isImageOrAnimation) {
      return Obx(
        () => ImageViewer(
          item,
          booru: searchHandler.currentBooru,
          isViewed: ViewerHandler.instance.current.value?.key == item.key,
          key: item.key,
        ),
      );
    } else if (item.mediaType.value.isVideo) {
      if (Platform.isAndroid || Platform.isIOS || Platform.isWindows || Platform.isLinux) {
        return Obx(
          () => VideoViewer(
            item,
            booru: searchHandler.currentBooru,
            isViewed: ViewerHandler.instance.current.value?.key == item.key,
            enableFullscreen: true,
            key: item.key,
          ),
        );
      } else {
        return Obx(
          () => VideoViewerPlaceholder(
            item: item,
            booru: searchHandler.currentBooru,
            key: item.key,
          ),
        );
      }
    } else if (item.mediaType.value.isNeedToGuess) {
      return Obx(
        () => GuessExtensionViewer(
          item: item,
          booru: searchHandler.currentBooru,
          onMediaTypeGuessed: (MediaType mediaType) {
            item.mediaType.value = mediaType;
            item.possibleMediaType.value = mediaType.isUnknown ? item.possibleMediaType.value : null;
            updateState();
          },
          key: item.key,
        ),
      );
    } else if (item.mediaType.value.isNeedToGuess && searchHandler.currentBooruHandler.hasLoadItemSupport) {
      return Obx(
        () => LoadItemViewer(
          item: item,
          handler: searchHandler.currentBooruHandler,
          onItemLoaded: (newItem) {
            final index = searchHandler.currentFetched.indexOf(newItem);
            if (index != -1) {
              searchHandler.currentFetched[index] = newItem;
              updateState();
            }
          },
          key: item.key,
        ),
      );
    } else {
      return Obx(
        () => GuessExtensionViewer(
          item: item,
          booru: searchHandler.currentBooru,
          onMediaTypeGuessed: (MediaType mediaType) {
            item.mediaType.value = mediaType;
            item.possibleMediaType.value = mediaType.isUnknown ? item.possibleMediaType.value : null;
            updateState();
          },
        ),
        key: item.key,
      );
      // return UnknownViewerPlaceholder(item: item, key: item.key,);
    }
  }

  void updateState() {
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> delayedZoomReset() async {
    await Future.delayed(const Duration(milliseconds: 200));
    viewerHandler.resetZoom();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (searchHandler.tabs.isEmpty) {
        return const SizedBox.shrink();
      }

      final item = searchHandler.currentTab.itemWithKey(viewerHandler.current.value?.key);
      final Widget? itemWidget = getImageWidget(item);
      if (itemWidget == null || item == null) {
        return const SizedBox.shrink();
      }

      return Stack(
        children: [
          if (!viewerHandler.isDesktopFullscreen.value) itemWidget,
          if (!viewerHandler.isDesktopFullscreen.value)
            NotesRenderer(
              item: item,
              handler: searchHandler.currentBooruHandler,
              pageController: null,
            ),
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
                        settingsHandler.dbHandler.updateBooruItem(item, BooruUpdateMode.local);
                      }
                    },
                    child: Obx(
                      () => Icon(
                        item.isFavourite.value == true
                            ? Icons.favorite
                            : (item.isFavourite.value == false ? Icons.favorite_border : CupertinoIcons.heart_slash),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: FloatingActionButton(
                    onPressed: () async {
                      viewerHandler.isDesktopFullscreen.value = true;
                      updateState();
                      unawaited(delayedZoomReset());

                      await showDialog(
                        context: context,
                        // transitionDuration: Duration(milliseconds: 200),
                        barrierColor: Colors.black,
                        builder: (BuildContext context) {
                          return Stack(
                            children: [
                              Obx(
                                () => viewerHandler.isDesktopFullscreen.value ? itemWidget : const SizedBox.shrink(),
                              ),
                              NotesRenderer(
                                item: item,
                                handler: searchHandler.currentBooruHandler,
                                pageController: null,
                              ),
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
                      unawaited(delayedZoomReset());
                    },
                    child: const Icon(Icons.fullscreen),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
