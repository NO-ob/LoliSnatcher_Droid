import 'package:lolisnatcher/src/data/update_info.dart';

class Constants {
  static const String appName = 'LoliSnatcher';
  //

  static const int defaultItemLimit = 20;

  static const int tagStaleTime = 3 * 24 * 60 * 60 * 1000; // 3 days

  static const int historyLimit = 10000;

  static const String discordURL = 'https://discord.gg/r9E4HDx9dz';

  static const String email = 'no.aisu@protonmail.com';

  static const String defaultBrowserUserAgent =
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36';

  static const String sankakuAppUserAgent = 'SCChannelApp/4.12 (RNAndroid; black)';

  static const String sankakuIdolAppUserAgent = 'SCChannelApp/4.2 (Android; idol)';

  // useful to blur all images during dev to avoid seeing nsfw content, but still see that they are loading, [don't forget to undo before commit]
  static const bool blurImagesDefaultDev = false;

  // TODO don't forget to update on every new release
  static const UpdateInfo updateInfo = UpdateInfo(
    versionName: '2.4.4',
    buildNumber: 4205,
    title: '2.4.4 Hotfix 6',
    isInStore: true,
    isImportant: false,
    storePackage: 'com.noaisu.play.loliSnatcher',
    githubURL: 'https://github.com/NO-ob/LoliSnatcher_Droid/releases/latest',
    changelog: '''
If you encounter any issues or have suggestions, please post them in github issues or in our discord server

Hotfix 6 - 2.4.4+4205 (29-08-25):
- Update dependencies
- Fix for artist: and oc: tags with underscores for booru-on-rails/philomena-based boorus, also added captcha detection for derpibooru
- Fix text layout on the widget for page loading/failed state

-------------------

Hotfix 5 - 2.4.4+4204 (25-08-25):
- Fix r34xxx functions that broke after last update (post url, tag data fetching), fixed r34xxx items favourited before last update appearing as if they are not favourited
- Possible fix for info drawer turning into a grey screen in some conditions when viewing items in favourites/downloads

-------------------

Hotfix 4 - 2.4.4+4203 (20-08-25):
- Added instructions when rule34xxx fails to load results (it now requires user id/api key), also fixed some requests not using the api key
- Possible fix for huge delays when saving files in custom directory
- Fixed current snatch progress indicator in viewer toolbar not updating
- Fix viewer breaking if there are no items to view (i.e. you added a tag from current search to hated)

-------------------

Hotfix 3 - 2.4.4+4202 (28-07-25):
- Fixed gelbooru favourited items possibly saving urls in the wrong format (extra slashes), which caused them to appear as not favourited
- Fixed twibooru and derpibooru multiword tag searching, fixed tag formatting to replace + with _
- Fixed videos not loading on r34us
- Fixed video controls dissapearing when exiting fullscreen video (for real now, I hope)
- Attempt to fix viewed item still being highlighted after leaving the viewer

-------------------

Hotfix 2 - 2.4.4+4201 (10-07-25):

- Attempt to fix random freezing (need more info on this, please report on github/discord with your device info if it still happens to you after this update)
- Added a button to quickly share app logs from settings menu
- Added booru selector to tag preview
- Added double tap to favourite on tag preview thumbnails
- Favourited items can now be refreshed from the info drawer (if booru they are from support this), also added icon and name of the related booru
- Added item refresh support for Idol Sankaku
- Added limited item refresh support when in multibooru mode
- Item refresh will now try to scrape updated image/video links for gelbooru
- Fix broken links for favourited videos from Gelbooru (video-cdn1 -> video-cdn3)
- xyz-based sites - fixed older items using wrong url scheme (404 error)
- Philonema-based sites - fix encoding of search queries, fix tag suggestion parsing, you can use underscore as word divider now
- Sankaku - expired image/video links sometimes returned an image with [Expired link...] text, app now tries to detect them and treats them as a failed request
- Removed commas from formatting of [...with tags] share options
- Fixed video controls dissapearing when exiting fullscreen paused video
- Fixed device sleep lock not restoring correct state after exiting fullscreen video
- Performance improvements
- Fixed wrong changelog being shown on first start in some cases

-------------------

Hotfix 1 - 2.4.4+4200 (24-06-25):

- Fixed build number difference with 2.4.3 which caused downgrade error during install
- Reverted http2 setting
- xyz-based sites - Fixed tag data loading, fixed older images not loading, possibly fixed other variants of this engine not working correctly

-------------------

Release - 2.4.4+199 (23-06-25):

New features:
- Tag preview now has same functionality as main viewer, also added a button to quickly create a new tab from the preview
- Viewer toolbar options can now be individually disabled
- Added a [Performance] settings page, it combines all existing performance-related settings in one place. Includes some improvements to low performance mode
- Broken favourites items can now attempt to refresh their data when user manually retries loading in thumbnail grid/viewer (works only for some boorus, highly experimental)
- Added a tag prefix editor (-, ~, 1#...) to search view, can be accessed by using [Prefix] option when selecting text in input field
- All share menu options now have a separate option which allows to select tags and share them with the url/file


Changes:
- Performance improvements related to thumbnail grid and viewer info drawer (especially when there are a lot of items/tabs loaded)
- All requests now use http2 (there is a setting to disable it in [Network], in case it causes issues)
- Added a dialog to update custom directory path if app could not access the previous one
- Backup path is now validated, will reset if app cannot access it
- Reworked viewer animation, added dismiss animation and haptic feedback when reached dismiss threshold
- Collapse details in viewer info drawer (use [Viewer -> Expand details by default] to change initial state of this block)
- Logging is now always active (it is still kept on-device and not sent anywhere, this change is to simplify user reports process)
- When debug is active - shows a button to quickly access tools from any part of the app
- Cookies from normal requests are now saved nad reused in future requests (previously only cookies from webview requests were saved)
- Added small descriptions to http status errors
- Manual retry of thumbnails/images can now trigger captcha check
- Ask which booru url to use when opening webview from multibooru tab
- Show changelog on first start after each update


Booru changes/fixes:
- Added instructions when Gelbooru gives 401 error
- Gelbooru can now update item data in viewer info drawer
- Fix broken Gelbooru favourites links (image server change - img3->img4, happens during start, may take some time to complete)
- Restores realbooru support (has some limitations due to changed parsing method)
- Added atf captcha detection


Fixes:
- Fixed loading animation still rendering when it was not visible (caused constant redraws and therefore high CPU use and battery drain)
- Fixed some notifications not appearing from the top like they should
- Fix buttons in update dialog overlapping with system ui in some cases
- Fix possible tab data loss when app tries to load tab with wrong booru data
- Fix long comment names overflowing the container


and other small fixes and changes...
''',
  );
}
