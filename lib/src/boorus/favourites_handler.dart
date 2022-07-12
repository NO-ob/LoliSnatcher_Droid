import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/logger.dart';

class FavouritesHandler extends BooruHandler {
  FavouritesHandler(Booru booru, int limit) : super(booru, limit);

  @override
  Future search(String tags, int? pageNumCustom) async {
    // set custom page number
    if (pageNumCustom != null) {
      pageNum = pageNumCustom;
    }

    // validate tags
    tags = validateTags(tags);

    // if tags are different than previous tags, reset fetched
    if (prevTags != tags) {
      fetched.value = [];
      totalCount.value = 0;
    }

    // get amount of items before fetching
    int length = fetched.length;

    fetched.addAll(await SettingsHandler.instance.dbHandler.searchDB(tags, (pageNum * limit).toString(), limit.toString(), "DESC", "Favourites"));
    prevTags = tags;

    if (fetched.isEmpty || fetched.length == length) {
      Logger.Inst().log("dbhandler dbLocked", "FavouritesHandler", "search", LogTypes.booruHandlerInfo);
      locked = true;
    }

    return fetched;
  }

  @override
  Future<List<String>> tagSearch(String input) async {
    List<String> tags = await SettingsHandler.instance.dbHandler.getTags(input, limit);
    return tags;
  }

  @override
  Future<void> searchCount(String input) async {
    totalCount.value = await SettingsHandler.instance.dbHandler.searchDBCount(input);
    return;
  }
}
