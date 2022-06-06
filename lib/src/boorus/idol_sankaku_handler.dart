import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:LoliSnatcher/src/data/comment_item.dart';
import 'package:LoliSnatcher/src/utils/logger.dart';
import 'package:LoliSnatcher/src/data/booru.dart';
import 'package:LoliSnatcher/src/data/booru_item.dart';
import 'package:LoliSnatcher/src/boorus/sankaku_handler.dart';
import 'package:LoliSnatcher/src/data/tag_type.dart';

/// Booru Handler for the Danbooru engine
class IdolSankakuHandler extends SankakuHandler{
  // Dart constructors are weird so it has to call super with the args
  IdolSankakuHandler(Booru booru,int limit) : super(booru,limit);
  @override
  bool hasSizeData = true;

  @override
  bool hasCommentsSupport = true;

  @override
  void parseResponse(response) {
    List<dynamic> parsedResponse = jsonDecode(response.body);

    // Create a BooruItem for each post in the list
    List<BooruItem> newItems = [];
    for (int i = 0; i < parsedResponse.length; i++) {
      var current = parsedResponse[i];
      Logger.Inst().log(current.toString(), "IdolSankakuHandler", "parseResponse", LogTypes.booruHandlerRawFetched);
      List<String> tags = [];
      Map<TagType, List<String>> tagMap = {};
      for (int x=0; x < current["tags"].length; x++) {
        tags.add(current["tags"][x]["name"].toString());
        String typeStr = current["tags"][x]["type"].toString();
        TagType type = tagTypeMap[typeStr] ?? TagType.none;
        if (tagMap.containsKey(type)){
          tagMap[type]?.add(current["tags"][x]["name"].toString());
        } else {
          tagMap[type] = [current["tags"][x]["name"].toString()];
        }
      }
      if (current['file_url'] != null) {
        for(int i = 0; i < tagMap.entries.length; i++){
          addTagsWithType(tagMap.entries.elementAt(i).value,tagMap.entries.elementAt(i).key);
        }
        String protocol = 'https:';
        BooruItem item = BooruItem(
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
          hasComments: current["has_comments"],
          serverId: current['id'].toString(),
          rating: current['rating'],
          score: current['total_score'].toString(),
          sources: [current['source']],
          md5String: current['md5'],
          postDate: current['created_at']['s'].toString(), // unix time without in seconds (need to x1000?)
          postDateFormat: "unix",
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
    return "https://idol.sankakucomplex.com/post/show/$id";
  }

  @override
  String makeURL(String tags){
    return "${booru.baseURL}/post/index.json?tags=$tags&limit=${limit.toString()}&page=${pageNum.toString()}";
  }

  @override
  String makeTagURL(String input){
    return "${booru.baseURL}/tag/index.json?name=$input*&limit=10";
  }

  // Example: https://iapi.sankakucomplex.com/comment/index.json?post_id=$post_id
  @override
  Future<List<CommentItem>> fetchComments(String postID, int pageNum) async {
    List<CommentItem> comments = [];
    String url = "${booru.baseURL}/comment/index.json?post_id=$postID";

    try {
      Uri uri = Uri.parse(url);
      final response = await http.get(uri,headers: getHeaders());
      // 200 is the success http response code
      if (response.statusCode == 200) {
        var parsedResponse = jsonDecode(response.body);
        var commentsJson = parsedResponse;
        if (commentsJson.length > 0){
          for (int i=0; i < commentsJson.length; i++){
            var current = commentsJson.elementAt(i);
            comments.add(CommentItem(
              id: current["id"].toString(),
              title: current["post_id"].toString(),
              content: current["body"].toString(),
              authorID: current["creator_id"].toString(),
              authorName: current["creator"].toString(),
              avatarUrl: current["creator_avatar"]?.toString().replaceFirst('//', 'https://'),
              score: current["score"],
              postID: current["post_id"].toString(),
              createDate: current['created_at'].toString(), // 2021-11-15 12:09
              createDateFormat: "yyyy-MM-dd HH:mm",
            ));
          }
        }
      }
    } catch(e) {
      Logger.Inst().log(e.toString(), "IdolSankakuHandler", "fetchComments", LogTypes.exception);
    }
    return comments;
  }
}