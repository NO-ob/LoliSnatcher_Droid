import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:LoliSnatcher/src/services/get_perms.dart';
import 'package:LoliSnatcher/src/handlers/snatch_handler.dart';
import 'package:LoliSnatcher/src/handlers/settings_handler.dart';
import 'package:LoliSnatcher/src/data/booru.dart';
import 'package:LoliSnatcher/src/handlers/search_handler.dart';
import 'package:LoliSnatcher/src/widgets/common/flash_elements.dart';
import 'package:LoliSnatcher/src/widgets/common/settings_widgets.dart';


/// This is the page which allows the user to batch download images
class SnatcherPage extends StatefulWidget {
  const SnatcherPage({Key? key}) : super(key: key);

  @override
  State<SnatcherPage> createState() => _SnatcherPageState();
}

class _SnatcherPageState extends State<SnatcherPage> {
  final SearchHandler searchHandler = SearchHandler.instance;
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SnatchHandler snatchHandler = SnatchHandler.instance;

  final snatcherTagsController = TextEditingController();
  final snatcherAmountController = TextEditingController();
  final snatcherSleepController = TextEditingController();

  late Booru selectedBooru;

  @override
  void initState() {
    super.initState();
    getPerms();
    //If the user has searched tags on the main window they will be loaded into the tags field
    snatcherTagsController.text = searchHandler.currentTab.tags;
    snatcherAmountController.text = 10.toString();
    selectedBooru = searchHandler.currentBooru;
    snatcherSleepController.text = settingsHandler.snatchCooldown.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snatcher")
      ),
      resizeToAvoidBottomInset: true,
      body: Center(
        child: ListView(
          children: <Widget>[
            SettingsTextInput(
              controller: snatcherTagsController,
              title: 'Tags',
              hintText: "Enter Tags",
              inputType: TextInputType.text,
              clearable: true,
            ),
            SettingsTextInput(
              controller: snatcherAmountController,
              title: 'Amount',
              hintText: "Amount of Files to Snatch",
              inputType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              resetText: () => 10.toString(),
              numberButtons: true,
              numberStep: 10,
              numberMin: 10,
              numberMax: double.infinity,
            ),
            SettingsTextInput(
              controller: snatcherSleepController,
              title: 'Delay (in ms)',
              hintText: "Delay between each download",
              inputType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              resetText: () => settingsHandler.snatchCooldown.toString(),
              numberButtons: true,
              numberStep: 50,
              numberMin: 100,
              numberMax: double.infinity,
            ),
            SettingsBooruDropdown(
              value: selectedBooru,
              onChanged: (Booru? newValue) {
                setState(() {
                  selectedBooru = newValue!;
                });
              },
              title: 'Booru',
            ),

            const SettingsButton(name: '', enabled: false),
            SettingsButton(
              name: 'Snatch Files',
              icon: const Icon(Icons.download),
              action: () {
                if (snatcherSleepController.text.isEmpty){
                  snatcherSleepController.text = 0.toString();
                }
                if(selectedBooru == null) {
                  FlashElements.showSnackbar(
                    context: context,
                    title: const Text(
                      "No Booru Selected!",
                      style: TextStyle(fontSize: 18)
                    ),
                    leadingIcon: Icons.error_outline,
                    leadingIconColor: Colors.red,
                    sideColor: Colors.red,
                  );
                  return;
                }

                snatchHandler.searchSnatch(
                  snatcherTagsController.text,
                  snatcherAmountController.text,
                  int.parse(snatcherSleepController.text),
                  selectedBooru,
                );


                Navigator.of(context).pop();
                // TODO make a page which shows progress of all files + list of previous downloads
              },
            ),
          ],
        ),
      ),
    );
  }
}
