import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/loli_dropdown.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_booru_selector.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_secondary_booru_selector.dart';

class MergeBooruToggleAndSelector extends StatelessWidget {
  const MergeBooruToggleAndSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final SearchHandler searchHandler = SearchHandler.instance;

    return Obx(() {
      if (settingsHandler.booruList.length < 2 || searchHandler.tabs.isEmpty) {
        return const SizedBox.shrink();
      }

      return Column(
        children: [
          SettingsToggle(
            title: context.loc.multibooru.multibooruMode,
            value: searchHandler.currentSecondaryBoorus.value?.isNotEmpty ?? false,
            drawBottomBorder: searchHandler.currentSecondaryBoorus.value?.isEmpty ?? true,
            onChanged: (newValue) {
              if (settingsHandler.booruList.length < 2) {
                FlashElements.showSnackbar(
                  context: context,
                  title: Text(
                    context.loc.errorExclamation,
                    style: const TextStyle(fontSize: 20),
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.loc.multibooru.multibooruRequiresAtLeastTwoBoorus,
                      ),
                    ],
                  ),
                  leadingIcon: Icons.error,
                  leadingIconColor: Colors.red,
                );
              } else {
                if (newValue) {
                  LoliMultiselectDropdown(
                    value: const <Booru>[],
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
                    labelText: context.loc.multibooru.selectSecondaryBoorus,
                    expandableByScroll: true,
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
                  ).showDialog(context);
                } else {
                  searchHandler.mergeAction(null);
                }
              }
            },
          ),
          Obx(() {
            final bool hasTabsAndTabHasSecondaryBoorus =
                searchHandler.tabs.isNotEmpty && (searchHandler.currentSecondaryBoorus.value?.isNotEmpty ?? false);

            return AnimatedSize(
              duration: const Duration(milliseconds: 200),
              alignment: Alignment.topCenter,
              child: (settingsHandler.booruList.length > 1 && hasTabsAndTabHasSecondaryBoorus)
                  ? const TabSecondaryBooruSelector()
                  : const SizedBox.shrink(),
            );
          }),
        ],
      );
    });
  }
}
