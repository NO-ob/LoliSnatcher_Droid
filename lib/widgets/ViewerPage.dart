import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/libBooru/BooruHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruHandlerFactory.dart';
import 'package:LoliSnatcher/libBooru/HydrusHandler.dart';
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
import 'package:LoliSnatcher/ImageWriter.dart';
import 'package:LoliSnatcher/getPerms.dart';
import 'package:LoliSnatcher/TimedProgressController.dart';
import 'package:LoliSnatcher/RestartableProgressIndicator.dart';

import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/widgets/MediaViewer.dart';
// import 'package:LoliSnatcher/widgets/PreloadPageView.dart' as PreloadPageView;
import 'package:LoliSnatcher/widgets/VideoApp.dart';
import 'package:LoliSnatcher/widgets/HideableAppbar.dart';
import 'package:LoliSnatcher/widgets/InfoDialog.dart';
import 'package:LoliSnatcher/widgets/TagView.dart';


var volumeKeyChannel = Platform.isAndroid ? EventChannel('com.noaisu.loliSnatcher/volume') : null;
/**
 * The image page is what is dispalyed when an iamge is clicked it shows a full resolution
 * version of an image and allows scrolling left and right through the currently loaded booruItems
 *
 */
class ViewerPage extends StatefulWidget {
  List fetched;
  int index;
  SearchGlobals searchGlobals;
  SettingsHandler settingsHandler;
  SnatchHandler snatchHandler;
  Function callback;

  ViewerPage(this.fetched, this.index, this.searchGlobals, this.settingsHandler, this.snatchHandler, this.callback);
  @override
  _ViewerPageState createState() => _ViewerPageState();
}

class _ViewerPageState extends State<ViewerPage> {
  // PreloadPageView.PageController? controller;
  bool autoScroll = false;
  Timer? autoScrollTimer;
  TimedProgressController? autoScrollProgressController;

