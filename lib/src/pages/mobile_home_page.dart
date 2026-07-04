import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/widgets/common/inner_drawer.dart';
import 'package:lolisnatcher/src/widgets/drawers/downloads/downloads_drawer.dart';
import 'package:lolisnatcher/src/widgets/drawers/main_drawer.dart';
import 'package:lolisnatcher/src/widgets/preview/media_previews.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({super.key});

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;

  final GlobalKey<ScaffoldState> mainScaffoldKey = GlobalKey<ScaffoldState>();

  bool isDrawerOpened = false;

  void _toggleDrawer(InnerDrawerDirection? dir) {
    if (settingsHandler.booruList.isEmpty) {
      return;
    }

    final state = searchHandler.mainDrawerKey.currentState;
    if (state is! InnerDrawerState) {
      return;
    }

    // if not set, the last direction will be used
    // InnerDrawerDirection.start OR InnerDrawerDirection.end
    state.toggle(direction: dir);
  }

  Future<void> _onPopInvoked(bool didPop, _) async {
    if (didPop) {
      return;
    }

    final result = await _onBackPressed();
    if (result) {
      if (Platform.isAndroid) {
        // will close the app completely
        await SystemNavigator.pop();
      } else {
        Navigator.of(context).pop();
      }
    }
  }

  Future<bool> _onBackPressed() async {
    if (isDrawerOpened) {
      // close the drawer if it's opened
      _toggleDrawer(null);
      return false;
    }

    // ... otherwise, ask to close the app
    final bool? shouldPop = await showModalBottomSheet<bool>(
      context: context,
      showDragHandle: true,
      builder: (_) => const _ExitAppBottomSheet(),
    );

    return shouldPop ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return Obx(() {
          final bool sidebarsEnabled = settingsHandler.booruList.isNotEmpty;

          return InnerDrawer(
            key: searchHandler.mainDrawerKey,
            onTapClose: sidebarsEnabled,
            swipe: sidebarsEnabled,
            swipeChild: sidebarsEnabled,

            //When setting the vertical offset, be sure to use only top or bottom
            offset: IDOffset.only(
              bottom: 0,
              right: orientation.isLandscape ? 0 : 0.5,
              left: orientation.isLandscape ? 0 : 0.5,
            ),
            scale: const IDOffset.horizontal(1),

            proportionalChildArea: true,
            borderRadius: 10,
            leftAnimationType: InnerDrawerAnimation.quadratic,
            rightAnimationType: InnerDrawerAnimation.quadratic,
            backgroundDecoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),

            //when a pointer that is in contact with the screen and moves to the right or left
            onDragUpdate: (double val, InnerDrawerDirection? direction) {
              // return values between 1 and 0
              // print(val);
              // check if the swipe is to the right or to the left
              // print(direction==InnerDrawerDirection.start);
            },

            innerDrawerCallback: (bool isOpen, InnerDrawerDirection? direction) {
              isDrawerOpened = isOpen;
            }, // return  true (open) or false (close)

            leftChild: RepaintBoundary(
              child: sidebarsEnabled
                  ? settingsHandler.handSide.value.isLeft
                        ? const MainDrawer()
                        : DownloadsDrawer(toggleDrawer: () => _toggleDrawer(null))
                  : const SizedBox.shrink(),
            ),
            rightChild: RepaintBoundary(
              child: sidebarsEnabled
                  ? settingsHandler.handSide.value.isRight
                        ? const MainDrawer()
                        : DownloadsDrawer(toggleDrawer: () => _toggleDrawer(null))
                  : const SizedBox.shrink(),
            ),

            // Note: use "automaticallyImplyLeading: false" if you do not personalize "leading" of Bar
            scaffold: Scaffold(
              key: mainScaffoldKey,
              resizeToAvoidBottomInset: false,
              extendBody: true,
              extendBodyBehindAppBar: true,
              body: SafeArea(
                top: false,
                bottom: false,
                child: PopScope(
                  canPop: false,
                  onPopInvokedWithResult: _onPopInvoked,
                  child: const RepaintBoundary(child: MediaPreviews()),
                ),
              ),
            ),
          );
        });
      },
    );
  }
}

class _ExitAppBottomSheet extends StatelessWidget {
  const _ExitAppBottomSheet();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        20,
        0,
        20,
        20 + context.padding.bottom,
      ),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .stretch,
        children: [
          Align(
            alignment: .centerLeft,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                Icons.exit_to_app_rounded,
                color: colorScheme.onSecondaryContainer,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            context.loc.exitTheAppQuestion,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.close_rounded),
                    label: Text(context.loc.no),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.exit_to_app_rounded),
                    label: Text(context.loc.yes),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
