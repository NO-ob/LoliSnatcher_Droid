import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:preload_page_view/preload_page_view.dart';

import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/navigation_handler.dart';
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
  const GalleryViewPage({
    required this.tab,
    required this.initialIndex,
    required super.key, // key required to allow disabling rendering viewer items when there are too many active viewers at the same time
    this.canSelect = true,
    this.onPageChanged,
  });

  final SearchTab tab;
  final int initialIndex;
  final bool canSelect;
  final ValueChanged<int>? onPageChanged;

  @override
  State<GalleryViewPage> createState() => _GalleryViewPageState();
}

class _GalleryViewPageState extends State<GalleryViewPage> with RouteAware {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SnatchHandler snatchHandler = SnatchHandler.instance;
  final ViewerHandler viewerHandler = ViewerHandler.instance;

  late final PreloadPageController controller;

  final ValueNotifier<int> page = ValueNotifier(0);

  final FocusNode kbFocusNode = FocusNode();
  StreamSubscription? volumeListener;
  final GlobalKey<ScaffoldState> viewerScaffoldKey = GlobalKey<ScaffoldState>();

  bool isOpeningAnimation = true;
  final ValueNotifier<double> dismissProgress = ValueNotifier(1);

  final ValueNotifier<bool> isActive = ValueNotifier(true);

