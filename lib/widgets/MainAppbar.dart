import 'dart:async';
import 'dart:math';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/SnatchHandler.dart';
import 'package:LoliSnatcher/ViewerHandler.dart';
import 'package:LoliSnatcher/getPerms.dart';
import 'package:LoliSnatcher/widgets/ActiveTitle.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:LoliSnatcher/widgets/PageNumberDialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget leading;
  final Widget trailing;
  MainAppBar({Key? key, required this.leading, required this.trailing}) : super(key: key);

  final double defaultHeight = kToolbarHeight; //56.0

  @override
  Size get preferredSize => Size.fromHeight(defaultHeight);
  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final SearchHandler searchHandler = Get.find<SearchHandler>();
  final SnatchHandler snatchHandler = Get.find<SnatchHandler>();
  final ViewerHandler viewerHandler = Get.find<ViewerHandler>();

  double _scrollOffset = 1.0;
  double _lastScrollPosition = 0.0;

  StreamSubscription<double>? scrollListener;
  // StreamSubscription<int>? indexListener;

  @override
  void initState() {
    super.initState();
    scrollListener = searchHandler.scrollOffset.listen(updatePosition);
    // indexListener = searchHandler.index.listen(updateIndex);
  }

  @override
  void dispose() {
    scrollListener?.cancel();
    // indexListener?.cancel();
    super.dispose();
  }

  void updatePosition(double newOffset) {
    final double prevOffset = _scrollOffset;
    double scrollChange = ((_lastScrollPosition - newOffset) / searchHandler.gridScrollController.position.viewportDimension) * 10;

    if (newOffset < 0 || (newOffset + 100) > searchHandler.gridScrollController.position.maxScrollExtent) {
      return;
    }

    _scrollOffset = max(0, min(1, _scrollOffset + scrollChange));
    _lastScrollPosition = newOffset;

    if (viewerHandler.inViewer.value) {
      // always show toolbar when in viewer
      _scrollOffset = 1.0;
    }

    if (prevOffset != _scrollOffset) {
      // print('Scroll Offset: $_scrollOffset');
      WidgetsBinding.instance?.addPostFrameCallback((_) => setState(() {}));
    }
  }

  void updateIndex(int newIndex) {
    if (searchHandler.gridScrollController.hasClients) {
      _lastScrollPosition = searchHandler.currentTab.scrollPosition;
      _scrollOffset = 1.0;
      updatePosition(_lastScrollPosition);
    }
  }

  Widget pageNumberButton() {
    return IconButton(
      icon: Icon(Icons.format_list_numbered),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return PageNumberDialog();
            });
      },
    );
  }

  void sinceLastBackup() {
    FlashElements.showSnackbar(
      title: Text('Since last backup: ${searchHandler.lastBackupTime.difference(DateTime.now()).inSeconds * -1} seconds'),
      duration: Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
      color: Colors.transparent,
      height: _scrollOffset * (widget.defaultHeight + MediaQuery.of(context).padding.top),
      child: AppBar(
        automaticallyImplyLeading: true,
        leading: widget.leading,
        title: FittedBox(
          fit: BoxFit.fitWidth,
          child: ActiveTitle(),
        ),
        actions: [
          pageNumberButton(),

          // IconButton(
          //   icon: Icon(Icons.timelapse),
          //   onPressed: () {
          //     // sinceLastBackup();

          //     // Tools.forceClearMemoryCache(withLive: true);
          //   },
          // ),

          Obx(() {
            if (searchHandler.list.isNotEmpty) {
              return Stack(alignment: Alignment.center, children: [
                IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () {
                    getPerms();
                    // call a function to save the currently viewed image when the save button is pressed
                    if (searchHandler.currentTab.selected.length > 0) {
                      snatchHandler.queue(
                        searchHandler.currentTab.getSelected(),
                        searchHandler.currentTab.selectedBooru.value,
                        settingsHandler.snatchCooldown,
                      );
                      searchHandler.currentTab.selected.value = [];
                    } else {
                      FlashElements.showSnackbar(
                        context: context,
                        title: Text("No items selected", style: TextStyle(fontSize: 20)),
                        overrideLeadingIconWidget: Text(" (」°ロ°)」 ", style: TextStyle(fontSize: 18)),
                      );
                    }
                  },
                ),
                if (searchHandler.currentTab.selected.isNotEmpty)
                  Positioned(
                    child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Get.theme.colorScheme.secondary,
                          border: Border.all(color: Get.theme.colorScheme.secondary, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                            child: FittedBox(
                          child: Text('${searchHandler.currentTab.selected.length}', style: TextStyle(color: Get.theme.colorScheme.onSecondary)),
                        ))),
                    right: 2,
                    bottom: 5,
                  ),
              ]);
            } else {
              return const SizedBox.shrink();
            }
          }),

          widget.trailing,
        ],
      ),
    );
  }
}
