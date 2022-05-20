import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/widgets/MarqueeText.dart';
import 'package:LoliSnatcher/Tools.dart';
import 'package:LoliSnatcher/widgets/CachedFavicon.dart';
import 'package:LoliSnatcher/widgets/CancelButton.dart';
import 'package:LoliSnatcher/widgets/DesktopScrollWrap.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:LoliSnatcher/widgets/TabBoxMoveDialog.dart';

class TabBoxDialog extends StatefulWidget {
  const TabBoxDialog({Key? key}) : super(key: key);

  @override
  State<TabBoxDialog> createState() => _TabBoxDialogState();
}

class _TabBoxDialogState extends State<TabBoxDialog> {
  final SearchHandler searchHandler = SearchHandler.instance;

  List<SearchGlobal> tabs = [], filteredTabs = [], selectedTabs = [];
  final AutoScrollController scrollController = AutoScrollController();
  final TextEditingController filterController = TextEditingController();
  bool? sortTabs;

  bool get isFilterActive => filteredTabs.length != searchHandler.total;

  @override
  void initState() {
    super.initState();
    tabs = searchHandler.list;
    filteredTabs = tabs;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      jumpToCurrent();
    });
  }

  void getTabs() {
    tabs = searchHandler.list;
    filteredTabs = tabs;
    filterTabs();
  }

  void jumpToCurrent() async {
    if (scrollController.hasClients) {
      final int filteredIndex = filteredTabs.indexOf(searchHandler.currentTab);
      if (filteredIndex == -1) {
        return;
      }

      // jump close to selected tab
      scrollController.jumpTo(
        filteredIndex * (scrollController.position.maxScrollExtent / filteredTabs.length),
      );
      await Future.delayed(const Duration(milliseconds: 50));
      // then correct the position (otherwise duration is ignored and it scrolls slower than intended)
      await scrollController.scrollToIndex(filteredIndex, duration: const Duration(milliseconds: 10), preferPosition: AutoScrollPosition.begin);
    }
  }

  void filterTabs() {
    if (filterController.text.isNotEmpty) {
      filteredTabs = [...tabs].where((t) {
        String filterText = filterController.text.toLowerCase();
        bool doTagsMatch = t.tags.toLowerCase().contains(filterText);
        String booruText = 'booru:${t.selectedBooru.value.name?.toLowerCase() ?? ""}';
        bool doBooruMatch = booruText.contains(filterText);
        bool textFilter = doTagsMatch || doBooruMatch;
        return textFilter;
      }).toList();
    } else {
      filteredTabs = [...tabs];
    }

    if (sortTabs != null) {
      filteredTabs.sort(
          (a, b) => sortTabs == true ? a.tags.toLowerCase().compareTo(b.tags.toLowerCase()) : b.tags.toLowerCase().compareTo(a.tags.toLowerCase()));
    }

    setState(() {});
  }

  void showTabEntryActions(Widget row, SearchGlobal data, int index) {
    showDialog(
      context: context,
      builder: (context) {
        final int tabIndex = searchHandler.list.indexOf(data);

        final bool isIndexFromFilter = tabIndex != index;
        final String indexText = isIndexFromFilter ? "#${index + 1} in filtered list, #${tabIndex + 1} in full list" : "#${tabIndex + 1}";

        return SettingsDialog(
          contentItems: <Widget>[
            SizedBox(width: double.maxFinite, child: row),
            // 
            const SizedBox(height: 10),
            Text(indexText, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            // 
            const SizedBox(height: 20),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              onTap: () async {
                if (tabIndex != -1) {
                  searchHandler.changeTabIndex(tabIndex);
                }
                Navigator.of(context).pop(true);
                Navigator.of(context).pop(true);
              },
              leading: const Icon(Icons.menu_open),
              title: const Text('Open'),
            ),
            // 
            const SizedBox(height: 10),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              onTap: () async {
                Clipboard.setData(ClipboardData(text: data.tags));
                FlashElements.showSnackbar(
                  context: context,
                  duration: const Duration(seconds: 2),
                  title: const Text("Copied to clipboard!", style: TextStyle(fontSize: 20)),
                  content: Text(data.tags, style: const TextStyle(fontSize: 16)),
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
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (BuildContext context) => TabBoxMoveDialog(
                    row: buildEntry(index, false, true),
                    index: tabIndex,
                    indexText: indexText,
                  ),
                );
                getTabs();
              },
              leading: const Icon(Icons.move_down_sharp),
              title: const Text('Move'),
            ),
            // 
            const SizedBox(height: 10),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              onTap: () {
                if (tabIndex != -1) {
                  searchHandler.removeTabAt(tabIndex: tabIndex);
                }
                getTabs();
                Navigator.of(context).pop(true);
              },
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text('Remove'),
            ),
          ],
        );
      },
    );
  }

  Widget listBuild() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        child: SizedBox(
          width: double.maxFinite,
          child: Scrollbar(
            controller: scrollController,
            interactive: true,
            thickness: 8,
            radius: const Radius.circular(10),
            thumbVisibility: true,
            child: DesktopScrollWrap(
              controller: scrollController,
              child: ReorderableListView.builder(
                onReorder: (oldIndex, newIndex) {
                  searchHandler.moveTab(oldIndex, newIndex);
                  getTabs();
                },
                buildDefaultDragHandles: !isFilterActive,
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                scrollController: scrollController,
                physics: getListPhysics(), // const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                shrinkWrap: false,
                itemCount: filteredTabs.length,
                scrollDirection: Axis.vertical,
                itemBuilder: listEntryBuild,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget listEntryBuild(BuildContext context, int index) {
    return AutoScrollTag(
      highlightColor: Colors.red,
      key: ValueKey(index),
      controller: scrollController,
      index: index,
      child: buildEntry(index, true, true),
    );
  }

  Widget buildEntry(int index, bool isActive, bool fromFiltered) {
    final SearchGlobal tab = fromFiltered ? filteredTabs[index] : searchHandler.list[index];
    final bool isNotEmptyBooru = tab.selectedBooru.value.faviconURL != null;
    final bool isCurrent = searchHandler.currentTab == tab;

    final bool showCheckbox = isActive && !isCurrent;
    final bool isSelected = selectedTabs.contains(tab);

    // print(value.tags);
    final int totalCount = tab.booruHandler.totalCount.value;
    final String totalCountText = (totalCount > 0) ? " ($totalCount)" : "";
    final String tagText = "${tab.tags == "" ? "[No Tags]" : tab.tags}$totalCountText";

    final Widget checkbox = Checkbox(
      value: isSelected,
      fillColor: MaterialStateProperty.resolveWith((states) {
        if(states.contains(MaterialState.selected)) {
          return Theme.of(context).colorScheme.secondary;
        } else if(states.contains(MaterialState.hovered)) {
          return Colors.grey;
        } else {
          return Colors.grey;
        }
      }),
      onChanged: (bool? newValue) {
        if(isSelected) {
          selectedTabs.removeWhere((item) => item == tab);
        } else {
          selectedTabs.add(tab);
        }
        setState(() { });
      },
    );

    final Widget favicon = isNotEmptyBooru
      ? (tab.selectedBooru.value.type == "Favourites"
          ? const Icon(Icons.favorite, color: Colors.red, size: 18)
          : CachedFavicon(tab.selectedBooru.value.faviconURL!))
      : const Icon(CupertinoIcons.question, size: 18);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            color: isCurrent ? Theme.of(context).colorScheme.secondary : Colors.grey,
            style: BorderStyle.solid,
          ),
        ),
        onTap: isActive ? () => showTabEntryActions(buildEntry(index, false, true), tab, index) : null,
        minLeadingWidth: 20,
        leading: favicon,
        trailing: showCheckbox ? checkbox : null,
        title: MarqueeText(
          key: ValueKey(tagText),
          text: tagText,
          fontSize: 16,
          color: tab.tags == "" ? Colors.grey : null,
          isExpanded: false,
        ),
        subtitle: Text(isNotEmptyBooru ? tab.selectedBooru.value.name! : ""),
      ),
    );
  }

  Widget filterBuild() {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                child: SettingsTextInput(
                  onlyInput: true,
                  controller: filterController,
                  onChanged: (String? input) {
                    filterTabs();
                  },
                  title: "Filter Tabs (${filterController.text.isEmpty ? tabs.length : '${filteredTabs.length}/${tabs.length}'})",
                  hintText: "Filter Tabs (${filterController.text.isEmpty ? tabs.length : '${filteredTabs.length}/${tabs.length}'})",
                  inputType: TextInputType.text,
                  clearable: true,
                  drawBottomBorder: false,
                  margin: const EdgeInsets.fromLTRB(2, 8, 2, 5),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: IconButton(
                  icon: const Icon(Icons.subdirectory_arrow_left_outlined),
                  onPressed: () {
                    jumpToCurrent();
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Transform(
                  alignment: Alignment.center,
                  transform: sortTabs == true ? Matrix4.rotationX(pi) : Matrix4.rotationX(0),
                  child: IconButton(
                    icon: Icon((sortTabs == true || sortTabs == false) ? Icons.sort : Icons.sort_by_alpha),
                    onPressed: () {
                      if (sortTabs == true) {
                        sortTabs = false;
                      } else if (sortTabs == false) {
                        sortTabs = null;
                      } else {
                        sortTabs = true;
                      }
                      filterTabs();
                    },
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget selectedActionsBuild() {
    if(selectedTabs.isEmpty) {
      if(isFilterActive) {
        return Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: ElevatedButton(
                  child: const Text("Select all"),
                  onPressed: () {
                    selectedTabs = filteredTabs.where((element) => element != searchHandler.currentTab).toList();
                    setState(() { });
                  },
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
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: ElevatedButton(
              child: Text("Delete ${selectedTabs.length} selected ${Tools.pluralize('tab', selectedTabs.length)}"),
              onPressed: () {
                if(selectedTabs.isEmpty) {
                  return;
                }

                final Widget deleteDialog = SettingsDialog(
                  title: const Text("Delete Tabs"),
                  scrollable: false,
                  content: SizedBox(
                    width: double.maxFinite,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Text('Are you sure you want to delete ${selectedTabs.length} ${Tools.pluralize('tab', selectedTabs.length)}?'),
                        const SizedBox(height: 10),
                        ...selectedTabs.map((SearchGlobal tab) {
                          final int index = searchHandler.list.indexOf(tab);
                          return buildEntry(index, false, false);
                        }).toList(),
                      ],
                    ),
                  ),
                  actionButtons: [
                    const CancelButton(),
                    ElevatedButton.icon(
                      label: const Text("Delete"),
                      icon: Icon(Icons.delete_forever, color: Theme.of(context).colorScheme.error),
                      onPressed: () {
                        for(int i = 0; i < selectedTabs.length; i++) {
                          final int index = searchHandler.list.indexOf(selectedTabs[i]);
                          searchHandler.removeTabAt(tabIndex: index);
                        }
                        selectedTabs.clear();
                        filterTabs();
                        Navigator.of(context).pop();
                      },
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
          child: Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: ElevatedButton(
              child: const Text("Clear selection"),
              onPressed: () {
                selectedTabs.clear();
                setState(() { });
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SettingsPageDialog(
      title: const Text("Tabs"),
      content: Column(
        children: [
          filterBuild(),
          Expanded(child: listBuild()),
          selectedActionsBuild(),
        ],
      ),
    );
  }
}