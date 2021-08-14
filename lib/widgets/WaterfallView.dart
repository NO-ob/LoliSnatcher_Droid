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
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ViewUtils.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';

import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/widgets/ViewerPage.dart';
import 'package:LoliSnatcher/widgets/CachedThumbBetter.dart';

var volumeKeyChannel = Platform.isAndroid ? EventChannel('com.noaisu.loliSnatcher/volume') : null;


class WaterfallView extends StatefulWidget {
  final SearchGlobal tab;
  final int globalIndex;
  WaterfallView(this.tab, this.globalIndex);
  @override
  _WaterfallState createState() => _WaterfallState();
}

class _WaterfallState extends State<WaterfallView> {
  final SettingsHandler settingsHandler = Get.find();
  final SearchHandler searchHandler = Get.find();

  bool inViewer = false;
  Timer? loadingDelay;
  FocusNode kbFocusNode = FocusNode();
  StreamSubscription? volumeListener;

  @override
  void initState() {
    super.initState();
    initView();
  }

  @override
  void didUpdateWidget(WaterfallView oldWidget) {
    bool isTabChanged = widget.tab.id != oldWidget.tab.id;
    if(isTabChanged) {
      initView();
    }
    super.didUpdateWidget(oldWidget);
  }

  void initView() {
    // reset bools
    searchHandler.isLastPage(false);
    searchHandler.isLoading(true);
    inViewer = false;

    if(this.mounted) setState(() { });

    // restore scroll position on tab change
    if (searchHandler.gridScrollController.hasClients) {
      searchHandler.gridScrollController.jumpTo(widget.tab.scrollPosition);
    } else { // if (widget.tab.scrollPosition != 0) {
      searchHandler.gridScrollController = AutoScrollController(initialScrollOffset: widget.tab.scrollPosition);
    }

    // 
    widget.tab.viewedIndex.removeListener(jumpTo);
    widget.tab.viewedIndex.addListener(jumpTo);
    ServiceHandler.setVolumeButtons(!settingsHandler.useVolumeButtonsForScroll);
    setVolumeListener();

    // restore isLastPage state
    if(widget.tab.booruHandler.locked.value) {
      searchHandler.isLastPage(true);
    }

    // trigger first load OR get old filteredFetched list
    bool isNewSearch = widget.tab.booruHandler.filteredFetched.length == 0;
    // print('isNEW: $isNewSearch ${widget.globalIndex} ${widget.tab.id}');
    if(isNewSearch) { // don't trigger search if there are items inside booruHandler
      filteredSearch();
      // searchHandler.searchAction(widget.tab.tags, null);
    } else {
      searchHandler.isLoading(false);
    }

    if(this.mounted) setState(() { });

    // print('GRID INIT');
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

        final double offset = max(searchHandler.gridScrollController.offset + (settingsHandler.volumeButtonsScrollSpeed * dir), -20);
        searchHandler.gridScrollController.animateTo(offset, duration: Duration(milliseconds: 200), curve: Curves.linear);
      }
    });
  }

  @override
  void dispose() {
    widget.tab.viewedIndex.removeListener(jumpTo);
    kbFocusNode.dispose();
    volumeListener?.cancel();
    ServiceHandler.setVolumeButtons(true);
    loadingDelay?.cancel();
    super.dispose();
  }

  void jumpTo() {
    // ViewUtils.jumpToItem(searchHandler.viewedIndex.value, searchHandler, searchHandler.gridScrollController, context);
    searchHandler.gridScrollController.scrollToIndex(
      widget.tab.viewedIndex.value,
      duration: Duration(milliseconds: 300),
      preferPosition: AutoScrollPosition.begin
    );
  }

  void filteredSearch() async {
    // do nothing if reached the end or detected an error
    if(searchHandler.isLastPage.value) return;
    if(widget.tab.booruHandler.errorString.isNotEmpty) return;

    // request total image count if not already loaded
    if(widget.tab.booruHandler.totalCount.value == 0) {
      widget.tab.booruHandler.searchCount(widget.tab.tags);
    }

    // if not last page - set loading state and increment page
    if (!widget.tab.booruHandler.locked.value) {
      searchHandler.isLoading(true);
      widget.tab.booruHandler.pageNum++;
    }
    if(this.mounted) setState(() { });

    // fetch new items, but get results from booruHandler and not search itself
    List<BooruItem> temp = await widget.tab.booruHandler.Search(widget.tab.tags, null);
    // print('FINISHED SEARCH: ${temp.length}');

    // lock new loads if handler detected last page (previous filteredFetched length == current length)
    if (widget.tab.booruHandler.locked.value && !searchHandler.isLastPage.value) {
      searchHandler.isLastPage(true);
    }

    // desktop view first load setter
    if (widget.tab.booruHandler.filteredFetched.length > 0){
      if(widget.tab.currentItem.value.fileURL.isEmpty){
        // print("setting booruItem value");
        widget.tab.currentItem.value = widget.tab.booruHandler.filteredFetched[0];
      }
    }
    
    // delay every new page load after fetching 100+ images
    if(widget.tab.booruHandler.filteredFetched.length > 100) {
      loadingDelay = Timer(Duration(milliseconds: 200), () {
        searchHandler.isLoading(false);
        if(this.mounted) setState(() { });
      });
    } else {
      searchHandler.isLoading(false);
    }

    if(this.mounted) {
      // print('RESTATE');
      setState(() { });
    }
    // this.mounted prevents an exception on first load
  }

  void retryLastPage() {
    widget.tab.booruHandler.errorString.value = '';
    widget.tab.booruHandler.locked.value = false;
    searchHandler.isLastPage(false);
    widget.tab.booruHandler.pageNum--;
    setState(() { });
    filteredSearch();
  }

  void viewerCallback() {
    // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    ServiceHandler.makeNormal();
    kbFocusNode.requestFocus();
    inViewer = false;
    setVolumeListener();
  }

  void onThumbTap(int index) {
    // Load the image viewer
    kbFocusNode.unfocus();
    if (settingsHandler.appMode == "Mobile"){
      inViewer = true;
      volumeListener?.cancel();

      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, anim1, anim2) => 
            // Opacity(opacity: 0.5, child: ViewerPage(index, viewerCallback)),
            ViewerPage(index, viewerCallback),
          fullscreenDialog: true,
          opaque: false,
          transitionDuration: Duration(milliseconds: 300),
          barrierColor: Colors.black26,
        ),
      );
      // .whenComplete(() { }); // doesn't work - fires immediately, NOT after route closing
    } else {
      widget.tab.currentItem.value = widget.tab.booruHandler.filteredFetched[index];
    }
  }

  void onThumbLongPress(int index) {
    if (widget.tab.selected.contains(index)) {
      widget.tab.selected.remove(index);
    } else {
      widget.tab.selected.add(index);
    }
    setState(() { });
  }

  Widget cardItemBuild(int index, int columnsCount) {
    return Obx(() {
      bool isSelected = widget.tab.selected.contains(index);
      bool isCurrent = settingsHandler.appMode != 'Mobile' && widget.tab.currentItem.value.fileURL == widget.tab.booruHandler.fetched[index].fileURL;
      return AutoScrollTag(
        highlightColor: Colors.red,
        key: ValueKey(index),
        controller: searchHandler.gridScrollController,
        index: index,
        child: Material(
          borderOnForeground: true,
          child: Ink(
            decoration: (isCurrent || isSelected)
              ? BoxDecoration(
                border: Border.all(
                  color: isCurrent ? Get.theme.primaryColor : Get.theme.accentColor,
                  width: 4.0
                ),
              )
              : null,
            child: InkResponse(
              enableFeedback: true,
              highlightShape: BoxShape.rectangle,
              containedInkWell: false,
              highlightColor: Get.theme.accentColor,
              child: sampleorThumb(index, columnsCount, widget.tab),
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
    });
  }

  /* This will return an Image from the booruItem and will use either the sample url
  * or the thumbnail url depending on the users settings (sampleURL is much higher quality)
  */
  Widget sampleorThumb(int index, int columnCount, SearchGlobal searchGlobal) {
    BooruItem item = searchGlobal.booruHandler.filteredFetched[index];
    IconData itemIcon = ViewUtils.getFileIcon(item.mediaType);

    List<List<String>> parsedTags = settingsHandler.parseTagsList(item.tagsList, isCapped: false);
    bool isHated = parsedTags[0].length > 0;
    bool isLoved = parsedTags[1].length > 0;
    bool isSound = parsedTags[2].length > 0;

    return Container( // ClipRRect
      // borderRadius: BorderRadius.circular(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
      ),
      child: Stack(
        alignment: settingsHandler.previewDisplay == "Square" ? Alignment.center : Alignment.bottomCenter,
        children: [
          // CachedThumb(item, index, searchGlobal, columnCount, isHated, true),
          // CachedThumbNew(item, index, searchGlobal, columnCount, true),
          CachedThumbBetter(item, index, searchGlobal, columnCount, true),
          Container(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.66),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5))
              ),
              child: Obx(() => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('  ${(index + 1)}  ', style: TextStyle(fontSize: 10, color: Colors.white)),

                  if(item.isFavourite.value || isLoved)
                    Icon(
                      item.isFavourite.value ? Icons.favorite : Icons.star,
                      color: item.isFavourite.value ? Colors.red : Colors.grey,
                      size: 14,
                    ),

                  if(item.isSnatched.value)
                    Icon(
                      Icons.save_alt,
                      color: Colors.white,
                      size: 14,
                    ),

                  if(isSound)
                    Icon(
                      Icons.volume_up_rounded,
                      color: Colors.white,
                      size: 14,
                    ),

                  Icon(
                    itemIcon,
                    color: Colors.white,
                    size: 14,
                  ),
                ],
              )),
            ),
          ),
        ]
      )
    );
  }

  Widget gridBuilder() {
    return Obx(() {
      int columnsCount =
        (MediaQuery.of(context).orientation == Orientation.portrait)
            ? settingsHandler.portraitColumns
            : settingsHandler.landscapeColumns;

      return GridView.builder(
        controller: searchHandler.gridScrollController,
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        addAutomaticKeepAlives: true,
        cacheExtent: 100,
        shrinkWrap: false,
        itemCount: widget.tab.booruHandler.filteredFetched.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columnsCount,
          childAspectRatio: settingsHandler.previewDisplay == 'Square' ? 1 : 9/16
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
    });
  }

  Widget staggeredBuilder() {
    // TODO flutter upgrade to 2.0.6 seems to prevent memory overflow and stutter on new images a little, but it still won't unload things that are not in view
    return Obx(() {
      int columnsCount =
        (MediaQuery.of(context).orientation == Orientation.portrait)
            ? settingsHandler.portraitColumns
            : settingsHandler.landscapeColumns;
      double itemMaxWidth = MediaQuery.of(context).size.width / columnsCount;
      double itemMaxHeight = MediaQuery.of(context).size.height * 0.6;

      return StaggeredGridView.countBuilder(
        controller: searchHandler.gridScrollController,
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        addAutomaticKeepAlives: true,
        shrinkWrap: true,
        itemCount: widget.tab.booruHandler.filteredFetched.length,
        crossAxisCount: columnsCount,
        itemBuilder: (BuildContext context, int index) {
          double? widthData = widget.tab.booruHandler.filteredFetched[index].fileWidth ?? null;
          double? heightData = widget.tab.booruHandler.filteredFetched[index].fileHeight ?? null;
          
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
    });
  }

  @override
  Widget build(BuildContext context) {
    // super.build(context);

    // if (FocusScope.of(context).focusedChild == null){
      // print("kb focus node requesting focus");
      //kbFocusNode.requestFocus();
    // }

    // print('BUILD CALL: ${widget.tab.booruHandler.filteredFetched.length}');

    return RawKeyboardListener(
      autofocus: false,
      focusNode: kbFocusNode,
      onKey: (RawKeyEvent event){
        if (event.runtimeType == RawKeyDownEvent){
          if(event.isKeyPressed(LogicalKeyboardKey.arrowDown) || event.isKeyPressed(LogicalKeyboardKey.keyJ)){
            searchHandler.gridScrollController.animateTo(searchHandler.gridScrollController.offset + 50, duration: Duration(milliseconds: 50), curve: Curves.linear);
          } else if(event.isKeyPressed(LogicalKeyboardKey.arrowUp) || event.isKeyPressed(LogicalKeyboardKey.keyK)){
            searchHandler.gridScrollController.animateTo(searchHandler.gridScrollController.offset - 50, duration: Duration(milliseconds: 50), curve: Curves.linear);
          }
        }
      },
      child: Column(
        children: [
          // Obx(() => Center(child: Text('Loaded/Total: ${widget.tab.booruHandler.filteredFetched.length}/${widget.tab.booruHandler.totalCount.value}'))),

          Expanded(
            child: NotificationListener<ScrollUpdateNotification>(
              child: Scrollbar(
                controller: searchHandler.gridScrollController,
                interactive: true,
                thickness: 6,
                radius: Radius.circular(10),
                isAlwaysShown: true,
                child: RefreshIndicator(
                  displacement: 80,
                  strokeWidth: 4,
                  color: Get.theme.accentColor,
                  onRefresh: () async {
                    searchHandler.searchAction(widget.tab.tags, null);
                  },
                  // TODO: temporary fallback to waterfall if booru doesn't give image sizes in api, until staggered view is fixed
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height + 100),
                    child: (settingsHandler.previewDisplay != 'Staggered' || !widget.tab.booruHandler.hasSizeData) ? gridBuilder() : staggeredBuilder()
                  ),
                ),
              ),
              onNotification: (notif) {
                widget.tab.scrollPosition = searchHandler.gridScrollController.offset;

                //print('SCROLL NOTIFICATION');
                //print(searchHandler.gridScrollController.position.maxScrollExtent);
                //print(notif.metrics); // pixels before viewport, in viewport, after viewport

                bool isNotAtStart = notif.metrics.pixels > 0;
                bool isAtOrNearEdge = notif.metrics.atEdge || notif.metrics.pixels > (notif.metrics.maxScrollExtent - (notif.metrics.extentInside * 2)); // trigger new page when at edge or scroll position is less than 2 viewports
                bool isScreenFilled = notif.metrics.extentBefore != 0 || notif.metrics.extentAfter != 0; // for cases when first page doesn't fill the screen

                if(!searchHandler.isLoading.value) {
                  if (!isScreenFilled || (isNotAtStart && isAtOrNearEdge)) {
                    filteredSearch();
                  }
                }
                return true;
              },
            )
          ),

          Obx(() {
            if(searchHandler.isLastPage.value) {
              // if last page...
              if(widget.tab.booruHandler.filteredFetched.length == 0) {
                // ... and no items loaded
                return Expanded(child:Center(child: Text('No Data Loaded')));
              } else { //if(widget.tab.booruHandler.filteredFetched.length > 0) {
                // .. has items loaded
                return Center(
                  child: GestureDetector(
                    onTap: retryLastPage,
                    child: Text('You Reached the End (${widget.tab.booruHandler.pageNum} pages)')
                  )
                );
              }
            } else {
              // if not last page...
              if(searchHandler.isLoading.value) {
                // ... and is currently loading
                return Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      const SizedBox(width: 15),
                      Text('Loading page #${widget.tab.booruHandler.pageNum}')
                    ]
                  )
                );
              } else {
                if (widget.tab.booruHandler.errorString.isNotEmpty) {
                  // ... if error happened
                  return Center(
                    child: GestureDetector(
                      onTap: retryLastPage,
                      child: Column(children: [
                        Text('Error happened when loading page #${widget.tab.booruHandler.pageNum}:'),
                        Text('${widget.tab.booruHandler.errorString}'),
                        Text('Tap Here to try again'),
                      ])
                    )
                  );
                } else if(widget.tab.booruHandler.filteredFetched.length == 0) {
                  // ... no items loaded
                  return Expanded(child: Center(
                    child: GestureDetector(
                      onTap: retryLastPage,
                      child: Column(children: [
                        Text('No data loaded:'),
                        Text('${widget.tab.booruHandler.errorString}'),
                        Text('Tap Here to try again'),
                      ])
                    )
                  ));
                } else {
                  return const SizedBox();
                }
              }
            }
          }),
        ],
      )
    );
  }
}
