import 'package:LoliSnatcher/src/data/booru.dart';
import 'package:LoliSnatcher/src/handlers/booru_handler.dart';
import 'package:LoliSnatcher/src/handlers/settings_handler.dart';
import 'package:LoliSnatcher/src/utils/logger.dart';

class FavouritesHandler extends BooruHandler{
  FavouritesHandler(Booru booru,int limit): super(booru,limit);

  @override
  Future Search(String tags, int? pageNumCustom) async {
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    int length = fetched.length;
    if (prevTags != tags) {
      fetched.value = [];
    }

    fetched.addAll(await settingsHandler.dbHandler.searchDB(tags, (pageNum * limit).toString(), limit.toString(), "DESC", "Favourites"));
    print("dbhandler fetched length is ${fetched.length}");
    prevTags = tags;

    if (fetched.isEmpty || fetched.length == length) {
      Logger.Inst().log("dbhandler dbLocked", "FavouritesHandler", "search", LogTypes.booruHandlerInfo);
      locked = true;
    }

    return fetched;
  }

  @override
  Future<List<String>> tagSearch(String input) async {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    List<String> tags = [];
    tags = await settingsHandler.dbHandler.getTags(input, limit);
    return tags;
  }

  @override
  Future<void> searchCount(String input) async {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    totalCount.value = await settingsHandler.dbHandler.searchDBCount(input);
    return;
  }
}