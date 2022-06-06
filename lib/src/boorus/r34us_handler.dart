import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/utils/logger.dart';

/// Booru Handler for the gelbooru engine
class R34USHandler extends BooruHandler{
  // Dart constructors are weird so it has to call super with the args
  R34USHandler(Booru booru,int limit): super(booru,limit);

  @override
  String className = "R34USHandler";

  @override
  bool tagSearchEnabled = false;

  @override
  String validateTags(tags){
    if(tags == " " || tags == ""){
      return "all";
    } else {
      return tags;
    }
  }
  @override
  Future Search(String tags, int? pageNumCustom) async {
    if (pageNumCustom != null) {
      pageNum = pageNumCustom;
    }
    tags = validateTags(tags);
    if (prevTags != tags) {
      fetched.value = [];
    }
    String? url = makeURL(tags);
    Logger.Inst().log(url, className, "Search", LogTypes.booruHandlerSearchURL);
    try {
      int length = fetched.length;
      Uri uri = Uri.parse(url);
      final response = await http.get(uri, headers: getHeaders());
      if (response.statusCode == 200) {
        List<BooruItem> newItems = await parseResponse(response);
        int lengthBefore = fetched.length;
        fetched.addAll(newItems);
        setMultipleTrackedValues(lengthBefore, fetched.length);
        prevTags = tags;
        if (fetched.length == length) {
          locked = true;
        }
      } else {
        Logger.Inst().log("$className status is: ${response.statusCode}", className, "Search", LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log("$className url is: $url", className, "Search", LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log("$className url response is: ${response.body}", className, "Search", LogTypes.booruHandlerFetchFailed);
        errorString = response.statusCode.toString();
      }
    } catch (e) {
      Logger.Inst().log(e.toString(), className, "Search", LogTypes.exception);
      errorString = e.toString();
    }

    // print('Fetched: ${filteredFetched.length}');
    return fetched;
  }

    //user_id=24582; pass_hash=66f1d55e1e13efcf27bfe09736436af43a3b138f
  @override
  Future<List<BooruItem>> parseResponse(response) async{
    var document = parse(response.body);
    var divs = document.querySelectorAll("div.thumbail-container > div");

    List<BooruItem> newItems = [];
    for (int i = 0; i < divs.length; i++){
      Logger.Inst().log(divs.elementAt(i).children[0].innerHtml, className, "parseResponse", LogTypes.booruHandlerRawFetched);
      if (divs.elementAt(i).children[0].firstChild!.attributes["src"] != null){
        String id = divs.elementAt(i).children[0].attributes["id"]!;
        String thumbURL = divs.elementAt(i).children[0].firstChild!.attributes["src"]!;
        List<String> tags = [];
        divs.elementAt(i).children[0].firstChild!.attributes["title"]!.split(", ").forEach((tag) {
          tags.add(tag.replaceAll(" ", "_"));
        });
        /**
         * Add a new booruitem to the list .getAttribute will get the data assigned to a particular tag in the xml object
         */

        BooruItem item = BooruItem(
          fileURL: "",
          sampleURL: "",
          thumbnailURL: thumbURL,
          tagsList: tags,
          md5String: getHashFromURL(thumbURL),
          postURL: makePostURL(id),
        );

        item = await getPostData(item,id);
        if (item.fileURL.isNotEmpty){
          newItems.add(item);
        }
      }
    }
    return newItems;
  }

  Future<BooruItem> getPostData(BooruItem item,String id) async{
    try {
      Uri uri = Uri.parse(item.postURL);
      final response = await http.get(uri, headers: getHeaders());
      if (response.statusCode == 200) {
        var document = parse(response.body);
        dom.Element? div = document.querySelector("div.content_push > img");
        item.fileURL = div!.attributes["src"]!.toString();
        item.sampleURL = div.attributes["src"]!.toString();
        item.fileHeight = double.tryParse(div.attributes["height"]!.toString());
        item.fileWidth = double.tryParse(div.attributes["width"]!);
        print(item.fileURL);
        print(item.thumbnailURL);
        print(item.postURL);
      } else {
        Logger.Inst().log("$className status is: ${response.statusCode}", className, "getPostData", LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log("$className url is: ${item.postURL}", className, "getPostData", LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log("$className url response is: ${response.body}", className, "getPostData", LogTypes.booruHandlerFetchFailed);
        errorString = response.statusCode.toString();
      }
    } catch (e) {
      print(e);
      Logger.Inst().log(e.toString(), className, "getPostData", LogTypes.exception);
      errorString = e.toString();
    }
    return item;
  }

  String getHashFromURL(String url){
    String hash = url.substring(url.lastIndexOf("_") + 1,url.lastIndexOf("."));
    return hash;
  }

  // This will create a url to goto the images page in the browser
  @override
  String makePostURL(String id){
    return "${booru.baseURL}/index.php?r=posts/view&id=$id";
  }

  // This will create a url for the http request
  @override
  String makeURL(String tags){
    return "${booru.baseURL}/index.php?r=posts/index&q=${tags.replaceAll(" ", "+")}&pid=${(pageNum * 20).toString()}";
  }
}