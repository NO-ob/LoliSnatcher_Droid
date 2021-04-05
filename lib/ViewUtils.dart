
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/widgets/CachedThumb.dart';

class ViewUtils {

  static IconData getFileIcon(String? mediaType) {
    if (mediaType == 'image') {
      return Icons.photo;
    } else if (mediaType == 'video') {
      return CupertinoIcons.videocam_fill;
    } else if (mediaType == 'animation') {
      return CupertinoIcons.play_fill;
    } else {
      return CupertinoIcons.question;
    }
  }

  /* This will return an Image from the booruItem and will use either the sample url
  * or the thumbnail url depending on the users settings (sampleURL is much higher quality)
  *
  */
  static Widget sampleorThumb(BooruItem item, int columnCount, SettingsHandler settingsHandler) {
    IconData itemIcon = getFileIcon(item.mediaType);
    bool isThumb = settingsHandler.previewMode == "Thumbnail" || (item.mediaType == 'animation' || item.mediaType == 'video'); // item.mediaType == 'animation'; 
    String? thumbURL = isThumb ? item.thumbnailURL : item.sampleURL;

    List<List<String>> parsedTags = settingsHandler.parseTagsList(item.tagsList, isCapped: false);
    bool isHated = parsedTags[0].length > 0;
    bool isLoved = parsedTags[1].length > 0;

    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: Stack(
        alignment: settingsHandler.previewDisplay == "Waterfall" ? Alignment.center : Alignment.bottomCenter,
        children: [
          CachedThumb(thumbURL, item.mediaType!, settingsHandler, columnCount, isHated),
          Container(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.black,
                // borderRadius: BorderRadius.circular(100)
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if(item.isFavourite || isLoved)
                    Icon(
                      item.isFavourite ? Icons.favorite : Icons.star,
                      color: item.isFavourite ? Colors.red : Colors.grey,
                      size: 14,
                    ),

                  if(item.isSnatched)
                    Icon(
                      Icons.save_alt,
                      color: Colors.white,
                      size: 14,
                    ),

                  Icon(
                    itemIcon,
                    color: Colors.white,
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
        ]
      )
    );
  }

  static void jumpToItem(int item, SearchGlobals searchGlobals, ScrollController gridController, SettingsHandler settingsHandler, BuildContext context) {
    int? totalItems = searchGlobals.booruHandler!.fetched.length;
    // print("jump to item called index is: $item");
    if (totalItems > 0) {
      double viewportHeight = gridController.position.viewportDimension;
      double totalHeight = gridController.position.maxScrollExtent + viewportHeight;
      int columnsCount = (MediaQuery.of(context).orientation == Orientation.portrait)
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
      // gridController.animateTo(scrollToValue, duration: Duration(milliseconds: 300), curve: Curves.linear);
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        if(gridController.hasClients){
          gridController.animateTo(scrollToValue, duration: Duration(milliseconds: 300), curve: Curves.linear);
        }
      });
    }
  }
}
