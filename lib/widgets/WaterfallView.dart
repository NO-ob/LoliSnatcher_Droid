import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SnatchHandler.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';

import 'package:LoliSnatcher/ViewUtils.dart';
import 'package:LoliSnatcher/libBooru/BooruHandlerFactory.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/widgets/ViewerPage.dart';


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
  ScrollController gridController = ScrollController();
  bool isLastPage = false, isLoading = true;
  Timer? loadingDelay;
  List<BooruItem> fetched = [];
  FocusNode kbFocusNode = FocusNode();

  void setBooruHandler() {
    List temp = BooruHandlerFactory().getBooruHandler(widget.searchGlobals.selectedBooru!, widget.settingsHandler.limit, widget.settingsHandler.dbHandler);
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
        gridController = ScrollController(initialScrollOffset: widget.searchGlobals.scrollPosition);
      });
    }

    // trigger first load OR get old fetched list
    bool isNewSearch = widget.searchGlobals.booruHandler!.fetched.length == 0;
    if(isNewSearch) { // don't trigger search if there are items inside booruhandler
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
    widget.searchGlobals.viewedIndex!.addListener(jumpTo);
  }

  @override
  void dispose() {
    widget.searchGlobals.viewedIndex!.removeListener(jumpTo);
    kbFocusNode.dispose();
    loadingDelay?.cancel();
    super.dispose();
  }

  void jumpTo(){
    ViewUtils.jumpToItem(widget.searchGlobals.viewedIndex!.value, widget.searchGlobals, gridController, widget.settingsHandler, context);
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
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: columnsCount),
      itemBuilder: (BuildContext context, int index) {
        bool isSelected = widget.searchGlobals.selected.contains(index);
        return Card(
          margin: EdgeInsets.all(2),
          child: GridTile(
            // Inkresponse is used so the tile can have an onclick function
            child: Material(
              borderOnForeground: true,
              child: Ink(
                decoration: isSelected
                    ? BoxDecoration(
                  border: Border.all(
                      color: Get.context!.theme.accentColor,
                      width: 4.0),
                )
                    : null,
                child: InkResponse(
                  enableFeedback: true,
                  highlightShape: BoxShape.rectangle,
                  containedInkWell: true,
                  highlightColor: Get.context!.theme.accentColor,
                  child: ViewUtils.sampleorThumb(fetched[index], columnsCount,widget.settingsHandler),
                  onTap: () {
                    // Load the image viewer
                    kbFocusNode.unfocus();
                    if (widget.settingsHandler.appMode == "Mobile"){
                      Get.dialog(
                        ViewerPage(fetched, index, widget.searchGlobals, widget.settingsHandler, widget.snatchHandler),
                        transitionDuration: Duration(milliseconds: 200),
                        // barrierColor: Colors.transparent
                      ).whenComplete(() {
                        //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
                        kbFocusNode.requestFocus();
                      });
                    } else {
                      widget.searchGlobals.currentItem.value = fetched[index];
                    }


                    // Get.to(ImagePage(fetched, index, widget.searchGlobals, widget.settingsHandler, widget.snatchHandler));
                  },
                  onLongPress: () {
                    if (widget.searchGlobals.selected.contains(index)) {
                      setState(() {
                        widget.searchGlobals.selected.remove(index);
                      });
                    } else {
                      setState(() {
                        widget.searchGlobals.selected.add(index);
                      });
                    }
                  },
                ),
              ),
            ),
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
    double itemMaxHeight = MediaQuery.of(context).size.height * 0.75;

    return StaggeredGridView.countBuilder(
      controller: gridController,
      physics: BouncingScrollPhysics(),
      addAutomaticKeepAlives: true,
      itemCount: fetched.length,
      crossAxisCount: columnsCount,
      itemBuilder: (BuildContext context, int index) {
        bool isSelected = widget.searchGlobals.selected.contains(index);

        double? widthData = fetched[index].fileWidth ?? null;
        double? heightData = fetched[index].fileHeight ?? null;
        
        double possibleWidth = itemMaxWidth;
        double possibleHeight = itemMaxWidth;
        bool hasSizeData = heightData != null && widthData != null;
        if(hasSizeData) {
          double aspectRatio = widthData / heightData;
          possibleHeight = possibleWidth / aspectRatio;
        }
        // force to use minimum 100 px and max 75% of screen height
        possibleHeight = max(min(itemMaxHeight, possibleHeight), 100);
        
        return Container(
          height: possibleHeight,
          width: possibleWidth,
          // constraints: hasSizeData
          //     ? BoxConstraints(minHeight: possibleHeight, maxHeight: possibleHeight, minWidth: possibleWidth, maxWidth: possibleWidth)
          //     : BoxConstraints(minHeight: possibleWidth, maxHeight: double.infinity, minWidth: possibleWidth, maxWidth: possibleWidth),
          // Inkresponse is used so the tile can have an onclick function
          child: Material(
            borderOnForeground: true,
            child: Ink(
              decoration: isSelected ? BoxDecoration(border: Border.all(color: Get.context!.theme.accentColor, width: 4.0),) : null,
              child: InkResponse(
                enableFeedback: true,
                highlightShape: BoxShape.rectangle,
                containedInkWell: true,
                highlightColor: Get.context!.theme.accentColor,
                child: ViewUtils.sampleorThumb(fetched[index], columnsCount,widget.settingsHandler),
                onTap: () {
                  // Load the image viewer
                  kbFocusNode.unfocus();
                  if (widget.settingsHandler.appMode == "Mobile"){
                    Get.dialog(
                      ViewerPage(fetched, index, widget.searchGlobals, widget.settingsHandler, widget.snatchHandler),
                      transitionDuration: Duration(milliseconds: 200),
                      // barrierColor: Colors.transparent
                    ).whenComplete(() {
                      //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
                      kbFocusNode.requestFocus();
                    });
                  } else {
                    widget.searchGlobals.currentItem.value = fetched[index];
                  }

                  // Get.to(ImagePage(fetched, index, widget.searchGlobals, widget.settingsHandler, widget.snatchHandler));
                },
                onLongPress: () {
                  if (widget.searchGlobals.selected.contains(index)) {
                    setState(() {
                      widget.searchGlobals.selected.remove(index);
                    });
                  } else {
                    setState(() {
                      widget.searchGlobals.selected.add(index);
                    });
                  }
                },
              ),
            ),
          ),
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

    int columnsCount =
        (MediaQuery.of(context).orientation == Orientation.portrait)
            ? widget.settingsHandler.portraitColumns
            : widget.settingsHandler.landscapeColumns;
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
                isAlwaysShown: true,
                child: RefreshIndicator(
                  displacement: 80,
                  strokeWidth: 4,
                  onRefresh: () async {
                    widget.searchAction(widget.searchGlobals.tags);
                    return;
                  },
                  // TODO: temporary fallback to waterfall if booru doesn't give image sizes in api, until staggered view is fixed
                  child: (widget.settingsHandler.previewDisplay == 'Waterfall' || !widget.searchGlobals.booruHandler!.hasSizeData) ? gridBuilder() : staggeredBuilder(),
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
            Center(child: Text('You Reached the End (${widget.searchGlobals.pageNum.toString()} pages)')),
          if(isLastPage && fetched.length == 0)
            Expanded(child:Center(child: Text('No Data Loaded'))),
        ],
      )
    );
  }
}
