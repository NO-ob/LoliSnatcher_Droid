import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';

class NyanPalsHandler extends BooruHandler {
  NyanPalsHandler(Booru booru, int limit) : super(booru, limit);

  @override
  List parseListFromResponse(response) {
    var parsedResponse = response.data;
    totalCount.value = parsedResponse["total"]!;
    return (parsedResponse['rows'] ?? []) as List;
  }

  @override
  BooruItem? parseItemFromResponse(responseItem, int index) {
    String fileURL = responseItem["url"]!;
    String md5 = fileURL.substring(fileURL.lastIndexOf("/") + 1, fileURL.lastIndexOf("."));
    fileURL = booru.baseURL! + fileURL;
    String thumbURL = "";

    List<String> currentTags = responseItem['tags'].split(",");
    for (int x = 0; x < currentTags.length; x++) {
      if (currentTags[x].contains(" ")) {
        currentTags[x] = currentTags[x].replaceAll(" ", "_");
      }
    }

    BooruItem item = BooruItem(fileURL: fileURL, sampleURL: fileURL, thumbnailURL: "", tagsList: currentTags, postURL: fileURL, md5String: md5);

    thumbURL = "${booru.baseURL!}/img/pettankontent/";
    if (item.mediaType == "video") {
      thumbURL = "$thumbURL${item.md5String!}.mp4";
    } else if (item.mediaType == "animation") {
      thumbURL = "${thumbURL}_${item.md5String!}.gif";
    } else {
      thumbURL = "${thumbURL}_${item.md5String!}.png";
    }
    item.thumbnailURL = thumbURL;

    // video player cant do vp9 and dies
    if (item.mediaType != "video") {
      return item;
    } else {
      return null;
    }
  }

  @override
  String makePostURL(String id) {
    return "${booru.baseURL}/index.php?page=post&s=view&id=$id";
  }

  @override
  String makeURL(String tags) {
    //https://nyanpals.com/kontent?include=nsfw&exclude=&allow=&limit=50&method=uploaded&offset=0&order=DESC&token=null
    String includeTags = "";
    String excludeTags = "";
    tags.split(" ").forEach((element) {
      String tag = element.replaceAll("_", " ");
      if (tag.contains("-")) {
        excludeTags += "${tag.replaceAll("-", "")},";
      } else {
        includeTags += "$tag,";
      }
    });

    return "${booru.baseURL}/kontent?include=$includeTags&exclude=$excludeTags&allow=&limit=$limit&method=uploaded&offset=${pageNum * limit}&order=DESC&token=null";
  }

  @override
  String makeTagURL(String input) {
    if (booru.baseURL!.contains("rule34.xxx")) {
      return "${booru.baseURL}/autocomplete.php?q=$input"; // doesn't allow limit, but sorts by popularity
    } else {
      return "${booru.baseURL}/index.php?page=dapi&s=tag&q=index&name_pattern=$input%&limit=10";
    }
  }
}
