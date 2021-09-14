import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/widgets/InfoDialog.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../ServiceHandler.dart';
import '../../SettingsHandler.dart';
import 'BooruEditPage.dart';

// ignore: must_be_immutable
class BooruPage extends StatefulWidget {
  BooruPage();
  @override
  _BooruPageState createState() => _BooruPageState();
}

class _BooruPageState extends State<BooruPage> {
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final SearchHandler searchHandler = Get.find<SearchHandler>();

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
    bool result = await settingsHandler.saveSettings();
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
            title: Text("Boorus & Search"),
          ),
          body: Center(
            child: ListView(
              children: [
                SettingsTextInput(
                  controller: defaultTagsController,
                  title: 'Default Tags',
                  hintText: "Tags searched when app opens",
                  inputType: TextInputType.text,
                ),
                SettingsTextInput(
                  controller: limitController,
                  title: 'Items per Page',
                  hintText: "Items to fetch per page 10-100",
                  inputType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
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

                SettingsButton(name: '', enabled: false),
                SettingsBooruDropdown(
                  selected: selectedBooru,
                  onChanged: (Booru? newValue){
                    setState((){
                      selectedBooru = newValue;
                    });
                  },
                  title: 'Booru',
                  trailingIcon: IconButton(
                    icon: Icon(Icons.info, color: Get.theme.colorScheme.secondary),
                    onPressed: () {
                      Get.dialog(
                          InfoDialog("Booru",
                            [
                              Text("The booru selected here will be set as default after saving"),
                              Text("The default booru will be first to appear in the dropdown boxes"),
                            ],
                            CrossAxisAlignment.start,
                          )
                      );
                    },
                  ),
                ),
                SettingsButton(
                  name: 'Edit selected',
                  icon: Icon(Icons.edit),
                  // do nothing if no selected or selected "Favourites"
                  // TODO update all tabs with old booru with a new one
                  // TODO if you open edit after already editing - it will open old instance + possible exception due to old data
                  page: (selectedBooru != null && selectedBooru?.type != 'Favourites') ? () => BooruEdit(selectedBooru!) : null,
                ),
                SettingsButton(
                  name: 'Delete selected',
                  icon: Icon(Icons.delete_forever, color: Get.theme.errorColor),
                  action: (){
                    // do nothing if no selected or selected "Favourites" or there are tabs with it
                    if(selectedBooru == null) {
                      ServiceHandler.displayToast("No Booru Selected!");
                      return;
                    }
                    if(selectedBooru?.type == 'Favourites') {
                      ServiceHandler.displayToast("Can't delete this booru!");
                      return;
                    }

                    // TODO reset all tabs to next available booru?
                    List<SearchGlobal> tabsWithBooru = searchHandler.list.where((tab) => tab.selectedBooru.value.name == selectedBooru?.name).toList();
                    if(tabsWithBooru.isNotEmpty) {
                      ServiceHandler.displayToast("Can't delete this booru!\nRemove all tabs with it first");
                      return;
                    }

                    Get.dialog(
                      SettingsDialog(
                        title: const Text('Are you sure?'),
                        contentItems: [
                          Text("Delete Booru: ${selectedBooru?.name}?"),
                        ],
                        actionButtons: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: Text('Cancel')
                          ),
                          TextButton(
                            onPressed: () {
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

                              if (settingsHandler.deleteBooru(tempSelected)){
                                ServiceHandler.displayToast("Booru Deleted!");
                              } else {
                                // restore selected and prefbooru if something went wrong
                                selectedBooru = tempSelected;
                                settingsHandler.prefBooru = tempSelected.name ?? '';
                                settingsHandler.sortBooruList();
                                ServiceHandler.displayToast("Something went wrong during deletion of a booru config!");
                              }

                              setState(() { });
                              Navigator.of(context).pop(true);
                            },
                            child: Text('Delete Booru', style: TextStyle(color: Get.theme.errorColor))
                          ),
                        ]
                      ),
                    );

                  },
                ),
                SettingsButton(
                  name: 'Add new Booru',
                  icon: Icon(Icons.add),
                  page: () => BooruEdit(Booru("New","","","","")),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
