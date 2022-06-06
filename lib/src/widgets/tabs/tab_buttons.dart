import 'package:flutter/material.dart';

import 'package:LoliSnatcher/src/handlers/search_handler.dart';
import 'package:LoliSnatcher/src/handlers/settings_handler.dart';
import 'package:LoliSnatcher/src/widgets/history/history.dart';
import 'package:LoliSnatcher/src/widgets/common/settings_widgets.dart';

class TabButtons extends StatelessWidget {
  const TabButtons(this.withArrows, this.alignment, {Key? key}) : super(key: key);
  final bool withArrows;
  final WrapAlignment? alignment;

  Future<bool> showHistory(BuildContext context) async {
    return await SettingsPageOpen(
      context: context,
      page: () => const HistoryList(),
    ).open();
  }

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final SearchHandler searchHandler = SearchHandler.instance;

    final Color iconColor = Theme.of(context).colorScheme.secondary;

    return Wrap(
      alignment: alignment ?? WrapAlignment.spaceEvenly,
      children: [
        const SizedBox(width: 25),

        if (withArrows)
          IconButton(
            icon: const Icon(Icons.arrow_upward),
            color: iconColor,
            onPressed: () {
              // switch to the prev tab, loop if reached the first
              if ((searchHandler.currentIndex - 1) < 0) {
                searchHandler.changeTabIndex(searchHandler.total - 1);
              } else {
                searchHandler.changeTabIndex(searchHandler.currentIndex - 1);
              }
            },
          ),

        IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          color: iconColor,
          onPressed: () {
            // Remove selected searchglobal from list and apply nearest to search bar
            searchHandler.removeTabAt();
          },
        ),

        IconButton(
          icon: const Icon(Icons.history),
          color: iconColor,
          onPressed: () async {
            await showHistory(context);
          },
        ),

        IconButton(
          icon: const Icon(Icons.add_circle_outline),
          color: iconColor,
          onPressed: () {
            // add new tab and switch to it
            searchHandler.searchTextController.text = settingsHandler.defTags;
            searchHandler.addTabByString(settingsHandler.defTags, switchToNew: true);

            // add new tab to the list end
            // searchHandler.addTabByString(settingsHandler.defTags);
          },
        ),

        if (withArrows)
          IconButton(
            icon: const Icon(Icons.arrow_downward),
            color: iconColor,
            onPressed: () {
              // switch to the next tab, loop if reached the last
              if ((searchHandler.currentIndex + 1) > (searchHandler.total - 1)) {
                searchHandler.changeTabIndex(0);
              } else {
                searchHandler.changeTabIndex(searchHandler.currentIndex + 1);
              }
            },
          ),

        const SizedBox(width: 25),
      ],
    );
  }
}
