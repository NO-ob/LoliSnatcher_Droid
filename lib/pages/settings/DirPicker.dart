import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';

class DirPicker extends StatefulWidget {
  String path = "";
  DirPicker(this.path);
  @override
  _DirPickerState createState() => _DirPickerState();
}
// Need to make this return the seslected directory to previous page. Might use getx variable not sure yet
// Might also use a grid and add folder icons isntead of listing text
// Need to make a dialog to create a new folder
class _DirPickerState extends State<DirPicker> {
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final newDirNameController = TextEditingController();
  String path = "";
  @override
  void initState(){
    super.initState();
    path = widget.path;
  }
  Future<bool> _onWillPop() async {
    if (path == "/storage"){
      final shouldPop = await showDialog(
        context: context,
        builder: (context) {
          return SettingsDialog(
            title: Text('Are you sure?'),
            contentItems: <Widget>[Text('Do you want to close the picker without choosing a directory?')],
            actionButtons: <Widget>[
              ElevatedButton(
                child: Text('Yes'),
                onPressed: () {
                  Get.back(result: true);
                },
              ),
              ElevatedButton(
                child: Text('No'),
                onPressed: () {
                  Get.back(result: false);
                },
              ),
            ],
          );
        },
      );
      return shouldPop;
    } else {
      if(path.lastIndexOf("/") > -1) {
        setState(() {
          path = path.substring(0,path.lastIndexOf("/"));
          print(path);
        });
      }
      return false;
    }
  }

  void mkdir(){
    var dir = Directory(path+"/"+newDirNameController.text);
    if (!dir.existsSync()){
      dir.createSync(recursive: true);
    }
    if (dir.existsSync()){
      setState(() {
        path += "/"+ newDirNameController.text;
        newDirNameController.text = "";
      });
    } else {
      newDirNameController.text = "";

      FlashElements.showSnackbar(
        context: context,
        title: Text(
          "Error!",
          style: TextStyle(fontSize: 20)
        ),
        content: Text(
          "Failed to create directory!",
          style: TextStyle(fontSize: 16)
        ),
        leadingIcon: Icons.warning_amber,
        leadingIconColor: Colors.red,
        sideColor: Colors.red,
      );
    }

  }
  bool isWritable(){
    File file = File(path+"/"+"test.txt");
    try {
      file.createSync();
      file.writeAsStringSync('', mode: FileMode.write, flush: true);
      file.deleteSync();
      return true;
    } on FileSystemException catch(e) {
      FlashElements.showSnackbar(
        context: context,
        title: Text(
          "Error!",
          style: TextStyle(fontSize: 20)
        ),
        content: Text(
          "Directory is not writable!",
          style: TextStyle(fontSize: 16)
        ),
        leadingIcon: Icons.warning_amber,
        leadingIconColor: Colors.red,
        sideColor: Colors.red,
      );
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
    String title = "Select a Directory";
    if (path != widget.path){
      title = path.substring(path.lastIndexOf("/")+1);
    }
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: FutureBuilder(
              future: getDirs(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if (snapshot.connectionState == ConnectionState.done){
                  if (snapshot.data.length > 0){
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
                                settingsHandler.extPathOverride = path + "/";
                              });
                            },
                            child: Container(
                              height: 50,
                              child: Center(child: Text(snapshot.data[index])),
                            ),
                          );
                        }
                    );
                  } else if (title == "emulated"){
                    return ListView(children: [
                        GestureDetector(
                        onTap: (){
                          setState(() {
                            if (!path.endsWith("0")){
                              path += "/0";
                              print(path);
                            }
                            settingsHandler.extPathOverride = path + "/";
                          });
                        },
                        child: Container(
                        height: 50,
                        child: Center(child: Text("/0")),
                          ),
                        ),
                      ],);
                  } else {
                    return Container();
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Get.theme.colorScheme.secondary)
                    )
                  );
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
                if (isWritable()){
                  Get.back(result: path + "/");
                }
              },
              child: const Icon(Icons.check),
              backgroundColor: Get.theme.colorScheme.secondary,
            ),
            Container(width: 5,),
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                Get.dialog(SettingsDialog(
                  title: Text('New Directory'),
                  content: SettingsTextInput(
                    controller: newDirNameController,
                    title: 'Directory Name',
                    hintText: 'Directory Name',
                    onlyInput: true,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[aA-zZ]'))
                    ],
                  ),
                  actionButtons: <Widget>[
                    ElevatedButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    ElevatedButton(
                      child: Text('Create'),
                      onPressed: () {
                        mkdir();
                        Get.back();
                      },
                    ),
                  ],
                ));
              },
              child: const Icon(Icons.add),
              backgroundColor: Get.theme.colorScheme.secondary,
            ),
          ],
        )
      ),
    );
  }
}
