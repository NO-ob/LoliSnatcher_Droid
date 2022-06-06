import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/comment_item.dart';
import 'package:lolisnatcher/src/data/note_item.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/utils/logger.dart';

class SankakuHandler extends BooruHandler{
  SankakuHandler(Booru booru,int limit) : super(booru,limit);

  @override
  Map<String, TagType> tagTypeMap = {
    "8": TagType.meta,
    "3": TagType.copyright,
    "4": TagType.character,
    "1": TagType.artist,
    "0": TagType.none
  };

  @override
  String className = 'SankakuHandler';

  String authToken = "";

  @override
  bool hasSizeData = true;

  @override
  bool hasCommentsSupport = true;

  @override
  bool hasItemUpdateSupport = true;

  /// This function will call a http get request using the tags and pagenumber parsed to it
  /// it will then create a list of booruItems

  //Tried stripping further but it breaks auth. Putting the auth stuff into the getHeaders function and overriding doesn't work
  // Overriding search having just the auth stuff then calling super.search also doesn't work
  @override
  Future Search(String tags, int? pageNumCustom) async {
    int length = fetched.length;
    if (prevTags != tags){
      fetched.value = [];
    }
    String url = makeURL(tags);
    Logger.Inst().log(url, className, "Search", LogTypes.booruHandlerSearchURL);
    try {
      if(authToken == "" && booru.userID != "" && booru.apiKey != "") {
        authToken = await getAuthToken();
        Logger.Inst().log("Authtoken: $authToken", className, "Search", LogTypes.booruHandlerInfo);
      }
      Uri uri = Uri.parse(url);
      final response = await http.get(uri, headers: getHeaders());
      // 200 is the success http response code
      if (response.statusCode == 200) {
        prevTags = tags;
        parseResponse(response);
        if (fetched.length == length) {
          locked = true;
        }
      } else {
        Logger.Inst().log("Sankaku load fail ${response.statusCode}", className, "Search", LogTypes.booruHandlerInfo);
        Logger.Inst().log(response.body, className, "Search", LogTypes.booruHandlerInfo);
        errorString = response.statusCode.toString();
      }
    } catch(e) {
      Logger.Inst().log(e.toString(), className, "Search", LogTypes.exception);
      errorString = e.toString();
    }

    return fetched;
  }

  @override
  void parseResponse(response) {
    List<dynamic> parsedResponse = jsonDecode(response.body);

    // Create a BooruItem for each post in the list
    List<BooruItem> newItems = [];
    for (int i = 0; i < parsedResponse.length; i++) {
      var current = parsedResponse[i];
      Logger.Inst().log(current.toString(), className, "parseResponse", LogTypes.booruHandlerRawFetched);
      List<String> tags = [];
      Map<TagType, List<String>> tagMap = {};
      for (int x=0; x < current["tags"].length; x++) {
        tags.add(current["tags"][x]["name"].toString());
        String typeStr = current["tags"][x]["type"].toString();
        TagType type = tagTypeMap[typeStr] ?? TagType.none;
        if (tagMap.containsKey(type)){
          tagMap[type]?.add(current["tags"][x]["name"].toString());
        } else {
          tagMap[type] = [current["tags"][x]["name"].toString()];
        }
      }

      if (current["file_url"] != null) {
        for(int i = 0; i < tagMap.entries.length; i++){
          addTagsWithType(tagMap.entries.elementAt(i).value,tagMap.entries.elementAt(i).key);
        }
        // String fileExt = current["file_type"].split("/")[1]; // image/jpeg
        BooruItem item = BooruItem(
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
          hasComments: current["has_comments"],
          serverId: current["id"].toString(),
          rating: current["rating"],
          score: current["total_score"].toString(),
          sources: [current["source"] == null ? "" : current["source"]!],
          md5String: current["md5"],
          postDate: current['created_at']['s'].toString(), // unix time without in seconds (need to x1000?)
          postDateFormat: "unix",
        );

        newItems.add(item);
      }
    }

    int lengthBefore = fetched.length;
    fetched.addAll(newItems);
    setMultipleTrackedValues(lengthBefore, fetched.length);
  }

  @override
  Future<List> updateItem(BooruItem item) async {
    try {
      if(authToken == "" && booru.userID != "" && booru.apiKey != "") {
        authToken = await getAuthToken();
      }
      http.Response response = await http.get(Uri.parse(makeApiPostURL(item.postURL.split("/").last)), headers: getHeaders());
      if (response.statusCode != 200) {
        return [item, false, 'Invalid status code ${response.statusCode}'];
      } else {
        var current = jsonDecode(response.body);
        Logger.Inst().log(current.toString(), className, "updateFavourite", LogTypes.booruHandlerRawFetched);
        if (current["file_url"] != null) {
          item.fileURL = current["file_url"];
          item.sampleURL = current["sample_url"];
          item.thumbnailURL = current["preview_url"];
        }
      }
    } catch (e) {
      return [item, false, e.toString()];
    }
    return [item, true, null];
  }


