import 'dart:math';
import 'dart:async';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/utilities/Logger.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';

abstract class BooruHandler {
  // pagenum = -1 as "didn't load anything yet" state
  // gets set to higher number for special cases in handler factory
  String className = 'BooruHandler';
  int pageNum = -1;
  int limit = 20;
  String prevTags = "";
  bool locked = false;
  Booru booru;
  String verStr = Get.find<SettingsHandler>().verStr;
  RxList<BooruItem> fetched = RxList<BooruItem>([]);
  String errorString = '';

  List<BooruItem> get filteredFetched => fetched.where((el) => Get.find<SettingsHandler>().filterHated ? !el.isHated.value : true).toList();

  bool tagSearchEnabled = true;
  bool hasSizeData = false;
  BooruHandler(this.booru, this.limit);

  /**
   * This function will call a http get request using the tags and pagenumber parsed to it
   * it will then create a list of booruItems
   */
  Future Search(String tags, int? pageNumCustom) async {
    if (pageNumCustom != null) {
      pageNum = pageNumCustom;
    }
    tags = validateTags(tags);
    if (prevTags != tags) {
      fetched.value = [];
    }

    String? url = makeURL(tags);
    Logger.Inst().log(url!, className, "Search", LogTypes.booruHandlerSearchURL);
    try {
      int length = fetched.length;
      Uri uri = Uri.parse(url);
      final response = await http.get(uri, headers: getHeaders());
      if (response.statusCode == 200) {
        parseResponse(response);
        prevTags = tags;
        if (fetched.length == length) {
          locked = true;
        }
      } else {
        Logger.Inst().log("$className status is: ${response.statusCode}", className, "Search", LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log("$className url is: $url", className, "Search", LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log("$className url response is: ${response.body}", className, "Search", LogTypes.booruHandlerFetchFailed);
        errorString = response.statusCode.toString();
      }
    } catch (e) {
      Logger.Inst().log(e.toString(), className, "Search", LogTypes.exception);
      errorString = e.toString();
    }

    // print('Fetched: ${filteredFetched.length}');
    return fetched;
  }

  void parseResponse(response) {
    return;
  }

  String validateTags(String tags) {
    return tags;
  }

  String? makePostURL(String id) {}
  String? makeURL(String tags) {}
  String? makeTagURL(String input) {}
  tagSearch(String input) {}

  bool hasCommentsSupport = false;
  fetchComments(String postID, int pageNum) {
    return [];
  }

  // TODO
  bool hasUpdateItemSupport = false;
  updateItem(BooruItem item) {}

  bool hasNotesSupport = false;
  fetchNotes(String postID) {
    return [];
  }

  RxInt totalCount = 0.obs;
  Future<void> searchCount(String input) async {
    totalCount.value = 0;
    return;
  }

  Map<String, String> getHeaders() {
    return {
      "Accept": "text/html,application/xml,application/json",
      "user-agent": "LoliSnatcher_Droid/$verStr"
    };
  }

  String getDescription() {
    return '';
  }

  List<String> searchModifiers() {
    return [];
  }

  void setupMerge(List<Booru> boorus) {}

  //set the isSnatched and isFavourite booleans for a BooruItem in fetched
  Future<void> setTrackedValues(int fetchedIndex) async {
    final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
    if (settingsHandler.favDbHandler.db != null) {
      // TODO make this work in batches, not calling it on every single item ???
      List<bool> values = await settingsHandler.favDbHandler.getTrackedValues(fetched[fetchedIndex]);
      fetched[fetchedIndex].isSnatched.value = values[0];
      fetched[fetchedIndex].isFavourite.value = values[1];
    }
    List<List<String>> tagLists = settingsHandler.parseTagsList(fetched[fetchedIndex].tagsList);
    fetched[fetchedIndex].isHated.value = tagLists[0].length > 0;
    // fetched[fetchedIndex].isLoved.value = tagLists[1].length > 0;
    return;
  }

  Future<void> setMultipleTrackedValues(int beforeLength, int afterLength) async {
    // beforeLength can be -1, clamp to 0
    final int beforePos = max(0, beforeLength);
    // diff can be negative, clamp to 0
    int diff = max(0, afterLength - beforeLength);
    diff = diff > 0 ? diff + 1 : diff;
    // we need +1 to make sure we don't miss the last item, because sublist doesn't include the item with the end index
    // so this way we exceed the possible length of fetched to get it

    if (diff == 0) {
      // do nothing if nothing was added
      return;
    }

    // generate list of new fetched indexes
    final List<int> fetchedIndexes = List.generate(diff, (index) => beforePos + index);

    final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
    if (settingsHandler.favDbHandler.db != null && diff > 0) {
      List<List<bool>> valuesList = await settingsHandler.favDbHandler
          .getMultipleTrackedValues(fetched.sublist(fetchedIndexes.first, fetchedIndexes.last) //.map((e) => e.fileURL).toList()
              );

      valuesList.asMap().forEach((index, values) {
        fetched[fetchedIndexes[index]].isSnatched.value = values[0];
        fetched[fetchedIndexes[index]].isFavourite.value = values[1];

        // TODO probably leads to worse performance on page loads, change to isolate or async maybe?
        List<List<String>> tagLists = settingsHandler.parseTagsList(fetched[fetchedIndexes[index]].tagsList);
        fetched[fetchedIndexes[index]].isHated.value = tagLists[0].length > 0;
        // fetched[fetchedIndex].isLoved.value = tagLists[1].length > 0;
      });
    }

    return;
  }
}
