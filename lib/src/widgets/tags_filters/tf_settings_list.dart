import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class TagsFiltersSettingsList extends StatelessWidget {
  const TagsFiltersSettingsList({
    required this.scrollController,
    required this.filterHated,
    required this.onFilterHatedChanged,
    required this.filterFavourites,
    required this.onFilterFavouritesChanged,
    required this.filterSnatched,
    required this.onFilterSnatchedChanged,
    required this.filterAi,
    required this.onFilterAiChanged,
    super.key,
  });

  final ScrollController scrollController;
  final bool filterHated;
  final Function(bool) onFilterHatedChanged;
  final bool filterFavourites;
  final Function(bool) onFilterFavouritesChanged;
  final bool filterSnatched;
  final Function(bool) onFilterSnatchedChanged;
  final bool filterAi;
  final Function(bool) onFilterAiChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        const SettingsButton(name: '', enabled: false),
        //
        SettingsToggle(
          title: context.loc.settings.tagsFilters.removeHated,
          value: filterHated,
          onChanged: onFilterHatedChanged,
          trailingIcon: const Icon(CupertinoIcons.eye_slash),
        ),
        SettingsToggle(
          title: context.loc.settings.tagsFilters.removeFavourited,
          value: filterFavourites,
          onChanged: onFilterFavouritesChanged,
          trailingIcon: const Icon(Icons.favorite, color: Colors.red),
        ),
        SettingsToggle(
          title: context.loc.settings.tagsFilters.removeSnatched,
          value: filterSnatched,
          onChanged: onFilterSnatchedChanged,
          trailingIcon: const Icon(Icons.file_download_outlined),
        ),
        SettingsToggle(
          title: context.loc.settings.tagsFilters.removeAI,
          value: filterAi,
          onChanged: onFilterAiChanged,
          trailingIcon: const FaIcon(FontAwesomeIcons.robot, size: 20),
        ),
      ],
    );
  }
}
