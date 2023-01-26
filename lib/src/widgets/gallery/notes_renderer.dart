import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:preload_page_view/preload_page_view.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/note_item.dart';
import 'package:lolisnatcher/src/handlers/navigation_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/utils/debouncer.dart';
import 'package:lolisnatcher/src/utils/html_parse.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/common/transparent_pointer.dart';

class NotesRenderer extends StatefulWidget {
  const NotesRenderer(this.pageController, {Key? key}) : super(key: key);
  final PreloadPageController? pageController;

  @override
  State<NotesRenderer> createState() => _NotesRendererState();
}

class _NotesRendererState extends State<NotesRenderer> {
  final SearchHandler searchHandler = SearchHandler.instance;
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final ViewerHandler viewerHandler = ViewerHandler.instance;
  final NavigationHandler navigationHandler = NavigationHandler.instance;

  late BooruItem item;
  late double screenWidth,
      screenHeight,
      screenRatio,
      imageWidth,
      imageHeight,
      imageRatio,
      ratioDiff,
      widthLimit,
      viewScale,
      screenToImageRatio,
      offsetX,
      offsetY,
      viewOffsetX,
      viewOffsetY,
      pageOffset;
  bool loading = false;

  StreamSubscription<BooruItem>? itemListener;
  StreamSubscription? viewStateListener;

  @override
  void initState() {
    super.initState();

    screenWidth = WidgetsBinding.instance.window.physicalSize.width;
    screenHeight = WidgetsBinding.instance.window.physicalSize.height;
    screenRatio = screenWidth / screenHeight;

    item = searchHandler.viewedItem.value;
    doCalculations(); // trigger calculations on init even if there is no item to init all values
    loadNotes();
    itemListener = searchHandler.viewedItem.listen((BooruItem item) {
      // TODO doesn't trigger for the first item after changing tabs on desktop
      this.item = item;
      updateState();
      loadNotes();
    });

    viewStateListener = viewerHandler.viewState.listen((viewState) {
      // TODO when second double tap zoom scale is entered - no state sent?
      triggerCalculations();
    });

    widget.pageController?.addListener(() {
      triggerCalculations();
    });
  }

