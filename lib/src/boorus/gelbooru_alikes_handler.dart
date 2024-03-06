import 'dart:async';
import 'dart:convert';
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
import 'package:lolisnatcher/src/utils/tools.dart';

// TODO json parser? (add &json=1 to urls)
// rule34.xxx, safebooru.org, realbooru.com

class GelbooruAlikesHandler extends BooruHandler {
  GelbooruAlikesHandler(super.booru, super.limit);

  @override
  bool get hasSizeData => true;

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
        item.possibleExt.value = (tags.contains('gif') || tags.contains('animated_gif'))
            ? 'animation'
            : (tags.contains('webm') || tags.contains('mp4') || tags.contains('sound'))
                ? 'video'
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
    if (baseUrl.contains('rule34.xxx')) {
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
    // 16.01.22 - r34xx has order=count&direction=desc, but only it has it, so not worth adding it
    // "${booru.baseURL}/index.php?page=dapi&s=tag&q=index&name_pattern=nagato%&limit=10&order=count&direction=desc"

    // EXAMPLE: https://safebooru.org/autocomplete.php?q=naga
    String baseUrl = booru.baseURL!;
    if (baseUrl.contains('rule34.xxx')) {
      baseUrl = 'https://api.rule34.xxx';
    }
    return '$baseUrl/autocomplete.php?q=$input'; // doesn't allow limit, but sorts by popularity
  }

  @override
  List parseTagSuggestionsList(dynamic response) {
    return jsonDecode(response.data) ?? [];
  }

  @override
  String? parseTagSuggestion(dynamic responseItem, int index) {
    return responseItem['value'];
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
  String makeCommentsURL(String postID, int pageNum) {
    // EXAMPLE: https://safebooru.org/index.php?page=dapi&s=comment&q=index&post_id=1
    String baseUrl = booru.baseURL!;
    if (baseUrl.contains('rule34.xxx')) {
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
      createDate: current.getAttribute('created_at'), // 2021-11-15 12:09
      createDateFormat: 'yyyy-MM-dd HH:mm',
    );
  }

  // ----------------- Notes

  @override
  bool get hasNotesSupport => true;

  @override
  String makeNotesURL(String postID) {
    // EXAMPLE: https://safebooru.org/index.php?page=dapi&s=note&q=index&post_id=645243
    String baseUrl = booru.baseURL!;
    if (baseUrl.contains('rule34.xxx')) {
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

  // ----------------- Tags

  @override
  bool get shouldPopulateTags => booru.baseURL!.contains('rule34.xxx');

  @override
  String makeDirectTagURL(List<String> tags) {
    String baseUrl = booru.baseURL!;
    if (baseUrl.contains('rule34.xxx')) {
      // because requests to default url are protected by a captcha
      baseUrl = 'https://api.rule34.xxx';
    }

    final String apiKeyStr = booru.apiKey?.isNotEmpty == true ? '&api_key=${booru.apiKey}' : '';
    final String userIdStr = booru.userID?.isNotEmpty == true ? '&user_id=${booru.userID}' : '';
    return "$baseUrl/index.php?page=dapi&s=tag&q=index&names=${tags.join(" ")}&limit=100&json=1$apiKeyStr$userIdStr";
  }

  @override
  Future<List<Tag>> genTagObjects(List<String> tags) async {
    if (booru.baseURL!.contains('rule34.xxx') == false) {
      return [];
    }

    final List<Tag> tagObjects = [];
    Logger.Inst().log('Got tag list: $tags', className, 'genTagObjects', LogTypes.booruHandlerTagInfo);
    final String url = makeDirectTagURL(tags);
    Logger.Inst().log('DirectTagURL: $url', className, 'genTagObjects', LogTypes.booruHandlerTagInfo);
    try {
      final response = await DioNetwork.get(url, headers: getHeaders());
      if (response.statusCode == 200) {
        final parsedResponse = XmlDocument.parse(response.data).findAllElements('tag');
        if (parsedResponse.isNotEmpty) {
          Logger.Inst().log(
            'Tag response length: ${parsedResponse.length},Tag list length: ${tags.length}',
            className,
            'genTagObjects',
            LogTypes.booruHandlerTagInfo,
          );
          for (int i = 0; i < parsedResponse.length; i++) {
            final String fullString = parsedResponse.elementAt(i).getAttribute('name') ?? '';
            final String typeKey = parsedResponse.elementAt(i).getAttribute('type').toString();
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
}
