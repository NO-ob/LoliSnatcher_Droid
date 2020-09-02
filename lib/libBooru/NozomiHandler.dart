import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'dart:async';
import 'BooruHandler.dart';
import 'BooruItem.dart';
import 'Booru.dart';
/**
 * Booru Handler for Nozomi.la
 */
class NozomiHandler extends BooruHandler{
  List<BooruItem> fetched = new List();

  // Dart constructors are weird so it has to call super with the args
  NozomiHandler(Booru booru,int limit) : super(booru,limit);

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
      final response = await http.get(url,headers: {"Accept": "text/html,application/xml",  "user-agent":"LoliSnatcher_Droid/1.3.0"});
      // 200 is the success http response code
      if (response.statusCode == 200) {
        print(response.body.toString());
        RegExp exp = new RegExp("(?<=\/post\/)([0-9]+)(?=\.html)");
        Iterable<RegExpMatch> matches = exp.allMatches(response.body);
        if (matches.length > 0){
          for (int i = 0; i < matches.length; i++){
            print(matches.elementAt(i));
          }
        }
      }
    } catch(e) {
      print(e);
      return fetched;
    }

  }
  // This will create a url to goto the images page in the browser
  String makePostURL(String id){
    //return "$baseURL/post/$id.html";
  }
  // This will create a url for the http request
  String makeURL(String tags){
    //return "$baseURL/search.html?q=$tags#${pageNum.toString()}";
  }
}