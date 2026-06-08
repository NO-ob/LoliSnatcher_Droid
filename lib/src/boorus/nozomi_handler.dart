import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';

import 'package:dio/dio.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/data/meta_tag.dart';
import 'package:lolisnatcher/src/data/tag_suggestion.dart';
import 'package:lolisnatcher/src/data/tag.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/services/image_writer_isolate.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/utils/tools.dart';

class NozomiHandler extends BooruHandler {
  NozomiHandler(super.booru, super.limit);

  // ----------------- URL constants
  static const String _mediaDomain = 'gold-usergeneratedcontent.net';
  static const String _jsonApiBase = 'https://j.$_mediaDomain';
  static const String _nozomiBase = 'https://n.nozomi.la';
  static const String _cachePath = 'WebView/Default/HTTP Cache/Cache_Data/NozomiTags';

  // ----------------- Static regex patterns
  static final RegExp _whitespacePattern = RegExp(r'(\s+|%20)');
  static final RegExp _orderPattern = RegExp(r'order(:|%3A)(\w+)', caseSensitive: false);
  static final RegExp _alphaPattern = RegExp('[a-z]');

  late String lastTagInput;

  // ----------------- Caches
  String? _tagSuggestionCachedChar;
  Response<dynamic>? _tagSuggestionCachedResponse;
  final Map<bool, int> _indexSizeCache = {};
  int _negativeSearchOffset = 0;
  List<int>? _negativeSearchRemainingIds;
  final Set<int> _usedRandomIds = {};
  int? _randomMinId, _randomMaxId;
  ImageWriterIsolate? _imageWriter;

  Future<ImageWriterIsolate> _getImageWriter() async {
    if (_imageWriter == null) {
      final cacheDir = await ServiceHandler.getCacheDir();
      _imageWriter = ImageWriterIsolate(cacheDir);
    }
    return _imageWriter!;
  }

  // ----------------- Booru handler overrides

  @override
  List<MetaTag> availableMetaTags() {
    return [
      OrderMetaTag(
        values: [
          MetaTagValue(name: 'Reversed', value: 'reversed'),
          MetaTagValue(name: 'Popularity', value: 'popular'),
          MetaTagValue(name: 'Unpopular', value: 'unpopular'),
          MetaTagValue(name: 'Random', value: 'random'),
        ],
      ),
    ];
  }

  @override
  String validateTags(String tags) => (tags.trim().isEmpty) ? '' : super.validateTags(tags);

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
    if (pageNum <= 1) {
      _indexSizeCache.clear();
      _negativeSearchOffset = 0;
      _negativeSearchRemainingIds = null;
      _usedRandomIds.clear();
      _randomMinId = _randomMaxId = null;
    }

    final List<String> terms = input == ''
        ? []
        : input.split(_whitespacePattern).where((term) => !_orderPattern.hasMatch(term)).toList();

    final List<String> positiveTerms = [], negativeTerms = [];
    final orderMatches = _orderPattern.allMatches(input);
    final String? firstOrderType = orderMatches.map((m) => m.group(2)?.toLowerCase()).whereType<String>().firstOrNull;
    final bool hasPopular = uri.toString().contains('-Popular') || firstOrderType == 'popular';
    final bool hasUnpopular = firstOrderType == 'unpopular';
    final bool hasRandom = firstOrderType == 'random';
    final bool hasReversed = firstOrderType == 'reversed';

    for (final term in terms) {
      (term.startsWith('-') ? negativeTerms : positiveTerms).add(term.startsWith('-') ? term.substring(1) : term);
    }

    final int page = max(0, pageNum - 1);
    List<int> pageIds;

    if (positiveTerms.isEmpty && negativeTerms.isEmpty) {
      pageIds = hasRandom
          ? await _getRandomIdsFromRange(queryParams, page, hasPopular)
          : await _getMainIndexPage(queryParams, page, hasReversed, hasUnpopular, hasPopular || hasUnpopular);
    } else if (positiveTerms.isEmpty) {
      pageIds = await _getNegativeOnlySearchPage(
        negativeTerms,
        queryParams,
        page,
        hasRandom,
        hasReversed,
        hasUnpopular,
        hasPopular,
      );
    } else {
      pageIds = await _processTagSearch(
        positiveTerms,
        negativeTerms,
        queryParams,
        page,
        hasPopular,
        hasRandom,
        hasUnpopular,
        hasReversed,
      );
    }

