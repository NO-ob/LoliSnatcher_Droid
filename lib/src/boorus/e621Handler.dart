import 'dart:async';
import 'dart:convert';

import 'package:LoliSnatcher/src/data/Tag.dart';
import 'package:http/http.dart' as http;

import 'package:LoliSnatcher/src/data/Booru.dart';
import 'package:LoliSnatcher/libBooru/BooruHandler.dart';
import 'package:LoliSnatcher/src/data/BooruItem.dart';
import 'package:LoliSnatcher/utilities/Logger.dart';

class e621Handler extends BooruHandler{
  e621Handler(Booru booru,int limit) : super(booru,limit);
  @override
  bool hasSizeData = true;

  @override
  void parseResponse(response) {
    Map<String, dynamic> parsedResponse = jsonDecode(response.body);
    /**
     * This creates a list of xml elements 'post' to extract only the post elements which contain
     * all the data needed about each image
     */
    var posts = parsedResponse['posts'];
    // Create a BooruItem for each post in the list
    List<BooruItem> newItems = [];
    for (int i = 0; i < posts.length; i++){
      var current = posts[i];
      Logger.Inst().log(current.toString(), "e621Handler", "parseResponse", LogTypes.booruHandlerRawFetched);
      /**
       * Add a new booruitem to the list .getAttribute will get the data assigned to a particular tag in the xml object
       */
      if (current['file']['md5'] != null){
        String fileURL = "";
        String sampleURL = "";
        String thumbURL = "";
        if (current['file']['url'] == null){
          String md5FirstSplit = current['file']['md5'].toString().substring(0,2);
          String md5SecondSplit = current['file']['md5'].toString().substring(2,4);
          fileURL = "https://static1.e621.net/data/$md5FirstSplit/$md5SecondSplit/${current['file']['md5']}.${current['file']['ext']}";
          sampleURL = fileURL.replaceFirst("data","data/sample").replaceFirst(current['file']['ext'], "jpg");
          thumbURL = sampleURL.replaceFirst("data/sample", "data/preview");
          if (current['file']['size'] <= 2694254){
            sampleURL = fileURL;
          }
        } else {
          fileURL = current['file']['url'];
          sampleURL = current['sample']['url'];
          thumbURL = current['preview']['url'];
        }
        addTagsWithType([...current['tags']['character']],TagType.character);
        addTagsWithType([...current['tags']['copyright']],TagType.copyright);
        addTagsWithType([...current['tags']['artist']],TagType.artist);
        addTagsWithType([...current['tags']['meta']],TagType.meta);
        addTagsWithType([...current['tags']['general']],TagType.none);
        addTagsWithType([...current['tags']['species']],TagType.species);
        BooruItem item = BooruItem(
          fileURL: fileURL,
          sampleURL: sampleURL,
          thumbnailURL: thumbURL,
          tagsList: [
            ...current['tags']['character'],
            ...current['tags']['copyright'],
            ...current['tags']['artist'],
            ...current['tags']['meta'],
            ...current['tags']['general'],
            ...current['tags']['species']
          ],
          postURL: makePostURL(current['id'].toString()),
          fileExt: current['file']['ext'],
          fileSize: current['file']['size'],
          fileWidth: current['file']['width'].toDouble(),
          fileHeight: current['file']['height'].toDouble(),
          sampleWidth: current['sample']['width'].toDouble(),
          sampleHeight: current['sample']['height'].toDouble(),
          previewWidth: current['preview']['width'].toDouble(),
          previewHeight: current['preview']['height'].toDouble(),
          hasNotes: current['has_notes'],
          serverId: current['id'].toString(),
          rating: current['rating'],
          score: current['score']['total'].toString(),
          sources: List<String>.from(current['sources'] ?? []),
          md5String: current['file']['md5'],
          postDate: current['created_at'].toString().replaceAll("t", "T"), // 2021-06-13T02:09:45.138-04:00
          postDateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS", // when timezone support added: "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
        );

        newItems.add(item);
      }
    }

    int lengthBefore = fetched.length;
    fetched.addAll(newItems);
    setMultipleTrackedValues(lengthBefore, fetched.length);
  }

  // This will create a url to goto the images page in the browser
  @override
  String makePostURL(String id){
    return "${booru.baseURL}/posts/$id?";
  }
  // This will create a url for the http request
  @override
  String makeURL(String tags){
    if (booru.apiKey == ""){
      return "${booru.baseURL}/posts.json?tags=$tags&limit=${limit.toString()}&page=${pageNum.toString()}";
    } else {
      return "${booru.baseURL}/posts.json?login=${booru.userID}&api_key=${booru.apiKey}&tags=$tags&limit=${limit.toString()}&page=${pageNum.toString()}";
    }
  }
  @override
  String makeTagURL(String input){
    return "${booru.baseURL}/tags.json?search[name_matches]=$input*&limit=10";
  }
  @override
  Future tagSearch(String input) async {
    List<String> searchTags = [];
    String url = makeTagURL(input);
    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri,headers: getHeaders());
      // 200 is the success http response code
      if (response.statusCode == 200) {
        var parsedResponse = jsonDecode(response.body);
        if (parsedResponse.length > 0){
          for (int i=0; i < parsedResponse.length; i++){
            searchTags.add(parsedResponse[i]['name']);
          }
        }
      }
    } catch(e) {
      Logger.Inst().log(e.toString(), "e621Handler", "tagSearch", LogTypes.exception);
    }
    return searchTags;
  }
}

