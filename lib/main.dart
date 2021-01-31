import 'dart:io';
import 'dart:ui';
import 'dart:math';

import 'package:LoliSnatcher/SnatchHandler.dart';
import 'package:LoliSnatcher/libBooru/GelbooruV1Handler.dart';
import 'package:LoliSnatcher/widgets/BooruSelectorBroken.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ServiceHandler.dart';
import 'libBooru/BooruHandlerFactory.dart';
import 'libBooru/BooruItem.dart';
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
    /*if (widget.booruSelector.selectedBooruNotifier.value == "noListener"){
      print("Listener added to booruselector");
      widget.booruSelector.selectedBooruNotifier.addListener((){
        if (widget.booruSelector.selectedBooruNotifier.value != null){
          setState(() {
            searchGlobals[globalsIndex].selectedBooru = widget.booruSelector.selectedBooru;
          });
        }
      });
    }*/
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
                    widget.snatchHandler.queue(searchGlobals[globalsIndex].getSelected(), widget.settingsHandler.jsonWrite,searchGlobals[globalsIndex].selectedBooru.name);
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
                      FutureBuilder(
                        future: BooruSelector(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                            return snapshot.data;
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
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
  /** This Future function will call getBooru on the settingsHandler to load the booru configs
   * After these are loaded it returns a drop down list which is used to select which booru to search
   * **/
  Future BooruSelector() async{
    if (widget.settingsHandler.prefBooru == ""){
      await widget.settingsHandler.loadSettings();
    }
    if (widget.settingsHandler.path == ""){
      widget.settingsHandler.path = await widget.settingsHandler.getExtDir();
    }
    if(widget.settingsHandler.booruList.isEmpty){
      print("getbooru because null");
      await widget.settingsHandler.getBooru();
    }
    if (widget.settingsHandler.prefBooru != widget.settingsHandler.booruList.elementAt(0).name){
      await widget.settingsHandler.getBooru();
    }
    print(searchGlobals[globalsIndex].toString());
    // This null check is used otherwise the selected booru resets when the state changes, the state changes when a booru is selected
    if (searchGlobals[globalsIndex].selectedBooru == null){
      print("selectedBooru is null setting to: " + widget.settingsHandler.booruList[0].toString());
      searchGlobals[globalsIndex].selectedBooru = widget.settingsHandler.booruList[0];
      searchGlobals[globalsIndex].handlerType = widget.settingsHandler.booruList[0].type;
    }
    if (!widget.settingsHandler.booruList.contains(searchGlobals[globalsIndex].selectedBooru)){
      searchGlobals[globalsIndex].selectedBooru = widget.settingsHandler.booruList[0];
      searchGlobals[globalsIndex].handlerType = widget.settingsHandler.booruList[0].type;
    }
    return Container(
      child: DropdownButton<Booru>(
        value: searchGlobals[globalsIndex].selectedBooru,
        icon: Icon(Icons.arrow_downward),
        onChanged: (Booru newValue){
          setState((){
            if((searchTagsController.text == "" || searchTagsController.text == widget.settingsHandler.defTags) && newValue.defTags != ""){
              searchTagsController.text = newValue.defTags;
            }
            searchGlobals[globalsIndex].selectedBooru = newValue;
          });
        },
        items: widget.settingsHandler.booruList.map<DropdownMenuItem<Booru>>((Booru value){
          // Return a dropdown item
          return DropdownMenuItem<Booru>(
            value: value,
            child: Row(
              children: <Widget>[
                //Booru name
                Text(value.name + ""),
                //Booru Icon
                Image.network(value.faviconURL, width: 16),
              ],
            ),
          );
        }).toList(),
      ),
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

  void jumpToItem(int item, int totalItems) {
    if(totalItems > 0) {
      double viewportHeight = gridController.position.viewportDimension;
      double totalHeight = gridController.position.maxScrollExtent + viewportHeight;

      int columnsCount = (MediaQuery.of(context).orientation == Orientation.portrait) ? widget.settingsHandler.portraitColumns : widget.settingsHandler.landscapeColumns;
      int rowCount = (totalItems / columnsCount).ceil();
      double rowHeight = totalHeight / rowCount;
      double rowsPerViewport = viewportHeight / rowHeight;

      int currentRow = (item / columnsCount).floor();
      // scroll to the row of the current item
      // but if we can't scroll to the top of this row (rows left < rowsPerViewport) - scroll to the max and trigger page load
      bool isCloseToEdge = (rowCount - currentRow) <= rowsPerViewport;
      double scrollToValue = isCloseToEdge ? totalHeight : max((rowHeight * currentRow), 0.0);

      // print('SCROLL CONTROLLER');
      // print(widget.gridController.position);
      // print(newValue);

      // bug: sometimes stops working (gridController is not updated after state change? i.e. reentering app, changing rotation)
      // possibly fixed after moving this function to gridView
      gridController.jumpTo(scrollToValue);
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

                                Navigator.of(context).push(PageRouteBuilder(
                                  opaque: false,
                                  pageBuilder: (BuildContext context, Animation<double> anim1, Animation<double> anim2) {
                                    return Dismissible(
                                      direction: DismissDirection.vertical,
                                      background: Container(color: Colors.black.withOpacity(0.3)),
                                      key: const Key('key'),
                                      onDismissed: (_) => Navigator.of(context).pop(),
                                      child: ImagePage(snapshot.data, index, widget.searchGlobals, widget.settingsHandler, jumpToItem),
                                    );
                                  },
                                  fullscreenDialog: true
                                ));

                                // Get.to(ImagePage(snapshot.data, index, widget.searchGlobals, widget.settingsHandler, jumpToItem));
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
              // print(widget.gridController.position.maxScrollExtent);
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
                Get.snackbar("Loading next page...", 'Page #' + widget.searchGlobals.pageNum.toString(), snackPosition: SnackPosition.TOP, duration: Duration(seconds: 2), colorText: Colors.black, backgroundColor: Colors.pink[200] );
                } else if (!isLastPage) {
                  setState((){
                    isLastPage = true;
                  });
                  Get.snackbar("No More Files", '(T⌓T)', snackPosition: SnackPosition.TOP, duration: Duration(seconds: 2), colorText: Colors.black, backgroundColor: Colors.pink[200] );
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
      ]
    );
  }
}


class HideableAppBar extends StatefulWidget implements PreferredSizeWidget {
  String title;
  List<Widget> actions;
  bool visible;
  HideableAppBar(this.title, this.actions, this.visible);

  double defaultHeight = kToolbarHeight; //56.0
  @override
  Size get preferredSize => Size.fromHeight(defaultHeight);

  @override
  _HideableAppBarState createState() => _HideableAppBarState();
}

class _HideableAppBarState extends State<HideableAppBar> {
  @override
  Widget build(BuildContext context) {
    print(widget.defaultHeight);
    return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeOutCirc,
        height: widget.visible ? widget.defaultHeight * 1.75 : 0.0, //1.75 because for some reason it gets reduced to 32
        child: AppBar(
          toolbarHeight: 56.0,
          leading: IconButton(
            // to ignore icon change
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ), 
          title: Text(widget.title),
          actions: widget.actions,
        ),
    );
  }
}

/**
 * The image page is what is dispalyed when an iamge is clicked it shows a full resolution
 * version of an image and allows scrolling left and right through the currently loaded booruItems
 *
 */
class ImagePage extends StatefulWidget {
  List fetched;
  int index;
  SearchGlobals searchGlobals;
  SettingsHandler settingsHandler;
  Function jumpToItem;
  ImagePage(this.fetched, this.index, this.searchGlobals, this.settingsHandler, this.jumpToItem);
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  PreloadPageController controller;
  PageController controllerLinux;
  ImageWriter writer = new ImageWriter();
  int viewedIndex;
  bool showAppBar = true;

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
    widget.jumpToItem(widget.index, widget.fetched.length);
  }

  @override
  Widget build(BuildContext context) {
    String appBarTitle = (viewedIndex+1).toString()+'/'+widget.fetched.length.toString();
    List<Widget> appBarActions = [
      IconButton(
        icon: Icon(Icons.save),
        onPressed: () async {
          getPerms();
          // call a function to save the currently viewed image when the save button is pressed
          Get.snackbar("Snatching started, please wait...", widget.fetched[viewedIndex].fileURL, snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: Colors.black, backgroundColor: Colors.pink[200]);
          // TODO: show progress, maybe use system downloader?
          dynamic snatchResult = await writer.write(widget.fetched[viewedIndex], widget.settingsHandler.jsonWrite, widget.searchGlobals.selectedBooru.name);
          if(snatchResult == null) {
            Get.snackbar("This file was already snatched!", widget.fetched[viewedIndex].fileURL, snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: Colors.black, backgroundColor: Colors.pink[200]);
          } else if (snatchResult is String) {
            Get.snackbar("Snatched ＼(^ o ^)／", snatchResult, snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: Colors.black, backgroundColor: Colors.pink[200]);
          } else {
            Get.snackbar("Snatching failed!", widget.fetched[viewedIndex].fileURL, snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: Colors.white, backgroundColor: Colors.red);
          }
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
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
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
                                    Get.snackbar("Added to current search", "Tag: " + currentTag, snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: Colors.black, backgroundColor: Colors.pink[200] );
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.fiber_new, color: Theme.of(context).accentColor),
                                  onPressed: (){
                                    setState(() {
                                      widget.searchGlobals.newTab.value = currentTag;
                                    });
                                    Get.snackbar("Added new tab", "Tag: " + currentTag, snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: Colors.black, backgroundColor: Colors.pink[200] );
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
    ];

    return Scaffold(
      // bug: videos restart when appbar is toggled
      appBar: HideableAppBar(appBarTitle, appBarActions, showAppBar),
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
                return GestureDetector(
                  onLongPress: () {
                    print('longpress');
                    setState(() {
                      showAppBar = !showAppBar;
                    });
                  },
                  child: isVideo
                    ? VideoApp(widget.fetched[index], index, viewedIndex, widget.settingsHandler)
                    : MediaViewer(widget.fetched[index], index, viewedIndex, widget.settingsHandler)
                );
              } else {
                return Container();
            }
          },
          controller: controller,
          onPageChanged: (int index){
            setState(() {
              viewedIndex = index;
            });
            // Scroll to current item in GridView while viewer is open, will also trigger new page loading
            widget.jumpToItem(index, widget.fetched.length);
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

  Widget loadingElementBuilder(BuildContext ctx, ImageChunkEvent loadingProgress) {
    bool hasProgressData = loadingProgress != null && loadingProgress.expectedTotalBytes != null;
    double percentDone = hasProgressData ? (loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes) : null;
    String loadedSize = hasProgressData ? formatBytes(loadingProgress.cumulativeBytesLoaded, 1) : '';
    String expectedSize = hasProgressData ? formatBytes(loadingProgress.expectedTotalBytes, 1) : '';
    String percentDoneText = hasProgressData ? ('${(percentDone*100).toStringAsFixed(2)}%') : 'Loading...';
    String filesizeText = hasProgressData ? ('$loadedSize / $expectedSize') : '';

    String thumbnailFileURL = widget.settingsHandler.previewMode == "Sample" ? widget.booruItem.sampleURL : widget.booruItem.thumbnailURL;
    File preview = File(widget.settingsHandler.cachePath + "thumbnails/" + thumbnailFileURL.substring(thumbnailFileURL.lastIndexOf("/") + 1));
    // start opacity from 20%
    double opacityValue = 0.2 + 0.8 * lerpDouble(0.0, 1.0, (percentDone == null ? 0 : percentDone));

    // print(widget.settingsHandler.cachePath + "thumbnails/" + thumbnailFileURL.substring(thumbnailFileURL.lastIndexOf("/") + 1));
    // print(opacityValue);

    return Container(
      decoration: new BoxDecoration(
        color: Colors.black,
        image: new DecorationImage(
          image: preview.existsSync() ? FileImage(preview) : NetworkImage(thumbnailFileURL),
          fit: BoxFit.contain,
          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(opacityValue), BlendMode.dstATop)
        ),
      ),
      child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 10,
                child: RotatedBox(
                  quarterTurns: -1,
                  child: LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.pink[300]),
                    value: percentDone
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.settingsHandler.loadingGif
                  ? [Container(
                    width: MediaQuery.of(context).size.width - 30,
                    child: Image(image: AssetImage('assets/images/loading.gif'))
                  )]
                  : [
                    Stack(children: [
                      Text(
                        percentDoneText,
                        style: TextStyle(
                          fontSize: 28,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 4
                            ..color = Colors.black,
                        ),
                      ),
                      Text(
                        percentDoneText,
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ]),
                    Stack(children: [
                      Text(
                        filesizeText,
                        style: TextStyle(
                          fontSize: 24,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 4
                            ..color = Colors.black,
                        ),
                      ),
                      Text(
                        filesizeText,
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ]),
                  ]
              ),
              SizedBox(
                width: 10,
                child: RotatedBox(
                  quarterTurns: percentDone != null ? -1 : 1,
                  child: LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.pink[300]),
                    value: percentDone
                  ),
                ),
              ),
            ],
          ),
        )
      )
    );
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
        tightMode: true,
        heroAttributes: PhotoViewHeroAttributes(tag: 'imageHero'),
        scaleStateController: scaleController,
        enableRotation: false,
        loadingBuilder: loadingElementBuilder,
      )
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
        future: widget.imageWriter.getCachePath(widget.fileURL, 'thumbnails'),
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
                    future: widget.imageWriter.writeCache(widget.fileURL, 'thumbnails'),
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
                          strokeWidth: 16 / widget.columnCount,
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
  final BooruItem booruItem;
  final int index;
  final int viewedIndex;
  SettingsHandler settingsHandler;
  VideoApp(this.booruItem, this.index, this.viewedIndex, this.settingsHandler);
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _videoController;
  ChewieController _chewieController;
  TapDownDetails doubleTapInfo;

  // VideoPlayerValue _latestValue;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  // void _updateState() {
  //   print(_controller.value);
  //   setState(() {
  //     _latestValue = _controller.value;
  //   });
  // }

  void doubleTapInfoWrite(TapDownDetails event) {
    doubleTapInfo = event;
  }
  // TODO: make customControls and implement this there
  void doubleTapAction() {
    if(doubleTapInfo == null || _chewieController == null || !_chewieController.videoPlayerController.value.initialized) return;

    // Detect on which side we tapped
    double screenWidth = MediaQuery.of(context).size.width;
    double screenMiddle = screenWidth / 2;
    double sidesLimit = screenWidth / 6;
    double tapPositionWidth = doubleTapInfo.localPosition.dx;
    int tapSide;
    if(tapPositionWidth > (screenMiddle + sidesLimit)) {
      tapSide = 1;
    } else if (tapPositionWidth < (screenMiddle - sidesLimit)) {
      tapSide = -1;
    } else {
      tapSide = 0;
    }

    // Decide how much we will skip depending on video length
    int videoDuration = _videoController.value.duration.inSeconds;
    int skipSeconds;
    if(videoDuration <= 5) {
      skipSeconds = 0;
    } else if(videoDuration <= 10) {
      skipSeconds = 1;
    } else if(videoDuration <= 60) {
      skipSeconds = 5;
    } else if(videoDuration <= 120) {
      skipSeconds = 10;
    } else {
      skipSeconds = 15;
    }

    if(tapSide != 0 && skipSeconds != 0) {
      int videoPositionMillisecs = _videoController.value.position.inMilliseconds;
      int videoDurationMillisecs = _videoController.value.duration.inMilliseconds;
      // Calculate new time with skip and limit it to range (0 to duration of video) (in milliseconds for accuracy)
      int newTime = min(max(0, videoPositionMillisecs + (skipSeconds * 1000 * tapSide)), videoDurationMillisecs);
      print(newTime);
      // Skip set amount of seconds if we tapped on left/right third of the screen or play/pause if in the middle
      _videoController.seekTo(new Duration(milliseconds: newTime));
      if(videoDurationMillisecs == newTime) {
        Get.snackbar("", "Reached video end", snackStyle: SnackStyle.GROUNDED, snackPosition: SnackPosition.TOP, duration: Duration(seconds: 1), colorText: Colors.black, backgroundColor: Colors.pink[200]);
      } else if(newTime == 0) {
        Get.snackbar("", "Reached video start", snackStyle: SnackStyle.GROUNDED, snackPosition: SnackPosition.TOP, duration: Duration(seconds: 1), colorText: Colors.black, backgroundColor: Colors.pink[200]);
      } else {
        Get.snackbar("", "${tapSide == 1 ? 'Skipped' : 'Rewind'} $skipSeconds second${skipSeconds > 1 ? 's' : ''}", snackStyle: SnackStyle.GROUNDED, snackPosition: SnackPosition.TOP, duration: Duration(seconds: 1), colorText: Colors.black, backgroundColor: Colors.pink[200]);
      }
    } else {
      _videoController.value.isPlaying ? _videoController.pause() : _videoController.play();
    }
  }

  Future<void> initPlayer() async {
    _videoController = VideoPlayerController.network(widget.booruItem.fileURL);
    await _videoController.initialize();
    // _videoController.addListener(_updateState);

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

  Widget loadingElementBuilder() {
    String thumbnailFileURL = widget.settingsHandler.previewMode == "Sample" ? widget.booruItem.sampleURL : widget.booruItem.thumbnailURL;
    File preview = File(widget.settingsHandler.cachePath + "thumbnails/" + thumbnailFileURL.substring(thumbnailFileURL.lastIndexOf("/") + 1));
    double opacityValue = 0.66;

    // print(widget.settingsHandler.cachePath + "thumbnails/" + thumbnailFileURL.substring(thumbnailFileURL.lastIndexOf("/") + 1));
    // print(opacityValue);

    return Container(
      decoration: new BoxDecoration(
        color: Colors.black,
        image: new DecorationImage(
          image: preview.existsSync() ? FileImage(preview) : NetworkImage(thumbnailFileURL),
          fit: BoxFit.contain,
          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(opacityValue), BlendMode.dstATop)
        ),
      ),
      child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 10,
                child: RotatedBox(
                  quarterTurns: -1,
                  child: LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.pink[300]),
                    // value: percentDone
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.settingsHandler.loadingGif
                  ? [Container(
                    width: MediaQuery.of(context).size.width - 30,
                    child: Image(image: AssetImage('assets/images/loading.gif'))
                  )]
                  : [
                    Stack(children: [
                      Text(
                        'Loading...', // percentDoneText,
                        style: TextStyle(
                          fontSize: 28,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 4
                            ..color = Colors.black,
                        ),
                      ),
                      Text(
                        'Loading...', // percentDoneText,
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ]),
                  ]
              ),
              SizedBox(
                width: 10,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.pink[300]),
                    // value: percentDone
                  ),
                ),
              ),
            ],
          ),
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isViewed = widget.viewedIndex == widget.index;
    bool initialized = _chewieController != null && _chewieController.videoPlayerController.value.initialized;
    String vWidth = '';
    String vHeight = '';

    if(initialized) {
      // vWidth = _chewieController.videoPlayerController.value.size.width.toStringAsFixed(0);
      // vHeight = _chewieController.videoPlayerController.value.size.height.toStringAsFixed(0);
      if (isViewed) {
        // Reset video time if in view
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
                  ? GestureDetector(
                    onDoubleTapDown: doubleTapInfoWrite,
                    onDoubleTap: doubleTapAction,
                    child: Chewie(controller: _chewieController)
                  )
                  : loadingElementBuilder()
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



