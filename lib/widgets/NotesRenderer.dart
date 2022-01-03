import 'dart:async';
// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ViewerHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/libBooru/NoteItem.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:LoliSnatcher/utilities/html_parse.dart';
import 'package:LoliSnatcher/widgets/TransparentPointer.dart';

class NotesRenderer extends StatefulWidget {
  NotesRenderer({Key? key}) : super(key: key);

  @override
  _NotesRendererState createState() => _NotesRendererState();
}

class _NotesRendererState extends State<NotesRenderer> {
  final SearchHandler searchHandler = Get.find<SearchHandler>();
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final ViewerHandler viewerHandler = Get.find<ViewerHandler>();

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
      viewOffsetY;
  Timer? debounceCalculations;
  bool loading = false;

  StreamSubscription<BooruItem>? itemListener;
  StreamSubscription? viewStateListener;

  @override
  void initState() {
    super.initState();

    screenWidth = Get.width;
    screenHeight = Get.height;
    screenRatio = screenWidth / screenHeight;

    item = searchHandler.viewedItem.value;
    doCalculations(); // trigger calculations on init even if there is no item to init all values
    loading = true;
    loadNotes();
    itemListener = searchHandler.viewedItem.listen((BooruItem item) {
      // TODO doesn't trigger for the first item after changing tabs on desktop
      // print('item changed to $item');
      this.item = item;
      loading = true;
      updateState();
      loadNotes();
    });

    viewStateListener = viewerHandler.viewState.listen((viewState) {
      // TODO when second double tap zoom scale is entered - no state sent?
      triggerCalculations();
    });
  }

  void updateState() {
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    itemListener?.cancel();
    viewStateListener?.cancel();
    debounceCalculations?.cancel();
    super.dispose();
  }

  void loadNotes() async {
    final handler = searchHandler.currentBooruHandler;
    final bool hasSupport = handler.hasNotesSupport;
    final bool hasNotes = item.hasNotes == true;
    final bool alreadyLoaded = item.notes.isNotEmpty;

    // print('Loading notes for ${item.fileURL} ${item.notes.length}');
    // print('hasSupport: $hasSupport hasNotes: $hasNotes alreadyLoaded: $alreadyLoaded');

    if (item.fileURL.isEmpty || !hasSupport || !hasNotes || alreadyLoaded) {
      loading = false;
      updateState();
      return;
    }

    item.notes.value = await searchHandler.currentBooruHandler.fetchNotes(item.serverId!);

    triggerCalculations();

    loading = false;
    updateState();
  }

  void triggerCalculations() {
    if (debounceCalculations != null && debounceCalculations?.isActive == true) {
      debounceCalculations!.cancel();
    }
    // debounce to prevent unnecessary calculations, especially when resizing
    // lessens the impact on performance, but causes notes to be a bit shake-ey when resizing
    debounceCalculations = Timer(Duration(milliseconds: 2), () {
      doCalculations();
      updateState();
    });
  }

  void doCalculations() {
    // do the calculations depending on the current item here
    // print('!!!DOING CALCULATIONS ${Random.secure().nextDouble()}!!!');
    imageWidth = item.fileWidth ?? 100;
    imageHeight = item.fileHeight ?? 100;
    imageRatio = imageWidth / imageHeight;

    ratioDiff = 1;
    widthLimit = 0;
    if (settingsHandler.disableImageScaling || item.isNoScale.value) {
      //  do nothing
    } else {
      // image size can change if scaling is allowed and it's size is too big
      widthLimit = Get.mediaQuery.size.width * Get.mediaQuery.devicePixelRatio * 2;
      if (imageWidth > widthLimit) {
        ratioDiff = widthLimit / imageWidth;
        imageWidth = widthLimit;
        imageHeight = imageHeight * ratioDiff;
      }
    }

    viewScale = viewerHandler.viewState.value.scale ?? 1;
    screenToImageRatio = viewScale == 1 ? (screenRatio > imageRatio ? (screenWidth / imageWidth) : (screenHeight / imageHeight)) : viewScale;

    offsetX = (screenWidth / 2) - (imageWidth / 2 * screenToImageRatio);
    offsetY = (screenHeight / 2) - (imageHeight / 2 * screenToImageRatio);

    viewOffsetX = viewerHandler.viewState.value.position.dx;
    viewOffsetY = viewerHandler.viewState.value.position.dy;
  }

  Widget buildNote(NoteItem note) {
    final double scaledX = (note.posX * screenToImageRatio * ratioDiff) + offsetX + viewOffsetX;
    final double scaledY = (note.posY * screenToImageRatio * ratioDiff) + offsetY + viewOffsetY;
    final double scaledWidth = note.width * screenToImageRatio * ratioDiff;
    final double scaledHeight = note.height * screenToImageRatio * ratioDiff;

    // TODO don't render when out of view
    // ...but is it really needed? that will add extra calculations...

    // print('sW:$screenWidth sH:$screenHeight iW:$imageWidth iH:$imageHeight iR:$imageRatio');
    // print('rD:$ratioDiff sTOiR:$screenToImageRatio oX:$offsetX oY:$offsetY t:${note.content}');
    // print('-------');

    if(loading) {
      return const SizedBox();
    }

    return NoteBuild(
      text: note.content,
      left: scaledX,
      top: scaledY,
      width: scaledWidth,
      height: scaledHeight,
    );
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
                        CircularProgressIndicator(
                          color: Get.theme.colorScheme.secondary,
                          strokeWidth: 2,
                        ),
                        Icon(
                          Icons.note_add,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ...item.notes.map((note) => buildNote(note)).toList(),
              // ...List.generate(
              //   5,
              //   (int index) => NoteItem(
              //     postID: 'fakeNote$index',
              //     content: 'fakeNote$index',
              //     posX: 100 * index,
              //     posY: 100 * index,
              //     width: 100,
              //     height: 100,
              //   ),
              // ).map((note) => buildNote(note)).toList(),
            ],
          );
        }
      });
    });
  }
}

class NoteBuild extends StatefulWidget {
  final String? text;
  final double left;
  final double top;
  final double width;
  final double height;
  NoteBuild({
    Key? key,
    required this.text,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  _NoteBuildState createState() => _NoteBuildState();
}

class _NoteBuildState extends State<NoteBuild> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
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
              title: Text('Note'),
              content: Text.rich(
                parse(
                  widget.text ?? '',
                  TextStyle(
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
                color: Color(0xFFFFF300).withOpacity(0.25),
                borderRadius: BorderRadius.circular(2),
                border: Border.all(
                  color: Color(0xFFFFF176),
                ),
              ),
              child: (widget.width > 30 && widget.height > 30) // don't show if too small
                  ? Text.rich(
                      parse(
                        widget.text ?? '',
                        TextStyle(
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
      title: Text('Notes'),
      content: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Material(
          child: Container(
            width: double.maxFinite,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(parent: const AlwaysScrollableScrollPhysics()),
              itemCount: item.notes.length,
              itemBuilder: (context, index) {
                final note = item.notes[index];
                return ListTile(
                  title: Text.rich(
                    parse(
                      note.content ?? '',
                      TextStyle(
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
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}
