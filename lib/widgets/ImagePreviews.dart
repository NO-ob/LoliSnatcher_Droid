import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/pages/settings/BooruEditPage.dart';
import 'package:LoliSnatcher/widgets/WaterfallView.dart';
import 'package:LoliSnatcher/ServiceHandler.dart';
import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';

class ImagePreviews extends StatefulWidget {
  const ImagePreviews({Key? key}) : super(key: key);

  @override
  State<ImagePreviews> createState() => _ImagePreviewsState();
}

class _ImagePreviewsState extends State<ImagePreviews> {
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
