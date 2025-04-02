import 'dart:async';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:preload_page_view/preload_page_view.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/utils/html_parse.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/common/transparent_pointer.dart';

class NotesRenderer extends StatefulWidget {
  const NotesRenderer(this.pageController, {super.key});
  final PreloadPageController? pageController;

  @override
  State<NotesRenderer> createState() => _NotesRendererState();
}

class _NotesRendererState extends State<NotesRenderer> {
  final SearchHandler searchHandler = SearchHandler.instance;
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final ViewerHandler viewerHandler = ViewerHandler.instance;

  late BooruItem item;
  late double screenWidth,
      screenHeight,
      screenRatio,
      imageWidth,
      imageHeight,
      imageRatio,
      screenToImageRatio,
      offsetX,
      offsetY,
      viewOffsetX,
      viewOffsetY,
      pageOffset,
      resizeScale;
  bool loading = false, shouldScale = false;

  CancelToken? cancelToken;
  final List<NoteBuild> notesMap = [];

  bool get currentItemHasNotes => item.fileURL.isNotEmpty && searchHandler.currentBooruHandler.hasNotesSupport && item.hasNotes == true;

  @override
  void initState() {
    super.initState();

    shouldScale = settingsHandler.galleryMode == 'Sample' || !settingsHandler.disableImageScaling;
    resizeScale = 1;
    screenToImageRatio = 1;

    screenWidth = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;
    screenHeight = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.height;
    screenRatio = screenWidth / screenHeight;

    item = searchHandler.viewedItem.value;
    doCalculations(); // trigger calculations on init even if there is no item to init all values
    loadNotes();
    searchHandler.viewedItem.addListener(itemListener);

    viewerHandler.viewState.addListener(viewStateListener);

    widget.pageController?.addListener(triggerCalculations);
  }

  void updateState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  void itemListener() {
    // TODO doesn't trigger for the first item after changing tabs on desktop
    item = searchHandler.viewedItem.value;
    notesMap.clear();
    updateState();
    if (cancelToken != null && !cancelToken!.isCancelled) {
      cancelToken!.cancel();
    }
    loadNotes();
  }

  void viewStateListener() {
    triggerCalculations();
  }

  @override
  void dispose() {
    cancelToken?.cancel();
    widget.pageController?.removeListener(triggerCalculations);
    searchHandler.viewedItem.removeListener(itemListener);
    viewerHandler.viewState.removeListener(viewStateListener);
    super.dispose();
  }

  Future<void> loadNotes() async {
    if (!currentItemHasNotes) {
      loading = false;
      updateState();
      return;
    }

    if (loading) {
      return;
    }
    loading = true;
    updateState();

    if (cancelToken != null && !cancelToken!.isCancelled) {
      cancelToken!.cancel();
    }
    cancelToken = CancelToken();
    item.notes.value = await searchHandler.currentBooruHandler.getNotes(
      item.serverId!,
      cancelToken: cancelToken,
    );
    cancelToken = null;

    triggerCalculations();

    rebuildNotesMap();

    loading = false;
    updateState();
  }

  void rebuildNotesMap() {
    // cache notes widgets
    notesMap.clear();

    final scale = resizeScale * screenToImageRatio;

    for (int i = 0; i < item.notes.length; i++) {
      final note = item.notes[i];
      notesMap.add(
        NoteBuild(
          text: note.content,
          width: note.width * scale,
          height: note.height * scale,
        ),
      );
    }
  }

  void triggerCalculations() {
    if (!currentItemHasNotes) {
      return;
    }

    doCalculations();
    updateState();
  }

