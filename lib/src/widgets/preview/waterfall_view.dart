import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/navigation_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/pages/gallery_view_page.dart';
import 'package:lolisnatcher/src/utils/clipboard.dart';
import 'package:lolisnatcher/src/widgets/common/long_press_repeater.dart';
import 'package:lolisnatcher/src/widgets/preview/grid_builder.dart';
import 'package:lolisnatcher/src/widgets/preview/shimmer_builder.dart';
import 'package:lolisnatcher/src/widgets/preview/staggered_builder.dart';
import 'package:lolisnatcher/src/widgets/preview/waterfall_bottom_bar.dart';
import 'package:lolisnatcher/src/widgets/root/main_appbar.dart';

class WaterfallView extends StatefulWidget {
  const WaterfallView({super.key});

  @override
  State<WaterfallView> createState() => _WaterfallViewState();
}

class _WaterfallViewState extends State<WaterfallView> with RouteAware {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;
  final ViewerHandler viewerHandler = ViewerHandler.instance;
  final NavigationHandler navigationHandler = NavigationHandler.instance;

  StreamSubscription? volumeListener;
  bool scrollDone = true;

  Orientation currentOrientation = Orientation.portrait;

  bool isStaggered = false;

  bool get isMobile => settingsHandler.appMode.value.isMobile;

  final ValueNotifier<bool> isActive = ValueNotifier(true);

  Timer? viewedItemCleanupTimer;
  int viewedItemCleanupCount = 0;
  final Set<BooruItem> viewedItems = {};

  @override
  void initState() {
    super.initState();

    // listen to current tab change to restore the scroll value
    searchHandler.index.addListener(tabIndexListener);

    searchHandler.tabId.addListener(tabIdListener);

    // listen to isLoading to select first loaded item for desktop
    searchHandler.isLoading.addListener(isLoadingListener);

    setVolumeListener();
    // reset the volume butons state
    ServiceHandler.setVolumeButtons(!settingsHandler.useVolumeButtonsForScroll);
    // tabChanged(0);
    // TODO reset the controller when appMode changes
    searchHandler.gridScrollController = AutoScrollController(
      initialScrollOffset: searchHandler.currentTabOrNull?.scrollPosition ?? 0,
      viewportBoundaryGetter: () => Rect.fromLTRB(
        0,
        isMobile ? (MediaQuery.paddingOf(context).top + kToolbarHeight + 4) : 0,
        0,
        MediaQuery.paddingOf(context).bottom,
      ),
    );

    isStaggered =
        settingsHandler.previewDisplay.isStaggered && (searchHandler.currentBooruHandlerOrNull?.hasSizeData ?? false);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    NavigationHandler.instance.routeObserver.subscribe(
      this,
      ModalRoute.of(context)! as PageRoute,
    );
  }

  @override
  void didPushNext() {
    isActive.value = false;
  }

  @override
  void didPush() {
    isActive.value = true;
  }

  @override
  void didPopNext() {
    isActive.value = true;
  }

  void tabIdListener() {
    if (searchHandler.tabId.value != null) {
      tabIndexListener();
    }
  }

