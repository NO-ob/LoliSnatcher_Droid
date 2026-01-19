import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:xml/xml.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/comment_item.dart';
import 'package:lolisnatcher/src/data/meta_tag.dart';
import 'package:lolisnatcher/src/data/note_item.dart';
import 'package:lolisnatcher/src/data/tag.dart';
import 'package:lolisnatcher/src/data/tag_suggestion.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/utils/logger.dart';

class GelbooruHandler extends BooruHandler {
  GelbooruHandler(super.booru, super.limit);

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

  static String get credentialsWarningText =>
      '<p><b>You may need to add your User ID and API key. You can find them on <a href="https://gelbooru.com/index.php?page=account&s=options">Gelbooru settings page</a> under "API Access Credentials". Note: Anonymous access is NOT allowed.</b></p>';

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
      final String? errorMessage = (parsedResponse as XmlDocument)
          .getElement('response')
          ?.getAttribute('reason')
          ?.toString();
      if (errorMessage != null) {
        throw Exception(errorMessage);
      }
    }

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
        tagsList: (parseFragment(current['tags']).text?.split(' ') ?? []).map(Tag.new).toList(),
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
        sources: (current['source'] != null && current['source'] is String) ? [current['source']] : null,
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

  String buildApiStr() {
    final String apiKeyStr = booru.apiKey?.isNotEmpty == true
        ? (booru.apiKey?.contains('api_key') == true ? booru.apiKey! : '&api_key=${booru.apiKey}')
        : '';
    final String userIdStr = booru.userID?.isNotEmpty == true
        ? (apiKeyStr.contains('user_id') ? '' : '&user_id=${booru.userID}')
        : '';

    return '$apiKeyStr$userIdStr';
  }

  @override
  String makeURL(String tags) {
    // EXAMPLE: https://gelbooru.com/index.php?page=dapi&s=post&q=index&tags=rating:general%20order:score&limit=20&pid=0&json=1
    final int cappedPage = max(0, pageNum);

    return "${booru.baseURL}/index.php?page=dapi&s=post&q=index&tags=${tags.replaceAll(" ", "+")}&limit=$limit&pid=$cappedPage&json=1${buildApiStr()}";
  }

  // ----------------- Tag suggestions and tag handler stuff

  Map<String, TagType> get tagSuggestionsTypeMap => {
    'metadata': TagType.meta,
    'copyright': TagType.copyright,
    'character': TagType.character,
    'artist': TagType.artist,
    'tag': TagType.none,
  };

  @override
  String makeTagURL(String input) {
    // EXAMPLE https://gelbooru.com/index.php?page=dapi&s=tag&q=index&name_pattern=nagat%25&limit=20&json=1
    return '${booru.baseURL}/index.php?page=autocomplete2&term=$input&type=tag_query&limit=20${buildApiStr()}'; // limit doesnt work
    // return '${booru.baseURL}/index.php?page=dapi&s=tag&q=index&name_pattern=$input%&limit=20&order=post_count&direction=desc&json=1$apiKeyStr$userIdStr'; // order doesnt work
  }

  @override
  List parseTagSuggestionsList(dynamic response) {
    final parsedResponse = response.data is List ? response.data : response.data['tag'] ?? [];
    return parsedResponse;
  }

  @override
  TagSuggestion? parseTagSuggestion(dynamic responseItem, int index) {
    final String tagStr = responseItem['value'] ?? responseItem['name'] ?? '';
    if (tagStr.isEmpty) {
      return null;
    }

    // record tag data for future use
    final String rawTagType = (responseItem['category'] ?? responseItem['type'])?.toString() ?? '';
    TagType tagType = TagType.none;
    if (rawTagType.isNotEmpty &&
        (tagTypeMap.containsKey(rawTagType) || tagSuggestionsTypeMap.containsKey(rawTagType))) {
      tagType = tagTypeMap[rawTagType] ?? tagSuggestionsTypeMap[rawTagType] ?? TagType.none;
    }
    addTagsWithType([tagStr], tagType);
    return TagSuggestion(
      tag: tagStr,
      type: tagType,
      count: int.tryParse((responseItem['count'] ?? responseItem['post_count'])?.toString() ?? '0') ?? 0,
    );
  }

  @override
  bool get shouldPopulateTags => true;

  @override
  String makeDirectTagURL(List<String> tags) {
    return "${booru.baseURL}/index.php?page=dapi&s=tag&q=index&names=${tags.join(" ")}&limit=100&json=1${buildApiStr()}";
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
    } catch (e, s) {
      Logger.Inst().log(
        e.toString(),
        className,
        'genTagObjects',
        LogTypes.exception,
        s: s,
      );
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
    return makePostURL(postID) + (pageNum == 0 ? '' : '&pid=${pageNum * 10}');

    // EXAMPLE: https://gelbooru.com/index.php?page=dapi&s=comment&q=index&post_id=7296350
    // ignore: dead_code
    return '${booru.baseURL}/index.php?page=dapi&s=comment&q=index&post_id=$postID${buildApiStr()}';
  }

  @override
  List parseCommentsList(dynamic response) {
    final document = parse(response.data);
    final avatars = document.querySelectorAll('div.commentAvatar');
    final bodies = document.querySelectorAll('div.commentBody');
    return List.generate(avatars.length, (i) => [avatars[i], bodies[i]]);
  }

  @override
  CommentItem? parseComment(dynamic responseItem, int index) {
    final Element avatarNode = responseItem[0];
    final String avatarUrl = 'https://gelbooru.com/${avatarNode.outerHtml.split("url('")[1].split("')")[0]}';
    final Element bodyNode = responseItem[1];

    return CommentItem(
      content: bodyNode.nodes[5].text,
      authorName: bodyNode.nodes[1].nodes[0].text,
      avatarUrl: avatarUrl,
      score: int.tryParse(bodyNode.querySelector('span span.info span')?.text ?? '0'),
      createDate: bodyNode.nodes[2].text?.split('at ')[1].split(' »')[0],
      createDateFormat: 'yyyy-MM-dd HH:mm:ss',
    );
  }

  List parseCommentsListOld(dynamic response) {
    final parsedResponse = XmlDocument.parse(response.data);
    return parsedResponse.findAllElements('comment').toList();
  }

  CommentItem? parseCommentOld(dynamic responseItem, int index) {
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
    return '${booru.baseURL}/index.php?page=dapi&s=note&q=index&post_id=$postID${buildApiStr()}';
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
  String? get metatagsCheatSheetLink => 'https://gelbooru.com/index.php?page=wiki&s=view&id=26263';

  @override
  List<MetaTag> availableMetaTags() {
    return [
      DanbooruGelbooruRatingMetaTag(),
      SortMetaTag(
        values: [
          MetaTagValue(name: 'ID', value: 'id'),
          MetaTagValue(name: 'ID (ascending)', value: 'id:asc'),
          MetaTagValue(name: 'Score', value: 'score'),
          MetaTagValue(name: 'Score (ascending)', value: 'score:asc'),
          MetaTagValue(name: 'Rating', value: 'rating'),
          MetaTagValue(name: 'Rating (ascending)', value: 'rating:asc'),
          MetaTagValue(name: 'User', value: 'user'),
          MetaTagValue(name: 'User (ascending)', value: 'user:asc'),
          MetaTagValue(name: 'Height', value: 'height'),
          MetaTagValue(name: 'Height (ascending)', value: 'height:asc'),
          MetaTagValue(name: 'Width', value: 'width'),
          MetaTagValue(name: 'Width (ascending)', value: 'width:asc'),
          MetaTagValue(name: 'Source', value: 'source'),
          MetaTagValue(name: 'Source (ascending)', value: 'source:asc'),
          MetaTagValue(name: 'Updated', value: 'updated'),
          MetaTagValue(name: 'Updated (ascending)', value: 'updated:asc'),
          MetaTagValue(name: 'Random', value: 'random'), // can add seed at the end (sort:random:{seed})
        ],
      ),
      ComparableNumberMetaTag(name: 'Score', keyName: 'score'),
      StringMetaTag(name: 'ID', keyName: 'id'),
      StringMetaTag(name: 'User', keyName: 'user'),
      // StringMetaTag(name: 'Favourites of user ID (fav:{id})', keyName: 'fav'),
      StringMetaTag(name: 'MD5', keyName: 'md5'),
      ComparableNumberMetaTag(name: 'Width', keyName: 'width'),
      ComparableNumberMetaTag(name: 'Height', keyName: 'height'),
    ];
  }

  //

  @override
  bool get hasLoadItemSupport => true;

  @override
  bool get shouldUpdateIteminTagView => true;

  @override
  Future<({BooruItem? item, bool failed, String? error})> loadItem({
    required BooruItem item,
    CancelToken? cancelToken,
    bool withCapcthaCheck = false,
  }) async {
    try {
      final response = await DioNetwork.get(
        item.postURL,
        headers: {
          ...getHeaders(),
        },
        options: Options(
          sendTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ),
        cancelToken: cancelToken,
        customInterceptor: withCapcthaCheck ? DioNetwork.captchaInterceptor : null,
      );

      if (response.statusCode != 200) {
        return (item: null, failed: true, error: 'Invalid status code ${response.statusCode}');
      } else {
        final html = parse(response.data);

        Element? source = html.getElementById('gelcomVideoPlayer');
        if (source != null) {
          // video
          item.thumbnailURL = source.attributes['poster'] ?? item.thumbnailURL;
          item.sampleURL = source.attributes['poster'] ?? item.sampleURL;
          item.fileURL = source.attributes['src'] ?? source.children.firstOrNull?.attributes['src'] ?? item.fileURL;
        } else {
          // image
          source = html.querySelector('.image-container img');
          if (source != null) {
            final String? src = source.attributes['src'];
            item.fileURL = src ?? item.fileURL;
            final isSample = src?.contains('/samples/') ?? false;
            if (isSample) {
              item.sampleURL = src ?? item.sampleURL;
              item.fileURL = html.querySelector('meta[property="og:image"]')?.attributes['content'] ?? item.fileURL;
            }
            item.thumbnailURL = isSample ? item.sampleURL : item.thumbnailURL;
          }
        }

        final sidebar = html.getElementById('tag-list');
        final copyrightTags = _tagsFromHtml(sidebar?.getElementsByClassName('tag-type-copyright'));
        addTagsWithType(copyrightTags.map((t) => t.tag).toList(), TagType.copyright);
        final characterTags = _tagsFromHtml(sidebar?.getElementsByClassName('tag-type-character'));
        addTagsWithType(characterTags.map((t) => t.tag).toList(), TagType.character);
        final artistTags = _tagsFromHtml(sidebar?.getElementsByClassName('tag-type-artist'));
        addTagsWithType(artistTags.map((t) => t.tag).toList(), TagType.artist);
        final generalTags = _tagsFromHtml(sidebar?.getElementsByClassName('tag-type-general'));
        addTagsWithType(generalTags.map((t) => t.tag).toList(), TagType.none);
        final metaTags = _tagsFromHtml(sidebar?.getElementsByClassName('tag-type-metadata'));
        addTagsWithType(metaTags.map((t) => t.tag).toList(), TagType.meta);

        for (final t in [...copyrightTags, ...characterTags, ...artistTags, ...generalTags, ...metaTags]) {
          final tagIndex = item.tagsList.indexWhere((tt) => tt.fullString == t.tag);
          if (tagIndex != -1) {
            item.tagsList[tagIndex].count = t.count;
          }
        }
        item.isUpdated = true;
        return (item: item, failed: false, error: null);
      }
    } catch (e, s) {
      Logger.Inst().log(
        e.toString(),
        className,
        'loadItem',
        LogTypes.exception,
        s: s,
      );
      return (item: null, failed: true, error: e.toString());
    }
  }
}

List<({String tag, int count})> _tagsFromHtml(List<Element>? elements) {
  if (elements == null || elements.isEmpty) {
    return [];
  }

  final List<({String tag, int count})> tagsWithCount = [];
  for (final element in elements) {
    final String? tag = element
        .getElementsByTagName('a')
        .firstWhereOrNull((e) => e.text.isNotEmpty && e.text != '?')
        ?.text;
    final int? count = int.tryParse(
      element.getElementsByTagName('span').lastWhereOrNull((e) => e.text.isNotEmpty)?.text ?? '',
    );
    if (tag != null) {
      tagsWithCount.add((
        tag: tag.replaceAll(' ', '_'),
        count: count ?? 0,
      ));
    }
  }
  return tagsWithCount;
}
