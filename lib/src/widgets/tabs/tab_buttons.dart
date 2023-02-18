import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/dialogs/page_number_dialog.dart';
import 'package:lolisnatcher/src/widgets/history/history.dart';

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

      // Prev tab
      final Widget leftArrow = IconButton(
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
      );

      // Next tab
      final Widget rightArrow = IconButton(
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
      );

      // Remove current tab
      final Widget removeButton = IconButton(
        icon: const Icon(Icons.remove_circle_outline),
        color: iconColor,
        onPressed: () {
          // Remove selected searchtab from list and apply nearest to search bar
          searchHandler.removeTabAt();
        },
      );

      // Add new tab
      final Widget addButton = IconButton(
        icon: const Icon(Icons.add_circle_outline),
        color: iconColor,
        onPressed: () {
          // add new tab and switch to it
          searchHandler.searchTextController.text = settingsHandler.defTags;
          searchHandler.addTabByString(settingsHandler.defTags, switchToNew: true);

          // add new tab to the list end
          // searchHandler.addTabByString(settingsHandler.defTags);
        },
      );

      // Show search history
      final Widget historyButton = IconButton(
        icon: const Icon(Icons.history),
        color: iconColor,
        onPressed: () async {
          await showHistory(context);
        },
      );

      // Show page number dialog
      final Widget pageNumberNutton = IconButton(
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
      );

      // For thin screens, show buttons in 2 rows
      if (MediaQuery.of(context).size.width < 370) {
        return Column(
          children: [
            Wrap(
              alignment: alignment ?? WrapAlignment.spaceEvenly,
              children: [
                if (withArrows) leftArrow,
                removeButton,
                addButton,
                if (withArrows) rightArrow,
              ],
            ),
            Wrap(
              alignment: alignment ?? WrapAlignment.spaceEvenly,
              children: [
                historyButton,
                pageNumberNutton,
              ],
            ),
          ],
        );
      }

      return Wrap(
        alignment: alignment ?? WrapAlignment.spaceEvenly,
        children: [
          if (withArrows) leftArrow,
          removeButton,
          historyButton,
          pageNumberNutton,
          addButton,
          if (withArrows) rightArrow,
        ],
      );
    });
  }
}
