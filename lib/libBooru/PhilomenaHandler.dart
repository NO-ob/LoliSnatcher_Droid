import 'dart:convert';
import 'package:LoliSnatcher/utilities/Logger.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'Booru.dart';
import 'BooruHandler.dart';
import 'BooruItem.dart';

class PhilomenaHandler extends BooruHandler{
  PhilomenaHandler(Booru booru,int limit) : super(booru,limit);

  @override
  String validateTags(tags){
    if (tags == "" || tags == " "){
      return "*";
    } else {
      return tags;
    }
  }

  @override
  void parseResponse(response) {
    Map<String, dynamic> parsedResponse = jsonDecode(response.body);

    // Create a BooruItem for each post in the list
    List<BooruItem> newItems = [];
    for (int i =0; i < parsedResponse['images'].length; i++) {
      var current = parsedResponse['images'][i];
      Logger.Inst().log(current.toString(), "PhiloMenaHandler","parseResponse", LogTypes.booruHandlerRawFetched);
      if (current['representations']['full'] != null){
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

        List<String> currentTags = current['tags'].toString().substring(1,current['tags'].toString().length -1).split(", ");
        for (int x = 0; x< currentTags.length; x++){
          if (currentTags[x].contains(" ")){
            currentTags[x] = currentTags[x].replaceAll(" ", "+");
          }
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
          postDate: current['created_at'],
          postDateFormat: "yyyy-MM-dd'T'HH:mm:ss'Z'",
        );

        newItems.add(item);
      }
    }

    int lengthBefore = fetched.length;
    fetched.addAll(newItems);
    setMultipleTrackedValues(lengthBefore, fetched.length);
  }

  // This will create a url to goto the images page in the browser
  String makePostURL(String id){
    return "${booru.baseURL}/images/$id";
  }

  // This will create a url for the http request
  String makeURL(String tags){
    //https://derpibooru.org/api/v1/json/search/images?q=solo&per_page=20&page=1
    String filter = "2";
    if (booru.baseURL!.contains("derpibooru")){
      filter = "56027";
    }
    if (booru.apiKey == ""){
      return "${booru.baseURL}/api/v1/json/search/images?filter_id=$filter&q="+tags.replaceAll(" ", ",")+"&per_page=${limit.toString()}&page=${pageNum.toString()}";
    } else {
      return "${booru.baseURL}/api/v1/json/search/images?key=${booru.apiKey}&q="+tags.replaceAll(" ", ",")+"&per_page=${limit.toString()}&page=${pageNum.toString()}";
    }

  }

  String makeTagURL(String input){
    return "${booru.baseURL}/api/v1/json/search/tags?q=$input*&per_page=10";
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
        Map<String, dynamic> parsedResponse = jsonDecode(response.body);
        var tags = parsedResponse['tags'];
        List tagStringReplacements = [
          ["-colon-",":"],
          ["-dash-","-"],
          ["-fwslash-","/"],
          ["-bwslash-","\\"],
          ["-dot-","."],
          ["-plus-","+"]
        ];
        if (parsedResponse.length > 0){
          for (int i=0; i < tags.length; i++){
            String tag = tags[i]['slug'].toString();
            for (int x = 0; x < tagStringReplacements.length; x++){
              tag = tag.replaceAll(tagStringReplacements[x][0],tagStringReplacements[x][1]);
            }
            searchTags.add(tag);
          }
        }
      }
    } catch(e) {
      Logger.Inst().log(e.toString(), "PhiloMenaHandler","tagSearch", LogTypes.exception);
    }
    return searchTags;
  }
}

