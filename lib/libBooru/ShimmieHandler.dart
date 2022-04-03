import 'dart:async';

import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

import 'package:LoliSnatcher/libBooru/BooruHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/libBooru/CommentItem.dart';
import 'package:LoliSnatcher/utilities/Logger.dart';

/**
 * Booru Handler for the Shimmie engine
 */
class ShimmieHandler extends BooruHandler{
  // Dart constructors are weird so it has to call super with the args
  ShimmieHandler(Booru booru,int limit) : super(booru,limit);

  @override
  bool tagSearchEnabled = false;

  @override
  bool hasSizeData = true;

  @override
  String validateTags(tags){
    if(tags == " " || tags == ""){
      return "*";
    } else {
      return tags;
    }
  }

  @override
  Map<String,String> getHeaders() {
    return {
      "Accept": "text/html,application/xml,application/json",
      "user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:83.0) Gecko/20100101 Firefox/83.0"
    };
  }

  @override
  void parseResponse(response){
    var parsedResponse = xml.parse(response.body);
    /**
     * This creates a list of xml elements 'post' to extract only the post elements which contain
     * all the data needed about each image
     */
    var posts = parsedResponse.findAllElements('post');
    if (posts.length < 1){
      posts = parsedResponse.findAllElements('tag');
    }

    // Create a BooruItem for each post in the list
    List<BooruItem> newItems = [];
    for (int i =0; i < posts.length; i++) {
      var current = posts.elementAt(i);
      Logger.Inst().log(current.toXmlString(), "ShimmieHandler", "parseResponse", LogTypes.booruHandlerRawFetched);
      /**
       * Add a new booruitem to the list .getAttribute will get the data assigned to a particular tag in the xml object
       */
      if (current.getAttribute("file_url") != null) {
        String preURL = '';
        if (booru.baseURL!.contains("https://whyneko.com/booru")){
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
            fileWidth: double.tryParse(current.getAttribute('width') ?? '') ?? null,
            fileHeight: double.tryParse(current.getAttribute('height') ?? '') ?? null,
            previewWidth: double.tryParse(current.getAttribute('preview_width') ?? '') ?? null,
            previewHeight: double.tryParse(current.getAttribute('preview_height') ?? '') ?? null,
            serverId: current.getAttribute("id"),
            score: current.getAttribute("score"),
            sources: [current.getAttribute("source") ?? ''],
            md5String: current.getAttribute("md5"),
            postDate: dateString.substring(0, dateString.length-3), // 2021-06-18 04:37:31.471007 // microseconds?
            postDateFormat: 'yyyy-MM-dd HH:mm:ss.SSSSSS'
        );

        newItems.add(item);
      }
    }

    int lengthBefore = fetched.length;
    fetched.addAll(newItems);
    setMultipleTrackedValues(lengthBefore, fetched.length);
  }

  // This will create a url to goto the images page in the browser
  @override
  String makePostURL(String id){
    return "${booru.baseURL}/post/view/$id";
  }

  // This will create a url for the http request
  @override
  String makeURL(String tags){
    return "${booru.baseURL}/api/danbooru/find_posts/index.xml?tags=$tags&limit=${limit.toString()}&page=${pageNum.toString()}";
  }

  @override
  String makeTagURL(String input){
    if (booru.baseURL!.contains("rule34.paheal.net")){
      tagSearchEnabled = true;
      return "${booru.baseURL}/api/internal/autocomplete?s=$input"; // doesn't allow limit, but sorts by popularity
    } else {
      return "${booru.baseURL}/tags.json?search[name_matches]=$input*&limit=10";
    }
  }

  @override
  Future tagSearch(String input) async {
    List<String> searchTags = [];
    String url = makeTagURL(input);
    Logger.Inst().log("shimmie tag search $input $url", "ShimmieHandler", "tagSearch", LogTypes.booruHandlerInfo);
    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri, headers: getHeaders());
      // 200 is the success http response code
      if (response.statusCode == 200) {
        searchTags = response.body.substring(1,(response.body.length - 1)).replaceAll(RegExp('(\:.([0-9])+)'), "").replaceAll("\"", "").split(",");
      }
    } catch(e) {
      Logger.Inst().log(e.toString(), "ShimmieHandler", "tagSearch", LogTypes.exception);
    }
    return searchTags;
  }

  @override
  Future<void> searchCount(String input) async {
    int result = 0;
    if (booru.baseURL!.contains("rule34.paheal.net") && input != ''){ // paheal limits any search to 500 pages => empty input returns wrong count
      String url = makeURL(input);
      try {
        Uri uri = Uri.parse(url);
        final response = await http.get(uri, headers: getHeaders());
        // 200 is the success http response code
        if (response.statusCode == 200) {
          var parsedResponse = xml.parse(response.body);
          var root = parsedResponse.findAllElements('posts').toList();
          if(root.length == 1) {
            result = int.parse(root[0].getAttribute('count') ?? '0');
          }
        }
      } catch(e) {
        Logger.Inst().log(e.toString(), "ShimmieHandler", "searchCount", LogTypes.booruHandlerInfo);
      }
    }
    totalCount.value = result;
    return;
  }

  @override
  bool hasCommentsSupport = true;

  @override
  Future<List<CommentItem>> fetchComments(String postID, int pageNum) async {
    List<CommentItem> comments = [];
    String url = makePostURL(postID);

    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri,headers: getHeaders());
      // 200 is the success http response code
      if (response.statusCode == 200) {
        var document = parse(response.body);
        var spans = document.querySelectorAll(".comment:not(.comment_add)");
        if (spans.length > 0) {
          for (int i=0; i < spans.length; i++){
            var current = spans.elementAt(i);
            comments.add(CommentItem(
              id: current.attributes["id"],
              title: postID,
              content: current.nodes[current.nodes.length - 1].text.toString().replaceFirst(': ', '').replaceFirst('\n\t\t\t\t', ''),
              authorName: current.querySelector('.username')?.text.toString(),
              postID: postID,
              createDate: current.querySelector('time')?.attributes["datetime"]?.split('+')[0].toString(), // 2021-12-25t10:02:28+00:00
              createDateFormat: "yyyy-MM-dd't'HH:mm:ss'Z'",
            ));
          }
        }
      }
    } catch(e) {
      Logger.Inst().log(e.toString(), className, "fetchComments", LogTypes.exception);
    }
    return comments;
  }
}