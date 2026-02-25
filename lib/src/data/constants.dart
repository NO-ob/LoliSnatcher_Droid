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
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36';

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
If you encounter any issues or have suggestions, please post them in GitHub issues or in our Discord server.


[WE NEED YOUR HELP]: We are looking for volunteers to help us translate the app into other languages. For details, visit our GitHub page or Discord server.

-------------------

Release - 2.5.0+5207:

Main in this update:
- Russian localization
- Pinned tags
- Custom fonts
- Reverse image search


New features:
- Localization: app is now translated into Russian, more languages will be added in future updates, can be changed in [Settings -> Language]
- Custom fonts: [Settings -> Themes -> Font]
- Tags can now be pinned in the tag search view with custom labels for quick access
- All input fields where you can enter tags now open a full tag search view where you can quickly look for suggestions
- Added a Reverse image search button in viewer toolbar (Includes Google, Yandex, SauceNAO, ImgOps; Feel free to request support for more engines)
- Added a [Popular] block in tag search view, currently shows tags with most entries on some boorus
- Added a button in tag dialog to view tag preview history for the current tab, you can partially restore it from there if you closed the preview stack by switching tabs
- Added a button to apply a history entry to the current tag search
- Added a [Marked] items filter
- Added a setting to change app name in system launcher [Settings -> Privacy -> App display name]
- Long images (taller than 4K pixels) are now automatically split into tiles for smoother viewing + a new setting which controls preloading image vertical pixels limit (default: 16K pixels; above which loading is blocked to prevent crashes; absurdly long images could still render incorrectly or cause crashes; only works when Media cache is enabled)
- Added buttons to flip through pages in viewer while item info drawer is open
- Small improvements to Downloads drawer
- [site:...] filter in local search will now suggest site urls from available booru configs
- Added buttons to quickly go to next/previous comment


Changes:
- [Hated] tags renamed to [Hidden], [Loved] renamed to [Marked] throughout the app
- Reworked cache cleanup
- Improved app startup time
- Image viewer performance improvements when switching between items
- Added tag counts in item info drawer and tag suggestions
- Reworked comments and translation notes parsing
- Expanded kaomoji (text emojis) presentation
- Replaced default error widget with a custom one to prevent layout breakage on app exceptions
- Improved booru add/edit page flow
- Enabled predictive back gesture support on supported devices, can be toggled in [Settings -> Interface -> Predictive back gesture]
- Routes tag suggestion requests to the correct booru when a booru index prefix is included in the search query while using Multibooru
- Merged meta tags on Multibooru
- Media cache is now enabled by default (only applies to new users)
- Long tap to fast forward on videos is now enabled by default, related setting is removed
- Improved sources parsing in item info drawer


Booru changes/fixes:
- Multibooru: combined meta tags, prefix-based tag suggestion routing per handler
- xyz-based boorus: fixed item loading


Fixes:
- Possible fix for rare thumbnail rendering artifacts
- Possible fix for currently viewed item thumbnail border not disabling after closing the viewer
- Fixed some cases when database operations were taking too long
- Fixed Multibooru tag splitting on special characters (e.g. [1#tag 2#score:>20] was turning into [1#tag >20])
- Fixed exception when deleting duplicate tag from tag search view
- Removed [Something went wrong: authInProgress] message when starting the app with App lock enabled


and other small fixes and changes...
''',
  );
}
