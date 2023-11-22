import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/kaomoji.dart';
import 'package:lolisnatcher/src/widgets/common/marquee_text.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/desktop/desktop_scroll_wrap.dart';
import 'package:lolisnatcher/src/widgets/preview/shimmer_builder.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_filters_dialog.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_move_dialog.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_row.dart';

// TODO improve scrolling performance when tapping scroll to top/bottom/current buttons and freezing after input in search when there are a lot of tabs (+ add debounce?)

class TabSelector extends StatelessWidget {
  const TabSelector({
    this.withBorder = true,
    this.color,
    super.key,
  });

  final bool withBorder;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    const double radius = 10;

    final SearchHandler searchHandler = SearchHandler.instance;
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    return Obx(() {
      if (searchHandler.list.isEmpty) {
        return const SizedBox.shrink();
      }

      final currentTab = searchHandler.currentTab;
      final totalTabs = searchHandler.total;
      final currentTabIndex = searchHandler.currentIndex;

      final theme = Theme.of(context);
      final inputDecoration = theme.inputDecorationTheme;

      final bool isDesktop = settingsHandler.appMode.value.isDesktop;
      final EdgeInsetsGeometry margin =
          isDesktop ? const EdgeInsets.fromLTRB(2, 5, 2, 2) : (withBorder ? const EdgeInsets.fromLTRB(5, 8, 5, 8) : const EdgeInsets.fromLTRB(0, 16, 0, 0));
      final EdgeInsetsGeometry contentPadding = EdgeInsets.symmetric(horizontal: 12, vertical: isDesktop ? 2 : 12);

      return Padding(
        padding: margin,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: withBorder ? const BorderRadius.all(Radius.circular(radius)) : null,
            onTap: () {
              SettingsPageOpen(
                context: context,
                page: () => const TabManagerPage(),
              ).open();
            },
            child: InputDecorator(
              decoration: InputDecoration(
                label: Obx(() {
                  final totalCount = currentTab.booruHandler.totalCount.value;

                  return RichText(
                    text: TextSpan(
                      style: inputDecoration.labelStyle?.copyWith(
                        color: color ?? inputDecoration.labelStyle?.color,
                      ),
                      children: [
                        TextSpan(
                          text: 'Tab | ${(currentTabIndex + 1).toFormattedString()}/${totalTabs.toFormattedString()}',
                        ),
                        if (totalCount > 0) ...[
                          const TextSpan(text: ' | '),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2),
                              child: Icon(
                                Icons.image,
                                size: inputDecoration.labelStyle?.fontSize ?? 12,
                                color: color ?? inputDecoration.labelStyle?.color,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: totalCount.toFormattedString(),
                          ),
                        ],
                      ],
                    ),
                  );
                }),
                labelStyle: inputDecoration.labelStyle?.copyWith(
                  color: color ?? inputDecoration.labelStyle?.color,
                ),
                contentPadding: contentPadding,
                border: inputDecoration.border?.copyWith(
                  borderSide: BorderSide(
                    color: withBorder ? (inputDecoration.border?.borderSide.color ?? Colors.transparent) : Colors.transparent,
                    width: 1,
                  ),
                ),
                enabledBorder: inputDecoration.enabledBorder?.copyWith(
                  borderSide: BorderSide(
                    color: withBorder ? (inputDecoration.enabledBorder?.borderSide.color ?? Colors.transparent) : Colors.transparent,
                    width: 1,
                  ),
                ),
                focusedBorder: inputDecoration.focusedBorder?.copyWith(
                  borderSide: BorderSide(
                    color: withBorder ? (inputDecoration.focusedBorder?.borderSide.color ?? Colors.transparent) : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
              child: TabRow(
                tab: currentTab,
                color: color,
              ),
            ),
          ),
        ),
      );
    });
  }
}

class TabManagerPage extends StatefulWidget {
  const TabManagerPage({super.key});

  @override
  State<TabManagerPage> createState() => _TabManagerPageState();
}

class _TabManagerPageState extends State<TabManagerPage> {
  final SearchHandler searchHandler = SearchHandler.instance;
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  List<SearchTab> tabs = [], filteredTabs = [], selectedTabs = [];
  late final ScrollController scrollController;

