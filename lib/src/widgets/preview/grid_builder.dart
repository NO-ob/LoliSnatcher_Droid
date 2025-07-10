import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail_card_build.dart';

class GridBuilder extends StatelessWidget {
  const GridBuilder({
    required this.tab,
    required this.scrollController,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onSecondaryTap,
    this.onSelected,
    super.key,
  });

  final SearchTab tab;
  final AutoScrollController scrollController;
  final void Function(int)? onTap;
  final void Function(int)? onDoubleTap;
  final void Function(int)? onLongPress;
  final void Function(int)? onSecondaryTap;
  final void Function(int)? onSelected;

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    final String previewDisplay = (settingsHandler.previewDisplay == 'Staggered' && !tab.booruHandler.hasSizeData)
        ? settingsHandler.previewDisplayFallback
        : settingsHandler.previewDisplay;

    final int columnCount = context.isPortrait ? settingsHandler.portraitColumns : settingsHandler.landscapeColumns;

    return ValueListenableBuilder(
      valueListenable: tab.booruHandler.filteredFetched,
      builder: (context, currentFetched, child) => SliverGrid.builder(
        addAutomaticKeepAlives: false,
        itemCount: currentFetched.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columnCount,
          childAspectRatio: previewDisplay == 'Square' ? 1 : 9 / 16,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Obx(() {
            final BooruItem item = currentFetched[index];

            final bool hasSelected = tab.selected.isNotEmpty;
            final selectedIndex = tab.selected.indexOf(item);
            final bool isSelected = selectedIndex != -1;

            return GridTile(
              child: ThumbnailCardBuild(
                index: index,
                item: item,
                handler: tab.booruHandler,
                scrollController: scrollController,
                isHighlighted: ViewerHandler.instance.current.value?.key == item.key,
                selectable: true,
                selectedIndex: isSelected ? selectedIndex : null,
                onSelected: hasSelected ? onSelected : null,
                onTap: onTap,
                onDoubleTap: onDoubleTap,
                onLongPress: onLongPress,
                onSecondaryTap: onSecondaryTap,
              ),
            );
          });
        },
      ),
    );
  }
}
