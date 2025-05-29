import 'dart:math';

import 'package:flutter/material.dart';

import 'package:huge_listview/huge_listview.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:lolisnatcher/src/data/tag.dart';
import 'package:lolisnatcher/src/widgets/common/custom_scroll_bar_thumb.dart';
import 'package:lolisnatcher/src/widgets/tags_manager/tm_list_item.dart';

class TagsManagerList extends StatelessWidget {
  const TagsManagerList({
    required this.tags,
    required this.selected,
    required this.onRefresh,
    required this.onTap,
    required this.onSelect,
    super.key,
  });

  final List<Tag> tags;
  final List<Tag> selected;
  final Future<void> Function() onRefresh;
  final void Function(Tag) onTap;
  final void Function(bool?, Tag) onSelect;

  static const int defaultPageSize = 12;

  Future<List<Tag>> _loadPage(int page, int pageSize) async {
    final int start = page * pageSize;
    final int end = start + pageSize;
    final List<Tag> pageTags = tags.sublist(start, min(tags.length, end));

    return pageTags;
  }

  @override
  Widget build(BuildContext context) {
    final ItemScrollController itemScrollController = ItemScrollController();
    final HugeListViewController hugeListViewController = HugeListViewController(totalItemCount: tags.length);

    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          color: Colors.transparent,
          child: SizedBox(
            width: double.maxFinite,
            child: RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              displacement: 80,
              strokeWidth: 4,
              color: Theme.of(context).colorScheme.secondary,
              onRefresh: onRefresh,
              child: HugeListView(
                scrollController: itemScrollController,
                listViewController: hugeListViewController,
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
                pageFuture: (page) => _loadPage(page, TagsManagerList.defaultPageSize),
                pageSize: TagsManagerList.defaultPageSize,
                thumbBuilder:
                    (
                      Color backgroundColor,
                      Color drawColor,
                      double height,
                      int index,
                      bool alwaysVisibleScrollThumb,
                      Animation<double> thumbAnimation,
                    ) {
                      final Tag tag = tags[index];
                      return CustomScrollBarThumb(
                        backgroundColor: backgroundColor,
                        drawColor: drawColor,
                        height: height * 1.2, // 48
                        title: '${tag.tagType} [${tag.fullString[0]}]',
                      );
                    },
                thumbBackgroundColor: Theme.of(context).colorScheme.surface,
                thumbDrawColor: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.5),
                startIndex: 0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
