import 'dart:io';

import 'package:flutter/material.dart';

import 'package:photo_view/photo_view.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/booru_handler_factory.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/widgets/image/image_viewer.dart';
import 'package:lolisnatcher/src/widgets/video/guess_extension_viewer.dart';
import 'package:lolisnatcher/src/widgets/video/load_item_viewer.dart';
import 'package:lolisnatcher/src/widgets/video/video_viewer.dart';
import 'package:lolisnatcher/src/widgets/video/video_viewer_placeholder.dart';

class ItemViewerPage extends StatefulWidget {
  const ItemViewerPage({
    required this.item,
    required this.booru,
    super.key,
  });

  final BooruItem item;
  final Booru booru;

  @override
  State<ItemViewerPage> createState() => _ItemViewerPageState();
}

class _ItemViewerPageState extends State<ItemViewerPage> {
  late BooruItem _item;

  @override
  void initState() {
    super.initState();

    _item = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final ViewerHandler viewerHandler = ViewerHandler.instance;

    final PreferredSizeWidget appBar = _ItemViewerAppBar(_item);

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: settingsHandler.galleryBarPosition == 'Top' ? appBar : null,
      bottomNavigationBar: settingsHandler.galleryBarPosition == 'Bottom' ? appBar : null,
      backgroundColor: Colors.transparent,
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
          child: Center(
            child: ValueListenableBuilder(
              valueListenable: _item.mediaType,
              builder: (context, mediaType, child) {
                final bool isVideo = mediaType.isVideo;
                final bool isImage = mediaType.isImageOrAnimation;
                final bool isNeedToGuess = mediaType.isNeedToGuess;

                final booruHandler = BooruHandlerFactory().getBooruHandler([widget.booru], 20)[0] as BooruHandler;
                final bool isNeedToLoadItem = mediaType.isNeedToLoadItem && booruHandler.hasLoadItemSupport;

                late Widget itemWidget;
                if (isImage) {
                  itemWidget = ImageViewer(_item, isStandalone: true, key: _item.key);
                } else if (isVideo) {
                  if (settingsHandler.disableVideo) {
                    itemWidget = const Center(child: Text('Video Disabled', style: TextStyle(fontSize: 20)));
                  } else {
                    if (Platform.isAndroid || Platform.isIOS || Platform.isWindows || Platform.isLinux) {
                      itemWidget = VideoViewer(_item, isStandalone: true, enableFullscreen: true, key: _item.key);
                    } else {
                      itemWidget = VideoViewerPlaceholder(item: _item);
                    }
                  }
                } else if (isNeedToGuess) {
                  itemWidget = GuessExtensionViewer(
                    item: _item,
                    onMediaTypeGuessed: (MediaType mediaType) {
                      _item.mediaType.value = mediaType;
                      _item.possibleMediaType.value = mediaType.isUnknown ? _item.possibleMediaType.value : null;
                      setState(() {});
                    },
                  );
                } else if (isNeedToLoadItem) {
                  itemWidget = LoadItemViewer(
                    item: _item,
                    handler: booruHandler,
                    onItemLoaded: (newItem) {
                      _item = newItem;
                      setState(() {});
                    },
                  );
                } else {
                  itemWidget = GuessExtensionViewer(
                    item: _item,
                    onMediaTypeGuessed: (MediaType mediaType) {
                      _item.mediaType.value = mediaType;
                      _item.possibleMediaType.value = mediaType.isUnknown ? _item.possibleMediaType.value : null;
                      setState(() {});
                    },
                  );
                  // itemWidget = UnknownViewerPlaceholder(item: item);
                }

                return ClipRect(
                  child: GestureDetector(
                    onTap: () {
                      viewerHandler.toggleToolbar(false);
                    },
                    onLongPress: () {
                      viewerHandler.toggleToolbar(true);
                    },
                    child: itemWidget,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _ItemViewerAppBar extends StatefulWidget implements PreferredSizeWidget {
  const _ItemViewerAppBar(
    this.item,
  );

  final BooruItem item;

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
          valueListenable: widget.item.mediaType,
          builder: (context, type, _) {
            return AppBar(
              title: type.isVideo
                  ? const Text('Video')
                  : type.isImageOrAnimation
                  ? const Text('Image')
                  : const Text('Viewer'),
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
        ),
      ),
    );
  }
}
