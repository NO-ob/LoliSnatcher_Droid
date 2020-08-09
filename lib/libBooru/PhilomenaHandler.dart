import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'BooruHandler.dart';
import 'BooruItem.dart';

class PhilomenaHandler extends BooruHandler{
  List<BooruItem> fetched = new List();
  PhilomenaHandler(String baseURL,int limit) : super(baseURL,limit);

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
      final response = await http.get(url,headers: {"Accept": "text/html,application/xml,application/json", "user-agent":"LoliSnatcher_Droid/1.2.0"});
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
          fetched.add(new BooruItem(current['representations']['full'],current['representations']['medium'],current['representations']['thumb_small'],current['tags'],makePostURL(current['id'].toString())));

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
    return "$baseURL/images/$id";
  }
  // This will create a url for the http request
  String makeURL(String tags){
    //https://derpibooru.org/api/v1/json/search/images?q=solo&per_page=20&page=1
    return "$baseURL/api/v1/json/search/images?q="+tags.replaceAll(" ", ",")+"&per_page=${limit.toString()}&page=${pageNum.toString()}";
  }
}

