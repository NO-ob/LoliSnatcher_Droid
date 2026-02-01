import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/tags_filters/tf_list_item.dart';

class TagsFiltersList extends StatelessWidget {
  const TagsFiltersList({
    required this.tagsList,
    required this.filterTagsType,
    required this.onTagSelected,
    required this.scrollController,
    required this.tagSearchController,
    required this.onSearchTextChanged,
    required this.openAddDialog,
    super.key,
  });

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
    final List<String> filteredTagsList = tagsList.where((String tag) {
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
            title:
                '${context.loc.search} (${isSearchActive ? '${filteredCount.toFormattedString()}/${originalCount.toFormattedString()}' : originalCount.toFormattedString()})',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            clearable: true,
            pasteable: true,
            onChanged: onSearchTextChanged,
            enableIMEPersonalizedLearning: !SettingsHandler.instance.incognitoKeyboard,
          ),
          //
          if (filteredTagsList.isEmpty)
            SettingsButton(
              name: isSearchActive
                  ? context.loc.settings.tagsFilters.noFiltersFound
                  : context.loc.settings.tagsFilters.noFiltersAdded,
              action: () {
                if (!isSearchActive) {
                  openAddDialog();
                }
              },
            ),
          //
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              padding: EdgeInsets.fromLTRB(
                10,
                5,
                10,
                15 + MediaQuery.paddingOf(context).bottom,
              ),
              shrinkWrap: false,
              itemCount: filteredTagsList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                final String currentEntry = filteredTagsList[index];

                return TagsFiltersListItem(
                  tag: currentEntry,
                  onTap: onTagSelected,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
