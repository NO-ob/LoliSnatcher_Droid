import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/add_button.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/preview/tag_search_query_editor_page.dart';
import 'package:lolisnatcher/src/widgets/tags_filters/tf_list_item.dart';

class TagsFiltersAddDialog extends StatefulWidget {
  const TagsFiltersAddDialog({
    required this.onAdd,
    required this.tagFilterType,
    super.key,
  });

  final Function(String) onAdd;
  final String tagFilterType;

  @override
  State<TagsFiltersAddDialog> createState() => _TagsFiltersAddDialogState();
}

class _TagsFiltersAddDialogState extends State<TagsFiltersAddDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onSubmit(String text) {
    if (text.trim() != '') {
      widget.onAdd(text.trim().toLowerCase());
      Navigator.of(context).pop(true);
    } else {
      FlashElements.showSnackbar(
        context: context,
        title: Text(
          context.loc.tagsFiltersDialogs.emptyInput,
          style: const TextStyle(fontSize: 20),
        ),
        leadingIcon: Icons.warning_amber,
        leadingIconColor: Colors.red,
        sideColor: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SettingsDialog(
      contentItems: [
        SizedBox(
          width: double.maxFinite,
          child: AbsorbPointer(
            absorbing: true,
            child: TagsFiltersListItem(
              tag: context.loc.tagsFiltersDialogs.addNewFilter(type: widget.tagFilterType),
              overrideIcon: const Icon(Icons.add),
            ),
          ),
        ),
        //
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: TagSearchBox(
            title: context.loc.tagsFiltersDialogs.newTagFilter(type: widget.tagFilterType),
            hintText: context.loc.tagsFiltersDialogs.newFilter,
            onlyInput: true,
            controller: _controller,
            clearable: true,
            allowMultipleTags: false,
            showBooruSelector: true,
          ),
        ),
      ],
      actionButtons: [
        const CancelButton(
          withIcon: true,
        ),
        AddButton(
          withIcon: true,
          action: () => onSubmit(_controller.text),
        ),
      ],
    );
  }
}
