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

import '../DesktopHome.dart';
import 'TagView.dart';

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

  ViewerPage(this.fetched, this.index, this.searchGlobals, this.settingsHandler,
      this.snatchHandler);
  @override
  _ViewerPageState createState() => _ViewerPageState();
}

class _ViewerPageState extends State<ViewerPage> {
  PreloadPageView.PageController? controller;
  PageController? controllerLinux;
  ImageWriter writer = new ImageWriter();
  FocusNode kbFocusNode = FocusNode();
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
      print("widget index: ${widget.index}");
      print("searchglobals index: ${widget.searchGlobals.viewedIndex!.value}");
      widget.searchGlobals.viewedIndex!.value = widget.index;
    });
    kbFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    String appBarTitle = "${(widget.searchGlobals.viewedIndex!.value + 1).toString()}/${widget.fetched.length.toString()}";
    //kbFocusNode.requestFocus();
    return Scaffold(
      appBar: HideableAppBar(appBarTitle, appBarActions(), widget.searchGlobals, widget.settingsHandler.autoHideImageBar),
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
              child: Platform.isAndroid ? androidPageBuilder() : linuxPageBuilder(),
            // ),
          )
        )
      )
    );
  }
  @override
  void dispose(){
    kbFocusNode.dispose();
    super.dispose();
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
                    onLongPress: () {
                      print('longpress');
                      widget.searchGlobals.displayAppbar!.value =
                      !widget.searchGlobals.displayAppbar!.value;
                    },
                    child: isVideo
                        ? VideoApp(
                        widget.fetched[index],
                        index,
                        widget.searchGlobals.viewedIndex!.value,
                        widget.settingsHandler)
                        : MediaViewer(
                        widget.fetched[index],
                        index,
                        widget.searchGlobals.viewedIndex!.value,
                        widget.settingsHandler)));
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
    String? path = await ImageWriter().getCachePath(item.fileURL!, 'media');
    ServiceHandler serviceHandler = new ServiceHandler();
    ImageWriter writer = new ImageWriter();

    if(path != null) {
      // File is already in cache - share from there
      await serviceHandler.loadShareFileIntent(path, (item.isVideo() ? 'video' : 'image') + '/' + item.fileExt!);
    } else {
      // File not in cache - load from network, share, delete from cache afterwards
      ServiceHandler.displayToast("Loading file from network...\nPlease wait");
      var request = await HttpClient().getUrl(Uri.parse(item.fileURL!));
      var response = await request.close();
      Uint8List bytes = await consolidateHttpClientResponseBytes(response);
      final File cacheFile = await writer.writeCacheFromBytes(item.fileURL!, bytes, 'media');
      path = cacheFile.path;
      await serviceHandler.loadShareFileIntent(path, (item.isVideo() ? 'video' : 'image') + '/' + item.fileExt!);

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
        onPressed: () async {
          getPerms();
          // call a function to save the currently viewed image when the save button is pressed
          widget.snatchHandler.queue([widget.fetched[widget.searchGlobals.viewedIndex!.value]], widget.settingsHandler.jsonWrite, widget.searchGlobals.selectedBooru!.name!, widget.settingsHandler.snatchCooldown);
        },
      ),
      IconButton(icon: Icon(Icons.share),
          onPressed: () {
            String shareSetting = widget.settingsHandler.shareAction!;
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
      widget.settingsHandler.dbEnabled ?
      IconButton(
        icon: Icon(widget.fetched[widget.searchGlobals.viewedIndex!.value].isFavourite ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          setState(() {
            widget.fetched[widget.searchGlobals.viewedIndex!.value].isFavourite = !widget.fetched[widget.searchGlobals.viewedIndex!.value].isFavourite;
            widget.settingsHandler.dbHandler.updateBooruItem(widget.fetched[widget.searchGlobals.viewedIndex!.value]);
          });
        },
      ) : Container(),
      IconButton(
        icon: Icon(Icons.public),
        onPressed: () {
            ServiceHandler.launchURL(widget.fetched[widget.searchGlobals.viewedIndex!.value].postURL);
        },
      ),
      IconButton(
        icon: Icon(Icons.info),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  child: TagView(widget.fetched[widget.searchGlobals.viewedIndex!.value], widget.searchGlobals),
                );
              });
        },
      ),
    ];
  }
}
