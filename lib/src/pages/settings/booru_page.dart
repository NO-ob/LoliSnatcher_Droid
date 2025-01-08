import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/utils.dart';

import 'package:lolisnatcher/src/boorus/booru_type.dart';
import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/navigation_handler.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/pages/settings/booru_edit_page.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/flash_elements.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/image/booru_favicon.dart';
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
    limitController.text = settingsHandler.itemLimit.toString();

    if (settingsHandler.prefBooru.isNotEmpty) {
      selectedBooru = settingsHandler.booruList.firstWhereOrNull(
        (booru) => booru.name == settingsHandler.prefBooru,
      );
    } else if (settingsHandler.booruList.isNotEmpty) {
      selectedBooru = settingsHandler.booruList[0];
    }

    initPrefBooru = selectedBooru;
  }

  @override
  void dispose() {
    defaultTagsController.dispose();
    limitController.dispose();
    super.dispose();
  }

  void copyBooruLink(bool withSensitiveData) {
    Navigator.of(context).pop(true); // remove dialog
    final String link = selectedBooru?.toLink(withSensitiveData) ?? '';
    if (Platform.isWindows || Platform.isLinux) {
      Clipboard.setData(ClipboardData(text: link));
      FlashElements.showSnackbar(
        context: context,
        title: const Text('Booru Config Link Copied!', style: TextStyle(fontSize: 20)),
        leadingIcon: Icons.share,
        leadingIconColor: Colors.green,
        sideColor: Colors.green,
      );
    } else if (Platform.isAndroid) {
      ServiceHandler.loadShareTextIntent(link);
    }
  }

  //called when page is clsoed, sets settingshandler variables and then writes settings to disk
  Future<void> _onPopInvoked(bool didPop, _) async {
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
    settingsHandler.itemLimit = int.parse(limitController.text);
    final bool result = await settingsHandler.saveSettings(restate: false);
    await settingsHandler.sortBooruList();
    if (result) {
      Navigator.of(context).pop();
    }
  }

  Widget addButton() {
    return SettingsButton(
      name: 'Add new Booru config',
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
      title: 'Added Boorus',
      trailingIcon: IconButton(
        icon: const Icon(Icons.help_outline),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return const SettingsDialog(
                title: Text('Booru'),
                contentItems: [
                  Text('The Booru selected here will be set as default after saving.'),
                  Text(''),
                  Text('The default Booru will be first to appear in the dropdown boxes.'),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget shareButton() {
    if (!BooruType.saveable.contains(selectedBooru?.type)) {
      return const SizedBox.shrink();
    }

    return SettingsButton(
      name: 'Share Booru config',
      icon: const Icon(Icons.share),
      action: () {
        showDialog(
          context: context,
          builder: (context) {
            return SettingsDialog(
              title: const Text('Share Booru'),
              contentItems: [
                Text(
                  "Booru config of '${selectedBooru?.name}' will be converted to a link ${Platform.isAndroid ? 'and share dialog will open' : 'which will be copied to clipboard'}.",
                ),
                const Text(''),
                const Text('Should login/apikey data be included?'),
              ],
              actionButtons: [
                const CancelButton(),
                ElevatedButton(
                  child: const Text('Yes'),
                  onPressed: () {
                    copyBooruLink(true);
                  },
                ),
                ElevatedButton(
                  child: const Text('No'),
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
                title: const Text('Booru sharing'),
                contentItems: [
                  // TODO more explanations about booru sharing
                  const Text(''),
                  if (Platform.isAndroid) ...[
                    const Text('How to automatically open Booru config links in the app on Android 12 and higher:'),
                    const Text('1) Tap button below to open system app link defaults settings'),
                    const Text('2) Tap on "Add link" and select all available options'),
                    const SizedBox(height: 20),
                    const ElevatedButton(
                      onPressed: ServiceHandler.openLinkDefaultsSettings,
                      child: Text('Go to settings'),
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
    if (!BooruType.saveable.contains(selectedBooru?.type)) {
      return const SizedBox.shrink();
    }

    return SettingsButton(
      name: 'Edit Booru config',
      icon: const Icon(Icons.edit),
      // do nothing if no selected or selected "Favourites/Dowloads"
      // TODO update all tabs with old booru with a new one
      // TODO if you open edit after already editing - it will open old instance + possible exception due to old data
      page: (selectedBooru != null && BooruType.saveable.contains(selectedBooru?.type)) ? () => BooruEdit(selectedBooru!) : null,
    );
  }

  Widget deleteButton() {
    if (!BooruType.saveable.contains(selectedBooru?.type)) {
      return const SizedBox.shrink();
    }

    return SettingsButton(
      name: 'Delete ${selectedBooru?.name} Booru config',
      icon: Icon(Icons.delete_forever, color: Theme.of(context).colorScheme.error),
      action: () {
        // do nothing if no selected or selected "Favourites/Downloads" or there are tabs with it
        if (selectedBooru == null) {
          FlashElements.showSnackbar(
            context: context,
            title: const Text('No Booru Selected!', style: TextStyle(fontSize: 20)),
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
            title: const Text("Can't delete this Booru!", style: TextStyle(fontSize: 20)),
            content: const Text('Remove all tabs which use it first!', style: TextStyle(fontSize: 16)),
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
              title: const Text('Are you sure?'),
              contentItems: [
                Text('Delete Booru: ${selectedBooru?.name}?'),
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
                        title: const Text('Booru deleted!', style: TextStyle(fontSize: 20)),
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
                        title: const Text('Error!', style: TextStyle(fontSize: 20)),
                        content: const Text('Something went wrong during deletion of a Booru config!', style: TextStyle(fontSize: 16)),
                        leadingIcon: Icons.warning_amber,
                        leadingIconColor: Colors.red,
                        sideColor: Colors.red,
                      );
                    }

                    setState(() {});
                    Navigator.of(context).pop(true);
                  },
                  label: const Text('Delete Booru'),
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
    if (BooruType.saveable.contains(selectedBooru?.type) && Tools.isOnPlatformWithWebviewSupport) {
      // TODO add help button and explain how to properly setup cookies?
      return SettingsButton(
        name: 'Open webview',
        subtitle: const Text('To login or obtain cookies'),
        icon: const Icon(Icons.public),
        page: () => InAppWebviewView(initialUrl: selectedBooru!.baseURL!),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget addFromClipboardButton() {
    return SettingsButton(
      name: 'Import Booru config from clipboard',
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
              title: const Text('Invalid URL!', style: TextStyle(fontSize: 20)),
              content: const Text('Only loli.snatcher URLs are supported!', style: TextStyle(fontSize: 16)),
              leadingIcon: Icons.warning_amber,
              leadingIconColor: Colors.red,
              sideColor: Colors.red,
            );
          }
        } else {
          FlashElements.showSnackbar(
            context: context,
            title: const Text('No text in clipboard!', style: TextStyle(fontSize: 20)),
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
      onPopInvokedWithResult: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Boorus & Search'),
        ),
        body: Center(
          child: ListView(
            children: [
              SettingsTextInput(
                controller: defaultTagsController,
                title: 'Default tags',
                inputType: TextInputType.text,
                clearable: true,
                pasteable: true,
                resetText: () => 'rating:safe',
              ),
              SettingsTextInput(
                controller: limitController,
                title: 'Items fetched per page',
                hintText: '10-100',
                subtitle: const Text('Some Boorus may ignore this setting'),
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
                    return 'Please enter a value';
                  } else if (parse == null) {
                    return 'Please enter a valid timeout value';
                  } else if (parse < 10) {
                    return 'Please enter a value bigger than 10';
                  } else if (parse > 100) {
                    return 'Please enter a value less than 100';
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
          title: const Text('Change default Booru?'),
          contentItems: [
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: 'Change to: '),
                  TextSpan(text: selectedBooru.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  WidgetSpan(
                    child: BooruFavicon(selectedBooru),
                  ),
                  const TextSpan(text: '?'),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: 'Tap [No] to keep current: '),
                  TextSpan(text: initBooru.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  WidgetSpan(child: BooruFavicon(initBooru)),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: 'Tap [Yes] to change to: '),
                  TextSpan(text: selectedBooru.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  WidgetSpan(
                    child: BooruFavicon(selectedBooru),
                  ),
                ],
              ),
            ),
          ],
          actionButtons: [
            const CancelButton(returnData: null),
            ElevatedButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            ElevatedButton(
              child: const Text('Yes'),
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
