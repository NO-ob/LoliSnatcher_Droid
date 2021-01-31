import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../SettingsHandler.dart';

class BooruSelector extends StatefulWidget {
  SettingsHandler settingsHandler;
  Booru selectedBooru;
  ValueNotifier selectedBooruNotifier = ValueNotifier("noListener");
  @override
  _BooruSelectorState createState() => _BooruSelectorState();
  BooruSelector(this.settingsHandler);
}

class _BooruSelectorState extends State<BooruSelector> {
  @override
  void initState() {
    super.initState();
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
  /** This Future function will call getBooru on the settingsHandler to load the booru configs
   * After these are loaded it returns a drop down list which is used to select which booru to search
   * **/
  Future BooruSelector() async{
    await widget.settingsHandler.getBooru();
    print("+++++++++++FUTURE+++++++++++++");
    if (widget.selectedBooru != null){
      print("Selected booru is ${widget.selectedBooru.name}");
    } else {
      print("Selected booru is null");
    }
    if (widget.selectedBooru == null && widget.settingsHandler.booruList.isNotEmpty){
      widget.selectedBooru = widget.settingsHandler.booruList[0];
      //widget.selectedBooruNotifier.value = widget.selectedBooru;
    }
    // This null check is used otherwise the selected booru resets when the state changes, the state changes when a booru is selected
    return Container(
      child: DropdownButton<Booru>(
        value: widget.selectedBooru,
        icon: Icon(Icons.arrow_downward),
        onChanged: (Booru newValue){
          setState((){
              print("setting selected booru to: ${newValue.name}");
              widget.selectedBooru = newValue;
              widget.selectedBooruNotifier.value = newValue;
          });
        },
        items: widget.settingsHandler.booruList.map<DropdownMenuItem<Booru>>((Booru value){
          // Return a dropdown item
          return DropdownMenuItem<Booru>(
            value: value,
            child: Row(
              children: <Widget>[
                //Booru name
                Text(value.name + ""),
                //Booru Icon
                Image.network(value.faviconURL, width: 16),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
