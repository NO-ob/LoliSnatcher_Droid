import 'package:flutter/material.dart';
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
  SnatcherPage(this.tags,this.booru,this.settingsHandler);
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
                  side: BorderSide(color: Theme.of(context).accentColor),
                ),
                /**
                 * When the snatch button is pressed the snatch function is called and then
                 * Get.back is used to close the snatcher window
                 */
                onPressed: (){
                  Snatcher(snatcherTagsController.text,snatcherAmountController.text,int.parse(snatcherSleepController.text));
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
  Future Snatcher(String tags, String amount, int timeout) async{
    ImageWriter writer = new ImageWriter();
    int count = 0, limit,page = 0;
    BooruHandler booruHandler;
    var booruItems;
    if (int.parse(amount) <= 100){
      limit = int.parse(amount);
    } else {
      limit = 100;
    }
    Get.snackbar("Snatching Images","Do not close the app!",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Colors.pink[200]);
    switch(widget.booru.type){
      case("Moebooru"):
        booruHandler = new MoebooruHandler(widget.booru,limit);
        break;
      case("Gelbooru"):
        booruHandler = new GelbooruHandler(widget.booru,limit);
        break;
      case("Danbooru"):
        page = 1;
        booruHandler = new DanbooruHandler(widget.booru,limit);
        break;
      case("e621"):
        booruHandler = new e621Handler(widget.booru,limit);
        break;
      case("Shimmie"):
        booruHandler = new ShimmieHandler(widget.booru,limit);
        break;
      case("Philomena"):
        page = 1;
        booruHandler = new PhilomenaHandler(widget.booru,limit);
        break;
    }
    // Loop until the count variable is bigger or equal to amount
    // The count variable is used instead of checking the length of booruItems because the amount of images stored on
    // The booru may be less than the user wants which would result in an infinite loop since the length would never be big enough
    while (count < int.parse(amount)){
      booruItems = await booruHandler.Search(tags,page);
      page ++;
      count = booruItems.length;
      print(count);
    }

    for (int n = 0; n + 1 <= int.parse(amount); n ++){
      await Future.delayed(Duration(milliseconds: timeout), () {writer.write(booruItems[n],widget.settingsHandler.jsonWrite);});
      if ((n+1)%10 == 0 || n+1 == int.parse(amount)){
        Get.snackbar("＼(^ o ^)／","Snatched ${n+1} / $amount",snackPosition: SnackPosition.BOTTOM,duration: Duration(seconds: 1),colorText: Colors.black, backgroundColor: Colors.pink[200]);
      }
    }
    //
    Get.snackbar("Snatching Complete","¡¡¡( •̀ ᴗ •́ )و!!!",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Colors.pink[200]);
  }

  /** This Future function will call getBooru on the settingsHandler to load the booru configs
   * After these are loaded it returns a drop down list which is used to select which booru to search
   * **/
  Future BooruSelector() async{
    // This null check is used otherwise the selected booru resets when the state changes, the state changes when a booru is selected
    if (widget.booru == null){
      widget.booru = widget.settingsHandler.booruList[0];
    }
    return Container(
      child: DropdownButton<Booru>(
        value: widget.booru,
        icon: Icon(Icons.arrow_downward),
        onChanged: (Booru newValue){
          print(newValue.baseURL);
          setState((){
            widget.booru = newValue;
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
