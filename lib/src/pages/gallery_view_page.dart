import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:preload_page_view/preload_page_view.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/snatch_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/widgets/gallery/gallery_buttons.dart';
import 'package:lolisnatcher/src/widgets/gallery/hideable_appbar.dart';
import 'package:lolisnatcher/src/widgets/gallery/notes_renderer.dart';
import 'package:lolisnatcher/src/widgets/gallery/tag_view.dart';
import 'package:lolisnatcher/src/widgets/gallery/viewer_tutorial.dart';
import 'package:lolisnatcher/src/widgets/image/image_viewer.dart';
import 'package:lolisnatcher/src/widgets/video/guess_extension_viewer.dart';
import 'package:lolisnatcher/src/widgets/video/unknown_viewer_placeholder.dart';
import 'package:lolisnatcher/src/widgets/video/video_viewer.dart';
import 'package:lolisnatcher/src/widgets/video/video_viewer_desktop.dart';
import 'package:lolisnatcher/src/widgets/video/video_viewer_placeholder.dart';

class GalleryViewPage extends StatefulWidget {
  const GalleryViewPage(
    this.initialIndex, {
    super.key,
  });

  final int initialIndex;

  @override
  State<GalleryViewPage> createState() => _GalleryViewPageState();
}

class _GalleryViewPageState extends State<GalleryViewPage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SnatchHandler snatchHandler = SnatchHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;
  final ViewerHandler viewerHandler = ViewerHandler.instance;

  late PreloadPageController controller;

  FocusNode kbFocusNode = FocusNode();
  StreamSubscription? volumeListener;
  final GlobalKey<ScaffoldState> viewerScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    controller = PreloadPageController(initialPage: widget.initialIndex);

    // print("searchtabs index: ${searchHandler.viewedIndex.value}");

    ServiceHandler.disableSleep();
    kbFocusNode.requestFocus();

    // enable volume buttons if opened page is a video AND appbar is visible
    final BooruItem item = searchHandler.currentFetched[widget.initialIndex];
    final bool isVideo = item.mediaType.value.isVideo;
    final bool isVolumeAllowed = !settingsHandler.useVolumeButtonsForScroll || (isVideo && viewerHandler.displayAppbar.value);
    ServiceHandler.setVolumeButtons(isVolumeAllowed);
    setVolumeListener();
  }

  @override
  void dispose() {
    volumeListener?.cancel();
    ServiceHandler.setVolumeButtons(!settingsHandler.useVolumeButtonsForScroll);
    kbFocusNode.dispose();
    ServiceHandler.enableSleep();
    super.dispose();
  }

  void toggleToolbar(bool isLongTap) {
    final bool newAppbarVisibility = !viewerHandler.displayAppbar.value;
    viewerHandler.displayAppbar.value = newAppbarVisibility;

    if (isLongTap) {
      ServiceHandler.vibrate();
    }

    // enable volume buttons if current page is a video AND appbar is set to visible
    final bool isVideo = searchHandler.currentFetched[searchHandler.viewedIndex.value].mediaType.value.isVideo;
    final bool isVolumeAllowed = !settingsHandler.useVolumeButtonsForScroll || (isVideo && newAppbarVisibility);
    ServiceHandler.setVolumeButtons(isVolumeAllowed);
  }

  void setVolumeListener() {
    volumeListener?.cancel();
    volumeListener = searchHandler.volumeStream?.listen(volumeCallback);
  }

  void volumeCallback(String event) {
    // print('in gallery $event');
    int dir = 0;
    if (event == 'up') {
      dir = -1;
    } else if (event == 'down') {
      dir = 1;
    }

    if (kbFocusNode.hasFocus && dir != 0) {
      // disable volume scrolling when not in focus
      // lastScrolledTo = math.max(math.min(lastScrolledTo + dir, searchHandler.currentFetched.length), 0);
      final int toPage = searchHandler.viewedIndex.value + dir; // lastScrolledTo;
      // controller.animateToPage(toPage, duration: Duration(milliseconds: 30), curve: Curves.easeInOut);
      if (toPage >= 0 && toPage < searchHandler.currentFetched.length) {
        controller.jumpToPage(toPage);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBar = HideableAppBar(
      pageController: controller,
      onOpenDrawer: () {
        viewerScaffoldKey.currentState?.openEndDrawer();
      },
    );

    final double maxWidth = MediaQuery.sizeOf(context).shortestSide * 0.8;

    return Scaffold(
      key: viewerScaffoldKey,
      extendBodyBehindAppBar: true,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: settingsHandler.galleryBarPosition == 'Top' ? appBar : null,
      bottomNavigationBar: settingsHandler.galleryBarPosition == 'Bottom' ? appBar : null,
      backgroundColor: Colors.transparent,
      body: PhotoViewGestureDetectorScope(
        // vertical to prevent swipe-to-dismiss when zoomed
        axis: Axis.vertical, // photo_view doesn't support locking both axises, so we use custom fork to fix this
        child: Dismissible(
          direction: settingsHandler.galleryScrollDirection == 'Vertical' ? DismissDirection.horizontal : DismissDirection.vertical,
          // background: Container(color: Colors.black.withOpacity(0.3)),
          key: const Key('imagePageDismissibleKey'),
          resizeDuration: null, // Duration(milliseconds: 100),
          dismissThresholds: const {
            DismissDirection.up: 0.2,
            DismissDirection.down: 0.2,
            DismissDirection.startToEnd: 0.3,
            DismissDirection.endToStart: 0.3,
          }, // Amount of swiped away which triggers dismiss
          onDismissed: (_) => Navigator.of(context).pop(),
          child: Center(
            child: RawKeyboardListener(
              autofocus: false,
              focusNode: kbFocusNode,
              onKey: (RawKeyEvent event) async {
                // print('viewer keyboard ${viewerHandler.inViewer.value}');

                // detect only key DOWN events
                if (event.runtimeType == RawKeyDownEvent) {
                  if (event.physicalKey == PhysicalKeyboardKey.arrowLeft || event.physicalKey == PhysicalKeyboardKey.keyH) {
                    // prev page on Left Arrow or H
                    if (searchHandler.viewedIndex.value > 0) {
                      controller.jumpToPage(searchHandler.viewedIndex.value - 1);
                    }
                  } else if (event.physicalKey == PhysicalKeyboardKey.arrowRight || event.physicalKey == PhysicalKeyboardKey.keyL) {
                    // next page on Right Arrow or L
                    if (searchHandler.viewedIndex.value < searchHandler.currentFetched.length - 1) {
                      controller.jumpToPage(searchHandler.viewedIndex.value + 1);
                    }
                  } else if (event.physicalKey == PhysicalKeyboardKey.keyS) {
                    // save on S
                    snatchHandler.queue(
                      [searchHandler.currentFetched[searchHandler.viewedIndex.value]],
                      searchHandler.currentBooru,
                      settingsHandler.snatchCooldown,
                      false,
                    );
                  } else if (event.physicalKey == PhysicalKeyboardKey.keyF) {
                    // favorite on F
                    if (settingsHandler.dbEnabled) {
                      await searchHandler.toggleItemFavourite(searchHandler.viewedIndex.value);
                    }
                  } else if (event.physicalKey == PhysicalKeyboardKey.escape) {
                    // exit on escape if in focus
                    if (kbFocusNode.hasFocus) {
                      Navigator.of(context).pop();
                    }
                  }
                }
              },
              child: Stack(
                children: [
                  ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                    child: Obx(() {
                      if (searchHandler.currentFetched.isEmpty) {
                        return const Center(
                          child: Text('No items', style: TextStyle(color: Colors.white)),
                        );
                      }

                      return PreloadPageView.builder(
                        controller: controller,
                        preloadPagesCount: settingsHandler.preloadCount,
                        // allowImplicitScrolling: true,
                        scrollDirection: settingsHandler.galleryScrollDirection == 'Vertical' ? Axis.vertical : Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics(parent: ClampingScrollPhysics()),
                        itemCount: searchHandler.currentFetched.length,
                        itemBuilder: (context, index) {
                          final BooruItem item = searchHandler.currentFetched[index];
                          // String fileURL = item.fileURL;
                          final bool isVideo = item.mediaType.value.isVideo;
                          final bool isImage = item.mediaType.value.isImageOrAnimation;
                          final bool isNeedsExtraRequest = item.mediaType.value.isNeedsExtraRequest;
                          // print(fileURL);
                          // print('isVideo: '+isVideo.toString());

                          late Widget itemWidget;
                          if (isImage) {
                            itemWidget = ImageViewer(item, key: item.key);
                          } else if (isVideo) {
                            if (settingsHandler.disableVideo) {
                              itemWidget = const Center(child: Text('Video Disabled', style: TextStyle(fontSize: 20)));
                            } else {
                              if (Platform.isAndroid || Platform.isIOS) {
                                itemWidget = VideoViewer(item, enableFullscreen: true, key: item.key);
                              } else if (Platform.isWindows || Platform.isLinux) {
                                // itemWidget = VideoViewerPlaceholder(item: item);
                                itemWidget = VideoViewerDesktop(item, key: item.key);
                              } else {
                                itemWidget = VideoViewerPlaceholder(item: item);
                              }
                            }
                          } else if (isNeedsExtraRequest) {
                            itemWidget = GuessExtensionViewer(
                              item: item,
                              onMediaTypeGuessed: (MediaType mediaType) {
                                item.mediaType.value = mediaType;
                                setState(() {});
                              },
                            );
                          } else {
                            itemWidget = UnknownViewerPlaceholder(item: item);
                          }

                          return Obx(() {
                            final bool isViewed = index == searchHandler.viewedIndex.value;
                            final bool isNear = (searchHandler.viewedIndex.value - index).abs() <= settingsHandler.preloadCount;
                            // print('!! preloadpageview item build $index $isViewed $isNear !!');
                            if (!isViewed && !isNear) {
                              // don't render if out of preload range
                              return Center(child: Container(color: Colors.black));
                            }

                            // Cut to the size of the container, prevents overlapping
                            return ClipRect(
                              // Stack/Buttons Temp fix for desktop pageview only scrollable on like 2px at edges of screen. Think its a windows only bug
                              child: GestureDetector(
                                onTap: () {
                                  toggleToolbar(false);
                                },
                                onLongPress: () {
                                  toggleToolbar(true);
                                },
                                child: itemWidget,
                              ),
                            );
                          });
                        },
                        onPageChanged: (int index) {
                          // rehide system ui on every page change
                          ServiceHandler.disableSleep();

                          searchHandler.setViewedItem(index);
                          kbFocusNode.requestFocus();

                          viewerHandler.setCurrent(searchHandler.currentFetched[index].key);

                          // enable volume buttons if new page is a video AND appbar is visible
                          final bool isVideo = searchHandler.currentFetched[index].mediaType.value.isVideo;
                          final bool isVolumeAllowed = !settingsHandler.useVolumeButtonsForScroll || (isVideo && viewerHandler.displayAppbar.value);
                          ServiceHandler.setVolumeButtons(isVolumeAllowed);
                          // print('Page changed ' + index.toString());
                        },
                      );
                    }),
                  ),
                  NotesRenderer(controller),
                  GalleryButtons(pageController: controller),
                  const ViewerTutorial(),
                ],
              ),
            ),
          ),
        ),
      ),
      endDrawerEnableOpenDragGesture: false,
      endDrawer: Theme(
        data: Theme.of(context).copyWith(
          // copy existing main app theme, but make background semitransparent
          drawerTheme: Theme.of(context).drawerTheme.copyWith(
                backgroundColor: Theme.of(context).canvasColor.withOpacity(0.66),
              ),
        ),
        child: SizedBox(
          width: maxWidth,
          child: Drawer(
            width: maxWidth,
            child: const SafeArea(
              child: TagView(),
            ),
          ),
        ),
      ),
    );
  }
}
