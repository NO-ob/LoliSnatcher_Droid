import 'package:flutter/material.dart';
import 'libBooru/GelbooruHandler.dart';
import 'libBooru/MoebooruHandler.dart';
import 'libBooru/DanbooruHandler.dart';
import 'libBooru/BooruHandler.dart';
import 'libBooru/BooruItem.dart';
import 'ImageWriter.dart';
import 'SettingsHandler.dart';
import 'package:photo_view/photo_view.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:ext_storage/ext_storage.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MaterialApp(
    navigatorKey: Get.key,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  SettingsHandler settingsHandler = new SettingsHandler();
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String tags = "rating:safe";
  int pageNum = 0;
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
                child: Center(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
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
                child: FlatButton(
                  onPressed: (){
                    firstRun = false;
                    Get.to(SnatcherPage(searchTagsController.text));
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

  //TO-DO: Change bloat into a function isntead of stacking futurebuilder like a retard
  //Also add another perms check at the beginning
  Widget ImagesFuture(){
    return FutureBuilder(
      future: ExtStorage.getExternalStorageDirectory(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.connectionState == ConnectionState.done){
            var path = snapshot.data + "/LoliSnatcher/snatched/";
            if(File(path+"settings.conf").existsSync()){
              return FutureBuilder(
                  future: widget.settingsHandler.loadSettings(),
                  builder: (BuildContext context, AsyncSnapshot snapshot){
                    if (snapshot.connectionState == ConnectionState.done){
                      if (firstRun){
                        searchTagsController.text = widget.settingsHandler.defTags;
                        return Images(widget.settingsHandler.defTags, widget.settingsHandler);
                      } else {
                        return Images(tags, widget.settingsHandler);
                      }
                    } else {
                      return Container(child: CircularProgressIndicator());
                    }
                  }
              );
            } else {
              getPerms();
              return FutureBuilder(
                future: widget.settingsHandler.writeDefaults() ,
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if (snapshot.connectionState == ConnectionState.done){
                    return FutureBuilder(
                      future: widget.settingsHandler.loadSettings(),
                      builder: (BuildContext context, AsyncSnapshot snapshot){
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Images(tags, widget.settingsHandler);
                        } else {
                          return Container(child: CircularProgressIndicator());
                        }
                      }
                    );
                  } else {
                      return Container(child: CircularProgressIndicator());
                  }
                }
              );
            }
          } else{
          return Container(child: CircularProgressIndicator());
        }
      }
    );
  }
}


class SettingsPage extends StatefulWidget {
  SettingsHandler settingsHandler;
  SettingsPage(this.settingsHandler);
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final settingsTagsController = TextEditingController();
  final settingsLimitController = TextEditingController();
  String previewMode = "Sample";
  @override
  void initState() {
    super.initState();
    widget.settingsHandler.loadSettings().whenComplete((){
      settingsTagsController.text = widget.settingsHandler.defTags;
      settingsLimitController.text = widget.settingsHandler.limit;
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
          ],
        ),
      ),
    );
  }
}


/**
 * This widget will create a booru handler and then generate a gridview of preview images using a future builder and the search function of the booru handler
 */

class Images extends StatefulWidget {
  final String tags;
  SettingsHandler settingsHandler;
  Images(this.tags, this.settingsHandler);
  int pageNum = 0;
  List<BooruItem> selected = new List();
  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  BooruHandler booruHandler;
  @override
  void initState(){
    booruHandler = new GelbooruHandler("https://gelbooru.com",int.parse(widget.settingsHandler.limit));
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
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                  child: new GridTile(
                    // Inkresponse is used so the tile can have an onclick function
                    child: new InkResponse(
                      enableFeedback: true,
                      child: sampleorThumb(snapshot.data[index]),
                      onTap: () {
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
  Widget sampleorThumb(BooruItem item){
    if (widget.settingsHandler.previewMode == "Sample"){
      return new Image.network(item.sampleURL,fit: BoxFit.cover,);
    } else {
      return new Image.network(item.thumbnailURL,fit: BoxFit.cover,);
    }
  }
}

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
              writer.saveImage([widget.fetched[controller.page.toInt()]]);
            },
          ),
        ],
      ),
      body: Center(
        child: PageView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
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

void getPerms() async{
  await PermissionHandler().requestPermissions([PermissionGroup.storage]);
}



class SnatcherPage extends StatefulWidget {
  final String tags;
  SnatcherPage(this.tags);
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
}


Future Snatcher(String tags, String amount, int timeout) async{
  ImageWriter writer = new ImageWriter();
  int count = 0, limit,page = 0;
  var booruItems;
  if (int.parse(amount) <= 100){
    limit = int.parse(amount);
  } else {
    limit = 100;
  }
  Get.snackbar("Snatching Images","Do not close the app!",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5));
  BooruHandler booruHandler = new GelbooruHandler("https://gelbooru.com", limit);
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
    await writer.write(booruItems[n]);
  }

  Get.snackbar("Snatching Complete","¡¡¡( •̀ ᴗ •́ )و!!!",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5));
}


