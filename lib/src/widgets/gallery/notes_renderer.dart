import 'dart:async';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:preload_page_view/preload_page_view.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/utils/html_parse.dart';
import 'package:lolisnatcher/src/widgets/common/close_dialog_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/common/transparent_pointer.dart';

class NotesRenderer extends StatefulWidget {
  const NotesRenderer({
    required this.item,
    required this.handler,
    required this.pageController,
    super.key,
  });

  final BooruItem item;
  final BooruHandler handler;
  final PreloadPageController? pageController;

  @override
  State<NotesRenderer> createState() => _NotesRendererState();
}

class _NotesRendererState extends State<NotesRenderer> {
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

  bool get currentItemHasNotes => item.fileURL.isNotEmpty && widget.handler.hasNotesSupport && item.hasNotes == true;

  @override
  void initState() {
    super.initState();

    shouldScale = settingsHandler.galleryMode.isSample || !settingsHandler.disableImageScaling;
    resizeScale = 1;
    screenToImageRatio = 1;

    screenWidth = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;
    screenHeight = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.height;
    screenRatio = screenWidth / screenHeight;

    item = widget.item;
    doCalculations(); // trigger calculations on init even if there is no item to init all values
    loadNotes();

    viewerHandler.viewState.addListener(viewStateListener);

    widget.pageController?.addListener(triggerCalculations);
  }

