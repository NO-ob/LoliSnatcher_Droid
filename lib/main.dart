import 'package:flutter/material.dart';
import 'libBooru/GelbooruHandler.dart';
import 'libBooru/MoebooruHandler.dart';
import 'libBooru/DanbooruHandler.dart';
import 'libBooru/BooruHandler.dart';
import 'libBooru/BooruItem.dart';
void main() {
  runApp(MaterialApp(
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
                          tags = searchTagsController.text + " rating:safe";
                        });
                      },
                    ),
                  ),
                ],
              ),),

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
                      onTap: () => printInfo(snapshot.data[index],index),
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


// Function to test on click functionality of the grid tiles
void printInfo(BooruItem item, int index){
  print(item.fileURL);
}


