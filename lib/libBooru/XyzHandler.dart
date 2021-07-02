import 'package:http/http.dart' as http;
import 'dart:async';
import 'BooruHandler.dart';
import 'BooruItem.dart';
import 'Booru.dart';
import 'dart:convert';
import 'package:LoliSnatcher/Tools.dart';
/**
 * Booru Handler for the Xyz engine
 */
class XyzHandler extends BooruHandler{
  // Dart constructors are weird so it has to call super with the args
  XyzHandler(Booru booru,int limit) : super(booru,limit);

  /**
   * This function will call a http get request using the tags and pagenumber parsed to it
   * it will then create a list of booruItems
   */
  @override
  Future Search(String tags,int pageNum) async{
    int length = fetched.length;
    bool loadTags = false;
    if(tags == " " || tags == ""){
      tags="";
    }
    if(tags.contains('with_tags')) {
      tags = tags.replaceAll('with_tags', '');
      loadTags = true;
    }
    if(booru.apiKey == ""){
      booru.apiKey = null;
    }
    // if(this.pageNum == pageNum){
    //   return fetched;
    // }
    this.pageNum = pageNum;
    if (prevTags != tags){
      fetched = [];
    }
    String url = makeURL(tags);
    print(url);

    try {
      final includeTags = await makeTagsArray(tags, false);
      final excludeTags = await makeTagsArray(tags, true);

      String requestBody = jsonEncode({
        "calculateCount": true,
        "userId": booru.apiKey ?? "",
        "page": pageNum,
        "pageSize": 30, //limit, // ignores custom limits
        "orderBy": 0,
        "searchIn": 0,
        "searchPostExt": 0,
        "tags": includeTags,
        "exceptTags": excludeTags
      });
      // print(requestBody);
      Uri uri = Uri.parse(url);
      final response = await http.post(uri, headers: getWebHeaders(), body: requestBody, encoding: Encoding.getByName("utf-8"));
      // 200 is the success http response code
      if (response.statusCode == 200) {
        Map<String, dynamic> parsedResponse = jsonDecode(response.body);
        if(parsedResponse['isSuccess']) {
          var posts = parsedResponse['object']['posts'];
          // print(posts.length); // Limit doesn't work with this api
          // Create a BooruItem for each post in the list
          for (int i = 0; i < posts.length; i++){
            /**
           * Parse Data Object and Add a new BooruItem to the list
           */
            var current = posts.elementAt(i);
            String imageUrl = current['imageUrl'];

            // create thumbnail link from image url
            String thumbnailUrl = imageUrl;
            // Split imageUrl to add /thumbnail/
            List<String> splitUrl = imageUrl.split('/');
            splitUrl.insert(2, 'thumbnail');
            // Replace file extension in case of gif/video...
            List<String> fileNameAndExt = splitUrl[splitUrl.length-1].split('.');
            fileNameAndExt[1] = 'jpg';
            splitUrl[splitUrl.length-1] = fileNameAndExt.join('.');
            thumbnailUrl = booru.baseURL! + splitUrl.join('/');

            ////////////////////////////////////////////////////////
            List<String> imageTags = loadTags ? await getPostInfo(current['id']) : []; // TODO Find a better way
            ////////////////////////////////////////////////////////

            fetched.add(new BooruItem(
              fileURL: booru.baseURL! + imageUrl,
              sampleURL: thumbnailUrl,
              thumbnailURL: thumbnailUrl,
              tagsList: imageTags,
              postURL: makePostURL(current['id'].toString()),
            ));
            if(dbHandler!.db != null){
              setTrackedValues(fetched.length - 1);
            }
          }
          prevTags = tags;
          if (fetched.length == length){locked = true;}
          isActive = false;
          return fetched;
        } else {
          print(parsedResponse);
        }
      } else {
        print(response.statusCode);
      }
    } catch(e) {
      print(e);
      isActive = false;
      return fetched;
    }

  }
  // This will create a url to goto the images page in the browser
  String makePostURL(String id){
    return "${booru.baseURL}/post/$id";
  }
  // This will create a url for the http request
  String makeURL(String tags){
    return "${booru.baseURL}/api/post";
  }
  // This will create tags arrays for POST request
  // If exclude == false - get all tags without "-" at the start, if true - get tags WITH "-" at the start
  // Requires some quite stupid tag info fetching, because post fetching requires tags in format {id: x, type: x, value: x, count:x}, which I can't get in any other way
  Future makeTagsArray(String tags, bool exclude) async{
    List<String> splitTags = tags.split(' ');
    List<dynamic> filteredTags = [];
    List<dynamic> fetchedTags = [];
    if(tags != "") {
      if (exclude) {
        filteredTags = splitTags.where((f) => f.startsWith('-')).toList();
      } else {
        filteredTags = splitTags.where((f) => !f.startsWith('-')).toList();
      }
    }

    if(filteredTags.length > 0) {
      try {
        for (int i = 0; i < filteredTags.length; i++){
          String current = filteredTags.elementAt(i).replaceAll(new RegExp(r'^-'), '');
          Map<String,String> requestBody = {"text": current};
          Uri uri = Uri.parse(makeTagURL(''));
          final response = await http.post(uri, headers: {
            "Accept": "application/json",
            "user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:83.0) Gecko/20100101 Firefox/83.0"
          }, body: requestBody);
          // 200 is the success http response code
          if (response.statusCode == 200) {
            List<dynamic> parsedResponse = jsonDecode(response.body);
              var relatedTags = parsedResponse;
              // print(parsedResponse);
              var exactTag = relatedTags.firstWhere((tag) => tag['value'] == current.toLowerCase(), orElse: () => null);
              if(exactTag != null) {
                fetchedTags.add(exactTag);
              }
          } else {
            print('Tag match error:' + response.statusCode.toString());
          }
        }
      } catch(e) {
        print(e);
        return [];
      }
    }
    print(fetchedTags);
    return fetchedTags;
  }

  // Fetch post data for tags, because main fetch doesn't have them (rate limit guarantee)
  Future getPostInfo(int postId) async{
    List<dynamic> fetchedTags = [];
    try {
      Uri uri = Uri.parse('${booru.baseURL}/api/post/GetModel?id=$postId');
      final response = await http.get(uri, headers: {
        "Accept": "application/json",
        "user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:83.0) Gecko/20100101 Firefox/83.0"
      });
      // 200 is the success http response code
      if (response.statusCode == 200) {
        var parsedResponse = jsonDecode(response.body);
        fetchedTags = parsedResponse['object']['post']['tags'].map((tag) => tag['value']).toList();
      } else {
        print('Tag match error:' + response.statusCode.toString());
      }
    } catch(e) {
      print(e);
      return [];
    }
    // print(fetchedTags);
    return fetchedTags;
  }


  String makeTagURL(String input){
    return "${booru.baseURL}/api/tag/Find";
  }

  @override
  Future tagSearch(String input) async {
    List<String> searchTags = [];
    String url = makeTagURL('');

    // Don't search until at least 2 symbols are entered
    if(input.length > 1) {
      try {
        Map<String,String> requestBody = {"text": input};
        Uri uri = Uri.parse(url);
        final response = await http.post(uri, headers: getWebHeaders(), body: requestBody);
        // 200 is the success http response code
        if (response.statusCode == 200) {
          List<dynamic> parsedResponse = jsonDecode(response.body);
          if (parsedResponse.length > 0){
            for (int i=0; i < parsedResponse.length; i++){
              var current = parsedResponse.elementAt(i);
              searchTags.add(current['value']);
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
}