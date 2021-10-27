import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/widgets/MarqueeText.dart';

class FiltersEdit extends StatefulWidget {
  FiltersEdit();

  @override
  _FiltersEditState createState() => _FiltersEditState();
}

class _FiltersEditState extends State<FiltersEdit> with SingleTickerProviderStateMixin {
  final SettingsHandler settingsHandler = Get.find();
  final TextEditingController newTagController = TextEditingController();
  late TabController tabController;

  List<String> hatedList = [];
  List<String> lovedList = [];
  bool filterHated = false;

  @override
  void initState() {
    super.initState();
    hatedList = settingsHandler.hatedTags;
    lovedList = settingsHandler.lovedTags;
    filterHated = settingsHandler.filterHated;

    tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    settingsHandler.hatedTags = settingsHandler.cleanTagsList(hatedList);
    settingsHandler.lovedTags = settingsHandler.cleanTagsList(lovedList);
    settingsHandler.filterHated = filterHated;
    bool result = await settingsHandler.saveSettings(restate: true);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Filters Editor"),
          bottom: TabBar(
            controller: tabController,
            indicatorColor: Get.theme.colorScheme.secondary,
            tabs: [
              Tab(
                text: 'Hated ${hatedList.isNotEmpty ? '(${hatedList.length})' : ''}'.trim(),
                icon: Icon(CupertinoIcons.eye_slash, color: Colors.red),
              ),
              Tab(
                text: 'Loved ${lovedList.isNotEmpty ? '(${lovedList.length})' : ''}'.trim(),
                icon: Icon(Icons.star, color: Colors.yellow),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Widget entryRow = getEntryRow('[Add new ${tabController.index == 0 ? 'Hated' : 'Loved'}]', Icon(Icons.add));
            newTagController.text = '';
            showFilterEntryActions(entryRow, '', -1, tabController.index == 0 ? 'Hated' : 'Loved');
          },
          child: Icon(Icons.add),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            ListView(children: [
              SettingsToggle(
                title: "Remove Items with Hated Tags",
                value: filterHated,
                onChanged: (bool newValue) {
                  setState(() {
                    filterHated = newValue;
                  });
                },
              ),
              editableTagsList('Hated'),
            ]),
            ListView(children: [
              editableTagsList('Loved')
            ]),
          ],
        ),
      )
    );
  }

  Widget getEntryRow(String text, Widget icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: Get.theme.colorScheme.secondary),
        ),
        onTap: null,
        leading: icon,
        title: MarqueeText(
          text: text,
          fontSize: 16,
          startPadding: 0,
          isExpanded: false,
        ),
      )
    );
  }

  Widget editableTagsList(type) {
    List<String> tagsList = getTagsList(type);

    if(tagsList.isEmpty) {
      return const SizedBox();
    }

    return Column(children: [
      const SizedBox(height: 10),
      ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          child: Material(
            color: Get.theme.dialogBackgroundColor.withOpacity(0.5),
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              shrinkWrap: true,
              itemCount: tagsList.length,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                String currentEntry = tagsList[index];
                Widget entryRow = getEntryRow(tagsList[index], Icon(CupertinoIcons.tag));

                return Row(children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        newTagController.text = currentEntry;
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
        FlashElements.showSnackbar(
          context: context,
          title: Text(
            "Duplicate tag!",
            style: TextStyle(fontSize: 20)
          ),
          content: Text(
            "'$tag' is already in $type list",
            style: TextStyle(fontSize: 16)
          ),
          leadingIcon: Icons.warning_amber,
          leadingIconColor: Colors.yellow,
          sideColor: Colors.yellow,
        );
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

  void showFilterEntryActions(Widget entryRow, String tag, int index, String type) {
    showDialog(
      context: context,
      builder: (context) {
        List<String> tagsList = getTagsList(type);
        bool isAddButton = index == -1;

        return SettingsDialog(
          contentItems: <Widget>[
            Container(
              width: double.maxFinite,
              child: AbsorbPointer(absorbing: true, child: entryRow)
            ),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: SettingsTextInput(
                title: isAddButton ? "New $type Tag" : "Edit Tag",
                hintText: isAddButton ? "New $type Tag" : "Edit Tag",
                onlyInput: true,
                controller: newTagController,
                autofocus: isAddButton ? true : false,
                onSubmitted: (String text) {
                  if(text.trim() != '') {
                    isAddButton
                      ? addTag(text.trim().toLowerCase(), type)
                      : editTag(text.trim().toLowerCase(), index, type);
                    newTagController.text = '';
                    Navigator.of(context).pop(true);
                  } else {
                    FlashElements.showSnackbar(
                      context: context,
                      title: Text(
                        "Empty input!",
                        style: TextStyle(fontSize: 20)
                      ),
                      leadingIcon: Icons.warning_amber,
                      leadingIconColor: Colors.red,
                      sideColor: Colors.red,
                    );
                  }
                },
              )
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: Get.theme.colorScheme.secondary),
                ),
                onTap: () async {
                  String text = newTagController.text;
                  if(text.trim() != '') {
                    isAddButton
                      ? addTag(text.trim().toLowerCase(), type)
                      : editTag(text.trim().toLowerCase(), index, type);
                    newTagController.text = '';
                    Navigator.of(context).pop(true);
                  } else {
                    FlashElements.showSnackbar(
                      context: context,
                      title: Text(
                        "Empty input!",
                        style: TextStyle(fontSize: 20)
                      ),
                      leadingIcon: Icons.warning_amber,
                      leadingIconColor: Colors.red,
                      sideColor: Colors.red,
                    );
                  }
                },
                leading: Icon(Icons.save),
                title: Text('Save'),
              )
            ),

            if(!isAddButton)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Get.theme.colorScheme.secondary),
                  ),
                  onTap: () async {
                    setState(() {
                      if(type == 'Hated') {
                        hatedList = tagsList.where((t) => t != tag).toList();
                      } else if(type == 'Loved') {
                        lovedList = tagsList.where((t) => t != tag).toList();
                      }
                    });
                    Navigator.of(context).pop(true);
                  },
                  leading: Icon(Icons.delete_forever, color: Get.theme.errorColor),
                  title: Text('Delete', style: TextStyle(color: Get.theme.errorColor)),
                )
              ),
          ],
          actionButtons: <Widget>[ ],
        );
      },
    );
  }
}
