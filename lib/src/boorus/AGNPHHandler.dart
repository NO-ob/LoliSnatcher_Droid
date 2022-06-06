import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

import 'package:LoliSnatcher/libBooru/BooruHandler.dart';
import 'package:LoliSnatcher/src/data/BooruItem.dart';
import 'package:LoliSnatcher/src/data/Booru.dart';
import 'package:LoliSnatcher/utilities/Logger.dart';

// TODO no setTrackedValues?

/// Booru Handler for the gelbooru engine
class AGNPHHandler extends BooruHandler{
  @override
  bool tagSearchEnabled = false;

  @override
  bool hasSizeData = true;
  // Dart constructors are weird so it has to call super with the args
  AGNPHHandler(Booru booru, int limit) : super(booru, limit);

  /// This function will call a http get request using the tags and pagenumber parsed to it
  /// it will then create a list of booruItems
  @override
  Future Search(String tags, int? pageNumCustom) async {
    tags = validateTags(tags);
    if (prevTags != tags){
      fetched.value = [];
      totalCount.value = 0;
    }

    String? url = makeURL(tags);
    Logger.Inst().log(url, "AGNPHHandler", "Search", LogTypes.booruHandlerSearchURL);
    try {
      int length = fetched.length;
      Uri uri = Uri.parse(url);
      final response = await http.get(uri,headers: getHeaders());
      if (response.statusCode == 200) {
        parseResponseAndGetTagsLater(response);
        if (fetched.length == length) {
          locked = true;
        }
        prevTags = tags;
      } else {
        Logger.Inst().log("AGNPHHandler status is: ${response.statusCode}", "BooruHandler", "Search", LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log("AGNPHHandler url is: $url", "BooruHandler", "Search", LogTypes.booruHandlerFetchFailed);
        errorString = response.statusCode.toString();
      }
    } catch(e) {
      Logger.Inst().log(e.toString(), "AGNPHHandler", "Search", LogTypes.exception);
      errorString = e.toString();
    }

    return fetched;
  }

  // Slow af I have emailed the site admin to ask them to change their api.
  // Currently tags and artist are not shown in the search results so a request needs to be made to get data for each post individually just for tags and artist name
  Future<BooruItem?> getDataByID(String postID) async{
    //https://agn.ph/gallery/post/show/302344/?api=xml
    try {
      Uri uri = Uri.parse("${booru.baseURL}/gallery/post/show/$postID/?api=xml");
      var response = await http.get(uri,headers: getHeaders());
      Logger.Inst().log("Getting post data: $postID", "AGNPHHandler", "getDataByID", LogTypes.booruHandlerRawFetched);
      if (response.statusCode == 200) {
        Logger.Inst().log("Got data for: $postID", "AGNPHHandler", "getDataByID", LogTypes.booruHandlerRawFetched);
        var parsedResponse = XmlDocument.parse(response.body);
        var post = parsedResponse.getElement('post');
          String tagStr = post!.getElement("tags")?.innerText ?? "";
          if (post.getElement("tags")!.innerText.isNotEmpty){
            tagStr.replaceAll(post.getElement("artist")?.innerText ?? "", "");
            tagStr = "artist:${post.getElement("artist")?.innerText} $tagStr";
          }
          String fileURL = post.getElement("file_url")?.innerText ?? "",
              sampleURL = post.getElement("preview_url")?.innerText ?? "",
              thumbnailURL = post.getElement("thumbnail_url")?.innerText ?? "";
          if (sampleURL.isEmpty){
            sampleURL = fileURL;
          }
          BooruItem result = BooruItem(
            fileURL: fileURL,
            sampleURL: sampleURL,
            thumbnailURL: thumbnailURL,
            tagsList: tagStr.split(" "),
            postURL: makePostURL(postID),
            fileWidth: double.tryParse(post.getElement("width")?.innerText ?? ""),
            fileHeight: double.tryParse(post.getElement("height")?.innerText ?? ""),
            serverId: postID,
            rating: post.getElement("rating")?.innerText,
            score: post.getElement("fav_count")?.innerText,
            sources: [post.getElement("source")?.innerText ?? ""],
            md5String: post.getElement("md5")?.innerText,
            postDate:post.getElement("created_at")?.innerText, // Fri Jun 18 02:13:45 -0500 2021
            postDateFormat: "unix", // when timezone support added: "EEE MMM dd HH:mm:ss Z yyyy",
          );
          return result;
      } else {
        Logger.Inst().log("AGNPHHandler failed to get post", "AGNPHHandler", "getDataByID", LogTypes.booruHandlerFetchFailed);
      }
    } catch(e) {
      Logger.Inst().log(e.toString(), "AGNPHHandler", "getDataByID", LogTypes.exception);
    }
    return null;
  }
  // Because the api doesn't return tags we will create fetched and have another function set tags at a later time.
  // Seems to work for now but could cause a performance impact.
  // Makes results show on screen faster than waiting on getDataByID
  void parseResponseAndGetTagsLater(response){
    var parsedResponse = XmlDocument.parse(response.body);
    var posts = parsedResponse.findAllElements("post");
    totalCount.value = int.parse(parsedResponse.getElement("posts")!.getAttribute("count")!);
    for(int i = 0; i < posts.length; i++){
      String fileURL = posts.elementAt(i).getElement("file_url")?.innerText ?? "",
          sampleURL = posts.elementAt(i).getElement("preview_url")?.innerText ?? "",
          thumbnailURL = posts.elementAt(i).getElement("thumbnail_url")?.innerText ?? "";
      if (sampleURL.isEmpty){
        sampleURL = fileURL;
      }
      String postID = posts.elementAt(i).getElement("id")?.innerText ?? "";
      if (postID.isNotEmpty){
        BooruItem item = BooruItem(
          fileURL: fileURL,
          sampleURL: sampleURL,
          thumbnailURL: thumbnailURL,
          tagsList: [],
          postURL: makePostURL(posts.elementAt(i).getElement("id")?.innerText ?? ""),
          fileWidth: double.tryParse(posts.elementAt(i).getElement("width")?.innerText ?? ""),
          fileHeight: double.tryParse(posts.elementAt(i).getElement("height")?.innerText ?? ""),
          serverId: posts.elementAt(i).getElement("id")?.innerText ?? "",
          rating: posts.elementAt(i).getElement("rating")?.innerText,
          score: posts.elementAt(i).getElement("fav_count")?.innerText,
          sources: [posts.elementAt(i).getElement("source")?.innerText ?? ""],
          md5String: posts.elementAt(i).getElement("md5")?.innerText,
          postDate: posts.elementAt(i).getElement("created_at")?.innerText, // Fri Jun 18 02:13:45 -0500 2021
          postDateFormat: "unix", // when timezone support added: "EEE MMM dd HH:mm:ss Z yyyy",
        );
        int index = fetched.length;
        fetched.add(item);
        getTagsLater(postID, index);
      }

    }
  }
  void getTagsLater(String postID, int fetchedIndex) async{
    try {
      Uri uri = Uri.parse("${booru.baseURL}/gallery/post/show/$postID/?api=xml");
      var response = await http.get(uri,headers: getHeaders());
      Logger.Inst().log("Getting post data: $postID", "AGNPHHandler", "getTagsLater", LogTypes.booruHandlerRawFetched);
      if (response.statusCode == 200) {
        Logger.Inst().log("Got data for: $postID", "AGNPHHandler", "getTagsLater", LogTypes.booruHandlerRawFetched);
        var parsedResponse = XmlDocument.parse(response.body);
        var post = parsedResponse.getElement('post');
        String tagStr = post!.getElement("tags")?.innerText ?? "";
        if (post.getElement("tags")!.innerText.isNotEmpty){
          String artist = post.getElement("artist")?.innerText ?? "";
          tagStr = "artist:$artist ${tagStr.replaceAll(artist, "")}";
        }
        fetched.elementAt(fetchedIndex).tagsList = tagStr.split(" ");
      } else {
        Logger.Inst().log("AGNPHHandler failed to get post", "AGNPHHandler", "getTagsLater", LogTypes.booruHandlerFetchFailed);
      }
    } catch(e) {
      Logger.Inst().log(e.toString(), "AGNPHHandler", "getTagsLater", LogTypes.exception);
    }
  }
  @override
  Future<void> parseResponse(response) async{
    var parsedResponse = XmlDocument.parse(response.body);
    var posts = parsedResponse.findAllElements("post");
    totalCount.value = int.parse(parsedResponse.getElement("posts")!.getAttribute("count")!);
    for(int i = 0; i < posts.length; i++){
      BooruItem? item = await getDataByID(posts.elementAt(i).getElement("id")!.innerXml);
      if (item != null){
        fetched.add(item);
      }
    }
    return;
  }

  // This will create a url to goto the images page in the browser
  @override
  String makePostURL(String id){
    return "${booru.baseURL}/gallery/post/show/$id";
  }

  // This will create a url for the http request
  @override
  String makeURL(String tags){
    String tagStr = tags.replaceAll("artist:", "").replaceAll(" ", "+");
    //https://agn.ph/gallery/post/?search=sylveon&api=xml
    return "${booru.baseURL}/gallery/post/?search=$tagStr&page=$pageNum&api=xml";

  }

  @override
  String makeTagURL(String input){
    return "${booru.baseURL}/gallery/tags/?sort=name&order=asc&search=$input&api=xml";
  }

  // Doesn't work for some reasons does in browser. Is dodgy anyway and doesn't return many results
  @override
  Future tagSearch(String input) async {
    List<String> searchTags = [];
    String url = makeTagURL(input);
    try {
      Uri uri = Uri.parse(url);
      var response = await http.get(uri,headers: getHeaders());
      // 200 is the success http response code
      if (response.statusCode == 200) {
        if (response.body.contains("response")){
          var parsedResponse = XmlDocument.parse(response.body);
          var tags = parsedResponse.findAllElements("tag");
          if (tags.isNotEmpty){
            for (int i=0; i < tags.length; i++){
              searchTags.add(tags.elementAt(i).getAttribute("name")!);
            }
          }
        }
      } else {
        Logger.Inst().log("No tags found", "AGNPHHandlerHandler", "tagSearch", LogTypes.exception);
      }
    } catch(e) {
      Logger.Inst().log(e.toString(), "AGNPHHandlerHandler", "tagSearch", LogTypes.exception);
    }
    return searchTags;
  }

}