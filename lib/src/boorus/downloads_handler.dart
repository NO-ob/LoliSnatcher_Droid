import 'package:dio/dio.dart';

import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/logger.dart';

class DownloadsHandler extends BooruHandler {
  DownloadsHandler(super.booru, super.limit);

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
      isDownloads: true,
    );

    await afterParseResponse(newItems);
    prevTags = tags;

    if (fetched.isEmpty || fetched.length == length) {
      Logger.Inst().log('dbhandler dbLocked', 'DownloadsHandler', 'search', LogTypes.booruHandlerInfo);
      locked = true;
    }

    return fetched;
  }

  @override
  Future<List<String>> tagSearch(String input, {CancelToken? cancelToken}) async {
    final List<String> tags = await SettingsHandler.instance.dbHandler.getTags(input, limit);
    return tags;
  }

  @override
  Future<void> searchCount(String input) async {
    totalCount.value = await SettingsHandler.instance.dbHandler.searchDBCount(
      input,
      isDownloads: true,
    );
    return;
  }
}
