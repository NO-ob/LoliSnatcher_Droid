import 'dart:convert';
import 'dart:async';

import 'package:LoliSnatcher/src/boorus/GelbooruHandler.dart';
import 'package:LoliSnatcher/libBooru/Tag.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/utilities/Logger.dart';

/// Booru Handler for the gelbooru engine
class RealbooruHandler extends GelbooruHandler {
  // Dart constructors are weird so it has to call super with the args
  RealbooruHandler(Booru booru, int limit) : super(booru, limit);

  @override
  String className = "RealbooruHandler";

  @override
  bool hasSizeData = true;

  //Realbooru api returns 0 for models but on the website shows them
  //listed as model on the tagsearch so I dont think the api shows tag types properly
  @override
  Map<String, TagType> tagTypeMap = {
    "5": TagType.meta,
    "3": TagType.copyright,
    "4": TagType.character,
    "1": TagType.artist,
    "0": TagType.none
  };

  @override
  Map<String, String> getHeaders() {
    return {
      "Accept": "text/html,application/xml,application/json",
      "user-agent": "LoliSnatcher_Droid/$verStr",
      "Cookie": "fringeBenefits=yup;" // unlocks restricted content (but it's probably not necessary)
    };
  }

  @override
  void parseResponse(response) {
    var parsedResponse = jsonDecode(response.body);
    var posts = parsedResponse ?? [];
    List<BooruItem> newItems = [];

    for (int i = 0; i < posts.length; i++) {
      var current = posts.elementAt(i);
      Logger.Inst().log(posts.elementAt(i), className, "parseJsonResponse", LogTypes.booruHandlerRawFetched);
      try {
        if (current["image"] != null ) {
          // The api is shit and returns a bunch of broken urls so the urls need to be constructed,
          // We also cant trust the directory variable in the json because it is wrong on old posts
          String directory = "${current["hash"].toString().substring(0,2)}/${current["hash"].toString().substring(2,4)}";
          // Hash and file can be mismatched so we only use file for file ext
          String fileURL = "${booru.baseURL}/images/$directory/${current["hash"]}.${current["image"].split(".")[1]}",
              sampleURL = (
                  "${booru.baseURL}/${fileURL.endsWith(".webm") ? "images" : "samples"}/$directory/${current["hash"]}.jpg"
              ),
              previewURL = "${booru.baseURL}/thumbnails/$directory/thumbnail_${current["hash"]}.jpg";

          BooruItem item = BooruItem(
            fileURL: fileURL,
            sampleURL: sampleURL,
            thumbnailURL: previewURL,
            tagsList: current["tags"].split(" "),
            postURL: makePostURL(current["id"]!.toString()),
            fileWidth: double.tryParse(current["width"]?.toString() ?? ''),
            fileHeight: double.tryParse(current["height"]?.toString() ?? ''),
            sampleWidth: double.tryParse(current["sample_width"]?.toString() ?? ''),
            sampleHeight: double.tryParse(current["sample_height"]?.toString() ?? ''),
            previewWidth: double.tryParse(current["preview_width"]?.toString() ?? ''),
            previewHeight: double.tryParse(current["preview_height"]?.toString() ?? ''),
            rating: current["rating"]?.toString(),
            score: current["score"]?.toString(),
            md5String: current["hash"]?.toString(), // when timezone support added: "EEE MMM dd HH:mm:ss Z yyyy",
          );
          newItems.add(item);
        }
      } catch (e) {
        Logger.Inst().log(e.toString(), className, "parseResponse", LogTypes.exception);
      }
    }

    int lengthBefore = fetched.length;
    fetched.addAll(newItems);
    populateTagHandler(newItems);
    setMultipleTrackedValues(lengthBefore, fetched.length);
  }

  @override
  Future<void> searchCount(String input) async {
    int result = 0;
    // gelbooru json has count in @attributes, but there is no count data on r34xxx json, so we switch back to xml
    String url = makeURL(input,forceXML: true);

    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri, headers: getHeaders());
      // 200 is the success http response code
      if (response.statusCode == 200) {
          var parsedResponse = XmlDocument.parse(response.body);
          var root = parsedResponse.findAllElements('posts').toList();
          if (root.length == 1) {
            result = int.parse(root[0].getAttribute('count') ?? '0');
          }
        }
    } catch (e) {
      Logger.Inst().log(e.toString(), className, "searchCount", LogTypes.exception);
    }
    totalCount.value = result;
    return;
  }

  @override
  bool isGelbooru() {
    return true;
  }

  @override
  String makeDirectTagURL(List<String> tags) {
    return "${booru.baseURL}/index.php?page=dapi&s=tag&q=index&name=${tags.join(" ")}&limit=500&json=0";
  }

  //This may need to be disabled due to spamming
  @override
  Future<List<Tag>> genTagObjects(List<String> tags) async{
    List<Tag> tagObjects = [];
    Logger.Inst().log("Got tag list: $tags", className, "genTagObjects", LogTypes.booruHandlerTagInfo);

    try {
      for (int i = 0; i < tags.length; i++){
        String url = makeDirectTagURL([tags[i]]);
        Logger.Inst().log("DirectTagURL: $url", className, "genTagObjects", LogTypes.booruHandlerTagInfo);
        Uri uri = Uri.parse(url);
        final response = await http.get(uri, headers: {"Accept": "application/json", "user-agent": "LoliSnatcher_Droid/$verStr"});
        if (response.statusCode == 200) {
          var parsedResponse = XmlDocument.parse(response.body);
          var tags = parsedResponse.findAllElements("tag");
          if (tags.isNotEmpty) {
            for (int i = 0; i < tags.length; i++) {
              String fullString = tags.elementAt(i).getAttribute("name").toString();
              String displayString = getTagDisplayString(fullString);
              String typeKey = tags.elementAt(i).getAttribute("type").toString();
              TagType? tagType = TagType.none;
              if (tagTypeMap.containsKey(typeKey)) tagType = (tagTypeMap[typeKey] ?? TagType.none);
              if (fullString.isNotEmpty && displayString.isNotEmpty){
                Logger.Inst().log("Adding tag: $fullString, Type: ${tagType.name}", className, "genTagObjects", LogTypes.booruHandlerTagInfo);
                tagObjects.add(Tag(displayString,fullString,tagType));
              }
            }
          }
        }
      }
    } catch (e) {
      Logger.Inst().log(e.toString(), className, "tagSearch", LogTypes.exception);
    }
    return tagObjects;
  }

  @override
  Future tagSearch(String input) async {
    List<String> searchTags = [];
    String url = makeTagURL(input);

    try {
       Uri uri = Uri.parse(url);
       final response = await http.get(uri, headers: {"Accept": "text/html,application/xml", "user-agent": "LoliSnatcher_Droid/$verStr"});
       // 200 is the success http response code
       if (response.statusCode == 200) {
         var parsedResponse = XmlDocument.parse(response.body);
         var tags = parsedResponse.findAllElements("tag");
         if (tags.isNotEmpty) {
           for (int i = 0; i < tags.length; i++) {
             searchTags.add(tags.elementAt(i).getAttribute("name")!.trim());
           }
         }
       }
    } catch (e) {
      Logger.Inst().log(e.toString(), className, "tagSearch", LogTypes.exception);
    }

    return searchTags;
  }
}
