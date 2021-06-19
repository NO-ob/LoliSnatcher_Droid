import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/widgets/InfoDialog.dart';
import 'package:LoliSnatcher/widgets/MarqueeText.dart';

class HistoryList extends StatefulWidget {
  List<SearchGlobals> searchGlobals;
  int globalsIndex;
  TextEditingController searchTagsController;
  SettingsHandler settingsHandler;
  final Function setParentGlobalsIndex;
  HistoryList(this.searchGlobals, this.globalsIndex, this.searchTagsController, this.settingsHandler, this.setParentGlobalsIndex);
  @override
  _HistoryListState createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  List<List<String>> history = [], filteredHistory = [];
  ScrollController scrollController = ScrollController();
  TextEditingController filterSearchController = TextEditingController();
  bool isLoading = true, showFavourites = true;

  @override
  void initState() {
    super.initState();
    getHistory();
  }

  void getHistory() async {
    history = (widget.settingsHandler.dbEnabled && widget.settingsHandler.searchHistoryEnabled)
      ? await widget.settingsHandler.dbHandler.getSearchHistory()
      : [];
    history.sort(compareFavourites);
    filteredHistory = history;
    isLoading = false;
    setState(() {});
  }

  void filterHistory() {
    // logic of this IF repeats, because we don't need to call array filtering every time when there are no filters enabled
    if(filterSearchController.text != '' || !showFavourites) {
      filteredHistory = history.where((h) {
        bool isFavourite = h[4] == '1';
        if(!showFavourites && isFavourite) {
          return false;
        } else if(filterSearchController.text == '') {
          return true;
        } else {
          bool textFilter = h[1].toLowerCase().contains(filterSearchController.text.toLowerCase());
          return textFilter;
        }
      }).toList();
    } else {
      filteredHistory = history;
    }
    setState(() {});
  }

  int compareFavourites(a, b) {
    // first sort favourited ones
    if(a[4] == '1' && b[4] != '1') return -1;
    else if(a[4] != '1' && b[4] == '1') return 1;
    else {
      // then sort by date
      int dateA = DateTime.parse(a[5]).millisecondsSinceEpoch;
      int dateB = DateTime.parse(b[5]).millisecondsSinceEpoch;
      if(dateA < dateB) return 1;
      else if(dateA > dateB) return -1;
      else return 0;
    }
  }
  

