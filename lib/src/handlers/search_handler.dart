import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:uuid/uuid.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/booru_handler_factory.dart';
import 'package:lolisnatcher/src/handlers/database_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/snatch_handler.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';

Uuid uuid = const Uuid();

EventChannel? volumeKeyChannel = Platform.isAndroid ? const EventChannel('com.noaisu.loliSnatcher/volume') : null;

// special strings used to separate parts of tab backup string
const String tabDivider = '|||', listDivider = '~~~';
List<List<String>> decodeBackupString(String input) {
  final List<List<String>> result = [];
  final List<String> splitInput = input.split(listDivider);
  for (final String str in splitInput) {
    final List<String> booruAndTags = str.split(tabDivider);
    result.add(booruAndTags);
  }
  return result;
}

class SearchHandler {
  SearchHandler() {
    _volumeStreamController = Platform.isAndroid ? StreamController.broadcast() : null;
    _scrollStream = StreamController.broadcast();
    _rootVolumeListener = volumeKeyChannel?.receiveBroadcastStream().listen((event) {
      _volumeStreamController?.sink.add(event);
    });
  }
  // alternative way to get instance of the controller
  // i.e. "SearchHandler.to.list" instead of "Get.find<SearchHandler>().list"
  static SearchHandler get instance => GetIt.instance<SearchHandler>();

  static SearchHandler register() {
    if (!GetIt.instance.isRegistered<SearchHandler>()) {
      GetIt.instance.registerSingleton(
        SearchHandler(),
        dispose: (searchHandler) => searchHandler.dispose(),
      );
    }
    return instance;
  }

  static void unregister() => GetIt.instance.unregister<SearchHandler>();

  // search globals list
  RxList<SearchTab> list = RxList<SearchTab>([]);
  // current tab index
  RxInt index = 0.obs;
  RxnString tabId = RxnString(null);

  // add new tab by the given search string
  void addTabByString(
    String searchText, {
    bool switchToNew = false,
    Booru? customBooru,
    List<Booru>? secondaryBoorus,
    TabAddMode addMode = TabAddMode.end,
    int? customPage,
  }) {
    final Booru booru = customBooru ?? currentBooru;

    // Add new tab depending on the add mode
    final SearchTab newTab = SearchTab(
      booru,
      secondaryBoorus,
      searchText,
    );
    if (customPage != null) {
      newTab.booruHandler.pageNum = customPage;
    }

    int newIndex = 0;
    switch (addMode) {
      case TabAddMode.prev:
        newIndex = currentIndex;
        list.insert(newIndex, newTab);
        break;
      case TabAddMode.next:
        newIndex = currentIndex + 1;
        list.insert(newIndex, newTab);
        break;
      case TabAddMode.end:
        list.add(newTab);
        newIndex = total - 1;
        break;
    }

    // record search query to db
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    if (searchText != '' && settingsHandler.searchHistoryEnabled) {
      settingsHandler.dbHandler.updateSearchHistory(
        searchText,
        booru.type?.name,
        booru.name,
      );
    }

    // set to last tab if requested
    if (switchToNew) {
      changeTabIndex(newIndex);
    }
  }

  // remove tab (or current if not provided) index and set new index and search text values
  void removeTabAt({int tabIndex = -1}) {
    if (tabIndex == -1) {
      tabIndex = currentIndex;
    }

    // reset viewed item in any case
    setViewedItem(-1);

    if (total > 1) {
      if (tabIndex == currentIndex) {
        // if current tab is the one being removed
        if (currentIndex == total - 1) {
          // if current tab is the last one, switch to previous one
          changeTabIndex(currentIndex - 1);
          list.removeAt(currentIndex + 1);
        } else {
          // if current tab is not the last one, switch to next one
          changeTabIndex(currentIndex + 1, switchOnly: true);
          list.removeAt(currentIndex - 1);
          changeTabIndex(currentIndex - 1);
        }
      } else {
        // if current tab is not the one being removed
        if (tabIndex < currentIndex) {
          // if tab to be removed is before current tab
          changeTabIndex(currentIndex - 1, switchOnly: true);
        }
        list.removeAt(tabIndex);
        changeTabIndex(currentIndex);
      }
    } else {
      // if there is only one tab, reset to default tags
      FlashElements.showSnackbar(
        title: const Text('Removed Last Tab', style: TextStyle(fontSize: 20)),
        content: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Resetting search to default tags!'),
          ],
        ),
        leadingIcon: Icons.warning_amber,
        leadingIconColor: Colors.yellow,
        sideColor: Colors.yellow,
      );

      final SettingsHandler settingsHandler = SettingsHandler.instance;
      final String defaultText = currentBooru.defTags?.isNotEmpty == true
          ? currentBooru.defTags!
          : settingsHandler.defTags;
      searchTextController.text = defaultText;

