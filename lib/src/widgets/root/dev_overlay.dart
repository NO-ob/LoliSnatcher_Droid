import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/navigation_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/pages/settings/logger_page.dart';
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

  static const double btnSize = 34;
  static const double btnPadding = 4;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        top = MediaQuery.sizeOf(context).height / 2;
      });
    });
  }

  Widget buildButton(
    IconData icon,
    String text,
    VoidCallback onTap,
  ) {
    return InkWell(
      key: ValueKey(icon),
      onTap: onTap,
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

  double get totalHeight => ((btnSize + btnPadding) * (isOpen ? (kDebugMode ? 4 : 3) : 1)) + 2;

  @override
  Widget build(BuildContext context) {
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
                      onPanUpdate: (details) {
                        setState(() {
                          left = clampDouble(
                            details.globalPosition.dx - btnSize / 2,
                            0,
                            MediaQuery.sizeOf(context).width - btnSize,
                          );
                          top = clampDouble(
                            details.globalPosition.dy - (btnSize + btnPadding) / 2,
                            0 + MediaQuery.paddingOf(context).top,
                            MediaQuery.sizeOf(context).height - totalHeight - MediaQuery.paddingOf(context).bottom,
                          );
                        });
                      },
                      child: buildButton(
                        isOpen ? Icons.close : Icons.add,
                        isOpen ? 'Close' : '',
                        () => setState(() {
                          isOpen = !isOpen;

                          top = clampDouble(
                            top,
                            0 + MediaQuery.paddingOf(context).top,
                            MediaQuery.sizeOf(context).height - totalHeight - MediaQuery.paddingOf(context).bottom,
                          );
                        }),
                      ),
                    ),
                    if (isOpen) ...[
                      buildButton(
                        Icons.developer_board,
                        'Network',
                        () {
                          settingsHandler.alice.showInspector();
                        },
                      ),
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
                      if (kDebugMode)
                        buildButton(
                          Icons.deblur,
                          settingsHandler.blurImages ? 'Unblur' : 'Blur',
                          () {
                            settingsHandler.blurImages = !settingsHandler.blurImages;
                            searchHandler.rootRestate?.call();
                          },
                        ),
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