  final TextEditingController filterController = TextEditingController();
  bool? sortTabs, loadedFilter;
  Booru? booruFilter;
  bool duplicateFilter = false, emptyFilter = false;
  bool selectMode = false;

  bool showPlaceholders = false, firstRender = true;

  static const double tabHeight = 72 + 8;

  int get totalTabs => searchHandler.total;
  int get totalFilteredTabs => filteredTabs.length;
  bool get isFilterActive => totalFilteredTabs != totalTabs || filterController.text.isNotEmpty || filtersCount > 0;
  int get currentTabIndex => filteredTabs.indexOf(searchHandler.currentTab);

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
    if (emptyFilter) {
      count++;
    }
    return count;
  }

  @override
  void initState() {
    super.initState();
    getTabs();

    scrollController = ScrollController(
      initialScrollOffset: currentTabIndex * tabHeight,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await jumpToCurrent();
      firstRender = false;
      setState(() {});
    });
  }

  void getTabs() {
    tabs = searchHandler.list;
    filteredTabs = tabs;
    filterTabs();

    setState(() {});
  }

  Future<void> jumpToCurrent({bool animated = false}) async {
    if (scrollController.hasClients) {
      if (currentTabIndex == -1) {
        return;
      }

      // final double viewport = scrollController.position.viewportDimension;
      final double maxScroll = scrollController.position.maxScrollExtent;
      final double itemOffset = currentTabIndex * tabHeight;
      double scrollOffset = 0;
      if (itemOffset > maxScroll) {
        scrollOffset = maxScroll;
      } else {
        scrollOffset = itemOffset;
      }

      if (animated) {
        await scrollController.animateTo(
          scrollOffset,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      } else {
        scrollController.jumpTo(scrollOffset);
      }
    }
  }

  void scrollToCurrent() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showPlaceholders = true;
      setState(() {});
      await jumpToCurrent(animated: true);
      showPlaceholders = false;
      setState(() {});
    });
  }

  void jumpToTop() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      firstRender = true;
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 20));
      scrollController.jumpTo(0);
      firstRender = false;
      setState(() {});
    });
  }

  void scrollToTop() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showPlaceholders = true;
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 20));
      await scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
      showPlaceholders = false;
      setState(() {});
    });
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showPlaceholders = true;
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 20));
      await scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
      showPlaceholders = false;
      setState(() {});
    });
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

    if (emptyFilter) {
      filteredTabs = filteredTabs.where((tab) => tab.tags.trim().isEmpty).toList();
    }

    if (filterController.text.isNotEmpty) {
      filteredTabs = filteredTabs.where((t) {
        final String filterText = filterController.text.toLowerCase().trim();
        return t.tags.toLowerCase().contains(filterText);
      }).toList();
    }

    if (sortTabs != null) {
      filteredTabs.sort(
        (a, b) => sortTabs == true ? a.tags.toLowerCase().compareTo(b.tags.toLowerCase()) : b.tags.toLowerCase().compareTo(a.tags.toLowerCase()),
      );
    }
  }

  Future<void> openFiltersDialog() async {
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
        emptyFilter: emptyFilter,
        emptyFilterChanged: (bool newValue) {
          emptyFilter = newValue;
        },
      ),
    ).open();

    if (result == 'apply') {
      //
    }
    if (result == 'clear' || (loadedFilter == null && booruFilter == null && duplicateFilter == false && emptyFilter == false)) {
      loadedFilter = null;
      booruFilter = null;
      duplicateFilter = false;
      emptyFilter = false;

      firstRender = true;
    }

    if (result != null) {
      showPlaceholders = true;
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 20));
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        getTabs();
        await Future.delayed(const Duration(milliseconds: 20));
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          if (filteredTabs.contains(searchHandler.currentTab)) {
            await jumpToCurrent();
          } else {
            scrollToTop();
          }

          await Future.delayed(const Duration(milliseconds: 20));

          showPlaceholders = false;
          firstRender = false;
          setState(() {});
        });
      });
    }
  }

  Widget filterBuild() {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: SettingsTextInput(
              title: 'Search Tabs',
              controller: filterController,
              inputType: TextInputType.text,
              clearable: true,
              onlyInput: true,
              drawBottomBorder: false,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              // margin: const EdgeInsets.fromLTRB(2, 8, 2, 5),
              onChanged: (_) => getTabs(),
            ),
          ),
          const SizedBox(width: 4),
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                iconSize: 30,
                onPressed: openFiltersDialog,
                icon: const Icon(Icons.filter_alt),
              ),
              if (filtersCount > 0)
                Positioned(
                  top: -4,
                  right: -4,
                  child: GestureDetector(
                    onTap: openFiltersDialog,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                      child: Center(
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
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget proxyDecorator(Widget child, int index, Animation<double> animation) {
    return child;
  }

  Widget itemBuilder(BuildContext context, int index) {
    final SearchTab tab = filteredTabs[index];

    // if (mode.isViewer && firstRender) {
    //   return const SizedBox(height: tabHeight);
    // }

    // print('itemBuilder $index');

    final bool isCurrent = tab == searchHandler.currentTab;
    final bool isSelected = selectedTabs.contains(tab);

    return ReorderableDelayedDragStartListener(
      key: ValueKey('item-$index-${tab.id}'),
      index: index,
      enabled: !selectMode && !isFilterActive && sortTabs == null,
      child: TabManagerItem(
        tab: tab,
        index: index,
        isFiltered: isFilterActive || sortTabs != null,
        originalIndex: (isFilterActive || sortTabs != null) ? searchHandler.list.indexOf(tab) : null,
        isCurrent: isCurrent,
        showPlaceholders: showPlaceholders,
        firstRender: firstRender,
        filterText: filterController.text,
        onTap: selectMode
            ? () {
                if (isSelected || isCurrent) {
                  selectedTabs.removeWhere((item) => item == tab);
                } else {
                  selectedTabs.add(tab);
                }
                setState(() {});
              }
            : () {
                searchHandler.changeTabIndex(
                  searchHandler.list.indexOf(tab),
                );
                Navigator.of(context).pop();
              },
        optionsWidgetBuilder: selectMode
            ? (_, onTap) {
                if (isCurrent) {
                  return const SizedBox.shrink();
                }

                return Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Checkbox(
                    value: isSelected,
                    onChanged: (bool? newValue) {
                      if (isSelected) {
                        selectedTabs.removeWhere((item) => item == tab);
                      } else {
                        selectedTabs.add(tab);
                      }
                      setState(() {});
                    },
                  ),
                );
              }
            : null,
        onOptionsTap: () {
          if (!selectMode) {
            showOptionsDialog(index);
          }
        },
        onCloseTap: selectMode
            ? null
            : () {
                selectedTabs.remove(tab);
                searchHandler.removeTabAt(tabIndex: searchHandler.list.indexOf(tab));
                getTabs();
              },
      ),
    );
  }

  void showOptionsDialog(int index) {
    final SearchTab tab = filteredTabs[index];
    final int originalIndex = searchHandler.list.indexOf(tab);

    final Widget optionsDialog = SettingsDialog(
      scrollable: false,
      contentItems: [
        TabManagerItem(
          tab: tab,
          index: index,
          isFiltered: isFilterActive,
          originalIndex: isFilterActive ? originalIndex : null,
        ),
        const SizedBox(height: 20),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          onTap: () async {
            await Clipboard.setData(ClipboardData(text: tab.tags));
            FlashElements.showSnackbar(
              context: context,
              duration: const Duration(seconds: 2),
              title: const Text('Copied to clipboard!', style: TextStyle(fontSize: 20)),
              content: Text(tab.tags, style: const TextStyle(fontSize: 16)),
              leadingIcon: Icons.copy,
              sideColor: Colors.green,
            );
            Navigator.of(context).pop(true);
          },
          leading: const Icon(Icons.copy),
          title: const Text('Copy'),
        ),
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
                row: TabManagerItem(
                  tab: tab,
                  index: searchHandler.list.indexOf(tab),
                  isFiltered: isFilterActive,
                  originalIndex: isFilterActive ? originalIndex : null,
                ),
                index: searchHandler.list.indexOf(tab),
              ),
            );
            getTabs();
          },
          leading: const Icon(Icons.move_down_sharp),
          title: const Text('Move'),
        ),
        const SizedBox(height: 10),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          onTap: () async {
            selectedTabs.remove(tab);
            searchHandler.removeTabAt(tabIndex: searchHandler.list.indexOf(tab));
            getTabs();
          },
          leading: const Icon(Icons.close, color: Colors.red),
          title: const Text('Remove'),
        ),
        const SizedBox(height: 10),
        // TODO more stuff?
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) => optionsDialog,
    );
  }

  void showDeleteDialog() {
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
          const Text('Delete Tabs'),
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

            return TabManagerItem(
              tab: selectedTabs[index],
              index: index,
              isFiltered: true,
              originalIndex: itemIndex,
            );
          },
        ),
      ),
      actionButtons: [
        const SizedBox(
          height: 40,
          child: CancelButton(),
        ),
        SizedBox(
          height: 40,
          child: ElevatedButton.icon(
            label: const Text('Delete'),
            icon: const Icon(Icons.delete_forever),
            onPressed: () {
              for (int i = 0; i < selectedTabs.length; i++) {
                final int index = searchHandler.list.indexOf(selectedTabs[i]);
                searchHandler.removeTabAt(tabIndex: index);
              }
              selectedTabs.clear();
              getTabs();
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => deleteDialog,
    );
  }

  void showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return SettingsDialog(
          title: const Text('Tabs Manager'),
          contentItems: <Widget>[
            const Text('Scrolling:'),
            const SizedBox(height: 6),
            const Row(
              children: [
                Icon(Icons.subdirectory_arrow_left_outlined),
                SizedBox(width: 10),
                Expanded(child: Text('Scroll to current tab')),
              ],
            ),
            const SizedBox(height: 6),
            const Row(
              children: [
                Icon(Icons.arrow_circle_up),
                SizedBox(width: 10),
                Expanded(child: Text('Scroll to top')),
              ],
            ),
            const SizedBox(height: 6),
            const Row(
              children: [
                Icon(Icons.arrow_circle_down),
                SizedBox(width: 10),
                Expanded(child: Text('Scroll to bottom')),
              ],
            ),
            const Divider(),
            const Row(
              children: [
                Icon(Icons.filter_alt),
                SizedBox(width: 10),
                Expanded(child: Text('Filter tabs by booru, loaded state, duplicates, etc.')),
              ],
            ),
            const Divider(),
            const Text('Sorting:'),
            const SizedBox(height: 6),
            const Row(
              children: [
                Icon(Icons.sort_by_alpha),
                SizedBox(width: 10),
                Expanded(child: Text('Default tabs order')),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationX(pi),
                  child: const Icon(Icons.sort),
                ),
                const SizedBox(width: 10),
                const Expanded(child: Text('Sort alphabetically')),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationX(0),
                  child: const Icon(Icons.sort),
                ),
                const SizedBox(width: 10),
                const Expanded(child: Text('Sort alphabetically (reversed)')),
              ],
            ),
            const SizedBox(height: 6),
            const Text('Long press on the sort button to save the current tabs order'),
            const Divider(),
            const Text('Select:'),
            const SizedBox(height: 6),
            const Row(
              children: [
                Icon(Icons.select_all),
                SizedBox(width: 10),
                Expanded(child: Text('Toggle select mode')),
              ],
            ),
            const SizedBox(height: 12),
            const Text('On the bottom of the page: '),
            const SizedBox(height: 6),
            const Row(
              children: [
                Icon(Icons.select_all),
                Text(' / '),
                Icon(Icons.border_clear),
                SizedBox(width: 10),
                Expanded(child: Text('Select/deselect all tabs')),
              ],
            ),
            const SizedBox(height: 6),
            const Row(
              children: [
                Icon(Icons.delete),
                SizedBox(width: 10),
                Expanded(child: Text('Delete selected tabs')),
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
            const Text('Numbers in the bottom right of the tab:'),
            // TODO
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: Theme.of(context).appBarTheme.titleTextStyle,
                children: [
                  const TextSpan(text: 'Tabs'),
                  if (sortTabs != null) ...[
                    const TextSpan(text: ' | '),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: sortTabs == true ? Matrix4.rotationX(pi) : Matrix4.rotationX(0),
                        child: const Icon(Icons.sort, size: 18),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                children: [
                  if (isFilterActive) ...[
                    const WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(Icons.filter_alt, size: 16),
                    ),
                    TextSpan(text: '${totalFilteredTabs.toFormattedString()}/'),
                  ],
                  TextSpan(text: totalTabs.toFormattedString()),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.select_all),
            tooltip: 'Select mode',
            onPressed: () {
              setState(() {
                selectMode = !selectMode;
                selectedTabs.clear();
              });
            },
          ),
          const SizedBox(width: 8),
          Transform(
            alignment: Alignment.center,
            transform: sortTabs == true ? Matrix4.rotationX(pi) : Matrix4.rotationX(0),
            child: GestureDetector(
              onLongPress: () async {
                if (!isFilterActive) {
                  final currentTab = searchHandler.currentTab;

                  final res = await showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return SettingsDialog(
                        title: Text(sortTabs != null ? 'Sort tabs' : 'Shuffle tabs'),
                        contentItems: sortTabs != null
                            ? [
                                const Text('Save current tabs sorting?'),
                                Text(sortTabs == true ? 'Alphabetically' : 'Alphabetically (reversed)'),
                              ]
                            : [
                                const Text('Shuffle tabs randomly?'),
                              ],
                        actionButtons: [
                          const SizedBox(
                            height: 40,
                            child: CancelButton(),
                          ),
                          SizedBox(
                            height: 40,
                            child: ElevatedButton.icon(
                              label: Text(sortTabs != null ? 'Sort' : 'Shuffle'),
                              icon: Transform(
                                alignment: Alignment.center,
                                transform: sortTabs == true ? Matrix4.rotationX(pi) : Matrix4.rotationX(0),
                                child: Icon(sortTabs != null ? Icons.sort : Icons.sort_by_alpha),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop('allow');
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  );

                  if (res != 'allow') {
                    return;
                  }

                  if (sortTabs == null) {
                    // randomly shuffle all filtered tabs
                    filteredTabs.shuffle();

                    FlashElements.showSnackbar(
                      context: context,
                      duration: const Duration(seconds: 2),
                      title: const Text('Tab randomly shuffled!', style: TextStyle(fontSize: 20)),
                      leadingIcon: Icons.sort_by_alpha,
                      sideColor: Colors.green,
                    );
                  } else {
                    FlashElements.showSnackbar(
                      context: context,
                      duration: const Duration(seconds: 2),
                      title: const Text('Tab order saved!', style: TextStyle(fontSize: 20)),
                      leadingIcon: Icons.sort,
                      sideColor: Colors.green,
                    );
                  }

                  searchHandler.list.value = [...filteredTabs];

                  final int newIndex = searchHandler.list.indexOf(currentTab);
                  searchHandler.changeTabIndex(newIndex);

                  getTabs();
                }
              },
              child: IconButton(
                icon: Icon((sortTabs == true || sortTabs == false) ? Icons.sort : Icons.sort_by_alpha),
                tooltip: 'Sort tabs',
                onPressed: () {
                  if (sortTabs == true) {
                    // reverse
                    sortTabs = false;
                  } else if (sortTabs == false) {
                    // default
                    sortTabs = null;
                  } else {
                    // alphabetically
                    sortTabs = true;
                  }
                  getTabs();
                },
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.help_center_outlined),
            tooltip: 'Help',
            onPressed: showHelpDialog,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          filterBuild(),
          Expanded(
            child: Stack(
              children: [
                ShimmerWrap(
                  child: Scrollbar(
                    controller: scrollController,
                    thickness: 8,
                    interactive: true,
                    child: DesktopScrollWrap(
                      controller: scrollController,
                      child: ReorderableListView.builder(
                        scrollController: scrollController,
                        onReorder: (oldIndex, newIndex) {
                          if (oldIndex == newIndex) {
                            return;
                          } else if (oldIndex < newIndex) {
                            newIndex -= 1;
                          }

                          searchHandler.moveTab(oldIndex, newIndex);
                          getTabs();
                        },
                        physics: getListPhysics(),
                        buildDefaultDragHandles: false,
                        proxyDecorator: proxyDecorator,
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                        itemCount: totalFilteredTabs,
                        itemBuilder: itemBuilder,
                      ),
                    ),
                  ),
                ),
                if (totalFilteredTabs == 0)
                  const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Kaomoji(
                          type: KaomojiType.shrug,
                          style: TextStyle(fontSize: 40),
                        ),
                        Text(
                          'No tabs found',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Builder(
            builder: (context) {
              const double iconSize = 28;
              const double btnHeight = 50;

              final toTopBtn = SizedBox(
                height: btnHeight,
                child: ElevatedButton(
                  onPressed: scrollToTop,
                  child: const Icon(
                    Icons.arrow_circle_up_rounded,
                    size: iconSize,
                  ),
                ),
              );

              final filteredTabsMinusCurrent = [...filteredTabs]..remove(searchHandler.currentTab);
              final selectedAll = selectedTabs.length == filteredTabsMinusCurrent.length;

              final selectAllBtn = SizedBox(
                height: btnHeight,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedAll) {
                      selectedTabs.clear();
                    } else {
                      selectedTabs = [...filteredTabs];
                      selectedTabs.remove(searchHandler.currentTab);
                    }
                    setState(() {});
                  },
                  child: Icon(
                    selectedAll ? Icons.border_clear : Icons.select_all,
                    size: iconSize,
                  ),
                ),
              );

              final toCurrentBtn = SizedBox(
                height: btnHeight,
                child: ElevatedButton(
                  onPressed: currentTabIndex != -1 ? scrollToCurrent : null,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.subdirectory_arrow_left_outlined,
                        size: iconSize,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        (searchHandler.currentIndex + 1).toFormattedString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: currentTabIndex == -1 ? Colors.transparent : null,
                        ),
                      ),
                    ],
                  ),
                ),
              );

              final bool hasSelected = selectedTabs.isNotEmpty;
              final deleteSelectedBtn = SizedBox(
                height: btnHeight,
                child: ElevatedButton(
                  onPressed: hasSelected ? showDeleteDialog : null,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.delete,
                        size: iconSize,
                      ),
                      const SizedBox(width: 4),
                      Stack(
                        children: [
                          Text(
                            selectedTabs.length.toFormattedString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Text(
                            '00',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.transparent),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );

              final toBottomBtn = SizedBox(
                height: btnHeight,
                child: ElevatedButton(
                  onPressed: scrollToBottom,
                  child: const Icon(
                    Icons.arrow_circle_down_rounded,
                    size: iconSize,
                  ),
                ),
              );

              return Container(
                margin: EdgeInsets.fromLTRB(
                  10,
                  10,
                  10,
                  10 + MediaQuery.of(context).padding.bottom,
                ),
                width: double.infinity,
                height: btnHeight,
                child: Row(
                  children: [
                    if (settingsHandler.handSide.value.isLeft) ...[
                      if (selectMode) ...[
                        selectAllBtn,
                        const SizedBox(width: 6),
                        deleteSelectedBtn,
                        const SizedBox(width: 6),
                      ] else ...[
                        toBottomBtn,
                        const SizedBox(width: 6),
                        toCurrentBtn,
                        const SizedBox(width: 6),
                        toTopBtn,
                        const SizedBox(width: 6),
                      ],
                    ],
                    Expanded(
                      child: SizedBox(
                        height: btnHeight,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.close,
                            size: iconSize,
                          ),
                          label: const AutoSizeText(
                            'Close',
                            maxLines: 1,
                            overflowReplacement: SizedBox.shrink(),
                          ),
                        ),
                      ),
                    ),
                    if (settingsHandler.handSide.value.isRight) ...[
                      if (selectMode) ...[
                        const SizedBox(width: 6),
                        deleteSelectedBtn,
                        const SizedBox(width: 6),
                        selectAllBtn,
                      ] else ...[
                        const SizedBox(width: 6),
                        toTopBtn,
                        const SizedBox(width: 6),
                        toCurrentBtn,
                        const SizedBox(width: 6),
                        toBottomBtn,
                      ],
                    ],
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class TabManagerItem extends StatelessWidget {
  const TabManagerItem({
    required this.tab,
    this.index,
    this.isCurrent = false,
    this.showPlaceholders = false,
    this.firstRender = false,
    this.isFiltered = false,
    this.originalIndex,
    this.onTap,
    this.optionsWidgetBuilder,
    this.onOptionsTap,
    this.onCloseTap,
    this.filterText,
    super.key,
  }) : assert(
          !isFiltered || (index != null && originalIndex != null),
          'originalIndex must be provided if isFiltered is true',
        );

  final SearchTab tab;
  final int? index;
  final bool isCurrent;
  final bool showPlaceholders;
  final bool firstRender;
  final bool isFiltered;
  final int? originalIndex;
  final VoidCallback? onTap;
  final Widget Function(BuildContext, VoidCallback?)? optionsWidgetBuilder;
  final VoidCallback? onOptionsTap;
  final VoidCallback? onCloseTap;
  final String? filterText;

  @override
  Widget build(BuildContext context) {
    // print('tab selector item build $index $showPlaceholders');
    if (firstRender) {
      return const SizedBox(height: 80);
    }

    final BorderRadius radius = BorderRadius.circular(10);

    final subtitleStyle = Theme.of(context).textTheme.bodySmall!.copyWith(
          color: Theme.of(context).textTheme.bodySmall!.color,
        );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        height: 72,
        width: double.maxFinite,
        child: Material(
          color: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: radius,
            side: isCurrent
                ? BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 2,
                  )
                : BorderSide.none,
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: radius,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: showPlaceholders
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: radius,
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: const ShimmerCard(),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 2,
                        bottom: 6,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TabRow(
                                    tab: tab,
                                    filterText: filterText,
                                  ),
                                ),
                                if (onOptionsTap != null) ...[
                                  const SizedBox(width: 4),
                                  optionsWidgetBuilder?.call(context, onOptionsTap) ??
                                      IconButton(
                                        onPressed: onOptionsTap,
                                        icon: const Icon(CupertinoIcons.slider_horizontal_3),
                                      ),
                                ],
                                if (onCloseTap != null) ...[
                                  if (onOptionsTap == null) const SizedBox(width: 4) else const SizedBox(width: 8),
                                  IconButton(
                                    onPressed: onCloseTap,
                                    icon: const Icon(
                                      Icons.close,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Obx(
                              () {
                                final int totalCount = tab.booruHandler.totalCount.value;

                                return Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: subtitleStyle.fontSize,
                                        child: Builder(
                                          builder: (context) {
                                            final List<String> booruNames = [
                                              tab.booruHandler.booru.name ?? '',
                                              if (tab.secondaryBoorus != null)
                                                for (final booru in tab.secondaryBoorus!) booru.name ?? '',
                                            ];
                                            final String booruNamesStr = booruNames.join(', ');

                                            return MarqueeText(
                                              text: booruNamesStr.trim(),
                                              style: subtitleStyle,
                                              allowDownscale: false,
                                              isExpanded: false,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    if (totalCount > 0) ...[
                                      Icon(
                                        Icons.image,
                                        size: 16,
                                        color: subtitleStyle.color,
                                      ),
                                      const SizedBox(width: 2),
                                      Text(
                                        '${totalCount.toFormattedString()} | ',
                                        style: subtitleStyle,
                                      ),
                                    ],
                                    if (index != null)
                                      Text(
                                        '#${(index! + 1).toFormattedString()}${originalIndex != null ? '|${(originalIndex! + 1).toFormattedString()}' : ''}',
                                        style: subtitleStyle,
                                      ),
                                    const SizedBox(width: 8),
                                  ],
                                );
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
    );
  }
}
