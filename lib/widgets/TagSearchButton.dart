import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TagSearchButton extends StatefulWidget {
  TagSearchButton({Key? key}) : super(key: key);

  @override
  _TagSearchButtonState createState() => _TagSearchButtonState();
}

class _TagSearchButtonState extends State<TagSearchButton> {
  final SearchHandler searchHandler = Get.find<SearchHandler>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onSecondaryTap: () {
        searchHandler.searchTextController.clearComposing();
        searchHandler.searchBoxFocus.unfocus();
        searchHandler.addTabByString(searchHandler.searchTextController.text, switchToNew: true);
      },
      onLongPress: () {
        searchHandler.searchTextController.clearComposing();
        searchHandler.searchBoxFocus.unfocus();
        searchHandler.addTabByString(searchHandler.searchTextController.text, switchToNew: true);
      },
      child: IconButton(
        iconSize: 30,
        icon: Icon(Icons.search),
        onPressed: () {
        searchHandler.searchTextController.clearComposing();
        searchHandler.searchBoxFocus.unfocus();
        searchHandler.searchAction(searchHandler.searchTextController.text, null);
      },
      )
    );
  }
}