import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/src/utils/tools.dart';
import 'package:LoliSnatcher/src/data/Booru.dart';
import 'package:LoliSnatcher/widgets/CancelButton.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:LoliSnatcher/widgets/MarqueeText.dart';
import 'package:LoliSnatcher/widgets/CachedFavicon.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:LoliSnatcher/widgets/DesktopScrollWrap.dart';

class HistoryList extends StatefulWidget {
  const HistoryList({Key? key}) : super(key: key);

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;

  List<HistoryEntry> history = [], filteredHistory = [], selectedEntries = [];
  final ScrollController scrollController = ScrollController();
  final TextEditingController filterSearchController = TextEditingController();
  bool isLoading = true, showFavourites = true;

  bool get isFilterActive => filteredHistory.length != history.length;

  bool get areThereErrors => isLoading ||
        (history.isEmpty) ||
        (filteredHistory.isEmpty) ||
        (!settingsHandler.searchHistoryEnabled) ||
        (!settingsHandler.dbEnabled);

  @override
  void initState() {
    super.initState();
    getHistory();
  }

  void getHistory() async {
    isLoading = true;
    setState(() { });

    history = ((settingsHandler.dbEnabled && settingsHandler.searchHistoryEnabled) ? await settingsHandler.dbHandler.getSearchHistory() : [])
        .map((e) => HistoryEntry.fromMap(e))
        .toList();

    history.sort(compareFavourites);
    filteredHistory = history;
    filterHistory();

    isLoading = false;
    setState(() {});
  }

