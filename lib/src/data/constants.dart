class Constants {
  static const String appName = 'LoliSnatcher';

  // TODO don't forget to update on every new release
  static const String appVersion = '2.4.3';
  static const int appBuildNumber = 195;
  //

  static const int defaultItemLimit = 20;

  static const int tagStaleTime = 3 * 24 * 60 * 60 * 1000; // 3 days

  static const int historyLimit = 10000;

  static const String discordURL = 'https://discord.gg/r9E4HDx9dz';

  static const String email = 'no.aisu@protonmail.com';

  static const String defaultBrowserUserAgent =
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36';

  static const String sankakuAppUserAgent = 'SCChannelApp/4.11 (RNAndroid; black)';

  // useful to blur all images during dev to avoid seeing nsfw content, but still see that they are loading, [don't forget to undo before commit]
  static const bool blurImagesDefaultDev = false;
}