  @override
  void didUpdateWidget(covariant NotesRenderer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.item != oldWidget.item) {
      itemListener();
    }
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
    item = widget.item;
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
    item.notes.value = await widget.handler.getNotes(
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

  void _resolveImageDimensions() {
    imageWidth = viewerHandler.viewState.value?.scaleBoundaries?.childSize.width ?? item.fileWidth ?? screenWidth;
    imageHeight = viewerHandler.viewState.value?.scaleBoundaries?.childSize.height ?? item.fileHeight ?? screenHeight;
    imageRatio = imageWidth / imageHeight;
  }

  void _computeScaling() {
    resizeScale = 1;
    if (shouldScale && item.fileWidth != null && item.fileHeight != null && imageWidth != 0 && imageHeight != 0) {
      resizeScale = imageWidth / item.fileWidth!;
    }
    final viewScale = viewerHandler.viewState.value?.scale;
    screenToImageRatio =
        viewScale ?? (screenRatio > imageRatio ? (screenWidth / imageWidth) : (screenHeight / imageHeight));
  }

  void _computeOffsets() {
    final bool isVertical = settingsHandler.galleryScrollDirection.isVertical;
    final bool isUsingCustomAnim = !settingsHandler.disableCustomPageTransitions;

    final double page = widget.pageController?.hasClients == true ? (widget.pageController!.page ?? 0) : 0;
    // Extract the sub-page fractional offset and map it to [-0.5, 0.5]
    // so that the note overlay tracks the image during horizontal/vertical page transitions.
    pageOffset = ((page * 10000).toInt() % 10000) / 10000;
    pageOffset = pageOffset > 0.5 ? (1 - pageOffset) : (0 - pageOffset);

    offsetX = (screenWidth / 2) - (imageWidth / 2 * screenToImageRatio);
    offsetX = isVertical ? offsetX : (offsetX + (pageOffset * screenWidth / (isUsingCustomAnim ? 2 : 1)));

    offsetY = (screenHeight / 2) - (imageHeight / 2 * screenToImageRatio);
    offsetY = isVertical ? (offsetY + (pageOffset * screenHeight / (isUsingCustomAnim ? 2 : 1))) : offsetY;

    viewOffsetX = viewerHandler.viewState.value?.position.dx ?? 0;
    viewOffsetY = viewerHandler.viewState.value?.position.dy ?? 0;
  }

  void doCalculations() {
    final prevResizeScale = resizeScale, prevScreenToImageRatio = screenToImageRatio;
    _resolveImageDimensions();
    _computeScaling();
    _computeOffsets();
    if (prevResizeScale != resizeScale || prevScreenToImageRatio != screenToImageRatio) {
      rebuildNotesMap();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: LayoutBuilder(
        builder: (context, constraints) {
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
                    ...List.generate(item.notes.length, (i) {
                      final note = item.notes[i];
                      final noteWidth = notesMap[i].width;
                      final noteHeight = notesMap[i].height;
                      final left = (note.posX * scale) + totalOffsetX;
                      final top = (note.posY * scale) + totalOffsetY;
                      // skip notes fully outside the visible area or notes with zero width/height
                      if (left < -noteWidth - 30 ||
                          top < -noteHeight - 30 ||
                          left > screenWidth + 30 ||
                          top > screenHeight + 30 ||
                          noteWidth == 0 ||
                          noteHeight == 0) {
                        return const Positioned(left: 0, top: 0, child: SizedBox.shrink());
                      }
                      return Positioned(
                        left: left,
                        top: top,
                        child: notesMap[i],
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
  bool isViewed = false, isColored = false, isVisible = true;
  late InlineSpan _parsedContent;
  late InlineSpan _parsedContentBordered;
  late InlineSpan _parsedContentColorless;

  @override
  void initState() {
    super.initState();
    _rebuildParsed();
  }

  void _rebuildParsed() {
    _parsedContent = parse(
      widget.text ?? '',
      style: const TextStyle(fontSize: 14),
    );
    _parsedContentBordered = parse(
      widget.text ?? '',
      style: const TextStyle(color: Colors.white, fontSize: 14),
      isBordered: true,
    );
    _parsedContentColorless = colorlessSpan(_parsedContent);
  }

  Future<void> openNoteDialog() async {
    setState(() {
      isViewed = true;
    });

    final res = await FlashElements.showSnackbar(
      title: Row(
        children: [
          Flexible(child: Text(context.loc.viewer.notes.note)),
          const SizedBox(width: 8),
          IconButton(
            icon: Icon(
              isColored ? Icons.color_lens : Icons.color_lens_outlined,
              size: 24,
            ),
            onPressed: () {
              setState(() {
                isColored = !isColored;
              });

              // pop(true) to avoid redrawing red border on the note when dialog reopens
              Navigator.of(context).pop(true);
              openNoteDialog();
            },
          ),
        ],
      ),
      content: Text.rich(isColored ? _parsedContentBordered : _parsedContentColorless),
      duration: null,
      sideColor: Colors.blue,
      shouldLeadingPulse: false,
      asDialog: true,
    );

    if (res != true) {
      setState(() {
        isViewed = false;
      });
    }
  }

  @override
  void didUpdateWidget(NoteBuild old) {
    super.didUpdateWidget(old);
    if (old.text != widget.text) {
      _rebuildParsed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TransparentPointer(
      child: GestureDetector(
        onLongPressStart: (_) {
          setState(() {
            isVisible = false;
          });
        },
        onLongPressEnd: (_) {
          setState(() {
            isVisible = true;
          });
        },
        onLongPressCancel: () {
          setState(() {
            isVisible = true;
          });
        },
        onTap: openNoteDialog,
        behavior: HitTestBehavior.translucent,
        child: AnimatedOpacity(
          opacity: isVisible ? 1 : 0,
          duration: const Duration(milliseconds: 100),
          child: _NoteBuildContent(
            parsedContent: _parsedContentBordered,
            width: widget.width,
            height: widget.height,
            isViewed: isViewed,
          ),
        ),
      ),
    );
  }
}

class _NoteBuildContent extends StatelessWidget {
  const _NoteBuildContent({
    required this.parsedContent,
    required this.width,
    required this.height,
    required this.isViewed,
  });

  final InlineSpan parsedContent;
  final double width;
  final double height;
  final bool isViewed;

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
            width: isViewed ? 4 : 1,
            color: isViewed ? Colors.red : const Color(0xFFFFF176).withValues(alpha: 0.5),
          ),
        ),
        child:
            (width > 30 && height > 30) // don't show if too small
            ? Padding(
                padding: const EdgeInsets.all(1),
                child: Text.rich(
                  parsedContent,
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
      title: Text(context.loc.viewer.notes.notes),
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
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  subtitle: Text(context.loc.viewer.notes.coordinates(posX: note.posX, posY: note.posY)),
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
        CloseDialogButton(withIcon: true),
      ],
    );
  }
}
