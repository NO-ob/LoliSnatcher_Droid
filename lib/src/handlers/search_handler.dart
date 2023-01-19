import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:uuid/uuid.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/booru_handler_factory.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';



var uuid = const Uuid();

var volumeKeyChannel = Platform.isAndroid ? const EventChannel('com.noaisu.loliSnatcher/volume') : null;

class SearchHandler extends GetxController {
  // alternative way to get instance of the controller
  // i.e. "SearchHandler.to.list" instead of "Get.find<SearchHandler>().list"
  static SearchHandler get instance => Get.find<SearchHandler>();

  // search globals list
  RxList<SearchTab> list = RxList<SearchTab>([]);
  // current tab index
  Rx<int> index = 0.obs;

  // add new tab by the given search string
  void addTabByString(String searchText, {bool switchToNew = false, Booru? customBooru}) {
    // Add after the current tab
    // list.insert(currentIndex + 1, SearchTab(currentBooru.obs, null, searchText));

    Rx<Booru> booru = (customBooru ?? currentBooru).obs;

    // Add new tab to the end
    SearchTab newTab = SearchTab(booru, null, searchText);
    list.add(newTab);

    // record search query to db
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    if(searchText != "" && settingsHandler.searchHistoryEnabled) {
      settingsHandler.dbHandler.updateSearchHistory(
        searchText,
        booru.value.type,
        booru.value.name
      );
    }

    // set to last tab if requested
    if(switchToNew) {
      changeTabIndex(total - 1);
    }
  }

