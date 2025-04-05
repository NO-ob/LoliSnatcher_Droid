import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/meta_tag.dart';
import 'package:lolisnatcher/src/data/response_error.dart';
import 'package:lolisnatcher/src/data/tag_suggestion.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/booru_handler_factory.dart';
import 'package:lolisnatcher/src/utils/logger.dart';

class MergebooruHandler extends BooruHandler {
  MergebooruHandler(super.booru, super.limit);

  List<Booru> booruList = [];
  List<BooruHandler> booruHandlers = [];
  List<int> booruHandlerPageNums = [];

  Map<int, ({Booru booru, List<BooruItem> items})> fetchedMap = {};

  @override
  bool get hasSizeData => booruHandlers.every((e) => e.hasSizeData);

  @override
  bool get hasTagSuggestions => booruHandlers.first.hasTagSuggestions;

  @override
  String? get metatagsCheatSheetLink => booruHandlers.first.metatagsCheatSheetLink;

  @override
  List<MetaTag> availableMetaTags() {
    final List<MetaTag> tags = [];
    for (int i = 0; i < booruHandlers.length; i++) {
      final booruTags = booruHandlers[i].availableMetaTags();
      for (final tag in booruTags) {
        if (!tags.contains(tag)) {
          tags.add(tag);
        }
      }
    }

    return tags;
  }

  @override
  Future search(String tags, int? pageNumCustom, {bool withCaptchaCheck = true}) async {
    if (pageNumCustom != null) {
      pageNum = pageNumCustom;
    }
    final Map<int, ({Booru booru, List<BooruItem> items})> tmpFetchedMap = {};
    int fetchedMax = 0;
    for (int i = 0; i < booruHandlers.length; i++) {
      final String currentTags =
          tags.replaceAll(RegExp('[-~:]?(?!' '${i + 1}' r')\d+#[A-Za-z0-9\_\-~:]*'), '').replaceAll('  ', ' ').replaceAll(RegExp(r'\d+#'), '').trim();
      Logger.Inst().log('TAGS FOR #$i are: $currentTags', 'MergeBooruHandler', 'Search', LogTypes.booruHandlerInfo);
      booruHandlers[i].pageNum = pageNum + booruHandlerPageNums[i];
      final List<BooruItem> tmpFetched = (await booruHandlers[i].search(currentTags, null)) ?? [];
      tmpFetchedMap.addEntries([
        MapEntry(
          i,
          (
            booru: booruHandlers[i].booru,
            items: tmpFetched,
          ),
        ),
      ]);
      fetchedMax += tmpFetched.length;
    }
    int innerFetchedOffset = 0;
    int innerFetchedIndex = -1;
    final List<BooruItem> newItems = [];
    do {
      innerFetchedIndex = (limit * pageNum) + innerFetchedOffset;
      for (int i = 0; i < tmpFetchedMap.entries.length; i++) {
        final items = tmpFetchedMap[i]!.items;

        final booru = tmpFetchedMap[i]!.booru;
        final bool isMd5LessBooru = [
          BooruType.Favourites,
          BooruType.Downloads,
          BooruType.BooruOnRails,
          BooruType.Philomena,
          BooruType.Rainbooru,
          BooruType.Szurubooru,
          BooruType.World,
        ].any((t) => t == booru.type);

        if (innerFetchedIndex < items.length) {
          if (booru.type == BooruType.GelbooruV1) {
            if (items[innerFetchedIndex].md5String != null) {
              items[innerFetchedIndex].md5String = makeSha1Hash(items[innerFetchedIndex].md5String!);
            }
          }

          if (isMd5LessBooru
              ? !itemInFetched(
                  fetched,
                  items[innerFetchedIndex],
                )
              : !hashInFetched(
                  fetched,
                  items[innerFetchedIndex].md5String,
                  items[innerFetchedIndex].fileURL,
                )) {
            newItems.add(items[innerFetchedIndex]);

            if (fetchedMap[i] == null) {
              fetchedMap.addEntries([
                MapEntry(
                  i,
                  (
                    booru: booruHandlers[i].booru,
                    items: [],
                  ),
                ),
              ]);
            }
            fetchedMap[i]!.items.add(items[innerFetchedIndex]);
          } else {
            Logger.Inst().log(
              'Skipped because hash match: ${items[innerFetchedIndex].fileURL}',
              'MergeBooruHandler',
              'Search',
              LogTypes.booruHandlerInfo,
            );
          }
        } else {
          Logger.Inst().log(
            'not adding item from ${booruHandlers[i].booru.name}, length: ${items.length}, index: $innerFetchedIndex',
            'MergeBooruHandler',
            'Search',
            LogTypes.booruHandlerInfo,
          );
          Logger.Inst().log(
            'pageNum: $pageNum',
            'MergeBooruHandler',
            'Search',
            LogTypes.booruHandlerInfo,
          );
          Logger.Inst().log(
            'fetched: ${fetched.length}, fetchedMax: $fetchedMax',
            'MergeBooruHandler',
            'Search',
            LogTypes.booruHandlerInfo,
          );
        }
      }
      innerFetchedOffset++;
    } while ((fetched.length < fetchedMax) && innerFetchedIndex < fetchedMax);

    await afterParseResponse(newItems);

    locked = shouldLock();
    return fetched;
  }

