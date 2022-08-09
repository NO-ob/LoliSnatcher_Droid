import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/utils/logger.dart';

// This booru works weird, once you get a session id and do a search itll give you results with only partial data and a results id
// We then need to get the is and do a search to get full info for all results from the search

class InkBunnyHandler extends BooruHandler {
  InkBunnyHandler(Booru booru, int limit) : super(booru, limit);

  String sessionToken = "";
  bool _gettingToken = false;
  @override
  bool hasSizeData = true;

  Future<bool> setSessionToken() async {
    //https://inkbunny.net/api_login.php?output_mode=xml&username=guest
    //https://inkbunny.net/api_login.php?output_mode=xml&username=myusername&password=mypassword
    _gettingToken = true;
    String url = "${booru.baseURL}/api_login.php?output_mode=json";
    if (booru.apiKey!.isEmpty && booru.userID!.isEmpty){
        url += "&username=guest";
    } else {
      url += "&username=${booru.userID}&password=${Uri.encodeComponent(booru.apiKey!)}";
    }
    try{
      final response = await fetchSearch(Uri.parse(url));
      Map<String, dynamic> parsedResponse = jsonDecode(response.body);
      if (parsedResponse["sid"] != null){
        sessionToken = parsedResponse["sid"].toString();
        Logger.Inst().log("Inkbunny session token found: $sessionToken", "InkBunnyHandler", "getSessionToken", LogTypes.booruHandlerInfo);
        await setRatingOptions();
      } else {
        Logger.Inst().log("Inkbunny couldn't get session token", "InkBunnyHandler", "getSessionToken", LogTypes.booruHandlerInfo);
      }
    } catch (e){
      Logger.Inst().log("Exception getting session token: $url $e", "InkBunnyHandler", "getSessionToken", LogTypes.booruHandlerInfo);
    }
    _gettingToken = false;
    return sessionToken.isEmpty ? false : true;
  }

  // This sets ratings for the session so that all images are returned from the api
  Future<bool> setRatingOptions() async {
    String url = "${booru.baseURL}/api_userrating.php?output_mode=json&sid=$sessionToken&tag[2]=yes&tag[3]=yes&tag[4]=yes&tag[5]=yes";
    try{
      final response = await fetchSearch(Uri.parse(url));
      Map<String, dynamic> parsedResponse = jsonDecode(response.body);
      if (parsedResponse["sid"] != null){
        if (sessionToken == parsedResponse["sid"]){
          Logger.Inst().log("Inkbunny set ratings", className, "setRatingOptions", LogTypes.booruHandlerInfo);
        }
      } else {
        Logger.Inst().log("Inkbunny failed to set ratings", className, "setRatingOptions", LogTypes.booruHandlerInfo);
      }
    } catch (e){
      Logger.Inst().log("Exception setting ratings $e", className, "setRatingOptions", LogTypes.booruHandlerInfo);
    }
    return true;
  }

  @override
  Future fetchSearch(Uri uri) async {
    return http.get(uri, headers: getHeaders());
  }

  // The api doesn't give much information about the posts so we need to get their ids and then do another query to get all the data
  Future getSubmissionResponse(parsedResponse) async{
    totalCount.value = int.parse(parsedResponse["results_count_all"]);
    List<String> ids = [];
    for (int i =0; i < parsedResponse["submissions"].length; i++){
      var current = parsedResponse["submissions"][i];
      ids.add(current["submission_id"].toString());
    }
    Logger.Inst().log("Got submission ids: $ids", className, "getSubmissionResponse", LogTypes.booruHandlerInfo);
    try {
      Uri uri = Uri.parse("${booru.baseURL}/api_submissions.php?output_mode=json&sid=$sessionToken&submission_ids=${ids.join(",")}");
      var response = await fetchSearch(uri);
      Logger.Inst().log("Getting submission data: ${uri.toString()}", className, "getSubmissionResponse", LogTypes.booruHandlerRawFetched);
      if (response.statusCode == 200) {
        Logger.Inst().log(response.body, className, "getSubmissionResponse", LogTypes.booruHandlerRawFetched);
        return response.body;
      } else {
        Logger.Inst().log("InkBunnyHandler failed to get submissions", className, "getSubmissionResponse", LogTypes.booruHandlerFetchFailed);
      }
    } catch(e) {
      Logger.Inst().log(e.toString(), className, "getSubmissionResponse", LogTypes.exception);
    }
    Logger.Inst().log("returning null", className, "getSubmissionResponse", LogTypes.booruHandlerInfo);
    return {};
  }

  @override
  Future<List> parseListFromResponse(response) async{
    // The api will keep loading pages with the same results as the last page if pagenum is bigger than the max
    var parsedResponse = jsonDecode(response.body);
    int maxPageCount = parsedResponse["pages_count"];
    if(pageNum > 1 && pageNum > maxPageCount){
      return [];
    }
    var parsedSubmissionResponse = jsonDecode(await getSubmissionResponse(parsedResponse));
    return parseItemsFromResponse(parsedSubmissionResponse);
  }

  @override
  Future<bool> searchSetup() async{
    if (sessionToken.isEmpty && !_gettingToken){
      bool gotToken = await setSessionToken();
      if (!gotToken){
        return false;
      }
    }
    return true;
  }

