import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'dart:async';
import 'BooruHandler.dart';
import 'BooruItem.dart';
import 'Booru.dart';
import 'package:LoliSnatcher/Tools.dart';

/**
 * Booru Handler for the gelbooru engine
 */
class GelbooruHandler extends BooruHandler{
  // Dart constructors are weird so it has to call super with the args
  GelbooruHandler(Booru booru, int limit): super(booru,limit);

  /**
   * This function will call a http get request using the tags and pagenumber parsed to it
   * it will then create a list of booruItems
   */
  Future Search(String tags, int pageNum) async{
    isActive = true;
    hasSizeData = true;
    // if(this.pageNum == pageNum){
    //   return fetched;
    // } // TODO in what cases is this used? this logic conflicts with retryLastpage in waterfallview
    this.pageNum = pageNum;
    if (prevTags != tags){
      fetched = [];
    }
    String url = makeURL(tags).replaceAll(" ", "+");
    print(url);
    try {
      int length = fetched.length;
      Uri uri = Uri.parse(url);
      final response = await http.get(uri,headers: {"Accept": "text/html,application/xml", "user-agent":"LoliSnatcher_Droid/$verStr"});
      // 200 is the success http response code
      if (response.statusCode == 200) {
        var parsedResponse = xml.parse(response.body);
        /**
         * This creates a list of xml elements 'post' to extract only the post elements which contain
         * all the data needed about each image
         */
        var posts = parsedResponse.findAllElements('post');
        // Create a BooruItem for each post in the list
        for (int i = 0; i < posts.length; i++){
          var current = posts.elementAt(i);
          /**
           * Add a new booruitem to the list .getAttribute will get the data assigned to a particular tag in the xml object
           */
          if(current.getAttribute("file_url") != null){
            // Fix for bleachbooru
            String fileURL = "", sampleURL = "", previewURL = "";
            fileURL += current.getAttribute("file_url")!.toString();
            sampleURL += current.getAttribute("sample_url")!.toString();
            previewURL += current.getAttribute("preview_url")!.toString();
            if (!fileURL.contains("http")){
              fileURL = booru.baseURL! + fileURL;
              sampleURL = booru.baseURL! + sampleURL;
              previewURL = booru.baseURL! + previewURL;
            }
            print(fileURL);

            fetched.add(new BooruItem(
              fileURL: fileURL,
              sampleURL: sampleURL,
              thumbnailURL: previewURL,
              tagsList: current.getAttribute("tags")!.split(" "),
              postURL: makePostURL(current.getAttribute("id")!),
              fileWidth: double.tryParse(current.getAttribute('width') ?? '') ?? null,
              fileHeight: double.tryParse(current.getAttribute('height') ?? '') ?? null,
              sampleWidth: double.tryParse(current.getAttribute('sample_width') ?? '') ?? null,
              sampleHeight: double.tryParse(current.getAttribute('sample_height') ?? '') ?? null,
              previewWidth: double.tryParse(current.getAttribute('preview_width') ?? '') ?? null,
              previewHeight: double.tryParse(current.getAttribute('preview_height') ?? '') ?? null,
              hasNotes: current.getAttribute("has_notes") != null && current.getAttribute("has_notes") == 'true',
              serverId: current.getAttribute("id"),
              rating: current.getAttribute("rating"),
              score: current.getAttribute("score"),
              sources: [current.getAttribute("source")!],
              md5String: current.getAttribute("md5"),
              postDate: current.getAttribute("created_at"), // Fri Jun 18 02:13:45 -0500 2021
              postDateFormat: "EEE MMM dd HH:mm:ss  yyyy", // when timezone support added: "EEE MMM dd HH:mm:ss Z yyyy",
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
    return "${booru.baseURL}/index.php?page=post&s=view&id=$id";
  }

  // This will create a url for the http request
  String makeURL(String tags){
    int cappedPage = max(0, pageNum); // needed because searchCount happens before first page increment
    if (booru.apiKey == ""){
      return "${booru.baseURL}/index.php?page=dapi&s=post&q=index&tags=$tags&limit=${limit.toString()}&pid=${cappedPage.toString()}";
    } else {
      return "${booru.baseURL}/index.php?api_key=${booru.apiKey}&user_id=${booru.userID}&page=dapi&s=post&q=index&tags=$tags&limit=${limit.toString()}&pid=${cappedPage.toString()}";
    }

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
    List<String> searchTags = [];
    String url = makeTagURL(input);
    try {
      if (booru.baseURL!.contains("rule34.xxx")){
        Uri uri = Uri.parse(url);
        final response = await http.get(uri,headers: {"Accept": "application/json", "user-agent":"LoliSnatcher_Droid/$verStr"});
        // 200 is the success http response code
        if (response.statusCode == 200) {
          var parsedResponse = jsonDecode(response.body);
          print(parsedResponse);
          if (parsedResponse.length > 0){
            for (int i=0; i < parsedResponse.length; i++){
              searchTags.add(parsedResponse.elementAt(i)["value"]);
            }
          }
        }
      } else {
        Uri uri = Uri.parse(url);
        final response = await http.get(uri,headers: {"Accept": "text/html,application/xml", "user-agent":"LoliSnatcher_Droid/$verStr"});
        // 200 is the success http response code
        if (response.statusCode == 200) {
          var parsedResponse = xml.parse(response.body);
          var tags = parsedResponse.findAllElements("tag");
          if (tags.length > 0){
            for (int i=0; i < tags.length; i++){
              searchTags.add(tags.elementAt(i).getAttribute("name")!.trim());
            }
          }
        }
      }
    } catch(e) {
      print(e);
    }
    return searchTags;
  }

  void searchCount(String input) async {
    int result = 0;
    String url = makeURL(input);
    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri, headers: {"Accept": "text/html,application/xml", "user-agent":"LoliSnatcher_Droid/$verStr"});
      // 200 is the success http response code
      if (response.statusCode == 200) {
        var parsedResponse = xml.parse(response.body);
        var root = parsedResponse.findAllElements('posts').toList();
        if(root.length == 1) {
          result = int.parse(root[0].getAttribute('count') ?? '0');
        }
      }
    } catch(e) {
      print(e);
    }
    this.totalCount = result;
  }

}