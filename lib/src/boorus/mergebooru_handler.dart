import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/booru_handler_factory.dart';
import 'package:lolisnatcher/src/utils/logger.dart';


class MergebooruHandler extends BooruHandler{
  MergebooruHandler(Booru booru, int limit): super(booru, limit);

  List<Booru> booruList = [];
  List<BooruHandler> booruHandlers = [];
  List<int> booruHandlerPageNums = [];

  int innerLimit = 0;
  bool hasGelbooruV1 = false;

  @override
  bool get hasSizeData => booruHandlers.every((e) => e.hasSizeData);

  @override
  Future search(String tags, int? pageNumCustom, {bool withCaptchaCheck = true}) async {
    if (pageNumCustom != null) {
      pageNum = pageNumCustom;
    }
    List<List<BooruItem>> tmpFetchedList = [];
    List<bool> isGelbooruV1List = [];
    int fetchedMax = 0;
    for(int i = 0; i < booruHandlers.length; i++){
      String currentTags =
        tags.replaceAll(RegExp(r"(?!""${i + 1}"r")\d+#[A-Za-z0-9\_\-~:]*"), "")
            .replaceAll("  "," ")
            .replaceAll(RegExp(r"\d+#"),"").trim();
      Logger.Inst().log("TAGS FOR #$i are: $currentTags", "MergeBooruHandler", "Search", LogTypes.booruHandlerInfo);
      booruHandlers[i].pageNum = pageNum + booruHandlerPageNums[i];
      List<BooruItem> tmpFetched = (await booruHandlers[i].search(currentTags, null)) ?? [];
      tmpFetchedList.add(tmpFetched);
      if (booruHandlers[i].booru.type == "GelbooruV1"){
        isGelbooruV1List.add(true);
      } else {
        isGelbooruV1List.add(false);
      }
      fetchedMax += tmpFetchedList[i].length;
    }
    int innerFetchedOffset = 0;
    int innerFetchedIndex = -1;
    do {
      innerFetchedIndex = (innerLimit * pageNum) + innerFetchedOffset;
      for (int i = 0; i < tmpFetchedList.length; i++){
        if(innerFetchedIndex < tmpFetchedList[i].length){
          if (hasGelbooruV1 && isGelbooruV1List[i] == false){
            if (tmpFetchedList[i][innerFetchedIndex].md5String != null){
              tmpFetchedList[i][innerFetchedIndex].md5String = makeSha1Hash(tmpFetchedList[i][innerFetchedIndex].md5String!);
            }
          }
          if (!hashInFetched(fetched, tmpFetchedList[i][innerFetchedIndex].md5String, tmpFetchedList[i][innerFetchedIndex].fileURL)){
            fetched.add(tmpFetchedList[i][innerFetchedIndex]);
          } else {
            Logger.Inst().log("Skipped because hash match: ${tmpFetchedList[i][innerFetchedIndex].fileURL}", "MergeBooruHandler", "Search", LogTypes.booruHandlerInfo);
          }

        } else{
          Logger.Inst().log("not adding item from ${booruHandlers[i].booru.name}, length: ${tmpFetchedList[i].length}, index: $innerFetchedIndex", "MergeBooruHandler", "Search", LogTypes.booruHandlerInfo);
          Logger.Inst().log("innerLimit $innerLimit, pageNum: $pageNum", "MergeBooruHandler", "Search", LogTypes.booruHandlerInfo);
          Logger.Inst().log("fetched: ${fetched.length}, fetchedMax: $fetchedMax", "MergeBooruHandler", "Search", LogTypes.booruHandlerInfo);
        }
      }
      innerFetchedOffset ++;
    } while ((fetched.length < fetchedMax) && innerFetchedIndex < fetchedMax);

    locked = shouldLock();
    return fetched;
  }

  bool shouldLock() {
    int lockCount = 0;
    for (int i = 0; i < booruHandlers.length; i++){
      if (booruHandlers[i].locked){
        lockCount ++;
      }
    }
    if (lockCount == booruHandlers.length){
      return true;
    } else {
      return false;
    }
  }

  // GelbooruV1 uses a sha1 of an md5
  String makeSha1Hash(String hash){
    List<int> bytes = utf8.encode(hash);
    Digest digest = sha1.convert(bytes);
    Logger.Inst().log("converting hash to sha1", "MergeBooruHandler", "makeSha1Hash", LogTypes.booruHandlerInfo);
    return digest.toString();
  }

  bool hashInFetched(List<BooruItem> fetched, hash, fileURL){
    for (int i = 0; i < fetched.length; i++){
      if (fetched[i].md5String == hash){
        Logger.Inst().log("hash match URL: $fileURL fetchedURL: ${fetched[i].fileURL}", "MergeBooruHandler", "hashInFetched", LogTypes.booruHandlerInfo);
        return true;
      }
    }
    return false;
  }

  void setupMerge(List<Booru> boorus) {
    innerLimit = (limit / boorus.length).ceil();
    booruList.addAll(boorus);
    for (var element in booruList) {
      List factoryResults = BooruHandlerFactory().getBooruHandler([element], innerLimit);
      booruHandlers.add(factoryResults[0]);
      booruHandlerPageNums.add(factoryResults[1]);
      Logger.Inst().log("SETUP MERGE ADDING: ${element.name}", "MergeBooruHandler", "setupMerge", LogTypes.booruHandlerInfo);
      if (element.type == "GelbooruV1") {
        hasGelbooruV1 = true;
      }
    }
  }

  @override
  Future<List<String>> tagSearch(String input) async {
    return booruHandlers[0].tagSearch(input);
  }

  @override
  Future<void> searchCount(String input) async {
    int result = 0;
    for (int i = 0; i < booruHandlers.length; i++){
      await booruHandlers[i].searchCount(input);
      result += booruHandlers[i].totalCount.value;
    }
    totalCount.value = result;
    return;
  }
}