  void showHistoryEntryActions(Widget row, List<String> data) {
    Duration timeZone = DateTime.now().timeZoneOffset;
    DateTime searchDate = DateTime.parse(data[5]).add(timeZone);
    String searchDateStr = "${searchDate.day.toString().padLeft(2,'0')}.${searchDate.month.toString().padLeft(2,'0')}.${searchDate.year.toString().substring(2)} ${searchDate.hour.toString().padLeft(2,'0')}:${searchDate.minute.toString().padLeft(2,'0')}:${searchDate.second.toString().padLeft(2,'0')}";
    showDialog(context: context, builder: (context) {
      return StatefulBuilder(builder: (context, setDialogState) {
        return InfoDialog(
          null,
          [
            AbsorbPointer(absorbing: true, child: row),
            Text("Last searched on: ${searchDateStr}"),
            const SizedBox(height: 20),
            TextButton.icon(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: Get.context!.theme.accentColor),
                ),
              ),
              onPressed: () async {
                await widget.settingsHandler.dbHandler.deleteFromSearchHistory(data[0]);
                history = history.where((el) => el[0] != data[0]).toList();
                filterHistory();
                Navigator.of(context).pop(true);
              },
              icon: Icon(Icons.delete_forever, color: Get.context!.theme.errorColor),
              label: Expanded(child: Text('Delete', style: TextStyle(color: Get.context!.theme.errorColor))),
            ),
            const SizedBox(height: 5),
            TextButton.icon(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: Get.context!.theme.accentColor),
                ),
              ),
              onPressed: () {
                int indexWhere = history.indexWhere((el) => el[0] == data[0]);
                bool newFavourite = data[4] == '1' ? false : true;
                data[4] = data[4] == '1' ? '0' : '1';

                history[indexWhere] = data;
                history.sort(compareFavourites);
                filterHistory();

                widget.settingsHandler.dbHandler.setFavouriteSearchHistory(data[0], newFavourite);
                
                Navigator.of(context).pop(true);
              },
              icon: Icon(data[4] == '1' ? Icons.favorite_border : Icons.favorite, color: data[4] == '1' ? Colors.grey : Colors.red),
              label: Expanded(child: Text(data[4] == '1' ? 'Remove from Favourites' : 'Set as Favourite', style: TextStyle(color: Colors.white))),
            ),
            const SizedBox(height: 5),
            TextButton.icon(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: Get.context!.theme.accentColor),
                ),
              ),
              onPressed: () async {
                Clipboard.setData(ClipboardData(text: data[1]));
                ServiceHandler.displayToast('Text copied to clipboard!');
                Navigator.of(context).pop(true);
              },
              icon: Icon(Icons.copy),
              label: Expanded(child: Text('Copy', style: TextStyle(color: Colors.white))),
            ),
            
          ],
          CrossAxisAlignment.center
        );
      });
    });
  }

  Widget listBuild() {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    BoxConstraints limits = mediaQuery.orientation == Orientation.landscape
        ? BoxConstraints(maxHeight: mediaQuery.size.height / 1.7)
        : BoxConstraints(maxHeight: mediaQuery.size.height / 1.35);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        child: Container(
          constraints: limits,
          child: Scrollbar(
            controller: scrollController,
            interactive: true,
            thickness: 8,
            radius: Radius.circular(10),
            isAlwaysShown: true,
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              controller: scrollController,
              shrinkWrap: true,
              itemCount: filteredHistory.length,
              scrollDirection: Axis.vertical,
              itemBuilder: listEntryBuild,
            )
          )
        )
      )
    );
  }

  Widget listEntryBuild(BuildContext context, int index) {
    List<String> currentEntry = filteredHistory[index]; //0-id, 1-text, 2-booru type, 3-booru name, 4-isFavourite, 5-timestamp
    Booru booru = Booru(null, null, null, null, null);
    if (widget.settingsHandler.booruList.isNotEmpty) {
      booru = widget.settingsHandler.booruList.firstWhere(
        (b) => b.type == currentEntry[2] && b.name == currentEntry[3],
        orElse: () => Booru(null, null, null, null, null)
      );
    }

    Widget entryRow = TextButton.icon(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: Get.context!.theme.accentColor),
        ),
      ),
      onPressed: () {
        if (booru.type != null) {
          widget.searchTagsController.text = currentEntry[1];
          setState(() {
            widget.searchGlobals[widget.globalsIndex].tags = currentEntry[1];
            widget.searchGlobals[widget.globalsIndex].selectedBooru = booru;
          });
          Navigator.of(context).pop(true);
          widget.setParentGlobalsIndex(widget.globalsIndex, currentEntry[1]);
        } else {
          ServiceHandler.displayToast('Unknown booru type');
        }
      },
      icon: booru.faviconURL != null
        ? (booru.type == "Favourites"
          ? Icon(Icons.favorite, color: Colors.red, size: 18)
          : Image.network(booru.faviconURL!,
              width: 16,
              errorBuilder: (_, __, ___) {
                return Icon(Icons.broken_image, size: 18);
              }
            )
          )
        : Icon(CupertinoIcons.question, size: 18),
      label: MarqueeText(
        text: currentEntry[1],
        fontSize: 16,
        startPadding: 0,
      ),
    );

    return Row(children: <Widget>[
      Expanded(
        child: GestureDetector(
          onLongPress: () {showHistoryEntryActions(entryRow, currentEntry);},
          child: entryRow
        )
      ),
      if(currentEntry[4] == '1') 
        Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0), child: Icon(Icons.favorite, color: Colors.red)),
    ]);
  }

  Widget filterBuild() {
    return Container(
      margin: EdgeInsets.fromLTRB(10,10,10,10),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Container(
              height: 35,
              margin: EdgeInsets.fromLTRB(0,0,0,0),
              child: Row(
                children: <Widget>[
                  Expanded(child: TextField(
                    controller: filterSearchController,
                    onChanged: (String input) {filterHistory();},
                    decoration: InputDecoration(
                      hintText: "Filter Search History (${history.length})",
                      contentPadding: EdgeInsets.fromLTRB(15,0,15,0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        gapPadding: 0,
                      ),
                    ),
                  )),
                  Stack(
                    children: <Widget>[
                      Center(
                        child: IconButton(
                          padding: const EdgeInsets.fromLTRB(0,0,0,15),
                          icon: Icon(Icons.favorite, size: 40, color: Colors.red),
                          onPressed: () { },
                        )
                      ),
                      Center(
                        child: IconButton(
                          padding: const EdgeInsets.all(5),
                          icon: Icon(showFavourites ? CupertinoIcons.eye : CupertinoIcons.eye_slash, color: showFavourites ? Colors.white : Colors.white60),
                          onPressed: () {
                            showFavourites = !showFavourites;
                            filterHistory();
                          },
                        )
                      )
                    ],
                  ),
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget errorsBuild() {
    bool areThereErrors = isLoading ||
        (history.length == 0) || (filteredHistory.length == 0) ||
        (!widget.settingsHandler.searchHistoryEnabled) || (!widget.settingsHandler.dbEnabled);
    if(areThereErrors) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(isLoading)
            CircularProgressIndicator()
          else if (history.length == 0)
            Text('Search History is empty')
          else if (filteredHistory.length == 0)
            Text('Nothing found'),

          if(!widget.settingsHandler.searchHistoryEnabled)
            Text('Search History is disabled.'),
          if(!widget.settingsHandler.dbEnabled)
            Text('Search History requires enabling Database in settings.'),
        ]
      );
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        errorsBuild(),
        filterBuild(),
        listBuild(),
      ]
    );
  }
}
