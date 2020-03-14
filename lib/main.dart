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

void main() {
  runApp(MaterialApp(
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
                child: Center(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      // App icon In the top of the drawer
                      new Container(
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(fit: BoxFit.fill, image: new AssetImage('assets/images/drawer_icon.png'),),
                        ),
                      ),
                      new Text("Loli Snatcher"),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    //Tags/Search field
                    new Expanded(
                      child: TextField(
                        controller: searchTagsController,
                        decoration: InputDecoration(
                          hintText:"Enter Tags",
                        ),
                      ),
                    ),
                    new Expanded(
                      child: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          // Setstate and update the tags variable so the widget rebuilds with the new tags
                          setState((){
                            //Set first run to false so a
                            firstRun = false;
                            tags = searchTagsController.text;
                          });
                        },
                      ),
                    ),

                  ],
                ),
              ),
              Container(
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
                  ],
                ),
              ),
              Container(
                child: FlatButton(
                  onPressed: (){
                    firstRun = false;
                    Get.to(SnatcherPage(searchTagsController.text,selectedBooru));
                  },
                  child: Text("Snatcher"),
                ),
              ),
              Container(
                child: FlatButton(
                  onPressed: (){
                    Get.to(SettingsPage(widget.settingsHandler));
                  },
                  child: Text("Settings"),
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
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Default Tags: "),
                  new Expanded(
                    child: TextField(
                      controller: settingsTagsController,
                      decoration: InputDecoration(
                        hintText:"Enter Tags which are loaded when app is opened",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Limit : "),
                  new Expanded(
                    child: TextField(
                      controller: settingsLimitController,
                      //The keyboard type and input formatter are used to make sure the user can only input a numerical value
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        hintText:"Images to fetch per page 0-100",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // This dropdown is used to change the quality of the images displayed on the home page
              child: DropdownButton<String>(
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
            ),
            Container(
              child: FlatButton(
                onPressed: (){
                  widget.settingsHandler.saveSettings(settingsTagsController.text,settingsLimitController.text, previewMode);
                },
                child: Text("Save"),
              ),
            ),
            Container(
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

                  FlatButton(
                    // This button loads the booru editor page
                    onPressed: (){
                      if(selectedBooru != null){
                        Get.to(booruEdit(selectedBooru,widget.settingsHandler));
                      }
                      //get to booru edit page;
                    },
                    child: Text("Edit"),
                  ),
                  FlatButton(
                    onPressed: (){
                        // Open the booru edtor page but with default values
                        Get.to(booruEdit(new Booru("New","","",""),widget.settingsHandler));
                      //get to booru edit page;
                    },
                    child: Text("Add new"),
                  ),
                ],
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
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Name: "),
                  new Expanded(
                    child: TextField(
                      controller: booruNameController,
                      decoration: InputDecoration(
                        hintText:"Enter Booru Name",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("URL : "),
                  new Expanded(
                    child: TextField(
                      controller: booruURLController,
                      decoration: InputDecoration(
                        hintText:"Enter Booru URL",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Favicon : "),
                  new Expanded(
                    child: TextField(
                      controller: booruFaviconController,
                      decoration: InputDecoration(
                        hintText:"Enter Booru favicon URL",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  FlatButton(
                    onPressed: () async{
                      //Call the booru test
                      String booruType = await booruTest(booruURLController.text);
                      // If a booru type is returned set the widget state
                      if(booruType != ""){
                        setState((){
                          widget.booruType = booruType;
                        });
                        // Alert user about the results of the test
                        Get.snackbar("Booru Type is $booruType","Click the save button to save this config",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5));
                      } else {
                        Get.snackbar("No Data Returned","the Booru may not allow api access",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5));
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
  @override
  void initState(){
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
    if (widget.settingsHandler.previewMode == "Sample"){
      return new Image.network(item.sampleURL,fit: BoxFit.cover,);
    } else {
      return new Image.network(item.thumbnailURL,fit: BoxFit.cover,);
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
              writer.saveImage([widget.fetched[controller.page.toInt()]]);
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
            return Container(
              // Photoview is used as it makes the image zoomable
              child: PhotoView(
                imageProvider: NetworkImage(widget.fetched[index].fileURL),
              ),
            );
          },
          itemCount: widget.fetched.length,
        ),
      ),
    );
  }

}

/**
 * This launches the permissions dialogue to get storage permissions from the user
 * it is called before every operation which would require writing to storage which is why its in its own function
 * The dialog will not show if the user has already accepted perms
 */
Future getPerms() async{
 return await PermissionHandler().requestPermissions([PermissionGroup.storage]);
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
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text("Tags: "),
                new Expanded(
                  child: TextField(
                    controller: snatcherTagsController,
                    decoration: InputDecoration(
                      hintText:"Enter Tags",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text("Amount: "),
                new Expanded(
                  child: TextField(
                    controller: snatcherAmountController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      hintText:"Enter amount of images to snatch",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text("Sleep (MS): "),
                new Expanded(
                  child: TextField(
                    controller: snatcherSleepController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      hintText:"Timeout between snatching (MS)",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: FlatButton(
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
    Get.snackbar("Snatching Images","Do not close the app!",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5));
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
    }

    Get.snackbar("Snatching Complete","¡¡¡( •̀ ᴗ •́ )و!!!",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5));
  }
}





