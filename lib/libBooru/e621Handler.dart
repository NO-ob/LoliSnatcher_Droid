import 'dart:convert';
import 'package:flutter/material.dart';

import 'Booru.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'BooruHandler.dart';
import 'BooruItem.dart';

class e621Handler extends BooruHandler{
  List<BooruItem> fetched = new List();
  e621Handler(Booru booru,int limit) : super(booru,limit);

  /**
   * This function will call a http get request using the tags and pagenumber parsed to it
   * it will then create a list of booruItems
   */
  Future Search(String tags,int pageNum) async{
    isActive = true;
    int length = fetched.length;
    if(this.pageNum == pageNum){
      return fetched;
    }
    this.pageNum = pageNum;
    if (prevTags != tags){
      fetched = new List();
    }
    String url = makeURL(tags);
    print(url);
    try {
      final response = await http.get(url,headers: {"Accept": "text/html,application/xml,application/json", "user-agent":"LoliSnatcher_Droid/$verStr"});
      // 200 is the success http response code
      if (response.statusCode == 200) {
        Map<String, dynamic> parsedResponse = jsonDecode(response.body);
        /**
         * This creates a list of xml elements 'post' to extract only the post elements which contain
         * all the data needed about each image
         */
        var posts = parsedResponse['posts'];
        print("e621Handler::search ${parsedResponse['posts'].length}");

        // Create a BooruItem for each post in the list
        for (int i =0; i < parsedResponse['posts'].length; i++){
          var current = parsedResponse['posts'][i];
          /**
           * Add a new booruitem to the list .getAttribute will get the data assigned to a particular tag in the xml object
           */
          if (current['file']['url'] != null){
            fetched.add(new BooruItem(current['file']['url'],current['sample']['url'],current['preview']['url'],current['tags']['general'] + current['tags']['species'] + current['tags']['character'] + current['tags']['artist'] + current['tags']['meta'],makePostURL(current['id'].toString()),getFileExt(current['file']['url'])));
            if(dbHandler.db != null){
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
    return "${booru.baseURL}/tags.json?search[name_matches]=$input*&limit=5";
  }
  @override
  Future tagSearch(String input) async {
    List<String> searchTags = new List();
    String url = makeTagURL(input);
    try {
      final response = await http.get(url,headers: {"Accept": "application/json", "user-agent":"LoliSnatcher_Droid/$verStr"});
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

