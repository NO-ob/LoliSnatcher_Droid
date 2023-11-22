import 'dart:convert';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

class SzurubooruHandler extends BooruHandler {
  SzurubooruHandler(super.booru, super.limit);

  @override
  String validateTags(String tags) {
    if (tags == '' || tags == ' ') {
      return '*';
    } else {
      return super.validateTags(tags);
    }
  }

  @override
  List parseListFromResponse(dynamic response) {
    final Map<String, dynamic> parsedResponse = response.data;
    return (parsedResponse['results'] ?? []) as List;
  }

  @override
  BooruItem? parseItemFromResponse(dynamic responseItem, int index) {
    final current = responseItem;

    final List<String> tags = [];
    for (int x = 0; x < current['tags'].length; x++) {
      String currentTags = current['tags'][x]['names'].toString().replaceAll(':', r'\:');
      currentTags = currentTags.substring(1, currentTags.length - 1);
      if (currentTags.contains(',')) {
        tags.addAll(currentTags.split(', '));
      } else {
        tags.add(currentTags);
      }
    }
    if (current['contentUrl'] != null) {
      final BooruItem item = BooruItem(
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
        postDate: (current['creationTime'].replaceAll('Z', '') + '.0000').substring(0, 22),
        postDateFormat: 'iso',
      );

      return item;
    } else {
      return null;
    }
  }

  @override
  Map<String, String> getHeaders() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'User-Agent': Tools.browserUserAgent,
      if (booru.apiKey?.isNotEmpty == true) 'Authorization': "Token ${base64Encode(utf8.encode("${booru.userID}:${booru.apiKey}"))}",
    };
  }

  @override
  String makePostURL(String id) {
    return '${booru.baseURL}/post/$id';
  }

  @override
  String makeURL(String tags) {
    return '${booru.baseURL}/api/posts/?offset=${pageNum * limit}&limit=$limit&query=$tags';
  }

  @override
  String makeTagURL(String input) {
    return '${booru.baseURL}/api/tags/?offset=0&limit=10&query=$input*';
  }

  @override
  List parseTagSuggestionsList(dynamic response) {
    final Map<String, dynamic> parsedResponse = response.data;
    return parsedResponse['results'] ?? [];
  }

  @override
  String? parseTagSuggestion(dynamic responseItem, int index) {
    final String? tag = responseItem['names']?[0]?.toString().replaceAll(':', r'\:');
    return tag;
  }
}
