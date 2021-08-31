import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/widgets/CachedFavicon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BooruSelectorMain extends StatefulWidget {
  bool isPrimary = true;
  BooruSelectorMain(this.isPrimary);
  @override
  _BooruSelectorMainState createState() => _BooruSelectorMainState();
}

class _BooruSelectorMainState extends State<BooruSelectorMain> {
  final SettingsHandler settingsHandler = Get.find();
  final SearchHandler searchHandler = Get.find();

  @override
  void initState() {
    super.initState();

    if (!widget.isPrimary && searchHandler.currentTab.secondaryBoorus == null && settingsHandler.booruList.length > 1) {
      List<Booru> leftoverBoorus = settingsHandler.booruList.where((booru) => booru.name != searchHandler.currentTab.selectedBooru.value.name).toList();
      print("secondary Booru is null setting to: " + leftoverBoorus[1].toString());
      searchHandler.currentTab.secondaryBoorus = [leftoverBoorus[1]].obs;
    }
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
      return Text('Add Boorus in Settings');
    }

    // no tabs
    if(searchHandler.list.length == 0) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Get.theme.accentColor)
        )
      );
    }

    // protection from exceptions when somehow selected booru is not on the list
    if(!settingsHandler.booruList.contains(widget.isPrimary ? searchHandler.currentTab.selectedBooru.value : searchHandler.currentTab.secondaryBoorus?[0])) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Get.theme.accentColor)
        )
      );
    }

    return Expanded(
      child: Container(
        constraints: settingsHandler.appMode == 'Desktop' ? BoxConstraints(maxHeight: 40, minHeight: 20) : null,
        padding: EdgeInsets.fromLTRB(5, 0, 2, 0),
        decoration: BoxDecoration(
          color: Get.theme.canvasColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Get.theme.backgroundColor,
            width: 1,
          ),
        ),
        child: Obx(() => DropdownButton<Booru>(
          isExpanded: true,
          value: widget.isPrimary ? searchHandler.currentTab.selectedBooru.value : searchHandler.currentTab.secondaryBoorus?[0],
          icon: Icon(Icons.arrow_downward),
          underline: const SizedBox(),
          dropdownColor: Get.theme.cardColor,
          onChanged: (Booru? newValue) {
            if((widget.isPrimary ? searchHandler.currentTab.selectedBooru.value : searchHandler.currentTab.secondaryBoorus?[0]) != newValue) { // if not already selected
              if(widget.isPrimary) {
                // if((searchHandler.searchTextController.text == "" || searchHandler.searchTextController.text == settingsHandler.defTags) && newValue!.defTags != ""){
                //   searchHandler.searchTextController.text = newValue.defTags!;
                // }
                searchHandler.searchAction(searchHandler.searchTextController.text, newValue!);
              } else {
                searchHandler.mergeAction([newValue!]);
              }
            }
          },
          items: settingsHandler.booruList.where((Booru booru) {
            if(widget.isPrimary) {
              return true;
            } else {
              bool isCurrent = isItemSelected(booru, true);
              return !isCurrent;
            }
          }).map<DropdownMenuItem<Booru>>((Booru value){
            bool isCurrent = isItemSelected(value, widget.isPrimary);
            // Return a dropdown item
            return DropdownMenuItem<Booru>(
              value: value,
              child: Container(
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                decoration: isCurrent
                ? BoxDecoration(
                  border: Border.all(color: Get.theme.accentColor, width: 1),
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
        )),
      )
    );
  }
}
