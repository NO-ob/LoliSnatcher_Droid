import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:lolisnatcher/src/boorus/sankaku_handler.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/comment_item.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';

class IdolSankakuHandler extends SankakuHandler {
  IdolSankakuHandler(super.booru, super.limit);

  @override
  Options? fetchSearchOptions() {
    // TODO without this and manual decode requests fail with endless redirect error. why it happens? dio doesn't consider the response data as json? some missing header in response?
    return Options(responseType: ResponseType.plain);
  }

  @override
  List parseListFromResponse(dynamic response) {
    final List<dynamic> parsedResponse = jsonDecode(response.data);
    return parsedResponse;
  }

  @override
  BooruItem? parseItemFromResponse(dynamic responseItem, int index) {
    final current = responseItem;
    final List<String> tags = [];
    final Map<TagType, List<String>> tagMap = {};
    for (int x = 0; x < current['tags'].length; x++) {
      tags.add(current['tags'][x]['name'].toString());
      final String typeStr = current['tags'][x]['type'].toString();
      final TagType type = tagTypeMap[typeStr] ?? TagType.none;
      if (tagMap.containsKey(type)) {
        tagMap[type]?.add(current['tags'][x]['name'].toString());
      } else {
        tagMap[type] = [current['tags'][x]['name'].toString()];
      }
    }
    if (current['file_url'] != null) {
      for (int i = 0; i < tagMap.entries.length; i++) {
        addTagsWithType(tagMap.entries.elementAt(i).value, tagMap.entries.elementAt(i).key);
      }
      const String protocol = 'https:';

      final postDateIsString = current['created_at'] is String;
      // ISO string or unix time without in seconds (need to x1000?)
      final postDate = postDateIsString ? current['created_at'] : current['created_at']['s'].toString();
      final postDateFormat = postDateIsString ? 'iso' : 'unix';

      final BooruItem item = BooruItem(
        fileURL: protocol + current['file_url'],
        sampleURL: protocol + current['sample_url'],
        thumbnailURL: protocol + current['preview_url'],
        tagsList: tags,
        postURL: makePostURL(current['id'].toString()),
        fileSize: current['file_size'],
        fileWidth: current['width'].toDouble(),
        fileHeight: current['height'].toDouble(),
        sampleWidth: current['sample_width'].toDouble(),
        sampleHeight: current['sample_height'].toDouble(),
        previewWidth: current['preview_width'].toDouble(),
        previewHeight: current['preview_height'].toDouble(),
        hasNotes: current['has_notes'],
        hasComments: current['has_comments'],
        serverId: current['id'].toString(),
        rating: current['rating'],
        score: current['total_score'].toString(),
        sources: [current['source']],
        md5String: current['md5'],
        postDate: postDate,
        postDateFormat: postDateFormat,
      );

      return item;
    } else {
      return null;
    }
  }

  @override
  String makePostURL(String id) {
    return 'https://idol.sankakucomplex.com/post/show/$id';
  }

  @override
  String makeURL(String tags) {
    final tagsStr = tags.trim().isEmpty ? '' : 'tags=${tags.trim()}&';

    return '${booru.baseURL}/post/index.json?${tagsStr}limit=$limit&page=$pageNum';
  }

  @override
  String makeTagURL(String input) {
    return '${booru.baseURL}/tag/index.json?name=$input*&limit=10';
  }

  @override
  String makeCommentsURL(String postID, int pageNum) {
    // EXAMPLE: https://iapi.sankakucomplex.com/comment/index.json?post_id=$post_id
    return '${booru.baseURL}/comment/index.json?post_id=$postID';
  }

  @override
  List parseCommentsList(dynamic response) {
    final List<dynamic> parsedResponse = response.data;
    return parsedResponse;
  }

  @override
  CommentItem? parseComment(dynamic responseItem, int index) {
    final current = responseItem;
    return CommentItem(
      id: current['id'].toString(),
      title: current['post_id'].toString(),
      content: current['body'].toString(),
      authorID: current['creator_id'].toString(),
      authorName: current['creator'].toString(),
      avatarUrl: current['creator_avatar']?.toString().replaceFirst('//', 'https://'),
      score: current['score'],
      postID: current['post_id'].toString(),
      createDate: current['created_at'].toString(), // 2021-11-15 12:09
      createDateFormat: 'yyyy-MM-dd HH:mm',
    );
  }

  @override
  String makeNotesURL(String postID) {
    return '${booru.baseURL}/note/index.json?post_id=$postID';
  }
}
