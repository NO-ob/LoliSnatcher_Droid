import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'Booru.dart';
import 'BooruHandler.dart';
import 'BooruItem.dart';
import 'package:LoliSnatcher/Tools.dart';

class PhilomenaHandler extends BooruHandler{
  PhilomenaHandler(Booru booru,int limit) : super(booru,limit);

  /**
   * This function will call a http get request using the tags and pagenumber parsed to it
   * it will then create a list of booruItems
   */
  Future Search(String tags,int pageNum) async{
    isActive = true;
    int length = fetched.length;
    if (tags == "" || tags == " "){
      tags = "*";
    }
    if(this.pageNum == pageNum){
      return fetched;
    }
    this.pageNum = pageNum;
    if (prevTags != tags){
      fetched = [];
    }
    String url = makeURL(tags);
    print(url);
    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri,headers: {"Accept": "text/html,application/xml,application/json", "user-agent":"LoliSnatcher_Droid/$verStr"});
      // 200 is the success http response code
      if (response.statusCode == 200) {
        print(response.body);
        Map<String, dynamic> parsedResponse = jsonDecode(response.body);
        print("PhilomenaHandler::search ${parsedResponse['images'].length}");
        // Create a BooruItem for each post in the list
        for (int i =0; i < parsedResponse['images'].length; i++){
          var current = parsedResponse['images'][i];
          if (current['representations']['full'] != null){
            String sampleURL = current['representations']['medium'], thumbURL = current['representations']['thumb_small'];
            if(current["mime_type"].toString().contains("video")) {
              String tmpURL = sampleURL.substring(0, sampleURL.lastIndexOf("/") + 1) + "thumb.gif";
              sampleURL = tmpURL;
              thumbURL = tmpURL;
              print("tmpurl is " + tmpURL);
            }

            String fileURL = current['representations']['full'];
            if (!fileURL.contains("http")){
              sampleURL = booru.baseURL! + sampleURL;
              thumbURL = booru.baseURL! + thumbURL;
              print("fileurl is $fileURL");
              fileURL = booru.baseURL! + fileURL;
              print("newurl is $fileURL");
            }

            print("sample url is $sampleURL");
            List<String> currentTags = current['tags'].toString().substring(1,current['tags'].toString().length -1).split(", ");
            for (int x = 0; x< currentTags.length; x++){
              if (currentTags[x].contains(" ")){
                currentTags[x] = currentTags[x].replaceAll(" ", "+");
              }
            }
            fetched.add(BooruItem(
              fileURL,
              sampleURL,
              thumbURL,
              currentTags,
              makePostURL(current['id'].toString()),
              Tools.getFileExt(current['representations']['full']),
                idOnHost: current['id'].toString()
            ));
            if(dbHandler!.db != null){
              setTrackedValues(fetched.length - 1);
            }
          }
        }
        prevTags = tags;
        if (fetched.length == length){locked = true;}
        isActive = false;
        return fetched;
      }
    } catch(e) {
      print(e);
      isActive = false;
      return fetched;
    }

  }
  // This will create a url to goto the images page in the browser
  String makePostURL(String id){
    return "${booru.baseURL}/images/$id";
  }
  // This will create a url for the http request
  String makeURL(String tags){
    //https://derpibooru.org/api/v1/json/search/images?q=solo&per_page=20&page=1
    String filter = "56027";
    if (booru.baseURL!.contains("booru.bronyhub.com")){
      filter = "2";
    }
    if (booru.apiKey == ""){
      return "${booru.baseURL}/api/v1/json/search/images?filter_id=$filter&q="+tags.replaceAll(" ", ",")+"&per_page=${limit.toString()}&page=${pageNum.toString()}";
    } else {
      return "${booru.baseURL}/api/v1/json/search/images?filter_id=$filter&key=${booru.apiKey}&q="+tags.replaceAll(" ", ",")+"&per_page=${limit.toString()}&page=${pageNum.toString()}";
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
      final response = await http.get(uri,headers: {"Accept": "application/json", "user-agent":"LoliSnatcher_Droid/$verStr"});
      // 200 is the success http response code
      if (response.statusCode == 200) {
        print(response.body);
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
      print(e);
    }
    print(searchTags.length);
    return searchTags;
  }
}

