import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/pages/gallery_view_page.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/long_press_repeater.dart';
import 'package:lolisnatcher/src/widgets/desktop/desktop_scroll_wrap.dart';
import 'package:lolisnatcher/src/widgets/preview/grid_builder.dart';
import 'package:lolisnatcher/src/widgets/preview/shimmer_builder.dart';
import 'package:lolisnatcher/src/widgets/preview/staggered_builder.dart';
import 'package:lolisnatcher/src/widgets/preview/waterfall_error_buttons.dart';

class WaterfallView extends StatefulWidget {
  const WaterfallView({super.key});

  @override
  State<WaterfallView> createState() => _WaterfallViewState();
}

class _WaterfallViewState extends State<WaterfallView> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;
  final ViewerHandler viewerHandler = ViewerHandler.instance;

  FocusNode kbFocusNode = FocusNode();
  StreamSubscription? volumeListener;
  bool scrollDone = true;
  late StreamSubscription tabIndexListener, tabIdListener, viewedIndexListener, isLoadingListener;

  Orientation currentOrientation = Orientation.portrait;

  bool isStaggered = false;

  bool get isMobile => settingsHandler.appMode.value.isMobile;

  @override
  void initState() {
    super.initState();

    viewerHandler.inViewer.value = false;

    // scroll to current viewed item
    viewedIndexListener = searchHandler.viewedIndex.listen(viewedIndexChanged);

    // listen to current tab change to restore the scroll value
    tabIndexListener = searchHandler.index.listen(tabChanged);

    tabIdListener = searchHandler.tabId.listen(tabIdChanged);

    // listen to isLoading to select first loaded item for desktop
    isLoadingListener = searchHandler.isLoading.listen((bool isLoading) {
      if (!isLoading) {
        afterSearch();
      }
    });

    setVolumeListener();
    // reset the volume butons state
    ServiceHandler.setVolumeButtons(!settingsHandler.useVolumeButtonsForScroll);
    // tabChanged(0);
    // TODO reset the controller when appMode changes
    searchHandler.gridScrollController = AutoScrollController(
      initialScrollOffset: searchHandler.currentTab.scrollPosition,
      viewportBoundaryGetter: () => Rect.fromLTRB(
        0,
        isMobile ? (kToolbarHeight + 4 + MediaQuery.paddingOf(context).top) : 0,
        0,
        MediaQuery.paddingOf(context).bottom,
      ),
    );

    isStaggered = settingsHandler.previewDisplay == 'Staggered' && searchHandler.currentBooruHandler.hasSizeData;
  }

  void viewedIndexChanged(int newIndex) {
    if (isMobile) {
      jumpTo(newIndex);
    } else {
      // don't auto scroll on viewed index change on desktop
      // call jumpTo only when viewed item is possibly out of view (i.e. selected by arrow keys)
    }
  }

  void tabIdChanged(String? newTabId) {
    if (newTabId != null) {
      tabChanged(searchHandler.currentIndex);
    }
  }

  void tabChanged(int newIndex) {
    // print('tabChanged: ${searchHandler.currentTab.scrollPosition} ${searchHandler.gridScrollController.hasClients}');

    // postpone scroll updates until the current render is done, since this is called after the global restate after exiting settings
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // restore scroll position on tab change
      if (searchHandler.gridScrollController.hasClients) {
        searchHandler.gridScrollController.jumpTo(searchHandler.currentTab.scrollPosition);
      } else {
        // if (searchHandler.currentTab.scrollPosition != 0) {
        // TODO reset the controller when appMode changes
        searchHandler.gridScrollController = AutoScrollController(
          initialScrollOffset: searchHandler.currentTab.scrollPosition,
          viewportBoundaryGetter: () => Rect.fromLTRB(0, !isMobile ? 0 : (kToolbarHeight + 2), 0, 0),
        );
      }
    });

    // check if grid type changed when changing tab
    final bool newIsStaggered = settingsHandler.previewDisplay == 'Staggered' && searchHandler.currentBooruHandler.hasSizeData;
    if (isStaggered != newIsStaggered) {
      isStaggered = newIsStaggered;
      setState(() {});
    }
  }

  void setVolumeListener() {
    volumeListener?.cancel();
    volumeListener = searchHandler.volumeStream?.listen(volumeCallback);
  }

  Future<void> volumeCallback(String event) async {
    if (!viewerHandler.inViewer.value) {
      int dir = 0;
      if (event == 'up') {
        dir = -1;
      } else if (event == 'down') {
        dir = 1;
      }

      // TODO disable when not in focus (i.e. opened settings/drawer), right now if focus is lost, this widget can't regain it
      if (dir != 0 && scrollDone == true) {
        scrollDone = false;
        final double offset = max(searchHandler.gridScrollController.offset + (settingsHandler.volumeButtonsScrollSpeed * dir), -20);
        await searchHandler.gridScrollController.animateTo(offset, duration: const Duration(milliseconds: 200), curve: Curves.linear);
        scrollDone = true;
      }
    }
  }

  @override
  void dispose() {
    tabIndexListener.cancel();
    tabIdListener.cancel();
    viewedIndexListener.cancel();
    isLoadingListener.cancel();
    kbFocusNode.dispose();
    volumeListener?.cancel();
    ServiceHandler.setVolumeButtons(true);
    super.dispose();
  }

  void jumpTo(int newIndex) {
    if (!searchHandler.gridScrollController.hasClients || newIndex == -1 || (!viewerHandler.inViewer.value && isMobile)) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (newIndex == 0) {
        // viewedIndex == 0 when tab is first created, so we should scroll to top on 0th item (not to the item itself, because there is padding on top of it) to avoid bugs with appbar
        searchHandler.gridScrollController.jumpTo(0);
      } else {
        // scroll to viewed item
        searchHandler.gridScrollController.scrollToIndex(
          newIndex,
          duration: Duration(milliseconds: isMobile ? 10 : 100),
          preferPosition: AutoScrollPosition.begin,
        );
      }
    });
  }

  void afterSearch() {
    // desktop view first load setter
    if ((searchHandler.currentFetched.isNotEmpty && searchHandler.currentFetched.length < (settingsHandler.itemLimit + 1)) && !isMobile) {
      if (searchHandler.viewedItem.value.fileURL.isEmpty) {
        // print("setting booruItem value");
        final BooruItem item = searchHandler.setViewedItem(0);
        viewerHandler.setCurrent(item.key);
      }
    }
  }

  void viewerCallback() {
    kbFocusNode.requestFocus();
    viewerHandler.dropCurrent();

    // clear all quality toggles to default
    for (final item in searchHandler.currentTab.booruHandler.fetched) {
      if (item.toggleQuality.value) {
        item.toggleQuality.value = false;
      }
    }
    for (final item in searchHandler.currentFetched) {
      if (item.toggleQuality.value) {
        item.toggleQuality.value = false;
      }
    }
    searchHandler.filterCurrentFetched();
  }

  Future<void> onTap(int index, BooruItem item) async {
    // Load the image viewer

    final BooruItem viewedItem = searchHandler.setViewedItem(index);
    viewerHandler.setCurrent(viewedItem.key);

    if (isMobile) {
      // protection from opening multiple galleries at once
      if (viewerHandler.inViewer.value) {
        return;
      }

      kbFocusNode.unfocus();
      viewerHandler.inViewer.value = true;
      viewerHandler.showNotes.value = !settingsHandler.hideNotes;

      await Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => GalleryViewPage(index),
          opaque: false,
          transitionDuration: const Duration(milliseconds: 300),
          barrierColor: Colors.black26,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return const ZoomPageTransitionsBuilder().buildTransitions(
              MaterialPageRoute(builder: (_) => const SizedBox.shrink()), // is not used anywhere, but function requires it to get allowSnapshotting from it
              context,
              animation,
              secondaryAnimation,
              child,
            );
          },
        ),
      );

      viewerHandler.inViewer.value = false;
      viewerHandler.showNotes.value = !settingsHandler.hideNotes;

      viewerCallback();
    } else {
      //
    }
  }

  Future<void> onDoubleTap(int index, BooruItem item) async {
    await searchHandler.toggleItemFavourite(index);
  }

  Future<void> onLongPress(int index, BooruItem item) async {
    await ServiceHandler.vibrate();

    if (searchHandler.currentSelected.contains(item)) {
      searchHandler.currentTab.selected.remove(item);
    } else {
      searchHandler.currentTab.selected.add(item);
    }
  }

  void onSecondaryTap(int index, BooruItem item) {
    Clipboard.setData(ClipboardData(text: Uri.encodeFull(item.fileURL)));
    FlashElements.showSnackbar(
      duration: const Duration(seconds: 2),
      title: const Text('Copied File URL to clipboard!', style: TextStyle(fontSize: 20)),
      content: Text(Uri.encodeFull(item.fileURL), style: const TextStyle(fontSize: 16)),
      leadingIcon: Icons.copy,
      sideColor: Colors.green,
    );
  }

  @override
  Widget build(BuildContext context) {
    // print('!!! WATERFALL BUILD: ${searchHandler.currentFetched.length}');

    // check if grid type changed when rebuilding the widget (must happen only on start and when saving settings)
    final bool newIsStaggered = settingsHandler.previewDisplay == 'Staggered' && searchHandler.currentBooruHandler.hasSizeData;
    if (isStaggered != newIsStaggered) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isStaggered = newIsStaggered;
        setState(() {});
      });
    }

    final bool changedOrientation = MediaQuery.orientationOf(context) != currentOrientation;
    if (changedOrientation && viewerHandler.inViewer.value) {
      currentOrientation = MediaQuery.orientationOf(context);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        searchHandler.gridScrollController.scrollToIndex(
          searchHandler.viewedIndex.value,
          duration: Duration(milliseconds: isMobile ? 10 : 100),
          preferPosition: AutoScrollPosition.begin,
        );
      });
    }

    return KeyboardListener(
      // Note: use autofocus instead focusedChild == null that was used before, old way caused unnecesary rebuilds and broke hero animation
      autofocus: true,
      focusNode: kbFocusNode,
      onKeyEvent: (KeyEvent event) {
        // print('waterfall keyboard ${viewerHandler.inViewer.value}');

        // TODO move all this higher? make global handler for hotkeys?
        // TODO arrows move node focus around, so they are removed for now
        // TODO move into separate widget (and only use it on desktop?)

        BooruItem? item;
        int oldIndex = 0, newIndex = 0, columnCount = 0;

        // detect only key DOWN events
        // physicalKey guarantees detection on non-english keys/languages
        if (event.runtimeType == KeyDownEvent) {
          if (event.physicalKey == PhysicalKeyboardKey.keyK || event.physicalKey == PhysicalKeyboardKey.keyS) {
            // searchHandler.gridScrollController.animateTo(searchHandler.gridScrollController.offset + 50, duration: Duration(milliseconds: 50), curve: Curves.linear);
            columnCount = MediaQuery.orientationOf(context) == Orientation.portrait ? settingsHandler.portraitColumns : settingsHandler.landscapeColumns;
            oldIndex = searchHandler.viewedIndex.value;
            newIndex = oldIndex + columnCount;
            if (newIndex < searchHandler.currentFetched.length) {
              item = searchHandler.setViewedItem(newIndex);
              viewerHandler.setCurrent(item.key);
              jumpTo(newIndex);
            }
          } else if (event.physicalKey == PhysicalKeyboardKey.keyJ || event.physicalKey == PhysicalKeyboardKey.keyW) {
            // searchHandler.gridScrollController.animateTo(searchHandler.gridScrollController.offset - 50, duration: Duration(milliseconds: 50), curve: Curves.linear);
            columnCount = MediaQuery.orientationOf(context) == Orientation.portrait ? settingsHandler.portraitColumns : settingsHandler.landscapeColumns;
            oldIndex = searchHandler.viewedIndex.value;
            newIndex = oldIndex - columnCount;
            if (newIndex > -1) {
              item = searchHandler.setViewedItem(newIndex);
              viewerHandler.setCurrent(item.key);
              jumpTo(newIndex);
            }
          } else if (event.physicalKey == PhysicalKeyboardKey.keyD) {
            oldIndex = searchHandler.viewedIndex.value;
            newIndex = oldIndex + 1;
            if (newIndex < searchHandler.currentFetched.length) {
              item = searchHandler.setViewedItem(newIndex);
              viewerHandler.setCurrent(item.key);
              jumpTo(newIndex);
            }
          } else if (event.physicalKey == PhysicalKeyboardKey.keyA) {
            oldIndex = searchHandler.viewedIndex.value;
            newIndex = oldIndex - 1;
            if (newIndex > -1) {
              item = searchHandler.setViewedItem(newIndex);
              viewerHandler.setCurrent(item.key);
              jumpTo(newIndex);
            }
          } else if (event.physicalKey == PhysicalKeyboardKey.escape) {
            searchHandler.setViewedItem(-1);
            viewerHandler.dropCurrent();
          }
        }
      },

      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          NotificationListener<ScrollUpdateNotification>(
            child: Scrollbar(
              controller: searchHandler.gridScrollController,
              interactive: true,
              thickness: 8,
              thumbVisibility: true,
              child: RefreshIndicator(
                triggerMode: RefreshIndicatorTriggerMode.anywhere,
                displacement: 80,
                edgeOffset: isMobile ? kToolbarHeight : 0,
                strokeWidth: 4,
                color: Theme.of(context).colorScheme.secondary,
                onRefresh: () async {
                  searchHandler.searchAction(searchHandler.currentTab.tags, null);
                },
                child: Obx(() {
                  final bool isLoadingOrNoItems = searchHandler.isLoading.value && searchHandler.currentFetched.isEmpty;
                  return Stack(
                    children: [
                      DesktopScrollWrap(
                        controller: searchHandler.gridScrollController,
                        // if staggered - fallback to grid if booru doesn't give image sizes in api, otherwise layout will lag and jump around uncontrollably
                        child: ShimmerWrap(
                          enabled: !SettingsHandler.instance.shitDevice,
                          child: isStaggered
                              ? StaggeredBuilder(
                                  onTap: onTap,
                                  onDoubleTap: onDoubleTap,
                                  onLongPress: onLongPress,
                                  onSecondaryTap: onSecondaryTap,
                                )
                              : GridBuilder(
                                  onTap: onTap,
                                  onDoubleTap: onDoubleTap,
                                  onLongPress: onLongPress,
                                  onSecondaryTap: onSecondaryTap,
                                ),
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: isLoadingOrNoItems ? const ShimmerList() : const SizedBox.shrink(),
                      ),
                      Positioned(
                        bottom: MediaQuery.paddingOf(context).bottom + 80,
                        right: settingsHandler.scrollGridButtonsPosition == 'Right' ? MediaQuery.sizeOf(context).width * 0.07 : null,
                        left: settingsHandler.scrollGridButtonsPosition == 'Left' ? MediaQuery.sizeOf(context).width * 0.07 : null,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child:
                              (isLoadingOrNoItems || settingsHandler.scrollGridButtonsPosition == 'Disabled' || settingsHandler.appMode.value.isDesktop == true)
                                  ? const SizedBox.shrink()
                                  : WaterfallScrollButtons(
                                      onTap: (bool forward) {
                                        // TODO increase cacheExtent (to load future thumbnails faster) for duration of scrolling + few seconds after + keep resetting timer if didn't exceed debounce between presses?
                                      },
                                    ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            onNotification: (notif) {
              searchHandler.updateScrollPosition();

              //print('SCROLL NOTIFICATION');
              //print(searchHandler.gridScrollController.position.maxScrollExtent);
              //print(notif.metrics); // pixels before viewport, in viewport, after viewport

              final bool isNotAtStart = notif.metrics.pixels > 0;
              final bool isAtOrNearEdge = notif.metrics.atEdge ||
                  notif.metrics.pixels >
                      (notif.metrics.maxScrollExtent -
                          (notif.metrics.extentInside * 2)); // trigger new page when at edge or scroll position is less than 2 viewports
              final bool isScreenFilled =
                  notif.metrics.extentBefore != 0 || notif.metrics.extentAfter != 0; // for cases when first page doesn't fill the screen

              if (!searchHandler.isLoading.value) {
                if (!isScreenFilled || (isNotAtStart && isAtOrNearEdge)) {
                  searchHandler.runSearch();
                }
              }
              return true;
            },
          ),
          //
          const WaterfallErrorButtons(),
        ],
      ),
    );
  }
}

class WaterfallScrollButtons extends StatelessWidget {
  const WaterfallScrollButtons({
    required this.onTap,
    super.key,
  });

  final ValueChanged<bool> onTap;

  Future<void> pageScroll(bool forward) async {
    final scrollController = SearchHandler.instance.gridScrollController;

    if (scrollController.hasClients && scrollController.position.hasContentDimensions) {
      double nextOffset = 0;
      final double viewportHeight = scrollController.position.viewportDimension;
      final double leftTillClosestEdge = max(
        0,
        min(
          scrollController.position.maxScrollExtent - scrollController.offset,
          scrollController.offset,
        ),
      );
      final bool closestEdgeIsTop = scrollController.offset < scrollController.position.maxScrollExtent - scrollController.offset;
      if (leftTillClosestEdge < viewportHeight / 2 && ((forward && !closestEdgeIsTop) || (!forward && closestEdgeIsTop))) {
        nextOffset = (forward ? 1 : -1) * (leftTillClosestEdge * 1.2);
      } else {
        nextOffset = (scrollController.position.viewportDimension * 0.9) * (forward ? 1 : -1);
      }

      onTap(forward);

      await scrollController.animateTo(
        scrollController.offset + nextOffset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.33),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            LongPressRepeater(
              onStart: () async => pageScroll(false),
              startDelay: 300,
              child: InkWell(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                onTap: () => pageScroll(false),
                child: SizedBox(
                  width: kMinInteractiveDimension,
                  height: kMinInteractiveDimension,
                  child: Icon(
                    Icons.arrow_upward,
                    size: 30,
                    color: Theme.of(context).colorScheme.onPrimaryContainer.withValues(alpha: 0.5),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            LongPressRepeater(
              onStart: () async => pageScroll(true),
              startDelay: 300,
              child: InkWell(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
                onTap: () => pageScroll(true),
                child: SizedBox(
                  width: kMinInteractiveDimension,
                  height: kMinInteractiveDimension,
                  child: Icon(
                    Icons.arrow_downward,
                    size: 30,
                    color: Theme.of(context).colorScheme.onPrimaryContainer.withValues(alpha: 0.5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
