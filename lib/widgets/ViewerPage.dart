import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:vibration/vibration.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SnatchHandler.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ViewerHandler.dart';
import 'package:LoliSnatcher/ImageWriter.dart';
import 'package:LoliSnatcher/getPerms.dart';
import 'package:LoliSnatcher/TimedProgressController.dart';
import 'package:LoliSnatcher/RestartableProgressIndicator.dart';

// import 'package:LoliSnatcher/widgets/PreloadPageView.dart' as PreloadPageView;
import 'package:LoliSnatcher/widgets/VideoApp.dart';
import 'package:LoliSnatcher/widgets/VideoAppDesktop.dart';
import 'package:LoliSnatcher/widgets/HideableAppbar.dart';
import 'package:LoliSnatcher/widgets/TagView.dart';
import 'package:LoliSnatcher/widgets/MediaViewerBetter.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:LoliSnatcher/widgets/VideoAppPlaceholder.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:LoliSnatcher/widgets/ZoomButton.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/libBooru/HydrusHandler.dart';

/**
 * The image page is what is dispalyed when an iamge is clicked it shows a full resolution
 * version of an image and allows scrolling left and right through the currently loaded booruItems
 *
 */
class ViewerPage extends StatefulWidget {
  final int index;

  ViewerPage(this.index);

  @override
  _ViewerPageState createState() => _ViewerPageState();
}

class _ViewerPageState extends State<ViewerPage> {
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final SnatchHandler snatchHandler = Get.find<SnatchHandler>();
  final SearchHandler searchHandler = Get.find<SearchHandler>();
  final ViewerHandler viewerHandler = Get.find<ViewerHandler>();

  // PreloadPageView.PageController? controller;
  bool autoScroll = false;
  Timer? autoScrollTimer;
  TimedProgressController? autoScrollProgressController;

  PreloadPageController? controller;
  PageController? controllerLinux;
  ImageWriter imageWriter = ImageWriter();
  FocusNode kbFocusNode = FocusNode();
  StreamSubscription? volumeListener;
  final GlobalKey<ScaffoldState> viewerScaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    super.initState();
    // controller = PreloadPageView.PageController(
    controller = PreloadPageController(
      initialPage: widget.index,
    );
    controllerLinux = PageController(
      initialPage: widget.index,
    );
    setState(() {
      // print("widget index: ${widget.index}");
      // print("searchglobals index: ${searchHandler.currentTab.viewedIndex.value}");
      searchHandler.currentTab.currentItem.value = getFetched()[widget.index];
      searchHandler.currentTab.viewedIndex.value = widget.index;
    });

    ServiceHandler.disableSleep();
    if(settingsHandler.hideSystemUIinViewer.value) SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    kbFocusNode.requestFocus();

    autoScrollProgressController = TimedProgressController(
      duration: Duration(milliseconds: settingsHandler.galleryAutoScrollTime),
    );

