import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail_card_build.dart';

class GridBuilder extends StatelessWidget {
  const GridBuilder({
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onSecondaryTap,
    super.key,
  });

  final void Function(int, BooruItem)? onTap;
  final void Function(int, BooruItem)? onDoubleTap;
  final void Function(int, BooruItem)? onLongPress;
  final void Function(int, BooruItem)? onSecondaryTap;

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final SearchHandler searchHandler = SearchHandler.instance;

    return Obx(() {
      final int columnCount = (MediaQuery.orientationOf(context) == Orientation.portrait) ? settingsHandler.portraitColumns : settingsHandler.landscapeColumns;

      return SliverGrid.builder(
        addAutomaticKeepAlives: false,
        itemCount: searchHandler.currentFetched.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columnCount,
          childAspectRatio: settingsHandler.previewDisplay == 'Square' ? 1 : 9 / 16,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemBuilder: (BuildContext context, int index) {
          final BooruItem item = searchHandler.currentFetched[index];

          return GridTile(
            child: ThumbnailCardBuild(
              index: index,
              item: item,
              onTap: onTap,
              onDoubleTap: onDoubleTap,
              onLongPress: onLongPress,
              onSecondaryTap: onSecondaryTap,
            ),
          );
        },
      );
    });
  }
}
