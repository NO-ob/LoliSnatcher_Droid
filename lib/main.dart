import 'dart:io';
import 'dart:math';

import 'package:LoliSnatcher/SnatchHandler.dart';
import 'package:LoliSnatcher/libBooru/GelbooruV1Handler.dart';
import 'package:LoliSnatcher/widgets/BooruSelector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ServiceHandler.dart';
import 'libBooru/BooruHandlerFactory.dart';
import 'libBooru/GelbooruHandler.dart';
import 'libBooru/MoebooruHandler.dart';
import 'libBooru/PhilomenaHandler.dart';
import 'libBooru/DanbooruHandler.dart';
import 'libBooru/ShimmieHandler.dart';
import 'libBooru/BooruItem.dart';
import 'libBooru/e621Handler.dart';
import 'libBooru/SzurubooruHandler.dart';
import 'libBooru/HydrusHandler.dart';
import 'libBooru/BooruHandler.dart';
import 'libBooru/SankakuHandler.dart';
import 'libBooru/Booru.dart';
import 'ImageWriter.dart';
import 'SettingsHandler.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:photo_view/photo_view.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'AboutPage.dart';
import 'getPerms.dart';
import 'Snatcher.dart';
import 'SettingsPage.dart';
import 'SearchGlobals.dart';

void main() {
  runApp(MaterialApp(
    title: 'LoliSnatcher',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.pink[200],
        accentColor: Colors.pink[300],

        textTheme: TextTheme(
          headline5: GoogleFonts.quicksand(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: GoogleFonts.quicksand(fontSize: 36.0),
          bodyText2: GoogleFonts.quicksand(fontSize: 14.0),
          bodyText1: GoogleFonts.quicksand(fontSize: 14.0),
        ),
      ),
    navigatorKey: Get.key,
    home: Preloader(),
  ));
}
// Added a preloader to load booruconfigs and settings other wise the booruselector misbehaves
class Preloader extends StatefulWidget {
  SettingsHandler settingsHandler = new SettingsHandler();
  @override
  _PreloaderState createState() => _PreloaderState();
}

class _PreloaderState extends State<Preloader> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.settingsHandler.initialize(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            return Home(widget.settingsHandler);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }
    );
  }
}
/** The home widget is the main widget of the app and contains the Image Previews and the settings drawer.
  *
  * **/
class Home extends StatefulWidget {
  SettingsHandler settingsHandler;
  SnatchHandler snatchHandler = new SnatchHandler();
  BooruSelector booruSelector;
  @override
  _HomeState createState() => _HomeState();
  Home(this.settingsHandler);
}


class _HomeState extends State<Home> {
  List<SearchGlobals> searchGlobals = new List.from([new SearchGlobals(null,"")]);
  FocusNode searchBoxFocus = new FocusNode();
  int globalsIndex = 0;
  bool firstRun = true;
  bool isSnatching = false;

  String snatchStatus = "";
  final searchTagsController = TextEditingController();
  @override
  void initState() {
    super.initState();
    widget.snatchHandler.addQueueHandler();
    print("new booru selector added");
    widget.booruSelector = new BooruSelector(widget.settingsHandler);
  }

