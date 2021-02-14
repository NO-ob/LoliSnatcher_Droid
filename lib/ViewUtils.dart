
import 'dart:math';
import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/widgets/CachedThumb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SettingsHandler.dart';
import 'libBooru/BooruItem.dart';

class ViewUtils {

  static List<dynamic> getFileTypeAndIcon(String fileExt) {
    if (['jpg', 'jpeg', 'png'].any((val) => fileExt.contains(val))) {
      return ['image', Icons.photo];
    } else if (['webm', 'mp4'].any((val) => fileExt.contains(val))) {
      return ['video', CupertinoIcons.videocam_fill];
    } else if (['gif'].any((val) => fileExt.contains(val))) {
      return ['gif', CupertinoIcons.play_fill];
    } else {
      return ['other', CupertinoIcons.question];
    }
  }
  /* This will return an Image from the booruItem and will use either the sample url
  * or the thumbnail url depending on the users settings (sampleURL is much higher quality)
  *
  */
  static Widget sampleorThumb(BooruItem item, int columnCount, SettingsHandler settingsHandler) {
    List<dynamic> itemType = getFileTypeAndIcon(item.fileExt);
    bool isThumb = settingsHandler.previewMode == "Thumbnail" ||
        (itemType[0] == 'gif' || itemType[0] == 'video');
    String thumbURL = isThumb ? item.thumbnailURL : item.sampleURL;
    return Stack(alignment: settingsHandler.previewDisplay == "Waterfall" ? Alignment.center : Alignment.bottomCenter, children: [
      CachedThumb(thumbURL, settingsHandler, columnCount),
      Container(
        alignment: Alignment.bottomRight,
        child: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.black,
            // borderRadius: BorderRadius.circular(100)
          ),
          child: Icon(
            itemType[1],
            color: Colors.white,
            size: 14,
          ),
        ),
      ),
    ]);
  }
  static void jumpToItem(int item, SearchGlobals searchGlobals, ScrollController gridController, SettingsHandler settingsHandler, BuildContext context) {
    int totalItems = searchGlobals.booruHandler.fetched.length;
    print("jump to item called index is: $item");
    if (totalItems > 0) {
      double viewportHeight = gridController.position.viewportDimension;
      double totalHeight =
          gridController.position.maxScrollExtent + viewportHeight;
      int columnsCount =
      (MediaQuery.of(context).orientation == Orientation.portrait)
          ? settingsHandler.portraitColumns
          : settingsHandler.landscapeColumns;
      int rowCount = (totalItems / columnsCount).ceil();
      double rowHeight = totalHeight / rowCount;
      double rowsPerViewport = viewportHeight / rowHeight;

      int currentRow = (item / columnsCount).floor();
      // scroll to the row of the current item
      // but if we can't scroll to the top of this row (rows left < rowsPerViewport) - scroll to the max and trigger page load
      bool isCloseToEdge = (rowCount - currentRow) <= rowsPerViewport;
      double scrollToValue =
      isCloseToEdge ? totalHeight : max((rowHeight * currentRow), 0.0);

      // print('SCROLL CONTROLLER');
      // print(widget.gridController.position);
      // print(newValue);

      //gridController.jumpTo(scrollToValue);
      gridController.animateTo(scrollToValue, duration: Duration(milliseconds: 300), curve: Curves.linear);
    }
  }
}
