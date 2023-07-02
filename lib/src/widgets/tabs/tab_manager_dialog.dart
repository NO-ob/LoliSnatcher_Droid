import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/marquee_text.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/desktop/desktop_scroll_wrap.dart';
import 'package:lolisnatcher/src/widgets/image/favicon.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_move_dialog.dart';

class TabManagerDialog extends StatefulWidget {
  const TabManagerDialog({Key? key}) : super(key: key);

  @override
  State<TabManagerDialog> createState() => _TabManagerDialogState();
}

class _TabManagerDialogState extends State<TabManagerDialog> {
  final SearchHandler searchHandler = SearchHandler.instance;

  List<SearchTab> tabs = [], filteredTabs = [], selectedTabs = [];
  late final AutoScrollController scrollController;
  final TextEditingController filterController = TextEditingController();
  bool? sortTabs;
  bool? loadedFilter;
  Booru? booruFilter;
  bool duplicateFilter = false;
  bool firstBuild = true;

  bool get isFilterActive => filteredTabs.length != searchHandler.total || sortTabs != null;

  @override
  void initState() {
    super.initState();
    getTabs();

    scrollController = AutoScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await jumpToCurrent();
      firstBuild = false;
      setState(() {});
      WidgetsBinding.instance.addPostFrameCallback((_) {
        jumpToCurrent();
      });
    });
  }

  void getTabs() {
    tabs = searchHandler.list;
    filteredTabs = tabs;
    filterTabs();
  }

  Future<void> jumpToCurrent() async {
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
      await scrollController.scrollToIndex(filteredIndex, duration: const Duration(milliseconds: 50), preferPosition: AutoScrollPosition.begin);
    }
  }

  void filterTabs() {
    filteredTabs = [...tabs];

    if (booruFilter != null) {
      filteredTabs = filteredTabs.where((t) => t.selectedBooru.value == booruFilter).toList();
    }

    if (loadedFilter != null) {
      filteredTabs =
          filteredTabs.where((t) => loadedFilter == true ? t.booruHandler.filteredFetched.isNotEmpty : t.booruHandler.filteredFetched.isEmpty).toList();
    }

    if (duplicateFilter) {
      // tabs where booru and tags are the same
      filteredTabs = filteredTabs.where((tab) {
        final List<SearchTab> sameBooru = filteredTabs.where((t) => t.selectedBooru.value == tab.selectedBooru.value).toList();
        final List<SearchTab> sameTags = sameBooru.where((t) => t.tags == tab.tags).toList();
        return sameTags.length > 1;
      }).toList();
    }

    if (filterController.text.isNotEmpty) {
      filteredTabs = filteredTabs.where((t) {
        String filterText = filterController.text.toLowerCase().trim();
        return t.tags.toLowerCase().contains(filterText);
      }).toList();
    }

    if (sortTabs != null) {
      filteredTabs.sort(
        (a, b) => sortTabs == true ? a.tags.toLowerCase().compareTo(b.tags.toLowerCase()) : b.tags.toLowerCase().compareTo(a.tags.toLowerCase()),
      );
    }

    setState(() {});
  }

  void showTabEntryActions(Widget row, SearchTab data, int index) {
    showDialog(
      context: context,
      builder: (context) {
        final int tabIndex = searchHandler.list.indexOf(data);

        return SettingsDialog(
          contentItems: <Widget>[
            SizedBox(width: double.maxFinite, child: row),
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
                await Clipboard.setData(ClipboardData(text: data.tags));
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
                  builder: (BuildContext context) => TabMoveDialog(
                    row: buildEntry(index, false, true),
                    index: tabIndex,
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
              leading: const Icon(Icons.delete_forever, color: Colors.red),
              title: const Text('Remove'),
            ),
          ],
        );
      },
    );
  }

  Widget listBuild() {
    if (filteredTabs.isEmpty) {
      return const Center(child: Text('No tabs found'));
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        child: SizedBox(
          width: double.maxFinite,
          child: Scrollbar(
            controller: scrollController,
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
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: firstBuild ? const SizedBox(height: 72, width: double.maxFinite, child: Card()) : buildEntry(index, true, true),
      ),
    );
  }

  Widget buildEntry(int index, bool isActive, bool fromFiltered) {
    final SearchTab tab = fromFiltered ? filteredTabs[index] : searchHandler.list[index];
    final bool isNotEmptyBooru = tab.selectedBooru.value.faviconURL != null;
    final bool isCurrent = searchHandler.currentTab == tab;

    final bool showCheckbox = isActive && !isCurrent;
    final bool isSelected = selectedTabs.contains(tab);

    // print(value.tags);
    final int totalCount = tab.booruHandler.totalCount.value;
    final String totalCountText = (totalCount > 0) ? " ($totalCount)" : "";
    final String tagText = "${tab.tags == "" ? "[No Tags]" : tab.tags}$totalCountText";

    final bool hasItems = tab.booruHandler.filteredFetched.isNotEmpty;

    final String? givenIndexText = isFilterActive ? "${index + 1}" : null;
    final String tabIndexText = "${searchHandler.list.indexOf(tab) + 1}";

    final Widget checkbox = Checkbox(
      value: isSelected,
      onChanged: (bool? newValue) {
        if (isSelected) {
          selectedTabs.removeWhere((item) => item == tab);
        } else {
          selectedTabs.add(tab);
        }
        setState(() {});
      },
    );

    final Widget favicon = isNotEmptyBooru
        ? (tab.selectedBooru.value.type == "Favourites" ? const Icon(Icons.favorite, color: Colors.red, size: 18) : Favicon(tab.selectedBooru.value))
        : const Icon(CupertinoIcons.question, size: 18);

    return Card(
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
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            favicon,
            Text(
              tabIndexText,
              style: const TextStyle(fontSize: 10),
            ),
            if (givenIndexText != null && givenIndexText != '0')
              Text(
                givenIndexText,
                style: const TextStyle(fontSize: 10),
              ),
          ],
        ),
        trailing: showCheckbox ? checkbox : null,
        title: MarqueeText(
          key: ValueKey(tagText),
          text: tagText,
          fontSize: 16,
          fontStyle: hasItems ? FontStyle.normal : FontStyle.italic,
          color: tab.tags == "" ? Colors.grey : null,
          isExpanded: false,
        ),
        subtitle: Text(isNotEmptyBooru ? tab.selectedBooru.value.name! : ""),
      ),
    );
  }

  int get filtersCount {
    int count = 0;
    if (loadedFilter != null) {
      count++;
    }
    if (booruFilter != null) {
      count++;
    }
    if (duplicateFilter) {
      count++;
    }
    return count;
  }

  void openFiltersDialog() async {
    final String? result = await SettingsPageOpen(
      context: context,
      asBottomSheet: true,
      page: () => TabManagerFiltersDialog(
        loadedFilter: loadedFilter,
        loadedFilterChanged: (bool? newValue) {
          loadedFilter = newValue;
        },
        booruFilter: booruFilter,
        booruFilterChanged: (Booru? newValue) {
          booruFilter = newValue;
        },
        duplicateFilter: duplicateFilter,
        duplicateFilterChanged: (bool newValue) {
          duplicateFilter = newValue;
        },
      ),
    ).open();

    if (result == 'apply') {
      filterTabs();
    } else if (result == 'clear') {
      loadedFilter = null;
      booruFilter = null;
      duplicateFilter = false;
      filterTabs();
    }
  }

  Widget filterBuild() {
    final String filterText = "Filter Tabs (${!isFilterActive ? tabs.length : '${filteredTabs.length}/${tabs.length}'})";

    return Container(
      margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: SettingsTextInput(
              onlyInput: true,
              controller: filterController,
              onChanged: (String? input) {
                filterTabs();
              },
              title: filterText,
              hintText: 'Input tags to filter tabs',
              inputType: TextInputType.text,
              clearable: true,
              drawBottomBorder: false,
              margin: const EdgeInsets.fromLTRB(2, 8, 2, 5),
            ),
          ),
          const SizedBox(width: 10),
          Stack(
            children: [
              IconButton(
                iconSize: 24,
                onPressed: openFiltersDialog,
                icon: const Icon(CupertinoIcons.slider_horizontal_3),
              ),
              if (filtersCount > 0)
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: openFiltersDialog,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                      child: Text(
                        filtersCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> filterActions() {
    return [
      IconButton(
        icon: const Icon(Icons.subdirectory_arrow_left_outlined),
        tooltip: 'Scroll to current tab',
        onPressed: () async {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            firstBuild = true;
            await jumpToCurrent();
            firstBuild = false;
            setState(() {});
            WidgetsBinding.instance.addPostFrameCallback((_) {
              jumpToCurrent();
            });
          });
        },
      ),
      Transform(
        alignment: Alignment.center,
        transform: sortTabs == true ? Matrix4.rotationX(pi) : Matrix4.rotationX(0),
        child: IconButton(
          icon: Icon((sortTabs == true || sortTabs == false) ? Icons.sort : Icons.sort_by_alpha),
          tooltip: 'Sort tabs',
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
      IconButton(
        icon: const Icon(Icons.help_center_outlined),
        tooltip: 'Help',
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return SettingsDialog(
                title: const Text('Tabs Manager'),
                contentItems: <Widget>[
                  const Row(
                    children: [
                      Icon(Icons.subdirectory_arrow_left_outlined),
                      SizedBox(width: 10),
                      Text('Scroll to current tab'),
                    ],
                  ),
                  const Divider(),
                  const Row(
                    children: [
                      Icon(CupertinoIcons.slider_horizontal_3),
                      SizedBox(width: 10),
                      Expanded(child: Text('Filter tabs by booru, loaded state, duplicates, etc.')),
                    ],
                  ),
                  const Divider(),
                  const Row(
                    children: [
                      Icon(Icons.sort_by_alpha),
                      SizedBox(width: 10),
                      Text('Default tabs order'),
                    ],
                  ),
                  Row(
                    children: [
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationX(pi),
                        child: const Icon(Icons.sort),
                      ),
                      const SizedBox(width: 10),
                      const Text('Sort alphabetically'),
                    ],
                  ),
                  Row(
                    children: [
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationX(0),
                        child: const Icon(Icons.sort),
                      ),
                      const SizedBox(width: 10),
                      const Text('Sort alphabetically (reversed)'),
                    ],
                  ),
                  const Divider(),
                  const Row(
                    children: [
                      Icon(Icons.expand),
                      SizedBox(width: 10),
                      Text('Long press on a tab to move it'),
                    ],
                  ),
                  const Divider(),
                  const Text('Numbers under the favicon:'),
                  const Text('First number - tab index in default list order'),
                  const Text('Second number - tab index in current list order, appears when filtering/sorting is active'),
                  const Divider(),
                  const Text('Special filters:'),
                  const Text('"loaded" - show tabs which have loaded items'),
                  const Text('"unloaded" - show tabs which are not loaded and/or have zero items'),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(text: 'Unloaded tabs have '),
                        TextSpan(
                          text: 'italic',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        TextSpan(text: ' text'),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    ];
  }

  Widget selectedActionsBuild() {
    if (selectedTabs.isEmpty) {
      if (filteredTabs.isNotEmpty) {
        return Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.select_all),
                  label: const Text("Select all"),
                  onPressed: () {
                    selectedTabs = filteredTabs.where((element) => element != searchHandler.currentTab).toList();
                    setState(() {});
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

    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.delete_forever),
              label: Text("Delete ${selectedTabs.length} ${Tools.pluralize('tab', selectedTabs.length)}"),
              onPressed: () {
                if (selectedTabs.isEmpty) {
                  return;
                }

                // sort selected tabs in order of appearance in the list instead of order of selection
                selectedTabs.sort((a, b) => searchHandler.list.indexOf(a).compareTo(searchHandler.list.indexOf(b)));

                final Widget deleteDialog = SettingsDialog(
                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Delete Tabs"),
                      Text(
                        'Are you sure you want to delete ${selectedTabs.length} ${Tools.pluralize('tab', selectedTabs.length)}?',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  scrollable: false,
                  content: Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: ListView.builder(
                      clipBehavior: Clip.hardEdge,
                      shrinkWrap: true,
                      itemCount: selectedTabs.length,
                      itemBuilder: (_, index) {
                        final int itemIndex = searchHandler.list.indexOf(selectedTabs[index]);

                        return buildEntry(itemIndex, false, false);
                      },
                    ),
                  ),
                  actionButtons: [
                    const CancelButton(),
                    ElevatedButton.icon(
                      label: const Text("Delete"),
                      icon: const Icon(Icons.delete_forever),
                      onPressed: () {
                        for (int i = 0; i < selectedTabs.length; i++) {
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
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.border_clear),
              label: const Text("Clear selection"),
              onPressed: () {
                selectedTabs.clear();
                setState(() {});
              },
            ),
          ),
        ],
      ),
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
      actions: filterActions(),
    );
  }
}

class TabManagerFiltersDialog extends StatefulWidget {
  const TabManagerFiltersDialog({
    required this.loadedFilter,
    required this.loadedFilterChanged,
    required this.booruFilter,
    required this.booruFilterChanged,
    required this.duplicateFilter,
    required this.duplicateFilterChanged,
    super.key,
  });

  final bool? loadedFilter;
  final ValueChanged<bool?> loadedFilterChanged;
  final Booru? booruFilter;
  final ValueChanged<Booru?> booruFilterChanged;
  final bool duplicateFilter;
  final ValueChanged<bool> duplicateFilterChanged;

  @override
  State<TabManagerFiltersDialog> createState() => _TabManagerFiltersDialogState();
}

class _TabManagerFiltersDialogState extends State<TabManagerFiltersDialog> {
  bool? loadedFilter;
  Booru? booruFilter;
  bool duplicateFilter = false;

  @override
  void initState() {
    super.initState();

    loadedFilter = widget.loadedFilter;
    booruFilter = widget.booruFilter;
    duplicateFilter = widget.duplicateFilter;
  }

  @override
  Widget build(BuildContext context) {
    return SettingsBottomSheet(
      title: const Text("Tab Filters"),
      contentPadding: const EdgeInsets.all(16),
      contentItems: [
        SettingsBooruDropdown(
          title: "Booru",
          value: booruFilter,
          drawBottomBorder: false,
          onChanged: (Booru? newValue) {
            booruFilter = newValue;
            setState(() {});
          },
        ),
        SettingsDropdown<bool?>(
          title: "Loaded",
          value: loadedFilter,
          drawBottomBorder: false,
          onChanged: (bool? newValue) {
            loadedFilter = newValue;
            setState(() {});
          },
          items: const [
            null,
            true,
            false,
          ],
          itemBuilder: (item) => item == null ? const Text("All") : Text(item ? "Loaded" : "Unloaded"),
          itemTitleBuilder: (item) => item == null
              ? "All"
              : item
                  ? "Loaded"
                  : "Unloaded",
        ),
        SettingsToggle(
          title: "Duplicates",
          value: duplicateFilter,
          onChanged: (bool newValue) {
            duplicateFilter = newValue;
            setState(() {});
          },
        ),
      ],
      actionButtons: [
        ElevatedButton.icon(
          label: const Text("Clear"),
          icon: const Icon(Icons.delete),
          onPressed: () {
            Navigator.of(context).pop('clear');
          },
        ),
        const SizedBox(width: 10),
        ElevatedButton.icon(
          label: const Text("Apply"),
          icon: const Icon(Icons.check),
          onPressed: () {
            widget.loadedFilterChanged(loadedFilter);
            widget.booruFilterChanged(booruFilter);
            widget.duplicateFilterChanged(duplicateFilter);
            Navigator.of(context).pop('apply');
          },
        ),
      ],
    );
  }
}
