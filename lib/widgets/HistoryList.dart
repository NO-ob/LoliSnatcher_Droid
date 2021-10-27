import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:LoliSnatcher/widgets/MarqueeText.dart';
import 'package:LoliSnatcher/widgets/CachedFavicon.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';

class HistoryList extends StatefulWidget {
  HistoryList();
  @override
  _HistoryListState createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  final SettingsHandler settingsHandler = Get.find();
  final SearchHandler searchHandler = Get.find();

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
    history = (settingsHandler.dbEnabled && settingsHandler.searchHistoryEnabled)
      ? await settingsHandler.dbHandler.getSearchHistory()
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
    final Duration timeZone = DateTime.now().timeZoneOffset;
    final DateTime searchDate = DateTime.parse(data[5]).add(timeZone);

    final String dayStr = searchDate.day.toString().padLeft(2, '0');
    final String monthStr = searchDate.month.toString().padLeft(2, '0');
    final String yearStr = searchDate.year.toString().substring(2);
    final String hourStr = searchDate.hour.toString().padLeft(2, '0');
    final String minuteStr = searchDate.minute.toString().padLeft(2, '0');
    final String secondStr = searchDate.second.toString().padLeft(2, '0');
    final String searchDateStr = "$dayStr.$monthStr.$yearStr $hourStr:$minuteStr:$secondStr";

    showDialog(
      context: context,
      builder: (context) {
        return SettingsDialog(
          contentItems: <Widget>[
            Container(
              width: double.maxFinite,
              child: AbsorbPointer(absorbing: true, child: row)
            ),

            Text("Last searched on: $searchDateStr", textAlign: TextAlign.center),
            const SizedBox(height: 20),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Get.theme.colorScheme.secondary),
              ),
              onTap: () async {
                await settingsHandler.dbHandler.deleteFromSearchHistory(data[0]);
                history = history.where((el) => el[0] != data[0]).toList();
                filterHistory();
                Navigator.of(context).pop(true);
              },
              leading: Icon(Icons.delete_forever, color: Get.theme.errorColor),
              title: Text('Delete', style: TextStyle(color: Get.theme.errorColor)),
            ),
            const SizedBox(height: 10),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Get.theme.colorScheme.secondary),
              ),
              onTap: () {
                int indexWhere = history.indexWhere((el) => el[0] == data[0]);
                bool newFavourite = data[4] == '1' ? false : true;
                data[4] = data[4] == '1' ? '0' : '1';

                history[indexWhere] = data;
                history.sort(compareFavourites);
                filterHistory();

                settingsHandler.dbHandler.setFavouriteSearchHistory(data[0], newFavourite);
                
                Navigator.of(context).pop(true);
              },
              leading: Icon(data[4] == '1' ? Icons.favorite_border : Icons.favorite, color: data[4] == '1' ? Colors.grey : Colors.red),
              title: Text(data[4] == '1' ? 'Remove from Favourites' : 'Set as Favourite'),
            ),
            const SizedBox(height: 10),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Get.theme.colorScheme.secondary),
              ),
              onTap: () async {
                Clipboard.setData(ClipboardData(text: data[1]));
                FlashElements.showSnackbar(
                  context: context,
                  duration: Duration(seconds: 2),
                  title: Text(
                    "Copied to clipboard!",
                    style: TextStyle(fontSize: 20)
                  ),
                  content: Text(
                    data[1],
                    style: TextStyle(fontSize: 16)
                  ),
                  leadingIcon: Icons.copy,
                  sideColor: Colors.green,
                );
                Navigator.of(context).pop(true);
              },
              leading: Icon(Icons.copy),
              title: Text('Copy'),
            ),
          ],
        );
      }
    );
  }

  Widget listBuild() {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double maxHeight = mediaQuery.size.height / (mediaQuery.orientation == Orientation.landscape ? 1.7 : 1.35);
    // BoxConstraints limits = BoxConstraints(maxHeight: maxHeight);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        child: Container(
          // constraints: limits,
          width: double.minPositive,
          height: maxHeight,
          child: Scrollbar(
            controller: scrollController,
            interactive: true,
            thickness: 8,
            radius: Radius.circular(10),
            isAlwaysShown: true,
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              controller: scrollController,
              // physics: const NeverScrollableScrollPhysics(),
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
    if (settingsHandler.booruList.isNotEmpty) {
      booru = settingsHandler.booruList.firstWhere(
        (b) => b.type == currentEntry[2] && b.name == currentEntry[3],
        orElse: () => Booru(null, null, null, null, null)
      );
    }

    Widget entryRow = Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: Get.theme.colorScheme.secondary),
        ),
        onTap: () {
          if (booru.type != null) {
            searchHandler.searchTextController.text = currentEntry[1];
            Navigator.of(context).pop(true);
            searchHandler.searchAction(currentEntry[1], booru);
          } else {
            FlashElements.showSnackbar(
              context: context,
              title: Text(
                "Unknown Booru type!",
                style: TextStyle(fontSize: 20)
              ),
              leadingIcon: Icons.warning_amber,
              leadingIconColor: Colors.red,
              sideColor: Colors.red,
            );
          }
        },
        minLeadingWidth: 20,
        leading: booru.faviconURL != null
          ? (booru.type == "Favourites"
              ? Icon(Icons.favorite, color: Colors.red, size: 18)
              : CachedFavicon(booru.faviconURL!)
            )
          : Icon(CupertinoIcons.question, size: 18),
        title: MarqueeText(
          text: currentEntry[1],
          fontSize: 14,
          fontWeight: FontWeight.bold,
          startPadding: 0,
          isExpanded: false,
        ),
      )
    );

    return Row(children: <Widget>[
      Expanded(
        child: GestureDetector(
          onLongPress: () {
            showHistoryEntryActions(entryRow, currentEntry);
          },
          child: entryRow
        )
      ),
      if(currentEntry[4] == '1') 
        Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0), child: Icon(Icons.favorite, color: Colors.red)),
    ]);
  }

  Widget filterBuild() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Container(
              height: 45,
              child: Row(
                children: <Widget>[
                  Expanded(child: TextField(
                    controller: filterSearchController,
                    onChanged: (String input) {
                      filterHistory();
                    },
                    decoration: InputDecoration(
                      hintText: "Filter Search History (${history.length})",
                      contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
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
                          padding: const EdgeInsets.fromLTRB(0, 2, 0, 15),
                          icon: Icon(Icons.favorite, size: 40, color: Colors.red),
                          onPressed: () { },
                        )
                      ),
                      Center(
                        child: IconButton(
                          padding: const EdgeInsets.fromLTRB(0, 7, 0, 15),
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
        (!settingsHandler.searchHistoryEnabled) || (!settingsHandler.dbEnabled);
    if(areThereErrors) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(isLoading)
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Get.theme.colorScheme.secondary)
            )
          else if (history.length == 0)
            Text('Search History is empty')
          else if (filteredHistory.length == 0)
            Text('Nothing found'),

          if(!settingsHandler.searchHistoryEnabled)
            Text('Search History is disabled.'),
          if(!settingsHandler.dbEnabled)
            Text('Search History requires enabling Database in settings.'),
        ]
      );
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SettingsDialog(
      title: Column(
        children: [
          errorsBuild(),
          filterBuild(),
        ]
      ),
      content: listBuild(),
      contentPadding: const EdgeInsets.all(6),
    );
  }
}