      final SearchTab newTab = SearchTab(currentBooru, null, defaultText);
      list[0] = newTab;
      changeTabIndex(0);
    }
  }

  void removeTabs(List<SearchTab> tabs) {
    final curTab = currentTab;
    final totalTabs = total;

    setViewedItem(-1);

    for (final tab in tabs) {
      list.value.remove(tab);
    }

    if (totalTabs == tabs.length) {
      FlashElements.showSnackbar(
        title: const Text('Removed last tab', style: TextStyle(fontSize: 20)),
        content: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Resetting search to default tags!'),
          ],
        ),
        leadingIcon: Icons.warning_amber,
        leadingIconColor: Colors.yellow,
        sideColor: Colors.yellow,
      );

      final SettingsHandler settingsHandler = SettingsHandler.instance;
      final String defaultText = currentBooru.defTags?.isNotEmpty == true
          ? currentBooru.defTags!
          : settingsHandler.defTags;
      searchTextController.text = defaultText;

      final SearchTab newTab = SearchTab(currentBooru, null, defaultText);
      list.value[0] = newTab;
      changeTabIndex(0);
    } else {
      final newIndex = list.value.indexWhere((t) => t.id == curTab.id);
      changeTabIndex(newIndex == -1 ? total - 1 : newIndex);
    }
  }

  void moveTab(int fromIndex, int toIndex) {
    // value checks
    if (fromIndex == toIndex) {
      return;
    }
    if (fromIndex < 0 || fromIndex >= total || toIndex < 0 || toIndex >= total) {
      return;
    }

    // move tab
    final SearchTab tab = list[fromIndex];
    list.removeAt(fromIndex);
    list.insert(toIndex, tab);

    // check how index changed and jump to correct tab
    if (fromIndex == currentIndex) {
      // if the current tab is moved, change the current tab index
      changeTabIndex(toIndex);
    } else if (toIndex == currentIndex) {
      // if moved into the place of the current tab, bump index of current tab
      changeTabIndex(toIndex + 1);
    } else if (fromIndex < currentIndex && toIndex > currentIndex) {
      // if tab was before current tab and is moved after current tab, current tab is -1
      changeTabIndex(currentIndex - 1);
    } else if (fromIndex > currentIndex && toIndex < currentIndex) {
      // if tab was after current tab and is moved before current tab, current tab is +1
      changeTabIndex(currentIndex + 1);
    }
  }

  SearchTab? getTabByIndex(int index) {
    if (index < 0 || index >= total) {
      return null;
    }
    return list[index];
  }

  int getTabIndex(SearchTab tab) {
    return list.indexOf(tab);
  }

  int getItemIndex(BooruItem item) {
    return currentFetched.indexOf(item);
  }

  // grid scroll controller
  AutoScrollController gridScrollController =
      AutoScrollController(); // will be overwritten on the first render because there is hasClients check
  RxDouble scrollOffset = 0.0.obs;
  // stream that will notify it's listeners about scroll events of the grid controller
  StreamController<ScrollUpdateNotification>? _scrollStream;
  Stream<ScrollUpdateNotification>? get scrollStream => _scrollStream?.stream;

  void sendToScrollStream(ScrollUpdateNotification notification) {
    _scrollStream?.sink.add(notification);

    scrollOffset.value = gridScrollController.offset;
    currentTab.scrollPosition = gridScrollController.offset;
  }

  // search box text controller
  final TextEditingController searchTextController = TextEditingController();
  void addTagToSearch(String tag) {
    if (tag.isNotEmpty) {
      if (currentBooru.type?.isHydrus == true) {
        searchTextController.text += ', $tag';
      } else {
        searchTextController.text += ' $tag';
      }
    }
  }

  List<String> get searchTextControllerTags =>
      searchTextController.text.trim().split(' ').where((t) => t.isNotEmpty).toList();

  void removeTagFromSearch(String tag) {
    if (tag.isNotEmpty) {
      searchTextController.text = searchTextController.text.replaceAll('-$tag', '').replaceAll(tag, '');
    }
  }

  // search box focus node
  FocusNode searchBoxFocus = FocusNode();

  final GlobalKey<InnerDrawerState> mainDrawerKey = GlobalKey<InnerDrawerState>();

  // switch to tab #index
  void changeTabIndex(
    int i, {
    bool switchOnly = false,
    bool ignoreSameIndexCheck = false,
  }) {
    // change only if new index != current index
    // final int oldIndex = currentIndex;
    int newIndex = i;

    // protection from early execution on start
    if (list.isEmpty) {
      return;
    }

    // protection from out of bounds
    if (newIndex > (total - 1)) {
      newIndex = total - 1;
    } else if (newIndex < 0) {
      newIndex = 0;
    }

    // change index only when it's different
    if (!ignoreSameIndexCheck && newIndex != currentIndex) {
      index.value = newIndex;
      tabId.value = list[newIndex].id;
      Tools.forceClearMemoryCache(withLive: true);
    }

    // set search text (even if index didn't change)
    searchTextController.text = currentTab.tags;

    /// Get state from (new) current tab (current page, is end of search, did stop on error)
    pageNum.value = currentBooruHandler.pageNum;
    isLastPage.value = currentBooruHandler.locked;
    errorString.value = currentBooruHandler.errorString;

    if (switchOnly) {
      // only used when we need to switch tabs around, but don't trigger new search call (e.g. when removing tabs)
      return;
    }

    // reset search bool
    isLoading.value = false;

    // trigger first search OR just get old filteredFetched list
    final bool isNewSearch = currentFetched.isEmpty;
    // print('isNEW: $isNewSearch ${currentIndex}');
    // trigger search if there are items inside booruHandler
    if (isNewSearch) {
      runSearch().then((_) {
        setViewedItem(currentTab.viewedIndex.value);
        tabId.value = list[currentIndex].id;
      });
    } else {
      // set current viewed index and item of the tab
      setViewedItem(currentTab.viewedIndex.value);
      tabId.value = list[currentIndex].id;
    }

    // print('changed index from $oldIndex to $newIndex');
  }

  // recreate current tab with custom starting page number
  void changeCurrentTabPageNumber(int newPageNum) {
    final SearchTab newTab = SearchTab(
      currentBooru,
      currentSecondaryBoorus.value,
      currentTab.tags,
    );
    newTab.booruHandler.pageNum = newPageNum;
    pageNum.value = newPageNum;
    list[currentIndex] = newTab;

    changeTabIndex(currentIndex, ignoreSameIndexCheck: true);
  }

  RxBool isRunningAutoSearch = false.obs;
  // search on the current tab until we reach given page number or there is an error
  Future<void> searchCurrentTabUntilPageNumber(
    int newPageNum, {
    int? customDelay,
  }) async {
    if (isRunningAutoSearch.value) {
      return;
    }
    isRunningAutoSearch.value = true;

    if (newPageNum > pageNum.value) {
      int tempNum = pageNum.value;
      while (isRunningAutoSearch.value && tempNum < newPageNum) {
        if (!isLoading.value) {
          await runSearch();
          tempNum++;
          // print('search num $tempNum ${pageNum.value}');

          if (errorString.value.isNotEmpty) {
            break;
          }

          await Future.delayed(Duration(milliseconds: customDelay ?? 200));
        }
      }
    }

    isRunningAutoSearch.value = false;
  }

  HasTabWithTagResult hasTabWithTag(String tag) {
    tag = tag.toLowerCase().trim();
    List<SearchTab> tabsWithOnlyTag = list.where((tab) => tab.tags == tag).toList();
    if (tabsWithOnlyTag.isNotEmpty) {
      tabsWithOnlyTag = tabsWithOnlyTag.where((tab) => tab.tags.toLowerCase().trim() == tag).toList();
      if (tabsWithOnlyTag.isNotEmpty) {
        if (tabsWithOnlyTag.any((tab) => tab.selectedBooru.value == currentBooru)) {
          return HasTabWithTagResult.onlyTag;
        } else {
          return HasTabWithTagResult.onlyTagDifferentBooru;
        }
      }
    }

    List<SearchTab> tabsContainingTag = list
        .where(
          (tab) => tab.tags.contains(tag),
        )
        .toList();
    if (tabsContainingTag.isNotEmpty) {
      tabsContainingTag = tabsContainingTag
          .where((tab) => tab.tags.toLowerCase().trim().split(' ').contains(tag))
          .toList();
      if (tabsContainingTag.isNotEmpty) {
        return HasTabWithTagResult.containsTag;
      }
    }

    return HasTabWithTagResult.noTag;
  }

  List<SearchTab> getTabsWithTag(String tag) {
    final List<SearchTab> tabs = [];
    for (final SearchTab tab in list) {
      if (tab.tags.toLowerCase().trim().split(' ').contains(tag.toLowerCase().trim())) {
        tabs.add(tab);
      }
    }
    return tabs;
  }

  int get currentIndex => index.value;
  String? get currentTabId => tabId.value;
  int get total => list.length;
  SearchTab get currentTab => list[currentIndex];
  BooruHandler get currentBooruHandler => currentTab.booruHandler;
  Booru get currentBooru => currentTab.selectedBooru.value;
  Rxn<List<Booru>?> get currentSecondaryBoorus => currentTab.secondaryBoorus;
  RxList<BooruItem> get currentSelected => currentTab.selected;
  RxList<BooruItem> get currentFetched => currentBooruHandler.filteredFetched;
  void filterCurrentFetched() {
    if (list.isNotEmpty) {
      currentBooruHandler.filterFetched();
    }
  }

  RxInt viewedIndex = (-1).obs;
  Rx<BooruItem> viewedItem = BooruItem(
    fileURL: '',
    sampleURL: '',
    thumbnailURL: '',
    tagsList: const [],
    postURL: '',
  ).obs;

  BooruItem setViewedItem(int i) {
    final int newIndex = i;
    // final int oldIndex = viewedIndex.value;
    final BooruItem newItem = newIndex != -1
        ? currentFetched[newIndex]
        : BooruItem(
            fileURL: '',
            sampleURL: '',
            thumbnailURL: '',
            tagsList: const [],
            postURL: '',
          );
    viewedItem.value = newItem;
    currentTab.viewedItem.value = newItem;

    viewedIndex.value = newIndex;
    currentTab.viewedIndex.value = newIndex;

    // print('old $oldIndex | new $newIndex index \n new item ${newItem.toString()}');

    return newItem;
  }

  // runs search on current tab
  void searchAction(String text, Booru? newBooru) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    // Remove extra spaces
    text = text.trim();

    // clear image emory cache
    Tools.forceClearMemoryCache(withLive: true);

    // set new tab data
    if (list.isEmpty) {
      if (settingsHandler.booruList.isNotEmpty) {
        final SearchTab newTab = SearchTab(
          settingsHandler.booruList[0],
          currentSecondaryBoorus.value,
          text,
        );
        list.add(newTab);
      }
    } else {
      final SearchTab newTab = SearchTab(
        newBooru ?? currentBooru,
        currentSecondaryBoorus.value,
        text,
      );
      list[currentIndex] = newTab;
    }

    searchReactions(text, newBooru ?? currentBooru);

    // reset viewed item
    setViewedItem(-1);
    // run search
    changeTabIndex(currentIndex, ignoreSameIndexCheck: true);

    // write to history
    if (text != '' && settingsHandler.searchHistoryEnabled) {
      settingsHandler.dbHandler.updateSearchHistory(
        text,
        currentBooru.type?.name,
        currentBooru.name,
      );
    }
  }

  void searchReactions(String text, Booru booru) {
    // UOOOOOHHHHH
    if (text.toLowerCase().contains('loli')) {
      FlashElements.showSnackbar(
        duration: const Duration(seconds: 2),
        title: const Text('UOOOOOOOHHH', style: TextStyle(fontSize: 20)),
        // TODO replace with image asset to avoid system-to-system font differences
        overrideLeadingIconWidget: const Text(' 😭 ', style: TextStyle(fontSize: 40)),
        sideColor: Colors.pink,
      );
    }

    // Notify about ratings change on gelbooru and danbooru
    if (text.contains('rating:safe')) {
      final bool isOnBooruWhereRatingsChanged =
          (booru.type?.isGelbooru == true && booru.baseURL!.contains('gelbooru.com')) ||
          (booru.type?.isDanbooru == true && booru.baseURL!.contains('danbooru.donmai.us'));
      if (isOnBooruWhereRatingsChanged) {
        FlashElements.showSnackbar(
          duration: null,
          title: const Text('Ratings changed', style: TextStyle(fontSize: 20)),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  style: const TextStyle(fontSize: 16),
                  children: [
                    TextSpan(text: 'On ${booru.type?.name} '),
                    const TextSpan(
                      text: '[rating:safe]',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(text: ' is now replaced with '),
                    const TextSpan(
                      text: '[rating:general]',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(text: ' and '),
                    const TextSpan(
                      text: '[rating:sensitive]',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                style: const TextStyle(fontSize: 16),
              ),
              const Text(''),
              const Text(
                'App fixed the rating automatically, but consider changing to correct rating in your future queries',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          leadingIcon: Icons.warning_amber,
          leadingIconColor: Colors.yellow,
          sideColor: Colors.red,
        );
      }
    }
  }

  // add secondary boorus and run search
  void mergeAction(List<Booru>? secondaryBoorus) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    final bool canAddSecondary = secondaryBoorus != null && settingsHandler.booruList.length > 1;
    final List<Booru>? secondary = canAddSecondary ? secondaryBoorus : null;

    final SearchTab newTab = SearchTab(currentBooru, secondary, currentTab.tags);
    list[currentIndex] = newTab;

    // run search
    changeTabIndex(currentIndex, ignoreSameIndexCheck: true);
  }

  // current page number
  RxInt pageNum = (-1).obs;
  // is currently loading
  RxBool isLoading = true.obs;
  // did search detect last page (usually when response is an empty array)
  RxBool isLastPage = false.obs;
  // did search encounter an error
  RxString errorString = ''.obs;

  // run search on current tab
  Future<void> runSearch() async {
    final startTabId = currentTab.id;
    // do nothing if reached the end or detected an error
    if (isLastPage.value || errorString.isNotEmpty) {
      return;
    }

    // if not last page - set loading state and increment page
    if (!currentBooruHandler.locked) {
      isLoading.value = true;
      currentBooruHandler.pageNum++;
      pageNum++;
    }

    // fetch new items, but get results from booruHandler and not search itself
    await currentBooruHandler.search(currentTab.tags, null);
    // print('FINISHED SEARCH: ${booruhandler.filteredFetched.length}');

    // lock new loads if handler detected last page
    // (previous filteredFetched length == current length)
    if (currentBooruHandler.locked && !isLastPage.value) {
      isLastPage.value = true;
    }

    if (currentBooruHandler.errorString.isNotEmpty) {
      errorString.value = currentBooruHandler.errorString;
    }

    // request total image count if not already loaded
    if (currentBooruHandler.totalCount.value == 0) {
      unawaited(currentBooruHandler.searchCount(currentTab.tags));
    }

    // check to avoid requests from old tab instances resetting loading state
    if (currentTab.id == startTabId) {
      // delay every new page load
      Future.delayed(const Duration(milliseconds: 200), () {
        isLoading.value = false;
      });
    }
    return;
  }

  // reset search to previous page and run again
  Future<void> retrySearch() async {
    currentBooruHandler.errorString = '';
    errorString.value = '';

    currentBooruHandler.locked = false;
    isLastPage.value = false;

    currentBooruHandler.pageNum--;
    pageNum--;
    await runSearch();
    return;
  }

  void reset() {
    list.clear();
    index.value = 0;
    pageNum.value = -1;
    isLoading.value = true;
    isLastPage.value = false;
    errorString.value = '';
  }

  // stream that will notify it's listeners when it receives a volume button event
  StreamController<String>? _volumeStreamController;
  Stream<String>? get volumeStream => _volumeStreamController?.stream;

  // listener for native volume button events
  StreamSubscription? _rootVolumeListener;

  // hack to allow global restates to force refresh of everything (mainly used when saving settings when exiting settings page)
  VoidCallback? rootRestate;
  void setRootRestate(VoidCallback? rootSetStateCallback) => rootRestate = rootSetStateCallback;

  void dispose() {
    _scrollStream?.close();
    _rootVolumeListener?.cancel();
    _volumeStreamController?.close();
  }

  // Backup/restore tabs stuff

  // special strings used to separate parts of tab backup string
  // tab - separates info parts about tab itself, list - separates tabs list entries
  // example of backup string: "booruName1|||tags1|||tab~~~booruName2|||tags2|||selected~~~booruName3|||tags3|||tab"

  // bool to notify the main build that tab restoratiuon is complete
  RxBool isRestored = false.obs;
  RxBool canBackup = false.obs;

  // keeps track of the last time tabs were backupped
  DateTime lastBackupTime = DateTime.now();

  @Deprecated('Switched to new json format. Remove this after a few versions')
  Future<void> restoreTabsLegacy(String? result) async {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final List<SearchTab> restoredGlobals = [];

    bool foundBrokenItem = false;
    final List<String> brokenItems = [];
    int newIndex = 0;
    if (result != null) {
      final List<List<String>> splitInput = await compute(decodeBackupString, result);
      for (final List<String> booruAndTags in splitInput) {
        // check for parsing errors
        final bool isEntryValid = booruAndTags.length > 1 && booruAndTags[0].isNotEmpty;
        if (isEntryValid) {
          // find booru by name and create searchtab with given tags
          final Booru findBooru = settingsHandler.booruList.firstWhere(
            (booru) => booru.name == booruAndTags[0],
            orElse: () => Booru(null, null, null, null, null),
          );
          if (findBooru.name != null) {
            final SearchTab newTab = SearchTab(findBooru, null, booruAndTags[1]);
            restoredGlobals.add(newTab);
          } else {
            foundBrokenItem = true;
            brokenItems.add('${booruAndTags[0]}: ${booruAndTags[1]}');
            final SearchTab newTab = SearchTab(
              settingsHandler.booruList[0],
              null,
              booruAndTags[1],
            );
            restoredGlobals.add(newTab);
          }

          // check if tab was marked as selected and set current selected index accordingly
          if (booruAndTags.length > 2 && booruAndTags[2] == 'selected') {
            // if split has third item (selected) - set as current tab
            final int index = splitInput.indexWhere((si) => si == booruAndTags);
            newIndex = index;
          }
        } else {
          foundBrokenItem = true;
          brokenItems.add(
            '${booruAndTags[0]}: ${booruAndTags.length > 1 ? booruAndTags[1] : ""}',
          );
        }
      }
    }

    isRestored.value = true;

    // set parsed tabs OR set first default tab if nothing to restore
    if (restoredGlobals.isNotEmpty) {
      FlashElements.showSnackbar(
        title: const Text('Tabs restored', style: TextStyle(fontSize: 20)),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Restored ${restoredGlobals.length} ${Tools.pluralize('tab', restoredGlobals.length)} from previous session!',
            ),
            if (foundBrokenItem)
            // notify user if there was unknown booru or invalid entry in the list
            ...[
              const Text(
                'Some restored tabs had unknown boorus or broken characters.',
              ),
              const Text('They were set to default or ignored.'),
              const Text('List of broken tabs:'),
              Text(brokenItems.join(', ')),
            ],
          ],
        ),
        sideColor: foundBrokenItem ? Colors.yellow : Colors.green,
        leadingIcon: foundBrokenItem ? Icons.warning_amber : Icons.settings_backup_restore,
        duration: Duration(seconds: brokenItems.isEmpty ? 4 : 10),
      );

      list.value = restoredGlobals;
      changeTabIndex(newIndex);
    } else {
      Booru defaultBooru = Booru(null, null, null, null, null);
      // settingsHandler.getBooru();
      // Set the default booru and tags at the start
      if (settingsHandler.booruList.isNotEmpty) {
        defaultBooru = settingsHandler.booruList[0];
      }
      final String defaultText = defaultBooru.defTags?.isNotEmpty == true
          ? defaultBooru.defTags!
          : settingsHandler.defTags;
      if (defaultBooru.type != null) {
        final SearchTab newTab = SearchTab(defaultBooru, null, defaultText);
        list.add(newTab);
        changeTabIndex(0);
      }
      searchTextController.text = defaultText;
    }
    return;
  }

  @Deprecated('Switched to new json format. Remove this after a few versions')
  void mergeTabsLegacy(String tabStr) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final List<List<String>> splitInput = decodeBackupString(tabStr);
    final List<SearchTab> restoredGlobals = [];
    for (final List<String> booruAndTags in splitInput) {
      // check for parsing errors
      final bool isEntryValid = booruAndTags.length > 1 && booruAndTags[0].isNotEmpty;
      if (isEntryValid) {
        // find booru by name and create searchtab with given tags
        final Booru findBooru = settingsHandler.booruList.firstWhere(
          (booru) => booru.name == booruAndTags[0],
          orElse: () => Booru(null, null, null, null, null),
        );
        if (findBooru.name != null) {
          final SearchTab newTab = SearchTab(findBooru, null, booruAndTags[1]);
          // add only if there are not already the same tab in the list and booru is available on this device
          if (list.indexWhere(
                (tab) => tab.selectedBooru.value.name == newTab.selectedBooru.value.name && tab.tags == newTab.tags,
              ) ==
              -1) {
            restoredGlobals.add(newTab);
          }
        }
      }
    }
    list.addAll(restoredGlobals);

    FlashElements.showSnackbar(
      title: const Text('Tabs merged'),
      content: Text(
        'Added ${restoredGlobals.length} new ${Tools.pluralize('tab', restoredGlobals.length)}!',
      ),
      sideColor: Colors.green,
      leadingIcon: Icons.settings_backup_restore,
    );
  }

  @Deprecated('Switched to new json format. Remove this after a few versions')
  void replaceTabsLegacy(String tabStr) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final List<List<String>> splitInput = decodeBackupString(tabStr);
    final List<SearchTab> restoredGlobals = [];
    int newIndex = 0;

    // reset current tab index to avoid exceptions when tab list length is different
    changeTabIndex(0, switchOnly: true);

    for (final List<String> booruAndTags in splitInput) {
      // check for parsing errors
      final bool isEntryValid = booruAndTags.length > 1 && booruAndTags[0].isNotEmpty;
      if (isEntryValid) {
        // find booru by name and create searchtab with given tags
        final Booru findBooru = settingsHandler.booruList.firstWhere(
          (booru) => booru.name == booruAndTags[0],
          orElse: () => Booru(null, null, null, null, null),
        );
        if (findBooru.name != null) {
          final SearchTab newTab = SearchTab(findBooru, null, booruAndTags[1]);
          restoredGlobals.add(newTab);

          if (booruAndTags[2] == 'selected') {
            final int index = splitInput.indexWhere((si) => si == booruAndTags);
            newIndex = index;
          }
        }
      }
    }
    list.value = restoredGlobals;
    setViewedItem(-1);
    changeTabIndex(newIndex);

    FlashElements.showSnackbar(
      title: const Text('Tabs replaced'),
      content: Text(
        'Received ${restoredGlobals.length} ${Tools.pluralize('tab', restoredGlobals.length)}!',
      ),
      sideColor: Colors.green,
      leadingIcon: Icons.settings_backup_restore,
    );
  }

  //

  Future<void> restoreTabsNew(String? result) async {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final List<SearchTab> restoredTabs = [];

    bool foundBrokenItems = false;
    final List<TabBackup> brokenItems = [];
    int newSelectedIndex = 0;
    if (result != null) {
      final List<TabBackup> tabBackups = TabBackup.fromJsonList(result);
      for (final tabBackup in tabBackups) {
        final newTab = parseTabFromBackup(tabBackup);
        if (newTab.selectedBooru.value.name != null) {
          restoredTabs.add(newTab);
        } else {
          foundBrokenItems = true;
          brokenItems.add(tabBackup);
          restoredTabs.add(
            SearchTab(
              settingsHandler.booruList[0],
              null,
              tabBackup.tags,
            ),
          );
        }

        // get index of selected tab
        // newSelectedIndex == 0 check is to ensure that the first tab with selected:true is used
        if (newSelectedIndex == 0 && tabBackup.selected) {
          final int index = tabBackups.indexWhere((tb) => tb == tabBackup);
          newSelectedIndex = index;
        }
      }
    }

    isRestored.value = true;

    if (restoredTabs.isNotEmpty) {
      FlashElements.showSnackbar(
        title: const Text('Tabs restored', style: TextStyle(fontSize: 20)),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Restored ${restoredTabs.length} ${Tools.pluralize('tab', restoredTabs.length)} from previous session!',
            ),
            if (foundBrokenItems) ...[
              // notify user if there was unknown booru or invalid entry in the list
              const Text('Some restored tabs had unknown boorus or broken characters.'),
              const Text('They were set to default or ignored.'),
              const Text('List of broken tabs:'),
              Text(brokenItems.map((t) => '${t.booru}: ${t.tags}').join(', ')),
            ],
          ],
        ),
        sideColor: foundBrokenItems ? Colors.yellow : Colors.green,
        leadingIcon: foundBrokenItems ? Icons.warning_amber : Icons.settings_backup_restore,
        duration: Duration(seconds: brokenItems.isEmpty ? 4 : 10),
      );

      list.value = restoredTabs;
      changeTabIndex(newSelectedIndex);
    } else {
      Booru defaultBooru = Booru(null, null, null, null, null);
      if (settingsHandler.booruList.isNotEmpty) {
        defaultBooru = settingsHandler.booruList[0];
      }
      final String defaultText = defaultBooru.defTags?.isNotEmpty == true
          ? defaultBooru.defTags!
          : settingsHandler.defTags;
      if (defaultBooru.type != null) {
        list.add(
          SearchTab(defaultBooru, null, defaultText),
        );
        changeTabIndex(0);
      }
      searchTextController.text = defaultText;
    }
    return;
  }

  void mergeTabsNew(String tabStr) {
    final List<TabBackup> tabBackups = TabBackup.fromJsonList(tabStr);
    final List<SearchTab> restoredTabs = [];
    for (final tabBackup in tabBackups) {
      final newTab = parseTabFromBackup(tabBackup);

      // add only if there are not already the same tab in the list and booru is available on this device
      if (newTab.selectedBooru.value.name != null &&
          list.any(
            (tab) =>
                tab.selectedBooru.value.name == newTab.selectedBooru.value.name &&
                tab.secondaryBoorus.value?.map((t) => t.name).toList() ==
                    newTab.secondaryBoorus.value?.map((t) => t.name).toList() &&
                tab.tags == newTab.tags,
          )) {
        restoredTabs.add(newTab);
      }
    }

    list.addAll(restoredTabs);

    FlashElements.showSnackbar(
      title: const Text('Tabs merged'),
      content: Text(
        'Added ${restoredTabs.length} new ${Tools.pluralize('tab', restoredTabs.length)}!',
      ),
      sideColor: Colors.green,
      leadingIcon: Icons.settings_backup_restore,
    );
  }

  void replaceTabsNew(String tabStr) {
    final List<TabBackup> tabBackups = TabBackup.fromJsonList(tabStr);
    final List<SearchTab> restoredTabs = [];
    int newSelectedIndex = 0;

    // reset current tab index to avoid exceptions when tab list length is different
    changeTabIndex(0, switchOnly: true);

    for (final tabBackup in tabBackups) {
      final newTab = parseTabFromBackup(tabBackup);
      if (newTab.selectedBooru.value.name != null) {
        restoredTabs.add(newTab);

        if (newSelectedIndex == 0 && tabBackup.selected) {
          final int index = tabBackups.indexWhere((tb) => tb == tabBackup);
          newSelectedIndex = index;
        }
      }
    }
    list.value = restoredTabs;
    setViewedItem(-1);
    changeTabIndex(newSelectedIndex);

    FlashElements.showSnackbar(
      title: const Text('Tabs replaced'),
      content: Text(
        'Received ${restoredTabs.length} ${Tools.pluralize('tab', restoredTabs.length)}!',
      ),
      sideColor: Colors.green,
      leadingIcon: Icons.settings_backup_restore,
    );
  }

  String? generateBackupJson() {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    // if there are only one tab - check that its not with default booru and tags
    // if there are more than 1 tab or check return false - start backup
    final List<SearchTab> tabList = list;
    final int tabIndex = currentIndex;
    final bool onlyDefaultTab =
        tabList.length == 1 &&
        tabList[0].booruHandler.booru.name == settingsHandler.prefBooru &&
        tabList[0].tags == settingsHandler.defTags;
    if (!onlyDefaultTab && settingsHandler.booruList.isNotEmpty) {
      final List<String> dump = tabList.map((tab) {
        final String tags = tab.tags;
        final String booruName = tab.selectedBooru.value.name ?? 'unknown';
        final List<String> secondaryBoorusNames =
            tab.secondaryBoorus.value?.map((b) => b.name ?? 'unknown').toList() ?? [];
        final bool selected = tab == tabList[tabIndex];

        return jsonEncode(
          TabBackup(
            tags: tags,
            booru: booruName,
            secondaryBoorus: secondaryBoorusNames,
            selected: selected,
          ).toJson(),
        );
      }).toList();

      return '[${dump.join(',')}]';
    } else {
      return null;
    }
  }

  SearchTab parseTabFromBackup(TabBackup backup) {
    final booruList = SettingsHandler.instance.booruList;

    final Booru selectedBooru = booruList.firstWhere((b) => b.name == backup.booru);
    final List<Booru> secondaryBoorus = backup.secondaryBoorus
        .map((b) => booruList.firstWhere((booru) => booru.name == b))
        .toList();

    return SearchTab(
      selectedBooru,
      secondaryBoorus.isEmpty ? null : secondaryBoorus,
      backup.tags,
    );
  }

  Future<void> restoreTabs() async {
    final settingsHandler = SettingsHandler.instance;
    try {
      final String? result = await settingsHandler.dbHandler.getTabRestore();
      if (result == null || result.startsWith('[')) {
        await restoreTabsNew(result);
      } else {
        // ignore: deprecated_member_use_from_same_package
        await restoreTabsLegacy(result);
      }
    } catch (e) {
      print('Error restoring tabs: $e');
      // await settingsHandler.dbHandler.clearTabRestore();
      Booru defaultBooru = Booru(null, null, null, null, null);
      if (settingsHandler.booruList.isNotEmpty) {
        defaultBooru = settingsHandler.booruList[0];
      }
      final String defaultText = defaultBooru.defTags?.isNotEmpty == true
          ? defaultBooru.defTags!
          : settingsHandler.defTags;
      if (defaultBooru.type != null) {
        final SearchTab newTab = SearchTab(defaultBooru, null, defaultText);
        list.clear();
        list.add(newTab);
        changeTabIndex(0);
      }
      searchTextController.text = defaultText;
    }

    // allow backup only after restoring to avoid long operations (i.e. database fixes) delaying restore and therefore causing backup to run before tabs were restored
    canBackup.value = true;
  }

  void mergeTabs(String tabStr) {
    if (tabStr.startsWith('[')) {
      mergeTabsNew(tabStr);
    } else {
      // ignore: deprecated_member_use_from_same_package
      mergeTabsLegacy(tabStr);
    }
  }

  void replaceTabs(String tabStr) {
    if (tabStr.startsWith('[')) {
      replaceTabsNew(tabStr);
    } else {
      // ignore: deprecated_member_use_from_same_package
      replaceTabsLegacy(tabStr);
    }
  }

  Future<void> backupTabs() async {
    if (!canBackup.value) {
      return;
    }

    final String? backupString = generateBackupJson();
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    // print('backupString: $backupString');
    if (backupString != null) {
      await settingsHandler.dbHandler.addTabRestore(backupString);
    } else {
      await settingsHandler.dbHandler.clearTabRestore();
    }

    lastBackupTime = DateTime.now();
  }
}

