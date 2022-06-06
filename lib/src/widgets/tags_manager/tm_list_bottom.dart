

import 'package:flutter/material.dart';

import 'package:LoliSnatcher/src/utils/tools.dart';
import 'package:LoliSnatcher/src/widgets/common/cancel_button.dart';
import 'package:LoliSnatcher/src/widgets/common/settings_widgets.dart';
import 'package:LoliSnatcher/src/widgets/tags_manager/tm_list_item.dart';
import 'package:LoliSnatcher/src/data/tag.dart';


class TagsManagerListBottom extends StatelessWidget {
  const TagsManagerListBottom({
    Key? key,
    required this.selected,
    required this.isFilterActive,
    required this.onSelectAll,
    required this.onDeselectAll,
    required this.onDelete,
  }) : super(key: key);

  final List<Tag> selected;
  final bool isFilterActive;
  final void Function() onSelectAll;
  final void Function() onDeselectAll;
  final Future<void> Function() onDelete;

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
                  label: const Text("Select all"),
                  onPressed: onSelectAll,
                ),
              ),
            ),
          ],
        );
      } else {
        return const SizedBox();
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
                  title: const Text("Delete Tags"),
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
                        }).toList(),
                      ],
                    ),
                  ),
                  actionButtons: [
                    const CancelButton(),
                    ElevatedButton.icon(
                      label: const Text("Delete"),
                      icon: const Icon(Icons.delete_forever),
                      onPressed: onDelete,
                    ),
                  ],
                );

                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) => deleteDialog,
                );
              },
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.border_clear),
            label: const Text("Clear selection"),
            onPressed: onDeselectAll,
          ),
        ),
      ],
    );
  }
}