    locked = pageIds.length < limit;

    final List<Map<String, dynamic>?> postDataList = await Future.wait(pageIds.map(_fetchPostDetail));

    int totalPosts = 0;
    for (final postData in postDataList.whereType<Map<String, dynamic>>()) {
      totalPosts += (postData['imageurls'] as List?)?.length ?? 0;
    }

    final List<Map<String, dynamic>> allJsonPosts = List.generate(
      totalPosts,
      (_) => <String, dynamic>{},
      growable: false,
    );
    int writeIndex = 0;

    for (final postData in postDataList.whereType<Map<String, dynamic>>()) {
      final List<dynamic> imageUrls = postData['imageurls'] ?? [];
      for (int i = 0; i < imageUrls.length; i++) {
        final Map<String, dynamic> newPost = allJsonPosts[writeIndex++];
        newPost.addAll(postData);
        newPost['postid'] = imageUrls.length > 1 ? '${postData['postid']}.$i' : postData['postid'];
        newPost['imageurls'] = [imageUrls[i]];
        newPost['height'] = imageUrls[i]['height'];
        newPost['width'] = imageUrls[i]['width'];
        newPost['is_video'] = imageUrls[i]['is_video'];
        newPost['type'] = imageUrls[i]['type'];
        newPost['dataid'] = imageUrls[i]['dataid'];
      }
    }

    totalCount.value += totalPosts - pageIds.length;

