import 'dart:math';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/data/meta_tag.dart';
import 'package:lolisnatcher/src/data/tag_suggestion.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/logger.dart';

class NozomiHandler extends BooruHandler {
  NozomiHandler(super.booru, super.limit);

  // ----------------- URL constants
  static const String _mediaDomain = 'gold-usergeneratedcontent.net';
  static const String _jsonApiBase = 'https://j.$_mediaDomain';
  static const String _nozomiBase = 'https://n.nozomi.la';

  late String lastTagInput;

  // ----------------- Booru handler overrides

  @override
  List<MetaTag> availableMetaTags() {
    return [
      OrderMetaTag(values: [MetaTagValue(name: 'Popularity', value: 'popular')]),
    ];
  }

  @override
  String validateTags(String tags) {
    if (tags == ' ' || tags == '') {
      return '';
    } else {
      return super.validateTags(tags);
    }
  }

  @override
  bool get hasLoadItemSupport => true;
  @override
  bool get shouldUpdateIteminTagView => true;
  @override
  bool get hasTagSuggestions => true;

  // ----------------- Search

  @override
  Future<Response<dynamic>> fetchSearch(
    Uri uri,
    String input, {
    bool withCaptchaCheck = true,
    Map<String, dynamic>? queryParams,
  }) async {
    final List<String> terms = input == ''
        ? ['index']
        : input.split(RegExp(r'(\s+|%20)')).where((term) => !RegExp('order(:|%3A)popular').hasMatch(term)).toList();

    final List<String> positiveTerms = [], negativeTerms = [];
    final bool hasPopular = uri.toString().contains('-Popular') || input.contains(RegExp('order(:|%3A)popular'));

    for (final term in terms) {
      (term.startsWith('-') ? negativeTerms : positiveTerms).add(term.startsWith('-') ? term.substring(1) : term);
    }

    final Map<String, Set<int>> termCache = {};
    for (final term in [...positiveTerms, ...negativeTerms]) {
      if (!termCache.containsKey(term)) {
        final ids = await _getPostIdsForQuery(term, getHeaders, queryParams, hasPopular);
        termCache[term] = ids.toSet();
      }
    }

    Set<int> results = {};
    if (positiveTerms.isNotEmpty) {
      final List<Set<int>> sets = positiveTerms.map((t) => termCache[t]!).toList()
        ..sort((a, b) => a.length.compareTo(b.length));
      results = Set.of(sets.first);
      for (final s in sets.skip(1)) {
        results = results.intersection(s);
        if (results.isEmpty) break;
      }
    }

    for (final term in negativeTerms) {
      results = results.difference(termCache[term]!);
    }

    // ----------------- Pagination
    // pageNum is set by BooruHandler.search() before fetchSearch is called.

    final int page = max(0, pageNum - 1);
    final int pageOffset = page * limit;
    final List<int> pageIds = results.skip(pageOffset).take(limit).toList();
    locked = pageIds.length < limit;

    // Fetch JSONs
    final List<Map<String, dynamic>?> postDataList = await Future.wait(
      pageIds.map(_fetchPostDetail),
    );

    // Flatten multi-image posts and append index to ID
    final List<Map<String, dynamic>> allJsonPosts = [];
    for (final postData in postDataList.whereType<Map<String, dynamic>>()) {
      final List<dynamic> imageUrls = postData['imageurls'] ?? [];
      for (int i = 0; i < imageUrls.length; i++) {
        final Map<String, dynamic> newPost = Map<String, dynamic>.from(postData);
        newPost['postid'] = imageUrls.length > 1 ? '${postData['postid']}.$i' : postData['postid'];
        newPost['imageurls'] = [imageUrls[i]];
        newPost['height'] = imageUrls[i]['height'];
        newPost['width'] = imageUrls[i]['width'];
        newPost['is_video'] = imageUrls[i]['is_video'];
        newPost['type'] = imageUrls[i]['type'];
        newPost['dataid'] = imageUrls[i]['dataid'];
        allJsonPosts.add(newPost);
      }
    }

    return Response(
      data: allJsonPosts,
      statusCode: 200,
      requestOptions: RequestOptions(),
    );
  }

  Future<Map<String, dynamic>?> _fetchPostDetail(int postId) async {
    try {
      final String idStr = postId.toString();
      final idMatch = RegExp('^(.*(..)(.))').firstMatch(idStr);
      final String path = idStr.length < 3
          ? idStr
          : '${idMatch?.group(3) ?? ''}/${idMatch?.group(2) ?? ''}/${idMatch?.group(1) ?? ''}';

      final response = await DioNetwork.get(
        '$_jsonApiBase/post/$path.json',
        headers: getHeaders(),
      );
      if (response.data != null && (response.data as Map).isNotEmpty) {
        return Map<String, dynamic>.from(response.data as Map);
      }
    } catch (e, s) {
      Logger.Inst().log(e.toString(), className, '_fetchPostDetail', LogTypes.exception, s: s);
    }
    return null;
  }

  @override
  List parseListFromResponse(dynamic response) {
    return (response.data as List).whereType<Map<String, dynamic>>().toList();
  }