  // remove tab (or current if not provided) index and set new index and search text values
  void removeTabAt({int tabIndex = -1}) {
    if(tabIndex == -1) {
      tabIndex = currentIndex;
    }

    // reset viewed item in any case
    setViewedItem(-1);

    if(total > 1) {
      if (tabIndex == currentIndex) { // if current tab is the one being removed
        if (currentIndex == total - 1) { // if current tab is the last one, switch to previous one
          changeTabIndex(currentIndex - 1);
          list.removeAt(currentIndex + 1);
        } else { // if current tab is not the last one, switch to next one
          changeTabIndex(currentIndex + 1, switchOnly: true);
          list.removeAt(currentIndex - 1);
          changeTabIndex(currentIndex - 1);
        }
      } else { // if current tab is not the one being removed
        if(tabIndex < currentIndex) { // if tab to be removed is before current tab
          changeTabIndex(currentIndex - 1, switchOnly: true);
        }
        list.removeAt(tabIndex);
        changeTabIndex(currentIndex);
      }
    } else { // if there is only one tab, reset to default tags
      FlashElements.showSnackbar(
        title: const Text(
          "Removed Last Tab",
          style: TextStyle(fontSize: 20)
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Resetting search to default tags!'),
          ],
        ),
        leadingIcon: Icons.warning_amber,
        leadingIconColor: Colors.yellow,
        sideColor: Colors.yellow,
      );

      final SettingsHandler settingsHandler = SettingsHandler.instance;
      searchTextController.text = settingsHandler.defTags;

      SearchTab newTab = SearchTab(currentBooru.obs, null, settingsHandler.defTags);
      list[0] = newTab;
      changeTabIndex(0);
    }
  }

  void moveTab(int fromIndex, int toIndex) {
    // value checks
    if(fromIndex == toIndex) {
      return;
    }
    if(fromIndex < 0 || fromIndex >= total || toIndex < 0 || toIndex >= total) {
      return;
    }

    // move tab
    if (fromIndex < toIndex) {
      toIndex -= 1;
    }
    final SearchTab tab = list[fromIndex];
    list.removeAt(fromIndex);
    list.insert(toIndex, tab);

    // check how index changed and jump to correct tab
    if(fromIndex == currentIndex) {
      // if the current tab is moved, change the current tab index
      changeTabIndex(toIndex);
    } else if(toIndex == currentIndex) {
      // if moved into the place of the current tab, bump index of current tab
      changeTabIndex(toIndex + 1);
    } else if(fromIndex < currentIndex && toIndex > currentIndex) {
      // if tab was before current tab and is moved after current tab, current tab is -1
      changeTabIndex(currentIndex - 1);
    } else if(fromIndex > currentIndex && toIndex < currentIndex) {
      // if tab was after current tab and is moved before current tab, current tab is +1
      changeTabIndex(currentIndex + 1);
    } 
  }

  SearchTab? getTabByIndex(int index) {
    if(index < 0 || index >= total) {
      return null;
    }
    return list[index];
  }

  int getTabIndex(SearchTab tab) {
    return list.indexOf(tab);
  }

  // grid scroll controller
  AutoScrollController gridScrollController = AutoScrollController(); // will be overwritten on the first render because there is hasClients check
  RxDouble scrollOffset = (0.0).obs;

  void updateScrollPosition () {
    scrollOffset.value = gridScrollController.offset;
    currentTab.scrollPosition = gridScrollController.offset;
  }

  // search box text controller
  final TextEditingController searchTextController = TextEditingController();
  void addTagToSearch(String tag) {
    if(tag.isNotEmpty) {
      if(currentBooru.type == 'Hydrus') {
        searchTextController.text += ', $tag';
      } else {
        searchTextController.text += ' $tag';
      }
    }
  }
  void removeTagFromSearch(String tag) {
    if(tag.isNotEmpty) {
      searchTextController.text = searchTextController.text.replaceAll('-$tag', '').replaceAll(tag, '');
    }
  }

  // search box focus node
  FocusNode searchBoxFocus = FocusNode();

  late GlobalKey<InnerDrawerState> mainDrawerKey;

  void openAndFocusSearch() async {
    mainDrawerKey.currentState?.open();
    await Future.delayed(const Duration(milliseconds: 300));
    searchBoxFocus.requestFocus();
    searchTextController.selection = TextSelection.fromPosition(TextPosition(offset: searchTextController.text.length));
  }

  // switch to tab #index
  void changeTabIndex(int i, {bool switchOnly = false, bool ignoreSameIndexCheck = false}) {
    // change only if new index != current index
    final int oldIndex = currentIndex;
    int newIndex = i;

    // protection from early execution on start
    if(list.isEmpty) {
      return;
    }

    // protection from out of bounds
    if(newIndex > (total - 1)) {
      newIndex = total - 1;
    } else if(newIndex < 0) {
      newIndex = 0;
    }

    // change index only when it's different
    if(!ignoreSameIndexCheck && newIndex != currentIndex) {
      index.value = newIndex;
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
    bool isNewSearch = currentFetched.isEmpty;
    // print('isNEW: $isNewSearch ${currentIndex}');
    // trigger search if there are items inside booruHandler
    if(isNewSearch) {
      runSearch();
    }

    // set current viewed index and item of the tab
    setViewedItem(currentTab.viewedIndex.value);

    // print('changed index from $oldIndex to $newIndex');
  }

  // recreate current tab with custom starting page number
  void changeCurrentTabPageNumber(int newPageNum) {
    SearchTab newTab = SearchTab(
      currentBooru.obs,
      currentTab.secondaryBoorus,
      currentTab.tags,
    );
    newTab.booruHandler.pageNum = newPageNum;
    pageNum.value = newPageNum;
    list[currentIndex] = newTab;

    changeTabIndex(currentIndex, ignoreSameIndexCheck: true);
  }

  // search on the current tab until we reach given page number or there is an error
  void searchCurrentTabUntilPageNumber(int newPageNum, {int? customDelay}) async {
    if(newPageNum > pageNum.value) {
      int tempNum = pageNum.value;
      while (tempNum < newPageNum) {
        if(!isLoading.value) {
          await runSearch();
          tempNum ++;
          // print('search num $tempNum ${pageNum.value}');

          if(errorString.value.isNotEmpty) {
            break;
          }

          await Future.delayed(Duration(milliseconds: customDelay ?? 200));
        }
      }
    }
  }


  HasTabWithTagResult hasTabWithTag(String tag) {
    for (SearchTab tab in list) {
      if(tab.tags.toLowerCase().trim() == tag.toLowerCase().trim()) {
        return HasTabWithTagResult.onlyTag;
      } else if (tab.tags.toLowerCase().trim().split(' ').contains(tag.toLowerCase().trim())) {
        return HasTabWithTagResult.containsTag;
      }
    }
    return HasTabWithTagResult.noTag;
  }

  List<SearchTab> getTabsWithTag(String tag) {
    List<SearchTab> tabs = [];
    for (SearchTab tab in list) {
      if(tab.tags.toLowerCase().trim().split(' ').contains(tag.toLowerCase().trim())) {
        tabs.add(tab);
      }
    }
    return tabs;
  }


  int get currentIndex => index.value;
  int get total => list.length;
  SearchTab get currentTab => list[currentIndex];
  BooruHandler get currentBooruHandler => currentTab.booruHandler;
  Booru get currentBooru => currentTab.selectedBooru.value;
  List<BooruItem> get currentFetched => currentBooruHandler.filteredFetched;


  RxInt viewedIndex = (-1).obs;
  Rx<BooruItem> viewedItem = BooruItem(
    fileURL: "",
    sampleURL: "",
    thumbnailURL: "",
    tagsList: [],
    postURL: ""
  ).obs;

  BooruItem setViewedItem(int i) {
    int newIndex = i;
    int oldIndex = viewedIndex.value;
    BooruItem newItem = newIndex != -1
      ? currentFetched[newIndex]
      : BooruItem(
        fileURL: "",
        sampleURL: "",
        thumbnailURL: "",
        tagsList: [],
        postURL: ""
      );
    viewedItem.value = newItem;
    currentTab.viewedItem.value = newItem;

    viewedIndex.value = newIndex;
    currentTab.viewedIndex.value = newIndex;

    // print('old $oldIndex | new $newIndex index \n new item ${newItem.toString()}');

    return newItem;
  }



  Future<bool?> toggleItemFavourite(int itemIndex) async {
    final BooruItem item = currentFetched[itemIndex];
    if(item.isFavourite.value != null) {
      ServiceHandler.vibrate();

      item.isFavourite.value = item.isFavourite.value == true ? false : true;
      await SettingsHandler.instance.dbHandler.updateBooruItem(item, "local");
    }
    return item.isFavourite.value;
  }


  // runs search on current tab
  void searchAction(String text, Booru? newBooru) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    // Remove extra spaces
    text = text.trim();

    // clear image emory cache
    Tools.forceClearMemoryCache(withLive: true);

    // set new tab data
    if(list.isEmpty) {
      if(settingsHandler.booruList.isNotEmpty) {
        SearchTab newTab = SearchTab(
          settingsHandler.booruList[0].obs,
          currentTab.secondaryBoorus,
          text
        );
        list.add(newTab);
      }
    } else {
      SearchTab newTab = SearchTab(
        (newBooru ?? currentBooru).obs,
        currentTab.secondaryBoorus,
        text
      );
      list[currentIndex] = newTab;
    }

    searchReactions(text, newBooru ?? currentBooru);

    // reset viewed item
    setViewedItem(-1);
    // run search
    changeTabIndex(currentIndex, ignoreSameIndexCheck: true);

    // write to history
    if(text != "" && settingsHandler.searchHistoryEnabled) {
      settingsHandler.dbHandler.updateSearchHistory(
        text,
        currentBooru.type!,
        currentBooru.name!
      );
    }
  }

  void searchReactions(String text, Booru booru) {
    // UOOOOOHHHHH
    if (text.toLowerCase().contains("loli")) {
      FlashElements.showSnackbar(
        duration: const Duration(seconds: 2),
        title: const Text(
          "UOOOOOOOHHH",
          style: TextStyle(fontSize: 20)
        ),
        // TODO replace with image asset to avoid system-to-system font differences
        overrideLeadingIconWidget: const Text(' 😭 ', style: TextStyle(fontSize: 40)),
        sideColor: Colors.pink,
      );
    }

    // Notify about ratings change on gelbooru and danbooru
    if(text.contains('rating:safe')) {
      bool isOnBooruWhereRatingsChanged = (booru.type == 'Gelbooru' && booru.baseURL!.contains('gelbooru.com')) || booru.type == 'Danbooru';
      if(isOnBooruWhereRatingsChanged) {
        FlashElements.showSnackbar(
          duration: null,
          title: const Text(
            "Ratings changed",
            style: TextStyle(fontSize: 20)
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  style: const TextStyle(fontSize: 16),
                  children: [
                    TextSpan(text: 'On ${booru.type} '),
                    const TextSpan(text: '[rating:safe]', style: TextStyle(fontWeight: FontWeight.bold)),
                    const TextSpan(text: ' is now replaced with '),
                    const TextSpan(text: '[rating:general]', style: TextStyle(fontWeight: FontWeight.bold)),
                    const TextSpan(text: ' and '),
                    const TextSpan(text: '[rating:sensitive]', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                style: const TextStyle(fontSize: 16),
              ),
              const Text(''),
              const Text(
                "App fixed the rating automatically, but consider changing to correct rating in your future queries",
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

    bool canAddSecondary = secondaryBoorus != null && settingsHandler.booruList.length > 1;
    RxList<Booru>? secondary = canAddSecondary ? secondaryBoorus.obs : null;

    SearchTab newTab = SearchTab(currentBooru.obs, secondary, currentTab.tags);
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
  RxString errorString = "".obs;
  

  // run search on current tab
  Future<void> runSearch() async {
    // do nothing if reached the end or detected an error
    if(isLastPage.value) return;
    if(errorString.isNotEmpty) return;

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
    if(currentBooruHandler.totalCount.value == 0) {
      currentBooruHandler.searchCount(currentTab.tags);
    }
    
    // delay every new page load
    Future.delayed(const Duration(milliseconds: 200), () {
      isLoading.value = false;
    });
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
  StreamController<String>? _volumeStream;
  Stream<String>? get volumeStream => _volumeStream?.stream;

  // listener for native volume button events
  StreamSubscription? _rootVolumeListener;

  // hack to allow global restates to force refresh of everything (mainly used when saving settings when exiting settings page)
  Function rootRestate;
  
  @override
  void onInit() {
    super.onInit();
    _volumeStream = Platform.isAndroid ? StreamController.broadcast() : null;
    _rootVolumeListener = volumeKeyChannel?.receiveBroadcastStream().listen((event) {
      _volumeStream?.sink.add(event);
    });
  }

  @override
  void onClose() {
    _rootVolumeListener?.cancel();
    _volumeStream?.close();
    super.onClose();
  }


  SearchHandler(this.rootRestate);



  // Backup/restore tabs stuff

  // special strings used to separate parts of tab backup string
  // tab - separates info parts about tab itself, list - separates tabs list entries

  // bool to notify the main build that tab restoratiuon is complete
  RxBool isRestored = false.obs;
  RxBool canBackup = true.obs;

  // keeps track of the last time tabs were backupped
  DateTime lastBackupTime = DateTime.now();

  // TODO rework to use json structure instead
  // special strings used to separate parts of tab backup string
  final String tabDivider = '|||', listDivider = '~~~';
  // example of backup string: "booruName1|||tags1|||tab~~~booruName2|||tags2|||selected~~~booruName3|||tags3|||tab"

  // Restores tabs from a string saved in DB
  List<List<String>> decodeBackupString(String input) {
    List<List<String>> result = [];
    List<String> splitInput = input.split(listDivider);
    for (String str in splitInput) {
      List<String> booruAndTags = str.split(tabDivider);
      result.add(booruAndTags);
    }
    return result;
  }
  Future<void> restoreTabs() async {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    List<String> result = await settingsHandler.dbHandler.getTabRestore();
    List<SearchTab> restoredGlobals = [];

    bool foundBrokenItem = false;
    List<String> brokenItems = [];
    int newIndex = 0;
    if(result.length == 2) {
      // split list into tabs
      List<List<String>> splitInput = decodeBackupString(result[1]);
      // print('restoreTabs: ${splitInput}');
      for (List<String> booruAndTags in splitInput) {
        // check for parsing errors
        bool isEntryValid = booruAndTags.length > 1 && booruAndTags[0].isNotEmpty;
        if(isEntryValid) {
          // find booru by name and create searchtab with given tags
          Booru findBooru = settingsHandler.booruList.firstWhere((booru) => booru.name == booruAndTags[0], orElse: () => Booru(null, null, null, null, null));
          if(findBooru.name != null) {
            SearchTab newTab = SearchTab(findBooru.obs, null, booruAndTags[1]);
            restoredGlobals.add(newTab);
          } else {
            foundBrokenItem = true;
            brokenItems.add('${booruAndTags[0]}: ${booruAndTags[1]}');
            SearchTab newTab = SearchTab(settingsHandler.booruList[0].obs, null, booruAndTags[1]);
            restoredGlobals.add(newTab);
          }

          // check if tab was marked as selected and set current selected index accordingly 
          if(booruAndTags.length > 2 && booruAndTags[2] == 'selected') { // if split has third item (selected) - set as current tab
            int index = splitInput.indexWhere((si) => si == booruAndTags);
            newIndex = index;
          }
        } else {
          foundBrokenItem = true;
          brokenItems.add('${booruAndTags[0]}: ${booruAndTags.length > 1 ? booruAndTags[1] : ""}');
        }
      }
    }

    isRestored.value = true;

    // set parsed tabs OR set first default tab if nothing to restore
    if(restoredGlobals.isNotEmpty) {
      FlashElements.showSnackbar(
        title: const Text(
          "Tabs restored",
          style: TextStyle(fontSize: 20)
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Restored ${restoredGlobals.length} ${Tools.pluralize('tab', restoredGlobals.length)} from previous session!'),

            if(foundBrokenItem)
              // notify user if there was unknown booru or invalid entry in the list
              ...[
                const Text('Some restored tabs had unknown boorus or broken characters.'),
                const Text('They were set to default or ignored.'),
                const Text('List of broken tabs:'),
                Text(brokenItems.join(', ')),
              ],
          ],
        ),
        sideColor: foundBrokenItem ? Colors.yellow : Colors.green,
        leadingIcon: foundBrokenItem ? Icons.warning_amber: Icons.settings_backup_restore,
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
      if(defaultBooru.type != null) {
        SearchTab newTab = SearchTab(defaultBooru.obs, null, settingsHandler.defTags);
        list.add(newTab);
        changeTabIndex(0);
      }
      searchTextController.text = settingsHandler.defTags;
    }
    // rootRestate();
    return;
  }

  void mergeTabs(String tabStr) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    List<List<String>> splitInput = decodeBackupString(tabStr);
    List<SearchTab> restoredGlobals = [];
    for (List<String> booruAndTags in splitInput) {
      // check for parsing errors
      bool isEntryValid = booruAndTags.length > 1 && booruAndTags[0].isNotEmpty;
      if(isEntryValid) {
        // find booru by name and create searchtab with given tags
        Booru findBooru = settingsHandler.booruList.firstWhere((booru) => booru.name == booruAndTags[0], orElse: () => Booru(null, null, null, null, null));
        if(findBooru.name != null) {
          SearchTab newTab = SearchTab(findBooru.obs, null, booruAndTags[1]);
          // add only if there are not already the same tab in the list and booru is available on this device
          if(list.indexWhere((tab) => tab.selectedBooru.value.name == newTab.selectedBooru.value.name && tab.tags == newTab.tags) == -1) {
            restoredGlobals.add(newTab);
          }
        }
      }
    }
    list.addAll(restoredGlobals);
    // rootRestate();

    FlashElements.showSnackbar(
      title: const Text('Tabs merged'),
      content: Text('Added ${restoredGlobals.length} new ${Tools.pluralize('tab', restoredGlobals.length)}!'),
      sideColor: Colors.green,
      leadingIcon: Icons.settings_backup_restore
    );
  }
  void replaceTabs(String tabStr) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    List<List<String>> splitInput = decodeBackupString(tabStr);
    List<SearchTab> restoredGlobals = [];
    int newIndex = 0;

    // reset current tab index to avoid exceptions when tab list length is different
    changeTabIndex(0, switchOnly: true);

    for (List<String> booruAndTags in splitInput) {
      // check for parsing errors
      bool isEntryValid = booruAndTags.length > 1 && booruAndTags[0].isNotEmpty;
      if(isEntryValid) {
        // find booru by name and create searchtab with given tags
        Booru findBooru = settingsHandler.booruList.firstWhere((booru) => booru.name == booruAndTags[0], orElse: () => Booru(null, null, null, null, null));
        if(findBooru.name != null) {
          SearchTab newTab = SearchTab(findBooru.obs, null, booruAndTags[1]);
          restoredGlobals.add(newTab);

          if(booruAndTags[2] == 'selected') {
            int index = splitInput.indexWhere((si) => si == booruAndTags);
            newIndex = index;
          }
        }
      }
    }
    list.value = restoredGlobals;
    setViewedItem(-1);
    changeTabIndex(newIndex);
    // rootRestate();

    FlashElements.showSnackbar(
      title: const Text('Tabs replaced'),
      content: Text('Received ${restoredGlobals.length} ${Tools.pluralize('tab', restoredGlobals.length)}!'),
      sideColor: Colors.green,
      leadingIcon: Icons.settings_backup_restore
    );
  }

  // Saves current tabs list to DB
  String? getBackupString() {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    // if there are only one tab - check that its not with default booru and tags
    // if there are more than 1 tab or check return false - start backup
    List<SearchTab> tabList = list;
    int tabIndex = currentIndex;
    bool onlyDefaultTab = tabList.length == 1 && tabList[0].booruHandler.booru.name == settingsHandler.prefBooru && tabList[0].tags == settingsHandler.defTags;
    if(!onlyDefaultTab && settingsHandler.booruList.isNotEmpty) {
      final List<String> dump = tabList.map((tab) {
        String booruName = tab.selectedBooru.value.name ?? 'unknown';
        String tabTags = tab.tags;
        String selected = tab == tabList[tabIndex] ? 'selected' : 'tab'; // 'tab' to always have controlled end of the string, to avoid broken strings (see kaguya anime full name as example)
        return '$booruName$tabDivider$tabTags$tabDivider$selected'; // booruName|searchTags|selected (last only if its the current tab)
      }).toList();
      // TODO small indicator somewhere when tabs are saved?
      final String restoreString = dump.join(listDivider);
      return restoreString;
    } else {
      return null;
    }
  }
  Future<void> backupTabs() async {
    if(!canBackup.value) {
      return;
    }

    String? backupString = getBackupString();
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    // print('backupString: $backupString');
    if(backupString != null) {
      await settingsHandler.dbHandler.addTabRestore(backupString);
    } else {
      await settingsHandler.dbHandler.clearTabRestore();
    }

    lastBackupTime = DateTime.now();
  }

}


class SearchTab {
  // unique id to use for booru controller
  String id = uuid.v4();
  String tags = "";

  Rx<Booru> selectedBooru;
  RxList<Booru>? secondaryBoorus;
  late BooruHandler booruHandler;

  double scrollPosition = 0.0;
  RxInt viewedIndex = (-1).obs;
  Rx<BooruItem> viewedItem = BooruItem(
    fileURL: "",
    sampleURL: "",
    thumbnailURL: "",
    tagsList: [],
    postURL: ""
  ).obs;
  RxList<int> selected = RxList<int>.from([]);

  SearchTab(this.selectedBooru, this.secondaryBoorus, this.tags) {
    List<Booru> tempBooruList = [];
    tempBooruList.add(selectedBooru.value);
    if(secondaryBoorus != null) {
       tempBooruList.addAll(secondaryBoorus!);
    }
    final List temp = BooruHandlerFactory().getBooruHandler(tempBooruList, null);
    final BooruHandler handlerTemp = temp[0] as BooruHandler;
    final int pageNumTemp = temp[1] as int;

    booruHandler = handlerTemp;
    booruHandler.pageNum = pageNumTemp;
  }

  @override
  String toString() {
    return ("tags: $tags selectedBooru: ${selectedBooru.toString()} booruHandler: $booruHandler");
  }

  List<BooruItem> getSelected(){
    List<BooruItem>? selectedItems = [];
    for (int i=0; i < selected.length; i++){
      selectedItems.add(booruHandler.filteredFetched.elementAt(selected[i]));
    }
    return selectedItems;
  }
}

enum HasTabWithTagResult {
  onlyTag,
  containsTag,
  noTag;

  bool get isOnlyTag => this == HasTabWithTagResult.onlyTag;
  bool get isContainsTag => this == HasTabWithTagResult.containsTag;
  bool get isNoTag => this == HasTabWithTagResult.noTag;
  bool get hasTag => this == HasTabWithTagResult.containsTag || this == HasTabWithTagResult.onlyTag;
}
