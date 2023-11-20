import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class TabManagerFiltersDialog extends StatefulWidget {
  const TabManagerFiltersDialog({
    required this.loadedFilter,
    required this.loadedFilterChanged,
    required this.booruFilter,
    required this.booruFilterChanged,
    required this.duplicateFilter,
    required this.duplicateFilterChanged,
    required this.emptyFilter,
    required this.emptyFilterChanged,
    super.key,
  });

  final bool? loadedFilter;
  final ValueChanged<bool?> loadedFilterChanged;
  final Booru? booruFilter;
  final ValueChanged<Booru?> booruFilterChanged;
  final bool duplicateFilter;
  final ValueChanged<bool> duplicateFilterChanged;
  final bool emptyFilter;
  final ValueChanged<bool> emptyFilterChanged;

  @override
  State<TabManagerFiltersDialog> createState() => _TabManagerFiltersDialogState();
}

class _TabManagerFiltersDialogState extends State<TabManagerFiltersDialog> {
  bool? loadedFilter;
  Booru? booruFilter;
  bool duplicateFilter = false, emptyFilter = false;

  @override
  void initState() {
    super.initState();

    loadedFilter = widget.loadedFilter;
    booruFilter = widget.booruFilter;
    duplicateFilter = widget.duplicateFilter;
    emptyFilter = widget.emptyFilter;
  }

  @override
  Widget build(BuildContext context) {
    return SettingsBottomSheet(
      title: const Text('Tab Filters'),
      contentPadding: const EdgeInsets.all(16),
      buttonPadding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
      contentItems: [
        SettingsBooruDropdown(
          title: 'Booru',
          value: booruFilter,
          drawBottomBorder: false,
          nullable: true,
          onChanged: (Booru? newValue) {
            booruFilter = newValue;
            setState(() {});
          },
        ),
        SettingsDropdown<bool?>(
          title: 'Loaded',
          value: loadedFilter,
          drawBottomBorder: false,
          onChanged: (bool? newValue) {
            loadedFilter = newValue;
            setState(() {});
          },
          items: const [
            null,
            true,
            false,
          ],
          itemBuilder: (item) => item == null ? const Text('All') : Text(item ? 'Loaded' : 'Unloaded'),
          itemTitleBuilder: (item) => item == null
              ? 'All'
              : item
                  ? 'Loaded'
                  : 'Unloaded',
        ),
        SettingsToggle(
          title: 'Duplicates',
          value: duplicateFilter,
          onChanged: (bool newValue) {
            duplicateFilter = newValue;
            setState(() {});
          },
        ),
        SettingsToggle(
          title: 'Empty tags',
          value: emptyFilter,
          onChanged: (bool newValue) {
            emptyFilter = newValue;
            setState(() {});
          },
        ),
      ],
      actionButtons: [
        SizedBox(
          height: 40,
          child: ElevatedButton.icon(
            label: const Text('Clear'),
            icon: const Icon(Icons.delete),
            onPressed: () {
              Navigator.of(context).pop('clear');
            },
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          height: 40,
          child: ElevatedButton.icon(
            label: const Text('Apply'),
            icon: const Icon(Icons.check),
            onPressed: () {
              widget.loadedFilterChanged(loadedFilter);
              widget.booruFilterChanged(booruFilter);
              widget.duplicateFilterChanged(duplicateFilter);
              widget.emptyFilterChanged(emptyFilter);
              Navigator.of(context).pop('apply');
            },
          ),
        ),
      ],
    );
  }
}
