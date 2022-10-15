import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/desktop/desktop_scroll_wrap.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail_card_build.dart';

class GridBuilder extends StatelessWidget {
  const GridBuilder({
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onSecondaryTap,
    Key? key,
  }) : super(key: key);

  final void Function(int, BooruItem)? onTap;
  final void Function(int, BooruItem)? onDoubleTap;
  final void Function(int, BooruItem)? onLongPress;
  final void Function(int, BooruItem)? onSecondaryTap;

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final SearchHandler searchHandler = SearchHandler.instance;

    return Obx(() {
      int columnCount =
          (MediaQuery.of(context).orientation == Orientation.portrait) ? settingsHandler.portraitColumns : settingsHandler.landscapeColumns;

      bool isDesktop = settingsHandler.appMode.value.isDesktop;

      return GridView.builder(
        controller: searchHandler.gridScrollController,
        physics: getListPhysics(), // const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        addAutomaticKeepAlives: false,
        cacheExtent: 200,
        shrinkWrap: false,
        itemCount: searchHandler.currentFetched.length,
        padding: EdgeInsets.fromLTRB(2, 2 + (isDesktop ? 0 : (kToolbarHeight + MediaQuery.of(context).padding.top)), 2, 80),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columnCount, childAspectRatio: settingsHandler.previewDisplay == 'Square' ? 1 : 9 / 16),
        itemBuilder: (BuildContext context, int index) {
          final BooruItem item = searchHandler.currentFetched[index];

          return Card(
            margin: const EdgeInsets.all(2),
            child: GridTile(
              child: ThumbnailCardBuild(
                index: index,
                item: item,
                onTap: onTap,
                onDoubleTap: onDoubleTap,
                onLongPress: onLongPress,
                onSecondaryTap: onSecondaryTap,
              ),
            ),
          );
        },
      );
    });
  }
}
