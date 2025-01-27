import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:get/get.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/snatch_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/widgets/root/active_title.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
  });

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

  void _toggleDrawer(InnerDrawerDirection? direction) {
    searchHandler.mainDrawerKey.currentState?.toggle(
      // if not set, the last direction will be used
      //InnerDrawerDirection.start OR InnerDrawerDirection.end
      direction: direction,
    );
  }

  void _onMenuLongTap() {
    ServiceHandler.vibrate();
    // scroll to start on long press of menu buttons
    searchHandler.gridScrollController.jumpTo(0);
  }

  Widget menuButton(InnerDrawerDirection direction) {
    return GestureDetector(
      onLongPress: _onMenuLongTap,
      onSecondaryTap: _onMenuLongTap,
      child: IconButton(
        icon: Icon(
          Icons.menu,
          color: Theme.of(context).appBarTheme.iconTheme?.color,
        ),
        onPressed: () {
          _toggleDrawer(direction);
        },
      ),
    );
  }

  Widget snatcherButton(InnerDrawerDirection direction) {
    return Obx(() {
      if (searchHandler.list.isNotEmpty) {
        return Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Obx(() {
              if (snatchHandler.active.value == false || snatchHandler.current.value == null) {
                return const SizedBox.shrink();
              }

              final double singleToTotalProgress = 1 / snatchHandler.current.value!.booruItems.length;
              final double currentCompleteProgress = snatchHandler.queueProgress.value * singleToTotalProgress;

              final double downloadProgress = snatchHandler.currentProgress;
              final double downloadToTotalProgress = singleToTotalProgress * downloadProgress;

              return CircularProgressIndicator(
                value: currentCompleteProgress + downloadToTotalProgress,
              );
            }),
            IconButton(
              onPressed: () async {
                _toggleDrawer(direction);
              },
              padding: EdgeInsets.zero,
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (settingsHandler.handSide.value.isLeft)
                    Icon(
                      Icons.save,
                      color: Theme.of(context).appBarTheme.iconTheme?.color,
                    ),
                  Transform.rotate(
                    angle: settingsHandler.handSide.value.isRight ? 0 : pi,
                    child: Icon(
                      Icons.keyboard_double_arrow_left_rounded,
                      color: Theme.of(context).appBarTheme.iconTheme?.color,
                    ),
                  ),
                  if (settingsHandler.handSide.value.isRight)
                    Icon(
                      Icons.save,
                      color: Theme.of(context).appBarTheme.iconTheme?.color,
                    ),
                ],
              ),
            ),
            if (searchHandler.currentSelected.isNotEmpty)
              Positioned(
                right: -6,
                top: 8,
                child: IgnorePointer(
                  child: Container(
                    width: 20,
                    height: 20,
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          searchHandler.currentSelected.length.toFormattedString(),
                          style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      } else {
        return const SizedBox.shrink();
      }
    });
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
    return SliverAppBar(
      floating: true,
      automaticallyImplyLeading: false,
      leading: settingsHandler.handSide.value.isLeft ? menuButton(InnerDrawerDirection.start) : snatcherButton(InnerDrawerDirection.start),
      title: const ActiveTitle(),
      backgroundColor: settingsHandler.shitDevice ? null : Theme.of(context).appBarTheme.backgroundColor?.withValues(alpha: 0.75),
      flexibleSpace: settingsHandler.shitDevice
          ? null
          : ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: const SizedBox.expand(
                  child: ColoredBox(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
      actions: [
        // lockButton(),
        if (settingsHandler.handSide.value.isRight) menuButton(InnerDrawerDirection.end) else snatcherButton(InnerDrawerDirection.end),
        const SizedBox(width: 8),
      ],
    );
  }
}
