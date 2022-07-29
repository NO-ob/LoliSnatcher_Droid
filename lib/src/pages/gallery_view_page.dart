import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:preload_page_view/preload_page_view.dart';

import 'package:lolisnatcher/src/boorus/hydrus_handler.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/snatch_handler.dart';
import 'package:lolisnatcher/src/handlers/viewer_handler.dart';
import 'package:lolisnatcher/src/services/get_perms.dart';
import 'package:lolisnatcher/src/services/image_writer.dart';
import 'package:lolisnatcher/src/utils/timed_progress_controller.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/restartable_progress_indicator.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/gallery/gallery_buttons.dart';
import 'package:lolisnatcher/src/widgets/gallery/hideable_appbar.dart';
import 'package:lolisnatcher/src/widgets/gallery/notes_renderer.dart';
import 'package:lolisnatcher/src/widgets/gallery/tag_view.dart';
import 'package:lolisnatcher/src/widgets/gallery/viewer_tutorial.dart';
import 'package:lolisnatcher/src/widgets/image/image_viewer.dart';
import 'package:lolisnatcher/src/widgets/video/unknown_viewer_placeholder.dart';
import 'package:lolisnatcher/src/widgets/video/video_viewer_desktop.dart';
import 'package:lolisnatcher/src/widgets/video/video_viewer_placeholder.dart';
import 'package:lolisnatcher/src/widgets/video/video_viewer.dart';

/// The image page is what is dispalyed when an iamge is clicked it shows a full resolution
/// version of an image and allows scrolling left and right through the currently loaded booruItems
///
class GalleryViewPage extends StatefulWidget {
  const GalleryViewPage(this.index, {Key? key}) : super(key: key);
  final int index;

  @override
  State<GalleryViewPage> createState() => _GalleryViewPageState();
}