    // enable volume buttons if opened page is a video AND appbar is visible
    BooruItem item = getFetched()[widget.index];
    bool isVideo = item.isVideo();
    bool isHated = item.isHated.value;
    bool isVolumeAllowed = !settingsHandler.useVolumeButtonsForScroll || (isVideo && viewerHandler.displayAppbar.value);
    ServiceHandler.setVolumeButtons(isVolumeAllowed);
    setVolumeListener();
  }

  List<BooruItem> getFetched() {
    // TODO this gets called too many times, find a way to call only when needed or once for all cases
    return searchHandler.currentTab.booruHandler.filteredFetched;
  }

  Widget getTitle() {
    return Obx(() => Text("${(searchHandler.currentTab.viewedIndex.value + 1).toString()}/${searchHandler.currentTab.booruHandler.filteredFetched.length.toString()}", style: TextStyle(color: Colors.white)),);
  }

  @override
  Widget build(BuildContext context) {
    // String appBarTitle = "${(searchHandler.currentTab.viewedIndex.value + 1).toString()}/${getFetched().length.toString()}";
    //kbFocusNode.requestFocus();

    return Scaffold(
      key: viewerScaffoldKey,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: settingsHandler.galleryBarPosition == 'Top' ? HideableAppBar(getTitle(), appBarActions(), settingsHandler.autoHideImageBar) : null,
      bottomNavigationBar: settingsHandler.galleryBarPosition == 'Bottom' ? HideableAppBar(getTitle(), appBarActions(), settingsHandler.autoHideImageBar) : null,
      backgroundColor: Colors.transparent,
      body: PhotoViewGestureDetectorScope(
        // vertical to prevent swipe-to-dismiss when zoomed
        axis: Axis.vertical, // photo_view doesn't support locking both axises, so we use custom fork to fix for this
        child: Dismissible(
          direction: settingsHandler.galleryScrollDirection == 'Vertical' ? DismissDirection.horizontal : DismissDirection.vertical,
          // background: Container(color: Colors.black.withOpacity(0.3)),
          key: const Key('imagePageDismissibleKey'),
          resizeDuration: null, // Duration(milliseconds: 100),
          dismissThresholds: {DismissDirection.up: 0.2, DismissDirection.down: 0.2, DismissDirection.startToEnd: 0.3, DismissDirection.endToStart: 0.3}, // Amount of swiped away which triggers dismiss
          onDismissed: (_) => Navigator.of(context).pop(),
          child: Center(
            // child: PhotoViewGestureDetectorScope(
            //   // horizontal to prevent triggering page change early when panning
            //   axis: Axis.horizontal,
              // The pageView builder will created a page for each image in the booruList(fetched)
              child: androidPageBuilder(),
            // ),
          )
        )
      ),
      endDrawerEnableOpenDragGesture: false,
      endDrawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black.withOpacity(0.66), // copy existing main app theme, but make background semitransparent
          textTheme: Typography.material2018().white,
        ),
        child: renderDrawer(),
      )
    );
  }

  void setVolumeListener() {
    volumeListener?.cancel();
    volumeListener = searchHandler.volumeStream?.stream.listen((event) {
      // print('in gallery $event');
      int dir = 0;
      if (event == 'up') {
        dir = -1;
      } else if (event == 'down') {
        dir = 1;
      }

      // lastScrolledTo = math.max(math.min(lastScrolledTo + dir, getFetched().length), 0);
      int toPage = searchHandler.currentTab.viewedIndex.value + dir; // lastScrolledTo; 
      controller?.animateToPage(toPage, duration: Duration(milliseconds: 30), curve: Curves.easeInOut);
      // controller?.jumpToPage(toPage);
    });
  }

  @override
  void dispose() {
    autoScrollProgressController?.dispose();
    autoScrollTimer?.cancel();
    volumeListener?.cancel();
    ServiceHandler.setVolumeButtons(!settingsHandler.useVolumeButtonsForScroll);
    kbFocusNode.dispose();
    ServiceHandler.enableSleep();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  Widget androidPageBuilder() {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: kbFocusNode,
      onKey: (RawKeyEvent event) {
        if(event.isKeyPressed(LogicalKeyboardKey.arrowLeft) || event.isKeyPressed(LogicalKeyboardKey.keyH)) {
          controller?.previousPage(duration: Duration(milliseconds: 10), curve: Curves.linear);
        } else if(event.isKeyPressed(LogicalKeyboardKey.arrowRight) || event.isKeyPressed(LogicalKeyboardKey.keyL)) {
          controller?.nextPage(duration: Duration(milliseconds: 10), curve: Curves.linear);
        } else if (event.isKeyPressed(LogicalKeyboardKey.keyS)) {
          snatchHandler.queue(
            [getFetched()[searchHandler.currentTab.viewedIndex.value]],
            searchHandler.currentTab.selectedBooru.value,
            settingsHandler.snatchCooldown
          );
        } else if (event.isKeyPressed(LogicalKeyboardKey.keyF)) {
          if (settingsHandler.dbEnabled) {
            if(getFetched()[searchHandler.currentTab.viewedIndex.value].isFavourite.value != null) {
              setState(() {
                getFetched()[searchHandler.currentTab.viewedIndex.value].isFavourite.toggle();
                settingsHandler.dbHandler.updateBooruItem(getFetched()[searchHandler.currentTab.viewedIndex.value], "local");
              });
            }
          }
        }
      },
      child: Stack(children: [
        PreloadPageView.builder( // PreloadPageView.PageView.builder(
          preloadPagesCount: settingsHandler.preloadCount,
          // allowImplicitScrolling: true,
          scrollDirection: settingsHandler.galleryScrollDirection == 'Vertical' ? Axis.vertical : Axis.horizontal,
          physics: const AlwaysScrollableScrollPhysics(parent: ClampingScrollPhysics()),
          itemBuilder: (context, index) {
            BooruItem item = getFetched()[index];
            // String fileURL = item.fileURL;
            bool isVideo = item.isVideo();
            int preloadCount = settingsHandler.preloadCount;
            bool isViewed = searchHandler.currentTab.viewedIndex.value == index;
            bool isNear = (searchHandler.currentTab.viewedIndex.value - index).abs() <= preloadCount;
            // print(fileURL);
            // print('isVideo: '+isVideo.toString());
            // Render only if viewed or in preloadCount range

            late Widget itemWidget;
            if(isVideo) {
              if(settingsHandler.disableVideo) {
                itemWidget = Center(child: Text("Video Disabled", style: TextStyle(fontSize: 20)));
              } else {
                if(Platform.isAndroid || Platform.isIOS) {
                  itemWidget = VideoApp(
                    item.key,
                    item,
                    index,
                    searchHandler.currentTab,
                    true
                  );
                } else if(Platform.isWindows) {
                  itemWidget = VideoAppDesktop(item.key, item, index, searchHandler.currentTab);
                } else { // Linux
                  itemWidget = VideoAppPlaceholder(item: item, index: index);
                }
              }
            } else {
              itemWidget = MediaViewerBetter(
                item.key,
                item,
                index,
                searchHandler.currentTab
              );
            }

            if (isViewed || isNear) {
              // Cut to the size of the container, prevents overlapping
              return ClipRect(
                //Stack/Buttons Temp fix for desktop pageview only scrollable on like 2px at edges of screen. Think its a windows only bug
                child: Stack(children: [
                  GestureDetector(
                    // onTapUp: (TapUpDetails tapInfo) {
                    //   if(isVideo) return;
                    //   // TODO WIP
                    //   // change page if tapped on 20% of any side of the screen AND not a video
                    //   double tapPosX = tapInfo.localPosition.dx;
                    //   double screenWidth = MediaQuery.of(context).size.width;
                    //   double sideThreshold = screenWidth / 5;

                    //   if(tapPosX > (screenWidth - sideThreshold)) {
                    //     controller?.animateToPage(searchHandler.currentTab.viewedIndex.value + 1, duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
                    //   } else if(tapPosX < sideThreshold) {
                    //     controller?.animateToPage(searchHandler.currentTab.viewedIndex.value - 1, duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
                    //   }
                    // },
                    onLongPress: () async {
                      print('longpress');
                      bool newAppbarVisibility = !viewerHandler.displayAppbar.value;
                      viewerHandler.displayAppbar.value = newAppbarVisibility;

                      if ((Platform.isAndroid || Platform.isIOS) && (await Vibration.hasVibrator() ?? false)) {
                        Vibration.vibrate(duration: 10);
                      }

                      // enable volume buttons if current page is a video AND appbar is set to visible
                      bool isVideo = getFetched()[searchHandler.currentTab.viewedIndex.value].isVideo();
                      bool isVolumeAllowed = !settingsHandler.useVolumeButtonsForScroll || (isVideo && newAppbarVisibility);
                      ServiceHandler.setVolumeButtons(isVolumeAllowed);
                    },
                    child: itemWidget,
                  ),

                  if(!(Platform.isAndroid || Platform.isIOS) && viewerHandler.displayAppbar.value)
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.all(60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            margin: EdgeInsets.all(10),
                            child: FloatingActionButton(
                              heroTag: 'prevArrow-$index',
                              onPressed: () {
                                if((index - 1) >= 0) {
                                  controller!.animateToPage(
                                      controller!.page!.toInt() - 1,
                                      duration: Duration(milliseconds: 400),
                                      curve: Curves.linear
                                  );
                                }
                              },
                              child: Icon(Icons.arrow_left),
                              backgroundColor: Get.context!.theme.colorScheme.secondary,
                            ),
                          ),
                          Container(
                            width: 35,
                            height: 35,
                            margin: EdgeInsets.all(10),
                            child: FloatingActionButton(
                              heroTag: 'nextArrow-$index',
                              onPressed: () {
                                if((index + 1) < getFetched().length) {
                                  controller!.animateToPage(
                                      controller!.page!.toInt() + 1,
                                      duration: Duration(milliseconds: 400),
                                      curve: Curves.linear
                                  );
                                }
                              },
                              child: Icon(Icons.arrow_right),
                              backgroundColor: Get.context!.theme.colorScheme.secondary,
                            ),
                          ),
                        ],
                      )
                    ),
                ])
              );
            } else {
              return Container(
                color: Colors.black,
              );
            }
          },
          controller: controller,
          onPageChanged: (int index) {
            // rehide system ui on every page change
            ServiceHandler.disableSleep();
            if(settingsHandler.hideSystemUIinViewer.value) SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);

            setState(() {
              searchHandler.currentTab.currentItem.value = getFetched()[index];
              searchHandler.currentTab.viewedIndex.value = index;
              kbFocusNode.requestFocus();
            });

            if(autoScroll) {
              if((autoScrollTimer?.isActive == true)) {
                // reset slideshow timer if user scrolled earlier
                // TODO bug: progress animation lags for a few frames when scroll is automatic
                unsetScrollTimer();
                setScrollTimer();
              }
            }

            // enable volume buttons if new page is a video AND appbar is visible
            bool isVideo = getFetched()[index].isVideo();
            bool isVolumeAllowed = !settingsHandler.useVolumeButtonsForScroll || (isVideo && viewerHandler.displayAppbar.value);
            ServiceHandler.setVolumeButtons(isVolumeAllowed);
            // print('Page changed ' + index.toString());
          },
          itemCount: getFetched().length,
        ),

        ZoomButton(),
      ])
    );
  }

  void scrollToNextPage() {
    // Not sure if video and gifs should be autoscrolled, could maybe add a listener for video playtime so it changes at the end
    final int viewedIndex = searchHandler.currentTab.viewedIndex.value;
    final bool isImage = getFetched()[viewedIndex].mediaType == "image";
    if((viewedIndex + 1) < getFetched().length) {
      if (viewedIndex == controller!.page!.toInt() && isImage && autoScroll){
        print("autoscrolling");
        controller!.animateToPage(controller!.page!.toInt() + 1,
            duration: Duration(milliseconds: 400),
            curve: Curves.linear
        );
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
    bool isNotLastPage = (searchHandler.currentTab.viewedIndex.value + 1) < getFetched().length;
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
            title: Text(
              "Can't start Slideshow",
              style: TextStyle(fontSize: 20)
            ),
            content: Text(
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

  // Might not be needed anymore prelaodpageview is nw working on flutter linux, might not work with go-flutter though
  Widget linuxPageBuilder() {
    return PageView.builder(
        controller: controllerLinux,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          String fileURL = getFetched()[index].fileURL;
          bool isVideo = getFetched()[index].isVideo();
          if (isVideo) {
            return Container(
              child: Column(
                children: [
                  Image.network(getFetched()[index].thumbnailURL),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Get.theme.colorScheme.secondary),
                        ),
                      ),
                      onPressed: () {
                        Process.run('mpv', ["--loop", fileURL]);
                      },
                      child: Text("Open in MPV"),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Image.network(fileURL);
          }
        });
  }

  Widget renderDrawer() {
    final MediaQueryData mQuery = MediaQuery.of(context);
    final double maxWidth = mQuery.orientation == Orientation.portrait ? (mQuery.size.width * 0.75) : (mQuery.size.height * 0.75);

    return SizedBox(
      width: maxWidth,
      child: Drawer(
        child: SafeArea(
          child: TagView(getFetched()[searchHandler.currentTab.viewedIndex.value])
        ),
      )
    );
  }


  void shareTextAction(String text) {
    if (Platform.isWindows || Platform.isLinux) {
      Clipboard.setData(ClipboardData(text: text));
      FlashElements.showSnackbar(
        context: context,
        duration: Duration(seconds: 2),
        title: Text(
          "Copied to clipboard!",
          style: TextStyle(fontSize: 20)
        ),
        content: Text(
          text,
          style: TextStyle(fontSize: 16)
        ),
        leadingIcon: Icons.copy,
        sideColor: Colors.green,
      );
    } else if (Platform.isAndroid) {
      ServiceHandler serviceHandler = ServiceHandler();
      serviceHandler.loadShareTextIntent(text);
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
    BooruItem item = getFetched()[searchHandler.currentTab.viewedIndex.value];
    String? path = await imageWriter.getCachePath(item.fileURL, 'media');
    ServiceHandler serviceHandler = ServiceHandler();

    // TODO rewrite to DioDownloader
    // TODO delete from cache after share window closes
    // TODO show progress bar when loading from network

    if(path != null) {
      // File is already in cache - share from there
      await serviceHandler.loadShareFileIntent(path, (item.isVideo() ? 'video' : 'image') + '/' + item.fileExt!);
    } else {
      // File not in cache - load from network, share, delete from cache afterwards
      FlashElements.showSnackbar(
        context: context,
        title: Text(
          "Loading File...",
          style: TextStyle(fontSize: 20)
        ),
        content: Text(
          "This can take some time, please wait...",
          style: TextStyle(fontSize: 16)
        ),
        overrideLeadingIconWidget: Container(
          width: 50,
          height: 50,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Get.theme.colorScheme.secondary)
            ),
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
        await serviceHandler.loadShareFileIntent(path, (item.isVideo() ? 'video' : 'image') + '/' + item.fileExt!);
      } else {
        FlashElements.showSnackbar(
            context: context,
            title: Text(
              "Error!",
              style: TextStyle(fontSize: 20)
            ),
            content: Text(
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
          title: Text('What you want to Share?'),
          contentItems: <Widget>[
            const SizedBox(height: 15),
          Column(
            children: [
              if(getFetched()[searchHandler.currentTab.viewedIndex.value].postURL != '')
                ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Get.theme.colorScheme.secondary),
                    ),
                  onTap: (){
                    Navigator.of(context).pop();
                    shareTextAction(getFetched()[searchHandler.currentTab.viewedIndex.value].postURL);
                  },
                  leading: Icon(CupertinoIcons.link),
                  title: Text('Post URL'),
                ),

                const SizedBox(height: 15),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Get.theme.colorScheme.secondary),
                  ),
                  onTap: (){
                    Navigator.of(context).pop();
                    shareTextAction(getFetched()[searchHandler.currentTab.viewedIndex.value].fileURL);
                  },
                  leading: Icon(CupertinoIcons.link),
                  title: Text('File URL'),
                ),

                const SizedBox(height: 15),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Get.theme.colorScheme.secondary),
                  ),
                  onTap: (){
                    Navigator.of(context).pop();
                    shareFileAction();
                  },
                  leading: Icon(Icons.file_present),
                  title: Text('File'),
                ),

                const SizedBox(height: 15),
                settingsHandler.hasHydrus && searchHandler.currentTab.selectedBooru.value.type != "Hydrus"
                  ? ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Get.theme.colorScheme.secondary),
                      ),
                      onTap: (){
                        Navigator.of(context).pop();
                        shareHydrusAction(getFetched()[searchHandler.currentTab.viewedIndex.value]);
                      },
                      leading: Icon(Icons.file_present),
                      title: Text('Hydrus'),
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
    // remove reload without scaling button on videos (possibly more filters for the future actions?)
    List<List<String>> filteredButtonOrder = getFetched()[searchHandler.currentTab.viewedIndex.value].isVideo()
      ? settingsHandler.buttonOrder.where((btn) => btn[0] != 'reloadnoscale').toList()
      : settingsHandler.buttonOrder;

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
    buttonList.forEach((value) {
      actions.add(buildIconButton(value[0], true));
    });
    // TODO zoom button for testing, but maybe make it a real option?
    // actions.add(Obx(() => IconButton(
    //   icon: Icon(Get.find<ViewerHandler>().isZoomed.value ? Icons.zoom_out : Icons.zoom_in),
    //   color: Colors.white,
    //   onPressed: () {
    //     Get.find<ViewerHandler>().toggleZoom();
    //   },
    // )));
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

            Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ]
        ),
        itemBuilder: (BuildContext itemBuilder) =>
          overFlowList.map((value) =>
            PopupMenuItem(
              padding: EdgeInsets.all(0), // remove empty space around the button
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
                )
              ),
              value: value[0]
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
          final bool? isFav = getFetched()[searchHandler.currentTab.viewedIndex.value].isFavourite.value;
          return AnimatedCrossFade(
            duration: Duration(milliseconds: 200),
            crossFadeState: isFav == true ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: Icon(Icons.favorite),
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
          final bool isSnatched = getFetched()[searchHandler.currentTab.viewedIndex.value].isSnatched.value == true;
          if(!isSnatched) {
            return const SizedBox();
          } else {
          return Positioned(
            child: Icon(Icons.save_alt, size: Get.theme.buttonTheme.height / 2.1),
            right: 2,
            bottom: 5,
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
    switch(action) {
      case("autoscroll"):
        label = "${autoScroll ? 'Pause' : 'Start'} $defaultLabel";
        break;
      case("favourite"):
        label = getFetched()[searchHandler.currentTab.viewedIndex.value].isFavourite.value == true ? 'Unfavourite' : defaultLabel;
        break;
      case("reloadnoscale"):
        label = getFetched()[searchHandler.currentTab.viewedIndex.value].isNoScale.value ? 'Reload with scaling' : defaultLabel;
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
        ServiceHandler.launchURL(getFetched()[searchHandler.currentTab.viewedIndex.value].postURL);
        break;
      case("autoscroll"):
        autoScrollState(!autoScroll);
        break;
      case("snatch"):
        getPerms();
        // call a function to save the currently viewed image when the save button is pressed
        snatchHandler.queue(
          [getFetched()[searchHandler.currentTab.viewedIndex.value]],
          searchHandler.currentTab.selectedBooru.value,
          settingsHandler.snatchCooldown
        );
        break;
      case("favourite"):
        if(getFetched()[searchHandler.currentTab.viewedIndex.value].isFavourite.value != null) {
          if ((Platform.isAndroid || Platform.isIOS) && (await Vibration.hasVibrator() ?? false)) {
            Vibration.vibrate(duration: 10);
          }

          setState(() {
            getFetched()[searchHandler.currentTab.viewedIndex.value].isFavourite.toggle();
            settingsHandler.dbHandler.updateBooruItem(getFetched()[searchHandler.currentTab.viewedIndex.value], "local");
          });
        }
        break;
      case("share"):
        onShareClick();
        break;
      case("reloadnoscale"):
        setState(() {
          getFetched()[searchHandler.currentTab.viewedIndex.value].isNoScale.toggle();
        });
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
        if(getFetched()[searchHandler.currentTab.viewedIndex.value].postURL != '') {
          shareTextAction(getFetched()[searchHandler.currentTab.viewedIndex.value].postURL);
        } else {
          FlashElements.showSnackbar(
            context: context,
            title: Text(
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
        shareTextAction(getFetched()[searchHandler.currentTab.viewedIndex.value].fileURL);
        break;
      case 'Hydrus':
        shareHydrusAction(getFetched()[searchHandler.currentTab.viewedIndex.value]);
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
    if ((Platform.isAndroid || Platform.isIOS) && (await Vibration.hasVibrator() ?? false)) {
      Vibration.vibrate(duration: 10);
    }
    // Ignore share setting on long press
    showShareDialog(showTip: false);
  }

}
