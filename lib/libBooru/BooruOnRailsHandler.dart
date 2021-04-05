import 'dart:convert';
import 'package:LoliSnatcher/libBooru/PhilomenaHandler.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'Booru.dart';
import 'BooruHandler.dart';
import 'BooruItem.dart';

class BooruOnRailsHandler extends BooruHandler {
  bool tagSearchEnabled = true;
  List<BooruItem>? fetched = [];
  BooruOnRailsHandler(Booru booru,int limit) : super(booru,limit);
  Future Search(String tags,int pageNum) async{
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
        var posts = parsedResponse['search'];
        print("BooruOnRails::search ${posts.length}");
        // Create a BooruItem for each post in the list
        for (int i =0; i < posts.length; i++){
          var current = posts[i];
          List<String> currentTags = current['tags'].split(", ");
          for (int x = 0; x< currentTags.length; x++){
            if (currentTags[x].contains(" ")){
              currentTags[x] = currentTags[x].replaceAll(" ", "+");
            }
          }
          if (current['representations']['full'] != null && current['representations']['medium'] != null && current['representations']['thumb_small'] != null) {
            fetched!.add(new BooruItem(current['representations']['full'],current['representations']['medium'],current['representations']['thumb_small'],currentTags,makePostURL(current['id'].toString()),getFileExt(current['representations']['full'])));
            if(dbHandler!.db != null){
              setTrackedValues(fetched!.length - 1);
            }
          } else {
            print("post $i skipped");
          }
        }
        prevTags = tags;
        if (fetched!.length == length){locked = true;}
        return fetched;
      }
    } catch(e) {
      print(e);
      return fetched;
    }
  }
  // This will create a url to goto the images page in the browser
  String makePostURL(String id){
    return "${booru.baseURL}/$id";
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
      final response = await http.get(uri,headers: {"Accept": "application/json", "user-agent":"LoliSnatcher_Droid/$verStr"});
      // 200 is the success http response code
      print(url);
      print(response);
      if (response.statusCode == 200) {
        List<dynamic> parsedResponse = jsonDecode(response.body);
        if (parsedResponse.length > 0){
          for (int i=0; i < 10; i++) {
            searchTags.add(parsedResponse[i]['slug'].toString());
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

