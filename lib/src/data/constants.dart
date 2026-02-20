import 'package:lolisnatcher/src/data/update_info.dart';

class Constants {
  static const int defaultItemLimit = 20;

  static const int tagStaleTime = 3 * 24 * 60 * 60 * 1000; // 3 days

  static const int historyLimit = 10000;

  static const String discordURL = 'https://discord.gg/r9E4HDx9dz';

  static const String githubURL = 'https://github.com/NO-ob/LoliSnatcher_Droid';

  static const String wikiURL = 'https://github.com/NO-ob/LoliSnatcher_Droid/wiki';

  static const String email = 'no.aisu@protonmail.com';

  // TODO update to newer versions from time to time
  static const String defaultBrowserUserAgent =
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36';

  static const String sankakuAppUserAgent = 'SCChannelApp/4.12 (RNAndroid; black)';

  static const String sankakuIdolAppUserAgent = 'SCChannelApp/4.2 (Android; idol)';

  // useful to blur all images during dev to avoid seeing nsfw content, but still see that they are loading, [don't forget to undo before commit]
  static const bool blurImagesDefaultDev = false;

  // TODO don't forget to update on every new release
  static const UpdateInfo updateInfo = UpdateInfo(
    versionName: '2.5.0',
    buildNumber: 5207,
    title: '2.5.0 - Localization, fonts, optimization, pinned tags and more',
    isInStore: true,
    isImportant: false,
    storePackage: 'com.noaisu.play.loliSnatcher',
    githubURL: 'https://github.com/NO-ob/LoliSnatcher_Droid/releases/latest',
    changelog: '''
If you encounter any issues or have suggestions, please post them in github issues or in our discord server

-------------------

Release - 2.5.0+5207 (??-??-26):

New features:
- 

Booru changes/fixes:
- 

''',
  );
}
