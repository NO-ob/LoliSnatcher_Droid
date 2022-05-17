import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/widgets/CachedFavicon.dart';
import 'package:LoliSnatcher/widgets/MarqueeText.dart';

class BooruSelectorMain extends StatefulWidget {
  final bool isPrimary;
  const BooruSelectorMain(this.isPrimary, {Key? key}) : super(key: key);

  @override
  State<BooruSelectorMain> createState() => _BooruSelectorMainState();
}

class _BooruSelectorMainState extends State<BooruSelectorMain> {
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final SearchHandler searchHandler = Get.find<SearchHandler>();

  @override
  void initState() {
    super.initState();
  }

  bool isItemSelected(Booru value, bool checkPrimary) {
    if (checkPrimary) {
      return searchHandler.currentTab.selectedBooru.value == value;
    } else {
      return searchHandler.currentTab.secondaryBoorus?[0] == value;
    }
  }

  Widget buildRow(Booru? value) {
    if (value == null) {
      return const Text('???');
    }

    String name = " ${value.name}";

    return Row(
      children: <Widget>[
        //Booru Icon
        value.type == "Favourites" ? const Icon(Icons.favorite, color: Colors.red, size: 18) : CachedFavicon(value.faviconURL!),
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
    return Obx(() {
      // no boorus
      if (settingsHandler.booruList.isEmpty) {
        return const Center(
          child: Text('Add Boorus in Settings'),
        );
      }

      // no tabs
      if (searchHandler.list.isEmpty) {
        return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Get.theme.colorScheme.secondary)));
      }

      // dropdown for secondary boorus
      if (!widget.isPrimary) {
        return Container(
          padding: settingsHandler.appMode.value == AppMode.DESKTOP ? const EdgeInsets.fromLTRB(2, 5, 2, 2) : const EdgeInsets.fromLTRB(5, 8, 5, 8),
          child: Obx(() => DropdownSearch<Booru>.multiSelection(
              mode: Mode.MENU,
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
              popupItemBuilder: (BuildContext context, Booru? value, bool isSelected) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: buildRow(value),
                );
              },
              popupSelectionWidget: (BuildContext context, Booru item, bool isSelected) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Checkbox(
                    value: isSelected,
                    onChanged: (bool? value) {},
                    activeColor: Get.theme.colorScheme.secondary,
                  ),
                );
              },
              dropdownSearchDecoration: InputDecoration(
                labelText: "Secondary Boorus",
                hintText: "Secondary Boorus",
                contentPadding: settingsHandler.appMode.value == AppMode.DESKTOP
                    ? const EdgeInsets.symmetric(horizontal: 12, vertical: 2)
                    : const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
          Booru? selectedBooru = searchHandler.currentTab.selectedBooru.value;
          // protection from exceptions when somehow selected booru is not on the list
          if (!settingsHandler.booruList.contains(widget.isPrimary ? searchHandler.currentTab.selectedBooru.value : searchHandler.currentTab.secondaryBoorus?[0])) {
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
            dropdownColor: Get.theme.colorScheme.surface,
            onChanged: (Booru? newValue) {
              if (searchHandler.currentTab.selectedBooru.value != newValue) {
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
              bool isCurrent = isItemSelected(value, widget.isPrimary);
              // Return a dropdown item
              return DropdownMenuItem<Booru>(
                value: value,
                child: Container(
                  padding: settingsHandler.appMode.value == AppMode.DESKTOP ? const EdgeInsets.all(5) : const EdgeInsets.fromLTRB(5, 10, 5, 10),
                  decoration: isCurrent
                      ? BoxDecoration(
                          border: Border.all(color: Get.theme.colorScheme.secondary, width: 1),
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
