import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:huge_listview/huge_listview.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/history_item.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/custom_scroll_bar_thumb.dart';
import 'package:lolisnatcher/src/widgets/common/delete_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/kaomoji.dart';
import 'package:lolisnatcher/src/widgets/common/marquee_text.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/image/booru_favicon.dart';

// TODO split in smaller widgets

class HistoryList extends StatefulWidget {
  const HistoryList({super.key});

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;

  List<HistoryItem> history = [], filteredHistory = [], selectedEntries = [];
  final ItemScrollController itemScrollController = ItemScrollController();
  final HugeListViewController hugeListViewController = HugeListViewController(totalItemCount: 0);
  final TextEditingController filterSearchController = TextEditingController();
  bool isLoading = true, showFavourites = true;

  bool get isFilterActive => filteredHistory.length != history.length;

  bool get areThereErrors =>
      isLoading ||
      (history.isEmpty) ||
      (filteredHistory.isEmpty) ||
      (!settingsHandler.searchHistoryEnabled) ||
      (!settingsHandler.dbEnabled);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 100));
      await getHistory();
    });
  }

  @override
  void dispose() {
    filterSearchController.dispose();
    super.dispose();
  }

  Future<void> getHistory() async {
    isLoading = true;
    setState(() {});

    history = (settingsHandler.dbEnabled && settingsHandler.searchHistoryEnabled)
        ? await settingsHandler.dbHandler.getSearchHistory()
        : [];

    history.sort(compareFavourites);
    filteredHistory = history;
    filterHistory();

    isLoading = false;
    setState(() {});
  }

  Future<void> deleteEntry(HistoryItem entry) async {
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
          final bool booruFilter =
              h.booruName.toLowerCase().contains(filter) ||
              (h.booruType != null && h.booruType!.name.toLowerCase().contains(filter));
          final bool unknownFilter =
              'unknown'.contains(filter) &&
              settingsHandler.booruList.firstWhereOrNull(
                    (booru) => h.booruName == booru.name && h.booruType == booru.type,
                  ) ==
                  null;
          return textFilter || booruFilter || unknownFilter;
        }
      }).toList();
    } else {
      filteredHistory = history;
    }

    hugeListViewController.totalItemCount = filteredHistory.length;
    hugeListViewController.invalidateList(true);

    setState(() {});
  }

  Future<List<HistoryItem>> _loadPage(int page, int pageSize) async {
    final int start = page * pageSize;
    final int end = start + pageSize;
    final List<HistoryItem> pageTags = filteredHistory.sublist(start, min(filteredHistory.length, end));

    return pageTags;
  }

  int compareFavourites(HistoryItem a, HistoryItem b) {
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

  void showHistoryEntryActions(Widget row, HistoryItem entry, Booru? booru) {
    showDialog(
      context: context,
      builder: (context) {
        return SettingsDialog(
          contentItems: [
            SizedBox(width: double.maxFinite, child: row),
            Text(
              context.loc.history.lastSearchWithDate(date: formatDate(entry.timestamp)),
              textAlign: TextAlign.center,
            ),
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
                  searchHandler.searchAction(entry.searchText, booru);
                } else {
                  FlashElements.showSnackbar(
                    context: context,
                    title: Text(context.loc.history.unknownBooruType, style: const TextStyle(fontSize: 20)),
                    leadingIcon: Icons.warning_amber,
                    leadingIconColor: Colors.red,
                    sideColor: Colors.red,
                  );
                  return;
                }

                Navigator.of(context).popUntil(ModalRoute.withName('/'));
              },
              leading: const Icon(Icons.open_in_browser),
              title: Text(context.loc.history.open),
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
                  searchHandler.addTabByString(
                    entry.searchText,
                    customBooru: booru,
                    switchToNew: true,
                  );
                } else {
                  FlashElements.showSnackbar(
                    context: context,
                    title: Text(context.loc.history.unknownBooruType, style: const TextStyle(fontSize: 20)),
                    leadingIcon: Icons.warning_amber,
                    leadingIconColor: Colors.red,
                    sideColor: Colors.red,
                  );
                  return;
                }

                Navigator.of(context).popUntil(ModalRoute.withName('/'));
              },
              leading: const Icon(Icons.add_circle_outline),
              title: Text(context.loc.history.openInNewTab),
            ),
            //
            const SizedBox(height: 10),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              onTap: () {
                final int indexWhere = history.indexWhere((el) => el.id == entry.id);
                final bool newFavourite = !entry.isFavourite;
                entry.isFavourite = newFavourite;

                history[indexWhere] = entry;
                history.sort(compareFavourites);
                filterHistory();

                settingsHandler.dbHandler.setFavouriteSearchHistory(entry.id, newFavourite);

                Navigator.of(context).pop();
              },
              leading: Icon(
                entry.isFavourite ? Icons.favorite_border : Icons.favorite,
                color: entry.isFavourite ? Colors.grey : Colors.red,
              ),
              title: Text(
                entry.isFavourite ? context.loc.history.removeFromFavourites : context.loc.history.setAsFavourite,
              ),
            ),
            //
            const SizedBox(height: 10),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: entry.searchText));
                FlashElements.showSnackbar(
                  context: context,
                  duration: const Duration(seconds: 2),
                  title: Text(context.loc.copiedToClipboard, style: const TextStyle(fontSize: 20)),
                  content: Text(entry.searchText, style: const TextStyle(fontSize: 16)),
                  leadingIcon: Icons.copy,
                  sideColor: Colors.green,
                );
                Navigator.of(context).pop();
              },
              leading: const Icon(Icons.copy),
              title: Text(context.loc.history.copy),
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
                await deleteEntry(entry);
                Navigator.of(context).pop();
              },
              leading: Icon(Icons.delete_forever, color: Theme.of(context).colorScheme.error),
              title: Text(context.loc.history.delete),
            ),
          ],
        );
      },
    );
  }

  Widget listBuild() {
    final pageSize = MediaQuery.sizeOf(context).height ~/ 70;

    return HugeListView(
      scrollController: itemScrollController,
      listViewController: hugeListViewController,
      itemBuilder: (context, index, _) => listEntryBuild(context, index),
      placeholderBuilder: (BuildContext context, int index) {
        return const LinearProgressIndicator();
      },
      pageFuture: (page) => _loadPage(page, pageSize),
      pageSize: pageSize,
      thumbBuilder:
          (
            Color backgroundColor,
            Color drawColor,
            double height,
            int index,
            bool alwaysVisibleScrollThumb,
            Animation<double> thumbAnimation,
          ) {
            final HistoryItem item = filteredHistory[index];
            return CustomScrollBarThumb(
              backgroundColor: backgroundColor,
              drawColor: drawColor,
              height: height * 1.2, // 48
              title: '${formatDate(item.timestamp, withTime: false)} ${item.isFavourite ? '❤' : ''}',
            );
          },
      thumbBackgroundColor: Theme.of(context).colorScheme.surface,
      thumbDrawColor: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.5),
      startIndex: 0,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
    );
  }

  Widget listEntryBuild(BuildContext context, int index) {
    return Row(
      key: Key(index.toString()),
      children: [
        Expanded(child: buildEntry(index, true, true)),
      ],
    );
  }

  Widget buildEntry(int index, bool isActive, bool fromFiltered) {
    final HistoryItem currentEntry = fromFiltered ? filteredHistory[index] : history[index];
    Booru? booru;
    if (settingsHandler.booruList.isNotEmpty) {
      booru = settingsHandler.booruList.firstWhereOrNull(
        (b) =>
            b.type == currentEntry.booruType &&
            (b.type?.isFavouritesOrDownloads == true || b.name == currentEntry.booruName),
      );
    }

    final bool showCheckbox = isActive;
    final bool isSelected = selectedEntries.contains(currentEntry);

    final Widget checkbox = Checkbox(
      value: isSelected,
      onChanged: (bool? newValue) {
        if (isSelected) {
          selectedEntries.removeWhere((item) => item == currentEntry);
        } else {
          selectedEntries.add(currentEntry);
        }
        setState(() {});
      },
    );

    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        height: 72,
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(color: Colors.grey),
          ),
          onTap: isActive ? () => showHistoryEntryActions(buildEntry(index, false, true), currentEntry, booru) : null,
          minLeadingWidth: 24,
          leading: BooruFavicon(booru),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (currentEntry.isFavourite)
                const Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Icon(Icons.favorite, color: Colors.red),
                ),
              if (showCheckbox) checkbox,
            ],
          ),
          title: SizedBox(
            height: 16,
            child: MarqueeText(
              key: ValueKey(currentEntry.searchText),
              text: currentEntry.searchText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              isExpanded: false,
            ),
          ),
          subtitle: Text(
            booru?.name ??
                context.loc.history.unknownBooru(name: currentEntry.booruName, type: currentEntry.booruType.toString()),
          ),
        ),
      ),
    );
  }

  Widget filterBuild() {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      child: Row(
        children: [
          Expanded(
            child: SettingsTextInput(
              onlyInput: true,
              controller: filterSearchController,
              onChanged: (String? input) {
                getHistory();
              },
              title: context.loc.history.filterSearchHistory,
              inputType: TextInputType.text,
              clearable: true,
              pasteable: true,
              margin: const EdgeInsets.fromLTRB(5, 8, 5, 5),
              enableIMEPersonalizedLearning: !settingsHandler.incognitoKeyboard,
            ),
          ),
          Center(
            child: IconButton(
              icon: Icon(
                Icons.favorite,
                color: showFavourites ? Colors.red : null,
              ),
              iconSize: 32,
              onPressed: () {
                showFavourites = !showFavourites;
                filterHistory();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget errorsBuild() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      controller: ScrollController(),
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: [
        if (areThereErrors)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 60),
              if (isLoading)
                const CircularProgressIndicator()
              else if (history.isEmpty) ...[
                const Kaomoji(
                  type: KaomojiType.shrug,
                  style: TextStyle(fontSize: 40),
                ),
                const SizedBox(height: 10),
                Text(
                  context.loc.history.searchHistoryIsEmpty,
                  style: const TextStyle(fontSize: 20),
                ),
              ] else if (filteredHistory.isEmpty) ...[
                const Kaomoji(
                  type: KaomojiType.shrug,
                  style: TextStyle(fontSize: 40),
                ),
                const SizedBox(height: 10),
                Text(
                  context.loc.nothingFound,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
              if (!settingsHandler.searchHistoryEnabled) Text(context.loc.history.searchHistoryIsDisabled),
              if (!settingsHandler.dbEnabled) Text(context.loc.history.searchHistoryRequiresDatabase),
            ],
          )
        else
          const SizedBox.shrink(),
      ],
    );
  }

  Widget selectedActionsBuild() {
    if (selectedEntries.isEmpty) {
      if (isFilterActive) {
        return Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.select_all),
                  label: Text(context.loc.selectAll),
                  onPressed: () {
                    // create new list through spread to avoid modifying the original list
                    selectedEntries = [...filteredHistory];
                    setState(() {});
                  },
                ),
              ),
            ),
          ],
        );
      } else {
        return const SizedBox.shrink();
      }
    }

    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: ElevatedButton.icon(
              label: Text(context.loc.history.deleteItems(count: selectedEntries.length)),
              icon: const Icon(Icons.delete_forever),
              onPressed: () {
                if (selectedEntries.isEmpty) {
                  return;
                }

                final Widget deleteDialog = SettingsDialog(
                  title: Text(context.loc.history.deleteHistoryEntries),
                  scrollable: false,
                  content: SizedBox(
                    width: double.maxFinite,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Text(
                          context.loc.history.deleteItemsConfirm(count: selectedEntries.length),
                        ),
                        const SizedBox(height: 10),
                        ...selectedEntries.map((HistoryItem entry) {
                          final int index = history.indexOf(entry);
                          return buildEntry(index, false, false);
                        }),
                      ],
                    ),
                  ),
                  actionButtons: [
                    const CancelButton(withIcon: true),
                    DeleteButton(
                      withIcon: true,
                      action: () async {
                        for (int i = 0; i < selectedEntries.length; i++) {
                          await deleteEntry(selectedEntries[i]);
                        }
                        selectedEntries.clear();
                        unawaited(getHistory());
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );

                showDialog(
                  context: context,
                  builder: (_) => deleteDialog,
                );
              },
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.border_clear),
            label: Text(context.loc.history.clearSelection),
            onPressed: () {
              selectedEntries.clear();
              setState(() {});
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
        color: Colors.transparent,
        child: SizedBox(
          width: double.maxFinite,
          child: areThereErrors ? errorsBuild() : listBuild(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SettingsPageDialog(
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.loc.history.searchHistory),
          Text(
            '${filterSearchController.text.isEmpty ? history.length : '${filteredHistory.length}/${history.length}'}',
            style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
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

String formatDate(String timestamp, {bool withTime = true}) {
  final Duration timeZone = DateTime.now().timeZoneOffset;
  final DateTime searchDate = DateTime.parse(timestamp).add(timeZone);

  final String dayStr = searchDate.day.toString().padLeft(2, '0');
  final String monthStr = searchDate.month.toString().padLeft(2, '0');
  final String yearStr = searchDate.year.toString().substring(2);
  final String hourStr = searchDate.hour.toString().padLeft(2, '0');
  final String minuteStr = searchDate.minute.toString().padLeft(2, '0');
  final String secondStr = searchDate.second.toString().padLeft(2, '0');
  final String searchDateStr = withTime
      ? '$dayStr.$monthStr.$yearStr $hourStr:$minuteStr:$secondStr'
      : '$dayStr.$monthStr.$yearStr';
  return searchDateStr;
}
