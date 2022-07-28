import 'dart:convert';
import 'dart:math';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:xml/xml.dart';

import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/comment_item.dart';
import 'package:lolisnatcher/src/data/note_item.dart';
import 'package:lolisnatcher/src/data/tag.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/utils/logger.dart';

class GelbooruHandler extends BooruHandler {
  GelbooruHandler(Booru booru, int limit) : super(booru, limit);

  @override
  bool hasSizeData = true;

  @override
  Map<String, TagType> tagTypeMap = {
    "5": TagType.meta,
    "3": TagType.copyright,
    "4": TagType.character,
    "1": TagType.artist,
    "0": TagType.none,
  };

  @override
  Map<String, String> getHeaders() {
    return {
      "Accept": "text/html,application/xml,application/json",
      "user-agent": Tools.appUserAgent(),
      "Cookie": "fringeBenefits=yup;" // unlocks restricted content (but it's probably not necessary)
    };
  }

  @override
  String validateTags(String tags) {
    if (tags.toLowerCase().contains('rating:safe')) {
      tags = tags.toLowerCase().replaceAll('rating:safe', 'rating:general');
    }
    return tags;
  }

  @override
  List parseListFromResponse(response) {
    var parsedResponse;
    try {
      parsedResponse = jsonDecode(response.body);
    } catch(e) {
      // gelbooru returns xml response if request was denied for some reason
      // i.e. user hit a rate limit because he didn't include api key
      parsedResponse = XmlDocument.parse(response.body) ;
      String? errorMessage = (parsedResponse as XmlDocument).getElement('response')?.getAttribute('reason')?.toString();
      if (errorMessage != null) {
        throw Exception(errorMessage);
      }
    }

    try {
      parseSearchCount(parsedResponse);
    } catch (e) {
      Logger.Inst().log("Error parsing search count: $e", className, 'parseListFromResponse::parseSearchCount', LogTypes.exception);
    }

    return (parsedResponse["post"] ?? []) as List;
  }

  @override
  BooruItem? parseItemFromResponse(responseItem, int index) {
    var current = responseItem;

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
        // parseFragment to parse html elements (i.e. &amp; => &)
        tagsList: parseFragment(current["tags"]).text?.split(" ") ?? [],
        postURL: makePostURL(current["id"]!.toString()),
        fileWidth: double.tryParse(current["width"]?.toString() ?? ''),
        fileHeight: double.tryParse(current["height"]?.toString() ?? ''),
        sampleWidth: double.tryParse(current["sample_width"]?.toString() ?? ''),
        sampleHeight: double.tryParse(current["sample_height"]?.toString() ?? ''),
        previewWidth: double.tryParse(current["preview_width"]?.toString() ?? ''),
        previewHeight: double.tryParse(current["preview_height"]?.toString() ?? ''),
        hasNotes: current["has_notes"]?.toString() == 'true',
        hasComments: current["has_comments"]?.toString() == 'true',
        serverId: current["id"]?.toString(),
        rating: current["rating"]?.toString(),
        score: current["score"]?.toString(),
        sources: (current["source"].runtimeType == String) ? [current["source"]!] : null,
        md5String: current["md5"]?.toString(),
        postDate: current["created_at"]?.toString(), // Fri Jun 18 02:13:45 -0500 2021
        postDateFormat: "EEE MMM dd HH:mm:ss  yyyy", // when timezone support added: "EEE MMM dd HH:mm:ss Z yyyy",
      );

