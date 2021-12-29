import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TagSearchButton extends StatelessWidget {
  TagSearchButton({Key? key}) : super(key: key);

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
        icon: Icon(Icons.search, color: Get.theme.colorScheme.onSurface),
        onPressed: () {
          searchHandler.searchTextController.clearComposing();
          searchHandler.searchBoxFocus.unfocus();
          searchHandler.searchAction(searchHandler.searchTextController.text, null);
        },
      ),
    );
  }
}
