import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/src/pages/settings/BooruEditPage.dart';
import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/src/data/Booru.dart';
import 'package:LoliSnatcher/widgets/CancelButton.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/utilities/Logger.dart';

// ignore: must_be_immutable
class BooruPage extends StatefulWidget {
  const BooruPage({Key? key}) : super(key: key);

  @override
  State<BooruPage> createState() => _BooruPageState();
}

class _BooruPageState extends State<BooruPage> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;

  final defaultTagsController = TextEditingController();
  final limitController = TextEditingController();
  Booru? selectedBooru;

  @override
  void initState(){
    super.initState();
    defaultTagsController.text = settingsHandler.defTags;
    limitController.text = settingsHandler.limit.toString();

    if(settingsHandler.prefBooru.isNotEmpty) {
      selectedBooru = settingsHandler.booruList.firstWhere((booru) => booru.name == settingsHandler.prefBooru, orElse: () => Booru(null, null, null, null, null));
      if(selectedBooru?.name == null) selectedBooru = null;
    } else if(settingsHandler.booruList.isNotEmpty) {
      selectedBooru = settingsHandler.booruList[0];
    }
  }

  void copyBooruLink(bool withSensitiveData) {
    Navigator.of(context).pop(true); // remove dialog
    String link = selectedBooru?.toLink(withSensitiveData) ?? '';
    if (Platform.isWindows || Platform.isLinux) {
      Clipboard.setData(ClipboardData(text: link));
      FlashElements.showSnackbar(
        context: context,
        title: const Text(
          'Booru Config Link Copied!',
          style: TextStyle(fontSize: 20)
        ),
        leadingIcon: Icons.share,
        leadingIconColor: Colors.green,
        sideColor: Colors.green,
      );
    } else if (Platform.isAndroid) {
      ServiceHandler serviceHandler = ServiceHandler();
      serviceHandler.loadShareTextIntent(link);
    }
  }

  //called when page is clsoed, sets settingshandler variables and then writes settings to disk
  Future<bool> _onWillPop() async {
    settingsHandler.defTags = defaultTagsController.text;
    if (int.parse(limitController.text) > 100) {
      limitController.text = "100";
    } else if (int.parse(limitController.text) < 10) {
      limitController.text = "10";
    }

    if (selectedBooru == null && settingsHandler.booruList.isNotEmpty) {
      selectedBooru = settingsHandler.booruList[0];
    }
    if(selectedBooru != null) {
      settingsHandler.prefBooru = selectedBooru?.name ?? '';
    }
    settingsHandler.limit = int.parse(limitController.text);
    bool result = await settingsHandler.saveSettings(restate: false);
    settingsHandler.sortBooruList();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text("Boorus & Search"),
          ),
          body: Center(
            child: ListView(
              children: [
                SettingsTextInput(
                  controller: defaultTagsController,
                  title: 'Default Tags',
                  hintText: "Tags searched when app opens",
                  inputType: TextInputType.text,
                  clearable: true,
                  resetText: () => 'rating:safe',
                ),
                SettingsTextInput(
                  controller: limitController,
                  title: 'Items per Page',
                  hintText: "Items to fetch per page 10-100",
                  inputType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  resetText: () => settingsHandler.map['limit']!['default']!.toString(),
                  numberButtons: true,
                  numberStep: 10,
                  numberMin: 10,
                  numberMax: 100,
                  validator: (String? value) {
                    int? parse = int.tryParse(value ?? '');
                    if(value == null || value.isEmpty) {
                      return 'Please enter a value';
                    } else if(parse == null) {
                      return 'Please enter a valid timeout value';
                    } else if(parse < 10) {
                      return 'Please enter a value bigger than 10';
                    } else if(parse > 100) {
                      return 'Please enter a value less than 100';
                    } else {
                      return null;
                    }
                  }
                ),

                const SettingsButton(name: '', enabled: false),
                SettingsBooruDropdown(
                  value: selectedBooru ?? settingsHandler.booruList[0],
                  onChanged: (Booru? newValue) {
                    final bool isNewValuePresent = settingsHandler.booruList.contains(newValue);
                    setState((){
                      selectedBooru = isNewValuePresent ? newValue : settingsHandler.booruList[0];
                      settingsHandler.prefBooru = selectedBooru?.name ?? '';
                      settingsHandler.sortBooruList();
                    });
                  },
                  title: 'Booru',
                  trailingIcon: IconButton(
                    icon: const Icon(Icons.help_outline),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const SettingsDialog(
                            title: Text('Booru'),
                            contentItems: <Widget>[
                              Text("The Booru selected here will be set as default after saving."),
                              Text(''),
                              Text("The default Booru will be first to appear in the dropdown boxes."),
                            ],
                          );
                        }
                      );
                    },
                  ),
                ),
                if(selectedBooru != null)
                  SettingsButton(
                    name: 'Share selected',
                    icon: const Icon(Icons.share),
                    action: () {
                      if(selectedBooru?.type == 'Favourites') {
                        return;
                      }

                      showDialog(
                        context: context,
                        builder: (context) {
                          return SettingsDialog(
                            title: const Text('Share Booru'),
                            contentItems: <Widget>[
                              Text("Booru Config of '${selectedBooru?.name}' will be converted to a link ${Platform.isAndroid ? 'and share dialog will open' : 'which will be copied to clipboard'}."),
                              const Text(''),
                              const Text("Should login/apikey data be included?"),
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
                        }
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
                              contentItems: <Widget>[
                                // TODO more explanations about booru sharing
                                const Text("...................."),
                                const Text(''),
                                if (Platform.isAndroid) ...[
                                  const Text("How to automatically open booru config links in the app on Android 12 and higher:"),
                                  const Text('1) Tap button below to open system app settings'),
                                  const Text('2) Go to "Open by default"'),
                                  const Text('3) Tap on "Add link"/Plus icon and select all available options'),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      openAppSettings();
                                    },
                                    child: const Text('Go to settings'),
                                  ),
                                ],
                              ],
                            );
                          }
                        );
                      },
                    ),
                  ),
                SettingsButton(
                  name: 'Edit selected',
                  icon: const Icon(Icons.edit),
                  // do nothing if no selected or selected "Favourites"
                  // TODO update all tabs with old booru with a new one
                  // TODO if you open edit after already editing - it will open old instance + possible exception due to old data
                  page: (selectedBooru != null && selectedBooru?.type != 'Favourites') ? () => BooruEdit(selectedBooru!) : null,
                ),
                SettingsButton(
                  name: 'Delete selected',
                  icon: Icon(Icons.delete_forever, color: Theme.of(context).errorColor),
                  action: (){
                    // do nothing if no selected or selected "Favourites" or there are tabs with it
                    if(selectedBooru == null) {
                      FlashElements.showSnackbar(
                        context: context,
                        title: const Text(
                          'No Booru Selected!',
                          style: TextStyle(fontSize: 20)
                        ),
                        leadingIcon: Icons.warning_amber,
                        leadingIconColor: Colors.red,
                        sideColor: Colors.red,
                      );
                      return;
                    }
                    if(selectedBooru?.type == 'Favourites') {
                      FlashElements.showSnackbar(
                        context: context,
                        title: const Text(
                          "Can't delete this Booru!",
                          style: TextStyle(fontSize: 20)
                        ),
                        leadingIcon: Icons.warning_amber,
                        leadingIconColor: Colors.red,
                        sideColor: Colors.red,
                      );
                      return;
                    }

                    // TODO reset all tabs to next available booru?
                    List<SearchGlobal> tabsWithBooru = searchHandler.list.where((tab) => tab.selectedBooru.value.name == selectedBooru?.name).toList();
                    if(tabsWithBooru.isNotEmpty) {
                      FlashElements.showSnackbar(
                        context: context,
                        title: const Text(
                          "Can't delete this Booru!",
                          style: TextStyle(fontSize: 20)
                        ),
                        content: const Text(
                          "Remove all tabs which use it first!",
                          style: TextStyle(fontSize: 16)
                        ),
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
                            Text("Delete Booru: ${selectedBooru?.name}?"),
                          ],
                          actionButtons: [
                            const CancelButton(),
                            ElevatedButton.icon(
                              onPressed: () async {
                                // save current and select next available booru to avoid exception after deletion
                                Booru tempSelected = selectedBooru!;
                                if(settingsHandler.booruList.isNotEmpty && settingsHandler.booruList.length > 1) {
                                  selectedBooru = settingsHandler.booruList[1];
                                } else {
                                  selectedBooru = null;
                                }
                                // set new prefbooru if it is a deleted one
                                if(tempSelected.name == settingsHandler.prefBooru) {
                                  settingsHandler.prefBooru = selectedBooru?.name ?? '';
                                }
                                // restate to avoid an exception due to changed booru list
                                setState(() { });

                                if (await settingsHandler.deleteBooru(tempSelected)) {
                                  FlashElements.showSnackbar(
                                    context: context,
                                    title: const Text(
                                      "Booru Deleted!",
                                      style: TextStyle(fontSize: 20)
                                    ),
                                    leadingIcon: Icons.delete_forever,
                                    leadingIconColor: Colors.red,
                                    sideColor: Colors.yellow,
                                  );
                                } else {
                                  // restore selected and prefbooru if something went wrong
                                  selectedBooru = tempSelected;
                                  settingsHandler.prefBooru = tempSelected.name ?? '';
                                  settingsHandler.sortBooruList();

                                  FlashElements.showSnackbar(
                                    context: context,
                                    title: const Text(
                                      "Error!",
                                      style: TextStyle(fontSize: 20)
                                    ),
                                    content: const Text(
                                      "Something went wrong during deletion of a booru config!",
                                      style: TextStyle(fontSize: 16)
                                    ),
                                    leadingIcon: Icons.warning_amber,
                                    leadingIconColor: Colors.red,
                                    sideColor: Colors.red,
                                  );
                                }

                                setState(() { });
                                Navigator.of(context).pop(true);
                              },
                              label: const Text('Delete Booru'),
                              icon: Icon(Icons.delete_forever, color: Theme.of(context).colorScheme.error),
                            ),
                          ]
                        );
                      }
                    );
                  },
                ),
                SettingsButton(
                  name: 'Add new Booru',
                  icon: const Icon(Icons.add),
                  page: () => BooruEdit(Booru("New","","","","")),
                ),

                const SettingsButton(name: '', enabled: false),
                SettingsButton(
                  name: 'Add Booru from URL in Clipboard',
                  icon: const Icon(Icons.paste),
                  action: () async {
                    // FlashElements.showSnackbar(title: Text('Deep Link: $url'), duration: null);
                    ClipboardData? cdata = await Clipboard.getData(Clipboard.kTextPlain);
                    String url = cdata?.text ?? '';
                    Logger.Inst().log(url, "BooruPage", "getBooruFromClipboard", LogTypes.settingsLoad);
                    if(url.isNotEmpty) {
                      if(url.contains('loli.snatcher')) {
                        Booru booru = Booru.fromLink(url);
                        if(booru.name != null && booru.name!.isNotEmpty) {
                          if(settingsHandler.booruList.indexWhere((b) => b.name == booru.name) != -1) {
                            // Rename config if its already in the list
                            booru.name = '${booru.name!} (duplicate)';
                          }
                          Navigator.of(context).push(MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) => BooruEdit(booru),
                          ));
                        }
                      } else {
                        FlashElements.showSnackbar(
                          context: context,
                          title: const Text(
                            "Invalid URL!",
                            style: TextStyle(fontSize: 20)
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
                          'No URL in Clipboard!',
                          style: TextStyle(fontSize: 20)
                        ),
                        leadingIcon: Icons.warning_amber,
                        leadingIconColor: Colors.red,
                        sideColor: Colors.red,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
    );
  }
}
