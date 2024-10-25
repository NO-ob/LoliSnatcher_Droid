import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/snatch_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/widgets/root/active_title.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({
    this.leading,
    this.trailing,
    super.key,
  });

  final Widget? leading;
  final Widget? trailing;

  double get defaultHeight => kToolbarHeight; // 56

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

  double _scrollOffset = 1;
  double _lastScrollPosition = 0;

  late StreamSubscription<double> scrollListener;
  late StreamSubscription<int> tabIndexListener;

  @override
  void initState() {
    super.initState();
    scrollListener = searchHandler.scrollOffset.listen(updatePosition);
    tabIndexListener = searchHandler.index.listen(updateIndex);
  }

  @override
  void dispose() {
    scrollListener.cancel();
    tabIndexListener.cancel();
    super.dispose();
  }

  void updatePosition(double newOffset) {
    final double prevOffset = _scrollOffset;
    final double viewportDimension = searchHandler.gridScrollController.position.viewportDimension;
    final double scrollChange = ((_lastScrollPosition - newOffset) / viewportDimension) * 10;

    if (newOffset < 0 || (newOffset + 100) > searchHandler.gridScrollController.position.maxScrollExtent) {
      // do nothing when oversrolling
      return;
    }

    _scrollOffset = max(0, min(1, _scrollOffset + scrollChange));
    _lastScrollPosition = newOffset;

    if (viewerHandler.inViewer.value) {
      // always show toolbar when in viewer
      _scrollOffset = 1;
    }

    if (newOffset < (viewportDimension / 3)) {
      // always show toolbar when close to top
      _scrollOffset = 1;
    }

    if (prevOffset != _scrollOffset) {
      // print('Scroll Offset: $_scrollOffset');
      WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
    }
  }

  void updateIndex(int newIndex) {
    if (searchHandler.gridScrollController.hasClients) {
      _lastScrollPosition = searchHandler.currentTab.scrollPosition;
      final double prevOffset = _scrollOffset;
      _scrollOffset = 1;
      if (prevOffset != 1) {
        WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
      }
    }
  }

  Widget lockButton() {
    return const SizedBox.shrink();
    // return Obx(() {
    //   if (LocalAuthHandler.instance.deviceSupportsBiometrics.value == true) {
    //     return IconButton(
    //       icon: Icon(Icons.lock, color: Theme.of(context).appBarTheme.iconTheme?.color),
    //       onPressed: () {
    //         LocalAuthHandler.instance.logout();
    //       },
    //     );
    //   } else {
    //     return const SizedBox.shrink();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    final double barHeight = _scrollOffset * (widget.defaultHeight + MediaQuery.paddingOf(context).top);

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
          widget.trailing ?? const SizedBox.shrink(),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