  void updateState() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    itemListener?.cancel();
    viewStateListener?.cancel();
    Debounce.cancel('notes_calculations');
    super.dispose();
  }

  void loadNotes() async {
    final handler = searchHandler.currentBooruHandler;
    final bool hasSupport = handler.hasNotesSupport;
    final bool hasNotes = item.hasNotes == true;
    // final bool alreadyLoaded = item.notes.isNotEmpty;

    if (item.fileURL.isEmpty || !hasSupport || !hasNotes) {
      loading = false;
      updateState();
      return;
    }

    if(loading) {
      return;
    }
    loading = true;

    item.notes.value = await searchHandler.currentBooruHandler.getNotes(item.serverId!);

    triggerCalculations();

    loading = false;
    updateState();
  }

  void triggerCalculations() {
    // debounce to prevent unnecessary calculations, especially when resizing
    // lessens the impact on performance, but causes notes to be a bit shake-ey when resizing
    Debounce.delay(
      tag: 'notes_calculations',
      callback: () {
        doCalculations();
        updateState();
      },
      duration: const Duration(milliseconds: 50),
    );
  }

  void doCalculations() {
    // do the calculations depending on the current item here
    imageWidth = item.fileWidth ?? 100;
    imageHeight = item.fileHeight ?? 100;
    imageRatio = imageWidth / imageHeight;

    ratioDiff = 1;
    widthLimit = 0;
    if (settingsHandler.disableImageScaling || item.isNoScale.value || item.isAnimation) {
      //  do nothing
    } else {
      Size screenSize = WidgetsBinding.instance.window.physicalSize;
      double pixelRatio = WidgetsBinding.instance.window.devicePixelRatio;
      // image size can change if scaling is allowed and it's size is too big
      widthLimit = screenSize.width * pixelRatio * 2;
      if (imageWidth > widthLimit) {
        ratioDiff = widthLimit / imageWidth;
        imageWidth = widthLimit;
        imageHeight = imageHeight * ratioDiff;
      }
    }

    viewScale = viewerHandler.viewState.value.scale ?? 1;
    screenToImageRatio = viewScale == 1 ? (screenRatio > imageRatio ? (screenWidth / imageWidth) : (screenHeight / imageHeight)) : viewScale;

    pageOffset = (((widget.pageController?.page ?? 0) * 10000).toInt() % 10000) / 10000;
    pageOffset = pageOffset > 0.5 ? (1 - pageOffset) : (0 - pageOffset);
    bool isVertical = settingsHandler.galleryScrollDirection == 'Vertical';

    offsetX = (screenWidth / 2) - (imageWidth / 2 * screenToImageRatio);
    offsetX = isVertical ? offsetX : (offsetX + (pageOffset * screenWidth));

    offsetY = (screenHeight / 2) - (imageHeight / 2 * screenToImageRatio);
    offsetY = isVertical ? (offsetY + (pageOffset * screenHeight)) : offsetY;

    viewOffsetX = viewerHandler.viewState.value.position.dx;
    viewOffsetY = viewerHandler.viewState.value.position.dy;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      if (screenWidth != constraints.maxWidth || screenHeight != constraints.maxHeight) {
        screenWidth = constraints.maxWidth;
        screenHeight = constraints.maxHeight;
        screenRatio = screenWidth / screenHeight;
        triggerCalculations();
      }

      return Obx(() {
        if (!viewerHandler.isLoaded.value || !viewerHandler.showNotes.value || item.fileURL.isEmpty) {
          return const SizedBox();
        } else {
          return Stack(
            children: [
              if (loading)
                Positioned(
                  left: 60,
                  top: kToolbarHeight * 1.5,
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                        Icon(
                          Icons.note_add,
                          size: 18,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ],
                    ),
                  ),
                )
              else
                // TODO change to animated transform?
                ...item.notes.map((note) => NoteBuild(
                      text: note.content,
                      left: (note.posX * screenToImageRatio * ratioDiff) + offsetX + viewOffsetX,
                      top: (note.posY * screenToImageRatio * ratioDiff) + offsetY + viewOffsetY,
                      width: note.width * screenToImageRatio * ratioDiff,
                      height: note.height * screenToImageRatio * ratioDiff,
                    )),
            ],
          );
        }
      });
    });
  }
}

class NoteBuild extends StatefulWidget {
  const NoteBuild({
    Key? key,
    required this.text,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String? text;
  final double left;
  final double top;
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
    // final screen = MediaQuery.of(context).size;
    // if (widget.left < (0 - widget.width - 30) ||
    //     widget.top < (0 - widget.height - 30) ||
    //     widget.left > (screen.width + 30) ||
    //     widget.top > (screen.height + 30)) {
    //   return const SizedBox.shrink();
    // }

    return Positioned(
      left: widget.left,
      top: widget.top,
      child: TransparentPointer(
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
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF300).withOpacity(0.25),
                borderRadius: BorderRadius.circular(2),
                border: Border.all(
                  color: const Color(0xFFFFF176).withOpacity(0.5),
                ),
              ),
              child: (widget.width > 30 && widget.height > 30) // don't show if too small
                  ? Text.rich(
                      parse(
                        widget.text ?? '',
                        const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        true,
                      ),
                      overflow: TextOverflow.fade,
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}

class NotesDialog extends StatelessWidget {
  final BooruItem item;
  const NotesDialog(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsDialog(
      title: const Text('Notes'),
      content: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Material(
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
                  subtitle: Text('X:${note.posX}/${item.fileWidth!.round()}, Y:${note.posY}/${item.fileHeight!.round()}'),
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
      actionButtons: [
        ElevatedButton(
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}
