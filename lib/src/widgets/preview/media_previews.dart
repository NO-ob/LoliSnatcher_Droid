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

  final ValueNotifier<bool> booruListFilled = ValueNotifier(false), tabListFilled = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    booruListFilled.value = settingsHandler.booruList.isNotEmpty;
    settingsHandler.booruList.addListener(booruListener);

    tabListFilled.value = searchHandler.tabs.isNotEmpty;
    searchHandler.tabs.addListener(tabListener);
  }

  void booruListener() {
    if (!booruListFilled.value) {
      booruListFilled.value = settingsHandler.booruList.isNotEmpty;
    }
  }

  void tabListener() {
    if (!tabListFilled.value) {
      tabListFilled.value = searchHandler.tabs.isNotEmpty;
    }
  }

  @override
  void dispose() {
    settingsHandler.booruList.removeListener(booruListener);
    searchHandler.tabs.removeListener(tabListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print('image previews build $booruListFilled $tabListFilled');

    return ValueListenableBuilder(
      valueListenable: booruListFilled,
      builder: (_, booruListFilled, _) =>
          // no booru configs
          !booruListFilled
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SettingsButton(
                    name: context.loc.mediaPreviews.noBooruConfigsFound,
                    icon: const Icon(null),
                  ),
                  SettingsButton(
                    name: context.loc.mediaPreviews.addNewBooru,
                    icon: const Icon(Icons.settings),
                    page: () => BooruEdit(Booru('New', null, '', '', '')),
                  ),
                  SettingsButton(
                    name: context.loc.mediaPreviews.help,
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
                    name: context.loc.mediaPreviews.settings,
                    icon: const Icon(Icons.settings),
                    page: () => const SettingsPage(),
                  ),
                ],
              ),
            )
          : ValueListenableBuilder(
              valueListenable: tabListFilled,
              builder: (_, tabListFilled, _) =>
                  // temp message while restoring tabs (or for some reason initial tab was not created)
                  !tabListFilled
                  ? Center(
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
                            child: Text(context.loc.mediaPreviews.restoringPreviousSession),
                          ),
                        ],
                      ),
                      // render thumbnails grid
                    )
                  : const WaterfallView(),
            ),
    );
  }
}
