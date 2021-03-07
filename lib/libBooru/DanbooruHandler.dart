import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'dart:async';
import 'BooruHandler.dart';
import 'BooruItem.dart';
import 'Booru.dart';
import 'dart:convert';
/**
 * Booru Handler for the Danbooru engine
 */
class DanbooruHandler extends BooruHandler{
  List<BooruItem>? fetched = [];

  // Dart constructors are weird so it has to call super with the args
  DanbooruHandler(Booru booru,int limit) : super(booru,limit);

  /**
   * This function will call a http get request using the tags and pagenumber parsed to it
   * it will then create a list of booruItems
   */
  Future Search(String tags, int pageNum) async{
    isActive = true;
    int length = fetched!.length;
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
      final response = await http.get(uri, headers: {"Accept": "text/html,application/xml", "user-agent":"LoliSnatcher_Droid/$verStr"});
      if (response.statusCode == 200) {
        var parsedResponse = xml.parse(response.body);
        var posts = parsedResponse.findAllElements('post');
        // Create a BooruItem for each post in the list
        for (int i = 0; i < posts.length; i++) {
          var current = posts.elementAt(i);
          /**
           * This check is needed as danbooru will return items which have been banned or deleted and will not have any image urls
           * to go with the rest of the data so cannot be displayed and are pointless for the app
           */
          if ((current.findElements("file-url").length > 0)) {
            fetched!.add(new BooruItem(current
                .findElements("file-url")
                .elementAt(0)
                .text, current
                .findElements("large-file-url")
                .elementAt(0)
                .text, current
                .findElements("preview-file-url")
                .elementAt(0)
                .text, current
                .findElements("tag-string")
                .elementAt(0).text.split(" ")
                , makePostURL(current
                .findElements("id")
                .elementAt(0)
                .text),getFileExt(current
                    .findElements("file-url")
                    .elementAt(0)
                    .text)));
            if(dbHandler!.db != null){
              setTrackedValues(fetched!.length - 1);
            }
          }
        }
        prevTags = tags;
        if (fetched!.length == length){locked = true;}
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
    return "${booru.baseURL}/posts/$id";
  }
  String makeURL(String tags){
    if (booru.apiKey == ""){
      return "${booru.baseURL}/posts.xml?tags=$tags&limit=${limit.toString()}&page=${pageNum.toString()}";
    } else {
      return "${booru.baseURL}/posts.xml?login=${booru.userID}&api_key=${booru.apiKey}&tags=$tags&limit=${limit.toString()}&page=${pageNum.toString()}";
    }

  }
  String makeTagURL(String input){
    return "${booru.baseURL}/tags.json?search[name_matches]=$input*&limit=10";
  }
  @override
  Future tagSearch(String input) async {
    List<String> searchTags = [];
    String url = makeTagURL(input);
    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri,headers: {"Accept": "application/json", "user-agent":"LoliSnatcher_Droid/$verStr"});
      // 200 is the success http response code
      if (response.statusCode == 200) {
        List<dynamic> parsedResponse = jsonDecode(response.body);
        if (parsedResponse.length > 0){
          for (int i=0; i < parsedResponse.length; i++){
            searchTags.add(parsedResponse[i]['name']);
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