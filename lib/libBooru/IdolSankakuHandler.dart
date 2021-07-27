import 'dart:convert';
import 'package:LoliSnatcher/utilities/Logger.dart';
import 'package:http/http.dart' as http;

import 'package:LoliSnatcher/Tools.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/libBooru/SankakuHandler.dart';

/**
 * Booru Handler for the Danbooru engine
 */
class IdolSankakuHandler extends SankakuHandler{
  // Dart constructors are weird so it has to call super with the args
  IdolSankakuHandler(Booru booru,int limit) : super(booru,limit);
  @override
  bool hasSizeData = true;

  @override
  void parseResponse(response){
    List<dynamic> parsedResponse = jsonDecode(response.body);
    // Create a BooruItem for each post in the list
    for (int i = 0; i < parsedResponse.length; i++){
      var current = parsedResponse[i];
      Logger.Inst().log(current.toString(), "IdolSankakuHandler", "parseResponse", LogTypes.booruHandlerRawFetched);
      List<String> tags = [];
      for (int x=0; x < current['tags'].length; x++) {
        tags.add(current['tags'][x]['name'].toString());
      }
      if (current['file_url'] != null) {
        String protocol = 'https:';
        fetched.add(BooruItem(
          fileURL: protocol + current['file_url'],
          sampleURL: protocol + current['sample_url'],
          thumbnailURL: protocol + current['preview_url'],
          tagsList: tags,
          postURL: makePostURL(current['id'].toString()),
          fileSize: current['file_size'],
          fileWidth: current['width'].toDouble(),
          fileHeight: current['height'].toDouble(),
          sampleWidth: current['sample_width'].toDouble(),
          sampleHeight: current['sample_height'].toDouble(),
          previewWidth: current['preview_width'].toDouble(),
          previewHeight: current['preview_height'].toDouble(),
          hasNotes: current['has_notes'],
          serverId: current['id'].toString(),
          rating: current['rating'],
          score: current['total_score'].toString(),
          sources: [current['source']],
          md5String: current['md5'],
          postDate: DateTime.fromMillisecondsSinceEpoch(int.parse(current['created_at']['s'].toString() + '000')).toString(), // unix time without in seconds (need to x1000?)
          postDateFormat: "yyyy-MM-dd HH:mm:ss.SSS",
        ));
        if (dbHandler!.db != null) {
          setTrackedValues(fetched.length - 1);
        }
      }
    }
  }
  // This will create a url to goto the images page in the browser
  String makePostURL(String id){
    return "https://idol.sankakucomplex.com/post/show/$id";
  }

  String makeURL(String tags){
    return "${booru.baseURL}/post/index.json?tags=$tags&limit=${limit.toString()}&page=${pageNum.toString()}";
  }

  String makeTagURL(String input){
    return "${booru.baseURL}/tag/index.json?name=$input*&limit=10";
  }
}