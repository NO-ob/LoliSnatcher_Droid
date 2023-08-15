import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';

ScrollPhysics? getListPhysics() {
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  final bool isDesktopPlatform = Platform.isWindows || Platform.isLinux || Platform.isMacOS;
  if (settingsHandler.desktopListsDrag == false && isDesktopPlatform) {
    return const NeverScrollableScrollPhysics();
  } else {
    return const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
  }
}

class DesktopScrollWrap extends StatelessWidget {
  const DesktopScrollWrap({
    required this.controller,
    required this.child,
    super.key,
  });

  final ScrollController controller;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    // set physics to:
    // (Platform.isWindows || Platform.isLinux || Platform.isMacOS) ? const NeverScrollableScrollPhysics() : null,
    // on child element wrapped in this
    // otherwise, it will not affect how scroll works

    final bool isDesktopPlatform = Platform.isWindows || Platform.isLinux || Platform.isMacOS;

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
          arrowsScrollAmount: 250,
          homeScrollDurationBuilder: (currentScrollOffset, minScrollOffset) {
            return const Duration(milliseconds: 100);
          },
          endScrollDurationBuilder: (currentScrollOffset, maxScrollOffset) {
            return const Duration(milliseconds: 2000);
          },
        ),
        customMouseWheelScrollConfig: CustomMouseWheelScrollConfig(
          scrollAmountMultiplier:
              SettingsHandler.instance.appMode.value.isDesktop == true ? (settingsHandler.mousewheelScrollSpeed / 3) : settingsHandler.mousewheelScrollSpeed,
        ),
        child: child,
      );
    } else {
      return child;
    }
  }
}