class SearchTab {
  SearchTab(
    Booru selectedBooru,
    List<Booru>? secondaryBoorus,
    this.tags,
  ) {
    this.selectedBooru = selectedBooru.obs;
    this.secondaryBoorus = Rxn<List<Booru>?>(secondaryBoorus);

    final List<Booru> tempBooruList = [];
    tempBooruList.add(selectedBooru);
    if (secondaryBoorus?.isNotEmpty == true) {
      tempBooruList.addAll(secondaryBoorus!);
    }
    final temp = BooruHandlerFactory().getBooruHandler(tempBooruList, null);
    booruHandler = temp.booruHandler;
    booruHandler.pageNum = temp.startingPage;
  }
  // unique id to use for booru controller
  final String id = uuid.v4();
  String tags = '';

  late final Rx<Booru> selectedBooru;
  late final Rxn<List<Booru>?> secondaryBoorus;
  late final BooruHandler booruHandler;

  double scrollPosition = 0;
  RxInt viewedIndex = (-1).obs;
  Rx<BooruItem> viewedItem = BooruItem(
    fileURL: '',
    sampleURL: '',
    thumbnailURL: '',
    tagsList: const [],
    postURL: '',
  ).obs;
  RxList<BooruItem> selected = RxList<BooruItem>.from([]);

