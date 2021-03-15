import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/widgets/InfoDialog.dart';
import 'package:LoliSnatcher/widgets/HistoryList.dart';

class TabBoxButtons extends StatefulWidget {
  List<SearchGlobals> searchGlobals;
  int globalsIndex;
  TextEditingController searchTagsController;
  SettingsHandler settingsHandler;
  final Function setParentGlobalsIndex;
  TabBoxButtons(this.searchGlobals,this.globalsIndex,this.searchTagsController,this.settingsHandler,this.setParentGlobalsIndex);
  @override
  _TabBoxButtonsState createState() => _TabBoxButtonsState();
}

class _TabBoxButtonsState extends State<TabBoxButtons> {

  void showHistory() async {
    showDialog(context: context, builder: (context) {
      return StatefulBuilder(builder: (context, setDialogState) {
        return InfoDialog(
          'Search History',
          [
            widget.settingsHandler.searchHistoryEnabled ? const SizedBox() : Text('Search History is disabled.'),
            widget.settingsHandler.dbEnabled ? const SizedBox() : Text('Search History requires enabling Database in settings.'),
            HistoryList(widget.searchGlobals,widget.globalsIndex,widget.searchTagsController,widget.settingsHandler,widget.setParentGlobalsIndex),
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
                  icon: Icon(Icons.remove_circle_outline, color: Get.context!.theme.accentColor),
                  onPressed: () {
                    // Remove selected searchglobal from list and apply nearest to search bar
                    setState((){
                      widget.searchGlobals[widget.globalsIndex].removeTab!.value = "remove";
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.history, color: Get.context!.theme.accentColor),
                  onPressed: () async {
                    showHistory();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.add_circle_outline, color: Get.context!.theme.accentColor),
                  onPressed: () {
                    // add a new search global to the list
                    setState((){
                      widget.searchGlobals[widget.globalsIndex].newTab!.value = widget.settingsHandler.defTags;
                      // widget.searchGlobals.add(new SearchGlobals(widget.searchGlobals[widget.globalsIndex].selectedBooru, widget.settingsHandler.defTags)); // Set selected booru
                      // searchGlobals.add(new SearchGlobals(null, widget.settingsHandler.defTags)); // Set empty booru
                    });
                  },
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
