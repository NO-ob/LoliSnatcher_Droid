import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/widgets/HistoryList.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';

class TabBoxButtons extends StatelessWidget {
  const TabBoxButtons(this.withArrows, this.alignment, {Key? key}) : super(key: key);
  final bool withArrows;
  final MainAxisAlignment? alignment;

  Future<bool> showHistory(BuildContext context) async {
    return await SettingsPageOpen(
      context: context,
      page: () => const HistoryList(),
    ).open();
  }

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
    final SearchHandler searchHandler = Get.find<SearchHandler>();

    return Row(
      mainAxisAlignment: alignment ?? MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 25),

        if (withArrows)
          IconButton(
            icon: const Icon(Icons.arrow_upward),
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
          onPressed: () {
            // Remove selected searchglobal from list and apply nearest to search bar
            searchHandler.removeTabAt();
          },
        ),

        IconButton(
          icon: const Icon(Icons.history),
          onPressed: () async {
            await showHistory(context);
          },
        ),

        IconButton(
          icon: const Icon(Icons.add_circle_outline),
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