  Future<bool?> toggleItemFavourite(
    int itemIndex, {
    bool? forcedValue,
    bool skipSnatching = false,
  }) async {
    final BooruItem item = booruHandler.filteredFetched[itemIndex];
    if (item.isFavourite.value != null) {
      if (item.tagsList.isEmpty || item.mediaType.value.isNeedToLoadItem) {
        // try to update the item before favouriting, do nothing on fail
        if (!booruHandler.hasLoadItemSupport) {
          return item.isFavourite.value;
        }

        final res = await booruHandler.loadItem(
          item: item,
          withCapcthaCheck: true,
        );
        if (res.failed ||
            res.item == null ||
            res.item!.tagsList.isEmpty ||
            res.item!.mediaType.value.isNeedToLoadItem) {
          return item.isFavourite.value;
        }
      }

      if (forcedValue == null) {
        await ServiceHandler.vibrate();
      }

      final bool newValue = forcedValue ?? (item.isFavourite.value == true ? false : true);
      item.isFavourite.value = newValue;

      final SettingsHandler settingsHandler = SettingsHandler.instance;
      if (!skipSnatching && settingsHandler.snatchOnFavourite && newValue && item.isSnatched.value != true) {
        SnatchHandler.instance.queue(
          [item],
          booruHandler.booru,
          settingsHandler.snatchCooldown,
          false,
        );
      }
      await settingsHandler.dbHandler.updateBooruItem(
        item,
        BooruUpdateMode.local,
      );

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        // update filtered items list in case user has favourites filter enabled
        await Future.delayed(const Duration(milliseconds: 200));
        booruHandler.filterFetched();
      });
    }
    return item.isFavourite.value;
  }

  Future<void> updateFavForMultipleItems(
    List<BooruItem> items, {
    required bool newValue,
    bool skipSnatching = false,
  }) async {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    if (!skipSnatching && settingsHandler.snatchOnFavourite && newValue) {
      SnatchHandler.instance.queue(
        items.where((e) => e.isSnatched.value != true).toList(),
        booruHandler.booru,
        settingsHandler.snatchCooldown,
        false,
      );
    }

    for (final BooruItem item in items) {
      item.isFavourite.value = newValue;
    }

    await settingsHandler.dbHandler.updateMultipleBooruItems(
      items,
      BooruUpdateMode.local,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // update filtered items list in case user has favourites filter enabled
      await Future.delayed(const Duration(milliseconds: 200));
      booruHandler.filterFetched();
    });
  }

  @override
  String toString() {
    return 'tags: $tags selectedBooru: $selectedBooru booruHandler: $booruHandler';
  }
}

