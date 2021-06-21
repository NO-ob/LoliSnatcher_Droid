import 'dart:convert';

import 'Booru.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'BooruHandler.dart';
import 'BooruItem.dart';
import 'package:LoliSnatcher/Tools.dart';

class e621Handler extends BooruHandler{
  e621Handler(Booru booru,int limit) : super(booru,limit);

  /**
   * This function will call a http get request using the tags and pagenumber parsed to it
   * it will then create a list of booruItems
   */
  Future Search(String tags,int pageNum) async{
    isActive = true;
    hasSizeData = true;
    int length = fetched.length;
    // if(this.pageNum == pageNum){
    //   return fetched;
    // }
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
        Map<String, dynamic> parsedResponse = jsonDecode(response.body);
        /**
         * This creates a list of xml elements 'post' to extract only the post elements which contain
         * all the data needed about each image
         */
        var posts = parsedResponse['posts'];
        print(parsedResponse);
        print("e621Handler::search ${posts.length}");

        // Create a BooruItem for each post in the list
        for (int i = 0; i < posts.length; i++){
          var current = posts[i];
          /**
           * Add a new booruitem to the list .getAttribute will get the data assigned to a particular tag in the xml object
           */
          if (current['file']['md5'] != null){
            String fileURL = "";
            String sampleURL = "";
            String thumbURL = "";
            if (current['file']['url'] == null){
              String md5FirstSplit = current['file']['md5'].toString().substring(0,2);
              String md5SecondSplit = current['file']['md5'].toString().substring(2,4);
              fileURL = "https://static1.e621.net/data/$md5FirstSplit/$md5SecondSplit/${current['file']['md5']}.${current['file']['ext']}";
              sampleURL = fileURL.replaceFirst("data","data/sample").replaceFirst(current['file']['ext'], "jpg");
              thumbURL = sampleURL.replaceFirst("data/sample", "data/preview");
              if (current['file']['size'] <= 2694254){
                sampleURL = fileURL;
              }
            } else {
              fileURL = current['file']['url'];
              sampleURL = current['sample']['url'];
              thumbURL = current['preview']['url'];
            }
            fetched.add(new BooruItem(
              fileURL: fileURL,
              sampleURL: sampleURL,
              thumbnailURL: thumbURL,
              tagsList: [
                ...current['tags']['character'],
                ...current['tags']['copyright'],
                ...current['tags']['artist'],
                ...current['tags']['meta'],
                ...current['tags']['general'],
                ...current['tags']['species']
              ],
              postURL: makePostURL(current['id'].toString()),
              fileExt: current['file']['ext'],
              fileSize: current['file']['size'],
              fileWidth: current['file']['width'].toDouble(),
              fileHeight: current['file']['height'].toDouble(),
              sampleWidth: current['sample']['width'].toDouble(),
              sampleHeight: current['sample']['height'].toDouble(),
              previewWidth: current['preview']['width'].toDouble(),
              previewHeight: current['preview']['height'].toDouble(),
              hasNotes: current['has_notes'],
              serverId: current['id'].toString(),
              rating: current['rating'],
              score: current['score']['total'].toString(),
              sources: List<String>.from(current['sources'] ?? []),
              md5String: current['file']['md5'],
              postDate: current['created_at'], // 2021-06-13T02:09:45.138-04:00
              postDateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS", // when timezone support added: "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
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
    return "${booru.baseURL}/posts/$id?";
  }
  // This will create a url for the http request
  String makeURL(String tags){
    if (booru.apiKey == ""){
      return "${booru.baseURL}/posts.json?tags=$tags&limit=${limit.toString()}&page=${pageNum.toString()}";
    } else {
      return "${booru.baseURL}/posts.json?login=${booru.userID}&api_key=${booru.apiKey}&tags=$tags&limit=${limit.toString()}&page=${pageNum.toString()}";
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
        var parsedResponse = jsonDecode(response.body);
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

