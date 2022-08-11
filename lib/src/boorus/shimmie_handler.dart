import 'package:html/parser.dart';
import 'package:xml/xml.dart' as xml;

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/comment_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/utils/logger.dart';

class ShimmieHandler extends BooruHandler {
  ShimmieHandler(Booru booru, int limit) : super(booru, limit);

  @override
  bool hasSizeData = true;

  @override
  String validateTags(tags) {
    if (tags == " " || tags == "") {
      return "*";
    } else {
      return tags;
    }
  }

  @override
  List parseListFromResponse(response) {
    var parsedResponse = xml.XmlDocument.parse(response.body);
    try {
      parseSearchCount(parsedResponse);
    } catch (e) {
      Logger.Inst().log("Error parsing search count: $e", className, 'parseListFromResponse::parseSearchCount', LogTypes.exception);
    }
    /**
     * This creates a list of xml elements 'post' to extract only the post elements which contain
     * all the data needed about each image
     */
    List posts = parsedResponse.findAllElements('post').toList();
    if (posts.isEmpty) {
      posts = parsedResponse.findAllElements('tag').toList();
    }
    return posts;
  }

  @override
  BooruItem? parseItemFromResponse(responseItem, int index) {
    var current = responseItem;
    if (current.getAttribute("file_url") != null) {
      String preURL = '';
      if (booru.baseURL!.contains("https://whyneko.com/booru")) {
        // special case for whyneko
        preURL = booru.baseURL!.split("/booru")[0];
      }

      String dateString = current.getAttribute("date").toString();
      BooruItem item = BooruItem(
        fileURL: preURL + current.getAttribute("file_url")!,
        sampleURL: preURL + current.getAttribute("file_url")!,
        thumbnailURL: preURL + current.getAttribute("preview_url")!,
        tagsList: current.getAttribute("tags")!.split(" "),
        postURL: makePostURL(current.getAttribute("id")!),
        fileWidth: double.tryParse(current.getAttribute('width') ?? ''),
        fileHeight: double.tryParse(current.getAttribute('height') ?? ''),
        previewWidth: double.tryParse(current.getAttribute('preview_width') ?? ''),
        previewHeight: double.tryParse(current.getAttribute('preview_height') ?? ''),
        serverId: current.getAttribute("id"),
        score: current.getAttribute("score"),
        sources: [current.getAttribute("source") ?? ''],
        md5String: current.getAttribute("md5"),
        postDate: dateString.substring(0, dateString.length - 3), // 2021-06-18 04:37:31.471007 // microseconds?
        postDateFormat: 'yyyy-MM-dd HH:mm:ss.SSSSSS',
      );

      return item;
    } else {
      return null;
    }
  }

  void parseSearchCount(xml.XmlDocument response) {
    var parsedResponse = response.findAllElements('posts').toList()[0];
    int? count = int.tryParse(parsedResponse.getAttribute('count') ?? '0') ?? 0;
    totalCount.value = count;
  }

  @override
  String makePostURL(String id) {
    return "${booru.baseURL}/post/view/$id";
  }

  @override
  String makeURL(String tags) {
    return "${booru.baseURL}/api/danbooru/find_posts/index.xml?tags=$tags&limit=${limit.toString()}&page=${pageNum.toString()}";
  }

  @override
  String makeTagURL(String input) {
    if (booru.baseURL!.contains("rule34.paheal.net")) {
      return "${booru.baseURL}/api/internal/autocomplete?s=$input"; // doesn't allow limit, but sorts by popularity
    } else {
      // TODO others don't support / don't have the parser?
      return '';
      return "${booru.baseURL}/tags.json?search[name_matches]=$input*&limit=10";
    }
  }

  @override
  List parseTagSuggestionsList(response) {
    // TODO explain why this
    return response.body.substring(1, (response.body.length - 1)).replaceAll(RegExp('(:.([0-9])+)'), "").replaceAll("\"", "").split(",");
  }

  @override
  String? parseTagSuggestion(responseItem, int index) {
    // all manipulations were already done in list parse
    return responseItem;
  }

  @override
  bool hasCommentsSupport = true;

  @override
  String makeCommentsURL(String postID, int pageNum) {
    return makePostURL(postID);
  }

  @override
  List parseCommentsList(response) {
    var document = parse(response.body);
    return document.querySelectorAll(".comment:not(.comment_add)");
  }

  @override
  CommentItem? parseComment(responseItem, int index) {
    var current = responseItem;
    return CommentItem(
      id: current.attributes["id"],
      // title: postID,
      content: current.nodes[current.nodes.length - 1].text.toString().replaceFirst(': ', '').replaceFirst('\n\t\t\t\t', ''),
      authorName: current.querySelector('.username')?.text.toString(),
      // postID: postID,
      createDate: current.querySelector('time')?.attributes["datetime"]?.split('+')[0].toString(), // 2021-12-25t10:02:28+00:00
      createDateFormat: "yyyy-MM-dd't'HH:mm:ss'Z'",
    );
  }
}
