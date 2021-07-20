import 'dart:math';
import 'package:xml/xml.dart' as xml;
import 'BooruItem.dart';
import 'GelbooruHandler.dart';
import 'Booru.dart';
/**
 * Booru Handler for the gelbooru engine only difference do gelbooru is the search/api url all the returned data is the same
 */
class MoebooruHandler extends GelbooruHandler{
  MoebooruHandler(Booru booru,int limit) : super(booru,limit);
  @override
  // This will create a url to goto the images page in the browser
  String makePostURL(String id){
    return "${booru.baseURL}/post/show/$id/";
  }

  @override
  void parseResponse(response){
    var parsedResponse = xml.parse(response.body);
    /**
     * This creates a list of xml elements 'post' to extract only the post elements which contain
     * all the data needed about each image
     */
    var posts = parsedResponse.findAllElements('post');
    // Create a BooruItem for each post in the list
    for (int i = 0; i < posts.length; i++){
      var current = posts.elementAt(i);
      /**
       * Add a new booruitem to the list .getAttribute will get the data assigned to a particular tag in the xml object
       */
      if(current.getAttribute("file_url") != null){
        // Fix for bleachbooru
        String fileURL = "", sampleURL = "", previewURL = "";
        fileURL += current.getAttribute("file_url")!.toString();
        sampleURL += current.getAttribute("sample_url")!.toString();
        previewURL += current.getAttribute("preview_url")!.toString();
        if (!fileURL.contains("http")){
          fileURL = booru.baseURL! + fileURL;
          sampleURL = booru.baseURL! + sampleURL;
          previewURL = booru.baseURL! + previewURL;
        }
        print(fileURL);
        fetched.add(new BooruItem(
          fileURL: fileURL,
          sampleURL: sampleURL,
          thumbnailURL: previewURL,
          tagsList: current.getAttribute("tags")!.split(" "),
          postURL: makePostURL(current.getAttribute("id")!),
          fileWidth: double.tryParse(current.getAttribute('width') ?? '') ?? null,
          fileHeight: double.tryParse(current.getAttribute('height') ?? '') ?? null,
          sampleWidth: double.tryParse(current.getAttribute('sample_width') ?? '') ?? null,
          sampleHeight: double.tryParse(current.getAttribute('sample_height') ?? '') ?? null,
          previewWidth: double.tryParse(current.getAttribute('preview_width') ?? '') ?? null,
          previewHeight: double.tryParse(current.getAttribute('preview_height') ?? '') ?? null,
          serverId: current.getAttribute("id"),
          rating: current.getAttribute("rating"),
          score: current.getAttribute("score"),
          sources: [current.getAttribute("source") == null ? "" : current.getAttribute("source")!],
          md5String: current.getAttribute("md5"),
          postDate: current.getAttribute("created_at"), // Fri Jun 18 02:13:45 -0500 2021
          postDateFormat: "unix", // when timezone support added: "EEE MMM dd HH:mm:ss Z yyyy",
        ));
        print(fetched.last);
        if(dbHandler!.db != null){
          setTrackedValues(fetched.length - 1);
        }
      }
    }
  }
  @override
  // This will create a url for the http request
  String makeURL(String tags){
    int cappedPage = max(1, pageNum);
    if (booru.apiKey == ""){
      return "${booru.baseURL}/post.xml?tags=$tags&limit=${limit.toString()}&page=${cappedPage.toString()}";
    } else {
      return "${booru.baseURL}/post.xml?login=${booru.userID}&api_key=${booru.apiKey}&tags=$tags&limit=${limit.toString()}&page=${cappedPage.toString()}";
    }
  }
  @override
  String makeTagURL(String input){
      return "${booru.baseURL}/tag.xml?limit=10&name=$input*";
  }

}