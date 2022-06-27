import 'dart:convert';

import 'package:html/parser.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/boorus/shimmie_handler.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

class R34HentaiHandler extends ShimmieHandler {
  R34HentaiHandler(Booru booru, int limit) : super(booru, limit);

  @override
  bool hasSizeData = true;

  @override
  Map<String, String> getHeaders() {
    Map<String, String> headers = {
      "Accept": "application/json",
      "user-agent": Tools.browserUserAgent(),
    };

    if (booru.apiKey?.isNotEmpty ?? false) {
      headers['Cookie'] = "${booru.apiKey};";
    }

    return headers;
  }

  @override
  String validateTags(tags) {
    if (tags == " " || tags == "") {
      return "";
    } else {
      return tags;
    }
  }

  @override
  List parseListFromResponse(response) {
    var document = parse(response.body);
    return document.getElementsByClassName("thumb");
  }

  @override
  BooruItem? parseItemFromResponse(responseItem, int index) {
    var current = responseItem;

    String id = current.attributes["data-post-id"]!;
    String fileExt = current.attributes["data-mime"]?.split('/')[1] ?? "png";
    String thumbURL = current.firstChild!.attributes["src"]!;
    double? thumbWidth = double.tryParse(current.firstChild!.attributes["width"] ?? '');
    double? thumbHeight = double.tryParse(current.firstChild!.attributes["height"] ?? '');
    double? fileWidth = double.tryParse(current.attributes["data-width"] ?? '');
    double? fileHeight = double.tryParse(current.attributes["data-height"] ?? '');
    String fileURL = thumbURL
        .replaceFirst("_thumbs", "_images")
        .replaceFirst("thumbnails", "images")
        .replaceFirst("thumbnail_", "")
        .replaceFirst('.jpg', '.$fileExt');
    List<String> tags = current.attributes["data-tags"]?.split(" ") ?? [];

    BooruItem item = BooruItem(
      thumbnailURL: booru.baseURL! + thumbURL,
      sampleURL: booru.baseURL! + fileURL,
      fileURL: booru.baseURL! + fileURL,
      previewWidth: thumbWidth,
      previewHeight: thumbHeight,
      fileWidth: fileWidth,
      fileHeight: fileHeight,
      tagsList: tags,
      md5String: getHashFromURL(thumbURL),
      postURL: makePostURL(id),
      serverId: id,
    );

    return item;
  }

  String getHashFromURL(String url) {
    String hash = url.substring(url.lastIndexOf("_") + 1, url.lastIndexOf("."));
    return hash;
  }

  @override
  String makeURL(String tags) {
    String tagsText = tags.replaceAll(' ', '+');
    tagsText = tagsText.isEmpty ? '' : '$tagsText/';
    return "${booru.baseURL}/post/list/$tagsText$pageNum";
  }

  @override
  String getDescription() {
    return '---------------------\n\nTo view restricted content you need a session token:\n-Paste this into your browser\'s address bar when on the desired site and logged in:\n\njavascript:let cs=document.cookie.split(\'; \');let user=cs.find(c=>c.startsWith(\'shm_user\'));let token=cs.find(c=>c.startsWith(\'shm_session\'));prompt(\'\', user + \'; \' + token);\n\n-Copy the prompt contents into apiKey field\n(example: shm_user=xxx; shm_session=xxx;)\n\n[Note]: The "javascript:" part of the script is often truncated by the browser when pasting. Use the script as bookmarklet to bypass this behavior.\n\n---------------------';
  }
}

/// Booru Handler for the r34hentai engine
// TODO they removed their api, both shimmie and custom one, but maybe it is still hidden somewhere?
class R34HentaiHandlerOld extends R34HentaiHandler {
  R34HentaiHandlerOld(Booru booru, int limit) : super(booru, limit);

  @override
  List parseListFromResponse(response) {
    List<dynamic> parsedResponse = jsonDecode(response.body);
    return parsedResponse; // Limit doesn't work with this api
  }

  @override
  BooruItem? parseItemFromResponse(responseItem, int index) {
    var current = responseItem;
    String imageUrl = current['file_url'];
    String sampleUrl = current['sample_url'];
    String thumbnailUrl = current['preview_url'];

    BooruItem item = BooruItem(
      fileURL: imageUrl,
      sampleURL: sampleUrl,
      thumbnailURL: thumbnailUrl,
      tagsList: current['tags'].split(' '),
      postURL: makePostURL(current['id'].toString()),
    );

    return item;
  }

  @override
  String makeURL(String tags) {
    return "${booru.baseURL}/post/index.json?limit=$limit&page=$pageNum&tags=$tags";
  }
}