class _GalleryViewPageState extends State<GalleryViewPage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SnatchHandler snatchHandler = SnatchHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;
  final ViewerHandler viewerHandler = ViewerHandler.instance;

  bool autoScroll = false;
  Timer? autoScrollTimer;
  TimedProgressController? autoScrollProgressController;

  late PreloadPageController controller;
  ImageWriter imageWriter = ImageWriter();
  FocusNode kbFocusNode = FocusNode();
  StreamSubscription? volumeListener;
  final GlobalKey<ScaffoldState> viewerScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    controller = PreloadPageController(
      initialPage: widget.index,
    );

    // print("widget index: ${widget.index}");
    // print("searchtabs index: ${searchHandler.viewedIndex.value}");

    ServiceHandler.disableSleep();
    kbFocusNode.requestFocus();

    autoScrollProgressController = TimedProgressController(
      duration: Duration(milliseconds: settingsHandler.galleryAutoScrollTime),
    );

    // enable volume buttons if opened page is a video AND appbar is visible
    BooruItem item = searchHandler.currentFetched[widget.index];
    bool isVideo = item.isVideo();
    bool isHated = item.isHated.value;
    bool isVolumeAllowed = !settingsHandler.useVolumeButtonsForScroll || (isVideo && viewerHandler.displayAppbar.value);
    ServiceHandler.setVolumeButtons(isVolumeAllowed);
    setVolumeListener();
  }

  Widget getTitle() {
    return Obx(() {
      final String formattedViewedIndex = (searchHandler.viewedIndex.value + 1).toString();
      final String formattedTotal = searchHandler.currentFetched.length.toString(); 
      return Text("$formattedViewedIndex/$formattedTotal", style: const TextStyle(color: Colors.white));
    });
  }

  void toggleToolbar(bool isLongTap) {
    bool newAppbarVisibility = !viewerHandler.displayAppbar.value;
    viewerHandler.displayAppbar.value = newAppbarVisibility;

    if(isLongTap) {
      ServiceHandler.vibrate();
    }

    // enable volume buttons if current page is a video AND appbar is set to visible
    bool isVideo = searchHandler.currentFetched[searchHandler.viewedIndex.value].isVideo();
    bool isVolumeAllowed = !settingsHandler.useVolumeButtonsForScroll || (isVideo && newAppbarVisibility);
    ServiceHandler.setVolumeButtons(isVolumeAllowed);
  }

  @override
  Widget build(BuildContext context) {
    // print('!!! GalleryViewPage build ${searchHandler.viewedIndex.value} !!!');
    // kbFocusNode.requestFocus();

    return Scaffold(
      key: viewerScaffoldKey,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: settingsHandler.galleryBarPosition == 'Top' ? HideableAppBar(getTitle(), appBarActions()) : null,
      bottomNavigationBar: settingsHandler.galleryBarPosition == 'Bottom' ? HideableAppBar(getTitle(), appBarActions()) : null,
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
            DismissDirection.endToStart: 0.3
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
                  if(event.physicalKey == PhysicalKeyboardKey.arrowLeft || event.physicalKey == PhysicalKeyboardKey.keyH) {
                    // prev page on Left Arrow or H
                    if(searchHandler.viewedIndex.value > 0) {
                      controller.jumpToPage(searchHandler.viewedIndex.value - 1);
                    }
                  } else if(event.physicalKey == PhysicalKeyboardKey.arrowRight || event.physicalKey == PhysicalKeyboardKey.keyL) {
                    // next page on Right Arrow or L
                    if(searchHandler.viewedIndex.value < searchHandler.currentFetched.length - 1) {
                      controller.jumpToPage(searchHandler.viewedIndex.value + 1);
                    }
                  } else if (event.physicalKey == PhysicalKeyboardKey.keyS) {
                    // save on S
                    snatchHandler.queue(
                      [searchHandler.currentFetched[searchHandler.viewedIndex.value]],
                      searchHandler.currentBooru,
                      settingsHandler.snatchCooldown
                    );
                  } else if (event.physicalKey == PhysicalKeyboardKey.keyF) {
                    // favorite on F
                    if (settingsHandler.dbEnabled) {
                      if(searchHandler.currentFetched[searchHandler.viewedIndex.value].isFavourite.value != null) {
                        searchHandler.currentFetched[searchHandler.viewedIndex.value].isFavourite.toggle();
                        settingsHandler.dbHandler.updateBooruItem(searchHandler.currentFetched[searchHandler.viewedIndex.value], "local");
                      }
                    }
                  } else if (event.physicalKey == PhysicalKeyboardKey.escape) {
                    // exit on escape if in focus
                    if(kbFocusNode.hasFocus) {
                      Navigator.of(context).pop();
                    }
                  }
                }
              },
              child: Stack(children: [
                Obx(() => PreloadPageView.builder(
                  preloadPagesCount: settingsHandler.preloadCount,
                  // allowImplicitScrolling: true,
                  scrollDirection: settingsHandler.galleryScrollDirection == 'Vertical' ? Axis.vertical : Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(parent: ClampingScrollPhysics()),
                  itemBuilder: (context, index) {
                    BooruItem item = searchHandler.currentFetched[index];
                    // String fileURL = item.fileURL;
                    bool isVideo = item.isVideo();
                    bool isImage = item.isImage();
                    // print(fileURL);
                    // print('isVideo: '+isVideo.toString());

                    late Widget itemWidget;
                    if(isImage) {
                      itemWidget = ImageViewer(item.key, item, index);
                    } else if(isVideo) {
                      if(settingsHandler.disableVideo) {
                        itemWidget = const Center(child: Text("Video Disabled", style: TextStyle(fontSize: 20)));
                      } else {
                        if(Platform.isAndroid || Platform.isIOS) {
                          itemWidget = VideoViewer(item.key, item, index, true);
                        } else if(Platform.isWindows || Platform.isLinux) {
                          // itemWidget = VideoViewerPlaceholder(item: item, index: index);
                          itemWidget = VideoViewerDesktop(item.key, item, index);
                        } else {
                          itemWidget = VideoViewerPlaceholder(item: item, index: index);
                        }
                      }
                    } else {
                      itemWidget = UnknownViewerPlaceholder(item: item, index: index);
                    }

                    return Obx(() {
                      bool isViewed = index == searchHandler.viewedIndex.value;
                      bool isNear = (searchHandler.viewedIndex.value - index).abs() <= settingsHandler.preloadCount;
                      // print('!! preloadpageview item build $index $isViewed $isNear !!');
                      if(!isViewed && !isNear) {
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
                          child: RepaintBoundary(child: itemWidget),
                        ),
                      );
                    });
                  },
                  controller: controller,
                  onPageChanged: (int index) {
                    // rehide system ui on every page change
                    ServiceHandler.disableSleep();

                    searchHandler.setViewedItem(index);
                    kbFocusNode.requestFocus();

                    viewerHandler.setCurrent(searchHandler.currentFetched[index].key);

                    if(autoScroll) {
                      if((autoScrollTimer?.isActive == true)) {
                        // reset slideshow timer if user scrolled earlier
                        // TODO bug: progress animation lags for a few frames when scroll is automatic
                        unsetScrollTimer();
                        setScrollTimer();
                      }
                    }

                    // enable volume buttons if new page is a video AND appbar is visible
                    bool isVideo = searchHandler.currentFetched[index].isVideo();
                    bool isVolumeAllowed = !settingsHandler.useVolumeButtonsForScroll || (isVideo && viewerHandler.displayAppbar.value);
                    ServiceHandler.setVolumeButtons(isVolumeAllowed);
                    // print('Page changed ' + index.toString());
                  },
                  itemCount: searchHandler.currentFetched.length,
                )),

                NotesRenderer(controller),
                GalleryButtons(pageController: controller),
                const ViewerTutorial(),
              ]),
            ),
          ),
        ),
      ),
      endDrawerEnableOpenDragGesture: false,
      endDrawer: Theme(
        data: Theme.of(context).copyWith(
          // copy existing main app theme, but make background semitransparent
          canvasColor: Theme.of(context).canvasColor.withOpacity(0.66),
        ),
        child: renderDrawer(),
      )
    );
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

    if(kbFocusNode.hasFocus && dir != 0) { // disable volume scrolling when not in focus
      // lastScrolledTo = math.max(math.min(lastScrolledTo + dir, searchHandler.currentFetched.length), 0);
      int toPage = searchHandler.viewedIndex.value + dir; // lastScrolledTo;
      // controller.animateToPage(toPage, duration: Duration(milliseconds: 30), curve: Curves.easeInOut);
      if(toPage >= 0 && toPage < searchHandler.currentFetched.length) {
        controller.jumpToPage(toPage);
      }
    }
  }

  @override
  void dispose() {
    autoScrollProgressController?.dispose();
    autoScrollTimer?.cancel();
    volumeListener?.cancel();
    ServiceHandler.setVolumeButtons(!settingsHandler.useVolumeButtonsForScroll);
    kbFocusNode.dispose();
    ServiceHandler.enableSleep();
    super.dispose();
  }

  void scrollToNextPage() {
    // Not sure if video and gifs should be autoscrolled, could maybe add a listener for video playtime so it changes at the end
    final int viewedIndex = searchHandler.viewedIndex.value;
    final bool isImage = searchHandler.currentFetched[viewedIndex].mediaType == "image";
    // TODO video and gifs support
    // TODO check if item is loaded
    if(viewedIndex < (searchHandler.currentFetched.length - 1)) {
      if (isImage && autoScroll) {
        print("autoscrolling");
        controller.jumpToPage(viewedIndex + 1);
      }
    } else {
      autoScrollState(false);
    }
  }
  void setScrollTimer() {
    autoScrollProgressController?.restart();
    autoScrollTimer = Timer.periodic(Duration(milliseconds: settingsHandler.galleryAutoScrollTime), (timer) {
      scrollToNextPage();
      autoScrollProgressController?.restart();
    });
  }
  void unsetScrollTimer() {
    autoScrollTimer?.cancel();
    autoScrollProgressController?.stop();
  }
  void autoScrollState(bool newState) {
    bool isNotLastPage = (searchHandler.viewedIndex.value + 1) < searchHandler.currentFetched.length;
    if(autoScroll != newState) {
      if(isNotLastPage) {
        setState(() {
          autoScroll = newState;
        });
        newState ? setScrollTimer() : unsetScrollTimer();
      } else {
        if (newState == true) {
          FlashElements.showSnackbar(
            context: context,
            title: const Text(
              "Can't start Slideshow",
              style: TextStyle(fontSize: 20)
            ),
            content: const Text(
              "Reached the Last loaded Item",
              style: TextStyle(fontSize: 16)
            ),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.red,
            sideColor: Colors.red,
          );
        }
        setState(() {
          autoScroll = false;
        });
        unsetScrollTimer();
      }
    }
  }

  Widget renderDrawer() {
    final MediaQueryData mQuery = MediaQuery.of(context);
    final double maxWidth = mQuery.orientation == Orientation.portrait ? (mQuery.size.width * 0.75) : (mQuery.size.height * 0.75);

    return SizedBox(
      width: maxWidth,
      child: const Drawer(
        child: SafeArea(
          child: TagView(),
        ),
      )
    );
  }


  void shareTextAction(String text) {
    if (Platform.isWindows || Platform.isLinux) {
      Clipboard.setData(ClipboardData(text: text));
      FlashElements.showSnackbar(
        context: context,
        duration: const Duration(seconds: 2),
        title: const Text(
          "Copied to clipboard!",
          style: TextStyle(fontSize: 20)
        ),
        content: Text(
          text,
          style: const TextStyle(fontSize: 16)
        ),
        leadingIcon: Icons.copy,
        sideColor: Colors.green,
      );
    } else if (Platform.isAndroid) {
      ServiceHandler.loadShareTextIntent(text);
    }
  }
  void shareHydrusAction(BooruItem item) {
    if (settingsHandler.hasHydrus){
      Booru hydrus = settingsHandler.booruList.where((element) => element.type == "Hydrus").first;
      HydrusHandler hydrusHandler = HydrusHandler(hydrus, 10);
      hydrusHandler.addURL(item);
    }
  }


  void shareFileAction() async {
    BooruItem item = searchHandler.currentFetched[searchHandler.viewedIndex.value];
    String? path = await imageWriter.getCachePath(item.fileURL, 'media');

    // TODO rewrite to DioDownloader
    // TODO delete from cache after share window closes
    // TODO show progress bar when loading from network

    if(path != null) {
      // File is already in cache - share from there
      await ServiceHandler.loadShareFileIntent(path, '${item.isVideo() ? 'video' : 'image'}/${item.fileExt!}');
    } else {
      // File not in cache - load from network, share, delete from cache afterwards
      FlashElements.showSnackbar(
        context: context,
        title: const Text(
          "Loading File...",
          style: TextStyle(fontSize: 20)
        ),
        content: const Text(
          "This can take some time, please wait...",
          style: TextStyle(fontSize: 16)
        ),
        overrideLeadingIconWidget: const SizedBox(
          width: 50,
          height: 50,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: CircularProgressIndicator(),
          )
        ),
        sideColor: Colors.yellow,
      );
      var request = await HttpClient().getUrl(Uri.parse(item.fileURL));
      var response = await request.close();
      Uint8List bytes = await consolidateHttpClientResponseBytes(response);
      final File? cacheFile = await imageWriter.writeCacheFromBytes(item.fileURL, bytes, 'media');
      if(cacheFile != null) {
        path = cacheFile.path;
        await ServiceHandler.loadShareFileIntent(path, '${item.isVideo() ? 'video' : 'image'}/${item.fileExt!}');
      } else {
        FlashElements.showSnackbar(
            context: context,
            title: const Text(
              "Error!",
              style: TextStyle(fontSize: 20)
            ),
            content: const Text(
              "Something went wrong when saving the File before Sharing",
              style: TextStyle(fontSize: 16)
            ),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.red,
            sideColor: Colors.red,
          );
      }

      // TODO: find a way to detect when share menu was closed, orherwise this is triggered immediately and file is deleted before sending to another app
      // writer.deleteFileFromCache(path, 'media');
    }
  }


  void showShareDialog({bool showTip = true}) {
    // TODO change layout so the buttons set their width automatically, without padding stuff
    showDialog(
      context: context,
      builder: (context) {
        return SettingsDialog(
          title: const Text('What you want to Share?'),
          contentItems: <Widget>[
            const SizedBox(height: 15),
          Column(
            children: [
              if(searchHandler.currentFetched[searchHandler.viewedIndex.value].postURL != '')
                ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Theme.of(context).colorScheme.secondary),
                    ),
                  onTap: (){
                    Navigator.of(context).pop();
                    shareTextAction(searchHandler.currentFetched[searchHandler.viewedIndex.value].postURL);
                  },
                  leading: const Icon(CupertinoIcons.link),
                  title: const Text('Post URL'),
                ),

                const SizedBox(height: 15),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Theme.of(context).colorScheme.secondary),
                  ),
                  onTap: (){
                    Navigator.of(context).pop();
                    shareTextAction(searchHandler.currentFetched[searchHandler.viewedIndex.value].fileURL);
                  },
                  leading: const Icon(CupertinoIcons.link),
                  title: const Text('File URL'),
                ),

                const SizedBox(height: 15),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Theme.of(context).colorScheme.secondary),
                  ),
                  onTap: (){
                    Navigator.of(context).pop();
                    shareFileAction();
                  },
                  leading: const Icon(Icons.file_present),
                  title: const Text('File'),
                ),

                const SizedBox(height: 15),
                settingsHandler.hasHydrus && searchHandler.currentBooru.type != "Hydrus"
                  ? ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Theme.of(context).colorScheme.secondary),
                      ),
                      onTap: (){
                        Navigator.of(context).pop();
                        shareHydrusAction(searchHandler.currentFetched[searchHandler.viewedIndex.value]);
                      },
                      leading: const Icon(Icons.file_present),
                      title: const Text('Hydrus'),
                    )
                  : Container()
              ]
            ),
            const SizedBox(height: 15),
            Text(showTip ? '[Tip]: You can set default action in settings' : ''),
          ],
        );
      }
    );
  }

  List<Widget> appBarActions() {
    List<List<String>> filteredButtonOrder = settingsHandler.buttonOrder.where((btn) {
      if(searchHandler.viewedIndex.value == -1) {
        return false;
      }

      bool isImageItem = searchHandler.currentFetched[searchHandler.viewedIndex.value].isImage();
      bool isScaleButton = btn[0] == 'reloadnoscale';
      bool isScaleAllowed = isScaleButton ? (isImageItem && !settingsHandler.disableImageScaling) : true; // allow reloadnoscale button if not a video and scaling is not disabled

      bool isFavButton = btn[0] == 'favourite';
      bool isFavAllowed = isFavButton ? settingsHandler.dbEnabled : true; // allow favourite button if db is enabled
      
      return isScaleAllowed && isFavAllowed;
    }).toList();

    List<Widget> actions = [];
    List<List<String>> overFlowList = [];
    List<List<String>> buttonList = [];
    // first 4 buttons will show on toolbar
    int listSplit = (MediaQuery.of(context).size.width / 100).floor();
    // print(MediaQuery.of(context).size.width);
    if (listSplit < filteredButtonOrder.length){
      overFlowList = (filteredButtonOrder.sublist(listSplit));
      buttonList = filteredButtonOrder.sublist(0,listSplit);
    } else {
      buttonList = filteredButtonOrder;
    }
    for (var value in buttonList) {
      actions.add(buildIconButton(value[0], true));
    }

    // Debug - print current item info
    // actions.add(IconButton(
    //   icon: Icon(Icons.developer_board),
    //   color: Colors.white,
    //   onPressed: () {
    //     print(searchHandler.viewedItem.value.toJSON().toString());
    //   },
    // ));

    // all buttons after that will be in overflow menu
    if (overFlowList.isNotEmpty) {
      final bool isAutoscrollOverflowed = overFlowList.indexWhere((btn) => btn[0] == 'autoscroll') != -1;

      actions.add(PopupMenuButton(
        icon: Stack(
          alignment: Alignment.center,
          children: [
            if(autoScroll && isAutoscrollOverflowed)
              RestartableProgressIndicator(
                controller: autoScrollProgressController!,
              ),

            const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ]
        ),
        itemBuilder: (BuildContext itemBuilder) =>
          overFlowList.map((value) =>
            PopupMenuItem(
              padding: const EdgeInsets.all(0),
              value: value[0], // remove empty space around the button
              child: SizedBox(
                width: double.infinity, // force button to take full width
                child: ListTile(
                  onLongPress: () {
                    buttonHold(value[0]);
                  },
                  onTap: () {
                    Navigator.of(context).pop(); // remove overflow menu
                    buttonClick(value[0]);
                  },
                  // style: ButtonStyle(
                  //     foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // color of icons and text
                  //     alignment: Alignment.centerLeft,
                  //     padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(20, 10, 20, 10))
                  // ),
                  leading: buildIconButton(value[0], false),
                  title: Text(buttonText(value))
                ),
              ),
            )
          ).toList()
      ));
    }
    return actions;
  }

  // generate widget for toolbar button
  Widget buildIconButton(String action, bool clickable) {
    // custom build to add progress indicator to slideshow button
    Widget subicon = buttonSubicon(action);
    return AbsorbPointer(
      absorbing: !clickable,
      child: GestureDetector(
        onLongPress: () {
          buttonHold(action);
        },
        onSecondaryTap: () {
          buttonHold(action);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            if(autoScroll && action == 'autoscroll')
              RestartableProgressIndicator(
                controller: autoScrollProgressController!,
              ),

            IconButton(
              icon: buttonIcon(action),
              color: Colors.white,
              onPressed: () {
                buttonClick(action);
              },
            ),

            subicon,
          ]
        )
      )
    );
  }

  // get button icon
  Widget buttonIcon(String action) {
    late IconData icon;
    switch(action) {
      case("info"):
        icon = Icons.info;
        break;
      case("open"):
        icon = Icons.public;
        break;
      case("autoscroll"):
        icon = autoScroll ? Icons.pause : Icons.play_arrow;
        break;
      case("snatch"):
        icon = Icons.save;
        break;
      case("favourite"):
        // icon = isFav == true ? Icons.favorite : Icons.favorite_border;
        // early return to override with animated icon
        return Obx(() {
          if(searchHandler.viewedIndex.value == -1) {
            return const Icon(Icons.favorite_border);
          }

          final bool? isFav = searchHandler.currentFetched[searchHandler.viewedIndex.value].isFavourite.value;
          return AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            crossFadeState: isFav == true ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: const Icon(Icons.favorite),
            secondChild: Icon(isFav == true ? Icons.favorite : (isFav == false ? Icons.favorite_border : CupertinoIcons.heart_slash)),
          );
        });
      case("share"):
        icon = Icons.share;
        break;
      case("reloadnoscale"):
        icon = Icons.refresh;
        break;
    }
    return Icon(icon);
  }

  Widget buttonSubicon(String action) {
    switch (action) {
      case 'snatch':
        return Obx(() {
          if(searchHandler.viewedIndex.value == -1) {
            return Container();
          }

          final bool isSnatched = searchHandler.currentFetched[searchHandler.viewedIndex.value].isSnatched.value == true;
          if(!isSnatched) {
            return const SizedBox();
          } else {
            return Positioned(
              right: 2,
              bottom: 5,
              child: Icon(Icons.save_alt, size: Theme.of(context).buttonTheme.height / 2.1),
            );
          }
        });
        
      default:
       return const SizedBox();
    }
  }

  // get button text for overflow menu
  String buttonText(List<String> actionAndLabel) {
    String action = actionAndLabel[0], defaultLabel = actionAndLabel[1];
    late String label;

    if(searchHandler.viewedIndex.value == -1) {
      return defaultLabel;
    }

    switch(action) {
      case("autoscroll"):
        label = "${autoScroll ? 'Pause' : 'Start'} $defaultLabel";
        break;
      case("favourite"):
        label = searchHandler.currentFetched[searchHandler.viewedIndex.value].isFavourite.value == true ? 'Unfavourite' : defaultLabel;
        break;
      case("reloadnoscale"):
        label = searchHandler.currentFetched[searchHandler.viewedIndex.value].isNoScale.value ? 'Reload with scaling' : defaultLabel;
        break;
      default:
        // use default text
        label = defaultLabel;
        break;
    }
    return label;
  }

  // execute button action
  void buttonClick(String action) async {
    switch(action) {
      case("info"):
        viewerScaffoldKey.currentState?.openEndDrawer();
        break;
      case("open"):
        // url to html encoded
        final String url = Uri.encodeFull(searchHandler.currentFetched[searchHandler.viewedIndex.value].postURL);
        ServiceHandler.launchURL(url);
        break;
      case("autoscroll"):
        autoScrollState(!autoScroll);
        break;
      case("snatch"):
        getPerms();
        // call a function to save the currently viewed image when the save button is pressed
        snatchHandler.queue(
          [searchHandler.currentFetched[searchHandler.viewedIndex.value]],
          searchHandler.currentBooru,
          settingsHandler.snatchCooldown
        );
        break;
      case("favourite"):
        if(searchHandler.currentFetched[searchHandler.viewedIndex.value].isFavourite.value != null) {
          ServiceHandler.vibrate();

          searchHandler.currentFetched[searchHandler.viewedIndex.value].isFavourite.toggle();
          settingsHandler.dbHandler.updateBooruItem(searchHandler.currentFetched[searchHandler.viewedIndex.value], "local");
        }
        break;
      case("share"):
        onShareClick();
        break;
      case("reloadnoscale"):
        searchHandler.currentFetched[searchHandler.viewedIndex.value].isNoScale.toggle();
        break;
    }
  }

  // long tap action
  void buttonHold(String action) {
    // TODO long press slideshow button to set the timer
    switch(action) {
      case("share"):
        onShareHold();
        break;
    }
  }

  void onShareClick(){
    String shareSetting = settingsHandler.shareAction;
    switch(shareSetting) {
      case 'Post URL':
        if(searchHandler.currentFetched[searchHandler.viewedIndex.value].postURL != '') {
          shareTextAction(searchHandler.currentFetched[searchHandler.viewedIndex.value].postURL);
        } else {
          FlashElements.showSnackbar(
            context: context,
            title: const Text(
              "No Post URL!",
              style: TextStyle(fontSize: 20)
            ),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.red,
            sideColor: Colors.red,
          );
        }
        break;
      case 'File URL':
        shareTextAction(searchHandler.currentFetched[searchHandler.viewedIndex.value].fileURL);
        break;
      case 'Hydrus':
        shareHydrusAction(searchHandler.currentFetched[searchHandler.viewedIndex.value]);
        break;
      case 'File':
        shareFileAction();
        break;
      case 'Ask':
      default:
        showShareDialog();
        break;
    }
  }
  void onShareHold() async {
    ServiceHandler.vibrate();
    // Ignore share setting on long press
    showShareDialog(showTip: false);
  }

}
