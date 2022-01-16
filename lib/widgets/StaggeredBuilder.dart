import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/widgets/ThumbCardBuild.dart';

class StaggeredBuilder extends StatelessWidget {
  final void Function(int) onTap;
  StaggeredBuilder(this.onTap, {Key? key}) : super(key: key);

  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final SearchHandler searchHandler = Get.find<SearchHandler>();

  @override
  Widget build(BuildContext context) {
    int columnCount =
        (MediaQuery.of(context).orientation == Orientation.portrait) ? settingsHandler.portraitColumns : settingsHandler.landscapeColumns;

    bool isDesktop = settingsHandler.appMode == 'Desktop';

    return LayoutBuilder(builder: (ctx, constraints) {
      double itemMaxWidth = constraints.maxWidth / columnCount; //MediaQuery.of(context).size.width / columnCount;
      double itemMaxHeight = itemMaxWidth * (16 / 9); //MediaQuery.of(context).size.height * 0.6;
      return Obx(() {
        return WaterfallFlow.builder(
          controller: searchHandler.gridScrollController,
          physics: (Platform.isWindows || Platform.isLinux || Platform.isMacOS)
              ? const NeverScrollableScrollPhysics()
              : null, // const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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

            return Container(
              height: possibleHeight,
              width: possibleWidth,
              // constraints: hasSizeData
              //     ? BoxConstraints(minHeight: possibleHeight, maxHeight: possibleHeight, minWidth: possibleWidth, maxWidth: possibleWidth)
              //     : BoxConstraints(minHeight: possibleWidth, maxHeight: double.infinity, minWidth: possibleWidth, maxWidth: possibleWidth),
              child: ThumbCardBuild(index, columnCount, onTap, searchHandler.currentTab),
            );
          },
        );
      });
    });
  }
}


// Legacy - left here just in case we need it again
// class StaggeredBuilderOld extends StatelessWidget {
//   final void Function(int) onTap;
//   StaggeredBuilderOld(this.onTap, {Key? key}) : super(key: key);

//   final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
//   final SearchHandler searchHandler = Get.find<SearchHandler>();

//   @override
//   Widget build(BuildContext context) {
//     // TODO flutter upgrade to 2.0.6 seems to prevent memory overflow and stutter on new images a little, but it still won't unload things that are not in view
//     return Obx(() {
//       int columnCount =
//           (MediaQuery.of(context).orientation == Orientation.portrait) ? settingsHandler.portraitColumns : settingsHandler.landscapeColumns;
//       double itemMaxWidth = MediaQuery.of(context).size.width / columnCount;
//       double itemMaxHeight = MediaQuery.of(context).size.height * 0.6;

//       bool isDesktop = settingsHandler.appMode == 'Desktop';

//       return MasonryGridView.count(
//         controller: searchHandler.gridScrollController,
//         physics: (Platform.isWindows || Platform.isLinux || Platform.isMacOS)
//             ? NeverScrollableScrollPhysics()
//             : null, // const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
//         addAutomaticKeepAlives: false,
//         shrinkWrap: false,
//         itemCount: searchHandler.currentFetched.length,
//         padding: EdgeInsets.fromLTRB(2, 2 + (isDesktop ? 0 : (kToolbarHeight + MediaQuery.of(context).padding.top)), 2, 80),
//         crossAxisCount: columnCount,
//         itemBuilder: (BuildContext context, int index) {
//           double? widthData = searchHandler.currentFetched[index].fileWidth ?? null;
//           double? heightData = searchHandler.currentFetched[index].fileHeight ?? null;

//           double possibleWidth = itemMaxWidth;
//           double possibleHeight = itemMaxWidth;
//           bool hasSizeData = heightData != null && widthData != null;
//           if (hasSizeData) {
//             double aspectRatio = widthData / heightData;
//             possibleHeight = possibleWidth / aspectRatio;
//           }
//           // force to use minimum 100 px and max 60% of screen height
//           possibleHeight = max(min(itemMaxHeight, possibleHeight), 100);

//           return Container(
//             height: possibleHeight,
//             width: possibleWidth,
//             // constraints: hasSizeData
//             //     ? BoxConstraints(minHeight: possibleHeight, maxHeight: possibleHeight, minWidth: possibleWidth, maxWidth: possibleWidth)
//             //     : BoxConstraints(minHeight: possibleWidth, maxHeight: double.infinity, minWidth: possibleWidth, maxWidth: possibleWidth),
//             child: ThumbCardBuild(index, columnCount, onTap, searchHandler.currentTab),
//           );
//         },
//         mainAxisSpacing: 4.0,
//         crossAxisSpacing: 4.0,
//       );
//     });
//   }
// }