  @override
  void initState() {
    super.initState();

    // pause all active videos to avoid performance and sound overlay issues
    viewerHandler.pauseAllVideos();

    controller = PreloadPageController(initialPage: widget.initialIndex);
    page.value = widget.initialIndex;

    ServiceHandler.disableSleep();
    kbFocusNode.requestFocus();

    final bool isVolumeAllowed = !settingsHandler.useVolumeButtonsForScroll || viewerHandler.displayAppbar.value;
    ServiceHandler.setVolumeButtons(isVolumeAllowed);
    volumeListener = SearchHandler.instance.volumeStream?.listen(volumeCallback);

    final item = widget.tab.booruHandler.filteredFetched[widget.initialIndex];
    viewerHandler.setCurrent(item.key);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      dismissProgress.value = 0;
      await Future.delayed(const Duration(milliseconds: 420));
      isOpeningAnimation = false;
    });
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
    final item = widget.tab.booruHandler.filteredFetched[page.value];
    viewerHandler.setCurrent(item.key);
  }

  @override
  void dispose() {
    if (widget.key is GlobalKey) {
      viewerHandler.removeViewer(widget.key! as GlobalKey);
    }
    NavigationHandler.instance.routeObserver.unsubscribe(this);
    volumeListener?.cancel();
    ServiceHandler.setVolumeButtons(!settingsHandler.useVolumeButtonsForScroll);
    kbFocusNode.dispose();
    ServiceHandler.enableSleep();
    super.dispose();
  }

  void volumeCallback(String event) {
    // print('in gallery $event');
    int dir = 0;
    if (event == 'up') {
      dir = -1;
    } else if (event == 'down') {
      dir = 1;
    }

    if (kbFocusNode.hasFocus && isActive.value && dir != 0) {
      // disable volume scrolling when not in focus
      // lastScrolledTo = math.max(math.min(lastScrolledTo + dir, widget.handler.filteredFetched.length), 0);
      final int toPage = page.value + dir; // lastScrolledTo;
      // controller.animateToPage(toPage, duration: Duration(milliseconds: 30), curve: Curves.easeInOut);
      if (toPage >= 0 && toPage < widget.tab.booruHandler.filteredFetched.length) {
        controller.jumpToPage(toPage);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBar = HideableAppBar(
      tab: widget.tab,
      pageController: controller,
      canSelect: widget.canSelect,
      onOpenDrawer: () {
        viewerScaffoldKey.currentState?.openEndDrawer();
      },
    );

    final double maxDrawerWidth = MediaQuery.sizeOf(context).shortestSide * 0.8;

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
          direction: settingsHandler.galleryScrollDirection == 'Vertical'
              ? DismissDirection.horizontal
              : DismissDirection.vertical,
          // background: Container(color: Colors.black.withValues(alpha: 0.3)),
          key: const Key('imagePageDismissibleKey'),
          resizeDuration: null, // Duration(milliseconds: 100),
          dismissThresholds: const {
            DismissDirection.up: 0.2,
            DismissDirection.down: 0.2,
            DismissDirection.startToEnd: 0.3,
            DismissDirection.endToStart: 0.3,
          }, // Amount of swiped away which triggers dismiss
          onUpdate: (dismissUpdateDetails) {
            final prevValue = dismissProgress.value;
            dismissProgress.value =
                (dismissUpdateDetails.progress *
                        (1 / (settingsHandler.galleryScrollDirection == 'Vertical' ? 0.3 : 0.2)))
                    .clamp(0, 1);

            if (prevValue != dismissProgress.value && dismissProgress.value == 1) {
              ServiceHandler.vibrate();
            }
          },
          onDismissed: (_) => Navigator.of(context).pop(),
          child: ValueListenableBuilder(
            valueListenable: dismissProgress,
            builder: (context, dismissProgress, child) {
              if (dismissProgress == 0) {
                viewerHandler.showExtraUi();
              } else {
                viewerHandler.hideExtraUi();
              }

              return Transform.scale(
                scale: isOpeningAnimation
                    ? 1
                    : lerpDouble(
                        1,
                        0.75,
                        dismissProgress,
                      ),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: isOpeningAnimation ? 400 : 10),
                  decoration: BoxDecoration(
                    color: settingsHandler.shitDevice
                        ? Colors.black
                        : Color.lerp(
                            Colors.black,
                            Colors.transparent,
                            dismissProgress,
                          ),
                    borderRadius: (settingsHandler.shitDevice || isOpeningAnimation)
                        ? null
                        : BorderRadius.lerp(
                            BorderRadius.zero,
                            BorderRadius.circular(16),
                            dismissProgress,
                          ),
                  ),
                  child: child,
                ),
              );
            },
            child: Center(
              child: KeyboardListener(
                autofocus: false,
                focusNode: kbFocusNode,
                onKeyEvent: (KeyEvent event) async {
                  // detect only key DOWN events
                  if (event.runtimeType == KeyDownEvent) {
                    if (event.physicalKey == PhysicalKeyboardKey.arrowLeft ||
                        event.physicalKey == PhysicalKeyboardKey.keyH) {
                      // prev page on Left Arrow or H
                      if (page.value > 0) {
                        controller.jumpToPage(page.value - 1);
                      }
                    } else if (event.physicalKey == PhysicalKeyboardKey.arrowRight ||
                        event.physicalKey == PhysicalKeyboardKey.keyL) {
                      // next page on Right Arrow or L
                      if (page.value < widget.tab.booruHandler.filteredFetched.length - 1) {
                        controller.jumpToPage(page.value + 1);
                      }
                    } else if (event.physicalKey == PhysicalKeyboardKey.keyS) {
                      // save on S
                      snatchHandler.queue(
                        [widget.tab.booruHandler.filteredFetched[page.value]],
                        widget.tab.booruHandler.booru,
                        settingsHandler.snatchCooldown,
                        false,
                      );
                      if (settingsHandler.favouriteOnSnatch) {
                        await widget.tab.toggleItemFavourite(
                          page.value,
                          forcedValue: true,
                          skipSnatching: true,
                        );
                      }
                    } else if (event.physicalKey == PhysicalKeyboardKey.keyF) {
                      // favorite on F
                      if (settingsHandler.dbEnabled) {
                        await widget.tab.toggleItemFavourite(
                          page.value,
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
                        if (widget.tab.booruHandler.filteredFetched.isEmpty) {
                          return const Center(
                            child: Text('No items', style: TextStyle(color: Colors.white)),
                          );
                        }

                        final int preloadCount = settingsHandler.preloadCount;
                        final bool isSankaku = [
                          BooruType.Sankaku,
                          BooruType.IdolSankaku,
                        ].any((t) => t == widget.tab.booruHandler.booru.type);

                        return PreloadPageView.builder(
                          controller: controller,
                          preloadPagesCount: preloadCount,
                          // allowImplicitScrolling: true,
                          scrollDirection: settingsHandler.galleryScrollDirection == 'Vertical'
                              ? Axis.vertical
                              : Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics(parent: ClampingScrollPhysics()),
                          itemCount: widget.tab.booruHandler.filteredFetched.length,
                          itemBuilder: (context, index) {
                            final BooruItem item = widget.tab.booruHandler.filteredFetched[index];
                            // String fileURL = item.fileURL;
                            final bool isVideo = item.mediaType.value.isVideo;
                            final bool isImage = item.mediaType.value.isImageOrAnimation;
                            final bool isNeedToGuess = item.mediaType.value.isNeedToGuess;
                            final bool isNeedToLoadItem =
                                item.mediaType.value.isNeedToLoadItem && widget.tab.booruHandler.hasLoadItemSupport;
                            // print(fileURL);
                            // print('isVideo: '+isVideo.toString());

                            late Widget itemWidget;
                            if (isImage) {
                              itemWidget = ValueListenableBuilder(
                                valueListenable: page,
                                builder: (_, page, _) {
                                  return ImageViewer(
                                    item,
                                    booru: widget.tab.booruHandler.booru,
                                    isViewed: page == index,
                                    key: item.key,
                                  );
                                },
                              );
                            } else if (isVideo) {
                              if (!settingsHandler.disableVideo &&
                                  (Platform.isAndroid || Platform.isIOS || Platform.isWindows || Platform.isLinux)) {
                                itemWidget = ValueListenableBuilder(
                                  valueListenable: page,
                                  builder: (_, page, _) {
                                    return VideoViewer(
                                      item,
                                      booru: widget.tab.booruHandler.booru,
                                      isViewed: page == index,
                                      enableFullscreen: true,
                                      key: item.key,
                                    );
                                  },
                                );
                              } else {
                                itemWidget = VideoViewerPlaceholder(
                                  item: item,
                                  booru: widget.tab.booruHandler.booru,
                                  key: item.key,
                                );
                              }
                            } else if (isNeedToGuess) {
                              itemWidget = GuessExtensionViewer(
                                item: item,
                                booru: widget.tab.booruHandler.booru,
                                onMediaTypeGuessed: (MediaType mediaType) {
                                  item.mediaType.value = mediaType;
                                  item.possibleMediaType.value = mediaType.isUnknown
                                      ? item.possibleMediaType.value
                                      : null;
                                  setState(() {});
                                },
                                key: item.key,
                              );
                            } else if (isNeedToLoadItem) {
                              itemWidget = LoadItemViewer(
                                item: item,
                                handler: widget.tab.booruHandler,
                                onItemLoaded: (newItem) {
                                  widget.tab.booruHandler.filteredFetched[index] = newItem;
                                  setState(() {});
                                },
                                key: item.key,
                              );
                            } else {
                              itemWidget = GuessExtensionViewer(
                                item: item,
                                booru: widget.tab.booruHandler.booru,
                                onMediaTypeGuessed: (MediaType mediaType) {
                                  item.mediaType.value = mediaType;
                                  item.possibleMediaType.value = mediaType.isUnknown
                                      ? item.possibleMediaType.value
                                      : null;
                                  setState(() {});
                                },
                                key: item.key,
                              );
                              // itemWidget = UnknownViewerPlaceholder(item: item, key: item.key,);
                            }

                            final child = ValueListenableBuilder(
                              valueListenable: viewerHandler.activeViewers,
                              builder: (_, activeViewers, _) {
                                return ValueListenableBuilder(
                                  valueListenable: page,
                                  builder: (context, page, child) {
                                    final bool isViewed = index == page;
                                    final int distanceFromCurrent = (page - index).abs();
                                    // don't render more than 3 videos at once, chance to crash is too high otherwise
                                    // disabled video preload for sankaku because their videos cause crashes if loading/rendering(?) more than one at a time
                                    final bool isNear =
                                        distanceFromCurrent <=
                                        (isVideo ? (isSankaku ? 0 : min(preloadCount, 1)) : preloadCount);

                                    final viewerIndex = widget.key is GlobalKey
                                        ? viewerHandler.indexOfViewer(widget.key! as GlobalKey)
                                        : -1;
                                    final bool isViewerTooDeep = activeViewers.length > ViewerHandler.maxActiveViewers
                                        ? (viewerIndex != -1 &&
                                              viewerIndex < (activeViewers.length - 1 - ViewerHandler.maxActiveViewers))
                                        : false;

                                    return AnimatedSwitcher(
                                      duration: const Duration(milliseconds: 100),
                                      child: (isViewerTooDeep || (!isViewed && !isNear))
                                          ? Center(child: Container(color: Colors.black))
                                          : child,
                                    );
                                  },
                                  child: ClipRect(
                                    // Stack/Buttons Temp fix for desktop pageview only scrollable on like 2px at edges of screen. Think its a windows only bug
                                    child: GestureDetector(
                                      onTap: () => viewerHandler.toggleToolbar(false),
                                      onLongPress: () => viewerHandler.toggleToolbar(true),
                                      child: AnimatedSwitcher(
                                        duration: const Duration(milliseconds: 100),
                                        child: itemWidget,
                                      ),
                                    ),
                                  ),
                                );
                              },
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
                                  settingsHandler.galleryScrollDirection == 'Vertical'
                                      ? Axis.vertical
                                      : Axis.horizontal,
                                  index,
                                  child,
                                );
                              },
                              child: child,
                            );
                          },
                          onPageChanged: (int index) {
                            page.value = index;
                            widget.onPageChanged?.call(index);
                            ServiceHandler.disableSleep();

                            kbFocusNode.requestFocus();

                            final item = widget.tab.booruHandler.filteredFetched[index];

                            viewerHandler.setCurrent(item.key);

                            final bool isVolumeAllowed =
                                !settingsHandler.useVolumeButtonsForScroll || viewerHandler.displayAppbar.value;
                            ServiceHandler.setVolumeButtons(isVolumeAllowed);
                          },
                        );
                      }),
                    ),
                    ValueListenableBuilder(
                      valueListenable: dismissProgress,
                      builder: (context, dismissProgress, child) {
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: dismissProgress == 0 ? child : const SizedBox.shrink(),
                        );
                      },
                      child: ValueListenableBuilder(
                        valueListenable: page,
                        builder: (context, page, child) {
                          return NotesRenderer(
                            item: widget.tab.booruHandler.filteredFetched[page],
                            handler: widget.tab.booruHandler,
                            pageController: controller,
                          );
                        },
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: dismissProgress,
                      builder: (context, dismissProgress, child) {
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: dismissProgress == 0 ? child : const SizedBox.shrink(),
                        );
                      },
                      child: GalleryButtons(pageController: controller),
                    ),
                    const ViewerTutorial(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      endDrawerEnableOpenDragGesture: false,
      onEndDrawerChanged: (isOpened) {
        // if (!isOpened) {
        //   final item = widget.tab.booruHandler.filteredFetched[page.value];
        //   viewerHandler.setCurrent(item.key);
        // }
      },
      endDrawer: RepaintBoundary(
        child: Theme(
          data: Theme.of(context).copyWith(
            // copy existing main app theme, but make background semitransparent
            drawerTheme: Theme.of(context).drawerTheme.copyWith(
              backgroundColor: Theme.of(context).canvasColor.withValues(alpha: 0.66),
            ),
          ),
          child: SizedBox(
            width: maxDrawerWidth,
            child: Drawer(
              width: maxDrawerWidth,
              child: SafeArea(
                child: ValueListenableBuilder(
                  valueListenable: page,
                  builder: (context, page, child) {
                    return TagView(
                      item: widget.tab.booruHandler.filteredFetched[page],
                      handler: widget.tab.booruHandler,
                    );
                  },
                ),
              ),
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