  void tabIndexListener() {
    // print('tabChanged: ${searchHandler.currentTabOrNull?.scrollPosition} ${searchHandler.gridScrollController.hasClients}');

    // postpone scroll updates until the current render is done, since this is called after the global restate after exiting settings
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final currentTab = searchHandler.currentTabOrNull;
      if (currentTab == null) {
        return;
      }

      // restore scroll position on tab change
      if (searchHandler.gridScrollController.hasClients) {
        searchHandler.gridScrollController.jumpTo(currentTab.scrollPosition);
      } else {
        // if (currentTab.scrollPosition != 0) {
        // TODO reset the controller when appMode changes
        searchHandler.gridScrollController = AutoScrollController(
          initialScrollOffset: currentTab.scrollPosition,
          viewportBoundaryGetter: () => Rect.fromLTRB(
            0,
            isMobile ? (MediaQuery.paddingOf(context).top + kToolbarHeight + 4) : 0,
            0,
            MediaQuery.paddingOf(context).bottom,
          ),
        );
      }
    });

    // check if grid type changed when changing tab
    final bool newIsStaggered =
        settingsHandler.previewDisplay.isStaggered && (searchHandler.currentBooruHandlerOrNull?.hasSizeData ?? false);
    if (isStaggered != newIsStaggered) {
      isStaggered = newIsStaggered;
      setState(() {});
    }
  }

  void isLoadingListener() {
    if (!searchHandler.isLoading.value) {
      afterSearch();
    }
  }

  void setVolumeListener() {
    volumeListener?.cancel();
    volumeListener = searchHandler.volumeStream?.listen(volumeCallback);
  }

  Future<void> volumeCallback(String event) async {
    if (isActive.value) {
      int dir = 0;
      if (event == 'up') {
        dir = -1;
      } else if (event == 'down') {
        dir = 1;
      }

      if (dir != 0 && scrollDone == true) {
        scrollDone = false;
        final double offset = max(
          searchHandler.gridScrollController.offset + (settingsHandler.volumeButtonsScrollSpeed * dir),
          -20,
        );
        await searchHandler.gridScrollController.animateTo(
          offset,
          duration: const Duration(milliseconds: 200),
          curve: Curves.linear,
        );
        scrollDone = true;
      }
    }
  }

  @override
  void dispose() {
    viewedItemCleanupTimer?.cancel();
    NavigationHandler.instance.routeObserver.unsubscribe(this);
    searchHandler.index.removeListener(tabIndexListener);
    searchHandler.tabId.removeListener(tabIdListener);
    searchHandler.isLoading.removeListener(isLoadingListener);
    volumeListener?.cancel();
    ServiceHandler.setVolumeButtons(true);
    super.dispose();
  }

  void jumpTo(int newIndex) {
    if (!searchHandler.gridScrollController.hasClients || newIndex == -1 || (isActive.value && isMobile)) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (newIndex == 0) {
        searchHandler.gridScrollController.jumpTo(0);
      } else {
        searchHandler.gridScrollController.scrollToIndex(
          newIndex,
          duration: Duration(milliseconds: isMobile ? 10 : 100),
          preferPosition: AutoScrollPosition.begin,
        );
      }
    });
  }

  void afterSearch() {
    if (isMobile) {
      return;
    }

    final currentFetched = searchHandler.currentFetchedOrNull;
    if (viewerHandler.current.value == null &&
        currentFetched != null &&
        currentFetched.isNotEmpty &&
        currentFetched.length < (settingsHandler.itemLimit + 1)) {
      viewerHandler.setCurrent(currentFetched.first);
    }
  }

  void viewerCallback() {
    // do cleanup after a delay to avoid animation stutter when leaving the viewer (especially when there are thousands of items)
    Future.delayed(const Duration(milliseconds: 500), () {
      for (final item in viewedItems) {
        if (item.toggleQuality.value) {
          item.toggleQuality.value = false;
        }
      }
      viewedItems.clear();
    });
  }

  void onViewerPageChanged(int index) {
    final currentFetched = searchHandler.currentFetchedOrNull;
    if (currentFetched == null || index >= currentFetched.length) return;
    viewedItems.add(currentFetched[index]);
    if (isMobile) {
      jumpTo(index);
    } else {
      // don't auto scroll on viewed index change on desktop
      // call jumpTo only when viewed item is possibly out of view (i.e. selected by arrow keys)
    }
  }

  Future<void> onTap(int index) async {
    if (isMobile) {
      // protection from opening multiple viewers at once
      if (!isActive.value) {
        return;
      }

      viewedItemCleanupTimer?.cancel();
      viewedItemCleanupCount = 0;
      final currentFetched = searchHandler.currentFetchedOrNull;
      final currentTab = searchHandler.currentTabOrNull;
      if (currentFetched == null || currentTab == null || index >= currentFetched.length) return;

      viewedItems
        ..clear()
        ..add(currentFetched[index]);
      viewerHandler.setCurrent(currentFetched[index]);

      isActive.value = false;
      viewerHandler.showNotes.value = !settingsHandler.hideNotes;

      final viewerKey = GlobalKey(debugLabel: 'viewer-main');
      ViewerHandler.instance.addViewer(viewerKey);
      await Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (_, _, _) => GalleryViewPage(
            key: viewerKey,
            tab: currentTab,
            initialIndex: index,
            onPageChanged: onViewerPageChanged,
          ),
          opaque: false,
          transitionDuration: const Duration(milliseconds: 300),
          barrierColor: Colors.black26,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return const ZoomPageTransitionsBuilder().buildTransitions(
              MaterialPageRoute(
                builder: (_) => const SizedBox.shrink(),
              ), // is not used anywhere, but function requires it to get allowSnapshotting from it
              context,
              animation,
              secondaryAnimation,
              child,
            );
          },
        ),
      );

      viewerHandler.dropCurrent();

      viewedItemCleanupTimer = Timer.periodic(
        const Duration(milliseconds: 200),
        (_) {
          // workaround to forcefully clear the viewed item if it got set after we left the viewer (i.e. check after favouriting)
          if (viewerHandler.current.value != null) {
            viewerHandler.dropCurrent();
          }

          // run for 5s with 200ms interval
          if (viewedItemCleanupCount < 25) {
            viewedItemCleanupCount++;
          } else {
            viewedItemCleanupTimer?.cancel();
          }
        },
      );

      isActive.value = true;

      // reset notes to default state, defined in settings
      viewerHandler.showNotes.value = !settingsHandler.hideNotes;

      viewerCallback();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        navigationHandler.floatingHeaderKey.currentState?.show();
        navigationHandler.bottomBarKey.currentState?.show();
      });
    } else {
      final currentFetched = searchHandler.currentFetchedOrNull;
      if (currentFetched == null || index >= currentFetched.length) return;
      viewerHandler.setCurrent(currentFetched[index]);
    }
  }

  Future<void> onDoubleTap(int index) async {
    await searchHandler.currentTabOrNull?.toggleItemFavourite(index);
  }

  Future<void> onLongPress(int index) async {
    final currentFetched = searchHandler.currentFetchedOrNull;
    final currentTab = searchHandler.currentTabOrNull;
    final currentSelected = searchHandler.currentSelectedOrNull;
    if (currentFetched == null || currentTab == null || currentSelected == null || index >= currentFetched.length) {
      return;
    }

    final BooruItem item = currentFetched[index];
    await ServiceHandler.vibrate();

    if (currentSelected.contains(item)) {
      currentTab.selected.remove(item);
    } else {
      currentTab.selected.add(item);
    }
  }

  Future<void> onSecondaryTap(int index, BuildContext context) async {
    final currentFetched = searchHandler.currentFetchedOrNull;
    if (currentFetched == null || index >= currentFetched.length) return;
    final BooruItem item = currentFetched[index];
    await ClipboardUtils.copyImageToClipboard(item);
  }

  @override
  Widget build(BuildContext context) {
    // check if grid type changed when rebuilding the widget (must happen only on start and when saving settings)
    final bool newIsStaggered =
        settingsHandler.previewDisplay.isStaggered && (searchHandler.currentBooruHandlerOrNull?.hasSizeData ?? false);
    if (isStaggered != newIsStaggered) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isStaggered = newIsStaggered;
        setState(() {});
      });
    }

    final bool changedOrientation = context.orientation != currentOrientation;
    if (changedOrientation && !isActive.value) {
      // try to keep the scroll position at currently viewed item when screen orientation changes
      currentOrientation = context.orientation;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        final currentFetched = searchHandler.currentFetchedOrNull;
        if (currentFetched == null) return;

        final itemIndex = currentFetched.indexWhere(
          (item) => item.key == viewerHandler.current.value?.key,
        );
        if (itemIndex != -1) {
          searchHandler.gridScrollController.scrollToIndex(
            itemIndex,
            duration: Duration(milliseconds: isMobile ? 10 : 100),
            preferPosition: AutoScrollPosition.begin,
          );
        }
      });
    }

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        NotificationListener<ScrollNotification>(
          child: Scrollbar(
            controller: searchHandler.gridScrollController,
            interactive: true,
            thickness: 8,
            thumbVisibility: true,
            scrollbarOrientation: settingsHandler.handSide.value.isLeft
                ? ScrollbarOrientation.left
                : ScrollbarOrientation.right,
            child: RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              displacement: 40,
              edgeOffset: MediaQuery.paddingOf(context).top + MainAppBar.height,
              strokeWidth: 4,
              color: Theme.of(context).colorScheme.secondary,
              onRefresh: () => searchHandler.searchAction(
                searchHandler.currentTabOrNull?.tags ?? '',
                null,
              ),
              child: Stack(
                children: [
                  ValueListenableBuilder(
                    valueListenable: isActive,
                    builder: (context, isActive, child) {
                      return ShimmerWrap(
                        enabled: isActive && !SettingsHandler.instance.shitDevice,
                        child: child ?? const SizedBox.shrink(),
                      );
                    },
                    child: Obx(() {
                      final currentFetched = searchHandler.currentFetchedOrNull;
                      final currentTab = searchHandler.currentTabOrNull;
                      final bool isLoadingAndNoItems =
                          searchHandler.isLoading.value && (currentFetched?.isEmpty ?? true);

                      if (isLoadingAndNoItems) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          // reset scroll position if in loading state
                          searchHandler.gridScrollController.jumpTo(0);
                        });
                      }

                      // If loading just finished but content doesn't fill the viewport,
                      // the NotificationListener won't fire (no scroll possible), so trigger next page here with a small delay.
                      if (!searchHandler.isLoading.value && (currentFetched?.isNotEmpty ?? false)) {
                        WidgetsBinding.instance.addPostFrameCallback((_) async {
                          if (searchHandler.gridScrollController.hasClients && !searchHandler.isLoading.value) {
                            final pos = searchHandler.gridScrollController.position;
                            final bool screenNotFilled = pos.extentBefore == 0 && pos.extentAfter == 0;
                            if (screenNotFilled) {
                              await Future.delayed(const Duration(milliseconds: 500));
                              unawaited(searchHandler.runSearch());
                            }
                          }
                        });
                      }

                      return CustomScrollView(
                        key: ValueKey('CustomScrollView-${searchHandler.currentTabId}'),
                        controller: searchHandler.gridScrollController,
                        physics: isLoadingAndNoItems
                            ? const NeverScrollableScrollPhysics()
                            : AlwaysScrollableScrollPhysics(
                                parent: ScrollConfiguration.of(context).getScrollPhysics(context),
                              ),
                        shrinkWrap: false,
                        scrollCacheExtent: settingsHandler.shitDevice ? const .viewport(0.5) : const .viewport(1),
                        slivers: [
                          const MainAppBar(),
                          SliverPadding(
                            padding: const EdgeInsets.fromLTRB(10, 16, 10, 180),
                            sliver: Builder(
                              builder: (context) {
                                if (isLoadingAndNoItems) {
                                  if (settingsHandler.shitDevice) {
                                    return const SliverToBoxAdapter(
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  }

                                  return const ThumbnailsShimmerList();
                                }

                                if (currentTab == null) {
                                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                                }

                                if (isStaggered) {
                                  return Obx(
                                    () => StaggeredBuilder(
                                      key: ValueKey('StaggeredBuilder-${searchHandler.currentTabId}'),
                                      tab: currentTab,
                                      scrollController: searchHandler.gridScrollController,
                                      onTap: onTap,
                                      onDoubleTap: onDoubleTap,
                                      onLongPress: onLongPress,
                                      onSecondaryTap: (i) => onSecondaryTap(i, context),
                                      onSelected: onLongPress,
                                    ),
                                  );
                                }

                                return Obx(
                                  () => GridBuilder(
                                    key: ValueKey('GridBuilder-${searchHandler.currentTabId}'),
                                    tab: currentTab,
                                    scrollController: searchHandler.gridScrollController,
                                    onTap: onTap,
                                    onDoubleTap: onDoubleTap,
                                    onLongPress: onLongPress,
                                    onSecondaryTap: (i) => onSecondaryTap(i, context),
                                    onSelected: onLongPress,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                  Positioned(
                    bottom: MediaQuery.viewPaddingOf(context).bottom + 120,
                    right: settingsHandler.scrollGridButtonsPosition.isRight
                        ? MediaQuery.sizeOf(context).width * 0.07
                        : null,
                    left: settingsHandler.scrollGridButtonsPosition.isLeft
                        ? MediaQuery.sizeOf(context).width * 0.07
                        : null,
                    child: Obx(() {
                      final bool isLoadingAndNoItems =
                          searchHandler.isLoading.value && (searchHandler.currentFetchedOrNull?.isEmpty ?? true);

                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child:
                            (isLoadingAndNoItems ||
                                settingsHandler.scrollGridButtonsPosition.isDisabled ||
                                settingsHandler.appMode.value.isDesktop == true)
                            ? const SizedBox.shrink()
                            : WaterfallScrollButtons(
                                onTap: (bool forward) {
                                  if (forward) {
                                    navigationHandler.floatingHeaderKey.currentState?.hide();
                                    navigationHandler.bottomBarKey.currentState?.hide();
                                  } else {
                                    navigationHandler.floatingHeaderKey.currentState?.show();
                                    navigationHandler.bottomBarKey.currentState?.show();
                                  }
                                  // TODO increase cacheExtent (to load future thumbnails faster) for duration of scrolling + few seconds after + keep resetting timer if didn't exceed debounce between presses?
                                },
                              ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          onNotification: (notif) {
            if (notif is ScrollUpdateNotification || notif is OverscrollNotification) {
              searchHandler.sendToScrollStream(notif);

              // print('SCROLL NOTIFICATION');
              // print(searchHandler.gridScrollController.position.maxScrollExtent);
              // print(notif.metrics); // pixels before viewport, in viewport, after viewport

              final bool isNotAtStart = notif.metrics.pixels > 0;
              final bool isAtOrNearEdge =
                  notif.metrics.atEdge ||
                  notif.metrics.pixels >
                      (notif.metrics.maxScrollExtent -
                          (notif.metrics.extentInside *
                              2)); // trigger new page when at edge or scroll position is less than 2 viewports
              final bool isScreenFilled =
                  notif.metrics.extentBefore != 0 ||
                  notif.metrics.extentAfter != 0; // for cases when first page doesn't fill the screen

              if (!searchHandler.isLoading.value) {
                if (!isScreenFilled || (isNotAtStart && isAtOrNearEdge)) {
                  searchHandler.runSearch();
                }
              }
            }
            return true;
          },
        ),
        //
        RepaintBoundary(
          child: WaterfallBottomBar(
            key: navigationHandler.bottomBarKey,
          ),
        ),
      ],
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
      final bool closestEdgeIsTop =
          scrollController.offset < scrollController.position.maxScrollExtent - scrollController.offset;
      if (leftTillClosestEdge < viewportHeight / 2 &&
          ((forward && !closestEdgeIsTop) || (!forward && closestEdgeIsTop))) {
        nextOffset = (forward ? 1 : -1) * (leftTillClosestEdge * 1.2);
      } else {
        nextOffset = (scrollController.position.viewportDimension * 0.9) * (forward ? 1 : -1);
      }

      await scrollController.animateTo(
        scrollController.offset + nextOffset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );

      onTap(forward);
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
