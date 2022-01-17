import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';

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

    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
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
        mmbScrollConfig: MMBScrollConfig(
          velocityBackpropagationPercent: 15 / 100,
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
          scrollAmountMultiplier: 15.0,
        ),
        child: child,
      );
    } else {
      return child;
    }
  }
}
