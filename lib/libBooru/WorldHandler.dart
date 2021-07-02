import 'package:http/http.dart' as http;
import 'dart:async';
import 'BooruHandler.dart';
import 'BooruItem.dart';
import 'Booru.dart';
import 'dart:convert';
import 'package:LoliSnatcher/Tools.dart';
/**
 * Booru Handler for the World engine
 */
class WorldHandler extends BooruHandler{
  // Dart constructors are weird so it has to call super with the args
  WorldHandler(Booru booru,int limit) : super(booru,limit);

  @override
  String validateTags(tags){
    if(tags == " " || tags == ""){
      return "";
    } else {
      return tags;
    }
  }

  @override
  void parseResponse(response){
    Map<String, dynamic> parsedResponse = jsonDecode(response.body);
    var posts = parsedResponse['items'];
    // print(posts.length); // Limit doesn't work with this api
    // Create a BooruItem for each post in the list
    for (int i = 0; i < posts.length; i++){
      /**
       * Parse Data Object and Add a new BooruItem to the list
       */
      var current = posts.elementAt(i);
      List<dynamic> imageLinks = current['imageLinks'];

      bool isVideo = current['type'] == 1; //type 1 - video, type 0 - image
      String bestFile = imageLinks.where((f) => f["type"] == (isVideo ? 10 : 2)).toList()[0]["url"];
      String sampleImage = imageLinks.where((f) => f["type"] == 2).toList()[0]["url"]; // isVideo ? 2 : 5 ???
      String thumbImage = imageLinks.where((f) => f["type"] == 4).toList()[0]["url"];
      // Site generates links to RAW images, but they often lead to 404, override them
      // if(bestImage.contains('.raw.')) {
      //   bestIndex = 1;
      //   bestImage = imageLinks[bestIndex]['url'];
      // }

      // They mostly use cdn, but sometimes they aren't and it leads to same domain, this fixes such links
      bestFile = bestFile.startsWith('https') ? bestFile : (booru.baseURL! + bestFile);
      sampleImage = sampleImage.startsWith('https') ? sampleImage : (booru.baseURL! + sampleImage);
      thumbImage = thumbImage.startsWith('https') ? thumbImage : (booru.baseURL! + thumbImage);

      // Uses retarded tag scheme: "tag with multiple words|next tag", instead of "tag_with_multiple_words next_tag", convert their scheme to ours here
      List<String> originalTags = current['tags'] != null ? [...current['tags']] : [];
      var fixedTags = originalTags.map((tag) => tag.replaceAll(new RegExp(r' '), '_')).toList();

      String dateString = current['posted'].split('.')[0]; //split off microseconds // use posted or created?
      fetched.add(new BooruItem(
          fileURL: bestFile,
          sampleURL: sampleImage,
          thumbnailURL: thumbImage,
          tagsList: fixedTags,
          postURL: makePostURL(current['id'].toString()),
          serverId: current['id'].toString(),
          score: current['views'].toString(), // use views as score, people don't rate stuff here often
          sources: List<String>.from(current['sources'] ?? []),
          postDate: dateString, // 2021-06-18T06:09:02.63366 // microseconds?
          postDateFormat: "yyyy-MM-dd'T'hh:mm:ss"
      ));
      if(dbHandler!.db != null){
        setTrackedValues(fetched.length - 1);
      }
    }
  }
  // This will create a url to goto the images page in the browser
  String makePostURL(String id){
    return "${booru.baseURL}/post/$id";
  }

  // This will create a url for the http request
  String makeURL(String tags){
    // convert "tag_name_1 tag_name_2" to "tag name 1|tag name 2" and filter excluded tags out
    String includeTags = tags.split(' ').where((f) => !f.startsWith('-')).toList().map((tag) => tag.replaceAll(new RegExp(r'_'), '+')).toList().join('|');
    String excludeTags = tags.split(' ').where((f) => f.startsWith('-')).toList().map((tag) => tag.replaceAll(new RegExp(r'_'), '+').replaceAll(new RegExp(r'^-'), '')).toList().join('|');
    // ignores custom limits
    // 
    int skip = (pageNum * limit) < 0 ? 0 : pageNum * limit;
    return "${booru.baseURL}/api/post/Search?IncludeLinks=true&Tag=$includeTags&ExcludeTag=$excludeTags&OrderBy=0&Skip=${skip.toString()}&Take=${limit.toString()}&DisableTotal=false";
  }


  String makeTagURL(String input){
    return "${booru.baseURL}/api/tag/Search";
  }

  @override
  Future tagSearch(String input) async {
    List<String> searchTags = [];
    String url = makeTagURL('');

    // Don't search until at least 2 symbols are entered
    if(input.length > 1) {
      try {
        String requestBody = jsonEncode({
          "searchText": input.replaceAll(new RegExp(r'^-'), ''),
          "skip": 0,
          "take": 10, //limit
        });
        Uri uri = Uri.parse(url);
        final response = await http.post(uri, headers: getHeaders(), body: requestBody, encoding: Encoding.getByName("utf-8"));
        // 200 is the success http response code
        if (response.statusCode == 200) {
          List<dynamic> parsedResponse = jsonDecode(response.body)["items"];
          // print(parsedResponse);
          if (parsedResponse.length > 0) {
            for (int i=0; i < parsedResponse.length; i++){
              Map<String,dynamic> current = parsedResponse.elementAt(i);
              searchTags.add(current['value'].replaceAll(new RegExp(r' '), '_'));
            }
          }
        } else {
          print('Tag search error:' + response.statusCode.toString());
        }
      } catch(e) {
        print(e);
        return [];
      }
    }
    return searchTags;
  }

  void searchCount(String tags) async {
    int result = 0;
    String url = makeURL(tags);
    url = url.replaceAll(RegExp(r''), '');

    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri, headers: {"Accept": "application/xml",  "user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:83.0) Gecko/20100101 Firefox/83.0"});
      // 200 is the success http response code
      if (response.statusCode == 200) {
        Map<String, dynamic> parsedResponse = jsonDecode(response.body);
        result = parsedResponse['totalCount'];
      } else {
        print(response.statusCode);
      }
    } catch(e) {
      print(e);
    }
    this.totalCount = result;
  }
}