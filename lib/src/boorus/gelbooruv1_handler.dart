import 'package:html/parser.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';

class GelbooruV1Handler extends BooruHandler {
  GelbooruV1Handler(Booru booru, int limit) : super(booru, limit);

  @override
  String validateTags(tags) {
    if (tags == " " || tags == "") {
      return "all";
    } else {
      return super.validateTags(tags);
    }
  }

  @override
  List parseListFromResponse(response) {
    var document = parse(response.data);
    var spans = document.getElementsByClassName("thumb");
    return spans;
  }

  @override
  BooruItem? parseItemFromResponse(responseItem, int index) {
    var linkItem = responseItem.firstChild!;
    var imgItem = linkItem.firstChild!;

    if (imgItem.attributes["src"] != null) {
      String id = linkItem.attributes["id"]!.substring(1);
      String thumbURL = imgItem.attributes["src"]!;
      String fileURL = thumbURL.replaceFirst("thumbs", "img").replaceFirst("thumbnails", "images").replaceFirst("thumbnail_", "");
      List<String> tags = imgItem.attributes["title"]!.split(" ");
      BooruItem item = BooruItem(
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
    String hash = url.substring(url.lastIndexOf("_") + 1, url.lastIndexOf("."));
    return hash;
  }

  @override
  String makePostURL(String id) {
    return "${booru.baseURL}/index.php?page=post&s=view&id=$id";
  }

  @override
  String makeURL(String tags) {
    return "${booru.baseURL}/index.php?page=post&s=list&tags=${tags.replaceAll(" ", "+")}&pid=${(pageNum * 20).toString()}";
  }
}
