import 'dart:ui';

import 'package:LoliSnatcher/widgets/TabBox.dart';
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
import 'package:LoliSnatcher/widgets/ScrollingText.dart';
import 'package:LoliSnatcher/widgets/WaterfallView.dart';
import 'package:LoliSnatcher/widgets/StaggeredView.dart';
import 'package:LoliSnatcher/widgets/TagSearchBox.dart';
import 'DesktopHome.dart';
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
            if(widget.settingsHandler.appMode == "Mobile"){
              return Home(widget.settingsHandler);
            } else {
              return DesktopHome(widget.settingsHandler);
            }
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
  List<SearchGlobals> searchGlobals = [];
  FocusNode searchBoxFocus = new FocusNode();
  int globalsIndex = 0;
  bool firstRun = true;
  bool isSnatching = false;
  ActiveTitle? activeTitle;
  String snatchStatus = "";
  final searchTagsController = TextEditingController();
  @override
  void initState() {
    super.initState();
    Booru? defaultBooru;
    // Set the default booru and tags at the start
    if(((widget.settingsHandler.prefBooru != "") && (widget.settingsHandler.prefBooru == widget.settingsHandler.booruList!.elementAt(0).name))) {
      defaultBooru = widget.settingsHandler.booruList!.elementAt(0);
    }
    searchGlobals = new List.from([new SearchGlobals(defaultBooru, widget.settingsHandler.defTags)]);
    activeTitle = ActiveTitle(widget.snatchHandler);
    widget.snatchHandler.settingsHandler = widget.settingsHandler;
  }

  Future<bool> _onBackPressed() async {
    final shouldPop = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to exit the App?'),
          actions: <Widget>[
            TextButton(
              child: Text('Yes', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            TextButton(
              child: Text('No', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );

    return shouldPop ?? false; //shouldPop != null ? true : false;
  }

  void searchAction(String text) {
    // Remove extra spaces
    text = text.trim();

    if (searchGlobals[globalsIndex].selectedBooru == null && widget.settingsHandler.booruList!.isNotEmpty){
      searchGlobals[globalsIndex].selectedBooru = widget.settingsHandler.booruList!.elementAt(0);
    }
    setState((){
      if(text.toLowerCase().contains("loli")){
        ServiceHandler.displayToast("UOOOOOHHHHH \n 😭");
        //Get.snackbar("UOOOOOHHHHH", '😭', snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: Colors.black, backgroundColor: Get.context.theme.primaryColor );
      }
      searchGlobals[globalsIndex] = new SearchGlobals(searchGlobals[globalsIndex].selectedBooru, text);
    });
    // Setstate and update the tags variable so the widget rebuilds with the new tags
  }

  @override
  Widget build(BuildContext context) {
    //searchTagsController.text = searchGlobals[globalsIndex].tags;
    if (searchGlobals[globalsIndex].newTab!.value == "noListener"){
      searchGlobals[globalsIndex].newTab!.addListener((){
        if (searchGlobals[globalsIndex].newTab!.value != ""){
          setState(() {
            // Add after the current tab
            // searchGlobals.insert(globalsIndex + 1, new SearchGlobals(searchGlobals[globalsIndex].selectedBooru, searchGlobals[globalsIndex].newTab!.value));

            // Add to the end
            searchGlobals.add(new SearchGlobals(searchGlobals[globalsIndex].selectedBooru, searchGlobals[globalsIndex].newTab!.value));
          });
        }
      });
      searchGlobals[globalsIndex].addTag!.addListener((){
        if (searchGlobals[globalsIndex].addTag!.value != ""){
          searchTagsController.text += searchGlobals[globalsIndex].addTag!.value;
        }
      });
      searchGlobals[globalsIndex].newTab!.value = "";
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
     return Scaffold(
       resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: activeTitle,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.save),
                onPressed: (){
                  getPerms();
                  // call a function to save the currently viewed image when the save button is pressed
                  if (searchGlobals[globalsIndex].selected!.length > 0){
                    widget.snatchHandler.queue(searchGlobals[globalsIndex].getSelected(), widget.settingsHandler.jsonWrite,searchGlobals[globalsIndex].selectedBooru!.name!,widget.settingsHandler.snatchCooldown);
                    setState(() {
                      searchGlobals[globalsIndex].selected = [];
                    });
                  } else {
                    ServiceHandler.displayToast("No items selected \n (」°ロ°)」");
                    //Get.snackbar("No items selected","(」°ロ°)」",snackPosition: SnackPosition.BOTTOM,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context!.theme.primaryColor);
                  }
                },
              )
            ],
          ),
          body:
          new WillPopScope(
            onWillPop: _onBackPressed,
            child: Center(
              child: ImagesFuture(),
            ),
          ),
          drawer: Drawer(
            child: Column(
              children:<Widget>[
                Container(
                  padding: new EdgeInsets.fromLTRB(10, MediaQuery.of(context).padding.top + 4, 5,0),
                  width: double.infinity,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      //Tags/Search field
                      //NewTagSearchBox(searchGlobals[globalsIndex], searchTagsController, searchBoxFocus,widget.settingsHandler, searchAction),
                      TagSearchBox(searchGlobals[globalsIndex], searchTagsController, searchBoxFocus, widget.settingsHandler, searchAction),
                      IconButton(
                        padding: const EdgeInsets.all(5),
                        icon: Icon(Icons.search),
                        onPressed: () {
                          searchTagsController.clearComposing();
                          searchBoxFocus.unfocus();
                          searchAction(searchTagsController.text);
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child:
                    Listener(
                        onPointerDown: (event){
                          print("pointer down");
                          if(searchBoxFocus.hasFocus){
                            searchBoxFocus.unfocus();
                          }
                        },
                    child:
                    ListView(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              const Text("Tab: ", style: TextStyle(fontWeight: FontWeight.bold)),
                              TabBox(searchGlobals,globalsIndex,searchTagsController,widget.settingsHandler),
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
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20),
                                side: BorderSide(color: Get.context!.theme.accentColor),
                              ),
                            ),
                            onPressed: (){
                              Get.to(SnatcherPage(searchTagsController.text,searchGlobals[globalsIndex].selectedBooru!,widget.settingsHandler, widget.snatchHandler));
                            },
                            child: Text("Snatcher", style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20),
                                side: BorderSide(color: Get.context!.theme.accentColor),
                              ),
                            ),
                            onPressed: (){
                              Get.to(SettingsPage(widget.settingsHandler));
                            },
                            child: Text("Settings", style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20),
                                side: BorderSide(color: Get.context!.theme.accentColor),
                              ),
                            ),
                            onPressed: (){
                              Get.to(AboutPage());
                            },
                            child: Text("About", style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),)
                ),
                Container(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      child: Column(
                        children: [
                          (MediaQuery.of(context).orientation == Orientation.landscape && MediaQuery.of(context).size.height < 600)
                              ? Container()
                              : Column(children: [
                            Text("Version: ${widget.settingsHandler.verStr}" ),
                            DrawerHeader(
                              margin: EdgeInsets.zero,
                              decoration: new BoxDecoration(
                                color: Get.context!.theme.primaryColor,
                                image: new DecorationImage(fit: BoxFit.cover, image: new AssetImage('assets/images/drawer_icon.png'),),
                              ),
                              child: Container(),
                            ),
                          ],)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
       // )
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
            if (widget.settingsHandler.booruList!.isEmpty){
              return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text("No Booru Configs Found"),
                        Container(
                          alignment: Alignment.center,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20),
                                side: BorderSide(color: Get.context!.theme.accentColor),
                              ),
                            ),
                            onPressed: (){
                              Get.to(booruEdit(new Booru("New","","","",""),widget.settingsHandler));
                            },
                            child: Text("Open Settings", style: TextStyle(color: Colors.white)),
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
                      searchTagsController.text = widget.settingsHandler.defTags!;
                      if (searchGlobals[globalsIndex].selectedBooru == null){
                        searchGlobals[globalsIndex].selectedBooru = widget.settingsHandler.booruList![0];
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
  Future BooruSelector() async {
    if (widget.settingsHandler.prefBooru == ""){
      await widget.settingsHandler.loadSettings();
    }
    if(widget.settingsHandler.booruList!.isEmpty){
      print("getbooru because null");
      await widget.settingsHandler.getBooru();
    }
    if ((widget.settingsHandler.prefBooru != "") && (widget.settingsHandler.prefBooru != widget.settingsHandler.booruList!.elementAt(0).name)){
      await widget.settingsHandler.getBooru();
    }
    print(searchGlobals[globalsIndex].toString());
    // This null check is used otherwise the selected booru resets when the state changes, the state changes when a booru is selected
    if (searchGlobals[globalsIndex].selectedBooru == null){
      print("selectedBooru is null setting to: " + widget.settingsHandler.booruList![0].toString());
      searchGlobals[globalsIndex].selectedBooru = widget.settingsHandler.booruList![0];
      searchGlobals[globalsIndex].handlerType = widget.settingsHandler.booruList![0].type;
    }
    if (!widget.settingsHandler.booruList!.contains(searchGlobals[globalsIndex].selectedBooru)){
      searchGlobals[globalsIndex].selectedBooru = widget.settingsHandler.booruList![0];
      searchGlobals[globalsIndex].handlerType = widget.settingsHandler.booruList![0].type;
    }
    return Container(
      constraints: BoxConstraints(maxHeight: 30,minHeight: 20),
      padding: EdgeInsets.fromLTRB(5, 0, 2, 0),
      decoration: BoxDecoration(
        color: Get.context!.theme.canvasColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Get.context!.theme.accentColor,
          width: 1,
        ),
      ),
      child: DropdownButton<Booru>(
        value: searchGlobals[globalsIndex].selectedBooru,
        icon: Icon(Icons.arrow_downward),
        underline: Container(height: 0,),
        onChanged: (Booru? newValue){
          setState((){
            if((searchTagsController.text == "" || searchTagsController.text == widget.settingsHandler.defTags) && newValue!.defTags != ""){
              searchTagsController.text = newValue.defTags!;
            }
            // searchGlobals[globalsIndex].selectedBooru = newValue; // Just set new booru
            searchGlobals[globalsIndex] = new SearchGlobals(newValue, searchTagsController.text);
            print("booru set to ${searchGlobals[globalsIndex].selectedBooru!.name}");
            // Set new booru and search with current tags
          });
        },
        items: widget.settingsHandler.booruList!.map<DropdownMenuItem<Booru>>((Booru value){
          // Return a dropdown item
          return DropdownMenuItem<Booru>(
            value: value,
            child:
            Row(
              children: <Widget>[
                //Booru Icon
                value.type == "Favourites" ?
                Icon(Icons.favorite,color: Colors.red, size: 18) :
                Image.network(
                  value.faviconURL!,
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