  @override
  Map<String,String> getHeaders() {
    return authToken.isEmpty
        ? {
          "Content-Type":"application/json",
          "Accept": "application/json",
          "user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0",
          "Referer" : "https://beta.sankakucomplex.com/",
          "Origin" : "https://beta.sankakucomplex.com/"
        }
        : {
          "Content-Type":"application/json",
          "Accept": "application/json",
          "Authorization": authToken,
          "user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0",
          "Referer" : "https://beta.sankakucomplex.com/",
          "Origin" : "https://beta.sankakucomplex.com/"
        };
  }

  // This will create a url to goto the images page in the browser
  @override
  String makePostURL(String id){
    return "https://chan.sankakucomplex.com/post/show/$id";
  }

  // This will create a url for the http request
  @override
  String makeURL(String tags){
    return "${booru.baseURL}/posts?tags=${tags.trim()}&limit=${limit.toString()}&page=${pageNum.toString()}";
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
      body: jsonEncode({
        "login": booru.userID,
        "password": booru.apiKey
      }),
      encoding: Encoding.getByName("utf-8"),
    );

    if (response.statusCode == 200) {
      var parsedResponse = jsonDecode(response.body);
      if(parsedResponse["success"]) {
        Logger.Inst().log("Sankaku auth token loaded", className,"getAuthToken", LogTypes.booruHandlerInfo);
        token = "${parsedResponse["token_type"]} ${parsedResponse["access_token"]}";
      }
    }
    if(token == "") {
      Logger.Inst().log("Sankaku auth error ${response.statusCode.toString()}", className,"getAuthToken", LogTypes.booruHandlerInfo);
    }

    return token;
  }

  @override
  String makeTagURL(String input){
    return "${booru.baseURL}/tags?name=${input.toLowerCase()}&limit=10";
  }

  @override
  Future tagSearch(String input) async {
    List<String> searchTags = [];
    String url = makeTagURL(input);
    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri, headers: getHeaders());
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
      Logger.Inst().log(e.toString(), className,"makeTagURL", LogTypes.exception);
    }
    return searchTags;
  }

  // Example: https://capi-v2.sankakucomplex.com/posts/25237881/comments
  // Possibly uses pages?
  @override
  Future<List<CommentItem>> fetchComments(String postID, int pageNum) async {
    List<CommentItem> comments = [];
    String url = "${booru.baseURL}/posts/$postID/comments";

    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri, headers: getHeaders());
      // 200 is the success http response code
      if (response.statusCode == 200) {
        var parsedResponse = jsonDecode(response.body);
        var commentsJson = parsedResponse;
        if (commentsJson.length > 0){
          for (int i=0; i < commentsJson.length; i++){
            var current = commentsJson.elementAt(i);
            comments.add(CommentItem(
              id: current["id"].toString(),
              title: current["post_id"].toString(),
              content: current["body"].toString(),
              authorID: current["author"]["id"].toString(),
              authorName: current["author"]["name"].toString(),
              avatarUrl: current["author"]["avatar"].toString(),
              score: current["score"] ?? 0,
              postID: current["post_id"].toString(),
              createDate: current['created_at'].toString(), // unix time without in seconds (need to x1000?)
              createDateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
            ));
          }
        }
      }
    } catch(e) {
      Logger.Inst().log(e.toString(), className, "fetchComments", LogTypes.exception);
    }
    return comments;
  }

  @override
  bool hasNotesSupport = true;
  
  @override
  Future<List<NoteItem>> fetchNotes(String postID) async {
    List<NoteItem> notes = [];
    String url = "${booru.baseURL}/posts/$postID/notes";

    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri, headers: getHeaders());
      // 200 is the success http response code
      if (response.statusCode == 200) {
        var parsedResponse = jsonDecode(response.body);
        var notesJson = parsedResponse;
        if (notesJson.length > 0) {
          for (int i=0; i < notesJson.length; i++){
            var current = notesJson.elementAt(i);
            notes.add(NoteItem(
              id: current["id"].toString(),
              postID: current["post_id"].toString(),
              content: current["body"].toString(),
              posX: current["x"] ?? 0,
              posY: current["y"] ?? 0,
              width: current["width"] ?? 0,
              height: current["height"] ?? 0,
            ));
          }
        }
      }
    } catch(e) {
      Logger.Inst().log(e.toString(), className, "fetchNotes", LogTypes.exception);
    }
    return notes;
  }
}


