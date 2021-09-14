import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/libBooru/BooruHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruHandlerFactory.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/libBooru/HydrusHandler.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ServiceHandler.dart';
import '../../SettingsHandler.dart';
import '../../getPerms.dart';

/**
 * This is the booru editor page.
 */
class BooruEdit extends StatefulWidget {
  Booru booru;
  String booruType = "";
  BooruEdit(this.booru);

  @override
  _BooruEditState createState() => _BooruEditState();
}

class _BooruEditState extends State<BooruEdit> {
  final SettingsHandler settingsHandler = Get.find();
  final booruNameController = TextEditingController();
  final booruURLController = TextEditingController();
  final booruFaviconController = TextEditingController();
  final booruAPIKeyController = TextEditingController();
  final booruUserIDController = TextEditingController();
  final booruDefTagsController = TextEditingController();

  String selectedBooruType = "AutoDetect";
  List<String> booruTypes = [
    "Danbooru", "e621", "Gelbooru",
    "GelbooruV1", "Moebooru", "Philomena",
    "Sankaku", "Shimmie", "Szurubooru",
    "Hydrus", "BooruOnRails", "Rainbooru",
    "R34Hentai", "World", "IdolSankaku",
    "InkBunny", "AGNPH"
  ];

  bool isTesting = false;

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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Booru Editor"),
        actions: [],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            testButton(),
            saveButton(),
            SettingsButton(name: '', enabled: false),
            SettingsTextInput(
              controller: booruNameController,
              title: 'Name',
              hintText: "Enter Booru Name",
              inputType: TextInputType.text,
            ),
            SettingsTextInput(
              controller: booruURLController,
              title: 'URL',
              hintText: "Enter Booru URL",
              inputType: TextInputType.text,
            ),
            SettingsDropdown(
              selected: selectedBooruType,
              values: booruTypes,
              onChanged: (String? newValue){
                setState((){
                  selectedBooruType = newValue ?? booruTypes[0];
                });
              },
              title: 'Booru Type',
            ),
            SettingsTextInput(
              controller: booruFaviconController,
              title: 'Favicon',
              hintText: "(Autofills if blank)",
              inputType: TextInputType.text,
            ),
            SettingsTextInput(
              controller: booruDefTagsController,
              title: 'Default Tags',
              hintText: "Default search for booru",
              inputType: TextInputType.text,
            ),

            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              width: double.infinity,
              child: Text("API Key and User ID may be needed with some boorus but in most cases isn't necessary. If using API Key the User ID also needs to be filled unless it's Derpibooru/Philomena"),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              width: double.infinity,
              child: SelectableText(selectedBooruType != "AutoDetect" ? BooruHandlerFactory().getBooruHandler([Booru('', selectedBooruType, '', '', '')], 1)[0].getDescription() : ""),
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
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Get.theme.colorScheme.secondary),
                            ),
                          ),
                          onPressed: () async{
                            if (selectedBooruType == "Hydrus"){
                              HydrusHandler hydrus = HydrusHandler(Booru("Hydrus", "Hydrus", "Hydrus", booruURLController.text, ""), 5);
                              String accessKey = await hydrus.getAccessKey();
                              if (accessKey != ""){
                                ServiceHandler.displayToast("Access Key Requested \n Click okay on hydrus then apply. You can then test");
                                booruAPIKeyController.text = accessKey;
                              } else {
                                ServiceHandler.displayToast("Couldn't get access key \n Do you have the request window open in hydrus?");
                              }
                            } else {
                              ServiceHandler.displayToast("Hydrus Only \n This button only works for Hydrus");
                            }
                          },
                          child: Text("Get Hydrus Api Key"),
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

            SettingsTextInput(
              controller: booruAPIKeyController,
              title: getApiKeyTitle(),
              hintText: "(Can be blank)",
              inputType: TextInputType.text,
            ),
            SettingsTextInput(
              controller: booruUserIDController,
              title: getUserIDTitle(),
              hintText: "(Can be blank)",
              inputType: TextInputType.text,
            ),
          ],
        ),
      ),
    );
  }
  
  String getApiKeyTitle() {
    switch (selectedBooruType) {
      case 'Sankaku':
        return 'Login';
      default:
        return 'API Key';
    }
  }

  String getUserIDTitle() {
    switch (selectedBooruType) {
      case 'Sankaku':
        return 'Password';
      default:
        return 'User ID';
    }
  }

  Widget testButton() {
    return SettingsButton(
      name: 'Test Booru',
      icon: isTesting
        ? CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Get.theme.colorScheme.secondary)
          )
        : Icon(Icons.public),
      action: () async {
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
          // TODO make a list of default favicons for boorus where ^default^ one won't work
          if (booruURLController.text.contains("agn.ph")){
            booruFaviconController.text = "https://agn.ph/skin/Retro/favicon.ico";
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
          testBooru = Booru(
            booruNameController.text,
            widget.booruType,
            booruFaviconController.text,
            booruURLController.text,
            booruDefTagsController.text
          );
        } else {
          testBooru = Booru.withKey(
            booruNameController.text,
            widget.booruType,
            booruFaviconController.text,
            booruURLController.text,
            booruDefTagsController.text,
            booruAPIKeyController.text,
            booruUserIDController.text
          );
        }
        isTesting = true;
        setState(() { });
        String booruType = await booruTest(testBooru, selectedBooruType);

        // If a booru type is returned set the widget state
        if(booruType != ""){
          widget.booruType = booruType;
          selectedBooruType = booruType;
          // Alert user about the results of the test
          ServiceHandler.displayToast("Booru Type is $booruType\nClick the save button to save this config");
        } else {
          ServiceHandler.displayToast("No Data Returned\nBooru Information may be incorrect or the booru doesn't allow api access");
        }
        isTesting = false;
        setState(() { });
      },
    );
  }

  /**
   * The save button is displayed once the test function has run and completed
   * allowing the user to save the booru config otherwise an empty container is returned
   */
  Widget saveButton(){
    return SettingsButton(
      name: 'Save Booru',
      icon: Icon(Icons.save),
      action: () async {
        if(widget.booruType == "") {
          ServiceHandler.displayToast('Run Test first!');
          return;
        }
  
        getPerms();
        Booru? newBooru;
        bool booruExists = false;
        // Call the saveBooru on the settings handler and parse it a Booru instance with data from the input fields
        for (int i=0; i < settingsHandler.booruList.length; i++){
          if (settingsHandler.booruList[i].baseURL == booruURLController.text){
            if (settingsHandler.booruList.contains(newBooru)){
              booruExists = true;
              ServiceHandler.displayToast("Booru Already Exists \n It has not been added");
            } else {
              settingsHandler.booruList.removeAt(i);
            }
          }
        }

        if(booruAPIKeyController.text == ""){
          newBooru = Booru(
            booruNameController.text,
            widget.booruType,
            booruFaviconController.text,
            booruURLController.text,
            booruDefTagsController.text
          );
        } else {
          newBooru = Booru.withKey(
            booruNameController.text,
            widget.booruType,
            booruFaviconController.text,
            booruURLController.text,
            booruDefTagsController.text,
            booruAPIKeyController.text,
            booruUserIDController.text
          );
        }

        if (!booruExists){
          await settingsHandler.saveBooru(newBooru);
          ServiceHandler.displayToast("Booru Saved! \n It will show in the dropdowns after a search");
          Navigator.of(context).pop(true);
        }

      },
    );
  }

  /**
   * This function will use the Base URL the user has entered and call a search up to three times
   * if the searches return null each time it tries the search it uses a different
   * type of BooruHandler
   */
  Future<String> booruTest(Booru booru, String userBooruType) async {
    String booruType = "";
    BooruHandler test;
    List<BooruItem> testFetched = [];
    booru.type = userBooruType;

    if (userBooruType == "AutoDetect"){
      for(int i = 1; i < booruTypes.length; i++){
        if (booruType == ""){
          booruType = await booruTest(booru, booruTypes.elementAt(i));
        }
      }
    } else {
      List temp = BooruHandlerFactory().getBooruHandler([booru], 5);
      test = temp[0];
      test.pageNum.value = temp[1];
      test.pageNum.value ++;
      // TODO ???
      // if (booru.type == "Hydrus"){
      //   testFetched = await test.Search(" ", 0);
      // } else {
      //   testFetched = await test.Search(" ", 1);
      // }
      
      testFetched = (await test.Search(" ", null)) ?? [];
    }

    if (booruType == "") {
      if (testFetched.isNotEmpty) {
        booruType = userBooruType;
        print("Found Results as $userBooruType");
        return booruType;
      }
    }

    return booruType;
  }
}
