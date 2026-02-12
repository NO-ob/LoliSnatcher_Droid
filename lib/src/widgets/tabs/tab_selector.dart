import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:auto_size_text_plus/auto_size_text_plus.dart';
import 'package:get/get.dart';

import 'package:lolisnatcher/src/boorus/mergebooru_handler.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/delete_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/kaomoji.dart';
import 'package:lolisnatcher/src/widgets/common/loli_dropdown.dart';
import 'package:lolisnatcher/src/widgets/common/marquee_text.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/image/booru_favicon.dart';
import 'package:lolisnatcher/src/widgets/root/main_appbar.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_booru_selector.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_filters_dialog.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_move_dialog.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_row.dart';

enum TabSortingMode {
  none,
  alphabet,
  alphabetReverse,
  booru,
  booruReverse,
  ;

  bool get isNone => this == TabSortingMode.none;
  bool get isAlphabet => this == TabSortingMode.alphabet;
  bool get isAlphabetReverse => this == TabSortingMode.alphabetReverse;
  bool get isBooru => this == TabSortingMode.booru;
  bool get isBooruReverse => this == TabSortingMode.booruReverse;

  bool get isAnyAlphabet => isAlphabet || isAlphabetReverse;
  bool get isAnyBooru => isBooru || isBooruReverse;
  bool get isAnyReverse => isAlphabetReverse || isBooruReverse;
}

class TabSelector extends StatelessWidget {
  const TabSelector({
    this.withBorder = true,
    this.countOnTop = false,
    this.color,
    super.key,
  });

  final bool withBorder;
  final bool countOnTop;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    const double radius = 10;

