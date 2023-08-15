import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class TagsFiltersSettingsList extends StatelessWidget {
  const TagsFiltersSettingsList({
    required this.scrollController,
    required this.filterHated,
    required this.onFilterHatedChanged,
    required this.filterFavourites,
    required this.onFilterFavouritesChanged,
    super.key,
  });

  final ScrollController scrollController;
  final bool filterHated;
  final Function(bool) onFilterHatedChanged;
  final bool filterFavourites;
  final Function(bool) onFilterFavouritesChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        const SettingsButton(name: '', enabled: false),
        //
        SettingsToggle(
          title: 'Remove Items with Hated Tags',
          value: filterHated,
          onChanged: onFilterHatedChanged,
          trailingIcon: const Icon(CupertinoIcons.eye_slash),
        ),
        SettingsToggle(
          title: 'Remove Favourited Items',
          value: filterFavourites,
          onChanged: onFilterFavouritesChanged,
          trailingIcon: const Icon(Icons.favorite, color: Colors.red),
        ),
      ],
    );
  }
}
