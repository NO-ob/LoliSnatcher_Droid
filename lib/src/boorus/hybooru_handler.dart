import 'package:dio/dio.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/tag.dart';
import 'package:lolisnatcher/src/data/tag_suggestion.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';
import 'package:lolisnatcher/src/utils/logger.dart';

/// Hybooru is a read-only booru in front of a Hydrus collection.
/// https://github.com/funmaker/Hybooru/blob/master/API.md
///
/// `GET /api/post` returns post summaries without tags. Tag, source and rating
/// data is loaded from `GET /api/post/:id`.
class HybooruHandler extends BooruHandler {
  HybooruHandler(super.booru, super.limit);

  @override
  bool get hasSizeData => true;

  @override
  bool get hasTagSuggestions => true;

  @override
  bool get hasLoadItemSupport => true;

  @override
  bool get shouldUpdateIteminTagView => true;

  String get _baseUrl {
    final String url = booru.baseURL ?? '';
    return url.endsWith('/') ? url.substring(0, url.length - 1) : url;
  }

  @override
  List parseListFromResponse(dynamic response) {
    final Map<String, dynamic> parsedResponse = response.data;
    final int? total = int.tryParse(parsedResponse['total']?.toString() ?? '');
    if (total != null) {
      totalCount.value = total;
    }
    return (parsedResponse['posts'] as List?) ?? [];
  }

  @override
  BooruItem? parseItemFromResponse(dynamic responseItem, int index) {
    return _itemFromPost(Map<String, dynamic>.from(responseItem as Map));
  }

  @override
  String makePostURL(String id) {
    return '$_baseUrl/posts/$id';
  }

  @override
  String makeURL(String tags) {
    // Pages are 0-indexed. pageSize is capped by the instance.
    // blurhash=true adds width, height and size to the summary.
    return '$_baseUrl/api/post?query=$tags&page=$pageNum&pageSize=$limit&blurhash=true';
  }

  @override
  String makeTagURL(String input) {
    // Hybooru only treats * and ? as wildcards. A plain fragment matches nothing
    // unless it is wrapped, same as Danbooru's *query* autocomplete.
    final bool hasWildcard = input.contains('*') || input.contains('?');
    final String query = hasWildcard ? input : '*$input*';
    return '$_baseUrl/api/tags?query=${Uri.encodeComponent(query)}&page=0&pageSize=20';
  }

  @override
  List parseTagSuggestionsList(dynamic response) {
    final dynamic tags = response.data['tags'];
    if (tags is! Map) {
      return [];
    }
    return tags.entries
        .map(
          (entry) => {
            'name': entry.key.toString(),
            'posts': entry.value,
          },
        )
        .toList();
  }

  @override
  TagSuggestion? parseTagSuggestion(dynamic responseItem, int index) {
    final String tag = responseItem['name']?.toString() ?? '';
    if (tag.isEmpty) {
      return null;
    }

    final TagType tagType = _hybooruTagType(tag);
    addTagsWithType([tag], tagType);
    final dynamic rawCount = responseItem['posts'];
    final int count = rawCount is int ? rawCount : int.tryParse(rawCount?.toString() ?? '') ?? 0;
    return TagSuggestion(
      tag: tag,
      type: tagType,
      count: count,
    );
  }

