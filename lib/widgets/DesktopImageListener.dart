import 'dart:io';

import 'package:LoliSnatcher/widgets/MediaViewerBetter.dart';
import 'package:LoliSnatcher/widgets/VideoAppDesktop.dart';
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

  //This function decides what media widget to return
  Widget getImageWidget(BooruItem value){
      if (!value.isVideo()){
        return MediaViewerBetter(value, 1, searchHandler.currentTab);
      } else {
        if (Platform.isAndroid || Platform.isIOS) {
          return VideoApp(value, 1, searchHandler.currentTab, true);
        } else {
          return VideoAppDesktop(value, 1, searchHandler.currentTab);

          // return Center(
          //   child: Column(
          //     children: [
          //       Expanded(
          //         child: Image.network(value.thumbnailURL, fit: BoxFit.fill),
          //       ),
          //       Container(
          //         alignment: Alignment.center,
          //         child: TextButton(
          //           style: TextButton.styleFrom(
          //             shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(20),
          //               side: BorderSide(color: Get.theme.colorScheme.secondary),
          //             ),
          //           ),
          //           onPressed: (){
          //             Process.run('mpv', ["--loop", "${value.fileURL}"]);
          //           },
          //           child: Text(" Open in Video Player "),
          //         ),
          //       ),
          //     ],
          //   ),
          // );
        }
      }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // while restoring tabs
      if(searchHandler.list.isEmpty && !searchHandler.isRestored.value) {
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
                    setState(() {
                      item.isFavourite.toggle();
                      settingsHandler.dbHandler.updateBooruItem(item, "local");
                    });
                  },
                  child: Icon(item.isFavourite.value ? Icons.favorite : Icons.favorite_border),
                  backgroundColor: Get.theme.colorScheme.secondary,
                ),
              ),
              // TODO with videoappdesktop we can now play videos, now we need a fullscreen that will reuse the same widget without restarting video/recreating a widget
              Container(
                width: 30,
                height: 30,
                child: FloatingActionButton(
                  onPressed: () {
                    isFullScreen = true;
                    setState(() { });
                    Get.dialog(
                      Stack(
                        children: [
                          itemWidget,
                          Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.topRight,
                              child: Container(
                                width: 30,
                                height: 30,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    isFullScreen = false;
                                    setState(() { });
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