  Future<void> deleteEntry(HistoryEntry entry) async {
    await settingsHandler.dbHandler.deleteFromSearchHistory(entry.id);
    history = history.where((el) => el.id != entry.id).toList();
    filterHistory();
    return;
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
          // TODO copy filtering logic from tabboxdialog
          final String filter = filterSearchController.text.toLowerCase();
          final bool textFilter = h.searchText.toLowerCase().contains(filter);
          final bool booruFilter = h.booruName.toLowerCase().contains(filter) || h.booruType.toLowerCase().contains(filter);
          final bool unknownFilter = 'unknown'.contains(filter) && settingsHandler.booruList.firstWhereOrNull((booru) => h.booruName == booru.name && h.booruType == booru.type) == null;
          return textFilter || booruFilter || unknownFilter;
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
      return a.timestamp.compareTo(b.timestamp) * -1;
    }
  }

  void showHistoryEntryActions(Widget row, HistoryEntry entry, Booru? booru) {
    final Duration timeZone = DateTime.now().timeZoneOffset;
    final DateTime searchDate = DateTime.parse(entry.timestamp).add(timeZone);

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
            // 
            const SizedBox(height: 20),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              onTap: () {
                if (booru != null) {
                  searchHandler.searchTextController.text = entry.searchText;
                  // close the tab options dialog
                  Navigator.of(context).pop(true);
                  searchHandler.searchAction(entry.searchText, booru);
                } else {
                  FlashElements.showSnackbar(
                    context: context,
                    title: const Text("Unknown Booru type!", style: TextStyle(fontSize: 20)),
                    leadingIcon: Icons.warning_amber,
                    leadingIconColor: Colors.red,
                    sideColor: Colors.red,
                  );
                }

                // close the history list dialog
                Navigator.of(context).pop(true);
              },
              leading: const Icon(Icons.open_in_browser),
              title: const Text('Open'),
            ),
            // 
            const SizedBox(height: 10),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              onTap: () {
                if (booru != null) {
                  searchHandler.searchTextController.text = entry.searchText;
                  Navigator.of(context).pop(true);
                  searchHandler.addTabByString(
                    entry.searchText,
                    customBooru: booru,
                    switchToNew: true,
                  );
                } else {
                  FlashElements.showSnackbar(
                    context: context,
                    title: const Text("Unknown Booru type!", style: TextStyle(fontSize: 20)),
                    leadingIcon: Icons.warning_amber,
                    leadingIconColor: Colors.red,
                    sideColor: Colors.red,
                  );
                }

                Navigator.of(context).pop(true);
              },
              leading: const Icon(Icons.add_circle_outline),
              title: const Text('Open in new tab'),
            ),
            // 
            const SizedBox(height: 10),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              onTap: () {
                int indexWhere = history.indexWhere((el) => el.id == entry.id);
                bool newFavourite = !entry.isFavourite;
                entry.isFavourite = newFavourite;

                history[indexWhere] = entry;
                history.sort(compareFavourites);
                filterHistory();

                settingsHandler.dbHandler.setFavouriteSearchHistory(entry.id, newFavourite);

                Navigator.of(context).pop(true);
              },
              leading: Icon(entry.isFavourite ? Icons.favorite_border : Icons.favorite, color: entry.isFavourite ? Colors.grey : Colors.red),
              title: Text(entry.isFavourite ? 'Remove from Favourites' : 'Set as Favourite'),
            ),
            // 
            const SizedBox(height: 10),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              onTap: () async {
                Clipboard.setData(ClipboardData(text: entry.searchText));
                FlashElements.showSnackbar(
                  context: context,
                  duration: const Duration(seconds: 2),
                  title: const Text("Copied to clipboard!", style: TextStyle(fontSize: 20)),
                  content: Text(entry.searchText, style: const TextStyle(fontSize: 16)),
                  leadingIcon: Icons.copy,
                  sideColor: Colors.green,
                );
                Navigator.of(context).pop(true);
              },
              leading: const Icon(Icons.copy),
              title: const Text('Copy'),
            ),
            // 
            const SizedBox(height: 10),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              onTap: () async {
                selectedEntries.removeWhere((e) => e.id == entry.id);
                deleteEntry(entry);
                Navigator.of(context).pop(true);
              },
              leading: Icon(Icons.delete_forever, color: Theme.of(context).errorColor),
              title: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  Widget listBuild() {
    return DesktopScrollWrap(
      controller: scrollController,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        controller: scrollController,
        physics: getListPhysics(), // const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        shrinkWrap: false,
        itemCount: filteredHistory.length,
        scrollDirection: Axis.vertical,
        itemBuilder: listEntryBuild,
      ),
    );
  }

  Widget listEntryBuild(BuildContext context, int index) {
    return Row(
      key: Key(index.toString()),
      children: <Widget>[
        Expanded(child: buildEntry(index, true, true)),
      ],
    );
  }

  Widget buildEntry(int index, bool isActive, bool fromFiltered) {
    HistoryEntry currentEntry = fromFiltered ? filteredHistory[index] : history[index];
    Booru? booru;
    if (settingsHandler.booruList.isNotEmpty) {
      booru = settingsHandler.booruList.firstWhereOrNull((b) => b.type == currentEntry.booruType && b.name == currentEntry.booruName);
    }

    final bool showCheckbox = isActive;
    final bool isSelected = selectedEntries.contains(currentEntry);

    final Widget checkbox = Checkbox(
      value: isSelected,
      onChanged: (bool? newValue) {
        if(isSelected) {
          selectedEntries.removeWhere((item) => item == currentEntry);
        } else {
          selectedEntries.add(currentEntry);
        }
        setState(() { });
      },
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(color: Colors.grey),
        ),
        onTap: isActive ? () => showHistoryEntryActions(buildEntry(index, false, true), currentEntry, booru) : null,
        minLeadingWidth: 20,
        leading: booru != null
            ? (booru.type == "Favourites" ? const Icon(Icons.favorite, color: Colors.red, size: 18) : CachedFavicon(booru.faviconURL!))
            : const Icon(CupertinoIcons.question, size: 18),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if(currentEntry.isFavourite)
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Icon(Icons.favorite, color: Colors.red),
              ),
            if(showCheckbox)
              checkbox,
          ],
        ),
        title: MarqueeText(
          key: ValueKey(currentEntry.searchText),
          text: currentEntry.searchText,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          isExpanded: false,
        ),
        subtitle: Text(booru?.name ?? 'Unknown'),
      ),
    );
  }

  Widget filterBuild() {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: SizedBox(
              // height: 45,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: SettingsTextInput(
                      onlyInput: true,
                      controller: filterSearchController,
                      onChanged: (String? input) {
                        filterHistory();
                      },
                      title: "Filter Search History (${filterSearchController.text.isEmpty ? history.length : '${filteredHistory.length}/${history.length}'})",
                      hintText: "Filter Search History (${filterSearchController.text.isEmpty ? history.length : '${filteredHistory.length}/${history.length}'})",
                      inputType: TextInputType.text,
                      clearable: true,
                      margin: const EdgeInsets.fromLTRB(5, 8, 5, 5),
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      Center(
                        child: IconButton(
                          padding: const EdgeInsets.fromLTRB(0, 2, 0, 15),
                          icon: const Icon(Icons.favorite, size: 40, color: Colors.red),
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
    return ListView(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      controller: scrollController,
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: [
        if (areThereErrors)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 60),

              if (isLoading)
                const CircularProgressIndicator()
              else if (history.isEmpty)
                const Text('Search History is empty')
              else if (filteredHistory.isEmpty)
                const Text('Nothing found'),

              if (!settingsHandler.searchHistoryEnabled) const Text('Search History is disabled.'),
              if (!settingsHandler.dbEnabled) const Text('Search History requires enabling Database in settings.'),
            ],
          )
        else 
          const SizedBox(),
      ],
    );
  }

  Widget selectedActionsBuild() {
    if(selectedEntries.isEmpty) {
      if(isFilterActive) {
        return Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.select_all),
                  label: const Text("Select all"),
                  onPressed: () {
                    // create new list through spread to avoid modifying the original list
                    selectedEntries = [...filteredHistory];
                    setState(() { });
                  },
                ),
              ),
            ),
          ],
        );
      } else {
        return const SizedBox();
      }
    }

    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: ElevatedButton.icon(
              label: Text("Delete ${selectedEntries.length} ${Tools.pluralize('item', selectedEntries.length)}"),
              icon: const Icon(Icons.delete_forever),
              onPressed: () {
                if(selectedEntries.isEmpty) {
                  return;
                }

                final Widget deleteDialog = SettingsDialog(
                  title: const Text("Delete History Entries"),
                  scrollable: false,
                  content: SizedBox(
                    width: double.maxFinite,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Text('Are you sure you want to delete ${selectedEntries.length} ${Tools.pluralize('item', selectedEntries.length)}?'),
                        const SizedBox(height: 10),
                        ...selectedEntries.map((HistoryEntry entry) {
                          final int index = history.indexOf(entry);
                          return buildEntry(index, false, false);
                        }).toList(),
                      ],
                    ),
                  ),
                  actionButtons: [
                    const CancelButton(),
                    ElevatedButton.icon(
                      label: const Text("Delete"),
                      icon: const Icon(Icons.delete_forever),
                      onPressed: () async {
                        for(int i = 0; i < selectedEntries.length; i++) {
                          await deleteEntry(selectedEntries[i]);
                        }
                        selectedEntries.clear();
                        getHistory();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );

                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) => deleteDialog,
                );
              },
            ),
          ),
        ),

        Expanded(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.border_clear),
            label: const Text("Clear selection"),
            onPressed: () {
              selectedEntries.clear();
              setState(() { });
            },
          ),
        ),
      ],
    );
  }

  Widget mainBuild() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        child: SizedBox(
          width: double.maxFinite,
          child: Scrollbar(
            controller: scrollController,
            child: RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              displacement: 80,
              strokeWidth: 4,
              color: Theme.of(context).colorScheme.secondary,
              onRefresh: () async {
                getHistory();
              },
              child: areThereErrors ? errorsBuild() : listBuild(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SettingsPageDialog(
      title: const Text('Search History'),
      content: Column(
        children: [
          filterBuild(),
          Expanded(child: mainBuild()),
          selectedActionsBuild(),
        ],
      ),
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
      : id = map['id'] as int,
        searchText = map['searchText'] as String,
        booruType = map['booruType'] as String,
        booruName = map['booruName'] as String,
        isFavourite = map['isFavourite'] == '1',
        timestamp = map['timestamp'] as String;
}
