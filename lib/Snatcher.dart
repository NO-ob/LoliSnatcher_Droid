//import 'dart:html';
import 'package:LoliSnatcher/SnatchHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruHandlerFactory.dart';
import 'package:flutter/material.dart';
import 'libBooru/BooruItem.dart';
import 'libBooru/GelbooruHandler.dart';
import 'libBooru/MoebooruHandler.dart';
import 'libBooru/PhilomenaHandler.dart';
import 'libBooru/DanbooruHandler.dart';
import 'libBooru/ShimmieHandler.dart';
import 'libBooru/BooruHandler.dart';
import 'libBooru/e621Handler.dart';
import 'libBooru/Booru.dart';
import 'ImageWriter.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'getPerms.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';


/**
 * This is the page which allows the user to batch download images
 */
class SnatcherPage extends StatefulWidget {
  final String tags;
  Booru booru;
  SettingsHandler settingsHandler;
  SnatchHandler snatchHandler;
  SnatcherPage(this.tags,this.booru,this.settingsHandler, this.snatchHandler);
  @override
  _SnatcherPageState createState() => _SnatcherPageState();
}

class _SnatcherPageState extends State<SnatcherPage> {
  final snatcherTagsController = TextEditingController();
  final snatcherAmountController = TextEditingController();
  final snatcherSleepController = TextEditingController();
  @override
  void initState() {
    super.initState();
    getPerms();
    //If the user has searched tags on the main window they will be loaded into the tags field
    if (widget.tags != ""){
      snatcherTagsController.text = widget.tags;
    }
    snatcherSleepController.text = widget.settingsHandler.snatchCooldown.toString();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Snatcher")
      ),
      body:Center(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Tags: "),
                  new Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                      child: TextField(
                        controller: snatcherTagsController,
                        decoration: InputDecoration(
                          hintText:"Enter Tags",
                          contentPadding: new EdgeInsets.fromLTRB(15,0,0,0), // left,right,top,bottom
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(50),
                            gapPadding: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Amount: "),
                  new Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                      child: TextField(
                        controller: snatcherAmountController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          hintText:"Amount of Images to Snatch",
                          contentPadding: new EdgeInsets.fromLTRB(15,0,0,0), // left,right,top,bottom
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(50),
                            gapPadding: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Sleep (MS): "),
                  new Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                      child: TextField(
                        controller: snatcherSleepController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          hintText:"Timeout between snatching (MS)",
                          contentPadding: new EdgeInsets.fromLTRB(15,0,0,0), // left,right,top,bottom
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(50),
                            gapPadding: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  FutureBuilder(
                    future: BooruSelector(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                        return snapshot.data;
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20),
                  side: BorderSide(color: Get.context!.theme.accentColor),
                ),
                /**
                 * When the snatch button is pressed the snatch function is called and then
                 * Get.back is used to close the snatcher window
                 */
                onPressed: (){
                  if (snatcherSleepController.text.isEmpty){
                    snatcherSleepController.text = 0.toString();
                  }
                  widget.snatchHandler.searchSnatch(snatcherTagsController.text,snatcherAmountController.text,int.parse(snatcherSleepController.text),widget.booru,widget.settingsHandler.jsonWrite);
                  Get.back();
                  //Get.off(SnatcherProgressPage(snatcherTagsController.text,snatcherAmountController.text,snatcherTimeoutController.text));
                },
                child: Text("Snatch Images"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /** This Future function will call getBooru on the settingsHandler to load the booru configs
   * After these are loaded it returns a drop down list which is used to select which booru to search
   * **/
  Future BooruSelector() async{
    // This null check is used otherwise the selected booru resets when the state changes, the state changes when a booru is selected
    if (widget.booru == null){
      widget.booru = widget.settingsHandler.booruList![0];
    }
    return Container(
      child: DropdownButton<Booru>(
        value: widget.booru,
        icon: Icon(Icons.arrow_downward),
        onChanged: (Booru? newValue){
          print(newValue!.baseURL);
          setState((){
            widget.booru = newValue;
          });
        },
        items: widget.settingsHandler.booruList!.map<DropdownMenuItem<Booru>>((Booru value){
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
    );
  }
}
