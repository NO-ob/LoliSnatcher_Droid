import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/widgets/CachedFavicon.dart';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BooruSelectorMain extends StatefulWidget {
  final bool isPrimary;
  BooruSelectorMain(this.isPrimary);
  @override
  _BooruSelectorMainState createState() => _BooruSelectorMainState();
}

class _BooruSelectorMainState extends State<BooruSelectorMain> {
  final SettingsHandler settingsHandler = Get.find();
  final SearchHandler searchHandler = Get.find();

  final GlobalKey dropdownKey = GlobalKey();
  GestureDetector? detector;

  @override
  void initState() {
    super.initState();

    if (!widget.isPrimary && searchHandler.currentTab.secondaryBoorus == null && settingsHandler.booruList.length > 1) {
      List<Booru> leftoverBoorus = settingsHandler.booruList.where((booru) => booru.name != searchHandler.currentTab.selectedBooru.value.name).toList();
      print("secondary Booru is null setting to: " + leftoverBoorus[1].toString());
      searchHandler.currentTab.secondaryBoorus = [leftoverBoorus[1]].obs;
    }
  }

  // TODO fix this
  // dropdownbutton small clickable zone workaround when using inputdecoration
  // code from: https://github.com/flutter/flutter/issues/53634
  void openItemsList() {
    void search(BuildContext? context) {
      context?.visitChildElements((element) {
        if (detector != null) return;
        if (element.widget != null && element.widget is GestureDetector)
          detector = element.widget as GestureDetector;
        else
          search(element);
      });
    }

    search(dropdownKey.currentContext);
    if (detector != null) detector!.onTap?.call();
  }

  bool isItemSelected (Booru value, bool checkPrimary) {
    if(checkPrimary) {
      return searchHandler.currentTab.selectedBooru.value == value;
    } else {
      return searchHandler.currentTab.secondaryBoorus?[0] == value;
    }
  }

