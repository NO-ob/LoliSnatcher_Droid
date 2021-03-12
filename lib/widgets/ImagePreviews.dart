import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/SnatchHandler.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/pages/settings/BooruEditPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../SearchGlobals.dart';
import 'StaggeredView.dart';
import 'WaterfallView.dart';

class ImagePreviews extends StatefulWidget {
  SettingsHandler settingsHandler;
  SearchGlobals searchGlobals;
  SnatchHandler snatchHandler;
  ImagePreviews(this.settingsHandler,this.searchGlobals,this.snatchHandler);
  @override
  _ImagePreviewsState createState() => _ImagePreviewsState();
}

class _ImagePreviewsState extends State<ImagePreviews> {
  Future<bool> nothing() async{
    return true;
  }
  @override
  Widget build(BuildContext context) {
      if (widget.settingsHandler.booruList.isEmpty){
        return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("No Booru Configs Found"),
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
                        Get.to(booruEdit(new Booru("New","","","",""),widget.settingsHandler));
                      },
                      child: Text("Open Settings", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ]
            )
        );
      } else {
        // These views will not update correctly even if setstate is called in the parent to set search globals
        // so a future builder is used the future doesn't do anything but it works like this
        return FutureBuilder(
            future: nothing(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done){
                if (widget.searchGlobals.selectedBooru != null){
                  if (widget.settingsHandler.previewDisplay == "Waterfall"){
                    return WaterfallView(widget.settingsHandler,widget.searchGlobals,widget.snatchHandler);
                  } else {
                    return StaggeredView(widget.settingsHandler,widget.searchGlobals,widget.snatchHandler);
                  }
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }
        );
      }
  }
}
