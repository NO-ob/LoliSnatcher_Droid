import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SnatchHandler.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';

import 'package:LoliSnatcher/libBooru/BooruHandlerFactory.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/widgets/CachedThumb.dart';
import 'package:LoliSnatcher/widgets/ViewerPage.dart';

void setBooruHandler(SearchGlobals searchGlobals, int limit) {
  List temp = new BooruHandlerFactory()
      .getBooruHandler(searchGlobals.selectedBooru, limit);
  searchGlobals.booruHandler = temp[0];
  searchGlobals.pageNum = temp[1];
}

class WaterfallView extends StatefulWidget {
  final SearchGlobals searchGlobals;
  final SettingsHandler settingsHandler;
  final SnatchHandler snatchHandler;
  WaterfallView(this.settingsHandler, this.searchGlobals, this.snatchHandler);
  @override
  _WaterfallState createState() => _WaterfallState();
}

class _WaterfallState extends State<WaterfallView> {
  ScrollController gridController = ScrollController();
  bool isLastPage = false;
  Function jumpTo;
  @override
  void initState() {
    super.initState();
    jumpTo = () {
      jumpToItem(widget.searchGlobals.viewedIndex.value);
    };
    // Stops previous pages being forgotten when switching tabs
    if (widget.searchGlobals.booruHandler != null) {
    } else {
      setBooruHandler(widget.searchGlobals, widget.settingsHandler.limit);
    }
    widget.searchGlobals.viewedIndex.addListener(jumpTo);
  }

  @override
  void dispose() {
    widget.searchGlobals.viewedIndex.removeListener(jumpTo);
    super.dispose();
  }

