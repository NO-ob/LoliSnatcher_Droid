import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/libBooru/BooruHandler.dart';
import 'package:LoliSnatcher/libBooru/BooruHandlerFactory.dart';
import 'package:LoliSnatcher/libBooru/BooruItem.dart';
import 'package:LoliSnatcher/libBooru/HydrusHandler.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
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
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final SearchHandler searchHandler = Get.find<SearchHandler>();

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
    "InkBunny", "AGNPH", "NyanPals"
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
                            if (selectedBooruType == "Hydrus") {
                              HydrusHandler hydrus = HydrusHandler(Booru("Hydrus", "Hydrus", "Hydrus", booruURLController.text, ""), 5);
                              String accessKey = await hydrus.getAccessKey();
                              if (accessKey != "") {
                                FlashElements.showSnackbar(
                                  context: context,
                                  title: Text(
                                    'Access Key Requested',
                                    style: TextStyle(fontSize: 20)
                                  ),
                                  content: Text(
                                    'Click okay on hydrus then apply. You can test afterwards',
                                    style: TextStyle(fontSize: 16)
                                  ),
                                  leadingIcon: Icons.warning_amber,
                                  leadingIconColor: Colors.yellow,
                                  sideColor: Colors.yellow,
                                );
                                booruAPIKeyController.text = accessKey;
                              } else {
                                FlashElements.showSnackbar(
                                  context: context,
                                  title: Text(
                                    'Failed to get access key',
                                    style: TextStyle(fontSize: 20)
                                  ),
                                  content: Text(
                                    'Do you have the request window open in hydrus?',
                                    style: TextStyle(fontSize: 16)
                                  ),
                                  leadingIcon: Icons.warning_amber,
                                  leadingIconColor: Colors.red,
                                  sideColor: Colors.red,
                                );
                              }
                            } else {
                              FlashElements.showSnackbar(
                                context: context,
                                title: Text(
                                  'Hydrus Only',
                                  style: TextStyle(fontSize: 20)
                                ),
                                content: Text(
                                  'This button only works for Hydrus',
                                  style: TextStyle(fontSize: 16)
                                ),
                                leadingIcon: Icons.warning_amber,
                                leadingIconColor: Colors.red,
                                sideColor: Colors.red,
                              );
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
          FlashElements.showSnackbar(
            context: context,
            title: Text(
              'Booru Name is required!',
              style: TextStyle(fontSize: 20)
            ),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.red,
            sideColor: Colors.red,
          );
          return;
        }
        if(booruURLController.text == "") {
          FlashElements.showSnackbar(
            context: context,
            title: Text(
              'Booru URL is required!',
              style: TextStyle(fontSize: 20)
            ),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.red,
            sideColor: Colors.red,
          );
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
          FlashElements.showSnackbar(
            context: context,
            title: Text(
              'Booru Type is $booruType',
              style: TextStyle(fontSize: 20)
            ),
            content: Text(
              'Click the Save button to save this config',
              style: TextStyle(fontSize: 16)
            ),
            leadingIcon: Icons.done,
            leadingIconColor: Colors.green,
            sideColor: Colors.green,
          );
        } else {
          FlashElements.showSnackbar(
            context: context,
            title: Text(
              'No Data Returned',
              style: TextStyle(fontSize: 20)
            ),
            content: Text(
              "Entered Information may be incorrect, booru doesn't allow api access or there was a network error",
              style: TextStyle(fontSize: 16)
            ),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.red,
            sideColor: Colors.red,
          );
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
      name: "Save Booru${widget.booruType == '' ? ' (Run Test First)' : ''}",
      icon: Icon(Icons.save, color: widget.booruType == '' ? Colors.red : Colors.green),
      action: () async {
        if(widget.booruType == "") {
          FlashElements.showSnackbar(
            context: context,
            title: Text(
              'Run Test First!',
              style: TextStyle(fontSize: 20)
            ),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.yellow,
            sideColor: Colors.yellow,
          );
          return;
        }
  
        getPerms();
        Booru? newBooru;
        bool booruExists = false;
        // Call the saveBooru on the settings handler and parse it a Booru instance with data from the input fields
        for (int i=0; i < settingsHandler.booruList.length; i++){
          if (settingsHandler.booruList[i].baseURL == booruURLController.text) {
            if (widget.booru.name == "New" && (settingsHandler.booruList.contains(newBooru) || settingsHandler.booruList.where((el) => el.name == booruNameController.text || el.baseURL == booruURLController.text).isNotEmpty)) {
              booruExists = true;
              FlashElements.showSnackbar(
                context: context,
                title: Text(
                  'This Config Already Exists',
                  style: TextStyle(fontSize: 20)
                ),
                content: Text(
                  '...and will not be added',
                  style: TextStyle(fontSize: 16)
                ),
                leadingIcon: Icons.warning_amber,
                leadingIconColor: Colors.red,
                sideColor: Colors.red,
              );
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

        if (!booruExists) {
          await settingsHandler.saveBooru(newBooru);
          FlashElements.showSnackbar(
            context: context,
            title: Text(
              'Booru Config Saved!',
              style: TextStyle(fontSize: 20)
            ),
            leadingIcon: Icons.done,
            leadingIconColor: Colors.green,
            sideColor: Colors.green,
          );

          // force global restate
          searchHandler.rootRestate();
          if(searchHandler.list.isEmpty) {
            // force first tab creation after creating first booru
            searchHandler.list.add(SearchGlobal(newBooru.obs, null, settingsHandler.defTags));
          }
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
