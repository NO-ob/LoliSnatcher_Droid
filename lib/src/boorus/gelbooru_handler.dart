import 'dart:async';
import 'dart:math';

import 'package:html/parser.dart';
import 'package:xml/xml.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/comment_item.dart';
import 'package:lolisnatcher/src/data/note_item.dart';
import 'package:lolisnatcher/src/data/tag.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/logger.dart';

class GelbooruHandler extends BooruHandler {
  GelbooruHandler(super.booru, super.limit);

  @override
  bool get hasSizeData => true;

  @override
  Map<String, TagType> get tagTypeMap => {
        '5': TagType.meta,
        '3': TagType.copyright,
        '4': TagType.character,
        '1': TagType.artist,
        '0': TagType.none,
      };

  @override
  Map<String, String> getHeaders() {
    return {
      ...super.getHeaders(),
      'Cookie': 'fringeBenefits=yup;', // unlocks restricted content (but it's probably not necessary)
    };
  }

  @override
  String validateTags(String tags) {
    if (tags.toLowerCase().contains('rating:safe')) {
      tags = tags.toLowerCase().replaceAll('rating:safe', 'rating:general');
    }
    return super.validateTags(tags);
  }

  @override
  List parseListFromResponse(dynamic response) {
    dynamic parsedResponse;
    try {
      parsedResponse = response.data;
    } catch (e) {
      // gelbooru returns xml response if request was denied for some reason
      // i.e. user hit a rate limit because he didn't include api key
      parsedResponse = XmlDocument.parse(response.data);
      final String? errorMessage = (parsedResponse as XmlDocument).getElement('response')?.getAttribute('reason')?.toString();
      if (errorMessage != null) {
        throw Exception(errorMessage);
      }
    }

    try {
      parseSearchCount(parsedResponse);
    } catch (e) {
      Logger.Inst().log('Error parsing search count: $e', className, 'parseListFromResponse::parseSearchCount', LogTypes.exception);
    }

    return (parsedResponse['post'] ?? []) as List;
  }

  @override
  BooruItem? parseItemFromResponse(dynamic responseItem, int index) {
    final current = responseItem;

    if (current['file_url'] != null) {
      // Fix for bleachbooru
      String fileURL = '', sampleURL = '', previewURL = '';
      fileURL += current['file_url']!.toString();
      // sample url is optional, on gelbooru there is sample == 0/1 to tell if it exists
      sampleURL += current['sample_url']?.toString() ?? current['file_url']!.toString();
      previewURL += current['preview_url']!.toString();
      if (!fileURL.contains('http')) {
        fileURL = booru.baseURL! + fileURL;
        sampleURL = booru.baseURL! + sampleURL;
        previewURL = booru.baseURL! + previewURL;
      }

      final BooruItem item = BooruItem(
        fileURL: fileURL,
        sampleURL: sampleURL,
        thumbnailURL: previewURL,
        // parseFragment to parse html elements (i.e. &amp; => &)
        tagsList: parseFragment(current['tags']).text?.split(' ') ?? [],
        postURL: makePostURL(current['id']!.toString()),
        fileWidth: double.tryParse(current['width']?.toString() ?? ''),
        fileHeight: double.tryParse(current['height']?.toString() ?? ''),
        sampleWidth: double.tryParse(current['sample_width']?.toString() ?? ''),
        sampleHeight: double.tryParse(current['sample_height']?.toString() ?? ''),
        previewWidth: double.tryParse(current['preview_width']?.toString() ?? ''),
        previewHeight: double.tryParse(current['preview_height']?.toString() ?? ''),
        hasNotes: current['has_notes']?.toString() == 'true',
        hasComments: current['has_comments']?.toString() == 'true',
        serverId: current['id']?.toString(),
        rating: current['rating']?.toString(),
        score: current['score']?.toString(),
        sources: (current['source'].runtimeType == String) ? [current['source']!] : null,
        md5String: current['md5']?.toString(),
        postDate: current['created_at']?.toString(), // Fri Jun 18 02:13:45 -0500 2021
        postDateFormat: 'EEE MMM dd HH:mm:ss  yyyy', // when timezone support added: "EEE MMM dd HH:mm:ss Z yyyy",
      );

      return item;
    }
    return null;
  }

