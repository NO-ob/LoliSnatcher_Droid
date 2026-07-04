import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/navigation_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/pages/settings/debug_page.dart';
import 'package:lolisnatcher/src/pages/settings/logger_page.dart';
import 'package:lolisnatcher/src/pages/settings_page.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/utils/logger.dart';

class OverlayScreen {
  factory OverlayScreen.of(BuildContext context) => OverlayScreen._create(context);

  OverlayScreen._create(this.context) {
    state = Overlay.of(context);
    entries = {};
  }

  BuildContext context;
  OverlayState? state;
  Map<String, OverlayEntry>? entries;

  void insert(Widget widget, String key) {
    if (entries?.containsKey(key) ?? false) {
      remove(key);
    }
    final entry = OverlayEntry(builder: (_) => widget);
    entries?.putIfAbsent(key, () => entry);
    state?.insert(entry);
  }

  void remove(String key) {
    entries?[key]?.remove();
    entries?.remove(key);
  }

  void removeAll() {
    entries?.forEach((_, v) => v.remove());
    entries?.clear();
  }
}

class DevOverlayContent extends StatefulWidget {
  const DevOverlayContent({super.key});

  @override
  State<DevOverlayContent> createState() => __DevOverlayContentState();
}

class __DevOverlayContentState extends State<DevOverlayContent> {
  final settingsHandler = SettingsHandler.instance;
  final searchHandler = SearchHandler.instance;

  double left = 0;
  double top = 0;
  bool isOpen = false;
  Size? lastScreenSize;
  EdgeInsets? lastScreenPadding;
  bool isPositionInitialized = false;

  static const double btnSize = 34;
  static const double btnPadding = 4;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    syncPositionWithScreen();
  }

  void handleBackAction() {
    final navigator = NavigationHandler.instance.navigatorKey.currentState;
    if (navigator == null) {
      return;
    }

    unawaited(navigator.maybePop());
  }

  Widget buildButton(
    IconData icon,
    String text,
    VoidCallback onTap, {
    VoidCallback? onLongTap,
  }) {
    return InkWell(
      key: ValueKey(icon),
      onTap: onTap,
      onLongPress: onLongTap,
      child: Container(
        width: btnSize,
        height: btnSize + btnPadding,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 2),
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.onSurface,
              size: 16,
            ),
            if (text.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: FittedBox(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  double get totalHeight =>
      ((btnSize + btnPadding) * (isOpen ? (4 + (kDebugMode ? (PlatformExt.isDesktop ? 2 : 1) : 0)) : 1)) + 2;

  double maxLeft(Size size) => max(0, size.width - btnSize).toDouble();

  double minTop(EdgeInsets padding) => padding.top;

  double maxTop(Size size, EdgeInsets padding) => max(minTop(padding), size.height - totalHeight - padding.bottom);

  void syncPositionWithScreen() {
    final size = MediaQuery.sizeOf(context);
    final padding = MediaQuery.paddingOf(context);
    final previousSize = lastScreenSize;
    final previousPadding = lastScreenPadding;

    if (!isPositionInitialized) {
      top = clampDouble(
        size.height / 2,
        minTop(padding),
        maxTop(size, padding),
      );
      isPositionInitialized = true;
    } else if (previousSize != null && previousPadding != null && previousSize != size) {
      final previousMaxLeft = maxLeft(previousSize);
      final currentMaxLeft = maxLeft(size);
      final previousMinTop = minTop(previousPadding);
      final currentMinTop = minTop(padding);
      final previousMaxTop = maxTop(previousSize, previousPadding);
      final currentMaxTop = maxTop(size, padding);
      final previousTopRange = max(1, previousMaxTop - previousMinTop);
      final currentTopRange = currentMaxTop - currentMinTop;

      left = previousMaxLeft == 0 ? 0 : (left / previousMaxLeft) * currentMaxLeft;
      top = currentMinTop + (((top - previousMinTop) / previousTopRange) * currentTopRange);
    }

    left = clampDouble(left, 0, maxLeft(size));
    top = clampDouble(top, minTop(padding), maxTop(size, padding));
    lastScreenSize = size;
    lastScreenPadding = padding;
  }

  void updatePosition(Offset globalPosition) {
    final size = MediaQuery.sizeOf(context);
    final padding = MediaQuery.paddingOf(context);

    setState(() {
      left = clampDouble(
        globalPosition.dx - btnSize / 2,
        0,
        maxLeft(size),
      );
      top = clampDouble(
        globalPosition.dy - (btnSize + btnPadding) / 2,
        minTop(padding),
        maxTop(size, padding),
      );
      lastScreenSize = size;
      lastScreenPadding = padding;
    });
  }

  void toggleOpen() {
    setState(() {
      isOpen = !isOpen;
      syncPositionWithScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    syncPositionWithScreen();

    return Positioned(
      top: top,
      left: left,
      child: Opacity(
        opacity: 0.5,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 0.5,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: AnimatedSize(
            duration: const Duration(milliseconds: 100),
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            child: SizedBox(
              width: btnSize,
              height: totalHeight,
              child: Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onPanUpdate: (d) => updatePosition(d.globalPosition),
                      child: buildButton(
                        isOpen ? Icons.close : Icons.add,
                        isOpen ? 'Close' : '',
                        toggleOpen,
                      ),
                    ),
                    if (isOpen) ...[
                      buildButton(
                        Icons.settings,
                        'Settings',
                        () {
                          Navigator.of(NavigationHandler.instance.navContext).push(
                            MaterialPageRoute(
                              builder: (_) => const SettingsPage(),
                            ),
                          );
                        },
                        onLongTap: () {
                          Navigator.of(NavigationHandler.instance.navContext).push(
                            MaterialPageRoute(
                              builder: (_) => const DebugPage(),
                            ),
                          );
                        },
                      ),
                      //
                      buildButton(
                        Icons.developer_board,
                        'Network',
                        () {
                          settingsHandler.alice.showInspector();
                        },
                      ),
                      //
                      buildButton(
                        Icons.print,
                        'Logger',
                        () {
                          Navigator.of(NavigationHandler.instance.navContext).push(
                            MaterialPageRoute(
                              builder: (_) => LoggerViewPage(talker: Logger.talker),
                            ),
                          );
                        },
                      ),
                      //
                      if (kDebugMode) ...[
                        buildButton(
                          Icons.deblur,
                          settingsHandler.blurImages ? 'Unblur' : 'Blur',
                          () {
                            settingsHandler.blurImages = !settingsHandler.blurImages;
                            searchHandler.rootRestate?.call();
                          },
                        ),
                        // To mimic the android back button
                        if (PlatformExt.isDesktop)
                          buildButton(
                            Icons.arrow_back,
                            'Back',
                            handleBackAction,
                          ),
                      ],
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
