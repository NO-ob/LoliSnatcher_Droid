import 'dart:async';
import 'dart:convert';

import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';

//Slow piece of shit
class RainbooruHandler extends BooruHandler {
  RainbooruHandler(Booru booru, int limit) : super(booru, limit);

  @override
  String validateTags(String tags) {
    if (tags == "" || tags == " ") {
      return "*";
    } else {
      return tags;
    }
  }

  @override
  List parseListFromResponse(response) {
    var document = parse(response.body);
    return document.getElementsByClassName("thumbnail");
  }

  @override
  Future<BooruItem?> parseItemFromResponse(responseItem, int index) async {
    String thumbURL = "";
    var urlElem = responseItem.firstChild!;
    thumbURL += urlElem.firstChild!.attributes["src"]!;
    String url = makePostURL(urlElem.attributes["href"]!.split("img/")[1]);
    Uri uri = Uri.parse(url);
    final responseInner = await http.get(uri, headers: getHeaders());
    if (responseInner.statusCode == 200) {
      var document = parse(responseInner.body);
      var post = document.getElementById("immainpage");
      if (post != null) {
        var postsURLs = post.querySelector("div#immainpage > a");
        String fileURL = postsURLs!.attributes["href"]!;
        String sampleURL = postsURLs.firstChild!.attributes["src"]!;
        var tags = document.querySelectorAll("a.tag");
        List<String> currentTags = [];
        for (int x = 0; x < tags.length; x++) {
          currentTags.add(tags[x].innerHtml.replaceAll(" ", "+"));
        }

        BooruItem item = BooruItem(
          fileURL: fileURL,
          sampleURL: sampleURL,
          thumbnailURL: thumbURL,
          tagsList: currentTags,
          postURL: url,
        );

        return item;
      } else {
        return null;
      }
    } else {
      // TODO + try/catch inner request
      throw Error();
    }
  }

  @override
  String makePostURL(String id) {
    return "${booru.baseURL}/img/$id";
  }

  @override
  String makeURL(String tags) {
    // EXAMPLE: https://www.rainbooru.org/search?search=safe,solo&page=0
    if (tags != "*") {
      return "${booru.baseURL}/search?filters=&search=${tags.replaceAll(" ", ",")}&page=${pageNum.toString()}";
    } else {
      return "${booru.baseURL}/?search=&page=${pageNum.toString()}";
    }
  }

  @override
  String makeTagURL(String input) {
    return "https://twibooru.org/tags.json?tq=*$input*";
  }

  @override
  List parseTagSuggestionsList(response) {
    List<dynamic> parsedResponse = jsonDecode(response.body);
    return parsedResponse;
  }

  @override
  String? parseTagSuggestion(responseItem, int index) {
    List tagStringReplacements = [
      ["-colon-", ":"],
      ["-dash-", "-"],
      ["-fwslash-", "/"],
      ["-bwslash-", "\\"],
      ["-dot-", "."],
      ["-plus-", "+"]
    ];

    String tag = responseItem['slug'].toString();
    for (int x = 0; x < tagStringReplacements.length; x++) {
      tag = tag.replaceAll(tagStringReplacements[x][0], tagStringReplacements[x][1]);
    }
    return tag;
  }
}
