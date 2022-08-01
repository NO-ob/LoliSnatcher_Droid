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
import 'package:lolisnatcher/src/utils/tools.dart';

class SankakuHandler extends BooruHandler {
  SankakuHandler(Booru booru, int limit) : super(booru, limit);

  String authToken = "";

  @override
  Map<String, TagType> tagTypeMap = {
    "8": TagType.meta,
    "3": TagType.copyright,
    "4": TagType.character,
    "1": TagType.artist,
    "0": TagType.none,
  };

  @override
  bool hasSizeData = true;

  @override
  bool hasCommentsSupport = true;

  @override
  bool hasNotesSupport = true;

  @override
  bool hasItemUpdateSupport = true;

  @override
  Future<dynamic> fetchSearch(Uri uri) async {
    try {
      if (authToken == "" && booru.userID != "" && booru.apiKey != "") {
        authToken = await getAuthToken();
        Logger.Inst().log("Got authtoken: $authToken", className, "fetchSearch", LogTypes.booruHandlerInfo);
      }
    } catch (e) {
      Logger.Inst().log("Failed to get authtoken: $e", className, "fetchSearch", LogTypes.booruHandlerInfo);
    }

    return http.get(uri, headers: getHeaders());
  }

  @override
  List parseListFromResponse(response) {
    List<dynamic> parsedResponse = jsonDecode(response.body);
    return parsedResponse;
  }

  @override
  BooruItem? parseItemFromResponse(responseItem, int index) {
    final dynamic current = responseItem;

    List<String> tags = [];
    Map<TagType, List<String>> tagMap = {};

    for (int x = 0; x < current["tags"].length; x++) {
      tags.add(current["tags"][x]["name"].toString());
      String typeStr = current["tags"][x]["type"].toString();
      TagType type = tagTypeMap[typeStr] ?? TagType.none;
      if (tagMap.containsKey(type)) {
        tagMap[type]?.add(current["tags"][x]["name"].toString());
      } else {
        tagMap[type] = [current["tags"][x]["name"].toString()];
      }
    }

    if (current["file_url"] != null) {
      for (int i = 0; i < tagMap.entries.length; i++) {
        addTagsWithType(tagMap.entries.elementAt(i).value, tagMap.entries.elementAt(i).key);
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

      return item;
    } else {
      return null;
    }
  }

  @override
  Future<List> loadItem(BooruItem item) async {
    try {
      if (authToken == "" && booru.userID != "" && booru.apiKey != "") {
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
  Map<String, String> getHeaders() {
    return authToken.isEmpty
        ? {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "User-Agent": Tools.browserUserAgent(),
            "Referer": "https://beta.sankakucomplex.com/",
            "Origin": "https://beta.sankakucomplex.com/"
          }
        : {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": authToken,
            "User-Agent": Tools.browserUserAgent(),
            "Referer": "https://beta.sankakucomplex.com/",
            "Origin": "https://beta.sankakucomplex.com/"
          };
  }

  @override
  String makePostURL(String id) {
    return "https://chan.sankakucomplex.com/post/show/$id";
  }

  @override
  String makeURL(String tags) {
    return "${booru.baseURL}/posts?tags=${tags.trim()}&limit=${limit.toString()}&page=${pageNum.toString()}";
  }

  String makeApiPostURL(String id) {
    return "${booru.baseURL}/posts/$id";
  }

  Future<String> getAuthToken() async {
    String token = "";
    Uri uri = Uri.parse("${booru.baseURL}/auth/token?lang=english");
    final response = await http.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "User-Agent": Tools.browserUserAgent(),
      },
      body: jsonEncode({"login": booru.userID, "password": booru.apiKey}),
      encoding: Encoding.getByName("utf-8"),
    );

    if (response.statusCode == 200) {
      var parsedResponse = jsonDecode(response.body);
      if (parsedResponse["success"]) {
        Logger.Inst().log("Sankaku auth token loaded", className, "getAuthToken", LogTypes.booruHandlerInfo);
        token = "${parsedResponse["token_type"]} ${parsedResponse["access_token"]}";
      }
    }
    if (token == "") {
      Logger.Inst().log("Sankaku auth error ${response.statusCode.toString()}", className, "getAuthToken", LogTypes.booruHandlerInfo);
    }

    return token;
  }

  @override
  String makeTagURL(String input) {
    return "${booru.baseURL}/tags?name=${input.toLowerCase()}&limit=10";
  }

  @override
  List parseTagSuggestionsList(response) {
    var parsedResponse = jsonDecode(response.body);
    return parsedResponse;
  }

  @override
  String? parseTagSuggestion(responseItem, int index) {
    final String tagStr = responseItem["name"] ?? "";
    if (tagStr.isEmpty) return null;

    // record tag data for future use
    final String rawTagType = responseItem["type"]?.toString() ?? "";
    TagType tagType = TagType.none;
    if (rawTagType.isNotEmpty && tagTypeMap.containsKey(rawTagType)) {
      tagType = (tagTypeMap[rawTagType] ?? TagType.none);
    }
    addTagsWithType([tagStr], tagType);
    return tagStr;
  }

  @override
  String makeCommentsURL(String postID, int pageNum) {
    // EXAMPLE: https://capi-v2.sankakucomplex.com/posts/25237881/comments
    // Possibly uses pages?
    return "${booru.baseURL}/posts/$postID/comments";
  }

  @override
  List parseCommentsList(response) {
    var parsedResponse = jsonDecode(response.body);
    return parsedResponse;
  }

  @override
  CommentItem? parseComment(responseItem, int index) {
    var current = responseItem;
    return CommentItem(
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
    );
  }


  @override
  String makeNotesURL(String postID) {
    return "${booru.baseURL}/posts/$postID/notes";
  }

  @override
  List parseNotesList(response) {
    var parsedResponse = jsonDecode(response.body);
    return parsedResponse;
  }

  @override
  NoteItem? parseNote(responseItem, int index) {
    var current = responseItem;
    return NoteItem(
      id: current["id"].toString(),
      postID: current["post_id"].toString(),
      content: current["body"].toString(),
      posX: current["x"] ?? 0,
      posY: current["y"] ?? 0,
      width: current["width"] ?? 0,
      height: current["height"] ?? 0,
    );
  }
}
