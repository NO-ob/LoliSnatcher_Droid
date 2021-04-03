import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BooruSelectorMain extends StatefulWidget {
  SearchGlobals searchGlobals;
  SettingsHandler settingsHandler;
  TextEditingController searchTagsController;
  final Function setParentGlobals;
  BooruSelectorMain(this.searchGlobals, this.settingsHandler, this.searchTagsController, this.setParentGlobals);
  @override
  _BooruSelectorMainState createState() => _BooruSelectorMainState();
}

class _BooruSelectorMainState extends State<BooruSelectorMain> {

  Future BooruSelector() async{
    if (widget.settingsHandler.booruList.isEmpty) {
      await widget.settingsHandler.getBooru();
    }
    if (widget.settingsHandler.prefBooru == ""){
      await widget.settingsHandler.loadSettings();
    }
    if ((widget.settingsHandler.prefBooru != "") && (widget.settingsHandler.prefBooru != widget.settingsHandler.booruList.elementAt(0).name)){
      widget.settingsHandler.booruList = await widget.settingsHandler.sortList();
    }
    // This null check is used otherwise the selected booru resets when the state changes, the state changes when a booru is selected
    if (widget.searchGlobals.selectedBooru == null){
      print("selectedBooru is null setting to: " + widget.settingsHandler.booruList[0].toString());
      widget.searchGlobals.selectedBooru = widget.settingsHandler.booruList[0];
      widget.searchGlobals.handlerType = widget.settingsHandler.booruList[0].type;
    }
    if (!widget.settingsHandler.booruList.contains(widget.searchGlobals.selectedBooru)){
      widget.searchGlobals.selectedBooru = widget.settingsHandler.booruList.firstWhere((element) =>
          element.name == widget.searchGlobals.selectedBooru!.name, orElse: () =>
          widget.settingsHandler.booruList[0]
      );
      print("booru changing because its not in the list");
      widget.searchGlobals.handlerType = widget.searchGlobals.selectedBooru!.type;
    }
    return Expanded(child: Container(
        constraints: BoxConstraints(maxHeight: 40, minHeight: 20),
        padding: EdgeInsets.fromLTRB(5, 0, 2, 0),
        decoration: BoxDecoration(
          color: Get.context!.theme.canvasColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Get.context!.theme.backgroundColor,
            width: 1,
          ),
        ),
        child: DropdownButton<Booru>(
          isExpanded: true,
          value: widget.searchGlobals.selectedBooru,
          icon: Icon(Icons.arrow_downward),
          underline: Container(height: 0,),
          onChanged: (Booru? newValue){
            setState((){
              if((widget.searchTagsController.text == "" || widget.searchTagsController.text == widget.settingsHandler.defTags) && newValue!.defTags != ""){
                widget.searchTagsController.text = newValue.defTags!;
              }
              // searchGlobals[globalsIndex].selectedBooru = newValue; // Just set new booru
              widget.setParentGlobals(new SearchGlobals(newValue, widget.searchTagsController.text));
              if(widget.searchTagsController.text != "" && widget.settingsHandler.searchHistoryEnabled) {
                widget.settingsHandler.dbHandler.updateSearchHistory(widget.searchTagsController.text, newValue?.type, newValue?.name);
              }
              // Set new booru and search with current tags
            });
          },
          items: widget.settingsHandler.booruList.map<DropdownMenuItem<Booru>>((Booru value){
            // Return a dropdown item
            return DropdownMenuItem<Booru>(
              value: value,
              child: Row(
                children: <Widget>[
                  //Booru Icon
                  value.type == "Favourites" ?
                  Icon(Icons.favorite,color: Colors.red, size: 18) :
                  Image.network(
                    value.faviconURL!,
                    width: 16,
                    errorBuilder: (_, __, ___) {
                      return Icon(Icons.broken_image, size: 18);
                    },
                  ),
                  //Booru name
                  Text(" ${value.name}"),
                ],
              ),
            );
          }).toList(),
        ),
      ));
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BooruSelector(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData){
          return snapshot.data;
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );

  }
}
