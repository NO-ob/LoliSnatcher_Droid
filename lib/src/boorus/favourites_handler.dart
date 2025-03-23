import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import 'package:lolisnatcher/src/data/response_error.dart';
import 'package:lolisnatcher/src/data/tag_suggestion.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/logger.dart';

class FavouritesHandler extends BooruHandler {
  FavouritesHandler(super.booru, super.limit);

  @override
  bool get hasTagSuggestions => true;

  @override
  String validateTags(String tags) {
    return tags;
  }

  @override
  Future search(String tags, int? pageNumCustom, {bool withCaptchaCheck = true}) async {
    // set custom page number
    if (pageNumCustom != null) {
      pageNum = pageNumCustom;
    }

    // validate tags
    tags = validateTags(tags.trim());

    // if tags are different than previous tags, reset fetched
    if (prevTags != tags) {
      fetched.value = [];
      totalCount.value = 0;
    }

    // get amount of items before fetching
    final int length = fetched.length;

    final newItems = await SettingsHandler.instance.dbHandler.searchDB(
      tags,
      (pageNum * limit).toString(),
      limit.toString(),
      'DESC',
      'Favourites',
    );

    await afterParseResponse(newItems);

    prevTags = tags;

    if (fetched.isEmpty || fetched.length == length) {
      Logger.Inst().log('dbhandler dbLocked', 'FavouritesHandler', 'search', LogTypes.booruHandlerInfo);
      locked = true;
    }

    return fetched;
  }

  @override
  Future<Either<ResponseError, List<TagSuggestion>>> getTagSuggestions(
    String input, {
    CancelToken? cancelToken,
  }) async {
    try {
      final List<TagSuggestion> tags =
          (await SettingsHandler.instance.dbHandler.getTags(input, limit)).map((t) => TagSuggestion(tag: t)).where((t) => t.tag.trim().isNotEmpty).toList();
      return Right(tags);
    } catch (e, s) {
      return Left(
        ResponseError(
          message: 'getTagSuggestions error',
          error: e,
          stackTrace: s,
        ),
      );
    }
  }

  @override
  Future<void> searchCount(String input) async {
    totalCount.value = await SettingsHandler.instance.dbHandler.searchDBCount(input);
    return;
  }
}
