import 'dart:convert';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

class SzurubooruHandler extends BooruHandler {
  SzurubooruHandler(Booru booru, int limit) : super(booru, limit);

  @override
  String validateTags(tags) {
    if (tags == "" || tags == " ") {
      return "*";
    } else {
      return tags;
    }
  }

  @override
  List parseListFromResponse(response) {
    Map<String, dynamic> parsedResponse = jsonDecode(response.body);
    return parsedResponse['results'];
  }

  @override
  BooruItem? parseItemFromResponse(responseItem, int index) {
    var current = responseItem;

    List<String> tags = [];
    for (int x = 0; x < current['tags'].length; x++) {
      String currentTags = current['tags'][x]['names'].toString().replaceAll(r":", r"\:");
      currentTags = currentTags.substring(1, currentTags.length - 1);
      if (currentTags.contains(",")) {
        tags.addAll(currentTags.split(", "));
      } else {
        tags.add(currentTags);
      }
    }

    if (current['contentUrl'] != null) {
      BooruItem item = BooruItem(
        fileURL: "${booru.baseURL}/${current['contentUrl']}",
        fileWidth: current['canvasWidth'].toDouble(),
        fileHeight: current['canvasHeight'].toDouble(),
        sampleURL: "${booru.baseURL}/${current['contentUrl']}",
        thumbnailURL: "${booru.baseURL}/${current['thumbnailUrl']}",
        tagsList: tags,
        serverId: current['id'].toString(),
        score: current['score'].toString(),
        postURL: makePostURL(current['id'].toString()),
        rating: current['safety'],
        postDate: current['creationTime'].substring(0, 22),
        postDateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS",
      );

      return item;
    } else {
      return null;
    }
  }

  @override
  Map<String, String> getHeaders() {
    if (booru.apiKey!.isNotEmpty) {
      return {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "user-agent": Tools.appUserAgent(),
        "Authorization": "Token ${base64Encode(utf8.encode("${booru.userID}:${booru.apiKey}"))}"
      };
    } else {
      return {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "user-agent": Tools.browserUserAgent(),
      };
    }
  }

  @override
  String makePostURL(String id) {
    return "${booru.baseURL}/post/$id";
  }

  @override
  String makeURL(String tags) {
    return "${booru.baseURL}/api/posts/?offset=${pageNum * limit}&limit=${limit.toString()}&query=$tags";
  }

  @override
  String makeTagURL(String input) {
    return "${booru.baseURL}/api/tags/?offset=0&limit=10&query=$input*";
  }

  @override
  List parseTagSuggestionsList(response) {
    Map<String, dynamic> parsedResponse = jsonDecode(response.body);
    return parsedResponse["results"] ?? [];
  }

  @override
  String? parseTagSuggestion(responseItem, int index) {
    String? tag = responseItem['names']?[0]?.toString().replaceAll(r":", r"\:");
    return tag;
  }
}
