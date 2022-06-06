import 'dart:async';

import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/widgets/gallery/change_page_buttons.dart';
import 'package:lolisnatcher/src/widgets/gallery/zoom_button.dart';
import 'package:lolisnatcher/src/data/settings/app_mode.dart';

class GalleryButtons extends StatefulWidget {
  const GalleryButtons(this.controller, {Key? key}) : super(key: key);
  final PreloadPageController? controller;

  @override
  State<GalleryButtons> createState() => _GalleryButtonsState();
}

class _GalleryButtonsState extends State<GalleryButtons> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final ViewerHandler viewerHandler = ViewerHandler.instance;

  bool isVisible = false, isLoaded = false;
  double bottomOffset = kToolbarHeight * 3;
  StreamSubscription<bool>? appbarListener, loadedListener;

  @override
  void initState() {
    super.initState();

    // place higher when toolbar is on the bottom, to avoid conflicts with video controls
    bottomOffset = kToolbarHeight * (settingsHandler.galleryBarPosition == 'Top' ? 2 : 3);

    isVisible = settingsHandler.appMode.value == AppMode.MOBILE && viewerHandler.displayAppbar.value;
    appbarListener = viewerHandler.displayAppbar.listen((bool value) {
      if (settingsHandler.appMode.value == AppMode.MOBILE) {
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
  }

  void updateState() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    appbarListener?.cancel();
    super.dispose();
  }

  Widget buildDivider(bool isForVertical) {
    return SizedBox(
      width: isForVertical ? 20 : 1,
      height: isForVertical ? 1 : 20,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
            width: 1,
          ),
        ),
      ),
    );
  }

  List<Widget> getButtons(bool isVertical, bool isLeft) {
    final String side = isLeft ? 'Left' : 'Right';

    final bool isZoomHere = settingsHandler.zoomButtonPosition == side;
    final bool isPagesHere = settingsHandler.changePageButtonsPosition == side;

    return [
      if(isZoomHere) const ZoomButton(),
      if(isZoomHere && isPagesHere) buildDivider(isVertical),

      if(isPagesHere) ChangePageButtons(
        controller: widget.controller,
        isPrev: true,
      ),
      if(isPagesHere) buildDivider(isVertical),
      if(isPagesHere) ChangePageButtons(
        controller: widget.controller,
        isPrev: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final bool isVertical = MediaQuery.of(context).orientation == Orientation.portrait;
    final double distanceFromSide = MediaQuery.of(context).size.width * 0.05;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: isLoaded ? 1 : 0.25,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: isVisible
            ? Stack(
                children: [
                  Positioned(
                    bottom: bottomOffset,
                    left: distanceFromSide,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Theme.of(context).colorScheme.background.withOpacity(0.33),
                        child: isVertical
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: getButtons(isVertical, true),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: getButtons(isVertical, true),
                              ),
                      ),
                    ),
                  ),
    
                  Positioned(
                    bottom: bottomOffset,
                    right: distanceFromSide,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Theme.of(context).colorScheme.background.withOpacity(0.33),
                        child: isVertical
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: getButtons(isVertical, false),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: getButtons(isVertical, false),
                              ),
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox(),
      ),
    );
  }
}
