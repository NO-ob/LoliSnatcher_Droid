import 'package:flutter/material.dart';

import 'package:preload_page_view/preload_page_view.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/widgets/gallery/change_page_buttons.dart';
import 'package:lolisnatcher/src/widgets/gallery/zoom_button.dart';

class GalleryButtons extends StatefulWidget {
  const GalleryButtons({super.key, this.pageController});
  final PreloadPageController? pageController;

  @override
  State<GalleryButtons> createState() => _GalleryButtonsState();
}

class _GalleryButtonsState extends State<GalleryButtons> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final ViewerHandler viewerHandler = ViewerHandler.instance;

  bool isVisible = false, isLoaded = false;
  double bottomOffset = kToolbarHeight * 3;

  @override
  void initState() {
    super.initState();

    // place higher when toolbar is on the bottom, to avoid conflicts with video controls
    bottomOffset = kToolbarHeight * (settingsHandler.galleryBarPosition == 'Top' ? 2 : 3);

    isVisible = settingsHandler.appMode.value.isMobile && viewerHandler.displayAppbar.value;
    viewerHandler.displayAppbar.addListener(appbarListener);

    isLoaded = viewerHandler.isLoaded.value;
    viewerHandler.isLoaded.addListener(loadedListener);
  }

  void updateState() {
    if (mounted) {
      setState(() {});
    }
  }

  void appbarListener() {
    if (settingsHandler.appMode.value.isMobile) {
      isVisible = viewerHandler.displayAppbar.value;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateState();
    });
  }

  void loadedListener() {
    final value = viewerHandler.isLoaded.value;
    if (isLoaded != value) {
      isLoaded = value;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        updateState();
      });
    }
  }

  @override
  void dispose() {
    viewerHandler.displayAppbar.removeListener(appbarListener);
    viewerHandler.isLoaded.removeListener(loadedListener);
    super.dispose();
  }

  Widget buildDivider(bool isVerticalDirection) {
    return SizedBox(
      width: isVerticalDirection ? 20 : 1,
      height: isVerticalDirection ? 1 : 20,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
      ),
    );
  }

  List<Widget> getButtons(bool isVerticalDirection, bool isLeft) {
    final String side = isLeft ? 'Left' : 'Right';

    final bool isZoomHere = settingsHandler.zoomButtonPosition == side;
    final bool isPagesHere = settingsHandler.changePageButtonsPosition == side;

    return [
      if (isZoomHere) const ZoomButton(),
      if (isZoomHere && isPagesHere) buildDivider(isVerticalDirection),
      if (isPagesHere)
        ChangePageButtons(
          controller: widget.pageController,
          isPrev: true,
        ),
      if (isPagesHere) buildDivider(isVerticalDirection),
      if (isPagesHere)
        ChangePageButtons(
          controller: widget.pageController,
          isPrev: false,
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final bool isVerticalDirection = MediaQuery.orientationOf(context) == Orientation.portrait;
    final double distanceFromSide = MediaQuery.sizeOf(context).width * 0.05;

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
                      child: ColoredBox(
                        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.33),
                        child: isVerticalDirection
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: getButtons(isVerticalDirection, true),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: getButtons(isVerticalDirection, true),
                              ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: bottomOffset,
                    right: distanceFromSide,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: ColoredBox(
                        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.33),
                        child: isVerticalDirection
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: getButtons(isVerticalDirection, false),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: getButtons(isVerticalDirection, false),
                              ),
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
