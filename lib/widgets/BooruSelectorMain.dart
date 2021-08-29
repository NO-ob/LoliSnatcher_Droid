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

    // TODO don't need this? settingsHandler should handle this
    // if (settingsHandler.booruList.isEmpty) {
    //   settingsHandler.getBooru();
    // }
    // if (settingsHandler.prefBooru == ""){
    //   settingsHandler.loadSettings();
    // }
    // if ((settingsHandler.prefBooru != "") && (settingsHandler.prefBooru != settingsHandler.booruList.elementAt(0).name)){
    //   settingsHandler.booruList = await settingsHandler.sortBooruList();
    // }


    // This null check is used otherwise the selected booru resets when the state changes, the state changes when a booru is selected
    if(searchHandler.list.length > 0) {
      // if (searchHandler.currentTab.selectedBooru.value == null){
      //   print("selectedBooru is null setting to: " + settingsHandler.booruList[0].toString());
      //   searchHandler.currentTab.selectedBooru.value = settingsHandler.booruList[0];
      // }
      // if (!settingsHandler.booruList.contains(searchHandler.currentTab.selectedBooru.value)){
      //   searchHandler.currentTab.selectedBooru.value = settingsHandler.booruList.firstWhere(
      //     (element) => element.name == searchHandler.currentTab.selectedBooru.value.name,
      //     orElse: () => settingsHandler.booruList[0]
      //   );
      //   print("booru changing because its not in the list");
      // }
    }

    if (!widget.isPrimary && searchHandler.currentTab.secondaryBoorus == null){
      print("secondary Booru is null setting to: " + settingsHandler.booruList[1].toString());
      searchHandler.currentTab.secondaryBoorus = [settingsHandler.booruList[1]].obs;
    }
  }

  bool isItemSelected (Booru value, bool checkPrimary) {
    if(checkPrimary) {
      return searchHandler.currentTab.selectedBooru.value == value;
    } else {
      return searchHandler.currentTab.secondaryBoorus?[0] == value;
    }
  }

  Widget BooruSelector() {
    // print('BooruSelector:');
    // for (var booru in settingsHandler.booruList) {
    //   print(booru);
    // }

    if(settingsHandler.booruList.isEmpty) {
      return Text('Add Boorus in Settings');
    }
    if(searchHandler.list.length == 0) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Get.theme.accentColor)
        )
      );
    }
    // if(!settingsHandler.booruList.contains(widget.isPrimary ? searchHandler.currentTab.selectedBooru.value : searchHandler.currentTab.secondaryBoorus?[0])) {
    //   return Center(child: CircularProgressIndicator());
    // }

    return Expanded(
      child: Container(
        constraints: BoxConstraints(maxHeight: 40, minHeight: 20),
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
                padding: EdgeInsets.all(5),
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
  @override
  Widget build(BuildContext context) {
    return BooruSelector();
  }
}
