import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/tags_filters/tf_add_dialog.dart';
import 'package:lolisnatcher/src/widgets/tags_filters/tf_edit_dialog.dart';
import 'package:lolisnatcher/src/widgets/tags_filters/tf_list.dart';
import 'package:lolisnatcher/src/widgets/tags_filters/tf_settings_list.dart';

class TagsFiltersPage extends StatefulWidget {
  const TagsFiltersPage({Key? key}) : super(key: key);

  @override
  State<TagsFiltersPage> createState() => _TagsFiltersPageState();
}

class _TagsFiltersPageState extends State<TagsFiltersPage> with SingleTickerProviderStateMixin {
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  late TabController tabController;
  final ScrollController scrollController = ScrollController();
  final TextEditingController tagSearchController = TextEditingController();

  List<String> hatedList = [];
  List<String> lovedList = [];
  bool filterHated = false, filterFavourites = false;

  @override
  void initState() {
    super.initState();
    hatedList = settingsHandler.hatedTags;
    hatedList.sort(sortTags);
    lovedList = settingsHandler.lovedTags;
    lovedList.sort(sortTags);
    filterHated = settingsHandler.filterHated;
    filterFavourites = settingsHandler.filterFavourites;

    tabController = TabController(vsync: this, length: 3)..addListener(updateState);
  }

  void updateState() {
    if (mounted) {
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
    settingsHandler.filterFavourites = filterFavourites;
    bool result = await settingsHandler.saveSettings(restate: false);
    return result;
  }

  List<String> getTagsList(type) {
    List<String> tagsList = [];
    if (type == 'Hated') {
      tagsList = hatedList;
    } else if (type == 'Loved') {
      tagsList = lovedList;
    }
    return tagsList;
  }

  int sortTags(String a, String b) {
    return a.toLowerCase().compareTo(b.toLowerCase());
  }

  void addTag(String newTag, String type) {
    if(newTag.isEmpty) {
      return;
    }

    List<String> changedList = getTagsList(type);
    if (changedList.contains(newTag)) {
      duplicateMessage(newTag, type);
    } else {
      changedList.add(newTag);
      changedList.sort(sortTags);
      updateState();
    }
  }

  void editTag(String oldTag, String newTag, String type) {
    if(newTag.isEmpty) {
      return;
    }

    List<String> changedList = getTagsList(type);
    if (changedList.contains(newTag)) {
      duplicateMessage(newTag, type);
    } else {
      int index = changedList.indexOf(oldTag);
      changedList[index] = newTag;
      changedList.sort(sortTags);
      updateState();
    }
  }

  void deleteTag(String tag, String type) {
    List<String> changedList = getTagsList(type);
    changedList.remove(tag);
    changedList.sort(sortTags);
    updateState();
  }

  void duplicateMessage(String tag, String type) {
    FlashElements.showSnackbar(
      context: context,
      title: const Text("Duplicate tag!", style: TextStyle(fontSize: 20)),
      content: Text("'$tag' is already in $type list", style: const TextStyle(fontSize: 16)),
      leadingIcon: Icons.warning_amber,
      leadingIconColor: Colors.yellow,
      sideColor: Colors.yellow,
    );
  }

  void openAddDialog(String type) {
    SettingsPageOpen(
      context: context,
      asDialog: true,
      page: () => TagsFiltersAddDialog(
        tagFilterType: type,
        onAdd: (String newTag) => addTag(newTag, type),
      ),
    ).open();
  }

  void openEditDialog(String tag, String type) {
    SettingsPageOpen(
      context: context,
      asDialog: true,
      page: () => TagsFiltersEditDialog(
        tag: tag,
        onEdit: (String newTag) => editTag(tag, newTag, type),
        onDelete: (String tag) => deleteTag(tag, type),
      ),
    ).open();
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
            onTap: (int index) {
              tagSearchController.clear();
            },
            labelColor: Theme.of(context).colorScheme.secondary,
            unselectedLabelColor: Theme.of(context).appBarTheme.foregroundColor,
            labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            unselectedLabelStyle: const TextStyle(fontSize: 16),
            tabs: [
              const Tab(
                text: 'Hated',
                icon: Icon(CupertinoIcons.eye_slash, color: Colors.red),
              ),
              const Tab(
                text: 'Loved',
                icon: Icon(Icons.star, color: Colors.yellow),
              ),
              Tab(
                text: 'Settings',
                icon: Icon(Icons.settings, color: Theme.of(context).colorScheme.onBackground),
              ),
            ],
          ),
        ),
        floatingActionButton: tabController.index < 2
            ? FloatingActionButton(
                onPressed: () {
                  openAddDialog(tabController.index == 0 ? 'Hated' : 'Loved');
                },
                child: const Icon(Icons.add),
              )
            : null,
        body: TabBarView(
          controller: tabController,
          children: [
            TagsFiltersList(
              tagsList: hatedList,
              filterTagsType: 'Hated',
              onTagSelected: (String tag) {
                openEditDialog(tag, 'Hated');
              },
              onSearchTextChanged: (String newText) {
                updateState();
              },
              scrollController: scrollController,
              tagSearchController: tagSearchController,
              openAddDialog: () => openAddDialog('Hated'),
            ),
            TagsFiltersList(
              tagsList: lovedList,
              filterTagsType: 'Loved',
              onTagSelected: (String tag) {
                openEditDialog(tag, 'Loved');
              },
              onSearchTextChanged: (String newText) {
                updateState();
              },
              scrollController: scrollController,
              tagSearchController: tagSearchController,
              openAddDialog: () => openAddDialog('Loved'),
            ),
            TagsFiltersSettingsList(
              scrollController: scrollController,
              filterHated: filterHated,
              onFilterHatedChanged: (bool newValue) {
                filterHated = newValue;
                updateState();
              },
              filterFavourites: filterFavourites,
              onFilterFavouritesChanged: (bool newValue) {
                filterFavourites = newValue;
                updateState();
              },
            ),
          ],
        ),
      ),
    );
  }
}
