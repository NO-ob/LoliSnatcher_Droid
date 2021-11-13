import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/pages/AboutPage.dart';
import 'package:LoliSnatcher/pages/settings/SaveCachePage.dart';
import 'package:LoliSnatcher/pages/settings/BooruPage.dart';
import 'package:LoliSnatcher/pages/settings/DatabasePage.dart';
import 'package:LoliSnatcher/pages/settings/DebugPage.dart';
import 'package:LoliSnatcher/pages/settings/GalleryPage.dart';
import 'package:LoliSnatcher/pages/settings/UserInterfacePage.dart';
import 'package:LoliSnatcher/pages/settings/FilterTagsPage.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:LoliSnatcher/pages/LoliSyncPage.dart';
import 'package:LoliSnatcher/pages/settings/BackupRestorePage.dart';
import 'package:LoliSnatcher/pages/settings/ThemePage.dart';
import 'package:LoliSnatcher/widgets/FlashElements.dart';
import 'package:LoliSnatcher/widgets/MascotImage.dart';

/**
 * Then settings page is pretty self explanatory it will display, allow the user to edit and save settings
 */
class SettingsPage extends StatelessWidget {
  final SettingsHandler settingsHandler = Get.find();
  int debugTaps = 0;

  Future<bool> _onWillPop() async {
    bool result = await settingsHandler.saveSettings(restate: true);
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
                name: 'Snatching & Caching',
                icon: Icon(Icons.settings),
                page: () => SaveCachePage()
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
                name: 'Backup & Restore [Beta]',
                icon: Icon(Icons.restore_page),
                page: () => BackupRestorePage(),
              ),
              SettingsButton(
                name: 'LoliSync',
                icon: Icon(Icons.sync),
                action: settingsHandler.dbEnabled ? null : () {
                  FlashElements.showSnackbar(
                    context: context,
                    title: Text(
                      "Error!",
                      style: TextStyle(fontSize: 20)
                    ),
                    content: Text("Database must be enabled to use LoliSync"),
                    leadingIcon: Icons.error_outline,
                    leadingIconColor: Colors.red,
                    sideColor: Colors.red,
                  );
                },
                page: settingsHandler.dbEnabled ? () => LoliSyncPage() : null,
              ),

              SettingsButton(
                name: 'About',
                icon: Icon(Icons.info_outline),
                page: () => AboutPage()
              ),
              SettingsButton(
                name: 'Check for Updates',
                icon: Icon(Icons.update),
                action: () {
                  settingsHandler.checkUpdate(withMessage: true);
                },
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
                name: "Version: ${settingsHandler.verStr}+${settingsHandler.buildNumber}${kDebugMode ? '+Debug' : ''}${EnvironmentConfig.isFromStore ? '+Play' : ''}",
                icon: Icon(null), // to align with other items
                action: () {
                  if(settingsHandler.isDebug.value) {
                    FlashElements.showSnackbar(
                      context: context,
                      title: Text(
                        "Debug mode is already enabled!",
                        style: TextStyle(fontSize: 18)
                      ),
                      leadingIcon: Icons.warning_amber,
                      leadingIconColor: Colors.yellow,
                      sideColor: Colors.yellow,
                    );
                  } else {
                    debugTaps++;
                    if(debugTaps > 5) {
                      settingsHandler.isDebug.value = true;
                      FlashElements.showSnackbar(
                        context: context,
                        title: Text(
                          "Debug mode is enabled!",
                          style: TextStyle(fontSize: 18)
                        ),
                        leadingIcon: Icons.warning_amber,
                        leadingIconColor: Colors.green,
                        sideColor: Colors.green,
                      );
                    }
                  }
                },
                drawBottomBorder: false
              ),

              MascotImage(),
            ],
          ),
        ),
      ),
    );
  }
}
