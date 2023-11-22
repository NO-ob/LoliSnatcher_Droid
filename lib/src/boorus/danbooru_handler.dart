import 'package:dio/dio.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/comment_item.dart';
import 'package:lolisnatcher/src/data/note_item.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

class DanbooruHandler extends BooruHandler {
  DanbooruHandler(super.booru, super.limit);

  @override
  Map<String, TagType> get tagTypeMap => {
        '5': TagType.meta,
        '3': TagType.copyright,
        '4': TagType.character,
        '1': TagType.artist,
        '0': TagType.none,
      };

  @override
  bool get hasSizeData => true;

  @override
  bool get hasCommentsSupport => true;

  @override
  bool get hasNotesSupport => true;

  @override
  String validateTags(String tags) {
    if (tags.toLowerCase().contains('rating:safe') && booru.baseURL!.contains('danbooru.donmai.us')) {
      tags = tags.toLowerCase().replaceAll('rating:safe', 'rating:general');
    }
    return super.validateTags(tags);
  }

  @override
  Map<String, String> getHeaders() {
    final defaultHeaders = super.getHeaders();
    defaultHeaders['User-Agent'] = Tools.appUserAgent;
    return defaultHeaders;
  }

  // TODO set booru useragent in the handler itself to avoid overriding fetch func?
  @override
  Future<Response<dynamic>> fetchSearch(Uri uri, {bool withCaptchaCheck = true, Map<String, dynamic>? queryParams}) async {
    final String cookies = await getCookies() ?? '';
    final Map<String, String> headers = {
      ...getHeaders(),
      if (cookies.isNotEmpty) 'Cookie': cookies,
    };

    Logger.Inst().log('fetching: $uri with headers: $headers', className, 'Search', LogTypes.booruHandlerSearchURL);

    return DioNetwork.get(
      uri.toString(),
      headers: headers,
      queryParameters: queryParams,
      options: fetchSearchOptions(),
      customInterceptor: withCaptchaCheck ? (dio) => DioNetwork.captchaInterceptor(dio, customUserAgent: Tools.appUserAgent) : null,
    );
  }

  @override
  List parseListFromResponse(dynamic response) {
    final List parsedResponse = response.data;
    return parsedResponse;
  }

