import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:photo_view/photo_view.dart';
import 'package:preload_page_view/preload_page_view.dart';

import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/booru_handler_factory.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/pages/gallery_view_page.dart';
import 'package:lolisnatcher/src/widgets/image/image_viewer.dart';
import 'package:lolisnatcher/src/widgets/video/guess_extension_viewer.dart';
import 'package:lolisnatcher/src/widgets/video/load_item_viewer.dart';
import 'package:lolisnatcher/src/widgets/video/video_viewer.dart';
import 'package:lolisnatcher/src/widgets/video/video_viewer_placeholder.dart';

class ItemViewerPage extends StatefulWidget {
  const ItemViewerPage({
    required this.items,
    required this.initialIndex,
    required this.booru,
    super.key,
  });

  final List<BooruItem> items;
  final int initialIndex;
  final Booru booru;

  @override
  State<ItemViewerPage> createState() => _ItemViewerPageState();
}

class _ItemViewerPageState extends State<ItemViewerPage> {
  late final List<BooruItem> items;
  late final PreloadPageController controller;
  final ValueNotifier<int> page = ValueNotifier(0);

  @override
  void initState() {
    super.initState();

    items = widget.items;
    controller = PreloadPageController(initialPage: widget.initialIndex);
    page.value = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final ViewerHandler viewerHandler = ViewerHandler.instance;

    final int preloadCount = settingsHandler.preloadCount;
    final bool isSankaku = [
      BooruType.Sankaku,
      BooruType.IdolSankaku,
    ].any((t) => t == widget.booru.type);

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: settingsHandler.galleryBarPosition == 'Top' ? _ItemViewerAppBar(items, page) : null,
      bottomNavigationBar: settingsHandler.galleryBarPosition == 'Bottom' ? _ItemViewerAppBar(items, page) : null,
      // backgroundColor: Colors.transparent,
      body: PhotoViewGestureDetectorScope(
        axis: Axis.values,
        child: Dismissible(
          direction: settingsHandler.galleryScrollDirection == 'Vertical'
              ? DismissDirection.horizontal
              : DismissDirection.vertical,
          key: const Key('viewerPageDismissibleKey'),
          resizeDuration: null,
          dismissThresholds: const {
            DismissDirection.up: 0.2,
            DismissDirection.down: 0.2,
            DismissDirection.startToEnd: 0.3,
            DismissDirection.endToStart: 0.3,
          },
          onDismissed: (_) => Navigator.of(context).pop(),
          child: PreloadPageView.builder(
            controller: controller,
            preloadPagesCount: preloadCount,
            scrollDirection: settingsHandler.galleryScrollDirection == 'Vertical' ? Axis.vertical : Axis.horizontal,
            physics: const AlwaysScrollableScrollPhysics(parent: ClampingScrollPhysics()),
            itemCount: items.length,
            onPageChanged: (newPage) {
              page.value = newPage;
            },
            itemBuilder: (context, index) {
              final BooruItem item = items[index];

              final bool isVideo = item.mediaType.value.isVideo;
              final bool isImage = item.mediaType.value.isImageOrAnimation;
              final bool isNeedToGuess = item.mediaType.value.isNeedToGuess;

              final booruHandler = BooruHandlerFactory().getBooruHandler([widget.booru], 20)[0] as BooruHandler;
              final bool isNeedToLoadItem = item.mediaType.value.isNeedToLoadItem && booruHandler.hasLoadItemSupport;

              late Widget itemWidget;
              if (isImage) {
                itemWidget = ValueListenableBuilder(
                  valueListenable: page,
                  builder: (context, page, child) {
                    return ImageViewer(
                      item,
                      booru: widget.booru,
                      isViewed: page == index,
                      key: item.key,
                    );
                  },
                );
              } else if (isVideo) {
                if (settingsHandler.disableVideo) {
                  itemWidget = const Center(
                    child: Text('Video Disabled', style: TextStyle(fontSize: 20)),
                  );
                } else {
                  if (Platform.isAndroid || Platform.isIOS || Platform.isWindows || Platform.isLinux) {
                    itemWidget = ValueListenableBuilder(
                      valueListenable: page,
                      builder: (context, page, child) {
                        return VideoViewer(
                          item,
                          booru: widget.booru,
                          isViewed: page == index,
                          enableFullscreen: true,
                          key: item.key,
                        );
                      },
                    );
                  } else {
                    itemWidget = VideoViewerPlaceholder(item: item);
                  }
                }
              } else if (isNeedToGuess) {
                itemWidget = GuessExtensionViewer(
                  item: item,
                  onMediaTypeGuessed: (MediaType mediaType) {
                    item.mediaType.value = mediaType;
                    item.possibleMediaType.value = mediaType.isUnknown ? item.possibleMediaType.value : null;
                    setState(() {});
                  },
                );
              } else if (isNeedToLoadItem) {
                itemWidget = LoadItemViewer(
                  item: item,
                  handler: booruHandler,
                  onItemLoaded: (newItem) {
                    items[index] = newItem;
                    setState(() {});
                  },
                );
              } else {
                itemWidget = GuessExtensionViewer(
                  item: item,
                  onMediaTypeGuessed: (MediaType mediaType) {
                    item.mediaType.value = mediaType;
                    item.possibleMediaType.value = mediaType.isUnknown ? item.possibleMediaType.value : null;
                    setState(() {});
                  },
                );
                // itemWidget = UnknownViewerPlaceholder(item: item);
              }

              final child = ValueListenableBuilder(
                valueListenable: page,
                builder: (context, page, child) {
                  final bool isViewed = index == page;
                  final int distanceFromCurrent = (page - index).abs();
                  // don't render more than 3 videos at once, chance to crash is too high otherwise
                  // disabled video preload for sankaku because their videos cause crashes if loading/rendering(?) more than one at a time
                  final bool isNear =
                      distanceFromCurrent <= (isVideo ? (isSankaku ? 0 : min(preloadCount, 1)) : preloadCount);
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
          ),
        ),
      ),
    );
  }
}

class _ItemViewerAppBar extends StatefulWidget implements PreferredSizeWidget {
  const _ItemViewerAppBar(
    this.items,
    this.page,
  );

  final List<BooruItem> items;
  final ValueNotifier<int> page;

  double get defaultHeight => kToolbarHeight; // 56

  @override
  Size get preferredSize => Size.fromHeight(defaultHeight);

  @override
  State<_ItemViewerAppBar> createState() => _ItemViewerAppBarState();
}

class _ItemViewerAppBarState extends State<_ItemViewerAppBar> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final ViewerHandler viewerHandler = ViewerHandler.instance;

  bool isOnTop = true;

  @override
  void initState() {
    super.initState();

    isOnTop = settingsHandler.galleryBarPosition == 'Top';

    ServiceHandler.setSystemUiVisibility(!settingsHandler.autoHideImageBar);
    viewerHandler.displayAppbar.value = !settingsHandler.autoHideImageBar;

    viewerHandler.displayAppbar.addListener(appbarListener);
  }

  void appbarListener() {
    ServiceHandler.setSystemUiVisibility(viewerHandler.displayAppbar.value);
    setState(() {});
  }

  @override
  void dispose() {
    viewerHandler.displayAppbar.removeListener(appbarListener);
    ServiceHandler.setSystemUiVisibility(true);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double extraPadding = isOnTop ? 0 : MediaQuery.paddingOf(context).bottom;

    return Material(
      color: Colors.transparent,
      elevation: 1,
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.black54,
      surfaceTintColor: Colors.transparent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
        color: Colors.transparent,
        height: viewerHandler.displayAppbar.value ? (isOnTop ? null : (widget.defaultHeight + extraPadding)) : 0,
        padding: isOnTop ? null : EdgeInsets.only(bottom: extraPadding),
        child: ValueListenableBuilder(
          valueListenable: widget.page,
          builder: (context, page, child) {
            return ValueListenableBuilder(
              valueListenable: widget.items[page].mediaType,
              builder: (context, type, _) {
                return AppBar(
                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        type.isVideo
                            ? 'Video'
                            : type.isImageOrAnimation
                            ? 'Image'
                            : 'Viewer',
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${page + 1}/${widget.items.length}',
                        // dimmer text color
                        style: const TextStyle(
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  ),
                  actions: const [
                    // TODO?
                  ],
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  titleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
