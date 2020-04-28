import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'dart:async';
import 'BooruHandler.dart';
import 'BooruItem.dart';

/**
 * Booru Handler for the Danbooru engine
 */
class DanbooruHandler extends BooruHandler{
  List<BooruItem> fetched = new List();

  // Dart constructors are weird so it has to call super with the args
  DanbooruHandler(String baseURL,int limit) : super(baseURL,limit);

  /**
   * This function will call a http get request using the tags and pagenumber parsed to it
   * it will then create a list of booruItems
   */
  Future Search(String tags, int pageNum) async{
    String url = makeURL(tags);
    this.pageNum = pageNum;
    if (prevTags != tags){
      fetched = new List();
    }
    print(url);
    try {
      final response = await http.get(url, headers: {
        "Accept": "text/html,application/xml",
        "user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36"
      });
      if (response.statusCode == 200) {
        var parsedResponse = xml.parse(response.body);
        var posts = parsedResponse.findAllElements('post');
        // Create a BooruItem for each post in the list
        for (int i = 0; i < posts.length; i++) {
          var current = posts.elementAt(i);
          /**
           * This check is needed as danbooru will return items which have been banned or deleted and will not have any image urls
           * to go with the rest of the data so cannot be displayed and are pointless for the app
           */
          if ((current.findElements("file-url").length > 0)) {
            fetched.add(new BooruItem(current
                .findElements("file-url")
                .elementAt(0)
                .text, current
                .findElements("large-file-url")
                .elementAt(0)
                .text, current
                .findElements("preview-file-url")
                .elementAt(0)
                .text, current
                .findElements("tag-string")
                .elementAt(0)
                .text, makePostURL(current
                .findElements("id")
                .elementAt(0)
                .text)));
          }
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
    return "$baseURL/posts/$id";
  }
  String makeURL(String tags){
    return "$baseURL/posts.xml?tags=$tags&limit=${limit.toString()}&page=${pageNum.toString()}";
  }
}