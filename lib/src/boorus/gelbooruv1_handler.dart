import 'package:html/parser.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';

class GelbooruV1Handler extends BooruHandler {
  GelbooruV1Handler(super.booru, super.limit);

  @override
  String validateTags(String tags) {
    if (tags == ' ' || tags == '') {
      return 'all';
    } else {
      return super.validateTags(tags);
    }
  }

  @override
  List parseListFromResponse(dynamic response) {
    final document = parse(response.data);
    final spans = document.getElementsByClassName('thumb');
    return spans;
  }

  @override
  BooruItem? parseItemFromResponse(dynamic responseItem, int index) {
    final linkItem = responseItem.firstChild;
    final imgItem = linkItem.firstChild;

    if (imgItem?.attributes['src'] != null && linkItem?.attributes['id'] != null) {
      final String id = linkItem.attributes['id'].substring(1);
      final String thumbURL = imgItem.attributes['src'];
      final String fileURL = thumbURL.replaceFirst('thumbs', 'img').replaceFirst('thumbnails', 'images').replaceFirst('thumbnail_', '');
      final List<String> tags = imgItem.attributes['title']!.split(' ');
      final BooruItem item = BooruItem(
        fileURL: fileURL,
        sampleURL: fileURL,
        thumbnailURL: thumbURL,
        tagsList: tags,
        md5String: getHashFromURL(thumbURL),
        postURL: makePostURL(id),
      );

      return item;
    } else {
      return null;
    }
  }

  String getHashFromURL(String url) {
    final String hash = url.substring(url.lastIndexOf('_') + 1, url.lastIndexOf('.'));
    return hash;
  }

  @override
  String makePostURL(String id) {
    return '${booru.baseURL}/index.php?page=post&s=view&id=$id';
  }

  @override
  String makeURL(String tags) {
    return '${booru.baseURL}/index.php?page=post&s=list&tags=${tags.replaceAll(" ", "+")}&pid=${pageNum * 20}';
  }
}
