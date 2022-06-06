import 'package:flutter/material.dart';

import 'package:LoliSnatcher/src/handlers/search_handler.dart';
import 'package:LoliSnatcher/src/handlers/service_handler.dart';

class TagSearchButton extends StatelessWidget {
  const TagSearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchHandler searchHandler = SearchHandler.instance;

    return GestureDetector(
      onSecondaryTap: () {
        searchHandler.searchTextController.clearComposing();
        searchHandler.searchBoxFocus.unfocus();
        searchHandler.addTabByString(searchHandler.searchTextController.text, switchToNew: true);
      },
      onLongPress: () {
        ServiceHandler.vibrate();
        searchHandler.searchTextController.clearComposing();
        searchHandler.searchBoxFocus.unfocus();
        searchHandler.addTabByString(searchHandler.searchTextController.text, switchToNew: true);
      },
      child: IconButton(
        iconSize: 30,
        icon: Icon(Icons.search, color: Theme.of(context).colorScheme.onSurface),
        onPressed: () {
          searchHandler.searchTextController.clearComposing();
          searchHandler.searchBoxFocus.unfocus();
          searchHandler.searchAction(searchHandler.searchTextController.text, null);
        },
      ),
    );
  }
}
