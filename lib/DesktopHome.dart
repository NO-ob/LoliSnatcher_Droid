import 'dart:io';

import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/widgets/ActiveTitle.dart';
import 'package:LoliSnatcher/widgets/BooruSelectorMain.dart';
import 'package:LoliSnatcher/widgets/DesktopImageListener.dart';
import 'package:LoliSnatcher/widgets/ImagePreviews.dart';
import 'package:LoliSnatcher/widgets/TagView.dart';
import 'package:LoliSnatcher/widgets/TabBox.dart';
import 'package:LoliSnatcher/widgets/TabBoxButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:LoliSnatcher/widgets/TagSearchBox.dart';
import 'SearchGlobals.dart';
import 'ServiceHandler.dart';
import 'SettingsHandler.dart';
import 'Tools.dart';
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
      ServiceHandler.disableSleep();
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
  void setSearchGlobalsIndex(int index, String? newSearch){
    setState(() {
      globalsIndex = index;
    });
    Tools.forceClearMemoryCache(withLive: true);
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
  void searchAction(String text) {
    // Remove extra spaces
    text = text.trim();
    if (searchGlobals[globalsIndex].selectedBooru == null && widget.settingsHandler.booruList.isNotEmpty){
      searchGlobals[globalsIndex].selectedBooru = widget.settingsHandler.booruList.elementAt(0);
    }
    Tools.forceClearMemoryCache();
    setState((){
      if(text.toLowerCase().contains("loli")){
        ServiceHandler.displayToast("UOOOOOHHHHH \n 😭");
        //Get.snackbar("UOOOOOHHHHH", '😭', snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2), colorText: Colors.black, backgroundColor: Get.context.theme.primaryColor );
      }
      searchGlobals[globalsIndex] = new SearchGlobals(searchGlobals[globalsIndex].selectedBooru, text);
    });
    if(text != "" && widget.settingsHandler.searchHistoryEnabled) {
      widget.settingsHandler.dbHandler.updateSearchHistory(text, searchGlobals[globalsIndex].selectedBooru!.type!, searchGlobals[globalsIndex].selectedBooru!.name!);
    }
    // Setstate and update the tags variable so the widget rebuilds with the new tags
  }
  @override
  Widget build(BuildContext context) {
    if (searchGlobals[globalsIndex].newTab!.value == "noListener"){
      searchGlobals[globalsIndex].newTab!.addListener((){
        if (searchGlobals[globalsIndex].newTab!.value != null){
          setState(() {
            // Add after the current tab
            // searchGlobals.insert(globalsIndex + 1, new SearchGlobals(searchGlobals[globalsIndex].selectedBooru, searchGlobals[globalsIndex].newTab!.value));
            // Add to the end
            searchGlobals.add(new SearchGlobals(searchGlobals[globalsIndex].selectedBooru, searchGlobals[globalsIndex].newTab!.value));
          });
          if(searchGlobals[globalsIndex].newTab!.value != "" && widget.settingsHandler.searchHistoryEnabled) {
            widget.settingsHandler.dbHandler.updateSearchHistory(searchGlobals[globalsIndex].newTab!.value, searchGlobals[globalsIndex].selectedBooru?.type, searchGlobals[globalsIndex].selectedBooru?.name);
          }
          searchGlobals[globalsIndex].newTab!.value = null;
        }
      });
      searchGlobals[globalsIndex].addTag!.addListener((){
        if (searchGlobals[globalsIndex].addTag!.value != ""){
          searchTagsController.text += searchGlobals[globalsIndex].addTag!.value;
          searchGlobals[globalsIndex].addTag!.value = "";
        }
      });
      searchGlobals[globalsIndex].removeTab!.addListener((){
        if(searchGlobals[globalsIndex].removeTab!.value != "") {
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
          searchGlobals[globalsIndex].removeTab!.value = "";
        }
      });
      searchGlobals[globalsIndex].newTab!.value = null;
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
                TagSearchBox(searchGlobals[globalsIndex], searchTagsController, searchBoxFocus, widget.settingsHandler, searchAction),
                BooruSelectorMain(searchGlobals[globalsIndex],widget.settingsHandler,searchTagsController,setSearchGlobal),
                IconButton(
                  padding: const EdgeInsets.all(5),
                  icon: Icon(Icons.search),
                  onPressed: () {
                    searchTagsController.clearComposing();
                    searchBoxFocus.unfocus();
                    searchAction(searchTagsController.text);
                  },
                ),
                TabBox(searchGlobals,globalsIndex,searchTagsController,widget.settingsHandler,setSearchGlobalsIndex),
                TabBoxButtons(searchGlobals,globalsIndex,searchTagsController,widget.settingsHandler,setSearchGlobalsIndex),
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
              if (searchGlobals[globalsIndex].selected.length > 0){
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
                    child: ImagePreviews(widget.settingsHandler, searchGlobals[globalsIndex], widget.snatchHandler, searchAction),
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
              child: TagView(value, widget.searchGlobals, widget.settingsHandler),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Get.context!.theme.accentColor,width: 2),
              ),
          );
        });
  }
}



