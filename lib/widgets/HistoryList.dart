import 'dart:io';

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
import 'package:LoliSnatcher/widgets/DesktopScrollWrap.dart';

class HistoryList extends StatefulWidget {
  HistoryList();
  @override
  _HistoryListState createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final SearchHandler searchHandler = Get.find<SearchHandler>();

  List<HistoryEntry> history = [], filteredHistory = [];
  final ScrollController scrollController = ScrollController();
  final TextEditingController filterSearchController = TextEditingController();
  bool isLoading = true, showFavourites = true;

  @override
  void initState() {
    super.initState();
    getHistory();
  }

  void getHistory() async {
    history = ((settingsHandler.dbEnabled && settingsHandler.searchHistoryEnabled) ? await settingsHandler.dbHandler.getSearchHistory() : [])
        .map((e) => HistoryEntry.fromMap(e))
        .toList();
    history.sort(compareFavourites);
    filteredHistory = history;
    isLoading = false;
    setState(() {});
  }

  void filterHistory() {
    // logic of this IF repeats, because we don't need to call array filtering every time when there are no filters enabled
    if (filterSearchController.text != '' || !showFavourites) {
      filteredHistory = history.where((h) {
        if (!showFavourites && h.isFavourite) {
          return false;
        } else if (filterSearchController.text == '') {
          return true;
        } else {
          bool textFilter = h.searchText.toLowerCase().contains(filterSearchController.text.toLowerCase());
          return textFilter;
        }
      }).toList();
    } else {
      filteredHistory = history;
    }
    setState(() {});
  }

  int compareFavourites(HistoryEntry a, HistoryEntry b) {
    // first sort favourited ones
    if (a.isFavourite && !b.isFavourite) {
      return -1;
    } else if (!a.isFavourite && b.isFavourite) {
      return 1;
    } else {
      // then sort by date
      int dateA = DateTime.parse(a.timestamp).millisecondsSinceEpoch;
      int dateB = DateTime.parse(b.timestamp).millisecondsSinceEpoch;
      if (dateA < dateB) {
        return 1;
      } else if (dateA > dateB) {
        return -1;
      } else {
        return 0;
      }
    }
  }

