import 'dart:io';

import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/libBooru/BooruHandlerFactory.dart';
import 'package:LoliSnatcher/widgets/ActiveTitle.dart';
import 'package:LoliSnatcher/widgets/MediaViewer.dart';
import 'package:LoliSnatcher/widgets/StaggeredView.dart';
import 'package:LoliSnatcher/widgets/TagView.dart';
import 'package:LoliSnatcher/widgets/TabBox.dart';
import 'package:LoliSnatcher/widgets/VideoApp.dart';
import 'package:LoliSnatcher/widgets/WaterfallView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:LoliSnatcher/widgets/TagSearchBox.dart';
import 'AboutPage.dart';
import 'SearchGlobals.dart';
import 'ServiceHandler.dart';
import 'SettingsHandler.dart';
import 'SettingsPage.dart';
import 'SnatchHandler.dart';
import 'Snatcher.dart';
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
    Booru? defaultBooru;
    // Set the default booru and tags at the start
    if(((widget.settingsHandler.prefBooru != "") && (widget.settingsHandler.prefBooru == widget.settingsHandler.booruList!.elementAt(0).name))) {
      defaultBooru = widget.settingsHandler.booruList!.elementAt(0);
    }
    searchGlobals = new List.from([new SearchGlobals(defaultBooru, widget.settingsHandler.defTags)]);
    activeTitle = ActiveTitle(widget.snatchHandler);
    widget.snatchHandler.settingsHandler = widget.settingsHandler;
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
      appBar: AppBar(
        toolbarHeight: 35,
        title: Text("LoliSnatcher"),
        actions: <Widget>[
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: 30,
                  constraints: BoxConstraints(minWidth: 10, maxWidth: MediaQuery.of(context).size.width * 0.2),
                  child: TagSearchBox(searchGlobals[globalsIndex], searchTagsController, searchBoxFocus, widget.settingsHandler, searchAction),
                ),
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
                  padding: const EdgeInsets.all(5),
                  icon: Icon(Icons.search),
                  onPressed: () {
                    searchTagsController.clearComposing();
                    searchBoxFocus.unfocus();
                    searchAction(searchTagsController.text);
                  },
                ),
                Container(
                    constraints: BoxConstraints(minWidth: 10, maxWidth: 300),
                    child: TabBox(searchGlobals,globalsIndex,searchTagsController,widget.settingsHandler),
                ),
                Spacer(),
                Container(
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
                Container(
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
                      Get.to(AboutPage());
                    },
                    child: Text("About", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){

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
                  Expanded(child: DesktopImageListener(searchGlobals[globalsIndex].currentItem,widget.settingsHandler)),
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
            color: Get.context!.theme.canvasColor,
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


class DesktopImageListener extends StatefulWidget {
  ValueNotifier<BooruItem> valueNotifier;
  SettingsHandler settingsHandler;
  DesktopImageListener(this.valueNotifier, this.settingsHandler);
  @override
  _DesktopImageListenerState createState() => _DesktopImageListenerState();
}

class _DesktopImageListenerState extends State<DesktopImageListener> {
  MediaViewer? view;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.valueNotifier,
        builder: (BuildContext context, BooruItem value, Widget? child){
          if (value.fileURL == ""){
            return Container();
          } else {
           if (!value.isVideo() ){
             return PhotoView(imageProvider: NetworkImage(value.fileURL!));
           } else {
             if (Platform.isAndroid){
               return VideoApp(value, 0, 0, widget.settingsHandler);
             } else {
               return Center(
                 child: Column(
                   children: [
                     Expanded(
                         child:Image.network(value!.thumbnailURL!,fit: BoxFit.fill,),
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
                           Process.run('mpv', ["--loop", "${value.fileURL}"]);
                         },
                         child: Text(" Open in Video Player ", style: TextStyle(color: Colors.white)),
                       ),
                     ),
                   ],
                 ),
               );
             }
           }
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



