import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/tag_type.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/tag_handler.dart';
import 'package:lolisnatcher/src/widgets/common/clear_button.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_booru_selector.dart';

class TabManagerFiltersDialog extends StatefulWidget {
  const TabManagerFiltersDialog({
    required this.loadedFilter,
    required this.loadedFilterChanged,
    required this.booruFilter,
    required this.booruFilterChanged,
    required this.tagTypeFilter,
    required this.tagTypeFilterChanged,
    required this.duplicateFilter,
    required this.duplicateFilterChanged,
    required this.duplicateBooruFilter,
    required this.duplicateBooruFilterChanged,
    required this.isMultiBooruMode,
    required this.isMultiBooruModeChanged,
    required this.emptyFilter,
    required this.emptyFilterChanged,
    super.key,
  });

  final bool? loadedFilter;
  final ValueChanged<bool?> loadedFilterChanged;
  final Booru? booruFilter;
  final ValueChanged<Booru?> booruFilterChanged;
  final TagType? tagTypeFilter;
  final ValueChanged<TagType?> tagTypeFilterChanged;
  final bool duplicateFilter;
  final ValueChanged<bool> duplicateFilterChanged;
  final bool duplicateBooruFilter;
  final ValueChanged<bool> duplicateBooruFilterChanged;
  final bool? isMultiBooruMode;
  final ValueChanged<bool?> isMultiBooruModeChanged;
  final bool emptyFilter;
  final ValueChanged<bool> emptyFilterChanged;

  @override
  State<TabManagerFiltersDialog> createState() => _TabManagerFiltersDialogState();
}

class _TabManagerFiltersDialogState extends State<TabManagerFiltersDialog> {
  bool? loadedFilter;
  Booru? booruFilter;
  TagType? tagTypeFilter;
  bool duplicateFilter = false, duplicateBooruFilter = true, emptyFilter = false;
  bool? isMultiBooruMode;

  @override
  void initState() {
    super.initState();

    loadedFilter = widget.loadedFilter;
    booruFilter = widget.booruFilter;
    tagTypeFilter = widget.tagTypeFilter;
    duplicateFilter = widget.duplicateFilter;
    duplicateBooruFilter = widget.duplicateBooruFilter;
    isMultiBooruMode = widget.isMultiBooruMode;
    emptyFilter = widget.emptyFilter;
  }

  @override
  Widget build(BuildContext context) {
    return SettingsBottomSheet(
      title: const Text(
        'Tab Filters',
        style: TextStyle(fontSize: 20),
      ),
      titlePadding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      contentPadding: EdgeInsets.zero,
      buttonPadding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
      contentItems: [
        SettingsBooruDropdown(
          title: 'Booru',
          value: booruFilter,
          drawBottomBorder: false,
          nullable: true,
          itemBuilder: (item, isCurrent) => _BooruDropdownItem(
            key: ValueKey(item),
            item: item,
            isCurrent: isCurrent,
          ),
          itemFilter: (booru) {
            return SearchHandler.instance.list.where((t) => t.selectedBooru.value.name == booru?.name).isNotEmpty;
          },
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
          itemTitleBuilder: (item) => item == null ? 'All' : (item ? 'Loaded' : 'Not loaded'),
        ),
        SettingsDropdown<TagType?>(
          title: 'Tag Type',
          value: tagTypeFilter,
          drawBottomBorder: false,
          onChanged: (TagType? newValue) {
            tagTypeFilter = newValue;
            setState(() {});
          },
          trailingIcon: IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const SettingsDialog(
                    title: Text('Tag Type Filter'),
                    contentItems: [
                      Text('Filter tabs which contain at least one tag of selected type'),
                    ],
                  );
                },
              );
            },
          ),
          items: const [
            null,
            ...TagType.values,
          ],
          itemBuilder: (item) => _TagTypeDropdownItem(
            key: ValueKey(item),
            item: item,
          ),
        ),
        SettingsDropdown<bool?>(
          title: 'Multibooru',
          value: isMultiBooruMode,
          drawBottomBorder: false,
          onChanged: (bool? newValue) {
            isMultiBooruMode = newValue;
            setState(() {});
          },
          items: const [
            null,
            true,
            false,
          ],
          itemBuilder: (item) => item == null ? const Text('All') : Text(item ? 'Enabled' : 'Disabled'),
          itemTitleBuilder: (item) => item == null ? 'All' : (item ? 'Enabled' : 'Disabled'),
        ),
        SettingsToggle(
          title: 'Duplicates',
          subtitle: duplicateFilter ? const Text('Will also enable sorting') : null,
          value: duplicateFilter,
          onChanged: (bool newValue) {
            duplicateFilter = newValue;
            setState(() {});
          },
          drawBottomBorder: false,
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
                        drawBottomBorder: false,
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        ),
        SettingsToggle(
          title: 'Empty search query',
          value: emptyFilter,
          onChanged: (bool newValue) {
            emptyFilter = newValue;
            setState(() {});
          },
          drawBottomBorder: false,
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
            widget.tagTypeFilterChanged(tagTypeFilter);
            widget.duplicateFilterChanged(duplicateFilter);
            widget.duplicateBooruFilterChanged(duplicateBooruFilter);
            widget.isMultiBooruModeChanged(isMultiBooruMode);
            widget.emptyFilterChanged(emptyFilter);
            Navigator.of(context).pop('apply');
          },
        ),
      ],
    );
  }
}

class _BooruDropdownItem extends StatelessWidget {
  const _BooruDropdownItem({
    required this.item,
    required this.isCurrent,
    super.key,
  });

  final Booru? item;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    if (item == null) {
      return const SizedBox.shrink();
    }

    final int tabCount = SearchHandler.instance.list.where((t) => t.selectedBooru.value.name == item?.name).length;
    final String? tabCountStr = tabCount > 0 ? ' ($tabCount)' : null;

    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      height: kMinInteractiveDimension,
      decoration: isCurrent
          ? BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
            )
          : null,
      child: TabBooruSelectorItem(
        booru: item!,
        extraText: tabCountStr,
      ),
    );
  }
}

class _TagTypeDropdownItem extends StatelessWidget {
  const _TagTypeDropdownItem({
    required this.item,
    super.key,
  });

  final TagType? item;

  @override
  Widget build(BuildContext context) {
    String title = item == null ? 'Any' : item!.locName;

    final bool showColor = item == null ? false : !item!.isNone;

    if (showColor) {
      final int tabCount = SearchHandler.instance.list.where((t) {
        final List<String> tags = t.tags.toLowerCase().trim().split(' ');
        for (final tag in tags) {
          if (TagHandler.instance.getTag(tag).tagType == item) {
            return true;
          }
        }
        return false;
      }).length;

      if (tabCount > 0) {
        title += ' ($tabCount)';
      }
    }

    return Row(
      children: [
        if (showColor)
          Container(
            height: 24,
            width: 6,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: item!.getColour(),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        Text(title),
      ],
    );
  }
}
