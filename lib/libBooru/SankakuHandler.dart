import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'Booru.dart';
import 'BooruHandler.dart';
import 'BooruItem.dart';

class SankakuHandler extends BooruHandler{
  List<BooruItem> fetched = new List();
  SankakuHandler(Booru booru,int limit) : super(booru,limit);
  bool tagSearchEnabled = true;

  /**
   * This function will call a http get request using the tags and pagenumber parsed to it
   * it will then create a list of booruItems
   */
  Future Search(String tags,int pageNum) async{
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
      final response = await http.get(url,headers: {"Content-Type":"application/json","Accept": "application/json", "user-agent":"Mozilla/5.0 (Linux x86_64; rv:81.0) Gecko/20100101 Firefox/81.0"});
      // 200 is the success http response code
      if (response.statusCode == 200) {
        List<dynamic> parsedResponse = jsonDecode(response.body);
        // Create a BooruItem for each post in the list
        for (int i =0; i < parsedResponse.length; i++){
          var current = parsedResponse[i];
          List tags = new List();
          for (int x=0; x < current['tags'].length; x++) {
            tags.add(current['tags'][x]['name'].toString());
          }

          fetched.add(new BooruItem(current['file_url'],current['sample_url'],current['preview_url'],tags,makePostURL(current['id'].toString())));
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
    return "https://chan.sankakucomplex.com/post/show/$id";
  }
  // This will create a url for the http request
  String makeURL(String tags){
    return "${booru.baseURL}/posts?tags=$tags&limit=${limit.toString()}&page=${pageNum.toString()}";
    }

  String makeTagURL(String input){
    https://capi-v2.sankakucomplex.com/tags?name=cum_in
    return "${booru.baseURL}/tags?name=$input&limit=5";
  }
  @override
  Future tagSearch(String input) async {
    List<String> searchTags = new List();
    String url = makeTagURL(input);
    try {
      final response = await http.get(url,headers: {"Accept": "application/json", "user-agent":"Mozilla/5.0 (Linux x86_64; rv:81.0) Gecko/20100101 Firefox/81.0"});
      // 200 is the success http response code
      if (response.statusCode == 200) {
        var parsedResponse = jsonDecode(response.body);
        print(parsedResponse);
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