  @override
  Future<BooruItem?> parseItemFromResponse(dynamic responseItem, int index) async {
    final data = responseItem as Map<String, dynamic>;
    final dataidMatch = RegExp(r'^.*(..)(.)$').firstMatch(data['dataid'] as String);
    final String subdomain = data['is_video'] == '1'
        ? 'v'
        : data['type'] == 'gif'
        ? 'g'
        : 'w';
    final String extension = data['is_video'] == '1'
        ? data['type'] as String
        : data['type'] == 'gif'
        ? 'gif'
        : 'webp';
    final String dir = dataidMatch != null ? '${dataidMatch.group(2)}/${dataidMatch.group(1)}/' : '';
    final String dataid = data['dataid'] as String;
    final String sampleType = data['type'] as String;

    final List characterTags = (data['character']?.map((tagDict) => tagDict['tag']) ?? []).toList();
    final List copyrightTags = (data['copyright']?.map((tagDict) => tagDict['tag']) ?? []).toList();
    final List artistTags = (data['artist']?.map((tagDict) => tagDict['tag']) ?? []).toList();
    final List metaTags = (data['metadata']?.map((tagDict) => tagDict['tag']) ?? []).toList();
    final List generalTags = (data['general']?.map((tagDict) => tagDict['tag']) ?? []).toList();

    addTagsWithType([...characterTags], TagType.character);
    addTagsWithType([...copyrightTags], TagType.copyright);
    addTagsWithType([...artistTags], TagType.artist);
    addTagsWithType([...metaTags], TagType.meta);
    addTagsWithType([...generalTags], TagType.none);

    final postIdStr = data['postid']?.toString() ?? '';
    final int fileIndex = int.tryParse(postIdStr.contains('.') ? postIdStr.split('.').last : '0') ?? 0;
    final bool isExtraFile = postIdStr.contains('.') && fileIndex > 0;
    final String fileURL = 'https://$subdomain.$_mediaDomain/$dir$dataid.$extension';

    return BooruItem(
      fileURL: fileURL,
      sampleURL: isExtraFile ? fileURL : 'https://qtn.$_mediaDomain/$dir$dataid.$sampleType.webp',
      thumbnailURL: isExtraFile ? fileURL : 'https://qtn.$_mediaDomain/$dir$dataid.$sampleType.webp',
      tagsList: [
        ...characterTags,
        ...copyrightTags,
        ...artistTags,
        ...metaTags,
        ...generalTags,
      ],
      postURL: makePostURL(data['postid'].toString().split('.').first),
      fileExt: data['type'] as String?,
      fileWidth: (data['width'] as num?)?.toDouble(),
      fileHeight: (data['height'] as num?)?.toDouble(),
      serverId: postIdStr,
      md5String: data['dataid'] as String?,
      postDate: data['date'] as String?, // 2021-06-13 02:09:45-04
      postDateFormat: 'yyyy-MM-dd HH:mm:ssZ',
    );
  }

  // ----------------- URL / header helpers

  @override
  Map<String, String> getHeaders() {
    return {
      'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0) Gecko/20100101 Firefox/144.0',
      'Referer': booru.baseURL ?? '',
    };
  }

  @override
  String makePostURL(String id) {
    return '${booru.baseURL}/post/$id.html';
  }

  @override
  String makeURL(String tags) {
    final bool orderPopular = RegExp('order(:|%3A)popular', caseSensitive: false).hasMatch(tags);
    return '${booru.baseURL}/search${orderPopular ? "-Popular" : ""}.html?q=${tags.replaceAll(" ", "+")}';
  }

  @override
  String makeTagURL(String input) {
    lastTagInput = input;
    final String firstChar = input.isNotEmpty ? input[0] : '';
    return '$_jsonApiBase/search-$firstChar.json';
  }

  // ----------------- Tag suggestions

  @override
  List<TagSuggestion> parseTagSuggestionsList(dynamic response) {
    return response.data is List
        ? (response.data as List)
              .where((e) => (e as String).contains(lastTagInput))
              .map((e) => TagSuggestion(tag: e as String))
              .toList()
        : response.data is Map<String, dynamic>
        ? (response.data as Map<String, dynamic>).entries
              .where((e) => e.key.contains(lastTagInput))
              .map((e) => TagSuggestion(tag: e.key.toLowerCase(), count: e.value as int))
              .toList()
        : [];
  }

  @override
  TagSuggestion? parseTagSuggestion(dynamic responseItem, int index) {
    return responseItem as TagSuggestion?;
  }

  // ----------------- Private helpers

  Future<List<int>> _getPostIdsForQuery(
    String term,
    dynamic getHeaders,
    Map<String, dynamic>? queryParams,
    bool hasPopular,
  ) async {
    final response = await DioNetwork.get(
      '$_nozomiBase/nozomi${hasPopular ? "/popular" : ""}/$term${hasPopular ? "-Popular" : ""}.nozomi',
      headers: getHeaders(),
      queryParameters: queryParams,
      options: Options(responseType: ResponseType.bytes),
    );

    final ByteData byteData = ByteData.sublistView(Uint8List.fromList(response.data as List<int>));
    return [
      for (int pos = 0; pos < byteData.lengthInBytes; pos += 4) byteData.getUint32(pos, Endian.big),
    ];
  }
}
