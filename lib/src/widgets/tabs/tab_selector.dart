import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_manager_dialog.dart';
import 'package:lolisnatcher/src/widgets/tabs/tab_row.dart';

class TabSelector extends StatelessWidget {
  const TabSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    final bool isDesktop = settingsHandler.appMode.value.isDesktop;
    final EdgeInsetsGeometry padding = isDesktop ? const EdgeInsets.fromLTRB(2, 5, 2, 2) : const EdgeInsets.fromLTRB(5, 8, 5, 8);
    final EdgeInsetsGeometry contentPadding = EdgeInsets.symmetric(horizontal: 12, vertical: isDesktop ? 2 : 8);

    return TabSelectorRender(
      isDesktop: isDesktop,
      padding: padding,
      contentPadding: contentPadding,
    );
  }
}

class TabSelectorHeader extends StatelessWidget {
  const TabSelectorHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;

    final bool isDesktop = settingsHandler.appMode.value.isDesktop;
    const EdgeInsetsGeometry padding = EdgeInsets.fromLTRB(5, 10, 2, 0);
    const EdgeInsetsGeometry contentPadding = EdgeInsets.symmetric(horizontal: 4, vertical: 8);
    const Color borderColor = Colors.transparent;
    final Color textColor = Theme.of(context).colorScheme.onPrimary;

    return TabSelectorRender(
      isDesktop: isDesktop,
      padding: padding,
      contentPadding: contentPadding,
      borderColor: borderColor,
      textColor: textColor,
    );
  }
}

class TabSelectorRender extends StatelessWidget {
  const TabSelectorRender({
    Key? key,
    required this.isDesktop,
    required this.padding,
    required this.contentPadding,
    this.borderColor,
    this.textColor,
  }) : super(key: key);

  final bool isDesktop;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry contentPadding;
  final Color? borderColor;
  final Color? textColor;

  Future<bool> openTabsDialog(context) async {
    return await SettingsPageOpen(
      context: context,
      page: () => const TabManagerDialog(),
    ).open();
  }

  @override
  Widget build(BuildContext context) {
    final SearchHandler searchHandler = SearchHandler.instance;

    // print('tabbox build');

    return Container(
      padding: padding,
      child: Obx(() {
        List<SearchTab> list = searchHandler.list;
        int index = searchHandler.currentIndex;

        if (list.isEmpty) {
          return const SizedBox();
        }

        Color currentBorderColor = borderColor ?? Theme.of(context).colorScheme.secondary;

        return GestureDetector(
          onLongPress: () => openTabsDialog(context),
          onSecondaryTap: () => openTabsDialog(context),
          child: DropdownButtonFormField<SearchTab>(
            isExpanded: true,
            value: list[index],
            icon: Icon(Icons.arrow_drop_down, color: textColor),
            itemHeight: kMinInteractiveDimension,
            decoration: InputDecoration(
              labelText: 'Tab | ${searchHandler.currentIndex + 1}/${searchHandler.total}',
              labelStyle: Theme.of(context).inputDecorationTheme.labelStyle!.copyWith(
                    color: textColor ?? Theme.of(context).inputDecorationTheme.labelStyle!.color,
                  ),
              contentPadding: contentPadding,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: currentBorderColor, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: currentBorderColor, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: currentBorderColor, width: 2),
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
                bool isCurrent = list.indexOf(value) == index;

                return DropdownMenuItem<SearchTab>(
                  value: value,
                  child: TabRow(key: ValueKey(value), tab: value, color: textColor, withFavicon: isCurrent),
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
