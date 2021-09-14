import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/widgets/InfoDialog.dart';
import 'package:LoliSnatcher/widgets/HistoryList.dart';

class TabBoxButtons extends StatefulWidget {
  final bool withSecondary;
  final MainAxisAlignment? alignment;
  TabBoxButtons(this.withSecondary, this.alignment);

  @override
  _TabBoxButtonsState createState() => _TabBoxButtonsState();
}

class _TabBoxButtonsState extends State<TabBoxButtons> {
  final SettingsHandler settingsHandler = Get.find();
  final SearchHandler searchHandler = Get.find();

  void showHistory() async {
    showDialog(context: context, builder: (context) {
      return StatefulBuilder(builder: (context, setDialogState) {
        return InfoDialog(
          null,
          [
            HistoryList()
          ],
          CrossAxisAlignment.start
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: widget.alignment ?? MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(width: 15),
                if(widget.withSecondary)
                  IconButton(
                    icon: Icon(Icons.arrow_upward, color: Get.theme.colorScheme.secondary),
                    onPressed: () {
                      // switch to the prev tab, loop if reached the first
                      if((searchHandler.index.value - 1) < 0) {
                        searchHandler.changeTabIndex(searchHandler.list.length - 1);
                      } else {
                        searchHandler.changeTabIndex(searchHandler.index.value - 1);
                      }
                    },
                  ),
                IconButton(
                  icon: Icon(Icons.remove_circle_outline, color: Get.theme.colorScheme.secondary),
                  onPressed: () {
                    // Remove selected searchglobal from list and apply nearest to search bar
                    searchHandler.removeAt();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.history, color: Get.theme.colorScheme.secondary),
                  onPressed: () async {
                    showHistory();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.add_circle_outline, color: Get.theme.colorScheme.secondary),
                  onPressed: () {
                    // add new tab and switch to it
                    searchHandler.searchTextController.text = settingsHandler.defTags;
                    searchHandler.addTabByString(settingsHandler.defTags, switchToNew: true);

                    // add new tab to the list end
                    // searchHandler.addTabByString(settingsHandler.defTags);
                  },
                ),
                if(widget.withSecondary)
                  IconButton(
                    icon: Icon(Icons.arrow_downward, color: Get.theme.colorScheme.secondary),
                    onPressed: () {
                      // switch to the next tab, loop if reached the last
                      if((searchHandler.index.value + 1) > (searchHandler.list.length - 1)) {
                        searchHandler.changeTabIndex(0);
                      } else {
                        searchHandler.changeTabIndex(searchHandler.index.value + 1);
                      }
                    },
                  ),
                const SizedBox(width: 15),
              ]
            )
          )
        ],
      )
    );
  }
}
