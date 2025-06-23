import 'package:xml/xml.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/tag_suggestion.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/logger.dart';

// TODO improve tag fecthing, add data from it to tag handler?

class AGNPHHandler extends BooruHandler {
  AGNPHHandler(super.booru, super.limit);

  @override
  bool get hasSizeData => true;

  @override
  bool get hasTagSuggestions => true;

  @override
  Map<String, String> getHeaders() {
    return {
      ...super.getHeaders(),
      'Cookie': 'confirmed_age=true;',
    };
  }

  /// Because the api doesn't return tags we will create fetched and have another function set tags at a later time.
  /// Seems to work for now but could cause a performance impact.
  /// Makes results show on screen faster than waiting on getDataByID
  @override
  List parseListFromResponse(dynamic response) {
    final parsedResponse = XmlDocument.parse(response.data);
    totalCount.value = int.tryParse(parsedResponse.getElement('posts')?.getAttribute('count') ?? '0') ?? 0;
    return parsedResponse.findAllElements('post').toList();
  }

  @override
  BooruItem? parseItemFromResponse(dynamic responseItem, int index) {
    responseItem = responseItem as XmlElement;

    final String fileURL = responseItem.getElement('file_url')?.innerText ?? '';
    String sampleURL = responseItem.getElement('preview_url')?.innerText ?? '';
    final String thumbnailURL = responseItem.getElement('thumbnail_url')?.innerText ?? '';
    if (sampleURL.isEmpty) {
      sampleURL = fileURL;
    }

    final String postID = responseItem.getElement('id')?.innerText ?? '';
    if (postID.isNotEmpty && fileURL.isNotEmpty) {
      final BooruItem item = BooruItem(
        fileURL: fileURL,
        sampleURL: sampleURL,
        thumbnailURL: thumbnailURL,
        tagsList: const [],
        postURL: makePostURL(responseItem.getElement('id')?.innerText ?? ''),
        fileWidth: double.tryParse(responseItem.getElement('width')?.innerText ?? ''),
        fileHeight: double.tryParse(responseItem.getElement('height')?.innerText ?? ''),
        serverId: responseItem.getElement('id')?.innerText ?? '',
        rating: responseItem.getElement('rating')?.innerText,
        score: responseItem.getElement('fav_count')?.innerText,
        sources: [responseItem.getElement('source')?.innerText ?? ''],
        md5String: responseItem.getElement('md5')?.innerText,
        postDate: responseItem.getElement('created_at')?.innerText, // Fri Jun 18 02:13:45 -0500 2021
        postDateFormat: 'unix', // when timezone support added: "EEE MMM dd HH:mm:ss Z yyyy",
      );

      final int newIndex = fetched.length + index;
      getTagsLater(postID, newIndex);

      return item;
    } else {
      return null;
    }
  }

  Future<void> getTagsLater(String postID, int fetchedIndex) async {
    try {
      final response = await DioNetwork.get(
        '${booru.baseURL}/gallery/post/show/$postID/?api=xml',
        headers: getHeaders(),
      );
      Logger.Inst().log('Getting post data: $postID', className, 'getTagsLater', LogTypes.booruHandlerRawFetched);
      if (response.statusCode == 200) {
        Logger.Inst().log('Got data for: $postID', className, 'getTagsLater', LogTypes.booruHandlerRawFetched);
        final parsedResponse = XmlDocument.parse(response.data);
        final post = parsedResponse.getElement('post');
        String tagStr = post!.getElement('tags')?.innerText ?? '';
        if (post.getElement('tags')!.innerText.isNotEmpty) {
          final String artist = post.getElement('artist')?.innerText ?? '';
          tagStr = "artist:$artist ${tagStr.replaceAll(artist, "")}";
        }
        fetched.elementAt(fetchedIndex).tagsList = tagStr.split(' ');
      } else {
        Logger.Inst().log(
          'AGNPHHandler failed to get post',
          'AGNPHHandler',
          'getTagsLater',
          LogTypes.booruHandlerFetchFailed,
        );
      }
    } catch (e, s) {
      Logger.Inst().log(
        e.toString(),
        'AGNPHHandler',
        'getTagsLater',
        LogTypes.exception,
        s: s,
      );
    }
  }

  @override
  String makePostURL(String id) {
    // EXAMPLE: https://agn.ph/gallery/post/show/352470/
    return '${booru.baseURL}/gallery/post/show/$id';
  }

  @override
  String makeURL(String tags) {
    final String tagStr = tags.replaceAll('artist:', '').replaceAll(' ', '+');
    // EXAMPLE: https://agn.ph/gallery/post/?search=sylveon&page=1&api=xml
    return '${booru.baseURL}/gallery/post/?search=$tagStr&page=$pageNum&api=xml';
  }

  @override
  String makeTagURL(String input) {
    // EXAMPLE: https://agn.ph/gallery/tags/?sort=count&order=desc&search=gard&api=xml
    return '${booru.baseURL}/gallery/tags/?sort=count&order=desc&search=$input&api=xml';
  }

  @override
  List parseTagSuggestionsList(dynamic response) {
    final parsedResponse = XmlDocument.parse(response.data);
    return parsedResponse.findAllElements('tag').toList();
  }

  @override
  TagSuggestion? parseTagSuggestion(dynamic responseItem, int index) {
    // TODO parse tag type
    final String tagStr = responseItem.getElement('name')?.innerText ?? '';
    if (tagStr.isEmpty) {
      return null;
    }
    return TagSuggestion(tag: tagStr);
  }
}
