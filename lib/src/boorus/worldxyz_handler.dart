import 'package:dio/dio.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/tag_suggestion.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/utils/logger.dart';

class WorldXyzHandler extends BooruHandler {
  WorldXyzHandler(super.booru, super.limit);

  @override
  bool get hasTagSuggestions => true;

  @override
  bool get hasLoadItemSupport => true;

  @override
  bool get shouldUpdateIteminTagView => true;

  @override
  List parseListFromResponse(dynamic response) {
    final Map<String, dynamic> parsedResponse = response.data;
    try {
      totalCount.value = totalCount.value > 0
          ? totalCount.value
          : int.tryParse(parsedResponse['totalCount'] ?? '0') ?? 0;
      cursor = parsedResponse['cursor'] ?? '';
    } catch (_) {}
    return (parsedResponse['items'] ?? []) as List;
  }

  @override
  BooruItem? parseItemFromResponse(dynamic responseItem, int index) {
    final current = responseItem;

    //type 0: image, 1: video
    final bool isVideo = current['type'] == 1;

    const Map<int, String> thumbnailTypes = {
      11: 'PicThumbnail',
      12: 'PicThumbnailEx',
      31: 'PicThumbnailAvif',
      32: 'PicThumbnailExAvif',
    };

    const Map<int, String> sampleTypes = {
      14: 'PicSmall',
    };

    const Map<int, String> fileTypes = {
      1: 'Raw',
      10: 'Pic',
      14: 'PicSmall',
      100: 'Mov',
      112: 'Mov480',
      113: 'Mov720',
      114: 'Mov1080',
      200: 'MovHevc',
      211: 'Mov360Hevc',
      212: 'Mov480Hevc',
      213: 'Mov720Hevc',
      214: 'Mov1080Hevc',
      300: 'MovAv1',
      311: 'Mov360Av1',
      312: 'Mov480Av1',
      313: 'Mov720Av1',
      314: 'Mov1080Av1',
    };

    const Map<String, String> fileExts = {
      'Raw': 'raw',
      'Pic': 'pic.jpg',
      'PicThumbnail': 'pic256.jpg',
      'PicThumbnailEx': 'pic256ex.jpg',
      'PicPreview': 'picpreview.jpg',
      'PicSmall': 'picsmall.jpg',
      'PicAvif': 'picavif.avif',
      'PicThumbnailAvif': 'pic256avif.avif',
      'PicThumbnailExAvif': 'pic256exavif.avif',
      'PicPreviewAvif': 'picpreviewavif.avif',
      'PicSmallAvif': 'small.avif',
      'Mov': 'mov.mp4',
      'MovThumbnail': 'mov256.mp4',
      'MovThumbnailEx': 'mov256ex.mp4',
      'Mov360': '360.mp4',
      'Mov480': 'mov480.mp4',
      'Mov720': 'mov720.mp4',
      'Mov1080': '1080.mp4',
      'MovHevc': 'hevc.mp4',
      'MovThumbnailHevc': 'thumbnail.hevc.mp4',
      'MovThumbnailExHevc': 'thumbnailEx.hevc.mp4',
      'Mov360Hevc': '360.hevc.mp4',
      'Mov480Hevc': '480.hevc.mp4',
      'Mov720Hevc': '720.hevc.mp4',
      'Mov1080Hevc': '1080.hevc.mp4',
      'MovAv1': 'av1.mp4',
      'MovThumbnailAv1': 'thumbnail.av1.mp4',
      'MovThumbnailExAv1': 'thumbnailEx.av1.mp4',
      'Mov360Av1': '360.av1.mp4',
      'Mov480Av1': '480.av1.mp4',
      'Mov720Av1': '720.av1.mp4',
      'Mov1080Av1': '1080.av1.mp4',
    };

    final Map<String, dynamic> files = current['files'] ?? {};
    final List<int> availableFileTypes = files.keys.map((e) => int.tryParse(e) ?? 0).toList()
      ..sort((a, b) => a.compareTo(b));

    final String id = current['id'].toString();
    // remove last 3 numbers of the id
    final String fileGroupId = id.substring(0, id.length - 3);

    final int? thumbnailType = availableFileTypes.lastWhereOrNull(thumbnailTypes.containsKey);
    final String thumbnailFileExt = fileExts[thumbnailTypes[thumbnailType]] ?? 'pic256.jpg';
    final String thumbnailUrl = '${booru.baseURL}/posts/$fileGroupId/$id/$id.$thumbnailFileExt';

    final int? sampleType = availableFileTypes.lastWhereOrNull(sampleTypes.containsKey);
    final String sampleFileExt = fileExts[sampleTypes[sampleType]] ?? 'pic256.jpg';
    final String sampleUrl = '${booru.baseURL}/posts/$fileGroupId/$id/$id.$sampleFileExt';

    final int? fileType = availableFileTypes.lastWhereOrNull((type) => fileTypes.containsKey(type));
    final String fileFileExt = fileExts[fileTypes[fileType]] ?? (isVideo ? 'mov.mp4' : 'pic.jpg');
    final String fileUrl = '${booru.baseURL}/posts/$fileGroupId/$id/$id.$fileFileExt';

    final String dateString = current['created'].split('.')[0]; // split off microseconds // use posted or created?
    final BooruItem item = BooruItem(
      fileURL: fileUrl,
      sampleURL: sampleUrl,
      thumbnailURL: thumbnailUrl,
      fileHeight: double.tryParse(current['height']?.toString() ?? ''),
      fileWidth: double.tryParse(current['width']?.toString() ?? ''),
      tagsList: [],
      postURL: makePostURL(id),
      serverId: id,
      // use views as score, people don't rate stuff here often
      score: current['likes'].toString(),
      sources: List<String>.from(current['data']?['sources'] ?? []),
      postDate: dateString, // 2021-06-18T06:09:02.63366Z // microseconds?
      postDateFormat: 'iso',
    );

    return item;
  }

