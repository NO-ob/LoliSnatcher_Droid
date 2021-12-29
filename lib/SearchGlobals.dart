import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/Tools.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/libBooru/BooruHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruHandlerFactory.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';



var uuid = Uuid();

var volumeKeyChannel = Platform.isAndroid ? EventChannel('com.noaisu.loliSnatcher/volume') : null;

class SearchHandler extends GetxController {
  // alternative way to get instance of the controller
  // i.e. "SearchHandler.to.list" instead of "Get.find<SearchHandler>().list"
  static SearchHandler get to => Get.find<SearchHandler>();

  // search globals list
  RxList<SearchGlobal> list = RxList<SearchGlobal>([]);
  // current tab index
  Rx<int> index = 0.obs;

  // add new tab by the given search string
  void addTabByString(String searchText, {bool switchToNew = false, Booru? customBooru}) {
    // Add after the current tab
    // list.insert(currentIndex + 1, SearchGlobal(currentTab.selectedBooru, null, searchText));

    Rx<Booru> booru = customBooru != null ? customBooru.obs : currentTab.selectedBooru;

    // Add new tab to the end
    SearchGlobal newTab = SearchGlobal(booru, null, searchText);
    list.add(newTab);

    // record search query to db
    final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
    if(searchText != "" && settingsHandler.searchHistoryEnabled) {
      settingsHandler.dbHandler.updateSearchHistory(
        searchText,
        booru.value.type,
        booru.value.name
      );
    }

    // set to last tab if requested
    if(switchToNew) {
      changeTabIndex(list.length - 1);
    }
  }

