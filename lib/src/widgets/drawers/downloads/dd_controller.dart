import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/booru_handler_factory.dart';
import 'package:lolisnatcher/src/handlers/database_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/snatch_handler.dart';
import 'package:lolisnatcher/src/services/get_perms.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/kaomoji.dart';

class DownloadsDrawerController {
  DownloadsDrawerController() {
    scrollController = ScrollController();
  }

  final SnatchHandler snatchHandler = SnatchHandler.instance;
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;

  final RxBool updating = false.obs;
  late final ScrollController scrollController;

  // Handler cache to avoid duplicate BooruHandlerFactory calls
  final Map<int, BooruHandler> _handlerCache = {};

  BooruHandler getHandler(Booru booru) {
    return _handlerCache.putIfAbsent(
      booru.hashCode,
      () => BooruHandlerFactory().getBooruHandler([booru], null).booruHandler,
    );
  }

  void clearHandlerCache() => _handlerCache.clear();

  Future<void> onStartSnatching(BuildContext context, bool isLongTap) async {
    if (!await setPermissions()) {
      FlashElements.showSnackbar(
        context: context,
        title: Text(
          context.loc.settings.downloads.pleaseProvideStoragePermission,
          style: const TextStyle(fontSize: 20),
        ),
        leadingIcon: Icons.warning,
        sideColor: Colors.red,
        leadingIconColor: Colors.red,
      );
      return;
    }

    if (searchHandler.currentSelected.isNotEmpty) {
      snatchHandler.queue(
        [...searchHandler.currentSelected],
        searchHandler.currentBooru,
        settingsHandler.snatchCooldown,
        isLongTap,
      );
      if (settingsHandler.favouriteOnSnatch) {
        await searchHandler.currentTab.updateFavForMultipleItems(
          searchHandler.currentSelected,
          newValue: true,
          skipSnatching: true,
        );
      }
      await Future.delayed(const Duration(milliseconds: 100));
      searchHandler.currentTab.selected.clear();
    } else {
      FlashElements.showSnackbar(
        context: context,
        title: Text(
          context.loc.settings.downloads.noItemsSelected,
          style: const TextStyle(fontSize: 20),
        ),
        overrideLeadingIconWidget: const Kaomoji(
          category: KaomojiCategory.dissatisfaction,
          style: TextStyle(fontSize: 18),
        ),
      );
    }
  }

  Future<void> onRetryFailedItem(
    ({Booru booru, BooruItem item}) record,
    bool isExists,
    bool isLongTap,
  ) async {
    updating.value = true;

    final booruHandler = BooruHandlerFactory().getBooruHandler([record.booru], 10).booruHandler;
    if (booruHandler.hasLoadItemSupport) {
      try {
        await booruHandler.loadItem(
          item: record.item,
          withCapcthaCheck: true,
        );
      } catch (_) {}
    }
    snatchHandler.onRetryItem(
      record,
      cooldown: settingsHandler.snatchCooldown,
      ignoreExists: isExists || isLongTap,
    );

    updating.value = false;
  }

  Future<void> onRetryAllFailed(bool isLongTap) async {
    updating.value = true;

    await snatchHandler.onRetryAll(
      cooldown: settingsHandler.snatchCooldown,
      ignoreExists: isLongTap,
    );

    updating.value = false;
  }

  Future<void> removeSnatchedStatusFromSelected() async {
    final onlySnatched = searchHandler.currentSelected.where((e) => e.isSnatched.value == true).toList();

    updating.value = true;

    for (final item in onlySnatched) {
      item.isSnatched.value = false;
      await settingsHandler.dbHandler.updateBooruItem(
        item,
        BooruUpdateMode.local,
      );
    }
    searchHandler.currentTab.selected.clear();

    updating.value = false;
  }

  Future<void> favouriteSelected() async {
    final onlyUnfavs = searchHandler.currentSelected.where((e) => e.isFavourite.value == false).toList();

    updating.value = true;

    await searchHandler.currentTab.updateFavForMultipleItems(
      searchHandler.currentFetched.where(onlyUnfavs.contains).toList(),
      newValue: true,
    );
    searchHandler.currentTab.selected.clear();

    updating.value = false;
  }

  Future<void> unfavouriteSelected() async {
    final onlyFavs = searchHandler.currentSelected.where((e) => e.isFavourite.value == true).toList();

    updating.value = true;

    await searchHandler.currentTab.updateFavForMultipleItems(
      searchHandler.currentFetched.where(onlyFavs.contains).toList(),
      newValue: false,
    );
    searchHandler.currentTab.selected.clear();

    updating.value = false;
  }

  void dispose() {
    scrollController.dispose();
    _handlerCache.clear();
  }
}