      return item;
    }
    return null;
  }

  @override
  void afterParseResponse(List<BooruItem> newItems) {
    int lengthBefore = fetched.length;
    fetched.addAll(newItems);
    populateTagHandler(newItems); // difference from default afterParse
    setMultipleTrackedValues(lengthBefore, fetched.length);
  }

  @override
  String makePostURL(String id) {
    // EXAMPLE: https://gelbooru.com/index.php?page=post&s=view&id=7296350
    return "${booru.baseURL}/index.php?page=post&s=view&id=$id";
  }

  @override
  String makeURL(String tags) {
    // EXAMPLE: https://gelbooru.com/index.php?page=dapi&s=post&q=index&tags=rating:general%20order:score&limit=20&pid=0&json=1
    int cappedPage = max(0, pageNum);
    String apiKey = (booru.apiKey?.isNotEmpty ?? false) ? '&api_key=${booru.apiKey}' : '';
    String userId = (booru.userID?.isNotEmpty ?? false) ? '&user_id=${booru.userID}' : '';

    return "${booru.baseURL}/index.php?page=dapi&s=post&q=index&tags=${tags.replaceAll(" ", "+")}&limit=${limit.toString()}&pid=${cappedPage.toString()}&json=1$apiKey$userId";
  }

  // ----------------- Tag suggestions and tag handler stuff

  @override
  String makeTagURL(String input) {
    // EXAMPLE https://gelbooru.com/index.php?page=dapi&s=tag&q=index&name_pattern=nagat%25&limit=10&json=1
    String apiKey = (booru.apiKey?.isNotEmpty ?? false) ? '&api_key=${booru.apiKey}' : '';
    String userId = (booru.userID?.isNotEmpty ?? false) ? '&user_id=${booru.userID}' : '';
    return "${booru.baseURL}/index.php?page=dapi&s=tag&q=index&name_pattern=$input%&limit=10&json=1$apiKey$userId";
  }

  @override
  List parseTagSuggestionsList(response) {
    var parsedResponse = jsonDecode(response.body)["tag"] ?? [];
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
  String makeDirectTagURL(List<String> tags) {
    String apiKey = (booru.apiKey?.isNotEmpty ?? false) ? '&api_key=${booru.apiKey}' : '';
    String userId = (booru.userID?.isNotEmpty ?? false) ? '&user_id=${booru.userID}' : '';
    return "${booru.baseURL}/index.php?page=dapi&s=tag&q=index&names=${tags.join(" ")}&limit=500&json=1$apiKey$userId";
  }

  @override
  Future<List<Tag>> genTagObjects(List<String> tags) async {
    List<Tag> tagObjects = [];
    Logger.Inst().log("Got tag list: $tags", className, "genTagObjects", LogTypes.booruHandlerTagInfo);
    String url = makeDirectTagURL(tags);
    Logger.Inst().log("DirectTagURL: $url", className, "genTagObjects", LogTypes.booruHandlerTagInfo);
    Uri uri = Uri.parse(url);
    try {
      final response = await http.get(uri, headers: {"Accept": "application/json", "user-agent": Tools.appUserAgent()});
      // 200 is the success http response code
      if (response.statusCode == 200) {
        var parsedResponse = (jsonDecode(response.body)["tag"]) ?? [];
        if (parsedResponse?.isNotEmpty ?? false) {
          Logger.Inst().log("Tag response length: ${parsedResponse.length},Tag list length: ${tags.length}", className, "genTagObjects",
              LogTypes.booruHandlerTagInfo);
          for (int i = 0; i < parsedResponse.length; i++) {
            String fullString = parseFragment(parsedResponse.elementAt(i)["name"]).text!;
            String typeKey = parsedResponse.elementAt(i)["type"].toString();
            TagType tagType = TagType.none;
            if (tagTypeMap.containsKey(typeKey)) tagType = (tagTypeMap[typeKey] ?? TagType.none);
            if (fullString.isNotEmpty) {
              tagObjects.add(Tag(fullString, tagType: tagType));
            }
          }
        }
      }
    } catch (e) {
      Logger.Inst().log(e.toString(), className, "tagSearch", LogTypes.exception);
    }
    return tagObjects;
  }

  // ----------------- Search count

  void parseSearchCount(response) {
    var parsedResponse = response["@attributes"]["count"] ?? 0;
    totalCount.value = parsedResponse;
  }

  // ----------------- Comments

  @override
  bool hasCommentsSupport = true;

  @override
  String makeCommentsURL(String postID, int pageNum) {
    // EXAMPLE: https://gelbooru.com/index.php?page=dapi&s=comment&q=index&post_id=7296350
    String apiKey = (booru.apiKey?.isNotEmpty ?? false) ? '&api_key=${booru.apiKey}' : '';
    String userId = (booru.userID?.isNotEmpty ?? false) ? '&user_id=${booru.userID}' : '';
    return "${booru.baseURL}/index.php?page=dapi&s=comment&q=index&post_id=$postID$apiKey$userId";
  }

  @override
  List parseCommentsList(response) {
    var parsedResponse = XmlDocument.parse(response.body);
    return parsedResponse.findAllElements("comment").toList();
  }

  @override
  CommentItem? parseComment(responseItem, int index) {
    var current = responseItem;
    String? avatar = current.getAttribute("creator_id")!.isEmpty
        ? "${booru.baseURL}/user_avatars/avatar_${current.getAttribute("creator")}.jpg"
        : "${booru.baseURL}/user_avatars/honkonymous.png";

    return CommentItem(
      id: current.getAttribute("id"),
      title: current.getAttribute("id"),
      content: current.getAttribute("body"),
      authorID: current.getAttribute("creator_id"),
      authorName: current.getAttribute("creator"),
      postID: current.getAttribute("post_id"),
      avatarUrl: avatar,
      createDate: current.getAttribute("created_at"), // 2021-11-15 12:09
      createDateFormat: "yyyy-MM-dd HH:mm",
    );
  }

  // ----------------- Notes

  @override
  bool hasNotesSupport = true;

  @override
  String makeNotesURL(String postID) {
    // EXAMPLE: https://gelbooru.com/index.php?page=dapi&s=note&q=index&post_id=6512262
    String apiKey = (booru.apiKey?.isNotEmpty ?? false) ? '&api_key=${booru.apiKey}' : '';
    String userId = (booru.userID?.isNotEmpty ?? false) ? '&user_id=${booru.userID}' : '';
    return "${booru.baseURL}/index.php?page=dapi&s=note&q=index&post_id=$postID$apiKey$userId";
  }

  @override
  List parseNotesList(response) {
    var parsedResponse = XmlDocument.parse(response.body);
    return parsedResponse.findAllElements("note").toList();
  }

  @override
  NoteItem? parseNote(responseItem, int index) {
    var current = responseItem;
    return NoteItem(
      id: current.getAttribute("id"),
      postID: current.getAttribute("post_id"),
      content: current.getAttribute("body"),
      posX: int.tryParse(current.getAttribute("x") ?? '0') ?? 0,
      posY: int.tryParse(current.getAttribute("y") ?? '0') ?? 0,
      width: int.tryParse(current.getAttribute("width") ?? '0') ?? 0,
      height: int.tryParse(current.getAttribute("height") ?? '0') ?? 0,
    );
  }
}
