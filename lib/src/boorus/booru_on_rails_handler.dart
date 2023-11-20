import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';

// TODO autoreplace both ways all that special symbol crap (see tag suggestions) to normal format for user
// TODO fix file names like we do with shimmie, probably should move file name encode/decode process to boorus themselves instead of image writer

class BooruOnRailsHandler extends BooruHandler {
  BooruOnRailsHandler(super.booru, super.limit);

  @override
  bool get hasSizeData => true;

  @override
  String makePostURL(String id) {
    return '${booru.baseURL}/$id';
  }

  @override
  String validateTags(String tags) {
    if (tags == '' || tags == ' ') {
      return '*';
    } else {
      return super.validateTags(tags);
    }
  }

  @override
  List parseListFromResponse(dynamic response) {
    final Map<String, dynamic> parsedResponse = response.data;
    return (parsedResponse['posts'] as List?) ?? [];
  }

  @override
  BooruItem? parseItemFromResponse(dynamic responseItem, int index) {
    final List<String> currentTags = [];
    for (int x = 0; x < responseItem['tags'].length; x++) {
      // if (responseItem['tags'][x].contains(" ")){ // TODO why this? with this most tags are skipped
      currentTags.add(responseItem['tags'][x].toString().replaceAll(' ', '+'));
      // }
    }
    if (responseItem['representations']['full'] != null &&
        responseItem['representations']['medium'] != null &&
        responseItem['representations']['large'] != null) {
      final String id = responseItem['id']?.toString() ?? '';
      String fileURL = responseItem['representations']['full'] ?? responseItem['representations']['large'];
      String sampleURL = responseItem['representations']['large'];
      String thumbURL = responseItem['representations']['medium'];
      if (responseItem['mime_type'].toString().contains('video')) {
        final String tmpURL = "${sampleURL.substring(0, sampleURL.lastIndexOf("/") + 1)}thumb.gif";
        sampleURL = tmpURL;
        thumbURL = tmpURL;
      }
      if (!fileURL.contains('http')) {
        fileURL = '${booru.baseURL!}$fileURL';
        sampleURL = '${booru.baseURL!}$sampleURL';
        thumbURL = '${booru.baseURL!}$thumbURL';
      }
      // TODO caching broken because names are the same for every image
      fileURL = '$fileURL?$id';
      sampleURL = '$sampleURL?$id';
      thumbURL = '$thumbURL?$id';

      final BooruItem item = BooruItem(
        fileURL: fileURL,
        fileWidth: responseItem['width']?.toDouble(),
        fileHeight: responseItem['height']?.toDouble(),
        fileExt: responseItem['format']?.toString(),
        sampleURL: sampleURL,
        thumbnailURL: thumbURL,
        tagsList: currentTags,
        postURL: makePostURL(id),
        serverId: id,
        score: responseItem['score']?.toString(),
        sources: [responseItem['source_url']?.toString() ?? ''],
        rating: currentTags[0][0],
        postDate: responseItem['created_at'], // 2021-06-13T02:09:45.138-04:00
        postDateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
        fileNameExtras: '${booru.name}_${id}_', // when timezone support added: "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
      );
      return item;
    } else {
      return null;
    }
  }

  @override
  String makeURL(String tags) {
    final String tagsWithCommas = tags.replaceAll(' ', ',');
    final String limitStr = limit.toString();
    final String pageStr = pageNum.toString();
    final String apiKeyStr = booru.apiKey?.isNotEmpty == true ? 'key=${booru.apiKey}&' : '';

    // EXAMPLE: https://twibooru.org/api/v3/search/posts?q=*&perpage=10&page=1
    return '${booru.baseURL}/api/v3/search/posts?${apiKeyStr}q=$tagsWithCommas&perpage=$limitStr&page=$pageStr';
  }

  @override
  String makeTagURL(String input) {
    // EXAMPLE: https://twibooru.org/api/v3/search/tags?q=*rai*
    return '${booru.baseURL}/api/v3/search/tags?q=*$input*';
  }

  @override
  List parseTagSuggestionsList(dynamic response) {
    final List<dynamic> parsedResponse = response.data['tags'];
    return parsedResponse;
  }

  static List<List<String>> tagStringReplacements = [
    ['-colon-', ':'],
    ['-dash-', '-'],
    ['-fwslash-', '/'],
    ['-bwslash-', r'\'],
    ['-dot-', '.'],
    ['-plus-', '+'],
  ];

  @override
  String? parseTagSuggestion(dynamic responseItem, int index) {
    String tag = responseItem['slug'].toString();
    for (int x = 0; x < tagStringReplacements.length; x++) {
      tag = tag.replaceAll(tagStringReplacements[x][0], tagStringReplacements[x][1]);
    }
    return tag;
  }
}
