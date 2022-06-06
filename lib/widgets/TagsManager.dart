import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:huge_listview/huge_listview.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:LoliSnatcher/src/utils/tools.dart';
import 'package:LoliSnatcher/src/handlers/search_handler.dart';
import 'package:LoliSnatcher/widgets/CachedFavicon.dart';
import 'package:LoliSnatcher/widgets/CancelButton.dart';
import 'package:LoliSnatcher/widgets/CustomScrollBarThumb.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:LoliSnatcher/widgets/MarqueeText.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:LoliSnatcher/widgets/DesktopScrollWrap.dart';
import 'package:LoliSnatcher/src/data/Tag.dart';
import 'package:LoliSnatcher/src/handlers/tag_handler.dart';

class TagsManager extends StatefulWidget {
  const TagsManager({Key? key}) : super(key: key);

  @override
  State<TagsManager> createState() => _TagsManagerState();
}

class _TagsManagerState extends State<TagsManager> {
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

  void deleteEntry(Tag entry) {
    tagHandler.removeTag(entry);
    tags = tags.where((el) => el != entry).toList();
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
        final bool textFilter = t.displayString.toLowerCase().contains(filter) || t.fullString.toLowerCase().contains(filter);
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
      return a.displayString.compareTo(b.displayString);
    } else {
      return a.tagType.index.compareTo(b.tagType.index);
    }
  }

  void showEntryActions(Widget row, Tag entry) {
    showDialog(
      context: context,
      builder: (context) {
        return TMListItemDialog(
          tag: entry,
          onDelete: () {
            selected.removeWhere((e) => e == entry);
            deleteEntry(entry);
            Navigator.of(context).pop(true);
          },
          onChangedType: (TagType? newValue) {
            if (newValue != null && entry.tagType != newValue) {
              entry.tagType = newValue;
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
        return const TMAddDialog();
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
          TMListFilter(
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
            TMList(
              // TODO how to reset/rerender current list of items when it changes?
              key: Key('tags-list-#${filteredTags.length}'),
              tags: filteredTags,
              selected: selected,
              onRefresh: () async {
                getTags();
              },
              onTap: (Tag tag) {
                showEntryActions(
                  TMListItem(tag: tag),
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
            TMListBottom(
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
                  deleteEntry(selected[i]);
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

class TMList extends StatelessWidget {
  const TMList({
    Key? key,
    required this.tags,
    required this.selected,
    required this.onRefresh,
    required this.onTap,
    required this.onSelect,
  }) : super(key: key);

  final List<Tag> tags;
  final List<Tag> selected;
  final Future<void> Function() onRefresh;
  final void Function(Tag) onTap;
  final void Function(bool?, Tag) onSelect;

  static const int PAGE_SIZE = 12;

  Future<List<Tag>> _loadPage(int page, int pageSize) async {
    final int start = page * pageSize;
    final int end = start + pageSize;
    final List<Tag> pageTags = tags.sublist(start, min(tags.length, end));

    return pageTags;
  }

  @override
  Widget build(BuildContext context) {
    final ItemScrollController itemScrollController = ItemScrollController();
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          child: SizedBox(
            width: double.maxFinite,
            child: RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              displacement: 80,
              strokeWidth: 4,
              color: Theme.of(context).colorScheme.secondary,
              onRefresh: onRefresh,
              child: HugeListView(
                controller: itemScrollController,
                totalCount: tags.length,
                itemBuilder: (BuildContext context, int index, Tag tag) {
                  // final Tag tag = tags[index];
                  return TMListItem(
                    tag: tag,
                    isSelected: selected.contains(tag),
                    onTap: () {
                      onTap(tag);
                    },
                    onSelect: (bool? value) {
                      onSelect(value, tag);
                    },
                  );
                },
                placeholderBuilder: (BuildContext context, int index) {
                  return const LinearProgressIndicator();
                },
                // errorBuilder: (BuildContext context, dynamic e) {
                //   return const Center(
                //     child: Text('Error loading tags'),
                //   );
                // },
                pageFuture: (page) => _loadPage(page, TMList.PAGE_SIZE),
                pageSize: TMList.PAGE_SIZE,
                thumbBuilder: (Color backgroundColor, Color drawColor, double height, int index) {
                  Tag tag = tags[index];
                  return CustomScrollBarThumb(
                    backgroundColor: backgroundColor,
                    drawColor: drawColor,
                    height: height * 1.2, // 48
                    title: '${tag.tagType.toString()} [${tag.fullString[0]}]',
                  );
                },
                thumbBackgroundColor: Theme.of(context).colorScheme.surface,
                thumbDrawColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                startIndex: 0,
              ),
            ),
          ),
        ),
      ),
    );

    final ScrollController scrollController = ScrollController();
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          child: SizedBox(
            width: double.maxFinite,
            child: Scrollbar(
              controller: scrollController,
              child: RefreshIndicator(
                triggerMode: RefreshIndicatorTriggerMode.anywhere,
                displacement: 80,
                strokeWidth: 4,
                color: Theme.of(context).colorScheme.secondary,
                onRefresh: onRefresh,
                child: DesktopScrollWrap(
                  controller: scrollController,
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    controller: scrollController,
                    physics: getListPhysics(), // const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    shrinkWrap: false,
                    itemCount: tags.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) => Row(
                      key: Key(index.toString()),
                      children: <Widget>[
                        Expanded(
                          child: TMListItem(
                            tag: tags[index],
                            isSelected: selected.contains(tags[index]),
                            onSelect: (bool? value) => onSelect(value, tags[index]),
                            onTap: () {
                              onTap(tags[index]);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TMListItem extends StatelessWidget {
  const TMListItem({
    Key? key,
    required this.tag,
    this.isSelected = false,
    this.onSelect,
    this.onTap,
  }) : super(key: key);

  final Tag tag;
  final bool isSelected;
  final void Function(bool?)? onSelect;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(color: Colors.grey),
        ),
        onTap: onTap,
        minLeadingWidth: 20,
        leading: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: tag.tagType.getColour(),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (onTap != null)
              Checkbox(
                value: isSelected,
                onChanged: onSelect,
              ),
          ],
        ),
        title: MarqueeText(
          key: ValueKey(tag.fullString),
          text: tag.fullString,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          isExpanded: false,
        ),
        subtitle: Text(tag.tagType.toString()),
      ),
    );
  }
}

class TMListFilter extends StatelessWidget {
  const TMListFilter({
    Key? key,
    required this.title,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  final String title;
  final TextEditingController controller;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: SettingsTextInput(
              onlyInput: true,
              controller: controller,
              onChanged: onChanged,
              title: title,
              hintText: title,
              inputType: TextInputType.text,
              clearable: true,
              margin: const EdgeInsets.fromLTRB(5, 8, 5, 5),
            ),
          ),
        ],
      ),
    );
  }
}

class TMListBottom extends StatelessWidget {
  const TMListBottom({
    Key? key,
    required this.selected,
    required this.isFilterActive,
    required this.onSelectAll,
    required this.onDeselectAll,
    required this.onDelete,
  }) : super(key: key);

  final List<Tag> selected;
  final bool isFilterActive;
  final void Function() onSelectAll;
  final void Function() onDeselectAll;
  final Future<void> Function() onDelete;

  @override
  Widget build(BuildContext context) {
    if (selected.isEmpty) {
      if (isFilterActive) {
        return Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.select_all),
                  label: const Text("Select all"),
                  onPressed: onSelectAll,
                ),
              ),
            ),
          ],
        );
      } else {
        return const SizedBox();
      }
    }

    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: ElevatedButton.icon(
              label: Text("Delete ${selected.length} ${Tools.pluralize('tag', selected.length)}"),
              icon: const Icon(Icons.delete_forever),
              onPressed: () {
                if (selected.isEmpty) {
                  return;
                }

                final Widget deleteDialog = SettingsDialog(
                  title: const Text("Delete Tags"),
                  scrollable: false,
                  content: SizedBox(
                    width: double.maxFinite,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Text('Are you sure you want to delete ${selected.length} ${Tools.pluralize('tag', selected.length)}?'),
                        const SizedBox(height: 10),
                        ...selected.map((Tag entry) {
                          return TMListItem(tag: entry);
                        }).toList(),
                      ],
                    ),
                  ),
                  actionButtons: [
                    const CancelButton(),
                    ElevatedButton.icon(
                      label: const Text("Delete"),
                      icon: const Icon(Icons.delete_forever),
                      onPressed: onDelete,
                    ),
                  ],
                );

                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) => deleteDialog,
                );
              },
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.border_clear),
            label: const Text("Clear selection"),
            onPressed: onDeselectAll,
          ),
        ),
      ],
    );
  }
}

