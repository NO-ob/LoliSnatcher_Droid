import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/ViewerHandler.dart';
import 'package:LoliSnatcher/widgets/ViewerPage.dart';
import 'package:LoliSnatcher/widgets/GridBuilder.dart';
import 'package:LoliSnatcher/widgets/StaggeredBuilder.dart';
import 'package:LoliSnatcher/widgets/WaterfallErrorButtons.dart';

// TODO avoid rebuilding when global restate happens

class WaterfallView extends StatefulWidget {
  WaterfallView();
  @override
  _WaterfallState createState() => _WaterfallState();
}

class _WaterfallState extends State<WaterfallView> {
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final SearchHandler searchHandler = Get.find<SearchHandler>();
  final ViewerHandler viewerHandler = Get.find<ViewerHandler>();

  Timer? loadingDelay;
  FocusNode kbFocusNode = FocusNode();
  StreamSubscription? volumeListener;
  bool scrollDone = true;
  late StreamSubscription indexListener, viewedListener, isLoadingListener;

  @override
  void initState() {
    super.initState();

    viewerHandler.inViewer.value = false;

    // scroll to current viewed item
    viewedListener = searchHandler.viewedIndex.listen(jumpTo);

    // listen to current tab change to restore the scroll value
    indexListener = searchHandler.index.listen(tabChanged);

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
      viewportBoundaryGetter: () => Rect.fromLTRB(0, settingsHandler.appMode == 'Desktop' ? 0 : (kToolbarHeight + 2), 0, 0),
    );
  }

  void tabChanged(int newIndex) {
    // print('tabChanged: ${searchHandler.currentTab.scrollPosition} ${searchHandler.gridScrollController.hasClients}');

    // postpone scroll updates until the current render is done, since this is called after the global restate after exiting settings
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // restore scroll position on tab change
      if (searchHandler.gridScrollController.hasClients) {
        searchHandler.gridScrollController.jumpTo(searchHandler.currentTab.scrollPosition);
      } else { // if (searchHandler.currentTab.scrollPosition != 0) {
        // TODO reset the controller when appMode changes
        searchHandler.gridScrollController = AutoScrollController(
          initialScrollOffset: searchHandler.currentTab.scrollPosition,
          viewportBoundaryGetter: () => Rect.fromLTRB(0, settingsHandler.appMode == 'Desktop' ? 0 : (kToolbarHeight + 2), 0, 0),
        );
      }
    });
  }

  void setVolumeListener() {
    volumeListener?.cancel();
    volumeListener = searchHandler.volumeStream?.stream.listen(volumeCallback);
  }
  void volumeCallback(String event) async {
    if(!viewerHandler.inViewer.value) {
      int dir = 0;
      if (event == 'up') {
        dir = -1;
      } else if (event == 'down') {
        dir = 1;
      }

      // TODO disable when not in focus (i.e. opened settings/drawer), right now if focus is lost, this widget can't regain it
      if(dir != 0 && scrollDone == true) {
        scrollDone = false;
        final double offset = max(searchHandler.gridScrollController.offset + (settingsHandler.volumeButtonsScrollSpeed * dir), -20);
        await searchHandler.gridScrollController.animateTo(offset, duration: Duration(milliseconds: 200), curve: Curves.linear);
        scrollDone = true;
      }
    }
  }

  @override
  void dispose() {
    indexListener.cancel();
    viewedListener.cancel();
    isLoadingListener.cancel();
    kbFocusNode.dispose();
    volumeListener?.cancel();
    ServiceHandler.setVolumeButtons(true);
    loadingDelay?.cancel();
    super.dispose();
  }

  void jumpTo(int newIndex) async {
    if (!searchHandler.gridScrollController.hasClients) {
      return;
    }
    if(newIndex == -1) {
      return;
    }

    bool isMobile = settingsHandler.appMode == 'Mobile';

    if(!viewerHandler.inViewer.value && isMobile) {
      return;
      // await Future.delayed(Duration(milliseconds: 500));
    }

    if(newIndex == 0) {
      // viewedIndex == 0 when tab is first created, so we should scroll to top on 0th item (not to the item itself, because there is padding on top of it) to avoid bugs with appbar
      searchHandler.gridScrollController.jumpTo(0);
    } else {
      // scroll to viewed item
      await searchHandler.gridScrollController.scrollToIndex(
        newIndex,
        duration: Duration(milliseconds: isMobile ? 10 : 100),
        preferPosition: AutoScrollPosition.begin
      );
    }
  }

  void afterSearch() {
    // desktop view first load setter
    if ((searchHandler.currentFetched.length > 0 && searchHandler.currentFetched.length < (settingsHandler.limit + 1)) && settingsHandler.appMode == 'Desktop') {
      if (searchHandler.viewedItem.value.fileURL.isEmpty) {
        // print("setting booruItem value");
        BooruItem item = searchHandler.setViewedItem(0);
        viewerHandler.setCurrent(item.key);
      }
    }
  }

  void viewerCallback() {
    kbFocusNode.requestFocus();
    viewerHandler.dropCurrent();
  }

  void onTap(int index) async {
    // Load the image viewer

    BooruItem item = searchHandler.setViewedItem(index);
    viewerHandler.setCurrent(item.key);

    if (settingsHandler.appMode == "Mobile") {
      kbFocusNode.unfocus();
      viewerHandler.inViewer.value = true;

      await Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, anim1, anim2) => 
            // Opacity(opacity: 0.5, child: ViewerPage(index)),
            ViewerPage(index),
          fullscreenDialog: false,
          opaque: false,
          transitionDuration: Duration(milliseconds: 300),
          barrierColor: Colors.black26,
        ),
      );

      viewerCallback();
    } else {
      // 
    }
  }

  @override
  Widget build(BuildContext context) {
    // print('!!! WATERFALL BUILD: ${searchHandler.currentFetched.length}');

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
          if(event.physicalKey == PhysicalKeyboardKey.keyK || event.physicalKey == PhysicalKeyboardKey.keyS) {
            // searchHandler.gridScrollController.animateTo(searchHandler.gridScrollController.offset + 50, duration: Duration(milliseconds: 50), curve: Curves.linear);
            columnCount = (MediaQuery.of(context).orientation == Orientation.portrait)
              ? settingsHandler.portraitColumns
              : settingsHandler.landscapeColumns;
            oldIndex = searchHandler.viewedIndex.value;
            newIndex = oldIndex + columnCount;
            if(newIndex < searchHandler.currentFetched.length) {
              item = searchHandler.setViewedItem(newIndex);
              viewerHandler.setCurrent(item.key);
            }

          } else if(event.physicalKey == PhysicalKeyboardKey.keyJ || event.physicalKey == PhysicalKeyboardKey.keyW) {
            // searchHandler.gridScrollController.animateTo(searchHandler.gridScrollController.offset - 50, duration: Duration(milliseconds: 50), curve: Curves.linear);
            columnCount = (MediaQuery.of(context).orientation == Orientation.portrait)
              ? settingsHandler.portraitColumns
              : settingsHandler.landscapeColumns;
            oldIndex = searchHandler.viewedIndex.value;
            newIndex = oldIndex - columnCount;
            if(newIndex > -1) {
              item = searchHandler.setViewedItem(newIndex);
              viewerHandler.setCurrent(item.key);
            }

          } else if(event.physicalKey == PhysicalKeyboardKey.keyD) {
            oldIndex = searchHandler.viewedIndex.value;
            newIndex = oldIndex + 1;
            if(newIndex < searchHandler.currentFetched.length) {
              item = searchHandler.setViewedItem(newIndex);
              viewerHandler.setCurrent(item.key);
            }

          } else if(event.physicalKey == PhysicalKeyboardKey.keyA) {
            oldIndex = searchHandler.viewedIndex.value;
            newIndex = oldIndex - 1;
            if(newIndex > -1) {
              item = searchHandler.setViewedItem(newIndex);;
              viewerHandler.setCurrent(item.key);
            }

          } else if(event.physicalKey == PhysicalKeyboardKey.escape) {
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
              thickness: 6,
              radius: Radius.circular(10),
              isAlwaysShown: true,
              child: RefreshIndicator(
                triggerMode: RefreshIndicatorTriggerMode.anywhere,
                displacement: 80,
                edgeOffset: settingsHandler.appMode == 'Mobile' ? kToolbarHeight : 0,
                strokeWidth: 4,
                color: Get.theme.colorScheme.secondary,
                onRefresh: () async {
                  searchHandler.searchAction(searchHandler.currentTab.tags, null);
                },
                child: ImprovedScrolling(
                  scrollController: searchHandler.gridScrollController,
                  // onScroll: (scrollOffset) => debugPrint(
                  //   'Scroll offset: $scrollOffset',
                  // ),
                  // onMMBScrollStateChanged: (scrolling) => debugPrint(
                  //   'Is scrolling: $scrolling',
                  // ),
                  // onMMBScrollCursorPositionUpdate: (localCursorOffset, scrollActivity) => debugPrint(
                  //       'Cursor position: $localCursorOffset\n'
                  //       'Scroll activity: $scrollActivity',
                  // ),
                  enableMMBScrolling: true,
                  enableKeyboardScrolling: true,
                  enableCustomMouseWheelScrolling: true,
                  // mmbScrollConfig: MMBScrollConfig(
                  //   customScrollCursor: useSystemCursor ? null : const DefaultCustomScrollCursor(),
                  // ),
                  keyboardScrollConfig: KeyboardScrollConfig(
                    arrowsScrollAmount: 250.0,
                    homeScrollDurationBuilder: (currentScrollOffset, minScrollOffset) {
                      return const Duration(milliseconds: 100);
                    },
                    endScrollDurationBuilder: (currentScrollOffset, maxScrollOffset) {
                      return const Duration(milliseconds: 2000);
                    },
                  ),
                  customMouseWheelScrollConfig: const CustomMouseWheelScrollConfig(
                    scrollAmountMultiplier: 15.0,
                  ),
                  // TODO: temporary fallback to waterfall if booru doesn't give image sizes in api, until staggered view is fixed
                  child: (settingsHandler.previewDisplay != 'Staggered' || !searchHandler.currentBooruHandler.hasSizeData)
                    ? GridBuilder(onTap)
                    : StaggeredBuilder(onTap),
                ),
              ),
            ),
            onNotification: (notif) {
              searchHandler.updateScrollPosition();

              //print('SCROLL NOTIFICATION');
              //print(searchHandler.gridScrollController.position.maxScrollExtent);
              //print(notif.metrics); // pixels before viewport, in viewport, after viewport

              bool isNotAtStart = notif.metrics.pixels > 0;
              bool isAtOrNearEdge = notif.metrics.atEdge || notif.metrics.pixels > (notif.metrics.maxScrollExtent - (notif.metrics.extentInside * 2)); // trigger new page when at edge or scroll position is less than 2 viewports
              bool isScreenFilled = notif.metrics.extentBefore != 0 || notif.metrics.extentAfter != 0; // for cases when first page doesn't fill the screen

              if(!searchHandler.isLoading.value) {
                if (!isScreenFilled || (isNotAtStart && isAtOrNearEdge)) {
                  // print('LOADING MORE');
                  // print('isScreenFilled: $isScreenFilled');
                  // print('isNotAtStart: $isNotAtStart');
                  // print('isAtOrNearEdge: $isAtOrNearEdge');
                  // TODO extra search could trigger when changing tabs
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

          WaterfallErrorButtons(),
        ],
      )
    );
  }
}
