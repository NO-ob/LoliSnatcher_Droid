//import 'dart:html';
import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:LoliSnatcher/getPerms.dart';
import 'package:LoliSnatcher/SnatchHandler.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';


/**
 * This is the page which allows the user to batch download images
 */
class SnatcherPage extends StatefulWidget {
  SnatcherPage();
  @override
  _SnatcherPageState createState() => _SnatcherPageState();
}

class _SnatcherPageState extends State<SnatcherPage> {
  final SearchHandler searchHandler = Get.find();
  final SettingsHandler settingsHandler = Get.find();
  final SnatchHandler snatchHandler = Get.find();

  final snatcherTagsController = TextEditingController();
  final snatcherAmountController = TextEditingController();
  final snatcherSleepController = TextEditingController();

  late Booru? selectedBooru;

  @override
  void initState() {
    super.initState();
    getPerms();
    //If the user has searched tags on the main window they will be loaded into the tags field
    snatcherTagsController.text = searchHandler.currentTab.tags;
    selectedBooru = searchHandler.currentTab.selectedBooru.value;
    snatcherSleepController.text = settingsHandler.snatchCooldown.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Snatcher")
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            SettingsTextInput(
              controller: snatcherTagsController,
              title: 'Tags',
              hintText: "Enter Tags",
              inputType: TextInputType.text,
            ),
            SettingsTextInput(
              controller: snatcherAmountController,
              title: 'Amount',
              hintText: "Amount of Files to Snatch",
              inputType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
            SettingsTextInput(
              controller: snatcherSleepController,
              title: 'Delay (in ms)',
              hintText: "Delay between each download",
              inputType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
            SettingsBooruDropdown(
              selected: selectedBooru,
              onChanged: (Booru? newValue) {
                setState(() {
                  selectedBooru = newValue;
                });
              },
              title: 'Booru',
            ),

            SettingsButton(name: '', enabled: false),
            SettingsButton(
              name: 'Snatch Files',
              icon: Icon(Icons.download),
              action: () {
                if (snatcherSleepController.text.isEmpty){
                  snatcherSleepController.text = 0.toString();
                }
                if(selectedBooru == null) {
                  ServiceHandler.displayToast('No Booru Selected');
                  return;
                }

                snatchHandler.searchSnatch(
                  snatcherTagsController.text,
                  snatcherAmountController.text,
                  int.parse(snatcherSleepController.text),
                  selectedBooru!,
                );
                Get.back();
                //Get.off(SnatcherProgressPage(snatcherTagsController.text,snatcherAmountController.text,snatcherTimeoutController.text));
              },
            ),
          ],
        ),
      ),
    );
  }
}
