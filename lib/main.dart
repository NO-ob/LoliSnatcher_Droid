import 'dart:async';
import 'dart:ui';

import 'package:LoliSnatcher/pages/LoliSyncPage.dart';
import 'package:LoliSnatcher/widgets/BooruSelectorMain.dart';
import 'package:LoliSnatcher/widgets/ImagePreviews.dart';
import 'package:LoliSnatcher/widgets/TabBox.dart';
import 'package:LoliSnatcher/widgets/TabBoxButtons.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/getPerms.dart';
import 'package:LoliSnatcher/pages/SnatcherPage.dart';
import 'package:LoliSnatcher/SnatchHandler.dart';
import 'package:LoliSnatcher/pages/SettingsPage.dart';
import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/DesktopHome.dart';

import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/widgets/ActiveTitle.dart';
import 'package:LoliSnatcher/widgets/TagSearchBox.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'Tools.dart';


final ColorScheme alternateColorScheme = ColorScheme(
  primary: Colors.pink[200]!,
  onPrimary: Colors.white,
  primaryVariant: Colors.pink[200]!,

  secondary: Colors.pink[600]!,
  onSecondary: Colors.white,
  secondaryVariant: Colors.pink[600]!,

  surface: Colors.grey[900]!,
  onSurface: Colors.white,
  background: Colors.black,
  onBackground: Colors.white,
  error: Colors.redAccent,
  onError: Colors.white,

  brightness: Brightness.dark
);

final TextTheme mainTextTheme = TextTheme(
  headline5: GoogleFonts.quicksand(fontSize: 72.0, fontWeight: FontWeight.bold),
  headline6: GoogleFonts.quicksand(fontSize: 36.0),
  bodyText2: GoogleFonts.quicksand(fontSize: 14.0),
  bodyText1: GoogleFonts.quicksand(fontSize: 14.0),
);


void main() {
  runApp(GetMaterialApp(
    title: 'LoliSnatcher',
    debugShowCheckedModeBanner: false, // hide debug banner in the corner
    theme: //ThemeData(brightness: Brightness.light,primaryColor: SettingsHandler.themes[3].primary, accentColor: SettingsHandler.themes[3].accent,textTheme: SettingsHandler.themes[3].text),
    ThemeData(
      // Define the default brightness and colors.
      scaffoldBackgroundColor: Colors.black,
      backgroundColor: Colors.black,
      canvasColor: Colors.black,

      brightness: Brightness.dark,
      primarySwatch: Colors.pink,
      primaryColor: Colors.pink[200],
      accentColor: Colors.pink[600],

      colorScheme: alternateColorScheme,

      textTheme: mainTextTheme,
    ),
    navigatorKey: Get.key,
    home: Preloader(),
  ));
}

