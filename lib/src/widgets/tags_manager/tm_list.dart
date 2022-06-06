import 'dart:math';

import 'package:flutter/material.dart';
import 'package:huge_listview/huge_listview.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:lolisnatcher/src/widgets/common/custom_scroll_bar_thumb.dart';
import 'package:lolisnatcher/src/widgets/desktop/desktop_scroll_wrap.dart';
import 'package:lolisnatcher/src/widgets/tags_manager/tm_list_item.dart';
import 'package:lolisnatcher/src/data/tag.dart';

class TagsManagerList extends StatelessWidget {
  const TagsManagerList({
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
                  return TagsManagerListItem(
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
                pageFuture: (page) => _loadPage(page, TagsManagerList.PAGE_SIZE),
                pageSize: TagsManagerList.PAGE_SIZE,
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
                          child: TagsManagerListItem(
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
