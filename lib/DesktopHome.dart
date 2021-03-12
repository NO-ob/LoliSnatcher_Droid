import 'dart:io';

import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/libBooru/BooruHandlerFactory.dart';
import 'package:LoliSnatcher/widgets/ActiveTitle.dart';
import 'package:LoliSnatcher/widgets/BooruSelectorMain.dart';
import 'package:LoliSnatcher/widgets/DesktopImageListener.dart';
import 'package:LoliSnatcher/widgets/MediaViewer.dart';
import 'package:LoliSnatcher/widgets/StaggeredView.dart';
import 'package:LoliSnatcher/widgets/TagView.dart';
import 'package:LoliSnatcher/widgets/TabBox.dart';
import 'package:LoliSnatcher/widgets/VideoApp.dart';
import 'package:LoliSnatcher/widgets/WaterfallView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:LoliSnatcher/widgets/TagSearchBox.dart';
import 'pages/AboutPage.dart';
import 'SearchGlobals.dart';
import 'ServiceHandler.dart';
import 'SettingsHandler.dart';
import 'pages/SettingsPage.dart';
import 'SnatchHandler.dart';
import 'pages/SnatcherPage.dart';
import 'getPerms.dart';
import 'libBooru/BooruItem.dart';

class DesktopHome extends StatefulWidget {
  SettingsHandler settingsHandler;
  SnatchHandler snatchHandler = new SnatchHandler();
  @override
  _DesktopHomeState createState() => _DesktopHomeState();
  DesktopHome(this.settingsHandler);
}

class _DesktopHomeState extends State<DesktopHome> {
  FocusNode searchBoxFocus = new FocusNode();
  int globalsIndex = 0;
  bool firstRun = true;
  bool isSnatching = false;
  ActiveTitle? activeTitle;
  String snatchStatus = "";
  final searchTagsController = TextEditingController();
  List<SearchGlobals> searchGlobals = [];
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid){
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    }
    Booru? defaultBooru;
    // Set the default booru and tags at the start
    if(((widget.settingsHandler.prefBooru != "") && (widget.settingsHandler.prefBooru == widget.settingsHandler.booruList.elementAt(0).name))) {
      defaultBooru = widget.settingsHandler.booruList.elementAt(0);
    }
    searchGlobals = new List.from([new SearchGlobals(defaultBooru, widget.settingsHandler.defTags)]);
    activeTitle = ActiveTitle(widget.snatchHandler);
    widget.snatchHandler.settingsHandler = widget.settingsHandler;
  }
  void setSearchGlobalsIndex(int index){
    globalsIndex = index;
    searchAction(searchGlobals[globalsIndex].tags!);
  }
  void setSearchGlobal(SearchGlobals searchGlobal){
    searchGlobals[globalsIndex] = searchGlobal;
    searchAction(searchGlobals[globalsIndex].tags!);
  }
  void searchAction(String text) {
    // Remove extra spaces
    text = text.trim();
    if (searchGlobals[globalsIndex].selectedBooru == null && widget.settingsHandler.booruList.isNotEmpty){
      searchGlobals[globalsIndex].selectedBooru = widget.settingsHandler.booruList.elementAt(0);
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 35,
        actions: <Widget>[
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: 30,
                  margin: EdgeInsets.fromLTRB(10, 0,0,0),
                  constraints: BoxConstraints(minWidth: 10, maxWidth: MediaQuery.of(context).size.width * 0.2),
                  child: TagSearchBox(searchGlobals[globalsIndex], searchTagsController, searchBoxFocus, widget.settingsHandler, searchAction),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0,0,0),
                  constraints: BoxConstraints(minWidth: 10, maxWidth: MediaQuery.of(context).size.width * 0.2),
                  child: BooruSelectorMain(searchGlobals[globalsIndex],widget.settingsHandler,searchTagsController,setSearchGlobal),
                ),
                IconButton(
                  padding: const EdgeInsets.all(5),
                  icon: Icon(Icons.search),
                  onPressed: () {
                    searchTagsController.clearComposing();
                    searchBoxFocus.unfocus();
                    searchAction(searchTagsController.text);
                  },
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 0,0,0),
                    constraints: BoxConstraints(minWidth: 10, maxWidth: MediaQuery.of(context).size.width * 0.2),
                    child: TabBox(searchGlobals,globalsIndex,searchTagsController,widget.settingsHandler,setSearchGlobalsIndex),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0,0,0),
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20),
                        side: BorderSide(color: Get.context!.theme.accentColor),
                      ),
                        backgroundColor: Get.context!.theme.canvasColor,
                    ),
                    onPressed: (){
                      Get.to(SnatcherPage(searchTagsController.text,searchGlobals[globalsIndex].selectedBooru!,widget.settingsHandler, widget.snatchHandler));
                    },
                    child: Text(" Snatcher ", style: TextStyle(color: Colors.white)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0,0,0),
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20),
                        side: BorderSide(color: Get.context!.theme.accentColor),
                      ),
                      backgroundColor: Get.context!.theme.canvasColor,
                    ),
                    onPressed: (){
                      Get.to(SettingsPage(widget.settingsHandler));
                    },
                    child: Text("Settings", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),

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
          ),
        ],
      ),
      body: Center(
          child: Row(children: [
            Expanded(
              child:Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: ImagesFuture(),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(color: Get.context!.theme.backgroundColor,width: 2),
                    ),
                  ),
                  Expanded(child:
                    DesktopTagListener(searchGlobals[globalsIndex].currentItem, widget.settingsHandler, searchGlobals[globalsIndex])
                  ),
                ],
              ),
            ),
            Expanded(flex: 2,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: DesktopImageListener(searchGlobals,globalsIndex,widget.settingsHandler,widget.snatchHandler)),
                ],
              ),
            ),
          ],)
      ),
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
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20),
                                side: BorderSide(color: Get.context!.theme.accentColor),
                              ),
                            ),
                            onPressed: (){
                              //Get.to(booruEdit(new Booru("New","","","",""),widget.settingsHandler));
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
}


class DesktopTagListener extends StatefulWidget {
  ValueNotifier<BooruItem> valueNotifier;
  SettingsHandler settingsHandler;
  SearchGlobals searchGlobals;
  DesktopTagListener(this.valueNotifier, this.settingsHandler, this.searchGlobals);
  @override
  _DesktopTagListenerState createState() => _DesktopTagListenerState();
}

class _DesktopTagListenerState extends State<DesktopTagListener> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: widget.valueNotifier,
        builder: (BuildContext context, BooruItem value, Widget? child){
          return Container(
              child: TagView(value, widget.searchGlobals),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Get.context!.theme.accentColor,width: 2),
              ),
          );
        });
  }
}



