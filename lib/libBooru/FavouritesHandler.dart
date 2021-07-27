import 'package:LoliSnatcher/libBooru/DBHandler.dart';
import 'package:LoliSnatcher/utilities/Logger.dart';
import 'package:flutter/material.dart';
import 'Booru.dart';
import 'BooruHandler.dart';
import 'BooruItem.dart';

class FavouritesHandler extends BooruHandler{
  DBHandler? dbHandler;
  FavouritesHandler(Booru booru,int limit): super(booru,limit);

  @override
  Future Search(String tags, int pageNum) async{
    isActive = true;
    int length = fetched.length;
    // if(this.pageNum == pageNum){
    //   return fetched;
    // }
    this.pageNum = pageNum;
    if (prevTags != tags){
      fetched = [];
    }
    fetched.addAll(await dbHandler!.searchDB(tags, fetched.length.toString(), limit.toString(),"DESC","Favourites"));
    prevTags = tags;
    if (fetched.isEmpty){
      Logger.Inst().log("dbhandler dbLocked", "FavouritesHandler", "search", LogTypes.booruHandlerInfo);
      locked = true;
    } else {
      if (fetched.length == length){
        Logger.Inst().log("dbhandler dbLocked", "FavouritesHandler", "search", LogTypes.booruHandlerInfo);
        locked = true;
      }
    }
    isActive = false;
    return fetched;
  }

  Future<List<String>> tagSearch(String input) async {
    List<String> tags = [];
    tags = await dbHandler!.getTags(input, limit);
    return tags;
  }

  void searchCount(String input) async {
    this.totalCount = await dbHandler!.searchDBCount(input);
  }
}