  void jumpToItem(int item) {
    int totalItems = widget.searchGlobals.booruHandler.fetched.length;
    if (totalItems > 0) {
      double viewportHeight = gridController.position.viewportDimension;
      double totalHeight =
          gridController.position.maxScrollExtent + viewportHeight;

      int columnsCount =
          (MediaQuery.of(context).orientation == Orientation.portrait)
              ? widget.settingsHandler.portraitColumns
              : widget.settingsHandler.landscapeColumns;
      int rowCount = (totalItems / columnsCount).ceil();
      double rowHeight = totalHeight / rowCount;
      double rowsPerViewport = viewportHeight / rowHeight;

      int currentRow = (item / columnsCount).floor();
      // scroll to the row of the current item
      // but if we can't scroll to the top of this row (rows left < rowsPerViewport) - scroll to the max and trigger page load
      bool isCloseToEdge = (rowCount - currentRow) <= rowsPerViewport;
      double scrollToValue =
          isCloseToEdge ? totalHeight : max((rowHeight * currentRow), 0.0);

      // print('SCROLL CONTROLLER');
      // print(widget.gridController.position);
      // print(newValue);

      //gridController.jumpTo(scrollToValue);
      gridController.animateTo(scrollToValue,
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    }
  }

  @override
  Widget build(BuildContext context) {
    // super.build(context);

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
        future: widget.searchGlobals.booruHandler
            .Search(widget.searchGlobals.tags, widget.searchGlobals.pageNum),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            /**The short if statement with the media query is used to decide whether to display 2 or 4
              * thumbnails in a row of the grid depending on screen orientation
              */
            // A notification listener is used to get the scroll position
            return new NotificationListener<ScrollUpdateNotification>(
              child: Scrollbar(
                // TODO: Make it draggable
                controller: gridController,
                isAlwaysShown: true,
                child: GridView.builder(
                  controller: gridController,
                  itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columnsCount),
                  itemBuilder: (BuildContext context, int index) {
                    bool isSelected =
                        widget.searchGlobals.selected.contains(index);
                    return new Card(
                      child: new GridTile(
                        // Inkresponse is used so the tile can have an onclick function
                        child: Material(
                          borderOnForeground: true,
                          child: Ink(
                            decoration: isSelected
                                ? BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context).accentColor,
                                        width: 4.0),
                                  )
                                : null,
                            child: new InkResponse(
                              enableFeedback: true,
                              highlightShape: BoxShape.rectangle,
                              containedInkWell: true,
                              highlightColor: Theme.of(context).accentColor,
                              child: sampleorThumb(
                                  snapshot.data[index], columnsCount),
                              onTap: () {
                                // Load the image viewer
                                print(snapshot.data[index].fileURL);

                                Get.dialog(
                                  ImagePage(
                                      snapshot.data,
                                      index,
                                      widget.searchGlobals,
                                      widget.settingsHandler,
                                      widget.snatchHandler),
                                  transitionDuration:
                                      Duration(milliseconds: 200),
                                  // barrierColor: Colors.transparent
                                );

                                // Get.to(ImagePage(snapshot.data, index, widget.searchGlobals, widget.settingsHandler, widget.snatchHandler));
                              },
                              onLongPress: () {
                                if (widget.searchGlobals.selected
                                    .contains(index)) {
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
                ),
              ),
              onNotification: (notif) {
                widget.searchGlobals.scrollPosition = gridController.offset;
                // print('SCROLL NOTIFICATION');
                // print(widget.gridController.position.maxScrollExtent);
                // print(notif.metrics); // pixels before viewport, in viewport, after viewport

                // If at bottom edge update state with incremented pageNum
                bool isNotAtStart = notif.metrics.pixels > 0;
                bool isScreenFilled = notif.metrics.extentBefore > 0 ||
                    notif.metrics.extentAfter >
                        0; // for cases when first page doesn't fill the screen (example: too many thumbnails per row)
                bool isAtEdge = notif.metrics.atEdge;
                if ((isNotAtStart || !isScreenFilled) && isAtEdge) {
                  if (!widget.searchGlobals.booruHandler.locked) {
                    setState(() {
                      widget.searchGlobals.pageNum++;
                    });
                    Get.snackbar("Loading next page...",
                        'Page #' + widget.searchGlobals.pageNum.toString(),
                        snackPosition: SnackPosition.TOP,
                        duration: Duration(seconds: 2),
                        colorText: Colors.black,
                        backgroundColor: Colors.pink[200]);
                  } else if (!isLastPage) {
                    setState(() {
                      isLastPage = true;
                    });
                    Get.snackbar("No More Files", '(T⌓T)',
                        snackPosition: SnackPosition.TOP,
                        duration: Duration(seconds: 2),
                        colorText: Colors.black,
                        backgroundColor: Colors.pink[200]);
                  }
                }
                return true;
              },
            );
          }
        });
  }

  List<dynamic> getFileTypeAndIcon(String fileExt) {
    if (['jpg', 'jpeg', 'png'].any((val) => fileExt.contains(val))) {
      return ['image', Icons.photo];
    } else if (['webm', 'mp4'].any((val) => fileExt.contains(val))) {
      return ['video', CupertinoIcons.videocam_fill];
    } else if (['gif'].any((val) => fileExt.contains(val))) {
      return ['gif', CupertinoIcons.play_fill];
    } else {
      return ['other', CupertinoIcons.question];
    }
  }

  /**
   * This will return an Image from the booruItem and will use either the sample url
   * or the thumbnail url depending on the users settings (sampleURL is much higher quality)
   *
   */
  Widget sampleorThumb(BooruItem item, int columnCount) {
    List<dynamic> itemType = getFileTypeAndIcon(item.fileExt);
    bool isThumb = widget.settingsHandler.previewMode == "Thumbnail" ||
        (itemType[0] == 'gif' || itemType[0] == 'video');
    String thumbURL = isThumb ? item.thumbnailURL : item.sampleURL;
    return Stack(alignment: Alignment.center, children: [
      CachedThumb(thumbURL, widget.settingsHandler, columnCount),
      Container(
        alignment: Alignment.bottomRight,
        child: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.black,
            // borderRadius: BorderRadius.circular(100)
          ),
          child: Icon(
            itemType[1],
            color: Colors.white,
            size: 14,
          ),
        ),
      ),
    ]);
  }
}
