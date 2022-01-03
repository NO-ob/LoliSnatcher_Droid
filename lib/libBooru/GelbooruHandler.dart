import 'dart:convert';
import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

import 'package:LoliSnatcher/libBooru/BooruHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/libBooru/CommentItem.dart';
import 'package:LoliSnatcher/libBooru/NoteItem.dart';
import 'package:LoliSnatcher/utilities/Logger.dart';

/**
 * Booru Handler for the gelbooru engine
 */
class GelbooruHandler extends BooruHandler {
  // Dart constructors are weird so it has to call super with the args
  GelbooruHandler(Booru booru, int limit) : super(booru, limit);

  @override
  String className = "GelbooruHandler";

  @override
  bool hasSizeData = true;

  @override
  Map<String, String> getHeaders() {
    return {
      "Accept": "text/html,application/xml,application/json",
      "user-agent": "LoliSnatcher_Droid/$verStr",
      "Cookie": "fringeBenefits=yup;" // unlocks restricted content (but it's probably not necessary)
    };
  }

  @override
  void parseResponse(response) {
    var parsedResponse = jsonDecode(response.body);
    var posts = response.body.contains("@attributes") ? parsedResponse["post"] : parsedResponse; // gelbooru: { post: [...] }, others [post, ...]
    List<BooruItem> newItems = [];

    for (int i = 0; i < posts.length; i++) {
      var current = posts.elementAt(i);
      try {
        if (current["file_url"] != null) {
          // Fix for bleachbooru
          String fileURL = "", sampleURL = "", previewURL = "";
          fileURL += current["file_url"]!.toString();
          // sample url is optional, on gelbooru there is sample == 0/1 to tell if it exists
          sampleURL += current["sample_url"]?.toString() ?? current["file_url"]!.toString();
          previewURL += current["preview_url"]!.toString();
          if (!fileURL.contains("http")) {
            fileURL = booru.baseURL! + fileURL;
            sampleURL = booru.baseURL! + sampleURL;
            previewURL = booru.baseURL! + previewURL;
          }
          BooruItem item = BooruItem(
            fileURL: fileURL,
            sampleURL: sampleURL,
            thumbnailURL: previewURL,
            tagsList: current["tags"].split(" "),
            postURL: makePostURL(current["id"]!.toString()),
            fileWidth: double.tryParse(current["width"]?.toString() ?? '') ?? null,
            fileHeight: double.tryParse(current["height"]?.toString() ?? '') ?? null,
            sampleWidth: double.tryParse(current["sample_width"]?.toString() ?? '') ?? null,
            sampleHeight: double.tryParse(current["sample_height"]?.toString() ?? '') ?? null,
            previewWidth: double.tryParse(current["preview_width"]?.toString() ?? '') ?? null,
            previewHeight: double.tryParse(current["preview_height"]?.toString() ?? '') ?? null,
            hasNotes: current["has_notes"]?.toString() == 'true',
            // TODO rule34xxx api bug? sometimes (mostly when there is only one comment) api returns empty array
            hasComments: current["has_comments"]?.toString() == 'true',
            serverId: current["id"]?.toString(),
            rating: current["rating"]?.toString(),
            score: current["score"]?.toString(),
            // sources: [current["source"]!],
            md5String: current["md5"]?.toString(),
            postDate: current["created_at"]?.toString(), // Fri Jun 18 02:13:45 -0500 2021
            postDateFormat: "EEE MMM dd HH:mm:ss  yyyy", // when timezone support added: "EEE MMM dd HH:mm:ss Z yyyy",
          );

          // New way - in batches
          newItems.add(item);

          // Old way - one by one
          // fetched.add(item);
          // setTrackedValues(fetched.length - 1);
        }
      } catch (e) {
        Logger.Inst().log(e.toString(), className, "parseResponse", LogTypes.exception);
      }
    }

    // write to fetched and get items fav data in bulk
    int lengthBefore = fetched.length;
    fetched.addAll(newItems);
    setMultipleTrackedValues(lengthBefore, fetched.length);
  }

  // This will create a url to goto the images page in the browser
  @override
  String makePostURL(String id) {
    return "${booru.baseURL}/index.php?page=post&s=view&id=$id";
  }

  // This will create a url for the http request
  @override
  String makeURL(String tags) {
    int cappedPage = max(0, pageNum.value); // needed because searchCount happens before first page increment
    if (booru.apiKey == "") {
      return "${booru.baseURL}/index.php?page=dapi&s=post&q=index&tags=${tags.replaceAll(" ", "+")}&limit=${limit.toString()}&pid=${cappedPage.toString()}&json=1";
    } else {
      return "${booru.baseURL}/index.php?api_key=${booru.apiKey}&user_id=${booru.userID}&page=dapi&s=post&q=index&tags=${tags.replaceAll(" ", "+")}&limit=${limit.toString()}&pid=${cappedPage.toString()}&json=1";
    }
  }

