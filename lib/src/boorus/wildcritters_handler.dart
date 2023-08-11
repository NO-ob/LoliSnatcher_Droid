import 'package:html/parser.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';

class WildCrittersHandler extends BooruHandler {
  WildCrittersHandler(super.booru, super.limit);

  @override
  List parseListFromResponse(dynamic response) {
    final document = parse(response.data);
    final spans = document.getElementsByClassName('thumb');
    return spans;
  }

  @override
  Future<BooruItem?> parseItemFromResponse(dynamic responseItem, int index) async {
    final linkItem = responseItem.firstChild;
    final imgItem = linkItem.firstChild;

    if (imgItem?.attributes['src'] != null && linkItem.attributes['id'] != null) {
      final String id = linkItem!.attributes['id']!.substring(1);
      final String thumbURL = imgItem!.attributes['src']!;
      final String fileURL = await getFileUrl(id);
      if (fileURL.isEmpty) {
        return null;
      }
      final List<String> tags = imgItem!.attributes['title']!.split(' ');
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

  Future<String> getFileUrl(String id) async {
    final String url = makePostURL(id);
    String fileUrl = '';
    final response = await DioNetwork.get(url, headers: getHeaders());
    if (response.statusCode == 200) {
      final document = parse(response.data);
      fileUrl = document.getElementById('image')!.attributes['src']!;
    }
    return fileUrl;
  }

  String getHashFromURL(String url) {
    final String hash = url.substring(url.lastIndexOf('_') + 1, url.lastIndexOf('.'));
    return hash;
  }

  @override
  String makePostURL(String id) {
    return '${booru.baseURL}/post/view/$id';
  }

  @override
  String makeURL(String tags) {
    if (tags.trim().isEmpty) {
      return '${booru.baseURL}/post/all/$pageNum';
    }
    return "${booru.baseURL}/post/list/${tags.replaceAll(" ", "+")}/$pageNum";
  }
}