  @override
  String makePostURL(String id) {
    return '${booru.baseURL}/post/$id';
  }

  @override
  String validateTags(String tags) {
    return tags;
  }

  String cursor = '';

  @override
  Future<Response<dynamic>> fetchSearch(
    Uri uri,
    String input, {
    bool withCaptchaCheck = true,
    Map<String, dynamic>? queryParams,
  }) async {
    final String cookies = await getCookies() ?? '';
    final Map<String, String> headers = {
      ...getHeaders(),
      if (cookies.isNotEmpty) 'Cookie': cookies,
    };

    Logger.Inst().log(
      'fetching: $uri with headers: $headers',
      className,
      'Search',
      LogTypes.booruHandlerSearchURL,
    );

    // ignores custom limit if search is empty, otherwise it works
    final int skip = (pageNum * limit) < 0 ? 0 : (pageNum * limit);

    if (skip == 0) {
      cursor = '';
    }

    final List<String> includeTags = input
        .split(' ')
        .where((f) => !f.startsWith('-'))
        .map((tag) => tag.replaceAll(RegExp('_'), ' '))
        .where((f) => f.isNotEmpty)
        .toList();
    final List<String> excludeTags = input
        .split(' ')
        .where((f) => f.startsWith('-'))
        .map(
          (tag) => tag.replaceAll(RegExp('_'), ' ').replaceAll(RegExp('^-'), ''),
        )
        .where((f) => f.isNotEmpty)
        .toList();

    return DioNetwork.post(
      uri.toString(),
      headers: headers,
      queryParameters: queryParams,
      options: fetchSearchOptions(),
      data: {
        'CountTotal': skip == 0,
        'Skip': skip,
        if (cursor.isNotEmpty) 'cursor': cursor,
        'includeTags': includeTags,
        if (excludeTags.isNotEmpty) 'excludeTags': excludeTags,
        'sortBy': 0,
        'take': limit,
      },
      customInterceptor: withCaptchaCheck ? DioNetwork.captchaInterceptor : null,
    );
  }

  @override
  String makeURL(String tags) {
    return '${booru.baseURL}/api/v2/post/search/root';
  }

  @override
  String makeTagURL(String input) {
    return '${booru.baseURL}/api/v2/tag/search/${input.replaceAll(' ', '_')}';
  }

  @override
  List parseTagSuggestionsList(dynamic response) {
    final parsedResponse = response.data;
    if (parsedResponse is List) {
      return parsedResponse;
    } else {
      return [];
    }
  }

