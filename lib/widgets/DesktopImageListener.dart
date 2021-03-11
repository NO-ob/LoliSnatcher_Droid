import 'dart:io';

import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

import '../SearchGlobals.dart';
import '../SettingsHandler.dart';
import '../SnatchHandler.dart';
import 'VideoApp.dart';
import 'ViewerPage.dart';

/** This class will listen for the value of currentItem in searchGlobals
 * It will return an empty container if that item has no file URL.
 * If the file url isn't empty it will return a current media widget for the fileURL
 *
 */
class DesktopImageListener extends StatefulWidget {
  List<SearchGlobals> searchGlobals;
  int globalsIndex;
  SettingsHandler settingsHandler;
  SnatchHandler snatchHandler;
  DesktopImageListener(this.searchGlobals,this.globalsIndex, this.settingsHandler,this.snatchHandler);
  @override
  _DesktopImageListenerState createState() => _DesktopImageListenerState();
}

class _DesktopImageListenerState extends State<DesktopImageListener> {

  //This function decides what media widget to return
  Widget getImageWidget(BooruItem value){
      if (!value.isVideo() ){
        return PhotoView(imageProvider: NetworkImage(value.fileURL));
      } else {
        if (Platform.isAndroid){
          return VideoApp(value, 0, 0, widget.settingsHandler);
        } else {
          return Center(
            child: Column(
              children: [
                Expanded(
                  child:Image.network(value.thumbnailURL,fit: BoxFit.fill,),
                ),
                Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20),
                        side: BorderSide(color: Get.context!.theme.accentColor),
                      ),
                    ),
                    onPressed: (){
                      Process.run('mpv', ["--loop", "${value.fileURL}"]);
                    },
                    child: Text(" Open in Video Player ", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          );
        }
      }
  }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.searchGlobals[widget.globalsIndex].currentItem,
        builder: (BuildContext context, BooruItem value, Widget? child){
          if (value.fileURL == ""){
            return Container();
          } else {
            return Stack(
              children: [
                getImageWidget(value),
                Container(
                  alignment: Alignment.topRight,
                  child: Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          margin: EdgeInsets.all(10),
                          child:FloatingActionButton(
                            onPressed: () {
                              widget.snatchHandler.queue([value],
                                  widget.settingsHandler.jsonWrite,
                                  widget.searchGlobals[widget.globalsIndex]
                                      .selectedBooru!.name!, 0);
                            },
                            child: Icon(Icons.save),
                            backgroundColor: Get.context!.theme.primaryColor,
                          ),
                        ),
                        Container(
                          width: 32,
                          height: 32,
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child:FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                value.isFavourite = true;
                                widget.settingsHandler.dbHandler.updateBooruItem(value);
                              });
                            },
                            child: Icon(value.isFavourite ? Icons.favorite : Icons.favorite_border),
                            backgroundColor: Get.context!.theme.primaryColor,
                          ),
                        ),
                        value.isVideo() ? Container():
                        Container(
                          width: 30,
                          height: 30,
                          child:FloatingActionButton(
                            onPressed: () {
                              Get.dialog(
                                Stack(
                                  children: [
                                    getImageWidget(value),
                                    Container(
                                        padding: EdgeInsets.all(10),
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          child: FloatingActionButton(
                                            onPressed: (){
                                              Get.back();
                                            },
                                            child: Icon(Icons.close),
                                            backgroundColor: Get.context!.theme.primaryColor,
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
                            backgroundColor: Get.context!.theme.primaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        }
    );
  }

}