  @override
  String makeTagURL(String input) {
    if (booru.baseURL!.contains("rule34.xxx")) {
      return "${booru.baseURL}/autocomplete.php?q=$input"; // doesn't allow limit, but sorts by popularity
    } else {
      return "${booru.baseURL}/index.php?page=dapi&s=tag&q=index&name_pattern=$input%&limit=10";
    }
  }

  @override
  Future tagSearch(String input) async {
    List<String> searchTags = [];
    String url = makeTagURL(input);
    try {
      if (booru.baseURL!.contains("rule34.xxx")) {
        Uri uri = Uri.parse(url);
        final response = await http.get(uri, headers: {"Accept": "application/json", "user-agent": "LoliSnatcher_Droid/$verStr"});
        // 200 is the success http response code
        if (response.statusCode == 200) {
          var parsedResponse = jsonDecode(response.body);
          if (parsedResponse.length > 0) {
            for (int i = 0; i < parsedResponse.length; i++) {
              searchTags.add(parsedResponse.elementAt(i)["value"]);
            }
          }
        }
      } else {
        Uri uri = Uri.parse(url);
        final response = await http.get(uri, headers: {"Accept": "text/html,application/xml", "user-agent": "LoliSnatcher_Droid/$verStr"});
        // 200 is the success http response code
        if (response.statusCode == 200) {
          var parsedResponse = XmlDocument.parse(response.body);
          var tags = parsedResponse.findAllElements("tag");
          if (tags.length > 0) {
            for (int i = 0; i < tags.length; i++) {
              searchTags.add(tags.elementAt(i).getAttribute("name")!.trim());
            }
          }
        }
      }
    } catch (e) {
      Logger.Inst().log(e.toString(), className, "tagSearch", LogTypes.exception);
    }
    return searchTags;
  }

  @override
  Future<void> searchCount(String input) async {
    int result = 0;
    String url = makeURL(input);
    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri, headers: getHeaders());
      // 200 is the success http response code
      if (response.statusCode == 200) {
        var parsedResponse = XmlDocument.parse(response.body);
        var root = parsedResponse.findAllElements('posts').toList();
        if (root.length == 1) {
          result = int.parse(root[0].getAttribute('count') ?? '0');
        }
      }
    } catch (e) {
      Logger.Inst().log(e.toString(), className, "searchCount", LogTypes.exception);
    }
    totalCount.value = result;
    return;
  }

  @override
  bool hasCommentsSupport = true;

  @override
  Future<List<CommentItem>> fetchComments(String postID, int pageNum) async {
    List<CommentItem> comments = [];
    String url = "${booru.baseURL}/index.php?page=dapi&s=comment&q=index&post_id=$postID";

    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri, headers: {"Accept": "application/json", "user-agent": "LoliSnatcher_Droid/$verStr"});
      // 200 is the success http response code
      if (response.statusCode == 200) {
        var parsedResponse = XmlDocument.parse(response.body);
        var commentsXML = parsedResponse.findAllElements("comment");
        if (commentsXML.length > 0) {
          for (int i = 0; i < commentsXML.length; i++) {
            var current = commentsXML.elementAt(i);
            comments.add(CommentItem(
              id: current.getAttribute("id"),
              title: current.getAttribute("id"),
              content: current.getAttribute("body"),
              authorID: current.getAttribute("creator_id"),
              authorName: current.getAttribute("creator"),
              postID: current.getAttribute("post_id"),
              // TODO broken on rule34xxx? returns current time
              createDate: current.getAttribute("created_at"), // 2021-11-15 12:09
              createDateFormat: "yyyy-MM-dd HH:mm",
            ));
          }
        }
      }
    } catch (e) {
      Logger.Inst().log(e.toString(), className, "fetchComments", LogTypes.exception);
    }
    return comments;
  }

  @override
  bool hasNotesSupport = true;

  @override
  Future<List<NoteItem>> fetchNotes(String postID) async {
    List<NoteItem> notes = [];
    String url = "${booru.baseURL}/index.php?page=dapi&s=note&q=index&post_id=$postID";

    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri, headers: {"Accept": "application/json", "user-agent": "LoliSnatcher_Droid/$verStr"});
      // 200 is the success http response code
      if (response.statusCode == 200) {
        var parsedResponse = XmlDocument.parse(response.body);
        var notesXML = parsedResponse.findAllElements("note");
        if (notesXML.length > 0) {
          for (int i = 0; i < notesXML.length; i++) {
            var current = notesXML.elementAt(i);
            notes.add(NoteItem(
              id: current.getAttribute("id"),
              postID: current.getAttribute("post_id"),
              content: current.getAttribute("body"),
              posX: int.tryParse(current.getAttribute("x") ?? '0') ?? 0,
              posY: int.tryParse(current.getAttribute("y") ?? '0') ?? 0,
              width: int.tryParse(current.getAttribute("width") ?? '0') ?? 0,
              height: int.tryParse(current.getAttribute("height") ?? '0') ?? 0,
            ));
          }
        }
      }
    } catch (e) {
      Logger.Inst().log(e.toString(), className, "fetchNotes", LogTypes.exception);
    }
    return notes;
  }
}
