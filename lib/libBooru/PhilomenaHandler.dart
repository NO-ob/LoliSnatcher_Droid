import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'Booru.dart';
import 'BooruHandler.dart';
import 'BooruItem.dart';

class PhilomenaHandler extends BooruHandler{
  List<BooruItem> fetched = new List();
  PhilomenaHandler(Booru booru,int limit) : super(booru,limit);

  /**
   * This function will call a http get request using the tags and pagenumber parsed to it
   * it will then create a list of booruItems
   */
  Future Search(String tags,int pageNum) async{
    int length = fetched.length;
    if (tags == "" || tags == " "){
      tags = "*";
    }
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
      final response = await http.get(url,headers: {"Accept": "text/html,application/xml,application/json", "user-agent":"LoliSnatcher_Droid/1.6.0"});
      // 200 is the success http response code
      if (response.statusCode == 200) {
        Map<String, dynamic> parsedResponse = jsonDecode(response.body);
        /**
         * This creates a list of xml elements 'post' to extract only the post elements which contain
         * all the data needed about each image
         */
        var posts = parsedResponse['images'];
        print("PhilomenaHandler::search ${parsedResponse['images'].length}");

        // Create a BooruItem for each post in the list
        for (int i =0; i < parsedResponse['images'].length; i++){
          var current = parsedResponse['images'][i];
          fetched.add(new BooruItem(current['representations']['full'],current['representations']['medium'],current['representations']['thumb_small'],current['tags'],makePostURL(current['id'].toString()),current['representations']['full']));

        }
        prevTags = tags;
        if (fetched.length == length){locked = true;}
        return fetched;
      }
    } catch(e) {
      print(e);
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
    if (booru.apiKey == ""){
      return "${booru.baseURL}/api/v1/json/search/images?filter_id=56027&q="+tags.replaceAll(" ", ",")+"&per_page=${limit.toString()}&page=${pageNum.toString()}";
    } else {
      return "${booru.baseURL}/api/v1/json/search/images?filter_id=56027&key=${booru.apiKey}&q="+tags.replaceAll(" ", ",")+"&per_page=${limit.toString()}&page=${pageNum.toString()}";
    }

  }

  String makeTagURL(String input){
    return "${booru.baseURL}/api/v1/json/search/tags?q=$input&per_page=5";
  }
  @override
  Future tagSearch(String input) async {
    List<String> searchTags = new List();
    if (input == ""){
      input = "*";
    }
    String url = makeTagURL(input);
    try {
      final response = await http.get(url,headers: {"Accept": "application/json", "user-agent":"LoliSnatcher_Droid/1.6.0"});
      // 200 is the success http response code
      if (response.statusCode == 200) {
        Map<String, dynamic> parsedResponse = jsonDecode(response.body);
        var tags = parsedResponse['tags'];
        if (parsedResponse.length > 0){
          for (int i=0; i < tags.length; i++){
            searchTags.add(tags[i]['slug'].toString());
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

