import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_manager_dialog.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_row.dart';

class TabSelector extends StatelessWidget {
  const TabSelector({
    Key? key,
    this.topMode = false,
  }) : super(key: key);

  /// If this widget is placed in ActiveTitle, true - disable colored border and change padding a bit
  final bool topMode;

  Future<bool> openTabsDialog(context) async {
    return await SettingsPageOpen(
      context: context,
      page: () => const TabManagerDialog(),
    ).open();
  }

  @override
  Widget build(BuildContext context) {
    final SearchHandler searchHandler = SearchHandler.instance;
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    // print('tabbox build');

    final bool isDesktop = settingsHandler.appMode.value.isDesktop;
    final EdgeInsetsGeometry padding = topMode
        ? const EdgeInsets.fromLTRB(2, 10, 2, 0)
        : (isDesktop ? const EdgeInsets.fromLTRB(2, 5, 2, 2) : const EdgeInsets.fromLTRB(5, 8, 5, 8));
    final EdgeInsetsGeometry contentPadding = topMode
        ? const EdgeInsets.symmetric(horizontal: 4, vertical: 8)
        : EdgeInsets.symmetric(horizontal: 12, vertical: isDesktop ? 2 : 8);

    final Color borderColor = topMode ? Colors.transparent : Theme.of(context).colorScheme.secondary;

    return Container(
      // constraints: isDesktop ? BoxConstraints(maxHeight: 40, minHeight: 20, minWidth: 100) : null,
      padding: padding,
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
              contentPadding: contentPadding,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
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
                  child: TabRow(key: ValueKey(value), tab: value),
                );
              }).toList();
            },
            items: list.map<DropdownMenuItem<SearchTab>>((SearchTab value) {
              bool isCurrent = list.indexOf(value) == index;

              return DropdownMenuItem<SearchTab>(
                value: value,
                child: Container(
                  padding: isDesktop ? const EdgeInsets.all(5) : const EdgeInsets.fromLTRB(5, 10, 5, 10),
                  decoration: isCurrent
                      ? BoxDecoration(
                          border: Border.all(color: Theme.of(context).colorScheme.secondary, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        )
                      : null,
                  child: TabRow(key: ValueKey(value), tab: value),
                ),
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}
