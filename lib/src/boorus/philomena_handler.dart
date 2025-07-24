import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/tag_suggestion.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';

class PhilomenaHandler extends BooruHandler {
  PhilomenaHandler(super.booru, super.limit);

  @override
  bool get hasTagSuggestions => true;

  @override
  String validateTags(String tags) {
    if (tags == '' || tags == ' ') {
      return '*';
    } else {
      return tags;
    }
  }

  @override
  List parseListFromResponse(dynamic response) {
    final Map<String, dynamic> parsedResponse = response.data;
    return (parsedResponse['images'] ?? []) as List;
  }

  @override
  BooruItem? parseItemFromResponse(dynamic responseItem, int index) {
    final current = responseItem;
    if (current['representations']['full'] != null) {
      String sampleURL = current['representations']['medium'], thumbURL = current['representations']['thumb_small'];
      if (current['mime_type'].toString().contains('video')) {
        final String tmpURL = "${sampleURL.substring(0, sampleURL.lastIndexOf("/") + 1)}thumb.gif";
        sampleURL = tmpURL;
        thumbURL = tmpURL;
      }

      String fileURL = current['representations']['full'];
      if (!fileURL.contains('http')) {
        sampleURL = booru.baseURL! + sampleURL;
        thumbURL = booru.baseURL! + thumbURL;
        fileURL = booru.baseURL! + fileURL;
      }

      final List<String> currentTags = current['tags']
          .toString()
          .substring(1, current['tags'].toString().length - 1)
          .split(', ');
      for (int x = 0; x < currentTags.length; x++) {
        if (currentTags[x].contains(' ')) {
          currentTags[x] = currentTags[x].replaceAll(' ', '+');
        }
      }
      final BooruItem item = BooruItem(
        fileURL: fileURL,
        fileWidth: current['width']?.toDouble(),
        fileHeight: current['height']?.toDouble(),
        fileSize: current['size'],
        sampleURL: sampleURL,
        thumbnailURL: thumbURL,
        tagsList: currentTags,
        postURL: makePostURL(current['id'].toString()),
        serverId: current['id'].toString(),
        score: current['score'].toString(),
        sources: [current['source_url'].toString()],
        postDate: current['created_at'],
        postDateFormat: 'iso',
        fileNameExtras: "${booru.name}_${current['id']}_",
      );

      return item;
    } else {
      return null;
    }
  }

  @override
  String makePostURL(String id) {
    return '${booru.baseURL}/images/$id';
  }

  @override
  String makeURL(String tags) {
    // EXAMPLE: https://derpibooru.org/api/v1/json/search/images?q=solo&per_page=20&page=1
    String filter = '2';
    if (booru.baseURL!.contains('derpibooru')) {
      filter = '56027';
    }

    final formattedTags = tags.replaceAll(' ', ',').replaceAll('_', '+');
    if (booru.apiKey?.isEmpty ?? true) {
      return '${booru.baseURL}/api/v1/json/search/images?filter_id=$filter&q=$formattedTags&per_page=$limit&page=$pageNum';
    } else {
      return '${booru.baseURL}/api/v1/json/search/images?key=${booru.apiKey}&q=$formattedTags&per_page=$limit&page=$pageNum';
    }
  }

  @override
  String makeTagURL(String input) {
    if (input.isEmpty) {
      input = '*';
    }
    return '${booru.baseURL}/api/v1/json/search/tags?q=*${input.replaceAll('_', '+')}*&per_page=20';
  }

  @override
  List parseTagSuggestionsList(dynamic response) {
    final Map<String, dynamic> parsedResponse = response.data;
    return parsedResponse['tags'];
  }

  @override
  TagSuggestion? parseTagSuggestion(dynamic responseItem, int index) {
    final List tagStringReplacements = [
      ['-colon-', ':'],
      ['-dash-', '-'],
      ['-fwslash-', '/'],
      ['-bwslash-', r'\'],
      ['-dot-', '.'],
      ['-plus-', '+'],
      ['+', '_'],
    ];

    String tag = responseItem['slug'].toString();
    for (int x = 0; x < tagStringReplacements.length; x++) {
      tag = tag.replaceAll(tagStringReplacements[x][0], tagStringReplacements[x][1]);
    }
    return TagSuggestion(tag: tag);
  }
}