  @override
  String makePostURL(String id) {
    // EXAMPLE: https://gelbooru.com/index.php?page=post&s=view&id=7296350
    return '${booru.baseURL}/index.php?page=post&s=view&id=$id';
  }

  @override
  String makeURL(String tags) {
    // EXAMPLE: https://gelbooru.com/index.php?page=dapi&s=post&q=index&tags=rating:general%20order:score&limit=20&pid=0&json=1
    final int cappedPage = max(0, pageNum);
    final String apiKeyStr = booru.apiKey?.isNotEmpty == true ? '&api_key=${booru.apiKey}' : '';
    final String userIdStr = booru.userID?.isNotEmpty == true ? '&user_id=${booru.userID}' : '';

    return "${booru.baseURL}/index.php?page=dapi&s=post&q=index&tags=${tags.replaceAll(" ", "+")}&limit=$limit&pid=$cappedPage&json=1$apiKeyStr$userIdStr";
  }

  // ----------------- Tag suggestions and tag handler stuff

  @override
  String makeTagURL(String input) {
    // EXAMPLE https://gelbooru.com/index.php?page=dapi&s=tag&q=index&name_pattern=nagat%25&limit=10&json=1
    final String apiKeyStr = booru.apiKey?.isNotEmpty == true ? '&api_key=${booru.apiKey}' : '';
    final String userIdStr = booru.userID?.isNotEmpty == true ? '&user_id=${booru.userID}' : '';
    return '${booru.baseURL}/index.php?page=dapi&s=tag&q=index&name_pattern=$input%&limit=10&json=1$apiKeyStr$userIdStr';
  }

  @override
  List parseTagSuggestionsList(dynamic response) {
    final parsedResponse = response.data['tag'] ?? [];
    return parsedResponse;
  }

  @override
  String? parseTagSuggestion(dynamic responseItem, int index) {
    final String tagStr = responseItem['name'] ?? '';
    if (tagStr.isEmpty) {
      return null;
    }

    // record tag data for future use
    final String rawTagType = responseItem['type']?.toString() ?? '';
    TagType tagType = TagType.none;
    if (rawTagType.isNotEmpty && tagTypeMap.containsKey(rawTagType)) {
      tagType = tagTypeMap[rawTagType] ?? TagType.none;
    }
    addTagsWithType([tagStr], tagType);
    return tagStr;
  }

  @override
  bool get shouldPopulateTags => true;

  @override
  String makeDirectTagURL(List<String> tags) {
    final String apiKeyStr = booru.apiKey?.isNotEmpty == true ? '&api_key=${booru.apiKey}' : '';
    final String userIdStr = booru.userID?.isNotEmpty == true ? '&user_id=${booru.userID}' : '';
    return "${booru.baseURL}/index.php?page=dapi&s=tag&q=index&names=${tags.join(" ")}&limit=100&json=1$apiKeyStr$userIdStr";
  }

  @override
  Future<List<Tag>> genTagObjects(List<String> tags) async {
    final List<Tag> tagObjects = [];
    Logger.Inst().log('Got tag list: $tags', className, 'genTagObjects', LogTypes.booruHandlerTagInfo);
    final String url = makeDirectTagURL(tags);
    Logger.Inst().log('DirectTagURL: $url', className, 'genTagObjects', LogTypes.booruHandlerTagInfo);
    try {
      final response = await DioNetwork.get(url, headers: getHeaders());
      // 200 is the success http response code
      if (response.statusCode == 200) {
        final parsedResponse = (response.data['tag']) ?? [];
        if (parsedResponse?.isNotEmpty ?? false) {
          Logger.Inst().log(
            'Tag response length: ${parsedResponse.length},Tag list length: ${tags.length}',
            className,
            'genTagObjects',
            LogTypes.booruHandlerTagInfo,
          );
          for (int i = 0; i < parsedResponse.length; i++) {
            final String fullString = parseFragment(parsedResponse.elementAt(i)['name']).text!;
            final String typeKey = parsedResponse.elementAt(i)['type'].toString();
            TagType tagType = TagType.none;
            if (tagTypeMap.containsKey(typeKey)) {
              tagType = tagTypeMap[typeKey] ?? TagType.none;
            }
            if (fullString.isNotEmpty) {
              tagObjects.add(Tag(fullString, tagType: tagType));
            }
          }
        }
      }
    } catch (e) {
      Logger.Inst().log(e.toString(), className, 'tagSearch', LogTypes.exception);
    }
    return tagObjects;
  }

