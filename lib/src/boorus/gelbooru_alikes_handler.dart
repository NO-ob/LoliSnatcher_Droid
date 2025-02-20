import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:xml/xml.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/comment_item.dart';
import 'package:lolisnatcher/src/data/note_item.dart';
import 'package:lolisnatcher/src/data/tag_suggestion.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

// TODO json parser? (add &json=1 to urls)
// rule34.xxx, safebooru.org, realbooru.com

class GelbooruAlikesHandler extends BooruHandler {
  GelbooruAlikesHandler(super.booru, super.limit);

  @override
  bool get hasSizeData => true;

  @override
  bool get hasTagSuggestions => true;

  bool get isR34xxx => booru.baseURL!.contains('rule34.xxx');

  // TODO ?
  //Realbooru api returns 0 for models but on the website shows them
  //listed as model on the tagsearch so I dont think the api shows tag types properly
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
    // <post file_url="..." />
    return parsedResponse.findAllElements('post').toList();
  }

  @override
  BooruItem? parseItemFromResponse(dynamic responseItem, int index) {
    final current = responseItem;

    if (getAttrOrElem(current, 'file_url') != null) {
      // Fix for bleachbooru
      String fileURL = '', sampleURL = '', previewURL = '';
      fileURL += getAttrOrElem(current, 'file_url')!.toString();
      // sample url is optional, on gelbooru there is sample == 0/1 to tell if it exists
      sampleURL += getAttrOrElem(current, 'sample_url')?.toString() ?? getAttrOrElem(current, 'file_url')!.toString();
      previewURL += getAttrOrElem(current, 'preview_url')!.toString();
      if (!fileURL.contains('http')) {
        fileURL = booru.baseURL! + fileURL;
        sampleURL = booru.baseURL! + sampleURL;
        previewURL = booru.baseURL! + previewURL;
      }

      if (booru.baseURL!.contains('realbooru.com')) {
        // The api is shit and returns a bunch of broken urls so the urls need to be constructed,
        // We also cant trust the directory variable in the json because it is wrong on old posts
        final String hash = getAttrOrElem(current, 'md5')!.toString();
        final String directory = '${hash.substring(0, 2)}/${hash.substring(2, 4)}';
        // Hash and file can be mismatched so we only use file for file ext
        final String fileExt = Tools.getFileExt(getAttrOrElem(current, 'file_url')!.toString());
        fileURL = '${booru.baseURL}/images/$directory/$hash.$fileExt';

        final bool isSample = !fileURL.endsWith('.webm') && getAttrOrElem(current, 'sample_url')!.toString().contains('/samples/');
        // String sampleExt = Tools.getFileExt(getAttrOrElem(current, "sample_url")!.toString());
        sampleURL = isSample ? getAttrOrElem(current, 'sample_url')!.toString() : fileURL;
        // sampleURL = "${booru.baseURL}/${isSample ? "samples" : "images"}/$directory/${isSample ? "sample_" : ""}$hash.$sampleExt";

        previewURL = '${booru.baseURL}/thumbnails/$directory/thumbnail_$hash.jpg';
      }
      if (booru.baseURL!.contains('furry.booru.org')) {
        previewURL = previewURL.replaceFirst('.png', '.jpg');
        if (sampleURL != fileURL && sampleURL.contains('samples')) {
          sampleURL = sampleURL.replaceFirst('.png', '.jpg');
        }
      }

      final List<String> tags = parseFragment(getAttrOrElem(current, 'tags')).text?.split(' ') ?? [];

      final BooruItem item = BooruItem(
        fileURL: fileURL,
        sampleURL: sampleURL,
        thumbnailURL: previewURL,
        tagsList: tags,
        postURL: makePostURL(getAttrOrElem(current, 'id')!.toString()),
        fileWidth: double.tryParse(getAttrOrElem(current, 'width')?.toString() ?? ''),
        fileHeight: double.tryParse(getAttrOrElem(current, 'height')?.toString() ?? ''),
        sampleWidth: double.tryParse(getAttrOrElem(current, 'sample_width')?.toString() ?? ''),
        sampleHeight: double.tryParse(getAttrOrElem(current, 'sample_height')?.toString() ?? ''),
        previewWidth: double.tryParse(getAttrOrElem(current, 'preview_width')?.toString() ?? ''),
        previewHeight: double.tryParse(getAttrOrElem(current, 'preview_height')?.toString() ?? ''),
        hasNotes: getAttrOrElem(current, 'has_notes')?.toString() == 'true',
        // TODO rule34xxx api bug? sometimes (mostly when there is only one comment) api returns empty array
        hasComments: getAttrOrElem(current, 'has_comments')?.toString() == 'true',
        serverId: getAttrOrElem(current, 'id')?.toString(),
        rating: getAttrOrElem(current, 'rating')?.toString(),
        score: getAttrOrElem(current, 'score')?.toString(),
        sources: getAttrOrElem(current, 'source') != null ? [getAttrOrElem(current, 'source')!] : null,
        md5String: getAttrOrElem(current, 'md5')?.toString(),
        postDate: getAttrOrElem(current, 'created_at')?.toString(), // Fri Jun 18 02:13:45 -0500 2021
        postDateFormat: 'EEE MMM dd HH:mm:ss  yyyy', // when timezone support added: "EEE MMM dd HH:mm:ss Z yyyy",
      );

      if (booru.baseURL!.contains('realbooru.com')) {
        // the api is even shittier now and they don't even return correct file extensions
        // now we'll have to either rely on tags and make a bunch of requests for each item to get the real file ext
        item.possibleMediaType.value = (tags.contains('gif') || tags.contains('animated_gif'))
            ? MediaType.animation
            : (tags.contains('webm') || tags.contains('mp4') || tags.contains('sound'))
                ? MediaType.video
                : null;
        item.mediaType.value = MediaType.needsExtraRequest;
      }

      return item;
    } else {
      return null;
    }
  }

  dynamic getAttrOrElem(XmlElement item, String key) {
    return item.getAttribute(key);
  }

  @override
  String makePostURL(String id) {
    // EXAMPLE: https://safebooru.org/index.php?page=post&s=view&id=645243
    return '${booru.baseURL}/index.php?page=post&s=view&id=$id';
  }

  @override
  String makeURL(String tags) {
    // EXAMPLE: https://safebooru.org/index.php?page=dapi&s=post&q=index&tags=rating:safe+sort:score+translated&limit=50&pid=0
    String baseUrl = booru.baseURL!;
    if (isR34xxx) {
      // because requests to default url are protected by a captcha
      baseUrl = 'https://api.rule34.xxx';
    }

    final int cappedPage = max(0, pageNum);
    final String apiKeyStr = booru.apiKey?.isNotEmpty == true ? '&api_key=${booru.apiKey}' : '';
    final String userIdStr = booru.userID?.isNotEmpty == true ? '&user_id=${booru.userID}' : '';

    return "$baseUrl/index.php?page=dapi&s=post&q=index&tags=${tags.replaceAll(" ", "+")}&limit=$limit&pid=$cappedPage$apiKeyStr$userIdStr";
  }

  // ----------------- Tag suggestions and tag handler stuff

  @override
  String makeTagURL(String input) {
    // EXAMPLE: https://safebooru.org/autocomplete.php?q=naga
    String baseUrl = booru.baseURL!;
    if (isR34xxx) {
      baseUrl = 'https://api.rule34.xxx';
    }
    return '$baseUrl/index.php?page=dapi&s=tag&q=index&name_pattern=$input%&limit=20&order=count&direction=desc';
    // return '$baseUrl/autocomplete.php?q=$input';
  }

  @override
  List parseTagSuggestionsList(dynamic response) {
    return ((response.data is String && response.data?.startsWith('<?xml') == true)
            ? XmlDocument.parse(response.data).findAllElements('tag').toList()
            : jsonDecode(response.data)) ??
        [];
  }

  @override
  TagSuggestion? parseTagSuggestion(dynamic responseItem, int index) {
    if (responseItem is XmlElement) {
      final String tagStr = getAttrOrElem(responseItem, 'name') as String? ?? '';
      final int count = int.tryParse(getAttrOrElem(responseItem, 'count')?.toString() ?? '0') ?? 0;
      final String rawTagType = getAttrOrElem(responseItem, 'type')?.toString() ?? '';
      TagType tagType = TagType.none;
      if (rawTagType.isNotEmpty && tagTypeMap.containsKey(rawTagType)) {
        tagType = tagTypeMap[rawTagType] ?? TagType.none;
      }
      addTagsWithType([tagStr], tagType);

      return TagSuggestion(
        tag: tagStr,
        count: count,
        type: tagType,
      );
    } else {
      final labelCountRegExp = RegExp(r'\((\d+)\)$');
      return TagSuggestion(
        tag: responseItem['value'] ?? '',
        count: int.tryParse(labelCountRegExp.firstMatch(responseItem['label'])?.group(1) ?? '0') ?? 0,
      );
    }
  }

  // ----------------- Search count

  @override
  Future<void> searchCount(String input) async {
    int result = 0;
    // gelbooru json has count in @attributes, but there is no count data on r34xxx json, so we switch back to xml
    final String url = makeURL(validateTags(input));

    final String cookies = await getCookies() ?? '';
    final Map<String, String> headers = {
      ...getHeaders(),
      if (cookies.isNotEmpty) 'Cookie': cookies,
    };

    try {
      final response = await DioNetwork.get(url, headers: headers);
      // 200 is the success http response code
      if (response.statusCode == 200) {
        final parsedResponse = XmlDocument.parse(response.data);
        final root = parsedResponse.findAllElements('posts').toList();
        if (root.length == 1) {
          result = int.parse(root[0].getAttribute('count') ?? '0');
        }
      }
    } catch (e) {
      Logger.Inst().log(e.toString(), className, 'searchCount', LogTypes.exception);
    }
    totalCount.value = result;
    return;
  }

  // ----------------- Comments

  @override
  bool get hasCommentsSupport => true;

  @override
  Future<List<CommentItem>> getComments(
    String postID,
    int pageNum, {
    CancelToken? cancelToken,
  }) async {
    List<CommentItem> comments = [];
    comments = await super.getComments(postID, pageNum, cancelToken: cancelToken);

    if (isR34xxx && comments.isEmpty) {
      // single comment not loading through api workaround
      try {
        final postUrl = makePostURL(postID);
        final cookies = await getCookiesForPost(postUrl);
        final res = await DioNetwork.get(
          postUrl,
          headers: {
            ...getHeaders(),
            if (isR34xxx && cookies?.isNotEmpty == true) 'Cookie': cookies,
          },
          options: Options(
            sendTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
          ),
          cancelToken: cancelToken,
          customInterceptor: DioNetwork.captchaInterceptor,
        );

        if (res.statusCode == 200) {
          final document = parse(res.data);
          final container = document.querySelector('#comment-list');
          if (container != null) {
            final elements = container.children.where((e) => e.localName == 'div');
            for (final c in elements) {
              try {
                final header = c.querySelector('.col1');
                final content = c.querySelector('.col2');

                if (header != null && content != null) {
                  final String headerSecondRowText = header.querySelector('b')?.text ?? '';
                  final scoreRegex = RegExp(r'Score: (\d+)', caseSensitive: false);
                  final timeRegex = RegExp(r'Posted on (\d+-\d+-\d+ \d+:\d+:\d+)', caseSensitive: false);
                  comments.add(
                    CommentItem(
                      id: c.attributes['id']?.trim(),
                      title: header.querySelector('span')?.text.replaceAll('>> #', '').trim(),
                      content: content.text.trim(),
                      authorName: header.querySelector('a')?.text.trim(),
                      postID: postID,
                      score: scoreRegex.hasMatch(headerSecondRowText) ? int.tryParse(scoreRegex.firstMatch(headerSecondRowText)!.group(1)!) : null,
                      createDate: timeRegex.hasMatch(headerSecondRowText) ? timeRegex.firstMatch(headerSecondRowText)!.group(1)!.trim() : null,
                      createDateFormat: 'yyyy-MM-dd HH:mm:ss',
                    ),
                  );
                }
              } catch (e, s) {
                Logger.Inst().log(
                  'Failed to parse comment through alternative method',
                  className,
                  'getComments',
                  LogTypes.booruHandlerFetchFailed,
                  s: s,
                );
              }
            }
          }
        }
      } catch (e, s) {
        Logger.Inst().log(
          'Failed to fetch/parse comments through alternative method',
          className,
          'getComments',
          LogTypes.booruHandlerFetchFailed,
          s: s,
        );
      }
    }

    return comments;
  }

  @override
  String makeCommentsURL(String postID, int pageNum) {
    // EXAMPLE: https://safebooru.org/index.php?page=dapi&s=comment&q=index&post_id=1
    String baseUrl = booru.baseURL!;
    if (isR34xxx) {
      baseUrl = 'https://api.rule34.xxx';
    }

    return '$baseUrl/index.php?page=dapi&s=comment&q=index&post_id=$postID';
  }

  @override
  List parseCommentsList(dynamic response) {
    final parsedResponse = XmlDocument.parse(response.data);
    return parsedResponse.findAllElements('comment').toList();
  }

  @override
  CommentItem? parseComment(dynamic responseItem, int index) {
    final current = responseItem;
    return CommentItem(
      id: current.getAttribute('id'),
      title: current.getAttribute('id'),
      content: current.getAttribute('body'),
      authorID: current.getAttribute('creator_id'),
      authorName: current.getAttribute('creator'),
      postID: current.getAttribute('post_id'),
      // TODO broken on rule34xxx? returns current time
      createDate: isR34xxx ? null : current.getAttribute('created_at'), // 2021-11-15 12:09
      createDateFormat: isR34xxx ? null : 'yyyy-MM-dd HH:mm',
    );
  }

  // ----------------- Notes

  @override
  bool get hasNotesSupport => true;

  @override
  String makeNotesURL(String postID) {
    // EXAMPLE: https://safebooru.org/index.php?page=dapi&s=note&q=index&post_id=645243
    String baseUrl = booru.baseURL!;
    if (isR34xxx) {
      baseUrl = 'https://api.rule34.xxx';
    }

    return '$baseUrl/index.php?page=dapi&s=note&q=index&post_id=$postID';
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

  @override
  bool get hasLoadItemSupport => isR34xxx;

  @override
  bool get shouldUpdateIteminTagView => isR34xxx;

  Future<String?> getCookiesForPost(String postUrl) async {
    String cookieString = await Tools.getCookies(postUrl);

    final Map<String, String> headers = getHeaders();
    if (headers['Cookie']?.isNotEmpty ?? false) {
      cookieString += headers['Cookie']!;
    }

    Logger.Inst().log('${booru.baseURL}: $cookieString', className, 'getCookies', LogTypes.booruHandlerSearchURL);

    return cookieString.trim();
  }

  @override
  Future loadItem({required BooruItem item, CancelToken? cancelToken, bool withCapcthaCheck = false}) async {
    try {
      final cookies = await getCookiesForPost(item.postURL);

      final response = await DioNetwork.get(
        item.postURL,
        headers: {
          ...getHeaders(),
          if (isR34xxx && cookies?.isNotEmpty == true) 'Cookie': cookies,
        },
        options: Options(
          sendTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ),
        cancelToken: cancelToken,
        customInterceptor: withCapcthaCheck ? DioNetwork.captchaInterceptor : null,
      );

      if (response.statusCode != 200) {
        return [item, false, 'Invalid status code ${response.statusCode}'];
      } else {
        final html = parse(response.data);
        final sidebar = html.getElementById('tag-sidebar');
        final copyrightTags = tagsFromHtml(sidebar?.getElementsByClassName('tag-type-copyright tag'));
        addTagsWithType(copyrightTags, TagType.copyright);
        final characterTags = tagsFromHtml(sidebar?.getElementsByClassName('tag-type-character tag'));
        addTagsWithType(characterTags, TagType.character);
        final artistTags = tagsFromHtml(sidebar?.getElementsByClassName('tag-type-artist tag'));
        addTagsWithType(artistTags, TagType.artist);
        final generalTags = tagsFromHtml(sidebar?.getElementsByClassName('tag-type-general tag'));
        addTagsWithType(generalTags, TagType.none);
        final metaTags = tagsFromHtml(sidebar?.getElementsByClassName('tag-type-meta tag'));
        addTagsWithType(metaTags, TagType.meta);
        item.isUpdated = true;
        return [item, true, null];
      }
    } catch (e, s) {
      Logger.Inst().log(
        e.toString(),
        className,
        'loadItem',
        LogTypes.exception,
        s: s,
      );
      return [item, false, e.toString()];
    }
  }
}

List<String> tagsFromHtml(List<Element>? elements) {
  if (elements == null || elements.isEmpty) {
    return [];
  }

  final tags = <String>[];
  for (final element in elements) {
    final tag = element.getElementsByTagName('a').firstWhereOrNull((e) => e.text.isNotEmpty && e.text != '?');
    if (tag != null) {
      tags.add(tag.text.replaceAll(' ', '_'));
    }
  }
  return tags;
}