    return Response(
      data: allJsonPosts,
      statusCode: 200,
      requestOptions: RequestOptions(),
    );
  }

  // ----------------- Tag search processing

  Future<List<int>> _processTagSearch(
    List<String> positiveTerms,
    List<String> negativeTerms,
    Map<String, dynamic>? queryParams,
    int page,
    bool hasPopular,
    bool hasRandom,
    bool hasUnpopular,
    bool hasReversed,
  ) async {
    final Map<String, Set<int>> termCache = {};

    for (final term in [...positiveTerms, ...negativeTerms]) {
      if (!termCache.containsKey(term)) {
        final ids = await _getPostIdsForQuery(term, getHeaders, queryParams, hasPopular || hasUnpopular);
        if (positiveTerms.contains(term) && ids.isEmpty) {
          totalCount.value = 0;
          return [];
        }
        termCache[term] = ids.toSet();
      }
    }

    final List<Set<int>> sets = positiveTerms.map((t) => termCache[t]!).toList()
      ..sort((a, b) => a.length.compareTo(b.length));
    Set<int> results = Set.of(sets.first);
    for (final s in sets.skip(1)) {
      results = results.intersection(s);
      if (results.isEmpty) break;
    }

    for (final term in negativeTerms) {
      results = results.difference(termCache[term]!);
    }

    final List<int> resultList = _applyOrdering(results.toList(), hasRandom, hasUnpopular, hasReversed, hasPopular);
    totalCount.value = resultList.length;
    return resultList.skip(page * limit).take(limit).toList();
  }

  List<int> _applyOrdering(List<int> ids, bool hasRandom, bool hasUnpopular, bool hasReversed, bool hasPopular) {
    if (hasRandom) {
      ids.shuffle();
    } else if (hasUnpopular) {
      ids = ids.reversed.toList();
    } else if (hasReversed) {
      ids.sort();
    } else if (!hasPopular) {
      ids.sort((a, b) => b.compareTo(a));
    }
    return ids;
  }

  // ----------------- Main index page fetch

  Future<List<int>> _getMainIndexPage(
    Map<String, dynamic>? queryParams,
    int page,
    bool reverseOrder,
    bool unpopularOrder,
    bool popularOrder,
  ) async {
    final String url = (popularOrder || unpopularOrder) ? '$_nozomiBase/index-Popular.nozomi' : '$_nozomiBase/index.nozomi';

    if (_indexSizeCache[popularOrder] == null) {
      try {
        final head = await DioNetwork.head(
          url,
          headers: Map<String, String>.from(getHeaders()),
          queryParameters: queryParams,
        );
        final int? size = int.tryParse(head.headers.value('content-length') ?? '');
        if (size != null) {
          _indexSizeCache[popularOrder] = size;
          totalCount.value = size ~/ 4;
        }
      } catch (e, s) {
        Logger.Inst().log(e.toString(), className, '_getMainIndexPage probe', LogTypes.exception, s: s);
      }
    }

    final bool fetchFromEnd = (reverseOrder || unpopularOrder) && _indexSizeCache[popularOrder] != null;
    int start, end;
    if (fetchFromEnd) {
      // Fetch from end: page 0 gets last limit*4 bytes, page 1 gets previous limit*4 bytes, etc.
      final int fileSize = _indexSizeCache[popularOrder]!;
      
      // Calculate byte range from the end
      end = fileSize - (page * limit * 4) - 1;
      start = max(0, fileSize - ((page + 1) * limit * 4));
    } else {
      // Fetch from beginning: normal pagination
      start = page * limit * 4;
      end = start + limit * 4 - 1;
      if (_indexSizeCache[popularOrder] != null) {
        end = min(end, _indexSizeCache[popularOrder]! - 1);
      }
    }

    final bytes = await _fetchRange(url, start, end, queryParams);
    return fetchFromEnd ? _parseNozomiBytes(bytes).reversed.toList() : _parseNozomiBytes(bytes);
  }

  // ----------------- Negative-only search

  Future<List<int>> _getNegativeOnlySearchPage(
    List<String> negativeTerms,
    Map<String, dynamic>? queryParams,
    int page,
    bool hasRandom,
    bool hasReversed,
    bool hasUnpopular,
    bool hasPopular,
  ) async {
    final Set<int> excludeIds = {};
    for (final term in negativeTerms) {
      final ids = await _getPostIdsForQuery(term, getHeaders, queryParams, hasPopular || hasUnpopular);
      excludeIds.addAll(ids);
    }

    if (page == 0 || _negativeSearchRemainingIds == null) {
      _negativeSearchOffset = 0;
      _negativeSearchRemainingIds = [];
    }

    final List<int> pageIds = [];
    const int chunkSize = 1000;

    while (pageIds.length < limit) {
      if (_negativeSearchRemainingIds!.isNotEmpty) {
        final take = min(limit - pageIds.length, _negativeSearchRemainingIds!.length);
        pageIds.addAll(_negativeSearchRemainingIds!.take(take));
        _negativeSearchRemainingIds = _negativeSearchRemainingIds!.skip(take).toList();
        if (pageIds.length >= limit) break;
      }

      final chunkIds = await _getMainIndexChunk(_negativeSearchOffset, chunkSize, queryParams, hasPopular || hasUnpopular);
      if (chunkIds.isEmpty) {
        locked = true;
        break;
      }

      _negativeSearchOffset += chunkIds.length;
      final filtered = chunkIds.where((id) => !excludeIds.contains(id)).toList();
      _negativeSearchRemainingIds!.addAll(_applyOrdering(filtered, hasRandom, hasUnpopular, hasReversed, hasPopular || hasUnpopular));
    }

    if (page == 0 && _indexSizeCache[hasPopular] != null) {
      final totalIds = _indexSizeCache[hasPopular]! ~/ 4;
      totalCount.value = (totalIds * (1 - excludeIds.length / totalIds)).round();
    }

    return pageIds;
  }

  // ----------------- Main index chunk fetch with partial caching

  Future<List<int>> _getMainIndexChunk(
    int offset,
    int count,
    Map<String, dynamic>? queryParams,
    bool usePopular,
  ) async {
    final String url = usePopular ? '$_nozomiBase/index-Popular.nozomi' : '$_nozomiBase/index.nozomi';
    final String fileName = '${md5.convert(utf8.encode(usePopular ? 'indexp' : 'index'))}.nozomi.chunk';

    try {
      final imageWriter = await _getImageWriter();

      // Check partial cache
      List<int>? partialBytes;
      int partialSize = 0;
      final stream = imageWriter.readBytesStreamFromCache(
        fileName,
        _cachePath,
        fileNameExtras: '',
        clearName: false,
      );
      partialBytes = await stream.expand((x) => x).toList();
      partialSize = partialBytes.length;

      if (partialSize >= 128) {
        final checksumSize = min(64, partialSize);
        final segmentType = await _detectSegmentType(
          url,
          imageWriter,
          fileName,
          partialSize,
          checksumSize,
          queryParams,
        );

        if (segmentType != null) {
          final result = await _tryServeCachedOrExtend(
            segmentType,
            partialBytes,
            partialSize,
            offset,
            count,
            url,
            fileName,
            imageWriter,
            queryParams,
          );
          if (result != null) return result;
        }
      }

      // Fetch fresh chunk
      final bytes = await _fetchRange(url, offset * 4, (offset + count) * 4 - 1, queryParams);
      try {
        await imageWriter.writeCacheFromStream(
          fileName,
          Stream.value(bytes),
          _cachePath,
          fileNameExtras: '',
          clearName: false,
        );
      } catch (e, s) {
        Logger.Inst().log(e.toString(), className, '_getMainIndexChunk cache', LogTypes.exception, s: s);
      }

      return _parseNozomiBytes(bytes);
    } catch (e, s) {
      Logger.Inst().log(e.toString(), className, '_getMainIndexChunk', LogTypes.exception, s: s);
      return [];
    }
  }

  Future<({bool isStart, int? totalSize})?> _detectSegmentType(
    String url,
    ImageWriterIsolate imageWriter,
    String fileName,
    int partialSize,
    int checksumSize,
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      final headStream = imageWriter.readBytesStreamFromCache(
        fileName,
        _cachePath,
        fileNameExtras: '',
        clearName: false,
        start: 0,
        end: checksumSize - 1,
      );
      final partialHead = await headStream.expand((x) => x).toList();

      final tailStream = imageWriter.readBytesStreamFromCache(
        fileName,
        _cachePath,
        fileNameExtras: '',
        clearName: false,
        start: partialSize - checksumSize,
        end: partialSize - 1,
      );
      final partialTail = await tailStream.expand((x) => x).toList();

      // Fetch remote head and total size
      final results = await Future.wait([
        _fetchRange(url, 0, checksumSize - 1, queryParams),
        DioNetwork.head(url, headers: Map<String, String>.from(getHeaders()), queryParameters: queryParams),
      ]);

      final remoteHead = results[0] as List<int>;
      final head = results[1] as Response;

      // Check if it's a start segment
      if (_listEquals(partialHead, remoteHead)) {
        return (isStart: true, totalSize: null);
      }

      // Get total size and check tail
      final int? totalSize = int.tryParse(head.headers.value('content-length') ?? '');

      if (totalSize != null) {
        final remoteTail = await _fetchRange(url, totalSize - checksumSize, totalSize - 1, queryParams);
        if (_listEquals(partialTail, remoteTail)) {
          return (isStart: false, totalSize: totalSize);
        }
      }
    } catch (e, s) {
      Logger.Inst().log(e.toString(), className, '_detectSegmentType', LogTypes.exception, s: s);
    }
    return null;
  }

  Future<List<int>> _fetchRange(String url, int start, int end, Map<String, dynamic>? queryParams) async {
    final response = await DioNetwork.get(
      url,
      headers: {...Map<String, String>.from(getHeaders()), 'Range': 'bytes=$start-$end'},
      queryParameters: queryParams,
      options: Options(responseType: ResponseType.bytes),
    );
    return response.data as List<int>;
  }

  Future<List<int>?> _tryServeCachedOrExtend(
    ({bool isStart, int? totalSize}) segmentType,
    List<int> partialBytes,
    int partialSize,
    int offset,
    int count,
    String url,
    String fileName,
    ImageWriterIsolate imageWriter,
    Map<String, dynamic>? queryParams,
  ) async {
    final cachedIdCount = partialSize ~/ 4;

    if (segmentType.isStart && offset < cachedIdCount) {
      // Can serve from or extend start segment
      if (offset + count <= cachedIdCount) {
        return _parseNozomiBytes(Uint8List.fromList(partialBytes)).skip(offset).take(count).toList();
      }
      // Extend start segment
      final newBytes = await _fetchRange(url, partialSize, (offset + count) * 4 - 1, queryParams);
      final combined = [...partialBytes, ...newBytes];
      await imageWriter.writeCacheFromStream(
        fileName,
        Stream.value(combined),
        _cachePath,
        fileNameExtras: '',
        clearName: false,
      );
      return _parseNozomiBytes(Uint8List.fromList(combined)).skip(offset).take(count).toList();
    } else if (!segmentType.isStart && segmentType.totalSize != null) {
      final remoteIdCount = segmentType.totalSize! ~/ 4;
      final cachedStartOffset = remoteIdCount - cachedIdCount;

      if (offset >= cachedStartOffset && offset + count <= remoteIdCount) {
        // Can serve from end segment
        return _parseNozomiBytes(
          Uint8List.fromList(partialBytes),
        ).skip(offset - cachedStartOffset).take(count).toList();
      } else if (offset < cachedStartOffset) {
        // Prepend to end segment
        final newBytes = await _fetchRange(url, offset * 4, (cachedStartOffset * 4) - 1, queryParams);
        final combined = [...newBytes, ...partialBytes];
        await imageWriter.writeCacheFromStream(
          fileName,
          Stream.value(combined),
          _cachePath,
          fileNameExtras: '',
          clearName: false,
        );
        return _parseNozomiBytes(Uint8List.fromList(newBytes)).skip(offset - (offset * 4 ~/ 4)).take(count).toList();
      }
    }
    return null;
  }

  // ----------------- Random ID generation

  Future<List<int>> _getRandomIdsFromRange(Map<String, dynamic>? queryParams, int page, bool usePopular) async {
    // Initialize min/max IDs on first call
    if (_randomMinId == null || _randomMaxId == null) {
      _randomMinId = 1; // Always use 1 as minimum
      
      // Get index size from HEAD request if not cached
      if (_indexSizeCache[usePopular] == null) {
        final String url = usePopular ? '$_nozomiBase/index-Popular.nozomi' : '$_nozomiBase/index.nozomi';
        try {
          final head = await DioNetwork.head(
            url,
            headers: Map<String, String>.from(getHeaders()),
            queryParameters: queryParams,
          );
          final int? size = int.tryParse(head.headers.value('content-length') ?? '');
          if (size != null) {
            _indexSizeCache[usePopular] = size;
          }
        } catch (e, s) {
          Logger.Inst().log(e.toString(), className, '_getRandomIdsFromRange HEAD', LogTypes.exception, s: s);
        }
      }
      
      // Estimate max ID from index size
      if (_indexSizeCache[usePopular] != null) {
        final totalIds = _indexSizeCache[usePopular]! ~/ 4;
        _randomMaxId = totalIds;
        
        // Set total count on first page
        if (page == 0) {
          totalCount.value = totalIds;
        }
      } else {
        // Fallback: fetch a chunk to determine range
        final ids = await _getMainIndexChunk(0, 1000, queryParams, usePopular);
        if (ids.isEmpty) return [];
        _randomMaxId = ids.reduce(max);
      }
    }
 
    final List<int> pageIds = [];
    final random = Random();
    
    // Keep retrying until we have enough valid posts
    while (pageIds.length < limit) {
      final int needed = limit - pageIds.length;
      final int batchSize = needed * 2; // Request 2x to account for failures
      
      // Generate batch of random IDs
      final List<int> candidateIds = [];
      int attempts = 0;
      while (candidateIds.length < batchSize && attempts < batchSize * 10) {
        attempts++;
        final randomId = _randomMinId! + random.nextInt(_randomMaxId! - _randomMinId! + 1);
        if (_usedRandomIds.contains(randomId) || candidateIds.contains(randomId)) continue;
        candidateIds.add(randomId);
      }
      
      if (candidateIds.isEmpty) {
        locked = true;
        break;
      }
      
      // Fetch all posts
      final futures = candidateIds.map(_fetchPostDetail).toList();
      final results = await Future.wait(futures);
      
      // Collect successful results
      int failedCount = 0;
      for (int i = 0; i < candidateIds.length && pageIds.length < limit; i++) {
        final id = candidateIds[i];
        final postData = results[i];
        
        if (postData != null) {
          pageIds.add(id);
          _usedRandomIds.add(id);
        } else {
          failedCount++;
          _usedRandomIds.add(id); // Don't retry same failed ID
        }
      }
      
      // If no successful posts found in this batch, we're done
      if (failedCount == candidateIds.length) {
        locked = true;
        break;
      }
    }
 
    locked = pageIds.length < limit;
    return pageIds;
  }

  // ----------------- Cache helpers

  Future<List<int>> _getPostIdsForQuery(
    String term,
    dynamic getHeaders,
    Map<String, dynamic>? queryParams,
    bool usePopular,
  ) async {
    final String fileName = '${md5.convert(utf8.encode(usePopular ? '${term}p' : term))}.nozomi';
    final String url = term == ''
        ? (usePopular ? '$_nozomiBase/index-Popular.nozomi' : '$_nozomiBase/index.nozomi')
        : (usePopular ? '$_nozomiBase/nozomi/popular/$term-Popular.nozomi' : '$_nozomiBase/nozomi/$term.nozomi');

    // Check cache if it's the first page
    final cachedBytes = await _readAndValidateCache(fileName, url, queryParams, shouldValidate: pageNum <= 1);
    if (cachedBytes != null) return _parseNozomiBytes(Uint8List.fromList(cachedBytes));

    // Fetch from network
    try {
      final response = await DioNetwork.get(
        url,
        headers: Map<String, String>.from(getHeaders()),
        queryParameters: queryParams,
        options: Options(responseType: ResponseType.bytes),
      );

      final bytes = response.data as List<int>;
      if (bytes.isNotEmpty) {
        final imageWriter = await _getImageWriter();
        try {
          await imageWriter.writeCacheFromStream(
            fileName,
            Stream.value(bytes),
            _cachePath,
            fileNameExtras: '',
            clearName: false,
          );
        } catch (e, s) {
          Logger.Inst().log(e.toString(), className, '_getPostIdsForQuery cache', LogTypes.exception, s: s);
        }
        return _parseNozomiBytes(Uint8List.fromList(bytes));
      }
    } catch (e, s) {
      Logger.Inst().log(e.toString(), className, '_getPostIdsForQuery', LogTypes.exception, s: s);
    }
    return [];
  }

  Future<List<int>?> _readAndValidateCache(
    String fileName,
    String url,
    Map<String, dynamic>? queryParams, {
    bool shouldValidate = true,
  }) async {
    final imageWriter = await _getImageWriter();

    // Check if cache exists and get file size
    final int? cachedSize = await imageWriter.getCacheFileSize(
      fileName,
      _cachePath,
      fileNameExtras: '',
      clearName: false,
    );
    if (cachedSize == null) return null; // File doesn't exist

    // Compare size with remote if needed
    if (shouldValidate) {
      try {
        final head = await DioNetwork.head(
          url,
          headers: Map<String, String>.from(getHeaders()),
          queryParameters: queryParams,
        );
        final contentLength = head.headers.value('content-length');
        final int? remoteSize = int.tryParse(contentLength ?? '');

        // If sizes don't match, cache is stale
        if (remoteSize != null && remoteSize != cachedSize) {
          return null;
        }
        // If HEAD failed or no content-length, fall through to read cache
      } catch (e) {
        // If HEAD fails, use cache anyway (offline mode)
      }
    }

    // Size matches (or validation skipped), read the actual content
    final stream = imageWriter.readBytesStreamFromCache(
      fileName,
      _cachePath,
      fileNameExtras: '',
      clearName: false,
    );
    return stream.expand((x) => x).toList();
  }

  @override
  Future<Response<dynamic>> fetchTagSuggestions(Uri uri, String input, {CancelToken? cancelToken}) async {
    if (input.trim().isEmpty) {
      return Response(
        data: [],
        statusCode: 200,
        requestOptions: RequestOptions(path: uri.toString()),
      );
    }

    // For negative tags, use second character for lookup
    final String lookupInput = (input.startsWith('-') && input.length > 1) ? input.substring(1) : input;
    final String char = _firstChar(lookupInput);

    if (char == _tagSuggestionCachedChar && _tagSuggestionCachedResponse != null) {
      return _tagSuggestionCachedResponse!;
    }

    final String fileName = '${md5.convert(utf8.encode('tagsuggest-$char'))}.json';
    final String url = '$_jsonApiBase/search-$char.json';
    final imageWriter = await _getImageWriter();

    // Check cache with size validation
    final cachedData = await _readTagSuggestionCache(fileName, url);
    if (cachedData != null) {
      final response = Response(
        data: cachedData,
        statusCode: 200,
        requestOptions: RequestOptions(path: url),
      );
      _tagSuggestionCachedChar = char;
      _tagSuggestionCachedResponse = response;
      return response;
    }

    // Fetch from network using raw HttpClient to preserve gzip encoding
    try {
      final httpClient = HttpClient()..autoUncompress = false; // Keep gzipped data
      final request = await httpClient.getUrl(Uri.parse(url));

      final headers = getHeaders();
      headers.forEach((key, value) {
        request.headers.set(key, value);
      });
      request.headers.set('Accept-Encoding', 'gzip');

      final httpResponse = await request.close();

      if (httpResponse.statusCode != 200) {
        httpClient.close();
        throw Exception('Failed to fetch tag suggestions: ${httpResponse.statusCode}');
      }

      // Read raw gzipped bytes
      final gzippedBytes = await httpResponse.fold<List<int>>(
        [],
        (previous, element) => previous..addAll(element),
      );
      httpClient.close();


      // Decompress to get JSON data
      final decompressedBytes = gzip.decode(gzippedBytes);
      final jsonData = json.decode(utf8.decode(decompressedBytes));

      Logger.Inst().log(
        'search-$char.json response size: gzipped=${gzippedBytes.length} bytes, uncompressed=${decompressedBytes.length} bytes',
        'NozomiHandler',
        'fetchTagSuggestions',
        null,
        overrideLevel: LogLevel.debug,
      );
      
      // Cache the gzipped bytes
      try {
        await imageWriter.writeCacheFromStream(
          fileName,
          Stream.value(gzippedBytes),
          _cachePath,
          fileNameExtras: '',
          clearName: false,
        );
      } catch (e, s) {
        Logger.Inst().log(e.toString(), className, 'fetchTagSuggestions write cache', LogTypes.exception, s: s);
      }

      final response = Response(
        data: jsonData,
        statusCode: 200,
        requestOptions: RequestOptions(path: url),
      );
      _tagSuggestionCachedChar = char;
      _tagSuggestionCachedResponse = response;
      return response;
    } catch (e, s) {
      Logger.Inst().log(e.toString(), className, 'fetchTagSuggestions', LogTypes.exception, s: s);

      // Fall back to parent implementation
      final response = await super.fetchTagSuggestions(uri, lookupInput, cancelToken: cancelToken);
      _tagSuggestionCachedChar = char;
      _tagSuggestionCachedResponse = response;
      return response;
    }
  }

  // Read tag suggestion cache with gzip validation
  Future<dynamic> _readTagSuggestionCache(String fileName, String url) async {
    final imageWriter = await _getImageWriter();

    // Check cached gzipped file size
    final int? cachedSize = await imageWriter.getCacheFileSize(
      fileName,
      _cachePath,
      fileNameExtras: '',
      clearName: false,
    );

    if (cachedSize == null) return null;

    // Compare against remote gzipped size
    try {
      final head = await DioNetwork.head(
        url,
        headers: {...Map<String, String>.from(getHeaders()), 'Accept-Encoding': 'gzip'},
      );
      final contentLength = head.headers.value('content-length');
      final int? remoteSize = int.tryParse(contentLength ?? '');

      if (remoteSize != null && remoteSize != cachedSize) {
        return null; // Cache is stale
      }
    } catch (e) {
      // If HEAD fails, use cache anyway (offline mode)
    }

    // Read cached gzipped bytes and decompress
    try {
      final stream = imageWriter.readBytesStreamFromCache(
        fileName,
        _cachePath,
        fileNameExtras: '',
        clearName: false,
      );
      final gzippedBytes = await stream.expand((x) => x).toList();
      final decompressedBytes = gzip.decode(gzippedBytes);
      return json.decode(utf8.decode(decompressedBytes));
    } catch (e, s) {
      Logger.Inst().log(e.toString(), className, '_readTagSuggestionCache decompress', LogTypes.exception, s: s);
      return null;
    }
  }

  // ----------------- Post detail fetching

  Future<Map<String, dynamic>?> _fetchPostDetail(int postId) async {
    try {
      final String idStr = postId.toString();
      final idMatch = RegExp('^(.*(..)(.))').firstMatch(idStr);
      final String path = idStr.length < 3
          ? idStr
          : '${idMatch?.group(3) ?? ''}/${idMatch?.group(2) ?? ''}/${idMatch?.group(1) ?? ''}';

      final response = await DioNetwork.get('$_jsonApiBase/post/$path.json', headers: getHeaders());
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

    final List<String> characterTags = (data['character']?.map((tagDict) => tagDict['tag']) ?? [])
        .toList()
        .cast<String>();
    final List<String> copyrightTags = (data['copyright']?.map((tagDict) => tagDict['tag']) ?? [])
        .toList()
        .cast<String>();
    final List<String> artistTags = (data['artist']?.map((tagDict) => tagDict['tag']) ?? []).toList().cast<String>();
    final List<String> metaTags = (data['metadata']?.map((tagDict) => tagDict['tag']) ?? []).toList().cast<String>();
    final List<String> generalTags = (data['general']?.map((tagDict) => tagDict['tag']) ?? []).toList().cast<String>();

    addTagsWithType([...characterTags], TagType.character);
    addTagsWithType([...copyrightTags], TagType.copyright);
    addTagsWithType([...artistTags], TagType.artist);
    addTagsWithType([...metaTags], TagType.meta);
    addTagsWithType([...generalTags], TagType.none);

    final postIdStr = data['postid']?.toString() ?? '';
    final int fileIndex = int.tryParse(postIdStr.contains('.') ? postIdStr.split('.').last : '0') ?? 0;
    final bool isExtraFile = postIdStr.contains('.') && fileIndex > 0;
    final String fileURL = 'https://$subdomain.$_mediaDomain/$dir$dataid.$extension';

    final List<String> allArtistTags = (data['artist'] as List?)?.map((t) => t['tag'] as String).toList() ?? [];
    final String? pixivTag = allArtistTags.where((t) => t.startsWith('pixiv_id_')).firstOrNull;
    final List<String> sources = pixivTag != null
        ? ['https://www.pixiv.net/en/users/${pixivTag.replaceFirst('pixiv_id_', '')}']
        : [];

    return BooruItem(
      fileURL: fileURL,
      sampleURL: isExtraFile ? fileURL : 'https://qtn.$_mediaDomain/$dir$dataid.$sampleType.webp',
      thumbnailURL: isExtraFile ? fileURL : 'https://qtn.$_mediaDomain/$dir$dataid.$sampleType.webp',
      tagsList: [
        ...characterTags.map(Tag.new),
        ...copyrightTags.map(Tag.new),
        ...artistTags.map(Tag.new),
        ...metaTags.map(Tag.new),
        ...generalTags.map(Tag.new),
      ],
      postURL: makePostURL(data['postid'].toString().split('.').first),
      fileExt: data['type'] as String?,
      fileWidth: (data['width'] as num?)?.toDouble(),
      fileHeight: (data['height'] as num?)?.toDouble(),
      serverId: postIdStr,
      md5String: data['dataid'] as String?,
      sources: sources,
      postDate: _normalizeToIso(data['date'] as String?),
      postDateFormat: 'iso',
    );
  }

  // ----------------- URL / header helpers

  @override
  Map<String, String> getHeaders() => super.getHeaders()
    ..['User-Agent'] = Tools.appUserAgent
    ..['Referer'] = '${booru.baseURL}/';

  @override
  String makePostURL(String id) => '${booru.baseURL}/post/$id.html';

  @override
  String makeURL(String tags) {
    final orderMatches = _orderPattern.allMatches(tags);
    final String? firstOrderType = orderMatches.map((m) => m.group(2)?.toLowerCase()).whereType<String>().firstOrNull;
    final bool orderPopular = firstOrderType == 'popular';
    return '${booru.baseURL}/search${orderPopular ? "-Popular" : ""}.html?q=${tags.replaceAll(" ", "+")}';
  }

  @override
  String makeTagURL(String input) {
    lastTagInput = input;
    // For negative tags, use the second character for tag suggestion lookup
    final String lookupChar = (input.startsWith('-') && input.length > 1)
        ? input[1]
        : (input.isNotEmpty ? input[0] : '');
    return '$_jsonApiBase/search-${_firstChar(lookupChar)}.json';
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
  TagSuggestion? parseTagSuggestion(dynamic responseItem, int index) => responseItem as TagSuggestion?;

  // ----------------- Private helpers

  static String _firstChar(String input) {
    if (input.isEmpty) return '0';
    final String c = input[0].toLowerCase();
    return _alphaPattern.hasMatch(c) ? c : '0';
  }

  static List<int> _parseNozomiBytes(List<int> bytes) {
    final ByteData byteData = ByteData.sublistView(Uint8List.fromList(bytes));
    return [for (int pos = 0; pos < byteData.lengthInBytes; pos += 4) byteData.getUint32(pos, Endian.big)];
  }

  static String? _normalizeToIso(String? raw) {
    if (raw == null) return null;
    final String s = raw.replaceFirst(' ', 'T');
    return s.replaceFirstMapped(RegExp(r'([+-]\d{2})$'), (m) => '${m.group(1)}:00');
  }

  static bool _listEquals(List<int> a, List<int> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