  @override
  Future<({BooruItem? item, bool failed, String? error})> loadItem({
    required BooruItem item,
    CancelToken? cancelToken,
    bool withCapcthaCheck = false,
  }) async {
    final String? id = item.serverId;
    if (id == null || id.isEmpty) {
      return (item: null, failed: true, error: 'Missing post id');
    }

    try {
      final Map<String, dynamic>? detail = await _fetchPost(id, cancelToken: cancelToken);
      final BooruItem? parsed = detail == null ? null : _itemFromPost(detail);
      if (parsed == null) {
        return (item: null, failed: true, error: 'Invalid post $id');
      }

      item
        ..fileURL = parsed.fileURL
        ..sampleURL = parsed.sampleURL
        ..thumbnailURL = parsed.thumbnailURL
        ..tagsList = parsed.tagsList
        ..fileSize = parsed.fileSize
        ..fileWidth = parsed.fileWidth
        ..fileHeight = parsed.fileHeight
        ..fileAspectRatio = parsed.fileAspectRatio
        ..rating = parsed.rating
        ..sources = parsed.sources
        ..md5String = parsed.md5String
        ..postDate = parsed.postDate
        ..postDateFormat = parsed.postDateFormat
        ..isUpdated = true;
      return (item: item, failed: false, error: null);
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

  Future<Map<String, dynamic>?> _fetchPost(String id, {CancelToken? cancelToken}) async {
    try {
      final response = await DioNetwork.get(
        '$_baseUrl/api/post/$id',
        headers: getHeaders(),
        cancelToken: cancelToken,
      );
      if (response.statusCode != 200 || response.data is! Map) {
        return null;
      }
      return Map<String, dynamic>.from(response.data as Map);
    } catch (e, s) {
      Logger.Inst().log(
        e.toString(),
        className,
        '_fetchPost',
        LogTypes.booruHandlerFetchFailed,
        s: s,
      );
      return null;
    }
  }

  BooruItem? _itemFromPost(Map<String, dynamic> current) {
    final String? sha256 = current['sha256']?.toString();
    final String? extension = current['extension']?.toString();
    if (sha256 == null || sha256.isEmpty || extension == null || extension.isEmpty) {
      return null;
    }

    final String? id = current['id']?.toString();
    if (id == null || id.isEmpty) {
      return null;
    }

    final String fileURL = '$_baseUrl/files/f$sha256$extension';
    // No medium sample exists. The preview uses the thumbnail, same as HydrusHandler,
    // so the grid does not download the original.
    final String thumbnailURL = '$_baseUrl/files/t$sha256.thumbnail';
    return BooruItem(
      fileURL: fileURL,
      sampleURL: thumbnailURL,
      thumbnailURL: thumbnailURL,
      tagsList: _tagsFrom(current['tags']),
      postURL: makePostURL(id),
      fileSize: int.tryParse(current['size']?.toString() ?? ''),
      fileWidth: double.tryParse(current['width']?.toString() ?? ''),
      fileHeight: double.tryParse(current['height']?.toString() ?? ''),
      serverId: id,
      rating: current['rating']?.toString(),
      sources: _sourcesFrom(current['sources']),
      md5String: current['md5']?.toString(),
      postDate: current['posted']?.toString(),
      postDateFormat: 'iso',
    );
  }

  List<Tag> _tagsFrom(dynamic raw) {
    if (raw is! Map) {
      return [];
    }

    final List<Tag> tags = [];
    for (final entry in raw.entries) {
      final String name = entry.key.toString();
      if (name.isEmpty) {
        continue;
      }
      final TagType tagType = _hybooruTagType(name);
      final dynamic rawCount = entry.value;
      final int count = rawCount is int ? rawCount : int.tryParse(rawCount?.toString() ?? '') ?? 0;
      tags.add(Tag(name, tagType: tagType, count: count));
      addTagsWithType([name], tagType);
    }
    return tags;
  }

  List<String>? _sourcesFrom(dynamic raw) {
    if (raw is! List) {
      return null;
    }
    final List<String> sources = raw.map((source) => source.toString()).where((source) => source.isNotEmpty).toList();
    return sources.isEmpty ? null : sources;
  }
}

TagType _hybooruTagType(String name) {
  final int splitAt = name.indexOf(':');
  if (splitAt <= 0) {
    return TagType.none;
  }

  return switch (name.substring(0, splitAt)) {
    'artist' || 'creator' => TagType.artist,
    'character' || 'person' => TagType.character,
    'copyright' || 'series' => TagType.copyright,
    'meta' || 'medium' || 'system' || 'fm' => TagType.meta,
    _ => TagType.none,
  };
}