  bool shouldLock() {
    int lockCount = 0;
    for (int i = 0; i < booruHandlers.length; i++) {
      if (booruHandlers[i].locked) {
        lockCount++;
      }
    }
    if (lockCount == booruHandlers.length) {
      return true;
    } else {
      return false;
    }
  }

  // GelbooruV1 uses a sha1 of an md5
  String makeSha1Hash(String hash) {
    final List<int> bytes = utf8.encode(hash);
    final Digest digest = sha1.convert(bytes);
    Logger.Inst().log('converting hash to sha1', 'MergeBooruHandler', 'makeSha1Hash', LogTypes.booruHandlerInfo);
    return digest.toString();
  }

  bool hashInFetched(List<BooruItem> fetched, String? hash, String fileURL) {
    for (int i = 0; i < fetched.length; i++) {
      if (fetched[i].md5String == hash) {
        Logger.Inst().log(
          'hash match URL: $fileURL fetchedURL: ${fetched[i].fileURL}',
          'MergeBooruHandler',
          'hashInFetched',
          LogTypes.booruHandlerInfo,
        );
        return true;
      }
    }
    return false;
  }

  bool itemInFetched(List<BooruItem> fetched, BooruItem item) {
    for (int i = 0; i < fetched.length; i++) {
      if (fetched[i].fileURL == item.fileURL || fetched[i].postURL == item.postURL) {
        return true;
      }
    }
    return false;
  }

  void setupMerge(List<Booru> boorus) {
    booruList.addAll(boorus);
    for (final element in booruList) {
      final List factoryResults = BooruHandlerFactory().getBooruHandler([element], null);
      booruHandlers.add(factoryResults[0]);
      booruHandlerPageNums.add(factoryResults[1]);
      Logger.Inst().log('SETUP MERGE ADDING: ${element.name}', 'MergeBooruHandler', 'setupMerge', LogTypes.booruHandlerInfo);
    }
  }

  @override
  Future<Either<ResponseError, List<TagSuggestion>>> getTagSuggestions(
    String input, {
    CancelToken? cancelToken,
  }) async {
    return booruHandlers.first.getTagSuggestions(input, cancelToken: cancelToken);
  }

  @override
  Future<void> searchCount(String input) async {
    int result = 0;
    for (int i = 0; i < booruHandlers.length; i++) {
      await booruHandlers[i].searchCount(input);
      result += booruHandlers[i].totalCount.value;
    }
    totalCount.value = result;
    return;
  }
}
