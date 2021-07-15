import 'dart:convert';
import 'dart:math';

import 'package:LoliSnatcher/libBooru/BooruHandlerFactory.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'dart:async';
import 'BooruHandler.dart';
import 'BooruItem.dart';
import 'Booru.dart';
import 'package:LoliSnatcher/Tools.dart';


class MergebooruHandler extends BooruHandler{
  // Dart constructors are weird so it has to call super with the args
  MergebooruHandler(Booru booru, int limit): super(booru,limit);
  List<Booru> booruList = [];
  List<BooruHandler> booruHandlers = [];
  List<int> booruHandlerPageNums = [];
  int innerLimit = 0;
  @override
  bool hasSizeData = true;
  @override
  void parseResponse(response){
  }
  @override
  Future Search(String tags, int pageNum) async{
    print("PAGE NUM = $pageNum");
    List<List<BooruItem>> tmpFetchedList = [];
    int fetchedMax = 0;
    for(int i = 0; i < booruHandlers.length; i++){
      List<BooruItem> tmpFetched = await booruHandlers[i].Search(tags, pageNum + booruHandlerPageNums[i]);
      tmpFetchedList.add(tmpFetched);
      fetchedMax += tmpFetchedList[i].length;
    }
    int innerFetchedOffset = 0;
    int innerFetchedIndex = 0;
    do {
      innerFetchedIndex = (innerLimit * pageNum) + innerFetchedOffset;
      for (int i = 0; i < tmpFetchedList.length; i++){
        if(innerFetchedIndex < tmpFetchedList[i].length){
          fetched.add(tmpFetchedList[i][innerFetchedIndex]);
        } else{
          print("not adding item from ${booruHandlers[i].booru.name}, length: ${tmpFetchedList[i].length}, index: $innerFetchedIndex");
          print("innerLimit $innerLimit, pageNum: $pageNum");
          print("fetched: ${fetched.length}, fetchedMax: $fetchedMax");
        }
      }
      innerFetchedOffset ++;
    } while ((fetched.length < fetchedMax) && innerFetchedIndex < fetchedMax);

    this.locked = shouldLock();
    return fetched;
  }

  bool shouldLock(){
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
  @override
  void setupMerge(List<Booru> boorus){
    innerLimit = (this.limit / boorus.length).ceil();
    booruList.addAll(boorus);
    booruList.forEach((element) {
      List factoryResults = BooruHandlerFactory().getBooruHandler([element], innerLimit, this.dbHandler);
      booruHandlers.add(factoryResults[0]);
      booruHandlerPageNums.add(factoryResults[1] + 1);
      print("SETUP MERGE ADDING: ${element.name}");
    });
  }

  @override
  Future tagSearch(String input) async {
      return booruHandlers[0].tagSearch(input);
  }

  void searchCount(String input) async {
    int result = 0;
    for (int i = 0; i < booruHandlers.length; i++){
      booruHandlers[i].searchCount(input);
      result += booruHandlers[i].totalCount;
    }
    this.totalCount = result;
  }

}