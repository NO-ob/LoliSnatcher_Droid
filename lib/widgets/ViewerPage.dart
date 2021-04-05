import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
// import 'package:preload_page_view/preload_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:vibration/vibration.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SnatchHandler.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ImageWriter.dart';
import 'package:LoliSnatcher/getPerms.dart';

import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/widgets/MediaViewer.dart';
import 'package:LoliSnatcher/widgets/PreloadPageView.dart' as PreloadPageView;
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

  ViewerPage(this.fetched, this.index, this.searchGlobals, this.settingsHandler, this.snatchHandler);
  @override
  _ViewerPageState createState() => _ViewerPageState();
}

class _ViewerPageState extends State<ViewerPage> {
  PreloadPageView.PageController? controller;
  PageController? controllerLinux;
  ImageWriter writer = new ImageWriter();
  FocusNode kbFocusNode = FocusNode();
  StreamSubscription? volumeListener;

  @override
  void initState() {
    super.initState();
    controller = PreloadPageView.PageController(
      initialPage: widget.index,
    );
    controllerLinux = PageController(
      initialPage: widget.index,
    );
    setState(() {
      // print("widget index: ${widget.index}");
      // print("searchglobals index: ${widget.searchGlobals.viewedIndex!.value}");
      widget.searchGlobals.viewedIndex!.value = widget.index;
    });
    kbFocusNode.requestFocus();
    ServiceHandler.disableSleep();

    // enable volume buttons if opened page is a video AND appbar is visible
    bool isVideo = widget.fetched[widget.index].isVideo();
    bool isVolumeAllowed = !widget.settingsHandler.useVolumeButtonsForScroll || (isVideo && widget.searchGlobals.displayAppbar!.value);
    ServiceHandler.setVolumeButtons(isVolumeAllowed);
  }

  @override
  Widget build(BuildContext context) {
    String appBarTitle = "${(widget.searchGlobals.viewedIndex!.value + 1).toString()}/${widget.fetched.length.toString()}";
    //kbFocusNode.requestFocus();
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: widget.settingsHandler.galleryBarPosition == 'Top' ? HideableAppBar(appBarTitle, appBarActions(), widget.searchGlobals, widget.settingsHandler.autoHideImageBar) : null,
      bottomNavigationBar: widget.settingsHandler.galleryBarPosition == 'Bottom' ? HideableAppBar(appBarTitle, appBarActions(), widget.searchGlobals, widget.settingsHandler.autoHideImageBar) : null,
      backgroundColor: Colors.transparent,
      body: PhotoViewGestureDetectorScope(
        // vertical to prevent swipe-to-dismiss when zoomed
        axis: Axis.vertical, // photo_view doesn't support locking both axises, so we use custom fork to fix for this
        child: Dismissible(
          direction: DismissDirection.vertical,
          // background: Container(color: Colors.black.withOpacity(0.3)),
          key: const Key('imagePageDismissibleKey'),
          resizeDuration: null, // Duration(milliseconds: 100),
          dismissThresholds: {DismissDirection.up: 0.2, DismissDirection.down: 0.2}, // Amount of swiped away which triggers dismiss
          onDismissed: (_) => Navigator.of(context).pop(),
          child: Center(
            // child: PhotoViewGestureDetectorScope(
            //   // horizontal to prevent triggering page change early when panning
            //   axis: Axis.horizontal,
              // The pageView builder will created a page for each image in the booruList(fetched)
              child: (Platform.isAndroid || Platform.isWindows) ? androidPageBuilder() : linuxPageBuilder(),
            // ),
          )
        )
      )
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    volumeListener?.cancel();
    volumeListener = volumeKeyChannel?.receiveBroadcastStream().listen((event) {
      int dir = 0;
      if (event == 'up') {
        dir = -1;
      } else if (event == 'down') {
        dir = 1;
      }

      // lastScrolledTo = math.max(math.min(lastScrolledTo + dir, widget.fetched.length), 0);
      int toPage = widget.searchGlobals.viewedIndex!.value + dir; // lastScrolledTo; 
      controller?.animateToPage(toPage, duration: Duration(milliseconds: 30), curve: Curves.easeInOut);
      // controller?.jumpToPage(toPage);
    });
  }

  @override
  void dispose(){
    volumeListener?.cancel();
    ServiceHandler.setVolumeButtons(true);
    kbFocusNode.dispose();
    super.dispose();
    ServiceHandler.enableSleep();
  }

