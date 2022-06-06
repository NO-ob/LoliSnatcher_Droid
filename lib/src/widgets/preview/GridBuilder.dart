import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/src/handlers/search_handler.dart';
import 'package:LoliSnatcher/src/handlers/settings_handler.dart';
import 'package:LoliSnatcher/src/widgets/desktop/DesktopScrollWrap.dart';
import 'package:LoliSnatcher/src/widgets/thumbnail/ThumbCardBuild.dart';

class GridBuilder extends StatelessWidget {
  const GridBuilder(this.onTap, {Key? key}) : super(key: key);
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final SearchHandler searchHandler = SearchHandler.instance;

    return Obx(() {
      int columnCount =
          (MediaQuery.of(context).orientation == Orientation.portrait) ? settingsHandler.portraitColumns : settingsHandler.landscapeColumns;

      bool isDesktop = settingsHandler.appMode.value == AppMode.DESKTOP;

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
            margin: const EdgeInsets.all(2),
            child: GridTile(
              child: ThumbCardBuild(index, columnCount, onTap, searchHandler.currentTab),
            ),
          );
        },
      );
    });
  }
}
