import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/utils/logger.dart';

// This booru works weird, once you get a session id and do a search itll give you results with only partial data and a results id
// We then need to get the is and do a search to get full info for all results from the search

class InkBunnyHandler extends BooruHandler {
  InkBunnyHandler(super.booru, super.limit);

  String sessionToken = '';
  bool _gettingToken = false;
  @override
  bool get hasSizeData => true;

  Future<bool> setSessionToken() async {
    //https://inkbunny.net/api_login.php?output_mode=xml&username=guest
    //https://inkbunny.net/api_login.php?output_mode=xml&username=myusername&password=mypassword
    _gettingToken = true;
    final String url = '${booru.baseURL}/api_login.php?output_mode=json';
    final Map<String, String> queryParams = {};
    if ((booru.apiKey?.isEmpty ?? true) && (booru.userID?.isEmpty ?? true)) {
      queryParams['username'] = 'guest';
    } else {
      queryParams['username'] = booru.userID!;
      queryParams['password'] = booru.apiKey!;
    }
    try {
      final response = await fetchSearch(Uri.parse(url), queryParams: queryParams);
      final Map<String, dynamic> parsedResponse = response.data;
      if (parsedResponse['sid'] != null) {
        sessionToken = parsedResponse['sid'].toString();
        Logger.Inst().log('Inkbunny session token found: $sessionToken', 'InkBunnyHandler', 'getSessionToken', LogTypes.booruHandlerInfo);
        await setRatingOptions();
      } else {
        Logger.Inst().log("Inkbunny couldn't get session token", 'InkBunnyHandler', 'getSessionToken', LogTypes.booruHandlerInfo);
      }
    } catch (e) {
      Logger.Inst().log('Exception getting session token: $url $e', 'InkBunnyHandler', 'getSessionToken', LogTypes.booruHandlerInfo);
    }
    _gettingToken = false;
    return sessionToken.isNotEmpty;
  }

  // This sets ratings for the session so that all images are returned from the api
  Future<bool> setRatingOptions() async {
    final String url = '${booru.baseURL}/api_userrating.php?output_mode=json&sid=$sessionToken&tag[2]=yes&tag[3]=yes&tag[4]=yes&tag[5]=yes';
    try {
      final response = await fetchSearch(Uri.parse(url));
      final Map<String, dynamic> parsedResponse = response.data;
      if (parsedResponse['sid'] != null) {
        if (sessionToken == parsedResponse['sid']) {
          Logger.Inst().log('Inkbunny set ratings', className, 'setRatingOptions', LogTypes.booruHandlerInfo);
        }
      } else {
        Logger.Inst().log('Inkbunny failed to set ratings', className, 'setRatingOptions', LogTypes.booruHandlerInfo);
      }
    } catch (e) {
      Logger.Inst().log('Exception setting ratings $e', className, 'setRatingOptions', LogTypes.booruHandlerInfo);
    }
    return true;
  }

  // The api doesn't give much information about the posts so we need to get their ids and then do another query to get all the data
  Future getSubmissionResponse(dynamic parsedResponse) async {
    totalCount.value = int.parse(parsedResponse['results_count_all']);
    final List<String> ids = [];
    for (int i = 0; i < parsedResponse['submissions'].length; i++) {
      final current = parsedResponse['submissions'][i];
      ids.add(current['submission_id'].toString());
    }
    Logger.Inst().log('Got submission ids: $ids', className, 'getSubmissionResponse', LogTypes.booruHandlerInfo);
    try {
      final Uri uri = Uri.parse("${booru.baseURL}/api_submissions.php?output_mode=json&sid=$sessionToken&submission_ids=${ids.join(",")}");
      final response = await fetchSearch(uri);
      Logger.Inst().log('Getting submission data: $uri', className, 'getSubmissionResponse', LogTypes.booruHandlerRawFetched);
      if (response.statusCode == 200) {
        Logger.Inst().log(response.data, className, 'getSubmissionResponse', LogTypes.booruHandlerRawFetched);
        return response.data;
      } else {
        Logger.Inst().log('InkBunnyHandler failed to get submissions', className, 'getSubmissionResponse', LogTypes.booruHandlerFetchFailed);
      }
    } catch (e) {
      Logger.Inst().log(e.toString(), className, 'getSubmissionResponse', LogTypes.exception);
    }
    Logger.Inst().log('returning null', className, 'getSubmissionResponse', LogTypes.booruHandlerInfo);
    return {};
  }

  @override
  Future<List> parseListFromResponse(dynamic response) async {
    // The api will keep loading pages with the same results as the last page if pagenum is bigger than the max
    final parsedResponse = response.data;
    final int maxPageCount = parsedResponse['pages_count'];
    if (pageNum > 1 && pageNum > maxPageCount) {
      return [];
    }
    final parsedSubmissionResponse = await getSubmissionResponse(parsedResponse);
    return parseItemsFromResponse(parsedSubmissionResponse);
  }

  @override
  Future<bool> searchSetup() async {
    if (sessionToken.isEmpty && !_gettingToken) {
      final bool gotToken = await setSessionToken();
      if (!gotToken) {
        return false;
      }
    }
    return true;
  }

