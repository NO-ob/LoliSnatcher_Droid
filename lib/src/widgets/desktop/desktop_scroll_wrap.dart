import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';

import 'package:LoliSnatcher/src/handlers/settings_handler.dart';

ScrollPhysics? getListPhysics() {
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  bool isDesktopPlatform = Platform.isWindows || Platform.isLinux || Platform.isMacOS;
  if (settingsHandler.desktopListsDrag == false && isDesktopPlatform) {
    return const NeverScrollableScrollPhysics();
  } else {
    return const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
  }
}

class DesktopScrollWrap extends StatelessWidget {
  final Widget child;
  final ScrollController controller;
  const DesktopScrollWrap({Key? key, required this.child, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // set physics to:
    // (Platform.isWindows || Platform.isLinux || Platform.isMacOS) ? const NeverScrollableScrollPhysics() : null,
    // on child element wrapped in this
    // otherwise, it will not affect how scroll works

    bool isDesktopPlatform = Platform.isWindows || Platform.isLinux || Platform.isMacOS;

    if (isDesktopPlatform) {
      return ImprovedScrolling(
        scrollController: controller,
        // onScroll: (scrollOffset) => debugPrint(
        //   'Scroll offset: $scrollOffset',
        // ),
        // onMMBScrollStateChanged: (scrolling) => debugPrint(
        //   'Is scrolling: $scrolling',
        // ),
        // onMMBScrollCursorPositionUpdate: (localCursorOffset, scrollActivity) => debugPrint(
        //       'Cursor position: $localCursorOffset\n'
        //       'Scroll activity: $scrollActivity',
        // ),
        enableMMBScrolling: true,
        enableKeyboardScrolling: true,
        enableCustomMouseWheelScrolling: true,
        mmbScrollConfig: const MMBScrollConfig(
          velocityBackpropagationPercent: 8 / 100,
          // customScrollCursor: useSystemCursor ? null : const DefaultCustomScrollCursor(),
        ),
        keyboardScrollConfig: KeyboardScrollConfig(
          arrowsScrollAmount: 250.0,
          homeScrollDurationBuilder: (currentScrollOffset, minScrollOffset) {
            return const Duration(milliseconds: 100);
          },
          endScrollDurationBuilder: (currentScrollOffset, maxScrollOffset) {
            return const Duration(milliseconds: 2000);
          },
        ),
        customMouseWheelScrollConfig: const CustomMouseWheelScrollConfig(
          scrollAmountMultiplier: 10.0,
        ),
        child: child,
      );
    } else {
      return child;
    }
  }
}
