import 'dart:math';

import 'package:LoliSnatcher/utilities/Logger.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:get/get.dart';

import 'Booru.dart';
import 'BooruItem.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

abstract class BooruHandler {
  // pagenum = -1 as "didn't load anything yet" state
  // gets set to higher number for special cases in handler factory
  RxInt pageNum = (-1).obs; 
  int limit = 20;
  String prevTags = "";
  RxBool locked = false.obs;
  Booru booru;
  String verStr = Get.find<SettingsHandler>().verStr;
  RxList<BooruItem> fetched = RxList<BooruItem>([]);
  RxString errorString = ''.obs;

  List<BooruItem> get filteredFetched => fetched.where((el) => Get.find<SettingsHandler>().filterHated ? !el.isHated.value : true).toList();

  bool tagSearchEnabled = true;
  bool hasSizeData = false;
  BooruHandler(this.booru,this.limit);
  /**
   * This function will call a http get request using the tags and pagenumber parsed to it
   * it will then create a list of booruItems
   */
  Future Search(String tags, int? pageNumCustom) async {
    if(pageNumCustom != null) {
      pageNum.value = pageNumCustom;
    }
    tags = validateTags(tags);
    if (prevTags != tags){
      fetched.value = [];
    }

    String? url = makeURL(tags);
    Logger.Inst().log(url!, "BooruHandler", "Search", LogTypes.booruHandlerSearchURL);
    try {
      int length = fetched.length;
      Uri uri = Uri.parse(url);
      final response = await http.get(uri,headers: getHeaders());
      if (response.statusCode == 200) {
        parseResponse(response);
        prevTags = tags;
        if (fetched.length == length){locked.value = true;}
      } else {
        Logger.Inst().log("BooruHandler status is: ${response.statusCode}", "BooruHandler", "Search", LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log("BooruHandler url is: $url", "BooruHandler", "Search", LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log("BooruHandler url response is: ${response.body}", "BooruHandler", "Search", LogTypes.booruHandlerFetchFailed);
        errorString.value = response.statusCode.toString();
      }
    } catch(e) {
      Logger.Inst().log(e.toString(), "BooruHandler", "Search", LogTypes.exception);
      errorString.value = e.toString();
      // return fetched;
    }

    // print('Fetched: ${filteredFetched.length}');
    return fetched;
  }

  void parseResponse(response){return;}
  String validateTags(String tags){return tags;}
  String? makePostURL(String id){}
  String? makeURL(String tags){}
  String? makeTagURL(String input){}
  tagSearch(String input) {}

  RxInt totalCount = 0.obs;
  Future<void> searchCount(String input) async {
    totalCount.value = 0;
    return;
  }

  Map<String,String> getWebHeaders() {
      return {"Accept": "text/html,application/xml,application/json", "user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:83.0) Gecko/20100101 Firefox/83.0"};
  }
  Map<String,String> getHeaders(){
    return {"Accept": "text/html,application/xml,application/json", "user-agent":"LoliSnatcher_Droid/$verStr"};
  }
  String getDescription() {
    return '';
  }

  List<String> searchModifiers() {
    return [];
  }

  void setupMerge(List<Booru> boorus){}

  //set the isSnatched and isFavourite booleans for a BooruItem in fetched
  Future<void> setTrackedValues(int fetchedIndex) async{
    final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
    if (settingsHandler.dbHandler.db != null) {
      // TODO make this work in batches, not calling it on every single item ???
      List<bool> values = await settingsHandler.dbHandler.getTrackedValues(fetched[fetchedIndex].fileURL);
      fetched[fetchedIndex].isSnatched.value = values[0];
      fetched[fetchedIndex].isFavourite.value = values[1];
    }
    List<List<String>> tagLists = settingsHandler.parseTagsList(fetched[fetchedIndex].tagsList);
    fetched[fetchedIndex].isHated.value = tagLists[0].length > 0;
    // fetched[fetchedIndex].isLoved.value = tagLists[1].length > 0;
    return;
  }

  void setMultipleTrackedValues(int start, int end) async {
    // start can be -1, clamp to 0
    start = max(0, start);
    // diff can be negative, clamp to 0
    final int diff = max(0, end - start);
    // end can be -1, clamp to 0
    end = max(0, end - 1);

    // generate list of new fetched indexes
    final List<int> fetchedIndexes = List.generate(diff, (index) => start + index);

    final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
    if (settingsHandler.dbHandler.db != null && diff > 0) {
      List<List<bool>> valuesList = await settingsHandler.dbHandler.getMultipleTrackedValues(
        fetched.sublist(fetchedIndexes.first, fetchedIndexes.last).map((e) => e.fileURL).toList()
      );

      valuesList.asMap().forEach((index, values) {
        fetched[fetchedIndexes[index]].isSnatched.value = values[0];
        fetched[fetchedIndexes[index]].isFavourite.value = values[1];
      });
    }
  }
}