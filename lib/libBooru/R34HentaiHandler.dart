import 'dart:async';
import 'dart:convert';

import 'package:html/parser.dart';

import 'BooruHandler.dart';
import 'BooruItem.dart';
import 'Booru.dart';
import 'package:LoliSnatcher/libBooru/ShimmieHandler.dart';
import 'package:LoliSnatcher/utilities/Logger.dart';


class R34HentaiHandler extends ShimmieHandler {
  // Dart constructors are weird so it has to call super with the args
  R34HentaiHandler(Booru booru,int limit): super(booru,limit);

  @override
  String className = "R34HentaiHandler";

  @override
  bool tagSearchEnabled = false;

  @override
  bool hasSizeData = true;

  @override
  Future Search(String tags, int? pageNumCustom) async{
    if(booru.apiKey == ""){
      booru.apiKey = null;
    }
    return super.Search(tags, pageNumCustom);
  }

  @override
  Map<String,String> getHeaders(){
    return {
      "Accept": "application/json",
      "Cookie": "${booru.apiKey};",
      "user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:83.0) Gecko/20100101 Firefox/83.0",
    };
  }

  @override
  String validateTags(tags){
    if(tags == " " || tags == ""){
      return "";
    } else {
      return tags;
    }
  }

  @override
  void parseResponse(response) {
    var document = parse(response.body);
    var spans = document.getElementsByClassName("thumb");

    List<BooruItem> newItems = [];
    for (int i = 0; i < spans.length; i++){
      try {
        var current = spans.elementAt(i);
        Logger.Inst().log(current.children[0].innerHtml, className, "parseResponse", LogTypes.booruHandlerRawFetched);
        String id = current.attributes["data-post-id"]!;
        String fileExt = current.attributes["data-mime"]?.split('/')[1] ?? "png";
        String thumbURL = current.firstChild!.attributes["src"]!;
        double? thumbWidth = double.tryParse(current.firstChild!.attributes["width"] ?? '');
        double? thumbHeight = double.tryParse(current.firstChild!.attributes["height"] ?? '');
        double? fileWidth = double.tryParse(current.attributes["data-width"] ?? '');
        double? fileHeight = double.tryParse(current.attributes["data-height"] ?? '');
        String fileURL = thumbURL.replaceFirst("_thumbs", "_images").replaceFirst("thumbnails", "images").replaceFirst("thumbnail_", "").replaceFirst('.jpg', '.$fileExt');
        List<String> tags = current.attributes["data-tags"]?.split(" ") ?? [];
        /**
         * Add a new booruitem to the list .getAttribute will get the data assigned to a particular tag in the xml object
         */
        BooruItem item = BooruItem(
          thumbnailURL: booru.baseURL! + thumbURL,
          sampleURL: booru.baseURL! + fileURL,
          fileURL: booru.baseURL! + fileURL,
          previewWidth: thumbWidth,
          previewHeight: thumbHeight,
          fileWidth: fileWidth,
          fileHeight: fileHeight,
          tagsList: tags,
          md5String: getHashFromURL(thumbURL),
          postURL: makePostURL(id),
          serverId: id,
        );

        newItems.add(item);
      } catch (e) {
        Logger.Inst().log("Error parsing response: $e", className, "parseResponse", LogTypes.booruHandlerRawFetched);
      }
    }

    int lengthBefore = fetched.length;
    fetched.addAll(newItems);
    setMultipleTrackedValues(lengthBefore, fetched.length);
  }

  String getHashFromURL(String url){
    String hash = url.substring(url.lastIndexOf("_") + 1,url.lastIndexOf("."));
    return hash;
  }

  // This will create a url for the http request
  @override
  String makeURL(String tags){
    String tagsText = tags.replaceAll(' ', '+');
    tagsText = tagsText.isEmpty ? '' : '$tagsText/';
    String pageStr = (pageNum.value).toString();
    return "${booru.baseURL}/post/list/$tagsText$pageStr";
  }

  @override
  String getDescription() {
    return '---------------------\n\nTo view restricted content you need a session token:\n-Paste this into your browser\'s address bar when on the desired site and logged in:\n\njavascript:let cs=document.cookie.split(\'; \');let user=cs.find(c=>c.startsWith(\'shm_user\'));let token=cs.find(c=>c.startsWith(\'shm_session\'));prompt(\'\', user + \'; \' + token);\n\n-Copy the prompt contents into apiKey field\n(example: shm_user=xxx; shm_session=xxx;)\n\n[Note]: The "javascript:" part of the script is often truncated by the browser when pasting. Use the script as bookmarklet to bypass this behavior.\n\n---------------------';
  }
}

/**
 * Booru Handler for the r34hentai engine
 */
// TODO they removed their api, both shimmie and custom one, but maybe it is still hidden somewhere?
class R34HentaiHandlerOld extends BooruHandler{
  // Dart constructors are weird so it has to call super with the args
  R34HentaiHandlerOld(Booru booru,int limit) : super(booru,limit);

  @override
  bool tagSearchEnabled = false;

  @override
  Future Search(String tags, int? pageNumCustom) async{
    if(booru.apiKey == ""){
      booru.apiKey = null;
    }
    return super.Search(tags, pageNumCustom);
  }

  @override
  Map<String,String> getHeaders(){
    return {"Accept": "application/json", 'Cookie': '${booru.apiKey};', "user-agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:83.0) Gecko/20100101 Firefox/83.0"};
  }

  @override
  String validateTags(tags){
    if(tags == " " || tags == ""){
      return "";
    } else {
      return tags;
    }
  }

  @override
  void parseResponse(response) {
    List<dynamic> parsedResponse = jsonDecode(response.body);
    var posts = parsedResponse; // Limit doesn't work with this api

    // Create a BooruItem for each post in the list
    List<BooruItem> newItems = [];
    for (int i = 0; i < posts.length; i++) {
      /**
       * Parse Data Object and Add a new BooruItem to the list
       */
      var current = posts.elementAt(i);
      Logger.Inst().log(current.toString(), "R34HentaiHandler","parseResponse", LogTypes.booruHandlerRawFetched);
      String imageUrl = current['file_url'];
      String sampleUrl = current['sample_url'];
      String thumbnailUrl = current['preview_url'];

      BooruItem item = BooruItem(
        fileURL: imageUrl,
        sampleURL: sampleUrl,
        thumbnailURL: thumbnailUrl,
        tagsList: current['tags'].split(' '),
        postURL: makePostURL(current['id'].toString()),
      );

      newItems.add(item);
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
    return "${booru.baseURL}/post/index.json?limit=$limit&page=$pageNum&tags=$tags";
  }

  @override
  String getDescription() {
    return '---------------------\n\nTo view restricted content you need a session token:\n-Paste this into your browser\'s address bar when on the desired site and logged in:\n\njavascript:let cs=document.cookie.split(\'; \');let user=cs.find(c=>c.startsWith(\'shm_user\'));let token=cs.find(c=>c.startsWith(\'shm_session\'));prompt(\'\', user + \'; \' + token);\n\n-Copy the prompt contents into apiKey field\n(example: shm_user=xxx; shm_session=xxx;)\n\n[Note]: The "javascript:" part of the script is often truncated by the browser when pasting. Use the script as bookmarklet to bypass this behavior.\n\n---------------------';
  }
}