  PreloadPageController? controller;
  PageController? controllerLinux;
  ImageWriter writer = new ImageWriter();
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
      // print("searchglobals index: ${widget.searchGlobals.viewedIndex.value}");
      widget.searchGlobals.viewedIndex.value = widget.index;
    });
    kbFocusNode.requestFocus();
    ServiceHandler.disableSleep();

    autoScrollProgressController = TimedProgressController(
      duration: Duration(milliseconds: widget.settingsHandler.galleryAutoScrollTime),
    );

    // enable volume buttons if opened page is a video AND appbar is visible
    bool isVideo = widget.fetched[widget.index].isVideo();
    bool isVolumeAllowed = !widget.settingsHandler.useVolumeButtonsForScroll || (isVideo && widget.searchGlobals.displayAppbar.value);
    ServiceHandler.setVolumeButtons(isVolumeAllowed);
    setVolumeListener();
  }

  @override
  Widget build(BuildContext context) {
    String appBarTitle = "${(widget.searchGlobals.viewedIndex.value + 1).toString()}/${widget.fetched.length.toString()}";
    //kbFocusNode.requestFocus();
    return Scaffold(
      key: viewerScaffoldKey,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: widget.settingsHandler.galleryBarPosition == 'Top' ? HideableAppBar(appBarTitle, appBarActions(), widget.searchGlobals, widget.settingsHandler.autoHideImageBar) : null,
      bottomNavigationBar: widget.settingsHandler.galleryBarPosition == 'Bottom' ? HideableAppBar(appBarTitle, appBarActions(), widget.searchGlobals, widget.settingsHandler.autoHideImageBar) : null,
      backgroundColor: Colors.transparent,
      body: PhotoViewGestureDetectorScope(
        // vertical to prevent swipe-to-dismiss when zoomed
        axis: Axis.vertical, // photo_view doesn't support locking both axises, so we use custom fork to fix for this
        child: Dismissible(
          direction: widget.settingsHandler.galleryScrollDirection == 'Vertical' ? DismissDirection.horizontal : DismissDirection.vertical,
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
          canvasColor: Theme.of(context).colorScheme.background.withOpacity(0.66) // copy existing main app theme, but make background semitransparent
        ),
        child: renderDrawer(),
      )
    );
  }

  void setVolumeListener() {
    volumeListener?.cancel();
    volumeListener = volumeKeyChannel?.receiveBroadcastStream().listen((event) {
      // print('in viewer $event');
      int dir = 0;
      if (event == 'up') {
        dir = -1;
      } else if (event == 'down') {
        dir = 1;
      }

      // lastScrolledTo = math.max(math.min(lastScrolledTo + dir, widget.fetched.length), 0);
      int toPage = widget.searchGlobals.viewedIndex.value + dir; // lastScrolledTo; 
      controller?.animateToPage(toPage, duration: Duration(milliseconds: 30), curve: Curves.easeInOut);
      // controller?.jumpToPage(toPage);
    });
  }

  @override
  void dispose(){
    autoScrollProgressController?.dispose();
    autoScrollTimer?.cancel();
    volumeListener?.cancel();
    ServiceHandler.setVolumeButtons(!widget.settingsHandler.useVolumeButtonsForScroll);
    kbFocusNode.dispose();
    widget.callback();
    ServiceHandler.enableSleep();
    super.dispose();
  }

  Widget androidPageBuilder() {
    return new RawKeyboardListener(
      autofocus: true,
      focusNode: kbFocusNode,
      onKey: (RawKeyEvent event){
        if(event.isKeyPressed(LogicalKeyboardKey.arrowRight) || event.isKeyPressed(LogicalKeyboardKey.keyH)){
          controller?.jumpToPage(widget.searchGlobals.viewedIndex.value - 1);
        } else if(event.isKeyPressed(LogicalKeyboardKey.arrowRight) || event.isKeyPressed(LogicalKeyboardKey.keyL)){
          controller?.jumpToPage(widget.searchGlobals.viewedIndex.value + 1);
        } else if (event.isKeyPressed(LogicalKeyboardKey.keyS)){
          widget.snatchHandler.queue([widget.fetched[widget.searchGlobals.viewedIndex.value]], widget.settingsHandler.jsonWrite, widget.searchGlobals.selectedBooru,widget.settingsHandler.snatchCooldown);
        } else if (event.isKeyPressed(LogicalKeyboardKey.keyF)){
          if (widget.settingsHandler.dbEnabled){
            setState(() {
              widget.fetched[widget.searchGlobals.viewedIndex.value].isFavourite = !widget.fetched[widget.searchGlobals.viewedIndex.value].isFavourite;
              widget.settingsHandler.dbHandler.updateBooruItem(widget.fetched[widget.searchGlobals.viewedIndex.value],"local");
            });
          }
        }
      },
      child: PreloadPageView.builder( // PreloadPageView.PageView.builder(
        preloadPagesCount: widget.settingsHandler.preloadCount,
        // allowImplicitScrolling: true,
        scrollDirection: widget.settingsHandler.galleryScrollDirection == 'Vertical' ? Axis.vertical : Axis.horizontal,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          String fileURL = widget.fetched[index].fileURL;
          bool isVideo = widget.fetched[index].isVideo();
          int preloadCount = widget.settingsHandler.preloadCount;
          bool isViewed = widget.searchGlobals.viewedIndex.value == index;
          bool isNear = (widget.searchGlobals.viewedIndex.value - index).abs() <= preloadCount;
          // print(fileURL);
          // print('isVideo: '+isVideo.toString());
          // Render only if viewed or in preloadCount range
          if (isViewed || isNear) {
            // Cut to the size of the container, prevents overlapping
            return ClipRect(
              //Stack/Buttons Temp fix for desktop pageview only scrollable on like 2px at edges of screen. Think its a windows only bug
              child: Stack(
                children: [
                  GestureDetector(
                    // onTapUp: (TapUpDetails tapInfo) {
                    //   if(isVideo) return;
                    //   // TODO WIP
                    //   // change page if tapped on 20% of any side of the screen AND not a video
                    //   double tapPosX = tapInfo.localPosition.dx;
                    //   double screenWidth = MediaQuery.of(context).size.width;
                    //   double sideThreshold = screenWidth / 5;

                    //   if(tapPosX > (screenWidth - sideThreshold)) {
                    //     controller?.animateToPage(widget.searchGlobals.viewedIndex.value + 1, duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
                    //   } else if(tapPosX < sideThreshold) {
                    //     controller?.animateToPage(widget.searchGlobals.viewedIndex.value - 1, duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
                    //   }
                    // },
                      onLongPress: () async {
                        print('longpress');
                        bool newAppbarVisibility = !widget.searchGlobals.displayAppbar.value;
                        widget.searchGlobals.displayAppbar.value = newAppbarVisibility;

                        if(await Vibration.hasVibrator() ?? false) {
                          Vibration.vibrate(duration: 10);
                        }

                        // enable volume buttons if current page is a video AND appbar is set to visible
                        bool isVideo = widget.fetched[widget.searchGlobals.viewedIndex.value].isVideo();
                        bool isVolumeAllowed = !widget.settingsHandler.useVolumeButtonsForScroll || (isVideo && newAppbarVisibility);
                        ServiceHandler.setVolumeButtons(isVolumeAllowed);
                      },
                      child: isVideo
                          ? (!widget.settingsHandler.disableVideo
                          ? (Platform.isAndroid ? VideoApp(
                          widget.fetched[index],
                          index,
                          widget.searchGlobals,
                          widget.settingsHandler,
                          true
                      ) : desktopVideoPlaceHolder(widget.fetched[index]))
                          : Center(child: Text("Video Disabled", style: TextStyle(fontSize: 20)))
                      )
                          : MediaViewer(
                          widget.fetched[index],
                          index,
                          widget.searchGlobals,
                          widget.settingsHandler
                      )
                  ),
                  !Platform.isAndroid ? Container(
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            margin: EdgeInsets.all(10),
                            child:FloatingActionButton(
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
                              backgroundColor: Get.context!.theme.primaryColor,
                            ),
                          ),
                          Container(
                            width: 35,
                            height: 35,
                            margin: EdgeInsets.all(10),
                            child:FloatingActionButton(
                              onPressed: () {
                                if((index + 1) < widget.fetched.length) {
                                  controller!.animateToPage(
                                      controller!.page!.toInt() + 1,
                                      duration: Duration(milliseconds: 400),
                                      curve: Curves.linear
                                  );
                                }
                              },
                              child: Icon(Icons.arrow_right),
                              backgroundColor: Get.context!.theme.primaryColor,
                            ),
                          ),
                        ],

                      )) : Container(),
                ],
              )
            );
          } else {
            return Container(
              color: Colors.black,
            );
          }
        },
        controller: controller,
        onPageChanged: (int index) {
          setState(() {
            widget.searchGlobals.viewedIndex.value = index;
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
          bool isVideo = widget.fetched[index].isVideo();
          bool isVolumeAllowed = !widget.settingsHandler.useVolumeButtonsForScroll || (isVideo && widget.searchGlobals.displayAppbar.value);
          ServiceHandler.setVolumeButtons(isVolumeAllowed);
          // print('Page changed ' + index.toString());
        },
        itemCount: widget.fetched.length,
      ),
    );
  }

  void scrollToNextPage() {
    // Not sure if video and gifs should be autoscrolled, could maybe add a listener for video playtime so it changes at the end
    final int viewedIndex = widget.searchGlobals.viewedIndex.value;
    final bool isImage = widget.fetched[viewedIndex].mediaType == "image";
    if((viewedIndex + 1) < widget.fetched.length) {
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
    autoScrollTimer = Timer.periodic(Duration(milliseconds: widget.settingsHandler.galleryAutoScrollTime), (timer) {
      scrollToNextPage();
      autoScrollProgressController?.restart();
    });
  }
  void unsetScrollTimer() {
    autoScrollTimer?.cancel();
    autoScrollProgressController?.stop();
  }
  void autoScrollState(bool newState) {
    bool isNotLastPage = (widget.searchGlobals.viewedIndex.value + 1) < widget.fetched.length;
    if(autoScroll != newState) {
      if(isNotLastPage) {
        setState(() {
          autoScroll = newState;
        });
        newState ? setScrollTimer() : unsetScrollTimer();
      } else {
        if(newState == true) ServiceHandler.displayToast("Can't start slideshow\nReached the last loaded item");
        setState(() {
          autoScroll = false;
        });
        unsetScrollTimer();
      }
    }
  }

  Widget desktopVideoPlaceHolder(BooruItem item){
    return Center(
      child: Column(
        children: [
          Container(height: 150),
          Image.network(item.thumbnailURL,),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20),
                  side: BorderSide(color: Get.context!.theme.accentColor),
                ),
              ),
              onPressed: () {
                Process.run('mpv', ["--loop", item.fileURL]);
              },
              child: Text("Open in MPV", style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
  // Might not be needed anymore prelaodpageview is nw working on flutter linux, might not work with go-flutter though
  Widget linuxPageBuilder() {
    return PageView.builder(
        controller: controllerLinux,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          String fileURL = widget.fetched[index].fileURL;
          bool isVideo = widget.fetched[index].isVideo();
          if (isVideo) {
            return Container(
              child: Column(
                children: [
                  Image.network(widget.fetched[index].thumbnailURL),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20),
                          side: BorderSide(color: Get.context!.theme.accentColor),
                        ),
                      ),
                      onPressed: () {
                        Process.run('mpv', ["--loop", fileURL]);
                      },
                      child: Text("Open in MPV", style: TextStyle(color: Colors.white)),
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
          child: TagView(widget.fetched[widget.searchGlobals.viewedIndex.value], widget.searchGlobals, widget.settingsHandler)
        ),
      )
    );
  }


  /// Author: [Nani-Sore] ///
  void shareTextAction(String text) {
    ServiceHandler serviceHandler = new ServiceHandler();
    serviceHandler.loadShareTextIntent(text);
  }
  void shareHydrusAction(BooruItem item) {
    if (widget.settingsHandler.hasHydrus){
      Booru hydrus = widget.settingsHandler.booruList.where((element) => element.type == "Hydrus").first;
      HydrusHandler hydrusHandler = new HydrusHandler(hydrus, 10);
      hydrusHandler.addURL(item);
    }
  }

  /// Author: [Nani-Sore] ///
  void shareFileAction() async {
    BooruItem item = widget.fetched[widget.searchGlobals.viewedIndex.value];
    String? path = await ImageWriter().getCachePath(item.fileURL, 'media',widget.settingsHandler);
    ServiceHandler serviceHandler = new ServiceHandler();
    ImageWriter writer = new ImageWriter();

    if(path != null) {
      // File is already in cache - share from there
      await serviceHandler.loadShareFileIntent(path, (item.isVideo() ? 'video' : 'image') + '/' + item.fileExt!);
    } else {
      // File not in cache - load from network, share, delete from cache afterwards
      ServiceHandler.displayToast("Loading file from network...\nPlease wait");
      var request = await HttpClient().getUrl(Uri.parse(item.fileURL));
      var response = await request.close();
      Uint8List bytes = await consolidateHttpClientResponseBytes(response);
      final File? cacheFile = await writer.writeCacheFromBytes(item.fileURL, bytes, 'media',widget.settingsHandler);
      if(cacheFile != null) {
        path = cacheFile.path;
        await serviceHandler.loadShareFileIntent(path, (item.isVideo() ? 'video' : 'image') + '/' + item.fileExt!);
      } else {
        ServiceHandler.displayToast("Error!\nSomething went wrong when saving file to share");
      }

      // TODO: find a way to detect when share menu was closed, orherwise this is triggered immediately and file is deleted before sending to another app
      // writer.deleteFromCache(path, 'media');
    }
  }

  /// Author: [Nani-Sore] ///
  void showShareDialog({bool showTip = true}) {
    // TODO change layout so the buttons set their width automatically, without padding stuff
    Get.dialog(
      InfoDialog('What to share',
        [
          const SizedBox(height: 15),
          Column(
            children: [
              if(widget.fetched[widget.searchGlobals.viewedIndex.value].postURL != '')
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10),
                            side: BorderSide(color: Get.context!.theme.accentColor),
                          ),
                          padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                      ),
                      onPressed: (){
                        Navigator.of(context).pop();
                        shareTextAction(widget.fetched[widget.searchGlobals.viewedIndex.value].postURL);
                      },
                      icon: Icon(CupertinoIcons.link),
                      label: Text('Post URL', style: TextStyle(color: Colors.white))
                    )
                  ]
                ),

              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10),
                          side: BorderSide(color: Get.context!.theme.accentColor),
                        ),
                        padding: EdgeInsets.fromLTRB(18, 15, 18, 15),
                    ),
                    onPressed: (){
                      Navigator.of(context).pop();
                      shareTextAction(widget.fetched[widget.searchGlobals.viewedIndex.value].fileURL);
                    },
                    icon: Icon(CupertinoIcons.link),
                    label: Text('File URL', style: TextStyle(color: Colors.white))
                  )
                ]
              ),

              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10),
                        side: BorderSide(color: Get.context!.theme.accentColor),
                      ),
                      padding: EdgeInsets.fromLTRB(32, 15, 32, 15),
                    ),
                    onPressed: (){
                      Navigator.of(context).pop();
                      shareFileAction();
                    },
                    icon: Icon(Icons.file_present),
                    label: Text('File', style: TextStyle(color: Colors.white))                  
                  )
                ]
              ),
              const SizedBox(height: 15),
              widget.settingsHandler.hasHydrus && widget.searchGlobals.selectedBooru!.type != "Hydrus" ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10),
                            side: BorderSide(color: Get.context!.theme.accentColor),
                          ),
                          padding: EdgeInsets.fromLTRB(32, 15, 32, 15),
                        ),
                        onPressed: (){
                          Navigator.of(context).pop();
                          shareHydrusAction(widget.fetched[widget.searchGlobals.viewedIndex.value]);
                        },
                        icon: Icon(Icons.file_present),
                        label: Text('Hydrus', style: TextStyle(color: Colors.white))
                    )
                  ]
              ) : Container()
            ]
          ),
          const SizedBox(height: 15),
          Text(showTip ? '[Tip]: You can set default action in settings' : '')
        ],
        CrossAxisAlignment.center,
      )
    );
  }

  List<Widget> appBarActions() {
    List<Widget> actions = [];
    List<List<String>> overFlowList = [];
    List<List<String>> buttonList = [];
    // first 4 buttons will show on toolbar
    int listSplit = (MediaQuery.of(context).size.width / 100).floor();
    print(MediaQuery.of(context).size.width);
    if (listSplit < widget.settingsHandler.buttonOrder.length){
      overFlowList = (widget.settingsHandler.buttonOrder.sublist(listSplit));
      buttonList = widget.settingsHandler.buttonOrder.sublist(0,listSplit);
    } else {
      buttonList = widget.settingsHandler.buttonOrder;
    }
    buttonList.forEach((value) {
      actions.add(buildIconButton(value[0]));
    });
    // all buttons after that will be in overflow menu

    if (overFlowList.isNotEmpty){
      actions.add(PopupMenuButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          itemBuilder: (BuildContext itemBuilder) =>
              overFlowList.map((value) =>
                  PopupMenuItem(
                      padding: EdgeInsets.all(0), // remove empty space around the button
                      child: SizedBox(
                          width: double.infinity, // force button to take full width
                          child: TextButton.icon(
                              onLongPress: () {
                                buttonHold(value[0]);
                              },
                              onPressed: () {
                                Navigator.of(context).pop(); // remove overflow menu
                                buttonClick(value[0]);
                              },
                              style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // color of icons and text
                                  alignment: Alignment.centerLeft,
                                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(20, 10, 20, 10))
                              ),
                              icon: buttonIcon(value[0]),
                              label: Text(buttonText(value))
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
  Widget buildIconButton(String action) {
    if(action == 'autoscroll') {
      // custom build to add progress indicator to slideshow button
      return GestureDetector(
        onLongPress: () {
          buttonHold(action);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            if(autoScroll)
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
          ]
        )
      );
    } else {
      return GestureDetector(
        onLongPress: () {
          buttonHold(action);
        },
        child: IconButton(
          icon: buttonIcon(action),
          color: Colors.white,
          onPressed: () {
            buttonClick(action);
          },
        ),
      );
    }
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
        icon = widget.fetched[widget.searchGlobals.viewedIndex.value].isFavourite ? Icons.favorite : Icons.favorite_border;
        break;
      case("share"):
        icon = Icons.share;
    }
    return Icon(icon);
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
        label = widget.fetched[widget.searchGlobals.viewedIndex.value].isFavourite ? 'Unfavourite' : defaultLabel;
        break;
      default:
        // use default text
        label = defaultLabel;
        break;
    }
    return label;
  }

  // execute button action
  void buttonClick(String action) {
    switch(action) {
      case("info"):
        viewerScaffoldKey.currentState?.openEndDrawer();
        break;
      case("open"):
        ServiceHandler.launchURL(widget.fetched[widget.searchGlobals.viewedIndex.value].postURL);
        break;
      case("autoscroll"):
        autoScrollState(!autoScroll);
        break;
      case("snatch"):
        getPerms();
        // call a function to save the currently viewed image when the save button is pressed
        widget.snatchHandler.queue([widget.fetched[widget.searchGlobals.viewedIndex.value]], widget.settingsHandler.jsonWrite, widget.searchGlobals.selectedBooru, widget.settingsHandler.snatchCooldown);
        break;
      case("favourite"):
        setState(() {
          widget.fetched[widget.searchGlobals.viewedIndex.value].isFavourite = !widget.fetched[widget.searchGlobals.viewedIndex.value].isFavourite;
          widget.settingsHandler.dbHandler.updateBooruItem(widget.fetched[widget.searchGlobals.viewedIndex.value],"local");
        });
        break;
      case("share"):
        onShareClick();
        break;
    }
  }

  // long tap action
  void buttonHold(String action) {
    switch(action) {
      case("share"):
        onShareHold();
        break;
    }
  }

  void onShareClick(){
    String shareSetting = widget.settingsHandler.shareAction;
    switch(shareSetting) {
      case 'Post URL':
        if(widget.fetched[widget.searchGlobals.viewedIndex.value].postURL != '') {
          shareTextAction(widget.fetched[widget.searchGlobals.viewedIndex.value].postURL);
        } else {
          ServiceHandler.displayToast("No Post URL!");
        }
        break;
      case 'File URL':
        shareTextAction(widget.fetched[widget.searchGlobals.viewedIndex.value].fileURL);
        break;
      case 'Hydrus':
        shareHydrusAction(widget.fetched[widget.searchGlobals.viewedIndex.value]);
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
    if(await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 10);
    }
    // Ignore share setting on long press
    showShareDialog(showTip: false);
  }

}
