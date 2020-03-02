import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:xml/xml.dart' as xml;
import 'package:xml2json/xml2json.dart';
import 'dart:async';
import 'BooruHandler.dart';
import 'BooruItem.dart';
class DanbooruHandler extends BooruHandler{
  List<BooruItem> fetched = new List();

  // Dart constructors are weird so it has to call super with the args
  DanbooruHandler(String baseURL,int limit) : super(baseURL,limit);


  Future Search(String tags) async{
    String url = makeURL(tags);
    print(url);
    final response = await http.get(url,headers: {"Accept": "text/html,application/xml", "user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36"});
    if (response.statusCode == 200) {
      var parsedResponse = xml.parse(response.body);
      var posts = parsedResponse.findAllElements('post');
      // Create a BooruItem for each post in the list
      for (int i =0; i < posts.length; i++){
        var current = posts.elementAt(i);
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
              .text, current
              .findElements("id")
              .elementAt(0)
              .text));
        }
      }
      print("REturning");
      return fetched;
    } else {
      throw Exception('Search Failed');
    }
  }
  String makeURL(String tags){
    return baseURL + "/posts.xml?tags=" + tags + "&limit=" + limit.toString();
  }
}