import 'dart:io';

import 'package:lolisnatcher/src/data/update_info.dart';

class Constants {
  static const int defaultItemLimit = 20;

  static const Duration tagStaleDuration = Duration(days: 14);

  static const int historyLimit = 10000;

  static const String discordURL = 'https://discord.gg/r9E4HDx9dz';

  static const String githubURL = 'https://github.com/NO-ob/LoliSnatcher_Droid';

  static const String wikiURL = 'https://github.com/NO-ob/LoliSnatcher_Droid/wiki';

  static const String booruSourcesWikiURL = '$wikiURL/Booru-sources';

  static const String backupRestoreWikiURL = '$wikiURL/Data-backups';

  static const String email = 'no.aisu@protonmail.com';

  static const String translationURL = 'https://poeditor.com/join/project/RgscnzeWts';

  static const int poeditorProjectId = 825186;

  static const String poeditorApiKey = 'e2449bca7b8fb820c96b1b643f2b3553'; // read-only key

  // TODO update to newer versions from time to time
  static const String defaultMobileBrowserUserAgent =
      'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36';
  static const String defaultDesktopBrowserUserAgent =
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36';
  static String get defaultBrowserUserAgent => switch (Platform.operatingSystem) {
    'android' => defaultMobileBrowserUserAgent,
    'ios' => defaultMobileBrowserUserAgent,
    _ => defaultDesktopBrowserUserAgent,
  };

  static const String sankakuAppUserAgent = 'SCChannelApp/4.12 (RNAndroid; black)';

  static const String sankakuIdolAppUserAgent = 'SCChannelApp/4.2 (Android; idol)';

  // useful to blur all images during dev to avoid seeing nsfw content, but still see that they are loading, [don't forget to undo before commit]
  static const bool blurImagesDefaultDev = false;

  // TODO don't forget to update on every new release
  static const UpdateInfo updateInfo = UpdateInfo(
    versionName: '2.5.2',
    buildNumber: 5218,
    title: '2.5.2 Hotfix 1',
    isInStore: true,
    isImportant: false,
    storePackage: 'com.noaisu.play.losn',
    githubURL: 'https://github.com/NO-ob/LoliSnatcher_Droid/releases/latest',
    // TODO add separate changelog for store version, where we won't mention any of the boorus
    changelog: '''
If you encounter any issues or have suggestions, please post them on GitHub Issues or on our Discord server.


[WE NEED YOUR HELP]: We are looking for volunteers to help translate the app into other languages. For details, visit our GitHub page or ask on our Discord server.


A minor update that adds a new onboarding screen, adds fullscreen video zooming and fixes some issues.

-------------------

[Known issues]:
- On Gelbooru, images may blink/flicker and/or fail with various error codes (503, 429, 404...), which may be fixed by trying to load the image again. This is probably caused by their aggressive rate limiting rules. As a temporary workaround until they lift the restrictions, set [Interface - Preview quality] to [Thumbnail] and [Boorus and Search - Items fetched per page] to 20 to reduce flicker and the chance of being rate limited
- German translations are incorrect and will be fixed in a future release after a new contributor is able to update them

-------------------

Hotfix 1 - 2.5.2+5219 (?)
- Update dependencies
- Possible fix for main appbar and bottom search bar constantly reappearing when it is not supposed to
- Skip download cooldown if file already exists (#401)
- Keep animating gifs when reduce motion system setting is enabled (#402)
- Favicon caching improvements
- Fix file url parsing for some sites
- Fix possible layout bug in comments when image has broken ratio data

-------------------

Release - 2.5.2+5218 (18.07.2026):

- New onboarding screen
- Fixed thumbnail loading progress not updating correctly
- Loading progress text now updates at smoother intervals
- Enabled zooming in fullscreen video
- Fullscreen video can now be closed by dragging down (similar to YouTube)
- Added a scrollbar label in the tab manager; the text changes depending on the sorting type
- Fixed the main app bar not snapping to full height once it entered the view
- Fixed Booru test not running again if the user changed input fields after the test was completed
- Possible fix for a border appearing over the app when a hardware keyboard is used
- Possible fix for the app restarting after a Bluetooth mouse is connected
- Fixed some layout issues


and other small fixes and changes...
''',
  );
}
