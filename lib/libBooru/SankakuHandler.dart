import 'dart:convert';
import 'package:LoliSnatcher/utilities/Logger.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'Booru.dart';
import 'BooruHandler.dart';
import 'BooruItem.dart';

class SankakuHandler extends BooruHandler{
  SankakuHandler(Booru booru,int limit) : super(booru,limit);
  bool tagSearchEnabled = true;
  String authToken = "";

  /**
   * This function will call a http get request using the tags and pagenumber parsed to it
   * it will then create a list of booruItems
   */

  //Tried stripping further but it breaks auth. Putting the auth stuff into the getHeaders function and overriding doesn't work
  // Overriding search having just the auth stuff then calling super.search also doesn't work
  Future Search(String tags, int? pageNumCustom) async{
    hasSizeData = true;
    int length = fetched.length;
    if (prevTags != tags){
      fetched.value = [];
    }
    String url = makeURL(tags);
    Logger.Inst().log(url, "SankakuHandler","Search", LogTypes.booruHandlerSearchURL);
    try {
      if(authToken == "" && booru.userID != "" && booru.apiKey != "") {
        authToken = await getAuthToken();
        Logger.Inst().log("Authtoken: $authToken", "SankakuHandler","Search", LogTypes.booruHandlerInfo);
      }
      Uri uri = Uri.parse(url);
      final response = await http.get(uri, headers: getHeaders());
      // 200 is the success http response code
      if (response.statusCode == 200) {
        prevTags = tags;
        parseResponse(response);
        if (fetched.length == length){locked.value = true;}
        return fetched;
      } else {
        Logger.Inst().log("Sankaku load fail ${response.statusCode}", "SankakuHandler","Search", LogTypes.booruHandlerInfo);
        Logger.Inst().log(response.body, "SankakuHandler","Search", LogTypes.booruHandlerInfo);
      }
    } catch(e) {
      Logger.Inst().log(e.toString(), "SankakuHandler","Search", LogTypes.exception);
      return fetched;
    }

  }
  @override
  void parseResponse(response) {
    List<dynamic> parsedResponse = jsonDecode(response.body);
    // Create a BooruItem for each post in the list
    for (int i = 0; i < parsedResponse.length; i++){
      var current = parsedResponse[i];
      Logger.Inst().log(current.toString(), "SankakuHandler", "parseResponse", LogTypes.booruHandlerRawFetched);
      List<String> tags = [];
      for (int x=0; x < current["tags"].length; x++) {
        tags.add(current["tags"][x]["name"].toString());
      }
      if (current["file_url"] != null) {
        String fileExt = current["file_type"].split("/")[1]; // image/jpeg
        fetched.add(BooruItem(
          fileURL: current["file_url"],
          sampleURL: current["sample_url"],
          thumbnailURL: current["preview_url"],
          tagsList: tags,
          postURL: makePostURL(current["id"].toString()),
          fileSize: current["file_size"],
          fileWidth: current["width"].toDouble(),
          fileHeight: current["height"].toDouble(),
          sampleWidth: current["sample_width"].toDouble(),
          sampleHeight: current["sample_height"].toDouble(),
          previewWidth: current["preview_width"].toDouble(),
          previewHeight: current["preview_height"].toDouble(),
          hasNotes: current["has_notes"],
          serverId: current["id"].toString(),
          rating: current["rating"],
          score: current["total_score"].toString(),
          sources: [current["source"] == null ? "" : current["source"]!],
          md5String: current["md5"],
          postDate: current['created_at']['s'].toString(), // unix time without in seconds (need to x1000?)
          postDateFormat: "unix",
        ));
        setTrackedValues(fetched.length - 1);
      }
    }
  }
  Future<List> updateFavourites(List<BooruItem> booruItems) async {
    if(authToken == "" && booru.userID != "" && booru.apiKey != "") {
      authToken = await getAuthToken();
    }
    for (int x = 0; x < booruItems.length; x ++){
      http.Response response = await http.get(Uri.parse(makeApiPostURL(booruItems[x].postURL.split("/").last)), headers: getHeaders());
      if (response.statusCode != 200){
        return [booruItems,false];
      } else {
        var current = jsonDecode(response.body);
        Logger.Inst().log(current.toString(), "SankakuHandler", "updateFavourites", LogTypes.booruHandlerRawFetched);
        if (current["file_url"] != null) {
          booruItems[x].fileURL = current["file_url"];
          booruItems[x].sampleURL = current["sample_url"];
          booruItems[x].thumbnailURL = current["preview_url"];
        }
      }
    }
    return [booruItems,true];
  }


