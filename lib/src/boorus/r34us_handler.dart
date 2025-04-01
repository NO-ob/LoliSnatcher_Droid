import 'package:dio/dio.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/logger.dart';

// TODO finish if possible

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
  List parseListFromResponse(dynamic response) {
    final document = parse(response.data);
    return document.querySelectorAll('div.thumbail-container > div');
  }

  // user_id=24582; pass_hash=66f1d55e1e13efcf27bfe09736436af43a3b138f
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
      item.mediaType.value = MediaType.needsExtraRequest;

      return item;
    } else {
      return null;
    }
  }

  @override
  Future<List> loadItem({required BooruItem item, CancelToken? cancelToken, bool withCapcthaCheck = false}) async {
    try {
      final response = await DioNetwork.get(item.postURL, headers: getHeaders());
      if (response.statusCode == 200) {
        final document = parse(response.data);
        final dom.Element? div = document.querySelector('div.content_push > img');
        item.fileURL = div!.attributes['src']!;
        item.sampleURL = div.attributes['src']!;
        item.fileHeight = double.tryParse(div.attributes['height']!);
        item.fileWidth = double.tryParse(div.attributes['width']!);
      } else {
        Logger.Inst().log('$className status is: ${response.statusCode}', className, 'getPostData', LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log('$className url is: ${item.postURL}', className, 'getPostData', LogTypes.booruHandlerFetchFailed);
        Logger.Inst().log('$className url response is: ${response.data}', className, 'getPostData', LogTypes.booruHandlerFetchFailed);
        errorString = response.statusCode.toString();
      }
    } catch (e, s) {
      Logger.Inst().log(
        e.toString(),
        className,
        'getPostData',
        LogTypes.exception,
        s: s,
      );
      errorString = e.toString();
    }
    return [item, true, null];
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
