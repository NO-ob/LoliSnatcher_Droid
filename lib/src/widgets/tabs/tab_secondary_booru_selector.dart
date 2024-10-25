import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/loli_dropdown.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_booru_selector.dart';

class TabSecondaryBooruSelector extends StatelessWidget {
  const TabSecondaryBooruSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final SearchHandler searchHandler = SearchHandler.instance;

    return Obx(() {
      // no boorus
      if (settingsHandler.booruList.isEmpty) {
        return const Center(
          child: Text('Add Boorus in Settings'),
        );
      }

      // no tabs
      if (searchHandler.list.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      final bool isDesktop = settingsHandler.appMode.value.isDesktop;
      final EdgeInsetsGeometry margin = isDesktop ? const EdgeInsets.fromLTRB(2, 5, 2, 2) : const EdgeInsets.fromLTRB(5, 8, 5, 8);

      final value = searchHandler.currentTab.secondaryBoorus ?? <Booru>[];

      return Padding(
        padding: margin,
        child: LoliMultiselectDropdown(
          value: value,
          onChanged: (List<Booru> value) {
            // if no secondary boorus selected, disable merge mode
            searchHandler.mergeAction(value.isNotEmpty ? value : null);
          },
          items: settingsHandler.booruList,
          itemBuilder: (item) => Container(
            padding: const EdgeInsets.only(left: 16),
            height: kMinInteractiveDimension,
            child: TabBooruSelectorItem(booru: item),
          ),
          labelText: 'Select secondary boorus:',
          selectedItemBuilder: (List<Booru> value) => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: [
                  for (final item in value)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: TabBooruSelectorItem(
                        booru: item,
                        compact: true,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
