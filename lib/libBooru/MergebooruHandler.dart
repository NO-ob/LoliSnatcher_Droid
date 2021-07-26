import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:LoliSnatcher/libBooru/BooruHandlerFactory.dart';
import 'package:LoliSnatcher/libBooru/GelbooruV1Handler.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'dart:async';
import 'BooruHandler.dart';
import 'BooruItem.dart';
import 'Booru.dart';
import 'package:crypto/crypto.dart';
import 'package:LoliSnatcher/Tools.dart';


class MergebooruHandler extends BooruHandler{
  // Dart constructors are weird so it has to call super with the args
  MergebooruHandler(Booru booru, int limit): super(booru,limit);
  List<Booru> booruList = [];
  List<BooruHandler> booruHandlers = [];
  List<int> booruHandlerPageNums = [];
  int innerLimit = 0;
  bool hasGelbooruV1 = false;
  @override
  bool hasSizeData = true;
  @override
  void parseResponse(response){
  }
  @override
  Future Search(String tags, int pageNum) async{
    print("PAGE NUM = $pageNum");
    List<List<BooruItem>> tmpFetchedList = [];
    List<bool> isGelbooruV1List = [];
    int fetchedMax = 0;
    for(int i = 0; i < booruHandlers.length; i++){
      List<BooruItem> tmpFetched = await booruHandlers[i].Search(tags, pageNum + booruHandlerPageNums[i]);
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
          if (!hashInFetched(fetched, tmpFetchedList[i][innerFetchedIndex].md5String,tmpFetchedList[i][innerFetchedIndex].fileURL)){
            fetched.add(tmpFetchedList[i][innerFetchedIndex]);
          } else {
            print("Skipped because hash match: ${tmpFetchedList[i][innerFetchedIndex].fileURL}");
          }

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
  // GelbooruV1 uses a sha1 of an md5
  String makeSha1Hash(String hash){
    List<int> bytes = utf8.encode(hash);
    Digest digest = sha1.convert(bytes);
    print("converting hash to sha1");
    return digest.toString();
  }
  bool hashInFetched(List<BooruItem> fetched, hash, fileURL){
    for (int i = 0; i < fetched.length; i++){
      if (fetched[i].md5String == hash){
        print("hash match URL: $fileURL fetchedURL: ${fetched[i].fileURL}");
        return true;
      }
    }
    return false;
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
      if (element.type == "GelbooruV1"){
        hasGelbooruV1 = true;
      }
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