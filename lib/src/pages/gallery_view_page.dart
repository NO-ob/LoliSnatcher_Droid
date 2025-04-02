import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:preload_page_view/preload_page_view.dart';

import 'package:lolisnatcher/src/boorus/booru_type.dart';
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
import 'package:lolisnatcher/src/widgets/video/load_item_viewer.dart';
import 'package:lolisnatcher/src/widgets/video/video_viewer.dart';
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
        // axis: Axis.vertical, // photo_view doesn't support locking both axises, so we use custom fork to fix this
        axis: Axis.values,
        child: Dismissible(
          direction: settingsHandler.galleryScrollDirection == 'Vertical' ? DismissDirection.horizontal : DismissDirection.vertical,
          // background: Container(color: Colors.black.withValues(alpha: 0.3)),
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
            child: KeyboardListener(
              autofocus: false,
              focusNode: kbFocusNode,
              onKeyEvent: (KeyEvent event) async {
                // print('viewer keyboard ${viewerHandler.inViewer.value}');

                // detect only key DOWN events
                if (event.runtimeType == KeyDownEvent) {
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
                    if (settingsHandler.favouriteOnSnatch) {
                      await searchHandler.toggleItemFavourite(
                        searchHandler.viewedIndex.value,
                        forcedValue: true,
                        skipSnatching: true,
                      );
                    }
                  } else if (event.physicalKey == PhysicalKeyboardKey.keyF) {
                    // favorite on F
                    if (settingsHandler.dbEnabled) {
                      await searchHandler.toggleItemFavourite(
                        searchHandler.viewedIndex.value,
                      );
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

                      final int preloadCount = settingsHandler.preloadCount;
                      final bool isSankaku = [BooruType.Sankaku, BooruType.IdolSankaku].any((t) => t == searchHandler.currentBooru.type);

                      return PreloadPageView.builder(
                        controller: controller,
                        preloadPagesCount: preloadCount,
                        // allowImplicitScrolling: true,
                        scrollDirection: settingsHandler.galleryScrollDirection == 'Vertical' ? Axis.vertical : Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics(parent: ClampingScrollPhysics()),
                        itemCount: searchHandler.currentFetched.length,
                        itemBuilder: (context, index) {
                          final BooruItem item = searchHandler.currentFetched[index];
                          // String fileURL = item.fileURL;
                          final bool isVideo = item.mediaType.value.isVideo;
                          final bool isImage = item.mediaType.value.isImageOrAnimation;
                          final bool isNeedToGuess = item.mediaType.value.isNeedToGuess;
                          final bool isNeedToLoadItem = item.mediaType.value.isNeedToLoadItem && searchHandler.currentBooruHandler.hasLoadItemSupport;
                          // print(fileURL);
                          // print('isVideo: '+isVideo.toString());

                          late Widget itemWidget;
                          if (isImage) {
                            itemWidget = ImageViewer(item, key: item.key);
                          } else if (isVideo) {
                            if (settingsHandler.disableVideo) {
                              itemWidget = const Center(child: Text('Video Disabled', style: TextStyle(fontSize: 20)));
                            } else {
                              if (Platform.isAndroid || Platform.isIOS || Platform.isWindows || Platform.isLinux) {
                                itemWidget = VideoViewer(item, enableFullscreen: true, key: item.key);
                              } else {
                                itemWidget = VideoViewerPlaceholder(item: item);
                              }
                            }
                          } else if (isNeedToGuess) {
                            itemWidget = GuessExtensionViewer(
                              item: item,
                              onMediaTypeGuessed: (MediaType mediaType) {
                                item.mediaType.value = mediaType;
                                setState(() {});
                              },
                            );
                          } else if (isNeedToLoadItem) {
                            itemWidget = LoadItemViewer(
                              item: item,
                              handler: searchHandler.currentBooruHandler,
                              onItemLoaded: (newItem) {
                                searchHandler.currentFetched[index] = newItem;
                                setState(() {});
                              },
                            );
                          } else {
                            itemWidget = GuessExtensionViewer(
                              item: item,
                              onMediaTypeGuessed: (MediaType mediaType) {
                                item.mediaType.value = mediaType;
                                setState(() {});
                              },
                            );
                            // itemWidget = UnknownViewerPlaceholder(item: item);
                          }

                          final child = ValueListenableBuilder(
                            valueListenable: searchHandler.viewedIndex,
                            builder: (context, viewedIndex, child) {
                              final bool isViewed = index == viewedIndex;
                              final int distanceFromCurrent = (viewedIndex - index).abs();
                              // don't render more than 3 videos at once, chance to crash is too high otherwise
                              // disabled video preload for sankaku because their videos cause crashes if loading/rendering(?) more than one at a time
                              final bool isNear = distanceFromCurrent <= (isVideo ? (isSankaku ? 0 : min(preloadCount, 1)) : preloadCount);
                              if (!isViewed && !isNear) {
                                // don't render if out of preload range
                                return Center(child: Container(color: Colors.black));
                              }

                              // Cut to the size of the container, prevents overlapping
                              return child!;
                            },
                            child: ClipRect(
                              // Stack/Buttons Temp fix for desktop pageview only scrollable on like 2px at edges of screen. Think its a windows only bug
                              child: GestureDetector(
                                onTap: () {
                                  viewerHandler.toggleToolbar(false);
                                },
                                onLongPress: () {
                                  viewerHandler.toggleToolbar(true);
                                },
                                child: itemWidget,
                              ),
                            ),
                          );

                          if (settingsHandler.disableCustomPageTransitions) {
                            return child;
                          }

                          return AnimatedBuilder(
                            animation: controller,
                            builder: (context, child) {
                              return slidePageTransition(
                                context,
                                controller,
                                settingsHandler.galleryScrollDirection == 'Vertical' ? Axis.vertical : Axis.horizontal,
                                index,
                                child,
                              );
                            },
                            child: child,
                          );
                        },
                        onPageChanged: (int index) {
                          ServiceHandler.disableSleep();

                          searchHandler.setViewedItem(index);
                          kbFocusNode.requestFocus();

                          final item = searchHandler.currentFetched[index];

                          viewerHandler.setCurrent(item.key);

                          // enable volume buttons if new page is a video AND appbar is visible
                          final bool isVideo = item.mediaType.value.isVideo;
                          final bool isVolumeAllowed = !settingsHandler.useVolumeButtonsForScroll || (isVideo && viewerHandler.displayAppbar.value);
                          ServiceHandler.setVolumeButtons(isVolumeAllowed);
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
                backgroundColor: Theme.of(context).canvasColor.withValues(alpha: 0.66),
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

Widget slidePageTransition(
  BuildContext context,
  PreloadPageController pageController,
  Axis direction,
  int index,
  Widget? child,
) {
  double delta = 0;
  if (pageController.hasClients && pageController.position.haveDimensions) {
    final position = (pageController.page! - index).clamp(-1.0, 1.0);
    final viewport = pageController.position.viewportDimension;
    delta = position * viewport / 2;
  }
  return ClipRect(
    child: Transform.translate(
      offset: Offset(
        direction == Axis.horizontal ? delta : 0,
        direction == Axis.vertical ? delta : 0,
      ),
      child: child,
    ),
  );
}
