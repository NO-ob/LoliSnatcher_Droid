import 'dart:convert';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

// ignore: camel_case_types
class e621Handler extends BooruHandler {
  e621Handler(super.booru, super.limit);

  @override
  bool get hasSizeData => true;

  @override
  Map<String, TagType> get tagTypeMap => {
        '7': TagType.meta,
        '3': TagType.copyright,
        '4': TagType.character,
        '1': TagType.artist,
        '5': TagType.species,
        '0': TagType.none,
      };

  @override
  List parseListFromResponse(dynamic response) {
    final Map<String, dynamic> parsedResponse = response.data;
    return (parsedResponse['posts'] ?? []) as List;
  }

  @override
  BooruItem? parseItemFromResponse(dynamic responseItem, int index) {
    final dynamic current = responseItem;

    if (current['file']['md5'] != null) {
      String fileURL = '';
      String sampleURL = '';
      String thumbURL = '';
      if (current['file']['url'] == null) {
        final String md5FirstSplit = current['file']['md5'].toString().substring(0, 2);
        final String md5SecondSplit = current['file']['md5'].toString().substring(2, 4);
        fileURL = "https://static1.e621.net/data/$md5FirstSplit/$md5SecondSplit/${current['file']['md5']}.${current['file']['ext']}";
        sampleURL = fileURL.replaceFirst('data', 'data/sample').replaceFirst(current['file']['ext'], 'jpg');
        thumbURL = sampleURL.replaceFirst('data/sample', 'data/preview');
        if (current['file']['size'] <= 2694254) {
          sampleURL = fileURL;
        }
      } else {
        fileURL = current['file']['url'];
        sampleURL = current['sample']['url'];
        thumbURL = current['preview']['url'];
      }

      final List characterTags = current['tags']?['character'] ?? [];
      final List copyrightTags = current['tags']?['copyright'] ?? [];
      final List franchiseTags = current['tags']?['franchise'] ?? [];
      final List artistTags = current['tags']?['artist'] ?? [];
      final List directorTags = current['tags']?['director'] ?? [];
      final List metaTags = current['tags']?['meta'] ?? [];
      final List generalTags = current['tags']?['general'] ?? [];
      final List speciesTags = current['tags']?['species'] ?? [];

      addTagsWithType([...characterTags], TagType.character);
      addTagsWithType([...copyrightTags], TagType.copyright);
      addTagsWithType([...franchiseTags], TagType.copyright);
      addTagsWithType([...artistTags], TagType.artist);
      addTagsWithType([...directorTags], TagType.artist);
      addTagsWithType([...metaTags], TagType.meta);
      addTagsWithType([...generalTags], TagType.none);
      addTagsWithType([...speciesTags], TagType.species);

      final String? dateStr = current['created_at']?.toString().substring(0, current['created_at']!.toString().length - 6);

      final BooruItem item = BooruItem(
        fileURL: fileURL,
        sampleURL: sampleURL,
        thumbnailURL: thumbURL,
        tagsList: [
          ...characterTags,
          ...copyrightTags,
          ...franchiseTags,
          ...artistTags,
          ...directorTags,
          ...metaTags,
          ...generalTags,
          ...speciesTags,
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
        postDateFormat: 'iso',
      );

      return item;
    } else {
      return null;
    }
  }

  @override
  String makePostURL(String id) {
    return '${booru.baseURL}/posts/$id?';
  }

  @override
  String makeURL(String tags) {
    return '${booru.baseURL}/posts.json?tags=$tags&limit=$limit&page=$pageNum';
  }

  @override
  String makeTagURL(String input) {
    return '${booru.baseURL}/tags.json?search[name_matches]=$input*&limit=10&search[order]=count';
  }

  @override
  Map<String, String> getHeaders() {
    final String? userName = booru.userID?.isNotEmpty == true ? booru.userID : null;
    final String? apiKey = booru.apiKey?.isNotEmpty == true ? booru.apiKey : null;

    return {
      'Accept': 'text/html,application/xml,application/json',
      'User-Agent': Tools.browserUserAgent,
      if (userName != null && apiKey != null) 'Authorization': "Basic ${base64.encode(utf8.encode("$userName:$apiKey"))}",
    };
  }

  @override
  List parseTagSuggestionsList(dynamic response) {
    final List parsedResponse = response.data;
    return parsedResponse;
  }

  @override
  String? parseTagSuggestion(dynamic responseItem, int index) {
    final String tagStr = responseItem['name'] ?? '';
    if (tagStr.isEmpty) {
      return null;
    }

    // record tag data for future use
    final String rawTagType = responseItem['category']?.toString() ?? '';
    TagType tagType = TagType.none;
    if (rawTagType.isNotEmpty && tagTypeMap.containsKey(rawTagType)) {
      tagType = tagTypeMap[rawTagType] ?? TagType.none;
    }
    addTagsWithType([tagStr], tagType);
    return tagStr;
  }
}
