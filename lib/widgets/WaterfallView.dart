import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SnatchHandler.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ViewUtils.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';

import 'package:LoliSnatcher/libBooru/BooruHandlerFactory.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/widgets/ViewerPage.dart';

var volumeKeyChannel = Platform.isAndroid ? EventChannel('com.noaisu.loliSnatcher/volume') : null;


class WaterfallView extends StatefulWidget {
  final SearchGlobals searchGlobals;
  final SettingsHandler settingsHandler;
  final SnatchHandler snatchHandler;
  final Function searchAction;
  WaterfallView(this.settingsHandler, this.searchGlobals, this.snatchHandler, this.searchAction);
  @override
  _WaterfallState createState() => _WaterfallState();
}

class _WaterfallState extends State<WaterfallView> {
  // ScrollController gridController = ScrollController();
  AutoScrollController gridController = AutoScrollController();
  bool isLastPage = false, isLoading = true, inViewer = false;
  Timer? loadingDelay;
  List<BooruItem> fetched = [];
  FocusNode kbFocusNode = FocusNode();
  StreamSubscription? volumeListener;

  void setBooruHandler() {
    List temp = [];
    if (widget.settingsHandler.mergeEnabled && widget.searchGlobals.secondaryBooru != null){
      temp = BooruHandlerFactory().getBooruHandler([widget.searchGlobals.selectedBooru!,widget.searchGlobals.secondaryBooru!], widget.settingsHandler.limit, widget.settingsHandler.dbHandler);
    } else {
      temp = BooruHandlerFactory().getBooruHandler([widget.searchGlobals.selectedBooru!], widget.settingsHandler.limit, widget.settingsHandler.dbHandler);
    }
      widget.searchGlobals.booruHandler = temp[0];
      widget.searchGlobals.pageNum = temp[1];


  }

  @override
  void initState() {
    super.initState();
    // get booru handler
    if (widget.searchGlobals.booruHandler == null) {
      setBooruHandler();
    }

    // restore scroll position on tab change
    if (gridController.hasClients) {
      gridController.jumpTo(widget.searchGlobals.scrollPosition);
    } else if (widget.searchGlobals.scrollPosition != 0) {
      setState(() {
        // gridController = ScrollController(initialScrollOffset: widget.searchGlobals.scrollPosition);
        gridController = AutoScrollController(initialScrollOffset: widget.searchGlobals.scrollPosition);
      });
    }

    // trigger first load OR get old fetched list
    bool isNewSearch = widget.searchGlobals.booruHandler!.fetched.length == 0;
    if(isNewSearch) { // don't trigger search if there are items inside booruhandler
      setSearchCount();
      filteredSearch();
    } else {
      isLoading = false;
      fetched = widget.searchGlobals.booruHandler!.fetched;
      filterFetched();
    }

    // restore isLastPage state
    if(widget.searchGlobals.booruHandler!.locked) {
      isLastPage = true;
    }

    // Stops previous pages being forgotten when switching tabs
    widget.searchGlobals.viewedIndex.addListener(jumpTo);
    ServiceHandler.setVolumeButtons(!widget.settingsHandler.useVolumeButtonsForScroll);
    setVolumeListener();
  }

  void setVolumeListener() {
    volumeListener?.cancel();
    volumeListener = volumeKeyChannel?.receiveBroadcastStream().listen((event) {
      // print('in grid $event $inViewer');
      if(!inViewer){
        int dir = 0;
        if (event == 'up') {
          dir = -1;
        } else if (event == 'down') {
          dir = 1;
        }

        final double offset = max(gridController.offset + (widget.settingsHandler.volumeButtonsScrollSpeed * dir), -20);
        gridController.animateTo(offset, duration: Duration(milliseconds: 200), curve: Curves.linear);
      }
    });
  }

  @override
  void dispose() {
    widget.searchGlobals.viewedIndex.removeListener(jumpTo);
    kbFocusNode.dispose();
    volumeListener?.cancel();
    ServiceHandler.setVolumeButtons(true);
    loadingDelay?.cancel();
    super.dispose();
  }

  void jumpTo(){
    // ViewUtils.jumpToItem(widget.searchGlobals.viewedIndex.value, widget.searchGlobals, gridController, widget.settingsHandler, context);
    gridController.scrollToIndex(
      widget.searchGlobals.viewedIndex.value,
      duration: Duration(milliseconds: 10),
      preferPosition: AutoScrollPosition.begin
    );
  }

  void setSearchCount() {
    widget.searchGlobals.booruHandler!.searchCount(widget.searchGlobals.tags);
  }

