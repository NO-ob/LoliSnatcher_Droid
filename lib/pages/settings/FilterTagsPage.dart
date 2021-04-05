import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/widgets/InfoDialog.dart';
import 'package:LoliSnatcher/widgets/ScrollingText.dart';

class FiltersEdit extends StatefulWidget {
  SettingsHandler settingsHandler;
  FiltersEdit(this.settingsHandler);

  @override
  _FiltersEditState createState() => _FiltersEditState();
}

class _FiltersEditState extends State<FiltersEdit> {
  TextEditingController newTagController = TextEditingController();
  List<String> hatedList = [];
  List<String> lovedList = [];
  bool filterHated = false;

  @override
  void initState() {
    hatedList = widget.settingsHandler.hatedTags;
    lovedList = widget.settingsHandler.lovedTags;
    filterHated = widget.settingsHandler.filterHated;
    super.initState();
  }

  Future<bool> _onWillPop() async {
    widget.settingsHandler.hatedTags = widget.settingsHandler.cleanTagsList(hatedList);
    widget.settingsHandler.lovedTags = widget.settingsHandler.cleanTagsList(lovedList);
    widget.settingsHandler.filterHated = filterHated;
    bool result = await widget.settingsHandler.saveSettings();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            title: Text("Filters Editor"),
          actions: [
          ],
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              editableTagsList('Hated'),
              Container(
                  margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
                  child: Row(children: [
                    Text("Remove Items with Hated Tags: "),
                    Checkbox(
                      value: filterHated,
                      onChanged: (newValue) {
                        setState(() {
                          filterHated = newValue!;
                        });
                      },
                      activeColor: Get.context!.theme.primaryColor,
                    )
                  ],)
              ),
              editableTagsList('Loved'),
            ],
          ),
        ),
      )
    );
  }



  Widget editableTagsList(type) {
    List<String> tagsList = getTagsList(type);

    return Column(children: [
      const SizedBox(height: 10),
      TextButton.icon(
        onPressed: null,
        icon: Icon(type == 'Hated' ? CupertinoIcons.eye_slash : Icons.star, color: type == 'Hated' ? Colors.red : Colors.yellow),
        label: Text('$type Tags:', style: TextStyle(fontSize: 22, color: Colors.white)),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 200,
          child: Material(
            color: Get.context!.theme.dialogBackgroundColor.withOpacity(0.5),
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              shrinkWrap: true,
              itemCount: tagsList.length + 1,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                bool isAddButton = index == (tagsList.length);
                String currentEntry = isAddButton ? '[Add]' : tagsList[index];

                Widget entryRow = TextButton.icon(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(color: Get.context!.theme.accentColor),
                    ),
                  ),
                  onPressed: null,
                  icon: isAddButton ? Icon(Icons.add) : Icon(CupertinoIcons.tag),
                  label: Expanded(child: ScrollingText(currentEntry, 25, "infiniteWithPause", Colors.white)),
                );

                return Row(children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if(!isAddButton) newTagController.text = currentEntry;
                        else newTagController.text = '';
                        showFilterEntryActions(entryRow, currentEntry, index, type);
                      },
                      child: entryRow
                    )
                  ),
                ]);
              }
            )
          )
        )
      )
    ]);
  }

  void addTag(String tag, String type) {
    List<String> changedList = getTagsList(type);
    setState(() {
      if(changedList.contains(tag)) {
        ServiceHandler.displayToast('"$tag" is already in $type list');
      } else {
        changedList.add(tag);
      }
    });
  }

  void editTag(String newTag, int index, String type) {
    List<String> changedList = getTagsList(type);
    setState(() {
      changedList[index] = newTag;
    });
  }

  List<String> getTagsList(type) {
    List<String> tagsList = [];
    if(type == 'Hated') {
      tagsList = hatedList;
    } else if (type == 'Loved') {
      tagsList = lovedList;
    }
    return tagsList;
  }

  void showFilterEntryActions(Widget row, String tag, int index, String type) {
    showDialog(context: context, builder: (context) {
      List<String> tagsList = getTagsList(type);
      bool isAddButton = index == tagsList.length;
      return StatefulBuilder(builder: (context, setDialogState) {
        return InfoDialog(
          null,
          [
            AbsorbPointer(absorbing: true, child: row),
            const SizedBox(height: 20),
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                      child: TextField(
                        autofocus: isAddButton ? true : false,
                        controller: newTagController,
                        onSubmitted: (String text) {
                          if(text.trim() != '') {
                            isAddButton
                              ? addTag(text.trim().toLowerCase(), type)
                              : editTag(text.trim().toLowerCase(), index, type);
                            newTagController.text = '';
                            Navigator.of(context).pop(true);
                          } else {
                            ServiceHandler.displayToast('Empty input!');
                          }
                        },
                        decoration: InputDecoration(
                          hintText: isAddButton ? "New $type Tag" : "Edit Tag",
                          contentPadding: EdgeInsets.fromLTRB(15,0,15,0), // left,right,top,bottom
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            gapPadding: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: Get.context!.theme.accentColor),
                ),
              ),
              onPressed: () async {
                String text = newTagController.text;
                if(text.trim() != '') {
                  isAddButton
                    ? addTag(text.trim().toLowerCase(), type)
                    : editTag(text.trim().toLowerCase(), index, type);
                  newTagController.text = '';
                  Navigator.of(context).pop(true);
                } else {
                  ServiceHandler.displayToast('Empty input!');
                }
              },
              icon: Icon(Icons.save),
              label: Expanded(child: Text('Save', style: TextStyle(color: Colors.white))),
            ),
            if(!isAddButton)
              TextButton.icon(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Get.context!.theme.accentColor),
                  ),
                ),
                onPressed: () async {
                  setState(() {
                    if(type == 'Hated') {
                      hatedList = tagsList.where((t) => t != tag).toList();
                    } else if(type == 'Loved') {
                      lovedList = tagsList.where((t) => t != tag).toList();
                    }
                  });
                  Navigator.of(context).pop(true);
                },
                icon: Icon(Icons.delete_forever, color: Get.context!.theme.errorColor),
                label: Expanded(child: Text('Delete', style: TextStyle(color: Get.context!.theme.errorColor))),
              ),
            const SizedBox(height: 5),
          ],
          CrossAxisAlignment.center
        );
      });
    });
  }
}
