import 'package:flutter/material.dart';

import 'package:get/get.dart' hide FirstWhereOrNullExt;

import 'package:lolisnatcher/gen/strings.g.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/pages/snatcher_page.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/drawers/downloads/dd_controller.dart';

class DDSelectionActions extends StatelessWidget {
  const DDSelectionActions({
    required this.controller,
    required this.toggleDrawer,
    super.key,
  });

  final DownloadsDrawerController controller;
  final VoidCallback toggleDrawer;

  @override
  Widget build(BuildContext context) {
    final searchHandler = controller.searchHandler;

    return Obx(() {
      final selected = searchHandler.currentSelected;
      if (selected.isNotEmpty) {
        final int favSelectedCount = selected.where((item) => item.isFavourite.value == true).length;
        final int unfavSelectedCount = selected.where((item) => item.isFavourite.value == false).length;
        final bool hasFavsSelected = favSelectedCount > 0;
        final bool isAllSelectedFavs = selected.length == favSelectedCount;

        final int downloadsSelectedCount = selected.where((item) => item.isSnatched.value == true).length;
        final bool hasDownloadsSelected = downloadsSelectedCount > 0;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SettingsButton(
              name: '${context.loc.settings.downloads.snatchSelected} (${selected.length.toFormattedString()})',
              icon: const Icon(Icons.download_sharp),
              action: () => controller.onStartSnatching(context, false),
              onLongPress: () => controller.onStartSnatching(context, true),
              drawTopBorder: true,
            ),
            if (hasDownloadsSelected)
              SettingsButton(
                name:
                    '${context.loc.settings.downloads.removeSnatchedStatusFromSelected} (${downloadsSelectedCount.toFormattedString()})',
                icon: const Icon(Icons.file_download_off_outlined),
                action: controller.removeSnatchedStatusFromSelected,
              ),
            if (!isAllSelectedFavs)
              SettingsButton(
                name: '${context.loc.settings.downloads.favouriteSelected} (${unfavSelectedCount.toFormattedString()})',
                icon: const Icon(Icons.favorite, color: Colors.red),
                action: controller.favouriteSelected,
              ),
            if (hasFavsSelected)
              SettingsButton(
                name: '${context.loc.settings.downloads.unfavouriteSelected} (${favSelectedCount.toFormattedString()})',
                icon: const Icon(Icons.favorite_border),
                action: controller.unfavouriteSelected,
              ),
            SettingsButton(
              name: context.loc.settings.downloads.clearSelected,
              icon: const Icon(Icons.delete_forever),
              action: () => searchHandler.currentTab.selected.clear(),
            ),
          ],
        );
      } else {
        return SettingsButton(
          name: context.loc.selectAll,
          icon: const Icon(Icons.select_all),
          action: () => searchHandler.currentTab.selected.addAll(
            searchHandler.currentFetched,
          ),
          drawTopBorder: true,
        );
      }
    });
  }
}

class DDNavigationButtons extends StatelessWidget {
  const DDNavigationButtons({
    required this.controller,
    required this.toggleDrawer,
    super.key,
  });

  final DownloadsDrawerController controller;
  final VoidCallback toggleDrawer;

  @override
  Widget build(BuildContext context) {
    final searchHandler = controller.searchHandler;
    final settingsHandler = controller.settingsHandler;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SettingsButton(
          name: context.loc.snatcher.title,
          icon: const Icon(Icons.download_sharp),
          page: () => const SnatcherPage(),
        ),
        SettingsButton(
          name: context.loc.snatcher.snatchingHistory,
          icon: const Icon(Icons.file_download_outlined),
          action: () {
            final Booru? downloadsBooru = settingsHandler.booruList.firstWhereOrNull(
              (booru) => booru.type?.isDownloads == true,
            );
            final bool hasDownloads = downloadsBooru != null;

            if (!hasDownloads) {
              return;
            }

            searchHandler.addTabByString(
              '',
              switchToNew: true,
              customBooru: downloadsBooru,
            );
            toggleDrawer();
          },
        ),
      ],
    );
  }
}
