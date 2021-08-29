import 'package:LoliSnatcher/pages/LoliSyncPage.dart';
import 'package:LoliSnatcher/pages/settings/BackupRestorePage.dart';
import 'package:LoliSnatcher/pages/settings/ThemePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/pages/AboutPage.dart';
import 'package:LoliSnatcher/pages/settings/BehaviourPage.dart';
import 'package:LoliSnatcher/pages/settings/BooruPage.dart';
import 'package:LoliSnatcher/pages/settings/DatabasePage.dart';
import 'package:LoliSnatcher/pages/settings/DebugPage.dart';
import 'package:LoliSnatcher/pages/settings/GalleryPage.dart';
import 'package:LoliSnatcher/pages/settings/UserInterfacePage.dart';
import 'package:LoliSnatcher/pages/settings/FilterTagsPage.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';

/**
 * Then settings page is pretty self explanatory it will display, allow the user to edit and save settings
 */
class SettingsPage extends StatelessWidget {
  final SettingsHandler settingsHandler = Get.find();
  int debugTaps = 0;

  Future<bool> _onWillPop() async {
    bool result = await settingsHandler.saveSettings();
    await settingsHandler.loadSettings();
    // await settingsHandler.getBooru();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Settings"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () async{
                Get.back();
              }
          ),
        ),
        body:Center(
          child: ListView(
            children: <Widget>[
              SettingsButton(
                name: 'Boorus & Search',
                icon: Icon(Icons.image_search),
                page: () => BooruPage()
              ),
              SettingsButton(
                name: 'Interface',
                icon: Icon(Icons.grid_on),
                page: () => UserInterfacePage()
              ),
              SettingsButton(
                name: 'Themes',
                icon: Icon(Icons.palette),
                page: () => ThemePage()
              ),
              SettingsButton(
                name: 'Gallery',
                icon: Icon(Icons.view_carousel),
                page: () => GalleryPage()
              ),
              SettingsButton(
                name: 'Behaviour',
                icon: Icon(Icons.settings),
                page: () => BehaviourPage()
              ),
              SettingsButton(
                name: 'Tag Filters',
                icon: Icon(CupertinoIcons.tag),
                page: () => FiltersEdit()
              ),
              SettingsButton(
                name: 'Database',
                icon: Icon(Icons.list_alt),
                page: () => DatabasePage()
              ),
              SettingsButton(
                // TODO
                name: 'Backup & Restore [WIP]',
                icon: Icon(Icons.restore_page),
                page: () => BackupRestorePage(),
              ),
              SettingsButton(
                name: 'Loli Sync',
                icon: Icon(Icons.sync),
                action: settingsHandler.dbEnabled ? null : () {
                  ServiceHandler.displayToast("Database must be enabled to use Loli Sync");
                },
                page: settingsHandler.dbEnabled ? () => LoliSyncPage() : null,
              ),

              SettingsButton(
                name: 'About',
                icon: Icon(Icons.info_outline),
                page: () => AboutPage()
              ),
              SettingsButton(
                name: 'Help',
                icon: Icon(Icons.help_center_outlined),
                action: () {
                  ServiceHandler.launchURL("https://github.com/NO-ob/LoliSnatcher_Droid/wiki");
                },
                trailingIcon: Icon(Icons.exit_to_app)
              ),

              Obx(() {
                if(settingsHandler.isDebug.value) {
                  return SettingsButton(
                    name: 'Debug',
                    icon: Icon(Icons.developer_mode),
                    page: () => DebugPage()
                  );
                } else {
                  return const SizedBox();
                }
              }),

              SettingsButton(
                name: "Version: ${settingsHandler.verStr}",
                icon: Icon(null), // to align with other items
                action: () {
                  if(settingsHandler.isDebug.value) {
                    ServiceHandler.displayToast('Debug mode is already enabled!');
                  } else {
                    debugTaps++;
                    if(debugTaps > 5) {
                      settingsHandler.isDebug.value = true;
                      ServiceHandler.displayToast('Debug mode enabled!');
                    }
                  }
                },
                drawBottomBorder: false
              ),
            ],
          ),
        ),
      ),
    );
  }
}
