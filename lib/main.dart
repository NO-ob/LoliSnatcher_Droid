import 'dart:ui';
import 'package:LoliSnatcher/widgets/StaggeredView.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/AboutPage.dart';
import 'package:LoliSnatcher/getPerms.dart';
import 'package:LoliSnatcher/Snatcher.dart';
import 'package:LoliSnatcher/SnatchHandler.dart';
import 'package:LoliSnatcher/SettingsPage.dart';
import 'package:LoliSnatcher/SearchGlobals.dart';

import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/widgets/ActiveTitle.dart';
import 'package:LoliSnatcher/widgets/BooruSelectorBroken.dart';
import 'package:LoliSnatcher/widgets/ScrollingText.dart';
import 'package:LoliSnatcher/widgets/WaterfallView.dart';
import 'package:LoliSnatcher/widgets/TagSearchBox.dart';
import 'ServiceHandler.dart';
import 'libBooru/BooruHandler.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'LoliSnatcher',
    debugShowCheckedModeBanner: false, // hide debug banner in the corner
    theme: //ThemeData(brightness: Brightness.light,primaryColor: SettingsHandler.themes[3].primary, accentColor: SettingsHandler.themes[3].accent,textTheme: SettingsHandler.themes[3].text),
    ThemeData(
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
  ActiveTitle activeTitle;
  String snatchStatus = "";
  final searchTagsController = TextEditingController();
  @override
  void initState() {
    super.initState();
    activeTitle = ActiveTitle(widget.snatchHandler);
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
            searchTagsController.text += searchGlobals[globalsIndex].addTag.value;
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
            title: activeTitle,
            actions:<Widget>[ IconButton(
                icon: Icon(Icons.save),
                onPressed: (){
                  getPerms();
                  // call a function to save the currently viewed image when the save button is pressed
                  if (searchGlobals[globalsIndex].selected.length > 0){
                    widget.snatchHandler.queue(searchGlobals[globalsIndex].getSelected(), widget.settingsHandler.jsonWrite,searchGlobals[globalsIndex].selectedBooru.name,widget.settingsHandler.snatchCooldown);
                    setState(() {
                      searchGlobals[globalsIndex].selected = new List();
                    });
                  } else {
                    Get.snackbar("No items selected","(」°ロ°)」",snackPosition: SnackPosition.BOTTOM,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context.theme.primaryColor);
                  }
                },
              )
            ],
          ),
          body: Center(
            child: ImagesFuture(),
          ),
          drawer: Drawer(
            child: Column(
              children:<Widget>[
                Expanded(
                    child: ListView(
                      children: [
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
                                  ServiceHandler.displayToast("Toast test");
                                  setState((){
                                    if(searchTagsController.text.contains("loli")){
                                      Get.snackbar("UOOOOOHHHHH", '😭', snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: Colors.black, backgroundColor: Get.context.theme.primaryColor );
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
                              const SizedBox(width: 5),
                              const Text("Tab: ", style: TextStyle(fontWeight: FontWeight.bold)),
                              Expanded(
                                child:
                                DropdownButton<SearchGlobals>(
                                  isExpanded: true,
                                  value: searchGlobals[globalsIndex],
                                  icon: Icon(Icons.arrow_downward),
                                  onChanged: (SearchGlobals newValue){
                                    setState(() {
                                      globalsIndex = searchGlobals.indexOf(newValue);
                                      searchTagsController.text = newValue.tags;
                                    });
                                  },
                                  onTap: (){
                                    setState(() { });
                                  },
                                  items: searchGlobals.map<DropdownMenuItem<SearchGlobals>>((SearchGlobals value){
                                    bool isNotEmptyBooru = value.selectedBooru != null && value.selectedBooru.faviconURL != null;
                                    print(value.tags);
                                    String tagText = " ${value.tags}";
                                    return DropdownMenuItem<SearchGlobals>(
                                      value: value,
                                      child: Row(
                                          children: [
                                            isNotEmptyBooru ? Image.network(
                                              value.selectedBooru.faviconURL,
                                              width: 16,
                                              errorBuilder: (_, __, ___) {
                                                return Icon(Icons.broken_image, size: 18);
                                              },
                                            ) : Icon(CupertinoIcons.question, size: 18),
                                            Expanded(child: ScrollingText(tagText, 15, "infiniteWithPause")),
                                          ]
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),


                              IconButton(
                                icon: Icon(Icons.add_circle_outline, color: Get.context.theme.accentColor),
                                onPressed: () {
                                  // add a new search global to the list
                                  setState((){
                                    searchGlobals.add(new SearchGlobals(searchGlobals[globalsIndex].selectedBooru, widget.settingsHandler.defTags)); // Set selected booru
                                    // searchGlobals.add(new SearchGlobals(null, widget.settingsHandler.defTags)); // Set empty booru
                                  });
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.remove_circle_outline, color: Get.context.theme.accentColor),
                                onPressed: () {
                                  // Remove selected searchglobal from list and apply nearest to search bar
                                  setState((){
                                    if(globalsIndex == searchGlobals.length - 1 && searchGlobals.length > 1){
                                      globalsIndex --;
                                      searchTagsController.text = searchGlobals[globalsIndex].tags;
                                      searchGlobals.removeAt(globalsIndex + 1);
                                    } else if (searchGlobals.length > 1){
                                      searchTagsController.text = searchGlobals[globalsIndex + 1].tags;
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
                              side: BorderSide(color: Get.context.theme.accentColor),
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
                              side: BorderSide(color: Get.context.theme.accentColor),
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
                              side: BorderSide(color: Get.context.theme.accentColor),
                            ),
                            onPressed: (){
                              Get.to(AboutPage());
                            },
                            child: Text("About"),
                          ),
                        ),
                      ],
                    )
                ),
                Container(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      child: Column(
                        children: [
                          DrawerHeader(
                          decoration: new BoxDecoration(
                            color: Get.context.theme.primaryColor,
                            image: new DecorationImage(fit: BoxFit.cover, image: new AssetImage('assets/images/drawer_icon.png'),),
                            ),
                          ),
                          Text("Version: ${widget.settingsHandler.verStr}" )
                        ],
                      ),
                    ),
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
                              side: BorderSide(color: Get.context.theme.accentColor),
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
                      if (widget.settingsHandler.previewDisplay == "Waterfall"){
                        return WaterfallView(widget.settingsHandler,searchGlobals[globalsIndex],widget.snatchHandler);
                      } else {
                        return StaggeredView(widget.settingsHandler,searchGlobals[globalsIndex],widget.snatchHandler);
                      }

                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }
              );
          } else {
            if (widget.settingsHandler.previewDisplay == "Waterfall"){
              return WaterfallView(widget.settingsHandler,searchGlobals[globalsIndex],widget.snatchHandler);
            } else {
              return StaggeredView(widget.settingsHandler,searchGlobals[globalsIndex],widget.snatchHandler);
            }
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
            // searchGlobals[globalsIndex].selectedBooru = newValue; // Just set new booru
            searchGlobals[globalsIndex] = new SearchGlobals(newValue, searchTagsController.text); // Set new booru and search with current tags
          });
        },
        items: widget.settingsHandler.booruList.map<DropdownMenuItem<Booru>>((Booru value){
          // Return a dropdown item
          return DropdownMenuItem<Booru>(
            value: value,
            child: Row(
              children: <Widget>[
                //Booru Icon
                Image.network(
                  value.faviconURL,
                  width: 16,
                  errorBuilder: (_, __, ___) {
                    return Icon(Icons.broken_image, size: 18);
                  },
                ),
                //Booru name
                Text(" ${value.name}"),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