  void showHistoryEntryActions(Widget row, HistoryEntry data) {
    final Duration timeZone = DateTime.now().timeZoneOffset;
    final DateTime searchDate = DateTime.parse(data.timestamp).add(timeZone);

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
            SizedBox(width: double.maxFinite, child: row),
            Text("Last searched on: $searchDateStr", textAlign: TextAlign.center),
            const SizedBox(height: 20),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Get.theme.colorScheme.secondary),
              ),
              onTap: () async {
                await settingsHandler.dbHandler.deleteFromSearchHistory(data.id);
                history = history.where((el) => el.id != data.id).toList();
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
                int indexWhere = history.indexWhere((el) => el.id == data.id);
                bool newFavourite = !data.isFavourite;
                data.isFavourite = newFavourite;

                history[indexWhere] = data;
                history.sort(compareFavourites);
                filterHistory();

                settingsHandler.dbHandler.setFavouriteSearchHistory(data.id, newFavourite);

                Navigator.of(context).pop(true);
              },
              leading: Icon(data.isFavourite ? Icons.favorite_border : Icons.favorite, color: data.isFavourite ? Colors.grey : Colors.red),
              title: Text(data.isFavourite ? 'Remove from Favourites' : 'Set as Favourite'),
            ),
            const SizedBox(height: 10),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Get.theme.colorScheme.secondary),
              ),
              onTap: () async {
                Clipboard.setData(ClipboardData(text: data.searchText));
                FlashElements.showSnackbar(
                  context: context,
                  duration: Duration(seconds: 2),
                  title: Text("Copied to clipboard!", style: TextStyle(fontSize: 20)),
                  content: Text(data.searchText, style: TextStyle(fontSize: 16)),
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
      },
    );
  }

  Widget listBuild() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        child: SizedBox(
          width: double.maxFinite,
          child: Scrollbar(
            controller: scrollController,
            interactive: true,
            thickness: 8,
            radius: Radius.circular(10),
            isAlwaysShown: true,
            child: DesktopScrollWrap(
              controller: scrollController,
              child: ListView.builder(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                controller: scrollController,
                physics: (Platform.isWindows || Platform.isLinux || Platform.isMacOS)
                    ? const NeverScrollableScrollPhysics()
                    : null, // const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                shrinkWrap: false,
                itemCount: filteredHistory.length,
                scrollDirection: Axis.vertical,
                itemBuilder: listEntryBuild,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget listEntryBuild(BuildContext context, int index) {
    HistoryEntry currentEntry = filteredHistory[index];

    return Row(
      children: <Widget>[
        Expanded(child: buildEntry(index, true)),
        if (currentEntry.isFavourite)
          Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: Icon(Icons.favorite, color: Colors.red),
          ),
      ],
    );
  }

  Widget buildEntry(int index, bool isActive) {
    HistoryEntry currentEntry = filteredHistory[index];
    Booru? booru;
    if (settingsHandler.booruList.isNotEmpty) {
      booru = settingsHandler.booruList.firstWhereOrNull((b) => b.type == currentEntry.booruType && b.name == currentEntry.booruName);
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: Get.theme.colorScheme.secondary),
        ),
        onTap: isActive
            ? () {
                if (booru != null) {
                  searchHandler.searchTextController.text = currentEntry.searchText;
                  Navigator.of(context).pop(true);
                  searchHandler.searchAction(currentEntry.searchText, booru);
                } else {
                  FlashElements.showSnackbar(
                    context: context,
                    title: Text("Unknown Booru type!", style: TextStyle(fontSize: 20)),
                    leadingIcon: Icons.warning_amber,
                    leadingIconColor: Colors.red,
                    sideColor: Colors.red,
                  );
                }
              }
            : null,
        onLongPress: isActive ? () => showHistoryEntryActions(buildEntry(index, false), currentEntry) : null,
        minLeadingWidth: 20,
        leading: booru != null
            ? (booru.type == "Favourites" ? Icon(Icons.favorite, color: Colors.red, size: 18) : CachedFavicon(booru.faviconURL!))
            : Icon(CupertinoIcons.question, size: 18),
        title: MarqueeText(
          key: ValueKey(currentEntry.searchText),
          text: currentEntry.searchText,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          isExpanded: false,
        ),
      ),
    );
  }

  Widget filterBuild() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 45,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: filterSearchController,
                      onChanged: (String input) {
                        filterHistory();
                      },
                      enableInteractiveSelection: true,
                      decoration: InputDecoration(
                        hintText:
                            "Filter Search History (${filterSearchController.text.isEmpty ? history.length : '${filteredHistory.length}/${history.length}'})",
                        labelText:
                            "Filter Search History (${filterSearchController.text.isEmpty ? history.length : '${filteredHistory.length}/${history.length}'})",
                        labelStyle: TextStyle(color: Get.theme.colorScheme.onBackground, fontSize: 18),
                        contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          gapPadding: 0,
                        ),
                      ),
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      Center(
                        child: IconButton(
                          padding: const EdgeInsets.fromLTRB(0, 2, 0, 15),
                          icon: Icon(Icons.favorite, size: 40, color: Colors.red),
                          onPressed: () {},
                        ),
                      ),
                      Center(
                        child: IconButton(
                          padding: const EdgeInsets.fromLTRB(0, 7, 0, 15),
                          icon: Icon(
                            showFavourites ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                            color: showFavourites ? Colors.white : Colors.white60,
                          ),
                          onPressed: () {
                            showFavourites = !showFavourites;
                            filterHistory();
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget errorsBuild() {
    bool areThereErrors = isLoading ||
        (history.length == 0) ||
        (filteredHistory.length == 0) ||
        (!settingsHandler.searchHistoryEnabled) ||
        (!settingsHandler.dbEnabled);

    if (areThereErrors) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isLoading)
            CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Get.theme.colorScheme.secondary))
          else if (history.length == 0)
            Text('Search History is empty')
          else if (filteredHistory.length == 0)
            Text('Nothing found'),
          if (!settingsHandler.searchHistoryEnabled) Text('Search History is disabled.'),
          if (!settingsHandler.dbEnabled) Text('Search History requires enabling Database in settings.'),
        ],
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
        ],
      ),
      content: listBuild(),
      contentPadding: const EdgeInsets.all(6),
      titlePadding: const EdgeInsets.fromLTRB(6, 18, 2, 6),
      scrollable: false,
    );
  }
}

class HistoryEntry {
  final int id;
  final String searchText;
  final String booruType;
  final String booruName;
  bool isFavourite;
  final String timestamp;

  HistoryEntry(this.id, this.searchText, this.booruType, this.booruName, this.isFavourite, this.timestamp);

  HistoryEntry.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        searchText = map['searchText'],
        booruType = map['booruType'],
        booruName = map['booruName'],
        isFavourite = map['isFavourite'] == '1',
        timestamp = map['timestamp'];
}
