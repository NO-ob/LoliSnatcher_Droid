import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';

class TagView extends StatefulWidget {
  BooruItem booruItem;
  SearchGlobals searchGlobals;
  SettingsHandler settingsHandler;
  TagView(this.booruItem, this.searchGlobals, this.settingsHandler);
  @override
  _TagViewState createState() => _TagViewState();
}

class _TagViewState extends State<TagView> {
  List<List<String>> hatedAndLovedTags = [];

  @override
  void initState() {
    super.initState();
    hatedAndLovedTags = widget.settingsHandler.parseTagsList(widget.booruItem.tagsList, isCapped: false);
  }

  @override
  Widget build(BuildContext context) {
   return Container(
      margin: EdgeInsets.all(5),
      child: ListView.builder(
          itemCount: widget.booruItem.tagsList.length,
          itemBuilder: (BuildContext context, int index) {
            String currentTag = widget.booruItem.tagsList[index];
            bool isHated = hatedAndLovedTags[0].contains(currentTag);
            bool isLoved = hatedAndLovedTags[1].contains(currentTag);
            Color tagColor = Colors.white;
            IconData? tagIcon;
            if(isHated) {
              tagColor = Colors.red;
              tagIcon = CupertinoIcons.eye_slash;
            } else if (isLoved) {
              tagColor = Colors.yellow;
              tagIcon = Icons.star;
            }

            if (currentTag != '') {
              return Column(children: <Widget>[
                Row(
                  children: [
                    const SizedBox(width: 5),
                    if(tagIcon != null)
                      ...[
                        Icon(tagIcon, color: tagColor),
                        const SizedBox(width: 5),
                      ],
                    Expanded(
                      child: GestureDetector(
                        onLongPress: () {
                          Clipboard.setData(new ClipboardData(text: currentTag));
                          ServiceHandler.displayToast('Text copied to clipboard!');
                        },
                        child: Text(currentTag, style: TextStyle(fontSize: 16)),
                      )
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
                        ServiceHandler.displayToast("Added to search\nTag: "+ currentTag);
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
                        ServiceHandler.displayToast("Added new tab\nTag: " + currentTag);
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
