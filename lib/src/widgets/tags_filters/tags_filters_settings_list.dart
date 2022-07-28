import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class TagsFiltersSettingsList extends StatelessWidget {
  const TagsFiltersSettingsList({
    Key? key,
    required this.scrollController,
    required this.filterHated,
    required this.onFilterHatedChanged,
  }) : super(key: key);

  final ScrollController scrollController;
  final bool filterHated;
  final Function(bool) onFilterHatedChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        const SettingsButton(name: '', enabled: false),
        //
        SettingsToggle(
          title: "Remove Items with Hated Tags",
          value: filterHated,
          onChanged: onFilterHatedChanged,
        ),
      ],
    );
  }
}
