import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/widgets/InfoDialog.dart';
import 'package:LoliSnatcher/widgets/ScrollingText.dart';

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
    List<List<String>> history = (widget.settingsHandler.dbEnabled && widget.settingsHandler.searchHistoryEnabled) ? await widget.settingsHandler.dbHandler.getSearchHistory() : [];
    showDialog(context: context, builder: (context) {
      return StatefulBuilder(builder: (context, setDialogState) {
        return InfoDialog(
          'Search History',
          [
            widget.settingsHandler.searchHistoryEnabled ? const SizedBox() : Text('Search History is disabled.'),
            widget.settingsHandler.dbEnabled ? const SizedBox() : Text('Search History requires enabling Database in settings.'),
            history.length > 0 ? const SizedBox() : Text('Search History is empty.'),
            // TextButton.icon(
            //   style: TextButton.styleFrom(
            //     shape: RoundedRectangleBorder(
            //       borderRadius: new BorderRadius.circular(5),
            //       side: BorderSide(color: Get.context!.theme.accentColor),
            //     ),
            //   ),
            //   onPressed: () async {
            //     await widget.settingsHandler.dbHandler.deleteFromSearchHistory(null);
            //     setDialogState(() {
            //       history = [];
            //     });
            //   },
            //   icon: Icon(Icons.delete_forever, color: Colors.red),
            //   label: Text('Delete all', style: TextStyle(color: Colors.white)),
            // ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: new BorderRadius.circular(20),
              child: Container(
                height: (MediaQuery.of(context).size.height / 2) + 20,
                child: Material(
                  child: ListView.builder(
                    padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                    shrinkWrap: true,
                    itemCount: history.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      List<String> currentEntry = history[index];
                      Booru? booru;
                      if(widget.settingsHandler.booruList.isNotEmpty) {
                        booru = widget.settingsHandler.booruList.firstWhere((b) => b.type == currentEntry[2] && b.name == currentEntry[3]);
                      }
                      return Row(children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.delete_forever),
                          onPressed: () async {
                            await widget.settingsHandler.dbHandler.deleteFromSearchHistory(currentEntry[0]);
                            setDialogState(() {
                              history = history.where((el) => el[0] != currentEntry[0]).toList();
                            });
                          }
                        ),
                        Expanded(
                          child: TextButton.icon(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5),
                              side: BorderSide(color: Get.context!.theme.accentColor),
                            ),
                          ),
                          onPressed: () {
                            widget.searchTagsController.text = currentEntry[1];
                            if(booru != null) {
                              setState(() {
                                widget.searchGlobals[widget.globalsIndex].tags = currentEntry[1];
                                widget.searchGlobals[widget.globalsIndex].selectedBooru = booru;
                              });
                            }
                            Navigator.of(context).pop(true);
                            widget.setParentGlobalsIndex(widget.globalsIndex);
                          },
                          icon: booru != null
                              ? (booru.type == "Favourites"
                                ? Icon(Icons.favorite, color: Colors.red, size: 18)
                                : Image.network(
                                booru.faviconURL!,
                                width: 16,
                                errorBuilder: (_, __, ___) {
                                  return Icon(Icons.broken_image, size: 18);
                                }
                              )
                            )
                              : Icon(CupertinoIcons.question, size: 18),
                          label: Expanded(child: ScrollingText(currentEntry[1], 25, "infiniteWithPause", Colors.white)),
                        ))
                      ]);
                    }
                  )
                )
              )
            )
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
