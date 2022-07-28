import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/dialogs/page_number_dialog.dart';
import 'package:lolisnatcher/src/widgets/history/history.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

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

    return Obx(() {
      if (searchHandler.list.isEmpty) {
        return const SizedBox.shrink();
      }

      return Wrap(
        alignment: alignment ?? WrapAlignment.spaceEvenly,
        children: [
          // Prev tab
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
          // Remove current tab
          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            color: iconColor,
            onPressed: () {
              // Remove selected searchtab from list and apply nearest to search bar
              searchHandler.removeTabAt();
            },
          ),
          // Show search history
          IconButton(
            icon: const Icon(Icons.history),
            color: iconColor,
            onPressed: () async {
              await showHistory(context);
            },
          ),
          // Show page number dialog
          IconButton(
            icon: const Icon(Icons.format_list_numbered),
            color: iconColor,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const PageNumberDialog();
                },
              );
            },
          ),
          // Add new tab
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
          // Next tab
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
        ],
      );
    });
  }
}
