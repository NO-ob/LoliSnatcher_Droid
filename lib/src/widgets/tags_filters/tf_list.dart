import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/desktop/desktop_scroll_wrap.dart';
import 'package:lolisnatcher/src/widgets/tags_filters/tf_list_item.dart';

class TagsFiltersList extends StatelessWidget {
  const TagsFiltersList({
    Key? key,
    required this.tagsList,
    required this.filterTagsType,
    required this.onTagSelected,
    required this.scrollController,
    required this.tagSearchController,
    required this.onSearchTextChanged,
    required this.openAddDialog,
  }) : super(key: key);

  final List<String> tagsList;
  final String filterTagsType;
  final Function(String) onTagSelected;
  final ScrollController scrollController;
  final TextEditingController tagSearchController;
  final Function(String) onSearchTextChanged;
  final Function() openAddDialog;

  bool get isSearchActive => tagSearchController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final int originalCount = tagsList.length;
    List<String> filteredTagsList = tagsList.where((String tag) {
      if (!isSearchActive) {
        return true;
      }
      return tag.toLowerCase().contains(tagSearchController.text.toLowerCase());
    }).toList();
    final int filteredCount = filteredTagsList.length;

    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Column(
        children: [
          SettingsTextInput(
            controller: tagSearchController,
            title: 'Search Tags (${isSearchActive ? '$filteredCount/$originalCount' : '$originalCount'})',
            onChanged: onSearchTextChanged,
          ),
          //
          if (filteredTagsList.isEmpty)
            SettingsButton(
              name: 'No filters ${isSearchActive ? 'found' : 'added'}',
              action: () {
                if (!isSearchActive) {
                  openAddDialog();
                }
              },
            ),
          //
          Expanded(
            child: DesktopScrollWrap(
              controller: scrollController,
              child: ListView.builder(
                controller: scrollController,
                padding: EdgeInsets.fromLTRB(10, 5, 10, 15 + MediaQuery.of(context).padding.bottom),
                shrinkWrap: false,
                itemCount: filteredTagsList.length,
                scrollDirection: Axis.vertical,
                physics: getListPhysics(), // const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemBuilder: (BuildContext context, int index) {
                  String currentEntry = filteredTagsList[index];

                  return TagsFiltersListItem(
                    tag: currentEntry,
                    onTap: (String tag) => onTagSelected(tag),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
