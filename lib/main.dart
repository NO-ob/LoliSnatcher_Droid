import 'package:flutter/material.dart';
import 'libBooru/GelbooruHandler.dart';
import 'libBooru/MoebooruHandler.dart';
import 'libBooru/PhilomenaHandler.dart';
import 'libBooru/DanbooruHandler.dart';
import 'libBooru/ShimmieHandler.dart';
import 'libBooru/BooruHandler.dart';
import 'libBooru/BooruItem.dart';
import 'libBooru/e621Handler.dart';
import 'libBooru/Booru.dart';
import 'ImageWriter.dart';
import 'SettingsHandler.dart';
import 'package:photo_view/photo_view.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
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
  List<SearchGlobals> searchGlobals = new List.from([new SearchGlobals(),new SearchGlobals()]);
  int globalsIndex = 0;
  bool firstRun = true;
  final searchTagsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Loli Snatcher"),
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
                    new Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10,0,0,0),
                        child: TextField(
                          controller: searchTagsController,
                          decoration: InputDecoration(
                            hintText:"Enter Tags",
                            contentPadding: new EdgeInsets.fromLTRB(15,0,0,0), // left,right,top,bottom
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(50),
                                gapPadding: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                     IconButton(
                        padding: new EdgeInsets.all(20),
                        icon: Icon(Icons.search),
                        onPressed: () {
                          // Setstate and update the tags variable so the widget rebuilds with the new tags
                          setState((){
                            //Set first run to false so a
                            firstRun = false;
                            print("Booru = " + searchGlobals[globalsIndex].selectedBooru.name.toString());
                            searchGlobals[globalsIndex].tags = searchTagsController.text;
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
                    setState((){
                      if(globalsIndex == 0){
                        globalsIndex++;
                      } else {
                        globalsIndex--;
                      }
                    });
                  },
                  child: Text("Tab Toggle"),
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
                    firstRun = false;
                    Get.to(SnatcherPage(searchTagsController.text,searchGlobals[globalsIndex].selectedBooru));
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
      );
  }

  /** If first run is true the default tags are loaded using the settings controller then parsed to the images widget
   * This is done with a future builder as we must wait for the permissions popup and also for the settings to load
   * **/
  Widget ImagesFuture(){
    if (firstRun){
      return FutureBuilder(
          future: ImagesFutures(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done){
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
    if(widget.settingsHandler.booruList == null){
      await widget.settingsHandler.getBooru();
    }
    // This null check is used otherwise the selected booru resets when the state changes, the state changes when a booru is selected
    if (searchGlobals[globalsIndex].selectedBooru == null){
      searchGlobals[globalsIndex].selectedBooru = widget.settingsHandler.booruList[0];
    }
    return Container(
      child: DropdownButton<Booru>(
        value: searchGlobals[globalsIndex].selectedBooru,
        icon: Icon(Icons.arrow_downward),
        onChanged: (Booru newValue){
          print(newValue.baseURL);
          setState((){
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
                Text(value.name),
                //Booru Icon
                Image.network(value.faviconURL),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}



/**
 * This widget will create a booru handler and then generate a gridview of preview images using a future builder and the search function of the booru handler
 */

class Images extends StatefulWidget {
  SearchGlobals searchGlobals;
  SettingsHandler settingsHandler;
  Images(this.settingsHandler,this.searchGlobals);
  List<BooruItem> selected = new List();
  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  String prevTags;
  Booru prevBooru;
  ScrollController gridController = new ScrollController();
  @override
  void initState(){
    prevBooru = widget.searchGlobals.selectedBooru;
    prevTags = widget.searchGlobals.tags;
    if (widget.searchGlobals.selectedBooru.type != widget.searchGlobals.handlerType){
      widget.searchGlobals.handlerType = widget.searchGlobals.selectedBooru.type;
      widget.searchGlobals.pageNum = 0;
      widget.searchGlobals.scrollPosition = 0;
      // Set booru handler depending on the type of the booru selected with the combo box
      switch(widget.searchGlobals.selectedBooru.type) {
        case("Moebooru"):
          widget.searchGlobals.booruHandler = new MoebooruHandler(
              widget.searchGlobals.selectedBooru.baseURL,
              widget.settingsHandler.limit);
          break;
        case("Gelbooru"):
          widget.searchGlobals.booruHandler = new GelbooruHandler(
              widget.searchGlobals.selectedBooru.baseURL,
              widget.settingsHandler.limit);
          break;
        case("Danbooru"):
          widget.searchGlobals.booruHandler = new DanbooruHandler(
              widget.searchGlobals.selectedBooru.baseURL,
              widget.settingsHandler.limit);
          break;
        case("e621"):
          widget.searchGlobals.booruHandler = new e621Handler(
              widget.searchGlobals.selectedBooru.baseURL,
              widget.settingsHandler.limit);
          break;
        case("Shimmie"):
          widget.searchGlobals.booruHandler = new ShimmieHandler(
              widget.searchGlobals.selectedBooru.baseURL,
              widget.settingsHandler.limit);
          break;
        case("Philomena"):
          widget.searchGlobals.pageNum = 1;
          widget.searchGlobals.booruHandler = new PhilomenaHandler(
              widget.searchGlobals.selectedBooru.baseURL,
              widget.settingsHandler.limit);
          break;
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    if (widget.searchGlobals.selectedBooru != prevBooru || widget.searchGlobals.tags != prevTags){
      initState();
    }
    if (widget.searchGlobals.scrollPosition != 0){
      gridController = new ScrollController(initialScrollOffset: widget.searchGlobals.scrollPosition);
    }
    print("Images booru: " + widget.searchGlobals.selectedBooru.name);
    return FutureBuilder(
        future: widget.searchGlobals.booruHandler.Search(widget.searchGlobals.tags, widget.searchGlobals.pageNum),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            // A notification listener is used to get the scroll position
            return new NotificationListener<ScrollUpdateNotification>(
            child: GridView.builder(
              controller: gridController,
              itemCount: snapshot.data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                /**The short if statement with the media query is used to decide whether to display 2 or 4
                 * thumbnails in a row of the grid depending on screen orientation
                 */
              crossAxisCount: (MediaQuery.of(context).orientation == Orientation.portrait) ? 2 : 4),
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                  child: new GridTile(
                    // Inkresponse is used so the tile can have an onclick function
                    child: new InkResponse(
                      enableFeedback: true,
                      child: sampleorThumb(snapshot.data[index]),
                      onTap: () {
                        // Load the image viewer
                        Get.to(ImagePage(snapshot.data,index));
                      },
                      onLongPress: (){
                        widget.selected.add(snapshot.data[index]);
                      },
                    ),
                  ),
                );
              },
            ),
            // ignore: missing_return
            onNotification: (notif) {
              widget.searchGlobals.scrollPosition = gridController.offset;
              // If at bottom edge update state with incremented pageNum
              if(notif.metrics.atEdge && notif.metrics.pixels > 0 ){
                setState((){
                  widget.searchGlobals.pageNum++;
                });
              }
            },
          );
          }
        });
  }

  /**This will return an Image from the booruItem and will use either the sample url
   * or the thumbnail url depending on the users settings (sampleURL is much higher quality)
   *
   */
  Widget sampleorThumb(BooruItem item){
    if (widget.settingsHandler.previewMode == "Thumbnail" || item.fileURL.substring(item.fileURL.lastIndexOf(".") + 1) == "webm" || item.fileURL.substring(item.fileURL.lastIndexOf(".") + 1) == "mp4"){
      return new Image.network(item.thumbnailURL,fit: BoxFit.cover,);
    } else {
      return new Image.network(item.sampleURL,fit: BoxFit.cover,);
    }
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
  ImagePage(this.fetched,this.index);
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage>{
  PageController controller;
  ImageWriter writer = new ImageWriter();

  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: widget.index,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Viewer"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              getPerms();
              // call a function to save the currently viewed image when the save button is pressed
              writer.write(widget.fetched[controller.page.toInt()]);
              Get.snackbar("Snatched ＼(^ o ^)／",widget.fetched[controller.page.toInt()].fileURL,snackPosition: SnackPosition.BOTTOM,duration: Duration(seconds: 1),colorText: Colors.black, backgroundColor: Colors.pink[200]);
            },
          ),
          IconButton(
            icon: Icon(Icons.public),
            onPressed: (){
              _launchURL(widget.fetched[controller.page.toInt()].postURL);
            },
          ),
        ],
      ),
      body: Center(
        /**
         * The pageView builder will created a page for each image in the booruList(fetched)
         */
        child: PageView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (widget.fetched[index].fileURL.substring(widget.fetched[index].fileURL.lastIndexOf(".") + 1) == "webm" || widget.fetched[index].fileURL.substring(widget.fetched[index].fileURL.lastIndexOf(".") + 1) == "mp4"){
              return VideoApp(widget.fetched[index].fileURL);
            } else {
              return Container(
                // Photoview is used as it makes the image zoomable
                child: PhotoView(
                  imageProvider: NetworkImage(widget.fetched[index].fileURL),
                ),
              );
            }
          },
          itemCount: widget.fetched.length,
        ),
      ),
    );
  }

}


/**
 * None of the code in this widget is mine it's from the example at https://pub.dev/packages/video_player
 */
class VideoApp extends StatefulWidget {
  String url;
  VideoApp(this.url);
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        widget.url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: _controller.value.initialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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