  @override
  Future<({BooruItem? item, bool failed, String? error})> loadItem({
    required BooruItem item,
    CancelToken? cancelToken,
    bool withCapcthaCheck = false,
  }) async {
    try {
      final cookies = await getCookies();

      final response = await DioNetwork.get(
        '${booru.baseURL}/api/v2/post/${item.serverId}',
        headers: {
          ...getHeaders(),
          if (cookies?.isNotEmpty == true) 'Cookie': cookies,
        },
        options: Options(
          sendTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ),
        cancelToken: cancelToken,
        customInterceptor: withCapcthaCheck ? DioNetwork.captchaInterceptor : null,
      );

      if (response.statusCode != 200) {
        return (item: null, failed: true, error: 'Invalid status code ${response.statusCode}');
      } else {
        final Map<String, dynamic> current = response.data;
        final List<dynamic> tags = current['tags'] ?? [];
        for (final rawTag in tags) {
          final tag = rawTag['value']!.replaceAll(' ', '_');
          if (item.tagsList.contains(tag)) continue;
          item.tagsList.add(tag);
          if (rawTag['type'] != null) {
            addTagsWithType(
              [tag],
              tagTypeMap[rawTag['type']?.toString()] ?? TagType.none,
            );
          }
        }
        item.sources = List<String>.from(current['data']?['sources'] ?? []);

        item.isUpdated = true;
        return (item: item, failed: false, error: null);
      }
    } catch (e, s) {
      Logger.Inst().log(
        e.toString(),
        className,
        'loadItem',
        LogTypes.exception,
        s: s,
      );
      return (item: null, failed: true, error: e.toString());
    }
  }

  @override
  Map<String, TagType> get tagTypeMap => {
    '1': TagType.none,
    '2': TagType.copyright,
    '4': TagType.character,
    '8': TagType.artist,
  };

  @override
  TagSuggestion? parseTagSuggestion(dynamic responseItem, int index) {
    return TagSuggestion(
      tag: responseItem['value']?.replaceAll(RegExp(' '), '_') ?? '',
      count: responseItem['count'] ?? 0,
      type: tagTypeMap[responseItem['type']?.toString()] ?? TagType.none,
    );
  }
}

const String a = '''
// file types =
{
  1: 'Raw',
  10: 'Pic',
  11: 'PicThumbnail',
  12: 'PicThumbnailEx',
  13: 'PicPreview',
  14: 'PicSmall',
  30: 'PicAvif',
  31: 'PicThumbnailAvif',
  32: 'PicThumbnailExAvif',
  33: 'PicPreviewAvif',
  34: 'PicSmallAvif',
  100: 'Mov',
  101: 'MovThumbnail',
  102: 'MovThumbnailEx',
  111: 'Mov360',
  112: 'Mov480',
  113: 'Mov720',
  114: 'Mov1080',
  200: 'MovHevc',
  201: 'MovThumbnailHevc',
  202: 'MovThumbnailExHevc',
  211: 'Mov360Hevc',
  212: 'Mov480Hevc',
  213: 'Mov720Hevc',
  214: 'Mov1080Hevc',
  300: 'MovAv1',
  301: 'MovThumbnailAv1',
  302: 'MovThumbnailExAv1',
  311: 'Mov360Av1',
  312: 'Mov480Av1',
  313: 'Mov720Av1',
  314: 'Mov1080Av1',
}

// file exts
{
  'Raw': 'raw',
  'Pic': 'pic.jpg',
  'PicThumbnail': 'pic256.jpg',
  'PicThumbnailEx': 'pic256ex.jpg',
  'PicPreview': 'picpreview.jpg',
  'PicSmall': 'picsmall.jpg',
  'PicAvif': 'picavif.avif',
  'PicThumbnailAvif': 'pic256avif.avif',
  'PicThumbnailExAvif': 'pic256exavif.avif',
  'PicPreviewAvif': 'picpreviewavif.avif',
  'PicSmallAvif': 'small.avif',
  'Mov': 'mov.mp4',
  'MovThumbnail': 'mov256.mp4',
  'MovThumbnailEx': 'mov256ex.mp4',
  'Mov360': '360.mp4',
  'Mov480': 'mov480.mp4',
  'Mov720': 'mov720.mp4',
  'Mov1080': '1080.mp4',
  'MovHevc': 'hevc.mp4',
  'MovThumbnailHevc': 'thumbnail.hevc.mp4',
  'MovThumbnailExHevc': 'thumbnailEx.hevc.mp4',
  'Mov360Hevc': '360.hevc.mp4',
  'Mov480Hevc': '480.hevc.mp4',
  'Mov720Hevc': '720.hevc.mp4',
  'Mov1080Hevc': '1080.hevc.mp4',
  'MovAv1': 'av1.mp4',
  'MovThumbnailAv1': 'thumbnail.av1.mp4',
  'MovThumbnailExAv1': 'thumbnailEx.av1.mp4',
  'Mov360Av1': '360.av1.mp4',
  'Mov480Av1': '480.av1.mp4',
  'Mov720Av1': '720.av1.mp4',
  'Mov1080Av1': '1080.av1.mp4',
}

/// file url format
/// https://rule34vault.com/posts/607/607199/607199.mp4
/// https://{booruUrl}/posts/{id with last 3 symbols removed}/{id}/{id}.{best available option from files object matching type in file types above}


''';