  @override
  BooruItem? parseItemFromResponse(dynamic responseItem, int index) {
    final current = responseItem;
    /**
     * This check is needed as danbooru will return items which have been banned or deleted and will not have any image urls
     * to go with the rest of the data so cannot be displayed and are pointless for the app
     */
    if (current.containsKey('file_url')) {
      if (current['file_url'].length > 0) {
        addTagsWithType(
          current['tag_string_general'].toString().split(' '),
          TagType.none,
        );
        addTagsWithType(
          current['tag_string_character'].toString().split(' '),
          TagType.character,
        );
        addTagsWithType(
          current['tag_string_copyright'].toString().split(' '),
          TagType.copyright,
        );
        addTagsWithType(
          current['tag_string_artist'].toString().split(' '),
          TagType.artist,
        );
        addTagsWithType(
          current['tag_string_meta'].toString().split(' '),
          TagType.meta,
        );

        final bool isZip = current['file_url'].toString().endsWith('.zip');
        final String? dateStr = current['created_at']?.toString().substring(0, current['created_at']!.toString().length - 6);
        final BooruItem item = BooruItem(
          fileURL: isZip ? current['large_file_url'].toString() : current['file_url'].toString(),
          sampleURL: current['large_file_url'].toString(),
          thumbnailURL: current['preview_file_url'].toString(),
          tagsList: current['tag_string'].toString().split(' '),
          postURL: makePostURL(current['id'].toString()),
          fileSize: int.tryParse(current['file_size'].toString()),
          fileHeight: double.tryParse(current['image_height'].toString()),
          fileWidth: double.tryParse(current['image_width'].toString()),
          hasNotes: current['last_noted_at'] != null,
          hasComments: current['last_commented_at'] != null,
          serverId: current['id'].toString(),
          rating: current['rating'].toString(),
          score: current['score'].toString(),
          sources: [current['source'].toString()],
          md5String: current['md5'].toString(),
          postDate: dateStr, // 2021-06-17T16:27:45.743-04:00
          postDateFormat: 'iso',
        );
        return item;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  String makePostURL(String id) {
    return '${booru.baseURL}/posts/$id';
  }

  @override
  String makeURL(String tags) {
    // EXAMPLE: https://danbooru.donmai.us/posts.json?tags=rating:safe%20order:rank&limit=20&page=1
    final String loginStr = booru.userID?.isNotEmpty == true ? '&login=${booru.userID}' : '';
    final String apiKeyStr = booru.apiKey?.isNotEmpty == true ? '&api_key=${booru.apiKey}' : '';
    return '${booru.baseURL}/posts.json?tags=$tags&limit=$limit&page=$pageNum$loginStr$apiKeyStr';
  }

  @override
  String makeTagURL(String input) {
    // autocomplete.json is better
    // return "${booru.baseURL}/tags.json?search[name_matches]=$input*&limit=10&order=count";

    // EXAMPLE: https://danbooru.donmai.us/autocomplete.json?search[query]=fis&search[type]=tag_query&limit=10
    return '${booru.baseURL}/autocomplete.json?search[query]=$input*&search[type]=tag_query&limit=10&order=count';
  }

  @override
  String makeCommentsURL(String postID, int pageNum) {
    // EXAMPLE: https://danbooru.donmai.us/comments.json?search[post_id]=4916722&group_by=comment&only=id,created_at,post_id,creator,body,score
    return '${booru.baseURL}/comments.json?search[post_id]=$postID&group_by=comment&only=id,created_at,post_id,creator,body,score';
  }

  @override
  List parseTagSuggestionsList(dynamic response) {
    final List<dynamic> parsedResponse = response.data;
    return parsedResponse;
  }

  @override
  String? parseTagSuggestion(dynamic responseItem, int index) {
    final String tagStr = (responseItem['antecedent'] ?? responseItem['value'])?.toString() ?? '';
    if (tagStr.isEmpty) {
      return null;
    }

    final String rawTagType = responseItem['category']?.toString() ?? '';
    TagType tagType = TagType.none;
    if (rawTagType.isNotEmpty && tagTypeMap.containsKey(rawTagType)) {
      tagType = tagTypeMap[rawTagType] ?? TagType.none;
    }
    addTagsWithType([tagStr], tagType);
    return tagStr;
  }

  @override
  List parseCommentsList(dynamic response) {
    final List<dynamic> parsedResponse = response.data;
    return parsedResponse;
  }

  @override
  CommentItem? parseComment(dynamic responseItem, int index) {
    final String? dateStr = responseItem['created_at']?.toString().substring(0, responseItem['created_at']!.toString().length - 6);
    return CommentItem(
      id: responseItem['id'].toString(),
      title: responseItem['post_id'].toString(),
      content: responseItem['body'].toString(),
      authorID: responseItem['creator']['id'].toString(),
      authorName: responseItem['creator']['name'].toString(),
      score: responseItem['score'],
      postID: responseItem['post_id'].toString(),
      createDate: dateStr, // 2021-11-29T01:42:28.351-05:00
      // TODO throws exception when parsing date, fix this
      createDateFormat: 'iso',
    );
  }

  @override
  String makeNotesURL(String postID) {
    // EXAMPLE: https://danbooru.donmai.us/notes.json?search[post_id]=3519493
    return '${booru.baseURL}/notes.json?search[post_id]=$postID';
  }

  @override
  List parseNotesList(dynamic response) {
    final List<dynamic> parsedResponse = response.data;
    return parsedResponse;
  }

  @override
  NoteItem? parseNote(dynamic responseItem, int index) {
    final current = responseItem;
    return NoteItem(
      id: current['id'].toString(),
      postID: current['post_id'].toString(),
      content: current['body'],
      posX: int.tryParse(current['x']?.toString() ?? '0') ?? 0,
      posY: int.tryParse(current['y']?.toString() ?? '0') ?? 0,
      width: int.tryParse(current['width']?.toString() ?? '0') ?? 0,
      height: int.tryParse(current['height']?.toString() ?? '0') ?? 0,
    );
  }
}