class TMListItemDialog extends StatefulWidget {
  const TMListItemDialog({
    Key? key,
    required this.tag,
    required this.onDelete,
    required this.onChangedType,
  }) : super(key: key);

  final Tag tag;
  final void Function() onDelete;
  final void Function(TagType?) onChangedType;

  @override
  State<TMListItemDialog> createState() => _TMListItemDialogState();
}

class _TMListItemDialogState extends State<TMListItemDialog> {
  void _onChangedType(TagType? value) {
    widget.onChangedType(value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SettingsDialog(
      contentItems: <Widget>[
        SizedBox(width: double.maxFinite, child: TMListItem(tag: widget.tag)),
        //
        const SizedBox(height: 10),
        SettingsDropdown(
          value: widget.tag.tagType,
          items: TagType.values,
          onChanged: _onChangedType,
          title: 'Type',
          drawBottomBorder: false,
        ),
        //
        const SizedBox(height: 10),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          onTap: () {
            SearchHandler.instance.addTabByString(widget.tag.fullString);

            FlashElements.showSnackbar(
              context: context,
              duration: const Duration(seconds: 2),
              title: const Text("Added a tab!", style: TextStyle(fontSize: 20)),
              content: Text(widget.tag.fullString, style: const TextStyle(fontSize: 16)),
              leadingIcon: Icons.copy,
              sideColor: Colors.green,
            );
            Navigator.of(context).pop(true);
          },
          leading: const Icon(Icons.add_circle_outline),
          trailing: CachedFavicon(SearchHandler.instance.currentBooruHandler.booru.faviconURL ?? ""),
          title: const Text('Add a tab'),
        ),
        // 
        const SizedBox(height: 10),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          onTap: () {
            Clipboard.setData(ClipboardData(text: widget.tag.fullString));
            FlashElements.showSnackbar(
              context: context,
              duration: const Duration(seconds: 2),
              title: const Text("Copied to clipboard!", style: TextStyle(fontSize: 20)),
              content: Text(widget.tag.fullString, style: const TextStyle(fontSize: 16)),
              leadingIcon: Icons.copy,
              sideColor: Colors.green,
            );
            Navigator.of(context).pop(true);
          },
          leading: const Icon(Icons.copy),
          title: const Text('Copy'),
        ),
        //
        const SizedBox(height: 10),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          onTap: widget.onDelete,
          leading: Icon(Icons.delete_forever, color: Theme.of(context).errorColor),
          title: const Text('Delete'),
        ),
      ],
    );
  }
}

