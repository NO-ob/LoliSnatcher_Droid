import 'dart:math';

import 'package:xml/xml.dart';
import 'package:http/http.dart' as http;

import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/libBooru/GelbooruHandler.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/utilities/Logger.dart';

/**
 * Booru Handler for the gelbooru engine only difference do gelbooru is the search/api url all the returned data is the same
 */
class MoebooruHandler extends GelbooruHandler {
  MoebooruHandler(Booru booru, int limit) : super(booru, limit);

  @override
  String className = 'MoebooruHandler';

  // TODO change to json
  // can probably use the same method as gelbooru when the individual BooruItem is moved to separate method
  @override
  void parseResponse(response) {
    var parsedResponse = XmlDocument.parse(response.body);
    /**
     * This creates a list of xml elements 'post' to extract only the post elements which contain
     * all the data needed about each image
     */
    var posts = parsedResponse.findAllElements('post');

    // Create a BooruItem for each post in the list
    List<BooruItem> newItems = [];
    for (int i = 0; i < posts.length; i++) {
      var current = posts.elementAt(i);
      Logger.Inst().log(current.toString(), "MoebooruHandler", "parseResponse", LogTypes.booruHandlerRawFetched);
      /**
       * Add a new booruitem to the list .getAttribute will get the data assigned to a particular tag in the xml object
       */
      if (current.getAttribute("file_url") != null) {
        // Fix for bleachbooru
        String fileURL = "", sampleURL = "", previewURL = "";
        fileURL += current.getAttribute("file_url")!.toString();
        sampleURL += current.getAttribute("sample_url")!.toString();
        previewURL += current.getAttribute("preview_url")!.toString();
        if (!fileURL.contains("http")) {
          fileURL = booru.baseURL! + fileURL;
          sampleURL = booru.baseURL! + sampleURL;
          previewURL = booru.baseURL! + previewURL;
        }
        BooruItem item = BooruItem(
          fileURL: fileURL,
          sampleURL: sampleURL,
          thumbnailURL: previewURL,
          tagsList: current.getAttribute("tags")!.split(" "),
          postURL: makePostURL(current.getAttribute("id")!),
          fileWidth: double.tryParse(current.getAttribute('width') ?? ''),
          fileHeight: double.tryParse(current.getAttribute('height') ?? ''),
          sampleWidth: double.tryParse(current.getAttribute('sample_width') ?? ''),
          sampleHeight: double.tryParse(current.getAttribute('sample_height') ?? ''),
          previewWidth: double.tryParse(current.getAttribute('preview_width') ?? ''),
          previewHeight: double.tryParse(current.getAttribute('preview_height') ?? ''),
          serverId: current.getAttribute("id"),
          rating: current.getAttribute("rating"),
          score: current.getAttribute("score"),
          sources: [current.getAttribute("source") == null ? "" : current.getAttribute("source")!],
          md5String: current.getAttribute("md5"),
          postDate: current.getAttribute("created_at"), // Fri Jun 18 02:13:45 -0500 2021
          postDateFormat: "unix", // when timezone support added: "EEE MMM dd HH:mm:ss Z yyyy",
        );

        newItems.add(item);
      }
    }

    int lengthBefore = fetched.length;
    fetched.addAll(newItems);
    setMultipleTrackedValues(lengthBefore, fetched.length);
  }

  @override
  // This will create a url for the http request
  String makeURL(String tags) {
    int cappedPage = max(1, pageNum);
    if (booru.apiKey == "") {
      return "${booru.baseURL}/post.xml?tags=$tags&limit=${limit.toString()}&page=${cappedPage.toString()}";
    } else {
      return "${booru.baseURL}/post.xml?login=${booru.userID}&api_key=${booru.apiKey}&tags=$tags&limit=${limit.toString()}&page=${cappedPage.toString()}";
    }
  }

  @override
  // This will create a url to goto the images page in the browser
  String makePostURL(String id) {
    return "${booru.baseURL}/post/show/$id/";
  }

  @override
  String makeTagURL(String input) {
    return "${booru.baseURL}/tag.xml?limit=10&order=count&name=$input*";
  }

  @override
  Future tagSearch(String input) async {
    List<String> searchTags = [];
    String url = makeTagURL(input);

    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri, headers: {"Accept": "text/html,application/xml", "user-agent": "LoliSnatcher_Droid/$verStr"});
      // 200 is the success http response code
      if (response.statusCode == 200) {
        var parsedResponse = XmlDocument.parse(response.body);
        var tags = parsedResponse.findAllElements("tag");
        if (tags.isNotEmpty) {
          for (int i = 0; i < tags.length; i++) {
            searchTags.add(tags.elementAt(i).getAttribute("name")!.trim());
          }
        }
      }
    } catch (e) {
      Logger.Inst().log(e.toString(), className, "tagSearch", LogTypes.exception);
    }

    return searchTags;
  }

  // TODO parse comments from html
  @override
  bool hasCommentsSupport = false;
}
