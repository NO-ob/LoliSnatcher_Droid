import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/widgets/InfoDialog.dart';
import 'package:LoliSnatcher/widgets/HistoryList.dart';

class TabBoxButtons extends StatefulWidget {
  TabBoxButtons();
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(width: 30),
                IconButton(
                  icon: Icon(Icons.remove_circle_outline, color: Get.theme.accentColor),
                  onPressed: () {
                    // Remove selected searchglobal from list and apply nearest to search bar
                    searchHandler.removeAt();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.history, color: Get.theme.accentColor),
                  onPressed: () async {
                    showHistory();
                  },
                ),
                GestureDetector(
                  onLongPress: () {
                    // add new tab and switch to it
                    searchHandler.searchTextController.text = settingsHandler.defTags;
                    searchHandler.addTabByString(settingsHandler.defTags, switchToNew: true);
                  },
                  child: IconButton(
                    icon: Icon(Icons.add_circle_outline, color: Get.theme.accentColor),
                    onPressed: () {
                      // add new tab to the list end
                      searchHandler.addTabByString(settingsHandler.defTags);
                    },
                  ),
                ),
                const SizedBox(width: 30),
              ]
            )
          )
        ],
      )
    );
  }
}
