import 'package:dio/dio.dart';
import 'package:get/get.dart' show FirstWhereExt;

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';

class WorldXyzHandler extends BooruHandler {
  WorldXyzHandler(super.booru, super.limit);

  @override
  List parseListFromResponse(dynamic response) {
    final Map<String, dynamic> parsedResponse = response.data;
    return (parsedResponse['items'] ?? []) as List;
  }

  @override
  BooruItem? parseItemFromResponse(dynamic responseItem, int index) {
    final current = responseItem;

    final List<dynamic> imageLinks = current['imageLinks'];
    imageLinks.sort((a, b) => a['type'].compareTo(b['type']) * -1);
    final bool isVideo = current['type'] == 1; //type 1 - video, type 0 - image
    final List<int> possibleBestVideoFiles = [10, 40, 41, 11];
    String? bestFile = imageLinks.firstWhereOrNull(
      (f) => isVideo ? possibleBestVideoFiles.contains(f['type']) : f['type'] == 2,
    )?['url'];
    String sampleImage = imageLinks.where((f) => f['type'] == 2).toList()[0]['url']; // isVideo ? 2 : 5 ???
    String thumbImage = imageLinks.where((f) => f['type'] == 4).toList()[0]['url'];
    // Site generates links to RAW images, but they often lead to 404, override them
    // if(bestImage.contains('.raw.')) {
    //   bestIndex = 1;
    //   bestImage = imageLinks[bestIndex]['url'];
    // }

    if (bestFile == null) {
      return null;
    }

    // They mostly use cdn, but sometimes they aren't and it leads to same domain, this fixes such links
    bestFile = bestFile.startsWith('https') ? bestFile : (booru.baseURL! + bestFile);
    sampleImage = sampleImage.startsWith('https') ? sampleImage : (booru.baseURL! + sampleImage);
    thumbImage = thumbImage.startsWith('https') ? thumbImage : (booru.baseURL! + thumbImage);

    // Uses retarded tag scheme: "tag with multiple words|next tag", instead of "tag_with_multiple_words next_tag", convert their scheme to ours here
    final List<String> originalTags = current['tags'] != null ? [...current['tags']] : [];
    final fixedTags = originalTags.map((tag) => tag.replaceAll(RegExp(' '), '_')).toList();

    final String dateString = current['created'].split('.')[0]; // split off microseconds // use posted or created?
    final BooruItem item = BooruItem(
      fileURL: bestFile,
      sampleURL: sampleImage,
      thumbnailURL: thumbImage,
      tagsList: fixedTags,
      postURL: makePostURL(current['id'].toString()),
      serverId: current['id'].toString(),
      // use views as score, people don't rate stuff here often
      score: current['views'].toString(),
      sources: List<String>.from(current['sources'] ?? []),
      postDate: dateString, // 2021-06-18T06:09:02.63366 // microseconds?
      postDateFormat: "yyyy-MM-dd'T'hh:mm:ss",
    );

    return item;
  }

  @override
  String makePostURL(String id) {
    return '${booru.baseURL}/post/$id';
  }

  @override
  String makeURL(String tags) {
    // convert "tag_name_1 tag_name_2" to "tag name 1|tag name 2" and filter excluded tags out
    final String includeTags = tags.split(' ').where((f) => !f.startsWith('-')).toList().map((tag) => tag.replaceAll(RegExp('_'), '+')).toList().join('|');
    final String excludeTags = tags
        .split(' ')
        .where((f) => f.startsWith('-'))
        .toList()
        .map(
          (tag) => tag.replaceAll(RegExp('_'), '+').replaceAll(RegExp('^-'), ''),
        )
        .toList()
        .join('|');
    // ignores custom limit if search is empty, otherwise it works
    //
    final int skip = (pageNum * limit) < 0 ? 0 : (pageNum * limit);
    return '${booru.baseURL}/api/post/Search?IncludeLinks=true&Tag=$includeTags&ExcludeTag=$excludeTags&OrderBy=0&Skip=$skip&Take=$limit&DisableTotal=false';
  }

  @override
  String makeTagURL(String input) {
    return '${booru.baseURL}/api/tag/Search';
  }

  @override
  Future<Response> fetchTagSuggestions(Uri uri, String input) {
    return DioNetwork.post(
      uri.toString(),
      headers: {
        ...getHeaders(),
        'Content-Type': 'application/json',
      },
      data: {
        'searchText': input.replaceAll(RegExp('^-'), ''),
        'skip': 0,
        'take': 10,
      },
    );
  }

  @override
  List parseTagSuggestionsList(dynamic response) {
    final parsedResponse = response.data;
    return parsedResponse['items'] ?? [];
  }

  @override
  String? parseTagSuggestion(dynamic responseItem, int index) {
    return responseItem['value']?.replaceAll(RegExp(' '), '_');
  }

  // TODO disabled because api has a limit of 600 items for any query
  // @override
  // Future<void> searchCount(String input) async {
  //   int result = 0;
  //   String url = makeURL(input);
  //   url = url.replaceAll(RegExp(r''), '');
  //   try {
  //     final response = await DioNetwork.get(url, headers: getHeaders());
  //     // 200 is the success http response code
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> parsedResponse = response.data;
  //       result = parsedResponse['totalCount'];
  //     } else {
  //       Logger.Inst().log(response.statusCode.toString(), "WorldXyzHandler", "searchCount", LogTypes.booruHandlerInfo);
  //     }
  //   } catch (e) {
  //     Logger.Inst().log(e.toString(), "WorldXyzHandler", "searchCount", LogTypes.exception);
  //   }
  //   totalCount.value = result;
  //   return;
  // }
}
