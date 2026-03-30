import 'package:lolisnatcher/src/data/update_info.dart';

class Constants {
  static const int defaultItemLimit = 20;

  static const int tagStaleTime = 3 * 24 * 60 * 60 * 1000; // 3 days

  static const int historyLimit = 10000;

  static const String discordURL = 'https://discord.gg/r9E4HDx9dz';

  static const String githubURL = 'https://github.com/NO-ob/LoliSnatcher_Droid';

  static const String wikiURL = 'https://github.com/NO-ob/LoliSnatcher_Droid/wiki';

  static const String email = 'no.aisu@protonmail.com';

  static const String translationURL = 'https://poeditor.com/join/project/RgscnzeWts';

  static const int poeditorProjectId = 825186;

  static const String poeditorApiKey = 'e2449bca7b8fb820c96b1b643f2b3553'; // read-only key

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
    buildNumber: 5208,
    title: '2.5.0 - Localization, fonts, optimization, pinned tags and more',
    isInStore: true,
    isImportant: false,
    storePackage: 'com.noaisu.play.loliSnatcher',
    githubURL: 'https://github.com/NO-ob/LoliSnatcher_Droid/releases/latest',
    changelog: '''
If you encounter any issues or have suggestions, please post them in GitHub issues or in our Discord server.


[WE NEED YOUR HELP]: We are looking for volunteers to help us translate the app into other languages. For details, visit our GitHub page or Discord server.

-------------------

Release - 2.5.0+5208:

Main in this update:
- Localization (Russian, Turkish, Japanese)
- Pinned tags
- Custom fonts
- Reverse image search
- Performance optimizations


New features:
- Localization: [Settings -> Language], app is now translated into Russian, Turkish and Japanese, more languages will be added in future updates
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
- Added "sort:reverse", OR(~) and wildcard(*) operators to local db queries
- [site:...] filter in local db search will now suggest site urls from available booru configs
- Redesigned comments page and added buttons to quickly go to next/previous comment


Changes:
- Reverted to old rendering engine (previous version used the new one, but it caused issues on older devices). [NOTE]: In the future we may be forced to switch to a new engine
- [Hated] tag filters renamed to [Hidden] and [Loved] tag filters renamed to [Marked] throughout the app
- Reworked cache cleanup
- Image viewer performance improvements when switching between items
- Added tag counts in item info drawer and tag suggestions
- Reworked comments and translation notes parsing and rendering
- Improved sources parsing in item info drawer
- Expanded kaomoji (text emojis) presentation
- Replaced default error widget with a custom one to prevent layout breakage on app exceptions
- Improved booru add/edit page flow
- Added a button in tag details which opens a dialog with a list of related tabs (also explains what white/yellow/blue dots on [Add new tab] button mean)
- Enabled predictive back gesture support on supported devices, can be toggled in [Settings -> Interface -> Predictive back gesture]
- Tag suggestion requests will now route to the correct booru based on booru index prefix in the query when using Multibooru
- Merged meta tags suggestions on Multibooru
- Media cache is now enabled by default (only applies to new users)
- Long tap to fast forward on videos is now enabled by default, related setting is removed
- Increased blur on [Hidden] items
- Changed thumbnails to not appear as failed if at least one type of quality loaded successfully (applies only when Sample quality is used)
- Search easter eggs are now limited to 5 times per app lifetime
- Improved logic of button which removes tag from query (detects ~ and N# operators)
- Changed wording on button which adds tag as an exclusion to query
- Added Exclude button to tag suggestion long tap dialog
- Added search to dropdown lists


Booru changes/fixes:
- Multibooru: combined meta tags, prefix-based tag suggestion routing per handler
- xyz-based boorus: fixed item details not loading in some cases
- e621: fixed parsing error when item does not have sample url
- danbooru: fixed loading images of lower quality after opening item info drawer, fixed tag suggestions applying wrong values in some cases, 
- paheal: fixed thumbnail urls
- r34us: fixed parsing, fixed thumbnails/images not loading


Fixes:
- Possible fix for rare thumbnail rendering artifacts
- Possible fix for currently viewed item thumbnail border staying visible after closing the viewer
- Fixed performance issues when there are thousands of tag filters
- Fixed some cases when database operations were taking too long
- Fixed Multibooru tag splitting on special characters (e.g. [1#tag 2#score:>20] was turning into [1#tag >20])
- Fixed exception when deleting duplicate tag from tag search view
- Removed [Something went wrong: authInProgress] message when starting the app with App lock enabled
- Fixed [Add new tab dialog] applying custom page number to tab when it was not enabled
- Fixed [Add new tab dialog] not applying default query when dialog is opened
- Fixed broken state after clearing search query when editing a tag in the query
- Fixed not being able to load next page if there are not enough items on screen to start scrolling
- Fixed rare case when local database could not load items with tags containing numbers
- Fixed short freezes during opening of item info drawer if there is a lot of tabs/tags


and other small fixes and changes...

-------------------

Known issues:
- Rendering may break after changing screen orientation (i.e. by opening video in fullscreen), can be fixed by changing screen orientation back and forth/reentering video fullscreen
''',
  );
}
