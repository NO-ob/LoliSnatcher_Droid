
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/src/handlers/search_handler.dart';
import 'package:LoliSnatcher/widgets/MarqueeText.dart';
import 'package:LoliSnatcher/src/handlers/settings_handler.dart';
import 'package:LoliSnatcher/widgets/CachedFavicon.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:LoliSnatcher/widgets/TabBoxDialog.dart';


class TabBox extends StatelessWidget {
  const TabBox({Key? key}) : super(key: key);

  Future<bool> openTabsDialog(context) async {
    return await SettingsPageOpen(
      context: context,
      page: () => const TabBoxDialog(),
    ).open();
  }

  @override
  Widget build(BuildContext context) {
    final SearchHandler searchHandler = SearchHandler.instance;
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    // print('tabbox build');

    return Container(
      // constraints: settingsHandler.appMode.value == AppMode.DESKTOP ? BoxConstraints(maxHeight: 40, minHeight: 20, minWidth: 100) : null,
      padding: settingsHandler.appMode.value == AppMode.DESKTOP ? const EdgeInsets.fromLTRB(2, 5, 2, 2) : const EdgeInsets.fromLTRB(5, 8, 5, 8),
      child: Obx(() {
        List<SearchTab> list = searchHandler.list;
        int index = searchHandler.currentIndex;

        if (list.isEmpty) {
          return const SizedBox();
        }

        return GestureDetector(
          onLongPress: () => openTabsDialog(context),
          onSecondaryTap: () => openTabsDialog(context),
          child: DropdownButtonFormField<SearchTab>(
            isExpanded: true,
            value: list[index],
            icon: const Icon(Icons.arrow_drop_down),
            itemHeight: kMinInteractiveDimension,
            decoration: InputDecoration(
              labelText: 'Tab (${searchHandler.currentIndex + 1}/${searchHandler.total})',
              contentPadding: settingsHandler.appMode.value == AppMode.DESKTOP
                  ? const EdgeInsets.symmetric(horizontal: 12, vertical: 2)
                  : const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            onChanged: (SearchTab? newValue) {
              if (newValue != null) {
                searchHandler.changeTabIndex(list.indexOf(newValue));
              }
            },
            selectedItemBuilder: (BuildContext context) {
              return list.map<DropdownMenuItem<SearchTab>>((SearchTab value) {
                return DropdownMenuItem<SearchTab>(
                  value: value,
                  child: TabBoxRow(key: ValueKey(value), tab: value),
                );
              }).toList();
            },
            items: list.map<DropdownMenuItem<SearchTab>>((SearchTab value) {
              bool isCurrent = list.indexOf(value) == index;

              return DropdownMenuItem<SearchTab>(
                value: value,
                child: Container(
                  padding: settingsHandler.appMode.value == AppMode.DESKTOP ? const EdgeInsets.all(5) : const EdgeInsets.fromLTRB(5, 10, 5, 10),
                  decoration: isCurrent
                    ? BoxDecoration(
                        border: Border.all(color: Theme.of(context).colorScheme.secondary, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      )
                    : null,
                  child: TabBoxRow(key: ValueKey(value), tab: value),
                ),
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}

class TabBoxRow extends StatelessWidget {
  const TabBoxRow({
    Key? key,
    required this.tab,
    this.color,
    this.fontWeight,
  }) : super(key: key);

  final SearchTab tab;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // print(value.tags);
      final int totalCount = tab.booruHandler.totalCount.value;
      final String totalCountText = (totalCount > 0) ? " ($totalCount)" : "";
      final String tagText = "${tab.tags == "" ? "[No Tags]" : tab.tags}$totalCountText";

      final bool hasItems = tab.booruHandler.filteredFetched.isNotEmpty;
      final bool isNotEmptyBooru = tab.selectedBooru.value.faviconURL != null;

      return SizedBox(
        width: double.maxFinite,
        child: Row(
          children: [
            isNotEmptyBooru
                ? (tab.selectedBooru.value.type == "Favourites"
                    ? const Icon(Icons.favorite, color: Colors.red, size: 18)
                    : CachedFavicon(tab.selectedBooru.value.faviconURL!))
                : const Icon(CupertinoIcons.question, size: 18),
            const SizedBox(width: 3),
            MarqueeText(
              key: ValueKey(tagText),
              text: tagText,
              fontSize: 16,
              fontStyle: hasItems ? FontStyle.normal : FontStyle.italic,
              fontWeight: fontWeight ?? FontWeight.normal,
              color: color ?? (tab.tags == "" ? Colors.grey : null),
            ),
          ],
        ),
      );
    });
  }
}
