import 'package:LoliSnatcher/widgets/SettingsWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:LoliSnatcher/SearchGlobals.dart';
import 'package:LoliSnatcher/SettingsHandler.dart';
import 'package:LoliSnatcher/libBooru/Booru.dart';
import 'package:LoliSnatcher/pages/settings/BooruEditPage.dart';
import 'package:LoliSnatcher/widgets/WaterfallView.dart';

class ImagePreviews extends StatefulWidget {
  ImagePreviews();

  @override
  _ImagePreviewsState createState() => _ImagePreviewsState();
}

class _ImagePreviewsState extends State<ImagePreviews> {
  final SettingsHandler settingsHandler = Get.find();
  final SearchHandler searchHandler = Get.find();

  @override
  Widget build(BuildContext context) {

    // no booru configs
    if (settingsHandler.booruList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text("No Booru Configs Found"),
            SettingsButton(
              name: 'Open Settings',
              icon: Icon(Icons.settings),
              page: () => BooruEdit(Booru("New","","","",""))
            ),
          ]
        )
      );
    }

    // temp message while restoring tabs (or for some reason initial tab was not created)
    if(searchHandler.list.isEmpty && !searchHandler.isRestored.value) {
      return Center(
        child: Column(
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Get.theme.accentColor)
            ),
            Text('Restoring previous session...')
          ]
        )
      );
    }

    if(searchHandler.list.isEmpty) {
      return Center(
        child: Text('No Tabs???')
      );
    }

    // render thumbnails grid
    return Obx(() => SafeArea(
      child: WaterfallView(
        searchHandler.currentTab,
        searchHandler.index.value
      )
    ));

    }
}
