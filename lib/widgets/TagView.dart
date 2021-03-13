import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../SearchGlobals.dart';
import '../ServiceHandler.dart';

class TagView extends StatefulWidget {
  BooruItem booruItem;
  SearchGlobals searchGlobals;
  TagView(this.booruItem,this.searchGlobals);
  @override
  _TagViewState createState() => _TagViewState();
}

class _TagViewState extends State<TagView> {
  @override
  Widget build(BuildContext context) {
   return Container(
      margin: EdgeInsets.all(5),
      child: ListView.builder(
          itemCount: widget.booruItem.tagsList!.length,
          itemBuilder: (BuildContext context, int index) {
            String currentTag = widget.booruItem.tagsList![index];
            if (currentTag != '') {
              return Column(children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: Text(currentTag),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Get.context!.theme.accentColor,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.searchGlobals.addTag!.value = " " + currentTag;
                        });
                        ServiceHandler.displayToast("Added to search \n Tag: "+ currentTag);
                        //Get.snackbar("Added to search", "Tag: " + currentTag, snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: Colors.black, backgroundColor: Get.context!.theme.primaryColor);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.fiber_new,
                          color: Get.context!.theme.accentColor),
                      onPressed: () {
                        setState(() {
                          widget.searchGlobals.newTab!.value = currentTag;
                        });
                        ServiceHandler.displayToast("Added new tab \n Tag: " + currentTag);
                        //Get.snackbar("Added new tab", "Tag: " + currentTag, snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: Colors.black, backgroundColor: Get.context!.theme.primaryColor);
                      },
                    ),
                  ],
                ),
                Divider(
                  color: Colors.white,
                  height: 2,
                ),
              ]);
            } else {
              // Render nothing if currentTag is an empty string
              return Container();
            }
          }),
    );
  }
}
