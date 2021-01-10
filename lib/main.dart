import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
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
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'AboutPage.dart';
import 'getPerms.dart';
import 'Snatcher.dart';
import 'SettingsPage.dart';
import 'SearchGlobals.dart';

void main() {
  runApp(MaterialApp(
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
    home: Home(),
  ));
}
/** The home widget is the main widget of the app and contains the Image Previews and the settings drawer.
 *
 * **/
class Home extends StatefulWidget {
  SettingsHandler settingsHandler = new SettingsHandler();

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  List<SearchGlobals> searchGlobals = new List.from([new SearchGlobals(null,"")]);
  FocusNode searchBoxFocus = new FocusNode();
  int globalsIndex = 0;
  bool firstRun = true;
  final searchTagsController = TextEditingController();
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

    return Listener(
        onPointerDown: (event){
          if(searchBoxFocus.hasFocus){
            print("destroyed overlay");
            searchBoxFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("Loli Snatcher"),
            actions:<Widget>[
              IconButton(
                icon: Icon(Icons.save),
                onPressed: (){
                  getPerms();
                  // call a function to save the currently viewed image when the save button is pressed
                  if (searchGlobals[globalsIndex].selected.length > 0){
                    ImageWriter writer = new ImageWriter();
                    writer.writeSelected(searchGlobals[globalsIndex], widget.settingsHandler.jsonWrite);
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
                            return DropdownMenuItem<SearchGlobals>(value: value, child: Text(value.tags));
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
                      Get.to(SnatcherPage(searchTagsController.text,searchGlobals[globalsIndex].selectedBooru,widget.settingsHandler));
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
            future: ImagesFutures(),
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
                        future: ImagesFutures(),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState == ConnectionState.done){
                            firstRun = false;
                            searchGlobals[globalsIndex].tags = widget.settingsHandler.defTags;
                            searchTagsController.text = widget.settingsHandler.defTags;
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
  // Future used in the above future builder it calls getPerms and loadSettings
  Future ImagesFutures() async{
    await getPerms();
    await widget.settingsHandler.loadSettings();
    return true;
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
  switch (searchGlobals.selectedBooru.type) {
    case("Moebooru"):
      searchGlobals.booruHandler = new MoebooruHandler(searchGlobals.selectedBooru, limit);
      break;
    case("Gelbooru"):
      searchGlobals.booruHandler = new GelbooruHandler(searchGlobals.selectedBooru, limit);
      break;
    case("Danbooru"):
      searchGlobals.pageNum = 1;
      searchGlobals.booruHandler = new DanbooruHandler(searchGlobals.selectedBooru, limit);
      break;
    case("e621"):
      searchGlobals.booruHandler = new e621Handler(searchGlobals.selectedBooru, limit);
      break;
    case("Shimmie"):
      searchGlobals.booruHandler = new ShimmieHandler(searchGlobals.selectedBooru, limit);
      break;
    case("Philomena"):
      searchGlobals.pageNum = 1;
      searchGlobals.booruHandler = new PhilomenaHandler(searchGlobals.selectedBooru, limit);
      break;
    case("Szurubooru"):
      searchGlobals.pageNum = 0;
      searchGlobals.booruHandler = new SzurubooruHandler(searchGlobals.selectedBooru, limit);
      break;
    case("Sankaku"):
      searchGlobals.pageNum = 1;
      searchGlobals.booruHandler = new SankakuHandler(searchGlobals.selectedBooru, limit);
      break;
    case("Hydrus"):
      searchGlobals.pageNum = 1;
      searchGlobals.booruHandler = new HydrusHandler(searchGlobals.selectedBooru, limit);
      break;
  }

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
                // bug: if scrolled again after new page started loading - triggers multiple page loads
                // bug: endlessly triggers new page loads when reached last page
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
    String itemExt = item.fileURL.substring(item.fileURL.lastIndexOf(".") + 1);
    List<dynamic> itemType = getFileTypeAndIcon(itemExt);
    bool isThumb = widget.settingsHandler.previewMode == "Thumbnail" || (itemType[0] == 'gif' || itemType[0] == 'video');
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network(
      isThumb ? item.thumbnailURL : item.sampleURL,
      fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
      loadingBuilder: (BuildContext ctx, Widget child, ImageChunkEvent loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          bool hasProgressData = loadingProgress.expectedTotalBytes != null;
          double percentDone = hasProgressData ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes : null;
          String percentDoneText = hasProgressData ? ((percentDone*100).toStringAsFixed(2) + '%') : 'No size data';
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100 / columnCount,
                width: 100 / columnCount,
                child: CircularProgressIndicator(
                  strokeWidth: 16 / columnCount,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.pink[300]),
                  value: percentDone,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              columnCount < 4 // Text element overflows if too many thumbnails are shown
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
        ),
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
  int viewedIndex = 0;

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
      widget.gridController.jumpTo(scrollToValue);
    }
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
              writer.write(widget.fetched[controller.page.toInt()],widget.settingsHandler.jsonWrite);
              Get.snackbar("Snatched ＼(^ o ^)／",widget.fetched[controller.page.toInt()].fileURL,snackPosition: SnackPosition.BOTTOM,duration: Duration(seconds: 1),colorText: Colors.black, backgroundColor: Colors.pink[200]);
            },
          ),
          IconButton(
            icon: Icon(Icons.public),
            onPressed: (){
              _launchURL(widget.fetched[controller.page.toInt()].postURL);
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
                              itemCount: widget.fetched[controller.page.toInt()].tagsList.length,
                              itemBuilder: (BuildContext context, int index){
                                String currentTag = widget.fetched[controller.page.toInt()].tagsList[index];
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
        child: Platform.isAndroid ? PreloadPageView.builder(
          preloadPagesCount: widget.settingsHandler.preloadCount,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            String fileURL = widget.fetched[index].fileURL;
            bool isVideo = ['webm', 'mp4'].any((val) => fileURL.substring(fileURL.lastIndexOf(".") + 1).contains(val));
            int preloadCount = widget.settingsHandler.preloadCount;
            if (isVideo) {
              return VideoApp(fileURL, index, viewedIndex, preloadCount);
            } else {
              print(fileURL);
              bool isViewed = viewedIndex == index;
              bool isNear = (viewedIndex - index).abs() <= preloadCount;
              // Render only if viewed or in preloadCount range
              if(isViewed || isNear) {
                return Container(
                  // InteractiveViewer is used to make the image zoomable
                  child: InteractiveViewer(
                    panEnabled: true,
                    boundaryMargin: EdgeInsets.zero,
                    minScale: 0.5,
                    maxScale: 8,
                    child: Image.network(
                      fileURL,
                      loadingBuilder: (BuildContext ctx, Widget child, ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          bool hasProgressData = loadingProgress.expectedTotalBytes != null;
                          double percentDone = hasProgressData ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes : null;
                          String loadedSize = formatBytes(loadingProgress.cumulativeBytesLoaded, 1);
                          String expectedSize = formatBytes(loadingProgress.expectedTotalBytes, 1);
                          String percentDoneText = hasProgressData ? ('${(percentDone*100).toStringAsFixed(2)}%') : 'No size data';
                          String filesizeText = hasProgressData ? ('$loadedSize / $expectedSize') : '';
                          return Column(
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
                          );
                        }
                      },
                    ),
                  ),
                );
              } else {
                return Container();
              }
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
        ) : PageView.builder(
          controller: controllerLinux,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (widget.fetched[index].fileURL.substring(widget.fetched[index].fileURL.lastIndexOf(".") + 1).contains("webm") || widget.fetched[index].fileURL.substring(widget.fetched[index].fileURL.lastIndexOf(".") + 1).contains("mp4")){
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
                          Process.run('mpv',[widget.fetched[index].fileURL]);
                        },
                        child: Text("Open in MPV"),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Image.network(widget.fetched[index].fileURL);
            }
          }
      ),
      ),
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
  final int preloadCount;
  VideoApp(this.url, this.index, this.viewedIndex, this.preloadCount);
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  Future<void> initPlayer() async {
    _controller = VideoPlayerController.network(widget.url);
    await _controller.initialize();

    // Player wrapper to allow controls, looping...
    _chewieController = ChewieController(
      videoPlayerController: _controller,
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
    bool isNear = (widget.viewedIndex - widget.index).abs() <= widget.preloadCount;
    bool initialized = _chewieController != null && _chewieController.videoPlayerController.value.initialized;
    String vWidth = '?';
    String vHeight = '?';
    if(initialized) {
      vWidth = _chewieController.videoPlayerController.value.size.width.toStringAsFixed(0);
      vHeight = _chewieController.videoPlayerController.value.size.height.toStringAsFixed(0);
      if (isViewed) {
        _controller.play();
      } else {
        _controller.pause();
      }
    }

    // Render only if viewed or in preloadCount range
    if(isViewed || isNear) {
      return Container(
        child: Scaffold(
          body: Column(
            children: <Widget>[
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
              // Show video dimensions on the bottom
              Text(vWidth+'x'+vHeight),
            ],
          )
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
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



