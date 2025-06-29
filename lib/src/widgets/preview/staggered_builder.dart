import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail_card_build.dart';

class StaggeredBuilder extends StatelessWidget {
  const StaggeredBuilder({
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

    final int columnCount = context.isPortrait ? settingsHandler.portraitColumns : settingsHandler.landscapeColumns;

    return ValueListenableBuilder(
      valueListenable: tab.booruHandler.filteredFetched,
      builder: (context, currentFetched, child) => SliverWaterfallFlow(
        gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
          crossAxisCount: columnCount,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        delegate: SliverChildBuilderDelegate(
          addAutomaticKeepAlives: false,
          childCount: currentFetched.length,
          (context, index) => LayoutBuilder(
            builder: (context, constraints) {
              return Obx(() {
                final BooruItem item = currentFetched[index];

                final double itemMaxWidth = constraints.maxWidth;
                final double itemMaxHeight = itemMaxWidth * (16 / 9);

                final double? widthData = item.fileWidth;
                final double? heightData = item.fileHeight;

                final double possibleWidth = itemMaxWidth;
                double possibleHeight = itemMaxWidth;
                final bool hasSizeData = heightData != null && widthData != null;
                if (hasSizeData) {
                  final double aspectRatio = widthData / heightData;
                  possibleHeight = possibleWidth / aspectRatio;
                }
                // force to use minimum 100 px and max 60% of screen height
                possibleHeight = max(min(itemMaxHeight, possibleHeight), 100);

                final bool hasSelected = tab.selected.isNotEmpty;
                final selectedIndex = tab.selected.indexOf(item);
                final bool isSelected = selectedIndex != -1;

                return SizedBox(
                  height: possibleHeight,
                  width: possibleWidth,
                  // constraints: hasSizeData
                  //     ? BoxConstraints(minHeight: possibleHeight, maxHeight: possibleHeight, minWidth: possibleWidth, maxWidth: possibleWidth)
                  //     : BoxConstraints(minHeight: possibleWidth, maxHeight: double.infinity, minWidth: possibleWidth, maxWidth: possibleWidth),
                  child: ThumbnailCardBuild(
                    index: index,
                    item: item,
                    handler: tab.booruHandler,
                    scrollController: scrollController,
                    isHighlighted: ViewerHandler.instance.currentKey.value == item.key,
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
        ),
      ),
    );
  }
}
