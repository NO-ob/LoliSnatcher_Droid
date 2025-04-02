import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

class R34USHandler extends BooruHandler {
  R34USHandler(super.booru, super.limit);

  @override
  String validateTags(String tags) {
    if (tags == ' ' || tags == '') {
      return 'all';
    } else {
      return super.validateTags(tags);
    }
  }

  @override
  bool get hasLoadItemSupport => true;

  @override
  bool get shouldUpdateIteminTagView => true;

  @override
  List parseListFromResponse(dynamic response) {
    final document = parse(response.data);
    return document.querySelectorAll('div.thumbail-container > div');
  }

  @override
  Future<BooruItem?> parseItemFromResponse(dynamic responseItem, int index) async {
    final current = responseItem.children[0];
    if (current.firstChild!.attributes['src'] != null) {
      final String id = current.attributes['id']!;
      final String thumbURL = current.firstChild!.attributes['src']!;
      final List<String> tags = [];
      current.firstChild!.attributes['title']!.split(', ').forEach((tag) {
        tags.add(tag.replaceAll(' ', '_'));
      });

      final mediaType = (tags.contains('gif') || tags.contains('animated_gif'))
          ? MediaType.animation
          : tags.contains('video') || (tags.contains('webm') || tags.contains('mp4') || tags.contains('sound'))
              ? MediaType.video
              : null;

      String fullURL = thumbURL.replaceFirst('thumbnail', 'image').replaceFirst('thumbnail_', '').replaceFirst('.jpg', '.jpeg');
      if (mediaType == MediaType.video) fullURL = fullURL.replaceFirst(RegExp(r'img\d+'), 'video');

      final BooruItem item = BooruItem(
        fileURL: fullURL,
        sampleURL: fullURL,
        thumbnailURL: thumbURL,
        tagsList: tags,
        md5String: getHashFromURL(thumbURL),
        postURL: makePostURL(id),
      );

      item.possibleMediaType.value = mediaType;
      item.mediaType.value = MediaType.needToLoadItem;

      return item;
    } else {
      return null;
    }
  }

  @override
  Future<({BooruItem? item, bool failed, String? error})> loadItem({
    required BooruItem item,
    CancelToken? cancelToken,
    bool withCapcthaCheck = false,
  }) async {
    try {
      final response = await DioNetwork.get(item.postURL, headers: getHeaders());
      if (response.statusCode != 200) {
        return (item: null, failed: true, error: 'Invalid status code ${response.statusCode}');
      } else {
        final html = parse(response.data);
        Element? div = html.querySelector('div.content_push > img');
        div ??= html.querySelector('div.content_push > video');
        if (div == null) {
          return (item: null, failed: true, error: 'Failed to parse html');
        }

        item.fileURL = div.attributes['src'] ?? div.children.firstOrNull?.attributes['src'] ?? item.fileURL;
        item.sampleURL = div.attributes['src'] ?? div.attributes['poster'] ?? item.sampleURL;
        item.fileHeight = double.tryParse(div.attributes['height'] ?? '');
        item.fileWidth = double.tryParse(div.attributes['width'] ?? '');
        item.fileAspectRatio = (item.fileWidth != null && item.fileHeight != null) ? item.fileWidth! / item.fileHeight! : null;
        item.fileExt = Tools.getFileExt(item.fileURL);
        item.possibleMediaType.value = null;
        item.mediaType.value = MediaType.fromExtension(item.fileExt);

        final sidebar = html.getElementById('tag-list');
        final copyrightTags = _tagsFromHtml(sidebar?.getElementsByClassName('copyright-tag'));
        addTagsWithType(copyrightTags, TagType.copyright);
        final characterTags = _tagsFromHtml(sidebar?.getElementsByClassName('character-tag'));
        addTagsWithType(characterTags, TagType.character);
        final artistTags = _tagsFromHtml(sidebar?.getElementsByClassName('artist-tag'));
        addTagsWithType(artistTags, TagType.artist);
        final generalTags = _tagsFromHtml(sidebar?.getElementsByClassName('general-tag'));
        addTagsWithType(generalTags, TagType.none);
        final metaTags = _tagsFromHtml(sidebar?.getElementsByClassName('metadata-tag'));
        addTagsWithType(metaTags, TagType.meta);
        item.isUpdated = true;
      }
    } catch (e, s) {
      Logger.Inst().log(
        e.toString(),
        className,
        'getPostData',
        LogTypes.exception,
        s: s,
      );
      return (item: null, failed: true, error: e.toString());
    }

    return (item: item, failed: false, error: null);
  }

  String getHashFromURL(String url) {
    final String hash = url.substring(url.lastIndexOf('_') + 1, url.lastIndexOf('.'));
    return hash;
  }

  @override
  String makePostURL(String id) {
    return '${booru.baseURL}/index.php?r=posts/view&id=$id';
  }

  @override
  String makeURL(String tags) {
    return "${booru.baseURL}/index.php?r=posts/index&q=${tags.replaceAll(" ", "+")}&page=$pageNum";
  }
}

List<String> _tagsFromHtml(List<Element>? elements) {
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
