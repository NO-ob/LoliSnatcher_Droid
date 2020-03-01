import 'package:flutter/material.dart';
import 'libBooru/GelbooruHandler.dart';
import 'libBooru/BooruItem.dart';
void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loli Snatcher"),
      ),
      body: Center(
        child: Images("kanna_kamui rating:safe"),

      ),
    );
  }

}
Widget Images(String tags){
  GelbooruHandler test = new GelbooruHandler();
  return FutureBuilder(
      future: test.Search(tags),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          return GridView.builder(
            itemCount: snapshot.data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                child: new GridTile(
                  child: new InkResponse(
                    enableFeedback: true,
                    child:new Image.network('${snapshot.data[index].thumbnailURL}',fit: BoxFit.cover,),
                    onTap: () => printInfo(snapshot.data[index],index),
                  ),
                ),
              );
            },
          );
        }
      });
}



void printInfo(BooruItem item, int index){
  print(item.fileURL);
}