  void doCalculations() {
    final prevResizeScale = resizeScale, prevScreenToImageRatio = screenToImageRatio;

    // do the calculations depending on the current item here
    imageWidth = viewerHandler.viewState.value?.scaleBoundaries?.childSize.width ?? item.fileWidth ?? screenWidth;
    imageHeight = viewerHandler.viewState.value?.scaleBoundaries?.childSize.height ?? item.fileHeight ?? screenHeight;
    imageRatio = imageWidth / imageHeight;

    resizeScale = 1;
    if (shouldScale && item.fileWidth != null && item.fileHeight != null && imageWidth != 0 && imageHeight != 0) {
      resizeScale = imageWidth / item.fileWidth!;
    }

    final viewScale = viewerHandler.viewState.value?.scale;
    screenToImageRatio = viewScale ?? (screenRatio > imageRatio ? (screenWidth / imageWidth) : (screenHeight / imageHeight));

    final bool isVertical = settingsHandler.galleryScrollDirection == 'Vertical';
    final bool isUsingCustomAnim = !settingsHandler.disableCustomPageTransitions;

    final double page = widget.pageController?.hasClients == true ? (widget.pageController!.page ?? 0) : 0;
    pageOffset = ((page * 10000).toInt() % 10000) / 10000;
    pageOffset = pageOffset > 0.5 ? (1 - pageOffset) : (0 - pageOffset);

    offsetX = (screenWidth / 2) - (imageWidth / 2 * screenToImageRatio);
    offsetX = isVertical ? offsetX : (offsetX + (pageOffset * screenWidth / (isUsingCustomAnim ? 2 : 1)));

    offsetY = (screenHeight / 2) - (imageHeight / 2 * screenToImageRatio);
    offsetY = isVertical ? (offsetY + (pageOffset * screenHeight / (isUsingCustomAnim ? 2 : 1))) : offsetY;

    viewOffsetX = viewerHandler.viewState.value?.position.dx ?? 0;
    viewOffsetY = viewerHandler.viewState.value?.position.dy ?? 0;

    if (prevResizeScale != resizeScale || prevScreenToImageRatio != screenToImageRatio) {
      rebuildNotesMap();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (screenWidth != constraints.maxWidth || screenHeight != constraints.maxHeight) {
            screenWidth = constraints.maxWidth;
            screenHeight = constraints.maxHeight;
            screenRatio = screenWidth / screenHeight;
            triggerCalculations();
          }

          return Obx(() {
            if (!viewerHandler.isLoaded.value || !viewerHandler.showNotes.value || !currentItemHasNotes) {
              return const SizedBox.shrink();
            } else {
              final scale = resizeScale * screenToImageRatio;
              final totalOffsetX = offsetX + viewOffsetX;
              final totalOffsetY = offsetY + viewOffsetY;

              return Stack(
                children: [
                  if (loading)
                    Positioned(
                      left: 60,
                      top: kToolbarHeight * 1.5,
                      child: GestureDetector(
                        onTap: () async {
                          if (cancelToken != null && !cancelToken!.isCancelled) {
                            cancelToken!.cancel();
                          }
                          await Future.delayed(const Duration(milliseconds: 100));
                          await loadNotes();
                        },
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              const RepaintBoundary(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                              Icon(
                                Icons.note_add,
                                size: 18,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  else
                    ...item.notes.map((note) {
                      return AnimatedPositioned(
                        duration: const Duration(milliseconds: 10),
                        left: (note.posX * scale) + totalOffsetX,
                        top: (note.posY * scale) + totalOffsetY,
                        child: notesMap[item.notes.indexOf(note)],
                      );
                    }),
                ],
              );
            }
          });
        },
      ),
    );
  }
}

class NoteBuild extends StatefulWidget {
  const NoteBuild({
    required this.text,
    required this.width,
    required this.height,
    super.key,
  });

  final String? text;
  final double width;
  final double height;

  @override
  State<NoteBuild> createState() => _NoteBuildState();
}

class _NoteBuildState extends State<NoteBuild> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    // TODO don't render when box is out of the screen
    // final screen = MediaQuery.sizeOf(context);
    // if (widget.left < (0 - widget.width - 30) ||
    //     widget.top < (0 - widget.height - 30) ||
    //     widget.left > (screen.width + 30) ||
    //     widget.top > (screen.height + 30)) {
    //   return const SizedBox.shrink();
    // }

    return TransparentPointer(
      child: GestureDetector(
        onLongPressStart: (details) {
          setState(() {
            isVisible = false;
          });
        },
        onLongPressEnd: (details) {
          setState(() {
            isVisible = true;
          });
        },
        onLongPressCancel: () {
          setState(() {
            isVisible = true;
          });
        },
        onTap: () {
          FlashElements.showSnackbar(
            title: const Text('Note'),
            content: Text.rich(
              parse(
                widget.text ?? '',
                const TextStyle(
                  fontSize: 14,
                ),
                false,
              ),
              overflow: TextOverflow.fade,
            ),
            duration: null,
            sideColor: Colors.blue,
            shouldLeadingPulse: false,
            asDialog: true,
          );
        },
        behavior: HitTestBehavior.translucent,
        child: AnimatedOpacity(
          opacity: isVisible ? 1 : 0,
          duration: const Duration(milliseconds: 100),
          child: _NoteBuildContent(
            text: widget.text,
            width: widget.width,
            height: widget.height,
          ),
        ),
      ),
    );
  }
}

class _NoteBuildContent extends StatelessWidget {
  const _NoteBuildContent({
    required this.text,
    required this.width,
    required this.height,
  });

  final String? text;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFFFFF300).withValues(alpha: 0.25),
          borderRadius: BorderRadius.circular(2),
          border: Border.all(
            width: 1,
            color: const Color(0xFFFFF176).withValues(alpha: 0.5),
          ),
        ),
        child: (width > 30 && height > 30) // don't show if too small
            ? Padding(
                padding: const EdgeInsets.all(1),
                child: Text.rich(
                  parse(
                    text ?? '',
                    const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    true,
                  ),
                  overflow: TextOverflow.fade,
                ),
              )
            : null,
      ),
    );
  }
}

class NotesDialog extends StatelessWidget {
  const NotesDialog(
    this.item, {
    super.key,
  });

  final BooruItem item;

  @override
  Widget build(BuildContext context) {
    return SettingsDialog(
      title: const Text('Notes'),
      content: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Material(
          color: Colors.transparent,
          child: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemCount: item.notes.length,
              itemBuilder: (context, index) {
                final note = item.notes[index];
                return ListTile(
                  title: Text.rich(
                    parse(
                      note.content ?? '',
                      const TextStyle(
                        fontSize: 14,
                      ),
                      false,
                    ),
                  ),
                  subtitle: Text('X:${note.posX}, Y:${note.posY}'),
                  shape: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade600,
                      width: 1,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      contentPadding: const EdgeInsets.all(12),
      // titlePadding: const EdgeInsets.fromLTRB(6, 18, 2, 6),
      // insetPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      scrollable: false,
      actionButtons: const [
        CancelButton(
          text: 'Close',
          withIcon: true,
        ),
      ],
    );
  }
}
