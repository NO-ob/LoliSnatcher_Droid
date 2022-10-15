import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/desktop/desktop_scroll_wrap.dart';
import 'package:lolisnatcher/src/widgets/thumbnail/thumbnail_card_build.dart';


class StaggeredBuilder extends StatelessWidget {
  const StaggeredBuilder({
    Key? key,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onSecondaryTap,
  }) : super(key: key);

  final void Function(int, BooruItem)? onTap;
  final void Function(int, BooruItem)? onDoubleTap;
  final void Function(int, BooruItem)? onLongPress;
  final void Function(int, BooruItem)? onSecondaryTap;

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final SearchHandler searchHandler = SearchHandler.instance;

    int columnCount =
        (MediaQuery.of(context).orientation == Orientation.portrait) ? settingsHandler.portraitColumns : settingsHandler.landscapeColumns;

    bool isDesktop = settingsHandler.appMode.value.isDesktop;

    return LayoutBuilder(builder: (ctx, constraints) {
      double itemMaxWidth = constraints.maxWidth / columnCount; //MediaQuery.of(context).size.width / columnCount;
      double itemMaxHeight = itemMaxWidth * (16 / 9); //MediaQuery.of(context).size.height * 0.6;
      return Obx(() {
        return WaterfallFlow.builder(
          controller: searchHandler.gridScrollController,
          physics: getListPhysics(), // const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          shrinkWrap: false,
          addAutomaticKeepAlives: false,
          cacheExtent: 200,
          itemCount: searchHandler.currentFetched.length,
          padding: EdgeInsets.fromLTRB(2, 2 + (isDesktop ? 0 : (kToolbarHeight + MediaQuery.of(context).padding.top)), 2, 80),
          gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
            crossAxisCount: columnCount,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            double? widthData = searchHandler.currentFetched[index].fileWidth;
            double? heightData = searchHandler.currentFetched[index].fileHeight;

            double possibleWidth = itemMaxWidth;
            double possibleHeight = itemMaxWidth;
            bool hasSizeData = heightData != null && widthData != null;
            if (hasSizeData) {
              double aspectRatio = widthData / heightData;
              possibleHeight = possibleWidth / aspectRatio;
            }
            // force to use minimum 100 px and max 60% of screen height
            possibleHeight = max(min(itemMaxHeight, possibleHeight), 100);

            final BooruItem item = searchHandler.currentFetched[index];

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
        );
      });
    });
  }
}