  Widget androidPageBuilder() {
    return new RawKeyboardListener(
      autofocus: true,
      focusNode: kbFocusNode,
      onKey: (RawKeyEvent event){
        if(event.isKeyPressed(LogicalKeyboardKey.arrowRight) || event.isKeyPressed(LogicalKeyboardKey.keyH)){
          controller?.jumpToPage(widget.searchGlobals.viewedIndex!.value - 1);
        } else if(event.isKeyPressed(LogicalKeyboardKey.arrowRight) || event.isKeyPressed(LogicalKeyboardKey.keyL)){
          controller?.jumpToPage(widget.searchGlobals.viewedIndex!.value + 1);
        } else if (event.isKeyPressed(LogicalKeyboardKey.keyS)){
          widget.snatchHandler.queue([widget.fetched[widget.searchGlobals.viewedIndex!.value]], widget.settingsHandler.jsonWrite, widget.searchGlobals.selectedBooru!.name!,widget.settingsHandler.snatchCooldown);
        } else if (event.isKeyPressed(LogicalKeyboardKey.keyF)){
          if (widget.settingsHandler.dbEnabled){
            setState(() {
              widget.fetched[widget.searchGlobals.viewedIndex!.value].isFavourite = !widget.fetched[widget.searchGlobals.viewedIndex!.value].isFavourite;
              widget.settingsHandler.dbHandler.updateBooruItem(widget.fetched[widget.searchGlobals.viewedIndex!.value]);
            });
          }
        }
      },
      child: PreloadPageView.PageView.builder( // PreloadPageView.builder(
        preloadPagesCount: widget.settingsHandler.preloadCount,
        allowImplicitScrolling: true,
        scrollDirection: Axis.horizontal,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          String fileURL = widget.fetched[index].fileURL;
          bool isVideo = widget.fetched[index].isVideo();
          int preloadCount = widget.settingsHandler.preloadCount;
          bool isViewed = widget.searchGlobals.viewedIndex!.value == index;
          bool isNear = (widget.searchGlobals.viewedIndex!.value - index).abs() <= preloadCount;
          // print(fileURL);
          // print('isVideo: '+isVideo.toString());
          // Render only if viewed or in preloadCount range
          if (isViewed || isNear) {
            // Cut to the size of the container, prevents overlapping
            return ClipRect(
              child: GestureDetector(
                // onTapUp: (TapUpDetails tapInfo) {
                //   if(isVideo) return;
                //   // TODO WIP
                //   // change page if tapped on 20% of any side of the screen AND not a video
                //   double tapPosX = tapInfo.localPosition.dx;
                //   double screenWidth = MediaQuery.of(context).size.width;
                //   double sideThreshold = screenWidth / 5;

                //   if(tapPosX > (screenWidth - sideThreshold)) {
                //     controller?.animateToPage(widget.searchGlobals.viewedIndex!.value + 1, duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
                //   } else if(tapPosX < sideThreshold) {
                //     controller?.animateToPage(widget.searchGlobals.viewedIndex!.value - 1, duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
                //   }
                // },
                onLongPress: () async {
                  print('longpress');
                  bool newAppbarVisibility = !widget.searchGlobals.displayAppbar!.value;
                  widget.searchGlobals.displayAppbar!.value = newAppbarVisibility;

                  if(await Vibration.hasVibrator() ?? false) {
                    Vibration.vibrate(duration: 10);
                  }

                  // enable volume buttons if current page is a video AND appbar is set to visible
                  bool isVideo = widget.fetched[widget.searchGlobals.viewedIndex!.value].isVideo();
                  bool isVolumeAllowed = !widget.settingsHandler.useVolumeButtonsForScroll || (isVideo && newAppbarVisibility);
                  ServiceHandler.setVolumeButtons(isVolumeAllowed);
                },
                child: isVideo
                  ? VideoApp(
                    widget.fetched[index],
                    index,
                    widget.searchGlobals,
                    widget.settingsHandler,
                    true
                  )
                  : MediaViewer(
                    widget.fetched[index],
                    index,
                    widget.searchGlobals.viewedIndex!.value,
                    widget.settingsHandler
                  )
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
            widget.searchGlobals.viewedIndex!.value = index;
            kbFocusNode.requestFocus();
          });

          // enable volume buttons if new page is a video AND appbar is visible
          bool isVideo = widget.fetched[index].isVideo();
          bool isVolumeAllowed = !widget.settingsHandler.useVolumeButtonsForScroll || (isVideo && widget.searchGlobals.displayAppbar!.value);
          ServiceHandler.setVolumeButtons(isVolumeAllowed);
          // print('Page changed ' + index.toString());
        },
        itemCount: widget.fetched.length,
      ),
    );
  }

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


  /// Author: [Nani-Sore] ///
  void shareTextAction(String text) {
    ServiceHandler serviceHandler = new ServiceHandler();
    serviceHandler.loadShareTextIntent(text);
  }