  void filteredSearch() async {
    if(isLastPage) return;

    if (!widget.searchGlobals.booruHandler!.locked) {
      isLoading = true;
      widget.searchGlobals.pageNum++;
    }
    if(this.mounted) setState(() { });

    // fetch new items, but get results from booruhandler and not search itself
    // TODO is having a second copy of the list okay?
    await widget.searchGlobals.booruHandler!.Search(widget.searchGlobals.tags, widget.searchGlobals.pageNum);
    fetched = widget.searchGlobals.booruHandler!.fetched;

    // filter out items with hated images
    filterFetched();

    // lock new loads if handler detected last page (previous fetched length == current length)
    if (widget.searchGlobals.booruHandler!.locked && !isLastPage) {
      isLastPage = true;
    }
    
    // delay every new page load after fetching 100+ images
    if(fetched.length > 100) {
      loadingDelay = Timer(Duration(milliseconds: 200), () {
        isLoading = false;
        if(this.mounted) setState(() { });
      });
    } else {
      isLoading = false;
    }

    // desktop view first load setter?
    if (fetched.length > 0){
      if(widget.searchGlobals.currentItem.value.fileURL.isEmpty){
        print("setting booruItem value");
        widget.searchGlobals.currentItem.value = fetched[0];
      }
    }

    if(this.mounted) setState(() { });
    // this.mounted prevents an exception on first load
  }

  void filterFetched() {
    if(widget.settingsHandler.filterHated) {
      fetched = fetched.where((item) => widget.settingsHandler.parseTagsList(item.tagsList)[0].length == 0).toList();
    }
  }

  void retryLastPage() {
    widget.searchGlobals.booruHandler!.locked = false;
    isLastPage = false;
    widget.searchGlobals.pageNum--;
    setState(() { });
    filteredSearch();
  }

  void viewerCallback() {
    //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    kbFocusNode.requestFocus();
    inViewer = false;
    setVolumeListener();
  }

