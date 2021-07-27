import 'dart:convert';
import 'package:LoliSnatcher/utilities/Logger.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'Booru.dart';
import 'BooruHandler.dart';
import 'BooruItem.dart';
import 'package:LoliSnatcher/Tools.dart';

class BooruOnRailsHandler extends BooruHandler {
  bool tagSearchEnabled = true;
  List<BooruItem> fetched = [];

  BooruOnRailsHandler(Booru booru,int limit) : super(booru,limit);

  // This will create a url to goto the images page in the browser
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
  void parseResponse(response){
    Map<String, dynamic> parsedResponse = jsonDecode(response.body);
    var posts = parsedResponse['search'];
    // Create a BooruItem for each post in the list
    for (int i =0; i < posts.length; i++){
      var current = posts[i];
      Logger.Inst().log(current.toString(), "BooruOnRailsHandler", "parsedResponse", LogTypes.booruHandlerRawFetched);
      List<String> currentTags = current['tags'].split(", ");
      for (int x = 0; x< currentTags.length; x++){
        if (currentTags[x].contains(" ")){
          currentTags[x] = currentTags[x].replaceAll(" ", "+");
        }
      }
      if (current['representations']['full'] != null && current['representations']['medium'] != null && current['representations']['thumb_small'] != null) {
        String sampleURL = current['representations']['medium'], thumbURL = current['representations']['thumb_small'];
        if(current["mime_type"].toString().contains("video")) {
          String tmpURL = sampleURL.substring(0, sampleURL.lastIndexOf("/") + 1) + "thumb.gif";
          sampleURL = tmpURL;
          thumbURL = tmpURL;
        }
        String fileURL = current['representations']['full'];
        if (!fileURL.contains("http")){
          sampleURL = booru.baseURL! + sampleURL;
          thumbURL = booru.baseURL! + thumbURL;
          fileURL = booru.baseURL! + fileURL;
        }
        fetched.add(BooruItem(
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
        ));
        if(dbHandler!.db != null){
          setTrackedValues(fetched.length - 1);
        }
      } else {
        Logger.Inst().log("post $i skipped", "BooruOnRailsHandler", "parseResponse", LogTypes.booruHandlerInfo);
      }
    }
  }

  // This will create a url for the http request
  String makeURL(String tags){
    //https://twibooru.org/search.json?&key=&q=*&perpage=5&page=1
    if (booru.apiKey == ""){
      return "${booru.baseURL}/search.json?q="+tags.replaceAll(" ", ",")+"&perpage=${limit.toString()}&page=${pageNum.toString()}";
    } else {
      return "${booru.baseURL}/search.json?key=${booru.apiKey}&q="+tags.replaceAll(" ", ",")+"&perpage=${limit.toString()}&page=${pageNum.toString()}";
    }

  }

  String makeTagURL(String input){
    return "${booru.baseURL}/tags.json?tq=*$input*";
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
        List<dynamic> parsedResponse = jsonDecode(response.body);
        List tagStringReplacements = [
          ["-colon-",":"],
          ["-dash-","-"],
          ["-fwslash-","/"],
          ["-bwslash-","\\"],
          ["-dot-","."],
          ["-plus-","+"]
        ];
        if (parsedResponse.length > 0){
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

