import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/loli_dropdown.dart';
import 'package:lolisnatcher/src/widgets/common/marquee_text.dart';
import 'package:lolisnatcher/src/widgets/image/booru_favicon.dart';

class TabBooruSelector extends StatelessWidget {
  const TabBooruSelector({
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
      if (searchHandler.tabs.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      Booru? selectedBooru = searchHandler.currentBooru;
      // protection from exceptions when somehow selected booru is not on the list
      if (!settingsHandler.booruList.contains(selectedBooru)) {
        selectedBooru = null;
      }

      final bool isDesktop = settingsHandler.appMode.value.isDesktop;
      final EdgeInsetsGeometry margin = isDesktop
          ? const EdgeInsets.fromLTRB(2, 5, 2, 2)
          : const EdgeInsets.fromLTRB(5, 8, 5, 8);

      return Padding(
        padding: margin,
        child: LoliDropdown(
          value: selectedBooru,
          onChanged: (Booru? newValue) {
            if (searchHandler.currentBooru != newValue) {
              // if not already selected
              searchHandler.searchAction(searchHandler.searchTextController.text, newValue);
            }
          },
          expandableByScroll: true,
          items: settingsHandler.booruList,
          itemExtent: kMinInteractiveDimension,
          itemBuilder: (item) {
            final bool isCurrent = selectedBooru == item;

            if (item == null) {
              return const SizedBox.shrink();
            }

            return Container(
              padding: isDesktop ? const EdgeInsets.all(5) : const EdgeInsets.only(left: 16, right: 16),
              height: kMinInteractiveDimension,
              decoration: isCurrent
                  ? BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                    )
                  : null,
              child: TabBooruSelectorItem(booru: item),
            );
          },
          selectedItemBuilder: (value) {
            if (value == null) {
              return const Text('Select a Booru');
            }

            return TabBooruSelectorItem(booru: value);
          },
          labelText: 'Booru',
        ),
      );
    });
  }
}

class TabBooruSelectorItem extends StatelessWidget {
  const TabBooruSelectorItem({
    required this.booru,
    this.withFavicon = true,
    this.compact = false,
    this.extraText,
    super.key,
  });

  final Booru booru;
  final bool withFavicon;
  final bool compact;
  final String? extraText;

  @override
  Widget build(BuildContext context) {
    final String name = ' ${booru.name}${extraText?.isNotEmpty == true ? extraText : ''}';

    return Row(
      mainAxisSize: compact ? MainAxisSize.min : MainAxisSize.max,
      children: [
        //Booru Icon
        if (withFavicon) ...[
          BooruFavicon(booru),
          const SizedBox(width: 4),
        ],
        //Booru name
        MarqueeText(
          key: ValueKey(name),
          text: name,
          isExpanded: !compact,
        ),
      ],
    );
  }
}
