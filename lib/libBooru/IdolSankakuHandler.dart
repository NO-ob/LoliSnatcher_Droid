import 'dart:convert';
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

  Future Search(String tags,int pageNum) async{
    isActive = true;
    hasSizeData = true;
    int length = fetched.length;
    // if(this.pageNum == pageNum){
    //   return fetched;
    // }
    this.pageNum = pageNum;
    if (prevTags != tags){
      fetched = [];
    }
    String url = makeURL(tags);
    print(url);
    try {
      Map<String,String> headers = {
        "Content-Type":"application/json",
        "Accept": "application/json",
        "user-agent":"Mozilla/5.0 (Linux x86_64; rv:86.0) Gecko/20100101 Firefox/86.0"
      };
      Uri uri = Uri.parse(url);
      final response = await http.get(uri, headers: headers);
      // 200 is the success http response code
      if (response.statusCode == 200) {
        List<dynamic> parsedResponse = jsonDecode(response.body);
        // Create a BooruItem for each post in the list
        for (int i = 0; i < parsedResponse.length; i++){
          var current = parsedResponse[i];
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
        prevTags = tags;
        if (fetched.length == length){locked = true;}
        isActive = false;
        return fetched;
      } else {
        print('Sankaku load fail ${response.statusCode}');
        print(response.body);

      }
    } catch(e) {
      print(e);
      isActive = false;
      return fetched;
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