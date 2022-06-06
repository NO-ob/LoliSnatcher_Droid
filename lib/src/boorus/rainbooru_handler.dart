import 'dart:async';
import 'dart:convert';

import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

import 'package:LoliSnatcher/src/data/booru.dart';
import 'package:LoliSnatcher/src/handlers/booru_handler.dart';
import 'package:LoliSnatcher/src/data/booru_item.dart';
import 'package:LoliSnatcher/src/utils/logger.dart';


//Slow piece of shit
class RainbooruHandler extends BooruHandler {
  RainbooruHandler(Booru booru,int limit) : super(booru,limit);

  @override
  bool tagSearchEnabled = true;

  @override
  Future Search(String tags, int? pageNumCustom) async{
    int length = fetched.length;
    if (tags == "" || tags == " "){
      tags = "*";
    }
    if (prevTags != tags){
      fetched.value = [];
    }
    String url = makeURL(tags);
    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri,headers: getHeaders());
      // 200 is the success http response code
      if (response.statusCode == 200) {
        await parseResponse(response);
      } else {
        Logger.Inst().log("rainbooru status is${response.statusCode}", "RainbooruHandler","parseResponse", LogTypes.booruHandlerInfo);
        errorString = response.statusCode.toString();
      }
      prevTags = tags;
      if (fetched.length == length) {
        locked = true;
      }
      return fetched;
    } catch(e) {
      Logger.Inst().log(e.toString(), "RainbooruHandler","parseResponse", LogTypes.exception);
      errorString = e.toString();
      return fetched;
    }
  }

  @override
  Future<void> parseResponse(response) async {
    var document = parse(response.body);
    var posts = document.getElementsByClassName("thumbnail");

    // Create a BooruItem for each post in the list
    List<BooruItem> newItems = [];
    for (int i =0; i < posts.length; i++) {
      String thumbURL = "";
      var urlElem = posts.elementAt(i).firstChild!;
      thumbURL += urlElem.firstChild!.attributes["src"]!;
      String url = makePostURL(urlElem.attributes["href"]!.split("img/")[1]);
      Uri uri = Uri.parse(url);
      final responseInner = await http.get(uri,headers: getHeaders());
      if (responseInner.statusCode == 200) {
        document = parse(responseInner.body);
        var post = document.getElementById("immainpage");
        if (post != null){
          var postsURLs = post.querySelector("div#immainpage > a");
          String fileURL = postsURLs!.attributes["href"]!;
          String sampleURL = postsURLs.firstChild!.attributes["src"]!;
          var tags = document.querySelectorAll("a.tag");
          List<String> currentTags = [];
          for (int x = 0; x < tags.length; x++) {
            currentTags.add(tags[x].innerHtml.replaceAll(" ", "+"));
          }

          BooruItem item = BooruItem(
            fileURL: fileURL,
            sampleURL: sampleURL,
            thumbnailURL: thumbURL,
            tagsList: currentTags,
            postURL: url,
          );

          newItems.add(item);
        }
      }
    }

    int lengthBefore = fetched.length;
    fetched.addAll(newItems);
    setMultipleTrackedValues(lengthBefore, fetched.length);
  }

  // This will create a url to goto the images page in the browser
  @override
  String makePostURL(String id){
    return "${booru.baseURL}/img/$id";
  }


  // This will create a url for the http request
  @override
  String makeURL(String tags){
    //https://www.rainbooru.org/search?search=safe,solo&page=0
    if (tags != "*") {
      return "${booru.baseURL}/search?filters=&search=${tags.replaceAll(" ", ",")}&page=${pageNum.toString()}";
    } else {
      return "${booru.baseURL}/?search=&page=${pageNum.toString()}";
    }
  }

  @override
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
      final response = await http.get(uri,headers: getHeaders());
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
        if (parsedResponse.isNotEmpty){
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
      Logger.Inst().log(e.toString(), "RainbooruHandler","makeTagURL", LogTypes.exception);
    }
    return searchTags;
  }
}

