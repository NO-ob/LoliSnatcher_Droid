
import 'dart:math';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/SearchGlobals.dart';

class ViewUtils {

  // unified http headers list generator for dio in thumb/media/video loaders
  static Map<String, String> getFileCustomHeaders(SearchGlobal searchGlobal, {bool checkForReferer = false}) {
    // a few boorus doesn't work without a browser useragent
    Map<String,String> headers = {"user-agent": "Mozilla/5.0 (Linux x86_64; rv:86.0) Gecko/20100101 Firefox/86.0"};
    // some boorus require referer header
    if(checkForReferer) {
      Booru? curBooru = searchGlobal.selectedBooru.value;
      switch (curBooru.type) {
        case 'World':
          if(curBooru.baseURL!.contains('rule34.xyz')) {
            headers["referer"] = "https://rule34xyz.b-cdn.net";
          } else if(curBooru.baseURL!.contains('rule34.world')) {
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

  static void jumpToItem(int item, SearchGlobal searchGlobal, ScrollController gridController, BuildContext context) {
    final SettingsHandler settingsHandler = Get.find();
    
    int? totalItems = searchGlobal.booruHandler.filteredFetched.length;
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
