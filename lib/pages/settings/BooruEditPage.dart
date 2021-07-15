import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/libBooru/BooruHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruHandlerFactory.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/libBooru/HydrusHandler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ServiceHandler.dart';
import '../../SettingsHandler.dart';
import '../../getPerms.dart';

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
  final booruAPIKeyController = TextEditingController();
  final booruUserIDController = TextEditingController();
  final booruDefTagsController = TextEditingController();
  List<String> booruTypes = [
    "Danbooru", "e621", "Gelbooru", "GelbooruV1", "Moebooru", "Philomena", "Sankaku", "Shimmie", "Szurubooru", "Hydrus", "BooruOnRails", "Rainbooru",
    "R34Hentai", "World", "IdolSankaku"
  ];
  String selectedBooruType = "AutoDetect";
  @override
  void initState() {
    booruTypes.sort((a,b) => a.toLowerCase().compareTo(b.toLowerCase()));
    booruTypes.insert(0, 'AutoDetect');

    //Load settings from the Booru instance parsed to the widget and populate the text fields
    if (widget.booru.name != "New"){
      booruNameController.text = widget.booru.name!;
      booruURLController.text = widget.booru.baseURL!;
      booruFaviconController.text = widget.booru.faviconURL!;
      booruAPIKeyController.text = widget.booru.apiKey!;
      booruUserIDController.text = widget.booru.userID!;
      booruDefTagsController.text = widget.booru.defTags!;
      selectedBooruType = booruTypes.contains(widget.booru.type ?? '') ? widget.booru.type! : selectedBooruType;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text("Booru Editor"),
        actions: [
        ],
      ),
      body:Center(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              width: double.infinity,
              child: Row(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20),
                        side: BorderSide(color: Get.context!.theme.accentColor),
                      ),
                      backgroundColor: Get.context!.theme.canvasColor,
                    ),
                    onPressed: () async{
                      // name and url are required
                      if(booruNameController.text == "") {
                        ServiceHandler.displayToast("Booru Name required!");
                        return;
                      }
                      if(booruURLController.text == "") {
                        ServiceHandler.displayToast("Booru URL required!");
                        return;
                      } else {
                        // add https if not specified
                        if(!booruURLController.text.contains("http://") && !booruURLController.text.contains("https://")){
                          booruURLController.text = "https://" + booruURLController.text;
                        }
                        // autofill favicon if not specified
                        if(booruFaviconController.text == ""){
                          booruFaviconController.text = booruURLController.text + "/favicon.ico";
                        }
                      }

                      // Sankaku api override
                      if(booruURLController.text.contains("chan.sankakucomplex.com")){
                        booruURLController.text = "https://capi-v2.sankakucomplex.com";
                        // booruFaviconController.text = "https://chan.sankakucomplex.com/favicon.ico";
                      } else if(booruURLController.text.contains("idol.sankakucomplex.com")){
                        booruURLController.text = "https://iapi.sankakucomplex.com";
                        // booruFaviconController.text = "https://idol.sankakucomplex.com/favicon.ico";
                      }

                      //Call the booru test
                      Booru testBooru;
                      if(booruAPIKeyController.text == ""){
                        testBooru = new Booru(
                          booruNameController.text,
                          widget.booruType,
                          booruFaviconController.text,
                          booruURLController.text,
                          booruDefTagsController.text
                        );
                      } else {
                        testBooru = new Booru.withKey(
                          booruNameController.text,
                          widget.booruType,
                          booruFaviconController.text,
                          booruURLController.text,
                          booruDefTagsController.text,
                          booruAPIKeyController.text,
                          booruUserIDController.text
                        );
                      }
                      String booruType = await booruTest(testBooru, selectedBooruType);

                      // If a booru type is returned set the widget state
                      if(booruType != ""){
                        setState((){
                          widget.booruType = booruType;
                          selectedBooruType = booruType;
                        });
                        // Alert user about the results of the test
                        ServiceHandler.displayToast("Booru Type is $booruType\nClick the save button to save this config");
                      } else {
                        ServiceHandler.displayToast("No Data Returned\nBooru Information may be incorrect or the booru doesn't allow api access");
                      }
                    },
                    child: Text("Test", style: TextStyle(color: Colors.white)),
                  ),
                  saveButton(),
                ],
              ),
            ),
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
                  Text("Booru Type : "),
                  Container(
                    margin: EdgeInsets.fromLTRB(10,0,0,0),
                    child: DropdownButton<String>(
                      value: selectedBooruType,
                      icon: Icon(Icons.arrow_downward),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedBooruType = newValue!;
                        });
                      },
                      items: booruTypes.map<DropdownMenuItem<String>>((String value){
                        bool isCurrent = selectedBooruType == value;
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                            padding: EdgeInsets.all(6),
                            decoration: isCurrent
                              ? BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(5),
                              )
                              : null,
                            child: Row(children: [Text(value)]),
                          ),
                        );
                      }).toList(),
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
                          hintText:"(Autofills if blank)",
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
                  Text("Default Tags : "),
                  new Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                      child: TextField(
                        controller: booruDefTagsController,
                        decoration: InputDecoration(
                          hintText:"Default search for booru",
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
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              width: double.infinity,
              child: Text("API Key and User ID may be needed with some boorus but in most cases isn't necessary. If using API Key the User ID also needs to be filled unless it's Derpibooru/Philomena"),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              width: double.infinity,
              child: SelectableText(selectedBooruType != "AutoDetect" ? BooruHandlerFactory().getBooruHandler([Booru('', selectedBooruType, '', '', '')], 1, null)[0].getDescription() : ""),
            ),
            Container(
                child: Column(
                    children: selectedBooruType == 'Hydrus'
                        ? [
                      Container(
                        width: double.infinity,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20),
                              side: BorderSide(color: Get.context!.theme.accentColor),
                            ),
                          ),
                          onPressed: () async{
                            if (selectedBooruType == "Hydrus"){
                              HydrusHandler hydrus = new HydrusHandler(new Booru("Hydrus", "Hydrus", "Hydrus", booruURLController.text, ""), 5);
                              String accessKey = await hydrus.getAccessKey();
                              if (accessKey != ""){
                                ServiceHandler.displayToast("Access Key Requested \n Click okay on hydrus then apply. You can then test");
                                //Get.snackbar("Access Key Requested","Click okay on hydrus then apply. You can then test",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context!.theme.primaryColor);
                                booruAPIKeyController.text = accessKey;
                              } else {
                                ServiceHandler.displayToast("Couldn't get access key \n Do you have the request window open in hydrus?");
                                //Get.snackbar("Couldn't get access key","Do you have the request window open in hydrus?",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context!.theme.primaryColor);
                              }
                            } else {
                              ServiceHandler.displayToast("Hydrus Only \n This button only works for Hydrus");
                              //Get.snackbar("Hydrus Only","This button only works for Hydrus",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context!.theme.primaryColor);
                            }
                          },
                          child: Text("Get Hydrus Api Key", style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        width: double.infinity,
                        child: Text("To get the Hydrus key you need to open the request dialog in the hydrus client. services > review services > client api > add > from api request"),
                      ),
                    ]
                        : []
                )
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10,10,10,10),
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("API Key : "),
                  new Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                      child: TextField(
                        controller: booruAPIKeyController,
                        decoration: InputDecoration(
                          hintText:"(Can be blank)",
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
                  Text("User ID : "),
                  new Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10,0,0,0),
                      child: TextField(
                        controller: booruUserIDController,
                        decoration: InputDecoration(
                          hintText:"(Can be Blank)",
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
      return const SizedBox();
    } else {
      return TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20),
            side: BorderSide(color: Get.context!.theme.accentColor),
          ),
        ),
        onPressed:() async{
          getPerms();
          Booru? newBooru;
          bool booruExists = false;
          // Call the saveBooru on the settings handler and parse it a new Booru instance with data from the input fields
          for (int i=0; i < widget.settingsHandler.booruList.length; i++){
            if (widget.settingsHandler.booruList[i].baseURL == booruURLController.text){
              if (widget.settingsHandler.booruList.contains(newBooru)){
                booruExists = true;
                ServiceHandler.displayToast("Booru Already Exists \n It has not been added");
                //Get.snackbar("Booru Already Exists","It has not been added",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context!.theme.primaryColor);
              } else {
                widget.settingsHandler.booruList.removeAt(i);
              }
            }
          }
          if(booruAPIKeyController.text == ""){
            newBooru = new Booru(booruNameController.text,widget.booruType,booruFaviconController.text,booruURLController.text,booruDefTagsController.text);
          } else {
            newBooru = new Booru.withKey(booruNameController.text,widget.booruType,booruFaviconController.text,booruURLController.text,booruDefTagsController.text,booruAPIKeyController.text,booruUserIDController.text);
          }
          if (!booruExists){
            await widget.settingsHandler.saveBooru(newBooru);
            ServiceHandler.displayToast("Booru Saved! \n It will show in the dropdowns after a search");
            //Get.snackbar("Booru Saved!","It will show in the dropdowns after a search",snackPosition: SnackPosition.TOP,duration: Duration(seconds: 5),colorText: Colors.black, backgroundColor: Get.context!.theme.primaryColor);
          }

        },
        child: Text("Save", style: TextStyle(color: Colors.white)),
      );
    }
  }

  /**
   * This function will use the Base URL the user has entered and call a search up to three times
   * if the searches return null each time it tries the search it uses a different
   * type of BooruHandler
   */
  Future<String> booruTest(Booru booru, String userBooruType) async{
    String booruType = "";
    BooruHandler test;
    List<BooruItem>? testFetched = List.empty();
    booru.type = userBooruType;

    if (userBooruType == "AutoDetect"){
      for(int i = 1; i < booruTypes.length; i++){
        if (booruType == ""){
          booruType = await booruTest(booru, booruTypes.elementAt(i));
        }
      }
    } else {
      List temp = BooruHandlerFactory().getBooruHandler([booru], 5, widget.settingsHandler.dbHandler);
      test = temp[0];
      if (booru.type == "Hydrus"){
        testFetched = await test.Search(" ", 0);
      } else {
        testFetched = await test.Search(" ", 1);
      }

    }
    if (booruType == "") {
      if (testFetched != null){
        if (testFetched.isNotEmpty) {
          booruType = userBooruType;
          print("Found Results as $userBooruType");
          return booruType;
        }
      }
    }
    // This can return anything it's needed for the future builder.
    return booruType;
  }
}