class TabBackup {
  TabBackup({
    required this.tags,
    required this.booru,
    this.secondaryBoorus = const [],
    this.selected = false,
  });
  final String tags;
  final String booru;
  final List<String> secondaryBoorus;
  final bool selected;

  Map<String, dynamic> toJson() {
    return {
      't': tags,
      'b': booru,
      if (secondaryBoorus.isNotEmpty) 'sb': secondaryBoorus,
      if (selected) 's': selected, // only true matters, don't include on false
    };
  }

  static TabBackup? fromJson(Map<String, dynamic> json) {
    try {
      return TabBackup(
        tags: json['t'] as String,
        booru: json['b'] as String,
        secondaryBoorus: (json['sb'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
        selected: (json['s'] as bool?) ?? false,
      );
    } catch (_) {
      try {
        return TabBackup(
          tags: json['t'] as String,
          booru: json['b'] as String,
        );
      } catch (e, s) {
        Logger.Inst().log(
          'Invalid tab backup',
          'TabBackup',
          'fromJson',
          LogTypes.exception,
          s: s,
        );
        throw Exception('Invalid tab backup: $json');
      }
    }
  }

  static List<TabBackup> fromJsonList(String json) {
    final jsonList = jsonDecode(json);

    if (jsonList is! List) {
      return [];
    }

    return jsonList.map((e) => fromJson(e as Map<String, dynamic>)).where((e) => e != null).cast<TabBackup>().toList();
  }

  TabBackup copyWith({
    String? tags,
    String? booru,
    List<String>? secondaryBoorus,
    bool? selected,
  }) {
    return TabBackup(
      tags: tags ?? this.tags,
      booru: booru ?? this.booru,
      secondaryBoorus: secondaryBoorus ?? this.secondaryBoorus,
      selected: selected ?? this.selected,
    );
  }
}

enum HasTabWithTagResult {
  onlyTag,
  onlyTagDifferentBooru,
  containsTag,
  noTag;

  bool get isOnlyTag => this == HasTabWithTagResult.onlyTag;
  bool get isOnlyTagDifferentBooru => this == HasTabWithTagResult.onlyTagDifferentBooru;
  bool get isContainsTag => this == HasTabWithTagResult.containsTag;
  bool get isNoTag => this == HasTabWithTagResult.noTag;
  bool get hasTag =>
      this == HasTabWithTagResult.onlyTag ||
      this == HasTabWithTagResult.onlyTagDifferentBooru ||
      this == HasTabWithTagResult.containsTag;
}

enum TabAddMode {
  prev,
  next,
  end;

  String get locName {
    switch (this) {
      case prev:
        return 'Prev tab';
      case next:
        return 'Next tab';
      case end:
        return 'List end';
    }
  }
}
