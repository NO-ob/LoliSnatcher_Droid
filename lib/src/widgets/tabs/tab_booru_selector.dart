import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/widgets/image/favicon.dart';
import 'package:lolisnatcher/src/widgets/common/marquee_text.dart';
import 'package:lolisnatcher/src/data/settings/app_mode.dart';

class TabBooruSelector extends StatelessWidget {
  const TabBooruSelector(this.isPrimary, {Key? key}) : super(key: key);
  final bool isPrimary;

  Widget buildRow(Booru? value) {
    if (value == null) {
      return const Text('???');
    }

    String name = " ${value.name}";

    return Row(
      children: <Widget>[
        //Booru Icon
        value.type == "Favourites" ? const Icon(Icons.favorite, color: Colors.red, size: 18) : Favicon(value.faviconURL!),
        //Booru name
        MarqueeText(
          key: ValueKey(name),
          text: name,
          fontSize: 16,
        ),
        // Text(name),
      ],
    );
  }

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

      // dropdown for secondary boorus
      if (!isPrimary) {
        return Container(
          padding: settingsHandler.appMode.value == AppMode.DESKTOP ? const EdgeInsets.fromLTRB(2, 5, 2, 2) : const EdgeInsets.fromLTRB(5, 8, 5, 8),
          child: Obx(() => DropdownSearch<Booru>.multiSelection(
              // showSearchBox: true,
              items: settingsHandler.booruList,
              onChanged: (List<Booru> newList) {
                if (newList.isNotEmpty) {
                  searchHandler.mergeAction(newList);
                } else {
                  // if no secondary boorus selected, disable merge mode
                  settingsHandler.mergeEnabled.value = false;
                  searchHandler.mergeAction(null);
                  // TODO add .drawerRestate()
                  searchHandler.rootRestate();
                }
              },
              popupProps: PopupPropsMultiSelection.menu(
                itemBuilder: (BuildContext context, Booru? value, bool isSelected) {
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: buildRow(value),
                  );
                },
                selectionWidget: (BuildContext context, Booru item, bool isSelected) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Checkbox(
                      value: isSelected,
                      onChanged: (bool? value) {},
                    ),
                  );
                },
              ),
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Secondary Boorus",
                  hintText: "Secondary Boorus",
                  contentPadding: settingsHandler.appMode.value == AppMode.DESKTOP
                      ? const EdgeInsets.symmetric(horizontal: 12, vertical: 2)
                      : const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
              dropdownBuilder: (BuildContext context, List<Booru> selectedItems) {
                if (selectedItems.isEmpty) {
                  return const ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: Icon(null),
                    title: Text("No boorus selected"),
                  );
                }

                return Wrap(
                  children: selectedItems.map((value) {
                    return Padding(
                      padding: const EdgeInsets.all(4),
                      child: buildRow(value),
                    );
                  }).toList(),
                );
              },
              selectedItems: searchHandler.currentTab.secondaryBoorus ?? [])),
        );
      }

      // dropdown for primary booru
      return Container(
        // constraints: settingsHandler.appMode.value == AppMode.DESKTOP ? BoxConstraints(maxHeight: 40, minHeight: 20) : null,
        padding: settingsHandler.appMode.value == AppMode.DESKTOP ? const EdgeInsets.fromLTRB(2, 5, 2, 2) : const EdgeInsets.fromLTRB(5, 8, 5, 8),
        child: Obx(() {
          Booru? selectedBooru = searchHandler.currentBooru;
          // protection from exceptions when somehow selected booru is not on the list
          if (!settingsHandler.booruList.contains(isPrimary ? selectedBooru : searchHandler.currentTab.secondaryBoorus?[0])) {
            selectedBooru = null;
          }

          return DropdownButtonFormField<Booru>(
            isExpanded: true,
            value: selectedBooru,
            icon: const Icon(Icons.arrow_drop_down),
            itemHeight: kMinInteractiveDimension,
            decoration: InputDecoration(
              labelText: 'Booru',
              hintText: 'Booru',
              contentPadding: settingsHandler.appMode.value == AppMode.DESKTOP
                  ? const EdgeInsets.symmetric(horizontal: 12, vertical: 2)
                  : const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            onChanged: (Booru? newValue) {
              if (searchHandler.currentBooru != newValue) {
                // if not already selected
                searchHandler.searchAction(searchHandler.searchTextController.text, newValue!);
              }
            },
            selectedItemBuilder: (BuildContext context) {
              return settingsHandler.booruList.map<DropdownMenuItem<Booru>>((Booru value) {
                return DropdownMenuItem<Booru>(
                  value: value,
                  child: Container(
                    child: buildRow(value),
                  ),
                );
              }).toList();
            },
            items: settingsHandler.booruList.map<DropdownMenuItem<Booru>>((Booru value) {
              bool isCurrent = false;
              if (isPrimary) {
                isCurrent = searchHandler.currentBooru == value;
              } else {
                isCurrent = searchHandler.currentTab.secondaryBoorus?[0] == value;
              }

              // Return a dropdown item
              return DropdownMenuItem<Booru>(
                value: value,
                child: Container(
                  padding: settingsHandler.appMode.value == AppMode.DESKTOP ? const EdgeInsets.all(5) : const EdgeInsets.fromLTRB(5, 10, 5, 10),
                  decoration: isCurrent
                      ? BoxDecoration(
                          border: Border.all(color: Theme.of(context).colorScheme.secondary, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        )
                      : null,
                  child: buildRow(value),
                ),
              );
            }).toList(),
          );
        }),
      );
    });
  }
}
