import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'Booru.dart';
import 'BooruHandler.dart';
import 'BooruItem.dart';

class PhilomenaHandler extends BooruHandler{
  List<BooruItem>? fetched = [];
  PhilomenaHandler(Booru booru,int limit) : super(booru,limit);

  /**
   * This function will call a http get request using the tags and pagenumber parsed to it
   * it will then create a list of booruItems
   */
  Future Search(String tags,int pageNum) async{
    isActive = true;
    int length = fetched!.length;
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
        Map<String, dynamic> parsedResponse = jsonDecode(response.body);
        print("PhilomenaHandler::search ${parsedResponse['images'].length}");
        // Create a BooruItem for each post in the list
        for (int i =0; i < parsedResponse['images'].length; i++){
          var current = parsedResponse['images'][i];
          fetched!.add(new BooruItem(current['representations']['full'],current['representations']['medium'],current['representations']['thumb_small'],current['tags'],makePostURL(current['id'].toString()),getFileExt(current['representations']['full'])));
          if(dbHandler!.db != null){
            setTrackedValues(fetched!.length - 1);
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

