import 'dart:convert';
import 'dart:math';

import 'package:LoliSnatcher/utilities/Logger.dart';
import 'dart:async';
import 'BooruHandler.dart';
import 'BooruItem.dart';
import 'Booru.dart';

/**
 * Booru Handler for the gelbooru engine
 */
class NyanPalsHandler extends BooruHandler{
  // Dart constructors are weird so it has to call super with the args
  NyanPalsHandler(Booru booru, int limit): super(booru,limit);

  @override
  bool hasSizeData = false;

  @override
  void parseResponse(response){
    var parsedResponse = jsonDecode(response.body);
    totalCount.value = parsedResponse["total"]!;

    List<BooruItem> newItems = [];
    for (int i =0; i < parsedResponse['rows'].length; i++) {
      var current = parsedResponse['rows'][i];

      Logger.Inst().log(current.toString(), "NyanPalsHandler","parseResponse", LogTypes.booruHandlerRawFetched);

      String fileURL = current["url"]!;
      String md5 = fileURL.substring(fileURL.lastIndexOf("/") + 1,fileURL.lastIndexOf("."));
      fileURL = booru.baseURL! + fileURL;
      String thumbURL = "";

      List<String> currentTags = current['tags'].split(",");
      for (int x = 0; x < currentTags.length; x++){
        if (currentTags[x].contains(" ")){
          currentTags[x] = currentTags[x].replaceAll(" ", "_");
        }
      }

      BooruItem item = BooruItem(
        fileURL: fileURL,
        sampleURL: fileURL,
        thumbnailURL: "",
        tagsList: currentTags,
        postURL: fileURL,
        md5String: md5
      );

      thumbURL = booru.baseURL! + "/img/pettankontent/";
      if (item.mediaType == "video") {
        thumbURL = thumbURL + item.md5String! + ".mp4";
      } else if (item.mediaType == "animation") {
        thumbURL = thumbURL + "_" + item.md5String! + ".gif";
      } else {
        thumbURL = thumbURL + "_" + item.md5String! + ".png";
      }
      item.thumbnailURL = thumbURL;

      // video player cant do vp9 and dies
      if (item.mediaType != "video") {
        newItems.add(item);
      }
    }

    int lengthBefore = fetched.length;
    fetched.addAll(newItems);
    setMultipleTrackedValues(lengthBefore, fetched.length);
  }

  // This will create a url to goto the images page in the browser
  String makePostURL(String id){
    return "${booru.baseURL}/index.php?page=post&s=view&id=$id";
  }

  // This will create a url for the http request
  String makeURL(String tags){
    //https://nyanpals.com/kontent?include=nsfw&exclude=&allow=&limit=50&method=uploaded&offset=0&order=DESC&token=null
    String includeTags = "";
    String excludeTags = "";
    tags.split(" ").forEach((element) {
      String tag = element.replaceAll("_", " ");
      if (tag.contains("-")){
        excludeTags += tag.replaceAll("-", "") + ",";
      } else {
        includeTags += tag + ",";
      }
    });
    return "${booru.baseURL}/kontent?include=$includeTags&exclude=$excludeTags&allow=&limit=$limit&method=uploaded&offset=${pageNum * limit}&order=DESC&token=null";
  }

  String makeTagURL(String input){
    if (booru.baseURL!.contains("rule34.xxx")){
      return "${booru.baseURL}/autocomplete.php?q=$input"; // doesn't allow limit, but sorts by popularity
    } else {
      return "${booru.baseURL}/index.php?page=dapi&s=tag&q=index&name_pattern=$input%&limit=10";
    }
  }

  @override
  Future tagSearch(String input) async {
    return [];
  }

}