class TMAddDialog extends StatefulWidget {
  const TMAddDialog({Key? key}) : super(key: key);

  @override
  State<TMAddDialog> createState() => _TMAddDialogState();
}

class _TMAddDialogState extends State<TMAddDialog> {
  final TextEditingController _controller = TextEditingController();
  TagType _type = TagType.none;

  @override
  Widget build(BuildContext context) {
    return SettingsDialog(
      title: const Text("Add Tag"),
      contentItems: <Widget>[
        SettingsTextInput(
          controller: _controller,
          title: "Name",
          drawBottomBorder: false,
        ),
        SettingsDropdown(
          value: _type,
          items: TagType.values,
          onChanged: (TagType? newValue) {
            setState(() {
              _type = newValue!;
            });
          },
          title: 'Type',
          drawBottomBorder: false,
        ),
      ],
      actionButtons: [
        const CancelButton(returnData: null),
        ElevatedButton.icon(
          label: const Text("Add"),
          icon: const Icon(Icons.add),
          onPressed: () {
            final String tagName = _controller.text.trim();
            if (tagName.isNotEmpty) {
              Navigator.of(context).pop(Tag(
                tagName,
                tagName,
                _type,
              ));
            } else {
              Navigator.of(context).pop(null);
            }
          },
        ),
      ],
    );
  }
}
