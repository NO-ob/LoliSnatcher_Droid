import 'package:flutter/material.dart';
import 'libBooru/GelbooruHandler.dart';
import 'libBooru/MoebooruHandler.dart';
import 'libBooru/PhilomenaHandler.dart';
import 'libBooru/DanbooruHandler.dart';
import 'libBooru/ShimmieHandler.dart';
import 'libBooru/BooruHandler.dart';
import 'libBooru/BooruItem.dart';
import 'libBooru/e621Handler.dart';
import 'libBooru/Booru.dart';
import 'getPerms.dart';
import 'SettingsHandler.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
/**
 * Then settings page is pretty self explanatory it will display, allow the user to edit and save settings
 */
class SettingsPage extends StatefulWidget {
  SettingsHandler settingsHandler;
  SettingsPage(this.settingsHandler);
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final settingsTagsController = TextEditingController();
  final settingsLimitController = TextEditingController();
  Booru selectedBooru;
  String previewMode = "Sample";
  @override
  // These lines are done in init state as they only need to be run once when the widget is first loaded
  void initState() {
    super.initState();
    widget.settingsHandler.loadSettings().whenComplete((){
      settingsTagsController.text = widget.settingsHandler.defTags;
      settingsLimitController.text = widget.settingsHandler.limit.toString();
      if (widget.settingsHandler.previewMode != ""){
        previewMode = widget.settingsHandler.previewMode;
      }
    });
    getPerms();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Settings")
      ),
      body:Center(
        child: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Default Tags:      "),
                  new Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                      child: TextField(
                        controller: settingsTagsController,
                        decoration: InputDecoration(
                          hintText:"Tags searched when app opens",
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
                  Text("Limit :            "),
                  new Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                      child: TextField(
                        controller: settingsLimitController,
                        //The keyboard type and input formatter are used to make sure the user can only input a numerical value
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          hintText: "Images to fetch per page 0-100",
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
              // This dropdown is used to change the quality of the images displayed on the home page
              child:  Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Preview Mode :     "),
                  DropdownButton<String>(
                    value: previewMode,
                    icon: Icon(Icons.arrow_downward),
                    onChanged: (String newValue){
                      setState((){
                        previewMode = newValue;
                      });
                    },
                    items: <String>["Sample","Thumbnail"].map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              child: Row(
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
                  Container(
                    margin: EdgeInsets.fromLTRB(10,10,10,10),
                    child: FlatButton(                     // This button loads the booru editor page
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20),
                        side: BorderSide(color: Theme.of(context).accentColor),
                      ),
                      onPressed: (){
                        if(selectedBooru != null){
                          Get.to(booruEdit(selectedBooru,widget.settingsHandler));
                        }
                        //get to booru edit page;
                      },
                      child: Text("Edit"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10,10,10,10),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20),
                        side: BorderSide(color: Theme.of(context).accentColor),
                      ),
                      onPressed: (){
                        // Open the booru edtor page but with default values
                        Get.to(booruEdit(new Booru("New","","",""),widget.settingsHandler));
                        //get to booru edit page;
                      },
                      child: Text("Add new"),
                    ),
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
                onPressed: (){
                  widget.settingsHandler.saveSettings(settingsTagsController.text,settingsLimitController.text, previewMode);
                },
                child: Text("Save"),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20),
                  side: BorderSide(color: Theme.of(context).accentColor),
                ),
                onPressed: (){
                },
                child: Text("Save Location"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /**
   * This is the same as the drop down used in the Home widget. The reason the code is reused instead of having a global widget is that
   * it cant update the state of the parent widget if it is outside of the class.
   */
  Future BooruSelector() async{
    if(widget.settingsHandler.booruList == null){
      await widget.settingsHandler.getBooru();
    }
    if (selectedBooru == null){
      selectedBooru = widget.settingsHandler.booruList[0];
    }
    return Container(
      child: DropdownButton<Booru>(
        value: selectedBooru,
        icon: Icon(Icons.arrow_downward),
        onChanged: (Booru newValue){
          print(newValue.baseURL);
          setState((){
            selectedBooru = newValue;
          });
        },
        items: widget.settingsHandler.booruList.map<DropdownMenuItem<Booru>>((Booru value){
          return DropdownMenuItem<Booru>(
            value: value,
            child: Row(
              children: <Widget>[
                Text(value.name),
                Image.network(value.faviconURL),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
/**
 * This is the booru editor page.
 */
class booruEdit extends StatefulWidget {
  SettingsHandler settingsHandler;
  booruEdit(this.booru,this.settingsHandler);
  Booru booru;
  String booruType = "";
  @override
  _booruEditState createState() => _booruEditState();
}

class _booruEditState extends State<booruEdit> {
  final booruNameController = TextEditingController();
  final booruURLController = TextEditingController();
  final booruFaviconController = TextEditingController();
  @override
  void initState() {
    //Load settings from the Booru instance parsed to the widget and populate the text fields
    if (widget.booru.name != "New"){
      booruNameController.text = widget.booru.name;
      booruURLController.text = widget.booru.baseURL;
      booruFaviconController.text = widget.booru.faviconURL;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Booru Editor")
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
                  Text("Name: "),
                  new Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                      child: TextField(
                        controller: booruNameController,
                        decoration: InputDecoration(
                          hintText:"Enter Booru Name",
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
                  Text("URL : "),
                  new Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                      child: TextField(
                        controller: booruURLController,
                        decoration: InputDecoration(
                          hintText:"Enter Booru URL",
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
                  Text("Favicon : "),
                  new Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                      child: TextField(
                        controller: booruFaviconController,
                        decoration: InputDecoration(
                          hintText:"Enter Booru favicon URL",
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
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: Theme.of(context).accentColor),
                    ),
                    onPressed: () async{
                      //Call the booru test
                      String booruType = await booruTest(booruURLController.text);
                      // If a booru type is returned set the widget state
                      if(booruType != ""){
                        setState((){
                          widget.booruType = booruType;
                        });
                        // Alert user about the results of the test
                        Get.snackbar("Booru Type is $booruType","Click the save button to save this config",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Colors.pink[200]);
                      } else {
                        Get.snackbar("No Data Returned","the Booru may not allow api access or the URL is incorrect ",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Colors.pink[200]);
                      }
                    },
                    child: Text("Test"),
                  ),
                  saveButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /**
   * The save button is displayed once the test function has run and completed
   * allowing the user to save the booru config otherwise an empty container is returned
   */
  Widget saveButton(){
    if (widget.booruType == ""){
      return Container();
    } else {
      return FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20),
          side: BorderSide(color: Theme.of(context).accentColor),
        ),
        onPressed:() async{
          getPerms();
          // Call the saveBooru on the settings handler and parse it a new Booru instance with data from the input fields
          await widget.settingsHandler.saveBooru(new Booru(booruNameController.text,widget.booruType,booruFaviconController.text,booruURLController.text));
          widget.settingsHandler.booruList.add(new Booru(booruNameController.text,widget.booruType,booruFaviconController.text,booruURLController.text));
        },
        child: Text("Save"),
      );
    }
  }

  /**
   * This function will use the Base URL the user has entered and call a search up to three times
   * if the searches return null each time it tries the search it uses a different
   * type of BooruHandler
   */
  Future<String> booruTest(String URL) async{
    String booruType = "";
    BooruHandler test = new GelbooruHandler(URL, 5);
    List<BooruItem> testFetched = await test.Search(" ", 1);
    if (testFetched != null) {
      if (testFetched.length > 0){
        booruType = "Gelbooru";
        print("Found Results as Gelbooru");
        return booruType;
      }
    }
    test = new MoebooruHandler(URL, 5);
    testFetched = await test.Search(" ", 1);
    if (testFetched != null) {
      if (testFetched.length > 0) {
        booruType = "Moebooru";
        print("Found Results as Moebooru");
        return booruType;
      }
    }
    test = new DanbooruHandler(URL, 5);
    testFetched = await test.Search(" ", 1);
    if (testFetched != null) {
      if (testFetched.length > 0) {
        booruType = "Danbooru";
        print("Found Results as Danbooru");
      }
    }
    test = new e621Handler(URL, 5);
    testFetched = await test.Search(" ", 1);
    if (testFetched != null) {
      if (testFetched.length > 0) {
        booruType = "e621";
        print("Found Results as e621");
      }
    }
    test = new ShimmieHandler(URL, 5);
    testFetched = await test.Search(" ", 1);
    if (testFetched != null) {
      if (testFetched.length > 0) {
        booruType = "Shimmie";
        print("Found Results as Shimmie");
      }
    }
    test = new PhilomenaHandler(URL, 5);
    testFetched = await test.Search("solo", 1);
    if (testFetched != null) {
      if (testFetched.length > 0) {
        booruType = "Philomena";
        print("Found Results as Philomena");
      }
    }
    // This can return anything it's needed for the future builder.
    return booruType;
  }
}


