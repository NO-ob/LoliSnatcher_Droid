import 'dart:math';

import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SnatchHandler.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ViewUtils.dart';

import 'package:LoliSnatcher/libBooru/BooruHandlerFactory.dart';
import 'package:LoliSnatcher/widgets/ViewerPage.dart';


class StaggeredView extends StatefulWidget {
  final SearchGlobals searchGlobals;
  final SettingsHandler settingsHandler;
  final SnatchHandler snatchHandler;
  StaggeredView(this.settingsHandler, this.searchGlobals, this.snatchHandler);
  @override
  _StaggeredState createState() => _StaggeredState();
}

class _StaggeredState extends State<StaggeredView> {
  ScrollController gridController = ScrollController();
  bool isLastPage = false, isLoading = true;
  FocusNode kbFocusNode = FocusNode();

  void setBooruHandler() {
    List temp = BooruHandlerFactory()
        .getBooruHandler(widget.searchGlobals.selectedBooru!, widget.settingsHandler.limit, widget.settingsHandler.dbHandler);
    widget.searchGlobals.booruHandler = temp[0];
    widget.searchGlobals.pageNum = temp[1];
  }

  @override
  void initState() {
    super.initState();
    // Stops previous pages being forgotten when switching tabs
    if (widget.searchGlobals.booruHandler != null) {
    } else {
      setBooruHandler();
    }
    widget.searchGlobals.viewedIndex!.addListener(jumpTo);
  }
  void jumpTo(){
    ViewUtils.jumpToItem(widget.searchGlobals.viewedIndex!.value,widget.searchGlobals,gridController,widget.settingsHandler,context);
  }
  @override
  void dispose() {
    widget.searchGlobals.viewedIndex!.removeListener(jumpTo);
    kbFocusNode.dispose();
    super.dispose();
  }

  Future filteredSearch() async {
    var fetched = await widget.searchGlobals.booruHandler!.Search(widget.searchGlobals.tags, widget.searchGlobals.pageNum);
    if(widget.settingsHandler.filterHated) {
      fetched = fetched.where((item) => widget.settingsHandler.parseTagsList(item.tagsList)[0].length == 0).toList();
    }
    isLoading = false;
    return fetched;
  }

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    if (FocusScope.of(context).focusedChild == null){
      print("kb focus node requesting focus");
      //kbFocusNode.requestFocus();
    }
    if (widget.searchGlobals.booruHandler == null) {
      initState();
    }
    if (gridController.hasClients) {
      gridController.jumpTo(widget.searchGlobals.scrollPosition);
    } else if (widget.searchGlobals.scrollPosition != 0) {
      setState(() {
        gridController = ScrollController(
            initialScrollOffset: widget.searchGlobals.scrollPosition);
      });
    }

    int columnsCount =
        (MediaQuery.of(context).orientation == Orientation.portrait)
            ? widget.settingsHandler.portraitColumns
            : widget.settingsHandler.landscapeColumns;
    double itemMaxWidth = MediaQuery.of(context).size.width / columnsCount;
    double itemMaxHeight = MediaQuery.of(context).size.height * 0.75;

    return FutureBuilder(
        future: filteredSearch(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            if(widget.settingsHandler.appMode == "Desktop"){
              if(widget.searchGlobals.currentItem.value.fileURL == ""){
                widget.searchGlobals.currentItem.value = snapshot.data[0];
              }
            }
            // A notification listener is used to get the scroll position
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
              child:NotificationListener<ScrollUpdateNotification>(
                child: Scrollbar(
                  controller: gridController,
                  isAlwaysShown: true,
                  child: StaggeredGridView.countBuilder(
                    controller: gridController,
                    physics: BouncingScrollPhysics(),
                    addAutomaticKeepAlives: true,
                    itemCount: snapshot.data.length,
                    crossAxisCount: columnsCount * 2,
                    itemBuilder: (BuildContext context, int index) {
                      bool isSelected = widget.searchGlobals.selected.contains(index);

                      double? widthData = snapshot.data[index].fileWidth ?? null;
                      double? heightData = snapshot.data[index].fileHeight ?? null;
                      
                      double possibleWidth = itemMaxWidth;
                      double possibleHeight = itemMaxWidth;
                      if(heightData != null && widthData != null) {
                        double aspectRatio = widthData / heightData;
                        possibleHeight = possibleWidth / aspectRatio;
                      }
                      // force to use minimum 150 px and max 75% of screen height
                      possibleHeight = max(min(itemMaxHeight, possibleHeight), 100);
                      
                      return Container(
                        height: possibleHeight,
                        width: possibleWidth,
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
                              child: ViewUtils.sampleorThumb(snapshot.data[index], columnsCount,widget.settingsHandler),
                              onTap: () {
                                // Load the image viewer
                                kbFocusNode.unfocus();
                                if (widget.settingsHandler.appMode == "Mobile"){
                                  Get.dialog(
                                    ViewerPage(snapshot.data, index, widget.searchGlobals, widget.settingsHandler, widget.snatchHandler),
                                    transitionDuration: Duration(milliseconds: 200),
                                    // barrierColor: Colors.transparent
                                  ).whenComplete(() {
                                    //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
                                    kbFocusNode.requestFocus();
                                  });
                                } else {
                                  widget.searchGlobals.currentItem.value = snapshot.data[index];
                                }

                                // Get.to(ImagePage(snapshot.data, index, widget.searchGlobals, widget.settingsHandler, widget.snatchHandler));
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
                    staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  ),
                ),
                onNotification: (notif) {
                  widget.searchGlobals.scrollPosition = gridController.offset;
                  // If at bottom edge update state with incremented pageNum
                  // If at bottom edge update state with incremented pageNum
                  bool isNotAtStart = notif.metrics.pixels > 0;
                  // bool isNearEdge = notif.metrics.pixels > (notif.metrics.maxScrollExtent - (notif.metrics.extentInside * 2)); // trigger new page when scroll is < 2 viewports
                  bool isAtEdge = notif.metrics.atEdge || notif.metrics.pixels >= notif.metrics.maxScrollExtent;
                  bool isScreenFilled = notif.metrics.extentBefore > 0 || notif.metrics.extentAfter > 0; // for cases when first page doesn't fill the screen (example: too many thumbnails per row)
                  if ((isNotAtStart || !isScreenFilled) && isAtEdge && !isLoading) {
                    if (!widget.searchGlobals.booruHandler!.locked) {
                      setState(() {
                        isLoading = true;
                        widget.searchGlobals.pageNum++;
                      });
                      ServiceHandler.displayToast("Loading next page...\n Page #" + widget.searchGlobals.pageNum.toString());
                      //Get.snackbar("Loading next page...", 'Page #' + widget.searchGlobals.pageNum.toString(),snackPosition: SnackPosition.TOP,duration: Duration(seconds: 2),colorText: Colors.black,backgroundColor: Get.context!.theme.primaryColor);
                    } else if (!isLastPage) {
                      setState(() {
                        isLastPage = true;
                      });
                      ServiceHandler.displayToast("No More Files \n (T⌓T)");
                      // Get.snackbar("No More Files", '(T⌓T)', snackPosition: SnackPosition.TOP, duration: Duration(seconds: 2), colorText: Colors.black, backgroundColor: Get.context!.theme.primaryColor);
                    }
                  }
                  return true;
                },
              ),
            );
          }
        });
  }

}
