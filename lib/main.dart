import 'package:flutter/material.dart';
import 'libBooru/GelbooruHandler.dart';
import 'libBooru/MoebooruHandler.dart';
import 'libBooru/DanbooruHandler.dart';
import 'libBooru/BooruHandler.dart';
import 'libBooru/BooruItem.dart';
import 'ImageWriter.dart';
import 'package:photo_view/photo_view.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
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
                child: Text("Snatch"),
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
        title: Text("Second Route"),
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
  Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.storage]);
  print(permissions);
}



class SnatcherPage extends StatefulWidget {
  @override
  _SnatcherPageState createState() => _SnatcherPageState();
}

class _SnatcherPageState extends State<SnatcherPage> {
  final snatchTagsController = TextEditingController();
  final snatchAmountController = TextEditingController();
  final snatchTimeoutController = TextEditingController();
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
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Tags"),
                  TextField(
                    controller: snatchTagsController,
                    decoration: InputDecoration(
                      hintText:"Enter Tags",
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Amount"),
                  TextField(
                    controller: snatchAmountController,
                    decoration: InputDecoration(
                      hintText:"Enter Amount of Images",
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Timeout (MS)"),
                  TextField(
                    controller: snatchTimeoutController,
                    decoration: InputDecoration(
                      hintText:"Enter Timeout Length",
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
}
