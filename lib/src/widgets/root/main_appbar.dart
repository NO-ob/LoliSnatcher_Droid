import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/snatch_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/services/get_perms.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/root/active_title.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({
    Key? key,
    this.leading,
    this.trailing,
  }) : super(key: key);

  final Widget? leading;
  final Widget? trailing;

  final double defaultHeight = kToolbarHeight; //56.0

  @override
  Size get preferredSize => Size.fromHeight(defaultHeight);

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;
  final SnatchHandler snatchHandler = SnatchHandler.instance;
  final ViewerHandler viewerHandler = ViewerHandler.instance;

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
    final double viewportDimension = searchHandler.gridScrollController.position.viewportDimension;
    double scrollChange = ((_lastScrollPosition - newOffset) / viewportDimension) * 10;

    if (newOffset < 0 || (newOffset + 100) > searchHandler.gridScrollController.position.maxScrollExtent) {
      // do nothing when oversrolling
      return;
    }

    _scrollOffset = max(0, min(1, _scrollOffset + scrollChange));
    _lastScrollPosition = newOffset;

    if (viewerHandler.inViewer.value) {
      // always show toolbar when in viewer
      _scrollOffset = 1.0;
    }

    if (newOffset < (viewportDimension / 3)) {
      // always show toolbar when close to top
      _scrollOffset = 1.0;
    }

    if (prevOffset != _scrollOffset) {
      // print('Scroll Offset: $_scrollOffset');
      WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
    }
  }

  void updateIndex(int newIndex) {
    if (searchHandler.gridScrollController.hasClients) {
      _lastScrollPosition = searchHandler.currentTab.scrollPosition;
      _scrollOffset = 1.0;
      updatePosition(_lastScrollPosition);
    }
  }

  Widget lockButton() {
    return Container();
    // return Obx(() {
    //   if (LocalAuthHandler.instance.deviceSupportsBiometrics.value == true) {
    //     return IconButton(
    //       icon: const Icon(Icons.lock),
    //       onPressed: () {
    //         LocalAuthHandler.instance.logout();
    //       },
    //     );
    //   } else {
    //     return Container();
    //   }
    // });
  }

  Widget devButton() {
    return IconButton(
      icon: const Icon(Icons.timelapse),
      onPressed: () {
        sinceLastBackup();
        Tools.forceClearMemoryCache(withLive: true);
      },
    );
  }

  Widget saveButton() {
    return Obx(() {
      if (searchHandler.list.isNotEmpty) {
        return Stack(alignment: Alignment.center, children: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              getPerms();
              // call a function to save the currently viewed image when the save button is pressed
              if (searchHandler.currentTab.selected.isNotEmpty) {
                snatchHandler.queue(
                  searchHandler.currentTab.getSelected(),
                  searchHandler.currentBooru,
                  settingsHandler.snatchCooldown,
                );
                searchHandler.currentTab.selected.value = [];
              } else {
                FlashElements.showSnackbar(
                  context: context,
                  title: const Text("No items selected", style: TextStyle(fontSize: 20)),
                  overrideLeadingIconWidget: const Text(" (」°ロ°)」 ", style: TextStyle(fontSize: 18)),
                );
              }
            },
          ),
          if (searchHandler.currentTab.selected.isNotEmpty)
            Positioned(
              right: 2,
              bottom: 5,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  border: Border.all(color: Theme.of(context).colorScheme.secondary, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: FittedBox(
                    child: Text(
                      '${searchHandler.currentTab.selected.length}',
                      style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                    ),
                  ),
                ),
              ),
            ),
        ]);
      } else {
        return const SizedBox.shrink();
      }
    });
  }

  void sinceLastBackup() {
    FlashElements.showSnackbar(
      title: Text('Since last backup: ${searchHandler.lastBackupTime.difference(DateTime.now()).inSeconds * -1} seconds'),
      duration: const Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double barHeight = _scrollOffset * (widget.defaultHeight + MediaQuery.of(context).padding.top);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
      color: Colors.transparent,
      height: barHeight,
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: widget.leading,
        // toolbarHeight: barHeight,
        title: const ActiveTitle(),
        actions: [
          // lockButton(),
          // devButton(),
          saveButton(),
          widget.trailing ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
