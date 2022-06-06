import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:LoliSnatcher/src/data/Booru.dart';
import 'package:LoliSnatcher/src/handlers/booru_handler.dart';
import 'package:LoliSnatcher/src/data/BooruItem.dart';
import 'package:LoliSnatcher/src/utils/logger.dart';

class BooruOnRailsHandler extends BooruHandler {
  @override
  bool tagSearchEnabled = true;

  BooruOnRailsHandler(Booru booru,int limit) : super(booru,limit);

  // This will create a url to goto the images page in the browser
  @override
  String makePostURL(String id){
    return "${booru.baseURL}/$id";
  }

  @override
  String validateTags(String tags){
    if (tags == "" || tags == " "){
      return "*";
    } else {
      return tags;
    }
  }

  @override
  void parseResponse(response) {
    Map<String, dynamic> parsedResponse = jsonDecode(response.body);
    var posts = parsedResponse['posts'];
    // Create a BooruItem for each post in the list
    List<BooruItem> newItems = [];
    for (int i =0; i < posts.length; i++) {
      var current = posts[i];
      Logger.Inst().log(current.toString(), "BooruOnRailsHandler", "parsedResponse", LogTypes.booruHandlerRawFetched);
      List<String> currentTags = [];
      for (int x = 0; x < current['tags'].length; x++){
        if (current['tags'][x].contains(" ")){
          currentTags.add(current['tags'][x].toString().replaceAll(" ", "+"));
        }
      }
      if (current['representations']['full'] != null && current['representations']['medium'] != null && current['representations']['large'] != null) {
        String sampleURL = current['representations']['large'], thumbURL = current['representations']['medium'];
        if(current["mime_type"].toString().contains("video")) {
          String tmpURL = "${sampleURL.substring(0, sampleURL.lastIndexOf("/") + 1)}thumb.gif";
          sampleURL = tmpURL;
          thumbURL = tmpURL;
        }
        String fileURL = current['representations']['full'];
        if (!fileURL.contains("http")){
          sampleURL = booru.baseURL! + sampleURL;
          thumbURL = booru.baseURL! + thumbURL;
          fileURL = booru.baseURL! + fileURL;
        }

        BooruItem item = BooruItem(
          fileURL: fileURL,
          fileWidth: current['width'].toDouble(),
          fileHeight: current['height'].toDouble(),
          sampleURL: sampleURL,
          thumbnailURL: thumbURL,
          tagsList: currentTags,
          postURL: makePostURL(current['id'].toString()),
          serverId: current['id'].toString(),
          score: current['score'].toString(),
          sources: [current['source_url'].toString()],
          rating: currentTags[0][0],
          postDate: current['created_at'], // 2021-06-13T02:09:45.138-04:00
          postDateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", // when timezone support added: "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
        );

        newItems.add(item);
      } else {
        Logger.Inst().log("post $i skipped", "BooruOnRailsHandler", "parseResponse", LogTypes.booruHandlerInfo);
      }
    }

    int lengthBefore = fetched.length;
    fetched.addAll(newItems);
    setMultipleTrackedValues(lengthBefore, fetched.length);
  }

  // This will create a url for the http request
  @override
  String makeURL(String tags){
    //https://twibooru.org/search.json?&key=&q=*&perpage=5&page=1
    final String tagsWithCommas = tags.replaceAll(" ", ",");
    final String limitStr = limit.toString();
    final String pageStr = pageNum.toString();
    final String apiKeyStr = ((booru.apiKey?.isEmpty ?? '') == '') ? "" : "key=${booru.apiKey}&";

    return "${booru.baseURL}/api/v3/search/posts?${apiKeyStr}q=$tagsWithCommas&perpage=$limitStr&page=$pageStr";
  }

  @override
  String makeTagURL(String input){
    return "${booru.baseURL}/api/v3/search/tags?q=*$input*";
  }

  @override
  Future tagSearch(String input) async {
    List<String> searchTags = [];
    if (input == ""){
      input = "*";
    }
    String url = makeTagURL(input);
    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri,headers: getHeaders());
      // 200 is the success http response code
      if (response.statusCode == 200) {
        List<dynamic> parsedResponse = jsonDecode(response.body)['tags'];
        List tagStringReplacements = [
          ["-colon-",":"],
          ["-dash-","-"],
          ["-fwslash-","/"],
          ["-bwslash-","\\"],
          ["-dot-","."],
          ["-plus-","+"]
        ];
        if (parsedResponse.isNotEmpty){
          for (int i=0; i < 10; i++) {
            String tag = parsedResponse[i]['slug'].toString();
            for (int x = 0; x < tagStringReplacements.length; x++){
              tag = tag.replaceAll(tagStringReplacements[x][0],tagStringReplacements[x][1]);
            }
            searchTags.add(tag);
          }
        }
      }
    } catch(e) {
      Logger.Inst().log(e.toString(), "BooruOnRailsHandler", "tagSearch", LogTypes.exception);
    }
    return searchTags;
  }
}

