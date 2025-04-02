import 'dart:math';

import 'package:flutter/material.dart';

import 'package:waterfall_flow/waterfall_flow.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail_card_build.dart';

class StaggeredBuilder extends StatelessWidget {
  const StaggeredBuilder({
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

    final int columnCount = (MediaQuery.orientationOf(context) == Orientation.portrait) ? settingsHandler.portraitColumns : settingsHandler.landscapeColumns;

    return ValueListenableBuilder(
      valueListenable: searchHandler.currentTab.booruHandler.filteredFetched,
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
              final BooruItem item = searchHandler.currentFetched[index];

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

              return SizedBox(
                height: possibleHeight,
                width: possibleWidth,
                // constraints: hasSizeData
                //     ? BoxConstraints(minHeight: possibleHeight, maxHeight: possibleHeight, minWidth: possibleWidth, maxWidth: possibleWidth)
                //     : BoxConstraints(minHeight: possibleWidth, maxHeight: double.infinity, minWidth: possibleWidth, maxWidth: possibleWidth),
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
          ),
        ),
      ),
    );
  }
}
