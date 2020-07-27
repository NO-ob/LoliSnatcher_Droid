import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'dart:async';
import 'BooruHandler.dart';
import 'BooruItem.dart';

/**
 * Booru Handler for the gelbooru engine
 */
class GelbooruHandler extends BooruHandler{
  List<BooruItem> fetched = new List();

  // Dart constructors are weird so it has to call super with the args
  GelbooruHandler(String baseURL,int limit) : super(baseURL,limit);

  /**
   * This function will call a http get request using the tags and pagenumber parsed to it
   * it will then create a list of booruItems
   */
  Future Search(String tags,int pageNum) async{
    this.pageNum = pageNum;
    if (prevTags != tags){
      fetched = new List();
    }
    String url = makeURL(tags);
    print(url);
    try {
      final response = await http.get(url,headers: {"Accept": "text/html,application/xml", "user-agent":"LoliSnatcher_Droid/1.2.0"});
      // 200 is the success http response code
      if (response.statusCode == 200) {
        var parsedResponse = xml.parse(response.body);
        /**
         * This creates a list of xml elements 'post' to extract only the post elements which contain
         * all the data needed about each image
         */
        var posts = parsedResponse.findAllElements('post');
        // Create a BooruItem for each post in the list
        for (int i =0; i < posts.length; i++){
          var current = posts.elementAt(i);
          /**
           * Add a new booruitem to the list .getAttribute will get the data assigned to a particular tag in the xml object
           */
          fetched.add(new BooruItem(current.getAttribute("file_url"),current.getAttribute("sample_url"),current.getAttribute("preview_url"),current.getAttribute("tags").split(" "),makePostURL(current.getAttribute("id"))));
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
      return "$baseURL/index.php?page=post&s=view&id=$id";
    }
    // This will create a url for the http request
    String makeURL(String tags){
      return "$baseURL/index.php?page=dapi&s=post&q=index&tags=$tags&limit=${limit.toString()}&pid=${pageNum.toString()}";
    }
}