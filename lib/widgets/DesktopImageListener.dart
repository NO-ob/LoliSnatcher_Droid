import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/SnatchHandler.dart';
import 'package:LoliSnatcher/ViewerHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/widgets/VideoApp.dart';
import 'package:LoliSnatcher/widgets/MediaViewerBetter.dart';
import 'package:LoliSnatcher/widgets/VideoAppDesktop.dart';
import 'package:LoliSnatcher/widgets/VideoAppPlaceholder.dart';
import 'package:LoliSnatcher/widgets/NotesRenderer.dart';

/** This class will listen for the value of viewedItem in searchGlobals
 * It will return an empty container if that item has no file URL.
 * If the file url isn't empty it will return a current media widget for the fileURL
 *
 */
class DesktopImageListener extends StatefulWidget {
  final SearchGlobal searchGlobal;
  DesktopImageListener(this.searchGlobal);
  @override
  _DesktopImageListenerState createState() => _DesktopImageListenerState();
}

class _DesktopImageListenerState extends State<DesktopImageListener> {
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final SnatchHandler snatchHandler = Get.find<SnatchHandler>();
  final SearchHandler searchHandler = Get.find<SearchHandler>();
  final ViewerHandler viewerHandler = Get.find<ViewerHandler>();

  late BooruItem item;
  StreamSubscription? itemListener;

  Timer? itemDelay;
  bool isDelayed = false;

  // TODO fix key duplicate exception when entering exiting fullscreen

  //This function decides what media widget to return
  Widget getImageWidget(BooruItem value) {
    if (value.isImage()) {
      return MediaViewerBetter(value.key, value, 1, searchHandler.currentTab);
    } else if (value.isVideo()) {
      if (Platform.isAndroid || Platform.isIOS) {
        return VideoApp(value.key, value, 1, searchHandler.currentTab, true);
      } else if (Platform.isWindows || Platform.isLinux) {
        return VideoAppDesktop(value.key, value, 1, searchHandler.currentTab);
      } else {
        return VideoAppPlaceholder(item: value, index: 1);
      }
    } else {
      return UnknownPlaceholder(item: value, index: 1);
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
    if (oldWidget.searchGlobal != widget.searchGlobal) {
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
      itemDelay = Timer(Duration(milliseconds: 50), () {
        isDelayed = false;
        updateState();
      });
    });
  }

  void updateState() {
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    itemListener?.cancel();
    super.dispose();
  }

  void delayedZoomReset() async {
    await Future.delayed(Duration(milliseconds: 200));
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
        if (!viewerHandler.isDesktopFullscreen.value) NotesRenderer(),

        Container(
          alignment: Alignment.topRight,
          child: Column(
            children: [
              Container(
                width: 35,
                height: 35,
                margin: EdgeInsets.all(10),
                child: FloatingActionButton(
                  onPressed: () {
                    snatchHandler.queue(
                      [item],
                      searchHandler.currentTab.selectedBooru.value,
                      0,
                    );
                  },
                  child: Icon(Icons.save),
                  backgroundColor: Get.theme.colorScheme.secondary,
                ),
              ),
              Container(
                width: 32,
                height: 32,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                  backgroundColor: Get.theme.colorScheme.secondary,
                ),
              ),
              Container(
                width: 30,
                height: 30,
                child: FloatingActionButton(
                  onPressed: () async {
                    viewerHandler.isDesktopFullscreen.value = true;
                    updateState();
                    delayedZoomReset();

                    await Get.dialog(
                      Stack(
                        children: [
                          Obx(() => viewerHandler.isDesktopFullscreen.value ? itemWidget : const SizedBox()),
                          NotesRenderer(),
                          Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 30,
                              height: 30,
                              child: FloatingActionButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Icon(Icons.fullscreen_exit),
                                backgroundColor: Get.theme.colorScheme.secondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      transitionDuration: Duration(milliseconds: 200),
                      barrierColor: Colors.black,
                    );

                    viewerHandler.isDesktopFullscreen.value = false;
                    updateState();
                    delayedZoomReset();
                  },
                  child: Icon(Icons.fullscreen),
                  backgroundColor: Get.theme.colorScheme.secondary,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
