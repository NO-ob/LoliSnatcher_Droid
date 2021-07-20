import 'Booru.dart';
import 'BooruItem.dart';
import 'DBHandler.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
abstract class BooruHandler {
  // pagenum = -1 as "didn't load anything yet" state
  // gets set to higher number for special cases in handler factory
  int pageNum = -1; 
  int limit = 20;
  String prevTags = "";
  bool locked = false;
  Booru booru;
  String verStr = "1.8.2";
  List<BooruItem> fetched = [];
  bool tagSearchEnabled = true;
  bool hasSizeData = false;
  bool isActive = false;
  DBHandler? dbHandler;
  BooruHandler(this.booru,this.limit);
  /**
   * This function will call a http get request using the tags and pagenumber parsed to it
   * it will then create a list of booruItems
   */
  Future Search(String tags, int pageNum) async{
    tags = validateTags(tags);
    this.pageNum = pageNum;
    if (prevTags != tags){
      fetched = [];
    }

    String? url = makeURL(tags);
    print(url);

    try {
      int length = fetched.length;
      Uri uri = Uri.parse(url!);
      final response = await http.get(uri,headers: getHeaders());
      if (response.statusCode == 200) {
        parseResponse(response);
        prevTags = tags;
        if (fetched.length == length){locked = true;}
        return fetched;
      } else {
        print("BooruHandler status is: ${response.statusCode}");
        print("BooruHandler url is: $url");
      }
    } catch(e) {
      print(e);
      return fetched;
    }
  }

  void parseResponse(response){}
  String validateTags(String tags){return tags;}
  String? makePostURL(String id){}
  String? makeURL(String tags){}
  String? makeTagURL(String input){}
  tagSearch(String input) {}

  int totalCount = 0;
  void searchCount(String input) {
    this.totalCount = 0;
  }
  Map<String,String> getWebHeaders() {
      return {"Accept": "text/html,application/xml,application/json", "user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:83.0) Gecko/20100101 Firefox/83.0"};
  }
  Map<String,String> getHeaders(){
    return {"Accept": "text/html,application/xml,application/json", "user-agent":"LoliSnatcher_Droid/$verStr"};
  }
  String getDescription() {
    return '';
  }

  List<String> searchModifiers() {
    return [];
  }
  void setupMerge(List<Booru> boorus){}
  //set the isSnatched and isFavourite booleans for a BooruItem in fetched
  Future setTrackedValues(int fetchedIndex) async{
    if (dbHandler!.db != null){
      List<bool> values = await dbHandler!.getTrackedValues(fetched[fetchedIndex].fileURL);
      fetched[fetchedIndex].isSnatched = values[0];
      fetched[fetchedIndex].isFavourite = values[1];
    }
  }
}