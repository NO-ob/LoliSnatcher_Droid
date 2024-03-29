import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/widgets/common/clear_button.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class TabManagerFiltersDialog extends StatefulWidget {
  const TabManagerFiltersDialog({
    required this.loadedFilter,
    required this.loadedFilterChanged,
    required this.booruFilter,
    required this.booruFilterChanged,
    required this.duplicateFilter,
    required this.duplicateFilterChanged,
    required this.duplicateBooruFilter,
    required this.duplicateBooruFilterChanged,
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
  final bool duplicateBooruFilter;
  final ValueChanged<bool> duplicateBooruFilterChanged;
  final bool emptyFilter;
  final ValueChanged<bool> emptyFilterChanged;

  @override
  State<TabManagerFiltersDialog> createState() => _TabManagerFiltersDialogState();
}

class _TabManagerFiltersDialogState extends State<TabManagerFiltersDialog> {
  bool? loadedFilter;
  Booru? booruFilter;
  bool duplicateFilter = false, duplicateBooruFilter = true, emptyFilter = false;

  @override
  void initState() {
    super.initState();

    loadedFilter = widget.loadedFilter;
    booruFilter = widget.booruFilter;
    duplicateFilter = widget.duplicateFilter;
    duplicateBooruFilter = widget.duplicateBooruFilter;
    emptyFilter = widget.emptyFilter;
  }

  @override
  Widget build(BuildContext context) {
    return SettingsBottomSheet(
      title: const Text(
        'Tab Filters',
        style: TextStyle(fontSize: 20),
      ),
      titlePadding: const EdgeInsets.fromLTRB(32, 16, 16, 0),
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
          itemBuilder: (item) => item == null ? const Text('All') : Text(item ? 'Loaded' : 'Not loaded'),
          itemTitleBuilder: (item) => item == null
              ? 'All'
              : item
                  ? 'Loaded'
                  : 'Not loaded',
        ),
        SettingsToggle(
          title: 'Duplicates',
          subtitle: duplicateFilter ? const Text('Will also enable sorting') : null,
          value: duplicateFilter,
          onChanged: (bool newValue) {
            duplicateFilter = newValue;
            setState(() {});
          },
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          child: duplicateFilter
              ? Row(
                  children: [
                    const SizedBox(width: 16),
                    const Icon(
                      Icons.subdirectory_arrow_right_rounded,
                      size: 20,
                    ),
                    Expanded(
                      child: SettingsToggle(
                        title: 'Check for duplicates on same Booru',
                        value: duplicateBooruFilter,
                        onChanged: (bool newValue) {
                          duplicateBooruFilter = newValue;
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
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
        const ClearButton(withIcon: true),
        const SizedBox(width: 10),
        ElevatedButton.icon(
          label: const Text('Apply'),
          icon: const Icon(Icons.check),
          onPressed: () {
            widget.loadedFilterChanged(loadedFilter);
            widget.booruFilterChanged(booruFilter);
            widget.duplicateFilterChanged(duplicateFilter);
            widget.duplicateBooruFilterChanged(duplicateBooruFilter);
            widget.emptyFilterChanged(emptyFilter);
            Navigator.of(context).pop('apply');
          },
        ),
      ],
    );
  }
}
