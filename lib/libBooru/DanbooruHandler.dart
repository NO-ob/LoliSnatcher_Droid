import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'dart:async';
import 'BooruHandler.dart';
import 'BooruItem.dart';
import 'Booru.dart';
import 'dart:convert';
import 'package:LoliSnatcher/Tools.dart';
/**
 * Booru Handler for the Danbooru engine
 */
class DanbooruHandler extends BooruHandler{
  // Dart constructors are weird so it has to call super with the args
  DanbooruHandler(Booru booru,int limit) : super(booru,limit);
  @override
  bool hasSizeData = true;

  @override
  void parseResponse(response){
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
        fetched.add(new BooruItem(
          fileURL: current.findElements("file-url").elementAt(0).text,
          sampleURL: current.findElements("large-file-url").elementAt(0).text,
          thumbnailURL: current.findElements("preview-file-url").elementAt(0).text,
          tagsList: current.findElements("tag-string").elementAt(0).text.split(" "),
          postURL: makePostURL(current.findElements("id").elementAt(0).text),
          fileExt: current.findElements("file-ext").elementAt(0).text,
          fileSize: int.tryParse(current.findElements("file-size").elementAt(0).text) ?? null,
          fileHeight: double.tryParse(current.findElements("image-height").elementAt(0).text) ?? null,
          fileWidth: double.tryParse(current.findElements("image-width").elementAt(0).text) ?? null,
          serverId: current.findElements("id").elementAt(0).text,
          rating: current.findElements("rating").elementAt(0).text,
          score: current.findElements("score").elementAt(0).text,
          sources: [current.findElements("source").elementAt(0).text],
          md5String: current.findElements("md5").elementAt(0).text,
          postDate: current.findElements("created-at").elementAt(0).text, // 2021-06-17T16:27:45-04:00
          postDateFormat: "yyyy-MM-dd'T'HH:mm:ss", // when timezone support added: "yyyy-MM-dd'T'HH:mm:ssZ",
        ));
        if(dbHandler!.db != null){
          setTrackedValues(fetched.length - 1);
        }
      }
    }
  }

  // This will create a url to goto the images page in the browser
  String makePostURL(String id){
    return "${booru.baseURL}/posts/$id";
  }
  String makeURL(String tags){
    if (booru.apiKey == ""){
      return "${booru.baseURL}/posts.xml?tags=$tags&limit=${limit.toString()}&page=${pageNum.toString()}";
    } else {
      return "${booru.baseURL}/posts.xml?login=${booru.userID}&api_key=${booru.apiKey}&tags=$tags&limit=${limit.toString()}&page=${pageNum.toString()}";
    }

  }
  String makeTagURL(String input){
    return "${booru.baseURL}/tags.json?search[name_matches]=$input*&limit=10";
  }
  @override
  Future tagSearch(String input) async {
    List<String> searchTags = [];
    String url = makeTagURL(input);
    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri,headers: getHeaders());
      // 200 is the success http response code
      if (response.statusCode == 200) {
        List<dynamic> parsedResponse = jsonDecode(response.body);
        if (parsedResponse.length > 0){
          for (int i=0; i < parsedResponse.length; i++){
            searchTags.add(parsedResponse[i]['name']);
          }
        }
      }
    } catch(e) {
      print(e);
    }
    print(searchTags.length);
    return searchTags;
  }
}