  // Inkbunny can have multiple images per posts so the response cannot be parsed like the other boorus
  List<BooruItem> parseItemsFromResponse(parsedResponse){
    // Api orders the results the wrong way
    List rawItems = (parsedResponse["submissions"] ?? []).reversed.toList();
    List<BooruItem> items = [];
    for(int i = 0; i < rawItems.length; i++){
      var current = rawItems[i];
      Logger.Inst().log(current.toString(), className, "parseItemsFromResponse", LogTypes.booruHandlerRawFetched);
      List<String> currentTags = [];
      currentTags.add("artist:${current["username"]}");
      var tags = current["keywords"] ?? [];

      for (int i = 0; i < tags.length; i++){
        currentTags.add(tags[i]["keyword_name"].replaceAll(" ", "_"));
      }
      // A submission can have multiple files so a booru item must be made for each of them
      var files = current["files"];

      for (int i = 0; i < files.length; i++) {
        String sampleURL = files[i]["file_url_screen"],
            thumbURL = files[i]["file_url_preview"],
            fileURL = files[i]["file_url_full"];
        if (fileURL.endsWith(".mp4") && files[i].containsKey("thumbnail_url_huge")){
          thumbURL = files[i]["thumbnail_url_huge"];
          sampleURL = thumbURL;
        } else if (i > 0 && !files[0]["file_url_full"].endsWith(".mp4")) {
          sampleURL = files[0]["file_url_screen"];
          thumbURL = files[0]["file_url_preview"];
        }
        BooruItem item = BooruItem(
          fileURL: fileURL,
          sampleURL: sampleURL,
          thumbnailURL: thumbURL,
          fileWidth: double.tryParse(files[i]["full_size_x"] ?? ""),
          fileHeight: double.tryParse(files[i]["full_size_y"] ?? ""),
          sampleWidth: double.tryParse(files[i]["screen_size_x"] ?? ""),
          sampleHeight: double.tryParse(files[i]["screen_size_y"] ?? ""),
          previewWidth: double.tryParse(files[i]["preview_size_x"] ?? ""),
          previewHeight: double.tryParse(files[i]["preview_size_y"] ?? ""),
          md5String: files[i]["full_file_md5"],
          tagsList: currentTags,
          postURL: makePostURL(current["submission_id"].toString()),
          serverId: current["submission_id"].toString(),
          score: current["favorites_count"],
          postDate: current["create_datetime"].split(".")[0],
          rating: current["rating_name"],
          postDateFormat: "yyyy-MM-dd'T'HH:mm:ss'Z'",
        );

        items.add(item);
      }
    }
    return items;

  }

  @override
  FutureOr<BooruItem?> parseItemFromResponse(responseItem, int index) {
    return responseItem;
  }

  // This will create a url to goto the images page in the browser
  @override
  String makePostURL(String id){
    return "${booru.baseURL}/s/$id";
  }

  // This will create a url for the http request
  @override
  String makeURL(String tags){
    String artist = "";
    bool random = false;
    List<String> tagList = tags.split(" ");
    String tagStr = "";
    for (int i = 0; i < tagList.length; i++){
      if (tagList[i].contains("artist:")){
        artist = tagList[i].replaceAll("artist:", "");
      } else if (tagList[i].contains("order:")){
        if (tagList[i] == "order:random"){
          random = true;
        }
      }else {
        tagStr += "${tagList[i]},";
      }
    }

    //Each search generates a results id, this is then needed to page through the results without running the search again every time because its faster,
    //You can go through the results without a results id like normal but this is how they show it on their api docs: https://wiki.inkbunny.net/wiki/API
    //I have removed the code that was using the results id before we will see how this is without using that.

    //The type variable filters by file type so we only fetch those that are supported by the app
    return "${booru.baseURL}/api_search.php?output_mode=json&sid=$sessionToken&text=$tagStr&username=$artist&get_rid=yes&type=1,2,3,8,9,13,14&random=${random ? "yes" : "no"}&submission_ids_only=yes";
  }

  @override
  String makeTagURL(String input){
    Logger.Inst().log("inkbunny tag search $input ", className, "makeTagURL", LogTypes.booruHandlerInfo);
    return "${booru.baseURL}/api_search_autosuggest.php?output_mode=json&keyword=${input.replaceAll("_", "+")}&ratingsmask=11111";
  }

  @override
  Future tagSearch(String input) async {
    List<String> searchTags = [];
    String url = makeTagURL(input);
    try {
      Uri uri = Uri.parse(url);
      var response = await fetchSearch(uri);
      Logger.Inst().log("$url ", className, "tagSearch", LogTypes.booruHandlerInfo);
      Logger.Inst().log(response.body, className, "tagSearch", LogTypes.booruHandlerInfo);
      if (response.statusCode == 200) {
        var parsedResponse = jsonDecode(response.body);
        if (parsedResponse.containsKey("results")){
          var tagObjects = parsedResponse["results"];
          if (tagObjects.length > 0){
            for (int i=0; i < tagObjects.length; i++){
              Logger.Inst().log("tag $i = ${tagObjects[i]["value"]}", className, "tagSearch", LogTypes.booruHandlerInfo);
              searchTags.add(tagObjects[i]["value"].replaceAll(" ", "_"));
            }
          }
        }
      } else {
        Logger.Inst().log(e.toString(), className, "tagSearch", LogTypes.exception);
      }
    } catch(e) {
      Logger.Inst().log(e.toString(), className, "tagSearch", LogTypes.exception);
    }
    return searchTags;
  }

}