  @override
  Widget build(BuildContext context) {
    //searchTagsController.text = searchGlobals[globalsIndex].tags;
    if (searchGlobals[globalsIndex].newTab.value == "noListener"){
      searchGlobals[globalsIndex].newTab.addListener((){
        if (searchGlobals[globalsIndex].newTab.value != ""){
          setState(() {
            searchGlobals.add(new SearchGlobals(searchGlobals[globalsIndex].selectedBooru, searchGlobals[globalsIndex].newTab.value));
          });
        }
      });
      searchGlobals[globalsIndex].addTag.addListener((){
        if (searchGlobals[globalsIndex].addTag.value != ""){
          setState(() {
            searchTagsController.text += searchGlobals[globalsIndex].addTag.value;
          });
        }
      });
      searchGlobals[globalsIndex].newTab.value = "";
    }
    if (widget.booruSelector.selectedBooruNotifier.value == "noListener"){
      print("Listener added to booruselector");
      widget.booruSelector.selectedBooruNotifier.addListener((){
        if (widget.booruSelector.selectedBooruNotifier.value != null){
          setState(() {
            searchGlobals[globalsIndex].selectedBooru = widget.booruSelector.selectedBooru;
          });
        }
      });
    }
    return Listener(
        onPointerDown: (event){
          if(searchBoxFocus.hasFocus){
            print("destroyed overlay");
            searchBoxFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: ActiveTitle(widget.snatchHandler),
            actions:<Widget>[ IconButton(
                icon: Icon(Icons.save),
                onPressed: (){
                  getPerms();
                  // call a function to save the currently viewed image when the save button is pressed
                  if (searchGlobals[globalsIndex].selected.length > 0){
                    widget.snatchHandler.queue(searchGlobals[globalsIndex].getSelected(), widget.settingsHandler.jsonWrite);
                  } else {
                    Get.snackbar("No items selected","(」°ロ°)」",snackPosition: SnackPosition.BOTTOM,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Colors.pink[200]);
                  }
                },
              )
            ],
          ),
          body: Center(
            child: ImagesFuture(),
          ),
          drawer: Drawer(
            child: ListView(
              children:<Widget>[
                DrawerHeader(
                  decoration: new BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    image: new DecorationImage(fit: BoxFit.cover, image: new AssetImage('assets/images/drawer_icon.png'),),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,

                    children: <Widget>[
                      //Tags/Search field
                      TagSearchBox(searchGlobals[globalsIndex], searchTagsController,searchBoxFocus),
                       IconButton(
                          padding: new EdgeInsets.all(20),
                          icon: Icon(Icons.search),
                          onPressed: () {
                            if (searchGlobals[globalsIndex].selectedBooru == null && widget.settingsHandler.booruList.isNotEmpty){
                              searchGlobals[globalsIndex].selectedBooru = widget.settingsHandler.booruList.elementAt(0);
                            }
                            setState((){
                              if(searchTagsController.text.contains("loli")){
                                Get.snackbar("UOOOOOHHHHH", '😭', snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: Colors.black, backgroundColor: Colors.pink[200] );
                              }
                              searchGlobals[globalsIndex] = new SearchGlobals(searchGlobals[globalsIndex].selectedBooru,searchTagsController.text);
                            });
                            // Setstate and update the tags variable so the widget rebuilds with the new tags

                          },
                        ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text("Tab: "),
                      Expanded(
                        child:
                        DropdownButton<SearchGlobals>(
                          value: searchGlobals[globalsIndex],
                          isExpanded: true,
                          icon: Icon(Icons.arrow_downward),
                          onChanged: (SearchGlobals newValue){
                            setState(() {
                              globalsIndex = searchGlobals.indexOf(newValue);
                              searchTagsController.text = newValue.tags;
                            });
                          },
                          items: searchGlobals.map<DropdownMenuItem<SearchGlobals>>((SearchGlobals value){
                            bool isNotEmptyBooru = value.selectedBooru != null && value.selectedBooru.faviconURL != null;
                            return DropdownMenuItem<SearchGlobals>(
                              value: value,
                              child: Row(
                                children: [
                                  isNotEmptyBooru ? Image.network(value.selectedBooru.faviconURL, width: 16) : Text(''),
                                  Text(" ${value.tags}"),
                                ]
                              )
                            );
                          }).toList(),
                        ),
                      ),


                      IconButton(
                        icon: Icon(Icons.add_circle_outline, color: Theme.of(context).accentColor),
                        onPressed: () {
                          // add a new search global to the list
                          setState((){
                            searchGlobals.add(new SearchGlobals(null,widget.settingsHandler.defTags));
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline, color: Theme.of(context).accentColor),
                        onPressed: () {
                          // Remove selected searchglobal from list
                          setState((){
                            if(globalsIndex == searchGlobals.length - 1 && searchGlobals.length > 1){
                              globalsIndex --;
                              searchGlobals.removeAt(globalsIndex + 1);
                            } else if (searchGlobals.length > 1){
                              searchGlobals.removeAt(globalsIndex);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      widget.booruSelector,
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20),
                        side: BorderSide(color: Theme.of(context).accentColor),
                    ),
                    onPressed: (){
                      Get.to(SnatcherPage(searchTagsController.text,searchGlobals[globalsIndex].selectedBooru,widget.settingsHandler, widget.snatchHandler));
                    },
                    child: Text("Snatcher"),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: Theme.of(context).accentColor),
                    ),
                    onPressed: (){
                      Get.to(SettingsPage(widget.settingsHandler));
                    },
                    child: Text("Settings"),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: Theme.of(context).accentColor),
                    ),
                    onPressed: (){
                      Get.to(AboutPage());
                    },
                    child: Text("About"),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
  /** If first run is true the default tags are loaded using the settings controller then parsed to the images widget
   * This is done with a future builder as we must wait for the permissions popup and also for the settings to load
   * **/
  Widget ImagesFuture(){
        return FutureBuilder(
            future: widget.settingsHandler.initialize(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done){
                if (widget.settingsHandler.booruList.isEmpty){
                  return Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text("No Booru Configs Found"),
                            Container(
                              alignment: Alignment.center,
                              child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(20),
                                    side: BorderSide(color: Theme.of(context).accentColor),
                                  ),
                                  onPressed: (){
                                    Get.to(booruEdit(new Booru("New","","","",""),widget.settingsHandler));
                                  },
                                  child: Text("Open Settings")
                              ),
                            ),
                          ]
                      )
                  );
                } else if (firstRun){
                    return FutureBuilder(
                        future: widget.settingsHandler.initialize(),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState == ConnectionState.done){
                            firstRun = false;
                            searchGlobals[globalsIndex].tags = widget.settingsHandler.defTags;
                            searchTagsController.text = widget.settingsHandler.defTags;
                            if (searchGlobals[globalsIndex].selectedBooru == null){
                              searchGlobals[globalsIndex].selectedBooru = widget.settingsHandler.booruList[0];
                            }
                            return Images(widget.settingsHandler,searchGlobals[globalsIndex]);
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        }
                    );
                } else {

                    return Images(widget.settingsHandler,searchGlobals[globalsIndex]);
                  }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }
        );
  }
}
class ActiveTitle extends StatefulWidget {
  SnatchHandler snatchHandler;
  bool isSnatching = false;
  String snatchStatus = "";
  @override
  _ActiveTitleState createState() => _ActiveTitleState();
  ActiveTitle(this.snatchHandler);
}

class _ActiveTitleState extends State<ActiveTitle> {
  @override
  void initState(){
      //widget.snatchHandler.snatchActive.value = false;
      widget.snatchHandler.snatchActive.addListener((){
        setState(() {
          widget.isSnatching = widget.snatchHandler.snatchActive.value;
        });
      });
      widget.snatchHandler.snatchStatus.addListener((){
        setState(() {
          widget.snatchStatus = widget.snatchHandler.snatchStatus.value;
        });
      });
  }
  @override
  Widget build(BuildContext context) {
    return widget.isSnatching ? Text("Snatching: ${widget.snatchStatus}") : Text("Loli Snatcher");
  }
}

class TagSearchBox extends StatefulWidget {
  SearchGlobals searchGlobals;
  TextEditingController searchTagsController;
  FocusNode _focusNode;
  TagSearchBox(this.searchGlobals, this.searchTagsController, this._focusNode);
  @override
  _TagSearchBoxState createState() => _TagSearchBoxState();
}

class _TagSearchBoxState extends State<TagSearchBox> {
  OverlayEntry _overlayEntry;
  @override
  void initState() {
    super.initState();
    widget._focusNode.addListener(_updateOverLay);
  }
  void _updateOverLay(){
    if (widget._focusNode.hasFocus) {
      print("textbox is focused");
      this._overlayEntry = this._createOverlayEntry();
      Overlay.of(context).insert(this._overlayEntry);
    } else {
      if (this._overlayEntry != null){
        this._overlayEntry.remove();
      }
    }
  }
  @override
  void dispose() {
    widget._focusNode.unfocus();
    super.dispose();
  }
  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject();
    setBooruHandler(widget.searchGlobals, 20);
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
    if (widget.searchGlobals.booruHandler.booru.type == "Szurubooru" && widget.searchGlobals.booruHandler.booru.apiKey != "" && widget.searchGlobals.booruHandler.booru.userID != ""){
      widget.searchGlobals.booruHandler.tagSearchEnabled = true;
    } else if (widget.searchGlobals.booruHandler.booru.type == "Shimmie" && widget.searchGlobals.booruHandler.booru.baseURL.contains("rule34.paheal.net")){
      widget.searchGlobals.booruHandler.tagSearchEnabled = true;
    }
    if (widget.searchGlobals.booruHandler.tagSearchEnabled){
      String input = widget.searchTagsController.text;
      if (input.split(" ").length > 1){
        input = input.split(" ")[input.split(" ").length - 1];
      }
      return OverlayEntry(
        builder: (context) => Positioned(
          left: offset.dx,
          top: offset.dy + size.height + 5.0,
          width: size.width,
          height: 300,
          child: Material(
            elevation: 4.0,
            child: FutureBuilder(
                future: widget.searchGlobals.booruHandler.tagSearch(input),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if ((snapshot.connectionState == ConnectionState.done) && snapshot.data.length > 0){
                    if (snapshot.data[0]!= null){
                      return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                title: Text(snapshot.data[index]),
                                onTap: (() {
                                  widget._focusNode.unfocus();
                                  widget.searchTagsController.text = widget.searchTagsController.text.substring(0,widget.searchTagsController.text.lastIndexOf(" ")+1) + snapshot.data[index];
                                })
                            );
                          }
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextField(
          controller: widget.searchTagsController,
          focusNode: widget._focusNode,
          onChanged: (text) {
            setState((){
              this._overlayEntry.remove();
              this._updateOverLay();
            });
          },
          decoration: InputDecoration(
            hintText:"Enter Tags",
            contentPadding: new EdgeInsets.fromLTRB(15,0,0,0), // left,right,top,bottom
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(50),
              gapPadding: 0,
            ),
          ),
        )
    );
  }
}
void setBooruHandler(SearchGlobals searchGlobals, int limit){
  List temp = new BooruHandlerFactory().getBooruHandler(searchGlobals.selectedBooru, limit);
  searchGlobals.booruHandler = temp[0];
  searchGlobals.pageNum = temp[1];
}
/**
 * This widget will create a booru handler and then generate a gridview of preview images using a future builder and the search function of the booru handler
 */

class Images extends StatefulWidget {
  SearchGlobals searchGlobals;
  SettingsHandler settingsHandler;
  Images(this.settingsHandler,this.searchGlobals);
  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  ScrollController gridController = ScrollController();
  bool isLastPage = false;
  @override
  void initState() {
    // Stops previous pages being forgotten when switching tabs
    if (widget.searchGlobals.booruHandler != null) {
    } else {
      setBooruHandler(widget.searchGlobals, widget.settingsHandler.limit);
    }
  }


  @override
  Widget build(BuildContext context) {
    if (widget.searchGlobals.booruHandler == null){
      initState();
    }
    if (gridController.hasClients) {
      gridController.jumpTo(widget.searchGlobals.scrollPosition);
    } else if (widget.searchGlobals.scrollPosition != 0){
      setState(() {
        gridController = new ScrollController(initialScrollOffset: widget.searchGlobals.scrollPosition);
      });
    }

    return FutureBuilder(
        future: widget.searchGlobals.booruHandler.Search(widget.searchGlobals.tags, widget.searchGlobals.pageNum),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            /**The short if statement with the media query is used to decide whether to display 2 or 4
              * thumbnails in a row of the grid depending on screen orientation
              */
            int columnsCount = (MediaQuery.of(context).orientation == Orientation.portrait) ? widget.settingsHandler.portraitColumns : widget.settingsHandler.landscapeColumns;
            // A notification listener is used to get the scroll position
            return new NotificationListener<ScrollUpdateNotification>(
            child: Scrollbar( // TO DO: Make it draggable
              controller: gridController,
              isAlwaysShown: true,
              child: GridView.builder(
                controller: gridController,
                itemCount: snapshot.data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: columnsCount),
                itemBuilder: (BuildContext context, int index) {
                  bool isSelected = widget.searchGlobals.selected.contains(index);
                  return new Card(
                    child: new GridTile(
                      // Inkresponse is used so the tile can have an onclick function
                      child: Material(
                        borderOnForeground: true,
                        child: Ink(
                          decoration: isSelected ? BoxDecoration(border: Border.all(color: Theme.of(context).accentColor, width: 4.0),) : null,
                            child: new InkResponse(
                              enableFeedback: true,
                              highlightShape: BoxShape.rectangle,
                              containedInkWell: true,
                              highlightColor: Theme.of(context).accentColor,
                              child: sampleorThumb(snapshot.data[index], columnsCount),
                              onTap: () {
                                // Load the image viewer
                                print(snapshot.data[index].fileURL);
                                Get.to(ImagePage(snapshot.data, index, widget.searchGlobals, widget.settingsHandler, gridController, columnsCount));
                              },
                              onLongPress: (){
                                if (widget.searchGlobals.selected.contains(index)){
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
            // ignore: missing_return
            onNotification: (notif) {
              widget.searchGlobals.scrollPosition = gridController.offset;
              // print('SCROLL NOTIFICATION');
              // print(gridController.position.maxScrollExtent);
              // print(notif.metrics); // pixels before viewport, in viewport, after viewport

              // If at bottom edge update state with incremented pageNum
              bool isNotAtStart = notif.metrics.pixels > 0;
              bool isScreenFilled = notif.metrics.extentBefore > 0 || notif.metrics.extentAfter > 0; // for cases when first page doesn't fill the screen (example: too many thumbnails per row)
              bool isAtEdge = notif.metrics.atEdge;
              if((isNotAtStart || !isScreenFilled) && isAtEdge){
                if (!widget.searchGlobals.booruHandler.locked){
                  setState((){
                      widget.searchGlobals.pageNum++;
                  });
                Get.snackbar("Loading next page...", 'Page #' + widget.searchGlobals.pageNum.toString(), snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 1), colorText: Colors.black, backgroundColor: Colors.pink[200] );
                } else if (!isLastPage) {
                  setState((){
                    isLastPage = true;
                  });
                  Get.snackbar("No More Files", '(T⌓T)', snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 1), colorText: Colors.black, backgroundColor: Colors.pink[200] );
                }
              }
            },
          );
          }
        });
  }

  List<dynamic> getFileTypeAndIcon(String fileExt) {
    if(['jpg', 'jpeg', 'png'].any((val) => fileExt.contains(val))) {
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
  Widget sampleorThumb(BooruItem item, int columnCount){
    List<dynamic> itemType = getFileTypeAndIcon(item.fileExt);
    bool isThumb = widget.settingsHandler.previewMode == "Thumbnail" || (itemType[0] == 'gif' || itemType[0] == 'video');
    String thumbURL = isThumb ? item.thumbnailURL : item.sampleURL;
    return Stack(
      alignment: Alignment.center,
      children: [
        CachedThumb(thumbURL,widget.settingsHandler,columnCount),
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
      ]
    );
  }
}

/**
 * The image page is what is dispalyed when an iamge is clicked it shows a full resolution
 * version of an image and allows scrolling left and right through the currently loaded booruItems
 *
 */
class ImagePage extends StatefulWidget {
  final List fetched;
  final int index;
  SearchGlobals searchGlobals;
  SettingsHandler settingsHandler;
  ScrollController gridController;
  int columnsCount;
  ImagePage(this.fetched,this.index,this.searchGlobals,this.settingsHandler, this.gridController, this.columnsCount);
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage>{
  PreloadPageController controller;
  PageController controllerLinux;
  ImageWriter writer = new ImageWriter();
  int viewedIndex;

  @override
  void initState() {
    super.initState();
    controller = PreloadPageController(
      initialPage: widget.index,
    );
    controllerLinux = PageController(
      initialPage: widget.index,
    );

    viewedIndex = widget.index;
    jumpToItem(widget.index);
  }

  void jumpToItem(int item) {
    int totalItems = widget.fetched.length;
    if(totalItems > 0) {
      final viewportHeight = widget.gridController.position.viewportDimension;
      final totalHeight = widget.gridController.position.maxScrollExtent + viewportHeight;

      final rowCount = (totalItems / widget.columnsCount).ceil();
      final rowHeight = totalHeight / rowCount;

      final rowsPerViewport = (viewportHeight + 30) / rowHeight; // add some height to trigger page load a bit early

      final currentRow = (item / widget.columnsCount).floor();
      // scroll to the row of the current item
      // but if we can't scroll to the top of this row (rows left < rowsPerViewport) - scroll to the max and trigger page load
      final scrollToValue = (rowCount - currentRow) < rowsPerViewport ? totalHeight : max((rowHeight * currentRow), 0.0);
      // print('SCROLL CONTROLLER');
      // print(widget.gridController.position);
      // print(newValue);

      // bug: sometimes stops working (gridController is not updated after state change? i.e. reentering app, changing rotation)
      widget.gridController.jumpTo(scrollToValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((viewedIndex+1).toString()+'/'+widget.fetched.length.toString()),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              getPerms();
              // call a function to save the currently viewed image when the save button is pressed
              writer.write(widget.fetched[viewedIndex],widget.settingsHandler.jsonWrite);
              Get.snackbar("Snatched ＼(^ o ^)／",widget.fetched[viewedIndex].fileURL,snackPosition: SnackPosition.BOTTOM,duration: Duration(seconds: 1),colorText: Colors.black, backgroundColor: Colors.pink[200]);
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){
              ServiceHandler serviceHandler = new ServiceHandler();
              serviceHandler.loadShareIntent(widget.fetched[viewedIndex].fileURL);
            },
          ),
          IconButton(
            icon: Icon(Icons.public),
            onPressed: (){
              if (Platform.isAndroid){
                _launchURL(widget.fetched[viewedIndex].postURL);
              } else if (Platform.isLinux){
                Process.run('xdg-open',[widget.fetched[viewedIndex].postURL]);
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(20.0)),
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: ListView.builder(
                              itemCount: widget.fetched[viewedIndex].tagsList.length,
                              itemBuilder: (BuildContext context, int index){
                                String currentTag = widget.fetched[viewedIndex].tagsList[index];
                                if(currentTag != '') {
                                  return Column(
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(currentTag),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.add, color: Theme.of(context).accentColor,),
                                            onPressed: (){
                                              setState(() {
                                                widget.searchGlobals.addTag.value = " " + currentTag;
                                              });
                                              Get.snackbar("Added tag to search", "Tag: " + currentTag, snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: Colors.black, backgroundColor: Colors.pink[200] );
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.fiber_new, color: Theme.of(context).accentColor),
                                            onPressed: (){
                                              setState(() {
                                                widget.searchGlobals.newTab.value = currentTag;
                                              });
                                              Get.snackbar("Added new search tab", "Tag: " + currentTag, snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: Colors.black, backgroundColor: Colors.pink[200] );
                                            },
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.white,
                                        height: 2,
                                      ),
                                    ]
                                  );
                                } else { // Render nothing if currentTag is an empty string
                                  return Column();
                                }
                              }
                          ),
                        ),
                      );
                    }
                  );
            },
          ),
        ],
      ),
      body: Center(
        /**
         * The pageView builder will created a page for each image in the booruList(fetched)
         */
        child: Platform.isAndroid ? PhotoViewGestureDetectorScope( // prevents triggering page change early when panning
          axis: Axis.horizontal,
          child: PreloadPageView.builder(
          preloadPagesCount: widget.settingsHandler.preloadCount,
          scrollDirection: Axis.horizontal,
            physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            String fileURL = widget.fetched[index].fileURL;
            bool isVideo = ['webm', 'mp4'].any((val) => widget.fetched[index].fileExt.contains(val));
            int preloadCount = widget.settingsHandler.preloadCount;
              bool isViewed = viewedIndex == index;
              bool isNear = (viewedIndex - index).abs() <= preloadCount;
              print(fileURL);

              // Render only if viewed or in preloadCount range
              if(isViewed || isNear) {
                if (isVideo) {
                  return VideoApp(fileURL, index, viewedIndex, widget.settingsHandler);
                        } else {
                  return MediaViewer(widget.fetched[index], index, viewedIndex,widget.settingsHandler);
                        }
              } else {
                return Container(child: Text("You should not see this"));
            }
          },
          controller: controller,
          onPageChanged: (int index){
            setState(() {
              viewedIndex = index;
            });
            // Scroll to current item in GridView while viewer is open, will also trigger new page loading
            jumpToItem(index);
            // print('Page changed ' + index.toString());
          },
          itemCount: widget.fetched.length,
          )
        ) : PageView.builder(
          controller: controllerLinux,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            String fileURL = widget.fetched[index].fileURL;
            bool isVideo = ['webm', 'mp4'].any((val) => widget.fetched[index].fileExt.contains(val));
            if (isVideo){
              return Container(
                child: Column(
                  children: [
                    Image.network(widget.fetched[index].thumbnailURL),
                    Container(
                      margin: EdgeInsets.fromLTRB(10,10,10,10),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20),
                          side: BorderSide(color: Theme.of(context).accentColor),
                        ),
                        onPressed: (){
                          Process.run('mpv',["--loop",fileURL]);
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
          }
      ),
      ),
    );
  }
}

class MediaViewer extends StatefulWidget {
  final BooruItem booruItem;
  final int index;
  final int viewedIndex;
  SettingsHandler settingsHandler;
  MediaViewer(this.booruItem, this.index, this.viewedIndex, this.settingsHandler);

  @override
  _MediaViewerState createState() => _MediaViewerState();
}


class _MediaViewerState extends State<MediaViewer> {
  PhotoViewScaleStateController scaleController;
  PhotoViewController viewController;

  @override
  void initState() {
    super.initState();
    viewController = PhotoViewController(); //..outputStateStream.listen(onViewStateChanged);
    scaleController = PhotoViewScaleStateController(); //..outputScaleStateStream.listen(onScaleStateChanged);
  }

  // code taken from: https://gist.github.com/zzpmaster/ec51afdbbfa5b2bf6ced13374ff891d9
  static String formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }

  // debug functions
  void onScaleStateChanged(PhotoViewScaleState scaleState) {
    print(scaleState);
  }
  void onViewStateChanged(PhotoViewControllerValue viewState) {
    print(viewState);
  }

  Widget build(BuildContext context) {
    if(widget.viewedIndex != widget.index) {
      // reset zoom if not viewed
      setState(() {
        scaleController.scaleState = PhotoViewScaleState.initial;
      });
    }

    return ClipRect( // Cut image to the size of the container
      child: PhotoView(
        imageProvider: NetworkImage(widget.booruItem.fileURL),
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.covered * 8,
        initialScale: PhotoViewComputedScale.contained,
        basePosition: Alignment.center,
        controller: viewController,
        scaleStateController: scaleController,
        enableRotation: false,
        loadingBuilder: (BuildContext ctx, ImageChunkEvent loadingProgress) {
          bool hasProgressData = loadingProgress != null && loadingProgress.expectedTotalBytes != null;
          double percentDone = hasProgressData ? (loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes) : null;
          String loadedSize = hasProgressData ? formatBytes(loadingProgress.cumulativeBytesLoaded, 1) : '';
          String expectedSize = hasProgressData ? formatBytes(loadingProgress.expectedTotalBytes, 1) : '';
          String percentDoneText = hasProgressData ? ('${(percentDone*100).toStringAsFixed(2)}%') : 'Loading...';
          String filesizeText = hasProgressData ? ('$loadedSize / $expectedSize') : '';
          String fileURL = widget.settingsHandler.previewMode == "Sample" ? widget.booruItem.sampleURL : widget.booruItem.thumbnailURL;
          File preview = File(widget.settingsHandler.cachePath + "thumbnails/" + fileURL.substring(fileURL.lastIndexOf("/") + 1));
          print(widget.settingsHandler.cachePath + "thumbnails/" + fileURL.substring(fileURL.lastIndexOf("/") + 1));
          return widget.settingsHandler.loadingGif ?
          Image(image: AssetImage('assets/images/loading.gif')) :
          (preview.existsSync() ?
          Opacity(
            opacity: percentDone == null ? 0 : percentDone,
            child: Image(image: FileImage(preview)),
          ) :
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 120,
                width: 120,
                child: CircularProgressIndicator(
                  strokeWidth: 12,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.pink[300]),
                  value: percentDone,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 15)),
              Text(
                percentDoneText,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Text(
                filesizeText,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ));
        },
      ),
    );
  }
}

class CachedThumb extends StatefulWidget {
  ImageWriter imageWriter = ImageWriter();
  String fileURL;
  int columnCount;
  SettingsHandler settingsHandler;
  bool isThumb;
  @override
  _CachedThumbState createState() => _CachedThumbState();
  CachedThumb(this.fileURL, this.settingsHandler, this.columnCount);
}
class _CachedThumbState extends State<CachedThumb> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.imageWriter.getThumbPath(widget.fileURL),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              return Image.file(
                File(snapshot.data),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              );
            } else {
              if (widget.settingsHandler.imageCache){
                return FutureBuilder(
                    future: widget.imageWriter.writeThumb(widget.fileURL),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Image.file(
                          File(snapshot.data),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        );
                      } else {
                        return CircularProgressIndicator(
                          strokeWidth: 12,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.pink[300]),
                        );
                      }
                  },
                );
              }
              return Image.network(
                widget.fileURL,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                loadingBuilder: (BuildContext ctx, Widget child, ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    bool hasProgressData = loadingProgress.expectedTotalBytes != null;
                    double percentDone = hasProgressData ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes : null;
                    String percentDoneText = hasProgressData ? ((percentDone*100).toStringAsFixed(2) + '%') : 'Loading...';
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100 / widget.columnCount,
                          width: 100 / widget.columnCount,
                          child: CircularProgressIndicator(
                            strokeWidth: 16 / widget.columnCount,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.pink[300]),
                            value: percentDone,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                        widget.columnCount < 4 // Text element overflows if too many thumbnails are shown
                            ? Text(
                          percentDoneText,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )
                            : Container(),
                      ],
                    );
                  }
                },
              );
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }
    );
  }
}

