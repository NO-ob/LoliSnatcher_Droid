import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/data/tag.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/delete_button.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/tags_manager/tm_list_item.dart';

class TagsManagerListBottom extends StatelessWidget {
  const TagsManagerListBottom({
    required this.selected,
    required this.isFilterActive,
    required this.onSelectAll,
    required this.onDeselectAll,
    required this.onDelete,
    super.key,
  });

  final List<Tag> selected;
  final bool isFilterActive;
  final VoidCallback onSelectAll;
  final VoidCallback onDeselectAll;
  final AsyncCallback onDelete;

  @override
  Widget build(BuildContext context) {
    if (selected.isEmpty) {
      if (isFilterActive) {
        return Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.select_all),
                  label: const Text('Select all'),
                  onPressed: onSelectAll,
                ),
              ),
            ),
          ],
        );
      } else {
        return const SizedBox.shrink();
      }
    }

    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: ElevatedButton.icon(
              label: Text("Delete ${selected.length} ${Tools.pluralize('tag', selected.length)}"),
              icon: const Icon(Icons.delete_forever),
              onPressed: () {
                if (selected.isEmpty) {
                  return;
                }

                final Widget deleteDialog = SettingsDialog(
                  title: const Text('Delete Tags'),
                  scrollable: false,
                  content: SizedBox(
                    width: double.maxFinite,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Text('Are you sure you want to delete ${selected.length} ${Tools.pluralize('tag', selected.length)}?'),
                        const SizedBox(height: 10),
                        ...selected.map((Tag entry) {
                          return TagsManagerListItem(tag: entry);
                        }),
                      ],
                    ),
                  ),
                  actionButtons: [
                    const CancelButton(withIcon: true),
                    DeleteButton(
                      withIcon: true,
                      action: onDelete,
                    ),
                  ],
                );

                showDialog(
                  context: context,
                  builder: (_) => deleteDialog,
                );
              },
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.border_clear),
            label: const Text('Clear selection'),
            onPressed: onDeselectAll,
          ),
        ),
      ],
    );
  }
}
