import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preload_page_view/preload_page_view.dart';

import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ViewerHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';

class ChangePageButtons extends StatefulWidget {
  final PreloadPageController? controller;
  ChangePageButtons(this.controller, {Key? key}) : super(key: key);

  @override
  _ChangePageButtonsState createState() => _ChangePageButtonsState();
}

class _ChangePageButtonsState extends State<ChangePageButtons> {
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final SearchHandler searchHandler = Get.find<SearchHandler>();
  final ViewerHandler viewerHandler = Get.find<ViewerHandler>();

  bool isVisible = false;
  double bottomOffset = kToolbarHeight * 2;

  StreamSubscription<bool>? appbarListener;
  StreamSubscription<BooruItem>? itemListener;

  Timer? longPressTimer;
  int repeatCount = 0;

  @override
  void initState() {
    super.initState();
    isVisible = settingsHandler.changePageButtonsPosition != "Disabled" && settingsHandler.appMode == "Mobile" && viewerHandler.displayAppbar.value;
    appbarListener = viewerHandler.displayAppbar.listen((bool value) {
      if (settingsHandler.changePageButtonsPosition != "Disabled" && settingsHandler.appMode == "Mobile") {
        isVisible = value;
      }
      updateState();
    });

    bottomOffset = searchHandler.viewedItem.value.isVideo() ? kToolbarHeight * 3 : kToolbarHeight * 2;
    itemListener = searchHandler.viewedItem.listen((BooruItem item) {
      if (item.isVideo()) {
        bottomOffset = kToolbarHeight * 3;
      } else {
        bottomOffset = kToolbarHeight * 2;
      }
      updateState();
    });
  }

  void updateState() {
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    appbarListener?.cancel();
    itemListener?.cancel();
    super.dispose();
  }

  void changePage(int direction) {
    if (widget.controller?.hasClients ?? false) {
      if(repeatCount > 0) {
        ServiceHandler.vibrate(duration: 2);
      }
      widget.controller!.jumpToPage(((widget.controller!.page ?? 0) + direction).round());
    }
  }

  Widget buildButton(IconData icon, int direction) {
    final int fasterAfter = 20;

    return GestureDetector(
      onLongPressStart: (details) {
        // repeat every 100ms if the user holds down the button
        if (longPressTimer != null) return;
        longPressTimer = Timer.periodic(Duration(milliseconds: 200), (timer) {
          changePage(direction);
          repeatCount++;

          // repeat faster after a certain amount of times
          if (repeatCount > fasterAfter) {
            longPressTimer?.cancel();
            longPressTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
              changePage(direction);
              repeatCount++;
            });
          }
        });
      },
      onLongPressEnd: (details) {
        // stop repeating if the user releases the button
        longPressTimer?.cancel();
        longPressTimer = null;
        repeatCount = 0;
      },
      onLongPressCancel: () {
        // stop repeating if the user moves the finger/mouse away
        longPressTimer?.cancel();
        longPressTimer = null;
        repeatCount = 0;
      },
      child: IconButton(
        icon: Icon(icon, color: Colors.grey.withOpacity(0.5), size: 36),
        onPressed: () {
          changePage(direction);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isVisible) {
      return AnimatedPositioned(
        duration: Duration(milliseconds: 200),
        bottom: bottomOffset,
        right: settingsHandler.changePageButtonsPosition == "Right" ? 40 : null,
        left: settingsHandler.changePageButtonsPosition == "Left" ? 40 : null,
        child: Row(
          children: <Widget>[
            buildButton(Icons.arrow_back_ios, -1),
            buildButton(Icons.arrow_forward_ios, 1),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