/**
 * None of the code in this widget is mine it's from the example at https://pub.dev/packages/video_player
 */
class VideoApp extends StatefulWidget {
  final String url;
  final int index;
  final int viewedIndex;
  SettingsHandler settingsHandler;
  VideoApp(this.url, this.index, this.viewedIndex, this.settingsHandler);
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _videoController;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  Future<void> initPlayer() async {
    _videoController = VideoPlayerController.network(widget.url);
    await _videoController.initialize();

    // Player wrapper to allow controls, looping...
    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      // autoplay is disabled here, because videos started playing randomly, but videos will still autoplay when in view (see isViewed check later)
      autoPlay: false,
      allowedScreenSleep: false,
      looping: true,
      showControls: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.blue,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.white,
      ),
      placeholder: Container(
        color: Colors.black,
      ),
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },

      // Specify this to allow any orientation in fullscreen, otherwise it will decide for itself based on video dimensions
      // deviceOrientationsOnEnterFullScreen: [
      //     DeviceOrientation.landscapeLeft,
      //     DeviceOrientation.landscapeRight,
      //     DeviceOrientation.portraitUp,
      //     DeviceOrientation.portraitDown,
      // ],
    );

    // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    bool isViewed = widget.viewedIndex == widget.index;
    bool initialized = _chewieController != null && _chewieController.videoPlayerController.value.initialized;
    String vWidth = '';
    String vHeight = '';
    if(initialized) {
      vWidth = _chewieController.videoPlayerController.value.size.width.toStringAsFixed(0);
      vHeight = _chewieController.videoPlayerController.value.size.height.toStringAsFixed(0);
      if (isViewed) {
        // Reset video time if viewed
        _videoController.seekTo(Duration());
        if(widget.settingsHandler.autoPlayEnabled) {
          // autoplay if viewed and setting is enabled
        _videoController.play();
        }
      } else {
        _videoController.pause();
      }
    }

      return Container(
        child: Scaffold(
          body: Column(
            children: <Widget>[
            // Show video dimensions on the top
            // Container(
            //   child: MediaQuery.of(context).orientation == Orientation.portrait ? Text(vWidth+'x'+vHeight) : null
            // ),
              Expanded(
                child: Center(
                  child: initialized
                    ? Chewie(controller: _chewieController)
                    : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Image(image: AssetImage('assets/images/loading.gif'))
                      ],
                    ),
                ),
              ),
            ],
          )
        ),
      );
  }

  @override
  void dispose() {
    _videoController.pause();
    _videoController.dispose();
    if(_chewieController != null) {
    _chewieController.dispose();
    }
    super.dispose();
  }
}


















// function from url_launcher pub.dev page

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}



