import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/pages/settings/BooruEditPage.dart';
import 'package:LoliSnatcher/widgets/WaterfallView.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';

class ImagePreviews extends StatelessWidget {
  final SettingsHandler settingsHandler = Get.find<SettingsHandler>();
  final SearchHandler searchHandler = Get.find<SearchHandler>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // no booru configs
      if (settingsHandler.booruList.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SettingsButton(
                name: 'No Booru Configs Found',
                icon: Icon(null),
              ),
              SettingsButton(
                name: 'Add New Booru',
                icon: Icon(Icons.settings),
                page: () => BooruEdit(Booru("New", "", "", "", "")),
              ),
              SettingsButton(
                name: 'Help',
                icon: Icon(Icons.help_center_outlined),
                action: () {
                  ServiceHandler.launchURL("https://github.com/NO-ob/LoliSnatcher_Droid/wiki");
                },
                trailingIcon: Icon(Icons.exit_to_app),
              ),
            ],
          ),
        );
      }

      // temp message while restoring tabs (or for some reason initial tab was not created)
      if (searchHandler.list.isEmpty) {
        return Center(
          child: Column(
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Get.theme.colorScheme.secondary),
              ),
              if (!searchHandler.isRestored.value) Text('Restoring previous session...'),
            ],
          ),
        );
      }

      // render thumbnails grid
      return WaterfallView(searchHandler.currentTab);
    });
  }
}
