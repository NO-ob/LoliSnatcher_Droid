import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:xml/xml.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/comment_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

class ShimmieHandler extends BooruHandler {
  ShimmieHandler(super.booru, super.limit);

  @override
  bool get hasSizeData => true;

  @override
  String validateTags(String tags) {
    if (tags == ' ' || tags == '') {
      return '*';
    } else {
      return super.validateTags(tags);
    }
  }

  @override
  List parseListFromResponse(dynamic response) {
    final parsedResponse = XmlDocument.parse(response.data);
    try {
      parseSearchCount(parsedResponse);
    } catch (e, s) {
      Logger.Inst().log(
        'Error parsing search count: $e',
        className,
        'parseListFromResponse::parseSearchCount',
        LogTypes.exception,
        s: s,
      );
    }
    /**
     * This creates a list of xml elements 'post' to extract only the post elements which contain
     * all the data needed about each image
     */
    List posts = parsedResponse.findAllElements('post').toList();
    if (posts.isEmpty) {
      posts = parsedResponse.findAllElements('tag').toList();
    }
    return posts;
  }

  @override
  BooruItem? parseItemFromResponse(dynamic responseItem, int index) {
    final current = responseItem as XmlElement;
    if (current.getAttribute('file_url') != null) {
      String preURL = '';
      if (booru.baseURL!.contains('https://whyneko.com/booru')) {
        // special case for whyneko
        preURL = booru.baseURL!.split('/booru')[0];
      }

      final String thumbnailUrl = preURL + current.getAttribute('preview_url')!, fileUrl = preURL + current.getAttribute('file_url')!;

      final String dateString = current.getAttribute('date').toString();
      final BooruItem item = BooruItem(
        fileURL: fileUrl,
        sampleURL: fileUrl,
        thumbnailURL: thumbnailUrl,
        tagsList: current.getAttribute('tags')!.split(' '),
        postURL: makePostURL(current.getAttribute('id')!),
        fileWidth: double.tryParse(current.getAttribute('width') ?? ''),
        fileHeight: double.tryParse(current.getAttribute('height') ?? ''),
        previewWidth: double.tryParse(current.getAttribute('preview_width') ?? ''),
        previewHeight: double.tryParse(current.getAttribute('preview_height') ?? ''),
        serverId: current.getAttribute('id'),
        score: current.getAttribute('score'),
        sources: (current.getAttribute('source') != null && current.getAttribute('source') is String) ? [current.getAttribute('source')!] : null,
        md5String: current.getAttribute('md5'),
        postDate: dateString, // 2021-06-18 04:37:31
        postDateFormat: 'yyyy-MM-dd HH:mm:ss',
      );

      return item;
    } else {
      return null;
    }
  }

  void parseSearchCount(XmlDocument response) {
    final parsedResponse = response.findAllElements('posts').toList()[0];
    final int count = int.tryParse(parsedResponse.getAttribute('count') ?? '0') ?? 0;
    totalCount.value = count;
  }

  @override
  String makePostURL(String id) {
    return '${booru.baseURL}/post/view/$id';
  }

  @override
  String makeURL(String tags) {
    return '${booru.baseURL}/api/danbooru/find_posts/index.xml?tags=$tags&limit=$limit&page=$pageNum';
  }

  @override
  String makeTagURL(String input) {
    if (booru.baseURL!.contains('rule34.paheal.net')) {
      return '${booru.baseURL}/api/internal/autocomplete?s=$input'; // doesn't allow limit, but sorts by popularity
    } else {
      // TODO others don't support / don't have the parser?
      return '';
      // return '${booru.baseURL}/tags.json?search[name_matches]=$input*&limit=10';
    }
  }

  @override
  List parseTagSuggestionsList(dynamic response) {
    // TODO explain why this
    return response.data.substring(1, response.data.length - 1).replaceAll(RegExp('(:.([0-9])+)'), '').replaceAll('"', '').split(',');
  }

  @override
  String? parseTagSuggestion(dynamic responseItem, int index) {
    // all manipulations were already done in list parse
    return responseItem;
  }

  @override
  bool get hasCommentsSupport => true;

  @override
  String makeCommentsURL(String postID, int pageNum) {
    return makePostURL(postID);
  }

  @override
  List parseCommentsList(dynamic response) {
    final document = parse(response.data);
    return document.querySelectorAll('.comment:not(.comment_add)');
  }

  @override
  CommentItem? parseComment(dynamic responseItem, int index) {
    final current = responseItem;
    return CommentItem(
      id: current.attributes['id'],
      // title: postID,
      content: current.nodes[current.nodes.length - 1].text.toString().replaceFirst(': ', '').replaceFirst('\n\t\t\t\t', ''),
      authorName: current.querySelector('.username')?.text.toString(),
      // postID: postID,
      createDate: current.querySelector('time')?.attributes['datetime']?.split('+')[0].toString(), // 2021-12-25t10:02:28+00:00
      createDateFormat: 'iso',
    );
  }
}

