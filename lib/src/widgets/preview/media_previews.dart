import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/pages/settings/booru_edit_page.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/preview/waterfall_view.dart';

class MediaPreviews extends StatefulWidget {
  const MediaPreviews({Key? key}) : super(key: key);

  @override
  State<MediaPreviews> createState() => _MediaPreviewsState();
}

class _MediaPreviewsState extends State<MediaPreviews> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;

  bool booruListFilled = false, tabListFilled = false;
  late StreamSubscription booruListener, tabListener;

  @override
  void initState() {
    super.initState();

    booruListFilled = settingsHandler.booruList.isNotEmpty;
    booruListener = settingsHandler.booruList.listen((List boorus) {
      if (!booruListFilled) {
        setState(() {
          booruListFilled = boorus.isNotEmpty;
        });
      }
    });
    tabListFilled = searchHandler.list.isNotEmpty;
    tabListener = searchHandler.list.listen((List tabs) {
      if (!tabListFilled) {
        setState(() {
          tabListFilled = tabs.isNotEmpty;
        });
      }
    });
  }

  @override
  void dispose() {
    booruListener.cancel();
    tabListener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print('image previews build $booruListFilled $tabListFilled');

    // no booru configs
    if (!booruListFilled) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const SettingsButton(
              name: 'No Booru Configs Found',
              icon: Icon(null),
            ),
            SettingsButton(
              name: 'Add New Booru',
              icon: const Icon(Icons.settings),
              page: () => BooruEdit(Booru("New", "", "", "", "")),
            ),
            SettingsButton(
              name: 'Help',
              icon: const Icon(Icons.help_center_outlined),
              action: () {
                ServiceHandler.launchURL("https://github.com/NO-ob/LoliSnatcher_Droid/wiki");
              },
              trailingIcon: const Icon(Icons.exit_to_app),
            ),
          ],
        ),
      );
    }

    // temp message while restoring tabs (or for some reason initial tab was not created)
    if (!tabListFilled) {
      return Center(
        child: Column(
          children: [
            const CircularProgressIndicator(),
            Obx(() {
              if (searchHandler.isRestored.value) {
                return const SizedBox();
              } else {
                return const Text('Restoring previous session...');
              }
            }),
          ],
        ),
      );
    }

    // render thumbnails grid
    return const RepaintBoundary(child: WaterfallView());
  }
}