  @override
  Widget build(BuildContext context) {
    // print('BooruSelector:');
    // for (var booru in settingsHandler.booruList) {
    //   print(booru);
    // }

    // no boorus
    if(settingsHandler.booruList.isEmpty) {
      return Center(
        child: Text('Add Boorus in Settings'),
      );
    }

    // no tabs
    if(searchHandler.list.length == 0) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Get.theme.colorScheme.secondary)
        )
      );
    }

    // protection from exceptions when somehow selected booru is not on the list
    if(!settingsHandler.booruList.contains(widget.isPrimary ? searchHandler.currentTab.selectedBooru.value : searchHandler.currentTab.secondaryBoorus?[0])) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Get.theme.colorScheme.secondary)
        )
      );
    }

    if(!widget.isPrimary)
      return Expanded(
        child: Obx(() => DropdownSearch<Booru>.multiSelection(
          mode: Mode.MENU,
          // showSearchBox: true,
          items: settingsHandler.booruList.where((b) => b != searchHandler.currentTab.selectedBooru.value).toList(),
          label: "Secondary Boorus",
          hint: "Secondary Boorus",
          onChange: (List<Booru> newList) {
            searchHandler.mergeAction(newList);
          },
          popupItemBuilder: (BuildContext context, Booru? value, bool isSelected) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: <Widget>[
                  //Booru Icon
                  value?.type == "Favourites"
                    ? Icon(Icons.favorite,color: Colors.red, size: 18)
                    : CachedFavicon(value!.faviconURL!),
                  //Booru name
                  Text(" ${value?.name}"),
                ],
              )
            );
          },
          popupSelectionWidget: (BuildContext context, Booru item, bool isSelected) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: Checkbox(
                value: isSelected,
                onChanged: (bool? value) {},
                activeColor: Get.theme.colorScheme.secondary,
              ),
            );
          },
          dropdownSearchDecoration: InputDecoration(
            labelStyle: TextStyle(color: Get.theme.colorScheme.onBackground),
            contentPadding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Get.theme.colorScheme.secondary)
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Get.theme.colorScheme.secondary)
            ),
          ),
          dropdownBuilder: (BuildContext context, List<Booru> selectedItems) {
            if (selectedItems.isEmpty) {
              return ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Icon(null),
                title: Text("No boorus selected"),
              );
            }

            return Wrap(
              children: selectedItems.map((value) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: <Widget>[
                      //Booru Icon
                      value.type == "Favourites"
                        ? Icon(Icons.favorite,color: Colors.red, size: 18)
                        : CachedFavicon(value.faviconURL!),
                      //Booru name
                      Text(" ${value.name}"),
                    ],
                  )
                );
              }).toList(),
            );
          },
          selectedItems: searchHandler.currentTab.secondaryBoorus ?? []
        ))
      );

    return Container(
      // constraints: settingsHandler.appMode == 'Desktop' ? BoxConstraints(maxHeight: 40, minHeight: 20) : null,
      padding: settingsHandler.appMode == 'Desktop' ? EdgeInsets.fromLTRB(2, 5, 2, 2) : EdgeInsets.fromLTRB(5, 8, 5, 8),
      child: Obx(() => GestureDetector(
        onTap: openItemsList,
        child: DropdownButtonFormField<Booru>(
          key: dropdownKey,
          isExpanded: true,
          value: widget.isPrimary ? searchHandler.currentTab.selectedBooru.value : searchHandler.currentTab.secondaryBoorus?[0],
          icon: Icon(Icons.arrow_drop_down),
          // underline: const SizedBox(),
          decoration: InputDecoration(
            labelText: 'Booru',
            labelStyle: TextStyle(color: Get.theme.colorScheme.onBackground),
            // contentPadding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            contentPadding: settingsHandler.appMode == 'Desktop' ? EdgeInsets.symmetric(horizontal: 12, vertical: 2) : EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Get.theme.colorScheme.secondary),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Get.theme.colorScheme.secondary),
            ),
          ),
          dropdownColor: Get.theme.cardColor,
          onChanged: (Booru? newValue) {
            if((widget.isPrimary ? searchHandler.currentTab.selectedBooru.value : searchHandler.currentTab.secondaryBoorus?[0]) != newValue) { // if not already selected
              if(widget.isPrimary) {
                searchHandler.searchAction(searchHandler.searchTextController.text, newValue!);
              } else {
                searchHandler.mergeAction([newValue!]);
              }
            }
          },
          selectedItemBuilder: (BuildContext context) {
            return settingsHandler.booruList.map<DropdownMenuItem<Booru>>((Booru value) {
              return DropdownMenuItem<Booru>(
                value: value,
                child: Container(
                  // padding: settingsHandler.appMode == 'Desktop' ? EdgeInsets.all(5) : EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: Row(
                    children: <Widget>[
                      //Booru Icon
                      value.type == "Favourites"
                        ? Icon(Icons.favorite,color: Colors.red, size: 18)
                        : CachedFavicon(value.faviconURL!),
                      //Booru name
                      Text(" ${value.name}"),
                    ],
                  )
                ),
              );
            }).toList();
          },
          items: settingsHandler.booruList.where((Booru booru) {
            if(widget.isPrimary) {
              return true;
            } else {
              bool isCurrent = isItemSelected(booru, true);
              return !isCurrent;
            }
          }).map<DropdownMenuItem<Booru>>((Booru value) {
            bool isCurrent = isItemSelected(value, widget.isPrimary);
            // Return a dropdown item
            return DropdownMenuItem<Booru>(
              value: value,
              child: Container(
                padding: settingsHandler.appMode == 'Desktop' ? EdgeInsets.all(5) : EdgeInsets.fromLTRB(5, 10, 5, 10),
                decoration: isCurrent
                ? BoxDecoration(
                  border: Border.all(color: Get.theme.colorScheme.secondary, width: 1),
                  borderRadius: BorderRadius.circular(5),
                )
                : null,
                child: Row(
                  children: <Widget>[
                    //Booru Icon
                    value.type == "Favourites"
                      ? Icon(Icons.favorite,color: Colors.red, size: 18)
                      : CachedFavicon(value.faviconURL!),
                    //Booru name
                    Text(" ${value.name}"),
                  ],
                )
              ),
            );
          }).toList(),
        )
      )),
    );
  }
}
