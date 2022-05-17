
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/widgets/MarqueeText.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/widgets/CachedFavicon.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:LoliSnatcher/widgets/TabBoxDialog.dart';


class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  final SearchHandler searchHandler = Get.find<SearchHandler>();
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();

  Future<bool> openTabsDialog() async {
    return await SettingsPageOpen(
      context: context,
      page: () => const TabBoxDialog(),
    ).open();
  }

  @override
  Widget build(BuildContext context) {
    // print('tabbox build');

    return Container(
      // constraints: settingsHandler.appMode.value == AppMode.DESKTOP ? BoxConstraints(maxHeight: 40, minHeight: 20, minWidth: 100) : null,
      padding: settingsHandler.appMode.value == AppMode.DESKTOP ? const EdgeInsets.fromLTRB(2, 5, 2, 2) : const EdgeInsets.fromLTRB(5, 8, 5, 8),
      child: Obx(() {
        List<SearchGlobal> list = searchHandler.list;
        int index = searchHandler.currentIndex;

        if (list.isEmpty) {
          return const SizedBox();
        }

        return GestureDetector(
          onLongPress: openTabsDialog,
          onSecondaryTap: openTabsDialog,
          child: DropdownButtonFormField<SearchGlobal>(
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
            dropdownColor: Get.theme.colorScheme.surface,
            onChanged: (SearchGlobal? newValue) {
              if (newValue != null) {
                searchHandler.changeTabIndex(list.indexOf(newValue));
              }
            },
            selectedItemBuilder: (BuildContext context) {
              return list.map<DropdownMenuItem<SearchGlobal>>((SearchGlobal value) {
                return DropdownMenuItem<SearchGlobal>(
                  value: value,
                  child: TabBoxRow(key: ValueKey(value), tab: value),
                );
              }).toList();
            },
            items: list.map<DropdownMenuItem<SearchGlobal>>((SearchGlobal value) {
              bool isCurrent = list.indexOf(value) == index;

              return DropdownMenuItem<SearchGlobal>(
                value: value,
                child: Container(
                  padding: settingsHandler.appMode.value == AppMode.DESKTOP ? const EdgeInsets.all(5) : const EdgeInsets.fromLTRB(5, 10, 5, 10),
                  decoration: isCurrent
                      ? BoxDecoration(
                          border: Border.all(color: Get.theme.colorScheme.secondary, width: 1),
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
  }) : super(key: key);

  final SearchGlobal tab;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isNotEmptyBooru = tab.selectedBooru.value.faviconURL != null;

      // print(value.tags);
      int? totalCount = tab.booruHandler.totalCount.value;
      String totalCountText = (totalCount > 0) ? " ($totalCount)" : "";
      String tagText = "${tab.tags == "" ? "[No Tags]" : tab.tags}$totalCountText";

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
              color: tab.tags == "" ? Colors.grey : null,
            ),
          ],
        ),
      );
    });
  }
}
