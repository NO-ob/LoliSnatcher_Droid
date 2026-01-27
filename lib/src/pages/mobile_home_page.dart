import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/widgets/common/inner_drawer.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
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
    final bool? shouldPop = await showDialog(
      context: context,
      builder: (context) {
        return SettingsDialog(
          title: Text(context.loc.areYouSure),
          contentItems: [
            Text(context.loc.doYouWantToExitApp),
          ],
          actionButtons: [
            ElevatedButton.icon(
              label: Text(context.loc.no),
              icon: const Icon(Icons.cancel),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            ElevatedButton.icon(
              label: Text(context.loc.yes),
              icon: const Icon(Icons.exit_to_app_sharp),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    return shouldPop ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return InnerDrawer(
          key: searchHandler.mainDrawerKey,
          onTapClose: true,
          swipe: true,
          swipeChild: true,

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
            child: settingsHandler.handSide.value.isLeft
                ? const MainDrawer()
                : DownloadsDrawer(toggleDrawer: () => _toggleDrawer(null)),
          ),
          rightChild: RepaintBoundary(
            child: settingsHandler.handSide.value.isRight
                ? const MainDrawer()
                : DownloadsDrawer(toggleDrawer: () => _toggleDrawer(null)),
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
      },
    );
  }
}
