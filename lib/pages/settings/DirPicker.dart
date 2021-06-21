import 'dart:io';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DirPicker extends StatefulWidget {
  SettingsHandler settingsHandler;
  String path = "";
  DirPicker(this.settingsHandler,this.path);
  @override
  _DirPickerState createState() => _DirPickerState();
}
// Need to make this return the seslected directory to previous page. Might use getx variable not sure yet
// Might also use a grid and add folder icons isntead of listing text
// Need to make a dialog to create a new folder
class _DirPickerState extends State<DirPicker> {
  String path = "";
  @override
  void initState(){
    super.initState();
    path = widget.path;
  }
  Future<bool> _onWillPop() async {
    if (path == widget.path){
      return true;
    } else {
      setState(() {
        path = path.substring(0,path.lastIndexOf("/"));
      });
      return false;
    }

  }
  Future<List<String>> getDirs() async{
    List<String> dirs = [];
    var dir = Directory(path);
    dir.list(recursive: false).forEach((file) {
      if (file is Directory){
        dirs.add(file.path.replaceAll(path,""));
      }
    });
    return dirs;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child:Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Select a Directory"),
        ),
        body: Center(
          child: FutureBuilder(
              future: getDirs(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if (snapshot.connectionState == ConnectionState.done){
                  return ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              if (!path.endsWith(snapshot.data[index])){
                                path += snapshot.data[index];
                                print(path);
                              }
                            });
                          },
                          child: Container(
                          height: 50,
                          child: Center(child: Text(snapshot.data[index])),
                         ),
                        );
                      }
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            path == widget.path ? Container() :
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                widget.path = path;
                //Get.back(path);
              },
              child: const Icon(Icons.check),
              backgroundColor: Get.context!.theme.accentColor,
            ),
            Container(width: 5,),
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                // Add your onPressed code here!
              },
              child: const Icon(Icons.add),
              backgroundColor: Get.context!.theme.accentColor,
            ),
          ],
        )
      ),
    );
  }
}
