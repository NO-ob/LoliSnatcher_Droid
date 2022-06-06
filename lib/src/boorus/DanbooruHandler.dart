import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:LoliSnatcher/src/handlers/booru_handler.dart';
import 'package:LoliSnatcher/src/data/BooruItem.dart';
import 'package:LoliSnatcher/src/data/Booru.dart';
import 'package:LoliSnatcher/src/data/CommentItem.dart';
import 'package:LoliSnatcher/src/data/Tag.dart';
import 'package:LoliSnatcher/src/utils/logger.dart';

/// Booru Handler for the Danbooru engine
class DanbooruHandler extends BooruHandler{
  // Dart constructors are weird so it has to call super with the args
  DanbooruHandler(Booru booru,int limit) : super(booru,limit);
  @override
  bool hasSizeData = true;

  @override
  bool hasCommentsSupport = true;

  @override
  void parseResponse(response) {
    var parsedResponse = jsonDecode(response.body);
    var posts = parsedResponse;

    // Create a BooruItem for each post in the list
    List<BooruItem> newItems = [];

    for (int i = 0; i < posts.length; i++) {
      try {
        var current = posts.elementAt(i);
        Logger.Inst().log(current.toString(), "DanbooruHandler", "parseResponse", LogTypes.booruHandlerRawFetched);
        /**
         * This check is needed as danbooru will return items which have been banned or deleted and will not have any image urls
         * to go with the rest of the data so cannot be displayed and are pointless for the app
         */
        if (current.containsKey("file_url")){
          if ((current["file_url"].length > 0)) {
            addTagsWithType(current['tag_string_general'].toString().split(" "),TagType.none);
            addTagsWithType(current['tag_string_character'].toString().split(" "),TagType.character);
            addTagsWithType(current['tag_string_copyright'].toString().split(" "),TagType.copyright);
            addTagsWithType(current['tag_string_artist'].toString().split(" "),TagType.artist);
            addTagsWithType(current['tag_string_meta'].toString().split(" "),TagType.meta);
            BooruItem item = BooruItem(
              fileURL: current["file_url"].toString().endsWith(".zip") ? current["large_file_url"].toString() : current["file_url"].toString(),
              sampleURL: current["large_file_url"].toString(),
              thumbnailURL: current["preview_file_url"].toString(),
              tagsList: current["tag_string"].toString().split(" "),
              postURL: makePostURL(current["id"].toString()),
              fileSize: int.tryParse(current["file_size"].toString()),
              fileHeight: double.tryParse(current["image_height"].toString()),
              fileWidth: double.tryParse(current["image_width"].toString()),
              hasNotes: current["last_noted_at"] != null,
              hasComments: current["last_commented_at"] != null,
              serverId: current["id"].toString(),
              rating: current["rating"].toString(),
              score: current["score"].toString(),
              sources: [current["source"].toString()],
              md5String: current["md5"].toString(),
              postDate: current["created_at"].toString(), // 2021-06-17T16:27:45-04:00
              postDateFormat: "yyyy-MM-dd'T'HH:mm:ss", // when timezone support added: "yyyy-MM-dd'T'HH:mm:ssZ",
            );

            newItems.add(item);
          }
        } else {
          Logger.Inst().log("Item #$i has no file url", "DanbooruHandler", "parseResponse", LogTypes.booruHandlerInfo);
        }
      } catch (e){
        Logger.Inst().log("Exception during fetch $e", "DanbooruHandler", "parseResponse", LogTypes.booruHandlerFetchFailed);
      }
    }
    int lengthBefore = fetched.length;
    fetched.addAll(newItems);
    setMultipleTrackedValues(lengthBefore, fetched.length);
  }

  // This will create a url to goto the images page in the browser
  @override
  String makePostURL(String id){
    return "${booru.baseURL}/posts/$id";
  }

  @override
  String makeURL(String tags){
    if (booru.apiKey == ""){
      return "${booru.baseURL}/posts.json?tags=$tags&limit=${limit.toString()}&page=${pageNum.toString()}";
    } else {
      return "${booru.baseURL}/posts.json?login=${booru.userID}&api_key=${booru.apiKey}&tags=$tags&limit=${limit.toString()}&page=${pageNum.toString()}";
    }

  }

  @override
  String makeTagURL(String input){
    return "${booru.baseURL}/tags.json?search[name_matches]=$input*&limit=10&order=count";
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
        if (parsedResponse.isNotEmpty){
          for (int i=0; i < parsedResponse.length; i++){
            searchTags.add(parsedResponse[i]['name']);
          }
        }
      }
    } catch(e) {
      Logger.Inst().log(e.toString(), "DanbooruHandler", "tagSearch", LogTypes.exception);
    }
    return searchTags;
  }

  @override
  Future<List<CommentItem>> fetchComments(String postID, int pageNum) async {
    List<CommentItem> comments = [];
    String url = "${booru.baseURL}/comments.json?search[post_id]=$postID&group_by=comment&only=id,created_at,post_id,creator,body,score";

    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri,headers: getHeaders());
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
              authorID: current["creator"]["id"].toString(),
              authorName: current["creator"]["name"].toString(),
              score: current["score"],
              postID: current["post_id"].toString(),
              createDate: current['created_at'].toString(), // 2021-11-29T01:42:28.351-05:00
              createDateFormat: "yyyy-MM-dd'T'HH:mm:ss",
            ));
          }
        }
      }
    } catch(e) {
      Logger.Inst().log(e.toString(), "DanbooruHandler", "fetchComments", LogTypes.exception);
    }
    return comments;
  }
}