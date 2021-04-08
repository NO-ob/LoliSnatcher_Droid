import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'Booru.dart';
import 'BooruHandler.dart';
import 'BooruItem.dart';
import 'package:LoliSnatcher/Tools.dart';


//Slow piece of shit
class RainbooruHandler extends BooruHandler {
  bool tagSearchEnabled = true;
  List<BooruItem> fetched = [];

  RainbooruHandler(Booru booru,int limit) : super(booru,limit);
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
      fetched = [];
    }
    String url = makeURL(tags);
    print(url);
    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri,headers: {"Accept": "text/html,application/xml,application/json", "user-agent":"LoliSnatcher_Droid/$verStr"});
      // 200 is the success http response code
      if (response.statusCode == 200) {
        var document = parse(response.body);
        var posts = document.getElementsByClassName("thumbnail");
        // Create a BooruItem for each post in the list
        for (int i =0; i < posts.length; i++){
          String thumbURL = "";
          var urlElem = posts.elementAt(i).firstChild!;
          thumbURL += urlElem.firstChild!.attributes["src"]!;
          url = makePostURL(urlElem.attributes["href"]!.split("img/")[1]);
          Uri uri = Uri.parse(url);
          final responseInner = await http.get(uri,headers: {"Accept": "text/html,application/xml,application/json", "user-agent":"LoliSnatcher_Droid/$verStr"});
            if (responseInner.statusCode == 200){
              document = parse(responseInner.body);
              var post = document.getElementById("immainpage");
               if (post != null){
                 var postsURLs = post.querySelector("div#immainpage > a");
                 String fileURL = "" + postsURLs!.attributes["href"]!;
                 String sampleURL = "" + postsURLs!.firstChild!.attributes["src"]!;
                 var tags = document.querySelectorAll("a.tag");
                 print("fileurl is " +fileURL);
                 List<String> currentTags = [];
                 for (int x = 0; x < tags.length; x++) {
                   currentTags.add(tags[x].innerHtml.replaceAll(" ", "+"));
                 }
                 fetched.add(BooruItem(
                     fileURL,
                     sampleURL,
                     thumbURL,
                     currentTags,
                     url,
                     Tools.getFileExt(fileURL),
                 ));
                 if(dbHandler!.db != null){
                   setTrackedValues(fetched.length - 1);
                 }
               }
            } else {
              print("post $i skipped");
            }
          }
        } else {
        print("rainbooru status is" + response.statusCode.toString());
      }
        prevTags = tags;
        if (fetched.length == length){locked = true;}
        return fetched;
    } catch(e) {
      print(e);
      return fetched;
    }
  }
  // This will create a url to goto the images page in the browser
  String makePostURL(String id){
    return "${booru.baseURL}/img/$id";
  }



  // This will create a url for the http request
  String makeURL(String tags){
    //https://www.rainbooru.org/search?search=safe,solo&page=0
      if (tags != "*"){
        return "${booru.baseURL}/search?filters=&search="+tags.replaceAll(" ", ",")+"&page=${pageNum.toString()}";
      } else {
        return "${booru.baseURL}/?search=&page=${pageNum.toString()}";
      }


  }

  String makeTagURL(String input){
    return "https://twibooru.org/tags.json?tq=*$input*";
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
        List<dynamic> parsedResponse = jsonDecode(response.body);
        List tagStringReplacements = [
          ["-colon-",":"],
          ["-dash-","-"],
          ["-fwslash-","/"],
          ["-bwslash-","\\"],
          ["-dot-","."],
          ["-plus-","+"]
        ];
        if (parsedResponse.length > 0){
          for (int i=0; i < 10; i++) {
            String tag = parsedResponse[i]['slug'].toString();
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
    return searchTags;
  }
}

