import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/widgets/MarqueeText.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/widgets/CachedFavicon.dart';
import 'package:LoliSnatcher/widgets/DesktopScrollWrap.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';


class TabBox extends StatefulWidget {
  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  final SearchHandler searchHandler = Get.find<SearchHandler>();
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();

  final GlobalKey dropdownKey = GlobalKey();
  GestureDetector? detector;

  // TODO fix this
  // dropdownbutton small clickable zone workaround when using inputdecoration
  // code from: https://github.com/flutter/flutter/issues/53634
  void openItemsList() {
    void search(BuildContext? context) {
      context?.visitChildElements((element) {
        if (detector != null) return;
        if (element.widget != null && element.widget is GestureDetector)
          detector = element.widget as GestureDetector;
        else
          search(element);
      });
    }

    search(dropdownKey.currentContext);
    if (detector != null) detector!.onTap?.call();
  }

  Future<bool> openTabsDialog() async {
    return await showDialog(
          context: context,
          builder: (context) {
            return TabsDialog();
          },
        ) ??
        false;
  }

  Widget buildRow(SearchGlobal tab) {
    bool isNotEmptyBooru = tab.selectedBooru.value.faviconURL != null;

    // print(value.tags);
    int? totalCount = tab.booruHandler.totalCount.value;
    String totalCountText = (totalCount > 0) ? " ($totalCount)" : "";
    String tagText = "${tab.tags == "" ? "[No Tags]" : tab.tags}$totalCountText";

    return Container(
      width: double.maxFinite,
      height: 30,
      child: Row(
        children: [
          isNotEmptyBooru
              ? (tab.selectedBooru.value.type == "Favourites"
                  ? const Icon(Icons.favorite, color: Colors.red, size: 18)
                  : CachedFavicon(tab.selectedBooru.value.faviconURL!))
              : const Icon(CupertinoIcons.question, size: 18),
          const SizedBox(width: 3),
          MarqueeText(
            key: ValueKey(tagText),
            text: tagText,
            fontSize: 16,
            color: tab.tags == "" ? Colors.grey : null,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: settingsHandler.appMode == 'Desktop' ? BoxConstraints(maxHeight: 40, minHeight: 20, minWidth: 100) : null,
      padding: settingsHandler.appMode == 'Desktop' ? EdgeInsets.fromLTRB(2, 5, 2, 2) : EdgeInsets.fromLTRB(5, 8, 5, 8),
      child: Obx(() {
        List<SearchGlobal> list = searchHandler.list;
        int index = searchHandler.currentIndex;

        if (list.isEmpty) {
          return const SizedBox();
        }

        return GestureDetector(
          onTap: openItemsList,
          onLongPress: openTabsDialog,
          onSecondaryTap: openTabsDialog,
          child: DropdownButtonFormField<SearchGlobal>(
            key: dropdownKey,
            isExpanded: true,
            value: list[index],
            icon: Icon(Icons.arrow_drop_down),
            itemHeight: kMinInteractiveDimension,
            decoration: InputDecoration(
              labelText: 'Tab (${searchHandler.currentIndex + 1}/${searchHandler.list.length})',
              labelStyle: TextStyle(color: Get.theme.colorScheme.onBackground, fontSize: 18),
              // contentPadding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
              contentPadding: settingsHandler.appMode == 'Desktop'
                  ? EdgeInsets.symmetric(horizontal: 12, vertical: 2)
                  : EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Get.theme.colorScheme.secondary)),
              border: OutlineInputBorder(borderSide: BorderSide(color: Get.theme.colorScheme.secondary)),
            ),
            dropdownColor: Get.theme.colorScheme.surface,
            onChanged: (SearchGlobal? newValue) {
              if (newValue != null) {
                searchHandler.changeTabIndex(list.indexOf(newValue));
              }
            },
            selectedItemBuilder: (BuildContext context) {
              return list.map<DropdownMenuItem<SearchGlobal>>((SearchGlobal value) {
                return DropdownMenuItem<SearchGlobal>(
                  value: value,
                  child: Container(
                    child: buildRow(value),
                  ),
                );
              }).toList();
            },
            items: list.map<DropdownMenuItem<SearchGlobal>>((SearchGlobal value) {
              bool isCurrent = list.indexOf(value) == index;

              return DropdownMenuItem<SearchGlobal>(
                value: value,
                child: Container(
                  padding: settingsHandler.appMode == 'Desktop' ? EdgeInsets.all(5) : EdgeInsets.fromLTRB(5, 10, 5, 10),
                  decoration: isCurrent
                      ? BoxDecoration(
                          border: Border.all(color: Get.theme.colorScheme.secondary, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        )
                      : null,
                  child: buildRow(value),
                ),
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}

class TabsDialog extends StatefulWidget {
  TabsDialog({Key? key}) : super(key: key);

  @override
  _TabsDialogState createState() => _TabsDialogState();
}

class _TabsDialogState extends State<TabsDialog> {
  final SearchHandler searchHandler = Get.find<SearchHandler>();

  List<SearchGlobal> tabs = [], filteredTabs = [];
  final AutoScrollController scrollController = AutoScrollController();
  final TextEditingController filterController = TextEditingController();
  bool? sortTabs;

  @override
  void initState() {
    super.initState();
    tabs = searchHandler.list;
    filteredTabs = tabs;

    WidgetsBinding.instance?.addPostFrameCallback((_) {
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
      await Future.delayed(Duration(milliseconds: 50));
      // then correct the position (otherwise duration is ignored and it scrolls slower than intended)
      await scrollController.scrollToIndex(filteredIndex, duration: Duration(milliseconds: 10), preferPosition: AutoScrollPosition.begin);
    }
  }

  void filterTabs() {
    if (filterController.text.isNotEmpty) {
      filteredTabs = [...tabs].where((t) {
        String filterText = filterController.text.toLowerCase();
        bool doTagsMatch = t.tags.toLowerCase().contains(filterText);
        String booruText = 'booru:' + (t.selectedBooru.value.name?.toLowerCase() ?? "");
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

  void showTabEntryActions(Widget row, SearchGlobal data) {
    showDialog(
      context: context,
      builder: (context) {
        final int tabIndex = searchHandler.list.indexOf(data);

        return SettingsDialog(
          contentItems: <Widget>[
            SizedBox(width: double.maxFinite, child: row),
            const SizedBox(height: 20),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Get.theme.colorScheme.secondary),
              ),
              onTap: () async {
                if (tabIndex != -1) {
                  searchHandler.changeTabIndex(tabIndex);
                }
                Navigator.of(context).pop(true);
                Navigator.of(context).pop(true);
              },
              leading: Icon(Icons.menu_open),
              title: Text('Open'),
            ),
            const SizedBox(height: 10),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Get.theme.colorScheme.secondary),
              ),
              onTap: () {
                if (tabIndex != -1) {
                  searchHandler.removeTabAt(tabIndex: tabIndex);
                }
                getTabs();
                Navigator.of(context).pop(true);
              },
              leading: Icon(Icons.delete, color: Colors.red),
              title: Text('Remove'),
            ),
            const SizedBox(height: 10),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Get.theme.colorScheme.secondary),
              ),
              onTap: () async {
                Clipboard.setData(ClipboardData(text: data.tags));
                FlashElements.showSnackbar(
                  context: context,
                  duration: Duration(seconds: 2),
                  title: Text("Copied to clipboard!", style: TextStyle(fontSize: 20)),
                  content: Text(data.tags, style: TextStyle(fontSize: 16)),
                  leadingIcon: Icons.copy,
                  sideColor: Colors.green,
                );
                Navigator.of(context).pop(true);
              },
              leading: Icon(Icons.copy),
              title: Text('Copy'),
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
            radius: Radius.circular(10),
            isAlwaysShown: true,
            child: DesktopScrollWrap(
              controller: scrollController,
              child: ListView.builder(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                controller: scrollController,
                physics: (Platform.isWindows || Platform.isLinux || Platform.isMacOS)
                    ? const NeverScrollableScrollPhysics()
                    : null, // const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
      child: buildEntry(index, true),
    );
  }

  Widget buildEntry(int index, bool isActive) {
    final SearchGlobal tab = filteredTabs[index];
    bool isNotEmptyBooru = tab.selectedBooru.value.faviconURL != null;
    bool isCurrent = searchHandler.currentTab == tab;

    // print(value.tags);
    int? totalCount = tab.booruHandler.totalCount.value;
    String totalCountText = (totalCount > 0) ? " ($totalCount)" : "";
    String tagText = "${tab.tags == "" ? "[No Tags]" : tab.tags}$totalCountText";

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: Get.theme.colorScheme.secondary, style: isCurrent ? BorderStyle.solid : BorderStyle.none),
        ),
        onTap: isActive ? () => showTabEntryActions(buildEntry(index, false), tab) : null,
        minLeadingWidth: 20,
        leading: isNotEmptyBooru
            ? (tab.selectedBooru.value.type == "Favourites"
                ? Icon(Icons.favorite, color: Colors.red, size: 18)
                : CachedFavicon(tab.selectedBooru.value.faviconURL!))
            : Icon(CupertinoIcons.question, size: 18),
        title: MarqueeText(
          key: ValueKey(tagText),
          text: tagText,
          fontSize: 16,
          color: tab.tags == "" ? Colors.grey : null,
          isExpanded: false,
        ),
      ),
    );
  }

  Widget filterBuild() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 45,
              child: Row(children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: filterController,
                    onChanged: (String input) {
                      filterTabs();
                    },
                    enableInteractiveSelection: true,
                    decoration: InputDecoration(
                      hintText: "Filter Tabs (${filterController.text.isEmpty ? tabs.length : '${filteredTabs.length}/${tabs.length}'})",
                      labelText: "Filter Tabs (${filterController.text.isEmpty ? tabs.length : '${filteredTabs.length}/${tabs.length}'})",
                      labelStyle: TextStyle(color: Get.theme.colorScheme.onBackground, fontSize: 18),
                      contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        gapPadding: 0,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: IconButton(
                    icon: Icon(Icons.subdirectory_arrow_left_outlined),
                    onPressed: () {
                      jumpToCurrent();
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
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
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SettingsDialog(
      title: filterBuild(),
      content: listBuild(),
      contentPadding: const EdgeInsets.all(6),
      titlePadding: const EdgeInsets.fromLTRB(6, 18, 2, 6),
      scrollable: false,
    );
  }
}
