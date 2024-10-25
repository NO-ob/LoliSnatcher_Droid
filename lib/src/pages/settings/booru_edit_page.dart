import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/l10n/generated/app_localizations.dart';
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

class BooruEdit extends StatefulWidget {
  const BooruEdit(
    this.booru, {
    super.key,
  });

  final Booru booru;

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

  BooruType? booruType;
  BooruType selectedBooruType = BooruType.Autodetect;

  // TODO make standalone / move to handlers themselves
  String convertSiteUrlToApi() {
    final String url = booruURLController.text;

    if (url.contains('chan.sankakucomplex.com')) {
      // Sankaku api override
      return 'https://capi-v2.sankakucomplex.com';
      // booruFaviconController.text = "https://chan.sankakucomplex.com/favicon.ico";
    } else if (url.contains('idol.sankakucomplex.com')) {
      return 'https://iapi.sankakucomplex.com';
      // booruFaviconController.text = "https://idol.sankakucomplex.com/favicon.ico";
    }

    return url;
  }

  bool isTesting = false;

  @override
  void initState() {
    super.initState();
    if (widget.booru.name != 'New') {
      booruNameController.text = widget.booru.name ?? '';
      booruURLController.text = widget.booru.baseURL ?? '';
      booruFaviconController.text = widget.booru.faviconURL ?? '';
      booruAPIKeyController.text = widget.booru.apiKey ?? '';
      booruUserIDController.text = widget.booru.userID ?? '';
      booruDefTagsController.text = widget.booru.defTags ?? '';
      selectedBooruType = BooruType.values.contains(widget.booru.type) ? widget.booru.type! : selectedBooruType;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).title_booruEditor),
        actions: const [],
      ),
      body: Center(
        child: ListView(
          children: [
            testButton(),
            webviewButton(),
            saveButton(),
            const SettingsButton(name: '', enabled: false),
            SettingsTextInput(
              controller: booruNameController,
              title: AppLocalizations.of(context).booruEdit_nameField,
              hintText: AppLocalizations.of(context).booruEdit_booruNamePlaceholder,
              clearable: true,
              pasteable: true,
            ),
            SettingsTextInput(
              controller: booruURLController,
              title: AppLocalizations.of(context).booruEdit_urlField,
              hintText: AppLocalizations.of(context).booruEdit_booruUrlPlaceholder,
              inputType: TextInputType.url,
              clearable: true,
              pasteable: true,
            ),
            SettingsDropdown(
              value: selectedBooruType,
              items: BooruType.dropDownValues,
              onChanged: (BooruType? newValue) {
                setState(() {
                  selectedBooruType = newValue ?? BooruType.values.first;
                });
              },
              title: AppLocalizations.of(context).booruEdit_booruType,
              itemTitleBuilder: (BooruType? type) => type?.alias ?? '',
              expendableByScroll: true,
            ),
            SettingsTextInput(
              controller: booruFaviconController,
              title: AppLocalizations.of(context).booruEdit_favicon,
              hintText: AppLocalizations.of(context).booruEdit_faviconHint,
              inputType: TextInputType.url,
              clearable: true,
              pasteable: true,
            ),
            SettingsTextInput(
              controller: booruDefTagsController,
              title: AppLocalizations.of(context).booruEdit_defaultTags,
              hintText: AppLocalizations.of(context).booruEdit_defaultTagsHint,
              clearable: true,
              pasteable: true,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              width: double.infinity,
              child: Text(
                AppLocalizations.of(context).booruEdit_apiCreds(getUserIDTitle(), getApiKeyTitle()),
              ),
            ),
            //
            if (selectedBooruType == BooruType.Hydrus)
              _HydrusAccessKeyWidget(
                urlController: booruURLController,
                apiKeyController: booruAPIKeyController,
              ),
            //
            SettingsTextInput(
              controller: booruUserIDController,
              title: getUserIDTitle(),
              hintText: AppLocalizations.of(context).booruEdit_canBeBlankHint,
              clearable: true,
              pasteable: true,
              drawTopBorder: true,
            ),
            SettingsTextInput(
              controller: booruAPIKeyController,
              title: getApiKeyTitle(),
              pasteable: true,
              hintText: AppLocalizations.of(context).booruEdit_canBeBlankHint,
              clearable: true,
              obscureable: shouldObscureApiKey(),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
          ],
        ),
      ),
    );
  }

  String getApiKeyTitle() {
    switch (selectedBooruType) {
      case BooruType.Sankaku:
      case BooruType.IdolSankaku:
      case BooruType.R34Hentai:
        return 'Password';
      default:
        return 'API Key';
    }
  }

  bool shouldObscureApiKey() {
    switch (selectedBooruType) {
      default:
        return true;
    }
  }

  String getUserIDTitle() {
    switch (selectedBooruType) {
      case BooruType.Sankaku:
      case BooruType.IdolSankaku:
      case BooruType.Danbooru:
      case BooruType.R34Hentai:
        return 'Login';
      default:
        return 'User ID';
    }
  }

  Widget webviewButton() {
    if (Tools.isOnPlatformWithWebviewSupport) {
      return SettingsButton(
        name: AppLocalizations.of(context).booruEdit_openWebview,
        subtitle: const Text('To login or obtain cookies'),
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
    } else {
      return const SizedBox.shrink();
    }
  }

  void sanitizeBooruName() {
    // sanitize booru name to avoid conflicts with file paths
    booruNameController.text = Tools.sanitize(booruNameController.text).trim();
    setState(() {});
  }

  SettingsButton testButton() {
    return SettingsButton(
      name: 'Test Booru',
      icon: isTesting ? const CircularProgressIndicator() : const Icon(Icons.public),
      action: () async {
        sanitizeBooruName();

        // name and url are required
        if (booruNameController.text == '') {
          FlashElements.showSnackbar(
            context: context,
            title: Text(
              AppLocalizations.of(context).booruEdit_booruNameRequired,
              style: const TextStyle(fontSize: 20),
            ),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.red,
            sideColor: Colors.red,
          );
          return;
        }

        if (booruURLController.text == '') {
          FlashElements.showSnackbar(
            context: context,
            title: Text(
              AppLocalizations.of(context).booruEdit_booruUrlRequired,
              style: const TextStyle(fontSize: 20),
            ),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.red,
            sideColor: Colors.red,
          );
          return;
        }

        // add https if not specified
        if (!booruURLController.text.contains('http://') && !booruURLController.text.contains('https://')) {
          booruURLController.text = 'https://${booruURLController.text}';
        }
        if (booruURLController.text.endsWith('/')) {
          booruURLController.text = booruURLController.text.substring(0, booruURLController.text.length - 1);
        }
        // autofill favicon if not specified
        if (booruFaviconController.text == '') {
          booruFaviconController.text = '${booruURLController.text}/favicon.ico';
        }
        // TODO make a list of default favicons for boorus where ^default^ one won't work
        if (booruURLController.text.contains('agn.ph')) {
          booruFaviconController.text = 'https://agn.ph/skin/Retro/favicon.ico';
        }

        // some boorus have their api url different from main host
        booruURLController.text = convertSiteUrlToApi();

        //Call the booru test
        Booru testBooru;
        if (booruAPIKeyController.text == '') {
          testBooru = Booru(
            booruNameController.text,
            booruType,
            booruFaviconController.text,
            booruURLController.text,
            booruDefTagsController.text,
          );
        } else {
          testBooru = Booru.withKey(
            booruNameController.text,
            booruType,
            booruFaviconController.text,
            booruURLController.text,
            booruDefTagsController.text,
            booruAPIKeyController.text,
            booruUserIDController.text,
          );
        }
        isTesting = true;
        setState(() {});
        final List<dynamic> testResults = await booruTest(testBooru, selectedBooruType);
        final BooruType? testBooruType = testResults[0];
        final String errorString = testResults[1].isNotEmpty ? 'Error text: "${testResults[1]}"' : '';

        // If a booru type is returned set the widget state
        if (testBooruType != null) {
          booruType = testBooruType;
          selectedBooruType = testBooruType;
          // Alert user about the results of the test
          FlashElements.showSnackbar(
            context: context,
            title: Text(
              AppLocalizations.of(context).booruEdit_booruTypeIs(testBooruType.alias),
              style: const TextStyle(fontSize: 20),
            ),
            content: Text(
              AppLocalizations.of(context).booruEdit_tapSaveButton,
              style: const TextStyle(fontSize: 16),
            ),
            leadingIcon: Icons.done,
            leadingIconColor: Colors.green,
            sideColor: Colors.green,
          );
        } else {
          FlashElements.showSnackbar(
            context: context,
            title: Text(AppLocalizations.of(context).booruEdit_noDataReturned, style: const TextStyle(fontSize: 20)),
            content: Text(
              AppLocalizations.of(context).booruEdit_noDataReturnedBody(errorString),
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
      name: AppLocalizations.of(context).booruEdit_saveBooru(booruType == null ? ' (Run Test First)' : ''),
      icon: Icon(
        Icons.save,
        color: booruType == null ? Colors.red : Colors.green,
      ),
      action: () async {
        sanitizeBooruName();

        if (booruType == null) {
          FlashElements.showSnackbar(
            context: context,
            title: Text(AppLocalizations.of(context).booruEdit_runTestFirst, style: const TextStyle(fontSize: 20)),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.yellow,
            sideColor: Colors.yellow,
          );
          testButton().action!();
          return;
        }

        await getPerms();
        final Booru newBooru = (booruAPIKeyController.text == '' && booruUserIDController.text == '')
            ? Booru(
                booruNameController.text,
                booruType,
                booruFaviconController.text,
                booruURLController.text,
                booruDefTagsController.text,
              )
            : Booru.withKey(
                booruNameController.text,
                booruType,
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

            if (widget.booru.name == 'New') {
              if (alreadyExists || sameNameExists || sameURLExists) {
                booruExists = true;
              }

              if (alreadyExists) {
                booruExistsReason = AppLocalizations.of(context).booruEdit_booruExists;
              } else if (sameNameExists) {
                booruExistsReason = AppLocalizations.of(context).booruEdit_booruConfigWithNameExists;
              } else if (sameURLExists) {
                booruExistsReason = AppLocalizations.of(context).booruEdit_booruConfigWithURLExists;
              }
            } else {
              if (alreadyExists) {
                booruExists = true;
                booruExistsReason = AppLocalizations.of(context).booruEdit_booruExists;
              }

              final bool oldEditBooruExists =
                  settingsHandler.booruList[i].baseURL == widget.booru.baseURL && settingsHandler.booruList[i].name == widget.booru.name;
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
            content: Text(
              AppLocalizations.of(context).booruEdit_booruExistsBody,
              style: const TextStyle(fontSize: 16),
            ),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.red,
            sideColor: Colors.red,
          );
        } else {
          await settingsHandler.saveBooru(newBooru);

          FlashElements.showSnackbar(
            context: context,
            title: Text(
              AppLocalizations.of(context).booruEdit_booruConfigSaved,
              style: const TextStyle(fontSize: 20),
            ),
            content: widget.booru.name == 'New'
                ? const SizedBox(height: 20)
                : Text(
                    AppLocalizations.of(context).booruEdit_existingTabsNeedReload,
                    style: const TextStyle(fontSize: 16),
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
            for (final tab in searchHandler.list) {
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
    String? errorString = '';
    BooruHandler test;
    List<BooruItem> testFetched = [];
    booru.type = userBooruType;

    if (userBooruType == BooruType.Hydrus) {
      final HydrusHandler hydrusHandler = HydrusHandler(booru, 20);
      if (await hydrusHandler.verifyApiAccess()) {
        return [userBooruType, ''];
      }
      return ['', AppLocalizations.of(context).booruEdit_failedToVerifyApiAccessForHydrus];
    }

    if (userBooruType == BooruType.Autodetect) {
      final List<BooruType> typeList = BooruType.detectable;
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
            ' ',
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
        print('Found Results as $userBooruType');
        return [booruType, ''];
      }
    }

    return [booruType, errorString];
  }
}

class _HydrusAccessKeyWidget extends StatelessWidget {
  const _HydrusAccessKeyWidget({
    required this.urlController,
    required this.apiKeyController,
  });

  final TextEditingController urlController;
  final TextEditingController apiKeyController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              final HydrusHandler hydrus = HydrusHandler(
                Booru(
                  'Hydrus',
                  BooruType.Hydrus,
                  'Hydrus',
                  urlController.text,
                  '',
                ),
                5,
              );
              final String accessKey = await hydrus.getAccessKey();
              if (accessKey != '') {
                FlashElements.showSnackbar(
                  context: context,
                  title: Text(
                    AppLocalizations.of(context).booruEdit_accessKeyRequested,
                    style: const TextStyle(fontSize: 20),
                  ),
                  content: Text(
                    AppLocalizations.of(context).booruEdit_accessKeyRequestedBody,
                    style: const TextStyle(fontSize: 16),
                  ),
                  leadingIcon: Icons.warning_amber,
                  leadingIconColor: Colors.yellow,
                  sideColor: Colors.yellow,
                );
                apiKeyController.text = accessKey;
              } else {
                FlashElements.showSnackbar(
                  context: context,
                  title: Text(
                    AppLocalizations.of(context).booruEdit_failedToGetAccessKey,
                    style: const TextStyle(fontSize: 20),
                  ),
                  content: Text(
                    AppLocalizations.of(context).booruEdit_failedToGetAccessKeyBody,
                    style: const TextStyle(fontSize: 16),
                  ),
                  leadingIcon: Icons.warning_amber,
                  leadingIconColor: Colors.red,
                  sideColor: Colors.red,
                );
              }
            },
            child: const Text('Get Hydrus Api key'),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          width: double.infinity,
          child: Text(
            AppLocalizations.of(context).booruEdit_hydrusInstructions,
          ),
        ),
      ],
    );
  }
}