// Added a preloader to load booruconfigs and settings other wise the booruselector misbehaves
class Preloader extends StatelessWidget {
  SettingsHandler settingsHandler = new SettingsHandler();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: settingsHandler.initialize(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            FlutterDisplayMode.setHighRefreshRate();
            if(settingsHandler.appMode == "Mobile"){
              return Home(settingsHandler);
            } else {
              return DesktopHome(settingsHandler);
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

  Timer? cacheClearTimer;

  @override
  void initState() {
    super.initState();
    Booru? defaultBooru;
    // Set the default booru and tags at the start
    widget.settingsHandler.getBooru();
    // Set the default booru and tags at the start
    if (widget.settingsHandler.booruList.isNotEmpty){
      defaultBooru = widget.settingsHandler.booruList.elementAt(0);
    }
    searchGlobals = List.from([SearchGlobals(defaultBooru, widget.settingsHandler.defTags)]);
    searchTagsController.text = widget.settingsHandler.defTags;
    restoreTabs();

    activeTitle = ActiveTitle(widget.snatchHandler);
    widget.snatchHandler.settingsHandler = widget.settingsHandler;

    // force cache clear every minute + perform tabs backup
    cacheClearTimer = Timer.periodic(Duration(seconds: 30), (timer) {
      Tools.forceClearMemoryCache();
      backupTabs();
    });
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

  // special strings used to separate parts of tab backup string
  // tab - separates info parts about tab itself, list - separates tabs list entries
  final String tabDivider = '|||', listDivider = '~~~';

  // Restores tabs from a string saved in DB
  void restoreTabs() async {
    List<String> result = await widget.settingsHandler.dbHandler.getTabRestore();
    List<SearchGlobals> restoredGlobals = [];

    bool foundBrokenItem = false;
    int newIndex = 0;
    if(result.length == 2) {
      // split list into tabs
      List<String> splitInput = result[1].split(listDivider);
      splitInput.asMap().forEach((int index, String str){
        // split tab into booru name and tags
        List<String> booruAndTags = str.split(tabDivider);
        // check for parsing errors
        bool isEntryValid = booruAndTags.length > 1 && booruAndTags[0].isNotEmpty;
        if(isEntryValid) {
          // find booru by name and create searchglobal with given tags
          Booru findBooru = widget.settingsHandler.booruList.firstWhere((booru) => booru.name == booruAndTags[0], orElse: () => Booru(null, null, null, null, null));
          if(findBooru.name != null) {
            restoredGlobals.add(SearchGlobals(findBooru, booruAndTags[1]));
          } else {
            foundBrokenItem = true;
            restoredGlobals.add(SearchGlobals(widget.settingsHandler.booruList[0], booruAndTags[1]));
          }

          // check if tab was marked as selected and set current selected index accordingly 
          if(booruAndTags.length == 3 && booruAndTags[2] == 'selected') { // if split has third item (selected) - set as current tab
            newIndex = index;
          }
        } else {
          foundBrokenItem = true;
        }
      });

      // notify user if there was unknown booru or invalid entry in the list
      if(foundBrokenItem) {
        ServiceHandler.displayToast('Some restored tabs had unknown boorus or broken characters\nThey were set to default or ignored');
      }
    }

    // set parsed tabs
    if(restoredGlobals.length > 0) {
      ServiceHandler.displayToast('Restored ${restoredGlobals.length} tabs from previous session!');
      searchGlobals = restoredGlobals;
      globalsIndex = newIndex;
      searchTagsController.text = restoredGlobals[newIndex].tags;
      setState(() { });
    }
  }

  // Saves current tabs list to DB
  void backupTabs() {
    // if there are only one tab - check that its not with default booru and tags
    // if there are more than 1 tab or check return false - start backup
    bool onlyDefaultTab = searchGlobals.length == 1 && searchGlobals[0].booruHandler?.booru.name == widget.settingsHandler.prefBooru && searchGlobals[0].tags == widget.settingsHandler.defTags;
    if(!onlyDefaultTab) {
      final List<String> dump = searchGlobals.map((tab) {
        String booruName = tab.selectedBooru?.name ?? 'unknown';
        String tabTags = tab.tags;
        String selected = tab == searchGlobals[globalsIndex] ? '${tabDivider}selected' : '';
        return '$booruName$tabDivider$tabTags$selected'; // booruName|searchTags|selected (last only if its the current tab)
      }).toList();
      // TODO small indicator somewhere when tabs are saved?
      final String restoreString = dump.join(listDivider);
      widget.settingsHandler.dbHandler.addTabRestore(restoreString);
      // ServiceHandler.displayToast('Dumped tabs');
    } else {
      widget.settingsHandler.dbHandler.clearTabRestore();
    }
  }

  void setSearchGlobalsIndex(int index, String? newSearch){
      setState(() {
        globalsIndex = index;
      });
      if(newSearch != null) {
        searchAction(searchGlobals[globalsIndex].tags);
      } else {
        Tools.forceClearMemoryCache(withLive: true);
      }
  }
  void setSearchGlobal(SearchGlobals searchGlobal){
      searchGlobals[globalsIndex] = searchGlobal;
      searchAction(searchGlobals[globalsIndex].tags);
  }
  void rewriteGlobals(List<SearchGlobals> newGlobals) {
    setState(() {
      searchGlobals = newGlobals;
    });
  }
  void mergeAction(){
    if (widget.settingsHandler.mergeEnabled && searchGlobals[globalsIndex].secondaryBooru == null && widget.settingsHandler.booruList.length > 1){
      SearchGlobals newSearchGlobals = new SearchGlobals(searchGlobals[globalsIndex].selectedBooru, searchTagsController.text);
      newSearchGlobals.secondaryBooru = widget.settingsHandler.booruList.elementAt(1);
      setState(() {
        searchGlobals[globalsIndex] = newSearchGlobals;
      });

    }
    if (!widget.settingsHandler.mergeEnabled){
      SearchGlobals newSearchGlobals = new SearchGlobals(searchGlobals[globalsIndex].selectedBooru, searchTagsController.text);
      newSearchGlobals.secondaryBooru = null;
      setState(() {
        searchGlobals[globalsIndex] = newSearchGlobals;
      });
    }

  }
  void searchAction(String text) {
    // Remove extra spaces
    text = text.trim();
    if (searchGlobals[globalsIndex].selectedBooru == null && widget.settingsHandler.booruList.isNotEmpty){
      searchGlobals[globalsIndex].selectedBooru = widget.settingsHandler.booruList.elementAt(0);
    }

    Tools.forceClearMemoryCache(withLive: true);
    setState((){
      if(text.toLowerCase().contains("loli")){
        ServiceHandler.displayToast("UOOOOOHHHHH \n 😭");
        //Get.snackbar("UOOOOOHHHHH", '😭', snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: Colors.black, backgroundColor: Get.context.theme.primaryColor );
      }
    });
    if(text != "" && widget.settingsHandler.searchHistoryEnabled) {
      widget.settingsHandler.dbHandler.updateSearchHistory(text, searchGlobals[globalsIndex].selectedBooru!.type!, searchGlobals[globalsIndex].selectedBooru!.name!);
    }
    // Setstate and update the tags variable so the widget rebuilds with the new tags
  }

  Widget buildDrawer() {
    return Drawer(
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
                GestureDetector(
                  onLongPress: (){
                    searchTagsController.clearComposing();
                    searchBoxFocus.unfocus();

                    searchGlobals[globalsIndex].newTab.value = searchTagsController.text;
                    setSearchGlobalsIndex(searchGlobals.length - 1, searchTagsController.text); // create new tab and set it
                  },
                  child: IconButton(
                    padding: const EdgeInsets.all(5),
                    icon: Icon(Icons.search),
                    onPressed: () {
                      searchTagsController.clearComposing();
                      searchBoxFocus.unfocus();
                      searchAction(searchTagsController.text);
                    },
                  )
                ),
              ],
            ),
          ),
          Expanded(
            child: Listener(
              onPointerDown: (event) {
                print("pointer down");
                if(searchBoxFocus.hasFocus){
                  searchBoxFocus.unfocus();
                }
              },
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        const Text("Tab: ", style: TextStyle(fontWeight: FontWeight.bold)),
                        TabBox(searchGlobals, globalsIndex, searchTagsController, widget.settingsHandler,setSearchGlobalsIndex),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        TabBoxButtons(searchGlobals, globalsIndex, searchTagsController, widget.settingsHandler, setSearchGlobalsIndex),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        const Text("Booru: ", style: TextStyle(fontWeight: FontWeight.bold)),
                        BooruSelectorMain(searchGlobals[globalsIndex], widget.settingsHandler, searchTagsController, setSearchGlobal,true),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Merge "),
                      Checkbox(
                        value: widget.settingsHandler.mergeEnabled,
                        onChanged: (newValue) {
                          setState(() {
                            widget.settingsHandler.mergeEnabled = newValue!;
                            mergeAction();
                          });
                        },
                        activeColor: Get.context!.theme.primaryColor,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  widget.settingsHandler.mergeEnabled ? Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        const Text("Booru: ", style: TextStyle(fontWeight: FontWeight.bold)),
                        BooruSelectorMain(searchGlobals[globalsIndex], widget.settingsHandler, searchTagsController, setSearchGlobal,false),
                      ],
                    ),
                  ) : Container(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: TextButton.icon(
                            style: TextButton.styleFrom(
                              primary: Get.context!.theme.accentColor,
                              padding: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5),
                                side: BorderSide(color: Get.context!.theme.accentColor),
                              ),
                            ),
                            onPressed: (){
                              Get.to(() => SnatcherPage(searchTagsController.text,searchGlobals[globalsIndex].selectedBooru!,widget.settingsHandler, widget.snatchHandler));
                            },
                            icon: Icon(Icons.download_sharp),
                            label: Text("Snatcher", style: TextStyle(color: Colors.white))
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        alignment: Alignment.center,
                        child: TextButton.icon(
                            style: TextButton.styleFrom(
                              primary: Get.context!.theme.accentColor,
                              padding: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5),
                                side: BorderSide(color: Get.context!.theme.accentColor),
                              ),
                            ),
                            onPressed: (){
                              if (widget.settingsHandler.dbEnabled){
                                Get.to(() => LoliSyncPage(widget.settingsHandler));
                              } else {
                                ServiceHandler.displayToast("Database must be enabled to use Loli Sync");
                              }
                            },
                            icon: Icon(Icons.sync),
                            label: Text("Loli Sync", style: TextStyle(color: Colors.white))
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        primary: Get.context!.theme.accentColor,
                        padding: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5),
                          side: BorderSide(color: Get.context!.theme.accentColor),
                        ),
                      ),
                      onPressed: () async{
                        await widget.settingsHandler.loadSettings();
                        await widget.settingsHandler.getBooru();
                        Get.to(() => SettingsPage(widget.settingsHandler));
                      },
                      icon: Icon(Icons.settings),
                      label: Text("Settings", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            )
          ),
          Container(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                child: Column(
                  children: [
                    (MediaQuery.of(context).orientation == Orientation.landscape && MediaQuery.of(context).size.height < 550)
                        ? const SizedBox()
                        : SizedBox(
                            height: (MediaQuery.of(context).size.height * 0.25),
                            child: DrawerHeader(
                              margin: EdgeInsets.zero,
                              decoration: new BoxDecoration(
                                color: Get.context!.theme.primaryColor,
                                image: new DecorationImage(fit: BoxFit.cover, image: new AssetImage('assets/images/drawer_icon.png'),),
                              ),
                              child: null,
                            ),
                          ),
                  ]
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    //searchTagsController.text = searchGlobals[globalsIndex].tags;
    if (searchGlobals[globalsIndex].newTab.value == "noListener"){
      searchGlobals[globalsIndex].newTab.addListener((){
        if (searchGlobals[globalsIndex].newTab.value != null){
          // Add after the current tab
          // searchGlobals.insert(globalsIndex + 1, new SearchGlobals(searchGlobals[globalsIndex].selectedBooru, searchGlobals[globalsIndex].newTab.value));

          // Add to the end
          searchGlobals.add(new SearchGlobals(searchGlobals[globalsIndex].selectedBooru, searchGlobals[globalsIndex].newTab.value!));

          if(searchGlobals[globalsIndex].newTab.value != "" && widget.settingsHandler.searchHistoryEnabled) {
            widget.settingsHandler.dbHandler.updateSearchHistory(searchGlobals[globalsIndex].newTab.value!, searchGlobals[globalsIndex].selectedBooru?.type, searchGlobals[globalsIndex].selectedBooru?.name);
          }
          searchGlobals[globalsIndex].newTab.value = null;
        }
      });
      searchGlobals[globalsIndex].addTag.addListener((){
        if (searchGlobals[globalsIndex].addTag.value != ""){
          searchTagsController.text += searchGlobals[globalsIndex].addTag.value!;
          searchGlobals[globalsIndex].addTag.value = "";
        }
      });
      searchGlobals[globalsIndex].removeTab.addListener((){
        if(searchGlobals[globalsIndex].removeTab.value != "") {
          setState(() {
            if(searchGlobals.length > 1) {
              if(globalsIndex == searchGlobals.length - 1){
                globalsIndex --;
                searchTagsController.text = searchGlobals[globalsIndex].tags;
                searchGlobals.removeAt(globalsIndex + 1);
              } else {
                searchTagsController.text = searchGlobals[globalsIndex + 1].tags;
                searchGlobals.removeAt(globalsIndex);
              }
            } else {
              ServiceHandler.displayToast('Removed last tab! \nResetting to default tags');
              searchTagsController.text = widget.settingsHandler.defTags;
              searchGlobals[0] = new SearchGlobals(searchGlobals[globalsIndex].selectedBooru, widget.settingsHandler.defTags);
            }
          });
          searchGlobals[globalsIndex].removeTab.value = "";
        }
      });
      searchGlobals[globalsIndex].newTab.value = null;
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
              if (searchGlobals[globalsIndex].selected.length > 0){
                widget.snatchHandler.queue(searchGlobals[globalsIndex].getSelected(), widget.settingsHandler.jsonWrite,searchGlobals[globalsIndex].selectedBooru,widget.settingsHandler.snatchCooldown);
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
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Center(
          child: ImagePreviews(widget.settingsHandler, searchGlobals[globalsIndex], widget.snatchHandler, searchAction),
        ),
      ),
      drawer: buildDrawer(),
    );
  }

  /** If first run is true the default tags are loaded using the settings controller then parsed to the images widget
   * This is done with a future builder as we must wait for the permissions popup and also for the settings to load
   * **/

  /*
  /** This Future function will call getBooru on the settingsHandler to load the booru configs
   * After these are loaded it returns a drop down list which is used to select which booru to search
   * **/
  Future BooruSelector() async {
    if (widget.settingsHandler.prefBooru == ""){
      await widget.settingsHandler.loadSettings();
    }
    if(widget.settingsHandler.booruList.isEmpty){
      print("getbooru because null");
      await widget.settingsHandler.getBooru();
    }
    if ((widget.settingsHandler.prefBooru != "") && (widget.settingsHandler.prefBooru != widget.settingsHandler.booruList.elementAt(0).name)){
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
      constraints: BoxConstraints(maxHeight: 30,minHeight: 20),
      padding: EdgeInsets.fromLTRB(5, 0, 2, 0),
      decoration: BoxDecoration(
        color: Get.context!.theme.canvasColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Get.context!.theme.backgroundColor,
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
        items: widget.settingsHandler.booruList.map<DropdownMenuItem<Booru>>((Booru value){
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
  }*/
}

