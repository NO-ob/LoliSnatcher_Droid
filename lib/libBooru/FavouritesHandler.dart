import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/utilities/Logger.dart';
import 'package:get/get.dart';
import 'Booru.dart';
import 'BooruHandler.dart';

class FavouritesHandler extends BooruHandler{
  FavouritesHandler(Booru booru,int limit): super(booru,limit);

  @override
  Future Search(String tags, int? pageNumCustom) async {
    final SettingsHandler settingsHandler = Get.find<SettingsHandler>();

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

  Future<List<String>> tagSearch(String input) async {
    final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
    List<String> tags = [];
    tags = await settingsHandler.dbHandler.getTags(input, limit);
    return tags;
  }

  Future<void> searchCount(String input) async {
    final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
    totalCount.value = await settingsHandler.dbHandler.searchDBCount(input);
    return;
  }
}