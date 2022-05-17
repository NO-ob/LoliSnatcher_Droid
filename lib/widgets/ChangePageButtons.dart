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
  const ChangePageButtons(this.controller, {Key? key}) : super(key: key);

  @override
  State<ChangePageButtons> createState() => _ChangePageButtonsState();
}

class _ChangePageButtonsState extends State<ChangePageButtons> {
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final SearchHandler searchHandler = Get.find<SearchHandler>();
  final ViewerHandler viewerHandler = Get.find<ViewerHandler>();

  bool isVisible = false, isLoaded = false;
  double bottomOffset = kToolbarHeight * 2;

  StreamSubscription<bool>? appbarListener, loadedListener;
  StreamSubscription<BooruItem>? itemListener;

  Timer? longPressTimer;
  int repeatCount = 0;

  @override
  void initState() {
    super.initState();
    isVisible = settingsHandler.changePageButtonsPosition != "Disabled" &&
        settingsHandler.appMode.value == AppMode.MOBILE &&
        viewerHandler.displayAppbar.value;
    appbarListener = viewerHandler.displayAppbar.listen((bool value) {
      if (settingsHandler.changePageButtonsPosition != "Disabled" && settingsHandler.appMode.value == AppMode.MOBILE) {
        isVisible = value;
      }
      updateState();
    });

    isLoaded = viewerHandler.isLoaded.value;
    loadedListener = viewerHandler.isLoaded.listen((bool value) {
      if (isLoaded != value) {
        isLoaded = value;
        updateState();
      }
    });

    bottomOffset = kToolbarHeight * 3; // searchHandler.viewedItem.value.isVideo() ? kToolbarHeight * 3 : kToolbarHeight * 2;
    // itemListener = searchHandler.viewedItem.listen((BooruItem item) {
    //   if (item.isVideo()) {
    //     bottomOffset = kToolbarHeight * 3;
    //   } else {
    //     bottomOffset = kToolbarHeight * 2;
    //   }
    //   updateState();
    // });
  }

  void updateState() {
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    appbarListener?.cancel();
    loadedListener?.cancel();
    itemListener?.cancel();
    super.dispose();
  }

  void changePage(int direction) {
    if (widget.controller?.hasClients ?? false) {
      if (repeatCount > 0) {
        ServiceHandler.vibrate(duration: 2);
      }
      widget.controller!.jumpToPage(((widget.controller!.page ?? 0) + direction).round());
    }
  }

  Widget buildButton(IconData icon, int direction) {
    const int fasterAfter = 20;

    return GestureDetector(
      onLongPressStart: (details) {
        // repeat every 100ms if the user holds down the button
        if (longPressTimer != null) return;
        longPressTimer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
          changePage(direction);
          repeatCount++;

          // repeat faster after a certain amount of times
          if (repeatCount > fasterAfter) {
            longPressTimer?.cancel();
            longPressTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
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
      onTap: () {
        changePage(direction);
      },
      child: Container(
        // what idiot designed mirrored arrow icons with 1px of difference????????
        padding: direction == 1 ? const EdgeInsets.fromLTRB(8, 0, 8, 0) : const EdgeInsets.fromLTRB(7, 0, 8, 0),
        child: Icon(
          icon,
          color: Get.theme.colorScheme.onBackground.withOpacity(0.5),
          size: 48,
        ),
      ),
    );
  }

  Widget buildDivider(bool isForVertical) {
    return SizedBox(
      width: isForVertical ? 20 : 1,
      height: isForVertical ? 1 : 20,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Get.theme.colorScheme.onBackground.withOpacity(0.15),
            width: 1,
          ),
        ),
      ),
    );
  }

  List<Widget> getButtons(bool isVertical) {
    return [
      buildButton(Icons.arrow_back, -1),
      if(isVertical) const SizedBox(height: 10),
      buildDivider(isVertical),
      if(isVertical) const SizedBox(height: 10),
      buildButton(Icons.arrow_forward, 1),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final bool isVertical = Get.mediaQuery.orientation == Orientation.portrait;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      bottom: bottomOffset,
      right: settingsHandler.changePageButtonsPosition == "Right" ? 40 : null,
      left: settingsHandler.changePageButtonsPosition == "Left" ? 40 : null,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: isLoaded ? 1 : 0.25,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: isVisible
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Get.theme.colorScheme.background.withOpacity(0.33),
                    child: isVertical
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: getButtons(isVertical),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: getButtons(isVertical),
                          ),
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
