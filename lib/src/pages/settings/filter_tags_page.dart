import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:LoliSnatcher/src/handlers/settings_handler.dart';
import 'package:LoliSnatcher/src/widgets/common/marquee_text.dart';
import 'package:LoliSnatcher/src/widgets/desktop/desktop_scroll_wrap.dart';
import 'package:LoliSnatcher/src/widgets/common/flash_elements.dart';
import 'package:LoliSnatcher/src/widgets/common/settings_widgets.dart';

class FiltersEdit extends StatefulWidget {
  const FiltersEdit({Key? key}) : super(key: key);

  @override
  State<FiltersEdit> createState() => _FiltersEditState();
}

class _FiltersEditState extends State<FiltersEdit> with SingleTickerProviderStateMixin {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final TextEditingController newTagController = TextEditingController();
  final ScrollController scrollController = ScrollController();
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

    tabController = TabController(vsync: this, length: 3)..addListener(updateState);
  }

  void updateState() {
    if(mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    tabController.removeListener(updateState);
    tabController.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    settingsHandler.hatedTags = settingsHandler.cleanTagsList(hatedList);
    settingsHandler.lovedTags = settingsHandler.cleanTagsList(lovedList);
    settingsHandler.filterHated = filterHated;
    bool result = await settingsHandler.saveSettings(restate: false);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text("Filters Editor"),
          bottom: TabBar(
            controller: tabController,
            indicatorColor: Theme.of(context).colorScheme.secondary,
            tabs: [
              Tab(
                text: 'Hated ${hatedList.isNotEmpty ? '(${hatedList.length})' : ''}'.trim(),
                icon: const Icon(CupertinoIcons.eye_slash, color: Colors.red),
              ),
              Tab(
                text: 'Loved ${lovedList.isNotEmpty ? '(${lovedList.length})' : ''}'.trim(),
                icon: const Icon(Icons.star, color: Colors.yellow),
              ),
              const Tab(
                text: 'Settings',
                icon: Icon(Icons.settings),
              ),
            ],
          ),
        ),
        floatingActionButton: tabController.index < 2
          ? FloatingActionButton(
            onPressed: () {
              openAddNewDialog();
            },
            child: const Icon(Icons.add),
          )
          : null,
        body: TabBarView(
          controller: tabController,
          children: [
            editableTagsList('Hated'),
            editableTagsList('Loved'),
            settingsList(),
          ],
        ),
      )
    );
  }

  void openAddNewDialog() {
    Widget entryRow = getEntryRow('[Add new ${tabController.index == 0 ? 'Hated' : 'Loved'}]', const Icon(Icons.add));
    newTagController.text = '';
    showFilterEntryActions(entryRow, '', -1, tabController.index == 0 ? 'Hated' : 'Loved');
  }

  Widget getEntryRow(String text, Widget icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
        onTap: null,
        leading: icon,
        title: MarqueeText(
          text: text,
          fontSize: 16,
          isExpanded: false,
        ),
      )
    );
  }

  Widget settingsList() {
    return ListView(
      controller: scrollController,
      children: [
        SettingsToggle(
          title: "Remove Items with Hated Tags",
          value: filterHated,
          onChanged: (bool newValue) {
            filterHated = newValue;
            updateState();
          },
        ),
      ]
    );
  }

  Widget editableTagsList(type) {
    List<String> tagsList = getTagsList(type);

    if(tagsList.isEmpty) {
      return SettingsButton(
        name: 'No items',
        action: () {
          openAddNewDialog();
        }
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: DesktopScrollWrap(
        controller: scrollController,
        child: ListView.builder(
          controller: scrollController,
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          shrinkWrap: false,
          itemCount: tagsList.length,
          scrollDirection: Axis.vertical,
          physics: getListPhysics(), // const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemBuilder: (BuildContext context, int index) {
            String currentEntry = tagsList[index];
            Widget entryRow = getEntryRow(tagsList[index], const Icon(CupertinoIcons.tag));
      
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
        ),
      ),
    );
  }

  void addTag(String tag, String type) {
    List<String> changedList = getTagsList(type);
    if(changedList.contains(tag)) {
      FlashElements.showSnackbar(
        context: context,
        title: const Text(
          "Duplicate tag!",
          style: TextStyle(fontSize: 20)
        ),
        content: Text(
          "'$tag' is already in $type list",
          style: const TextStyle(fontSize: 16)
        ),
        leadingIcon: Icons.warning_amber,
        leadingIconColor: Colors.yellow,
        sideColor: Colors.yellow,
      );
    } else {
      changedList.add(tag);
      updateState();
    }
  }

  void editTag(String newTag, int index, String type) {
    List<String> changedList = getTagsList(type);
    changedList[index] = newTag;
    updateState();
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
            SizedBox(
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
                inputType: TextInputType.text,
                clearable: true,
                resetText: isAddButton ? null : () => tag,
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
                      title: const Text(
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
                  side: BorderSide(color: Theme.of(context).colorScheme.secondary),
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
                      title: const Text(
                        "Empty input!",
                        style: TextStyle(fontSize: 20)
                      ),
                      leadingIcon: Icons.warning_amber,
                      leadingIconColor: Colors.red,
                      sideColor: Colors.red,
                    );
                  }
                },
                leading: const Icon(Icons.save),
                title: const Text('Save'),
              )
            ),

            if(!isAddButton)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Theme.of(context).colorScheme.secondary),
                  ),
                  onTap: () async {
                    if(type == 'Hated') {
                      hatedList = tagsList.where((t) => t != tag).toList();
                    } else if(type == 'Loved') {
                      lovedList = tagsList.where((t) => t != tag).toList();
                    }
                    updateState();
                    Navigator.of(context).pop(true);
                  },
                  leading: Icon(Icons.delete_forever, color: Theme.of(context).errorColor),
                  title: Text('Delete', style: TextStyle(color: Theme.of(context).errorColor)),
                )
              ),
          ],
          actionButtons: const [],
        );
      },
    );
  }
}
