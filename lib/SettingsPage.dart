import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/libBooru/DBHandler.dart';
import 'package:flutter/material.dart';
import 'libBooru/BooruOnRailsHandler.dart';
import 'libBooru/GelbooruHandler.dart';
import 'libBooru/GelbooruV1Handler.dart';
import 'libBooru/MoebooruHandler.dart';
import 'libBooru/PhilomenaHandler.dart';
import 'libBooru/DanbooruHandler.dart';
import 'libBooru/ShimmieHandler.dart';
import 'libBooru/HydrusHandler.dart';
import 'libBooru/SankakuHandler.dart';
import 'libBooru/BooruHandler.dart';
import 'libBooru/BooruItem.dart';
import 'libBooru/e621Handler.dart';
import 'libBooru/SzurubooruHandler.dart';
import 'libBooru/Booru.dart';
import 'widgets/InfoDialog.dart';
import 'getPerms.dart';
import 'SettingsHandler.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
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
  final ServiceHandler serviceHandler = ServiceHandler();
  final settingsTagsController = TextEditingController();
  final settingsLimitController = TextEditingController();
  final settingsColumnsLandscapeController = TextEditingController();
  final settingsColumnsPortraitController = TextEditingController();
  final settingsPreloadController = TextEditingController();
  final settingsSnatchCooldownController = TextEditingController();
  bool jsonWrite = false, autoPlay = true, loadingGif = false, imageCache = false, mediaCache = false, autoHideImageBar = false, dbEnabled = true;
  Booru selectedBooru;
  String previewMode, videoCacheMode,previewDisplay,galleryMode;
  @override
  // These lines are done in init state as they only need to be run once when the widget is first loaded
  void initState() {
    super.initState();
    widget.settingsHandler.loadSettings().whenComplete((){
      settingsTagsController.text = widget.settingsHandler.defTags;
      settingsColumnsPortraitController.text = widget.settingsHandler.portraitColumns.toString();
      settingsColumnsLandscapeController.text = widget.settingsHandler.landscapeColumns.toString();
      settingsLimitController.text = widget.settingsHandler.limit.toString();
      settingsPreloadController.text = widget.settingsHandler.preloadCount.toString();
      settingsSnatchCooldownController.text = widget.settingsHandler.snatchCooldown.toString();
    });
    previewMode = widget.settingsHandler.previewMode;
    previewDisplay = widget.settingsHandler.previewDisplay;
    videoCacheMode = widget.settingsHandler.videoCacheMode;
    galleryMode = widget.settingsHandler.galleryMode;
    getPerms();
    setState(() {
      jsonWrite = widget.settingsHandler.jsonWrite;
      autoPlay = widget.settingsHandler.autoPlayEnabled;
      loadingGif = widget.settingsHandler.loadingGif;
      imageCache = widget.settingsHandler.imageCache;
      mediaCache = widget.settingsHandler.mediaCache;
      autoHideImageBar = widget.settingsHandler.autoHideImageBar;
      dbEnabled = widget.settingsHandler.dbEnabled;
    });
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
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Gallery View Preload :            "),
                  new Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                      child: TextField(
                        controller: settingsPreloadController,
                        //The keyboard type and input formatter are used to make sure the user can only input a numerical value
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          hintText: "Images to preload",
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
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Preview Columns Portrait:      "),
                  new Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                      child: TextField(
                        controller: settingsColumnsPortraitController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          hintText:"Amount of images to show horizonatally",
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
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Preview Columns Landscape:      "),
                  new Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                      child: TextField(
                        controller: settingsColumnsLandscapeController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          hintText:"Amount of images to show horizonatally",
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
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Snatch Cooldown (MS):      "),
                  new Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                      child: TextField(
                        controller: settingsSnatchCooldownController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          hintText:"Timeout between snatching images",
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
              child: Row(children: [
                Text("Write Image JSON: "),
                Checkbox(
                  value: jsonWrite,
                  onChanged: (newValue) {
                    setState(() {
                      jsonWrite = newValue;
                    });
                  },
                  activeColor: Get.context.theme.primaryColor,
                )
              ],)
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                child: Row(children: [
                  Text("Enable Database: "),
                  Checkbox(
                    value: dbEnabled,
                    onChanged: (newValue) {
                      setState(() {
                        dbEnabled = newValue;
                      });
                    },
                    activeColor: Get.context.theme.primaryColor,
                  ),
                  IconButton(
                    icon: Icon(Icons.info, color: Get.context.theme.accentColor),
                    onPressed: () {
                      Get.dialog(
                          InfoDialog("Database",
                              [
                                Text("The database will store favourites and also track if an item is snatched"),
                                Text("If an item is snatched it wont be snatched again"),
                              ]
                          )
                      );
                    },
                  ),
                ],)
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(20,10,20,10),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20),
                  side: BorderSide(color: Get.context.theme.accentColor),
                ),
                onPressed: (){
                  serviceHandler.deleteDB(widget.settingsHandler);
                  ServiceHandler.displayToast("Database Deleted! \n An app restart be required!");
                  //Get.snackbar("Cache cleared!","Restart may be required!",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context.theme.primaryColor);
                },
                child: Text("Delete Database"),
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                child: Row(children: [
                  Text("Video Auto Play: "),
                  Checkbox(
                    value: autoPlay,
                    onChanged: (newValue) {
                      setState(() {
                        autoPlay = newValue;
                      });
                    },
                    activeColor: Get.context.theme.primaryColor,
                  )
                ],)
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                child: Row(children: [
                  Text("Kanna loading Gif: "),
                  Checkbox(
                    value: loadingGif,
                    onChanged: (newValue) {
                      setState(() {
                        loadingGif = newValue;
                      });
                    },
                    activeColor: Get.context.theme.primaryColor,
                  )
                ],)
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              width: double.infinity,
              // This dropdown is used to change the display mode of the preview grid
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Preview Display :     "),
                  DropdownButton<String>(
                    value: previewDisplay,
                    icon: Icon(Icons.arrow_downward),
                    onChanged: (String newValue){
                      setState((){
                        previewDisplay = newValue;
                      });
                    },
                    items: <String>["Waterfall","Staggered"].map<DropdownMenuItem<String>>((String value){
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
              width: double.infinity,
              // This dropdown is used to change the quality of the images displayed on the home page
              child: Row(
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
                  IconButton(
                    icon: Icon(Icons.info, color: Get.context.theme.accentColor),
                    onPressed: () {
                      Get.dialog(
                          InfoDialog("Preview Mode",
                              [
                                Text("The preview mode changes the resolution of iamges in the preview grid"),
                                Text(" - Sample - Medium resolution"),
                                Text(" - Thumbnail - Low resolution"),
                              ]
                          )
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              width: double.infinity,
              // This dropdown is used to change the quality of the images displayed on the home page
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Gallery Mode :     "),
                  DropdownButton<String>(
                    value: galleryMode,
                    icon: Icon(Icons.arrow_downward),
                    onChanged: (String newValue){
                      setState((){
                        galleryMode = newValue;
                      });
                    },
                    items: <String>["Sample","Full Res"].map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  IconButton(
                    icon: Icon(Icons.info, color: Get.context.theme.accentColor),
                    onPressed: () {
                      Get.dialog(
                          InfoDialog("Gallery Mode",
                              [
                                Text("The preview mode changes the resolution of iamges in the preview grid"),
                                Text(" - Sample - Medium resolution"),
                                Text(" - Full Res - Full resolution"),
                              ]
                          )
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10,10,10,2),
                child: Row(children: [
                  Text("Thumbnail Cache: "),
                  Checkbox(
                    value: imageCache,
                    onChanged: (newValue) {
                      setState(() {
                        imageCache = newValue;
                      });
                    },
                    activeColor: Get.context.theme.primaryColor,
                  )
                ],)
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
                child: Row(children: [
                  Text("Media Cache: "),
                  Checkbox(
                    value: mediaCache,
                    onChanged: (newValue) {
                      setState(() {
                        mediaCache = newValue;
                      });
                    },
                    activeColor: Get.context.theme.primaryColor,
                  )
                ],)
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
              width: double.infinity,
              // This dropdown is used to change how we fetch and cache videos
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Video Cache Mode :     "),
                  DropdownButton<String>(
                    value: videoCacheMode,
                    icon: Icon(Icons.arrow_downward),
                    onChanged: (String newValue){
                      setState((){
                        videoCacheMode = newValue;
                      });
                    },
                    items: <String>["Stream","Cache","Stream+Cache"].map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  IconButton(
                    icon: Icon(Icons.info, color: Get.context.theme.accentColor),
                    onPressed: () {
                        Get.dialog(
                          InfoDialog("Video Cache Modes",
                              [
                                Text("- Stream - Don't cache, start playing as soon as possible"),
                                Text("- Cache - Saves to device storage, plays only when download is complete"),
                                Text("- Stream+Cache - Mix of both, but currently leads to double download"),
                                Text("[Note]: Videos will cache only if Media Cache is enabled")
                              ]
                          )
                        );
                    },
                  ),
                ],
              ),
            ),

            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(20,10,20,10),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20),
                  side: BorderSide(color: Get.context.theme.accentColor),
                ),
                onPressed: (){
                  serviceHandler.emptyCache();
                  ServiceHandler.displayToast("Cache cleared! \n Restart may be required!");
                  //Get.snackbar("Cache cleared!","Restart may be required!",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context.theme.primaryColor);
                },
                child: Text("Clear cache"),
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10,10,10,10),
                child: Row(children: [
                  Text("Auto Hide Gallery Bar: "),
                  Checkbox(
                    value: autoHideImageBar,
                    onChanged: (newValue) {
                      setState(() {
                        autoHideImageBar = newValue;
                      });
                    },
                    activeColor: Get.context.theme.primaryColor,
                  )
                ],)
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Booru:    "),
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
                  IconButton(
                    icon: Icon(Icons.info, color: Get.context.theme.accentColor),
                    onPressed: () {
                      Get.dialog(
                          InfoDialog("Booru",
                              [
                                Text("The booru selected here when saving will be set as default"),
                                Text("The default booru will be first to appear in the dropdown boxes"),
                              ]
                          )
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10,10,10,10),
                    child: FlatButton(                     // This button loads the booru editor page
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20),
                        side: BorderSide(color: Get.context.theme.accentColor),
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
                        side: BorderSide(color: Get.context.theme.accentColor),
                      ),
                      onPressed: (){
                        // Open the booru edtor page but with default values
                        Get.to(booruEdit(new Booru("New","","","",""),widget.settingsHandler));
                        //get to booru edit page;
                      },
                      child: Text("Add new"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10,10,10,10),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20),
                        side: BorderSide(color: Get.context.theme.accentColor),
                      ),
                      onPressed: (){
                        // Open the booru edtor page but with default values
                        if (widget.settingsHandler.deleteBooru(selectedBooru)){
                          setState(() {
                            ServiceHandler.displayToast("Booru Deleted! \n Dropdown will update on search");
                            //Get.snackbar("Booru Deleted!","Dropdown will update on search",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context.theme.primaryColor);
                          });
                        }
                        //get to booru edit page;
                      },
                      child: Text("Delete"),
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
                  side: BorderSide(color: Get.context.theme.accentColor),
                ),
                onPressed: (){
                  if (selectedBooru == null && widget.settingsHandler.booruList.isNotEmpty){selectedBooru = widget.settingsHandler.booruList.elementAt(0);}
                  widget.settingsHandler.saveSettings(settingsTagsController.text,settingsLimitController.text, previewMode,settingsColumnsPortraitController.text,settingsColumnsLandscapeController.text,settingsPreloadController.text,jsonWrite,selectedBooru.name, autoPlay, loadingGif, imageCache, mediaCache, videoCacheMode, autoHideImageBar,settingsSnatchCooldownController.text,previewDisplay, galleryMode, dbEnabled);
                },
                child: Text("Save"),
              ),
            ),
           /* Container(
              alignment: Alignment.center,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20),
                  side: BorderSide(color: Get.context.theme.accentColor),
                ),
                onPressed: (){
                },
                child: Text("Save Location"),
              ),
            ),*/
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
    if(widget.settingsHandler.booruList.isEmpty){
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
                Image.network(value.faviconURL, width: 16),
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
  final booruAPIKeyController = TextEditingController();
  final booruUserIDController = TextEditingController();
  final booruDefTagsController = TextEditingController();
  List<String> booruTypes = ["Not Sure","Danbooru","e621","Gelbooru","GelbooruV1","Moebooru","Philomena","Sankaku","Shimmie","Szurubooru","Hydrus","BooruOnRails"];
  String selectedBooruType = "Not Sure";
  @override
  void initState() {
    //Load settings from the Booru instance parsed to the widget and populate the text fields
    if (widget.booru.name != "New"){
      booruNameController.text = widget.booru.name;
      booruURLController.text = widget.booru.baseURL;
      booruFaviconController.text = widget.booru.faviconURL;
      booruAPIKeyController.text = widget.booru.apiKey;
      booruUserIDController.text = widget.booru.userID;
      booruDefTagsController.text = widget.booru.defTags;
      selectedBooruType = widget.booru.type;
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
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: Get.context.theme.accentColor),
                    ),
                    onPressed: () async{
                      //Call the booru test
                      if(booruURLController.text.contains("chan.sankakucomplex.com")){
                        booruURLController.text = "https://capi-v2.sankakucomplex.com";
                        booruFaviconController.text = "https://chan.sankakucomplex.com/favicon.ico";
                      }
                      if(!booruURLController.text.contains("http://") && !booruURLController.text.contains("https://")){
                        booruURLController.text = "https://" + booruURLController.text;
                      }
                      Booru testBooru;
                      if(booruAPIKeyController.text == ""){
                        testBooru = new Booru(booruNameController.text,widget.booruType,booruFaviconController.text,booruURLController.text,booruDefTagsController.text);
                      } else {
                        testBooru = new Booru.withKey(booruNameController.text,widget.booruType,booruFaviconController.text,booruURLController.text,booruDefTagsController.text,booruAPIKeyController.text,booruUserIDController.text);
                      }
                      String booruType = await booruTest(testBooru, selectedBooruType, booruTypes);
                      if(booruFaviconController.text == ""){
                        booruFaviconController.text = booruURLController.text + "/favicon.ico";
                      }
                      // If a booru type is returned set the widget state
                      if(booruType != ""){
                        setState((){
                          widget.booruType = booruType;
                          selectedBooruType = booruType;
                        });
                        // Alert user about the results of the test
                        ServiceHandler.displayToast("Booru Type is $booruType \nClick the save button to save this config");
                        //Get.snackbar("Booru Type is $booruType","Click the save button to save this config",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context.theme.primaryColor);
                      } else {
                        ServiceHandler.displayToast("No Data Returned \n Booru Information may be incorrect or the booru doesn't allow api access ");
                        //Get.snackbar("No Data Returned","Booru Information may be incorrect or the booru doesn't allow api access ",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context.theme.primaryColor);
                      }
                    },
                    child: Text("Test"),
                  ),
                  saveButton(),
                ],
              ),
            ),
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
                  Text("Booru Type : "),
                  Container(
                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                      child: DropdownButton<String>(
                        value: selectedBooruType,
                        icon: Icon(Icons.arrow_downward),
                        onChanged: (String newValue) {
                          setState(() {
                            selectedBooruType = newValue;
                          });
                        },
                        items: booruTypes.map<DropdownMenuItem<String>>((String value){
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
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
                          hintText:"(Autofills if blank)",
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
                  Text("Default Tags : "),
                  new Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                      child: TextField(
                        controller: booruDefTagsController,
                        decoration: InputDecoration(
                          hintText:"Default search for booru",
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
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              width: double.infinity,
              child: Text("API Key and User ID may be needed with some boorus but in most cases isn't necessary. If using API Key the User ID also needs to be filled unless it's Derpibooru/Philomena"),
            ),
            Container(
              child: Column(
                children: selectedBooruType == 'Hydrus'
                ? [
                  Container(
                    width: double.infinity,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20),
                        side: BorderSide(color: Get.context.theme.accentColor),
                      ),
                      onPressed: () async{
                        if (selectedBooruType == "Hydrus"){
                          HydrusHandler hydrus = new HydrusHandler(new Booru("Hydrus", "Hydrus", "Hydrus", booruURLController.text, ""), 5);
                          String accessKey = await hydrus.getAccessKey();
                          if (accessKey != ""){
                            ServiceHandler.displayToast("Access Key Requested \n Click okay on hydrus then apply. You can then test");
                            //Get.snackbar("Access Key Requested","Click okay on hydrus then apply. You can then test",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context.theme.primaryColor);
                            booruAPIKeyController.text = accessKey;
                          } else {
                            ServiceHandler.displayToast("Couldn't get access key \n Do you have the request window open in hydrus?");
                            //Get.snackbar("Couldn't get access key","Do you have the request window open in hydrus?",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context.theme.primaryColor);
                          }
                        } else {
                          ServiceHandler.displayToast("Hydrus Only \n This button only works for Hydrus");
                          //Get.snackbar("Hydrus Only","This button only works for Hydrus",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context.theme.primaryColor);
                        }
                      },
                      child: Text("Get Hydrus Api Key"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    width: double.infinity,
                    child: Text("To get the Hydrus key you need to open the request dialog in the hydrus client. services > review services > client api > add > from api request"),
                  ),
                ]
                : []
              )
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("API Key : "),
                  new Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                      child: TextField(
                        controller: booruAPIKeyController,
                        decoration: InputDecoration(
                          hintText:"(Can be blank)",
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
                  Text("User ID : "),
                  new Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                      child: TextField(
                        controller: booruUserIDController,
                        decoration: InputDecoration(
                          hintText:"(Can be Blank)",
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
          side: BorderSide(color: Get.context.theme.accentColor),
        ),
        onPressed:() async{
          getPerms();
          Booru newBooru;
          bool booruExists = false;
          // Call the saveBooru on the settings handler and parse it a new Booru instance with data from the input fields
          for (int i=0; i < widget.settingsHandler.booruList.length; i++){
            if (widget.settingsHandler.booruList[i].baseURL == booruURLController.text){
              if (widget.settingsHandler.booruList.contains(newBooru)){
                booruExists = true;
                ServiceHandler.displayToast("Booru Already Exists \n It has not been added");
                //Get.snackbar("Booru Already Exists","It has not been added",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context.theme.primaryColor);
              } else {
                widget.settingsHandler.booruList.removeAt(i);
              }
            }
          }
          if(booruAPIKeyController.text == ""){
            newBooru = new Booru(booruNameController.text,widget.booruType,booruFaviconController.text,booruURLController.text,booruDefTagsController.text);
          } else {
            newBooru = new Booru.withKey(booruNameController.text,widget.booruType,booruFaviconController.text,booruURLController.text,booruDefTagsController.text,booruAPIKeyController.text,booruUserIDController.text);
          }
          if (!booruExists){
            await widget.settingsHandler.saveBooru(newBooru);
            ServiceHandler.displayToast("Booru Saved! \n It will show in the dropdowns after a search");
            //Get.snackbar("Booru Saved!","It will show in the dropdowns after a search",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context.theme.primaryColor);
          }

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
  Future<String> booruTest(Booru booru, String userBooruType, List<String> booruTypes) async{
    String booruType = "";
    BooruHandler test;
    List<BooruItem> testFetched;
    switch(userBooruType){
      case("Moebooru"):
        test = new MoebooruHandler(booru, 5);
        testFetched = await test.Search(" ", 1);
        break;
      case("Gelbooru"):
        test = new GelbooruHandler(booru, 5);
        testFetched = await test.Search(" ", 1);
        break;
      case("Danbooru"):
        test = new DanbooruHandler(booru, 5);
        testFetched = await test.Search(" ", 1);
        break;
      case("e621"):
        test = new e621Handler(booru, 5);
        testFetched = await test.Search(" ", 1);
        break;
      case("Shimmie"):
        test = new ShimmieHandler(booru, 5);
        testFetched = await test.Search(" ", 1);
        break;
      case("Philomena"):
        test = new PhilomenaHandler(booru, 5);
        testFetched = await test.Search("solo", 1);
        break;
      case("Szurubooru"):
        test = new SzurubooruHandler(booru, 5);
        testFetched = await test.Search("*", 1);
        break;
      case("Sankaku"):
        test = new SankakuHandler(booru, 5);
        testFetched = await test.Search("", 1);
      break;
      case("Hydrus"):
        test = new HydrusHandler(booru, 5);
        testFetched = await test.Search("", 1);
        break;
      case("GelbooruV1"):
        test = new GelbooruV1Handler(booru, 5);
        testFetched = await test.Search("", 1);
        break;
      case("BooruOnRails"):
        test = new BooruOnRailsHandler(booru, 5);
        testFetched = await test.Search("*", 1);
        break;
      case("Not Sure"):
        for(int i = 1; i < booruTypes.length; i++){
          if (booruType == ""){
            booruType = await booruTest(booru, booruTypes.elementAt(i), booruTypes);
          }
        }
    }
    if (booruType == "") {
      if (testFetched != null) {
        if (testFetched.length > 0) {
          booruType = userBooruType;
          print("Found Results as $userBooruType");
          return booruType;
        }
      }
    }
    // This can return anything it's needed for the future builder.
    return booruType;
  }
}