class ShimmieHtmlHandler extends BooruHandler {
  ShimmieHtmlHandler(super.booru, super.limit);

  @override
  bool get hasSizeData => true;

  @override
  String validateTags(String tags) {
    if (tags == ' ' || tags == '') {
      return '';
    } else {
      return super.validateTags(tags);
    }
  }

  @override
  List parseListFromResponse(dynamic response) {
    final document = parse(response.data);
    return document.getElementsByClassName('thumb');
  }

  @override
  BooruItem? parseItemFromResponse(dynamic responseItem, int index) {
    try {
      final current = responseItem as Element;
      final img = current.firstChild!.firstChild!;
      final imgData = img.attributes['title']!.split('\n');
      final resSizeDate = imgData[1].split(' // ');
      final res = resSizeDate[0].trim().split('x');
      final size = Tools.parseFormattedBytes(resSizeDate[1].trim());
      // final date = resSizeDate[2]; // TODO

      final String id = current.attributes['data-post-id']!;
      final String fileExt = current.attributes['data-ext']!;
      final String thumbURL = img.attributes['src']!;
      final double? thumbWidth = double.tryParse(img.attributes['width'] ?? '');
      final double? thumbHeight = double.tryParse(img.attributes['height'] ?? '');
      final double? fileWidth = double.tryParse(res[0]);
      final double? fileHeight = double.tryParse(res[1]);
      String fileURL = current.children[2].attributes['href']!; // "File only" link
      fileURL = '$fileURL${fileURL.contains('?') ? '&' : '?'}file_ext=$fileExt';
      final List<String> tags = current.attributes['data-tags']?.split(' ') ?? [];

      final BooruItem item = BooruItem(
        thumbnailURL: booru.baseURL! + thumbURL,
        sampleURL: fileURL,
        fileURL: fileURL,
        fileExt: fileExt,
        fileSize: size == 0 ? null : size,
        previewWidth: thumbWidth,
        previewHeight: thumbHeight,
        fileWidth: fileWidth,
        fileHeight: fileHeight,
        tagsList: tags,
        md5String: fileURL.split('/').last,
        postURL: makePostURL(id),
        serverId: id,
      );

      return item;
    } catch (e, s) {
      Logger.Inst().log(
        e,
        'ShimmieHtmlHandler',
        'parseItemFromResponse',
        LogTypes.booruHandlerParseFailed,
        s: s,
      );
      return null;
    }
  }

  @override
  String makePostURL(String id) {
    return '${booru.baseURL}/post/view/$id';
  }

  @override
  String makeURL(String tags) {
    String tagsText = tags.replaceAll(' ', '+');
    tagsText = tagsText.isEmpty ? '' : '$tagsText/';
    return '${booru.baseURL}/post/list/$tagsText$pageNum';
  }

  @override
  String makeTagURL(String input) {
    if (booru.baseURL!.contains('rule34.paheal.net')) {
      return '${booru.baseURL}/api/internal/autocomplete?s=$input'; // doesn't allow limit, but sorts by popularity
    } else {
      // TODO others don't support / don't have the parser?
      return '';
      // return '${booru.baseURL}/tags.json?search[name_matches]=$input*&limit=10';
    }
  }

  @override
  List parseTagSuggestionsList(dynamic response) {
    // TODO explain why this
    return response.data.substring(1, response.data.length - 1).replaceAll(RegExp('(:.([0-9])+)'), '').replaceAll('"', '').split(',');
  }

  @override
  String? parseTagSuggestion(dynamic responseItem, int index) {
    // all manipulations were already done in list parse
    return responseItem;
  }

  @override
  bool get hasCommentsSupport => true;

  @override
  String makeCommentsURL(String postID, int pageNum) {
    return makePostURL(postID);
  }

  @override
  List parseCommentsList(dynamic response) {
    final document = parse(response.data);
    return document.querySelectorAll('.comment:not(.comment_add)');
  }

  @override
  CommentItem? parseComment(dynamic responseItem, int index) {
    final current = responseItem as Element;
    return CommentItem(
      id: current.attributes['id'],
      // title: postID,
      content: current.querySelector('.bbcode')?.text,
      authorName: current.querySelector('.username')?.text,
      // postID: postID,
      createDate: current.querySelector('time')?.attributes['datetime']?.split('+')[0], // 2021-12-25t10:02:28+00:00
      createDateFormat: 'iso',
    );
  }
}
