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
  static SearchHandler get to => Get.find();

  // search globals list
  RxList<SearchGlobal> list = RxList<SearchGlobal>([]);
  // current tab index
  Rx<int> index = 0.obs;

  // add new tab by the given search string
  addTabByString(String searchText, {bool switchToNew = false}) {
    // Add after the current tab
    // list.insert(index.value + 1, SearchGlobal(currentTab.selectedBooru, null, searchText));

    // Add new tab to the end
    list.add(SearchGlobal(currentTab.selectedBooru, null, searchText));

    // record search query to db
    final SettingsHandler settingsHandler = Get.find();
    if(searchText != "" && settingsHandler.searchHistoryEnabled) {
      settingsHandler.dbHandler.updateSearchHistory(
        searchText,
        currentTab.selectedBooru.value.type,
        currentTab.selectedBooru.value.name
      );
    }

    // set to last tab if requested
    if(switchToNew) {
      changeTabIndex(list.length - 1);
    }
  }

  // remove tab (or current if not provided) index and set new index and search text values
  removeAt({int tabIndex = -1}) {
    if(tabIndex == -1) {
      tabIndex = index.value;
    }

    if(list.length > 1) {
      if(index.value == list.length - 1){
        index.value --;
        searchTextController.text = currentTab.tags;
        list.removeAt(index.value + 1);
      } else {
        searchTextController.text = list[index.value + 1].tags;
        list.removeAt(index.value);
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

      final SettingsHandler settingsHandler = Get.find();
      searchTextController.text = settingsHandler.defTags;
      list[0] = SearchGlobal(currentTab.selectedBooru, null, settingsHandler.defTags);
    }
  }

  // grid scroll controller
  AutoScrollController gridScrollController = AutoScrollController();

  // search box text controller
  final TextEditingController searchTextController = TextEditingController();
  addTag(String tag) {
    if(tag.isNotEmpty) {
      if(currentTab.selectedBooru.value.type == 'Hydrus') {
        searchTextController.text += ', $tag';
      } else {
        searchTextController.text += ' $tag';
      }
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

  SearchGlobal get currentTab => list[index.value];

  void searchAction(String text, Booru? newBooru) {
    final SettingsHandler settingsHandler = Get.find();

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
        list.add(SearchGlobal(
          settingsHandler.booruList[0].obs,
          settingsHandler.mergeEnabled ? currentTab.secondaryBoorus : null,
          text
        ));
      }
    } else {
      list[index.value] = SearchGlobal(
        newBooru != null ? newBooru.obs : currentTab.selectedBooru,
        settingsHandler.mergeEnabled ? currentTab.secondaryBoorus : null,
        text
      );
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
    final SettingsHandler settingsHandler = Get.find();

    bool canAddSecondary = settingsHandler.mergeEnabled && (secondaryBoorus != null || currentTab.secondaryBoorus == null) && settingsHandler.booruList.length > 1;
    RxList<Booru>? secondary = canAddSecondary
      ? (secondaryBoorus == null
        ? [settingsHandler.booruList[1]].obs
        : secondaryBoorus.obs)
      : null;

    SearchGlobal newSearchGlobal = SearchGlobal(currentTab.selectedBooru, secondary, searchTextController.text);
    list[index.value] = newSearchGlobal;
  }

  RxBool isLoading = true.obs;
  RxBool isLastPage = false.obs;
  RxBool displayAppbar = true.obs;
  RxBool isFullscreen = false.obs;
  RxBool isRestored = false.obs;
  RxBool inViewer = false.obs;

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
}


class SearchGlobal {
  // unique id to use for booru controller
  String id = uuid.v4();

  String tags = "";
  int pageNum = 0;
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
    booruHandler = temp[0];
    booruHandler.pageNum.value = temp[1];
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
