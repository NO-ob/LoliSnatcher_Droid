import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'dart:async';
import 'BooruHandler.dart';
import 'BooruItem.dart';
import 'Booru.dart';

/**
 * Booru Handler for the gelbooru engine
 */
class GelbooruHandler extends BooruHandler{
  List<BooruItem> fetched = new List();

  // Dart constructors are weird so it has to call super with the args
  GelbooruHandler(Booru booru,int limit): super(booru,limit);

  /**
   * This function will call a http get request using the tags and pagenumber parsed to it
   * it will then create a list of booruItems
   */
  Future Search(String tags,int pageNum) async{
    isActive = true;
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
      int length = fetched.length;
      final response = await http.get(url,headers: {"Accept": "text/html,application/xml", "user-agent":"LoliSnatcher_Droid/$verStr"});
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
          fetched.add(new BooruItem(current.getAttribute("file_url"),current.getAttribute("sample_url"),current.getAttribute("preview_url"),current.getAttribute("tags").split(" "),makePostURL(current.getAttribute("id")),getFileExt(current.getAttribute("file_url"))));
          if(dbHandler.db != null){
            setTrackedValues(fetched.length - 1);
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
      if (booru.apiKey == ""){
        return "${booru.baseURL}/index.php?page=dapi&s=post&q=index&tags=$tags&limit=${limit.toString()}&pid=${pageNum.toString()}";
      } else {
        return "${booru.baseURL}/index.php?api_key=${booru.apiKey}&user_id=${booru.userID}&page=dapi&s=post&q=index&tags=$tags&limit=${limit.toString()}&pid=${pageNum.toString()}";
      }

    }
    String makeTagURL(String input){
      if (booru.baseURL.contains("rule34.xxx")){
        return "${booru.baseURL}/autocomplete.php?q=$input"; // doesn't allow limit, but sorts by popularity
      } else {
        return "${booru.baseURL}/index.php?page=dapi&s=tag&q=index&name_pattern=$input%&limit=5";
      }
    }
    @override
    Future tagSearch(String input) async {
      List<String> searchTags = new List();
      String url = makeTagURL(input);
      try {
        if (booru.baseURL.contains("rule34.xxx")){
          final response = await http.get(url,headers: {"Accept": "application/json", "user-agent":"LoliSnatcher_Droid/$verStr"});
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
          final response = await http.get(url,headers: {"Accept": "text/html,application/xml", "user-agent":"LoliSnatcher_Droid/$verStr"});
          // 200 is the success http response code
          if (response.statusCode == 200) {
            var parsedResponse = xml.parse(response.body);
            var tags = parsedResponse.findAllElements("tag");
            if (tags.length > 0){
              for (int i=0; i < tags.length; i++){
                searchTags.add(tags.elementAt(i).getAttribute("name").trim());
              }
            }
          }
        }
      } catch(e) {
        print(e);
      }
      return searchTags;
    }

}