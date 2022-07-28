import 'dart:convert';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';

class e621Handler extends BooruHandler {
  e621Handler(Booru booru, int limit) : super(booru, limit);

  @override
  bool hasSizeData = true;

  @override
  Map<String, TagType> tagTypeMap = {
    "7": TagType.meta,
    "3": TagType.copyright,
    "4": TagType.character,
    "1": TagType.artist,
    "5": TagType.species,
    "0": TagType.none,
  };

  @override
  List parseListFromResponse(response) {
    Map<String, dynamic> parsedResponse = jsonDecode(response.body);
    return (parsedResponse['posts'] ?? []) as List;
  }

  @override
  BooruItem? parseItemFromResponse(responseItem, int index) {
    final dynamic current = responseItem;

    if (current['file']['md5'] != null) {
      String fileURL = "";
      String sampleURL = "";
      String thumbURL = "";
      if (current['file']['url'] == null) {
        String md5FirstSplit = current['file']['md5'].toString().substring(0, 2);
        String md5SecondSplit = current['file']['md5'].toString().substring(2, 4);
        fileURL = "https://static1.e621.net/data/$md5FirstSplit/$md5SecondSplit/${current['file']['md5']}.${current['file']['ext']}";
        sampleURL = fileURL.replaceFirst("data", "data/sample").replaceFirst(current['file']['ext'], "jpg");
        thumbURL = sampleURL.replaceFirst("data/sample", "data/preview");
        if (current['file']['size'] <= 2694254) {
          sampleURL = fileURL;
        }
      } else {
        fileURL = current['file']['url'];
        sampleURL = current['sample']['url'];
        thumbURL = current['preview']['url'];
      }

      addTagsWithType([...current['tags']['character']], TagType.character);
      addTagsWithType([...current['tags']['copyright']], TagType.copyright);
      addTagsWithType([...current['tags']['artist']], TagType.artist);
      addTagsWithType([...current['tags']['meta']], TagType.meta);
      addTagsWithType([...current['tags']['general']], TagType.none);
      addTagsWithType([...current['tags']['species']], TagType.species);

      String? dateStr = current['created_at']?.toString().substring(0, current['created_at']!.toString().length - 6);

      BooruItem item = BooruItem(
        fileURL: fileURL,
        sampleURL: sampleURL,
        thumbnailURL: thumbURL,
        tagsList: [
          ...current['tags']['character'],
          ...current['tags']['copyright'],
          ...current['tags']['artist'],
          ...current['tags']['meta'],
          ...current['tags']['general'],
          ...current['tags']['species']
        ],
        postURL: makePostURL(current['id'].toString()),
        fileExt: current['file']['ext'],
        fileSize: current['file']['size'],
        fileWidth: current['file']['width']?.toDouble(),
        fileHeight: current['file']['height']?.toDouble(),
        sampleWidth: current['sample']['width']?.toDouble(),
        sampleHeight: current['sample']['height']?.toDouble(),
        previewWidth: current['preview']['width']?.toDouble(),
        previewHeight: current['preview']['height']?.toDouble(),
        hasNotes: current['has_notes'],
        serverId: current['id']?.toString(),
        rating: current['rating'],
        score: current['score']['total']?.toString(),
        sources: List<String>.from(current['sources'] ?? []),
        md5String: current['file']['md5'],
        postDate: dateStr, // 2021-06-13t02:09:45.138-04:00
        postDateFormat: "yyyy-MM-dd't'HH:mm:ss.SSS", // when timezone support added: "yyyy-MM-dd't'HH:mm:ss.SSSZ",
      );

      return item;
    } else {
      return null;
    }
  }

  @override
  String makePostURL(String id) {
    return "${booru.baseURL}/posts/$id?";
  }

  @override
  String makeURL(String tags) {
    final String apiKey = (booru.apiKey?.isNotEmpty ?? false) ? "&login=${booru.userID}&api_key=${booru.apiKey}" : '';

    return "${booru.baseURL}/posts.json?tags=$tags&limit=${limit.toString()}&page=${pageNum.toString()}$apiKey";
  }

  @override
  String makeTagURL(String input) {
    return "${booru.baseURL}/tags.json?search[name_matches]=$input*&limit=10&search[order]=count";
  }

  @override
  List parseTagSuggestionsList(response) {
    List parsedResponse = jsonDecode(response.body);
    return parsedResponse;
  }

  @override
  String? parseTagSuggestion(responseItem, int index) {
    final String tagStr = responseItem["name"] ?? "";
    if (tagStr.isEmpty) return null;

    // record tag data for future use
    final String rawTagType = responseItem["category"]?.toString() ?? "";
    TagType tagType = TagType.none;
    if (rawTagType.isNotEmpty && tagTypeMap.containsKey(rawTagType)) {
      tagType = (tagTypeMap[rawTagType] ?? TagType.none);
    }
    addTagsWithType([tagStr], tagType);
    return tagStr;
  }
}
