import 'dart:async';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/widgets/CachedFavicon.dart';
import 'package:LoliSnatcher/widgets/MarqueeText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

// Experimental: attempot to do chrome-like tabs list for desktop view

class DesktopTabs extends StatefulWidget {
  const DesktopTabs({Key? key}) : super(key: key);

  @override
  State<DesktopTabs> createState() => _DesktopTabsState();
}

class _DesktopTabsState extends State<DesktopTabs> {
  final SearchHandler searchHandler = SearchHandler.instance;
  final AutoScrollController scrollController = AutoScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      jumpToTab(searchHandler.currentIndex);
    });
  }

  @override
  void dispose() {
    //
    super.dispose();
  }

  void jumpToTab(int index) async {
    scrollController.jumpTo(index * (scrollController.position.maxScrollExtent / searchHandler.list.length));
    await Future.delayed(const Duration(milliseconds: 50));
    await scrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.begin,
      duration: const Duration(milliseconds: 50),
    );
  }

  void onMouseScroll(double delta) {
    if (scrollController.hasClients) {
      scrollController.jumpTo(scrollController.offset + (delta * 2));
    }
  }

  Widget buildRow(SearchGlobal tab) {
    bool isNotEmptyBooru = tab.selectedBooru.value.faviconURL != null;

    // print(value.tags);
    int? totalCount = tab.booruHandler.totalCount.value;
    String totalCountText = (totalCount > 0) ? " ($totalCount)" : "";
    String tagText = "${tab.tags == "" ? "[No Tags]" : tab.tags}$totalCountText";

    bool isSelected = searchHandler.currentIndex == searchHandler.list.indexOf(tab);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border.all(
          color: isSelected ? Colors.red : Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      width: double.maxFinite,
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
          const SizedBox(width: 3),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              searchHandler.removeTabAt(tabIndex: searchHandler.list.indexOf(tab));
            },
            hoverColor: Theme.of(context).hoverColor,
            iconSize: 14,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        return Row(
          children: [
            Expanded(
              child: Listener(
                onPointerSignal: (pointerSignal) {
                  if (pointerSignal is PointerScrollEvent) {
                    onMouseScroll(pointerSignal.scrollDelta.dy);
                  }
                },
                child: ListView.builder(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: searchHandler.list.length,
                  itemBuilder: (context, index) {
                    final SearchGlobal tab = searchHandler.list[index];

                    return AutoScrollTag(
                      highlightColor: Colors.red,
                      key: ValueKey(index),
                      controller: scrollController,
                      index: index,
                      child: SizedBox(
                        width: 250,
                        child: GestureDetector(
                          onTap: () {
                            searchHandler.changeTabIndex(index);
                          },
                          child: buildRow(tab),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 3),
            IconButton(
              onPressed: () {
                searchHandler.addTabByString('', switchToNew: true);
              },
              icon: const Icon(Icons.add),
            ),
            const SizedBox(width: 3),
            PopupMenuButton<SearchGlobal>(
              onSelected: (SearchGlobal tab) {
                searchHandler.changeTabIndex(searchHandler.list.indexOf(tab));
              },
              itemBuilder: (BuildContext context) {
                return searchHandler.list.map((SearchGlobal choice) {
                  return PopupMenuItem<SearchGlobal>(
                    value: choice,
                    child: buildRow(choice),
                  );
                }).toList();
              },
            )
          ],
        );
      }),
    );
  }
}
