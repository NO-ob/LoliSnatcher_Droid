import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher_string.dart';

import 'package:lolisnatcher/src/data/booru.dart';
import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/pages/settings/booru_edit_page.dart';
import 'package:lolisnatcher/src/pages/settings_page.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';
import 'package:lolisnatcher/src/widgets/preview/waterfall_view.dart';

class MediaPreviews extends StatefulWidget {
  const MediaPreviews({super.key});

  @override
  State<MediaPreviews> createState() => _MediaPreviewsState();
}

class _MediaPreviewsState extends State<MediaPreviews> {
  final SettingsHandler settingsHandler = SettingsHandler.instance;
  final SearchHandler searchHandler = SearchHandler.instance;

  bool booruListFilled = false, tabListFilled = false;

  @override
  void initState() {
    super.initState();

    booruListFilled = settingsHandler.booruList.isNotEmpty;
    settingsHandler.booruList.addListener(booruListener);

    tabListFilled = searchHandler.list.isNotEmpty;
    searchHandler.list.addListener(tabListener);
  }

  void booruListener() {
    if (!booruListFilled) {
      setState(() {
        booruListFilled = settingsHandler.booruList.isNotEmpty;
      });
    }
  }

  void tabListener() {
    if (!tabListFilled) {
      setState(() {
        tabListFilled = searchHandler.list.isNotEmpty;
      });
    }
  }

  @override
  void dispose() {
    settingsHandler.booruList.removeListener(booruListener);
    searchHandler.list.removeListener(tabListener);
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
          children: [
            const SettingsButton(
              name: 'No Booru Configs Found',
              icon: Icon(null),
            ),
            SettingsButton(
              name: 'Add new Booru',
              icon: const Icon(Icons.settings),
              page: () => BooruEdit(Booru('New', null, '', '', '')),
            ),
            SettingsButton(
              name: 'Help',
              icon: const Icon(Icons.help_center_outlined),
              action: () {
                launchUrlString(
                  'https://github.com/NO-ob/LoliSnatcher_Droid/wiki',
                  mode: LaunchMode.externalApplication,
                );
              },
              trailingIcon: const Icon(Icons.exit_to_app),
            ),
            SettingsButton(
              name: 'Settings',
              icon: const Icon(Icons.settings),
              page: () => const SettingsPage(),
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
            ValueListenableBuilder(
              valueListenable: searchHandler.isRestored,
              builder: (context, isRestored, child) {
                if (searchHandler.isRestored.value) {
                  return const SizedBox.shrink();
                }

                return child!;
              },
              child: const Text('Restoring previous session...'),
            ),
          ],
        ),
      );
    }

    // render thumbnails grid
    return const WaterfallView();
  }
}
