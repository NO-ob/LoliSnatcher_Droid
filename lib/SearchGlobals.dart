import 'dart:async';
import 'dart:io';

import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/libBooru/BooruHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruHandlerFactory.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/Tools.dart';




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
    // list.insert(index.value + 1, SearchGlobal(currentTab.selectedBooru, null, searchText));

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
  void removeAt({int tabIndex = -1}) {
    if(tabIndex == -1) {
      tabIndex = index.value;
    }

    if(list.length > 1) {
      if(tabIndex == index.value) {
        if(index.value == list.length - 1){
          index.value --;
          searchTextController.text = currentTab.tags;
          list.removeAt(index.value + 1);
        } else {
          searchTextController.text = list[index.value + 1].tags;
          list.removeAt(index.value);
        }
      } else {
        index.value --;
        list.removeAt(tabIndex);
      }
    } else {
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
    }
  }

  // grid scroll controller
  AutoScrollController gridScrollController = AutoScrollController();

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
    if(i != index.value) {
      index.value = i;
      Tools.forceClearMemoryCache(withLive: true);
    }
    // set search text anyway
    searchTextController.text = currentTab.tags;
  }

  // recreate current tab with custom starting page number
  void changeCurrentTabPageNumber(int newPageNum) {
    SearchGlobal newSearchGlobal = SearchGlobal(currentTab.selectedBooru, currentTab.secondaryBoorus, currentTab.tags);
    newSearchGlobal.booruHandler.pageNum.value = newPageNum;
    list[index.value] = newSearchGlobal;
  }

  // search on the current tab until we reach given page number or there is an error
  void searchCurrentTabUntilPageNumber(int newPageNum) async {
    if(newPageNum > currentTab.booruHandler.pageNum.value) {
      int tempNum = currentTab.booruHandler.pageNum.value;
      while (tempNum < newPageNum) {
        await filteredSearch?.call();
        tempNum ++;
        // currentTab.booruHandler.pageNum.value = tempNum;
        print('search num $tempNum ${currentTab.booruHandler.pageNum.value}');

        if(currentTab.booruHandler.errorString.value.isNotEmpty) {
          break;
        }
      }
    }
  }

  SearchGlobal get currentTab => list[index.value];

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
      list[index.value] = newTab;
    }

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

    SearchGlobal newSearchGlobal = SearchGlobal(currentTab.selectedBooru, secondary, currentTab.tags);
    list[index.value] = newSearchGlobal;
  }

  RxBool isLoading = true.obs;
  RxBool isLastPage = false.obs;
  RxBool isRestored = false.obs;

  // ignore: close_sinks
  StreamController<String>? volumeStream = Platform.isAndroid ? StreamController.broadcast() : null;
  // ignore: cancel_subscriptions
  StreamSubscription? rootVolumeListener;

  Function rootRestate;
  Function? filteredSearch;
  SearchHandler(this.rootRestate) {
    rootVolumeListener = volumeKeyChannel?.receiveBroadcastStream().listen((event) {
      volumeStream?.sink.add(event);
    });
  }



  // Backup/restore tabs stuff

  // special strings used to separate parts of tab backup string
  // tab - separates info parts about tab itself, list - separates tabs list entries
  final String tabDivider = '|||', listDivider = '~~~';

  // Restores tabs from a string saved in DB
  void restoreTabs() async {
    final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
    List<String> result = await settingsHandler.dbHandler.getTabRestore();
    List<SearchGlobal> restoredGlobals = [];

    bool foundBrokenItem = false;
    int newIndex = 0;
    if(result.length == 2) {
      // split list into tabs
      List<String> splitInput = result[1].split(listDivider);
      for (String str in splitInput) {
        // split tab into booru name and tags
        List<String> booruAndTags = str.split(tabDivider);
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
          if(booruAndTags.length == 3 && booruAndTags[2] == 'selected') { // if split has third item (selected) - set as current tab
            int index = splitInput.indexWhere((si) => si == str);
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
        index.value = 0;
        SearchGlobal newTab = SearchGlobal(defaultBooru.obs, null, settingsHandler.defTags);
        list.add(newTab);
      }
      searchTextController.text = settingsHandler.defTags;
    }
    // rootRestate();
  }

  // Saves current tabs list to DB
  void backupTabs() {
    final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
    // if there are only one tab - check that its not with default booru and tags
    // if there are more than 1 tab or check return false - start backup
    List<SearchGlobal> tabList = list;
    int tabIndex = index.value;
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
      settingsHandler.dbHandler.addTabRestore(restoreString);
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
  double scrollPosition = 0;
  late BooruHandler booruHandler;
  RxInt viewedIndex = 0.obs;
  Rx<BooruItem> currentItem = BooruItem(
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
