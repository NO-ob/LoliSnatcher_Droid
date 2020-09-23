import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'Booru.dart';
import 'BooruHandler.dart';
import 'BooruItem.dart';

class SzurubooruHandler extends BooruHandler{
  List<BooruItem> fetched = new List();
  SzurubooruHandler(Booru booru,int limit) : super(booru,limit);

  /**
   * This function will call a http get request using the tags and pagenumber parsed to it
   * it will then create a list of booruItems
   */
  Future Search(String tags,int pageNum) async{
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
      final response = await http.get(url,headers: {"Content-Type":"application/json","Accept": "application/json", "user-agent":"LoliSnatcher_Droid/1.5.0"});
      // 200 is the success http response code
      if (response.statusCode == 200) {
        Map<String, dynamic> parsedResponse = jsonDecode(response.body);
        print(response.body);
        /**
         * This creates a list of xml elements 'post' to extract only the post elements which contain
         * all the data needed about each image
         */
        var posts = parsedResponse['results'];
        print("Szurubooru::search ${parsedResponse['results'].length}");

        // Create a BooruItem for each post in the list
        for (int i =0; i < parsedResponse['results'].length; i++){
          var current = parsedResponse['results'][i];
          List tags = new List();
          for (int x=0; x < current['tags'].length; x++) {
            String currentTags = current['tags'][x]['names'].toString().replaceAll(r":", r"\:");
            currentTags = currentTags.substring(1,currentTags.length - 1);
            if (currentTags.contains(",")){
              tags += currentTags.split(", ");
            } else {
              tags.add(currentTags);
            }
          }
          fetched.add(new BooruItem("${booru.baseURL}/"+current['contentUrl'],"${booru.baseURL}/"+current['thumbnailUrl'],"${booru.baseURL}/"+current['thumbnailUrl'],tags,makePostURL(current['id'].toString())));
        }
        prevTags = tags;
        return fetched;
      }
    } catch(e) {
      print(e);
      return fetched;
    }

  }
  // This will create a url to goto the images page in the browser
  String makePostURL(String id){
    return "${booru.baseURL}/post/$id";
  }
  // This will create a url for the http request
  String makeURL(String tags){
    return "${booru.baseURL}/api/posts/?offset=${pageNum*limit}&limit=${limit.toString()}&query=$tags";
    }

  }


