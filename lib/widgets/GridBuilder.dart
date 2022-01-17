import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/widgets/DesktopScrollWrap.dart';
import 'package:LoliSnatcher/widgets/ThumbCardBuild.dart';

class GridBuilder extends StatelessWidget {
  final void Function(int) onTap;
  GridBuilder(this.onTap, {Key? key}) : super(key: key);

  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final SearchHandler searchHandler = Get.find<SearchHandler>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int columnCount =
          (MediaQuery.of(context).orientation == Orientation.portrait) ? settingsHandler.portraitColumns : settingsHandler.landscapeColumns;

      bool isDesktop = settingsHandler.appMode == 'Desktop';

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
          return Card(
            margin: EdgeInsets.all(2),
            child: GridTile(
              child: ThumbCardBuild(index, columnCount, onTap, searchHandler.currentTab),
            ),
          );
        },
      );
    });
  }
}