  // ----------------- Search count

  void parseSearchCount(dynamic response) {
    final parsedResponse = response['@attributes']['count'] ?? 0;
    totalCount.value = parsedResponse;
  }

  // ----------------- Comments

  @override
  bool get hasCommentsSupport => true;

  @override
  String makeCommentsURL(String postID, int pageNum) {
    // EXAMPLE: https://gelbooru.com/index.php?page=dapi&s=comment&q=index&post_id=7296350
    final String apiKeyStr = booru.apiKey?.isNotEmpty == true ? '&api_key=${booru.apiKey}' : '';
    final String userIdStr = booru.userID?.isNotEmpty == true ? '&user_id=${booru.userID}' : '';
    return '${booru.baseURL}/index.php?page=dapi&s=comment&q=index&post_id=$postID$apiKeyStr$userIdStr';
  }

  @override
  List parseCommentsList(dynamic response) {
    final parsedResponse = XmlDocument.parse(response.data);
    return parsedResponse.findAllElements('comment').toList();
  }

  @override
  CommentItem? parseComment(dynamic responseItem, int index) {
    final current = responseItem;
    final String avatar = current.getAttribute('creator_id')!.isEmpty
        ? "${booru.baseURL}/user_avatars/avatar_${current.getAttribute("creator")}.jpg"
        : '${booru.baseURL}/user_avatars/honkonymous.png';

    return CommentItem(
      id: current.getAttribute('id'),
      title: current.getAttribute('id'),
      content: current.getAttribute('body'),
      authorID: current.getAttribute('creator_id'),
      authorName: current.getAttribute('creator'),
      postID: current.getAttribute('post_id'),
      avatarUrl: avatar,
      createDate: current.getAttribute('created_at'), // 2021-11-15 12:09
      createDateFormat: 'yyyy-MM-dd HH:mm',
    );
  }

  // ----------------- Notes

  @override
  bool get hasNotesSupport => true;

  @override
  String makeNotesURL(String postID) {
    // EXAMPLE: https://gelbooru.com/index.php?page=dapi&s=note&q=index&post_id=6512262
    final String apiKeyStr = booru.apiKey?.isNotEmpty == true ? '&api_key=${booru.apiKey}' : '';
    final String userIdStr = booru.userID?.isNotEmpty == true ? '&user_id=${booru.userID}' : '';
    return '${booru.baseURL}/index.php?page=dapi&s=note&q=index&post_id=$postID$apiKeyStr$userIdStr';
  }

  @override
  List parseNotesList(dynamic response) {
    final parsedResponse = XmlDocument.parse(response.data);
    return parsedResponse.findAllElements('note').toList();
  }

  @override
  NoteItem? parseNote(dynamic responseItem, int index) {
    final current = responseItem;
    return NoteItem(
      id: current.getAttribute('id'),
      postID: current.getAttribute('post_id'),
      content: current.getAttribute('body'),
      posX: int.tryParse(current.getAttribute('x') ?? '0') ?? 0,
      posY: int.tryParse(current.getAttribute('y') ?? '0') ?? 0,
      width: int.tryParse(current.getAttribute('width') ?? '0') ?? 0,
      height: int.tryParse(current.getAttribute('height') ?? '0') ?? 0,
    );
  }
}
