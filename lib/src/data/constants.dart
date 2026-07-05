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
    buildNumber: 5216,
    title: '2.5.2 - New onboarding and small fixes',
    isInStore: true,
    isImportant: false,
    storePackage: 'com.noaisu.play.losn',
    githubURL: 'https://github.com/NO-ob/LoliSnatcher_Droid/releases/latest',
    changelog: '''
If you encounter any issues or have suggestions, please post them in GitHub issues or in our Discord server.


[WE NEED YOUR HELP]: We are looking for volunteers to help us translate the app into other languages. For details, visit our GitHub page or ask in Discord server.


A minor update to add new onboarding screen and fix some issues.

-------------------

[Known issues]:
- on Gelbooru images may blink/flicker and/or fail with various error codes (503, 429, 404...), which may be fixed after retrying to load the image. This is probably caused by them enabling aggressive rate limiting rules, as a temporary workaround until they lift the resctrictions - set [Interface - Preview quality] to [Thumbnail] and [Boorus and Search - Items fetched per page] to 20 to reduce flicker and chance of being rate limited
- German translations are incorrect, will be fixed in the future release after new contributor will be able to update them

-------------------

Release - 2.5.2+5216 (xx.07.2026):

- New onboarding screen
- Fixed thumbnail loading progress not updating correctly
- Loading progress text now updates smooother
- Enabled zoom in fullscreen video
- Fullscreen video can now be closed by dragging down
- Added scrollbar label in tab manager, text changes depending on sorting type
- Fixed main app bar not snapping to full height once it entered the view
- Fixed booru test not running again if user changed input fields after test was completed
- Updated sankaku post url format
- Possible fix for border appearing over the app when hardware keyboard is used (#392)
- Possible fix for app restarting afte bluetooth mouse is connected
- Fixed some layout issues


and other small fixes and changes...
''',
  );
}
