import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

import 'package:lolisnatcher/src/boorus/sankaku_handler.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/comment_item.dart';
import 'package:lolisnatcher/src/data/constants.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';

class IdolSankakuHandler extends SankakuHandler {
  IdolSankakuHandler(super.booru, super.limit);

  @override
  Options? fetchSearchOptions() {
    // TODO without this and manual decode requests fail with endless redirect error. why it happens? dio doesn't consider the response data as json? some missing header in response?
    return Options(responseType: ResponseType.plain);
  }

  @override
  Options? fetchTagSuggestionsOptions() {
    return Options(responseType: ResponseType.plain);
  }

  @override
  Options? fetchCommentsOptions() {
    return Options(responseType: ResponseType.plain);
  }

  @override
  Map<String, String> getHeaders() {
    return {
      'User-Agent': EnvironmentConfig.hasSiSecret ? 'SCChannelApp/4.0 (Android; idol)' : Constants.defaultBrowserUserAgent,
    };
  }

  @override
  List parseListFromResponse(dynamic response) {
    if (response.data is String && (response.data as String).contains('post-premium-browsing_error')) {
      // after page 10 they redirect anon users to "buy premium or login" page
      return [];
    }

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
        sources: (current['source'] != null && current['source'] is String) ? [current['source']] : null,
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

    final authPart = (booru.userID?.isNotEmpty == true && booru.apiKey?.isNotEmpty == true && login.isNotEmpty && passHash.isNotEmpty && appkey.isNotEmpty)
        ? 'login=$login&password_hash=$passHash&appkey=$appkey&'
        : '';

    return '${booru.baseURL}/post/index.json?$authPart${tagsStr}limit=$limit&page=$pageNum';
  }

  @override
  String makeTagURL(String input) {
    final authPart = (booru.userID?.isNotEmpty == true && booru.apiKey?.isNotEmpty == true && login.isNotEmpty && passHash.isNotEmpty && appkey.isNotEmpty)
        ? 'login=$login&password_hash=$passHash&appkey=$appkey&'
        : '';

    return '${booru.baseURL}/tag/index.json?${authPart}name=$input*&limit=10';
  }

  @override
  String makeCommentsURL(String postID, int pageNum) {
    // EXAMPLE: https://iapi.sankakucomplex.com/comment/index.json?post_id=$post_id
    return '${booru.baseURL}/comment/index.json?post_id=$postID';
  }

  @override
  List parseTagSuggestionsList(dynamic response) {
    final List<dynamic> parsedResponse = jsonDecode(response.data);
    return parsedResponse;
  }

  @override
  List parseCommentsList(dynamic response) {
    final List<dynamic> parsedResponse = jsonDecode(response.data);
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

  @override
  bool get hasSignInSupport => true;

  String generateSha1(String str) {
    return sha1.convert(utf8.encode(str)).toString();
  }

  String login = '', appkey = '', passHash = '';

  @override
  Future<bool> canSignIn() async {
    return EnvironmentConfig.hasSiSecret && booru.userID?.isNotEmpty == true && booru.apiKey?.isNotEmpty == true;
  }

  @override
  Future<bool> isSignedIn() async {
    return login.isNotEmpty && appkey.isNotEmpty && passHash.isNotEmpty;
  }

  @override
  Future<bool> signIn() async {
    login = '';
    appkey = '';
    passHash = '';

    bool success = false;

    try {
      appkey = generateSha1(EnvironmentConfig.siSecret1.replaceAll('[username]', booru.userID!.toLowerCase()));
      passHash = generateSha1(EnvironmentConfig.siSecret2.replaceAll('[password]', booru.apiKey!));

      final res = await DioNetwork.post(
        '${booru.baseURL}/user/authenticate.json',
        headers: {
          'Accept-Encoding': 'gzip',
          'Cache-Control': 'no-store, no-cache, must-revalidate',
          'Connection': 'Keep-Alive',
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
          'User-Agent': 'SCChannelApp/4.0 (Android; idol)',
        },
        options: Options(
          contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        ),
        data: {
          'appkey': appkey,
          'login': booru.userID?.toLowerCase(),
          'password_hash': passHash,
        },
      );
      if (res.statusCode == 200) {
        login = res.data['current_user']?['name'];
        appkey = generateSha1(EnvironmentConfig.siSecret1.replaceAll('[username]', login.toLowerCase()));
        success = true;
      }
    } catch (e) {
      success = false;
    }
    return success;
  }

  @override
  Future<void> signOut({bool fromError = false}) async {
    login = '';
    appkey = '';
    passHash = '';
  }
}
