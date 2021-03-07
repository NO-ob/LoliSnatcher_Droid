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
  final FocusNode searchBoxFocus;
  StaggeredView(this.settingsHandler, this.searchGlobals, this.snatchHandler,this.searchBoxFocus);
  @override
  _StaggeredState createState() => _StaggeredState();
}

class _StaggeredState extends State<StaggeredView> {
  ScrollController gridController = ScrollController();
  bool isLastPage = false;
  FocusNode kbFocusNode = FocusNode();

  void setBooruHandler() {
    List temp = new BooruHandlerFactory()
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

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    if (FocusScope.of(context).focusedChild == null){
      print("kb focus node requesting focus");
      kbFocusNode.requestFocus();
    }
    if (widget.searchGlobals.booruHandler == null) {
      initState();
    }
    if (gridController.hasClients) {
      gridController.jumpTo(widget.searchGlobals.scrollPosition);
    } else if (widget.searchGlobals.scrollPosition != 0) {
      setState(() {
        gridController = new ScrollController(
            initialScrollOffset: widget.searchGlobals.scrollPosition);
      });
    }

    int columnsCount =
        (MediaQuery.of(context).orientation == Orientation.portrait)
            ? widget.settingsHandler.portraitColumns
            : widget.settingsHandler.landscapeColumns;

    return FutureBuilder(
        future: widget.searchGlobals.booruHandler!
            .Search(widget.searchGlobals.tags!, widget.searchGlobals.pageNum),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            /**The short if statement with the media query is used to decide whether to display 2 or 4
              * thumbnails in a row of the grid depending on screen orientation
              */
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
                  // TODO: Make it draggable
                  controller: gridController,
                  isAlwaysShown: true,
                  child: StaggeredGridView.countBuilder(
                    controller: gridController,
                    itemCount: snapshot.data.length,
                    crossAxisCount: columnsCount * 2,
                    itemBuilder: (BuildContext context, int index) {
                      bool isSelected = widget.searchGlobals.selected!.contains(index);
                      return Container(
                        // Inkresponse is used so the tile can have an onclick function
                        child: Material(
                          borderOnForeground: true,
                          child: Ink(
                            decoration: isSelected ?
                            BoxDecoration(border: Border.all(color: Get.context!.theme.accentColor, width: 4.0),) : null,
                            child: new InkResponse(
                              enableFeedback: true,
                              highlightShape: BoxShape.rectangle,
                              containedInkWell: true,
                              highlightColor: Get.context!.theme.accentColor,
                              child: ViewUtils.sampleorThumb(snapshot.data[index], columnsCount,widget.settingsHandler),
                              onTap: () {
                                // Load the image viewer
                                kbFocusNode.unfocus();
                                Get.dialog(
                                  ViewerPage(snapshot.data, index, widget.searchGlobals, widget.settingsHandler, widget.snatchHandler),
                                  transitionDuration:
                                  Duration(milliseconds: 200),
                                  // barrierColor: Colors.transparent
                                ).whenComplete(() {
                                  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
                                  kbFocusNode.requestFocus();
                                });

                                // Get.to(ImagePage(snapshot.data, index, widget.searchGlobals, widget.settingsHandler, widget.snatchHandler));
                              },
                              onLongPress: () {
                                if (widget.searchGlobals.selected!
                                    .contains(index)) {
                                  setState(() {
                                    widget.searchGlobals.selected!.remove(index);
                                  });
                                } else {
                                  setState(() {
                                    widget.searchGlobals.selected!.add(index);
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                      );
                    },
                    staggeredTileBuilder: (int index) =>
                    new StaggeredTile.fit(2),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  ),
                ),
                onNotification: (notif) {
                  widget.searchGlobals.scrollPosition = gridController.offset;
                  // If at bottom edge update state with incremented pageNum
                  // If at bottom edge update state with incremented pageNum
                  bool isNotAtStart = notif.metrics.pixels > 0;
                  //bool isNearEdge = notif.metrics.pixels > notif.metrics.maxScrollExtent - 25;
                  bool isAtEdge = notif.metrics.atEdge;
                  bool isScreenFilled = notif.metrics.extentBefore > 0 || notif.metrics.extentAfter > 0; // for cases when first page doesn't fill the screen (example: too many thumbnails per row)
                  if ((isNotAtStart || !isScreenFilled) && isAtEdge) {
                    if (!widget.searchGlobals.booruHandler!.locked) {
                      setState(() {
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
