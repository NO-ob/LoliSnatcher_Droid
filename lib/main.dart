import 'package:flutter/material.dart';
import 'libBooru/GelbooruHandler.dart';
import 'libBooru/MoebooruHandler.dart';
import 'libBooru/DanbooruHandler.dart';
import 'libBooru/BooruHandler.dart';
import 'libBooru/BooruItem.dart';
import 'ImageWriter.dart';
import 'package:photo_view/photo_view.dart';
import 'package:get/get.dart';
//import 'package:permission_handler/permission_handler.dart';
void main() {
  runApp(MaterialApp(
    navigatorKey: Get.key,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String tags = "rating:safe";
  int pageNum = 0;
  final searchTagsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loli Snatcher"),
      ),
      body: Center(
        child: new Images(tags: tags),
      ),
      drawer: Drawer(
        child: ListView(
          children:<Widget>[
            DrawerHeader(
              child: Text("Loli Snatcher"),
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
                        setState((){
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
                  Get.to(SnatcherPage());
                },
                child: Text("Snatcher"),
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
  Images({this.tags});
  int pageNum = 0;
  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  BooruHandler test = new GelbooruHandler("https://gelbooru.com", 10);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: test.Search(widget.tags, widget.pageNum),
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
                      child:new Image.network('${snapshot.data[index].sampleURL}',fit: BoxFit.cover,),
                      onTap: () {
                        Get.to(ImagePage(snapshot.data,index));
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
  //Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.storage]);
  //print(permissions);
}



class SnatcherPage extends StatefulWidget {
  @override
  _SnatcherPageState createState() => _SnatcherPageState();
}

class _SnatcherPageState extends State<SnatcherPage> {
  final snatcherTagsController = TextEditingController();
  final snatcherAmountController = TextEditingController();
  final snatcherTimeoutController = TextEditingController();
  @override
  void initState() {
    super.initState();
    getPerms();
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
                Text("Timeout: "),
                new Expanded(
                  child: TextField(
                    controller: snatcherTimeoutController,
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

                Get.off(SnatcherProgressPage(snatcherTagsController.text,snatcherAmountController.text,snatcherTimeoutController.text));
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
class SnatcherProgressPage extends StatefulWidget {
  String tags,amount,timeout;
  int pageNum=0;
  int count=0;
  SnatcherProgressPage(this.tags,this.amount,this.timeout);
  @override
  _SnatcherProgressPageState createState() => _SnatcherProgressPageState();
}

class _SnatcherProgressPageState extends State<SnatcherProgressPage> {
  static int limit, count;
  BooruHandler booruHandler;
  ImageWriter writer = new ImageWriter();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (int.parse(widget.amount) <= 100){limit = int.parse(widget.amount);} else {limit = 100;}
    booruHandler = new GelbooruHandler("https://gelbooru.com", limit);
  }
  Future getItems() async{
    int count = 0;
    int page = 0;
    var uwu;
    while (count < int.parse(widget.amount)){
      uwu = await booruHandler.Search(widget.tags,page);
      page ++;
      count += limit;
      print(count);
    }
    print(uwu);
    return uwu;
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Snatching"),
      ),
      body: FutureBuilder(
          future: getItems(),
          builder: (context, AsyncSnapshot snapshot){
              switch(snapshot.connectionState){
                case ConnectionState.active:
                  return Text("Snatching");
                  break;
                case ConnectionState.done:
                  return Container(child:FutureBuilder(
                    future: snatcherWriter(snapshot.data, widget.amount,writer),
                    builder: (context, AsyncSnapshot snap2){
                      switch(snap2.connectionState){
                        case ConnectionState.active:
                          return Text(writer.status);
                          break;
                        case ConnectionState.done:
                          return Text("Complete");
                          break;

                      }
                      if (snap2.hasData){
                        return Text(snap2.data);
                      }
                      return Text("somethings happening");
                    }
                  ),);
                  break;
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                  break;
                case ConnectionState.none:
                  return Text("hmmmmmm");
                  break;
              }
              return Text("hmmmmmm");
            },
          ),
    );
  }
}

Future snatcherWriter(List items, String amount, ImageWriter writer) async{
  var status;
  for (int n = 0; n < int.parse(amount); n ++){
    status = await writer.write(items[n]);

  }
  return status;
}