  // Inkbunny can have multiple images per posts so the response cannot be parsed like the other boorus
  List<BooruItem> parseItemsFromResponse(dynamic parsedResponse) {
    // Api orders the results the wrong way
    final List rawItems = (parsedResponse['submissions'] ?? []).reversed.toList();
    final List<BooruItem> items = [];
    for (int i = 0; i < rawItems.length; i++) {
      final current = rawItems[i];
      Logger.Inst().log(current.toString(), className, 'parseItemsFromResponse', LogTypes.booruHandlerRawFetched);
      final List<String> currentTags = [];
      currentTags.add("artist:${current["username"]}");
      final tags = current['keywords'] ?? [];

      for (int i = 0; i < tags.length; i++) {
        currentTags.add(tags[i]['keyword_name'].replaceAll(' ', '_'));
      }
      // A submission can have multiple files so a booru item must be made for each of them
      final files = current['files'];

      for (int i = 0; i < files.length; i++) {
        String sampleURL = files[i]['file_url_screen'], thumbURL = files[i]['file_url_preview'], fileURL = files[i]['file_url_full'];
        if (fileURL.endsWith('.mp4') && files[i].containsKey('thumbnail_url_huge')) {
          thumbURL = files[i]['thumbnail_url_huge'];
          sampleURL = thumbURL;
        }
        // Not sure why this was here but all images have wrong thumbs with this will leave commented
        /*else if (i > 0 && !files[0]["file_url_full"].endsWith(".mp4")) {
          sampleURL = files[0]["file_url_screen"];
          thumbURL = files[0]["file_url_preview"];
        }*/
        final BooruItem item = BooruItem(
          fileURL: fileURL,
          sampleURL: sampleURL,
          thumbnailURL: thumbURL,
          fileWidth: double.tryParse(files[i]['full_size_x'] ?? ''),
          fileHeight: double.tryParse(files[i]['full_size_y'] ?? ''),
          sampleWidth: double.tryParse(files[i]['screen_size_x'] ?? ''),
          sampleHeight: double.tryParse(files[i]['screen_size_y'] ?? ''),
          previewWidth: double.tryParse(files[i]['preview_size_x'] ?? ''),
          previewHeight: double.tryParse(files[i]['preview_size_y'] ?? ''),
          md5String: files[i]['full_file_md5'],
          tagsList: currentTags,
          postURL: getPostURL(current['submission_id'].toString(), i),
          serverId: current['submission_id'].toString(),
          score: current['favorites_count'],
          postDate: current['create_datetime'].split('.')[0],
          rating: current['rating_name'],
          postDateFormat: "yyyy-MM-dd'T'HH:mm:ss'Z'",
          fileNameExtras: (i > 0) ? 'p${i + 1}_' : '',
        );

        items.add(item);
      }
    }
    return items;
  }

  @override
  FutureOr<BooruItem?> parseItemFromResponse(dynamic responseItem, int index) {
    return responseItem;
  }

  // This will create a url to goto the images page in the browser
  String getPostURL(String id, int fileNum) {
    return "${booru.baseURL}/s/$id${fileNum > 0 ? "-p${fileNum + 1}-" : ""}";
  }

  // This will create a url for the http request
  @override
  String makeURL(String tags) {
    String order = '';
    String artist = '';
    bool random = false;
    final List<String> tagList = tags.split(' ');
    String tagStr = '';
    for (int i = 0; i < tagList.length; i++) {
      if (tagList[i].contains('artist:')) {
        artist = tagList[i].replaceAll('artist:', '');
      } else if (tagList[i].contains('order:')) {
        if (tagList[i] == 'order:random') {
          random = true;
        } else {
          // views, favs
          if (tagList[i].split(':').length > 1) {
            order = tagList[i].split(':')[1];
          }
        }
      } else {
        tagStr += '${tagList[i]},';
      }
    }

    //Each search generates a results id, this is then needed to page through the results without running the search again every time because its faster,
    //You can go through the results without a results id like normal but this is how they show it on their api docs: https://wiki.inkbunny.net/wiki/API
    //I have removed the code that was using the results id before we will see how this is without using that.

    //The type variable filters by file type so we only fetch those that are supported by the app
    return "${booru.baseURL}/api_search.php?output_mode=json&sid=$sessionToken&text=$tagStr&username=$artist&get_rid=yes&type=1,2,3,8,9,13,14&random=${random ? "yes" : "no"}&submission_ids_only=yes&orderby=$order&page=$pageNum";
  }

  @override
  String makeTagURL(String input) {
    Logger.Inst().log('inkbunny tag search $input ', className, 'makeTagURL', LogTypes.booruHandlerInfo);
    return "${booru.baseURL}/api_search_autosuggest.php?output_mode=json&keyword=${input.replaceAll("_", "+")}&ratingsmask=11111";
  }

  @override
  Future<List<String>> tagSearch(String input, {CancelToken? cancelToken}) async {
    final List<String> searchTags = [];
    final String url = makeTagURL(input);
    try {
      final Uri uri = Uri.parse(url);
      final response = await fetchSearch(uri);
      Logger.Inst().log('$url ', className, 'tagSearch', LogTypes.booruHandlerInfo);
      Logger.Inst().log(response.data, className, 'tagSearch', LogTypes.booruHandlerInfo);
      if (response.statusCode == 200) {
        final parsedResponse = response.data;
        if (parsedResponse.containsKey('results')) {
          final tagObjects = parsedResponse['results'];
          if (tagObjects.length > 0) {
            for (int i = 0; i < tagObjects.length; i++) {
              Logger.Inst().log("tag $i = ${tagObjects[i]["value"]}", className, 'tagSearch', LogTypes.booruHandlerInfo);
              searchTags.add(tagObjects[i]['value'].replaceAll(' ', '_'));
            }
          }
        }
      } else {
        Logger.Inst().log(e.toString(), className, 'tagSearch', LogTypes.exception);
      }
    } catch (e) {
      Logger.Inst().log(e.toString(), className, 'tagSearch', LogTypes.exception);
    }
    return searchTags;
  }
}