  void onThumbTap(int index) {
    // Load the image viewer
    kbFocusNode.unfocus();
    if (widget.settingsHandler.appMode == "Mobile"){
      inViewer = true;
      volumeListener?.cancel();

      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, anim1, anim2) => 
            // Opacity(opacity: 0.5, child: ViewerPage(fetched, index, widget.searchGlobals, widget.settingsHandler, widget.snatchHandler, viewerCallback)),
            ViewerPage(fetched, index, widget.searchGlobals, widget.settingsHandler, widget.snatchHandler, viewerCallback),
          fullscreenDialog: true,
          opaque: false,
          transitionDuration: Duration(milliseconds: 300),
          barrierColor: Colors.black26,
        ),
      );
      // .whenComplete(() { }); // doesn't work - fires immediately, NOT after route closing
    } else {
      widget.searchGlobals.currentItem.value = fetched[index];
    }
  }

  void onThumbLongPress(int index) {
    if (widget.searchGlobals.selected.contains(index)) {
      widget.searchGlobals.selected.remove(index);
    } else {
      widget.searchGlobals.selected.add(index);
    }
    setState(() { });
  }

  Widget cardItemBuild(int index, int columnsCount) {
    bool isSelected = widget.searchGlobals.selected.contains(index);

    return AutoScrollTag(
      highlightColor: Colors.red,
      key: ValueKey(index),
      controller: gridController,
      index: index,
      child: Material(
        borderOnForeground: true,
        child: Ink(
          decoration: isSelected
            ? BoxDecoration(
              border: Border.all(
                color: Get.context!.theme.accentColor,
                width: 4.0
              ),
            )
            : null,
          child: InkResponse(
            enableFeedback: true,
            highlightShape: BoxShape.rectangle,
            containedInkWell: true,
            highlightColor: Get.context!.theme.accentColor,
            child: ViewUtils.sampleorThumb(fetched[index], index, columnsCount, widget.settingsHandler, widget.searchGlobals),
            onTap: () {
              onThumbTap(index);
            },
            onLongPress: () {
              onThumbLongPress(index);
            },
          ),
        ),
      )
    );
  }

  Widget gridBuilder() {
    int columnsCount =
        (MediaQuery.of(context).orientation == Orientation.portrait)
            ? widget.settingsHandler.portraitColumns
            : widget.settingsHandler.landscapeColumns;

    return GridView.builder(
      controller: gridController,
      physics: BouncingScrollPhysics(),
      addAutomaticKeepAlives: true,
      cacheExtent: 100,
      itemCount: fetched.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnsCount,
        childAspectRatio: widget.settingsHandler.previewDisplay == 'Waterfall' ? 1 : 9/16
      ),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: EdgeInsets.all(2),
          child: GridTile(
            child: cardItemBuild(index, columnsCount),
          ),
        );
      },
    );
  }

  Widget staggeredBuilder() {
    int columnsCount =
        (MediaQuery.of(context).orientation == Orientation.portrait)
            ? widget.settingsHandler.portraitColumns
            : widget.settingsHandler.landscapeColumns;
    double itemMaxWidth = MediaQuery.of(context).size.width / columnsCount;
    double itemMaxHeight = MediaQuery.of(context).size.height * 0.6;

    // TODO flutter upgrade to 2.0.6 seems to prevent memory overflow and stutter on new images a little, but it still won't unload things that are not in view
    return StaggeredGridView.countBuilder(
      controller: gridController,
      physics: BouncingScrollPhysics(),
      addAutomaticKeepAlives: true,
      itemCount: fetched.length,
      crossAxisCount: columnsCount,
      itemBuilder: (BuildContext context, int index) {
        double? widthData = fetched[index].fileWidth ?? null;
        double? heightData = fetched[index].fileHeight ?? null;
        
        double possibleWidth = itemMaxWidth;
        double possibleHeight = itemMaxWidth;
        bool hasSizeData = heightData != null && widthData != null;
        if(hasSizeData) {
          double aspectRatio = widthData / heightData;
          possibleHeight = possibleWidth / aspectRatio;
        }
        // force to use minimum 100 px and max 60% of screen height
        possibleHeight = max(min(itemMaxHeight, possibleHeight), 100);
        
        return Container(
          height: possibleHeight,
          width: possibleWidth,
          // constraints: hasSizeData
          //     ? BoxConstraints(minHeight: possibleHeight, maxHeight: possibleHeight, minWidth: possibleWidth, maxWidth: possibleWidth)
          //     : BoxConstraints(minHeight: possibleWidth, maxHeight: double.infinity, minWidth: possibleWidth, maxWidth: possibleWidth),
          child: cardItemBuild(index, columnsCount),
        );
      },
      staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    // super.build(context);

    if (FocusScope.of(context).focusedChild == null){
      print("kb focus node requesting focus");
      //kbFocusNode.requestFocus();
    }

    return RawKeyboardListener(
      autofocus: false,
      focusNode: kbFocusNode,
      onKey: (RawKeyEvent event){
        if (event.runtimeType == RawKeyDownEvent){
          if(event.isKeyPressed(LogicalKeyboardKey.arrowDown) || event.isKeyPressed(LogicalKeyboardKey.keyJ)){
            gridController.animateTo(gridController.offset + 50, duration: Duration(milliseconds: 50), curve: Curves.linear);
          } else if(event.isKeyPressed(LogicalKeyboardKey.arrowUp) || event.isKeyPressed(LogicalKeyboardKey.keyK)){
            gridController.animateTo(gridController.offset - 50, duration: Duration(milliseconds: 50), curve: Curves.linear);
          }
        }
      },
      child: Column(
        children: [
          if(fetched.length == 0 && !isLastPage)
            Expanded(child: Center(child: CircularProgressIndicator())),

          Expanded(
            child: NotificationListener<ScrollUpdateNotification>(
              child: Scrollbar(
                controller: gridController,
                interactive: true,
                thickness: 6,
                radius: Radius.circular(10),
                isAlwaysShown: true,
                child: RefreshIndicator(
                  displacement: 80,
                  strokeWidth: 4,
                  color: Get.context!.theme.accentColor,
                  onRefresh: () async {
                    widget.searchAction(widget.searchGlobals.tags);
                  },
                  // TODO: temporary fallback to waterfall if booru doesn't give image sizes in api, until staggered view is fixed
                  child: (widget.settingsHandler.previewDisplay != 'Staggered' || !widget.searchGlobals.booruHandler!.hasSizeData) ? gridBuilder() : staggeredBuilder(),
                ),
              ),
              onNotification: (notif) {
                widget.searchGlobals.scrollPosition = gridController.offset;

                //print('SCROLL NOTIFICATION');
                //print(gridController.position.maxScrollExtent);
                //print(notif.metrics); // pixels before viewport, in viewport, after viewport

                bool isNotAtStart = notif.metrics.pixels > 0;
                bool isAtOrNearEdge = notif.metrics.atEdge || notif.metrics.pixels > (notif.metrics.maxScrollExtent - (notif.metrics.extentInside * 2)); // trigger new page when at edge or scroll position is less than 2 viewports
                bool isScreenFilled = notif.metrics.extentBefore != 0 || notif.metrics.extentAfter != 0; // for cases when first page doesn't fill the screen
                if(!isLoading) {
                  if (!isScreenFilled || (isNotAtStart && isAtOrNearEdge)) {
                    filteredSearch();
                  }
                }
                return true;
              },
            )
          ),

          if(isLoading && !isLastPage)
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  const SizedBox(width: 15),
                  Text('Loading page #${widget.searchGlobals.pageNum.toString()}')
                ]
              )
            ),

          if(isLastPage && fetched.length > 0) 
            Center(
              child: GestureDetector(
                onTap: retryLastPage,
                child: Text('You Reached the End (${widget.searchGlobals.pageNum.toString()} pages)')
              )
            ),
          if(isLastPage && fetched.length == 0)
            Expanded(child:Center(child: Text('No Data Loaded'))),
        ],
      )
    );
  }
}