  // remove tab (or current if not provided) index and set new index and search text values
  void removeTabAt({int tabIndex = -1}) {
    if(tabIndex == -1) {
      tabIndex = currentIndex;
    }

    // reset viewed item in any case
    setViewedItem(-1);

    if(list.length > 1) {
      if (tabIndex == currentIndex) {
        // if current tab is the one being removed
        if (currentIndex == list.length - 1) {
          // if current tab is the last one, switch to previous one
          changeTabIndex(currentIndex - 1);
          list.removeAt(currentIndex + 1);
        } else {
          // if current tab is not the last one, switch to next one
          list.removeAt(currentIndex);
          changeTabIndex(currentIndex);
        }
      } else {
        // if current tab is not the one being removed
        list.removeAt(tabIndex);
      }
    } else {
      // if there is only one tab, reset to default tags
      FlashElements.showSnackbar(
        title: Text(
          "Removed Last Tab",
          style: TextStyle(fontSize: 20)
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Resetting search to default tags!'),
          ],
        ),
        leadingIcon: Icons.warning_amber,
        leadingIconColor: Colors.yellow,
        sideColor: Colors.yellow,
      );

      final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
      searchTextController.text = settingsHandler.defTags;

      SearchGlobal newTab = SearchGlobal(currentTab.selectedBooru, null, settingsHandler.defTags);
      list[0] = newTab;
      changeTabIndex(0);
    }
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
      if(currentTab.selectedBooru.value.type == 'Hydrus') {
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

  // switch to tab #index
  void changeTabIndex(int i) {
    // change only if new index != current index
    if(i != currentIndex) {
      index.value = i;
      Tools.forceClearMemoryCache(withLive: true);
    }
    // set search text anyway
    searchTextController.text = currentTab.tags;

    // set last page state
    isLastPage.value = currentBooruHandler.locked.value;
    // trigger first load OR get old filteredFetched list
    bool isNewSearch = currentFetched.length == 0;
    // print('isNEW: $isNewSearch ${currentIndex}');
    // trigger search if there are items inside booruHandler
    if(isNewSearch) {
      runSearch();
    } else {
      isLoading.value = false;
    }

    // set current viewed index and item of the tab
    setViewedItem(currentTab.viewedIndex.value);
  }

  // recreate current tab with custom starting page number
  void changeCurrentTabPageNumber(int newPageNum) {
    SearchGlobal newTab = SearchGlobal(currentTab.selectedBooru, currentTab.secondaryBoorus, currentTab.tags);
    newTab.booruHandler.pageNum.value = newPageNum;
    list[currentIndex] = newTab;
    changeTabIndex(currentIndex);
  }

  // search on the current tab until we reach given page number or there is an error
  void searchCurrentTabUntilPageNumber(int newPageNum, {int? customDelay}) async {
    if(newPageNum > currentBooruHandler.pageNum.value) {
      int tempNum = currentBooruHandler.pageNum.value;
      while (tempNum < newPageNum) {
        if(!isLoading.value) {
          await runSearch();
          tempNum ++;
          // print('search num $tempNum ${currentBooruHandler.pageNum.value}');

          if(currentBooruHandler.errorString.value.isNotEmpty) {
            break;
          }

          await Future.delayed(Duration(milliseconds: customDelay ?? 200));
        }
      }
    }
  }

  int get currentIndex => index.value;
  SearchGlobal get currentTab => list[currentIndex];
  RxInt viewedIndex = (-1).obs;
  Rx<BooruItem> viewedItem = BooruItem(
    fileURL: "",
    sampleURL: "",
    thumbnailURL: "",
    tagsList: [],
    postURL: ""
  ).obs;
  BooruHandler get currentBooruHandler => currentTab.booruHandler;
  List<BooruItem> get currentFetched => currentBooruHandler.filteredFetched;

  BooruItem setViewedItem(int i) {
    int newIndex = i;
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

    // print('new index $newIndex \n new item ${newItem.toString()}');

    return newItem;
  }

  void searchAction(String text, Booru? newBooru) {
    final SettingsHandler settingsHandler = Get.find<SettingsHandler>();

    // Remove extra spaces
    text = text.trim();

    // clear image emory cache
    Tools.forceClearMemoryCache(withLive: true);

    // UOOOOOHHHHH
    if (text.toLowerCase().contains("loli")) {
      FlashElements.showSnackbar(
        duration: Duration(seconds: 2),
        title: Text(
          "UOOOOOOOHHH",
          style: TextStyle(fontSize: 20)
        ),
        // TODO replace with image asset to avoid system-to-system font differences
        overrideLeadingIconWidget: Text(' 😭 ', style: TextStyle(fontSize: 40)),
        sideColor: Colors.pink,
      );
    }

    // set new tab data
    if(list.isEmpty) {
      if(settingsHandler.booruList.isNotEmpty) {
        SearchGlobal newTab = SearchGlobal(
          settingsHandler.booruList[0].obs,
          settingsHandler.mergeEnabled ? currentTab.secondaryBoorus : null,
          text
        );
        list.add(newTab);
      }
    } else {
      SearchGlobal newTab = SearchGlobal(
        newBooru != null ? newBooru.obs : currentTab.selectedBooru,
        settingsHandler.mergeEnabled ? currentTab.secondaryBoorus : null,
        text
      );
      list[currentIndex] = newTab;
    }

    // reset viewed item
    setViewedItem(-1);
    // run search
    changeTabIndex(currentIndex);

    // write to history
    if(text != "" && settingsHandler.searchHistoryEnabled) {
      settingsHandler.dbHandler.updateSearchHistory(
        text,
        currentTab.selectedBooru.value.type!,
        currentTab.selectedBooru.value.name!
      );
    }
  }

  void mergeAction(List<Booru>? secondaryBoorus) {
    final SettingsHandler settingsHandler = Get.find<SettingsHandler>();

    bool canAddSecondary = settingsHandler.mergeEnabled && (secondaryBoorus != null || currentTab.secondaryBoorus == null) && settingsHandler.booruList.length > 1;
    RxList<Booru>? secondary = canAddSecondary
      ? (secondaryBoorus == null
        ? [settingsHandler.booruList[1]].obs
        : secondaryBoorus.obs)
      : null;

    SearchGlobal newTab = SearchGlobal(currentTab.selectedBooru, secondary, currentTab.tags);
    list[currentIndex] = newTab;

    // run search
    changeTabIndex(currentIndex);
  }

  RxBool isLoading = true.obs;
  RxBool isLastPage = false.obs;

  Future<void> runSearch() async {
    // do nothing if reached the end or detected an error
    if(isLastPage.value) return;
    if(currentBooruHandler.errorString.isNotEmpty) return;

    // if not last page - set loading state and increment page
    if (!currentBooruHandler.locked.value) {
      isLoading.value = true;
      currentBooruHandler.pageNum++;
    }

    // fetch new items, but get results from booruHandler and not search itself
    await currentBooruHandler.Search(currentTab.tags, null);
    // print('FINISHED SEARCH: ${booruhandler.filteredFetched.length}');

    // lock new loads if handler detected last page (previous filteredFetched length == current length)
    if (currentBooruHandler.locked.value && !isLastPage.value) {
      isLastPage.value = true;
    }

    // request total image count if not already loaded
    if(currentBooruHandler.totalCount.value == 0) {
      currentBooruHandler.searchCount(currentTab.tags);
    }
    
    // delay every new page load
    Future.delayed(Duration(milliseconds: 200), () {
      isLoading.value = false;
    });
    return;
  }
  Future<void> retrySearch() async {
    currentBooruHandler.errorString.value = '';
    currentBooruHandler.locked.value = false;
    isLastPage.value = false;
    currentBooruHandler.pageNum--;
    await runSearch();
    return;
  }



  RxBool isRestored = false.obs;

  // ignore: close_sinks
  StreamController<String>? volumeStream = Platform.isAndroid ? StreamController.broadcast() : null;
  // ignore: cancel_subscriptions
  StreamSubscription? rootVolumeListener;

  Function rootRestate;
  SearchHandler(this.rootRestate) {
    rootVolumeListener = volumeKeyChannel?.receiveBroadcastStream().listen((event) {
      volumeStream?.sink.add(event);
    });
  }



  // Backup/restore tabs stuff

  // special strings used to separate parts of tab backup string
  // tab - separates info parts about tab itself, list - separates tabs list entries

  // example of backup string: "booruName1|||tags1|||tab~~~booruName2|||tags2|||selected~~~booruName3|||tags3|||tab"
  final String tabDivider = '|||', listDivider = '~~~';

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
  void restoreTabs() async {
    final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
    List<String> result = await settingsHandler.dbHandler.getTabRestore();
    List<SearchGlobal> restoredGlobals = [];

    bool foundBrokenItem = false;
    int newIndex = 0;
    if(result.length == 2) {
      // split list into tabs
      List<List<String>> splitInput = decodeBackupString(result[1]);
      for (List<String> booruAndTags in splitInput) {
        // check for parsing errors
        bool isEntryValid = booruAndTags.length > 1 && booruAndTags[0].isNotEmpty;
        if(isEntryValid) {
          // find booru by name and create searchglobal with given tags
          Booru findBooru = settingsHandler.booruList.firstWhere((booru) => booru.name == booruAndTags[0], orElse: () => Booru(null, null, null, null, null));
          if(findBooru.name != null) {
            SearchGlobal newTab = SearchGlobal(findBooru.obs, null, booruAndTags[1]);
            restoredGlobals.add(newTab);
          } else {
            foundBrokenItem = true;
            SearchGlobal newTab = SearchGlobal(settingsHandler.booruList[0].obs, null, booruAndTags[1]);
            restoredGlobals.add(newTab);
          }

          // check if tab was marked as selected and set current selected index accordingly 
          if(booruAndTags.length > 2 && booruAndTags[2] == 'selected') { // if split has third item (selected) - set as current tab
            int index = splitInput.indexWhere((si) => si == booruAndTags);
            newIndex = index;
          }
        } else {
          foundBrokenItem = true;
        }
      }
    }

    isRestored.value = true;

    // set parsed tabs OR set first default tab if nothing to restore
    if(restoredGlobals.length > 0) {
      FlashElements.showSnackbar(
        title: Text(
          "Tabs restored",
          style: TextStyle(fontSize: 20)
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Restored ${restoredGlobals.length} tab${restoredGlobals.length == 1 ? '' : 's'} from previous session!'),

            if(foundBrokenItem)
              // notify user if there was unknown booru or invalid entry in the list
              ...[
                Text('Some restored tabs had unknown boorus or broken characters.'),
                Text('They were set to default or ignored.')
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
      print('BOORULIST ${settingsHandler.booruList.isNotEmpty}');
      if (settingsHandler.booruList.isNotEmpty) {
        defaultBooru = settingsHandler.booruList[0];
      }
      if(defaultBooru.type != null) {
        changeTabIndex(0);
        SearchGlobal newTab = SearchGlobal(defaultBooru.obs, null, settingsHandler.defTags);
        list.add(newTab);
      }
      searchTextController.text = settingsHandler.defTags;
    }
    // rootRestate();
  }

  void mergeTabs(String tabStr) {
    final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
    List<List<String>> splitInput = decodeBackupString(tabStr);
    List<SearchGlobal> restoredGlobals = [];
    for (List<String> booruAndTags in splitInput) {
      // check for parsing errors
      bool isEntryValid = booruAndTags.length > 1 && booruAndTags[0].isNotEmpty;
      if(isEntryValid) {
        // find booru by name and create searchglobal with given tags
        Booru findBooru = settingsHandler.booruList.firstWhere((booru) => booru.name == booruAndTags[0], orElse: () => Booru(null, null, null, null, null));
        if(findBooru.name != null) {
          SearchGlobal newTab = SearchGlobal(findBooru.obs, null, booruAndTags[1]);
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
      title: Text('Tabs merged'),
      content: Text('Added ${restoredGlobals.length} new tab${restoredGlobals.length == 1 ? '' : 's'}!'),
      sideColor: Colors.green,
      leadingIcon: Icons.settings_backup_restore
    );
  }
  void replaceTabs(String tabStr) {
    final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
    List<List<String>> splitInput = decodeBackupString(tabStr);
    List<SearchGlobal> restoredGlobals = [];
    int newIndex = 0;

    // reset current tab index to avoid exceptions when tab list length is different
    changeTabIndex(0);

    for (List<String> booruAndTags in splitInput) {
      // check for parsing errors
      bool isEntryValid = booruAndTags.length > 1 && booruAndTags[0].isNotEmpty;
      if(isEntryValid) {
        // find booru by name and create searchglobal with given tags
        Booru findBooru = settingsHandler.booruList.firstWhere((booru) => booru.name == booruAndTags[0], orElse: () => Booru(null, null, null, null, null));
        if(findBooru.name != null) {
          SearchGlobal newTab = SearchGlobal(findBooru.obs, null, booruAndTags[1]);
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
      title: Text('Tabs replaced'),
      content: Text('Received ${restoredGlobals.length} tab${restoredGlobals.length == 1 ? '' : 's'}!'),
      sideColor: Colors.green,
      leadingIcon: Icons.settings_backup_restore
    );
  }

  // Saves current tabs list to DB
  String? getBackupString() {
    final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
    // if there are only one tab - check that its not with default booru and tags
    // if there are more than 1 tab or check return false - start backup
    List<SearchGlobal> tabList = list;
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
  void backupTabs() {
    String? backupString = getBackupString();
    final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
    if(backupString != null) {
      settingsHandler.dbHandler.addTabRestore(backupString);
    } else {
      settingsHandler.dbHandler.clearTabRestore();
    }
  }

}


class SearchGlobal {
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
  RxList selected = [].obs;

  SearchGlobal(this.selectedBooru, this.secondaryBoorus, this.tags) {
    List<Booru> tempBooruList = [];
    tempBooruList.add(selectedBooru.value);
    if(secondaryBoorus != null) {
       tempBooruList.addAll(secondaryBoorus!);
    }
    final List temp = BooruHandlerFactory().getBooruHandler(tempBooruList, null);
    final BooruHandler handlerTemp = temp[0];
    final int pageNumTemp = temp[1];

    booruHandler = handlerTemp;
    booruHandler.pageNum.value = pageNumTemp;
  }

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
