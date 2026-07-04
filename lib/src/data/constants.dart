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
    versionName: '2.5.1',
    buildNumber: 5214,
    title: '2.5.1 - Chinese and German localization, fixes',
    isInStore: true,
    isImportant: false,
    storePackage: 'com.noaisu.play.losn',
    githubURL: 'https://github.com/NO-ob/LoliSnatcher_Droid/releases/latest',
    changelog: '''
If you encounter any issues or have suggestions, please post them in GitHub issues or in our Discord server.


[WE NEED YOUR HELP]: We are looking for volunteers to help us translate the app into other languages. For details, visit our GitHub page or ask in Discord server.


A minor update to fix some issues.

-------------------

[Known issues]:
- on Gelbooru images may blink/flicker and/or fail with various error codes (503, 429, 404...), which may be fixed after retrying to load the image. This is probably caused by them enabling aggressive rate limiting rules, as a temporary workaround until they lift the resctrictions - set [Interface - Preview quality] to [Thumbnail] and [Boorus and Search - Items fetched per page] to 20 to reduce flicker and chance of being rate limited
- German translations are incorrect, will be fixed in the future release after new contributor will be able to update them

-------------------

Hotfix 1 - 2.5.1+5214 (15.06.2026):

- Fixed inkbunny parsing (Thanks to Split50)
- Added a Retry button to currently downloading item to quickly restart it without moving it to the end of the queue, useful if item is stuck for some reason (also stuck download items will now auto retry after 10 seconds of inactivity)
- Added a dialog to quickly delete tabs after enabling duplicates filter in tab manager
- Fixed some boorus not working in multibooru mode due to page number conflict
- Fixed images failing to load on realbooru
- Attempt to fix app name change failing on some devices
- Translate values of cache duration limit setting
- Increase cache size max limit to 50GB
- Fixed scrolling texts in tag dialog and history using wrong color when using light theme
- Fixed animated webp images running animation on preview grid when gif thumbnails are not enabled
- Performance improvements

-------------------

Release - 2.5.1+5212 (28.05.2026):

- Added Chinese (Simplified) and German localizations
- Possible fix of broken screen orientation after leaving fullscreen video
- Adjusted long tap-drag logic on videos, added ability to slowdown and reverse video playback (reverse performance depends on the selected video backend setting)
- Fixed some layout issues
- Fixed auto leave dialog on captcha completion appearing again on new page load after you decided to stay
- Fixed some jpeg images failing to load
- Fixed duplicates and random sorting of tags on r34xxx
- Hydrus OR query handling (Thanks to hekate)
- Improved autodetect logic for some boorus
- Fixed favourites/downloads booru options not appearing after adding first booru config until app is restarted
- Fixed viewer toolbar buttons setting not resetting correctly

-------------------
-------------------

Previous release:

Hotfix 2 - 2.5.0+5210 (09.04.2026):

- Added uploader name in item info drawer for danbooru, gelbooru, sankaku
- Fixed favicons not loading for some sites in booru create/edit dialogs
- Added logic that attempts to close webview automatically if it detects that cloudflare captcha was completed
- Fixed some tags (i.e. ???) breaking the item tags list
- Fixed some settings not applying correctly after leaving the settings page (mostly related to tag filters)
- Added simple confirmation dialog before restoring data from backup to avoid accidental data loss
- Fixed a bunch of small layout issues
- Inkbunny fixes (Thanks to Split50)
- Hydrus fixes (Thanks to hekate)
- Changed build settings to decrease app installer size by ~half (only applies to non-play store builds, please report if you notice any issues with app performance, memory usage or startup time)

-------------------

Hotfix 1 - 2.5.0+5209 (31.03.2026):

- Fixed long tap actions on viewer toolbar buttons

-------------------

Previous release - 2.5.0+5208 (30.03.2026):

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
''',
  );
}
