import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lolisnatcher/src/boorus/booru_type.dart';

import 'package:lolisnatcher/src/boorus/hydrus_handler.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/booru_handler_factory.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/services/get_perms.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/webview/webview_page.dart';

/// This is the booru editor page.
class BooruEdit extends StatefulWidget {
  BooruEdit(this.booru, {Key? key}) : super(key: key);
  Booru booru;
  BooruType? booruType;

  @override
  State<BooruEdit> createState() => _BooruEditState();
}

class _BooruEditState extends State<BooruEdit> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;

  final booruNameController = TextEditingController();
  final booruURLController = TextEditingController();
  final booruFaviconController = TextEditingController();
  final booruAPIKeyController = TextEditingController();
  final booruUserIDController = TextEditingController();
  final booruDefTagsController = TextEditingController();

  BooruType selectedBooruType = BooruType.AutoDetect;

  // TODO make standalone / move to handlers themselves
  String convertSiteUrlToApi() {
    final String url = booruURLController.text;

    if (url.contains("chan.sankakucomplex.com")) {
      // Sankaku api override
      return "https://capi-v2.sankakucomplex.com";
      // booruFaviconController.text = "https://chan.sankakucomplex.com/favicon.ico";
    } else if (url.contains("idol.sankakucomplex.com")) {
      return "https://iapi.sankakucomplex.com";
      // booruFaviconController.text = "https://idol.sankakucomplex.com/favicon.ico";
    }

    return url;
  }

  bool isTesting = false;

  @override
  void initState() {
    //Load settings from the Booru instance parsed to the widget and populate the text fields
    if (widget.booru.name != "New") {
      booruNameController.text = widget.booru.name!;
      booruURLController.text = widget.booru.baseURL!;
      booruFaviconController.text = widget.booru.faviconURL!;
      booruAPIKeyController.text = widget.booru.apiKey!;
      booruUserIDController.text = widget.booru.userID!;
      booruDefTagsController.text = widget.booru.defTags!;
      selectedBooruType = BooruType.values.contains(widget.booru.type) ? widget.booru.type! : selectedBooruType;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? description = selectedBooruType != BooruType.AutoDetect
        ? BooruHandlerFactory().getBooruHandler(
            [Booru('', selectedBooruType, '', '', '')],
            1,
          )[0].getDescription()
        : null;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Booru Editor"),
        actions: const [],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            testButton(),
            webviewButton(),
            saveButton(),
            const SettingsButton(name: '', enabled: false),
            SettingsTextInput(
              controller: booruNameController,
              title: 'Name',
              hintText: "Enter Booru Name",
              inputType: TextInputType.text,
              clearable: true,
            ),
            SettingsTextInput(
              controller: booruURLController,
              title: 'URL',
              hintText: "Enter Booru URL",
              inputType: TextInputType.url,
              clearable: true,
            ),
            SettingsDropdown(
              value: selectedBooruType,
              items: BooruType.dropDownValues,
              onChanged: (BooruType? newValue) {
                setState(() {
                  selectedBooruType = newValue ?? BooruType.values.first;
                });
              },
              title: 'Booru Type',
              itemTitleBuilder: (p0) => (p0 as BooruType).name,
            ),
            SettingsTextInput(
              controller: booruFaviconController,
              title: 'Favicon',
              hintText: "(Autofills if blank)",
              inputType: TextInputType.url,
              clearable: true,
            ),
            SettingsTextInput(
              controller: booruDefTagsController,
              title: 'Default Tags',
              hintText: "Default search for booru",
              inputType: TextInputType.text,
              clearable: true,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              width: double.infinity,
              child: const Text(
                "API Key and User ID may be needed with some boorus but in most cases isn't necessary. If using API Key the User ID also needs to be filled unless it's Derpibooru/Philomena",
              ),
            ),
            if (description != null && description.isNotEmpty)
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: double.infinity,
                child: SelectableText(description),
              ),
            Column(
              children: selectedBooruType == BooruType.Hydrus
                  ? [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                          onPressed: () async {
                            if (selectedBooruType == BooruType.Hydrus) {
                              final HydrusHandler hydrus = HydrusHandler(
                                Booru(
                                  "Hydrus",
                                  BooruType.Hydrus,
                                  "Hydrus",
                                  booruURLController.text,
                                  "",
                                ),
                                5,
                              );
                              final String accessKey = await hydrus.getAccessKey();
                              if (accessKey != "") {
                                FlashElements.showSnackbar(
                                  context: context,
                                  title: const Text(
                                    'Access Key Requested',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  content: const Text(
                                    'Tap okay on hydrus then apply. You can test afterwards',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  leadingIcon: Icons.warning_amber,
                                  leadingIconColor: Colors.yellow,
                                  sideColor: Colors.yellow,
                                );
                                booruAPIKeyController.text = accessKey;
                              } else {
                                FlashElements.showSnackbar(
                                  context: context,
                                  title: const Text(
                                    'Failed to get access key',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  content: const Text(
                                    'Do you have the request window open in hydrus?',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  leadingIcon: Icons.warning_amber,
                                  leadingIconColor: Colors.red,
                                  sideColor: Colors.red,
                                );
                              }
                            } else {
                              FlashElements.showSnackbar(
                                context: context,
                                title: const Text(
                                  'Hydrus Only',
                                  style: TextStyle(fontSize: 20),
                                ),
                                content: const Text(
                                  'This button only works for Hydrus',
                                  style: TextStyle(fontSize: 16),
                                ),
                                leadingIcon: Icons.warning_amber,
                                leadingIconColor: Colors.red,
                                sideColor: Colors.red,
                              );
                            }
                          },
                          child: const Text("Get Hydrus Api Key"),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        width: double.infinity,
                        child: const Text(
                          "To get the Hydrus key you need to open the request dialog in the hydrus client. services > review services > client api > add > from api request",
                        ),
                      ),
                    ]
                  : [],
            ),
            SettingsTextInput(
              controller: booruUserIDController,
              title: getUserIDTitle(),
              hintText: "(Can be blank)",
              inputType: TextInputType.text,
              clearable: true,
            ),
            SettingsTextInput(
              controller: booruAPIKeyController,
              title: getApiKeyTitle(),
              hintText: "(Can be blank)",
              inputType: TextInputType.text,
              clearable: true,
            ),
          ],
        ),
      ),
    );
  }

  String getApiKeyTitle() {
    switch (selectedBooruType) {
      case BooruType.Sankaku:
        return 'Password';
      case BooruType.R34Hentai:
        return 'Cookies';
      default:
        return 'API Key';
    }
  }

  String getUserIDTitle() {
    switch (selectedBooruType) {
      case BooruType.Sankaku:
      case BooruType.Danbooru:
        return 'Login';
      default:
        return 'User ID';
    }
  }

  Widget webviewButton() {
    return SettingsButton(
      name: 'Open url to get cookies [BETA]',
      icon: const Icon(Icons.public),
      action: () {
        if (booruURLController.text.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InAppWebviewView(
                initialUrl: booruURLController.text,
              ),
            ),
          );
        }
      },
    );
  }

  void sanitizeBooruName() {
    // sanitize booru name to avoid conflicts with file paths
    booruNameController.text = Tools.sanitize(booruNameController.text).trim();
    setState(() {});
  }

  Widget testButton() {
    return SettingsButton(
      name: 'Test Booru',
      icon: isTesting ? const CircularProgressIndicator() : const Icon(Icons.public),
      action: () async {
        sanitizeBooruName();

        // name and url are required
        if (booruNameController.text == "") {
          FlashElements.showSnackbar(
            context: context,
            title: const Text(
              'Booru Name is required!',
              style: TextStyle(fontSize: 20),
            ),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.red,
            sideColor: Colors.red,
          );
          return;
        }

        if (booruURLController.text == "") {
          FlashElements.showSnackbar(
            context: context,
            title: const Text(
              'Booru URL is required!',
              style: TextStyle(fontSize: 20),
            ),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.red,
            sideColor: Colors.red,
          );
          return;
        }

        // add https if not specified
        if (!booruURLController.text.contains("http://") && !booruURLController.text.contains("https://")) {
          booruURLController.text = "https://${booruURLController.text}";
        }
        // autofill favicon if not specified
        if (booruFaviconController.text == "") {
          booruFaviconController.text = "${booruURLController.text}/favicon.ico";
        }
        // TODO make a list of default favicons for boorus where ^default^ one won't work
        if (booruURLController.text.contains("agn.ph")) {
          booruFaviconController.text = "https://agn.ph/skin/Retro/favicon.ico";
        }

        // some boorus have their api url different from main host
        booruURLController.text = convertSiteUrlToApi();

        //Call the booru test
        Booru testBooru;
        if (booruAPIKeyController.text == "") {
          testBooru = Booru(
            booruNameController.text,
            widget.booruType,
            booruFaviconController.text,
            booruURLController.text,
            booruDefTagsController.text,
          );
        } else {
          testBooru = Booru.withKey(
            booruNameController.text,
            widget.booruType,
            booruFaviconController.text,
            booruURLController.text,
            booruDefTagsController.text,
            booruAPIKeyController.text,
            booruUserIDController.text,
          );
        }
        isTesting = true;
        setState(() {});
        List<dynamic> testResults = await booruTest(testBooru, selectedBooruType);
        BooruType? booruType = testResults[0];
        final String errorString = testResults[1].isNotEmpty ? 'Error text: "${testResults[1]}"' : "";

        // If a booru type is returned set the widget state
        if (booruType != null) {
          widget.booruType = booruType;
          selectedBooruType = booruType;
          // Alert user about the results of the test
          FlashElements.showSnackbar(
            context: context,
            title: Text(
              'Booru Type is $booruType',
              style: const TextStyle(fontSize: 20),
            ),
            content: const Text(
              'Tap the Save button to save this config',
              style: TextStyle(fontSize: 16),
            ),
            leadingIcon: Icons.done,
            leadingIconColor: Colors.green,
            sideColor: Colors.green,
          );
        } else {
          FlashElements.showSnackbar(
            context: context,
            title: const Text('No Data Returned', style: TextStyle(fontSize: 20)),
            content: Text(
              "Entered Information may be incorrect, booru doesn't allow api access or there was a network error. $errorString",
              style: const TextStyle(fontSize: 16),
            ),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.red,
            sideColor: Colors.red,
          );
        }
        isTesting = false;
        setState(() {});
      },
    );
  }

  /// The save button is displayed once the test function has run and completed
  /// allowing the user to save the booru config otherwise an empty container is returned
  Widget saveButton() {
    return SettingsButton(
      name: "Save Booru${widget.booruType == null ? ' (Run Test First)' : ''}",
      icon: Icon(
        Icons.save,
        color: widget.booruType == null ? Colors.red : Colors.green,
      ),
      action: () async {
        sanitizeBooruName();

        if (widget.booruType == null) {
          FlashElements.showSnackbar(
            context: context,
            title: const Text('Run Test First!', style: TextStyle(fontSize: 20)),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.yellow,
            sideColor: Colors.yellow,
          );
          return;
        }

        await getPerms();
        final Booru newBooru = (booruAPIKeyController.text == "" && booruUserIDController.text == "")
            ? Booru(
                booruNameController.text,
                widget.booruType,
                booruFaviconController.text,
                booruURLController.text,
                booruDefTagsController.text,
              )
            : Booru.withKey(
                booruNameController.text,
                widget.booruType,
                booruFaviconController.text,
                booruURLController.text,
                booruDefTagsController.text,
                booruAPIKeyController.text,
                booruUserIDController.text,
              );

        bool booruExists = false;
        String booruExistsReason = '';
        // Call the saveBooru on the settings handler and parse it a Booru instance with data from the input fields
        for (int i = 0; i < settingsHandler.booruList.length; i++) {
          if (settingsHandler.booruList[i].baseURL == booruURLController.text) {
            final bool alreadyExists = settingsHandler.booruList.contains(newBooru);
            final bool sameNameExists = settingsHandler.booruList.any((element) => element.name == newBooru.name);
            final bool sameURLExists = settingsHandler.booruList.any((element) => element.baseURL == newBooru.baseURL);

            if (widget.booru.name == "New") {
              if (alreadyExists || sameNameExists || sameURLExists) {
                booruExists = true;
              }

              if (alreadyExists) {
                booruExistsReason = 'This Booru Config already exists';
              } else if (sameNameExists) {
                booruExistsReason = 'Booru Config with same name already exists';
              } else if (sameURLExists) {
                booruExistsReason = 'Booru Config with same URL already exists';
              }
            } else {
              if (alreadyExists) {
                booruExists = true;
                booruExistsReason = 'This Booru Config already exists';
              }

              final bool oldEditBooruExists =
                  (settingsHandler.booruList[i].baseURL == widget.booru.baseURL && settingsHandler.booruList[i].name == widget.booru.name);
              if (!booruExists && oldEditBooruExists) {
                // remove the old config (same url and name as the start booru)
                settingsHandler.booruList.removeAt(i);
                await settingsHandler.deleteBooru(widget.booru);
              }
            }
          }
        }

        if (booruExists) {
          FlashElements.showSnackbar(
            context: context,
            title: Text(booruExistsReason, style: const TextStyle(fontSize: 20)),
            content: const Text(
              '...and will not be added',
              style: TextStyle(fontSize: 16),
            ),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.red,
            sideColor: Colors.red,
          );
        } else {
          await settingsHandler.saveBooru(newBooru);

          FlashElements.showSnackbar(
            context: context,
            title: const Text(
              'Booru Config Saved!',
              style: TextStyle(fontSize: 20),
            ),
            leadingIcon: Icons.done,
            leadingIconColor: Colors.green,
            sideColor: Colors.green,
          );

          if (searchHandler.list.isEmpty) {
            // force first tab creation after creating first booru
            searchHandler.addTabByString(
              settingsHandler.defTags,
              customBooru: newBooru,
            );
            unawaited(searchHandler.runSearch());
          }

          if (searchHandler.list.firstWhereOrNull(
                (tab) => tab.selectedBooru.value.type == newBooru.type && tab.selectedBooru.value.baseURL == newBooru.baseURL,
              ) !=
              null) {
            // if the booru is already selected in any tab, update the booru to a new one
            // (only if their type and baseurl are the same, otherwise main booru selector will set the value to null and user has to reselect the booru)
            for (var tab in searchHandler.list) {
              if (tab.selectedBooru.value.type == newBooru.type && tab.selectedBooru.value.baseURL == newBooru.baseURL) {
                tab.selectedBooru.value = newBooru;
              }
            }
          }

          // force global restate
          searchHandler.rootRestate();

          Navigator.of(context).pop(true);
        }
      },
    );
  }

  /// This function will use the Base URL the user has entered and call a search up to three times
  /// if the searches return null each time it tries the search it uses a different
  /// type of BooruHandler
  Future<List<dynamic>> booruTest(
    Booru booru,
    BooruType userBooruType, {
    bool withCaptchaCheck = true,
  }) async {
    BooruType? booruType;
    String? errorString = "";
    BooruHandler test;
    List<BooruItem> testFetched = [];
    booru.type = userBooruType;

    if (userBooruType == BooruType.Hydrus) {
      final HydrusHandler hydrusHandler = HydrusHandler(booru, 20);
      if (await hydrusHandler.verifyApiAccess()) {
        return [userBooruType, ''];
      }
      return ['', 'Failed to verify api access for Hydrus'];
    }

    if (userBooruType == BooruType.AutoDetect) {
      List<BooruType> typeList = BooruType.detectable;
      for (int i = 1; i < typeList.length; i++) {
        booruType ??= (await booruTest(
          booru,
          typeList.elementAt(i),
          withCaptchaCheck: false,
        ))[0];
      }
    } else {
      final List temp = BooruHandlerFactory().getBooruHandler([booru], 5);
      test = temp[0];
      test.pageNum = temp[1];
      test.pageNum++;

      testFetched = (await test.search(
            " ",
            null,
            withCaptchaCheck: withCaptchaCheck,
          )) ??
          [];

      if (test.errorString.isNotEmpty) {
        errorString = test.errorString;
        Logger.Inst().log(errorString, 'BooruEdit', 'booruTest', LogTypes.exception);
      }
    }

    if (booruType == null) {
      if (testFetched.isNotEmpty) {
        booruType = userBooruType;
        print("Found Results as $userBooruType");
        return [booruType, ''];
      }
    }

    return [booruType, errorString];
  }
}
