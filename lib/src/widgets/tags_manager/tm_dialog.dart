import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/tags_manager/tm_add_dialog.dart';
import 'package:lolisnatcher/src/widgets/tags_manager/tm_list.dart';
import 'package:lolisnatcher/src/widgets/tags_manager/tm_list_bottom.dart';
import 'package:lolisnatcher/src/widgets/tags_manager/tm_list_filter.dart';
import 'package:lolisnatcher/src/widgets/tags_manager/tm_list_item.dart';
import 'package:lolisnatcher/src/widgets/tags_manager/tm_list_item_dialog.dart';
import 'package:lolisnatcher/src/data/tag.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';

class TagsManagerDialog extends StatefulWidget {
  const TagsManagerDialog({Key? key}) : super(key: key);

  @override
  State<TagsManagerDialog> createState() => _TagsManagerDialogState();
}

class _TagsManagerDialogState extends State<TagsManagerDialog> {
  final TagHandler tagHandler = TagHandler.instance;

  List<Tag> tags = [], filteredTags = [], selected = [];
  final TextEditingController filterSearchController = TextEditingController();

  bool get isFilterActive => filteredTags.length != tags.length;
  bool get areThereErrors => filteredTags.isEmpty;

  @override
  void initState() {
    super.initState();
    getTags();
  }

  void getTags() {
    tags = tagHandler.tagMap.values.toList();

    filteredTags = tags;
    filterTags();
  }

  void deleteItem(Tag item) {
    tagHandler.removeTag(item);
    tags = tags.where((el) => el != item).toList();
    filterTags();
    return;
  }

  Future<void> saveTags() async {
    await tagHandler.saveTags();
    setState(() {});
    return;
  }

  void filterTags() {
    // logic of this IF repeats, because we don't need to call array filtering every time when there are no filters enabled
    if (filterSearchController.text != '') {
      filteredTags = tags.where((t) {
        final String filter = filterSearchController.text.toLowerCase();
        final bool textFilter = t.fullString.toLowerCase().contains(filter);
        final bool typeFilter = t.tagType.toString().toLowerCase().contains(filter);
        return textFilter || typeFilter;
      }).toList();
    } else {
      filteredTags = [...tags];
    }
    filteredTags.sort(compareTags);
    setState(() {});
  }

  int compareTags(Tag a, Tag b) {
    if (a.tagType == b.tagType) {
      return a.fullString.compareTo(b.fullString);
    } else {
      return a.tagType.index.compareTo(b.tagType.index);
    }
  }

  void showItemActions(Widget row, Tag item) {
    showDialog(
      context: context,
      builder: (context) {
        return TagsManagerListItemDialog(
          tag: item,
          onDelete: () {
            selected.removeWhere((e) => e == item);
            deleteItem(item);
            Navigator.of(context).pop(true);
          },
          onChangedType: (TagType? newValue) {
            if (newValue != null && item.tagType != newValue) {
              item.tagType = newValue;
              filterTags();
            }
          },
        );
      },
    );
  }

  void showAddDialog() async {
    final Tag? tag = await showDialog(
      context: context,
      builder: (context) {
        return const TagsManagerAddDialog();
      },
    );

    if (tag != null && !tagHandler.hasTag(tag.fullString)) {
      tagHandler.putTag(tag);
      tags.add(tag);
      filterTags();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SettingsPageDialog(
      title: const Text('Tags'),
      fab: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: FloatingActionButton(
          onPressed: showAddDialog,
          child: const Icon(Icons.add),
        ),
      ),
      content: Column(
        children: [
          TagsManagerListFilter(
            title: "Filter Tags (${filterSearchController.text.isEmpty ? tags.length : '${filteredTags.length}/${tags.length}'})",
            controller: filterSearchController,
            onChanged: (String? input) {
              filterTags();
            },
          ),
          //
          if (areThereErrors)
            Center(
              child: Column(
                children: [
                  if (filteredTags.isEmpty) const Text('Nothing found'),
                ],
              ),
            ),
          //
          if (!areThereErrors)
            TagsManagerList(
              // TODO how to reset/rerender current list of items when it changes?
              key: Key('tags-list-#${filteredTags.length}'),
              tags: filteredTags,
              selected: selected,
              onRefresh: () async {
                getTags();
              },
              onTap: (Tag tag) {
                showItemActions(
                  TagsManagerListItem(tag: tag),
                  tag,
                );
              },
              onSelect: (bool? value, Tag tag) {
                if (value == true) {
                  selected.add(tag);
                } else {
                  selected.removeWhere((e) => e == tag);
                }
                setState(() {});
              },
            ),
          //
          if (!areThereErrors)
            TagsManagerListBottom(
              selected: selected,
              isFilterActive: isFilterActive,
              onSelectAll: () {
                // create new list through spread to avoid modifying the original list
                selected = [...filteredTags];
                setState(() {});
              },
              onDeselectAll: () {
                selected.clear();
                setState(() {});
              },
              onDelete: () async {
                for (int i = 0; i < selected.length; i++) {
                  deleteItem(selected[i]);
                }
                selected.clear();
                getTags();
                // exit the confirmation dialog
                Navigator.of(context).pop();
              },
            ),
        ],
      ),
    );
  }
}