  /// Author: [Nani-Sore] ///
  void shareFileAction() async {
    BooruItem item = widget.fetched[widget.searchGlobals.viewedIndex!.value];
    String? path = await ImageWriter().getCachePath(item.fileURL, 'media');
    ServiceHandler serviceHandler = new ServiceHandler();
    ImageWriter writer = new ImageWriter();

    if(path != null) {
      // File is already in cache - share from there
      await serviceHandler.loadShareFileIntent(path, (item.isVideo() ? 'video' : 'image') + '/' + item.fileExt);
    } else {
      // File not in cache - load from network, share, delete from cache afterwards
      ServiceHandler.displayToast("Loading file from network...\nPlease wait");
      var request = await HttpClient().getUrl(Uri.parse(item.fileURL));
      var response = await request.close();
      Uint8List bytes = await consolidateHttpClientResponseBytes(response);
      final File? cacheFile = await writer.writeCacheFromBytes(item.fileURL, bytes, 'media');
      if(cacheFile != null) {
        path = cacheFile.path;
        await serviceHandler.loadShareFileIntent(path, (item.isVideo() ? 'video' : 'image') + '/' + item.fileExt);
      } else {
        ServiceHandler.displayToast("Error!\nSomething went wrong when saving file to share");
      }

      // TODO: find a way to detect when share menu was closed, orherwise this is triggered immediately and file is deleted before sending to another app
      // writer.deleteFromCache(path, 'media');
    }
  }

  /// Author: [Nani-Sore] ///
  void showShareDialog({bool showTip = true}) {
    Get.dialog(
      InfoDialog('What to share',
        [
          TextButton(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20),
                  side: BorderSide(color: Get.context!.theme.accentColor),
                )
            ),
            onPressed: (){
              Navigator.of(context).pop();
              shareTextAction(widget.fetched[widget.searchGlobals.viewedIndex!.value].postURL);
            },
            child: Text('Post URL', style: TextStyle(color: Colors.white))
          ),
          TextButton(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20),
                  side: BorderSide(color: Get.context!.theme.accentColor),
                )
            ),
            onPressed: (){
              Navigator.of(context).pop();
              shareTextAction(widget.fetched[widget.searchGlobals.viewedIndex!.value].fileURL);
            },
            child: Text('File URL', style: TextStyle(color: Colors.white))
          ),
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20),
                side: BorderSide(color: Get.context!.theme.accentColor),
              )
            ),
            onPressed: (){
              Navigator.of(context).pop();
              shareFileAction();
            },
            child: Text('File', style: TextStyle(color: Colors.white))
          ),
          Text(showTip ? '[Tip]: You can set default action in settings' : '')
        ],
        CrossAxisAlignment.center,
      )
    );
  }

  List<Widget> appBarActions() {
    return [
      IconButton(
        icon: Icon(Icons.save),
        color: Colors.white,
        onPressed: () async {
          getPerms();
          // call a function to save the currently viewed image when the save button is pressed
          widget.snatchHandler.queue([widget.fetched[widget.searchGlobals.viewedIndex!.value]], widget.settingsHandler.jsonWrite, widget.searchGlobals.selectedBooru!.name!, widget.settingsHandler.snatchCooldown);
        },
      ),
      GestureDetector(
        onLongPress: () {
          // Ignore share setting on long press
          showShareDialog(showTip: false);
        },
        child: IconButton(
          icon: Icon(Icons.share),
          color: Colors.white,
          onPressed: () {
            String shareSetting = widget.settingsHandler.shareAction;
            switch(shareSetting) {
              case 'Post URL':
                shareTextAction(widget.fetched[widget.searchGlobals.viewedIndex!.value].postURL);
                break;
              case 'File URL':
                shareTextAction(widget.fetched[widget.searchGlobals.viewedIndex!.value].fileURL);
                break;
              case 'File':
                shareFileAction();
                break;

              case 'Ask':
              default:
                showShareDialog();
                break;
            }
          },
        ),
      ),
      widget.settingsHandler.dbEnabled ?
      IconButton(
        icon: Icon(widget.fetched[widget.searchGlobals.viewedIndex!.value].isFavourite ? Icons.favorite : Icons.favorite_border),
        color: Colors.white,
        onPressed: () {
          setState(() {
            widget.fetched[widget.searchGlobals.viewedIndex!.value].isFavourite = !widget.fetched[widget.searchGlobals.viewedIndex!.value].isFavourite;
            widget.settingsHandler.dbHandler.updateBooruItem(widget.fetched[widget.searchGlobals.viewedIndex!.value]);
          });
        },
      ) : Container(),
      IconButton(
        icon: Icon(Icons.public),
        color: Colors.white,
        onPressed: () {
            ServiceHandler.launchURL(widget.fetched[widget.searchGlobals.viewedIndex!.value].postURL);
        },
      ),
      IconButton(
        icon: Icon(Icons.info),
        color: Colors.white,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  child: TagView(widget.fetched[widget.searchGlobals.viewedIndex!.value], widget.searchGlobals, widget.settingsHandler),
                );
              });
        },
      ),
    ];
  }
}
