import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class DirPicker extends StatefulWidget {
  const DirPicker(this.path, {Key? key}) : super(key: key);
  final String path;

  @override
  State<DirPicker> createState() => _DirPickerState();
}
// Need to make this return the seslected directory to previous page. Might use getx variable not sure yet
// Might also use a grid and add folder icons isntead of listing text
// Need to make a dialog to create a new folder
class _DirPickerState extends State<DirPicker> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
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
            title: const Text('Are you sure?'),
            contentItems: const [
              Text('Do you want to close the picker without choosing a directory?'),
            ],
            actionButtons: <Widget>[
              ElevatedButton(
                child: const Text('Yes'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              ElevatedButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop(false);
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
    var dir = Directory("$path/${newDirNameController.text}");
    if (!dir.existsSync()){
      dir.createSync(recursive: true);
    }
    if (dir.existsSync()){
      setState(() {
        path += "/${newDirNameController.text}";
        newDirNameController.text = "";
      });
    } else {
      newDirNameController.text = "";

      FlashElements.showSnackbar(
        context: context,
        title: const Text(
          "Error!",
          style: TextStyle(fontSize: 20)
        ),
        content: const Text(
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
    File file = File("$path/test.txt");
    try {
      file.createSync();
      file.writeAsStringSync('', mode: FileMode.write, flush: true);
      file.deleteSync();
      return true;
    } on FileSystemException {
      FlashElements.showSnackbar(
        context: context,
        title: const Text(
          "Error!",
          style: TextStyle(fontSize: 20)
        ),
        content: const Text(
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
                                settingsHandler.extPathOverride = "$path/";
                              });
                            },
                            child: SizedBox(
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
                            settingsHandler.extPathOverride = "$path/";
                          });
                        },
                        child: const SizedBox(
                        height: 50,
                        child: Center(child: Text("/0")),
                          ),
                        ),
                      ],);
                  } else {
                    return Container();
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator()
                  );
                }
              }
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            path == widget.path
              ? Container()
              : FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  if (isWritable()){
                    Navigator.of(context).pop('$path/');
                  }
                },
                backgroundColor: Theme.of(context).colorScheme.secondary,
                child: const Icon(Icons.check),
              ),
            Container(width: 5,),
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SettingsDialog(
                      title: const Text('New Directory'),
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
                        const CancelButton(),
                        ElevatedButton(
                          child: const Text('Create'),
                          onPressed: () {
                            mkdir();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: const Icon(Icons.add),
            ),
          ],
        )
      ),
    );
  }
}
