import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/utils.dart';
import 'package:lolisnatcher/l10n/generated/app_localizations.dart';

import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/navigation_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/pages/settings/booru_edit_page.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/image/favicon.dart';
import 'package:lolisnatcher/src/widgets/webview/webview_page.dart';

// TODO move all buttons to separate widgets/unified functions to be used in other places?

class BooruPage extends StatefulWidget {
  const BooruPage({super.key});

  @override
  State<BooruPage> createState() => _BooruPageState();
}

class _BooruPageState extends State<BooruPage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;

  final defaultTagsController = TextEditingController();
  final limitController = TextEditingController();
  Booru? selectedBooru, initPrefBooru;

  @override
  void initState() {
    super.initState();
    defaultTagsController.text = settingsHandler.defTags;
    limitController.text = settingsHandler.limit.toString();

    if (settingsHandler.prefBooru.isNotEmpty) {
      selectedBooru = settingsHandler.booruList.firstWhereOrNull(
        (booru) => booru.name == settingsHandler.prefBooru,
      );
    } else if (settingsHandler.booruList.isNotEmpty) {
      selectedBooru = settingsHandler.booruList[0];
    }

    initPrefBooru = selectedBooru;
  }

  void copyBooruLink(bool withSensitiveData) {
    Navigator.of(context).pop(true); // remove dialog
    final String link = selectedBooru?.toLink(withSensitiveData) ?? '';
    if (Platform.isWindows || Platform.isLinux) {
      Clipboard.setData(ClipboardData(text: link));
      FlashElements.showSnackbar(
        context: context,
        title: Text(AppLocalizations.of(context).booruPage_booruConfigLinkCopied, style: const TextStyle(fontSize: 20)),
        leadingIcon: Icons.share,
        leadingIconColor: Colors.green,
        sideColor: Colors.green,
      );
    } else if (Platform.isAndroid) {
      ServiceHandler.loadShareTextIntent(link);
    }
  }

  //called when page is clsoed, sets settingshandler variables and then writes settings to disk
  Future<void> _onPopInvoked(bool didPop) async {
    if (didPop) {
      return;
    }

    settingsHandler.defTags = defaultTagsController.text;
    if (int.parse(limitController.text) > 100) {
      limitController.text = '100';
    } else if (int.parse(limitController.text) < 10) {
      limitController.text = '10';
    }

    if (selectedBooru == null && settingsHandler.booruList.isNotEmpty) {
      selectedBooru = settingsHandler.booruList[0];
    }
    if (selectedBooru != null) {
      final res = await askToChangePrefBooru(initPrefBooru, selectedBooru!);
      if (res == true) {
        settingsHandler.prefBooru = selectedBooru?.name ?? '';
      } else if (res == false && initPrefBooru != null) {
        settingsHandler.prefBooru = initPrefBooru?.name ?? '';
      } else if (res == null) {
        return;
      }
    }
    settingsHandler.limit = int.parse(limitController.text);
    final bool result = await settingsHandler.saveSettings(restate: false);
    await settingsHandler.sortBooruList();
    if (result) {
      Navigator.of(context).pop();
    }
  }

  Widget addButton() {
    return SettingsButton(
      name: AppLocalizations.of(context).booruPage_addButton,
      icon: const Icon(Icons.add),
      page: () => BooruEdit(Booru('New', null, '', '', '')),
    );
  }

  Widget booruSelector() {
    return SettingsBooruDropdown(
      value: settingsHandler.booruList.contains(selectedBooru) ? selectedBooru : settingsHandler.booruList[0],
      onChanged: (Booru? newValue) {
        final bool isNewValuePresent = settingsHandler.booruList.contains(newValue);
        setState(() {
          selectedBooru = isNewValuePresent ? newValue : settingsHandler.booruList[0];
          settingsHandler.prefBooru = selectedBooru?.name ?? '';
          settingsHandler.sortBooruList();
        });
      },
      title: AppLocalizations.of(context).booruPage_addedBoorus,
      trailingIcon: IconButton(
        icon: const Icon(Icons.help_outline),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return SettingsDialog(
                title: Text(AppLocalizations.of(context).booruPage_booru),
                contentItems: [
                  Text(AppLocalizations.of(context).booruPage_booruSelectorHint),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget shareButton() {
    return SettingsButton(
      name: AppLocalizations.of(context).booruPage_shareButton,
      icon: const Icon(Icons.share),
      action: () {
        if (selectedBooru?.type == BooruType.Favourites || selectedBooru?.type == BooruType.Downloads) {
          return;
        }

        showDialog(
          context: context,
          builder: (context) {
            return SettingsDialog(
              title: Text(AppLocalizations.of(context).booruPage_shareDialogTitle),
              contentItems: [
                Text(
                  Platform.isAndroid
                      ? AppLocalizations.of(context).booruPage_shareDialogAndroid(selectedBooru?.name)
                      : AppLocalizations.of(context).booruPage_shareDialogOther(selectedBooru?.name),
                ),
              ],
              actionButtons: [
                const CancelButton(),
                ElevatedButton(
                  child: Text(AppLocalizations.of(context).button_yes),
                  onPressed: () {
                    copyBooruLink(true);
                  },
                ),
                ElevatedButton(
                  child: Text(AppLocalizations.of(context).button_no),
                  onPressed: () {
                    copyBooruLink(false);
                  },
                ),
              ],
            );
          },
        );
      },
      trailingIcon: IconButton(
        icon: const Icon(Icons.help_outline),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return SettingsDialog(
                title: Text(AppLocalizations.of(context).booruPage_booruSharingDialogTitle),
                contentItems: [
                  // TODO more explanations about booru sharing
                  const Text(''),
                  if (Platform.isAndroid) ...[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(AppLocalizations.of(context).booruPage_booruSharingDialogBodyAndroid),
                    ),
                    ElevatedButton(
                      onPressed: ServiceHandler.openLinkDefaultsSettings,
                      child: Text(AppLocalizations.of(context).booruPage_gotoSettings),
                    ),
                  ],
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget editButton() {
    return SettingsButton(
      name: AppLocalizations.of(context).booruPage_editButton,
      icon: const Icon(Icons.edit),
      // do nothing if no selected or selected "Favourites/Dowloads"
      // TODO update all tabs with old booru with a new one
      // TODO if you open edit after already editing - it will open old instance + possible exception due to old data
      page: (selectedBooru != null && selectedBooru?.type != BooruType.Favourites && selectedBooru?.type != BooruType.Downloads)
          ? () => BooruEdit(selectedBooru!)
          : null,
    );
  }

  Widget deleteButton() {
    return SettingsButton(
      name: AppLocalizations.of(context).booruPage_deleteButton(selectedBooru?.name),
      icon: Icon(Icons.delete_forever, color: Theme.of(context).colorScheme.error),
      action: () {
        // do nothing if no selected or selected "Favourites/Downloads" or there are tabs with it
        if (selectedBooru == null) {
          FlashElements.showSnackbar(
            context: context,
            title: Text(AppLocalizations.of(context).booruPage_noBooruSelected, style: const TextStyle(fontSize: 20)),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.red,
            sideColor: Colors.red,
          );
          return;
        }
        if (selectedBooru?.type == BooruType.Favourites || selectedBooru?.type == BooruType.Downloads) {
          FlashElements.showSnackbar(
            context: context,
            title: Text(AppLocalizations.of(context).booruPage_booruCannotBeDeleted, style: const TextStyle(fontSize: 20)),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.red,
            sideColor: Colors.red,
          );
          return;
        }

        // TODO reset all tabs to next available booru?
        final List<SearchTab> tabsWithBooru = searchHandler.list.where((tab) => tab.selectedBooru.value.name == selectedBooru?.name).toList();
        if (tabsWithBooru.isNotEmpty) {
          FlashElements.showSnackbar(
            context: context,
            title: Text(AppLocalizations.of(context).booruPage_booruCannotBeDeleted, style: const TextStyle(fontSize: 20)),
            content: Text(AppLocalizations.of(context).booruPage_removeTabsFirst, style: const TextStyle(fontSize: 16)),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.red,
            sideColor: Colors.red,
          );
          return;
        }

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return SettingsDialog(
              title: Text(AppLocalizations.of(context).booruPage_deleteDialogTitle),
              contentItems: [
                Text(AppLocalizations.of(context).booruPage_deleteDialogBody(selectedBooru?.name)),
              ],
              actionButtons: [
                const CancelButton(),
                ElevatedButton.icon(
                  onPressed: () async {
                    // save current and select next available booru to avoid exception after deletion
                    final Booru tempSelected = selectedBooru!;
                    if (settingsHandler.booruList.isNotEmpty && settingsHandler.booruList.length > 1) {
                      selectedBooru = settingsHandler.booruList[1];
                    } else {
                      selectedBooru = null;
                    }
                    // set new prefbooru if it is a deleted one
                    if (tempSelected.name == settingsHandler.prefBooru) {
                      settingsHandler.prefBooru = selectedBooru?.name ?? '';
                    }
                    // restate to avoid an exception due to changed booru list
                    setState(() {});

                    if (await settingsHandler.deleteBooru(tempSelected)) {
                      FlashElements.showSnackbar(
                        context: context,
                        title: Text(AppLocalizations.of(context).booruPage_booruDeleted, style: const TextStyle(fontSize: 20)),
                        leadingIcon: Icons.delete_forever,
                        leadingIconColor: Colors.red,
                        sideColor: Colors.yellow,
                      );
                    } else {
                      // restore selected and prefbooru if something went wrong
                      selectedBooru = tempSelected;
                      settingsHandler.prefBooru = tempSelected.name ?? '';
                      await settingsHandler.sortBooruList();

                      FlashElements.showSnackbar(
                        context: context,
                        title: Text(AppLocalizations.of(context).booruPage_errorDuringDeletion, style: const TextStyle(fontSize: 20)),
                        content: Text(AppLocalizations.of(context).booruPage_errorDuringDeletionContent, style: const TextStyle(fontSize: 16)),
                        leadingIcon: Icons.warning_amber,
                        leadingIconColor: Colors.red,
                        sideColor: Colors.red,
                      );
                    }

                    setState(() {});
                    Navigator.of(context).pop(true);
                  },
                  label: Text(AppLocalizations.of(context).booruPage_deleteBooru),
                  icon: Icon(Icons.delete_forever, color: Theme.of(context).colorScheme.error),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget webviewButton() {
    // TODO add help button and explain how to properly setup cookies
    return SettingsButton(
      name: AppLocalizations.of(context).booruEdit_openWebview,
      subtitle: Text(AppLocalizations.of(context).booruEdit_beta),
      icon: const Icon(Icons.public),
      page: () => InAppWebviewView(initialUrl: selectedBooru!.baseURL!),
    );
  }

  Widget addFromClipboardButton() {
    return SettingsButton(
      name: AppLocalizations.of(context).booruPage_importButton,
      icon: const Icon(Icons.paste),
      action: () async {
        // FlashElements.showSnackbar(title: Text('Deep Link: $url'), duration: null);
        final ClipboardData? cdata = await Clipboard.getData(Clipboard.kTextPlain);
        final String url = cdata?.text ?? '';
        Logger.Inst().log(url, 'BooruPage', 'getBooruFromClipboard', LogTypes.settingsLoad);
        if (url.isNotEmpty) {
          if (url.contains('loli.snatcher')) {
            final Booru booru = Booru.fromLink(url);
            if (booru.name != null && booru.name!.isNotEmpty) {
              if (settingsHandler.booruList.indexWhere((b) => b.name == booru.name) != -1) {
                // Rename config if its already in the list
                booru.name = '${booru.name!} (duplicate)';
              }
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => BooruEdit(booru),
                ),
              );
            }
          } else {
            FlashElements.showSnackbar(
              context: context,
              title: Text(AppLocalizations.of(context).booruPage_invalidUrl, style: const TextStyle(fontSize: 20)),
              content: Text(AppLocalizations.of(context).booruPage_onlyLoliSnatcherUrls, style: const TextStyle(fontSize: 16)),
              leadingIcon: Icons.warning_amber,
              leadingIconColor: Colors.red,
              sideColor: Colors.red,
            );
          }
        } else {
          FlashElements.showSnackbar(
            context: context,
            title: Text(AppLocalizations.of(context).booruPage_noTextInClipboard, style: const TextStyle(fontSize: 20)),
            leadingIcon: Icons.warning_amber,
            leadingIconColor: Colors.red,
            sideColor: Colors.red,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).booruPage_title),
        ),
        body: Center(
          child: ListView(
            children: [
              SettingsTextInput(
                controller: defaultTagsController,
                title: AppLocalizations.of(context).booruPage_defaultTagsTitle,
                hintText: AppLocalizations.of(context).booruPage_defaultTagsHint,
                inputType: TextInputType.text,
                clearable: true,
                pasteable: true,
                resetText: () => 'rating:safe',
              ),
              SettingsTextInput(
                controller: limitController,
                title: AppLocalizations.of(context).booruPage_itemsPerPageTitle,
                hintText: AppLocalizations.of(context).booruPage_itemsPerPageHint,
                inputType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                resetText: () => settingsHandler.map['limit']!['default']!.toString(),
                numberButtons: true,
                numberStep: 10,
                numberMin: 10,
                numberMax: 100,
                validator: (String? value) {
                  final int? parse = int.tryParse(value ?? '');
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context).booruPage_itemsPerPageEmptyValue;
                  } else if (parse == null) {
                    return AppLocalizations.of(context).booruPage_itemsPerPageInvalidValue;
                  } else if (parse < 10) {
                    return AppLocalizations.of(context).booruPage_itemsPerPageTooSmall;
                  } else if (parse > 100) {
                    return AppLocalizations.of(context).booruPage_itemsPerPageTooBig;
                  } else {
                    return null;
                  }
                },
              ),
              const SettingsButton(name: '', enabled: false),
              addFromClipboardButton(),
              addButton(),
              if (settingsHandler.booruList.isNotEmpty) ...[
                booruSelector(),
                if (selectedBooru != null) ...[
                  editButton(),
                  shareButton(),
                  webviewButton(),
                  deleteButton(),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }
}

Future<bool?> askToChangePrefBooru(Booru? initBooru, Booru selectedBooru) async {
  if (initBooru != null && initBooru.name != selectedBooru.name) {
    return showDialog<bool>(
      context: NavigationHandler.instance.navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return SettingsDialog(
          title: Text(AppLocalizations.of(context).booruPage_changeDefaultBooru),
          contentItems: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: AppLocalizations.of(context).booruPage_changeTo),
                  TextSpan(text: selectedBooru.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  WidgetSpan(child: Favicon(selectedBooru)),
                  const TextSpan(text: '?'),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: AppLocalizations.of(context).booruPage_keepCurrentBooru),
                  TextSpan(text: initBooru.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  WidgetSpan(child: Favicon(initBooru)),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: AppLocalizations.of(context).booruPage_changeToNewBooru),
                  TextSpan(text: selectedBooru.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  WidgetSpan(child: Favicon(selectedBooru)),
                ],
              ),
            ),
          ],
          actionButtons: [
            const CancelButton(returnData: null),
            ElevatedButton(
              child: Text(AppLocalizations.of(context).button_no),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            ElevatedButton(
              child: Text(AppLocalizations.of(context).button_yes),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  } else {
    return true;
  }
}
