import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/boorus/gelbooru_handler.dart';
import 'package:lolisnatcher/src/boorus/hydrus_handler.dart';
import 'package:lolisnatcher/src/boorus/idol_sankaku_handler.dart';
import 'package:lolisnatcher/src/boorus/sankaku_handler.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/handlers/booru_handler.dart';
import 'package:lolisnatcher/src/handlers/booru_handler_factory.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/services/get_perms.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/html.dart';
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

  TranslationsSettingsBooruEditorEn get booruEditorLoc => context.loc.settings.booruEditor;

  // TODO make standalone / move to handlers themselves
  String convertSiteUrlToApiUrl() {
    final String url = booruURLController.text;

    if (IdolSankakuHandler.knownUrls.any(url.contains)) {
      return 'https://iapi.sankakucomplex.com';
    } else if (SankakuHandler.knownUrls.any(url.contains)) {
      return 'https://sankakuapi.com';
    }

    return url;
  }

  String convertSiteUrlToFaviconUrl() {
    final String url = booruURLController.text;

    String faviconUrl = '${booruURLController.text}/favicon.ico';

    if (url.contains('agn.ph')) {
      faviconUrl = 'https://agn.ph/skin/Retro/favicon.ico';
    }

    if (booruURLController.text.contains('rule34.us')) {
      faviconUrl = 'https://rule34.us/favicon.png';
    }

    if ([
      ...SankakuHandler.knownUrls,
      ...IdolSankakuHandler.knownUrls,
      'sankakuapi.com',
    ].any(url.contains)) {
      faviconUrl = 'https://sankaku.app/images/favicon-32x32.png';
    }

    // TODO add more

    return faviconUrl;
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
  void dispose() {
    booruNameController.dispose();
    booruURLController.dispose();
    booruFaviconController.dispose();
    booruAPIKeyController.dispose();
    booruUserIDController.dispose();
    booruDefTagsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(booruEditorLoc.title),
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
              title: booruEditorLoc.booruName,
              onChanged: (_) => setState(() {}),
              clearable: true,
              pasteable: true,
              enableIMEPersonalizedLearning: !settingsHandler.incognitoKeyboard,
            ),
            SettingsTextInput(
              controller: booruURLController,
              title: booruEditorLoc.booruUrl,
              onChanged: (_) => setState(() {}),
              inputType: TextInputType.url,
              clearable: true,
              pasteable: true,
              enableIMEPersonalizedLearning: !settingsHandler.incognitoKeyboard,
            ),
            SettingsDropdown(
              value: selectedBooruType,
              items: BooruType.dropDownValues,
              onChanged: (BooruType? newValue) {
                setState(() {
                  selectedBooruType = newValue ?? BooruType.values.first;
                });
              },
              title: booruEditorLoc.booruType,
              itemTitleBuilder: (BooruType? type) => type?.alias ?? '',
              expendableByScroll: true,
            ),
            SettingsTextInput(
              controller: booruFaviconController,
              title: booruEditorLoc.booruFavicon,
              hintText: booruEditorLoc.booruFaviconPlaceholder,
              onChanged: (_) => setState(() {}),
              inputType: TextInputType.url,
              enableIMEPersonalizedLearning: !settingsHandler.incognitoKeyboard,
              trailingIcon: SizedBox(
                height: 24,
                width: 24,
                child: Image(
                  image: NetworkImage(booruFaviconController.text),
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.error,
                    size: 24,
                    color: Colors.redAccent,
                  ),
                  loadingBuilder: (context, child, loadingProgress) =>
                      loadingProgress == null ? child : const CircularProgressIndicator(),
                ),
              ),
            ),
            SettingsTextInput(
              controller: booruDefTagsController,
              title: booruEditorLoc.booruDefTags,
              onChanged: (_) => setState(() {}),
              hintText: booruEditorLoc.booruDefTagsPlaceholder,
              clearable: true,
              pasteable: true,
              enableIMEPersonalizedLearning: !settingsHandler.incognitoKeyboard,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 16, 10, 16),
              width: double.infinity,
              child: LoliHtml(
                getInstructions(),
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
              onChanged: (_) => setState(() {}),
              title: getUserIDTitle(),
              hintText: getUserIdPlaceholder(),
              clearable: true,
              pasteable: true,
              drawTopBorder: true,
              enableIMEPersonalizedLearning: !settingsHandler.incognitoKeyboard,
            ),
            SettingsTextInput(
              controller: booruAPIKeyController,
              onChanged: (_) => setState(() {}),
              title: getApiKeyTitle(),
              pasteable: true,
              hintText: getApiKeyPlaceholder(),
              clearable: true,
              obscureable: shouldObscureApiKey(),
              enableIMEPersonalizedLearning: !settingsHandler.incognitoKeyboard,
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
      case BooruType.InkBunny:
        return context.loc.password;
      default:
        return context.loc.apiKey;
    }
  }

  String getApiKeyPlaceholder() {
    switch (selectedBooruType) {
      default:
        return '';
    }
  }

  String getInstructions() {
    switch (selectedBooruType) {
      case BooruType.Autodetect:
      case BooruType.Gelbooru:
        if (booruURLController.text.contains('gelbooru.com')) {
          return GelbooruHandler.credentialsWarningText;
        }
        break;
      case BooruType.Hydrus:
        return '';
      default:
        break;
    }

    return booruEditorLoc.booruDefaultInstructions;
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
        return context.loc.login;
      default:
        return context.loc.userId;
    }
  }

  String getUserIdPlaceholder() {
    switch (selectedBooruType) {
      default:
        return '';
    }
  }

  Widget webviewButton() {
    if (Tools.isOnPlatformWithWebviewSupport) {
      return SettingsButton(
        name: context.loc.settings.webview.openWebview,
        subtitle: Text(context.loc.settings.webview.openWebviewTip),
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
      name: booruEditorLoc.testBooru,
      icon: isTesting ? const CircularProgressIndicator() : const Icon(Icons.public),
      action: () async {
        sanitizeBooruName();

        if (booruNameController.text.trim().isEmpty) {
          FlashElements.showSnackbar(
            context: context,
            title: Text(
              booruEditorLoc.booruNameRequired,
              style: const TextStyle(fontSize: 20),
            ),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.red,
            sideColor: Colors.red,
          );
          return;
        }

        if (booruURLController.text.trim().isEmpty) {
          FlashElements.showSnackbar(
            context: context,
            title: Text(
              booruEditorLoc.booruUrlRequired,
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

        booruURLController.text = convertSiteUrlToApiUrl();

        booruFaviconController.text = booruFaviconController.text.trim().isEmpty
            ? convertSiteUrlToFaviconUrl()
            : booruFaviconController.text;

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
        final testResults = await booruTest(testBooru, selectedBooruType);
        final BooruType? testBooruType = testResults.booruType;
        final String errorString = testResults.errorString?.isNotEmpty == true ? testResults.errorString! : '';

        // If a booru type is returned set the widget state
        if (testBooruType != null) {
          booruType = testBooruType;
          selectedBooruType = testBooruType;
          // Alert user about the results of the test
          FlashElements.showSnackbar(
            context: context,
            title: Text(
              booruEditorLoc.booruTypeIs(booruType: testBooruType.alias),
              style: const TextStyle(fontSize: 20),
            ),
            content: Text(
              booruEditorLoc.testBooruSuccessMsg,
              style: const TextStyle(fontSize: 16),
            ),
            leadingIcon: Icons.done,
            leadingIconColor: Colors.green,
            sideColor: Colors.green,
          );
        } else {
          FlashElements.showSnackbar(
            context: context,
            duration: const Duration(seconds: 5),
            title: Text(
              booruEditorLoc.testBooruFailedTitle,
              style: const TextStyle(fontSize: 20),
            ),
            content: Column(
              children: [
                Text(
                  booruEditorLoc.testBooruFailedMsg,
                  style: const TextStyle(fontSize: 16),
                ),
                if (errorString.trim().isNotEmpty)
                  Text(
                    '${context.loc.error}: $errorString',
                    style: const TextStyle(fontSize: 16),
                  ),
              ],
            ),
            actionsBuilder: (context, controller) {
              return [
                if (errorString.trim().isNotEmpty)
                  ElevatedButton.icon(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: errorString));
                      FlashElements.showSnackbar(
                        context: context,
                        title: Text(
                          context.loc.copied,
                          style: const TextStyle(fontSize: 20),
                        ),
                        sideColor: Colors.green,
                        leadingIcon: Icons.check,
                        leadingIconColor: Colors.green,
                        duration: const Duration(seconds: 2),
                      );
                    },
                    icon: const Icon(Icons.copy),
                    label: Text(context.loc.copyErrorText),
                  ),
              ];
            },
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
      name: '${booruEditorLoc.saveBooru}${booruType == null ? ' (${booruEditorLoc.runTestFirst})' : ''}'.trim(),
      icon: Icon(
        Icons.save,
        color: booruType == null ? Colors.red : Colors.green,
      ),
      action: onSave,
      onLongPress: settingsHandler.isDebug.value ? () => onSave(force: true) : null,
    );
  }

  Future<void> onSave({bool force = false}) async {
    sanitizeBooruName();

    if (force) {
      booruType = selectedBooruType;
      if (booruType!.isAutodetect) {
        return;
      }
    }

    if (booruType == null && !force) {
      FlashElements.showSnackbar(
        context: context,
        title: Text(
          booruEditorLoc.runningTest,
          style: const TextStyle(fontSize: 20),
        ),
        leadingIcon: Icons.refresh,
        leadingIconColor: Colors.yellow,
        sideColor: Colors.yellow,
      );
      testButton().action!();
      return;
    }

    await getStoragePermission();
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
            booruExistsReason = booruEditorLoc.booruConfigExistsError;
          } else if (sameNameExists) {
            booruExistsReason = booruEditorLoc.booruSameNameExistsError;
          } else if (sameURLExists) {
            booruExistsReason = booruEditorLoc.booruSameUrlExistsError;
          }
        } else {
          if (alreadyExists) {
            booruExists = true;
            booruExistsReason = booruEditorLoc.booruConfigExistsError;
          }

          final bool oldEditBooruExists =
              settingsHandler.booruList[i].baseURL == widget.booru.baseURL &&
              settingsHandler.booruList[i].name == widget.booru.name;
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
        title: Text(
          booruExistsReason,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        content: Text(
          booruEditorLoc.thisBooruConfigWontBeAdded,
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
          booruEditorLoc.booruConfigSaved,
          style: const TextStyle(fontSize: 20),
        ),
        content: widget.booru.name == 'New'
            ? const SizedBox(height: 20)
            : Text(
                booruEditorLoc.existingTabsNeedReload,
                style: const TextStyle(fontSize: 16),
              ),
        leadingIcon: Icons.done,
        leadingIconColor: Colors.green,
        sideColor: Colors.green,
      );

      if (searchHandler.tabs.isEmpty) {
        // force first tab creation after creating first booru
        searchHandler.addTabByString(
          settingsHandler.defTags,
          customBooru: newBooru,
        );
        unawaited(searchHandler.runSearch());
      }

      if (searchHandler.tabs.firstWhereOrNull(
            (tab) =>
                tab.selectedBooru.value.type == newBooru.type && tab.selectedBooru.value.baseURL == newBooru.baseURL,
          ) !=
          null) {
        // if the booru is already selected in any tab, update the booru to a new one
        // (only if their type and baseurl are the same, otherwise main booru selector will set the value to null and user has to reselect the booru)
        for (final tab in searchHandler.tabs) {
          if (tab.selectedBooru.value.type == newBooru.type && tab.selectedBooru.value.baseURL == newBooru.baseURL) {
            tab.selectedBooru.value = newBooru;
          }
        }
      }

      unawaited(
        Future.delayed(const Duration(seconds: 1)).then((_) {
          // force global restate
          searchHandler.rootRestate?.call();
        }),
      );

      Navigator.of(context).pop(true);
    }
  }

  /// This function will use the Base URL the user has entered and call a search up to three times
  /// if the searches return null each time it tries the search it uses a different
  /// type of BooruHandler
  Future<({BooruType? booruType, String? errorString})> booruTest(
    Booru booru,
    BooruType userBooruType, {
    bool withCaptchaCheck = true,
  }) async {
    BooruType? booruType;
    String? errorString;
    BooruHandler test;
    List<BooruItem> testFetched = [];
    booru.type = userBooruType;

    if (userBooruType == BooruType.Hydrus) {
      final HydrusHandler hydrusHandler = HydrusHandler(booru, 20);
      if (await hydrusHandler.verifyApiAccess()) {
        return (booruType: userBooruType, errorString: null);
      }
      return (
        booruType: null,
        errorString: booruEditorLoc.failedVerifyApiHydrus,
      );
    }

    if (userBooruType == BooruType.Autodetect) {
      final List<BooruType> typeList = BooruType.detectable;
      for (int i = 1; i < typeList.length; i++) {
        booruType ??= (await booruTest(
          booru,
          typeList.elementAt(i),
          withCaptchaCheck: false,
        )).booruType;
      }
    } else {
      final temp = BooruHandlerFactory().getBooruHandler([booru], 5);
      test = temp.booruHandler;
      test.pageNum = temp.startingPage;
      test.pageNum++;

      testFetched =
          (await test.search(
            '',
            null,
            withCaptchaCheck: withCaptchaCheck,
          )) ??
          [];

      if (test.errorString.isNotEmpty) {
        errorString = test.errorString;
        Logger.Inst().log(
          errorString,
          'BooruEdit',
          'booruTest',
          LogTypes.exception,
        );
      }
    }

    if (booruType == null) {
      if (testFetched.isNotEmpty) {
        booruType = userBooruType;
        Logger.Inst().log(
          'Found Results as $userBooruType',
          'BooruEdit',
          'booruTest',
          LogTypes.booruHandlerInfo,
        );
        return (booruType: booruType, errorString: errorString);
      }
    }

    return (booruType: booruType, errorString: errorString);
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
    final booruEditorLoc = context.loc.settings.booruEditor;
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
                    booruEditorLoc.accessKeyRequestedTitle,
                    style: const TextStyle(fontSize: 20),
                  ),
                  content: Text(
                    booruEditorLoc.accessKeyRequestedMsg,
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
                    booruEditorLoc.accessKeyFailedTitle,
                    style: const TextStyle(fontSize: 20),
                  ),
                  content: Text(
                    booruEditorLoc.accessKeyFailedMsg,
                    style: const TextStyle(fontSize: 16),
                  ),
                  leadingIcon: Icons.warning_amber,
                  leadingIconColor: Colors.red,
                  sideColor: Colors.red,
                );
              }
            },
            child: Text(booruEditorLoc.getHydrusApiKey),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          width: double.infinity,
          child: Text(
            booruEditorLoc.hydrusInstructions,
          ),
        ),
      ],
    );
  }
}
