import 'package:flutter/material.dart';
import 'libBooru/GelbooruHandler.dart';
import 'libBooru/MoebooruHandler.dart';
import 'libBooru/DanbooruHandler.dart';
import 'libBooru/BooruHandler.dart';
import 'libBooru/BooruItem.dart';
import 'libBooru/Booru.dart';
import 'ImageWriter.dart';
import 'SettingsHandler.dart';
import 'package:photo_view/photo_view.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
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
  String tags = "rating:safe";
  int pageNum = 0;
  bool firstRun = true;
  Booru selectedBooru;
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
                            print("Booru = " + selectedBooru.name.toString());
                            tags = searchTagsController.text;
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
                    firstRun = false;
                    Get.to(SnatcherPage(searchTagsController.text,selectedBooru));
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
              tags = widget.settingsHandler.defTags;
              searchTagsController.text = widget.settingsHandler.defTags;
              return Images(tags, widget.settingsHandler,selectedBooru);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
      );
    } else {
      return Images(tags, widget.settingsHandler,selectedBooru);
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
    if (selectedBooru == null){
      selectedBooru = widget.settingsHandler.booruList[0];
    }
    return Container(
      child: DropdownButton<Booru>(
        value: selectedBooru,
        icon: Icon(Icons.arrow_downward),
        onChanged: (Booru newValue){
          print(newValue.baseURL);
          setState((){
            selectedBooru = newValue;
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
 * Then settings page is pretty self explanatory it will display, allow the user to edit and save settings
 */
class SettingsPage extends StatefulWidget {
  SettingsHandler settingsHandler;
  SettingsPage(this.settingsHandler);
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final settingsTagsController = TextEditingController();
  final settingsLimitController = TextEditingController();
  Booru selectedBooru;
  String previewMode = "Sample";
  @override
  // These lines are done in init state as they only need to be run once when the widget is first loaded
  void initState() {
    super.initState();
    widget.settingsHandler.loadSettings().whenComplete((){
      settingsTagsController.text = widget.settingsHandler.defTags;
      settingsLimitController.text = widget.settingsHandler.limit.toString();
      if (widget.settingsHandler.previewMode != ""){
        previewMode = widget.settingsHandler.previewMode;
      }
    });
    getPerms();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Settings")
      ),
      body:Center(
        child: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Default Tags:      "),
                  new Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                      child: TextField(
                        controller: settingsTagsController,
                        decoration: InputDecoration(
                          hintText:"Tags searched when app opens",
                          contentPadding: new EdgeInsets.fromLTRB(15,0,0,0), // left,right,top,bottom
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(50),
                            gapPadding: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Limit :            "),
                  new Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                      child: TextField(
                        controller: settingsLimitController,
                        //The keyboard type and input formatter are used to make sure the user can only input a numerical value
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          hintText: "Images to fetch per page 0-100",
                          contentPadding: new EdgeInsets.fromLTRB(15,0,0,0), // left,right,top,bottom
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(50),
                            gapPadding: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              width: double.infinity,
              // This dropdown is used to change the quality of the images displayed on the home page
              child:  Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Preview Mode :     "),
                  DropdownButton<String>(
                    value: previewMode,
                    icon: Icon(Icons.arrow_downward),
                    onChanged: (String newValue){
                      setState((){
                        previewMode = newValue;
                      });
                    },
                    items: <String>["Sample","Thumbnail"].map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              child: Row(
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
                  Container(
                    margin: EdgeInsets.fromLTRB(10,10,10,10),
                    child: FlatButton(                     // This button loads the booru editor page
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20),
                        side: BorderSide(color: Theme.of(context).accentColor),
                      ),
                      onPressed: (){
                        if(selectedBooru != null){
                          Get.to(booruEdit(selectedBooru,widget.settingsHandler));
                        }
                        //get to booru edit page;
                      },
                      child: Text("Edit"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10,10,10,10),
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20),
                          side: BorderSide(color: Theme.of(context).accentColor),
                        ),
                        onPressed: (){
                            // Open the booru edtor page but with default values
                            Get.to(booruEdit(new Booru("New","","",""),widget.settingsHandler));
                          //get to booru edit page;
                        },
                      child: Text("Add new"),
                    ),
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
                  widget.settingsHandler.saveSettings(settingsTagsController.text,settingsLimitController.text, previewMode);
                },
                child: Text("Save"),
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
                },
                child: Text("Save Location"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /**
   * This is the same as the drop down used in the Home widget. The reason the code is reused instead of having a global widget is that
   * it cant update the state of the parent widget if it is outside of the class.
   */
  Future BooruSelector() async{
    if(widget.settingsHandler.booruList == null){
      await widget.settingsHandler.getBooru();
    }
    if (selectedBooru == null){
      selectedBooru = widget.settingsHandler.booruList[0];
    }
    return Container(
      child: DropdownButton<Booru>(
        value: selectedBooru,
        icon: Icon(Icons.arrow_downward),
        onChanged: (Booru newValue){
          print(newValue.baseURL);
          setState((){
            selectedBooru = newValue;
          });
        },
        items: widget.settingsHandler.booruList.map<DropdownMenuItem<Booru>>((Booru value){
          return DropdownMenuItem<Booru>(
            value: value,
            child: Row(
              children: <Widget>[
                Text(value.name),
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
 * This is the booru editor page.
 */
class booruEdit extends StatefulWidget {
  SettingsHandler settingsHandler;
  booruEdit(this.booru,this.settingsHandler);
  Booru booru;
  String booruType = "";
  @override
  _booruEditState createState() => _booruEditState();
}

class _booruEditState extends State<booruEdit> {
  final booruNameController = TextEditingController();
  final booruURLController = TextEditingController();
  final booruFaviconController = TextEditingController();
  @override
  void initState() {
    //Load settings from the Booru instance parsed to the widget and populate the text fields
    if (widget.booru.name != "New"){
      booruNameController.text = widget.booru.name;
      booruURLController.text = widget.booru.baseURL;
      booruFaviconController.text = widget.booru.faviconURL;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Booru Editor")
      ),
      body:Center(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Name: "),
                  new Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                      child: TextField(
                        controller: booruNameController,
                        decoration: InputDecoration(
                          hintText:"Enter Booru Name",
                          contentPadding: new EdgeInsets.fromLTRB(15,0,0,0), // left,right,top,bottom
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(50),
                            gapPadding: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("URL : "),
                  new Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                      child: TextField(
                        controller: booruURLController,
                        decoration: InputDecoration(
                          hintText:"Enter Booru URL",
                          contentPadding: new EdgeInsets.fromLTRB(15,0,0,0), // left,right,top,bottom
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(50),
                            gapPadding: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Favicon : "),
                  new Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                      child: TextField(
                        controller: booruFaviconController,
                        decoration: InputDecoration(
                          hintText:"Enter Booru favicon URL",
                          contentPadding: new EdgeInsets.fromLTRB(15,0,0,0), // left,right,top,bottom
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(50),
                            gapPadding: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: Theme.of(context).accentColor),
                    ),
                    onPressed: () async{
                      //Call the booru test
                      String booruType = await booruTest(booruURLController.text);
                      // If a booru type is returned set the widget state
                      if(booruType != ""){
                        setState((){
                          widget.booruType = booruType;
                        });
                        // Alert user about the results of the test
                        Get.snackbar("Booru Type is $booruType","Click the save button to save this config",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Colors.pink[200]);
                      } else {
                        Get.snackbar("No Data Returned","the Booru may not allow api access",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Colors.pink[200]);
                      }
                    },
                    child: Text("Test"),
                  ),
                  saveButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /**
   * The save button is displayed once the test function has run and completed
   * allowing the user to save the booru config otherwise an empty container is returned
   */
  Widget saveButton(){
    if (widget.booruType == ""){
      return Container();
    } else {
      return FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20),
          side: BorderSide(color: Theme.of(context).accentColor),
        ),
        onPressed:() async{
          getPerms();
          // Call the saveBooru on the settings handler and parse it a new Booru instance with data from the input fields
          await widget.settingsHandler.saveBooru(new Booru(booruNameController.text,widget.booruType,booruFaviconController.text,booruURLController.text));
        },
        child: Text("Save"),
      );
    }
  }

  /**
   * This function will use the Base URL the user has entered and call a search up to three times
   * if the searches return null each time it tries the search it uses a different
   * type of BooruHandler
   */
  Future<String> booruTest(String URL) async{
    String booruType = "";
    BooruHandler test = new GelbooruHandler(URL, 5);
    List<BooruItem> testFetched = await test.Search(" ", 1);
    if (testFetched != null) {
      if (testFetched.length > 0){
        booruType = "Gelbooru";
        print("Found Results as Gelbooru");
        return booruType;
      }
    }
    test = new MoebooruHandler(URL, 5);
    testFetched = await test.Search(" ", 1);
    if (testFetched != null) {
      if (testFetched.length > 0) {
        booruType = "Moebooru";
        print("Found Results as Moebooru");
        return booruType;
      }
    }
    test = new DanbooruHandler(URL, 5);
    testFetched = await test.Search(" ", 1);
    if (testFetched != null) {
      if (testFetched.length > 0) {
        booruType = "Danbooru";
        print("Found Results as Danbooru");
      }
    }
    // This can return anything it's needed for the future builder.
    return booruType;
  }
}


/**
 * This widget will create a booru handler and then generate a gridview of preview images using a future builder and the search function of the booru handler
 */

class Images extends StatefulWidget {
  final String tags;
  Booru booru;
  SettingsHandler settingsHandler;
  Images(this.tags, this.settingsHandler,this.booru);
  int pageNum = 0;
  List<BooruItem> selected = new List();
  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  BooruHandler booruHandler;
  String prevTags;
  Booru prevBooru;
  @override
  void initState(){
    prevBooru = widget.booru;
    prevTags = widget.tags;
    // Set booru handler depending on the type of the booru selected with the combo box
    switch(widget.booru.type){
      case("Moebooru"):
        booruHandler = new MoebooruHandler(widget.booru.baseURL,widget.settingsHandler.limit);
        break;
      case("Gelbooru"):
        booruHandler = new GelbooruHandler(widget.booru.baseURL,widget.settingsHandler.limit);
        break;
      case("Danbooru"):
        booruHandler = new DanbooruHandler(widget.booru.baseURL,widget.settingsHandler.limit);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.booru != prevBooru || widget.tags != prevTags){
      initState();
    }
    print("Images booru: " + widget.booru.name);
    return FutureBuilder(
        future: booruHandler.Search(widget.tags, widget.pageNum),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            // A notification listener is used to get the scroll position
            return new NotificationListener<ScrollUpdateNotification>(
            child: GridView.builder(
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
            onNotification: (notif) {
              // If at bottom edge update state with incremented pageNum
              if(notif.metrics.atEdge && notif.metrics.pixels > 0 ){
                setState((){
                  widget.pageNum++;
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














/**
 * This launches the permissions dialogue to get storage permissions from the user
 * it is called before every operation which would require writing to storage which is why its in its own function
 * The dialog will not show if the user has already accepted perms
 */
Future getPerms() async{
 return await Permission.storage.request().isGranted;
}


/**
 * This is the page which allows the user to batch download images
 */
class SnatcherPage extends StatefulWidget {
  final String tags;
  Booru booru;
  SnatcherPage(this.tags,this.booru);
  @override
  _SnatcherPageState createState() => _SnatcherPageState();
}

class _SnatcherPageState extends State<SnatcherPage> {
  final snatcherTagsController = TextEditingController();
  final snatcherAmountController = TextEditingController();
  final snatcherSleepController = TextEditingController();
  @override
  void initState() {
    super.initState();
    getPerms();
    //If the user has searched tags on the main window they will be loaded into the tags field
    if (widget.tags != ""){
      snatcherTagsController.text = widget.tags;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Snatcher")
      ),
      body:Center(
        child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10,10,10,10),
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text("Tags: "),
                new Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10,0,0,0),
                    child: TextField(
                      controller: snatcherTagsController,
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
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10,10,10,10),
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text("Amount: "),
                new Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10,0,0,0),
                    child: TextField(
                      controller: snatcherAmountController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        hintText:"Amount of Images to Snatch",
                        contentPadding: new EdgeInsets.fromLTRB(15,0,0,0), // left,right,top,bottom
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(50),
                          gapPadding: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10,10,10,10),
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text("Sleep (MS): "),
                new Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10,0,0,0),
                    child: TextField(
                      controller: snatcherSleepController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        hintText:"Timeout between snatching (MS)",
                        contentPadding: new EdgeInsets.fromLTRB(15,0,0,0), // left,right,top,bottom
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(50),
                          gapPadding: 0,
                        ),
                      ),
                    ),
                  ),
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
              /**
               * When the snatch button is pressed the snatch function is called and then
               * Get.back is used to close the snatcher window
               */
              onPressed: (){
                Snatcher(snatcherTagsController.text,snatcherAmountController.text,int.parse(snatcherSleepController.text));
                Get.back();
                //Get.off(SnatcherProgressPage(snatcherTagsController.text,snatcherAmountController.text,snatcherTimeoutController.text));
              },
              child: Text("Snatch Images"),
            ),
          ),
        ],
        ),
      ),
    );
  }
  Future Snatcher(String tags, String amount, int timeout) async{
    ImageWriter writer = new ImageWriter();
    int count = 0, limit,page = 0;
    BooruHandler booruHandler;
    var booruItems;
    if (int.parse(amount) <= 100){
      limit = int.parse(amount);
    } else {
      limit = 100;
    }
    Get.snackbar("Snatching Images","Do not close the app!",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Colors.pink[200]);
    switch(widget.booru.type){
      case("Moebooru"):
        booruHandler = new MoebooruHandler(widget.booru.baseURL,limit);
        break;
      case("Gelbooru"):
        booruHandler = new GelbooruHandler(widget.booru.baseURL,limit);
        break;
      case("Danbooru"):
        booruHandler = new DanbooruHandler(widget.booru.baseURL,limit);
        break;
    }
    // Loop until the count variable is bigger or equal to amount
    // The count variable is used instead of checking the length of booruItems because the amount of images stored on
    // The booru may be less than the user wants which would result in an infinite loop since the length would never be big enough
    while (count < int.parse(amount)){
      booruItems = await Future.delayed(Duration(milliseconds: timeout), () {return booruHandler.Search(tags,page);});
      page ++;
      count += limit;
      print(count);
    }

    for (int n = 0; n < int.parse(amount); n ++){
      await Future.delayed(Duration(milliseconds: timeout), () {writer.write(booruItems[n]);});
      if (n%10 == 0 || n == int.parse(amount) - 1){
        Get.snackbar("＼(^ o ^)／","Snatched $n / $amount",snackPosition: SnackPosition.BOTTOM,duration: Duration(seconds: 1),colorText: Colors.black, backgroundColor: Colors.pink[200]);
      }
    }
    //
    Get.snackbar("Snatching Complete","¡¡¡( •̀ ᴗ •́ )و!!!",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Colors.pink[200]);
  }
}
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Snatcher")
        ),
        body:Center(
          child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10,10,10,10),
                  child: Text("Loli Snatcher is open source and licensed under GPLv3 the source code is available on github. Please report any issues or feature requests in the issues section of the repo."),),
                Container(
                  margin: EdgeInsets.fromLTRB(10,10,10,10),
                  child: Row(
                      children: <Widget>[
                        Text("Contact: "),
                        SelectableText("no.aisu@protonmail.com"),
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
                      _launchURL("https://github.com/NO-ob/LoliSnatcher_Droid");
                    },
                    child: Text("GitHub"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10,10,10,10),
                  child: Text("A Big thanks to Showers-U for letting me use their artwork for the app logo please check them out on pixiv"),),
                Container(
                  alignment: Alignment.center,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: Theme.of(context).accentColor,),
                    ),
                    onPressed: (){
                      _launchURL("https://www.pixiv.net/en/users/28366691");
                    },
                    child: Text("Showers-U - Pixiv"),
                  ),
                ),
           ],
          ),
        ),
      );
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


