import 'dart:math';

import 'package:xml/xml.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/utils/logger.dart';

class MoebooruHandler extends BooruHandler {
  MoebooruHandler(super.booru, super.limit);

  @override
  bool get hasSizeData => true;

  @override
  bool get hasTagSuggestions => true;

  @override
  Map<String, TagType> get tagTypeMap => {
        '5': TagType.meta,
        '3': TagType.copyright,
        '4': TagType.character,
        '1': TagType.artist,
        '0': TagType.none,
      };

  @override
  List parseListFromResponse(dynamic response) {
    final parsedResponse = XmlDocument.parse(response.data);
    try {
      final int? count = int.tryParse(parsedResponse.findAllElements('posts').first.getAttribute('count') ?? '0');
      totalCount.value = count ?? 0;
    } catch (e, s) {
      Logger.Inst().log(
        '$e',
        className,
        'searchCount',
        LogTypes.exception,
        s: s,
      );
    }

    return parsedResponse.findAllElements('post').toList();
  }

  // TODO change to json
  // can probably use the same method as gelbooru when the individual BooruItem is moved to separate method
  @override
  BooruItem? parseItemFromResponse(dynamic responseItem, int index) {
    final current = responseItem;

    if (current.getAttribute('file_url') != null) {
      // Fix for bleachbooru
      String fileURL = '', sampleURL = '', previewURL = '';
      fileURL += current.getAttribute('file_url')!.toString();
      sampleURL += current.getAttribute('sample_url')!.toString();
      previewURL += current.getAttribute('preview_url')!.toString();
      if (!fileURL.contains('http')) {
        fileURL = booru.baseURL! + fileURL;
        sampleURL = booru.baseURL! + sampleURL;
        previewURL = booru.baseURL! + previewURL;
      }

      final BooruItem item = BooruItem(
        fileURL: fileURL,
        sampleURL: sampleURL,
        thumbnailURL: previewURL,
        tagsList: current.getAttribute('tags')!.split(' '),
        postURL: makePostURL(current.getAttribute('id')!),
        fileWidth: double.tryParse(current.getAttribute('width') ?? ''),
        fileHeight: double.tryParse(current.getAttribute('height') ?? ''),
        sampleWidth: double.tryParse(current.getAttribute('sample_width') ?? ''),
        sampleHeight: double.tryParse(current.getAttribute('sample_height') ?? ''),
        previewWidth: double.tryParse(current.getAttribute('preview_width') ?? ''),
        previewHeight: double.tryParse(current.getAttribute('preview_height') ?? ''),
        serverId: current.getAttribute('id'),
        rating: current.getAttribute('rating'),
        score: current.getAttribute('score'),
        sources: [
          if (current.getAttribute('source') == null) '' else current.getAttribute('source')!,
        ],
        md5String: current.getAttribute('md5'),
        postDate: current.getAttribute('created_at'), // Fri Jun 18 02:13:45 -0500 2021
        postDateFormat: 'unix', // when timezone support added: "EEE MMM dd HH:mm:ss Z yyyy",
      );

      return item;
    } else {
      return null;
    }
  }

  @override
  String makeURL(String tags, {bool forceXML = false}) {
    final int cappedPage = max(1, pageNum);
    final String loginStr = booru.userID?.isNotEmpty == true ? '&login=${booru.userID}' : '';
    final String apiKeyStr = booru.apiKey?.isNotEmpty == true ? '&api_key=${booru.apiKey}' : '';

    return '${booru.baseURL}/post.xml?tags=$tags&limit=$limit&page=$cappedPage$loginStr$apiKeyStr';
  }

  @override
  String makePostURL(String id) {
    return '${booru.baseURL}/post/show/$id/';
  }

  @override
  String makeTagURL(String input) {
    return '${booru.baseURL}/tag.xml?limit=20&order=count&name=$input*';
  }

  @override
  List parseTagSuggestionsList(dynamic response) {
    final parsedResponse = XmlDocument.parse(response.data);
    return parsedResponse.findAllElements('tag').toList();
  }

  @override
  String? parseTagSuggestion(dynamic responseItem, int index) {
    final String tagStr = responseItem.getAttribute('name')?.trim() ?? '';
    if (tagStr.isEmpty) {
      return null;
    }

    // record tag data for future use
    final String rawTagType = responseItem.getAttribute('type')?.toString() ?? '';
    TagType tagType = TagType.none;
    if (rawTagType.isNotEmpty && tagTypeMap.containsKey(rawTagType)) {
      tagType = tagTypeMap[rawTagType] ?? TagType.none;
    }
    addTagsWithType([tagStr], tagType);
    return tagStr;
  }

  // TODO parse comments from html
  @override
  bool get hasCommentsSupport => false;
}
