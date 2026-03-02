///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEnUs = Translations; // ignore: unused_element

class Translations with BaseTranslations<AppLocale, Translations> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final loc = Translations.of(context);
  static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  /// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
  Translations({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.enUs,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en-US>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final Translations _root = this; // ignore: unused_field

  Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

  // Translations

  /// en-US: 'en-US'
  String get locale => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'en-US';

  /// en-US: 'English'
  String get localeName => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'English';

  /// en-US: 'LoliSnatcher'
  String get appName => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher';

  /// en-US: 'Error'
  String get error => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Error';

  /// en-US: 'Error!'
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'Error!';

  /// en-US: 'Success'
  String get success => TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Success';

  /// en-US: 'Success!'
  String get successExclamation => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? 'Success!';

  /// en-US: 'Cancel'
  String get cancel => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Cancel';

  /// en-US: 'Return'
  String get kReturn => TranslationOverrides.string(_root.$meta, 'kReturn', {}) ?? 'Return';

  /// en-US: 'Later'
  String get later => TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Later';

  /// en-US: 'Close'
  String get close => TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Close';

  /// en-US: 'OK'
  String get ok => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'OK';

  /// en-US: 'Yes'
  String get yes => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Yes';

  /// en-US: 'No'
  String get no => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'No';

  /// en-US: 'Please wait…'
  String get pleaseWait => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Please wait…';

  /// en-US: 'Show'
  String get show => TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Show';

  /// en-US: 'Hide'
  String get hide => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Hide';

  /// en-US: 'Enable'
  String get enable => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'Enable';

  /// en-US: 'Disable'
  String get disable => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Disable';

  /// en-US: 'Add'
  String get add => TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Add';

  /// en-US: 'Edit'
  String get edit => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? 'Edit';

  /// en-US: 'Remove'
  String get remove => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? 'Remove';

  /// en-US: 'Save'
  String get save => TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Save';

  /// en-US: 'Delete'
  String get delete => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? 'Delete';

  /// en-US: 'Confirm'
  String get confirm => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? 'Confirm';

  /// en-US: 'Retry'
  String get retry => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? 'Retry';

  /// en-US: 'Clear'
  String get clear => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? 'Clear';

  /// en-US: 'Copy'
  String get copy => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Copy';

  /// en-US: 'Copied'
  String get copied => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Copied';

  /// en-US: 'Copied to clipboard'
  String get copiedToClipboard => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? 'Copied to clipboard';

  /// en-US: 'Nothing found'
  String get nothingFound => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? 'Nothing found';

  /// en-US: 'Paste'
  String get paste => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Paste';

  /// en-US: 'Copy error'
  String get copyErrorText => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Copy error';

  /// en-US: 'Booru'
  String get booru => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru';

  /// en-US: 'Go to settings'
  String get goToSettings => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'Go to settings';

  /// en-US: 'This may take some time…'
  String get thisMayTakeSomeTime => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'This may take some time…';

  /// en-US: 'Exit the app?'
  String get exitTheAppQuestion => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? 'Exit the app?';

  /// en-US: 'Close the app'
  String get closeTheApp => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Close the app';

  /// en-US: 'Invalid URL!'
  String get invalidUrl => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'Invalid URL!';

  /// en-US: 'Clipboard is empty!'
  String get clipboardIsEmpty => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'Clipboard is empty!';

  /// en-US: 'Failed to open link'
  String get failedToOpenLink => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'Failed to open link';

  /// en-US: 'API Key'
  String get apiKey => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'API Key';

  /// en-US: 'User ID'
  String get userId => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'User ID';

  /// en-US: 'Login'
  String get login => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Login';

  /// en-US: 'Password'
  String get password => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Password';

  /// en-US: 'Pause'
  String get pause => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Pause';

  /// en-US: 'Resume'
  String get resume => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Resume';

  /// en-US: 'Discord'
  String get discord => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord';

  /// en-US: 'Visit our Discord server'
  String get visitOurDiscord => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Visit our Discord server';

  /// en-US: 'Item'
  String get item => TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Item';

  /// en-US: 'Select'
  String get select => TranslationOverrides.string(_root.$meta, 'select', {}) ?? 'Select';

  /// en-US: 'Select all'
  String get selectAll => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Select all';

  /// en-US: 'Reset'
  String get reset => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'Reset';

  /// en-US: 'Open'
  String get open => TranslationOverrides.string(_root.$meta, 'open', {}) ?? 'Open';

  /// en-US: 'Open in new tab'
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? 'Open in new tab';

  /// en-US: 'Move'
  String get move => TranslationOverrides.string(_root.$meta, 'move', {}) ?? 'Move';

  /// en-US: 'Shuffle'
  String get shuffle => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? 'Shuffle';

  /// en-US: 'Sort'
  String get sort => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? 'Sort';

  /// en-US: 'Go'
  String get go => TranslationOverrides.string(_root.$meta, 'go', {}) ?? 'Go';

  /// en-US: 'Search'
  String get search => TranslationOverrides.string(_root.$meta, 'search', {}) ?? 'Search';

  /// en-US: 'Filter'
  String get filter => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? 'Filter';

  /// en-US: 'Or (~)'
  String get or => TranslationOverrides.string(_root.$meta, 'or', {}) ?? 'Or (~)';

  /// en-US: 'Page'
  String get page => TranslationOverrides.string(_root.$meta, 'page', {}) ?? 'Page';

  /// en-US: 'Page #'
  String get pageNumber => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? 'Page #';

  /// en-US: 'Tags'
  String get tags => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'Tags';

  /// en-US: 'Type'
  String get type => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'Type';

  /// en-US: 'Name'
  String get name => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Name';

  /// en-US: 'Address'
  String get address => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'Address';

  /// en-US: 'Username'
  String get username => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'Username';

  /// en-US: 'Favourites'
  String get favourites => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'Favourites';

  /// en-US: 'Downloads'
  String get downloads => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'Downloads';

  late final TranslationsValidationErrorsEnUs validationErrors = TranslationsValidationErrorsEnUs.internal(_root);
  late final TranslationsInitEnUs init = TranslationsInitEnUs.internal(_root);
  late final TranslationsPermissionsEnUs permissions = TranslationsPermissionsEnUs.internal(_root);
  late final TranslationsAuthenticationEnUs authentication = TranslationsAuthenticationEnUs.internal(_root);
  late final TranslationsSearchHandlerEnUs searchHandler = TranslationsSearchHandlerEnUs.internal(_root);
  late final TranslationsSnatcherEnUs snatcher = TranslationsSnatcherEnUs.internal(_root);
  late final TranslationsMultibooruEnUs multibooru = TranslationsMultibooruEnUs.internal(_root);
  late final TranslationsHydrusEnUs hydrus = TranslationsHydrusEnUs.internal(_root);
  late final TranslationsTabsEnUs tabs = TranslationsTabsEnUs.internal(_root);
  late final TranslationsHistoryEnUs history = TranslationsHistoryEnUs.internal(_root);
  late final TranslationsWebviewEnUs webview = TranslationsWebviewEnUs.internal(_root);
  late final TranslationsSettingsEnUs settings = TranslationsSettingsEnUs.internal(_root);
  late final TranslationsCommentsEnUs comments = TranslationsCommentsEnUs.internal(_root);
  late final TranslationsPageChangerEnUs pageChanger = TranslationsPageChangerEnUs.internal(_root);
  late final TranslationsTagsFiltersDialogsEnUs tagsFiltersDialogs = TranslationsTagsFiltersDialogsEnUs.internal(_root);
  late final TranslationsTagsManagerEnUs tagsManager = TranslationsTagsManagerEnUs.internal(_root);
  late final TranslationsLockscreenEnUs lockscreen = TranslationsLockscreenEnUs.internal(_root);
  late final TranslationsLoliSyncEnUs loliSync = TranslationsLoliSyncEnUs.internal(_root);
  late final TranslationsImageSearchEnUs imageSearch = TranslationsImageSearchEnUs.internal(_root);
  late final TranslationsTagViewEnUs tagView = TranslationsTagViewEnUs.internal(_root);
  late final TranslationsPinnedTagsEnUs pinnedTags = TranslationsPinnedTagsEnUs.internal(_root);
  late final TranslationsSearchBarEnUs searchBar = TranslationsSearchBarEnUs.internal(_root);
  late final TranslationsMobileHomeEnUs mobileHome = TranslationsMobileHomeEnUs.internal(_root);
  late final TranslationsDesktopHomeEnUs desktopHome = TranslationsDesktopHomeEnUs.internal(_root);
  late final TranslationsGalleryViewEnUs galleryView = TranslationsGalleryViewEnUs.internal(_root);
  late final TranslationsMediaPreviewsEnUs mediaPreviews = TranslationsMediaPreviewsEnUs.internal(_root);
  late final TranslationsViewerEnUs viewer = TranslationsViewerEnUs.internal(_root);
  late final TranslationsCommonEnUs common = TranslationsCommonEnUs.internal(_root);
  late final TranslationsGalleryEnUs gallery = TranslationsGalleryEnUs.internal(_root);
  late final TranslationsGalleryButtonsEnUs galleryButtons = TranslationsGalleryButtonsEnUs.internal(_root);
  late final TranslationsMediaEnUs media = TranslationsMediaEnUs.internal(_root);
  late final TranslationsImageStatsEnUs imageStats = TranslationsImageStatsEnUs.internal(_root);
  late final TranslationsPreviewEnUs preview = TranslationsPreviewEnUs.internal(_root);
  late final TranslationsTagTypeEnUs tagType = TranslationsTagTypeEnUs.internal(_root);
}

// Path: validationErrors
class TranslationsValidationErrorsEnUs {
  TranslationsValidationErrorsEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Please enter a value'
  String get required => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Please enter a value';

  /// en-US: 'Please enter a valid value'
  String get invalid => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Please enter a valid value';

  /// en-US: 'Please enter a number'
  String get invalidNumber => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? 'Please enter a number';

  /// en-US: 'Please enter a valid numeric value'
  String get invalidNumericValue =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? 'Please enter a valid numeric value';

  /// en-US: 'Please enter a value bigger than ${min: double}'
  String tooSmall({required double min}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Please enter a value bigger than ${min}';

  /// en-US: 'Please enter a value smaller than ${max: double}'
  String tooBig({required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Please enter a value smaller than ${max}';

  /// en-US: 'Please enter a value between ${min: double} and ${max: double}'
  String rangeError({required double min, required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ??
      'Please enter a value between ${min} and ${max}';

  /// en-US: 'Please enter a value equal to or greater than 0'
  String get greaterThanOrEqualZero =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? 'Please enter a value equal to or greater than 0';

  /// en-US: 'Please enter a value less than 4'
  String get lessThan4 => TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? 'Please enter a value less than 4';

  /// en-US: 'Please enter a value bigger than 100'
  String get biggerThan100 =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? 'Please enter a value bigger than 100';

  /// en-US: 'Using more than 4 columns can affect performance'
  String get moreThan4ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ?? 'Using more than 4 columns can affect performance';

  /// en-US: 'Using more than 8 columns can affect performance'
  String get moreThan8ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ?? 'Using more than 8 columns can affect performance';
}

// Path: init
class TranslationsInitEnUs {
  TranslationsInitEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Initialization error!'
  String get initError => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Initialization error!';

  /// en-US: 'Setting up proxy…'
  String get settingUpProxy => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Setting up proxy…';

  /// en-US: 'Loading database…'
  String get loadingDatabase => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Loading database…';

  /// en-US: 'Loading boorus…'
  String get loadingBoorus => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Loading boorus…';

  /// en-US: 'Loading tags…'
  String get loadingTags => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Loading tags…';

  /// en-US: 'Restoring tabs…'
  String get restoringTabs => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Restoring tabs…';
}

// Path: permissions
class TranslationsPermissionsEnUs {
  TranslationsPermissionsEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'No access to custom storage directory'
  String get noAccessToCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ?? 'No access to custom storage directory';

  /// en-US: 'Please set storage directory again to grant the app access to it'
  String get pleaseSetStorageDirectoryAgain =>
      TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ??
      'Please set storage directory again to grant the app access to it';

  /// en-US: 'Current path: ${path: String}'
  String currentPath({required String path}) =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? 'Current path: ${path}';

  /// en-US: 'Set directory'
  String get setDirectory => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? 'Set directory';

  /// en-US: 'Not available on this platform'
  String get currentlyNotAvailableForThisPlatform =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ?? 'Not available on this platform';

  /// en-US: 'Reset directory'
  String get resetDirectory => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? 'Reset directory';

  /// en-US: 'Files will save to default directory after reset'
  String get afterResetFilesWillBeSavedToDefaultDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ??
      'Files will save to default directory after reset';
}

// Path: authentication
class TranslationsAuthenticationEnUs {
  TranslationsAuthenticationEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Please authenticate to use the app'
  String get pleaseAuthenticateToUseTheApp =>
      TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ?? 'Please authenticate to use the app';

  /// en-US: 'No biometric hardware available'
  String get noBiometricHardwareAvailable =>
      TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? 'No biometric hardware available';

  /// en-US: 'Temporary lockout'
  String get temporaryLockout => TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? 'Temporary lockout';

  /// en-US: 'Something went wrong during authentication: ${error: String}'
  String somethingWentWrong({required String error}) =>
      TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ??
      'Something went wrong during authentication: ${error}';
}

// Path: searchHandler
class TranslationsSearchHandlerEnUs {
  TranslationsSearchHandlerEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Removed last tab'
  String get removedLastTab => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? 'Removed last tab';

  /// en-US: 'Resetting to default tags'
  String get resettingSearchToDefaultTags =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? 'Resetting to default tags';

  /// en-US: 'UOOOOOOOHHH'
  String get uoh => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'UOOOOOOOHHH';

  /// en-US: 'Ratings changed'
  String get ratingsChanged => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? 'Ratings changed';

  /// en-US: 'On ${booruType: String} [rating:safe] is now replaced with [rating:general] and [rating:sensitive]'
  String ratingsChangedMessage({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
      'On ${booruType} [rating:safe] is now replaced with [rating:general] and [rating:sensitive]';

  /// en-US: 'Rating was auto-fixed. Use correct rating in future searches'
  String get appFixedRatingAutomatically =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ??
      'Rating was auto-fixed. Use correct rating in future searches';

  /// en-US: 'Tabs restored'
  String get tabsRestored => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? 'Tabs restored';

  /// en-US: '(one) {Restored ${count} tab from previous session} (few) {Restored ${count} tabs from previous session} (many) {Restored ${count} tabs from previous session} (other) {Restored ${count} tabs from previous session}'
  String restoredTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'Restored ${count} tab from previous session',
        few: 'Restored ${count} tabs from previous session',
        many: 'Restored ${count} tabs from previous session',
        other: 'Restored ${count} tabs from previous session',
      );

  /// en-US: 'Some restored tabs had unknown boorus or broken characters.'
  String get someRestoredTabsHadIssues =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ??
      'Some restored tabs had unknown boorus or broken characters.';

  /// en-US: 'They were set to default or ignored.'
  String get theyWereSetToDefaultOrIgnored =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ?? 'They were set to default or ignored.';

  /// en-US: 'List of broken tabs:'
  String get listOfBrokenTabs => TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? 'List of broken tabs:';

  /// en-US: 'Tabs merged'
  String get tabsMerged => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? 'Tabs merged';

  /// en-US: '(one) {Added ${count} new tab} (few) {Added ${count} new tabs} (many) {Added ${count} new tabs} (other) {Added ${count} new tabs}'
  String addedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'Added ${count} new tab',
        few: 'Added ${count} new tabs',
        many: 'Added ${count} new tabs',
        other: 'Added ${count} new tabs',
      );

  /// en-US: 'Tabs replaced'
  String get tabsReplaced => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? 'Tabs replaced';

  /// en-US: '(one) {Received ${count} tab} (few) {Received ${count} tabs} (many) {Received ${count} tabs} (other) {Received ${count} tabs}'
  String receivedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'Received ${count} tab',
        few: 'Received ${count} tabs',
        many: 'Received ${count} tabs',
        other: 'Received ${count} tabs',
      );
}

// Path: snatcher
class TranslationsSnatcherEnUs {
  TranslationsSnatcherEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Snatcher'
  String get title => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Snatcher';

  /// en-US: 'Snatching history'
  String get snatchingHistory => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'Snatching history';

  /// en-US: 'Enter tags'
  String get enterTags => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'Enter tags';

  /// en-US: 'Amount'
  String get amount => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? 'Amount';

  /// en-US: 'Amount of Files to Snatch'
  String get amountOfFilesToSnatch => TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? 'Amount of Files to Snatch';

  /// en-US: 'Delay (in ms)'
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? 'Delay (in ms)';

  /// en-US: 'Delay between each download'
  String get delayBetweenEachDownload =>
      TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? 'Delay between each download';

  /// en-US: 'Snatch files'
  String get snatchFiles => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? 'Snatch files';

  /// en-US: 'Item was already snatched before'
  String get itemWasAlreadySnatched =>
      TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? 'Item was already snatched before';

  /// en-US: 'Failed to snatch the item'
  String get failedToSnatchItem => TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? 'Failed to snatch the item';

  /// en-US: 'Item was cancelled'
  String get itemWasCancelled => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? 'Item was cancelled';

  /// en-US: 'Starting next queue item…'
  String get startingNextQueueItem => TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? 'Starting next queue item…';

  /// en-US: 'Items snatched'
  String get itemsSnatched => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? 'Items snatched';

  /// en-US: '(one) {Snatched: ${count} item} (few) {Snatched: ${count} items} (many) {Snatched: ${count} items} (other) {Snatched: ${count} items}'
  String snatchedCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'Snatched: ${count} item',
        few: 'Snatched: ${count} items',
        many: 'Snatched: ${count} items',
        other: 'Snatched: ${count} items',
      );

  /// en-US: '(one) {${count} file was already snatched} (few) {${count} files were already snatched} (many) {${count} files were already snatched} (other) {${count} files were already snatched}'
  String filesAlreadySnatched({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '${count} file was already snatched',
        few: '${count} files were already snatched',
        many: '${count} files were already snatched',
        other: '${count} files were already snatched',
      );

  /// en-US: '(one) {Failed to snatch ${count} file} (few) {Failed to snatch ${count} files} (many) {Failed to snatch ${count} files} (other) {Failed to snatch ${count} files}'
  String failedToSnatchFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'Failed to snatch ${count} file',
        few: 'Failed to snatch ${count} files',
        many: 'Failed to snatch ${count} files',
        other: 'Failed to snatch ${count} files',
      );

  /// en-US: '(one) {Cancelled ${count} file} (few) {Cancelled ${count} files} (many) {Cancelled ${count} files} (other) {Cancelled ${count} files}'
  String cancelledFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'Cancelled ${count} file',
        few: 'Cancelled ${count} files',
        many: 'Cancelled ${count} files',
        other: 'Cancelled ${count} files',
      );

  /// en-US: 'Snatching images'
  String get snatchingImages => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? 'Snatching images';

  /// en-US: 'Don't close app!'
  String get doNotCloseApp => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? 'Don\'t close app!';

  /// en-US: 'Added item to snatch queue'
  String get addedItemToQueue => TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? 'Added item to snatch queue';

  /// en-US: '(one) {Added ${count} item to snatch queue} (few) {Added ${count} items to snatch queue} (many) {Added ${count} items to snatch queue} (other) {Added ${count} items to snatch queue}'
  String addedItemsToQueue({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'Added ${count} item to snatch queue',
        few: 'Added ${count} items to snatch queue',
        many: 'Added ${count} items to snatch queue',
        other: 'Added ${count} items to snatch queue',
      );
}

// Path: multibooru
class TranslationsMultibooruEnUs {
  TranslationsMultibooruEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Multibooru'
  String get title => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? 'Multibooru';

  /// en-US: 'Multibooru mode'
  String get multibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Multibooru mode';

  /// en-US: 'Requires at least 2 configured boorus'
  String get multibooruRequiresAtLeastTwoBoorus =>
      TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ?? 'Requires at least 2 configured boorus';

  /// en-US: 'Select additional boorus:'
  String get selectSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Select additional boorus:';

  /// en-US: 'aka Multibooru mode'
  String get akaMultibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? 'aka Multibooru mode';

  /// en-US: 'Secondary boorus to include'
  String get labelSecondaryBoorusToInclude =>
      TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? 'Secondary boorus to include';
}

// Path: hydrus
class TranslationsHydrusEnUs {
  TranslationsHydrusEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Something went wrong importing to hydrus'
  String get importError => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'Something went wrong importing to hydrus';

  /// en-US: 'You might not have given the correct API permissions, this can be edited in Review Services'
  String get apiPermissionsRequired =>
      TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ??
      'You might not have given the correct API permissions, this can be edited in Review Services';

  /// en-US: 'Add tags to file'
  String get addTagsToFile => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? 'Add tags to file';

  /// en-US: 'Add URLs'
  String get addUrls => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'Add URLs';
}

// Path: tabs
class TranslationsTabsEnUs {
  TranslationsTabsEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Tab'
  String get tab => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? 'Tab';

  /// en-US: 'Add boorus in settings'
  String get addBoorusInSettings => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? 'Add boorus in settings';

  /// en-US: 'Select a Booru'
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? 'Select a Booru';

  /// en-US: 'Secondary boorus'
  String get secondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? 'Secondary boorus';

  /// en-US: 'Add new tab'
  String get addNewTab => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? 'Add new tab';

  /// en-US: 'Select a booru or leave empty'
  String get selectABooruOrLeaveEmpty =>
      TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? 'Select a booru or leave empty';

  /// en-US: 'Add position'
  String get addPosition => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? 'Add position';

  /// en-US: 'Prev tab'
  String get addModePrevTab => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? 'Prev tab';

  /// en-US: 'Next tab'
  String get addModeNextTab => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? 'Next tab';

  /// en-US: 'List end'
  String get addModeListEnd => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? 'List end';

  /// en-US: 'Used query'
  String get usedQuery => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? 'Used query';

  /// en-US: 'Default'
  String get queryModeDefault => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? 'Default';

  /// en-US: 'Current'
  String get queryModeCurrent => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? 'Current';

  /// en-US: 'Custom'
  String get queryModeCustom => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? 'Custom';

  /// en-US: 'Custom query'
  String get customQuery => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? 'Custom query';

  /// en-US: '[empty]'
  String get empty => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '[empty]';

  /// en-US: 'Add secondary boorus'
  String get addSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? 'Add secondary boorus';

  /// en-US: 'Keep secondary boorus'
  String get keepSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? 'Keep secondary boorus';

  /// en-US: 'Start from custom page number'
  String get startFromCustomPageNumber =>
      TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? 'Start from custom page number';

  /// en-US: 'Switch to new tab'
  String get switchToNewTab => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? 'Switch to new tab';

  /// en-US: 'Add'
  String get add => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? 'Add';

  /// en-US: 'Tabs Manager'
  String get tabsManager => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? 'Tabs Manager';

  /// en-US: 'Select mode'
  String get selectMode => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? 'Select mode';

  /// en-US: 'Sort tabs'
  String get sortMode => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? 'Sort tabs';

  /// en-US: 'Help'
  String get help => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? 'Help';

  /// en-US: 'Delete tabs'
  String get deleteTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? 'Delete tabs';

  /// en-US: 'Shuffle tabs'
  String get shuffleTabs => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? 'Shuffle tabs';

  /// en-US: 'Tab randomly shuffled'
  String get tabRandomlyShuffled => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? 'Tab randomly shuffled';

  /// en-US: 'Tab order saved'
  String get tabOrderSaved => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? 'Tab order saved';

  /// en-US: 'Scroll to current tab'
  String get scrollToCurrent => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? 'Scroll to current tab';

  /// en-US: 'Scroll to top'
  String get scrollToTop => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? 'Scroll to top';

  /// en-US: 'Scroll to bottom'
  String get scrollToBottom => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? 'Scroll to bottom';

  /// en-US: 'Filter by booru, state, duplicates…'
  String get filterTabsByBooru => TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? 'Filter by booru, state, duplicates…';

  /// en-US: 'Scrolling:'
  String get scrolling => TranslationOverrides.string(_root.$meta, 'tabs.scrolling', {}) ?? 'Scrolling:';

  /// en-US: 'Sorting:'
  String get sorting => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? 'Sorting:';

  /// en-US: 'Default tabs order'
  String get defaultTabsOrder => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? 'Default tabs order';

  /// en-US: 'Sort alphabetically'
  String get sortAlphabetically => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? 'Sort alphabetically';

  /// en-US: 'Sort alphabetically (reversed)'
  String get sortAlphabeticallyReversed =>
      TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? 'Sort alphabetically (reversed)';

  /// en-US: 'Sort by booru name alphabetically'
  String get sortByBooruName => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? 'Sort by booru name alphabetically';

  /// en-US: 'Sort by booru name alphabetically (reversed)'
  String get sortByBooruNameReversed =>
      TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ?? 'Sort by booru name alphabetically (reversed)';

  /// en-US: 'Long press sort button to save current order'
  String get longPressSortToSave =>
      TranslationOverrides.string(_root.$meta, 'tabs.longPressSortToSave', {}) ?? 'Long press sort button to save current order';

  /// en-US: 'Select:'
  String get select => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? 'Select:';

  /// en-US: 'Toggle select mode'
  String get toggleSelectMode => TranslationOverrides.string(_root.$meta, 'tabs.toggleSelectMode', {}) ?? 'Toggle select mode';

  /// en-US: 'On the bottom of the page: '
  String get onTheBottomOfPage => TranslationOverrides.string(_root.$meta, 'tabs.onTheBottomOfPage', {}) ?? 'On the bottom of the page: ';

  /// en-US: 'Select/deselect all tabs'
  String get selectDeselectAll => TranslationOverrides.string(_root.$meta, 'tabs.selectDeselectAll', {}) ?? 'Select/deselect all tabs';

  /// en-US: 'Delete selected tabs'
  String get deleteSelectedTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? 'Delete selected tabs';

  /// en-US: 'Long press on a tab to move it'
  String get longPressToMove => TranslationOverrides.string(_root.$meta, 'tabs.longPressToMove', {}) ?? 'Long press on a tab to move it';

  /// en-US: 'Numbers in the bottom right of the tab:'
  String get numbersInBottomRight =>
      TranslationOverrides.string(_root.$meta, 'tabs.numbersInBottomRight', {}) ?? 'Numbers in the bottom right of the tab:';

  /// en-US: 'First number - tab index in default list order'
  String get firstNumberTabIndex =>
      TranslationOverrides.string(_root.$meta, 'tabs.firstNumberTabIndex', {}) ?? 'First number - tab index in default list order';

  /// en-US: 'Second number - tab index in current list order, appears when filtering/sorting is active'
  String get secondNumberTabIndex =>
      TranslationOverrides.string(_root.$meta, 'tabs.secondNumberTabIndex', {}) ??
      'Second number - tab index in current list order, appears when filtering/sorting is active';

  /// en-US: 'Special filters:'
  String get specialFilters => TranslationOverrides.string(_root.$meta, 'tabs.specialFilters', {}) ?? 'Special filters:';

  /// en-US: '«Loaded» - show tabs which have loaded items'
  String get loadedFilter => TranslationOverrides.string(_root.$meta, 'tabs.loadedFilter', {}) ?? '«Loaded» - show tabs which have loaded items';

  /// en-US: '«Not loaded» - show tabs which are not loaded and/or have zero items'
  String get notLoadedFilter =>
      TranslationOverrides.string(_root.$meta, 'tabs.notLoadedFilter', {}) ?? '«Not loaded» - show tabs which are not loaded and/or have zero items';

  /// en-US: 'Not loaded tabs have italic text'
  String get notLoadedItalic => TranslationOverrides.string(_root.$meta, 'tabs.notLoadedItalic', {}) ?? 'Not loaded tabs have italic text';

  /// en-US: 'No tabs found'
  String get noTabsFound => TranslationOverrides.string(_root.$meta, 'tabs.noTabsFound', {}) ?? 'No tabs found';

  /// en-US: 'Copy'
  String get copy => TranslationOverrides.string(_root.$meta, 'tabs.copy', {}) ?? 'Copy';

  /// en-US: 'Move'
  String get moveAction => TranslationOverrides.string(_root.$meta, 'tabs.moveAction', {}) ?? 'Move';

  /// en-US: 'Remove'
  String get remove => TranslationOverrides.string(_root.$meta, 'tabs.remove', {}) ?? 'Remove';

  /// en-US: 'Shuffle'
  String get shuffle => TranslationOverrides.string(_root.$meta, 'tabs.shuffle', {}) ?? 'Shuffle';

  /// en-US: 'Sort'
  String get sort => TranslationOverrides.string(_root.$meta, 'tabs.sort', {}) ?? 'Sort';

  /// en-US: 'Shuffle tabs order randomly?'
  String get shuffleTabsQuestion => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabsQuestion', {}) ?? 'Shuffle tabs order randomly?';

  /// en-US: 'Save tabs in current sorting order?'
  String get saveTabsInCurrentOrder =>
      TranslationOverrides.string(_root.$meta, 'tabs.saveTabsInCurrentOrder', {}) ?? 'Save tabs in current sorting order?';

  /// en-US: 'By booru'
  String get byBooru => TranslationOverrides.string(_root.$meta, 'tabs.byBooru', {}) ?? 'By booru';

  /// en-US: 'Alphabetically'
  String get alphabetically => TranslationOverrides.string(_root.$meta, 'tabs.alphabetically', {}) ?? 'Alphabetically';

  /// en-US: '(reversed)'
  String get reversed => TranslationOverrides.string(_root.$meta, 'tabs.reversed', {}) ?? '(reversed)';

  /// en-US: '(one) {Are you sure you want to delete ${count} tab?} (few) {Are you sure you want to delete ${count} tabs?} (many) {Are you sure you want to delete ${count} tabs?} (other) {Are you sure you want to delete ${count} tabs?}'
  String areYouSureDeleteTabs({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'tabs.areYouSureDeleteTabs', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'Are you sure you want to delete ${count} tab?',
        few: 'Are you sure you want to delete ${count} tabs?',
        many: 'Are you sure you want to delete ${count} tabs?',
        other: 'Are you sure you want to delete ${count} tabs?',
      );

  late final TranslationsTabsFiltersEnUs filters = TranslationsTabsFiltersEnUs.internal(_root);
  late final TranslationsTabsMoveEnUs move = TranslationsTabsMoveEnUs.internal(_root);
}

// Path: history
class TranslationsHistoryEnUs {
  TranslationsHistoryEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Search history'
  String get searchHistory => TranslationOverrides.string(_root.$meta, 'history.searchHistory', {}) ?? 'Search history';

  /// en-US: 'Search history is empty'
  String get searchHistoryIsEmpty => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsEmpty', {}) ?? 'Search history is empty';

  /// en-US: 'Search history disabled'
  String get searchHistoryIsDisabled => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsDisabled', {}) ?? 'Search history disabled';

  /// en-US: 'Enable database in settings for search history'
  String get searchHistoryRequiresDatabase =>
      TranslationOverrides.string(_root.$meta, 'history.searchHistoryRequiresDatabase', {}) ?? 'Enable database in settings for search history';

  /// en-US: 'Last search: ${search: String}'
  String lastSearch({required String search}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearch', {'search': search}) ?? 'Last search: ${search}';

  /// en-US: 'Last search: ${date: String}'
  String lastSearchWithDate({required String date}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearchWithDate', {'date': date}) ?? 'Last search: ${date}';

  /// en-US: 'Unknown Booru type!'
  String get unknownBooruType => TranslationOverrides.string(_root.$meta, 'history.unknownBooruType', {}) ?? 'Unknown Booru type!';

  /// en-US: 'Unknown booru (${name: String}-${type: String})'
  String unknownBooru({required String name, required String type}) =>
      TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ?? 'Unknown booru (${name}-${type})';

  /// en-US: 'Open'
  String get open => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? 'Open';

  /// en-US: 'Open in new tab'
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? 'Open in new tab';

  /// en-US: 'Remove from Favourites'
  String get removeFromFavourites => TranslationOverrides.string(_root.$meta, 'history.removeFromFavourites', {}) ?? 'Remove from Favourites';

  /// en-US: 'Set as Favourite'
  String get setAsFavourite => TranslationOverrides.string(_root.$meta, 'history.setAsFavourite', {}) ?? 'Set as Favourite';

  /// en-US: 'Copy'
  String get copy => TranslationOverrides.string(_root.$meta, 'history.copy', {}) ?? 'Copy';

  /// en-US: 'Delete'
  String get delete => TranslationOverrides.string(_root.$meta, 'history.delete', {}) ?? 'Delete';

  /// en-US: 'Delete history entries'
  String get deleteHistoryEntries => TranslationOverrides.string(_root.$meta, 'history.deleteHistoryEntries', {}) ?? 'Delete history entries';

  /// en-US: '(one) {Are you sure you want to delete ${count} item?} (few) {Are you sure you want to delete ${count} items?} (many) {Are you sure you want to delete ${count} items?} (other) {Are you sure you want to delete ${count} items?}'
  String deleteItemsConfirm({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'history.deleteItemsConfirm', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'Are you sure you want to delete ${count} item?',
        few: 'Are you sure you want to delete ${count} items?',
        many: 'Are you sure you want to delete ${count} items?',
        other: 'Are you sure you want to delete ${count} items?',
      );

  /// en-US: 'Clear selection'
  String get clearSelection => TranslationOverrides.string(_root.$meta, 'history.clearSelection', {}) ?? 'Clear selection';

  /// en-US: '(one) {Delete ${count} item} (few) {Delete ${count} items} (many) {Delete ${count} items} (other) {Delete ${count} items}'
  String deleteItems({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'history.deleteItems', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'Delete ${count} item',
        few: 'Delete ${count} items',
        many: 'Delete ${count} items',
        other: 'Delete ${count} items',
      );
}

// Path: webview
class TranslationsWebviewEnUs {
  TranslationsWebviewEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Webview'
  String get title => TranslationOverrides.string(_root.$meta, 'webview.title', {}) ?? 'Webview';

  /// en-US: 'Not supported on this device'
  String get notSupportedOnDevice => TranslationOverrides.string(_root.$meta, 'webview.notSupportedOnDevice', {}) ?? 'Not supported on this device';

  late final TranslationsWebviewNavigationEnUs navigation = TranslationsWebviewNavigationEnUs.internal(_root);
}

// Path: settings
class TranslationsSettingsEnUs {
  TranslationsSettingsEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Settings'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Settings';

  late final TranslationsSettingsLanguageEnUs language = TranslationsSettingsLanguageEnUs.internal(_root);
  late final TranslationsSettingsBooruEnUs booru = TranslationsSettingsBooruEnUs.internal(_root);
  late final TranslationsSettingsBooruEditorEnUs booruEditor = TranslationsSettingsBooruEditorEnUs.internal(_root);
  late final TranslationsSettingsInterfaceEnUs interface = TranslationsSettingsInterfaceEnUs.internal(_root);
  late final TranslationsSettingsThemeEnUs theme = TranslationsSettingsThemeEnUs.internal(_root);
  late final TranslationsSettingsViewerEnUs viewer = TranslationsSettingsViewerEnUs.internal(_root);
  late final TranslationsSettingsVideoEnUs video = TranslationsSettingsVideoEnUs.internal(_root);
  late final TranslationsSettingsDownloadsEnUs downloads = TranslationsSettingsDownloadsEnUs.internal(_root);
  late final TranslationsSettingsDatabaseEnUs database = TranslationsSettingsDatabaseEnUs.internal(_root);
  late final TranslationsSettingsBackupAndRestoreEnUs backupAndRestore = TranslationsSettingsBackupAndRestoreEnUs.internal(_root);
  late final TranslationsSettingsNetworkEnUs network = TranslationsSettingsNetworkEnUs.internal(_root);
  late final TranslationsSettingsPrivacyEnUs privacy = TranslationsSettingsPrivacyEnUs.internal(_root);
  late final TranslationsSettingsPerformanceEnUs performance = TranslationsSettingsPerformanceEnUs.internal(_root);
  late final TranslationsSettingsCacheEnUs cache = TranslationsSettingsCacheEnUs.internal(_root);
  late final TranslationsSettingsItemFiltersEnUs itemFilters = TranslationsSettingsItemFiltersEnUs.internal(_root);
  late final TranslationsSettingsSyncEnUs sync = TranslationsSettingsSyncEnUs.internal(_root);
  late final TranslationsSettingsAboutEnUs about = TranslationsSettingsAboutEnUs.internal(_root);
  late final TranslationsSettingsCheckForUpdatesEnUs checkForUpdates = TranslationsSettingsCheckForUpdatesEnUs.internal(_root);
  late final TranslationsSettingsLogsEnUs logs = TranslationsSettingsLogsEnUs.internal(_root);
  late final TranslationsSettingsHelpEnUs help = TranslationsSettingsHelpEnUs.internal(_root);
  late final TranslationsSettingsDebugEnUs debug = TranslationsSettingsDebugEnUs.internal(_root);
  late final TranslationsSettingsLoggingEnUs logging = TranslationsSettingsLoggingEnUs.internal(_root);
  late final TranslationsSettingsWebviewEnUs webview = TranslationsSettingsWebviewEnUs.internal(_root);
  late final TranslationsSettingsDirPickerEnUs dirPicker = TranslationsSettingsDirPickerEnUs.internal(_root);

  /// en-US: 'Version'
  String get version => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? 'Version';
}

// Path: comments
class TranslationsCommentsEnUs {
  TranslationsCommentsEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Comments'
  String get title => TranslationOverrides.string(_root.$meta, 'comments.title', {}) ?? 'Comments';

  /// en-US: 'No comments'
  String get noComments => TranslationOverrides.string(_root.$meta, 'comments.noComments', {}) ?? 'No comments';

  /// en-US: 'This Booru doesn't have comments or there is no API for them'
  String get noBooruAPIForComments =>
      TranslationOverrides.string(_root.$meta, 'comments.noBooruAPIForComments', {}) ??
      'This Booru doesn\'t have comments or there is no API for them';
}

// Path: pageChanger
class TranslationsPageChangerEnUs {
  TranslationsPageChangerEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Page changer'
  String get title => TranslationOverrides.string(_root.$meta, 'pageChanger.title', {}) ?? 'Page changer';

  /// en-US: 'Page #'
  String get pageLabel => TranslationOverrides.string(_root.$meta, 'pageChanger.pageLabel', {}) ?? 'Page #';

  /// en-US: 'Delay between loadings (ms)'
  String get delayBetweenLoadings =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.delayBetweenLoadings', {}) ?? 'Delay between loadings (ms)';

  /// en-US: 'Delay in ms'
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'pageChanger.delayInMs', {}) ?? 'Delay in ms';

  /// en-US: 'Current page #${number: int}'
  String currentPage({required int number}) =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.currentPage', {'number': number}) ?? 'Current page #${number}';

  /// en-US: 'Possible max page #~${number: int}'
  String possibleMaxPage({required int number}) =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.possibleMaxPage', {'number': number}) ?? 'Possible max page #~${number}';

  /// en-US: 'Search currently running!'
  String get searchCurrentlyRunning =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.searchCurrentlyRunning', {}) ?? 'Search currently running!';

  /// en-US: 'Jump to page'
  String get jumpToPage => TranslationOverrides.string(_root.$meta, 'pageChanger.jumpToPage', {}) ?? 'Jump to page';

  /// en-US: 'Search until page'
  String get searchUntilPage => TranslationOverrides.string(_root.$meta, 'pageChanger.searchUntilPage', {}) ?? 'Search until page';

  /// en-US: 'Stop searching'
  String get stopSearching => TranslationOverrides.string(_root.$meta, 'pageChanger.stopSearching', {}) ?? 'Stop searching';
}

// Path: tagsFiltersDialogs
class TranslationsTagsFiltersDialogsEnUs {
  TranslationsTagsFiltersDialogsEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Empty input!'
  String get emptyInput => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.emptyInput', {}) ?? 'Empty input!';

  /// en-US: '[Add new ${type: String} filter]'
  String addNewFilter({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.addNewFilter', {'type': type}) ?? '[Add new ${type} filter]';

  /// en-US: 'New ${type: String} tag filter'
  String newTagFilter({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newTagFilter', {'type': type}) ?? 'New ${type} tag filter';

  /// en-US: 'New filter'
  String get newFilter => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newFilter', {}) ?? 'New filter';

  /// en-US: 'Edit filter'
  String get editFilter => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.editFilter', {}) ?? 'Edit filter';
}

// Path: tagsManager
class TranslationsTagsManagerEnUs {
  TranslationsTagsManagerEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Tags'
  String get title => TranslationOverrides.string(_root.$meta, 'tagsManager.title', {}) ?? 'Tags';

  /// en-US: 'Add tag'
  String get addTag => TranslationOverrides.string(_root.$meta, 'tagsManager.addTag', {}) ?? 'Add tag';

  /// en-US: 'Name'
  String get name => TranslationOverrides.string(_root.$meta, 'tagsManager.name', {}) ?? 'Name';

  /// en-US: 'Type'
  String get type => TranslationOverrides.string(_root.$meta, 'tagsManager.type', {}) ?? 'Type';

  /// en-US: 'Add'
  String get add => TranslationOverrides.string(_root.$meta, 'tagsManager.add', {}) ?? 'Add';

  /// en-US: 'Stale after: ${staleText: String}'
  String staleAfter({required String staleText}) =>
      TranslationOverrides.string(_root.$meta, 'tagsManager.staleAfter', {'staleText': staleText}) ?? 'Stale after: ${staleText}';

  /// en-US: 'Added a tab'
  String get addedATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addedATab', {}) ?? 'Added a tab';

  /// en-US: 'Add a tab'
  String get addATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addATab', {}) ?? 'Add a tab';

  /// en-US: 'Copy'
  String get copy => TranslationOverrides.string(_root.$meta, 'tagsManager.copy', {}) ?? 'Copy';

  /// en-US: 'Set stale'
  String get setStale => TranslationOverrides.string(_root.$meta, 'tagsManager.setStale', {}) ?? 'Set stale';

  /// en-US: 'Reset stale'
  String get resetStale => TranslationOverrides.string(_root.$meta, 'tagsManager.resetStale', {}) ?? 'Reset stale';

  /// en-US: 'Make unstaleable'
  String get makeUnstaleable => TranslationOverrides.string(_root.$meta, 'tagsManager.makeUnstaleable', {}) ?? 'Make unstaleable';

  /// en-US: '(one) {Delete ${count} tag} (few) {Delete ${count} tags} (many) {Delete ${count} tags} (other) {Delete ${count} tags}'
  String deleteTags({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'tagsManager.deleteTags', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'Delete ${count} tag',
        few: 'Delete ${count} tags',
        many: 'Delete ${count} tags',
        other: 'Delete ${count} tags',
      );

  /// en-US: 'Delete tags'
  String get deleteTagsTitle => TranslationOverrides.string(_root.$meta, 'tagsManager.deleteTagsTitle', {}) ?? 'Delete tags';

  /// en-US: 'Clear selection'
  String get clearSelection => TranslationOverrides.string(_root.$meta, 'tagsManager.clearSelection', {}) ?? 'Clear selection';
}

// Path: lockscreen
class TranslationsLockscreenEnUs {
  TranslationsLockscreenEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Tap to authenticate'
  String get tapToAuthenticate => TranslationOverrides.string(_root.$meta, 'lockscreen.tapToAuthenticate', {}) ?? 'Tap to authenticate';

  /// en-US: 'DEV UNLOCK'
  String get devUnlock => TranslationOverrides.string(_root.$meta, 'lockscreen.devUnlock', {}) ?? 'DEV UNLOCK';

  /// en-US: '[TESTING]: Press this if you cannot unlock the app through normal means. Report to developer with details about your device.'
  String get testingMessage =>
      TranslationOverrides.string(_root.$meta, 'lockscreen.testingMessage', {}) ??
      '[TESTING]: Press this if you cannot unlock the app through normal means. Report to developer with details about your device.';
}

// Path: loliSync
class TranslationsLoliSyncEnUs {
  TranslationsLoliSyncEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'LoliSync'
  String get title => TranslationOverrides.string(_root.$meta, 'loliSync.title', {}) ?? 'LoliSync';

  /// en-US: 'Do you want to stop syncing?'
  String get stopSyncingQuestion => TranslationOverrides.string(_root.$meta, 'loliSync.stopSyncingQuestion', {}) ?? 'Do you want to stop syncing?';

  /// en-US: 'Do you want to stop the server?'
  String get stopServerQuestion => TranslationOverrides.string(_root.$meta, 'loliSync.stopServerQuestion', {}) ?? 'Do you want to stop the server?';

  /// en-US: 'No connection'
  String get noConnection => TranslationOverrides.string(_root.$meta, 'loliSync.noConnection', {}) ?? 'No connection';

  /// en-US: 'Waiting for connection…'
  String get waitingForConnection => TranslationOverrides.string(_root.$meta, 'loliSync.waitingForConnection', {}) ?? 'Waiting for connection…';

  /// en-US: 'Starting server…'
  String get startingServer => TranslationOverrides.string(_root.$meta, 'loliSync.startingServer', {}) ?? 'Starting server…';

  /// en-US: 'Keep the screen awake'
  String get keepScreenAwake => TranslationOverrides.string(_root.$meta, 'loliSync.keepScreenAwake', {}) ?? 'Keep the screen awake';

  /// en-US: 'LoliSync server killed'
  String get serverKilled => TranslationOverrides.string(_root.$meta, 'loliSync.serverKilled', {}) ?? 'LoliSync server killed';

  /// en-US: 'Test error: ${statusCode: int} ${reasonPhrase: String}'
  String testError({required int statusCode, required String reasonPhrase}) =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testError', {'statusCode': statusCode, 'reasonPhrase': reasonPhrase}) ??
      'Test error: ${statusCode} ${reasonPhrase}';

  /// en-US: 'Test error: ${error: String}'
  String testErrorException({required String error}) =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testErrorException', {'error': error}) ?? 'Test error: ${error}';

  /// en-US: 'Test request received a positive response'
  String get testSuccess => TranslationOverrides.string(_root.$meta, 'loliSync.testSuccess', {}) ?? 'Test request received a positive response';

  /// en-US: 'There should be a 'Test' message on the other device'
  String get testSuccessMessage =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testSuccessMessage', {}) ?? 'There should be a \'Test\' message on the other device';
}

// Path: imageSearch
class TranslationsImageSearchEnUs {
  TranslationsImageSearchEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Image search'
  String get title => TranslationOverrides.string(_root.$meta, 'imageSearch.title', {}) ?? 'Image search';
}

// Path: tagView
class TranslationsTagViewEnUs {
  TranslationsTagViewEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Tags'
  String get tags => TranslationOverrides.string(_root.$meta, 'tagView.tags', {}) ?? 'Tags';

  /// en-US: 'Comments'
  String get comments => TranslationOverrides.string(_root.$meta, 'tagView.comments', {}) ?? 'Comments';

  /// en-US: 'Show notes (${count: int})'
  String showNotes({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'tagView.showNotes', {'count': count}) ?? 'Show notes (${count})';

  /// en-US: 'Hide notes (${count: int})'
  String hideNotes({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'tagView.hideNotes', {'count': count}) ?? 'Hide notes (${count})';

  /// en-US: 'Load notes'
  String get loadNotes => TranslationOverrides.string(_root.$meta, 'tagView.loadNotes', {}) ?? 'Load notes';

  /// en-US: 'This tag is already in the current search query:'
  String get thisTagAlreadyInSearch =>
      TranslationOverrides.string(_root.$meta, 'tagView.thisTagAlreadyInSearch', {}) ?? 'This tag is already in the current search query:';

  /// en-US: 'Added to current search query:'
  String get addedToCurrentSearch => TranslationOverrides.string(_root.$meta, 'tagView.addedToCurrentSearch', {}) ?? 'Added to current search query:';

  /// en-US: 'Added new tab:'
  String get addedNewTab => TranslationOverrides.string(_root.$meta, 'tagView.addedNewTab', {}) ?? 'Added new tab:';

  /// en-US: 'ID'
  String get id => TranslationOverrides.string(_root.$meta, 'tagView.id', {}) ?? 'ID';

  /// en-US: 'Post URL'
  String get postURL => TranslationOverrides.string(_root.$meta, 'tagView.postURL', {}) ?? 'Post URL';

  /// en-US: 'Posted'
  String get posted => TranslationOverrides.string(_root.$meta, 'tagView.posted', {}) ?? 'Posted';

  /// en-US: 'Details'
  String get details => TranslationOverrides.string(_root.$meta, 'tagView.details', {}) ?? 'Details';

  /// en-US: 'Filename'
  String get filename => TranslationOverrides.string(_root.$meta, 'tagView.filename', {}) ?? 'Filename';

  /// en-US: 'URL'
  String get url => TranslationOverrides.string(_root.$meta, 'tagView.url', {}) ?? 'URL';

  /// en-US: 'Extension'
  String get extension => TranslationOverrides.string(_root.$meta, 'tagView.extension', {}) ?? 'Extension';

  /// en-US: 'Resolution'
  String get resolution => TranslationOverrides.string(_root.$meta, 'tagView.resolution', {}) ?? 'Resolution';

  /// en-US: 'Size'
  String get size => TranslationOverrides.string(_root.$meta, 'tagView.size', {}) ?? 'Size';

  /// en-US: 'MD5'
  String get md5 => TranslationOverrides.string(_root.$meta, 'tagView.md5', {}) ?? 'MD5';

  /// en-US: 'Rating'
  String get rating => TranslationOverrides.string(_root.$meta, 'tagView.rating', {}) ?? 'Rating';

  /// en-US: 'Score'
  String get score => TranslationOverrides.string(_root.$meta, 'tagView.score', {}) ?? 'Score';

  /// en-US: 'No tags found'
  String get noTagsFound => TranslationOverrides.string(_root.$meta, 'tagView.noTagsFound', {}) ?? 'No tags found';

  /// en-US: 'Copy'
  String get copy => TranslationOverrides.string(_root.$meta, 'tagView.copy', {}) ?? 'Copy';

  /// en-US: 'Remove from Search'
  String get removeFromSearch => TranslationOverrides.string(_root.$meta, 'tagView.removeFromSearch', {}) ?? 'Remove from Search';

  /// en-US: 'Add to Search'
  String get addToSearch => TranslationOverrides.string(_root.$meta, 'tagView.addToSearch', {}) ?? 'Add to Search';

  /// en-US: 'Added to search bar:'
  String get addedToSearchBar => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBar', {}) ?? 'Added to search bar:';

  /// en-US: 'Add to Search (Exclude)'
  String get addToSearchExclude => TranslationOverrides.string(_root.$meta, 'tagView.addToSearchExclude', {}) ?? 'Add to Search (Exclude)';

  /// en-US: 'Added to search bar (Exclude):'
  String get addedToSearchBarExclude =>
      TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBarExclude', {}) ?? 'Added to search bar (Exclude):';

  /// en-US: 'Add to Marked'
  String get addToMarked => TranslationOverrides.string(_root.$meta, 'tagView.addToMarked', {}) ?? 'Add to Marked';

  /// en-US: 'Add to Hidden'
  String get addToHidden => TranslationOverrides.string(_root.$meta, 'tagView.addToHidden', {}) ?? 'Add to Hidden';

  /// en-US: 'Remove from Marked'
  String get removeFromMarked => TranslationOverrides.string(_root.$meta, 'tagView.removeFromMarked', {}) ?? 'Remove from Marked';

  /// en-US: 'Remove from Hidden'
  String get removeFromHidden => TranslationOverrides.string(_root.$meta, 'tagView.removeFromHidden', {}) ?? 'Remove from Hidden';

  /// en-US: 'Edit tag'
  String get editTag => TranslationOverrides.string(_root.$meta, 'tagView.editTag', {}) ?? 'Edit tag';

  /// en-US: 'Source'
  String get sourceDialogTitle => TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogTitle', {}) ?? 'Source';

  /// en-US: 'Preview'
  String get preview => TranslationOverrides.string(_root.$meta, 'tagView.preview', {}) ?? 'Preview';

  /// en-US: 'Select a booru to load'
  String get selectBooruToLoad => TranslationOverrides.string(_root.$meta, 'tagView.selectBooruToLoad', {}) ?? 'Select a booru to load';

  /// en-US: 'Preview is loading…'
  String get previewIsLoading => TranslationOverrides.string(_root.$meta, 'tagView.previewIsLoading', {}) ?? 'Preview is loading…';

  /// en-US: 'Failed to load preview'
  String get failedToLoadPreview => TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreview', {}) ?? 'Failed to load preview';

  /// en-US: 'Tap to try again'
  String get tapToTryAgain => TranslationOverrides.string(_root.$meta, 'tagView.tapToTryAgain', {}) ?? 'Tap to try again';

  /// en-US: 'Copied file URL to clipboard'
  String get copiedFileURL => TranslationOverrides.string(_root.$meta, 'tagView.copiedFileURL', {}) ?? 'Copied file URL to clipboard';

  /// en-US: 'Tag previews'
  String get tagPreviews => TranslationOverrides.string(_root.$meta, 'tagView.tagPreviews', {}) ?? 'Tag previews';

  /// en-US: 'Current state'
  String get currentState => TranslationOverrides.string(_root.$meta, 'tagView.currentState', {}) ?? 'Current state';

  /// en-US: 'History'
  String get history => TranslationOverrides.string(_root.$meta, 'tagView.history', {}) ?? 'History';

  /// en-US: 'Failed to load preview page'
  String get failedToLoadPreviewPage =>
      TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreviewPage', {}) ?? 'Failed to load preview page';

  /// en-US: 'Try again'
  String get tryAgain => TranslationOverrides.string(_root.$meta, 'tagView.tryAgain', {}) ?? 'Try again';

  /// en-US: 'Detected links:'
  String get detectedLinks => TranslationOverrides.string(_root.$meta, 'tagView.detectedLinks', {}) ?? 'Detected links:';

  /// en-US: 'Related tabs'
  String get relatedTabs => TranslationOverrides.string(_root.$meta, 'tagView.relatedTabs', {}) ?? 'Related tabs';

  /// en-US: 'Tabs with only this tag'
  String get tabsWithOnlyTag => TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTag', {}) ?? 'Tabs with only this tag';

  /// en-US: 'Tabs with only this tag but on a different booru'
  String get tabsWithOnlyTagDifferentBooru =>
      TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTagDifferentBooru', {}) ?? 'Tabs with only this tag but on a different booru';

  /// en-US: 'Tabs containing this tag'
  String get tabsContainingTag => TranslationOverrides.string(_root.$meta, 'tagView.tabsContainingTag', {}) ?? 'Tabs containing this tag';
}

// Path: pinnedTags
class TranslationsPinnedTagsEnUs {
  TranslationsPinnedTagsEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Pinned tags'
  String get pinnedTags => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedTags', {}) ?? 'Pinned tags';

  /// en-US: 'Pin tag'
  String get pinTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinTag', {}) ?? 'Pin tag';

  /// en-US: 'Unpin tag'
  String get unpinTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinTag', {}) ?? 'Unpin tag';

  /// en-US: 'Pin'
  String get pin => TranslationOverrides.string(_root.$meta, 'pinnedTags.pin', {}) ?? 'Pin';

  /// en-US: 'Unpin'
  String get unpin => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpin', {}) ?? 'Unpin';

  /// en-US: 'Pin «${tag: String}» to quick access?'
  String pinQuestion({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinQuestion', {'tag': tag}) ?? 'Pin «${tag}» to quick access?';

  /// en-US: 'Remove «${tag: String}» from pinned tags?'
  String unpinQuestion({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinQuestion', {'tag': tag}) ?? 'Remove «${tag}» from pinned tags?';

  /// en-US: 'Only for ${name: String}'
  String onlyForBooru({required String name}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.onlyForBooru', {'name': name}) ?? 'Only for ${name}';

  /// en-US: 'Labels (optional)'
  String get labelsOptional => TranslationOverrides.string(_root.$meta, 'pinnedTags.labelsOptional', {}) ?? 'Labels (optional)';

  /// en-US: 'Type and press Add button to include a label'
  String get typeAndPressAdd =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.typeAndPressAdd', {}) ?? 'Type and press Add button to include a label';

  /// en-US: 'Select existing label'
  String get selectExistingLabel => TranslationOverrides.string(_root.$meta, 'pinnedTags.selectExistingLabel', {}) ?? 'Select existing label';

  /// en-US: 'Tag pinned'
  String get tagPinned => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagPinned', {}) ?? 'Tag pinned';

  /// en-US: 'Pinned for ${name: String}${labels: String}'
  String pinnedForBooru({required String name, required String labels}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedForBooru', {'name': name, 'labels': labels}) ?? 'Pinned for ${name}${labels}';

  /// en-US: 'Pinned globally${labels: String}'
  String pinnedGloballyWithLabels({required String labels}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedGloballyWithLabels', {'labels': labels}) ?? 'Pinned globally${labels}';

  /// en-US: 'Tag unpinned'
  String get tagUnpinned => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagUnpinned', {}) ?? 'Tag unpinned';

  /// en-US: 'All'
  String get all => TranslationOverrides.string(_root.$meta, 'pinnedTags.all', {}) ?? 'All';

  /// en-US: 'Reorder pinned tags'
  String get reorderPinnedTags => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorderPinnedTags', {}) ?? 'Reorder pinned tags';

  /// en-US: 'Saving…'
  String get saving => TranslationOverrides.string(_root.$meta, 'pinnedTags.saving', {}) ?? 'Saving…';

  /// en-US: 'Reorder'
  String get reorder => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorder', {}) ?? 'Reorder';

  /// en-US: 'Add tag manually'
  String get addTagManually => TranslationOverrides.string(_root.$meta, 'pinnedTags.addTagManually', {}) ?? 'Add tag manually';

  /// en-US: 'No tags match your search'
  String get noTagsMatchSearch => TranslationOverrides.string(_root.$meta, 'pinnedTags.noTagsMatchSearch', {}) ?? 'No tags match your search';

  /// en-US: 'No pinned tags yet'
  String get noPinnedTagsYet => TranslationOverrides.string(_root.$meta, 'pinnedTags.noPinnedTagsYet', {}) ?? 'No pinned tags yet';

  /// en-US: 'Edit labels'
  String get editLabels => TranslationOverrides.string(_root.$meta, 'pinnedTags.editLabels', {}) ?? 'Edit labels';

  /// en-US: 'Labels'
  String get labels => TranslationOverrides.string(_root.$meta, 'pinnedTags.labels', {}) ?? 'Labels';

  /// en-US: 'Add pinned tag'
  String get addPinnedTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.addPinnedTag', {}) ?? 'Add pinned tag';

  /// en-US: 'Tag query'
  String get tagQuery => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQuery', {}) ?? 'Tag query';

  /// en-US: 'tag_name'
  String get tagQueryHint => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQueryHint', {}) ?? 'tag_name';

  /// en-US: 'You can enter any search query, including tags with spaces'
  String get rawQueryHelp =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.rawQueryHelp', {}) ?? 'You can enter any search query, including tags with spaces';
}

// Path: searchBar
class TranslationsSearchBarEnUs {
  TranslationsSearchBarEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Search for tags'
  String get searchForTags => TranslationOverrides.string(_root.$meta, 'searchBar.searchForTags', {}) ?? 'Search for tags';

  /// en-US: 'Couldn't load suggestions. Tap to retry${msg: String}'
  String failedToLoadSuggestions({required String msg}) =>
      TranslationOverrides.string(_root.$meta, 'searchBar.failedToLoadSuggestions', {'msg': msg}) ?? 'Couldn\'t load suggestions. Tap to retry${msg}';

  /// en-US: 'No suggestions found'
  String get noSuggestionsFound => TranslationOverrides.string(_root.$meta, 'searchBar.noSuggestionsFound', {}) ?? 'No suggestions found';

  /// en-US: 'Tag suggestions unavailable for this booru'
  String get tagSuggestionsNotAvailable =>
      TranslationOverrides.string(_root.$meta, 'searchBar.tagSuggestionsNotAvailable', {}) ?? 'Tag suggestions unavailable for this booru';

  /// en-US: 'Copied «${tag: String}» to clipboard'
  String copiedTagToClipboard({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'searchBar.copiedTagToClipboard', {'tag': tag}) ?? 'Copied «${tag}» to clipboard';

  /// en-US: 'Prefix'
  String get prefix => TranslationOverrides.string(_root.$meta, 'searchBar.prefix', {}) ?? 'Prefix';

  /// en-US: 'Exclude (—)'
  String get exclude => TranslationOverrides.string(_root.$meta, 'searchBar.exclude', {}) ?? 'Exclude (—)';

  /// en-US: 'Booru (N#)'
  String get booruNumberPrefix => TranslationOverrides.string(_root.$meta, 'searchBar.booruNumberPrefix', {}) ?? 'Booru (N#)';

  /// en-US: 'Metatags'
  String get metatags => TranslationOverrides.string(_root.$meta, 'searchBar.metatags', {}) ?? 'Metatags';

  /// en-US: 'Free metatags'
  String get freeMetatags => TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatags', {}) ?? 'Free metatags';

  /// en-US: 'Free metatags do not count against the tag search limits'
  String get freeMetatagsDescription =>
      TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatagsDescription', {}) ?? 'Free metatags do not count against the tag search limits';

  /// en-US: 'Free'
  String get free => TranslationOverrides.string(_root.$meta, 'searchBar.free', {}) ?? 'Free';

  /// en-US: 'Single'
  String get single => TranslationOverrides.string(_root.$meta, 'searchBar.single', {}) ?? 'Single';

  /// en-US: 'Range'
  String get range => TranslationOverrides.string(_root.$meta, 'searchBar.range', {}) ?? 'Range';

  /// en-US: 'Popular'
  String get popular => TranslationOverrides.string(_root.$meta, 'searchBar.popular', {}) ?? 'Popular';

  /// en-US: 'Select date'
  String get selectDate => TranslationOverrides.string(_root.$meta, 'searchBar.selectDate', {}) ?? 'Select date';

  /// en-US: 'Select dates range'
  String get selectDatesRange => TranslationOverrides.string(_root.$meta, 'searchBar.selectDatesRange', {}) ?? 'Select dates range';

  /// en-US: 'History'
  String get history => TranslationOverrides.string(_root.$meta, 'searchBar.history', {}) ?? 'History';

  /// en-US: '…'
  String get more => TranslationOverrides.string(_root.$meta, 'searchBar.more', {}) ?? '…';
}

// Path: mobileHome
class TranslationsMobileHomeEnUs {
  TranslationsMobileHomeEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Select booru for webview'
  String get selectBooruForWebview => TranslationOverrides.string(_root.$meta, 'mobileHome.selectBooruForWebview', {}) ?? 'Select booru for webview';

  /// en-US: 'Lock app'
  String get lockApp => TranslationOverrides.string(_root.$meta, 'mobileHome.lockApp', {}) ?? 'Lock app';

  /// en-US: 'File already exists'
  String get fileAlreadyExists => TranslationOverrides.string(_root.$meta, 'mobileHome.fileAlreadyExists', {}) ?? 'File already exists';

  /// en-US: 'Failed to download'
  String get failedToDownload => TranslationOverrides.string(_root.$meta, 'mobileHome.failedToDownload', {}) ?? 'Failed to download';

  /// en-US: 'Cancelled by user'
  String get cancelledByUser => TranslationOverrides.string(_root.$meta, 'mobileHome.cancelledByUser', {}) ?? 'Cancelled by user';

  /// en-US: 'Save anyway'
  String get saveAnyway => TranslationOverrides.string(_root.$meta, 'mobileHome.saveAnyway', {}) ?? 'Save anyway';

  /// en-US: 'Skip'
  String get skip => TranslationOverrides.string(_root.$meta, 'mobileHome.skip', {}) ?? 'Skip';

  /// en-US: 'Retry all (${count: int})'
  String retryAll({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.retryAll', {'count': count}) ?? 'Retry all (${count})';

  /// en-US: 'Existing, failed or cancelled items'
  String get existingFailedOrCancelledItems =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.existingFailedOrCancelledItems', {}) ?? 'Existing, failed or cancelled items';

  /// en-US: 'Clear all retryable items'
  String get clearAllRetryableItems =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.clearAllRetryableItems', {}) ?? 'Clear all retryable items';
}

// Path: desktopHome
class TranslationsDesktopHomeEnUs {
  TranslationsDesktopHomeEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Snatcher'
  String get snatcher => TranslationOverrides.string(_root.$meta, 'desktopHome.snatcher', {}) ?? 'Snatcher';

  /// en-US: 'Add boorus in settings'
  String get addBoorusInSettings => TranslationOverrides.string(_root.$meta, 'desktopHome.addBoorusInSettings', {}) ?? 'Add boorus in settings';

  /// en-US: 'Settings'
  String get settings => TranslationOverrides.string(_root.$meta, 'desktopHome.settings', {}) ?? 'Settings';

  /// en-US: 'Save'
  String get save => TranslationOverrides.string(_root.$meta, 'desktopHome.save', {}) ?? 'Save';

  /// en-US: 'No items selected'
  String get noItemsSelected => TranslationOverrides.string(_root.$meta, 'desktopHome.noItemsSelected', {}) ?? 'No items selected';
}

// Path: galleryView
class TranslationsGalleryViewEnUs {
  TranslationsGalleryViewEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'No items'
  String get noItems => TranslationOverrides.string(_root.$meta, 'galleryView.noItems', {}) ?? 'No items';

  /// en-US: 'No item selected'
  String get noItemSelected => TranslationOverrides.string(_root.$meta, 'galleryView.noItemSelected', {}) ?? 'No item selected';

  /// en-US: 'Close'
  String get close => TranslationOverrides.string(_root.$meta, 'galleryView.close', {}) ?? 'Close';
}

// Path: mediaPreviews
class TranslationsMediaPreviewsEnUs {
  TranslationsMediaPreviewsEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'No booru configs found'
  String get noBooruConfigsFound => TranslationOverrides.string(_root.$meta, 'mediaPreviews.noBooruConfigsFound', {}) ?? 'No booru configs found';

  /// en-US: 'Add new Booru'
  String get addNewBooru => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? 'Add new Booru';

  /// en-US: 'Help'
  String get help => TranslationOverrides.string(_root.$meta, 'mediaPreviews.help', {}) ?? 'Help';

  /// en-US: 'Settings'
  String get settings => TranslationOverrides.string(_root.$meta, 'mediaPreviews.settings', {}) ?? 'Settings';

  /// en-US: 'Restoring previous session…'
  String get restoringPreviousSession =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoringPreviousSession', {}) ?? 'Restoring previous session…';

  /// en-US: 'Copied file URL to clipboard!'
  String get copiedFileURL => TranslationOverrides.string(_root.$meta, 'mediaPreviews.copiedFileURL', {}) ?? 'Copied file URL to clipboard!';
}

// Path: viewer
class TranslationsViewerEnUs {
  TranslationsViewerEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsViewerTutorialEnUs tutorial = TranslationsViewerTutorialEnUs.internal(_root);
  late final TranslationsViewerAppBarEnUs appBar = TranslationsViewerAppBarEnUs.internal(_root);
  late final TranslationsViewerNotesEnUs notes = TranslationsViewerNotesEnUs.internal(_root);
}

// Path: common
class TranslationsCommonEnUs {
  TranslationsCommonEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Select a booru'
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'common.selectABooru', {}) ?? 'Select a booru';

  /// en-US: 'Booru item copied to clipboard'
  String get booruItemCopiedToClipboard =>
      TranslationOverrides.string(_root.$meta, 'common.booruItemCopiedToClipboard', {}) ?? 'Booru item copied to clipboard';
}

// Path: gallery
class TranslationsGalleryEnUs {
  TranslationsGalleryEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Snatch?'
  String get snatchQuestion => TranslationOverrides.string(_root.$meta, 'gallery.snatchQuestion', {}) ?? 'Snatch?';

  /// en-US: 'No post URL!'
  String get noPostUrl => TranslationOverrides.string(_root.$meta, 'gallery.noPostUrl', {}) ?? 'No post URL!';

  /// en-US: 'Loading file…'
  String get loadingFile => TranslationOverrides.string(_root.$meta, 'gallery.loadingFile', {}) ?? 'Loading file…';

  /// en-US: 'This can take some time, please wait…'
  String get loadingFileMessage =>
      TranslationOverrides.string(_root.$meta, 'gallery.loadingFileMessage', {}) ?? 'This can take some time, please wait…';

  /// en-US: '(one) {Source} (other) {Sources}'
  String sources({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'gallery.sources', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'Source',
        other: 'Sources',
      );
}

// Path: galleryButtons
class TranslationsGalleryButtonsEnUs {
  TranslationsGalleryButtonsEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Snatch'
  String get snatch => TranslationOverrides.string(_root.$meta, 'galleryButtons.snatch', {}) ?? 'Snatch';

  /// en-US: 'Favourite'
  String get favourite => TranslationOverrides.string(_root.$meta, 'galleryButtons.favourite', {}) ?? 'Favourite';

  /// en-US: 'Info'
  String get info => TranslationOverrides.string(_root.$meta, 'galleryButtons.info', {}) ?? 'Info';

  /// en-US: 'Share'
  String get share => TranslationOverrides.string(_root.$meta, 'galleryButtons.share', {}) ?? 'Share';

  /// en-US: 'Select'
  String get select => TranslationOverrides.string(_root.$meta, 'galleryButtons.select', {}) ?? 'Select';

  /// en-US: 'Open in browser'
  String get open => TranslationOverrides.string(_root.$meta, 'galleryButtons.open', {}) ?? 'Open in browser';

  /// en-US: 'Slideshow'
  String get slideshow => TranslationOverrides.string(_root.$meta, 'galleryButtons.slideshow', {}) ?? 'Slideshow';

  /// en-US: 'Toggle scaling'
  String get reloadNoScale => TranslationOverrides.string(_root.$meta, 'galleryButtons.reloadNoScale', {}) ?? 'Toggle scaling';

  /// en-US: 'Toggle quality'
  String get toggleQuality => TranslationOverrides.string(_root.$meta, 'galleryButtons.toggleQuality', {}) ?? 'Toggle quality';

  /// en-US: 'External player'
  String get externalPlayer => TranslationOverrides.string(_root.$meta, 'galleryButtons.externalPlayer', {}) ?? 'External player';

  /// en-US: 'Image search'
  String get imageSearch => TranslationOverrides.string(_root.$meta, 'galleryButtons.imageSearch', {}) ?? 'Image search';
}

// Path: media
class TranslationsMediaEnUs {
  TranslationsMediaEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsMediaLoadingEnUs loading = TranslationsMediaLoadingEnUs.internal(_root);
  late final TranslationsMediaVideoEnUs video = TranslationsMediaVideoEnUs.internal(_root);
}

// Path: imageStats
class TranslationsImageStatsEnUs {
  TranslationsImageStatsEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Live: ${count: int}'
  String live({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.live', {'count': count}) ?? 'Live: ${count}';

  /// en-US: 'Pending: ${count: int}'
  String pending({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.pending', {'count': count}) ?? 'Pending: ${count}';

  /// en-US: 'Total: ${count: int}'
  String total({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.total', {'count': count}) ?? 'Total: ${count}';

  /// en-US: 'Size: ${size: String}'
  String size({required String size}) => TranslationOverrides.string(_root.$meta, 'imageStats.size', {'size': size}) ?? 'Size: ${size}';

  /// en-US: 'Max: ${max: String}'
  String max({required String max}) => TranslationOverrides.string(_root.$meta, 'imageStats.max', {'max': max}) ?? 'Max: ${max}';
}

// Path: preview
class TranslationsPreviewEnUs {
  TranslationsPreviewEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsPreviewErrorEnUs error = TranslationsPreviewErrorEnUs.internal(_root);
}

// Path: tagType
class TranslationsTagTypeEnUs {
  TranslationsTagTypeEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Artist'
  String get artist => TranslationOverrides.string(_root.$meta, 'tagType.artist', {}) ?? 'Artist';

  /// en-US: 'Character'
  String get character => TranslationOverrides.string(_root.$meta, 'tagType.character', {}) ?? 'Character';

  /// en-US: 'Copyright'
  String get copyright => TranslationOverrides.string(_root.$meta, 'tagType.copyright', {}) ?? 'Copyright';

  /// en-US: 'Meta'
  String get meta => TranslationOverrides.string(_root.$meta, 'tagType.meta', {}) ?? 'Meta';

  /// en-US: 'Species'
  String get species => TranslationOverrides.string(_root.$meta, 'tagType.species', {}) ?? 'Species';

  /// en-US: 'None/General'
  String get none => TranslationOverrides.string(_root.$meta, 'tagType.none', {}) ?? 'None/General';
}

// Path: tabs.filters
class TranslationsTabsFiltersEnUs {
  TranslationsTabsFiltersEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Loaded'
  String get loaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.loaded', {}) ?? 'Loaded';

  /// en-US: 'Tag type'
  String get tagType => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagType', {}) ?? 'Tag type';

  /// en-US: 'Multibooru'
  String get multibooru => TranslationOverrides.string(_root.$meta, 'tabs.filters.multibooru', {}) ?? 'Multibooru';

  /// en-US: 'Duplicates'
  String get duplicates => TranslationOverrides.string(_root.$meta, 'tabs.filters.duplicates', {}) ?? 'Duplicates';

  /// en-US: 'Check for duplicates on same Booru'
  String get checkDuplicatesOnSameBooru =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.checkDuplicatesOnSameBooru', {}) ?? 'Check for duplicates on same Booru';

  /// en-US: 'Empty search query'
  String get emptySearchQuery => TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? 'Empty search query';

  /// en-US: 'Tab Filters'
  String get title => TranslationOverrides.string(_root.$meta, 'tabs.filters.title', {}) ?? 'Tab Filters';

  /// en-US: 'All'
  String get all => TranslationOverrides.string(_root.$meta, 'tabs.filters.all', {}) ?? 'All';

  /// en-US: 'Not loaded'
  String get notLoaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.notLoaded', {}) ?? 'Not loaded';

  /// en-US: 'Enabled'
  String get enabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.enabled', {}) ?? 'Enabled';

  /// en-US: 'Disabled'
  String get disabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.disabled', {}) ?? 'Disabled';

  /// en-US: 'Will also enable sorting'
  String get willAlsoEnableSorting =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.willAlsoEnableSorting', {}) ?? 'Will also enable sorting';

  /// en-US: 'Filter tabs which contain at least one tag of selected type'
  String get tagTypeFilterHelp =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.tagTypeFilterHelp', {}) ?? 'Filter tabs which contain at least one tag of selected type';

  /// en-US: 'Any'
  String get any => TranslationOverrides.string(_root.$meta, 'tabs.filters.any', {}) ?? 'Any';

  /// en-US: 'Apply'
  String get apply => TranslationOverrides.string(_root.$meta, 'tabs.filters.apply', {}) ?? 'Apply';
}

// Path: tabs.move
class TranslationsTabsMoveEnUs {
  TranslationsTabsMoveEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Move to top'
  String get moveToTop => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToTop', {}) ?? 'Move to top';

  /// en-US: 'Move to bottom'
  String get moveToBottom => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToBottom', {}) ?? 'Move to bottom';

  /// en-US: 'Tab number'
  String get tabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.tabNumber', {}) ?? 'Tab number';

  /// en-US: 'Invalid tab number'
  String get invalidTabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidTabNumber', {}) ?? 'Invalid tab number';

  /// en-US: 'Invalid input'
  String get invalidInput => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidInput', {}) ?? 'Invalid input';

  /// en-US: 'Out of range'
  String get outOfRange => TranslationOverrides.string(_root.$meta, 'tabs.move.outOfRange', {}) ?? 'Out of range';

  /// en-US: 'Please enter a valid tab number'
  String get pleaseEnterValidTabNumber =>
      TranslationOverrides.string(_root.$meta, 'tabs.move.pleaseEnterValidTabNumber', {}) ?? 'Please enter a valid tab number';

  /// en-US: 'Move to #${formattedNumber: String}'
  String moveTo({required String formattedNumber}) =>
      TranslationOverrides.string(_root.$meta, 'tabs.move.moveTo', {'formattedNumber': formattedNumber}) ?? 'Move to #${formattedNumber}';

  /// en-US: 'Preview:'
  String get preview => TranslationOverrides.string(_root.$meta, 'tabs.move.preview', {}) ?? 'Preview:';
}

// Path: webview.navigation
class TranslationsWebviewNavigationEnUs {
  TranslationsWebviewNavigationEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Enter a URL'
  String get enterUrlLabel => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterUrlLabel', {}) ?? 'Enter a URL';

  /// en-US: 'Enter custom URL'
  String get enterCustomUrl => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterCustomUrl', {}) ?? 'Enter custom URL';

  /// en-US: 'Navigate to ${url: String}'
  String navigateTo({required String url}) =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.navigateTo', {'url': url}) ?? 'Navigate to ${url}';

  /// en-US: 'List cookies'
  String get listCookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.listCookies', {}) ?? 'List cookies';

  /// en-US: 'Clear cookies'
  String get clearCookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.clearCookies', {}) ?? 'Clear cookies';

  /// en-US: 'There were cookies. Now, they are gone'
  String get cookiesGone =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.cookiesGone', {}) ?? 'There were cookies. Now, they are gone';

  /// en-US: 'Get favicon'
  String get getFavicon => TranslationOverrides.string(_root.$meta, 'webview.navigation.getFavicon', {}) ?? 'Get favicon';

  /// en-US: 'No favicon found'
  String get noFaviconFound => TranslationOverrides.string(_root.$meta, 'webview.navigation.noFaviconFound', {}) ?? 'No favicon found';

  /// en-US: 'Host:'
  String get host => TranslationOverrides.string(_root.$meta, 'webview.navigation.host', {}) ?? 'Host:';

  /// en-US: '(text above is selectable)'
  String get textAboveSelectable =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.textAboveSelectable', {}) ?? '(text above is selectable)';

  /// en-US: 'Field to merge texts:'
  String get fieldToMergeTexts => TranslationOverrides.string(_root.$meta, 'webview.navigation.fieldToMergeTexts', {}) ?? 'Field to merge texts:';

  /// en-US: 'Copy URL'
  String get copyUrl => TranslationOverrides.string(_root.$meta, 'webview.navigation.copyUrl', {}) ?? 'Copy URL';

  /// en-US: 'Copied URL to clipboard'
  String get copiedUrlToClipboard =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.copiedUrlToClipboard', {}) ?? 'Copied URL to clipboard';

  /// en-US: 'Cookies'
  String get cookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookies', {}) ?? 'Cookies';

  /// en-US: 'Favicon'
  String get favicon => TranslationOverrides.string(_root.$meta, 'webview.navigation.favicon', {}) ?? 'Favicon';

  /// en-US: 'History'
  String get history => TranslationOverrides.string(_root.$meta, 'webview.navigation.history', {}) ?? 'History';

  /// en-US: 'No back history item'
  String get noBackHistoryItem => TranslationOverrides.string(_root.$meta, 'webview.navigation.noBackHistoryItem', {}) ?? 'No back history item';

  /// en-US: 'No forward history item'
  String get noForwardHistoryItem =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.noForwardHistoryItem', {}) ?? 'No forward history item';
}

// Path: settings.language
class TranslationsSettingsLanguageEnUs {
  TranslationsSettingsLanguageEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Language'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? 'Language';

  /// en-US: 'System'
  String get system => TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? 'System';

  /// en-US: 'Help us translate'
  String get helpUsTranslate => TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? 'Help us translate';

  /// en-US: 'Visit <a href='https://github.com/NO-ob/LoliSnatcher_Droid/wiki/Localization'>github</a> for details or tap on the image below to go to Weblate'
  String get visitForDetails =>
      TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ??
      'Visit <a href=\'https://github.com/NO-ob/LoliSnatcher_Droid/wiki/Localization\'>github</a> for details or tap on the image below to go to Weblate';
}

// Path: settings.booru
class TranslationsSettingsBooruEnUs {
  TranslationsSettingsBooruEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Boorus & Search'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Boorus & Search';

  /// en-US: 'Default tags'
  String get defaultTags => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? 'Default tags';

  /// en-US: 'Items fetched per page'
  String get itemsPerPage => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'Items fetched per page';

  /// en-US: 'Some boorus may ignore this'
  String get itemsPerPageTip => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'Some boorus may ignore this';

  /// en-US: '10-100'
  String get itemsPerPagePlaceholder => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPagePlaceholder', {}) ?? '10-100';

  /// en-US: 'Add Booru config'
  String get addBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Add Booru config';

  /// en-US: 'Share Booru config'
  String get shareBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? 'Share Booru config';

  /// en-US: 'Share ${booruName: String} config as a link. Include login/API key?'
  String shareBooruDialogMsgMobile({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
      'Share ${booruName} config as a link.\n\nInclude login/API key?';

  /// en-US: 'Copy ${booruName: String} config link to clipboard. Include login/API key?'
  String shareBooruDialogMsgDesktop({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
      'Copy ${booruName} config link to clipboard.\n\nInclude login/API key?';

  /// en-US: 'Booru sharing'
  String get booruSharing => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? 'Booru sharing';

  /// en-US: 'How to automatically open Booru config links in the app on Android 12 and higher: 1) Tap button below to open system app link defaults settings 2) Tap on «Add link» and select all available options'
  String get booruSharingMsgAndroid =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ??
      'How to automatically open Booru config links in the app on Android 12 and higher:\n1) Tap button below to open system app link defaults settings\n2) Tap on «Add link» and select all available options';

  /// en-US: 'Added Boorus'
  String get addedBoorus => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? 'Added Boorus';

  /// en-US: 'Edit Booru config'
  String get editBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? 'Edit Booru config';

  /// en-US: 'Import Booru config from clipboard'
  String get importBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? 'Import Booru config from clipboard';

  /// en-US: 'Only loli.snatcher URLs are supported'
  String get onlyLSURLsSupported =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ?? 'Only loli.snatcher URLs are supported';

  /// en-US: 'Delete Booru config'
  String get deleteBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? 'Delete Booru config';

  /// en-US: 'Something went wrong during deletion of a Booru config!'
  String get deleteBooruError =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ?? 'Something went wrong during deletion of a Booru config!';

  /// en-US: 'Booru config deleted'
  String get booruDeleted => TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? 'Booru config deleted';

  /// en-US: 'Selected booru becomes default after saving. Default booru appears first in dropdowns'
  String get booruDropdownInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ??
      'Selected booru becomes default after saving.\n\nDefault booru appears first in dropdowns';

  /// en-US: 'Change default Booru?'
  String get changeDefaultBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? 'Change default Booru?';

  /// en-US: 'Change to: '
  String get changeTo => TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? 'Change to: ';

  /// en-US: 'Tap [No] to keep current: '
  String get keepCurrentBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? 'Tap [No] to keep current: ';

  /// en-US: 'Tap [Yes] to change to: '
  String get changeToNewBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? 'Tap [Yes] to change to: ';

  /// en-US: 'Booru config link copied to clipboard'
  String get booruConfigLinkCopied =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ?? 'Booru config link copied to clipboard';

  /// en-US: 'No Booru selected!'
  String get noBooruSelected => TranslationOverrides.string(_root.$meta, 'settings.booru.noBooruSelected', {}) ?? 'No Booru selected!';

  /// en-US: 'Can't delete this Booru!'
  String get cantDeleteThisBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? 'Can\'t delete this Booru!';

  /// en-US: 'Remove related tabs first'
  String get removeRelatedTabsFirst =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.removeRelatedTabsFirst', {}) ?? 'Remove related tabs first';
}

// Path: settings.booruEditor
class TranslationsSettingsBooruEditorEnUs {
  TranslationsSettingsBooruEditorEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Booru Editor'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? 'Booru Editor';

  /// en-US: 'Booru test failed'
  String get testBooruFailedTitle => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'Booru test failed';

  /// en-US: 'Config parameters may be incorrect, booru doesn't allow API access, request didn't return any data or there was a network error.'
  String get testBooruFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ??
      'Config parameters may be incorrect, booru doesn\'t allow API access, request didn\'t return any data or there was a network error.';

  /// en-US: 'Save Booru'
  String get saveBooru => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Save Booru';

  /// en-US: 'Running test…'
  String get runningTest => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? 'Running test…';

  /// en-US: 'This Booru config already exists'
  String get booruConfigExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? 'This Booru config already exists';

  /// en-US: 'Booru config with same name already exists'
  String get booruSameNameExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ?? 'Booru config with same name already exists';

  /// en-US: 'Booru config with same URL already exists'
  String get booruSameUrlExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ?? 'Booru config with same URL already exists';

  /// en-US: 'This booru config won't be added'
  String get thisBooruConfigWontBeAdded =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ?? 'This booru config won\'t be added';

  /// en-US: 'Booru config saved'
  String get booruConfigSaved => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? 'Booru config saved';

  /// en-US: 'Existing tabs with this Booru need to be reloaded in order to apply changes!'
  String get existingTabsNeedReload =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ??
      'Existing tabs with this Booru need to be reloaded in order to apply changes!';

  /// en-US: 'Failed to verify API access for Hydrus'
  String get failedVerifyApiHydrus =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ?? 'Failed to verify API access for Hydrus';

  /// en-US: 'Access key requested'
  String get accessKeyRequestedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? 'Access key requested';

  /// en-US: 'Tap okay on Hydrus then apply. You can tap 'Test Booru' afterwards'
  String get accessKeyRequestedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ??
      'Tap okay on Hydrus then apply. You can tap \'Test Booru\' afterwards';

  /// en-US: 'Failed to get access key'
  String get accessKeyFailedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? 'Failed to get access key';

  /// en-US: 'Do you have the request window open in Hydrus?'
  String get accessKeyFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ?? 'Do you have the request window open in Hydrus?';

  /// en-US: 'To get the Hydrus key you need to open the request dialog in the Hydrus client. Services > Review services > Client API > Add > From API request'
  String get hydrusInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ??
      'To get the Hydrus key you need to open the request dialog in the Hydrus client. Services > Review services > Client API > Add > From API request';

  /// en-US: 'Get Hydrus API key'
  String get getHydrusApiKey => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? 'Get Hydrus API key';

  /// en-US: 'Booru Name'
  String get booruName => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? 'Booru Name';

  /// en-US: 'Booru Name is required!'
  String get booruNameRequired => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? 'Booru Name is required!';

  /// en-US: 'Booru URL'
  String get booruUrl => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? 'Booru URL';

  /// en-US: 'Booru URL is required!'
  String get booruUrlRequired => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? 'Booru URL is required!';

  /// en-US: 'Booru Type'
  String get booruType => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruType', {}) ?? 'Booru Type';

  /// en-US: 'Favicon URL'
  String get booruFavicon => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? 'Favicon URL';

  /// en-US: '(Autofills if blank)'
  String get booruFaviconPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '(Autofills if blank)';

  /// en-US: 'Default tags'
  String get booruDefTags => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? 'Default tags';

  /// en-US: 'Default search for booru'
  String get booruDefTagsPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTagsPlaceholder', {}) ?? 'Default search for booru';

  /// en-US: 'Fields below may be required for some boorus'
  String get booruDefaultInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefaultInstructions', {}) ?? 'Fields below may be required for some boorus';

  /// en-US: 'Confirm saving this booru config'
  String get booruConfigShouldSave =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigShouldSave', {}) ?? 'Confirm saving this booru config';

  /// en-US: 'Selected/Detected booru type: ${booruType: String}'
  String booruConfigSelectedType({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSelectedType', {'booruType': booruType}) ??
      'Selected/Detected booru type: ${booruType}';
}

// Path: settings.interface
class TranslationsSettingsInterfaceEnUs {
  TranslationsSettingsInterfaceEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Interface'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? 'Interface';

  /// en-US: 'App UI mode'
  String get appUIMode => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIMode', {}) ?? 'App UI mode';

  /// en-US: 'App UI mode'
  String get appUIModeWarningTitle => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarningTitle', {}) ?? 'App UI mode';

  /// en-US: 'Use Desktop mode? May cause issues on mobile. DEPRECATED.'
  String get appUIModeWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarning', {}) ??
      'Use Desktop mode? May cause issues on mobile. DEPRECATED.';

  /// en-US: '- Mobile - Normal Mobile UI'
  String get appUIModeHelpMobile =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpMobile', {}) ?? '- Mobile - Normal Mobile UI';

  /// en-US: '- Desktop - Ahoviewer Style UI [DEPRECATED, NEEDS REWORK]'
  String get appUIModeHelpDesktop =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpDesktop', {}) ??
      '- Desktop - Ahoviewer Style UI [DEPRECATED, NEEDS REWORK]';

  /// en-US: '[Warning]: Do not set UI Mode to Desktop on a phone you might break the app and might have to wipe your settings including booru configs.'
  String get appUIModeHelpWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpWarning', {}) ??
      '[Warning]: Do not set UI Mode to Desktop on a phone you might break the app and might have to wipe your settings including booru configs.';

  /// en-US: 'Hand side'
  String get handSide => TranslationOverrides.string(_root.$meta, 'settings.interface.handSide', {}) ?? 'Hand side';

  /// en-US: 'Adjusts UI element positions to selected side'
  String get handSideHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.handSideHelp', {}) ?? 'Adjusts UI element positions to selected side';

  /// en-US: 'Show search bar in preview grid'
  String get showSearchBarInPreviewGrid =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.showSearchBarInPreviewGrid', {}) ?? 'Show search bar in preview grid';

  /// en-US: 'Move input to top in search view'
  String get moveInputToTopInSearchView =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.moveInputToTopInSearchView', {}) ?? 'Move input to top in search view';

  /// en-US: 'Search view quick actions panel'
  String get searchViewQuickActionsPanel =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewQuickActionsPanel', {}) ?? 'Search view quick actions panel';

  /// en-US: 'Search view input autofocus'
  String get searchViewInputAutofocus =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewInputAutofocus', {}) ?? 'Search view input autofocus';

  /// en-US: 'Disable vibration'
  String get disableVibration => TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibration', {}) ?? 'Disable vibration';

  /// en-US: 'May still happen on some actions even when disabled'
  String get disableVibrationSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibrationSubtitle', {}) ??
      'May still happen on some actions even when disabled';

  /// en-US: 'Predictive back gesture'
  String get usePredictiveBack => TranslationOverrides.string(_root.$meta, 'settings.interface.usePredictiveBack', {}) ?? 'Predictive back gesture';

  /// en-US: 'Preview columns (portrait)'
  String get previewColumnsPortrait =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsPortrait', {}) ?? 'Preview columns (portrait)';

  /// en-US: 'Preview columns (landscape)'
  String get previewColumnsLandscape =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsLandscape', {}) ?? 'Preview columns (landscape)';

  /// en-US: 'Preview quality'
  String get previewQuality => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQuality', {}) ?? 'Preview quality';

  /// en-US: 'Changes preview grid image resolution'
  String get previewQualityHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelp', {}) ?? 'Changes preview grid image resolution';

  /// en-US: ' - Sample - Medium resolution, app will also load a Thumbnail quality as a placeholder while higher quality loads'
  String get previewQualityHelpSample =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpSample', {}) ??
      ' - Sample - Medium resolution, app will also load a Thumbnail quality as a placeholder while higher quality loads';

  /// en-US: ' - Thumbnail - Low resolution'
  String get previewQualityHelpThumbnail =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpThumbnail', {}) ?? ' - Thumbnail - Low resolution';

  /// en-US: '[Note]: Sample quality can noticeably degrade performance, especially if you have too many columns in preview grid'
  String get previewQualityHelpNote =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpNote', {}) ??
      '[Note]: Sample quality can noticeably degrade performance, especially if you have too many columns in preview grid';

  /// en-US: 'Preview display'
  String get previewDisplay => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplay', {}) ?? 'Preview display';

  /// en-US: 'Preview display fallback'
  String get previewDisplayFallback =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallback', {}) ?? 'Preview display fallback';

  /// en-US: 'This will be used when Staggered option is not possible'
  String get previewDisplayFallbackHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallbackHelp', {}) ??
      'This will be used when Staggered option is not possible';

  /// en-US: 'Don't scale images'
  String get dontScaleImages => TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImages', {}) ?? 'Don\'t scale images';

  /// en-US: 'May reduce performance'
  String get dontScaleImagesSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesSubtitle', {}) ?? 'May reduce performance';

  /// en-US: 'Warning'
  String get dontScaleImagesWarningTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningTitle', {}) ?? 'Warning';

  /// en-US: 'Are you sure you want to disable image scaling?'
  String get dontScaleImagesWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarning', {}) ?? 'Are you sure you want to disable image scaling?';

  /// en-US: 'This can negatively impact the performance, especially on older devices'
  String get dontScaleImagesWarningMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningMsg', {}) ??
      'This can negatively impact the performance, especially on older devices';

  /// en-US: 'GIF thumbnails'
  String get gifThumbnails => TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnails', {}) ?? 'GIF thumbnails';

  /// en-US: 'Requires «Don't scale images»'
  String get gifThumbnailsRequires =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnailsRequires', {}) ?? 'Requires «Don\'t scale images»';

  /// en-US: 'Scroll previews buttons position'
  String get scrollPreviewsButtonsPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.scrollPreviewsButtonsPosition', {}) ?? 'Scroll previews buttons position';

  /// en-US: 'Mouse wheel scroll modifier'
  String get mouseWheelScrollModifier =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.mouseWheelScrollModifier', {}) ?? 'Mouse wheel scroll modifier';

  /// en-US: 'Scroll modifier'
  String get scrollModifier => TranslationOverrides.string(_root.$meta, 'settings.interface.scrollModifier', {}) ?? 'Scroll modifier';

  late final TranslationsSettingsInterfacePreviewQualityValuesEnUs previewQualityValues =
      TranslationsSettingsInterfacePreviewQualityValuesEnUs.internal(_root);
  late final TranslationsSettingsInterfacePreviewDisplayModeValuesEnUs previewDisplayModeValues =
      TranslationsSettingsInterfacePreviewDisplayModeValuesEnUs.internal(_root);
  late final TranslationsSettingsInterfaceAppModeValuesEnUs appModeValues = TranslationsSettingsInterfaceAppModeValuesEnUs.internal(_root);
  late final TranslationsSettingsInterfaceHandSideValuesEnUs handSideValues = TranslationsSettingsInterfaceHandSideValuesEnUs.internal(_root);
}

// Path: settings.theme
class TranslationsSettingsThemeEnUs {
  TranslationsSettingsThemeEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Themes'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? 'Themes';

  /// en-US: 'Theme mode'
  String get themeMode => TranslationOverrides.string(_root.$meta, 'settings.theme.themeMode', {}) ?? 'Theme mode';

  /// en-US: 'Black background'
  String get blackBg => TranslationOverrides.string(_root.$meta, 'settings.theme.blackBg', {}) ?? 'Black background';

  /// en-US: 'Use dynamic color'
  String get useDynamicColor => TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? 'Use dynamic color';

  /// en-US: 'Android 12+ only'
  String get android12PlusOnly => TranslationOverrides.string(_root.$meta, 'settings.theme.android12PlusOnly', {}) ?? 'Android 12+ only';

  /// en-US: 'Theme'
  String get theme => TranslationOverrides.string(_root.$meta, 'settings.theme.theme', {}) ?? 'Theme';

  /// en-US: 'Primary color'
  String get primaryColor => TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? 'Primary color';

  /// en-US: 'Secondary color'
  String get secondaryColor => TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? 'Secondary color';

  /// en-US: 'Enable drawer mascot'
  String get enableDrawerMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.enableDrawerMascot', {}) ?? 'Enable drawer mascot';

  /// en-US: 'Set custom mascot'
  String get setCustomMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.setCustomMascot', {}) ?? 'Set custom mascot';

  /// en-US: 'Remove custom mascot'
  String get removeCustomMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? 'Remove custom mascot';

  /// en-US: 'Current mascot path'
  String get currentMascotPath => TranslationOverrides.string(_root.$meta, 'settings.theme.currentMascotPath', {}) ?? 'Current mascot path';

  /// en-US: 'System'
  String get system => TranslationOverrides.string(_root.$meta, 'settings.theme.system', {}) ?? 'System';

  /// en-US: 'Light'
  String get light => TranslationOverrides.string(_root.$meta, 'settings.theme.light', {}) ?? 'Light';

  /// en-US: 'Dark'
  String get dark => TranslationOverrides.string(_root.$meta, 'settings.theme.dark', {}) ?? 'Dark';

  /// en-US: 'Pink'
  String get pink => TranslationOverrides.string(_root.$meta, 'settings.theme.pink', {}) ?? 'Pink';

  /// en-US: 'Purple'
  String get purple => TranslationOverrides.string(_root.$meta, 'settings.theme.purple', {}) ?? 'Purple';

  /// en-US: 'Blue'
  String get blue => TranslationOverrides.string(_root.$meta, 'settings.theme.blue', {}) ?? 'Blue';

  /// en-US: 'Teal'
  String get teal => TranslationOverrides.string(_root.$meta, 'settings.theme.teal', {}) ?? 'Teal';

  /// en-US: 'Red'
  String get red => TranslationOverrides.string(_root.$meta, 'settings.theme.red', {}) ?? 'Red';

  /// en-US: 'Green'
  String get green => TranslationOverrides.string(_root.$meta, 'settings.theme.green', {}) ?? 'Green';

  /// en-US: 'Halloween'
  String get halloween => TranslationOverrides.string(_root.$meta, 'settings.theme.halloween', {}) ?? 'Halloween';

  /// en-US: 'Custom'
  String get custom => TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? 'Custom';

  /// en-US: 'Select color'
  String get selectColor => TranslationOverrides.string(_root.$meta, 'settings.theme.selectColor', {}) ?? 'Select color';

  /// en-US: 'Selected color'
  String get selectedColor => TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColor', {}) ?? 'Selected color';

  /// en-US: 'Selected color and its shades'
  String get selectedColorAndShades =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColorAndShades', {}) ?? 'Selected color and its shades';

  /// en-US: 'Font'
  String get fontFamily => TranslationOverrides.string(_root.$meta, 'settings.theme.fontFamily', {}) ?? 'Font';

  /// en-US: 'System default'
  String get systemDefault => TranslationOverrides.string(_root.$meta, 'settings.theme.systemDefault', {}) ?? 'System default';

  /// en-US: 'View more fonts'
  String get viewMoreFonts => TranslationOverrides.string(_root.$meta, 'settings.theme.viewMoreFonts', {}) ?? 'View more fonts';

  /// en-US: 'The quick brown fox jumps over the lazy dog'
  String get fontPreviewText =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.fontPreviewText', {}) ?? 'The quick brown fox jumps over the lazy dog';

  /// en-US: 'Custom font'
  String get customFont => TranslationOverrides.string(_root.$meta, 'settings.theme.customFont', {}) ?? 'Custom font';

  /// en-US: 'Enter any Google Font name'
  String get customFontSubtitle => TranslationOverrides.string(_root.$meta, 'settings.theme.customFontSubtitle', {}) ?? 'Enter any Google Font name';

  /// en-US: 'Font name'
  String get fontName => TranslationOverrides.string(_root.$meta, 'settings.theme.fontName', {}) ?? 'Font name';

  /// en-US: 'Browse fonts at fonts.google.com'
  String get customFontHint => TranslationOverrides.string(_root.$meta, 'settings.theme.customFontHint', {}) ?? 'Browse fonts at fonts.google.com';

  /// en-US: 'Font not found'
  String get fontNotFound => TranslationOverrides.string(_root.$meta, 'settings.theme.fontNotFound', {}) ?? 'Font not found';
}

// Path: settings.viewer
class TranslationsSettingsViewerEnUs {
  TranslationsSettingsViewerEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Viewer'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? 'Viewer';

  /// en-US: 'Preload amount'
  String get preloadAmount => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadAmount', {}) ?? 'Preload amount';

  /// en-US: 'Preload size limit'
  String get preloadSizeLimit => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimit', {}) ?? 'Preload size limit';

  /// en-US: 'in GB, 0 for no limit'
  String get preloadSizeLimitSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimitSubtitle', {}) ?? 'in GB, 0 for no limit';

  /// en-US: 'Preload height limit'
  String get preloadHeightLimit => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimit', {}) ?? 'Preload height limit';

  /// en-US: 'in pixels, 0 for no limit'
  String get preloadHeightLimitSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimitSubtitle', {}) ?? 'in pixels, 0 for no limit';

  /// en-US: 'Image quality'
  String get imageQuality => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQuality', {}) ?? 'Image quality';

  /// en-US: 'Viewer scroll direction'
  String get viewerScrollDirection =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerScrollDirection', {}) ?? 'Viewer scroll direction';

  /// en-US: 'Viewer toolbar position'
  String get viewerToolbarPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerToolbarPosition', {}) ?? 'Viewer toolbar position';

  /// en-US: 'Zoom button position'
  String get zoomButtonPosition => TranslationOverrides.string(_root.$meta, 'settings.viewer.zoomButtonPosition', {}) ?? 'Zoom button position';

  /// en-US: 'Change page buttons position'
  String get changePageButtonsPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.changePageButtonsPosition', {}) ?? 'Change page buttons position';

  /// en-US: 'Hide toolbar when opening viewer'
  String get hideToolbarWhenOpeningViewer =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.hideToolbarWhenOpeningViewer', {}) ?? 'Hide toolbar when opening viewer';

  /// en-US: 'Expand details by default'
  String get expandDetailsByDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.expandDetailsByDefault', {}) ?? 'Expand details by default';

  /// en-US: 'Hide translation notes by default'
  String get hideTranslationNotesByDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.hideTranslationNotesByDefault', {}) ?? 'Hide translation notes by default';

  /// en-US: 'Enable rotation'
  String get enableRotation => TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotation', {}) ?? 'Enable rotation';

  /// en-US: 'Double tap to reset'
  String get enableRotationSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotationSubtitle', {}) ?? 'Double tap to reset';

  /// en-US: 'Toolbar buttons order'
  String get toolbarButtonsOrder => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarButtonsOrder', {}) ?? 'Toolbar buttons order';

  /// en-US: 'Buttons order'
  String get buttonsOrder => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonsOrder', {}) ?? 'Buttons order';

  /// en-US: 'Long press to change item order.'
  String get longPressToChangeItemOrder =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToChangeItemOrder', {}) ?? 'Long press to change item order.';

  /// en-US: 'At least 4 buttons from this list will be always visible on Toolbar.'
  String get atLeast4ButtonsVisibleOnToolbar =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.atLeast4ButtonsVisibleOnToolbar', {}) ??
      'At least 4 buttons from this list will be always visible on Toolbar.';

  /// en-US: 'Other buttons will go into overflow (three dots) menu.'
  String get otherButtonsWillGoIntoOverflow =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.otherButtonsWillGoIntoOverflow', {}) ??
      'Other buttons will go into overflow (three dots) menu.';

  /// en-US: 'Long press to move items'
  String get longPressToMoveItems =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToMoveItems', {}) ?? 'Long press to move items';

  /// en-US: 'Only for videos'
  String get onlyForVideos => TranslationOverrides.string(_root.$meta, 'settings.viewer.onlyForVideos', {}) ?? 'Only for videos';

  /// en-US: 'This button cannot be disabled'
  String get thisButtonCannotBeDisabled =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.thisButtonCannotBeDisabled', {}) ?? 'This button cannot be disabled';

  /// en-US: 'Default share action'
  String get defaultShareAction => TranslationOverrides.string(_root.$meta, 'settings.viewer.defaultShareAction', {}) ?? 'Default share action';

  /// en-US: 'Share actions'
  String get shareActions => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActions', {}) ?? 'Share actions';

  /// en-US: '- Ask - always ask what to share'
  String get shareActionsAsk => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsAsk', {}) ?? '- Ask - always ask what to share';

  /// en-US: '- Post URL'
  String get shareActionsPostURL => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURL', {}) ?? '- Post URL';

  /// en-US: '- File URL - shares direct link to the original file (may not work with some sites)'
  String get shareActionsFileURL =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFileURL', {}) ??
      '- File URL - shares direct link to the original file (may not work with some sites)';

  /// en-US: '- Post URL/File URL/File with tags - shares url/file and tags which you select'
  String get shareActionsPostURLFileURLFileWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURLFileURLFileWithTags', {}) ??
      '- Post URL/File URL/File with tags - shares url/file and tags which you select';

  /// en-US: '- File - shares the file itself, may take some time to load, progress will be shown on the Share button'
  String get shareActionsFile =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFile', {}) ??
      '- File - shares the file itself, may take some time to load, progress will be shown on the Share button';

  /// en-US: '- Hydrus - sends the post url to Hydrus for import'
  String get shareActionsHydrus =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsHydrus', {}) ?? '- Hydrus - sends the post url to Hydrus for import';

  /// en-US: '[Note]: If File is saved in cache, it will be loaded from there. Otherwise it will be loaded again from network.'
  String get shareActionsNoteIfFileSavedInCache =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsNoteIfFileSavedInCache', {}) ??
      '[Note]: If File is saved in cache, it will be loaded from there. Otherwise it will be loaded again from network.';

  /// en-US: '[Tip]: You can open Share actions menu by long pressing Share button.'
  String get shareActionsTip =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsTip', {}) ??
      '[Tip]: You can open Share actions menu by long pressing Share button.';

  /// en-US: 'Use volume buttons for scrolling'
  String get useVolumeButtonsForScrolling =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.useVolumeButtonsForScrolling', {}) ?? 'Use volume buttons for scrolling';

  /// en-US: 'Volume buttons scrolling'
  String get volumeButtonsScrolling =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrolling', {}) ?? 'Volume buttons scrolling';

  /// en-US: 'Use volume buttons to scroll through previews and viewer'
  String get volumeButtonsScrollingHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollingHelp', {}) ??
      'Use volume buttons to scroll through previews and viewer';

  /// en-US: ' - Volume Down - next item'
  String get volumeButtonsVolumeDown =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeDown', {}) ?? ' - Volume Down - next item';

  /// en-US: ' - Volume Up - previous item'
  String get volumeButtonsVolumeUp =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeUp', {}) ?? ' - Volume Up - previous item';

  /// en-US: 'In viewer:'
  String get volumeButtonsInViewer => TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsInViewer', {}) ?? 'In viewer:';

  /// en-US: ' - Toolbar visible - controls volume'
  String get volumeButtonsToolbarVisible =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarVisible', {}) ?? ' - Toolbar visible - controls volume';

  /// en-US: ' - Toolbar hidden - controls scrolling'
  String get volumeButtonsToolbarHidden =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarHidden', {}) ?? ' - Toolbar hidden - controls scrolling';

  /// en-US: 'Volume buttons scroll speed'
  String get volumeButtonsScrollSpeed =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollSpeed', {}) ?? 'Volume buttons scroll speed';

  /// en-US: 'Slideshow duration (in ms)'
  String get slideshowDurationInMs =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowDurationInMs', {}) ?? 'Slideshow duration (in ms)';

  /// en-US: 'Slideshow'
  String get slideshow => TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshow', {}) ?? 'Slideshow';

  /// en-US: '[WIP] Videos/GIFs: manual scroll only'
  String get slideshowWIPNote =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowWIPNote', {}) ?? '[WIP] Videos/GIFs: manual scroll only';

  /// en-US: 'Prevent device from sleeping'
  String get preventDeviceFromSleeping =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preventDeviceFromSleeping', {}) ?? 'Prevent device from sleeping';

  /// en-US: 'Viewer open/close animation'
  String get viewerOpenCloseAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerOpenCloseAnimation', {}) ?? 'Viewer open/close animation';

  /// en-US: 'Viewer page change animation'
  String get viewerPageChangeAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerPageChangeAnimation', {}) ?? 'Viewer page change animation';

  /// en-US: 'Using default animation'
  String get usingDefaultAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.usingDefaultAnimation', {}) ?? 'Using default animation';

  /// en-US: 'Using custom animation'
  String get usingCustomAnimation => TranslationOverrides.string(_root.$meta, 'settings.viewer.usingCustomAnimation', {}) ?? 'Using custom animation';

  /// en-US: 'Kanna loading GIF'
  String get kannaLoadingGif => TranslationOverrides.string(_root.$meta, 'settings.viewer.kannaLoadingGif', {}) ?? 'Kanna loading GIF';

  late final TranslationsSettingsViewerImageQualityValuesEnUs imageQualityValues = TranslationsSettingsViewerImageQualityValuesEnUs.internal(_root);
  late final TranslationsSettingsViewerScrollDirectionValuesEnUs scrollDirectionValues = TranslationsSettingsViewerScrollDirectionValuesEnUs.internal(
    _root,
  );
  late final TranslationsSettingsViewerToolbarPositionValuesEnUs toolbarPositionValues = TranslationsSettingsViewerToolbarPositionValuesEnUs.internal(
    _root,
  );
  late final TranslationsSettingsViewerButtonPositionValuesEnUs buttonPositionValues = TranslationsSettingsViewerButtonPositionValuesEnUs.internal(
    _root,
  );
  late final TranslationsSettingsViewerShareActionValuesEnUs shareActionValues = TranslationsSettingsViewerShareActionValuesEnUs.internal(_root);
}

// Path: settings.video
class TranslationsSettingsVideoEnUs {
  TranslationsSettingsVideoEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Video'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? 'Video';

  /// en-US: 'Disable videos'
  String get disableVideos => TranslationOverrides.string(_root.$meta, 'settings.video.disableVideos', {}) ?? 'Disable videos';

  /// en-US: 'Useful on low end devices that crash when trying to load videos. Gives options to view video in external player or browser instead.'
  String get disableVideosHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.disableVideosHelp', {}) ??
      'Useful on low end devices that crash when trying to load videos. Gives options to view video in external player or browser instead.';

  /// en-US: 'Autoplay videos'
  String get autoplayVideos => TranslationOverrides.string(_root.$meta, 'settings.video.autoplayVideos', {}) ?? 'Autoplay videos';

  /// en-US: 'Start videos muted'
  String get startVideosMuted => TranslationOverrides.string(_root.$meta, 'settings.video.startVideosMuted', {}) ?? 'Start videos muted';

  /// en-US: '[Experimental]'
  String get experimental => TranslationOverrides.string(_root.$meta, 'settings.video.experimental', {}) ?? '[Experimental]';

  /// en-US: 'Video player backend'
  String get videoPlayerBackend => TranslationOverrides.string(_root.$meta, 'settings.video.videoPlayerBackend', {}) ?? 'Video player backend';

  /// en-US: 'Default'
  String get backendDefault => TranslationOverrides.string(_root.$meta, 'settings.video.backendDefault', {}) ?? 'Default';

  /// en-US: 'MPV'
  String get backendMPV => TranslationOverrides.string(_root.$meta, 'settings.video.backendMPV', {}) ?? 'MPV';

  /// en-US: 'MDK'
  String get backendMDK => TranslationOverrides.string(_root.$meta, 'settings.video.backendMDK', {}) ?? 'MDK';

  /// en-US: 'Based on exoplayer. Has best device compatibility, may have issues with 4K videos, some codecs or older devices'
  String get backendDefaultHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendDefaultHelp', {}) ??
      'Based on exoplayer. Has best device compatibility, may have issues with 4K videos, some codecs or older devices';

  /// en-US: 'Based on libmpv, has advanced settings which may help fix problems with some codecs/devices [MAY CAUSE CRASHES]'
  String get backendMPVHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendMPVHelp', {}) ??
      'Based on libmpv, has advanced settings which may help fix problems with some codecs/devices\n[MAY CAUSE CRASHES]';

  /// en-US: 'Based on libmdk, may have better performance for some codecs/devices [MAY CAUSE CRASHES]'
  String get backendMDKHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendMDKHelp', {}) ??
      'Based on libmdk, may have better performance for some codecs/devices\n[MAY CAUSE CRASHES]';

  /// en-US: 'Try different values of 'MPV' settings below if videos don't work correctly or give codec errors:'
  String get mpvSettingsHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.mpvSettingsHelp', {}) ??
      'Try different values of \'MPV\' settings below if videos don\'t work correctly or give codec errors:';

  /// en-US: 'MPV: use hardware acceleration'
  String get mpvUseHardwareAcceleration =>
      TranslationOverrides.string(_root.$meta, 'settings.video.mpvUseHardwareAcceleration', {}) ?? 'MPV: use hardware acceleration';

  /// en-US: 'MPV: VO'
  String get mpvVO => TranslationOverrides.string(_root.$meta, 'settings.video.mpvVO', {}) ?? 'MPV: VO';

  /// en-US: 'MPV: HWDEC'
  String get mpvHWDEC => TranslationOverrides.string(_root.$meta, 'settings.video.mpvHWDEC', {}) ?? 'MPV: HWDEC';

  /// en-US: 'Video cache mode'
  String get videoCacheMode => TranslationOverrides.string(_root.$meta, 'settings.video.videoCacheMode', {}) ?? 'Video cache mode';

  late final TranslationsSettingsVideoCacheModesEnUs cacheModes = TranslationsSettingsVideoCacheModesEnUs.internal(_root);
  late final TranslationsSettingsVideoCacheModeValuesEnUs cacheModeValues = TranslationsSettingsVideoCacheModeValuesEnUs.internal(_root);
  late final TranslationsSettingsVideoVideoBackendModeValuesEnUs videoBackendModeValues =
      TranslationsSettingsVideoVideoBackendModeValuesEnUs.internal(_root);
}

// Path: settings.downloads
class TranslationsSettingsDownloadsEnUs {
  TranslationsSettingsDownloadsEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'From next item in queue'
  String get fromNextItemInQueue =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.fromNextItemInQueue', {}) ?? 'From next item in queue';

  /// en-US: 'Please provide storage permission in order to download files'
  String get pleaseProvideStoragePermission =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.pleaseProvideStoragePermission', {}) ??
      'Please provide storage permission in order to download files';

  /// en-US: 'No items selected'
  String get noItemsSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsSelected', {}) ?? 'No items selected';

  /// en-US: 'No items in queue'
  String get noItemsQueued => TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsQueued', {}) ?? 'No items in queue';

  /// en-US: 'Batch'
  String get batch => TranslationOverrides.string(_root.$meta, 'settings.downloads.batch', {}) ?? 'Batch';

  /// en-US: 'Snatch selected'
  String get snatchSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? 'Snatch selected';

  /// en-US: 'Remove snatched status from selected'
  String get removeSnatchedStatusFromSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ?? 'Remove snatched status from selected';

  /// en-US: 'Favorite selected'
  String get favouriteSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? 'Favorite selected';

  /// en-US: 'Unfavorite selected'
  String get unfavouriteSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? 'Unfavorite selected';

  /// en-US: 'Clear selected'
  String get clearSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? 'Clear selected';

  /// en-US: 'Updating data…'
  String get updatingData => TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? 'Updating data…';
}

// Path: settings.database
class TranslationsSettingsDatabaseEnUs {
  TranslationsSettingsDatabaseEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Database'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? 'Database';

  /// en-US: 'Indexing database'
  String get indexingDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? 'Indexing database';

  /// en-US: 'Dropping indexes'
  String get droppingIndexes => TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? 'Dropping indexes';

  /// en-US: 'Enable database'
  String get enableDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.enableDatabase', {}) ?? 'Enable database';

  /// en-US: 'Enable indexing'
  String get enableIndexing => TranslationOverrides.string(_root.$meta, 'settings.database.enableIndexing', {}) ?? 'Enable indexing';

  /// en-US: 'Enable search history'
  String get enableSearchHistory => TranslationOverrides.string(_root.$meta, 'settings.database.enableSearchHistory', {}) ?? 'Enable search history';

  /// en-US: 'Enable tag type fetching'
  String get enableTagTypeFetching =>
      TranslationOverrides.string(_root.$meta, 'settings.database.enableTagTypeFetching', {}) ?? 'Enable tag type fetching';

  /// en-US: 'Sankaku type to update'
  String get sankakuTypeToUpdate => TranslationOverrides.string(_root.$meta, 'settings.database.sankakuTypeToUpdate', {}) ?? 'Sankaku type to update';

  /// en-US: 'Search query'
  String get searchQuery => TranslationOverrides.string(_root.$meta, 'settings.database.searchQuery', {}) ?? 'Search query';

  /// en-US: '(optional, may make the process slower)'
  String get searchQueryOptional =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchQueryOptional', {}) ?? '(optional, may make the process slower)';

  /// en-US: 'Can't leave the page right now!'
  String get cantLeavePageNow =>
      TranslationOverrides.string(_root.$meta, 'settings.database.cantLeavePageNow', {}) ?? 'Can\'t leave the page right now!';

  /// en-US: 'Sankaku data is being updated, wait until it ends or cancel manually at the bottom of the page'
  String get sankakuDataUpdating =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDataUpdating', {}) ??
      'Sankaku data is being updated, wait until it ends or cancel manually at the bottom of the page';

  /// en-US: 'Please wait!'
  String get pleaseWaitTitle => TranslationOverrides.string(_root.$meta, 'settings.database.pleaseWaitTitle', {}) ?? 'Please wait!';

  /// en-US: 'Indexes are being changed'
  String get indexesBeingChanged =>
      TranslationOverrides.string(_root.$meta, 'settings.database.indexesBeingChanged', {}) ?? 'Indexes are being changed';

  /// en-US: 'Stores favourites and tracks snatched items'
  String get databaseInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfo', {}) ?? 'Stores favourites and tracks snatched items';

  /// en-US: 'Snatched items won't be re-downloaded'
  String get databaseInfoSnatch =>
      TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfoSnatch', {}) ?? 'Snatched items won\'t be re-downloaded';

  /// en-US: 'Speeds up database searches but uses more disk space (up to 2x). Don't leave page or close app while indexing.'
  String get indexingInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.indexingInfo', {}) ??
      'Speeds up database searches but uses more disk space (up to 2x).\n\nDon\'t leave page or close app while indexing.';

  /// en-US: 'Create Indexes [Debug]'
  String get createIndexesDebug => TranslationOverrides.string(_root.$meta, 'settings.database.createIndexesDebug', {}) ?? 'Create Indexes [Debug]';

  /// en-US: 'Drop Indexes [Debug]'
  String get dropIndexesDebug => TranslationOverrides.string(_root.$meta, 'settings.database.dropIndexesDebug', {}) ?? 'Drop Indexes [Debug]';

  /// en-US: 'Requires database to be enabled.'
  String get searchHistoryInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryInfo', {}) ?? 'Requires database to be enabled.';

  /// en-US: 'Saves last ${limit: int} searches'
  String searchHistoryRecords({required int limit}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryRecords', {'limit': limit}) ?? 'Saves last ${limit} searches';

  /// en-US: 'Tap entry for actions (Delete, Favourite…)'
  String get searchHistoryTapInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryTapInfo', {}) ?? 'Tap entry for actions (Delete, Favourite…)';

  /// en-US: 'Favourited queries are pinned to the top of the list and will not be counted towards the limit.'
  String get searchHistoryFavouritesInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryFavouritesInfo', {}) ??
      'Favourited queries are pinned to the top of the list and will not be counted towards the limit.';

  /// en-US: 'Fetches tag types from supported boorus'
  String get tagTypeFetchingInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingInfo', {}) ?? 'Fetches tag types from supported boorus';

  /// en-US: 'May cause rate limiting'
  String get tagTypeFetchingWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingWarning', {}) ?? 'May cause rate limiting';

  /// en-US: 'Delete database'
  String get deleteDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabase', {}) ?? 'Delete database';

  /// en-US: 'Delete database?'
  String get deleteDatabaseConfirm => TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabaseConfirm', {}) ?? 'Delete database?';

  /// en-US: 'Database deleted!'
  String get databaseDeleted => TranslationOverrides.string(_root.$meta, 'settings.database.databaseDeleted', {}) ?? 'Database deleted!';

  /// en-US: 'An app restart is required!'
  String get appRestartRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.database.appRestartRequired', {}) ?? 'An app restart is required!';

  /// en-US: 'Clear snatched items'
  String get clearSnatchedItems => TranslationOverrides.string(_root.$meta, 'settings.database.clearSnatchedItems', {}) ?? 'Clear snatched items';

  /// en-US: 'Clear all snatched items?'
  String get clearAllSnatchedConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearAllSnatchedConfirm', {}) ?? 'Clear all snatched items?';

  /// en-US: 'Snatched items cleared'
  String get snatchedItemsCleared =>
      TranslationOverrides.string(_root.$meta, 'settings.database.snatchedItemsCleared', {}) ?? 'Snatched items cleared';

  /// en-US: 'An app restart may be required!'
  String get appRestartMayBeRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.database.appRestartMayBeRequired', {}) ?? 'An app restart may be required!';

  /// en-US: 'Clear favourited items'
  String get clearFavouritedItems =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearFavouritedItems', {}) ?? 'Clear favourited items';

  /// en-US: 'Clear all favourited items?'
  String get clearAllFavouritedConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearAllFavouritedConfirm', {}) ?? 'Clear all favourited items?';

  /// en-US: 'Favourites cleared'
  String get favouritesCleared => TranslationOverrides.string(_root.$meta, 'settings.database.favouritesCleared', {}) ?? 'Favourites cleared';

  /// en-US: 'Clear search history'
  String get clearSearchHistory => TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistory', {}) ?? 'Clear search history';

  /// en-US: 'Clear search history?'
  String get clearSearchHistoryConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistoryConfirm', {}) ?? 'Clear search history?';

  /// en-US: 'Search history cleared'
  String get searchHistoryCleared =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryCleared', {}) ?? 'Search history cleared';

  /// en-US: 'Sankaku favourites update'
  String get sankakuFavouritesUpdate =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdate', {}) ?? 'Sankaku favourites update';

  /// en-US: 'Sankaku favourites update started'
  String get sankakuFavouritesUpdateStarted =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateStarted', {}) ?? 'Sankaku favourites update started';

  /// en-US: 'New image urls will be fetched for Sankaku items in your favourites'
  String get sankakuNewUrlsInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuNewUrlsInfo', {}) ??
      'New image urls will be fetched for Sankaku items in your favourites';

  /// en-US: 'Don't leave this page until the process is complete or stopped'
  String get sankakuDontLeavePage =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDontLeavePage', {}) ??
      'Don\'t leave this page until the process is complete or stopped';

  /// en-US: 'No Sankaku config found!'
  String get noSankakuConfigFound =>
      TranslationOverrides.string(_root.$meta, 'settings.database.noSankakuConfigFound', {}) ?? 'No Sankaku config found!';

  /// en-US: 'Sankaku favourites update complete'
  String get sankakuFavouritesUpdateComplete =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateComplete', {}) ?? 'Sankaku favourites update complete';

  /// en-US: 'Failed item purge started'
  String get failedItemsPurgeStartedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeStartedTitle', {}) ?? 'Failed item purge started';

  /// en-US: 'Items that failed to update will be removed from the database'
  String get failedItemsPurgeInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeInfo', {}) ??
      'Items that failed to update will be removed from the database';

  /// en-US: 'Update Sankaku URLs'
  String get updateSankakuUrls => TranslationOverrides.string(_root.$meta, 'settings.database.updateSankakuUrls', {}) ?? 'Update Sankaku URLs';

  /// en-US: 'Updating ${count: int} items:'
  String updating({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.updating', {'count': count}) ?? 'Updating ${count} items:';

  /// en-US: 'Left: ${count: int}'
  String left({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.left', {'count': count}) ?? 'Left: ${count}';

  /// en-US: 'Done: ${count: int}'
  String done({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.done', {'count': count}) ?? 'Done: ${count}';

  /// en-US: 'Failed/Skipped: ${count: int}'
  String failedSkipped({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedSkipped', {'count': count}) ?? 'Failed/Skipped: ${count}';

  /// en-US: 'Stop and try again later if you start seeing 'Failed' number constantly growing, you could have reached rate limit and/or Sankaku blocks requests from your IP.'
  String get sankakuRateLimitWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuRateLimitWarning', {}) ??
      'Stop and try again later if you start seeing \'Failed\' number constantly growing, you could have reached rate limit and/or Sankaku blocks requests from your IP.';

  /// en-US: 'Press here to skip current item'
  String get skipCurrentItem =>
      TranslationOverrides.string(_root.$meta, 'settings.database.skipCurrentItem', {}) ?? 'Press here to skip current item';

  /// en-US: 'Use if item appears to be stuck'
  String get useIfStuck => TranslationOverrides.string(_root.$meta, 'settings.database.useIfStuck', {}) ?? 'Use if item appears to be stuck';

  /// en-US: 'Press here to stop'
  String get pressToStop => TranslationOverrides.string(_root.$meta, 'settings.database.pressToStop', {}) ?? 'Press here to stop';

  /// en-US: 'Purge failed items (${count: int})'
  String purgeFailedItems({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.purgeFailedItems', {'count': count}) ?? 'Purge failed items (${count})';

  /// en-US: 'Retry failed items (${count: int})'
  String retryFailedItems({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.retryFailedItems', {'count': count}) ?? 'Retry failed items (${count})';
}

// Path: settings.backupAndRestore
class TranslationsSettingsBackupAndRestoreEnUs {
  TranslationsSettingsBackupAndRestoreEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Backup & Restore'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.title', {}) ?? 'Backup & Restore';

  /// en-US: 'Duplicate file detected!'
  String get duplicateFileDetectedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedTitle', {}) ?? 'Duplicate file detected!';

  /// en-US: 'The file ${fileName: String} already exists. Do you want to overwrite it? If you choose no, the backup will be cancelled.'
  String duplicateFileDetectedMsg({required String fileName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
      'The file ${fileName} already exists. Do you want to overwrite it? If you choose no, the backup will be cancelled.';

  /// en-US: 'This feature is only available on Android, on Desktop builds you can just copy/paste files from/to app's data folder, respective to your system'
  String get androidOnlyFeatureMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ??
      'This feature is only available on Android, on Desktop builds you can just copy/paste files from/to app\'s data folder, respective to your system';

  /// en-US: 'Select backup directory'
  String get selectBackupDir =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? 'Select backup directory';

  /// en-US: 'Failed to get backup path'
  String get failedToGetBackupPath =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ?? 'Failed to get backup path';

  /// en-US: 'Backup path is: ${backupPath: String}'
  String backupPathMsg({required String backupPath}) =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ??
      'Backup path is: ${backupPath}';

  /// en-US: 'No backup directory selected'
  String get noBackupDirSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ?? 'No backup directory selected';

  /// en-US: 'Files must be in directory root'
  String get restoreInfoMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ?? 'Files must be in directory root';

  /// en-US: 'Backup settings'
  String get backupSettings => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? 'Backup settings';

  /// en-US: 'Restore settings'
  String get restoreSettings => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? 'Restore settings';

  /// en-US: 'Settings backed up to settings.json'
  String get settingsBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ?? 'Settings backed up to settings.json';

  /// en-US: 'Settings restored from backup'
  String get settingsRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? 'Settings restored from backup';

  /// en-US: 'Failed to backup settings'
  String get backupSettingsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ?? 'Failed to backup settings';

  /// en-US: 'Failed to restore settings'
  String get restoreSettingsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ?? 'Failed to restore settings';

  /// en-US: 'Reset backup directory'
  String get resetBackupDir => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.resetBackupDir', {}) ?? 'Reset backup directory';

  /// en-US: 'Backup boorus'
  String get backupBoorus => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ?? 'Backup boorus';

  /// en-US: 'Restore boorus'
  String get restoreBoorus => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? 'Restore boorus';

  /// en-US: 'Boorus backed up to boorus.json'
  String get boorusBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ?? 'Boorus backed up to boorus.json';

  /// en-US: 'Boorus restored from backup'
  String get boorusRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ?? 'Boorus restored from backup';

  /// en-US: 'Failed to backup boorus'
  String get backupBoorusError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ?? 'Failed to backup boorus';

  /// en-US: 'Failed to restore boorus'
  String get restoreBoorusError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ?? 'Failed to restore boorus';

  /// en-US: 'Backup database'
  String get backupDatabase => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? 'Backup database';

  /// en-US: 'Restore database'
  String get restoreDatabase => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? 'Restore database';

  /// en-US: 'May take a while depending on the size of the database, will restart the app on success'
  String get restoreDatabaseInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ??
      'May take a while depending on the size of the database, will restart the app on success';

  /// en-US: 'Database backed up to store.db'
  String get databaseBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ?? 'Database backed up to store.db';

  /// en-US: 'Database restored from backup! App will restart in a few seconds!'
  String get databaseRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ??
      'Database restored from backup! App will restart in a few seconds!';

  /// en-US: 'Failed to backup database'
  String get backupDatabaseError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ?? 'Failed to backup database';

  /// en-US: 'Failed to restore database'
  String get restoreDatabaseError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ?? 'Failed to restore database';

  /// en-US: 'Database file not found or cannot be read!'
  String get databaseFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ?? 'Database file not found or cannot be read!';

  /// en-US: 'Backup tags'
  String get backupTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? 'Backup tags';

  /// en-US: 'Restore tags'
  String get restoreTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? 'Restore tags';

  /// en-US: 'May take a while if you have a lot of tags. If you did a database restore, you don't need to do this because it's already included in the database'
  String get restoreTagsInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ??
      'May take a while if you have a lot of tags. If you did a database restore, you don\'t need to do this because it\'s already included in the database';

  /// en-US: 'Tags backed up to tags.json'
  String get tagsBackedUp => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? 'Tags backed up to tags.json';

  /// en-US: 'Tags restored from backup'
  String get tagsRestored => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? 'Tags restored from backup';

  /// en-US: 'Failed to backup tags'
  String get backupTagsError => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? 'Failed to backup tags';

  /// en-US: 'Failed to restore tags'
  String get restoreTagsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? 'Failed to restore tags';

  /// en-US: 'Tags file not found or cannot be read!'
  String get tagsFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsFileNotFound', {}) ?? 'Tags file not found or cannot be read!';

  /// en-US: 'Press Hide below if it takes too long, operation will continue in background'
  String get operationTakesTooLongMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.operationTakesTooLongMsg', {}) ??
      'Press Hide below if it takes too long, operation will continue in background';

  /// en-US: 'Backup file not found or cannot be read!'
  String get backupFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupFileNotFound', {}) ?? 'Backup file not found or cannot be read!';

  /// en-US: 'No access to backup directory!'
  String get backupDirNoAccess =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDirNoAccess', {}) ?? 'No access to backup directory!';

  /// en-US: 'Backup cancelled'
  String get backupCancelled => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? 'Backup cancelled';
}

// Path: settings.network
class TranslationsSettingsNetworkEnUs {
  TranslationsSettingsNetworkEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Network'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? 'Network';

  /// en-US: 'Enable self signed SSL certificates'
  String get enableSelfSignedSSLCertificates =>
      TranslationOverrides.string(_root.$meta, 'settings.network.enableSelfSignedSSLCertificates', {}) ?? 'Enable self signed SSL certificates';

  /// en-US: 'Proxy'
  String get proxy => TranslationOverrides.string(_root.$meta, 'settings.network.proxy', {}) ?? 'Proxy';

  /// en-US: 'Does not apply to streaming video mode, use caching video mode instead'
  String get proxySubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.network.proxySubtitle', {}) ??
      'Does not apply to streaming video mode, use caching video mode instead';

  /// en-US: 'Custom User-Agent'
  String get customUserAgent => TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgent', {}) ?? 'Custom User-Agent';

  /// en-US: 'Custom User-Agent'
  String get customUserAgentTitle => TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgentTitle', {}) ?? 'Custom User-Agent';

  /// en-US: 'Keep empty to use default value'
  String get keepEmptyForDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.network.keepEmptyForDefault', {}) ?? 'Keep empty to use default value';

  /// en-US: 'Default: ${agent: String}'
  String defaultUserAgent({required String agent}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.defaultUserAgent', {'agent': agent}) ?? 'Default: ${agent}';

  /// en-US: 'Used for most booru requests and webview'
  String get userAgentUsedOnRequests =>
      TranslationOverrides.string(_root.$meta, 'settings.network.userAgentUsedOnRequests', {}) ?? 'Used for most booru requests and webview';

  /// en-US: 'Saved on page exit'
  String get valueSavedAfterLeaving =>
      TranslationOverrides.string(_root.$meta, 'settings.network.valueSavedAfterLeaving', {}) ?? 'Saved on page exit';

  /// en-US: 'Tap here to use Chrome browser User-Agent (recommended only when site bans non-browser user agents)'
  String get setBrowserUserAgent =>
      TranslationOverrides.string(_root.$meta, 'settings.network.setBrowserUserAgent', {}) ??
      'Tap here to use Chrome browser User-Agent (recommended only when site bans non-browser user agents)';

  /// en-US: 'Cookie cleaner'
  String get cookieCleaner => TranslationOverrides.string(_root.$meta, 'settings.network.cookieCleaner', {}) ?? 'Cookie cleaner';

  /// en-US: 'Select a booru to clear cookies for or leave empty to clear all'
  String get selectBooruToClearCookies =>
      TranslationOverrides.string(_root.$meta, 'settings.network.selectBooruToClearCookies', {}) ??
      'Select a booru to clear cookies for or leave empty to clear all';

  /// en-US: 'Cookies for ${booruName: String}:'
  String cookiesFor({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookiesFor', {'booruName': booruName}) ?? 'Cookies for ${booruName}:';

  /// en-US: '«${cookieName: String}» cookie deleted'
  String cookieDeleted({required String cookieName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookieDeleted', {'cookieName': cookieName}) ?? '«${cookieName}» cookie deleted';

  /// en-US: 'Clear cookies'
  String get clearCookies => TranslationOverrides.string(_root.$meta, 'settings.network.clearCookies', {}) ?? 'Clear cookies';

  /// en-US: 'Clear cookies for ${booruName: String}'
  String clearCookiesFor({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.clearCookiesFor', {'booruName': booruName}) ?? 'Clear cookies for ${booruName}';

  /// en-US: 'Cookies for ${booruName: String} deleted'
  String cookiesForBooruDeleted({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookiesForBooruDeleted', {'booruName': booruName}) ??
      'Cookies for ${booruName} deleted';

  /// en-US: 'All cookies deleted'
  String get allCookiesDeleted => TranslationOverrides.string(_root.$meta, 'settings.network.allCookiesDeleted', {}) ?? 'All cookies deleted';
}

// Path: settings.privacy
class TranslationsSettingsPrivacyEnUs {
  TranslationsSettingsPrivacyEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Privacy'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? 'Privacy';

  /// en-US: 'App lock'
  String get appLock => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? 'App lock';

  /// en-US: 'Lock app manually or after idle timeout. Requires PIN/biometrics'
  String get appLockMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ??
      'Lock app manually or after idle timeout. Requires PIN/biometrics';

  /// en-US: 'Auto lock after'
  String get autoLockAfter => TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfter', {}) ?? 'Auto lock after';

  /// en-US: 'in seconds, 0 to disable'
  String get autoLockAfterTip => TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfterTip', {}) ?? 'in seconds, 0 to disable';

  /// en-US: 'Blur screen when leaving the app'
  String get bluronLeave => TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeave', {}) ?? 'Blur screen when leaving the app';

  /// en-US: 'May not work on some devices due to system limitations'
  String get bluronLeaveMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeaveMsg', {}) ?? 'May not work on some devices due to system limitations';

  /// en-US: 'Incognito keyboard'
  String get incognitoKeyboard => TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboard', {}) ?? 'Incognito keyboard';

  /// en-US: 'Prevents keyboard from saving typing history. Applied to most text inputs'
  String get incognitoKeyboardMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboardMsg', {}) ??
      'Prevents keyboard from saving typing history.\nApplied to most text inputs';

  /// en-US: 'App display name'
  String get appDisplayName => TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayName', {}) ?? 'App display name';

  /// en-US: 'Change how the app name appears in your launcher'
  String get appDisplayNameDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayNameDescription', {}) ??
      'Change how the app name appears in your launcher';

  /// en-US: 'App name changed'
  String get appAliasChanged => TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChanged', {}) ?? 'App name changed';

  /// en-US: 'The app name change will take effect after restarting the app. Some launchers may need additional time or system reboot to update.'
  String get appAliasRestartHint =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasRestartHint', {}) ??
      'The app name change will take effect after restarting the app. Some launchers may need additional time or system reboot to update.';

  /// en-US: 'Failed to change app name. Please try again.'
  String get appAliasChangeFailed =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChangeFailed', {}) ?? 'Failed to change app name. Please try again.';

  /// en-US: 'Restart now'
  String get restartNow => TranslationOverrides.string(_root.$meta, 'settings.privacy.restartNow', {}) ?? 'Restart now';
}

// Path: settings.performance
class TranslationsSettingsPerformanceEnUs {
  TranslationsSettingsPerformanceEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Performance'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.performance.title', {}) ?? 'Performance';

  /// en-US: 'Low performance mode'
  String get lowPerformanceMode => TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceMode', {}) ?? 'Low performance mode';

  /// en-US: 'Recommended for old devices and devices with low RAM'
  String get lowPerformanceModeSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeSubtitle', {}) ??
      'Recommended for old devices and devices with low RAM';

  /// en-US: 'Low performance mode'
  String get lowPerformanceModeDialogTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogTitle', {}) ?? 'Low performance mode';

  /// en-US: '- Disables detailed loading progress information'
  String get lowPerformanceModeDialogDisablesDetailed =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesDetailed', {}) ??
      '- Disables detailed loading progress information';

  /// en-US: '- Disables resource-intensive elements (blurs, animated opacity, some animations…)'
  String get lowPerformanceModeDialogDisablesResourceIntensive =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive', {}) ??
      '- Disables resource-intensive elements (blurs, animated opacity, some animations…)';

  /// en-US: 'Sets optimal settings for these options (you can change them separately later):'
  String get lowPerformanceModeDialogSetsOptimal =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogSetsOptimal', {}) ??
      'Sets optimal settings for these options (you can change them separately later):';

  /// en-US: 'Autoplay videos'
  String get autoplayVideos => TranslationOverrides.string(_root.$meta, 'settings.performance.autoplayVideos', {}) ?? 'Autoplay videos';

  /// en-US: 'Disable videos'
  String get disableVideos => TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideos', {}) ?? 'Disable videos';

  /// en-US: 'Useful on low end devices that crash when trying to load videos. Gives options to view video in external player or browser instead.'
  String get disableVideosHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideosHelp', {}) ??
      'Useful on low end devices that crash when trying to load videos. Gives options to view video in external player or browser instead.';
}

// Path: settings.cache
class TranslationsSettingsCacheEnUs {
  TranslationsSettingsCacheEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Snatching & Caching'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? 'Snatching & Caching';

  /// en-US: 'Snatch quality'
  String get snatchQuality => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchQuality', {}) ?? 'Snatch quality';

  /// en-US: 'Snatch cooldown (in ms)'
  String get snatchCooldown => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchCooldown', {}) ?? 'Snatch cooldown (in ms)';

  /// en-US: 'Please enter a valid timeout value'
  String get pleaseEnterAValidTimeout =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.pleaseEnterAValidTimeout', {}) ?? 'Please enter a valid timeout value';

  /// en-US: 'Please enter a value bigger than 10ms'
  String get biggerThan10 => TranslationOverrides.string(_root.$meta, 'settings.cache.biggerThan10', {}) ?? 'Please enter a value bigger than 10ms';

  /// en-US: 'Show download notifications'
  String get showDownloadNotifications =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.showDownloadNotifications', {}) ?? 'Show download notifications';

  /// en-US: 'Snatch items on favouriting'
  String get snatchItemsOnFavouriting =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.snatchItemsOnFavouriting', {}) ?? 'Snatch items on favouriting';

  /// en-US: 'Favourite items on snatching'
  String get favouriteItemsOnSnatching =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.favouriteItemsOnSnatching', {}) ?? 'Favourite items on snatching';

  /// en-US: 'Write image data to JSON on save'
  String get writeImageDataOnSave =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.writeImageDataOnSave', {}) ?? 'Write image data to JSON on save';

  /// en-US: 'Requires custom directory'
  String get requiresCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.requiresCustomStorageDirectory', {}) ?? 'Requires custom directory';

  /// en-US: 'Set storage directory'
  String get setStorageDirectory => TranslationOverrides.string(_root.$meta, 'settings.cache.setStorageDirectory', {}) ?? 'Set storage directory';

  /// en-US: 'Current: ${path: String}'
  String currentPath({required String path}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.currentPath', {'path': path}) ?? 'Current: ${path}';

  /// en-US: 'Reset storage directory'
  String get resetStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.resetStorageDirectory', {}) ?? 'Reset storage directory';

  /// en-US: 'Cache previews'
  String get cachePreviews => TranslationOverrides.string(_root.$meta, 'settings.cache.cachePreviews', {}) ?? 'Cache previews';

  /// en-US: 'Cache media'
  String get cacheMedia => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheMedia', {}) ?? 'Cache media';

  /// en-US: 'Video cache mode'
  String get videoCacheMode => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheMode', {}) ?? 'Video cache mode';

  /// en-US: 'Video cache modes'
  String get videoCacheModesTitle => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModesTitle', {}) ?? 'Video cache modes';

  /// en-US: '- Stream - Don't cache, start playing as soon as possible'
  String get videoCacheModeStream =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStream', {}) ??
      '- Stream - Don\'t cache, start playing as soon as possible';

  /// en-US: '- Cache - Saves the file to device storage, plays only when download is complete'
  String get videoCacheModeCache =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeCache', {}) ??
      '- Cache - Saves the file to device storage, plays only when download is complete';

  /// en-US: '- Stream+Cache - Mix of both, but currently leads to double download'
  String get videoCacheModeStreamCache =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStreamCache', {}) ??
      '- Stream+Cache - Mix of both, but currently leads to double download';

  /// en-US: '[Note]: Videos will cache only if 'Cache Media' is enabled.'
  String get videoCacheNoteEnable =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheNoteEnable', {}) ??
      '[Note]: Videos will cache only if \'Cache Media\' is enabled.';

  /// en-US: '[Warning]: On desktop Stream mode can work incorrectly for some Boorus.'
  String get videoCacheWarningDesktop =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheWarningDesktop', {}) ??
      '[Warning]: On desktop Stream mode can work incorrectly for some Boorus.';

  /// en-US: 'Delete cache after:'
  String get deleteCacheAfter => TranslationOverrides.string(_root.$meta, 'settings.cache.deleteCacheAfter', {}) ?? 'Delete cache after:';

  /// en-US: 'Cache size Limit (in GB)'
  String get cacheSizeLimit => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheSizeLimit', {}) ?? 'Cache size Limit (in GB)';

  /// en-US: 'Maximum total cache size'
  String get maximumTotalCacheSize =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.maximumTotalCacheSize', {}) ?? 'Maximum total cache size';

  /// en-US: 'Cache stats:'
  String get cacheStats => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheStats', {}) ?? 'Cache stats:';

  /// en-US: 'Loading…'
  String get loading => TranslationOverrides.string(_root.$meta, 'settings.cache.loading', {}) ?? 'Loading…';

  /// en-US: 'Empty'
  String get empty => TranslationOverrides.string(_root.$meta, 'settings.cache.empty', {}) ?? 'Empty';

  /// en-US: '${size: String}, ${count: int} files'
  String inFilesPlural({required String size, required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.inFilesPlural', {'size': size, 'count': count}) ?? '${size}, ${count} files';

  /// en-US: '${size: String}, 1 file'
  String inFileSingular({required String size}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.inFileSingular', {'size': size}) ?? '${size}, 1 file';

  /// en-US: 'Total'
  String get cacheTypeTotal => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeTotal', {}) ?? 'Total';

  /// en-US: 'Favicons'
  String get cacheTypeFavicons => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeFavicons', {}) ?? 'Favicons';

  /// en-US: 'Thumbnails'
  String get cacheTypeThumbnails => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeThumbnails', {}) ?? 'Thumbnails';

  /// en-US: 'Samples'
  String get cacheTypeSamples => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeSamples', {}) ?? 'Samples';

  /// en-US: 'Media'
  String get cacheTypeMedia => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeMedia', {}) ?? 'Media';

  /// en-US: 'WebView'
  String get cacheTypeWebView => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeWebView', {}) ?? 'WebView';

  /// en-US: 'Cache cleared'
  String get cacheCleared => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheCleared', {}) ?? 'Cache cleared';

  /// en-US: 'Cleared ${type: String} cache'
  String clearedCacheType({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheType', {'type': type}) ?? 'Cleared ${type} cache';

  /// en-US: 'Clear all cache'
  String get clearAllCache => TranslationOverrides.string(_root.$meta, 'settings.cache.clearAllCache', {}) ?? 'Clear all cache';

  /// en-US: 'Cleared cache completely'
  String get clearedCacheCompletely =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheCompletely', {}) ?? 'Cleared cache completely';

  /// en-US: 'App Restart may be required!'
  String get appRestartRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.appRestartRequired', {}) ?? 'App Restart may be required!';

  /// en-US: 'Error!'
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'settings.cache.errorExclamation', {}) ?? 'Error!';

  /// en-US: 'Currently not available for this platform'
  String get notAvailableForPlatform =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.notAvailableForPlatform', {}) ?? 'Currently not available for this platform';
}

// Path: settings.itemFilters
class TranslationsSettingsItemFiltersEnUs {
  TranslationsSettingsItemFiltersEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Filters'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.title', {}) ?? 'Filters';

  /// en-US: 'Hidden'
  String get hidden => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.hidden', {}) ?? 'Hidden';

  /// en-US: 'Marked'
  String get marked => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.marked', {}) ?? 'Marked';

  /// en-US: 'Duplicate filter'
  String get duplicateFilter => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.duplicateFilter', {}) ?? 'Duplicate filter';

  /// en-US: ''${tag: String}' is already in ${type: String} list'
  String alreadyInList({required String tag, required String type}) =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.alreadyInList', {'tag': tag, 'type': type}) ??
      '\'${tag}\' is already in ${type} list';

  /// en-US: 'No filters found'
  String get noFiltersFound => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersFound', {}) ?? 'No filters found';

  /// en-US: 'No filters added'
  String get noFiltersAdded => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersAdded', {}) ?? 'No filters added';

  /// en-US: 'Completely hide items which match Hidden filters'
  String get removeHidden =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeHidden', {}) ?? 'Completely hide items which match Hidden filters';

  /// en-US: 'Completely hide items which match Marked filters'
  String get removeMarked =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeMarked', {}) ?? 'Completely hide items which match Marked filters';

  /// en-US: 'Remove favourited items'
  String get removeFavourited => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeFavourited', {}) ?? 'Remove favourited items';

  /// en-US: 'Remove snatched items'
  String get removeSnatched => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeSnatched', {}) ?? 'Remove snatched items';

  /// en-US: 'Remove AI items'
  String get removeAI => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeAI', {}) ?? 'Remove AI items';
}

// Path: settings.sync
class TranslationsSettingsSyncEnUs {
  TranslationsSettingsSyncEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'LoliSync'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? 'LoliSync';

  /// en-US: 'Database must be enabled to use LoliSync'
  String get dbError => TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ?? 'Database must be enabled to use LoliSync';

  /// en-US: 'Error!'
  String get errorTitle => TranslationOverrides.string(_root.$meta, 'settings.sync.errorTitle', {}) ?? 'Error!';

  /// en-US: 'Please enter IP address and port.'
  String get pleaseEnterIPAndPort =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.pleaseEnterIPAndPort', {}) ?? 'Please enter IP address and port.';

  /// en-US: 'Select what you want to do'
  String get selectWhatYouWantToDo =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.selectWhatYouWantToDo', {}) ?? 'Select what you want to do';

  /// en-US: 'SEND data TO another device'
  String get sendDataToDevice => TranslationOverrides.string(_root.$meta, 'settings.sync.sendDataToDevice', {}) ?? 'SEND data TO another device';

  /// en-US: 'RECEIVE data FROM another device'
  String get receiveDataFromDevice =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.receiveDataFromDevice', {}) ?? 'RECEIVE data FROM another device';

  /// en-US: 'Start server on other device, enter its IP/port, then tap Start sync'
  String get senderInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.senderInstructions', {}) ??
      'Start server on other device, enter its IP/port, then tap Start sync';

  /// en-US: 'IP Address'
  String get ipAddress => TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddress', {}) ?? 'IP Address';

  /// en-US: 'Host IP Address (i.e. 192.168.1.1)'
  String get ipAddressPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddressPlaceholder', {}) ?? 'Host IP Address (i.e. 192.168.1.1)';

  /// en-US: 'Port'
  String get port => TranslationOverrides.string(_root.$meta, 'settings.sync.port', {}) ?? 'Port';

  /// en-US: 'Host Port (i.e. 7777)'
  String get portPlaceholder => TranslationOverrides.string(_root.$meta, 'settings.sync.portPlaceholder', {}) ?? 'Host Port (i.e. 7777)';

  /// en-US: 'Send favourites'
  String get sendFavourites => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavourites', {}) ?? 'Send favourites';

  /// en-US: 'Favorites: ${count: String}'
  String favouritesCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.favouritesCount', {'count': count}) ?? 'Favorites: ${count}';

  /// en-US: 'Send favourites (Legacy)'
  String get sendFavouritesLegacy => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavouritesLegacy', {}) ?? 'Send favourites (Legacy)';

  /// en-US: 'Sync favs from #…'
  String get syncFavsFrom => TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFrom', {}) ?? 'Sync favs from #…';

  /// en-US: 'Allows to set from where the sync should start from, useful if you already synced all your favs before and want to sync only the newest items'
  String get syncFavsFromHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText1', {}) ??
      'Allows to set from where the sync should start from, useful if you already synced all your favs before and want to sync only the newest items';

  /// en-US: 'If you want to sync from the beginning leave this field blank'
  String get syncFavsFromHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText2', {}) ??
      'If you want to sync from the beginning leave this field blank';

  /// en-US: 'Example: You have X amount of favs, set this field to 100, sync will start from item #100 and go until it reaches X'
  String get syncFavsFromHelpText3 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText3', {}) ??
      'Example: You have X amount of favs, set this field to 100, sync will start from item #100 and go until it reaches X';

  /// en-US: 'Order of favs: From oldest (0) to newest (X)'
  String get syncFavsFromHelpText4 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText4', {}) ?? 'Order of favs: From oldest (0) to newest (X)';

  /// en-US: 'Send snatched history'
  String get sendSnatchedHistory => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSnatchedHistory', {}) ?? 'Send snatched history';

  /// en-US: 'Snatched: ${count: String}'
  String snatchedCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.snatchedCount', {'count': count}) ?? 'Snatched: ${count}';

  /// en-US: 'Sync snatched from #…'
  String get syncSnatchedFrom => TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFrom', {}) ?? 'Sync snatched from #…';

  /// en-US: 'Allows to set from where the sync should start from, useful if you already synced all your snatched history before and want to sync only the newest items'
  String get syncSnatchedFromHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText1', {}) ??
      'Allows to set from where the sync should start from, useful if you already synced all your snatched history before and want to sync only the newest items';

  /// en-US: 'If you want to sync from the beginning leave this field blank'
  String get syncSnatchedFromHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText2', {}) ??
      'If you want to sync from the beginning leave this field blank';

  /// en-US: 'Example: You have X amount of favs, set this field to 100, sync will start from item #100 and go until it reaches X'
  String get syncSnatchedFromHelpText3 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText3', {}) ??
      'Example: You have X amount of favs, set this field to 100, sync will start from item #100 and go until it reaches X';

  /// en-US: 'Order of favs: From oldest (0) to newest (X)'
  String get syncSnatchedFromHelpText4 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText4', {}) ?? 'Order of favs: From oldest (0) to newest (X)';

  /// en-US: 'Send settings'
  String get sendSettings => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSettings', {}) ?? 'Send settings';

  /// en-US: 'Send booru configs'
  String get sendBooruConfigs => TranslationOverrides.string(_root.$meta, 'settings.sync.sendBooruConfigs', {}) ?? 'Send booru configs';

  /// en-US: 'Configs: ${count: String}'
  String configsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.configsCount', {'count': count}) ?? 'Configs: ${count}';

  /// en-US: 'Send tabs'
  String get sendTabs => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTabs', {}) ?? 'Send tabs';

  /// en-US: 'Tabs: ${count: String}'
  String tabsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsCount', {'count': count}) ?? 'Tabs: ${count}';

  /// en-US: 'Tabs sync mode'
  String get tabsSyncMode => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncMode', {}) ?? 'Tabs sync mode';

  /// en-US: 'Merge: Merge the tabs from this device on the other device, tabs with unknown boorus and already existing tabs will be ignored'
  String get tabsSyncModeMerge =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeMerge', {}) ??
      'Merge: Merge the tabs from this device on the other device, tabs with unknown boorus and already existing tabs will be ignored';

  /// en-US: 'Replace: Completely replace the tabs on the other device with the tabs from this device'
  String get tabsSyncModeReplace =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeReplace', {}) ??
      'Replace: Completely replace the tabs on the other device with the tabs from this device';

  /// en-US: 'Merge'
  String get merge => TranslationOverrides.string(_root.$meta, 'settings.sync.merge', {}) ?? 'Merge';

  /// en-US: 'Replace'
  String get replace => TranslationOverrides.string(_root.$meta, 'settings.sync.replace', {}) ?? 'Replace';

  /// en-US: 'Send tags'
  String get sendTags => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTags', {}) ?? 'Send tags';

  /// en-US: 'Tags: ${count: String}'
  String tagsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsCount', {'count': count}) ?? 'Tags: ${count}';

  /// en-US: 'Tags sync mode'
  String get tagsSyncMode => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncMode', {}) ?? 'Tags sync mode';

  /// en-US: 'Preserve type: If the tag exists with a tag type on the other device and it doesn't on this device it will be skipped'
  String get tagsSyncModePreferTypeIfNone =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModePreferTypeIfNone', {}) ??
      'Preserve type: If the tag exists with a tag type on the other device and it doesn\'t on this device it will be skipped';

  /// en-US: 'Overwrite: All tags will be added, if a tag and tag type exists on the other device it will be overwritten'
  String get tagsSyncModeOverwrite =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModeOverwrite', {}) ??
      'Overwrite: All tags will be added, if a tag and tag type exists on the other device it will be overwritten';

  /// en-US: 'Preserve type'
  String get preferTypeIfNone => TranslationOverrides.string(_root.$meta, 'settings.sync.preferTypeIfNone', {}) ?? 'Preserve type';

  /// en-US: 'Overwrite'
  String get overwrite => TranslationOverrides.string(_root.$meta, 'settings.sync.overwrite', {}) ?? 'Overwrite';

  /// en-US: 'Test connection'
  String get testConnection => TranslationOverrides.string(_root.$meta, 'settings.sync.testConnection', {}) ?? 'Test connection';

  /// en-US: 'Sends test request to other device.'
  String get testConnectionHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText1', {}) ?? 'Sends test request to other device.';

  /// en-US: 'Shows success/failure notification.'
  String get testConnectionHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText2', {}) ?? 'Shows success/failure notification.';

  /// en-US: 'Start sync'
  String get startSync => TranslationOverrides.string(_root.$meta, 'settings.sync.startSync', {}) ?? 'Start sync';

  /// en-US: 'The Port and IP fields cannot be empty!'
  String get portAndIPCannotBeEmpty =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.portAndIPCannotBeEmpty', {}) ?? 'The Port and IP fields cannot be empty!';

  /// en-US: 'You haven't selected anything to sync!'
  String get nothingSelectedToSync =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.nothingSelectedToSync', {}) ?? 'You haven\'t selected anything to sync!';

  /// en-US: 'Stats of this device:'
  String get statsOfThisDevice => TranslationOverrides.string(_root.$meta, 'settings.sync.statsOfThisDevice', {}) ?? 'Stats of this device:';

  /// en-US: 'Start server to receive data. Avoid public WiFi for security'
  String get receiverInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.receiverInstructions', {}) ??
      'Start server to receive data. Avoid public WiFi for security';

  /// en-US: 'Available network interfaces'
  String get availableNetworkInterfaces =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.availableNetworkInterfaces', {}) ?? 'Available network interfaces';

  /// en-US: 'Selected interface IP: ${ip: String}'
  String selectedInterfaceIP({required String ip}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.selectedInterfaceIP', {'ip': ip}) ?? 'Selected interface IP: ${ip}';

  /// en-US: 'Server port'
  String get serverPort => TranslationOverrides.string(_root.$meta, 'settings.sync.serverPort', {}) ?? 'Server port';

  /// en-US: '(will default to '8080' if empty)'
  String get serverPortPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.serverPortPlaceholder', {}) ?? '(will default to \'8080\' if empty)';

  /// en-US: 'Start receiver server'
  String get startReceiverServer => TranslationOverrides.string(_root.$meta, 'settings.sync.startReceiverServer', {}) ?? 'Start receiver server';
}

// Path: settings.about
class TranslationsSettingsAboutEnUs {
  TranslationsSettingsAboutEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'About'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.about.title', {}) ?? 'About';

  /// en-US: 'LoliSnatcher is open source and licensed under GPLv3 the source code is available on github. Please report any issues or feature requests in the issues section of the repo.'
  String get appDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ??
      'LoliSnatcher is open source and licensed under GPLv3 the source code is available on github. Please report any issues or feature requests in the issues section of the repo.';

  /// en-US: 'LoliSnatcher on Github'
  String get appOnGitHub => TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? 'LoliSnatcher on Github';

  /// en-US: 'Contact'
  String get contact => TranslationOverrides.string(_root.$meta, 'settings.about.contact', {}) ?? 'Contact';

  /// en-US: 'Email copied to clipboard'
  String get emailCopied => TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? 'Email copied to clipboard';

  /// en-US: 'A big thanks to Showers-U for letting us use their artwork for the app logo. Please check them out on Pixiv'
  String get logoArtistThanks =>
      TranslationOverrides.string(_root.$meta, 'settings.about.logoArtistThanks', {}) ??
      'A big thanks to Showers-U for letting us use their artwork for the app logo. Please check them out on Pixiv';

  /// en-US: 'Developers'
  String get developers => TranslationOverrides.string(_root.$meta, 'settings.about.developers', {}) ?? 'Developers';

  /// en-US: 'Releases'
  String get releases => TranslationOverrides.string(_root.$meta, 'settings.about.releases', {}) ?? 'Releases';

  /// en-US: 'Latest version and full changelogs can be found at the Github Releases page:'
  String get releasesMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.about.releasesMsg', {}) ??
      'Latest version and full changelogs can be found at the Github Releases page:';

  /// en-US: 'Licenses'
  String get licenses => TranslationOverrides.string(_root.$meta, 'settings.about.licenses', {}) ?? 'Licenses';
}

// Path: settings.checkForUpdates
class TranslationsSettingsCheckForUpdatesEnUs {
  TranslationsSettingsCheckForUpdatesEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Check for updates'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.title', {}) ?? 'Check for updates';

  /// en-US: 'Update available!'
  String get updateAvailable => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateAvailable', {}) ?? 'Update available!';

  /// en-US: 'What's new'
  String get whatsNew => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.whatsNew', {}) ?? 'What\'s new';

  /// en-US: 'Update changelog'
  String get updateChangelog => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? 'Update changelog';

  /// en-US: 'Update check error!'
  String get updateCheckError => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? 'Update check error!';

  /// en-US: 'You have the latest version'
  String get youHaveLatestVersion =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? 'You have the latest version';

  /// en-US: 'View latest changelog'
  String get viewLatestChangelog =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ?? 'View latest changelog';

  /// en-US: 'Current version'
  String get currentVersion => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? 'Current version';

  /// en-US: 'Changelog'
  String get changelog => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? 'Changelog';

  /// en-US: 'Visit Play Store'
  String get visitPlayStore => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? 'Visit Play Store';

  /// en-US: 'Visit releases'
  String get visitReleases => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? 'Visit releases';
}

// Path: settings.logs
class TranslationsSettingsLogsEnUs {
  TranslationsSettingsLogsEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Logs'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.logs.title', {}) ?? 'Logs';

  /// en-US: 'Share logs'
  String get shareLogs => TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogs', {}) ?? 'Share logs';

  /// en-US: 'Share logs to external app?'
  String get shareLogsWarningTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningTitle', {}) ?? 'Share logs to external app?';

  /// en-US: '[WARNING]: Logs may contain sensitive information, share with caution!'
  String get shareLogsWarningMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningMsg', {}) ??
      '[WARNING]: Logs may contain sensitive information, share with caution!';
}

// Path: settings.help
class TranslationsSettingsHelpEnUs {
  TranslationsSettingsHelpEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Help'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? 'Help';
}

// Path: settings.debug
class TranslationsSettingsDebugEnUs {
  TranslationsSettingsDebugEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Debug'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.debug.title', {}) ?? 'Debug';

  /// en-US: 'Debug mode is enabled!'
  String get enabledSnackbarMsg => TranslationOverrides.string(_root.$meta, 'settings.debug.enabledSnackbarMsg', {}) ?? 'Debug mode is enabled!';

  /// en-US: 'Debug mode is disabled!'
  String get disabledSnackbarMsg => TranslationOverrides.string(_root.$meta, 'settings.debug.disabledSnackbarMsg', {}) ?? 'Debug mode is disabled!';

  /// en-US: 'Debug mode is already enabled!'
  String get alreadyEnabledSnackbarMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.alreadyEnabledSnackbarMsg', {}) ?? 'Debug mode is already enabled!';

  /// en-US: 'Show performance graph'
  String get showPerformanceGraph => TranslationOverrides.string(_root.$meta, 'settings.debug.showPerformanceGraph', {}) ?? 'Show performance graph';

  /// en-US: 'Show FPS graph'
  String get showFPSGraph => TranslationOverrides.string(_root.$meta, 'settings.debug.showFPSGraph', {}) ?? 'Show FPS graph';

  /// en-US: 'Show image stats'
  String get showImageStats => TranslationOverrides.string(_root.$meta, 'settings.debug.showImageStats', {}) ?? 'Show image stats';

  /// en-US: 'Show video stats'
  String get showVideoStats => TranslationOverrides.string(_root.$meta, 'settings.debug.showVideoStats', {}) ?? 'Show video stats';

  /// en-US: 'Blur images + mute videos [DEV only]'
  String get blurImagesAndMuteVideosDevOnly =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.blurImagesAndMuteVideosDevOnly', {}) ?? 'Blur images + mute videos [DEV only]';

  /// en-US: 'Enable drag scroll on lists [Desktop only]'
  String get enableDragScrollOnListsDesktopOnly =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.enableDragScrollOnListsDesktopOnly', {}) ??
      'Enable drag scroll on lists [Desktop only]';

  /// en-US: 'Animation speed (${speed: double})'
  String animationSpeed({required double speed}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.animationSpeed', {'speed': speed}) ?? 'Animation speed (${speed})';

  /// en-US: 'Tags Manager'
  String get tagsManager => TranslationOverrides.string(_root.$meta, 'settings.debug.tagsManager', {}) ?? 'Tags Manager';

  /// en-US: 'Res: ${width: String}x${height: String}'
  String resolution({required String width, required String height}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.resolution', {'width': width, 'height': height}) ?? 'Res: ${width}x${height}';

  /// en-US: 'Pixel ratio: ${ratio: String}'
  String pixelRatio({required String ratio}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.pixelRatio', {'ratio': ratio}) ?? 'Pixel ratio: ${ratio}';

  /// en-US: 'Logger'
  String get logger => TranslationOverrides.string(_root.$meta, 'settings.debug.logger', {}) ?? 'Logger';

  /// en-US: 'Webview'
  String get webview => TranslationOverrides.string(_root.$meta, 'settings.debug.webview', {}) ?? 'Webview';

  /// en-US: 'Delete all cookies'
  String get deleteAllCookies => TranslationOverrides.string(_root.$meta, 'settings.debug.deleteAllCookies', {}) ?? 'Delete all cookies';

  /// en-US: 'Clear secure storage'
  String get clearSecureStorage => TranslationOverrides.string(_root.$meta, 'settings.debug.clearSecureStorage', {}) ?? 'Clear secure storage';

  /// en-US: 'Get session string'
  String get getSessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.getSessionString', {}) ?? 'Get session string';

  /// en-US: 'Set session string'
  String get setSessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.setSessionString', {}) ?? 'Set session string';

  /// en-US: 'Session string'
  String get sessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.sessionString', {}) ?? 'Session string';

  /// en-US: 'Restored session from string'
  String get restoredSessionFromString =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.restoredSessionFromString', {}) ?? 'Restored session from string';
}

// Path: settings.logging
class TranslationsSettingsLoggingEnUs {
  TranslationsSettingsLoggingEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Logger'
  String get logger => TranslationOverrides.string(_root.$meta, 'settings.logging.logger', {}) ?? 'Logger';
}

// Path: settings.webview
class TranslationsSettingsWebviewEnUs {
  TranslationsSettingsWebviewEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Open webview'
  String get openWebview => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? 'Open webview';

  /// en-US: 'to login or obtain cookies'
  String get openWebviewTip => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? 'to login or obtain cookies';
}

// Path: settings.dirPicker
class TranslationsSettingsDirPickerEnUs {
  TranslationsSettingsDirPickerEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Directory name'
  String get directoryName => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryName', {}) ?? 'Directory name';

  /// en-US: 'Select a directory'
  String get selectADirectory => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.selectADirectory', {}) ?? 'Select a directory';

  /// en-US: 'Do you want to close the picker without choosing a directory?'
  String get closeWithoutChoosing =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.closeWithoutChoosing', {}) ??
      'Do you want to close the picker without choosing a directory?';

  /// en-US: 'No'
  String get no => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.no', {}) ?? 'No';

  /// en-US: 'Yes'
  String get yes => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.yes', {}) ?? 'Yes';

  /// en-US: 'Error!'
  String get error => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.error', {}) ?? 'Error!';

  /// en-US: 'Failed to create directory'
  String get failedToCreateDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.failedToCreateDirectory', {}) ?? 'Failed to create directory';

  /// en-US: 'Directory is not writable!'
  String get directoryNotWritable =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryNotWritable', {}) ?? 'Directory is not writable!';

  /// en-US: 'New directory'
  String get newDirectory => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.newDirectory', {}) ?? 'New directory';

  /// en-US: 'Create'
  String get create => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.create', {}) ?? 'Create';
}

// Path: viewer.tutorial
class TranslationsViewerTutorialEnUs {
  TranslationsViewerTutorialEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Images'
  String get images => TranslationOverrides.string(_root.$meta, 'viewer.tutorial.images', {}) ?? 'Images';

  /// en-US: 'Tap/Long tap: toggle immersive mode'
  String get tapLongTapToggleImmersive =>
      TranslationOverrides.string(_root.$meta, 'viewer.tutorial.tapLongTapToggleImmersive', {}) ?? 'Tap/Long tap: toggle immersive mode';

  /// en-US: 'Double tap: fit to screen / original size / reset zoom'
  String get doubleTapFitScreen =>
      TranslationOverrides.string(_root.$meta, 'viewer.tutorial.doubleTapFitScreen', {}) ?? 'Double tap: fit to screen / original size / reset zoom';
}

// Path: viewer.appBar
class TranslationsViewerAppBarEnUs {
  TranslationsViewerAppBarEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Can't start Slideshow'
  String get cantStartSlideshow => TranslationOverrides.string(_root.$meta, 'viewer.appBar.cantStartSlideshow', {}) ?? 'Can\'t start Slideshow';

  /// en-US: 'Reached the Last loaded Item'
  String get reachedLastLoadedItem =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.reachedLastLoadedItem', {}) ?? 'Reached the Last loaded Item';

  /// en-US: 'Pause'
  String get pause => TranslationOverrides.string(_root.$meta, 'viewer.appBar.pause', {}) ?? 'Pause';

  /// en-US: 'Start'
  String get start => TranslationOverrides.string(_root.$meta, 'viewer.appBar.start', {}) ?? 'Start';

  /// en-US: 'Unfavourite'
  String get unfavourite => TranslationOverrides.string(_root.$meta, 'viewer.appBar.unfavourite', {}) ?? 'Unfavourite';

  /// en-US: 'Deselect'
  String get deselect => TranslationOverrides.string(_root.$meta, 'viewer.appBar.deselect', {}) ?? 'Deselect';

  /// en-US: 'Reload with scaling'
  String get reloadWithScaling => TranslationOverrides.string(_root.$meta, 'viewer.appBar.reloadWithScaling', {}) ?? 'Reload with scaling';

  /// en-US: 'Load sample quality'
  String get loadSampleQuality => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadSampleQuality', {}) ?? 'Load sample quality';

  /// en-US: 'Load high quality'
  String get loadHighQuality => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadHighQuality', {}) ?? 'Load high quality';

  /// en-US: 'Drop snatched status'
  String get dropSnatchedStatus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.dropSnatchedStatus', {}) ?? 'Drop snatched status';

  /// en-US: 'Set snatched status'
  String get setSnatchedStatus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.setSnatchedStatus', {}) ?? 'Set snatched status';

  /// en-US: 'Snatch'
  String get snatch => TranslationOverrides.string(_root.$meta, 'viewer.appBar.snatch', {}) ?? 'Snatch';

  /// en-US: '(forced)'
  String get forced => TranslationOverrides.string(_root.$meta, 'viewer.appBar.forced', {}) ?? '(forced)';

  /// en-US: 'Hydrus share'
  String get hydrusShare => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusShare', {}) ?? 'Hydrus share';

  /// en-US: 'Which URL you want to share to Hydrus?'
  String get whichUrlToShareToHydrus =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.whichUrlToShareToHydrus', {}) ?? 'Which URL you want to share to Hydrus?';

  /// en-US: 'Post URL'
  String get postURL => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURL', {}) ?? 'Post URL';

  /// en-US: 'File URL'
  String get fileURL => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURL', {}) ?? 'File URL';

  /// en-US: 'Hydrus is not configured!'
  String get hydrusNotConfigured => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusNotConfigured', {}) ?? 'Hydrus is not configured!';

  /// en-US: 'Share file'
  String get shareFile => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareFile', {}) ?? 'Share file';

  /// en-US: 'Already downloading this file for sharing, do you want to abort?'
  String get alreadyDownloadingThisFile =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingThisFile', {}) ??
      'Already downloading this file for sharing, do you want to abort?';

  /// en-US: 'Already downloading file for sharing, do you want to abort current file and share a new file?'
  String get alreadyDownloadingFile =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingFile', {}) ??
      'Already downloading file for sharing, do you want to abort current file and share a new file?';

  /// en-US: 'Current:'
  String get current => TranslationOverrides.string(_root.$meta, 'viewer.appBar.current', {}) ?? 'Current:';

  /// en-US: 'New:'
  String get kNew => TranslationOverrides.string(_root.$meta, 'viewer.appBar.kNew', {}) ?? 'New:';

  /// en-US: 'Share new'
  String get shareNew => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareNew', {}) ?? 'Share new';

  /// en-US: 'Abort'
  String get abort => TranslationOverrides.string(_root.$meta, 'viewer.appBar.abort', {}) ?? 'Abort';

  /// en-US: 'Error!'
  String get error => TranslationOverrides.string(_root.$meta, 'viewer.appBar.error', {}) ?? 'Error!';

  /// en-US: 'Something went wrong when saving the File before Sharing'
  String get savingFileError =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.savingFileError', {}) ?? 'Something went wrong when saving the File before Sharing';

  /// en-US: 'What you want to Share?'
  String get whatToShare => TranslationOverrides.string(_root.$meta, 'viewer.appBar.whatToShare', {}) ?? 'What you want to Share?';

  /// en-US: 'Post URL with tags'
  String get postURLWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURLWithTags', {}) ?? 'Post URL with tags';

  /// en-US: 'File URL with tags'
  String get fileURLWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURLWithTags', {}) ?? 'File URL with tags';

  /// en-US: 'File'
  String get file => TranslationOverrides.string(_root.$meta, 'viewer.appBar.file', {}) ?? 'File';

  /// en-US: 'File with tags'
  String get fileWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileWithTags', {}) ?? 'File with tags';

  /// en-US: 'Hydrus'
  String get hydrus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrus', {}) ?? 'Hydrus';

  /// en-US: 'Select tags'
  String get selectTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.selectTags', {}) ?? 'Select tags';
}

// Path: viewer.notes
class TranslationsViewerNotesEnUs {
  TranslationsViewerNotesEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Note'
  String get note => TranslationOverrides.string(_root.$meta, 'viewer.notes.note', {}) ?? 'Note';

  /// en-US: 'Notes'
  String get notes => TranslationOverrides.string(_root.$meta, 'viewer.notes.notes', {}) ?? 'Notes';

  /// en-US: 'X:${posX: int}, Y:${posY: int}'
  String coordinates({required int posX, required int posY}) =>
      TranslationOverrides.string(_root.$meta, 'viewer.notes.coordinates', {'posX': posX, 'posY': posY}) ?? 'X:${posX}, Y:${posY}';
}

// Path: media.loading
class TranslationsMediaLoadingEnUs {
  TranslationsMediaLoadingEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Rendering…'
  String get rendering => TranslationOverrides.string(_root.$meta, 'media.loading.rendering', {}) ?? 'Rendering…';

  /// en-US: 'Loading and rendering from cache…'
  String get loadingAndRenderingFromCache =>
      TranslationOverrides.string(_root.$meta, 'media.loading.loadingAndRenderingFromCache', {}) ?? 'Loading and rendering from cache…';

  /// en-US: 'Loading from cache…'
  String get loadingFromCache => TranslationOverrides.string(_root.$meta, 'media.loading.loadingFromCache', {}) ?? 'Loading from cache…';

  /// en-US: 'Buffering…'
  String get buffering => TranslationOverrides.string(_root.$meta, 'media.loading.buffering', {}) ?? 'Buffering…';

  /// en-US: 'Loading…'
  String get loading => TranslationOverrides.string(_root.$meta, 'media.loading.loading', {}) ?? 'Loading…';

  /// en-US: 'Load anyway'
  String get loadAnyway => TranslationOverrides.string(_root.$meta, 'media.loading.loadAnyway', {}) ?? 'Load anyway';

  /// en-US: 'Restart loading'
  String get restartLoading => TranslationOverrides.string(_root.$meta, 'media.loading.restartLoading', {}) ?? 'Restart loading';

  /// en-US: 'Stop loading'
  String get stopLoading => TranslationOverrides.string(_root.$meta, 'media.loading.stopLoading', {}) ?? 'Stop loading';

  /// en-US: 'Started ${seconds: int}s ago'
  String startedSecondsAgo({required int seconds}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.startedSecondsAgo', {'seconds': seconds}) ?? 'Started ${seconds}s ago';

  late final TranslationsMediaLoadingStopReasonsEnUs stopReasons = TranslationsMediaLoadingStopReasonsEnUs.internal(_root);

  /// en-US: 'File is zero bytes'
  String get fileIsZeroBytes => TranslationOverrides.string(_root.$meta, 'media.loading.fileIsZeroBytes', {}) ?? 'File is zero bytes';

  /// en-US: 'File size: ${size: String}'
  String fileSize({required String size}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.fileSize', {'size': size}) ?? 'File size: ${size}';

  /// en-US: 'Limit: ${limit: String}'
  String sizeLimit({required String limit}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.sizeLimit', {'limit': limit}) ?? 'Limit: ${limit}';

  /// en-US: 'Frequent playback issues? Try changing [Settings > Video > Video player backend]'
  String get tryChangingVideoBackend =>
      TranslationOverrides.string(_root.$meta, 'media.loading.tryChangingVideoBackend', {}) ??
      'Frequent playback issues? Try changing [Settings > Video > Video player backend]';
}

// Path: media.video
class TranslationsMediaVideoEnUs {
  TranslationsMediaVideoEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Videos disabled or not supported'
  String get videosDisabledOrNotSupported =>
      TranslationOverrides.string(_root.$meta, 'media.video.videosDisabledOrNotSupported', {}) ?? 'Videos disabled or not supported';

  /// en-US: 'Open video in external player'
  String get openVideoInExternalPlayer =>
      TranslationOverrides.string(_root.$meta, 'media.video.openVideoInExternalPlayer', {}) ?? 'Open video in external player';

  /// en-US: 'Open video in browser'
  String get openVideoInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openVideoInBrowser', {}) ?? 'Open video in browser';

  /// en-US: 'Failed to load item data'
  String get failedToLoadItemData => TranslationOverrides.string(_root.$meta, 'media.video.failedToLoadItemData', {}) ?? 'Failed to load item data';

  /// en-US: 'Loading item data…'
  String get loadingItemData => TranslationOverrides.string(_root.$meta, 'media.video.loadingItemData', {}) ?? 'Loading item data…';

  /// en-US: 'Retry'
  String get retry => TranslationOverrides.string(_root.$meta, 'media.video.retry', {}) ?? 'Retry';

  /// en-US: 'Open file in browser'
  String get openFileInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openFileInBrowser', {}) ?? 'Open file in browser';

  /// en-US: 'Open post in browser'
  String get openPostInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openPostInBrowser', {}) ?? 'Open post in browser';

  /// en-US: 'Currently checking:'
  String get currentlyChecking => TranslationOverrides.string(_root.$meta, 'media.video.currentlyChecking', {}) ?? 'Currently checking:';

  /// en-US: 'Unknown file format (.${fileExt: String}), tap here to open in browser'
  String unknownFileFormat({required String fileExt}) =>
      TranslationOverrides.string(_root.$meta, 'media.video.unknownFileFormat', {'fileExt': fileExt}) ??
      'Unknown file format (.${fileExt}), tap here to open in browser';
}

// Path: preview.error
class TranslationsPreviewErrorEnUs {
  TranslationsPreviewErrorEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'No results'
  String get noResults => TranslationOverrides.string(_root.$meta, 'preview.error.noResults', {}) ?? 'No results';

  /// en-US: 'Change search query or tap to retry'
  String get noResultsSubtitle =>
      TranslationOverrides.string(_root.$meta, 'preview.error.noResultsSubtitle', {}) ?? 'Change search query or tap to retry';

  /// en-US: 'You reached the end'
  String get reachedEnd => TranslationOverrides.string(_root.$meta, 'preview.error.reachedEnd', {}) ?? 'You reached the end';

  /// en-US: 'Loaded pages: ${pageNum: int} Tap here to reload last page'
  String reachedEndSubtitle({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.reachedEndSubtitle', {'pageNum': pageNum}) ??
      'Loaded pages: ${pageNum}\nTap here to reload last page';

  /// en-US: 'Loading page #${pageNum: int}…'
  String loadingPage({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.loadingPage', {'pageNum': pageNum}) ?? 'Loading page #${pageNum}…';

  /// en-US: '(one) {Started ${seconds} second ago} (few) {Started ${seconds} seconds ago} (many) {Started ${seconds} seconds ago} (other) {Started ${seconds} seconds ago}'
  String startedAgo({required num seconds}) =>
      TranslationOverrides.plural(_root.$meta, 'preview.error.startedAgo', {'seconds': seconds}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        seconds,
        one: 'Started ${seconds} second ago',
        few: 'Started ${seconds} seconds ago',
        many: 'Started ${seconds} seconds ago',
        other: 'Started ${seconds} seconds ago',
      );

  /// en-US: 'Tap to retry if request seems stuck or taking too long'
  String get tapToRetryIfStuck =>
      TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetryIfStuck', {}) ?? 'Tap to retry if request seems stuck or taking too long';

  /// en-US: 'Error when loading page #${pageNum: int}'
  String errorLoadingPage({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.errorLoadingPage', {'pageNum': pageNum}) ?? 'Error when loading page #${pageNum}';

  /// en-US: 'Tap here to retry'
  String get errorWithMessage => TranslationOverrides.string(_root.$meta, 'preview.error.errorWithMessage', {}) ?? 'Tap here to retry';

  /// en-US: 'Error, no results loaded'
  String get errorNoResultsLoaded => TranslationOverrides.string(_root.$meta, 'preview.error.errorNoResultsLoaded', {}) ?? 'Error, no results loaded';

  /// en-US: 'Tap here to retry'
  String get tapToRetry => TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetry', {}) ?? 'Tap here to retry';
}

// Path: settings.interface.previewQualityValues
class TranslationsSettingsInterfacePreviewQualityValuesEnUs {
  TranslationsSettingsInterfacePreviewQualityValuesEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Thumbnail'
  String get thumbnail => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.thumbnail', {}) ?? 'Thumbnail';

  /// en-US: 'Sample'
  String get sample => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.sample', {}) ?? 'Sample';
}

// Path: settings.interface.previewDisplayModeValues
class TranslationsSettingsInterfacePreviewDisplayModeValuesEnUs {
  TranslationsSettingsInterfacePreviewDisplayModeValuesEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Square'
  String get square => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.square', {}) ?? 'Square';

  /// en-US: 'Rectangle'
  String get rectangle => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.rectangle', {}) ?? 'Rectangle';

  /// en-US: 'Staggered'
  String get staggered => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.staggered', {}) ?? 'Staggered';
}

// Path: settings.interface.appModeValues
class TranslationsSettingsInterfaceAppModeValuesEnUs {
  TranslationsSettingsInterfaceAppModeValuesEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Desktop'
  String get desktop => TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.desktop', {}) ?? 'Desktop';

  /// en-US: 'Mobile'
  String get mobile => TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.mobile', {}) ?? 'Mobile';
}

// Path: settings.interface.handSideValues
class TranslationsSettingsInterfaceHandSideValuesEnUs {
  TranslationsSettingsInterfaceHandSideValuesEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Left'
  String get left => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.left', {}) ?? 'Left';

  /// en-US: 'Right'
  String get right => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.right', {}) ?? 'Right';
}

// Path: settings.viewer.imageQualityValues
class TranslationsSettingsViewerImageQualityValuesEnUs {
  TranslationsSettingsViewerImageQualityValuesEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Sample'
  String get sample => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.sample', {}) ?? 'Sample';

  /// en-US: 'Original'
  String get fullRes => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.fullRes', {}) ?? 'Original';
}

// Path: settings.viewer.scrollDirectionValues
class TranslationsSettingsViewerScrollDirectionValuesEnUs {
  TranslationsSettingsViewerScrollDirectionValuesEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Horizontal'
  String get horizontal => TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.horizontal', {}) ?? 'Horizontal';

  /// en-US: 'Vertical'
  String get vertical => TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.vertical', {}) ?? 'Vertical';
}

// Path: settings.viewer.toolbarPositionValues
class TranslationsSettingsViewerToolbarPositionValuesEnUs {
  TranslationsSettingsViewerToolbarPositionValuesEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Top'
  String get top => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.top', {}) ?? 'Top';

  /// en-US: 'Bottom'
  String get bottom => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.bottom', {}) ?? 'Bottom';
}

// Path: settings.viewer.buttonPositionValues
class TranslationsSettingsViewerButtonPositionValuesEnUs {
  TranslationsSettingsViewerButtonPositionValuesEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Disabled'
  String get disabled => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.disabled', {}) ?? 'Disabled';

  /// en-US: 'Left'
  String get left => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.left', {}) ?? 'Left';

  /// en-US: 'Right'
  String get right => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.right', {}) ?? 'Right';
}

// Path: settings.viewer.shareActionValues
class TranslationsSettingsViewerShareActionValuesEnUs {
  TranslationsSettingsViewerShareActionValuesEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Ask'
  String get ask => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.ask', {}) ?? 'Ask';

  /// en-US: 'Post URL'
  String get postUrl => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrl', {}) ?? 'Post URL';

  /// en-US: 'Post URL with tags'
  String get postUrlWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrlWithTags', {}) ?? 'Post URL with tags';

  /// en-US: 'File URL'
  String get fileUrl => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrl', {}) ?? 'File URL';

  /// en-US: 'File URL with tags'
  String get fileUrlWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrlWithTags', {}) ?? 'File URL with tags';

  /// en-US: 'File'
  String get file => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.file', {}) ?? 'File';

  /// en-US: 'File with tags'
  String get fileWithTags => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileWithTags', {}) ?? 'File with tags';

  /// en-US: 'Hydrus'
  String get hydrus => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.hydrus', {}) ?? 'Hydrus';
}

// Path: settings.video.cacheModes
class TranslationsSettingsVideoCacheModesEnUs {
  TranslationsSettingsVideoCacheModesEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Video cache modes'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.title', {}) ?? 'Video cache modes';

  /// en-US: '- Stream - Don't cache, start playing as soon as possible'
  String get streamMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamMode', {}) ??
      '- Stream - Don\'t cache, start playing as soon as possible';

  /// en-US: '- Cache - Saves the file to device storage, plays only when download is complete'
  String get cacheMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheMode', {}) ??
      '- Cache - Saves the file to device storage, plays only when download is complete';

  /// en-US: '- Stream+Cache - Mix of both, but currently leads to double download'
  String get streamCacheMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamCacheMode', {}) ??
      '- Stream+Cache - Mix of both, but currently leads to double download';

  /// en-US: '[Note]: Videos will cache only if 'Cache Media' is enabled.'
  String get cacheNote =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheNote', {}) ??
      '[Note]: Videos will cache only if \'Cache Media\' is enabled.';

  /// en-US: '[Warning]: On desktop Stream mode can work incorrectly for some Boorus.'
  String get desktopWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.desktopWarning', {}) ??
      '[Warning]: On desktop Stream mode can work incorrectly for some Boorus.';
}

// Path: settings.video.cacheModeValues
class TranslationsSettingsVideoCacheModeValuesEnUs {
  TranslationsSettingsVideoCacheModeValuesEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Stream'
  String get stream => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.stream', {}) ?? 'Stream';

  /// en-US: 'Cache'
  String get cache => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.cache', {}) ?? 'Cache';

  /// en-US: 'Stream+Cache'
  String get streamCache => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.streamCache', {}) ?? 'Stream+Cache';
}

// Path: settings.video.videoBackendModeValues
class TranslationsSettingsVideoVideoBackendModeValuesEnUs {
  TranslationsSettingsVideoVideoBackendModeValuesEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Default'
  String get normal => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.normal', {}) ?? 'Default';

  /// en-US: 'MPV'
  String get mpv => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mpv', {}) ?? 'MPV';

  /// en-US: 'MDK'
  String get mdk => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mdk', {}) ?? 'MDK';
}

// Path: media.loading.stopReasons
class TranslationsMediaLoadingStopReasonsEnUs {
  TranslationsMediaLoadingStopReasonsEnUs.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en-US: 'Stopped by user'
  String get stoppedByUser => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.stoppedByUser', {}) ?? 'Stopped by user';

  /// en-US: 'Loading error'
  String get loadingError => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.loadingError', {}) ?? 'Loading error';

  /// en-US: 'File is too big'
  String get fileIsTooBig => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.fileIsTooBig', {}) ?? 'File is too big';

  /// en-US: 'Hidden by filters:'
  String get hiddenByFilters => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.hiddenByFilters', {}) ?? 'Hidden by filters:';

  /// en-US: 'Video error'
  String get videoError => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.videoError', {}) ?? 'Video error';
}

/// The flat map containing all translations for locale <en-US>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
          'locale' => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'en-US',
          'localeName' => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'English',
          'appName' => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher',
          'error' => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Error',
          'errorExclamation' => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'Error!',
          'success' => TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Success',
          'successExclamation' => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? 'Success!',
          'cancel' => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Cancel',
          'kReturn' => TranslationOverrides.string(_root.$meta, 'kReturn', {}) ?? 'Return',
          'later' => TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Later',
          'close' => TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Close',
          'ok' => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'OK',
          'yes' => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Yes',
          'no' => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'No',
          'pleaseWait' => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Please wait…',
          'show' => TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Show',
          'hide' => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Hide',
          'enable' => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'Enable',
          'disable' => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Disable',
          'add' => TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Add',
          'edit' => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? 'Edit',
          'remove' => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? 'Remove',
          'save' => TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Save',
          'delete' => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? 'Delete',
          'confirm' => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? 'Confirm',
          'retry' => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? 'Retry',
          'clear' => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? 'Clear',
          'copy' => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Copy',
          'copied' => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Copied',
          'copiedToClipboard' => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? 'Copied to clipboard',
          'nothingFound' => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? 'Nothing found',
          'paste' => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Paste',
          'copyErrorText' => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Copy error',
          'booru' => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru',
          'goToSettings' => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'Go to settings',
          'thisMayTakeSomeTime' => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'This may take some time…',
          'exitTheAppQuestion' => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? 'Exit the app?',
          'closeTheApp' => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Close the app',
          'invalidUrl' => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'Invalid URL!',
          'clipboardIsEmpty' => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'Clipboard is empty!',
          'failedToOpenLink' => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'Failed to open link',
          'apiKey' => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'API Key',
          'userId' => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'User ID',
          'login' => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Login',
          'password' => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Password',
          'pause' => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Pause',
          'resume' => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Resume',
          'discord' => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord',
          'visitOurDiscord' => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Visit our Discord server',
          'item' => TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Item',
          'select' => TranslationOverrides.string(_root.$meta, 'select', {}) ?? 'Select',
          'selectAll' => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Select all',
          'reset' => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'Reset',
          'open' => TranslationOverrides.string(_root.$meta, 'open', {}) ?? 'Open',
          'openInNewTab' => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? 'Open in new tab',
          'move' => TranslationOverrides.string(_root.$meta, 'move', {}) ?? 'Move',
          'shuffle' => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? 'Shuffle',
          'sort' => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? 'Sort',
          'go' => TranslationOverrides.string(_root.$meta, 'go', {}) ?? 'Go',
          'search' => TranslationOverrides.string(_root.$meta, 'search', {}) ?? 'Search',
          'filter' => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? 'Filter',
          'or' => TranslationOverrides.string(_root.$meta, 'or', {}) ?? 'Or (~)',
          'page' => TranslationOverrides.string(_root.$meta, 'page', {}) ?? 'Page',
          'pageNumber' => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? 'Page #',
          'tags' => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'Tags',
          'type' => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'Type',
          'name' => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Name',
          'address' => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'Address',
          'username' => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'Username',
          'favourites' => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'Favourites',
          'downloads' => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'Downloads',
          'validationErrors.required' => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Please enter a value',
          'validationErrors.invalid' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Please enter a valid value',
          'validationErrors.invalidNumber' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? 'Please enter a number',
          'validationErrors.invalidNumericValue' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? 'Please enter a valid numeric value',
          'validationErrors.tooSmall' =>
            ({required double min}) =>
                TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Please enter a value bigger than ${min}',
          'validationErrors.tooBig' =>
            ({required double max}) =>
                TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Please enter a value smaller than ${max}',
          'validationErrors.rangeError' =>
            ({required double min, required double max}) =>
                TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ??
                'Please enter a value between ${min} and ${max}',
          'validationErrors.greaterThanOrEqualZero' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ??
                'Please enter a value equal to or greater than 0',
          'validationErrors.lessThan4' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? 'Please enter a value less than 4',
          'validationErrors.biggerThan100' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? 'Please enter a value bigger than 100',
          'validationErrors.moreThan4ColumnsWarning' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ??
                'Using more than 4 columns can affect performance',
          'validationErrors.moreThan8ColumnsWarning' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ??
                'Using more than 8 columns can affect performance',
          'init.initError' => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Initialization error!',
          'init.settingUpProxy' => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Setting up proxy…',
          'init.loadingDatabase' => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Loading database…',
          'init.loadingBoorus' => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Loading boorus…',
          'init.loadingTags' => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Loading tags…',
          'init.restoringTabs' => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Restoring tabs…',
          'permissions.noAccessToCustomStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ?? 'No access to custom storage directory',
          'permissions.pleaseSetStorageDirectoryAgain' =>
            TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ??
                'Please set storage directory again to grant the app access to it',
          'permissions.currentPath' =>
            ({required String path}) =>
                TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? 'Current path: ${path}',
          'permissions.setDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? 'Set directory',
          'permissions.currentlyNotAvailableForThisPlatform' =>
            TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ?? 'Not available on this platform',
          'permissions.resetDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? 'Reset directory',
          'permissions.afterResetFilesWillBeSavedToDefaultDirectory' =>
            TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ??
                'Files will save to default directory after reset',
          'authentication.pleaseAuthenticateToUseTheApp' =>
            TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ?? 'Please authenticate to use the app',
          'authentication.noBiometricHardwareAvailable' =>
            TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? 'No biometric hardware available',
          'authentication.temporaryLockout' => TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? 'Temporary lockout',
          'authentication.somethingWentWrong' =>
            ({required String error}) =>
                TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ??
                'Something went wrong during authentication: ${error}',
          'searchHandler.removedLastTab' => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? 'Removed last tab',
          'searchHandler.resettingSearchToDefaultTags' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? 'Resetting to default tags',
          'searchHandler.uoh' => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'UOOOOOOOHHH',
          'searchHandler.ratingsChanged' => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? 'Ratings changed',
          'searchHandler.ratingsChangedMessage' =>
            ({required String booruType}) =>
                TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
                'On ${booruType} [rating:safe] is now replaced with [rating:general] and [rating:sensitive]',
          'searchHandler.appFixedRatingAutomatically' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ??
                'Rating was auto-fixed. Use correct rating in future searches',
          'searchHandler.tabsRestored' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? 'Tabs restored',
          'searchHandler.restoredTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: 'Restored ${count} tab from previous session',
                  few: 'Restored ${count} tabs from previous session',
                  many: 'Restored ${count} tabs from previous session',
                  other: 'Restored ${count} tabs from previous session',
                ),
          'searchHandler.someRestoredTabsHadIssues' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ??
                'Some restored tabs had unknown boorus or broken characters.',
          'searchHandler.theyWereSetToDefaultOrIgnored' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ?? 'They were set to default or ignored.',
          'searchHandler.listOfBrokenTabs' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? 'List of broken tabs:',
          'searchHandler.tabsMerged' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? 'Tabs merged',
          'searchHandler.addedTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: 'Added ${count} new tab',
                  few: 'Added ${count} new tabs',
                  many: 'Added ${count} new tabs',
                  other: 'Added ${count} new tabs',
                ),
          'searchHandler.tabsReplaced' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? 'Tabs replaced',
          'searchHandler.receivedTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: 'Received ${count} tab',
                  few: 'Received ${count} tabs',
                  many: 'Received ${count} tabs',
                  other: 'Received ${count} tabs',
                ),
          'snatcher.title' => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Snatcher',
          'snatcher.snatchingHistory' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'Snatching history',
          'snatcher.enterTags' => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'Enter tags',
          'snatcher.amount' => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? 'Amount',
          'snatcher.amountOfFilesToSnatch' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? 'Amount of Files to Snatch',
          'snatcher.delayInMs' => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? 'Delay (in ms)',
          'snatcher.delayBetweenEachDownload' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? 'Delay between each download',
          'snatcher.snatchFiles' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? 'Snatch files',
          'snatcher.itemWasAlreadySnatched' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? 'Item was already snatched before',
          'snatcher.failedToSnatchItem' => TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? 'Failed to snatch the item',
          'snatcher.itemWasCancelled' => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? 'Item was cancelled',
          'snatcher.startingNextQueueItem' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? 'Starting next queue item…',
          'snatcher.itemsSnatched' => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? 'Items snatched',
          'snatcher.snatchedCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: 'Snatched: ${count} item',
                  few: 'Snatched: ${count} items',
                  many: 'Snatched: ${count} items',
                  other: 'Snatched: ${count} items',
                ),
          'snatcher.filesAlreadySnatched' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: '${count} file was already snatched',
                  few: '${count} files were already snatched',
                  many: '${count} files were already snatched',
                  other: '${count} files were already snatched',
                ),
          'snatcher.failedToSnatchFiles' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: 'Failed to snatch ${count} file',
                  few: 'Failed to snatch ${count} files',
                  many: 'Failed to snatch ${count} files',
                  other: 'Failed to snatch ${count} files',
                ),
          'snatcher.cancelledFiles' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: 'Cancelled ${count} file',
                  few: 'Cancelled ${count} files',
                  many: 'Cancelled ${count} files',
                  other: 'Cancelled ${count} files',
                ),
          'snatcher.snatchingImages' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? 'Snatching images',
          'snatcher.doNotCloseApp' => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? 'Don\'t close app!',
          'snatcher.addedItemToQueue' => TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? 'Added item to snatch queue',
          'snatcher.addedItemsToQueue' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: 'Added ${count} item to snatch queue',
                  few: 'Added ${count} items to snatch queue',
                  many: 'Added ${count} items to snatch queue',
                  other: 'Added ${count} items to snatch queue',
                ),
          'multibooru.title' => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? 'Multibooru',
          'multibooru.multibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Multibooru mode',
          'multibooru.multibooruRequiresAtLeastTwoBoorus' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ?? 'Requires at least 2 configured boorus',
          'multibooru.selectSecondaryBoorus' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Select additional boorus:',
          'multibooru.akaMultibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? 'aka Multibooru mode',
          'multibooru.labelSecondaryBoorusToInclude' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? 'Secondary boorus to include',
          'hydrus.importError' => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'Something went wrong importing to hydrus',
          'hydrus.apiPermissionsRequired' =>
            TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ??
                'You might not have given the correct API permissions, this can be edited in Review Services',
          'hydrus.addTagsToFile' => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? 'Add tags to file',
          'hydrus.addUrls' => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'Add URLs',
          'tabs.tab' => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? 'Tab',
          'tabs.addBoorusInSettings' => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? 'Add boorus in settings',
          'tabs.selectABooru' => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? 'Select a Booru',
          'tabs.secondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? 'Secondary boorus',
          'tabs.addNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? 'Add new tab',
          'tabs.selectABooruOrLeaveEmpty' =>
            TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? 'Select a booru or leave empty',
          'tabs.addPosition' => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? 'Add position',
          'tabs.addModePrevTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? 'Prev tab',
          'tabs.addModeNextTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? 'Next tab',
          'tabs.addModeListEnd' => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? 'List end',
          'tabs.usedQuery' => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? 'Used query',
          'tabs.queryModeDefault' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? 'Default',
          'tabs.queryModeCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? 'Current',
          'tabs.queryModeCustom' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? 'Custom',
          'tabs.customQuery' => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? 'Custom query',
          'tabs.empty' => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '[empty]',
          'tabs.addSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? 'Add secondary boorus',
          'tabs.keepSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? 'Keep secondary boorus',
          'tabs.startFromCustomPageNumber' =>
            TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? 'Start from custom page number',
          'tabs.switchToNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? 'Switch to new tab',
          'tabs.add' => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? 'Add',
          'tabs.tabsManager' => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? 'Tabs Manager',
          'tabs.selectMode' => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? 'Select mode',
          'tabs.sortMode' => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? 'Sort tabs',
          'tabs.help' => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? 'Help',
          'tabs.deleteTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? 'Delete tabs',
          'tabs.shuffleTabs' => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? 'Shuffle tabs',
          'tabs.tabRandomlyShuffled' => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? 'Tab randomly shuffled',
          'tabs.tabOrderSaved' => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? 'Tab order saved',
          'tabs.scrollToCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? 'Scroll to current tab',
          'tabs.scrollToTop' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? 'Scroll to top',
          'tabs.scrollToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? 'Scroll to bottom',
          'tabs.filterTabsByBooru' => TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? 'Filter by booru, state, duplicates…',
          'tabs.scrolling' => TranslationOverrides.string(_root.$meta, 'tabs.scrolling', {}) ?? 'Scrolling:',
          'tabs.sorting' => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? 'Sorting:',
          'tabs.defaultTabsOrder' => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? 'Default tabs order',
          'tabs.sortAlphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? 'Sort alphabetically',
          'tabs.sortAlphabeticallyReversed' =>
            TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? 'Sort alphabetically (reversed)',
          'tabs.sortByBooruName' => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? 'Sort by booru name alphabetically',
          'tabs.sortByBooruNameReversed' =>
            TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ?? 'Sort by booru name alphabetically (reversed)',
          'tabs.longPressSortToSave' =>
            TranslationOverrides.string(_root.$meta, 'tabs.longPressSortToSave', {}) ?? 'Long press sort button to save current order',
          'tabs.select' => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? 'Select:',
          'tabs.toggleSelectMode' => TranslationOverrides.string(_root.$meta, 'tabs.toggleSelectMode', {}) ?? 'Toggle select mode',
          'tabs.onTheBottomOfPage' => TranslationOverrides.string(_root.$meta, 'tabs.onTheBottomOfPage', {}) ?? 'On the bottom of the page: ',
          'tabs.selectDeselectAll' => TranslationOverrides.string(_root.$meta, 'tabs.selectDeselectAll', {}) ?? 'Select/deselect all tabs',
          'tabs.deleteSelectedTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? 'Delete selected tabs',
          'tabs.longPressToMove' => TranslationOverrides.string(_root.$meta, 'tabs.longPressToMove', {}) ?? 'Long press on a tab to move it',
          'tabs.numbersInBottomRight' =>
            TranslationOverrides.string(_root.$meta, 'tabs.numbersInBottomRight', {}) ?? 'Numbers in the bottom right of the tab:',
          'tabs.firstNumberTabIndex' =>
            TranslationOverrides.string(_root.$meta, 'tabs.firstNumberTabIndex', {}) ?? 'First number - tab index in default list order',
          'tabs.secondNumberTabIndex' =>
            TranslationOverrides.string(_root.$meta, 'tabs.secondNumberTabIndex', {}) ??
                'Second number - tab index in current list order, appears when filtering/sorting is active',
          'tabs.specialFilters' => TranslationOverrides.string(_root.$meta, 'tabs.specialFilters', {}) ?? 'Special filters:',
          'tabs.loadedFilter' => TranslationOverrides.string(_root.$meta, 'tabs.loadedFilter', {}) ?? '«Loaded» - show tabs which have loaded items',
          'tabs.notLoadedFilter' =>
            TranslationOverrides.string(_root.$meta, 'tabs.notLoadedFilter', {}) ??
                '«Not loaded» - show tabs which are not loaded and/or have zero items',
          'tabs.notLoadedItalic' => TranslationOverrides.string(_root.$meta, 'tabs.notLoadedItalic', {}) ?? 'Not loaded tabs have italic text',
          'tabs.noTabsFound' => TranslationOverrides.string(_root.$meta, 'tabs.noTabsFound', {}) ?? 'No tabs found',
          'tabs.copy' => TranslationOverrides.string(_root.$meta, 'tabs.copy', {}) ?? 'Copy',
          'tabs.moveAction' => TranslationOverrides.string(_root.$meta, 'tabs.moveAction', {}) ?? 'Move',
          'tabs.remove' => TranslationOverrides.string(_root.$meta, 'tabs.remove', {}) ?? 'Remove',
          'tabs.shuffle' => TranslationOverrides.string(_root.$meta, 'tabs.shuffle', {}) ?? 'Shuffle',
          'tabs.sort' => TranslationOverrides.string(_root.$meta, 'tabs.sort', {}) ?? 'Sort',
          'tabs.shuffleTabsQuestion' => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabsQuestion', {}) ?? 'Shuffle tabs order randomly?',
          'tabs.saveTabsInCurrentOrder' =>
            TranslationOverrides.string(_root.$meta, 'tabs.saveTabsInCurrentOrder', {}) ?? 'Save tabs in current sorting order?',
          'tabs.byBooru' => TranslationOverrides.string(_root.$meta, 'tabs.byBooru', {}) ?? 'By booru',
          'tabs.alphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.alphabetically', {}) ?? 'Alphabetically',
          'tabs.reversed' => TranslationOverrides.string(_root.$meta, 'tabs.reversed', {}) ?? '(reversed)',
          'tabs.areYouSureDeleteTabs' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'tabs.areYouSureDeleteTabs', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: 'Are you sure you want to delete ${count} tab?',
                  few: 'Are you sure you want to delete ${count} tabs?',
                  many: 'Are you sure you want to delete ${count} tabs?',
                  other: 'Are you sure you want to delete ${count} tabs?',
                ),
          'tabs.filters.loaded' => TranslationOverrides.string(_root.$meta, 'tabs.filters.loaded', {}) ?? 'Loaded',
          'tabs.filters.tagType' => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagType', {}) ?? 'Tag type',
          'tabs.filters.multibooru' => TranslationOverrides.string(_root.$meta, 'tabs.filters.multibooru', {}) ?? 'Multibooru',
          'tabs.filters.duplicates' => TranslationOverrides.string(_root.$meta, 'tabs.filters.duplicates', {}) ?? 'Duplicates',
          'tabs.filters.checkDuplicatesOnSameBooru' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.checkDuplicatesOnSameBooru', {}) ?? 'Check for duplicates on same Booru',
          'tabs.filters.emptySearchQuery' => TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? 'Empty search query',
          'tabs.filters.title' => TranslationOverrides.string(_root.$meta, 'tabs.filters.title', {}) ?? 'Tab Filters',
          'tabs.filters.all' => TranslationOverrides.string(_root.$meta, 'tabs.filters.all', {}) ?? 'All',
          'tabs.filters.notLoaded' => TranslationOverrides.string(_root.$meta, 'tabs.filters.notLoaded', {}) ?? 'Not loaded',
          'tabs.filters.enabled' => TranslationOverrides.string(_root.$meta, 'tabs.filters.enabled', {}) ?? 'Enabled',
          'tabs.filters.disabled' => TranslationOverrides.string(_root.$meta, 'tabs.filters.disabled', {}) ?? 'Disabled',
          'tabs.filters.willAlsoEnableSorting' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.willAlsoEnableSorting', {}) ?? 'Will also enable sorting',
          'tabs.filters.tagTypeFilterHelp' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.tagTypeFilterHelp', {}) ??
                'Filter tabs which contain at least one tag of selected type',
          'tabs.filters.any' => TranslationOverrides.string(_root.$meta, 'tabs.filters.any', {}) ?? 'Any',
          'tabs.filters.apply' => TranslationOverrides.string(_root.$meta, 'tabs.filters.apply', {}) ?? 'Apply',
          'tabs.move.moveToTop' => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToTop', {}) ?? 'Move to top',
          'tabs.move.moveToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToBottom', {}) ?? 'Move to bottom',
          'tabs.move.tabNumber' => TranslationOverrides.string(_root.$meta, 'tabs.move.tabNumber', {}) ?? 'Tab number',
          'tabs.move.invalidTabNumber' => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidTabNumber', {}) ?? 'Invalid tab number',
          'tabs.move.invalidInput' => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidInput', {}) ?? 'Invalid input',
          'tabs.move.outOfRange' => TranslationOverrides.string(_root.$meta, 'tabs.move.outOfRange', {}) ?? 'Out of range',
          'tabs.move.pleaseEnterValidTabNumber' =>
            TranslationOverrides.string(_root.$meta, 'tabs.move.pleaseEnterValidTabNumber', {}) ?? 'Please enter a valid tab number',
          'tabs.move.moveTo' =>
            ({required String formattedNumber}) =>
                TranslationOverrides.string(_root.$meta, 'tabs.move.moveTo', {'formattedNumber': formattedNumber}) ?? 'Move to #${formattedNumber}',
          'tabs.move.preview' => TranslationOverrides.string(_root.$meta, 'tabs.move.preview', {}) ?? 'Preview:',
          'history.searchHistory' => TranslationOverrides.string(_root.$meta, 'history.searchHistory', {}) ?? 'Search history',
          'history.searchHistoryIsEmpty' => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsEmpty', {}) ?? 'Search history is empty',
          'history.searchHistoryIsDisabled' =>
            TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsDisabled', {}) ?? 'Search history disabled',
          'history.searchHistoryRequiresDatabase' =>
            TranslationOverrides.string(_root.$meta, 'history.searchHistoryRequiresDatabase', {}) ?? 'Enable database in settings for search history',
          'history.lastSearch' =>
            ({required String search}) =>
                TranslationOverrides.string(_root.$meta, 'history.lastSearch', {'search': search}) ?? 'Last search: ${search}',
          'history.lastSearchWithDate' =>
            ({required String date}) =>
                TranslationOverrides.string(_root.$meta, 'history.lastSearchWithDate', {'date': date}) ?? 'Last search: ${date}',
          'history.unknownBooruType' => TranslationOverrides.string(_root.$meta, 'history.unknownBooruType', {}) ?? 'Unknown Booru type!',
          'history.unknownBooru' =>
            ({required String name, required String type}) =>
                TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ?? 'Unknown booru (${name}-${type})',
          'history.open' => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? 'Open',
          'history.openInNewTab' => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? 'Open in new tab',
          'history.removeFromFavourites' => TranslationOverrides.string(_root.$meta, 'history.removeFromFavourites', {}) ?? 'Remove from Favourites',
          'history.setAsFavourite' => TranslationOverrides.string(_root.$meta, 'history.setAsFavourite', {}) ?? 'Set as Favourite',
          'history.copy' => TranslationOverrides.string(_root.$meta, 'history.copy', {}) ?? 'Copy',
          'history.delete' => TranslationOverrides.string(_root.$meta, 'history.delete', {}) ?? 'Delete',
          'history.deleteHistoryEntries' => TranslationOverrides.string(_root.$meta, 'history.deleteHistoryEntries', {}) ?? 'Delete history entries',
          'history.deleteItemsConfirm' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'history.deleteItemsConfirm', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: 'Are you sure you want to delete ${count} item?',
                  few: 'Are you sure you want to delete ${count} items?',
                  many: 'Are you sure you want to delete ${count} items?',
                  other: 'Are you sure you want to delete ${count} items?',
                ),
          'history.clearSelection' => TranslationOverrides.string(_root.$meta, 'history.clearSelection', {}) ?? 'Clear selection',
          'history.deleteItems' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'history.deleteItems', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: 'Delete ${count} item',
                  few: 'Delete ${count} items',
                  many: 'Delete ${count} items',
                  other: 'Delete ${count} items',
                ),
          'webview.title' => TranslationOverrides.string(_root.$meta, 'webview.title', {}) ?? 'Webview',
          'webview.notSupportedOnDevice' =>
            TranslationOverrides.string(_root.$meta, 'webview.notSupportedOnDevice', {}) ?? 'Not supported on this device',
          'webview.navigation.enterUrlLabel' => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterUrlLabel', {}) ?? 'Enter a URL',
          'webview.navigation.enterCustomUrl' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.enterCustomUrl', {}) ?? 'Enter custom URL',
          'webview.navigation.navigateTo' =>
            ({required String url}) =>
                TranslationOverrides.string(_root.$meta, 'webview.navigation.navigateTo', {'url': url}) ?? 'Navigate to ${url}',
          'webview.navigation.listCookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.listCookies', {}) ?? 'List cookies',
          'webview.navigation.clearCookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.clearCookies', {}) ?? 'Clear cookies',
          'webview.navigation.cookiesGone' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.cookiesGone', {}) ?? 'There were cookies. Now, they are gone',
          'webview.navigation.getFavicon' => TranslationOverrides.string(_root.$meta, 'webview.navigation.getFavicon', {}) ?? 'Get favicon',
          'webview.navigation.noFaviconFound' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noFaviconFound', {}) ?? 'No favicon found',
          'webview.navigation.host' => TranslationOverrides.string(_root.$meta, 'webview.navigation.host', {}) ?? 'Host:',
          'webview.navigation.textAboveSelectable' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.textAboveSelectable', {}) ?? '(text above is selectable)',
          'webview.navigation.fieldToMergeTexts' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.fieldToMergeTexts', {}) ?? 'Field to merge texts:',
          'webview.navigation.copyUrl' => TranslationOverrides.string(_root.$meta, 'webview.navigation.copyUrl', {}) ?? 'Copy URL',
          'webview.navigation.copiedUrlToClipboard' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.copiedUrlToClipboard', {}) ?? 'Copied URL to clipboard',
          'webview.navigation.cookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookies', {}) ?? 'Cookies',
          'webview.navigation.favicon' => TranslationOverrides.string(_root.$meta, 'webview.navigation.favicon', {}) ?? 'Favicon',
          'webview.navigation.history' => TranslationOverrides.string(_root.$meta, 'webview.navigation.history', {}) ?? 'History',
          'webview.navigation.noBackHistoryItem' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noBackHistoryItem', {}) ?? 'No back history item',
          'webview.navigation.noForwardHistoryItem' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noForwardHistoryItem', {}) ?? 'No forward history item',
          'settings.title' => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Settings',
          'settings.language.title' => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? 'Language',
          'settings.language.system' => TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? 'System',
          'settings.language.helpUsTranslate' =>
            TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? 'Help us translate',
          'settings.language.visitForDetails' =>
            TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ??
                'Visit <a href=\'https://github.com/NO-ob/LoliSnatcher_Droid/wiki/Localization\'>github</a> for details or tap on the image below to go to Weblate',
          'settings.booru.title' => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Boorus & Search',
          'settings.booru.defaultTags' => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? 'Default tags',
          'settings.booru.itemsPerPage' => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'Items fetched per page',
          'settings.booru.itemsPerPageTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'Some boorus may ignore this',
          'settings.booru.itemsPerPagePlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPagePlaceholder', {}) ?? '10-100',
          'settings.booru.addBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Add Booru config',
          'settings.booru.shareBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? 'Share Booru config',
          'settings.booru.shareBooruDialogMsgMobile' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
                'Share ${booruName} config as a link.\n\nInclude login/API key?',
          'settings.booru.shareBooruDialogMsgDesktop' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
                'Copy ${booruName} config link to clipboard.\n\nInclude login/API key?',
          'settings.booru.booruSharing' => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? 'Booru sharing',
          'settings.booru.booruSharingMsgAndroid' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ??
                'How to automatically open Booru config links in the app on Android 12 and higher:\n1) Tap button below to open system app link defaults settings\n2) Tap on «Add link» and select all available options',
          'settings.booru.addedBoorus' => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? 'Added Boorus',
          'settings.booru.editBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? 'Edit Booru config',
          'settings.booru.importBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? 'Import Booru config from clipboard',
          'settings.booru.onlyLSURLsSupported' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ?? 'Only loli.snatcher URLs are supported',
          'settings.booru.deleteBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? 'Delete Booru config',
          'settings.booru.deleteBooruError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ??
                'Something went wrong during deletion of a Booru config!',
          'settings.booru.booruDeleted' => TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? 'Booru config deleted',
          'settings.booru.booruDropdownInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ??
                'Selected booru becomes default after saving.\n\nDefault booru appears first in dropdowns',
          'settings.booru.changeDefaultBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? 'Change default Booru?',
          'settings.booru.changeTo' => TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? 'Change to: ',
          'settings.booru.keepCurrentBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? 'Tap [No] to keep current: ',
          'settings.booru.changeToNewBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? 'Tap [Yes] to change to: ',
          'settings.booru.booruConfigLinkCopied' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ?? 'Booru config link copied to clipboard',
          'settings.booru.noBooruSelected' => TranslationOverrides.string(_root.$meta, 'settings.booru.noBooruSelected', {}) ?? 'No Booru selected!',
          'settings.booru.cantDeleteThisBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? 'Can\'t delete this Booru!',
          'settings.booru.removeRelatedTabsFirst' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.removeRelatedTabsFirst', {}) ?? 'Remove related tabs first',
          'settings.booruEditor.title' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? 'Booru Editor',
          'settings.booruEditor.testBooruFailedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'Booru test failed',
          'settings.booruEditor.testBooruFailedMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ??
                'Config parameters may be incorrect, booru doesn\'t allow API access, request didn\'t return any data or there was a network error.',
          'settings.booruEditor.saveBooru' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Save Booru',
          'settings.booruEditor.runningTest' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? 'Running test…',
          'settings.booruEditor.booruConfigExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? 'This Booru config already exists',
          'settings.booruEditor.booruSameNameExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ??
                'Booru config with same name already exists',
          'settings.booruEditor.booruSameUrlExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ??
                'Booru config with same URL already exists',
          'settings.booruEditor.thisBooruConfigWontBeAdded' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ?? 'This booru config won\'t be added',
          'settings.booruEditor.booruConfigSaved' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? 'Booru config saved',
          'settings.booruEditor.existingTabsNeedReload' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ??
                'Existing tabs with this Booru need to be reloaded in order to apply changes!',
          'settings.booruEditor.failedVerifyApiHydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ?? 'Failed to verify API access for Hydrus',
          'settings.booruEditor.accessKeyRequestedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? 'Access key requested',
          'settings.booruEditor.accessKeyRequestedMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ??
                'Tap okay on Hydrus then apply. You can tap \'Test Booru\' afterwards',
          'settings.booruEditor.accessKeyFailedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? 'Failed to get access key',
          'settings.booruEditor.accessKeyFailedMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ??
                'Do you have the request window open in Hydrus?',
          'settings.booruEditor.hydrusInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ??
                'To get the Hydrus key you need to open the request dialog in the Hydrus client. Services > Review services > Client API > Add > From API request',
          'settings.booruEditor.getHydrusApiKey' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? 'Get Hydrus API key',
          'settings.booruEditor.booruName' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? 'Booru Name',
          'settings.booruEditor.booruNameRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? 'Booru Name is required!',
          'settings.booruEditor.booruUrl' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? 'Booru URL',
          'settings.booruEditor.booruUrlRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? 'Booru URL is required!',
          'settings.booruEditor.booruType' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruType', {}) ?? 'Booru Type',
          'settings.booruEditor.booruFavicon' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? 'Favicon URL',
          'settings.booruEditor.booruFaviconPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '(Autofills if blank)',
          'settings.booruEditor.booruDefTags' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? 'Default tags',
          'settings.booruEditor.booruDefTagsPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTagsPlaceholder', {}) ?? 'Default search for booru',
          'settings.booruEditor.booruDefaultInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefaultInstructions', {}) ??
                'Fields below may be required for some boorus',
          'settings.booruEditor.booruConfigShouldSave' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigShouldSave', {}) ?? 'Confirm saving this booru config',
          'settings.booruEditor.booruConfigSelectedType' =>
            ({required String booruType}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSelectedType', {'booruType': booruType}) ??
                'Selected/Detected booru type: ${booruType}',
          'settings.interface.title' => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? 'Interface',
          'settings.interface.appUIMode' => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIMode', {}) ?? 'App UI mode',
          'settings.interface.appUIModeWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarningTitle', {}) ?? 'App UI mode',
          'settings.interface.appUIModeWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarning', {}) ??
                'Use Desktop mode? May cause issues on mobile. DEPRECATED.',
          'settings.interface.appUIModeHelpMobile' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpMobile', {}) ?? '- Mobile - Normal Mobile UI',
          'settings.interface.appUIModeHelpDesktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpDesktop', {}) ??
                '- Desktop - Ahoviewer Style UI [DEPRECATED, NEEDS REWORK]',
          'settings.interface.appUIModeHelpWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpWarning', {}) ??
                '[Warning]: Do not set UI Mode to Desktop on a phone you might break the app and might have to wipe your settings including booru configs.',
          'settings.interface.handSide' => TranslationOverrides.string(_root.$meta, 'settings.interface.handSide', {}) ?? 'Hand side',
          'settings.interface.handSideHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.handSideHelp', {}) ?? 'Adjusts UI element positions to selected side',
          'settings.interface.showSearchBarInPreviewGrid' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.showSearchBarInPreviewGrid', {}) ?? 'Show search bar in preview grid',
          'settings.interface.moveInputToTopInSearchView' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.moveInputToTopInSearchView', {}) ?? 'Move input to top in search view',
          'settings.interface.searchViewQuickActionsPanel' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewQuickActionsPanel', {}) ?? 'Search view quick actions panel',
          'settings.interface.searchViewInputAutofocus' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewInputAutofocus', {}) ?? 'Search view input autofocus',
          'settings.interface.disableVibration' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibration', {}) ?? 'Disable vibration',
          'settings.interface.disableVibrationSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibrationSubtitle', {}) ??
                'May still happen on some actions even when disabled',
          'settings.interface.usePredictiveBack' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.usePredictiveBack', {}) ?? 'Predictive back gesture',
          'settings.interface.previewColumnsPortrait' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsPortrait', {}) ?? 'Preview columns (portrait)',
          'settings.interface.previewColumnsLandscape' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsLandscape', {}) ?? 'Preview columns (landscape)',
          'settings.interface.previewQuality' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQuality', {}) ?? 'Preview quality',
          'settings.interface.previewQualityHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelp', {}) ?? 'Changes preview grid image resolution',
          'settings.interface.previewQualityHelpSample' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpSample', {}) ??
                ' - Sample - Medium resolution, app will also load a Thumbnail quality as a placeholder while higher quality loads',
          'settings.interface.previewQualityHelpThumbnail' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpThumbnail', {}) ?? ' - Thumbnail - Low resolution',
          'settings.interface.previewQualityHelpNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpNote', {}) ??
                '[Note]: Sample quality can noticeably degrade performance, especially if you have too many columns in preview grid',
          'settings.interface.previewDisplay' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplay', {}) ?? 'Preview display',
          'settings.interface.previewDisplayFallback' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallback', {}) ?? 'Preview display fallback',
          'settings.interface.previewDisplayFallbackHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallbackHelp', {}) ??
                'This will be used when Staggered option is not possible',
          'settings.interface.dontScaleImages' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImages', {}) ?? 'Don\'t scale images',
          'settings.interface.dontScaleImagesSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesSubtitle', {}) ?? 'May reduce performance',
          'settings.interface.dontScaleImagesWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningTitle', {}) ?? 'Warning',
          'settings.interface.dontScaleImagesWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarning', {}) ??
                'Are you sure you want to disable image scaling?',
          'settings.interface.dontScaleImagesWarningMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningMsg', {}) ??
                'This can negatively impact the performance, especially on older devices',
          'settings.interface.gifThumbnails' => TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnails', {}) ?? 'GIF thumbnails',
          'settings.interface.gifThumbnailsRequires' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnailsRequires', {}) ?? 'Requires «Don\'t scale images»',
          'settings.interface.scrollPreviewsButtonsPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.scrollPreviewsButtonsPosition', {}) ?? 'Scroll previews buttons position',
          'settings.interface.mouseWheelScrollModifier' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.mouseWheelScrollModifier', {}) ?? 'Mouse wheel scroll modifier',
          'settings.interface.scrollModifier' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.scrollModifier', {}) ?? 'Scroll modifier',
          'settings.interface.previewQualityValues.thumbnail' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.thumbnail', {}) ?? 'Thumbnail',
          'settings.interface.previewQualityValues.sample' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.sample', {}) ?? 'Sample',
          'settings.interface.previewDisplayModeValues.square' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.square', {}) ?? 'Square',
          'settings.interface.previewDisplayModeValues.rectangle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.rectangle', {}) ?? 'Rectangle',
          'settings.interface.previewDisplayModeValues.staggered' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.staggered', {}) ?? 'Staggered',
          'settings.interface.appModeValues.desktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.desktop', {}) ?? 'Desktop',
          'settings.interface.appModeValues.mobile' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.mobile', {}) ?? 'Mobile',
          'settings.interface.handSideValues.left' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.left', {}) ?? 'Left',
          'settings.interface.handSideValues.right' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.right', {}) ?? 'Right',
          'settings.theme.title' => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? 'Themes',
          'settings.theme.themeMode' => TranslationOverrides.string(_root.$meta, 'settings.theme.themeMode', {}) ?? 'Theme mode',
          'settings.theme.blackBg' => TranslationOverrides.string(_root.$meta, 'settings.theme.blackBg', {}) ?? 'Black background',
          'settings.theme.useDynamicColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? 'Use dynamic color',
          'settings.theme.android12PlusOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.android12PlusOnly', {}) ?? 'Android 12+ only',
          'settings.theme.theme' => TranslationOverrides.string(_root.$meta, 'settings.theme.theme', {}) ?? 'Theme',
          'settings.theme.primaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? 'Primary color',
          'settings.theme.secondaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? 'Secondary color',
          'settings.theme.enableDrawerMascot' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.enableDrawerMascot', {}) ?? 'Enable drawer mascot',
          'settings.theme.setCustomMascot' => TranslationOverrides.string(_root.$meta, 'settings.theme.setCustomMascot', {}) ?? 'Set custom mascot',
          'settings.theme.removeCustomMascot' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? 'Remove custom mascot',
          'settings.theme.currentMascotPath' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.currentMascotPath', {}) ?? 'Current mascot path',
          'settings.theme.system' => TranslationOverrides.string(_root.$meta, 'settings.theme.system', {}) ?? 'System',
          'settings.theme.light' => TranslationOverrides.string(_root.$meta, 'settings.theme.light', {}) ?? 'Light',
          'settings.theme.dark' => TranslationOverrides.string(_root.$meta, 'settings.theme.dark', {}) ?? 'Dark',
          'settings.theme.pink' => TranslationOverrides.string(_root.$meta, 'settings.theme.pink', {}) ?? 'Pink',
          'settings.theme.purple' => TranslationOverrides.string(_root.$meta, 'settings.theme.purple', {}) ?? 'Purple',
          'settings.theme.blue' => TranslationOverrides.string(_root.$meta, 'settings.theme.blue', {}) ?? 'Blue',
          'settings.theme.teal' => TranslationOverrides.string(_root.$meta, 'settings.theme.teal', {}) ?? 'Teal',
          'settings.theme.red' => TranslationOverrides.string(_root.$meta, 'settings.theme.red', {}) ?? 'Red',
          'settings.theme.green' => TranslationOverrides.string(_root.$meta, 'settings.theme.green', {}) ?? 'Green',
          'settings.theme.halloween' => TranslationOverrides.string(_root.$meta, 'settings.theme.halloween', {}) ?? 'Halloween',
          'settings.theme.custom' => TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? 'Custom',
          'settings.theme.selectColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.selectColor', {}) ?? 'Select color',
          'settings.theme.selectedColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColor', {}) ?? 'Selected color',
          'settings.theme.selectedColorAndShades' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColorAndShades', {}) ?? 'Selected color and its shades',
          'settings.theme.fontFamily' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontFamily', {}) ?? 'Font',
          'settings.theme.systemDefault' => TranslationOverrides.string(_root.$meta, 'settings.theme.systemDefault', {}) ?? 'System default',
          'settings.theme.viewMoreFonts' => TranslationOverrides.string(_root.$meta, 'settings.theme.viewMoreFonts', {}) ?? 'View more fonts',
          'settings.theme.fontPreviewText' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.fontPreviewText', {}) ?? 'The quick brown fox jumps over the lazy dog',
          'settings.theme.customFont' => TranslationOverrides.string(_root.$meta, 'settings.theme.customFont', {}) ?? 'Custom font',
          'settings.theme.customFontSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.customFontSubtitle', {}) ?? 'Enter any Google Font name',
          'settings.theme.fontName' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontName', {}) ?? 'Font name',
          'settings.theme.customFontHint' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.customFontHint', {}) ?? 'Browse fonts at fonts.google.com',
          'settings.theme.fontNotFound' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontNotFound', {}) ?? 'Font not found',
          'settings.viewer.title' => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? 'Viewer',
          'settings.viewer.preloadAmount' => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadAmount', {}) ?? 'Preload amount',
          'settings.viewer.preloadSizeLimit' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimit', {}) ?? 'Preload size limit',
          'settings.viewer.preloadSizeLimitSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimitSubtitle', {}) ?? 'in GB, 0 for no limit',
          'settings.viewer.preloadHeightLimit' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimit', {}) ?? 'Preload height limit',
          'settings.viewer.preloadHeightLimitSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimitSubtitle', {}) ?? 'in pixels, 0 for no limit',
          'settings.viewer.imageQuality' => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQuality', {}) ?? 'Image quality',
          'settings.viewer.viewerScrollDirection' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerScrollDirection', {}) ?? 'Viewer scroll direction',
          'settings.viewer.viewerToolbarPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerToolbarPosition', {}) ?? 'Viewer toolbar position',
          'settings.viewer.zoomButtonPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.zoomButtonPosition', {}) ?? 'Zoom button position',
          'settings.viewer.changePageButtonsPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.changePageButtonsPosition', {}) ?? 'Change page buttons position',
          'settings.viewer.hideToolbarWhenOpeningViewer' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.hideToolbarWhenOpeningViewer', {}) ?? 'Hide toolbar when opening viewer',
          'settings.viewer.expandDetailsByDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.expandDetailsByDefault', {}) ?? 'Expand details by default',
          'settings.viewer.hideTranslationNotesByDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.hideTranslationNotesByDefault', {}) ?? 'Hide translation notes by default',
          'settings.viewer.enableRotation' => TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotation', {}) ?? 'Enable rotation',
          'settings.viewer.enableRotationSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotationSubtitle', {}) ?? 'Double tap to reset',
          'settings.viewer.toolbarButtonsOrder' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarButtonsOrder', {}) ?? 'Toolbar buttons order',
          'settings.viewer.buttonsOrder' => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonsOrder', {}) ?? 'Buttons order',
          'settings.viewer.longPressToChangeItemOrder' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToChangeItemOrder', {}) ?? 'Long press to change item order.',
          'settings.viewer.atLeast4ButtonsVisibleOnToolbar' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.atLeast4ButtonsVisibleOnToolbar', {}) ??
                'At least 4 buttons from this list will be always visible on Toolbar.',
          'settings.viewer.otherButtonsWillGoIntoOverflow' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.otherButtonsWillGoIntoOverflow', {}) ??
                'Other buttons will go into overflow (three dots) menu.',
          'settings.viewer.longPressToMoveItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToMoveItems', {}) ?? 'Long press to move items',
          'settings.viewer.onlyForVideos' => TranslationOverrides.string(_root.$meta, 'settings.viewer.onlyForVideos', {}) ?? 'Only for videos',
          'settings.viewer.thisButtonCannotBeDisabled' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.thisButtonCannotBeDisabled', {}) ?? 'This button cannot be disabled',
          'settings.viewer.defaultShareAction' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.defaultShareAction', {}) ?? 'Default share action',
          'settings.viewer.shareActions' => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActions', {}) ?? 'Share actions',
          'settings.viewer.shareActionsAsk' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsAsk', {}) ?? '- Ask - always ask what to share',
          'settings.viewer.shareActionsPostURL' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURL', {}) ?? '- Post URL',
          'settings.viewer.shareActionsFileURL' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFileURL', {}) ??
                '- File URL - shares direct link to the original file (may not work with some sites)',
          'settings.viewer.shareActionsPostURLFileURLFileWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURLFileURLFileWithTags', {}) ??
                '- Post URL/File URL/File with tags - shares url/file and tags which you select',
          'settings.viewer.shareActionsFile' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFile', {}) ??
                '- File - shares the file itself, may take some time to load, progress will be shown on the Share button',
          'settings.viewer.shareActionsHydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsHydrus', {}) ??
                '- Hydrus - sends the post url to Hydrus for import',
          'settings.viewer.shareActionsNoteIfFileSavedInCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsNoteIfFileSavedInCache', {}) ??
                '[Note]: If File is saved in cache, it will be loaded from there. Otherwise it will be loaded again from network.',
          'settings.viewer.shareActionsTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsTip', {}) ??
                '[Tip]: You can open Share actions menu by long pressing Share button.',
          'settings.viewer.useVolumeButtonsForScrolling' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.useVolumeButtonsForScrolling', {}) ?? 'Use volume buttons for scrolling',
          'settings.viewer.volumeButtonsScrolling' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrolling', {}) ?? 'Volume buttons scrolling',
          'settings.viewer.volumeButtonsScrollingHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollingHelp', {}) ??
                'Use volume buttons to scroll through previews and viewer',
          'settings.viewer.volumeButtonsVolumeDown' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeDown', {}) ?? ' - Volume Down - next item',
          'settings.viewer.volumeButtonsVolumeUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeUp', {}) ?? ' - Volume Up - previous item',
          'settings.viewer.volumeButtonsInViewer' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsInViewer', {}) ?? 'In viewer:',
          'settings.viewer.volumeButtonsToolbarVisible' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarVisible', {}) ?? ' - Toolbar visible - controls volume',
          'settings.viewer.volumeButtonsToolbarHidden' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarHidden', {}) ?? ' - Toolbar hidden - controls scrolling',
          'settings.viewer.volumeButtonsScrollSpeed' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollSpeed', {}) ?? 'Volume buttons scroll speed',
          'settings.viewer.slideshowDurationInMs' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowDurationInMs', {}) ?? 'Slideshow duration (in ms)',
          'settings.viewer.slideshow' => TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshow', {}) ?? 'Slideshow',
          'settings.viewer.slideshowWIPNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowWIPNote', {}) ?? '[WIP] Videos/GIFs: manual scroll only',
          'settings.viewer.preventDeviceFromSleeping' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preventDeviceFromSleeping', {}) ?? 'Prevent device from sleeping',
          'settings.viewer.viewerOpenCloseAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerOpenCloseAnimation', {}) ?? 'Viewer open/close animation',
          'settings.viewer.viewerPageChangeAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerPageChangeAnimation', {}) ?? 'Viewer page change animation',
          'settings.viewer.usingDefaultAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.usingDefaultAnimation', {}) ?? 'Using default animation',
          'settings.viewer.usingCustomAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.usingCustomAnimation', {}) ?? 'Using custom animation',
          'settings.viewer.kannaLoadingGif' => TranslationOverrides.string(_root.$meta, 'settings.viewer.kannaLoadingGif', {}) ?? 'Kanna loading GIF',
          'settings.viewer.imageQualityValues.sample' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.sample', {}) ?? 'Sample',
          'settings.viewer.imageQualityValues.fullRes' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.fullRes', {}) ?? 'Original',
          'settings.viewer.scrollDirectionValues.horizontal' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.horizontal', {}) ?? 'Horizontal',
          'settings.viewer.scrollDirectionValues.vertical' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.vertical', {}) ?? 'Vertical',
          'settings.viewer.toolbarPositionValues.top' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.top', {}) ?? 'Top',
          'settings.viewer.toolbarPositionValues.bottom' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.bottom', {}) ?? 'Bottom',
          'settings.viewer.buttonPositionValues.disabled' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.disabled', {}) ?? 'Disabled',
          'settings.viewer.buttonPositionValues.left' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.left', {}) ?? 'Left',
          'settings.viewer.buttonPositionValues.right' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.right', {}) ?? 'Right',
          'settings.viewer.shareActionValues.ask' => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.ask', {}) ?? 'Ask',
          'settings.viewer.shareActionValues.postUrl' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrl', {}) ?? 'Post URL',
          'settings.viewer.shareActionValues.postUrlWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrlWithTags', {}) ?? 'Post URL with tags',
          'settings.viewer.shareActionValues.fileUrl' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrl', {}) ?? 'File URL',
          'settings.viewer.shareActionValues.fileUrlWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrlWithTags', {}) ?? 'File URL with tags',
          'settings.viewer.shareActionValues.file' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.file', {}) ?? 'File',
          'settings.viewer.shareActionValues.fileWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileWithTags', {}) ?? 'File with tags',
          'settings.viewer.shareActionValues.hydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.hydrus', {}) ?? 'Hydrus',
          'settings.video.title' => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? 'Video',
          'settings.video.disableVideos' => TranslationOverrides.string(_root.$meta, 'settings.video.disableVideos', {}) ?? 'Disable videos',
          'settings.video.disableVideosHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.disableVideosHelp', {}) ??
                'Useful on low end devices that crash when trying to load videos. Gives options to view video in external player or browser instead.',
          'settings.video.autoplayVideos' => TranslationOverrides.string(_root.$meta, 'settings.video.autoplayVideos', {}) ?? 'Autoplay videos',
          'settings.video.startVideosMuted' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.startVideosMuted', {}) ?? 'Start videos muted',
          'settings.video.experimental' => TranslationOverrides.string(_root.$meta, 'settings.video.experimental', {}) ?? '[Experimental]',
          'settings.video.videoPlayerBackend' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoPlayerBackend', {}) ?? 'Video player backend',
          'settings.video.backendDefault' => TranslationOverrides.string(_root.$meta, 'settings.video.backendDefault', {}) ?? 'Default',
          'settings.video.backendMPV' => TranslationOverrides.string(_root.$meta, 'settings.video.backendMPV', {}) ?? 'MPV',
          'settings.video.backendMDK' => TranslationOverrides.string(_root.$meta, 'settings.video.backendMDK', {}) ?? 'MDK',
          'settings.video.backendDefaultHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.backendDefaultHelp', {}) ??
                'Based on exoplayer. Has best device compatibility, may have issues with 4K videos, some codecs or older devices',
          'settings.video.backendMPVHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.backendMPVHelp', {}) ??
                'Based on libmpv, has advanced settings which may help fix problems with some codecs/devices\n[MAY CAUSE CRASHES]',
          'settings.video.backendMDKHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.backendMDKHelp', {}) ??
                'Based on libmdk, may have better performance for some codecs/devices\n[MAY CAUSE CRASHES]',
          'settings.video.mpvSettingsHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.mpvSettingsHelp', {}) ??
                'Try different values of \'MPV\' settings below if videos don\'t work correctly or give codec errors:',
          'settings.video.mpvUseHardwareAcceleration' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.mpvUseHardwareAcceleration', {}) ?? 'MPV: use hardware acceleration',
          'settings.video.mpvVO' => TranslationOverrides.string(_root.$meta, 'settings.video.mpvVO', {}) ?? 'MPV: VO',
          'settings.video.mpvHWDEC' => TranslationOverrides.string(_root.$meta, 'settings.video.mpvHWDEC', {}) ?? 'MPV: HWDEC',
          'settings.video.videoCacheMode' => TranslationOverrides.string(_root.$meta, 'settings.video.videoCacheMode', {}) ?? 'Video cache mode',
          'settings.video.cacheModes.title' => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.title', {}) ?? 'Video cache modes',
          'settings.video.cacheModes.streamMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamMode', {}) ??
                '- Stream - Don\'t cache, start playing as soon as possible',
          'settings.video.cacheModes.cacheMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheMode', {}) ??
                '- Cache - Saves the file to device storage, plays only when download is complete',
          'settings.video.cacheModes.streamCacheMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamCacheMode', {}) ??
                '- Stream+Cache - Mix of both, but currently leads to double download',
          'settings.video.cacheModes.cacheNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheNote', {}) ??
                '[Note]: Videos will cache only if \'Cache Media\' is enabled.',
          'settings.video.cacheModes.desktopWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.desktopWarning', {}) ??
                '[Warning]: On desktop Stream mode can work incorrectly for some Boorus.',
          'settings.video.cacheModeValues.stream' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.stream', {}) ?? 'Stream',
          'settings.video.cacheModeValues.cache' => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.cache', {}) ?? 'Cache',
          'settings.video.cacheModeValues.streamCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.streamCache', {}) ?? 'Stream+Cache',
          _ => null,
        } ??
        switch (path) {
          'settings.video.videoBackendModeValues.normal' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.normal', {}) ?? 'Default',
          'settings.video.videoBackendModeValues.mpv' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mpv', {}) ?? 'MPV',
          'settings.video.videoBackendModeValues.mdk' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mdk', {}) ?? 'MDK',
          'settings.downloads.fromNextItemInQueue' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.fromNextItemInQueue', {}) ?? 'From next item in queue',
          'settings.downloads.pleaseProvideStoragePermission' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.pleaseProvideStoragePermission', {}) ??
                'Please provide storage permission in order to download files',
          'settings.downloads.noItemsSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsSelected', {}) ?? 'No items selected',
          'settings.downloads.noItemsQueued' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsQueued', {}) ?? 'No items in queue',
          'settings.downloads.batch' => TranslationOverrides.string(_root.$meta, 'settings.downloads.batch', {}) ?? 'Batch',
          'settings.downloads.snatchSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? 'Snatch selected',
          'settings.downloads.removeSnatchedStatusFromSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ??
                'Remove snatched status from selected',
          'settings.downloads.favouriteSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? 'Favorite selected',
          'settings.downloads.unfavouriteSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? 'Unfavorite selected',
          'settings.downloads.clearSelected' => TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? 'Clear selected',
          'settings.downloads.updatingData' => TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? 'Updating data…',
          'settings.database.title' => TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? 'Database',
          'settings.database.indexingDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? 'Indexing database',
          'settings.database.droppingIndexes' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? 'Dropping indexes',
          'settings.database.enableDatabase' => TranslationOverrides.string(_root.$meta, 'settings.database.enableDatabase', {}) ?? 'Enable database',
          'settings.database.enableIndexing' => TranslationOverrides.string(_root.$meta, 'settings.database.enableIndexing', {}) ?? 'Enable indexing',
          'settings.database.enableSearchHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableSearchHistory', {}) ?? 'Enable search history',
          'settings.database.enableTagTypeFetching' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableTagTypeFetching', {}) ?? 'Enable tag type fetching',
          'settings.database.sankakuTypeToUpdate' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuTypeToUpdate', {}) ?? 'Sankaku type to update',
          'settings.database.searchQuery' => TranslationOverrides.string(_root.$meta, 'settings.database.searchQuery', {}) ?? 'Search query',
          'settings.database.searchQueryOptional' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchQueryOptional', {}) ?? '(optional, may make the process slower)',
          'settings.database.cantLeavePageNow' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.cantLeavePageNow', {}) ?? 'Can\'t leave the page right now!',
          'settings.database.sankakuDataUpdating' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDataUpdating', {}) ??
                'Sankaku data is being updated, wait until it ends or cancel manually at the bottom of the page',
          'settings.database.pleaseWaitTitle' => TranslationOverrides.string(_root.$meta, 'settings.database.pleaseWaitTitle', {}) ?? 'Please wait!',
          'settings.database.indexesBeingChanged' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexesBeingChanged', {}) ?? 'Indexes are being changed',
          'settings.database.databaseInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfo', {}) ?? 'Stores favourites and tracks snatched items',
          'settings.database.databaseInfoSnatch' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfoSnatch', {}) ?? 'Snatched items won\'t be re-downloaded',
          'settings.database.indexingInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexingInfo', {}) ??
                'Speeds up database searches but uses more disk space (up to 2x).\n\nDon\'t leave page or close app while indexing.',
          'settings.database.createIndexesDebug' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.createIndexesDebug', {}) ?? 'Create Indexes [Debug]',
          'settings.database.dropIndexesDebug' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.dropIndexesDebug', {}) ?? 'Drop Indexes [Debug]',
          'settings.database.searchHistoryInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryInfo', {}) ?? 'Requires database to be enabled.',
          'settings.database.searchHistoryRecords' =>
            ({required int limit}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryRecords', {'limit': limit}) ??
                'Saves last ${limit} searches',
          'settings.database.searchHistoryTapInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryTapInfo', {}) ?? 'Tap entry for actions (Delete, Favourite…)',
          'settings.database.searchHistoryFavouritesInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryFavouritesInfo', {}) ??
                'Favourited queries are pinned to the top of the list and will not be counted towards the limit.',
          'settings.database.tagTypeFetchingInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingInfo', {}) ?? 'Fetches tag types from supported boorus',
          'settings.database.tagTypeFetchingWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingWarning', {}) ?? 'May cause rate limiting',
          'settings.database.deleteDatabase' => TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabase', {}) ?? 'Delete database',
          'settings.database.deleteDatabaseConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabaseConfirm', {}) ?? 'Delete database?',
          'settings.database.databaseDeleted' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseDeleted', {}) ?? 'Database deleted!',
          'settings.database.appRestartRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.appRestartRequired', {}) ?? 'An app restart is required!',
          'settings.database.clearSnatchedItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSnatchedItems', {}) ?? 'Clear snatched items',
          'settings.database.clearAllSnatchedConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearAllSnatchedConfirm', {}) ?? 'Clear all snatched items?',
          'settings.database.snatchedItemsCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.snatchedItemsCleared', {}) ?? 'Snatched items cleared',
          'settings.database.appRestartMayBeRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.appRestartMayBeRequired', {}) ?? 'An app restart may be required!',
          'settings.database.clearFavouritedItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearFavouritedItems', {}) ?? 'Clear favourited items',
          'settings.database.clearAllFavouritedConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearAllFavouritedConfirm', {}) ?? 'Clear all favourited items?',
          'settings.database.favouritesCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.favouritesCleared', {}) ?? 'Favourites cleared',
          'settings.database.clearSearchHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistory', {}) ?? 'Clear search history',
          'settings.database.clearSearchHistoryConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistoryConfirm', {}) ?? 'Clear search history?',
          'settings.database.searchHistoryCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryCleared', {}) ?? 'Search history cleared',
          'settings.database.sankakuFavouritesUpdate' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdate', {}) ?? 'Sankaku favourites update',
          'settings.database.sankakuFavouritesUpdateStarted' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateStarted', {}) ?? 'Sankaku favourites update started',
          'settings.database.sankakuNewUrlsInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuNewUrlsInfo', {}) ??
                'New image urls will be fetched for Sankaku items in your favourites',
          'settings.database.sankakuDontLeavePage' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDontLeavePage', {}) ??
                'Don\'t leave this page until the process is complete or stopped',
          'settings.database.noSankakuConfigFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.noSankakuConfigFound', {}) ?? 'No Sankaku config found!',
          'settings.database.sankakuFavouritesUpdateComplete' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateComplete', {}) ?? 'Sankaku favourites update complete',
          'settings.database.failedItemsPurgeStartedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeStartedTitle', {}) ?? 'Failed item purge started',
          'settings.database.failedItemsPurgeInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeInfo', {}) ??
                'Items that failed to update will be removed from the database',
          'settings.database.updateSankakuUrls' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.updateSankakuUrls', {}) ?? 'Update Sankaku URLs',
          'settings.database.updating' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.updating', {'count': count}) ?? 'Updating ${count} items:',
          'settings.database.left' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.left', {'count': count}) ?? 'Left: ${count}',
          'settings.database.done' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.done', {'count': count}) ?? 'Done: ${count}',
          'settings.database.failedSkipped' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.failedSkipped', {'count': count}) ?? 'Failed/Skipped: ${count}',
          'settings.database.sankakuRateLimitWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuRateLimitWarning', {}) ??
                'Stop and try again later if you start seeing \'Failed\' number constantly growing, you could have reached rate limit and/or Sankaku blocks requests from your IP.',
          'settings.database.skipCurrentItem' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.skipCurrentItem', {}) ?? 'Press here to skip current item',
          'settings.database.useIfStuck' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.useIfStuck', {}) ?? 'Use if item appears to be stuck',
          'settings.database.pressToStop' => TranslationOverrides.string(_root.$meta, 'settings.database.pressToStop', {}) ?? 'Press here to stop',
          'settings.database.purgeFailedItems' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.purgeFailedItems', {'count': count}) ?? 'Purge failed items (${count})',
          'settings.database.retryFailedItems' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.retryFailedItems', {'count': count}) ?? 'Retry failed items (${count})',
          'settings.backupAndRestore.title' => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.title', {}) ?? 'Backup & Restore',
          'settings.backupAndRestore.duplicateFileDetectedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedTitle', {}) ?? 'Duplicate file detected!',
          'settings.backupAndRestore.duplicateFileDetectedMsg' =>
            ({required String fileName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
                'The file ${fileName} already exists. Do you want to overwrite it? If you choose no, the backup will be cancelled.',
          'settings.backupAndRestore.androidOnlyFeatureMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ??
                'This feature is only available on Android, on Desktop builds you can just copy/paste files from/to app\'s data folder, respective to your system',
          'settings.backupAndRestore.selectBackupDir' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? 'Select backup directory',
          'settings.backupAndRestore.failedToGetBackupPath' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ?? 'Failed to get backup path',
          'settings.backupAndRestore.backupPathMsg' =>
            ({required String backupPath}) =>
                TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ??
                'Backup path is: ${backupPath}',
          'settings.backupAndRestore.noBackupDirSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ?? 'No backup directory selected',
          'settings.backupAndRestore.restoreInfoMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ?? 'Files must be in directory root',
          'settings.backupAndRestore.backupSettings' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? 'Backup settings',
          'settings.backupAndRestore.restoreSettings' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? 'Restore settings',
          'settings.backupAndRestore.settingsBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ?? 'Settings backed up to settings.json',
          'settings.backupAndRestore.settingsRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? 'Settings restored from backup',
          'settings.backupAndRestore.backupSettingsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ?? 'Failed to backup settings',
          'settings.backupAndRestore.restoreSettingsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ?? 'Failed to restore settings',
          'settings.backupAndRestore.resetBackupDir' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.resetBackupDir', {}) ?? 'Reset backup directory',
          'settings.backupAndRestore.backupBoorus' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ?? 'Backup boorus',
          'settings.backupAndRestore.restoreBoorus' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? 'Restore boorus',
          'settings.backupAndRestore.boorusBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ?? 'Boorus backed up to boorus.json',
          'settings.backupAndRestore.boorusRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ?? 'Boorus restored from backup',
          'settings.backupAndRestore.backupBoorusError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ?? 'Failed to backup boorus',
          'settings.backupAndRestore.restoreBoorusError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ?? 'Failed to restore boorus',
          'settings.backupAndRestore.backupDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? 'Backup database',
          'settings.backupAndRestore.restoreDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? 'Restore database',
          'settings.backupAndRestore.restoreDatabaseInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ??
                'May take a while depending on the size of the database, will restart the app on success',
          'settings.backupAndRestore.databaseBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ?? 'Database backed up to store.db',
          'settings.backupAndRestore.databaseRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ??
                'Database restored from backup! App will restart in a few seconds!',
          'settings.backupAndRestore.backupDatabaseError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ?? 'Failed to backup database',
          'settings.backupAndRestore.restoreDatabaseError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ?? 'Failed to restore database',
          'settings.backupAndRestore.databaseFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ??
                'Database file not found or cannot be read!',
          'settings.backupAndRestore.backupTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? 'Backup tags',
          'settings.backupAndRestore.restoreTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? 'Restore tags',
          'settings.backupAndRestore.restoreTagsInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ??
                'May take a while if you have a lot of tags. If you did a database restore, you don\'t need to do this because it\'s already included in the database',
          'settings.backupAndRestore.tagsBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? 'Tags backed up to tags.json',
          'settings.backupAndRestore.tagsRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? 'Tags restored from backup',
          'settings.backupAndRestore.backupTagsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? 'Failed to backup tags',
          'settings.backupAndRestore.restoreTagsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? 'Failed to restore tags',
          'settings.backupAndRestore.tagsFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsFileNotFound', {}) ?? 'Tags file not found or cannot be read!',
          'settings.backupAndRestore.operationTakesTooLongMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.operationTakesTooLongMsg', {}) ??
                'Press Hide below if it takes too long, operation will continue in background',
          'settings.backupAndRestore.backupFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupFileNotFound', {}) ??
                'Backup file not found or cannot be read!',
          'settings.backupAndRestore.backupDirNoAccess' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDirNoAccess', {}) ?? 'No access to backup directory!',
          'settings.backupAndRestore.backupCancelled' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? 'Backup cancelled',
          'settings.network.title' => TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? 'Network',
          'settings.network.enableSelfSignedSSLCertificates' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.enableSelfSignedSSLCertificates', {}) ?? 'Enable self signed SSL certificates',
          'settings.network.proxy' => TranslationOverrides.string(_root.$meta, 'settings.network.proxy', {}) ?? 'Proxy',
          'settings.network.proxySubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.proxySubtitle', {}) ??
                'Does not apply to streaming video mode, use caching video mode instead',
          'settings.network.customUserAgent' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgent', {}) ?? 'Custom User-Agent',
          'settings.network.customUserAgentTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgentTitle', {}) ?? 'Custom User-Agent',
          'settings.network.keepEmptyForDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.keepEmptyForDefault', {}) ?? 'Keep empty to use default value',
          'settings.network.defaultUserAgent' =>
            ({required String agent}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.defaultUserAgent', {'agent': agent}) ?? 'Default: ${agent}',
          'settings.network.userAgentUsedOnRequests' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.userAgentUsedOnRequests', {}) ?? 'Used for most booru requests and webview',
          'settings.network.valueSavedAfterLeaving' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.valueSavedAfterLeaving', {}) ?? 'Saved on page exit',
          'settings.network.setBrowserUserAgent' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.setBrowserUserAgent', {}) ??
                'Tap here to use Chrome browser User-Agent (recommended only when site bans non-browser user agents)',
          'settings.network.cookieCleaner' => TranslationOverrides.string(_root.$meta, 'settings.network.cookieCleaner', {}) ?? 'Cookie cleaner',
          'settings.network.selectBooruToClearCookies' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.selectBooruToClearCookies', {}) ??
                'Select a booru to clear cookies for or leave empty to clear all',
          'settings.network.cookiesFor' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookiesFor', {'booruName': booruName}) ?? 'Cookies for ${booruName}:',
          'settings.network.cookieDeleted' =>
            ({required String cookieName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookieDeleted', {'cookieName': cookieName}) ??
                '«${cookieName}» cookie deleted',
          'settings.network.clearCookies' => TranslationOverrides.string(_root.$meta, 'settings.network.clearCookies', {}) ?? 'Clear cookies',
          'settings.network.clearCookiesFor' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.clearCookiesFor', {'booruName': booruName}) ??
                'Clear cookies for ${booruName}',
          'settings.network.cookiesForBooruDeleted' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookiesForBooruDeleted', {'booruName': booruName}) ??
                'Cookies for ${booruName} deleted',
          'settings.network.allCookiesDeleted' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.allCookiesDeleted', {}) ?? 'All cookies deleted',
          'settings.privacy.title' => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? 'Privacy',
          'settings.privacy.appLock' => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? 'App lock',
          'settings.privacy.appLockMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ??
                'Lock app manually or after idle timeout. Requires PIN/biometrics',
          'settings.privacy.autoLockAfter' => TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfter', {}) ?? 'Auto lock after',
          'settings.privacy.autoLockAfterTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfterTip', {}) ?? 'in seconds, 0 to disable',
          'settings.privacy.bluronLeave' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeave', {}) ?? 'Blur screen when leaving the app',
          'settings.privacy.bluronLeaveMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeaveMsg', {}) ??
                'May not work on some devices due to system limitations',
          'settings.privacy.incognitoKeyboard' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboard', {}) ?? 'Incognito keyboard',
          'settings.privacy.incognitoKeyboardMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboardMsg', {}) ??
                'Prevents keyboard from saving typing history.\nApplied to most text inputs',
          'settings.privacy.appDisplayName' => TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayName', {}) ?? 'App display name',
          'settings.privacy.appDisplayNameDescription' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayNameDescription', {}) ??
                'Change how the app name appears in your launcher',
          'settings.privacy.appAliasChanged' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChanged', {}) ?? 'App name changed',
          'settings.privacy.appAliasRestartHint' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasRestartHint', {}) ??
                'The app name change will take effect after restarting the app. Some launchers may need additional time or system reboot to update.',
          'settings.privacy.appAliasChangeFailed' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChangeFailed', {}) ?? 'Failed to change app name. Please try again.',
          'settings.privacy.restartNow' => TranslationOverrides.string(_root.$meta, 'settings.privacy.restartNow', {}) ?? 'Restart now',
          'settings.performance.title' => TranslationOverrides.string(_root.$meta, 'settings.performance.title', {}) ?? 'Performance',
          'settings.performance.lowPerformanceMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceMode', {}) ?? 'Low performance mode',
          'settings.performance.lowPerformanceModeSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeSubtitle', {}) ??
                'Recommended for old devices and devices with low RAM',
          'settings.performance.lowPerformanceModeDialogTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogTitle', {}) ?? 'Low performance mode',
          'settings.performance.lowPerformanceModeDialogDisablesDetailed' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesDetailed', {}) ??
                '- Disables detailed loading progress information',
          'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive', {}) ??
                '- Disables resource-intensive elements (blurs, animated opacity, some animations…)',
          'settings.performance.lowPerformanceModeDialogSetsOptimal' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogSetsOptimal', {}) ??
                'Sets optimal settings for these options (you can change them separately later):',
          'settings.performance.autoplayVideos' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.autoplayVideos', {}) ?? 'Autoplay videos',
          'settings.performance.disableVideos' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideos', {}) ?? 'Disable videos',
          'settings.performance.disableVideosHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideosHelp', {}) ??
                'Useful on low end devices that crash when trying to load videos. Gives options to view video in external player or browser instead.',
          'settings.cache.title' => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? 'Snatching & Caching',
          'settings.cache.snatchQuality' => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchQuality', {}) ?? 'Snatch quality',
          'settings.cache.snatchCooldown' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.snatchCooldown', {}) ?? 'Snatch cooldown (in ms)',
          'settings.cache.pleaseEnterAValidTimeout' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.pleaseEnterAValidTimeout', {}) ?? 'Please enter a valid timeout value',
          'settings.cache.biggerThan10' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.biggerThan10', {}) ?? 'Please enter a value bigger than 10ms',
          'settings.cache.showDownloadNotifications' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.showDownloadNotifications', {}) ?? 'Show download notifications',
          'settings.cache.snatchItemsOnFavouriting' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.snatchItemsOnFavouriting', {}) ?? 'Snatch items on favouriting',
          'settings.cache.favouriteItemsOnSnatching' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.favouriteItemsOnSnatching', {}) ?? 'Favourite items on snatching',
          'settings.cache.writeImageDataOnSave' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.writeImageDataOnSave', {}) ?? 'Write image data to JSON on save',
          'settings.cache.requiresCustomStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.requiresCustomStorageDirectory', {}) ?? 'Requires custom directory',
          'settings.cache.setStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.setStorageDirectory', {}) ?? 'Set storage directory',
          'settings.cache.currentPath' =>
            ({required String path}) => TranslationOverrides.string(_root.$meta, 'settings.cache.currentPath', {'path': path}) ?? 'Current: ${path}',
          'settings.cache.resetStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.resetStorageDirectory', {}) ?? 'Reset storage directory',
          'settings.cache.cachePreviews' => TranslationOverrides.string(_root.$meta, 'settings.cache.cachePreviews', {}) ?? 'Cache previews',
          'settings.cache.cacheMedia' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheMedia', {}) ?? 'Cache media',
          'settings.cache.videoCacheMode' => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheMode', {}) ?? 'Video cache mode',
          'settings.cache.videoCacheModesTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModesTitle', {}) ?? 'Video cache modes',
          'settings.cache.videoCacheModeStream' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStream', {}) ??
                '- Stream - Don\'t cache, start playing as soon as possible',
          'settings.cache.videoCacheModeCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeCache', {}) ??
                '- Cache - Saves the file to device storage, plays only when download is complete',
          'settings.cache.videoCacheModeStreamCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStreamCache', {}) ??
                '- Stream+Cache - Mix of both, but currently leads to double download',
          'settings.cache.videoCacheNoteEnable' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheNoteEnable', {}) ??
                '[Note]: Videos will cache only if \'Cache Media\' is enabled.',
          'settings.cache.videoCacheWarningDesktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheWarningDesktop', {}) ??
                '[Warning]: On desktop Stream mode can work incorrectly for some Boorus.',
          'settings.cache.deleteCacheAfter' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.deleteCacheAfter', {}) ?? 'Delete cache after:',
          'settings.cache.cacheSizeLimit' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.cacheSizeLimit', {}) ?? 'Cache size Limit (in GB)',
          'settings.cache.maximumTotalCacheSize' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.maximumTotalCacheSize', {}) ?? 'Maximum total cache size',
          'settings.cache.cacheStats' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheStats', {}) ?? 'Cache stats:',
          'settings.cache.loading' => TranslationOverrides.string(_root.$meta, 'settings.cache.loading', {}) ?? 'Loading…',
          'settings.cache.empty' => TranslationOverrides.string(_root.$meta, 'settings.cache.empty', {}) ?? 'Empty',
          'settings.cache.inFilesPlural' =>
            ({required String size, required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.cache.inFilesPlural', {'size': size, 'count': count}) ?? '${size}, ${count} files',
          'settings.cache.inFileSingular' =>
            ({required String size}) =>
                TranslationOverrides.string(_root.$meta, 'settings.cache.inFileSingular', {'size': size}) ?? '${size}, 1 file',
          'settings.cache.cacheTypeTotal' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeTotal', {}) ?? 'Total',
          'settings.cache.cacheTypeFavicons' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeFavicons', {}) ?? 'Favicons',
          'settings.cache.cacheTypeThumbnails' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeThumbnails', {}) ?? 'Thumbnails',
          'settings.cache.cacheTypeSamples' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeSamples', {}) ?? 'Samples',
          'settings.cache.cacheTypeMedia' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeMedia', {}) ?? 'Media',
          'settings.cache.cacheTypeWebView' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeWebView', {}) ?? 'WebView',
          'settings.cache.cacheCleared' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheCleared', {}) ?? 'Cache cleared',
          'settings.cache.clearedCacheType' =>
            ({required String type}) =>
                TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheType', {'type': type}) ?? 'Cleared ${type} cache',
          'settings.cache.clearAllCache' => TranslationOverrides.string(_root.$meta, 'settings.cache.clearAllCache', {}) ?? 'Clear all cache',
          'settings.cache.clearedCacheCompletely' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheCompletely', {}) ?? 'Cleared cache completely',
          'settings.cache.appRestartRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.appRestartRequired', {}) ?? 'App Restart may be required!',
          'settings.cache.errorExclamation' => TranslationOverrides.string(_root.$meta, 'settings.cache.errorExclamation', {}) ?? 'Error!',
          'settings.cache.notAvailableForPlatform' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.notAvailableForPlatform', {}) ?? 'Currently not available for this platform',
          'settings.itemFilters.title' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.title', {}) ?? 'Filters',
          'settings.itemFilters.hidden' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.hidden', {}) ?? 'Hidden',
          'settings.itemFilters.marked' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.marked', {}) ?? 'Marked',
          'settings.itemFilters.duplicateFilter' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.duplicateFilter', {}) ?? 'Duplicate filter',
          'settings.itemFilters.alreadyInList' =>
            ({required String tag, required String type}) =>
                TranslationOverrides.string(_root.$meta, 'settings.itemFilters.alreadyInList', {'tag': tag, 'type': type}) ??
                '\'${tag}\' is already in ${type} list',
          'settings.itemFilters.noFiltersFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersFound', {}) ?? 'No filters found',
          'settings.itemFilters.noFiltersAdded' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersAdded', {}) ?? 'No filters added',
          'settings.itemFilters.removeHidden' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeHidden', {}) ?? 'Completely hide items which match Hidden filters',
          'settings.itemFilters.removeMarked' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeMarked', {}) ?? 'Completely hide items which match Marked filters',
          'settings.itemFilters.removeFavourited' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeFavourited', {}) ?? 'Remove favourited items',
          'settings.itemFilters.removeSnatched' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeSnatched', {}) ?? 'Remove snatched items',
          'settings.itemFilters.removeAI' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeAI', {}) ?? 'Remove AI items',
          'settings.sync.title' => TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? 'LoliSync',
          'settings.sync.dbError' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ?? 'Database must be enabled to use LoliSync',
          'settings.sync.errorTitle' => TranslationOverrides.string(_root.$meta, 'settings.sync.errorTitle', {}) ?? 'Error!',
          'settings.sync.pleaseEnterIPAndPort' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.pleaseEnterIPAndPort', {}) ?? 'Please enter IP address and port.',
          'settings.sync.selectWhatYouWantToDo' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.selectWhatYouWantToDo', {}) ?? 'Select what you want to do',
          'settings.sync.sendDataToDevice' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendDataToDevice', {}) ?? 'SEND data TO another device',
          'settings.sync.receiveDataFromDevice' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.receiveDataFromDevice', {}) ?? 'RECEIVE data FROM another device',
          'settings.sync.senderInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.senderInstructions', {}) ??
                'Start server on other device, enter its IP/port, then tap Start sync',
          'settings.sync.ipAddress' => TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddress', {}) ?? 'IP Address',
          'settings.sync.ipAddressPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddressPlaceholder', {}) ?? 'Host IP Address (i.e. 192.168.1.1)',
          'settings.sync.port' => TranslationOverrides.string(_root.$meta, 'settings.sync.port', {}) ?? 'Port',
          'settings.sync.portPlaceholder' => TranslationOverrides.string(_root.$meta, 'settings.sync.portPlaceholder', {}) ?? 'Host Port (i.e. 7777)',
          'settings.sync.sendFavourites' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavourites', {}) ?? 'Send favourites',
          'settings.sync.favouritesCount' =>
            ({required String count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.favouritesCount', {'count': count}) ?? 'Favorites: ${count}',
          'settings.sync.sendFavouritesLegacy' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavouritesLegacy', {}) ?? 'Send favourites (Legacy)',
          'settings.sync.syncFavsFrom' => TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFrom', {}) ?? 'Sync favs from #…',
          'settings.sync.syncFavsFromHelpText1' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText1', {}) ??
                'Allows to set from where the sync should start from, useful if you already synced all your favs before and want to sync only the newest items',
          'settings.sync.syncFavsFromHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText2', {}) ??
                'If you want to sync from the beginning leave this field blank',
          'settings.sync.syncFavsFromHelpText3' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText3', {}) ??
                'Example: You have X amount of favs, set this field to 100, sync will start from item #100 and go until it reaches X',
          'settings.sync.syncFavsFromHelpText4' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText4', {}) ?? 'Order of favs: From oldest (0) to newest (X)',
          'settings.sync.sendSnatchedHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendSnatchedHistory', {}) ?? 'Send snatched history',
          'settings.sync.snatchedCount' =>
            ({required String count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.snatchedCount', {'count': count}) ?? 'Snatched: ${count}',
          'settings.sync.syncSnatchedFrom' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFrom', {}) ?? 'Sync snatched from #…',
          'settings.sync.syncSnatchedFromHelpText1' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText1', {}) ??
                'Allows to set from where the sync should start from, useful if you already synced all your snatched history before and want to sync only the newest items',
          'settings.sync.syncSnatchedFromHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText2', {}) ??
                'If you want to sync from the beginning leave this field blank',
          'settings.sync.syncSnatchedFromHelpText3' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText3', {}) ??
                'Example: You have X amount of favs, set this field to 100, sync will start from item #100 and go until it reaches X',
          'settings.sync.syncSnatchedFromHelpText4' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText4', {}) ?? 'Order of favs: From oldest (0) to newest (X)',
          'settings.sync.sendSettings' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSettings', {}) ?? 'Send settings',
          'settings.sync.sendBooruConfigs' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendBooruConfigs', {}) ?? 'Send booru configs',
          'settings.sync.configsCount' =>
            ({required String count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.configsCount', {'count': count}) ?? 'Configs: ${count}',
          'settings.sync.sendTabs' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTabs', {}) ?? 'Send tabs',
          'settings.sync.tabsCount' =>
            ({required String count}) => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsCount', {'count': count}) ?? 'Tabs: ${count}',
          'settings.sync.tabsSyncMode' => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncMode', {}) ?? 'Tabs sync mode',
          'settings.sync.tabsSyncModeMerge' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeMerge', {}) ??
                'Merge: Merge the tabs from this device on the other device, tabs with unknown boorus and already existing tabs will be ignored',
          'settings.sync.tabsSyncModeReplace' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeReplace', {}) ??
                'Replace: Completely replace the tabs on the other device with the tabs from this device',
          'settings.sync.merge' => TranslationOverrides.string(_root.$meta, 'settings.sync.merge', {}) ?? 'Merge',
          'settings.sync.replace' => TranslationOverrides.string(_root.$meta, 'settings.sync.replace', {}) ?? 'Replace',
          'settings.sync.sendTags' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTags', {}) ?? 'Send tags',
          'settings.sync.tagsCount' =>
            ({required String count}) => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsCount', {'count': count}) ?? 'Tags: ${count}',
          'settings.sync.tagsSyncMode' => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncMode', {}) ?? 'Tags sync mode',
          'settings.sync.tagsSyncModePreferTypeIfNone' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModePreferTypeIfNone', {}) ??
                'Preserve type: If the tag exists with a tag type on the other device and it doesn\'t on this device it will be skipped',
          'settings.sync.tagsSyncModeOverwrite' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModeOverwrite', {}) ??
                'Overwrite: All tags will be added, if a tag and tag type exists on the other device it will be overwritten',
          'settings.sync.preferTypeIfNone' => TranslationOverrides.string(_root.$meta, 'settings.sync.preferTypeIfNone', {}) ?? 'Preserve type',
          'settings.sync.overwrite' => TranslationOverrides.string(_root.$meta, 'settings.sync.overwrite', {}) ?? 'Overwrite',
          'settings.sync.testConnection' => TranslationOverrides.string(_root.$meta, 'settings.sync.testConnection', {}) ?? 'Test connection',
          'settings.sync.testConnectionHelpText1' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText1', {}) ?? 'Sends test request to other device.',
          'settings.sync.testConnectionHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText2', {}) ?? 'Shows success/failure notification.',
          'settings.sync.startSync' => TranslationOverrides.string(_root.$meta, 'settings.sync.startSync', {}) ?? 'Start sync',
          'settings.sync.portAndIPCannotBeEmpty' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.portAndIPCannotBeEmpty', {}) ?? 'The Port and IP fields cannot be empty!',
          'settings.sync.nothingSelectedToSync' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.nothingSelectedToSync', {}) ?? 'You haven\'t selected anything to sync!',
          'settings.sync.statsOfThisDevice' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.statsOfThisDevice', {}) ?? 'Stats of this device:',
          'settings.sync.receiverInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.receiverInstructions', {}) ??
                'Start server to receive data. Avoid public WiFi for security',
          'settings.sync.availableNetworkInterfaces' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.availableNetworkInterfaces', {}) ?? 'Available network interfaces',
          'settings.sync.selectedInterfaceIP' =>
            ({required String ip}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.selectedInterfaceIP', {'ip': ip}) ?? 'Selected interface IP: ${ip}',
          'settings.sync.serverPort' => TranslationOverrides.string(_root.$meta, 'settings.sync.serverPort', {}) ?? 'Server port',
          'settings.sync.serverPortPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.serverPortPlaceholder', {}) ?? '(will default to \'8080\' if empty)',
          'settings.sync.startReceiverServer' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.startReceiverServer', {}) ?? 'Start receiver server',
          'settings.about.title' => TranslationOverrides.string(_root.$meta, 'settings.about.title', {}) ?? 'About',
          'settings.about.appDescription' =>
            TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ??
                'LoliSnatcher is open source and licensed under GPLv3 the source code is available on github. Please report any issues or feature requests in the issues section of the repo.',
          'settings.about.appOnGitHub' => TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? 'LoliSnatcher on Github',
          'settings.about.contact' => TranslationOverrides.string(_root.$meta, 'settings.about.contact', {}) ?? 'Contact',
          'settings.about.emailCopied' => TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? 'Email copied to clipboard',
          'settings.about.logoArtistThanks' =>
            TranslationOverrides.string(_root.$meta, 'settings.about.logoArtistThanks', {}) ??
                'A big thanks to Showers-U for letting us use their artwork for the app logo. Please check them out on Pixiv',
          'settings.about.developers' => TranslationOverrides.string(_root.$meta, 'settings.about.developers', {}) ?? 'Developers',
          'settings.about.releases' => TranslationOverrides.string(_root.$meta, 'settings.about.releases', {}) ?? 'Releases',
          'settings.about.releasesMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.about.releasesMsg', {}) ??
                'Latest version and full changelogs can be found at the Github Releases page:',
          'settings.about.licenses' => TranslationOverrides.string(_root.$meta, 'settings.about.licenses', {}) ?? 'Licenses',
          'settings.checkForUpdates.title' => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.title', {}) ?? 'Check for updates',
          'settings.checkForUpdates.updateAvailable' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateAvailable', {}) ?? 'Update available!',
          'settings.checkForUpdates.whatsNew' => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.whatsNew', {}) ?? 'What\'s new',
          'settings.checkForUpdates.updateChangelog' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? 'Update changelog',
          'settings.checkForUpdates.updateCheckError' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? 'Update check error!',
          'settings.checkForUpdates.youHaveLatestVersion' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? 'You have the latest version',
          'settings.checkForUpdates.viewLatestChangelog' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ?? 'View latest changelog',
          'settings.checkForUpdates.currentVersion' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? 'Current version',
          'settings.checkForUpdates.changelog' => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? 'Changelog',
          'settings.checkForUpdates.visitPlayStore' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? 'Visit Play Store',
          'settings.checkForUpdates.visitReleases' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? 'Visit releases',
          'settings.logs.title' => TranslationOverrides.string(_root.$meta, 'settings.logs.title', {}) ?? 'Logs',
          'settings.logs.shareLogs' => TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogs', {}) ?? 'Share logs',
          'settings.logs.shareLogsWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningTitle', {}) ?? 'Share logs to external app?',
          'settings.logs.shareLogsWarningMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningMsg', {}) ??
                '[WARNING]: Logs may contain sensitive information, share with caution!',
          'settings.help.title' => TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? 'Help',
          'settings.debug.title' => TranslationOverrides.string(_root.$meta, 'settings.debug.title', {}) ?? 'Debug',
          'settings.debug.enabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.enabledSnackbarMsg', {}) ?? 'Debug mode is enabled!',
          'settings.debug.disabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.disabledSnackbarMsg', {}) ?? 'Debug mode is disabled!',
          'settings.debug.alreadyEnabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.alreadyEnabledSnackbarMsg', {}) ?? 'Debug mode is already enabled!',
          'settings.debug.showPerformanceGraph' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.showPerformanceGraph', {}) ?? 'Show performance graph',
          'settings.debug.showFPSGraph' => TranslationOverrides.string(_root.$meta, 'settings.debug.showFPSGraph', {}) ?? 'Show FPS graph',
          'settings.debug.showImageStats' => TranslationOverrides.string(_root.$meta, 'settings.debug.showImageStats', {}) ?? 'Show image stats',
          'settings.debug.showVideoStats' => TranslationOverrides.string(_root.$meta, 'settings.debug.showVideoStats', {}) ?? 'Show video stats',
          'settings.debug.blurImagesAndMuteVideosDevOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.blurImagesAndMuteVideosDevOnly', {}) ?? 'Blur images + mute videos [DEV only]',
          'settings.debug.enableDragScrollOnListsDesktopOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.enableDragScrollOnListsDesktopOnly', {}) ??
                'Enable drag scroll on lists [Desktop only]',
          'settings.debug.animationSpeed' =>
            ({required double speed}) =>
                TranslationOverrides.string(_root.$meta, 'settings.debug.animationSpeed', {'speed': speed}) ?? 'Animation speed (${speed})',
          'settings.debug.tagsManager' => TranslationOverrides.string(_root.$meta, 'settings.debug.tagsManager', {}) ?? 'Tags Manager',
          'settings.debug.resolution' =>
            ({required String width, required String height}) =>
                TranslationOverrides.string(_root.$meta, 'settings.debug.resolution', {'width': width, 'height': height}) ??
                'Res: ${width}x${height}',
          'settings.debug.pixelRatio' =>
            ({required String ratio}) =>
                TranslationOverrides.string(_root.$meta, 'settings.debug.pixelRatio', {'ratio': ratio}) ?? 'Pixel ratio: ${ratio}',
          'settings.debug.logger' => TranslationOverrides.string(_root.$meta, 'settings.debug.logger', {}) ?? 'Logger',
          'settings.debug.webview' => TranslationOverrides.string(_root.$meta, 'settings.debug.webview', {}) ?? 'Webview',
          'settings.debug.deleteAllCookies' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.deleteAllCookies', {}) ?? 'Delete all cookies',
          'settings.debug.clearSecureStorage' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.clearSecureStorage', {}) ?? 'Clear secure storage',
          'settings.debug.getSessionString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.getSessionString', {}) ?? 'Get session string',
          'settings.debug.setSessionString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.setSessionString', {}) ?? 'Set session string',
          'settings.debug.sessionString' => TranslationOverrides.string(_root.$meta, 'settings.debug.sessionString', {}) ?? 'Session string',
          'settings.debug.restoredSessionFromString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.restoredSessionFromString', {}) ?? 'Restored session from string',
          'settings.logging.logger' => TranslationOverrides.string(_root.$meta, 'settings.logging.logger', {}) ?? 'Logger',
          'settings.webview.openWebview' => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? 'Open webview',
          'settings.webview.openWebviewTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? 'to login or obtain cookies',
          'settings.dirPicker.directoryName' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryName', {}) ?? 'Directory name',
          'settings.dirPicker.selectADirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.selectADirectory', {}) ?? 'Select a directory',
          'settings.dirPicker.closeWithoutChoosing' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.closeWithoutChoosing', {}) ??
                'Do you want to close the picker without choosing a directory?',
          'settings.dirPicker.no' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.no', {}) ?? 'No',
          'settings.dirPicker.yes' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.yes', {}) ?? 'Yes',
          'settings.dirPicker.error' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.error', {}) ?? 'Error!',
          'settings.dirPicker.failedToCreateDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.failedToCreateDirectory', {}) ?? 'Failed to create directory',
          'settings.dirPicker.directoryNotWritable' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryNotWritable', {}) ?? 'Directory is not writable!',
          'settings.dirPicker.newDirectory' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.newDirectory', {}) ?? 'New directory',
          'settings.dirPicker.create' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.create', {}) ?? 'Create',
          'settings.version' => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? 'Version',
          'comments.title' => TranslationOverrides.string(_root.$meta, 'comments.title', {}) ?? 'Comments',
          'comments.noComments' => TranslationOverrides.string(_root.$meta, 'comments.noComments', {}) ?? 'No comments',
          'comments.noBooruAPIForComments' =>
            TranslationOverrides.string(_root.$meta, 'comments.noBooruAPIForComments', {}) ??
                'This Booru doesn\'t have comments or there is no API for them',
          'pageChanger.title' => TranslationOverrides.string(_root.$meta, 'pageChanger.title', {}) ?? 'Page changer',
          'pageChanger.pageLabel' => TranslationOverrides.string(_root.$meta, 'pageChanger.pageLabel', {}) ?? 'Page #',
          'pageChanger.delayBetweenLoadings' =>
            TranslationOverrides.string(_root.$meta, 'pageChanger.delayBetweenLoadings', {}) ?? 'Delay between loadings (ms)',
          'pageChanger.delayInMs' => TranslationOverrides.string(_root.$meta, 'pageChanger.delayInMs', {}) ?? 'Delay in ms',
          'pageChanger.currentPage' =>
            ({required int number}) =>
                TranslationOverrides.string(_root.$meta, 'pageChanger.currentPage', {'number': number}) ?? 'Current page #${number}',
          'pageChanger.possibleMaxPage' =>
            ({required int number}) =>
                TranslationOverrides.string(_root.$meta, 'pageChanger.possibleMaxPage', {'number': number}) ?? 'Possible max page #~${number}',
          'pageChanger.searchCurrentlyRunning' =>
            TranslationOverrides.string(_root.$meta, 'pageChanger.searchCurrentlyRunning', {}) ?? 'Search currently running!',
          'pageChanger.jumpToPage' => TranslationOverrides.string(_root.$meta, 'pageChanger.jumpToPage', {}) ?? 'Jump to page',
          'pageChanger.searchUntilPage' => TranslationOverrides.string(_root.$meta, 'pageChanger.searchUntilPage', {}) ?? 'Search until page',
          'pageChanger.stopSearching' => TranslationOverrides.string(_root.$meta, 'pageChanger.stopSearching', {}) ?? 'Stop searching',
          'tagsFiltersDialogs.emptyInput' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.emptyInput', {}) ?? 'Empty input!',
          'tagsFiltersDialogs.addNewFilter' =>
            ({required String type}) =>
                TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.addNewFilter', {'type': type}) ?? '[Add new ${type} filter]',
          'tagsFiltersDialogs.newTagFilter' =>
            ({required String type}) =>
                TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newTagFilter', {'type': type}) ?? 'New ${type} tag filter',
          'tagsFiltersDialogs.newFilter' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newFilter', {}) ?? 'New filter',
          'tagsFiltersDialogs.editFilter' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.editFilter', {}) ?? 'Edit filter',
          'tagsManager.title' => TranslationOverrides.string(_root.$meta, 'tagsManager.title', {}) ?? 'Tags',
          'tagsManager.addTag' => TranslationOverrides.string(_root.$meta, 'tagsManager.addTag', {}) ?? 'Add tag',
          'tagsManager.name' => TranslationOverrides.string(_root.$meta, 'tagsManager.name', {}) ?? 'Name',
          'tagsManager.type' => TranslationOverrides.string(_root.$meta, 'tagsManager.type', {}) ?? 'Type',
          'tagsManager.add' => TranslationOverrides.string(_root.$meta, 'tagsManager.add', {}) ?? 'Add',
          'tagsManager.staleAfter' =>
            ({required String staleText}) =>
                TranslationOverrides.string(_root.$meta, 'tagsManager.staleAfter', {'staleText': staleText}) ?? 'Stale after: ${staleText}',
          'tagsManager.addedATab' => TranslationOverrides.string(_root.$meta, 'tagsManager.addedATab', {}) ?? 'Added a tab',
          'tagsManager.addATab' => TranslationOverrides.string(_root.$meta, 'tagsManager.addATab', {}) ?? 'Add a tab',
          'tagsManager.copy' => TranslationOverrides.string(_root.$meta, 'tagsManager.copy', {}) ?? 'Copy',
          'tagsManager.setStale' => TranslationOverrides.string(_root.$meta, 'tagsManager.setStale', {}) ?? 'Set stale',
          'tagsManager.resetStale' => TranslationOverrides.string(_root.$meta, 'tagsManager.resetStale', {}) ?? 'Reset stale',
          'tagsManager.makeUnstaleable' => TranslationOverrides.string(_root.$meta, 'tagsManager.makeUnstaleable', {}) ?? 'Make unstaleable',
          'tagsManager.deleteTags' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'tagsManager.deleteTags', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: 'Delete ${count} tag',
                  few: 'Delete ${count} tags',
                  many: 'Delete ${count} tags',
                  other: 'Delete ${count} tags',
                ),
          'tagsManager.deleteTagsTitle' => TranslationOverrides.string(_root.$meta, 'tagsManager.deleteTagsTitle', {}) ?? 'Delete tags',
          'tagsManager.clearSelection' => TranslationOverrides.string(_root.$meta, 'tagsManager.clearSelection', {}) ?? 'Clear selection',
          'lockscreen.tapToAuthenticate' => TranslationOverrides.string(_root.$meta, 'lockscreen.tapToAuthenticate', {}) ?? 'Tap to authenticate',
          'lockscreen.devUnlock' => TranslationOverrides.string(_root.$meta, 'lockscreen.devUnlock', {}) ?? 'DEV UNLOCK',
          'lockscreen.testingMessage' =>
            TranslationOverrides.string(_root.$meta, 'lockscreen.testingMessage', {}) ??
                '[TESTING]: Press this if you cannot unlock the app through normal means. Report to developer with details about your device.',
          'loliSync.title' => TranslationOverrides.string(_root.$meta, 'loliSync.title', {}) ?? 'LoliSync',
          'loliSync.stopSyncingQuestion' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.stopSyncingQuestion', {}) ?? 'Do you want to stop syncing?',
          'loliSync.stopServerQuestion' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.stopServerQuestion', {}) ?? 'Do you want to stop the server?',
          'loliSync.noConnection' => TranslationOverrides.string(_root.$meta, 'loliSync.noConnection', {}) ?? 'No connection',
          'loliSync.waitingForConnection' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.waitingForConnection', {}) ?? 'Waiting for connection…',
          'loliSync.startingServer' => TranslationOverrides.string(_root.$meta, 'loliSync.startingServer', {}) ?? 'Starting server…',
          'loliSync.keepScreenAwake' => TranslationOverrides.string(_root.$meta, 'loliSync.keepScreenAwake', {}) ?? 'Keep the screen awake',
          'loliSync.serverKilled' => TranslationOverrides.string(_root.$meta, 'loliSync.serverKilled', {}) ?? 'LoliSync server killed',
          'loliSync.testError' =>
            ({required int statusCode, required String reasonPhrase}) =>
                TranslationOverrides.string(_root.$meta, 'loliSync.testError', {'statusCode': statusCode, 'reasonPhrase': reasonPhrase}) ??
                'Test error: ${statusCode} ${reasonPhrase}',
          'loliSync.testErrorException' =>
            ({required String error}) =>
                TranslationOverrides.string(_root.$meta, 'loliSync.testErrorException', {'error': error}) ?? 'Test error: ${error}',
          'loliSync.testSuccess' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.testSuccess', {}) ?? 'Test request received a positive response',
          'loliSync.testSuccessMessage' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.testSuccessMessage', {}) ?? 'There should be a \'Test\' message on the other device',
          'imageSearch.title' => TranslationOverrides.string(_root.$meta, 'imageSearch.title', {}) ?? 'Image search',
          'tagView.tags' => TranslationOverrides.string(_root.$meta, 'tagView.tags', {}) ?? 'Tags',
          'tagView.comments' => TranslationOverrides.string(_root.$meta, 'tagView.comments', {}) ?? 'Comments',
          'tagView.showNotes' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'tagView.showNotes', {'count': count}) ?? 'Show notes (${count})',
          'tagView.hideNotes' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'tagView.hideNotes', {'count': count}) ?? 'Hide notes (${count})',
          'tagView.loadNotes' => TranslationOverrides.string(_root.$meta, 'tagView.loadNotes', {}) ?? 'Load notes',
          'tagView.thisTagAlreadyInSearch' =>
            TranslationOverrides.string(_root.$meta, 'tagView.thisTagAlreadyInSearch', {}) ?? 'This tag is already in the current search query:',
          'tagView.addedToCurrentSearch' =>
            TranslationOverrides.string(_root.$meta, 'tagView.addedToCurrentSearch', {}) ?? 'Added to current search query:',
          'tagView.addedNewTab' => TranslationOverrides.string(_root.$meta, 'tagView.addedNewTab', {}) ?? 'Added new tab:',
          'tagView.id' => TranslationOverrides.string(_root.$meta, 'tagView.id', {}) ?? 'ID',
          'tagView.postURL' => TranslationOverrides.string(_root.$meta, 'tagView.postURL', {}) ?? 'Post URL',
          'tagView.posted' => TranslationOverrides.string(_root.$meta, 'tagView.posted', {}) ?? 'Posted',
          'tagView.details' => TranslationOverrides.string(_root.$meta, 'tagView.details', {}) ?? 'Details',
          'tagView.filename' => TranslationOverrides.string(_root.$meta, 'tagView.filename', {}) ?? 'Filename',
          'tagView.url' => TranslationOverrides.string(_root.$meta, 'tagView.url', {}) ?? 'URL',
          'tagView.extension' => TranslationOverrides.string(_root.$meta, 'tagView.extension', {}) ?? 'Extension',
          'tagView.resolution' => TranslationOverrides.string(_root.$meta, 'tagView.resolution', {}) ?? 'Resolution',
          'tagView.size' => TranslationOverrides.string(_root.$meta, 'tagView.size', {}) ?? 'Size',
          'tagView.md5' => TranslationOverrides.string(_root.$meta, 'tagView.md5', {}) ?? 'MD5',
          'tagView.rating' => TranslationOverrides.string(_root.$meta, 'tagView.rating', {}) ?? 'Rating',
          'tagView.score' => TranslationOverrides.string(_root.$meta, 'tagView.score', {}) ?? 'Score',
          'tagView.noTagsFound' => TranslationOverrides.string(_root.$meta, 'tagView.noTagsFound', {}) ?? 'No tags found',
          'tagView.copy' => TranslationOverrides.string(_root.$meta, 'tagView.copy', {}) ?? 'Copy',
          'tagView.removeFromSearch' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromSearch', {}) ?? 'Remove from Search',
          'tagView.addToSearch' => TranslationOverrides.string(_root.$meta, 'tagView.addToSearch', {}) ?? 'Add to Search',
          'tagView.addedToSearchBar' => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBar', {}) ?? 'Added to search bar:',
          'tagView.addToSearchExclude' => TranslationOverrides.string(_root.$meta, 'tagView.addToSearchExclude', {}) ?? 'Add to Search (Exclude)',
          'tagView.addedToSearchBarExclude' =>
            TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBarExclude', {}) ?? 'Added to search bar (Exclude):',
          'tagView.addToMarked' => TranslationOverrides.string(_root.$meta, 'tagView.addToMarked', {}) ?? 'Add to Marked',
          'tagView.addToHidden' => TranslationOverrides.string(_root.$meta, 'tagView.addToHidden', {}) ?? 'Add to Hidden',
          'tagView.removeFromMarked' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromMarked', {}) ?? 'Remove from Marked',
          'tagView.removeFromHidden' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromHidden', {}) ?? 'Remove from Hidden',
          'tagView.editTag' => TranslationOverrides.string(_root.$meta, 'tagView.editTag', {}) ?? 'Edit tag',
          'tagView.sourceDialogTitle' => TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogTitle', {}) ?? 'Source',
          'tagView.preview' => TranslationOverrides.string(_root.$meta, 'tagView.preview', {}) ?? 'Preview',
          'tagView.selectBooruToLoad' => TranslationOverrides.string(_root.$meta, 'tagView.selectBooruToLoad', {}) ?? 'Select a booru to load',
          'tagView.previewIsLoading' => TranslationOverrides.string(_root.$meta, 'tagView.previewIsLoading', {}) ?? 'Preview is loading…',
          'tagView.failedToLoadPreview' => TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreview', {}) ?? 'Failed to load preview',
          'tagView.tapToTryAgain' => TranslationOverrides.string(_root.$meta, 'tagView.tapToTryAgain', {}) ?? 'Tap to try again',
          'tagView.copiedFileURL' => TranslationOverrides.string(_root.$meta, 'tagView.copiedFileURL', {}) ?? 'Copied file URL to clipboard',
          'tagView.tagPreviews' => TranslationOverrides.string(_root.$meta, 'tagView.tagPreviews', {}) ?? 'Tag previews',
          'tagView.currentState' => TranslationOverrides.string(_root.$meta, 'tagView.currentState', {}) ?? 'Current state',
          'tagView.history' => TranslationOverrides.string(_root.$meta, 'tagView.history', {}) ?? 'History',
          'tagView.failedToLoadPreviewPage' =>
            TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreviewPage', {}) ?? 'Failed to load preview page',
          'tagView.tryAgain' => TranslationOverrides.string(_root.$meta, 'tagView.tryAgain', {}) ?? 'Try again',
          'tagView.detectedLinks' => TranslationOverrides.string(_root.$meta, 'tagView.detectedLinks', {}) ?? 'Detected links:',
          'tagView.relatedTabs' => TranslationOverrides.string(_root.$meta, 'tagView.relatedTabs', {}) ?? 'Related tabs',
          'tagView.tabsWithOnlyTag' => TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTag', {}) ?? 'Tabs with only this tag',
          'tagView.tabsWithOnlyTagDifferentBooru' =>
            TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTagDifferentBooru', {}) ??
                'Tabs with only this tag but on a different booru',
          'tagView.tabsContainingTag' => TranslationOverrides.string(_root.$meta, 'tagView.tabsContainingTag', {}) ?? 'Tabs containing this tag',
          'pinnedTags.pinnedTags' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedTags', {}) ?? 'Pinned tags',
          'pinnedTags.pinTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinTag', {}) ?? 'Pin tag',
          'pinnedTags.unpinTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinTag', {}) ?? 'Unpin tag',
          'pinnedTags.pin' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pin', {}) ?? 'Pin',
          'pinnedTags.unpin' => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpin', {}) ?? 'Unpin',
          'pinnedTags.pinQuestion' =>
            ({required String tag}) =>
                TranslationOverrides.string(_root.$meta, 'pinnedTags.pinQuestion', {'tag': tag}) ?? 'Pin «${tag}» to quick access?',
          'pinnedTags.unpinQuestion' =>
            ({required String tag}) =>
                TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinQuestion', {'tag': tag}) ?? 'Remove «${tag}» from pinned tags?',
          'pinnedTags.onlyForBooru' =>
            ({required String name}) => TranslationOverrides.string(_root.$meta, 'pinnedTags.onlyForBooru', {'name': name}) ?? 'Only for ${name}',
          'pinnedTags.labelsOptional' => TranslationOverrides.string(_root.$meta, 'pinnedTags.labelsOptional', {}) ?? 'Labels (optional)',
          'pinnedTags.typeAndPressAdd' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.typeAndPressAdd', {}) ?? 'Type and press Add button to include a label',
          'pinnedTags.selectExistingLabel' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.selectExistingLabel', {}) ?? 'Select existing label',
          'pinnedTags.tagPinned' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagPinned', {}) ?? 'Tag pinned',
          'pinnedTags.pinnedForBooru' =>
            ({required String name, required String labels}) =>
                TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedForBooru', {'name': name, 'labels': labels}) ??
                'Pinned for ${name}${labels}',
          'pinnedTags.pinnedGloballyWithLabels' =>
            ({required String labels}) =>
                TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedGloballyWithLabels', {'labels': labels}) ?? 'Pinned globally${labels}',
          'pinnedTags.tagUnpinned' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagUnpinned', {}) ?? 'Tag unpinned',
          'pinnedTags.all' => TranslationOverrides.string(_root.$meta, 'pinnedTags.all', {}) ?? 'All',
          'pinnedTags.reorderPinnedTags' => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorderPinnedTags', {}) ?? 'Reorder pinned tags',
          'pinnedTags.saving' => TranslationOverrides.string(_root.$meta, 'pinnedTags.saving', {}) ?? 'Saving…',
          'pinnedTags.reorder' => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorder', {}) ?? 'Reorder',
          'pinnedTags.addTagManually' => TranslationOverrides.string(_root.$meta, 'pinnedTags.addTagManually', {}) ?? 'Add tag manually',
          'pinnedTags.noTagsMatchSearch' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.noTagsMatchSearch', {}) ?? 'No tags match your search',
          'pinnedTags.noPinnedTagsYet' => TranslationOverrides.string(_root.$meta, 'pinnedTags.noPinnedTagsYet', {}) ?? 'No pinned tags yet',
          'pinnedTags.editLabels' => TranslationOverrides.string(_root.$meta, 'pinnedTags.editLabels', {}) ?? 'Edit labels',
          'pinnedTags.labels' => TranslationOverrides.string(_root.$meta, 'pinnedTags.labels', {}) ?? 'Labels',
          'pinnedTags.addPinnedTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.addPinnedTag', {}) ?? 'Add pinned tag',
          'pinnedTags.tagQuery' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQuery', {}) ?? 'Tag query',
          'pinnedTags.tagQueryHint' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQueryHint', {}) ?? 'tag_name',
          'pinnedTags.rawQueryHelp' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.rawQueryHelp', {}) ?? 'You can enter any search query, including tags with spaces',
          'searchBar.searchForTags' => TranslationOverrides.string(_root.$meta, 'searchBar.searchForTags', {}) ?? 'Search for tags',
          'searchBar.failedToLoadSuggestions' =>
            ({required String msg}) =>
                TranslationOverrides.string(_root.$meta, 'searchBar.failedToLoadSuggestions', {'msg': msg}) ??
                'Couldn\'t load suggestions. Tap to retry${msg}',
          'searchBar.noSuggestionsFound' => TranslationOverrides.string(_root.$meta, 'searchBar.noSuggestionsFound', {}) ?? 'No suggestions found',
          'searchBar.tagSuggestionsNotAvailable' =>
            TranslationOverrides.string(_root.$meta, 'searchBar.tagSuggestionsNotAvailable', {}) ?? 'Tag suggestions unavailable for this booru',
          'searchBar.copiedTagToClipboard' =>
            ({required String tag}) =>
                TranslationOverrides.string(_root.$meta, 'searchBar.copiedTagToClipboard', {'tag': tag}) ?? 'Copied «${tag}» to clipboard',
          'searchBar.prefix' => TranslationOverrides.string(_root.$meta, 'searchBar.prefix', {}) ?? 'Prefix',
          'searchBar.exclude' => TranslationOverrides.string(_root.$meta, 'searchBar.exclude', {}) ?? 'Exclude (—)',
          'searchBar.booruNumberPrefix' => TranslationOverrides.string(_root.$meta, 'searchBar.booruNumberPrefix', {}) ?? 'Booru (N#)',
          'searchBar.metatags' => TranslationOverrides.string(_root.$meta, 'searchBar.metatags', {}) ?? 'Metatags',
          'searchBar.freeMetatags' => TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatags', {}) ?? 'Free metatags',
          'searchBar.freeMetatagsDescription' =>
            TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatagsDescription', {}) ??
                'Free metatags do not count against the tag search limits',
          'searchBar.free' => TranslationOverrides.string(_root.$meta, 'searchBar.free', {}) ?? 'Free',
          'searchBar.single' => TranslationOverrides.string(_root.$meta, 'searchBar.single', {}) ?? 'Single',
          'searchBar.range' => TranslationOverrides.string(_root.$meta, 'searchBar.range', {}) ?? 'Range',
          'searchBar.popular' => TranslationOverrides.string(_root.$meta, 'searchBar.popular', {}) ?? 'Popular',
          'searchBar.selectDate' => TranslationOverrides.string(_root.$meta, 'searchBar.selectDate', {}) ?? 'Select date',
          'searchBar.selectDatesRange' => TranslationOverrides.string(_root.$meta, 'searchBar.selectDatesRange', {}) ?? 'Select dates range',
          'searchBar.history' => TranslationOverrides.string(_root.$meta, 'searchBar.history', {}) ?? 'History',
          'searchBar.more' => TranslationOverrides.string(_root.$meta, 'searchBar.more', {}) ?? '…',
          'mobileHome.selectBooruForWebview' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.selectBooruForWebview', {}) ?? 'Select booru for webview',
          'mobileHome.lockApp' => TranslationOverrides.string(_root.$meta, 'mobileHome.lockApp', {}) ?? 'Lock app',
          'mobileHome.fileAlreadyExists' => TranslationOverrides.string(_root.$meta, 'mobileHome.fileAlreadyExists', {}) ?? 'File already exists',
          'mobileHome.failedToDownload' => TranslationOverrides.string(_root.$meta, 'mobileHome.failedToDownload', {}) ?? 'Failed to download',
          'mobileHome.cancelledByUser' => TranslationOverrides.string(_root.$meta, 'mobileHome.cancelledByUser', {}) ?? 'Cancelled by user',
          'mobileHome.saveAnyway' => TranslationOverrides.string(_root.$meta, 'mobileHome.saveAnyway', {}) ?? 'Save anyway',
          'mobileHome.skip' => TranslationOverrides.string(_root.$meta, 'mobileHome.skip', {}) ?? 'Skip',
          'mobileHome.retryAll' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'mobileHome.retryAll', {'count': count}) ?? 'Retry all (${count})',
          'mobileHome.existingFailedOrCancelledItems' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.existingFailedOrCancelledItems', {}) ?? 'Existing, failed or cancelled items',
          'mobileHome.clearAllRetryableItems' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.clearAllRetryableItems', {}) ?? 'Clear all retryable items',
          'desktopHome.snatcher' => TranslationOverrides.string(_root.$meta, 'desktopHome.snatcher', {}) ?? 'Snatcher',
          'desktopHome.addBoorusInSettings' =>
            TranslationOverrides.string(_root.$meta, 'desktopHome.addBoorusInSettings', {}) ?? 'Add boorus in settings',
          'desktopHome.settings' => TranslationOverrides.string(_root.$meta, 'desktopHome.settings', {}) ?? 'Settings',
          'desktopHome.save' => TranslationOverrides.string(_root.$meta, 'desktopHome.save', {}) ?? 'Save',
          'desktopHome.noItemsSelected' => TranslationOverrides.string(_root.$meta, 'desktopHome.noItemsSelected', {}) ?? 'No items selected',
          'galleryView.noItems' => TranslationOverrides.string(_root.$meta, 'galleryView.noItems', {}) ?? 'No items',
          'galleryView.noItemSelected' => TranslationOverrides.string(_root.$meta, 'galleryView.noItemSelected', {}) ?? 'No item selected',
          'galleryView.close' => TranslationOverrides.string(_root.$meta, 'galleryView.close', {}) ?? 'Close',
          'mediaPreviews.noBooruConfigsFound' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.noBooruConfigsFound', {}) ?? 'No booru configs found',
          'mediaPreviews.addNewBooru' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? 'Add new Booru',
          'mediaPreviews.help' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.help', {}) ?? 'Help',
          'mediaPreviews.settings' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.settings', {}) ?? 'Settings',
          'mediaPreviews.restoringPreviousSession' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoringPreviousSession', {}) ?? 'Restoring previous session…',
          'mediaPreviews.copiedFileURL' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.copiedFileURL', {}) ?? 'Copied file URL to clipboard!',
          'viewer.tutorial.images' => TranslationOverrides.string(_root.$meta, 'viewer.tutorial.images', {}) ?? 'Images',
          'viewer.tutorial.tapLongTapToggleImmersive' =>
            TranslationOverrides.string(_root.$meta, 'viewer.tutorial.tapLongTapToggleImmersive', {}) ?? 'Tap/Long tap: toggle immersive mode',
          'viewer.tutorial.doubleTapFitScreen' =>
            TranslationOverrides.string(_root.$meta, 'viewer.tutorial.doubleTapFitScreen', {}) ??
                'Double tap: fit to screen / original size / reset zoom',
          'viewer.appBar.cantStartSlideshow' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.cantStartSlideshow', {}) ?? 'Can\'t start Slideshow',
          'viewer.appBar.reachedLastLoadedItem' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.reachedLastLoadedItem', {}) ?? 'Reached the Last loaded Item',
          'viewer.appBar.pause' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.pause', {}) ?? 'Pause',
          'viewer.appBar.start' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.start', {}) ?? 'Start',
          'viewer.appBar.unfavourite' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.unfavourite', {}) ?? 'Unfavourite',
          'viewer.appBar.deselect' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.deselect', {}) ?? 'Deselect',
          'viewer.appBar.reloadWithScaling' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.reloadWithScaling', {}) ?? 'Reload with scaling',
          'viewer.appBar.loadSampleQuality' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadSampleQuality', {}) ?? 'Load sample quality',
          _ => null,
        } ??
        switch (path) {
          'viewer.appBar.loadHighQuality' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadHighQuality', {}) ?? 'Load high quality',
          'viewer.appBar.dropSnatchedStatus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.dropSnatchedStatus', {}) ?? 'Drop snatched status',
          'viewer.appBar.setSnatchedStatus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.setSnatchedStatus', {}) ?? 'Set snatched status',
          'viewer.appBar.snatch' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.snatch', {}) ?? 'Snatch',
          'viewer.appBar.forced' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.forced', {}) ?? '(forced)',
          'viewer.appBar.hydrusShare' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusShare', {}) ?? 'Hydrus share',
          'viewer.appBar.whichUrlToShareToHydrus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.whichUrlToShareToHydrus', {}) ?? 'Which URL you want to share to Hydrus?',
          'viewer.appBar.postURL' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURL', {}) ?? 'Post URL',
          'viewer.appBar.fileURL' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURL', {}) ?? 'File URL',
          'viewer.appBar.hydrusNotConfigured' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusNotConfigured', {}) ?? 'Hydrus is not configured!',
          'viewer.appBar.shareFile' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareFile', {}) ?? 'Share file',
          'viewer.appBar.alreadyDownloadingThisFile' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingThisFile', {}) ??
                'Already downloading this file for sharing, do you want to abort?',
          'viewer.appBar.alreadyDownloadingFile' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingFile', {}) ??
                'Already downloading file for sharing, do you want to abort current file and share a new file?',
          'viewer.appBar.current' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.current', {}) ?? 'Current:',
          'viewer.appBar.kNew' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.kNew', {}) ?? 'New:',
          'viewer.appBar.shareNew' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareNew', {}) ?? 'Share new',
          'viewer.appBar.abort' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.abort', {}) ?? 'Abort',
          'viewer.appBar.error' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.error', {}) ?? 'Error!',
          'viewer.appBar.savingFileError' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.savingFileError', {}) ??
                'Something went wrong when saving the File before Sharing',
          'viewer.appBar.whatToShare' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.whatToShare', {}) ?? 'What you want to Share?',
          'viewer.appBar.postURLWithTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURLWithTags', {}) ?? 'Post URL with tags',
          'viewer.appBar.fileURLWithTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURLWithTags', {}) ?? 'File URL with tags',
          'viewer.appBar.file' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.file', {}) ?? 'File',
          'viewer.appBar.fileWithTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileWithTags', {}) ?? 'File with tags',
          'viewer.appBar.hydrus' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrus', {}) ?? 'Hydrus',
          'viewer.appBar.selectTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.selectTags', {}) ?? 'Select tags',
          'viewer.notes.note' => TranslationOverrides.string(_root.$meta, 'viewer.notes.note', {}) ?? 'Note',
          'viewer.notes.notes' => TranslationOverrides.string(_root.$meta, 'viewer.notes.notes', {}) ?? 'Notes',
          'viewer.notes.coordinates' =>
            ({required int posX, required int posY}) =>
                TranslationOverrides.string(_root.$meta, 'viewer.notes.coordinates', {'posX': posX, 'posY': posY}) ?? 'X:${posX}, Y:${posY}',
          'common.selectABooru' => TranslationOverrides.string(_root.$meta, 'common.selectABooru', {}) ?? 'Select a booru',
          'common.booruItemCopiedToClipboard' =>
            TranslationOverrides.string(_root.$meta, 'common.booruItemCopiedToClipboard', {}) ?? 'Booru item copied to clipboard',
          'gallery.snatchQuestion' => TranslationOverrides.string(_root.$meta, 'gallery.snatchQuestion', {}) ?? 'Snatch?',
          'gallery.noPostUrl' => TranslationOverrides.string(_root.$meta, 'gallery.noPostUrl', {}) ?? 'No post URL!',
          'gallery.loadingFile' => TranslationOverrides.string(_root.$meta, 'gallery.loadingFile', {}) ?? 'Loading file…',
          'gallery.loadingFileMessage' =>
            TranslationOverrides.string(_root.$meta, 'gallery.loadingFileMessage', {}) ?? 'This can take some time, please wait…',
          'gallery.sources' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'gallery.sources', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  count,
                  one: 'Source',
                  other: 'Sources',
                ),
          'galleryButtons.snatch' => TranslationOverrides.string(_root.$meta, 'galleryButtons.snatch', {}) ?? 'Snatch',
          'galleryButtons.favourite' => TranslationOverrides.string(_root.$meta, 'galleryButtons.favourite', {}) ?? 'Favourite',
          'galleryButtons.info' => TranslationOverrides.string(_root.$meta, 'galleryButtons.info', {}) ?? 'Info',
          'galleryButtons.share' => TranslationOverrides.string(_root.$meta, 'galleryButtons.share', {}) ?? 'Share',
          'galleryButtons.select' => TranslationOverrides.string(_root.$meta, 'galleryButtons.select', {}) ?? 'Select',
          'galleryButtons.open' => TranslationOverrides.string(_root.$meta, 'galleryButtons.open', {}) ?? 'Open in browser',
          'galleryButtons.slideshow' => TranslationOverrides.string(_root.$meta, 'galleryButtons.slideshow', {}) ?? 'Slideshow',
          'galleryButtons.reloadNoScale' => TranslationOverrides.string(_root.$meta, 'galleryButtons.reloadNoScale', {}) ?? 'Toggle scaling',
          'galleryButtons.toggleQuality' => TranslationOverrides.string(_root.$meta, 'galleryButtons.toggleQuality', {}) ?? 'Toggle quality',
          'galleryButtons.externalPlayer' => TranslationOverrides.string(_root.$meta, 'galleryButtons.externalPlayer', {}) ?? 'External player',
          'galleryButtons.imageSearch' => TranslationOverrides.string(_root.$meta, 'galleryButtons.imageSearch', {}) ?? 'Image search',
          'media.loading.rendering' => TranslationOverrides.string(_root.$meta, 'media.loading.rendering', {}) ?? 'Rendering…',
          'media.loading.loadingAndRenderingFromCache' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.loadingAndRenderingFromCache', {}) ?? 'Loading and rendering from cache…',
          'media.loading.loadingFromCache' => TranslationOverrides.string(_root.$meta, 'media.loading.loadingFromCache', {}) ?? 'Loading from cache…',
          'media.loading.buffering' => TranslationOverrides.string(_root.$meta, 'media.loading.buffering', {}) ?? 'Buffering…',
          'media.loading.loading' => TranslationOverrides.string(_root.$meta, 'media.loading.loading', {}) ?? 'Loading…',
          'media.loading.loadAnyway' => TranslationOverrides.string(_root.$meta, 'media.loading.loadAnyway', {}) ?? 'Load anyway',
          'media.loading.restartLoading' => TranslationOverrides.string(_root.$meta, 'media.loading.restartLoading', {}) ?? 'Restart loading',
          'media.loading.stopLoading' => TranslationOverrides.string(_root.$meta, 'media.loading.stopLoading', {}) ?? 'Stop loading',
          'media.loading.startedSecondsAgo' =>
            ({required int seconds}) =>
                TranslationOverrides.string(_root.$meta, 'media.loading.startedSecondsAgo', {'seconds': seconds}) ?? 'Started ${seconds}s ago',
          'media.loading.stopReasons.stoppedByUser' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.stoppedByUser', {}) ?? 'Stopped by user',
          'media.loading.stopReasons.loadingError' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.loadingError', {}) ?? 'Loading error',
          'media.loading.stopReasons.fileIsTooBig' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.fileIsTooBig', {}) ?? 'File is too big',
          'media.loading.stopReasons.hiddenByFilters' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.hiddenByFilters', {}) ?? 'Hidden by filters:',
          'media.loading.stopReasons.videoError' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.videoError', {}) ?? 'Video error',
          'media.loading.fileIsZeroBytes' => TranslationOverrides.string(_root.$meta, 'media.loading.fileIsZeroBytes', {}) ?? 'File is zero bytes',
          'media.loading.fileSize' =>
            ({required String size}) => TranslationOverrides.string(_root.$meta, 'media.loading.fileSize', {'size': size}) ?? 'File size: ${size}',
          'media.loading.sizeLimit' =>
            ({required String limit}) => TranslationOverrides.string(_root.$meta, 'media.loading.sizeLimit', {'limit': limit}) ?? 'Limit: ${limit}',
          'media.loading.tryChangingVideoBackend' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.tryChangingVideoBackend', {}) ??
                'Frequent playback issues? Try changing [Settings > Video > Video player backend]',
          'media.video.videosDisabledOrNotSupported' =>
            TranslationOverrides.string(_root.$meta, 'media.video.videosDisabledOrNotSupported', {}) ?? 'Videos disabled or not supported',
          'media.video.openVideoInExternalPlayer' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openVideoInExternalPlayer', {}) ?? 'Open video in external player',
          'media.video.openVideoInBrowser' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openVideoInBrowser', {}) ?? 'Open video in browser',
          'media.video.failedToLoadItemData' =>
            TranslationOverrides.string(_root.$meta, 'media.video.failedToLoadItemData', {}) ?? 'Failed to load item data',
          'media.video.loadingItemData' => TranslationOverrides.string(_root.$meta, 'media.video.loadingItemData', {}) ?? 'Loading item data…',
          'media.video.retry' => TranslationOverrides.string(_root.$meta, 'media.video.retry', {}) ?? 'Retry',
          'media.video.openFileInBrowser' => TranslationOverrides.string(_root.$meta, 'media.video.openFileInBrowser', {}) ?? 'Open file in browser',
          'media.video.openPostInBrowser' => TranslationOverrides.string(_root.$meta, 'media.video.openPostInBrowser', {}) ?? 'Open post in browser',
          'media.video.currentlyChecking' => TranslationOverrides.string(_root.$meta, 'media.video.currentlyChecking', {}) ?? 'Currently checking:',
          'media.video.unknownFileFormat' =>
            ({required String fileExt}) =>
                TranslationOverrides.string(_root.$meta, 'media.video.unknownFileFormat', {'fileExt': fileExt}) ??
                'Unknown file format (.${fileExt}), tap here to open in browser',
          'imageStats.live' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.live', {'count': count}) ?? 'Live: ${count}',
          'imageStats.pending' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.pending', {'count': count}) ?? 'Pending: ${count}',
          'imageStats.total' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.total', {'count': count}) ?? 'Total: ${count}',
          'imageStats.size' =>
            ({required String size}) => TranslationOverrides.string(_root.$meta, 'imageStats.size', {'size': size}) ?? 'Size: ${size}',
          'imageStats.max' => ({required String max}) => TranslationOverrides.string(_root.$meta, 'imageStats.max', {'max': max}) ?? 'Max: ${max}',
          'preview.error.noResults' => TranslationOverrides.string(_root.$meta, 'preview.error.noResults', {}) ?? 'No results',
          'preview.error.noResultsSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.noResultsSubtitle', {}) ?? 'Change search query or tap to retry',
          'preview.error.reachedEnd' => TranslationOverrides.string(_root.$meta, 'preview.error.reachedEnd', {}) ?? 'You reached the end',
          'preview.error.reachedEndSubtitle' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.reachedEndSubtitle', {'pageNum': pageNum}) ??
                'Loaded pages: ${pageNum}\nTap here to reload last page',
          'preview.error.loadingPage' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.loadingPage', {'pageNum': pageNum}) ?? 'Loading page #${pageNum}…',
          'preview.error.startedAgo' =>
            ({required num seconds}) =>
                TranslationOverrides.plural(_root.$meta, 'preview.error.startedAgo', {'seconds': seconds}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
                  seconds,
                  one: 'Started ${seconds} second ago',
                  few: 'Started ${seconds} seconds ago',
                  many: 'Started ${seconds} seconds ago',
                  other: 'Started ${seconds} seconds ago',
                ),
          'preview.error.tapToRetryIfStuck' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetryIfStuck', {}) ??
                'Tap to retry if request seems stuck or taking too long',
          'preview.error.errorLoadingPage' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.errorLoadingPage', {'pageNum': pageNum}) ??
                'Error when loading page #${pageNum}',
          'preview.error.errorWithMessage' => TranslationOverrides.string(_root.$meta, 'preview.error.errorWithMessage', {}) ?? 'Tap here to retry',
          'preview.error.errorNoResultsLoaded' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.errorNoResultsLoaded', {}) ?? 'Error, no results loaded',
          'preview.error.tapToRetry' => TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetry', {}) ?? 'Tap here to retry',
          'tagType.artist' => TranslationOverrides.string(_root.$meta, 'tagType.artist', {}) ?? 'Artist',
          'tagType.character' => TranslationOverrides.string(_root.$meta, 'tagType.character', {}) ?? 'Character',
          'tagType.copyright' => TranslationOverrides.string(_root.$meta, 'tagType.copyright', {}) ?? 'Copyright',
          'tagType.meta' => TranslationOverrides.string(_root.$meta, 'tagType.meta', {}) ?? 'Meta',
          'tagType.species' => TranslationOverrides.string(_root.$meta, 'tagType.species', {}) ?? 'Species',
          'tagType.none' => TranslationOverrides.string(_root.$meta, 'tagType.none', {}) ?? 'None/General',
          _ => null,
        };
  }
}
