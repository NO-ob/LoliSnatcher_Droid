
import 'dart:math';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/widgets/CachedThumb.dart';

class ViewUtils {

  // unified http headers list generator for dio in thumb/media/video loaders
  static Map<String, String> getFileCustomHeaders(SearchGlobals searchGlobals, {bool checkForReferer = false}) {
    // a few boorus doesn't work without a browser useragent
    Map<String,String> headers = {"user-agent": "Mozilla/5.0 (Linux x86_64; rv:86.0) Gecko/20100101 Firefox/86.0"};
    // some boorus require referer header
    if(checkForReferer) {
      Booru? curBooru = searchGlobals.selectedBooru;
      switch (curBooru?.type) {
        case 'World':
          if(curBooru?.baseURL!.contains('rule34.xyz') ?? false) {
            headers["referer"] = "https://rule34xyz.b-cdn.net";
          } else if(curBooru?.baseURL!.contains('rule34.world') ?? false) {
            headers["referer"] = "https://rule34storage.b-cdn.net";
          }
          break;

        default:
          break;
      }
    }

    return headers;
  }

  static IconData getFileIcon(String? mediaType) {
    switch (mediaType) {
      case 'image':
        return Icons.photo;
      case 'video':
        return CupertinoIcons.videocam_fill;
      case 'animation':
        return CupertinoIcons.play_fill;
      case 'not_supported_animation':
        return Icons.play_disabled;
      default:
        return CupertinoIcons.question;
    }
  }

  /* This will return an Image from the booruItem and will use either the sample url
  * or the thumbnail url depending on the users settings (sampleURL is much higher quality)
  *
  */
  static Widget sampleorThumb(BooruItem item, int index, int columnCount, SettingsHandler settingsHandler, SearchGlobals searchGlobals) {
    IconData itemIcon = getFileIcon(item.mediaType);

    List<List<String>> parsedTags = settingsHandler.parseTagsList(item.tagsList, isCapped: false);
    bool isHated = parsedTags[0].length > 0;
    bool isLoved = parsedTags[1].length > 0;
    bool isSound = parsedTags[2].length > 0;

    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: Stack(
        alignment: settingsHandler.previewDisplay == "Waterfall" ? Alignment.center : Alignment.bottomCenter,
        children: [
          CachedThumb(item, index, settingsHandler, searchGlobals, columnCount, isHated),
          Container(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.66),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5))
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Text('  ${(index + 1).toString()}  ', style: TextStyle(fontSize: 10)),

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

                  if(isSound)
                    Icon(
                      Icons.volume_up_rounded,
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
