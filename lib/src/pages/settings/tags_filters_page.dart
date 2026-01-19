import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lolisnatcher/src/data/tag.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/tags_filters/tf_add_dialog.dart';
import 'package:lolisnatcher/src/widgets/tags_filters/tf_edit_dialog.dart';
import 'package:lolisnatcher/src/widgets/tags_filters/tf_list.dart';
import 'package:lolisnatcher/src/widgets/tags_filters/tf_settings_list.dart';

class TagsFiltersPage extends StatefulWidget {
  const TagsFiltersPage({super.key});

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
  bool filterHated = false, filterFavourites = false, filterSnatched = false, filterAi = false;

  @override
  void initState() {
    super.initState();
    hatedList = settingsHandler.hatedTags;
    hatedList.sort(sortTags);
    lovedList = settingsHandler.lovedTags;
    lovedList.sort(sortTags);
    filterHated = settingsHandler.filterHated;
    filterFavourites = settingsHandler.filterFavourites;
    filterSnatched = settingsHandler.filterSnatched;
    filterAi = settingsHandler.filterAi;

    tabController = TabController(vsync: this, length: 3)..addListener(updateState);
  }

  void updateState() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    tagSearchController.dispose();
    tabController.removeListener(updateState);
    tabController.dispose();
    super.dispose();
  }

  Future<void> _onPopInvoked(bool didPop, _) async {
    if (didPop) {
      return;
    }

    settingsHandler.hatedTags = settingsHandler.cleanTagsList(hatedList.map(Tag.new).toList());
    settingsHandler.lovedTags = settingsHandler.cleanTagsList(lovedList.map(Tag.new).toList());
    settingsHandler.filterHated = filterHated;
    settingsHandler.filterFavourites = filterFavourites;
    settingsHandler.filterSnatched = filterSnatched;
    settingsHandler.filterAi = filterAi;
    final bool result = await settingsHandler.saveSettings(restate: false);
    if (result) {
      Navigator.of(context).pop();
    }
  }

  List<String> getTagsList(String type) {
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
    if (newTag.isEmpty) {
      return;
    }

    final List<String> changedList = getTagsList(type);
    if (changedList.contains(newTag)) {
      duplicateMessage(newTag, type);
    } else {
      changedList.add(newTag);
      changedList.sort(sortTags);
      updateState();
    }
  }

  void editTag(String oldTag, String newTag, String type) {
    if (newTag.isEmpty) {
      return;
    }

    final List<String> changedList = getTagsList(type);
    if (changedList.contains(newTag)) {
      duplicateMessage(newTag, type);
    } else {
      final int index = changedList.indexOf(oldTag);
      changedList[index] = newTag;
      changedList.sort(sortTags);
      updateState();
    }
  }

  void deleteTag(String tag, String type) {
    final List<String> changedList = getTagsList(type);
    changedList.remove(tag);
    changedList.sort(sortTags);
    updateState();
  }

  void duplicateMessage(String tag, String type) {
    FlashElements.showSnackbar(
      context: context,
      title: Text(context.loc.settings.tagsFilters.duplicateTag, style: const TextStyle(fontSize: 20)),
      content: Text(
        context.loc.settings.tagsFilters.alreadyInList(tag: tag, type: type),
        style: const TextStyle(fontSize: 16),
      ),
      leadingIcon: Icons.warning_amber,
      leadingIconColor: Colors.yellow,
      sideColor: Colors.yellow,
    );
  }

  void openAddDialog(String type) {
    SettingsPageOpen(
      context: context,
      asDialog: true,
      page: (_) => TagsFiltersAddDialog(
        tagFilterType: type,
        onAdd: (String newTag) => addTag(newTag, type),
      ),
    ).open();
  }

  void openEditDialog(String tag, String type) {
    SettingsPageOpen(
      context: context,
      asDialog: true,
      page: (_) => TagsFiltersEditDialog(
        tag: tag,
        onEdit: (String newTag) => editTag(tag, newTag, type),
        onDelete: (String tag) => deleteTag(tag, type),
      ),
    ).open();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(context.loc.settings.tagsFilters.title),
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
              Tab(
                text: context.loc.settings.tagsFilters.hated,
                icon: const Icon(
                  CupertinoIcons.eye_slash,
                  color: Colors.red,
                ),
              ),
              Tab(
                text: context.loc.settings.tagsFilters.loved,
                icon: const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
              ),
              Tab(
                text: context.loc.settings.title,
                icon: Icon(
                  Icons.settings,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
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
              filterSnatched: filterSnatched,
              onFilterSnatchedChanged: (bool newValue) {
                filterSnatched = newValue;
                updateState();
              },
              filterAi: filterAi,
              onFilterAiChanged: (bool newValue) {
                filterAi = newValue;
                updateState();
              },
            ),
          ],
        ),
      ),
    );
  }
}