    final SearchHandler searchHandler = SearchHandler.instance;
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    return Obx(() {
      // no boorus
      if (settingsHandler.booruList.isEmpty) {
        return Center(
          child: Text(context.loc.tabs.addBoorusInSettings),
        );
      }

      // no tabs
      if (searchHandler.tabs.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      final currentTab = searchHandler.currentTab;
      final totalTabs = searchHandler.total;
      final currentTabIndex = searchHandler.currentIndex;

      final theme = Theme.of(context);
      final inputDecoration = theme.inputDecorationTheme;

      final EdgeInsetsGeometry margin = withBorder
          ? const EdgeInsets.fromLTRB(5, 8, 5, 8)
          : const EdgeInsets.fromLTRB(0, 16, 0, 0);
      const EdgeInsetsGeometry contentPadding = EdgeInsets.symmetric(horizontal: 16);

      final dropdown = LoliDropdown(
        value: currentTab.selectedBooru.value,
        onChanged: (Booru? newValue) {
          if (searchHandler.currentBooru != newValue) {
            // if not already selected
            searchHandler.searchAction(searchHandler.searchTextController.text, newValue);
          }
        },
        expandableByScroll: true,
        items: settingsHandler.booruList,
        itemExtent: kMinInteractiveDimension,
        itemBuilder: (item) {
          final bool isCurrent = currentTab.selectedBooru.value == item;

          if (item == null) {
            return const SizedBox.shrink();
          }

          return Container(
            padding: settingsHandler.appMode.value.isDesktop
                ? const EdgeInsets.all(5)
                : const EdgeInsets.only(left: 16, right: 16),
            height: kMinInteractiveDimension,
            decoration: isCurrent
                ? BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                  )
                : null,
            child: TabBooruSelectorItem(booru: item),
          );
        },
        selectedItemBuilder: (value) {
          if (value == null) {
            return Text(context.loc.tabs.selectABooru);
          }

          return TabBooruSelectorItem(booru: value);
        },
        labelText: context.loc.booru,
      );

      return Padding(
        padding: margin,
        child: Material(
          color: Colors.transparent,
          child: SizedBox(
            height: MainAppBar.height,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.centerLeft,
              children: [
                Positioned.fill(
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.centerLeft,
                    children: [
                      InputDecorator(
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
                                    text:
                                        '${context.loc.tabs.tab} | ${(currentTabIndex + 1).toFormattedString()}/${totalTabs.toFormattedString()}',
                                  ),
                                  if (totalCount > 0 && countOnTop) ...[
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
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            );
                          }),
                          labelStyle: inputDecoration.labelStyle?.copyWith(
                            color: color ?? inputDecoration.labelStyle?.color,
                          ),
                          contentPadding: contentPadding,
                          border: inputDecoration.border?.copyWith(
                            borderSide: BorderSide(
                              color: withBorder
                                  ? (inputDecoration.border?.borderSide.color ?? Colors.transparent)
                                  : Colors.transparent,
                              width: 1,
                            ),
                          ),
                          enabledBorder: inputDecoration.enabledBorder?.copyWith(
                            borderSide: BorderSide(
                              color: withBorder
                                  ? (inputDecoration.enabledBorder?.borderSide.color ?? Colors.transparent)
                                  : Colors.transparent,
                              width: 1,
                            ),
                          ),
                          focusedBorder: inputDecoration.focusedBorder?.copyWith(
                            borderSide: BorderSide(
                              color: withBorder
                                  ? (inputDecoration.focusedBorder?.borderSide.color ?? Colors.transparent)
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        ),
                        child: const SizedBox.expand(),
                      ),
                      //
                      if (!countOnTop)
                        Positioned(
                          bottom: -8,
                          left: 16,
                          child: Obx(() {
                            final totalCount = currentTab.booruHandler.totalCount.value;
                            if (totalCount > 0) {
                              final usedColor = (color ?? inputDecoration.labelStyle?.color)?.darken(0.2);
                              return IgnorePointer(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 2),
                                      child: Icon(
                                        Icons.image,
                                        size: 14,
                                        color: usedColor,
                                      ),
                                    ),
                                    //
                                    Text(
                                      totalCount.toFormattedString(),
                                      style: inputDecoration.labelStyle?.copyWith(
                                        fontSize: 12,
                                        color: usedColor,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }

                            return const SizedBox.shrink();
                          }),
                        ),
                    ],
                  ),
                ),
                //
                Positioned.fill(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: withBorder
                              ? const BorderRadius.only(
                                  topLeft: Radius.circular(radius),
                                  bottomLeft: Radius.circular(radius),
                                )
                              : null,
                          onTap: () => dropdown.showDialog(context),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 12,
                              left: 16,
                              right: 16,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                BooruFavicon(searchHandler.currentBooru),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: color ?? theme.iconTheme.color,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //
                      Container(
                        margin: const EdgeInsets.only(
                          top: 12,
                          bottom: 12,
                        ),
                        height: double.infinity,
                        width: 2,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      //
                      Expanded(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: withBorder
                                ? const BorderRadius.only(
                                    topRight: Radius.circular(radius),
                                    bottomRight: Radius.circular(radius),
                                  )
                                : null,
                            onTap: () {
                              SettingsPageOpen(
                                context: context,
                                page: (_) => const TabManagerPage(),
                              ).open();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 10,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TabRow(
                                          tab: currentTab,
                                          color: color,
                                          withFavicon: false,
                                        ),
                                        MarqueeText(
                                          text: [
                                            if (currentTab.booruHandler is MergebooruHandler)
                                              (currentTab.booruHandler as MergebooruHandler).booruList[0].name ?? ''
                                            else
                                              currentTab.booruHandler.booru.name ?? '',
                                            //
                                            for (final booru in (currentTab.secondaryBoorus.value ?? <Booru>[]))
                                              booru.name ?? '',
                                          ].join(', '),
                                          style: inputDecoration.labelStyle?.copyWith(
                                            fontSize: 14,
                                            color: color?.withValues(alpha: 0.75),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: color ?? theme.iconTheme.color,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
  final TagHandler tagHandler = TagHandler.instance;

  List<SearchTab> tabs = [], filteredTabs = [], selectedTabs = [];
  late final ScrollController scrollController;

  final TextEditingController filterTextController = TextEditingController();
  TabSortingMode sortingMode = TabSortingMode.none;
  bool? loadedFilter;
  Booru? booruFilter;
  TagType? tagTypeFilter;
  bool duplicateFilter = false, duplicateBooruFilter = true, emptyFilter = false;
  bool? isMultiBooruMode;
  bool selectMode = false;

  static const double tabHeight = 72 + 8;

  int get totalTabs => searchHandler.total;
  int get totalFilteredTabs => filteredTabs.length;
  bool get isFilterActive => totalFilteredTabs != totalTabs || filterTextController.text.isNotEmpty || filtersCount > 0;
  int get currentTabIndex => filteredTabs.indexOf(searchHandler.currentTab);

  int get filtersCount {
    int count = 0;
    if (loadedFilter != null) {
      count++;
    }
    if (booruFilter != null) {
      count++;
    }
    if (tagTypeFilter != null) {
      count++;
    }
    if (duplicateFilter) {
      count++;
    }
    if (isMultiBooruMode != null) {
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
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    filterTextController.dispose();
    super.dispose();
  }

  void getTabs() {
    tabs = searchHandler.tabs;
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      jumpToCurrent(animated: true);
    });
  }

  void jumpToTop() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(0);
    });
  }

  void scrollToTop() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void filterTabs() {
    filteredTabs = [...tabs];

    if (booruFilter != null) {
      filteredTabs = filteredTabs.where((t) => t.selectedBooru.value == booruFilter).toList();
    }

    if (loadedFilter != null) {
      filteredTabs = filteredTabs
          .where(
            (t) => loadedFilter == true
                ? t.booruHandler.filteredFetched.isNotEmpty
                : t.booruHandler.filteredFetched.isEmpty,
          )
          .toList();
    }

    if (tagTypeFilter != null) {
      filteredTabs = filteredTabs.where((tab) {
        final List<String> tags = tab.tags.toLowerCase().trim().split(' ');
        for (final tag in tags) {
          if (tagHandler.getTag(tag).tagType == tagTypeFilter) {
            return true;
          }
        }
        return false;
      }).toList();
    }

    if (duplicateFilter) {
      // tabs where booru and tags are the same
      final Map<String, List<SearchTab>> freqMap = {};

      for (final tab in filteredTabs) {
        final tags = tab.tags.toLowerCase().trim();
        final key = duplicateBooruFilter ? '${tab.selectedBooru.value.name}+$tags' : tags;

        if (freqMap.containsKey(key)) {
          freqMap[key]!.add(tab);
        } else {
          freqMap[key] = [tab];
        }
      }

      final List<SearchTab> duplicateTabs = freqMap.entries
          .where((e) => e.value.length > 1)
          .expand<SearchTab>((e) => e.value)
          .toList();
      filteredTabs = searchHandler.tabs.where(duplicateTabs.contains).toList();
    }

    if (isMultiBooruMode != null) {
      filteredTabs = filteredTabs
          .where(
            (tab) => isMultiBooruMode == false
                ? (tab.secondaryBoorus.value?.isEmpty ?? true)
                : tab.secondaryBoorus.value?.isNotEmpty == true,
          )
          .toList();
    }

    if (emptyFilter) {
      filteredTabs = filteredTabs.where((tab) => tab.tags.trim().isEmpty).toList();
    }

    if (filterTextController.text.isNotEmpty) {
      filteredTabs = filteredTabs.where((t) {
        final String filterText = filterTextController.text.toLowerCase().trim();
        return t.tags.toLowerCase().contains(filterText);
      }).toList();
    }

    if (!sortingMode.isNone) {
      filteredTabs.sort(
        (a, b) {
          final cleanAtags = a.tags.toLowerCase().trim();
          final cleanBtags = b.tags.toLowerCase().trim();

          final aBooru = a.selectedBooru.value;
          final bBooru = b.selectedBooru.value;

          if (sortingMode.isAnyBooru && aBooru.name != bBooru.name) {
            if (sortingMode.isAnyReverse) {
              return bBooru.name!.compareTo(aBooru.name!);
            } else {
              return aBooru.name!.compareTo(bBooru.name!);
            }
          }

          if (cleanAtags != cleanBtags) {
            if (sortingMode.isAnyReverse && !sortingMode.isAnyBooru) {
              return cleanBtags.compareTo(cleanAtags);
            } else {
              return cleanAtags.compareTo(cleanBtags);
            }
          }

          return searchHandler.tabs.indexOf(a).compareTo(searchHandler.tabs.indexOf(b));
        },
      );
    }
  }

  Future<void> openFiltersDialog() async {
    final String? result = await SettingsPageOpen(
      context: context,
      asBottomSheet: true,
      page: (_) => TabManagerFiltersDialog(
        loadedFilter: loadedFilter,
        loadedFilterChanged: (bool? newValue) {
          loadedFilter = newValue;
        },
        booruFilter: booruFilter,
        booruFilterChanged: (Booru? newValue) {
          booruFilter = newValue;
        },
        tagTypeFilter: tagTypeFilter,
        tagTypeFilterChanged: (TagType? newValue) {
          tagTypeFilter = newValue;
        },
        duplicateFilter: duplicateFilter,
        duplicateFilterChanged: (bool newValue) {
          duplicateFilter = newValue;
          if (!duplicateFilter) {
            duplicateBooruFilter = true;
          }
        },
        duplicateBooruFilter: duplicateBooruFilter,
        duplicateBooruFilterChanged: (bool newValue) {
          duplicateBooruFilter = newValue;
        },
        isMultiBooruMode: isMultiBooruMode,
        isMultiBooruModeChanged: (bool? newValue) {
          isMultiBooruMode = newValue;
        },
        emptyFilter: emptyFilter,
        emptyFilterChanged: (bool newValue) {
          emptyFilter = newValue;
        },
      ),
    ).open();

    if (result == 'apply') {
      if (duplicateFilter) {
        sortingMode = TabSortingMode.alphabet;
      }
    }
    if (result == 'clear' ||
        (loadedFilter == null &&
            booruFilter == null &&
            tagTypeFilter == null &&
            duplicateFilter == false &&
            isMultiBooruMode == null &&
            emptyFilter == false)) {
      loadedFilter = null;
      booruFilter = null;
      tagTypeFilter = null;
      duplicateFilter = false;
      duplicateBooruFilter = true;
      isMultiBooruMode = null;
      emptyFilter = false;

      if (!sortingMode.isNone) {
        sortingMode = TabSortingMode.none;
      }
    }

    if (result != null) {
      getTabs();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (filteredTabs.contains(searchHandler.currentTab) && !duplicateFilter) {
          jumpToCurrent();
        } else {
          scrollToTop();
        }
      });
    }
  }

  Widget filterBuild() {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SettingsTextInput(
              title: context.loc.search,
              titleAsLabel: true,
              controller: filterTextController,
              inputType: TextInputType.text,
              clearable: true,
              pasteable: true,
              onlyInput: true,
              drawBottomBorder: false,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              // margin: const EdgeInsets.fromLTRB(2, 8, 2, 5),
              onChanged: (_) => getTabs(),
              enableIMEPersonalizedLearning: !settingsHandler.incognitoKeyboard,
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
      key: ValueKey('item-${tab.id}'),
      index: index,
      enabled: !selectMode && !isFilterActive && sortingMode.isNone,
      child: TabManagerItem(
        tab: tab,
        index: index,
        isFiltered: isFilterActive || !sortingMode.isNone,
        originalIndex: (isFilterActive || !sortingMode.isNone) ? searchHandler.tabs.indexOf(tab) : null,
        isCurrent: isCurrent,
        filterText: filterTextController.text,
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
                  searchHandler.tabs.indexOf(tab),
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
                searchHandler.removeTabAt(tabIndex: searchHandler.tabs.indexOf(tab));
                getTabs();
              },
      ),
    );
  }

  void showOptionsDialog(int index) {
    final SearchTab tab = filteredTabs[index];
    final int originalIndex = searchHandler.tabs.indexOf(tab);

    final Widget optionsDialog = SettingsDialog(
      scrollable: false,
      contentItems: [
        TabManagerItem(
          tab: tab,
          index: index,
          isFiltered: isFilterActive || !sortingMode.isNone,
          originalIndex: (isFilterActive || !sortingMode.isNone) ? originalIndex : null,
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
              title: Text(context.loc.copiedToClipboard, style: const TextStyle(fontSize: 20)),
              content: Text(tab.tags, style: const TextStyle(fontSize: 16)),
              leadingIcon: Icons.copy,
              sideColor: Colors.green,
            );
            Navigator.of(context).pop();
          },
          leading: const Icon(Icons.copy),
          title: Text(context.loc.tabs.copy),
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
                  index: searchHandler.tabs.indexOf(tab),
                  isFiltered: false,
                  originalIndex: null,
                ),
                index: searchHandler.tabs.indexOf(tab),
              ),
            );
            getTabs();
          },
          leading: const Icon(Icons.move_down_sharp),
          title: Text(context.loc.tabs.moveAction),
        ),
        const SizedBox(height: 10),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          onTap: () {
            selectedTabs.remove(tab);
            searchHandler.removeTabAt(tabIndex: searchHandler.tabs.indexOf(tab));
            getTabs();
          },
          leading: const Icon(Icons.close, color: Colors.red),
          title: Text(context.loc.tabs.remove),
        ),
        const SizedBox(height: 20),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
          leading: const Icon(Icons.cancel_outlined),
          title: Text(context.loc.close),
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
    selectedTabs.sort((a, b) => searchHandler.tabs.indexOf(a).compareTo(searchHandler.tabs.indexOf(b)));

    final Widget deleteDialog = SettingsDialog(
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.loc.tabs.deleteTabs),
          Text(
            context.loc.tabs.areYouSureDeleteTabs(count: selectedTabs.length),
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
      scrollable: false,
      content: Container(
        height: MediaQuery.sizeOf(context).height * 0.75,
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
            final item = selectedTabs[index];

            final int itemIndex = searchHandler.tabs.indexOf(item);

            return TabManagerItem(
              tab: item,
              index: index,
              isFiltered: true,
              originalIndex: itemIndex,
            );
          },
        ),
      ),
      actionButtons: [
        const CancelButton(withIcon: true),
        DeleteButton(
          withIcon: true,
          action: () {
            searchHandler.removeTabs(selectedTabs);
            selectedTabs.clear();
            getTabs();
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (_) => deleteDialog,
    );
  }

  void showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return SettingsDialog(
          title: Text(context.loc.tabs.tabsManager),
          contentItems: [
            Text(context.loc.tabs.scrolling),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.subdirectory_arrow_left_outlined),
                const SizedBox(width: 10),
                Expanded(child: Text(context.loc.tabs.scrollToCurrent)),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.arrow_circle_up),
                const SizedBox(width: 10),
                Expanded(child: Text(context.loc.tabs.scrollToTop)),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.arrow_circle_down),
                const SizedBox(width: 10),
                Expanded(child: Text(context.loc.tabs.scrollToBottom)),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Icon(Icons.filter_alt),
                const SizedBox(width: 10),
                Expanded(child: Text(context.loc.tabs.filterTabsByBooru)),
              ],
            ),
            const Divider(),
            Text(context.loc.tabs.sorting),
            const SizedBox(height: 6),
            Row(
              children: [
                const TabSortingIcon(TabSortingMode.none, withBorder: true),
                const SizedBox(width: 10),
                Expanded(child: Text(context.loc.tabs.defaultTabsOrder)),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const TabSortingIcon(TabSortingMode.alphabet, withBorder: true),
                const SizedBox(width: 10),
                Expanded(child: Text(context.loc.tabs.sortAlphabetically)),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const TabSortingIcon(TabSortingMode.alphabetReverse, withBorder: true),
                const SizedBox(width: 10),
                Expanded(child: Text(context.loc.tabs.sortAlphabeticallyReversed)),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const TabSortingIcon(TabSortingMode.booru, withBorder: true),
                const SizedBox(width: 10),
                Expanded(child: Text(context.loc.tabs.sortByBooruName)),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const TabSortingIcon(TabSortingMode.booruReverse, withBorder: true),
                const SizedBox(width: 10),
                Expanded(child: Text(context.loc.tabs.sortByBooruNameReversed)),
              ],
            ),
            const SizedBox(height: 6),
            Text(context.loc.tabs.longPressSortToSave),
            const Divider(),
            Text(context.loc.tabs.select),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.select_all),
                const SizedBox(width: 10),
                Expanded(child: Text(context.loc.tabs.toggleSelectMode)),
              ],
            ),
            const SizedBox(height: 12),
            Text(context.loc.tabs.onTheBottomOfPage),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.select_all),
                const Text(' / '),
                const Icon(Icons.border_clear),
                const SizedBox(width: 10),
                Expanded(child: Text(context.loc.tabs.selectDeselectAll)),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.delete_forever),
                const SizedBox(width: 10),
                Expanded(child: Text(context.loc.tabs.deleteSelectedTabs)),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Icon(Icons.expand),
                const SizedBox(width: 10),
                Text(context.loc.tabs.longPressToMove),
              ],
            ),
            const Divider(),
            Text(context.loc.tabs.numbersInBottomRight),
            // TODO
            Text(context.loc.tabs.firstNumberTabIndex),
            Text(context.loc.tabs.secondNumberTabIndex),
            const Divider(),
            Text(context.loc.tabs.specialFilters),
            Text(context.loc.tabs.loadedFilter),
            Text(context.loc.tabs.notLoadedFilter),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(text: context.loc.tabs.notLoadedItalic.replaceAll('italic', '')),
                  const TextSpan(
                    text: 'italic',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  const TextSpan(text: ' text'),
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
            Text(
              context.loc.tabs.tabsManager,
              style: Theme.of(context).appBarTheme.titleTextStyle,
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
            tooltip: context.loc.tabs.selectMode,
            onPressed: () {
              setState(() {
                selectMode = !selectMode;
                selectedTabs.clear();
              });
            },
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onLongPress: isFilterActive
                ? null
                : () async {
                    final currentTab = searchHandler.currentTab;

                    final res = await showDialog(
                      context: context,
                      builder: (context) {
                        return SettingsDialog(
                          title: Text(sortingMode.isNone ? context.loc.tabs.shuffleTabs : context.loc.tabs.sortMode),
                          contentItems: [
                            Text(
                              sortingMode.isNone
                                  ? context.loc.tabs.shuffleTabsQuestion
                                  : context.loc.tabs.saveTabsInCurrentOrder,
                            ),
                            if (!sortingMode.isNone)
                              Text(
                                '${sortingMode.isAnyBooru ? context.loc.tabs.byBooru : ''} ${context.loc.tabs.alphabetically} ${sortingMode.isAnyReverse ? context.loc.tabs.reversed : ''}'
                                    .trim(),
                              ),
                          ],
                          actionButtons: [
                            const CancelButton(withIcon: true),
                            ElevatedButton.icon(
                              label: Text(sortingMode.isNone ? context.loc.tabs.shuffle : context.loc.tabs.sort),
                              icon: TabSortingIcon(sortingMode),
                              onPressed: () {
                                Navigator.of(context).pop('allow');
                              },
                            ),
                          ],
                        );
                      },
                    );

                    if (res != 'allow') {
                      return;
                    }

                    if (sortingMode.isNone) {
                      // randomly shuffle all filtered tabs
                      filteredTabs.shuffle();

                      FlashElements.showSnackbar(
                        context: context,
                        duration: const Duration(seconds: 2),
                        title: Text(context.loc.tabs.tabRandomlyShuffled, style: const TextStyle(fontSize: 20)),
                        leadingIcon: Icons.sort_by_alpha,
                        sideColor: Colors.green,
                      );
                    } else {
                      FlashElements.showSnackbar(
                        context: context,
                        duration: const Duration(seconds: 2),
                        title: Text(context.loc.tabs.tabOrderSaved, style: const TextStyle(fontSize: 20)),
                        leadingIcon: Icons.sort,
                        sideColor: Colors.green,
                      );
                    }

                    searchHandler.tabs.value = [...filteredTabs];

                    final int newIndex = searchHandler.tabs.indexOf(currentTab);
                    searchHandler.changeTabIndex(newIndex);

                    getTabs();
                  },
            child: IconButton(
              icon: TabSortingIcon(sortingMode),
              tooltip: context.loc.tabs.sortMode,
              onPressed: () {
                switch (sortingMode) {
                  case TabSortingMode.none:
                    sortingMode = TabSortingMode.alphabet;
                    break;
                  case TabSortingMode.alphabet:
                    sortingMode = TabSortingMode.alphabetReverse;
                    break;
                  case TabSortingMode.alphabetReverse:
                    sortingMode = TabSortingMode.booru;
                    break;
                  case TabSortingMode.booru:
                    sortingMode = TabSortingMode.booruReverse;
                    break;
                  case TabSortingMode.booruReverse:
                    sortingMode = TabSortingMode.none;
                    break;
                }
                getTabs();
              },
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.help_center_outlined),
            tooltip: context.loc.tabs.help,
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
                Scrollbar(
                  controller: scrollController,
                  thickness: 8,
                  interactive: true,
                  scrollbarOrientation: settingsHandler.handSide.value.isLeft
                      ? ScrollbarOrientation.left
                      : ScrollbarOrientation.right,
                  child: ReorderableListView.builder(
                    scrollController: scrollController,
                    itemExtent: tabHeight,
                    onReorderItem: (oldIndex, newIndex) {
                      if (oldIndex == newIndex) {
                        return;
                      }

                      searchHandler.moveTab(oldIndex, newIndex);
                      getTabs();
                    },
                    buildDefaultDragHandles: false,
                    proxyDecorator: proxyDecorator,
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                    itemCount: totalFilteredTabs,
                    itemBuilder: itemBuilder,
                  ),
                ),
                if (totalFilteredTabs == 0)
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Kaomoji(
                          category: KaomojiCategory.indifference,
                          style: TextStyle(fontSize: 36),
                        ),
                        Text(
                          context.loc.tabs.noTabsFound,
                          style: const TextStyle(fontSize: 20),
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

              final toTopBtn = ElevatedButton(
                onPressed: scrollToTop,
                child: const Icon(
                  Icons.arrow_circle_up_rounded,
                  size: iconSize,
                ),
              );

              final filteredTabsMinusCurrent = [...filteredTabs]..remove(searchHandler.currentTab);
              final selectedAll = selectedTabs.length == filteredTabsMinusCurrent.length;

              final selectAllBtn = ElevatedButton(
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
              );

              final toCurrentBtn = ElevatedButton(
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
              );

              final bool hasSelected = selectedTabs.isNotEmpty;
              final deleteSelectedBtn = ElevatedButton(
                onPressed: hasSelected ? showDeleteDialog : null,
                child: Row(
                  children: [
                    const Icon(
                      Icons.delete_forever,
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
              );

              final toBottomBtn = ElevatedButton(
                onPressed: scrollToBottom,
                child: const Icon(
                  Icons.arrow_circle_down_rounded,
                  size: iconSize,
                ),
              );

              return Container(
                margin: EdgeInsets.fromLTRB(
                  10,
                  10,
                  10,
                  10 + MediaQuery.paddingOf(context).bottom,
                ),
                width: double.infinity,
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
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.close,
                          size: iconSize,
                        ),
                        label: AutoSizeText(
                          context.loc.close,
                          maxLines: 1,
                          overflowReplacement: const SizedBox.shrink(),
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
  final bool isFiltered;
  final int? originalIndex;
  final VoidCallback? onTap;
  final Widget Function(BuildContext, VoidCallback?)? optionsWidgetBuilder;
  final VoidCallback? onOptionsTap;
  final VoidCallback? onCloseTap;
  final String? filterText;

  @override
  Widget build(BuildContext context) {
    // print('tab selector item build $index');

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
          color: Color.lerp(
            Theme.of(context).cardColor,
            Theme.of(context).brightness == Brightness.dark ? Colors.transparent : Colors.grey[200],
            0.66,
          ),
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
            child: Padding(
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
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: subtitleStyle.fontSize,
                            child: Builder(
                              builder: (context) {
                                final List<String> booruNames = [
                                  if (tab.booruHandler is MergebooruHandler)
                                    (tab.booruHandler as MergebooruHandler).booruList[0].name ?? ''
                                  else
                                    tab.booruHandler.booru.name ?? '',
                                  //
                                  for (final booru in (tab.secondaryBoorus.value ?? [])) booru.name ?? '',
                                ];
                                final String booruNamesStr = booruNames.join(', ');

                                return MarqueeText(
                                  key: ValueKey(booruNamesStr),
                                  text: booruNamesStr.trim(),
                                  style: subtitleStyle.copyWith(
                                    height: 1,
                                  ),
                                  allowDownscale: false,
                                  isExpanded: false,
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Obx(() {
                          final int totalCount = tab.booruHandler.totalCount.value;
                          return Row(
                            children: [
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
                            ],
                          );
                        }),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TabSortingIcon extends StatelessWidget {
  const TabSortingIcon(
    this.sortingMode, {
    this.withBorder = false,
    super.key,
  });

  final TabSortingMode sortingMode;
  final bool withBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: withBorder ? const EdgeInsets.all(3) : null,
      decoration: BoxDecoration(
        borderRadius: withBorder ? BorderRadius.circular(10) : null,
        border: withBorder ? Border.all(color: Theme.of(context).colorScheme.secondary, width: 2) : null,
      ),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationX((sortingMode.isAnyReverse || sortingMode.isNone) ? 0 : pi),
            child: Icon(sortingMode.isNone ? Icons.sort_by_alpha : Icons.sort),
          ),
          if (sortingMode.isAnyBooru)
            Positioned(
              bottom: -10,
              child: Text(context.loc.tabs.byBooru, style: const TextStyle(fontSize: 12)),
            ),
        ],
      ),
    );
  }
}
