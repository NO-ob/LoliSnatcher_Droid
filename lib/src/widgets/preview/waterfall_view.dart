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
  late StreamSubscription tabIndexListener, viewedIndexListener, isLoadingListener;

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
      viewportBoundaryGetter: () => Rect.fromLTRB(0, !isMobile ? 0 : (kToolbarHeight + 2), 0, 0),
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
    if ((searchHandler.currentFetched.isNotEmpty && searchHandler.currentFetched.length < (settingsHandler.limit + 1)) && !isMobile) {
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
  }

  Future<void> onTap(int index, BooruItem item) async {
    // Load the image viewer

    final BooruItem viewedItem = searchHandler.setViewedItem(index);
    viewerHandler.setCurrent(viewedItem.key);

    if (isMobile) {
      kbFocusNode.unfocus();
      viewerHandler.inViewer.value = true;

      await Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, anim1, anim2) =>
              // Opacity(opacity: 0.5, child: GalleryViewPage(index)),
              GalleryViewPage(index),
          opaque: false,
          transitionDuration: const Duration(milliseconds: 300),
          barrierColor: Colors.black26,
        ),
      );

      viewerCallback();
    } else {
      //
    }
  }

  Future<void> onDoubleTap(int index, BooruItem item) async {
    await searchHandler.toggleItemFavourite(index);
  }

  Future<void> onLongPress(int index, BooruItem item) async {
    ServiceHandler.vibrate(duration: 5);

    if (searchHandler.currentTab.selected.contains(item)) {
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

    return RawKeyboardListener(
      // Note: use autofocus instead focusedChild == null that was used before, old way caused unnecesary rebuilds and broke hero animation
      autofocus: true,
      focusNode: kbFocusNode,
      onKey: (RawKeyEvent event) {
        // print('waterfall keyboard ${viewerHandler.inViewer.value}');

        // TODO move all this higher? make global handler for hotkeys?
        // TODO arrows move node focus around, so they are removed for now

        BooruItem? item;
        int oldIndex = 0, newIndex = 0, columnCount = 0;

        // detect only key DOWN events
        // physicalKey guarantees detection on non-english keys/languages
        if (event.runtimeType == RawKeyDownEvent) {
          if (event.physicalKey == PhysicalKeyboardKey.keyK || event.physicalKey == PhysicalKeyboardKey.keyS) {
            // searchHandler.gridScrollController.animateTo(searchHandler.gridScrollController.offset + 50, duration: Duration(milliseconds: 50), curve: Curves.linear);
            columnCount = (MediaQuery.of(context).orientation == Orientation.portrait) ? settingsHandler.portraitColumns : settingsHandler.landscapeColumns;
            oldIndex = searchHandler.viewedIndex.value;
            newIndex = oldIndex + columnCount;
            if (newIndex < searchHandler.currentFetched.length) {
              item = searchHandler.setViewedItem(newIndex);
              viewerHandler.setCurrent(item.key);
              jumpTo(newIndex);
            }
          } else if (event.physicalKey == PhysicalKeyboardKey.keyJ || event.physicalKey == PhysicalKeyboardKey.keyW) {
            // searchHandler.gridScrollController.animateTo(searchHandler.gridScrollController.offset - 50, duration: Duration(milliseconds: 50), curve: Curves.linear);
            columnCount = (MediaQuery.of(context).orientation == Orientation.portrait) ? settingsHandler.portraitColumns : settingsHandler.landscapeColumns;
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
                  // print('LOADING MORE');
                  // print('isScreenFilled: $isScreenFilled');
                  // print('isNotAtStart: $isNotAtStart');
                  // print('isAtOrNearEdge: $isAtOrNearEdge');
                  // TODO could trigger extra search when changing tabs
                  // print('!! scroll triggered search !!');
                  searchHandler.runSearch();
                }
              }
              return true;
            },
          ),

          // Obx(() => Positioned(
          //   top: MediaQuery.of(context).size.height / 2,
          //   left: 0,
          //   child: Container(
          //     color: Colors.black.withOpacity(0.5),
          //     width: 160,
          //     height: 30,
          //     child: Text('L/T: ${searchHandler.currentFetched.length}/${searchHandler.currentBooruHandler.totalCount.value}'),
          //   ),
          // )),

          const WaterfallErrorButtons(),
        ],
      ),
    );
  }
}