  @override
  Map<String,String> getHeaders(){
    return authToken == ""
        ? {
      "Content-Type":"application/json",
      "Accept": "application/json",
      "user-agent":"Mozilla/5.0 (Linux x86_64; rv:86.0) Gecko/20100101 Firefox/86.0"
    }: {
      "Content-Type":"application/json",
      "Accept": "application/json",
      "Authorization": authToken,
      "user-agent":"Mozilla/5.0 (Linux x86_64; rv:86.0) Gecko/20100101 Firefox/86.0"
    };
  }
  // This will create a url to goto the images page in the browser
  String makePostURL(String id){
    return "https://chan.sankakucomplex.com/post/show/$id";
  }
  // This will create a url for the http request
  String makeURL(String tags){
    return "${booru.baseURL}/posts?tags=$tags&limit=${limit.toString()}&page=${pageNum.toString()}";
  }
  //Makes a url for a single post from the api
  String makeApiPostURL(String id){
    return "${booru.baseURL}/posts/$id";
  }
  // This will fetch authToken on the first load
  Future<String> getAuthToken() async {
    String token = "";
    Uri uri = Uri.parse("${booru.baseURL}/auth/token?lang=english");
    final response = await http.post(
      uri,
      headers: {"Content-Type": "application/json", "user-agent":"Mozilla/5.0 (Linux x86_64; rv:81.0) Gecko/20100101 Firefox/81.0"},
      body: jsonEncode({"login": booru.userID, "password": booru.apiKey}),
      encoding: Encoding.getByName("utf-8"),
    );

    if (response.statusCode == 200) {
      var parsedResponse = jsonDecode(response.body);
      if(parsedResponse["success"]) {
        Logger.Inst().log("Sankaku auth token loaded", "SankakuHandler","getAuthToken", LogTypes.booruHandlerInfo);
        token = "${parsedResponse["token_type"]} ${parsedResponse["access_token"]}";
      }
    }
    if(token == "") {
      Logger.Inst().log("Sankaku auth error", "SankakuHandler","getAuthToken", LogTypes.booruHandlerInfo);
      Logger.Inst().log(response.statusCode.toString(), "SankakuHandler","getAuthToken", LogTypes.booruHandlerInfo);
    }

    return token;
  }

  String makeTagURL(String input){
    return "${booru.baseURL}/tags?name=${input.toLowerCase()}&limit=10";
  }
  @override
  Future tagSearch(String input) async {
    List<String> searchTags = [];
    String url = makeTagURL(input);
    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri,headers: {"Accept": "application/json", "user-agent":"Mozilla/5.0 (Linux x86_64; rv:81.0) Gecko/20100101 Firefox/81.0"});
      // 200 is the success http response code
      if (response.statusCode == 200) {
        var parsedResponse = jsonDecode(response.body);
        if (parsedResponse.length > 0){
          for (int i=0; i < parsedResponse.length; i++){
            searchTags.add(parsedResponse[i]["name"]);
          }
        }
      }
    } catch(e) {
      Logger.Inst().log(e.toString(), "SankakuHandler","makeTagURL", LogTypes.exception);
    }
    return searchTags;
  }
  }


