import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

class WorldXyzHandler extends BooruHandler {
  WorldXyzHandler(Booru booru, int limit) : super(booru, limit);

  @override
  String validateTags(tags) {
    if (tags == " " || tags == "") {
      return "";
    } else {
      return tags;
    }
  }

  @override
  Map<String, String> getHeaders() {
    return {
      "Accept": "text/html,application/xml,application/json",
      "Content-Type": "application/json",
      "User-Agent": Tools.appUserAgent(),
    };
  }

  @override
  List parseListFromResponse(response) {
    Map<String, dynamic> parsedResponse = jsonDecode(response.body);
    return (parsedResponse['items'] ?? []) as List;
  }

  @override
  BooruItem? parseItemFromResponse(responseItem, int index) {
    var current = responseItem;

    List<dynamic> imageLinks = current['imageLinks'];
    imageLinks.sort((a, b) => a['type'].compareTo(b['type']) * -1);
    bool isVideo = current['type'] == 1; //type 1 - video, type 0 - image
    List<int> possibleBestVideoFiles = [10, 40, 41, 11];
    String? bestFile = imageLinks.firstWhereOrNull((f) => isVideo ? possibleBestVideoFiles.contains(f["type"]) : f["type"] == 2)?["url"];
    String sampleImage = imageLinks.where((f) => f["type"] == 2).toList()[0]["url"]; // isVideo ? 2 : 5 ???
    String thumbImage = imageLinks.where((f) => f["type"] == 4).toList()[0]["url"];
    // Site generates links to RAW images, but they often lead to 404, override them
    // if(bestImage.contains('.raw.')) {
    //   bestIndex = 1;
    //   bestImage = imageLinks[bestIndex]['url'];
    // }

    if (bestFile == null) {
      return null;
    }

    // They mostly use cdn, but sometimes they aren't and it leads to same domain, this fixes such links
    bestFile = bestFile.startsWith('https') ? bestFile : (booru.baseURL! + bestFile);
    sampleImage = sampleImage.startsWith('https') ? sampleImage : (booru.baseURL! + sampleImage);
    thumbImage = thumbImage.startsWith('https') ? thumbImage : (booru.baseURL! + thumbImage);

    // Uses retarded tag scheme: "tag with multiple words|next tag", instead of "tag_with_multiple_words next_tag", convert their scheme to ours here
    List<String> originalTags = current['tags'] != null ? [...current['tags']] : [];
    var fixedTags = originalTags.map((tag) => tag.replaceAll(RegExp(r' '), '_')).toList();

    String dateString = current['created'].split('.')[0]; // split off microseconds // use posted or created?
    BooruItem item = BooruItem(
      fileURL: bestFile,
      sampleURL: sampleImage,
      thumbnailURL: thumbImage,
      tagsList: fixedTags,
      postURL: makePostURL(current['id'].toString()),
      serverId: current['id'].toString(),
      score: current['views'].toString(), // use views as score, people don't rate stuff here often
      sources: List<String>.from(current['sources'] ?? []),
      postDate: dateString, // 2021-06-18T06:09:02.63366 // microseconds?
      postDateFormat: "yyyy-MM-dd'T'hh:mm:ss",
    );

    return item;
  }

  @override
  String makePostURL(String id) {
    return "${booru.baseURL}/post/$id";
  }

  @override
  String makeURL(String tags) {
    // convert "tag_name_1 tag_name_2" to "tag name 1|tag name 2" and filter excluded tags out
    String includeTags = tags.split(' ').where((f) => !f.startsWith('-')).toList().map((tag) => tag.replaceAll(RegExp(r'_'), '+')).toList().join('|');
    String excludeTags = tags
        .split(' ')
        .where((f) => f.startsWith('-'))
        .toList()
        .map((tag) => tag.replaceAll(RegExp(r'_'), '+').replaceAll(RegExp(r'^-'), ''))
        .toList()
        .join('|');
    // ignores custom limits
    //
    int skip = (pageNum * limit) < 0 ? 0 : (pageNum * limit);
    return "${booru.baseURL}/api/post/Search?IncludeLinks=true&Tag=$includeTags&ExcludeTag=$excludeTags&OrderBy=0&Skip=${skip.toString()}&Take=${limit.toString()}&DisableTotal=false";
  }

  @override
  String makeTagURL(String input) {
    return "${booru.baseURL}/api/tag/Search";
  }

  @override
  Future fetchTagSuggestions(Uri uri, String input) {
    String requestBody = jsonEncode({
      "searchText": input.replaceAll(RegExp(r'^-'), ''),
      "skip": 0,
      "take": 10,
    });

    return http.post(uri, headers: getHeaders(), body: requestBody);
  }

  @override
  List parseTagSuggestionsList(response) {
    var parsedResponse = jsonDecode(response.body);
    return parsedResponse["items"] ?? [];
  }

  @override
  String? parseTagSuggestion(responseItem, int index) {
    return responseItem['value']?.replaceAll(RegExp(r' '), '_');
  }

  // TODO disabled because api has a limit of 600 items for any query
  // @override
  // Future<void> searchCount(String input) async {
  //   int result = 0;
  //   String url = makeURL(input);
  //   url = url.replaceAll(RegExp(r''), '');

  //   try {
  //     Uri uri = Uri.parse(url);
  //     final response = await http.get(uri, headers: {"Accept": "application/xml", "user-agent": Tools.browserUserAgent()});
  //     // 200 is the success http response code
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> parsedResponse = jsonDecode(response.body);
  //       result = parsedResponse['totalCount'];
  //     } else {
  //       Logger.Inst().log(response.statusCode.toString(), "WorldXyzHandler", "searchCount", LogTypes.booruHandlerInfo);
  //     }
  //   } catch (e) {
  //     Logger.Inst().log(e.toString(), "WorldXyzHandler", "searchCount", LogTypes.exception);
  //   }
  //   totalCount.value = result;
  //   return;
  // }
}
