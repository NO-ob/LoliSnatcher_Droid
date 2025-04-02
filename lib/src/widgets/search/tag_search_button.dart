import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';

class TagSearchButton extends StatelessWidget {
  const TagSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchHandler searchHandler = SearchHandler.instance;

    return GestureDetector(
      onSecondaryTap: () {
        searchHandler.searchTextController.clearComposing();
        searchHandler.addTabByString(searchHandler.searchTextController.text, switchToNew: true);
      },
      onLongPress: () {
        ServiceHandler.vibrate();
        searchHandler.searchTextController.clearComposing();
        searchHandler.addTabByString(searchHandler.searchTextController.text, switchToNew: true);
      },
      child: IconButton(
        iconSize: 30,
        icon: Icon(Icons.search, color: Theme.of(context).colorScheme.onSurface),
        onPressed: () {
          searchHandler.searchTextController.clearComposing();
          searchHandler.searchAction(searchHandler.searchTextController.text, null);
        },
      ),
    );
  }
}
