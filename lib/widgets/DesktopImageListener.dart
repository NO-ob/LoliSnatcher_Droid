import 'dart:io';

import 'package:LoliSnatcher/widgets/MediaViewerBetter.dart';
import 'package:LoliSnatcher/widgets/VideoAppDesktop.dart';
import 'package:LoliSnatcher/widgets/VideoAppPlaceholder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/SnatchHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/widgets/VideoApp.dart';

/** This class will listen for the value of currentItem in searchGlobals
 * It will return an empty container if that item has no file URL.
 * If the file url isn't empty it will return a current media widget for the fileURL
 *
 */
class DesktopImageListener extends StatefulWidget {
  DesktopImageListener();
  @override
  _DesktopImageListenerState createState() => _DesktopImageListenerState();
}

class _DesktopImageListenerState extends State<DesktopImageListener> {
  final SettingsHandler settingsHandler = Get.find();
  final SnatchHandler snatchHandler = Get.find();
  final SearchHandler searchHandler = Get.find();

  bool isFullScreen = false;

  // TODO fix duplicate exception
  GlobalKey mediaStateKey = GlobalKey();
  GlobalKey videoStateKey = GlobalKey();

  //This function decides what media widget to return
  Widget getImageWidget(BooruItem value){
    if (!value.isVideo()) {
      return MediaViewerBetter(mediaStateKey, value, 1, searchHandler.currentTab);
    } else {
      if (Platform.isAndroid || Platform.isIOS) {
        return VideoApp(videoStateKey, value, 1, searchHandler.currentTab, true);
      } else if(Platform.isWindows) {
        return VideoAppDesktop(videoStateKey, value, 1, searchHandler.currentTab);
      } else {
        return VideoAppPlaceholder(item: value, index: 1);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // while restoring tabs
      // if(searchHandler.list.isEmpty && !searchHandler.isRestored.value) {
      if(searchHandler.list.isEmpty) {
        return const SizedBox();
      }

      BooruItem item = searchHandler.currentTab.currentItem.value;

      if (item.fileURL == "") {
        return const SizedBox();
      }

      Widget itemWidget = getImageWidget(item);

      return Stack(children: [
        Container(child: isFullScreen ? const SizedBox() : itemWidget),
        Container(
          alignment: Alignment.topRight,
          child:Column(
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
                      0
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
                    if(item.isFavourite.value != null) {
                      setState(() {
                        item.isFavourite.toggle();
                        settingsHandler.dbHandler.updateBooruItem(item, "local");
                      });
                    }
                  },
                  child: Obx(() => Icon(item.isFavourite.value == true ? Icons.favorite : (item.isFavourite.value == false ? Icons.favorite_border : CupertinoIcons.heart_slash))),
                  backgroundColor: Get.theme.colorScheme.secondary,
                ),
              ),
              Container(
                width: 30,
                height: 30,
                child: FloatingActionButton(
                  onPressed: () async {
                    isFullScreen = true;
                    setState(() { });
                    await Get.dialog(
                      Stack(
                        children: [
                          isFullScreen ? itemWidget : const SizedBox(),
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
                              )
                          )
                        ],
                      ),
                      transitionDuration: Duration(milliseconds: 200),
                      barrierColor: Colors.black,
                    );
                    isFullScreen = false;
                    setState(() { });
                  },
                  child: Icon(Icons.fullscreen),
                  backgroundColor: Get.theme.colorScheme.secondary,
                ),
              ),
            ],
          ),
        )
      ]);
    });
  }

}