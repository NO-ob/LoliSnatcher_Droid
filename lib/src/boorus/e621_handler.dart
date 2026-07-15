import 'dart:convert';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/tag.dart';
import 'package:lolisnatcher/src/data/tag_suggestion.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

// ignore: camel_case_types
class e621Handler extends BooruHandler {
  e621Handler(super.booru, super.limit);

  @override
  bool get hasSizeData => true;

  @override
  bool get hasTagSuggestions => true;

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
    return response.data ?? [];
  }

  @override
  BooruItem? parseItemFromResponse(dynamic responseItem, int index) {
    final dynamic current = responseItem as Map<String, dynamic>;

    final bool hasSample = current['has']['sample'];

    final String fileURL = current['files']['original']['url'];

    final String previewURL = current['files']['preview']['jpg'];
    final String sampleURL = hasSample ? current['files']['sample']['jpg'] : previewURL;

    final List<String> characterTags = (current['tags']?['character'] ?? []).cast<String>();
    final List<String> copyrightTags = (current['tags']?['copyright'] ?? []).cast<String>();
    final List<String> franchiseTags = (current['tags']?['franchise'] ?? []).cast<String>();
    final List<String> artistTags = (current['tags']?['artist'] ?? []).cast<String>();
    final List<String> directorTags = (current['tags']?['director'] ?? []).cast<String>();
    final List<String> metaTags = (current['tags']?['meta'] ?? []).cast<String>();
    final List<String> generalTags = (current['tags']?['general'] ?? []).cast<String>();
    final List<String> speciesTags = (current['tags']?['species'] ?? []).cast<String>();
    final List<String> loreTags = (current['tags']?['lore'] ?? []).cast<String>();

    addTagsWithType([...characterTags], TagType.character);
    addTagsWithType([...copyrightTags], TagType.copyright);
    addTagsWithType([...franchiseTags], TagType.copyright);
    addTagsWithType([...artistTags], TagType.artist);
    addTagsWithType([...directorTags], TagType.artist);
    addTagsWithType([...metaTags], TagType.meta);
    addTagsWithType([...generalTags], TagType.none);
    addTagsWithType([...speciesTags], TagType.species);
    addTagsWithType([...loreTags], TagType.lore);

    final String? dateStr = current['created_at']?.toString().substring(
      0,
      current['created_at']!.toString().length - 6,
    );

    final BooruItem item = BooruItem(
      fileURL: fileURL,
      sampleURL: sampleURL,
      thumbnailURL: previewURL,
      tagsList: [
        ...characterTags.map(Tag.new),
        ...copyrightTags.map(Tag.new),
        ...franchiseTags.map(Tag.new),
        ...artistTags.map(Tag.new),
        ...directorTags.map(Tag.new),
        ...metaTags.map(Tag.new),
        ...generalTags.map(Tag.new),
        ...speciesTags.map(Tag.new),
        ...loreTags.map(Tag.new),
      ],
      postURL: makePostURL(current['id'].toString()),
      fileExt: current['files']['meta']['ext'],
      fileSize: current['files']['meta']['size'],
      fileWidth: current['files']['original']['width']?.toDouble(),
      fileHeight: current['files']['original']['height']?.toDouble(),
      sampleWidth: hasSample
          ? current['files']['sample']['width'].toDouble()
          : current['files']['preview']['width']?.toDouble(),
      sampleHeight: hasSample
          ? current['files']['sample']['height'].toDouble()
          : current['files']['preview']['height']?.toDouble(),
      previewWidth: current['files']['preview']['width']?.toDouble(),
      previewHeight: current['files']['preview']['height']?.toDouble(),
      hasNotes: current['has']['notes'],
      serverId: current['id']?.toString(),
      rating: current['rating'],
      score: current['stats']['score']['total']?.toString(),
      sources: List<String>.from(current['sources'] ?? []),
      md5String: current['files']['meta']['md5'],
      postDate: dateStr, // 2021-06-13t02:09:45.138-04:00
      postDateFormat: 'iso',
    );

    return item;
  }

  @override
  String makePostURL(String id) {
    return '${booru.baseURL}/posts/$id?';
  }

  @override
  String makeURL(String tags) {
    return '${booru.baseURL}/posts.json?v2=true&mode=extended&tags=$tags&limit=$limit&page=$pageNum';
  }

  @override
  String makeTagURL(String input) {
    return '${booru.baseURL}/tags.json?search[name_matches]=$input*&limit=20&search[order]=count';
  }

  @override
  Map<String, String> getHeaders() {
    final String? userName = booru.userID?.isNotEmpty == true ? booru.userID : null;
    final String? apiKey = booru.apiKey?.isNotEmpty == true ? booru.apiKey : null;

    return {
      'Accept': 'text/html,application/xml,application/json',
      'User-Agent': Tools.browserUserAgent,
      if (userName != null && apiKey != null)
        'Authorization': "Basic ${base64.encode(utf8.encode("$userName:$apiKey"))}",
    };
  }

  @override
  List parseTagSuggestionsList(dynamic response) {
    final List parsedResponse = response.data;
    return parsedResponse;
  }

  @override
  TagSuggestion? parseTagSuggestion(dynamic responseItem, int index) {
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
    return TagSuggestion(
      tag: tagStr,
      type: tagType,
      count: responseItem['post_count'] ?? 0,
    );
  }
}
