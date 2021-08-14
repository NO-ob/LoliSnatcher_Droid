import 'package:LoliSnatcher/utilities/Logger.dart';
import 'dart:async';
import 'BooruHandler.dart';
import 'BooruItem.dart';
import 'Booru.dart';
import 'dart:convert';

/**
 * Booru Handler for the r34hentai engine
 */
class R34HentaiHandler extends BooruHandler{
  // Dart constructors are weird so it has to call super with the args
  R34HentaiHandler(Booru booru,int limit) : super(booru,limit);
  bool tagSearchEnabled = false;

  @override
  Future Search(String tags, int? pageNumCustom) async{
    if(booru.apiKey == ""){
      booru.apiKey = null;
    }
    return super.Search(tags, pageNumCustom);
  }

  @override
  Map<String,String> getHeaders(){
    return {"Accept": "application/json", 'Cookie': '${booru.apiKey};', "user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:83.0) Gecko/20100101 Firefox/83.0"};
  }

  @override
  String validateTags(tags){
    if(tags == " " || tags == ""){
      return "";
    } else {
      return tags;
    }
  }

  @override
  void parseResponse(response) {
    List<dynamic> parsedResponse = jsonDecode(response.body);
    var posts = parsedResponse; // Limit doesn't work with this api
    // Create a BooruItem for each post in the list
    for (int i = 0; i < posts.length; i++){
      /**
       * Parse Data Object and Add a new BooruItem to the list
       */
      var current = posts.elementAt(i);
      Logger.Inst().log(current.toString(), "R34HentaiHandler","parseResponse", LogTypes.booruHandlerRawFetched);
      String imageUrl = current['file_url'];
      String sampleUrl = current['sample_url'];
      String thumbnailUrl = current['preview_url'];

      fetched.add(BooruItem(
        fileURL: imageUrl,
        sampleURL: sampleUrl,
        thumbnailURL: thumbnailUrl,
        tagsList: current['tags'].split(' '),
        postURL: makePostURL(current['id'].toString()),
      ));
      setTrackedValues(fetched.length - 1);
    }
    return;
  }
  // This will create a url to goto the images page in the browser
  String makePostURL(String id){
    return "${booru.baseURL}/post/view/$id";
  }
  // This will create a url for the http request
  String makeURL(String tags){
    return "${booru.baseURL}/post/index.json?limit=$limit&page=$pageNum&tags=$tags";
  }

  String getDescription() {
    return '---------------------\n\nTo view restricted content you need a session token:\n-Paste this into your browser\'s address bar when on the desired site and logged in:\n\njavascript:let cs=document.cookie.split(\'; \');let user=cs.find(c=>c.startsWith(\'shm_user\'));let token=cs.find(c=>c.startsWith(\'shm_session\'));prompt(\'\', user + \'; \' + token);\n\n-Copy the prompt contents into apiKey field\n(example: shm_user=xxx; shm_session=xxx;)\n\n[Note]: The "javascript:" part of the script is often truncated by the browser when pasting. Use the script as bookmarklet to bypass this behavior.\n\n---------------------';
  }


  String makeTagURL(String input){
    return "${booru.baseURL}/api/tag/Find";
  }
  //No api documentation on finding tags
  @override
  Future tagSearch(String input) async {
    List<String> searchTags = [];
    // String url = makeTagURL('');

    // // Don't search until at least 2 symbols are entered
    // if(input.length > 1) { 
    //   try {
    //     Map<String,String> requestBody = {"text": input.replaceAll(RegExp(r'^-'), '')};
    //     final response = await http.post(url, headers: {
    //       "Accept": "application/json",
    //       "user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:83.0) Gecko/20100101 Firefox/83.0"
    //     }, body: requestBody);
    //     // 200 is the success http response code
    //     if (response.statusCode == 200) {
    //       List<dynamic> parsedResponse = jsonDecode(response.body);
    //       if (parsedResponse.length > 0){
    //         for (int i=0; i < parsedResponse.length; i++){
    //           var current = parsedResponse.elementAt(i);
    //           searchTags.add(current['value']);
    //         }
    //       }
    //     } else {
    //       print('Tag search error:' + response.statusCode.toString());
    //     }
    //   } catch(e) {
    //     print(e);
    //     return [];
    //   }
    // }
    return searchTags;
  }
}