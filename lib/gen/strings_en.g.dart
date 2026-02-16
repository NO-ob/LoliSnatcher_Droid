///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element

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
             locale: AppLocale.en,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final Translations _root = this; // ignore: unused_field

  Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

  // Translations

  /// en: 'en'
  String get locale => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'en';

  /// Human readable name of this locale
  ///
  /// en: 'English'
  String get localeName => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'English';

  /// en: 'LoliSnatcher'
  String get appName => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher';

  /// en: 'Error'
  String get error => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Error';

  /// en: 'Error!'
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'Error!';

  /// en: 'Success'
  String get success => TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Success';

  /// en: 'Success!'
  String get successExclamation => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? 'Success!';

  /// en: 'Cancel'
  String get cancel => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Cancel';

  /// en: 'Later'
  String get later => TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Later';

  /// en: 'Close'
  String get close => TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Close';

  /// en: 'OK'
  String get ok => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'OK';

  /// en: 'Yes'
  String get yes => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Yes';

  /// en: 'No'
  String get no => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'No';

  /// en: 'Please wait...'
  String get pleaseWait => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Please wait...';

  /// en: 'Show'
  String get show => TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Show';

  /// en: 'Hide'
  String get hide => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Hide';

  /// en: 'Enable'
  String get enable => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'Enable';

  /// en: 'Disable'
  String get disable => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Disable';

  /// en: 'Add'
  String get add => TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Add';

  /// en: 'Edit'
  String get edit => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? 'Edit';

  /// en: 'Remove'
  String get remove => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? 'Remove';

  /// en: 'Save'
  String get save => TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Save';

  /// en: 'Delete'
  String get delete => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? 'Delete';

  /// en: 'Confirm'
  String get confirm => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? 'Confirm';

  /// en: 'Retry'
  String get retry => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? 'Retry';

  /// en: 'Clear'
  String get clear => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? 'Clear';

  /// en: 'Copy'
  String get copy => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Copy';

  /// en: 'Copied'
  String get copied => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Copied';

  /// en: 'Copied to clipboard'
  String get copiedToClipboard => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? 'Copied to clipboard';

  /// en: 'Nothing found'
  String get nothingFound => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? 'Nothing found';

  /// en: 'Paste'
  String get paste => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Paste';

  /// en: 'Copy error'
  String get copyErrorText => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Copy error';

  /// en: 'Booru'
  String get booru => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru';

  /// en: 'Go to settings'
  String get goToSettings => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'Go to settings';

  /// en: 'This may take some time...'
  String get thisMayTakeSomeTime => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'This may take some time...';

  /// en: 'Exit the app?'
  String get exitTheAppQuestion => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? 'Exit the app?';

  /// en: 'Close the app'
  String get closeTheApp => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Close the app';

  /// en: 'Invalid URL!'
  String get invalidUrl => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'Invalid URL!';

  /// en: 'Clipboard is empty!'
  String get clipboardIsEmpty => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'Clipboard is empty!';

  /// en: 'Failed to open link'
  String get failedToOpenLink => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'Failed to open link';

  /// en: 'API Key'
  String get apiKey => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'API Key';

  /// en: 'User ID'
  String get userId => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'User ID';

  /// en: 'Login'
  String get login => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Login';

  /// en: 'Password'
  String get password => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Password';

  /// en: 'Pause'
  String get pause => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Pause';

  /// en: 'Resume'
  String get resume => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Resume';

  /// en: 'Discord'
  String get discord => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord';

  /// en: 'Visit our Discord server'
  String get visitOurDiscord => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Visit our Discord server';

  /// en: 'Item'
  String get item => TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Item';

  /// en: 'Select'
  String get select => TranslationOverrides.string(_root.$meta, 'select', {}) ?? 'Select';

  /// en: 'Select all'
  String get selectAll => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Select all';

  /// en: 'Reset'
  String get reset => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'Reset';

  /// en: 'Open'
  String get open => TranslationOverrides.string(_root.$meta, 'open', {}) ?? 'Open';

  /// en: 'Open in new tab'
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? 'Open in new tab';

  /// en: 'Move'
  String get move => TranslationOverrides.string(_root.$meta, 'move', {}) ?? 'Move';

  /// en: 'Shuffle'
  String get shuffle => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? 'Shuffle';

  /// en: 'Sort'
  String get sort => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? 'Sort';

  /// en: 'Go'
  String get go => TranslationOverrides.string(_root.$meta, 'go', {}) ?? 'Go';

  /// en: 'Search'
  String get search => TranslationOverrides.string(_root.$meta, 'search', {}) ?? 'Search';

  /// en: 'Filter'
  String get filter => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? 'Filter';

  /// en: 'Or (~)'
  String get or => TranslationOverrides.string(_root.$meta, 'or', {}) ?? 'Or (~)';

  /// en: 'Page'
  String get page => TranslationOverrides.string(_root.$meta, 'page', {}) ?? 'Page';

  /// en: 'Page #'
  String get pageNumber => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? 'Page #';

  /// en: 'Tags'
  String get tags => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'Tags';

  /// en: 'Type'
  String get type => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'Type';

  /// en: 'Name'
  String get name => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Name';

  /// en: 'Address'
  String get address => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'Address';

  /// en: 'Username'
  String get username => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'Username';

  /// en: 'Favourites'
  String get favourites => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'Favourites';

  /// en: 'Downloads'
  String get downloads => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'Downloads';

  late final TranslationsValidationErrorsEn validationErrors = TranslationsValidationErrorsEn.internal(_root);
  late final TranslationsInitEn init = TranslationsInitEn.internal(_root);
  late final TranslationsPermissionsEn permissions = TranslationsPermissionsEn.internal(_root);
  late final TranslationsAuthenticationEn authentication = TranslationsAuthenticationEn.internal(_root);
  late final TranslationsSearchHandlerEn searchHandler = TranslationsSearchHandlerEn.internal(_root);
  late final TranslationsSnatcherEn snatcher = TranslationsSnatcherEn.internal(_root);
  late final TranslationsMultibooruEn multibooru = TranslationsMultibooruEn.internal(_root);
  late final TranslationsHydrusEn hydrus = TranslationsHydrusEn.internal(_root);
  late final TranslationsTabsEn tabs = TranslationsTabsEn.internal(_root);
  late final TranslationsHistoryEn history = TranslationsHistoryEn.internal(_root);
  late final TranslationsWebviewEn webview = TranslationsWebviewEn.internal(_root);
  late final TranslationsSettingsEn settings = TranslationsSettingsEn.internal(_root);
  late final TranslationsCommentsEn comments = TranslationsCommentsEn.internal(_root);
  late final TranslationsPageChangerEn pageChanger = TranslationsPageChangerEn.internal(_root);
  late final TranslationsTagsFiltersDialogsEn tagsFiltersDialogs = TranslationsTagsFiltersDialogsEn.internal(_root);
  late final TranslationsTagsManagerEn tagsManager = TranslationsTagsManagerEn.internal(_root);
  late final TranslationsLockscreenEn lockscreen = TranslationsLockscreenEn.internal(_root);
  late final TranslationsLoliSyncEn loliSync = TranslationsLoliSyncEn.internal(_root);
  late final TranslationsImageSearchEn imageSearch = TranslationsImageSearchEn.internal(_root);
  late final TranslationsTagViewEn tagView = TranslationsTagViewEn.internal(_root);
  late final TranslationsPinnedTagsEn pinnedTags = TranslationsPinnedTagsEn.internal(_root);
  late final TranslationsSearchBarEn searchBar = TranslationsSearchBarEn.internal(_root);
  late final TranslationsMobileHomeEn mobileHome = TranslationsMobileHomeEn.internal(_root);
  late final TranslationsDesktopHomeEn desktopHome = TranslationsDesktopHomeEn.internal(_root);
  late final TranslationsGalleryViewEn galleryView = TranslationsGalleryViewEn.internal(_root);
  late final TranslationsMediaPreviewsEn mediaPreviews = TranslationsMediaPreviewsEn.internal(_root);
  late final TranslationsViewerEn viewer = TranslationsViewerEn.internal(_root);
  late final TranslationsCommonEn common = TranslationsCommonEn.internal(_root);
  late final TranslationsGalleryEn gallery = TranslationsGalleryEn.internal(_root);
  late final TranslationsGalleryButtonsEn galleryButtons = TranslationsGalleryButtonsEn.internal(_root);
  late final TranslationsMediaEn media = TranslationsMediaEn.internal(_root);
  late final TranslationsImageStatsEn imageStats = TranslationsImageStatsEn.internal(_root);
  late final TranslationsPreviewEn preview = TranslationsPreviewEn.internal(_root);
  late final TranslationsTagTypeEn tagType = TranslationsTagTypeEn.internal(_root);
}

// Path: validationErrors
class TranslationsValidationErrorsEn {
  TranslationsValidationErrorsEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Please enter a value'
  String get required => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Please enter a value';

  /// en: 'Please enter a valid value'
  String get invalid => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Please enter a valid value';

  /// en: 'Please enter a number'
  String get invalidNumber => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? 'Please enter a number';

  /// en: 'Please enter a valid numeric value'
  String get invalidNumericValue =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? 'Please enter a valid numeric value';

  /// en: 'Please enter a value bigger than ${min: double}'
  String tooSmall({required double min}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Please enter a value bigger than ${min}';

  /// en: 'Please enter a value smaller than ${max: double}'
  String tooBig({required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Please enter a value smaller than ${max}';

  /// en: 'Please enter a value between ${min: double} and ${max: double}'
  String rangeError({required double min, required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ??
      'Please enter a value between ${min} and ${max}';

  /// en: 'Please enter a value equal to or greater than 0'
  String get greaterThanOrEqualZero =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? 'Please enter a value equal to or greater than 0';

  /// en: 'Please enter a value less than 4'
  String get lessThan4 => TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? 'Please enter a value less than 4';

  /// en: 'Please enter a value bigger than 100'
  String get biggerThan100 =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? 'Please enter a value bigger than 100';

  /// en: 'Using more than 4 columns can affect performance'
  String get moreThan4ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ?? 'Using more than 4 columns can affect performance';

  /// en: 'Using more than 8 columns can affect performance'
  String get moreThan8ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ?? 'Using more than 8 columns can affect performance';
}

// Path: init
class TranslationsInitEn {
  TranslationsInitEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Initialization error!'
  String get initError => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Initialization error!';

  /// en: 'Setting up proxy...'
  String get settingUpProxy => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Setting up proxy...';

  /// en: 'Loading database...'
  String get loadingDatabase => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Loading database...';

  /// en: 'Loading boorus...'
  String get loadingBoorus => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Loading boorus...';

  /// en: 'Loading tags...'
  String get loadingTags => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Loading tags...';

  /// en: 'Restoring tabs...'
  String get restoringTabs => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Restoring tabs...';
}

// Path: permissions
class TranslationsPermissionsEn {
  TranslationsPermissionsEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'No access to custom storage directory'
  String get noAccessToCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ?? 'No access to custom storage directory';

  /// en: 'Please set storage directory again to grant the app access to it'
  String get pleaseSetStorageDirectoryAgain =>
      TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ??
      'Please set storage directory again to grant the app access to it';

  /// en: 'Current path: ${path: String}'
  String currentPath({required String path}) =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? 'Current path: ${path}';

  /// en: 'Set directory'
  String get setDirectory => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? 'Set directory';

  /// en: 'Not available on this platform'
  String get currentlyNotAvailableForThisPlatform =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ?? 'Not available on this platform';

  /// en: 'Reset directory'
  String get resetDirectory => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? 'Reset directory';

  /// en: 'Files will save to default directory after reset'
  String get afterResetFilesWillBeSavedToDefaultDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ??
      'Files will save to default directory after reset';
}

// Path: authentication
class TranslationsAuthenticationEn {
  TranslationsAuthenticationEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Please authenticate to use the app'
  String get pleaseAuthenticateToUseTheApp =>
      TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ?? 'Please authenticate to use the app';

  /// en: 'No biometric hardware available'
  String get noBiometricHardwareAvailable =>
      TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? 'No biometric hardware available';

  /// en: 'Temporary lockout'
  String get temporaryLockout => TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? 'Temporary lockout';

  /// en: 'Something went wrong: ${error: String}'
  String somethingWentWrong({required String error}) =>
      TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ?? 'Something went wrong: ${error}';
}

// Path: searchHandler
class TranslationsSearchHandlerEn {
  TranslationsSearchHandlerEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Removed last tab'
  String get removedLastTab => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? 'Removed last tab';

  /// en: 'Resetting to default tags'
  String get resettingSearchToDefaultTags =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? 'Resetting to default tags';

  /// en: 'UOOOOOOOHHH'
  String get uoh => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'UOOOOOOOHHH';

  /// en: 'Ratings changed'
  String get ratingsChanged => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? 'Ratings changed';

  /// en: 'On ${booruType: String} [rating:safe] is now replaced with [rating:general] and [rating:sensitive]'
  String ratingsChangedMessage({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
      'On ${booruType} [rating:safe] is now replaced with [rating:general] and [rating:sensitive]';

  /// en: 'Rating was auto-fixed. Use correct rating in future searches'
  String get appFixedRatingAutomatically =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ??
      'Rating was auto-fixed. Use correct rating in future searches';

  /// en: 'Tabs restored'
  String get tabsRestored => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? 'Tabs restored';

  /// en: '(one) {Restored ${count} tab from previous session} (few) {Restored ${count} tabs from previous session} (many) {Restored ${count} tabs from previous session} (other) {Restored ${count} tabs from previous session}'
  String restoredTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'Restored ${count} tab from previous session',
        few: 'Restored ${count} tabs from previous session',
        many: 'Restored ${count} tabs from previous session',
        other: 'Restored ${count} tabs from previous session',
      );

  /// en: 'Some restored tabs had unknown boorus or broken characters.'
  String get someRestoredTabsHadIssues =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ??
      'Some restored tabs had unknown boorus or broken characters.';

  /// en: 'They were set to default or ignored.'
  String get theyWereSetToDefaultOrIgnored =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ?? 'They were set to default or ignored.';

  /// en: 'List of broken tabs:'
  String get listOfBrokenTabs => TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? 'List of broken tabs:';

  /// en: 'Tabs merged'
  String get tabsMerged => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? 'Tabs merged';

  /// en: '(one) {Added ${count} new tab} (few) {Added ${count} new tabs} (many) {Added ${count} new tabs} (other) {Added ${count} new tabs}'
  String addedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'Added ${count} new tab',
        few: 'Added ${count} new tabs',
        many: 'Added ${count} new tabs',
        other: 'Added ${count} new tabs',
      );

  /// en: 'Tabs replaced'
  String get tabsReplaced => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? 'Tabs replaced';

  /// en: '(one) {Received ${count} tab} (few) {Received ${count} tabs} (many) {Received ${count} tabs} (other) {Received ${count} tabs}'
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
class TranslationsSnatcherEn {
  TranslationsSnatcherEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Snatcher'
  String get title => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Snatcher';

  /// en: 'Snatching history'
  String get snatchingHistory => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'Snatching history';

  /// en: 'Enter tags'
  String get enterTags => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'Enter tags';

  /// en: 'Amount'
  String get amount => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? 'Amount';

  /// en: 'Amount of Files to Snatch'
  String get amountOfFilesToSnatch => TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? 'Amount of Files to Snatch';

  /// en: 'Delay (in ms)'
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? 'Delay (in ms)';

  /// en: 'Delay between each download'
  String get delayBetweenEachDownload =>
      TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? 'Delay between each download';

  /// en: 'Snatch files'
  String get snatchFiles => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? 'Snatch files';

  /// en: 'Item was already snatched before'
  String get itemWasAlreadySnatched =>
      TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? 'Item was already snatched before';

  /// en: 'Failed to snatch the item'
  String get failedToSnatchItem => TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? 'Failed to snatch the item';

  /// en: 'Item was cancelled'
  String get itemWasCancelled => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? 'Item was cancelled';

  /// en: 'Starting next queue item...'
  String get startingNextQueueItem => TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? 'Starting next queue item...';

  /// en: 'Items snatched'
  String get itemsSnatched => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? 'Items snatched';

  /// en: '(one) {Snatched: ${count} item} (few) {Snatched: ${count} items} (many) {Snatched: ${count} items} (other) {Snatched: ${count} items}'
  String snatchedCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'Snatched: ${count} item',
        few: 'Snatched: ${count} items',
        many: 'Snatched: ${count} items',
        other: 'Snatched: ${count} items',
      );

  /// en: '(one) {${count} file was already snatched} (few) {${count} files were already snatched} (many) {${count} files were already snatched} (other) {${count} files were already snatched}'
  String filesAlreadySnatched({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '${count} file was already snatched',
        few: '${count} files were already snatched',
        many: '${count} files were already snatched',
        other: '${count} files were already snatched',
      );

  /// en: '(one) {Failed to snatch ${count} file} (few) {Failed to snatch ${count} files} (many) {Failed to snatch ${count} files} (other) {Failed to snatch ${count} files}'
  String failedToSnatchFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'Failed to snatch ${count} file',
        few: 'Failed to snatch ${count} files',
        many: 'Failed to snatch ${count} files',
        other: 'Failed to snatch ${count} files',
      );

  /// en: '(one) {Cancelled ${count} file} (few) {Cancelled ${count} files} (many) {Cancelled ${count} files} (other) {Cancelled ${count} files}'
  String cancelledFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'Cancelled ${count} file',
        few: 'Cancelled ${count} files',
        many: 'Cancelled ${count} files',
        other: 'Cancelled ${count} files',
      );

  /// en: 'Snatching images'
  String get snatchingImages => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? 'Snatching images';

  /// en: 'Don't close app!'
  String get doNotCloseApp => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? 'Don\'t close app!';

  /// en: 'Added item to snatch queue'
  String get addedItemToQueue => TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? 'Added item to snatch queue';

  /// en: '(one) {Added ${count} item to snatch queue} (few) {Added ${count} items to snatch queue} (many) {Added ${count} items to snatch queue} (other) {Added ${count} items to snatch queue}'
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
class TranslationsMultibooruEn {
  TranslationsMultibooruEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Multibooru'
  String get title => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? 'Multibooru';

  /// en: 'Multibooru mode'
  String get multibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Multibooru mode';

  /// en: 'Requires at least 2 configured boorus'
  String get multibooruRequiresAtLeastTwoBoorus =>
      TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ?? 'Requires at least 2 configured boorus';

  /// en: 'Select secondary boorus:'
  String get selectSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Select secondary boorus:';

  /// en: 'aka Multibooru mode'
  String get akaMultibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? 'aka Multibooru mode';

  /// en: 'Secondary boorus to include'
  String get labelSecondaryBoorusToInclude =>
      TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? 'Secondary boorus to include';
}

// Path: hydrus
class TranslationsHydrusEn {
  TranslationsHydrusEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Something went wrong importing to hydrus'
  String get importError => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'Something went wrong importing to hydrus';

  /// en: 'You might not have given the correct API permissions, this can be edited in Review Services'
  String get apiPermissionsRequired =>
      TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ??
      'You might not have given the correct API permissions, this can be edited in Review Services';

  /// en: 'Add tags to file'
  String get addTagsToFile => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? 'Add tags to file';

  /// en: 'Add URLs'
  String get addUrls => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'Add URLs';
}

// Path: tabs
class TranslationsTabsEn {
  TranslationsTabsEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Tab'
  String get tab => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? 'Tab';

  /// en: 'Add boorus in settings'
  String get addBoorusInSettings => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? 'Add boorus in settings';

  /// en: 'Select a Booru'
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? 'Select a Booru';

  /// en: 'Secondary boorus'
  String get secondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? 'Secondary boorus';

  /// en: 'Add new tab'
  String get addNewTab => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? 'Add new tab';

  /// en: 'Select a booru or leave empty'
  String get selectABooruOrLeaveEmpty =>
      TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? 'Select a booru or leave empty';

  /// en: 'Add position'
  String get addPosition => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? 'Add position';

  /// en: 'Prev tab'
  String get addModePrevTab => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? 'Prev tab';

  /// en: 'Next tab'
  String get addModeNextTab => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? 'Next tab';

  /// en: 'List end'
  String get addModeListEnd => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? 'List end';

  /// en: 'Used query'
  String get usedQuery => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? 'Used query';

  /// en: 'Default'
  String get queryModeDefault => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? 'Default';

  /// en: 'Current'
  String get queryModeCurrent => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? 'Current';

  /// en: 'Custom'
  String get queryModeCustom => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? 'Custom';

  /// en: 'Custom query'
  String get customQuery => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? 'Custom query';

  /// en: '[empty]'
  String get empty => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '[empty]';

  /// en: 'Add secondary boorus'
  String get addSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? 'Add secondary boorus';

  /// en: 'Keep secondary boorus'
  String get keepSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? 'Keep secondary boorus';

  /// en: 'Start from custom page number'
  String get startFromCustomPageNumber =>
      TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? 'Start from custom page number';

  /// en: 'Switch to new tab'
  String get switchToNewTab => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? 'Switch to new tab';

  /// en: 'Add'
  String get add => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? 'Add';

  /// en: 'Tabs Manager'
  String get tabsManager => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? 'Tabs Manager';

  /// en: 'Select mode'
  String get selectMode => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? 'Select mode';

  /// en: 'Sort tabs'
  String get sortMode => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? 'Sort tabs';

  /// en: 'Help'
  String get help => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? 'Help';

  /// en: 'Delete tabs'
  String get deleteTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? 'Delete tabs';

  /// en: 'Shuffle tabs'
  String get shuffleTabs => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? 'Shuffle tabs';

  /// en: 'Tab randomly shuffled'
  String get tabRandomlyShuffled => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? 'Tab randomly shuffled';

  /// en: 'Tab order saved'
  String get tabOrderSaved => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? 'Tab order saved';

  /// en: 'Scroll to current tab'
  String get scrollToCurrent => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? 'Scroll to current tab';

  /// en: 'Scroll to top'
  String get scrollToTop => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? 'Scroll to top';

  /// en: 'Scroll to bottom'
  String get scrollToBottom => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? 'Scroll to bottom';

  /// en: 'Filter by booru, state, duplicates...'
  String get filterTabsByBooru => TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? 'Filter by booru, state, duplicates...';

  /// en: 'Scrolling:'
  String get scrolling => TranslationOverrides.string(_root.$meta, 'tabs.scrolling', {}) ?? 'Scrolling:';

  /// en: 'Sorting:'
  String get sorting => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? 'Sorting:';

  /// en: 'Default tabs order'
  String get defaultTabsOrder => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? 'Default tabs order';

  /// en: 'Sort alphabetically'
  String get sortAlphabetically => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? 'Sort alphabetically';

  /// en: 'Sort alphabetically (reversed)'
  String get sortAlphabeticallyReversed =>
      TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? 'Sort alphabetically (reversed)';

  /// en: 'Sort by booru name alphabetically'
  String get sortByBooruName => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? 'Sort by booru name alphabetically';

  /// en: 'Sort by booru name alphabetically (reversed)'
  String get sortByBooruNameReversed =>
      TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ?? 'Sort by booru name alphabetically (reversed)';

  /// en: 'Long press sort button to save current order'
  String get longPressSortToSave =>
      TranslationOverrides.string(_root.$meta, 'tabs.longPressSortToSave', {}) ?? 'Long press sort button to save current order';

  /// en: 'Select:'
  String get select => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? 'Select:';

  /// en: 'Toggle select mode'
  String get toggleSelectMode => TranslationOverrides.string(_root.$meta, 'tabs.toggleSelectMode', {}) ?? 'Toggle select mode';

  /// en: 'On the bottom of the page: '
  String get onTheBottomOfPage => TranslationOverrides.string(_root.$meta, 'tabs.onTheBottomOfPage', {}) ?? 'On the bottom of the page: ';

  /// en: 'Select/deselect all tabs'
  String get selectDeselectAll => TranslationOverrides.string(_root.$meta, 'tabs.selectDeselectAll', {}) ?? 'Select/deselect all tabs';

  /// en: 'Delete selected tabs'
  String get deleteSelectedTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? 'Delete selected tabs';

  /// en: 'Long press on a tab to move it'
  String get longPressToMove => TranslationOverrides.string(_root.$meta, 'tabs.longPressToMove', {}) ?? 'Long press on a tab to move it';

  /// en: 'Numbers in the bottom right of the tab:'
  String get numbersInBottomRight =>
      TranslationOverrides.string(_root.$meta, 'tabs.numbersInBottomRight', {}) ?? 'Numbers in the bottom right of the tab:';

  /// en: 'First number - tab index in default list order'
  String get firstNumberTabIndex =>
      TranslationOverrides.string(_root.$meta, 'tabs.firstNumberTabIndex', {}) ?? 'First number - tab index in default list order';

  /// en: 'Second number - tab index in current list order, appears when filtering/sorting is active'
  String get secondNumberTabIndex =>
      TranslationOverrides.string(_root.$meta, 'tabs.secondNumberTabIndex', {}) ??
      'Second number - tab index in current list order, appears when filtering/sorting is active';

  /// en: 'Special filters:'
  String get specialFilters => TranslationOverrides.string(_root.$meta, 'tabs.specialFilters', {}) ?? 'Special filters:';

  /// en: '«Loaded» - show tabs which have loaded items'
  String get loadedFilter => TranslationOverrides.string(_root.$meta, 'tabs.loadedFilter', {}) ?? '«Loaded» - show tabs which have loaded items';

  /// en: '«Not loaded» - show tabs which are not loaded and/or have zero items'
  String get notLoadedFilter =>
      TranslationOverrides.string(_root.$meta, 'tabs.notLoadedFilter', {}) ?? '«Not loaded» - show tabs which are not loaded and/or have zero items';

  /// en: 'Not loaded tabs have italic text'
  String get notLoadedItalic => TranslationOverrides.string(_root.$meta, 'tabs.notLoadedItalic', {}) ?? 'Not loaded tabs have italic text';

  /// en: 'No tabs found'
  String get noTabsFound => TranslationOverrides.string(_root.$meta, 'tabs.noTabsFound', {}) ?? 'No tabs found';

  /// en: 'Copy'
  String get copy => TranslationOverrides.string(_root.$meta, 'tabs.copy', {}) ?? 'Copy';

  /// en: 'Move'
  String get moveAction => TranslationOverrides.string(_root.$meta, 'tabs.moveAction', {}) ?? 'Move';

  /// en: 'Remove'
  String get remove => TranslationOverrides.string(_root.$meta, 'tabs.remove', {}) ?? 'Remove';

  /// en: 'Shuffle'
  String get shuffle => TranslationOverrides.string(_root.$meta, 'tabs.shuffle', {}) ?? 'Shuffle';

  /// en: 'Sort'
  String get sort => TranslationOverrides.string(_root.$meta, 'tabs.sort', {}) ?? 'Sort';

  /// en: 'Shuffle tabs order randomly?'
  String get shuffleTabsQuestion => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabsQuestion', {}) ?? 'Shuffle tabs order randomly?';

  /// en: 'Save tabs in current sorting order?'
  String get saveTabsInCurrentOrder =>
      TranslationOverrides.string(_root.$meta, 'tabs.saveTabsInCurrentOrder', {}) ?? 'Save tabs in current sorting order?';

  /// en: 'By booru'
  String get byBooru => TranslationOverrides.string(_root.$meta, 'tabs.byBooru', {}) ?? 'By booru';

  /// en: 'Alphabetically'
  String get alphabetically => TranslationOverrides.string(_root.$meta, 'tabs.alphabetically', {}) ?? 'Alphabetically';

  /// en: '(reversed)'
  String get reversed => TranslationOverrides.string(_root.$meta, 'tabs.reversed', {}) ?? '(reversed)';

  /// en: '(one) {Are you sure you want to delete ${count} tab?} (few) {Are you sure you want to delete ${count} tabs?} (many) {Are you sure you want to delete ${count} tabs?} (other) {Are you sure you want to delete ${count} tabs?}'
  String areYouSureDeleteTabs({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'tabs.areYouSureDeleteTabs', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'Are you sure you want to delete ${count} tab?',
        few: 'Are you sure you want to delete ${count} tabs?',
        many: 'Are you sure you want to delete ${count} tabs?',
        other: 'Are you sure you want to delete ${count} tabs?',
      );

  late final TranslationsTabsFiltersEn filters = TranslationsTabsFiltersEn.internal(_root);
  late final TranslationsTabsMoveEn move = TranslationsTabsMoveEn.internal(_root);
}

// Path: history
class TranslationsHistoryEn {
  TranslationsHistoryEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Search history'
  String get searchHistory => TranslationOverrides.string(_root.$meta, 'history.searchHistory', {}) ?? 'Search history';

  /// en: 'Search history is empty'
  String get searchHistoryIsEmpty => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsEmpty', {}) ?? 'Search history is empty';

  /// en: 'Search history disabled'
  String get searchHistoryIsDisabled => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsDisabled', {}) ?? 'Search history disabled';

  /// en: 'Enable database in settings for search history'
  String get searchHistoryRequiresDatabase =>
      TranslationOverrides.string(_root.$meta, 'history.searchHistoryRequiresDatabase', {}) ?? 'Enable database in settings for search history';

  /// en: 'Last search: ${search: String}'
  String lastSearch({required String search}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearch', {'search': search}) ?? 'Last search: ${search}';

  /// en: 'Last search: ${date: String}'
  String lastSearchWithDate({required String date}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearchWithDate', {'date': date}) ?? 'Last search: ${date}';

  /// en: 'Unknown Booru type!'
  String get unknownBooruType => TranslationOverrides.string(_root.$meta, 'history.unknownBooruType', {}) ?? 'Unknown Booru type!';

  /// en: 'Unknown booru (${name: String}-${type: String})'
  String unknownBooru({required String name, required String type}) =>
      TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ?? 'Unknown booru (${name}-${type})';

  /// en: 'Open'
  String get open => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? 'Open';

  /// en: 'Open in new tab'
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? 'Open in new tab';

  /// en: 'Remove from Favourites'
  String get removeFromFavourites => TranslationOverrides.string(_root.$meta, 'history.removeFromFavourites', {}) ?? 'Remove from Favourites';

  /// en: 'Set as Favourite'
  String get setAsFavourite => TranslationOverrides.string(_root.$meta, 'history.setAsFavourite', {}) ?? 'Set as Favourite';

  /// en: 'Copy'
  String get copy => TranslationOverrides.string(_root.$meta, 'history.copy', {}) ?? 'Copy';

  /// en: 'Delete'
  String get delete => TranslationOverrides.string(_root.$meta, 'history.delete', {}) ?? 'Delete';

  /// en: 'Delete history entries'
  String get deleteHistoryEntries => TranslationOverrides.string(_root.$meta, 'history.deleteHistoryEntries', {}) ?? 'Delete history entries';

  /// en: '(one) {Are you sure you want to delete ${count} item?} (few) {Are you sure you want to delete ${count} items?} (many) {Are you sure you want to delete ${count} items?} (other) {Are you sure you want to delete ${count} items?}'
  String deleteItemsConfirm({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'history.deleteItemsConfirm', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'Are you sure you want to delete ${count} item?',
        few: 'Are you sure you want to delete ${count} items?',
        many: 'Are you sure you want to delete ${count} items?',
        other: 'Are you sure you want to delete ${count} items?',
      );

  /// en: 'Clear selection'
  String get clearSelection => TranslationOverrides.string(_root.$meta, 'history.clearSelection', {}) ?? 'Clear selection';

  /// en: '(one) {Delete ${count} item} (few) {Delete ${count} items} (many) {Delete ${count} items} (other) {Delete ${count} items}'
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
class TranslationsWebviewEn {
  TranslationsWebviewEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Webview'
  String get title => TranslationOverrides.string(_root.$meta, 'webview.title', {}) ?? 'Webview';

  /// en: 'Not supported on this device'
  String get notSupportedOnDevice => TranslationOverrides.string(_root.$meta, 'webview.notSupportedOnDevice', {}) ?? 'Not supported on this device';

  late final TranslationsWebviewNavigationEn navigation = TranslationsWebviewNavigationEn.internal(_root);
}

// Path: settings
class TranslationsSettingsEn {
  TranslationsSettingsEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// Main settings page/button title
  ///
  /// en: 'Settings'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Settings';

  late final TranslationsSettingsLanguageEn language = TranslationsSettingsLanguageEn.internal(_root);
  late final TranslationsSettingsBooruEn booru = TranslationsSettingsBooruEn.internal(_root);
  late final TranslationsSettingsBooruEditorEn booruEditor = TranslationsSettingsBooruEditorEn.internal(_root);
  late final TranslationsSettingsInterfaceEn interface = TranslationsSettingsInterfaceEn.internal(_root);
  late final TranslationsSettingsThemeEn theme = TranslationsSettingsThemeEn.internal(_root);
  late final TranslationsSettingsViewerEn viewer = TranslationsSettingsViewerEn.internal(_root);
  late final TranslationsSettingsVideoEn video = TranslationsSettingsVideoEn.internal(_root);
  late final TranslationsSettingsDownloadsEn downloads = TranslationsSettingsDownloadsEn.internal(_root);
  late final TranslationsSettingsDatabaseEn database = TranslationsSettingsDatabaseEn.internal(_root);
  late final TranslationsSettingsBackupAndRestoreEn backupAndRestore = TranslationsSettingsBackupAndRestoreEn.internal(_root);
  late final TranslationsSettingsNetworkEn network = TranslationsSettingsNetworkEn.internal(_root);
  late final TranslationsSettingsPrivacyEn privacy = TranslationsSettingsPrivacyEn.internal(_root);
  late final TranslationsSettingsPerformanceEn performance = TranslationsSettingsPerformanceEn.internal(_root);
  late final TranslationsSettingsCacheEn cache = TranslationsSettingsCacheEn.internal(_root);
  late final TranslationsSettingsItemFiltersEn itemFilters = TranslationsSettingsItemFiltersEn.internal(_root);
  late final TranslationsSettingsSyncEn sync = TranslationsSettingsSyncEn.internal(_root);
  late final TranslationsSettingsAboutEn about = TranslationsSettingsAboutEn.internal(_root);
  late final TranslationsSettingsCheckForUpdatesEn checkForUpdates = TranslationsSettingsCheckForUpdatesEn.internal(_root);
  late final TranslationsSettingsLogsEn logs = TranslationsSettingsLogsEn.internal(_root);
  late final TranslationsSettingsHelpEn help = TranslationsSettingsHelpEn.internal(_root);
  late final TranslationsSettingsDebugEn debug = TranslationsSettingsDebugEn.internal(_root);
  late final TranslationsSettingsLoggingEn logging = TranslationsSettingsLoggingEn.internal(_root);
  late final TranslationsSettingsWebviewEn webview = TranslationsSettingsWebviewEn.internal(_root);
  late final TranslationsSettingsDirPickerEn dirPicker = TranslationsSettingsDirPickerEn.internal(_root);

  /// en: 'Version'
  String get version => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? 'Version';
}

// Path: comments
class TranslationsCommentsEn {
  TranslationsCommentsEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Comments'
  String get title => TranslationOverrides.string(_root.$meta, 'comments.title', {}) ?? 'Comments';

  /// en: 'No comments'
  String get noComments => TranslationOverrides.string(_root.$meta, 'comments.noComments', {}) ?? 'No comments';

  /// en: 'This Booru doesn't have comments or there is no API for them'
  String get noBooruAPIForComments =>
      TranslationOverrides.string(_root.$meta, 'comments.noBooruAPIForComments', {}) ??
      'This Booru doesn\'t have comments or there is no API for them';
}

// Path: pageChanger
class TranslationsPageChangerEn {
  TranslationsPageChangerEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Page changer'
  String get title => TranslationOverrides.string(_root.$meta, 'pageChanger.title', {}) ?? 'Page changer';

  /// en: 'Page #'
  String get pageLabel => TranslationOverrides.string(_root.$meta, 'pageChanger.pageLabel', {}) ?? 'Page #';

  /// en: 'Delay between loadings (ms)'
  String get delayBetweenLoadings =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.delayBetweenLoadings', {}) ?? 'Delay between loadings (ms)';

  /// en: 'Delay in ms'
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'pageChanger.delayInMs', {}) ?? 'Delay in ms';

  /// en: 'Current page #${number: int}'
  String currentPage({required int number}) =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.currentPage', {'number': number}) ?? 'Current page #${number}';

  /// en: 'Possible max page #~${number: int}'
  String possibleMaxPage({required int number}) =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.possibleMaxPage', {'number': number}) ?? 'Possible max page #~${number}';

  /// en: 'Search currently running!'
  String get searchCurrentlyRunning =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.searchCurrentlyRunning', {}) ?? 'Search currently running!';

  /// en: 'Jump to page'
  String get jumpToPage => TranslationOverrides.string(_root.$meta, 'pageChanger.jumpToPage', {}) ?? 'Jump to page';

  /// en: 'Search until page'
  String get searchUntilPage => TranslationOverrides.string(_root.$meta, 'pageChanger.searchUntilPage', {}) ?? 'Search until page';

  /// en: 'Stop searching'
  String get stopSearching => TranslationOverrides.string(_root.$meta, 'pageChanger.stopSearching', {}) ?? 'Stop searching';
}

// Path: tagsFiltersDialogs
class TranslationsTagsFiltersDialogsEn {
  TranslationsTagsFiltersDialogsEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Empty input!'
  String get emptyInput => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.emptyInput', {}) ?? 'Empty input!';

  /// en: '[Add new ${type: String} filter]'
  String addNewFilter({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.addNewFilter', {'type': type}) ?? '[Add new ${type} filter]';

  /// en: 'New ${type: String} tag filter'
  String newTagFilter({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newTagFilter', {'type': type}) ?? 'New ${type} tag filter';

  /// en: 'New filter'
  String get newFilter => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newFilter', {}) ?? 'New filter';

  /// en: 'Edit filter'
  String get editFilter => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.editFilter', {}) ?? 'Edit filter';
}

// Path: tagsManager
class TranslationsTagsManagerEn {
  TranslationsTagsManagerEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Tags'
  String get title => TranslationOverrides.string(_root.$meta, 'tagsManager.title', {}) ?? 'Tags';

  /// en: 'Add tag'
  String get addTag => TranslationOverrides.string(_root.$meta, 'tagsManager.addTag', {}) ?? 'Add tag';

  /// en: 'Name'
  String get name => TranslationOverrides.string(_root.$meta, 'tagsManager.name', {}) ?? 'Name';

  /// en: 'Type'
  String get type => TranslationOverrides.string(_root.$meta, 'tagsManager.type', {}) ?? 'Type';

  /// en: 'Add'
  String get add => TranslationOverrides.string(_root.$meta, 'tagsManager.add', {}) ?? 'Add';

  /// en: 'Stale after: ${staleText: String}'
  String staleAfter({required String staleText}) =>
      TranslationOverrides.string(_root.$meta, 'tagsManager.staleAfter', {'staleText': staleText}) ?? 'Stale after: ${staleText}';

  /// en: 'Added a tab'
  String get addedATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addedATab', {}) ?? 'Added a tab';

  /// en: 'Add a tab'
  String get addATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addATab', {}) ?? 'Add a tab';

  /// en: 'Copy'
  String get copy => TranslationOverrides.string(_root.$meta, 'tagsManager.copy', {}) ?? 'Copy';

  /// en: 'Set stale'
  String get setStale => TranslationOverrides.string(_root.$meta, 'tagsManager.setStale', {}) ?? 'Set stale';

  /// en: 'Reset stale'
  String get resetStale => TranslationOverrides.string(_root.$meta, 'tagsManager.resetStale', {}) ?? 'Reset stale';

  /// en: 'Make unstaleable'
  String get makeUnstaleable => TranslationOverrides.string(_root.$meta, 'tagsManager.makeUnstaleable', {}) ?? 'Make unstaleable';

  /// en: '(one) {Delete ${count} tag} (few) {Delete ${count} tags} (many) {Delete ${count} tags} (other) {Delete ${count} tags}'
  String deleteTags({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'tagsManager.deleteTags', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'Delete ${count} tag',
        few: 'Delete ${count} tags',
        many: 'Delete ${count} tags',
        other: 'Delete ${count} tags',
      );

  /// en: 'Delete tags'
  String get deleteTagsTitle => TranslationOverrides.string(_root.$meta, 'tagsManager.deleteTagsTitle', {}) ?? 'Delete tags';

  /// en: 'Clear selection'
  String get clearSelection => TranslationOverrides.string(_root.$meta, 'tagsManager.clearSelection', {}) ?? 'Clear selection';
}

// Path: lockscreen
class TranslationsLockscreenEn {
  TranslationsLockscreenEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Tap to authenticate'
  String get tapToAuthenticate => TranslationOverrides.string(_root.$meta, 'lockscreen.tapToAuthenticate', {}) ?? 'Tap to authenticate';

  /// en: 'DEV UNLOCK'
  String get devUnlock => TranslationOverrides.string(_root.$meta, 'lockscreen.devUnlock', {}) ?? 'DEV UNLOCK';

  /// en: '[TESTING]: Press this if you cannot unlock the app through normal means. Report to developer with details about your device.'
  String get testingMessage =>
      TranslationOverrides.string(_root.$meta, 'lockscreen.testingMessage', {}) ??
      '[TESTING]: Press this if you cannot unlock the app through normal means. Report to developer with details about your device.';
}

// Path: loliSync
class TranslationsLoliSyncEn {
  TranslationsLoliSyncEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'LoliSync'
  String get title => TranslationOverrides.string(_root.$meta, 'loliSync.title', {}) ?? 'LoliSync';

  /// en: 'Do you want to stop syncing?'
  String get stopSyncingQuestion => TranslationOverrides.string(_root.$meta, 'loliSync.stopSyncingQuestion', {}) ?? 'Do you want to stop syncing?';

  /// en: 'Do you want to stop the server?'
  String get stopServerQuestion => TranslationOverrides.string(_root.$meta, 'loliSync.stopServerQuestion', {}) ?? 'Do you want to stop the server?';

  /// en: 'No connection'
  String get noConnection => TranslationOverrides.string(_root.$meta, 'loliSync.noConnection', {}) ?? 'No connection';

  /// en: 'Waiting for connection...'
  String get waitingForConnection => TranslationOverrides.string(_root.$meta, 'loliSync.waitingForConnection', {}) ?? 'Waiting for connection...';

  /// en: 'Starting server...'
  String get startingServer => TranslationOverrides.string(_root.$meta, 'loliSync.startingServer', {}) ?? 'Starting server...';

  /// en: 'Keep the screen awake'
  String get keepScreenAwake => TranslationOverrides.string(_root.$meta, 'loliSync.keepScreenAwake', {}) ?? 'Keep the screen awake';

  /// en: 'LoliSync server killed'
  String get serverKilled => TranslationOverrides.string(_root.$meta, 'loliSync.serverKilled', {}) ?? 'LoliSync server killed';

  /// en: 'Test error: ${statusCode: int} ${reasonPhrase: String}'
  String testError({required int statusCode, required String reasonPhrase}) =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testError', {'statusCode': statusCode, 'reasonPhrase': reasonPhrase}) ??
      'Test error: ${statusCode} ${reasonPhrase}';

  /// en: 'Test error: ${error: String}'
  String testErrorException({required String error}) =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testErrorException', {'error': error}) ?? 'Test error: ${error}';

  /// en: 'Test request received a positive response'
  String get testSuccess => TranslationOverrides.string(_root.$meta, 'loliSync.testSuccess', {}) ?? 'Test request received a positive response';

  /// en: 'There should be a 'Test' message on the other device'
  String get testSuccessMessage =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testSuccessMessage', {}) ?? 'There should be a \'Test\' message on the other device';
}

// Path: imageSearch
class TranslationsImageSearchEn {
  TranslationsImageSearchEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Image search'
  String get title => TranslationOverrides.string(_root.$meta, 'imageSearch.title', {}) ?? 'Image search';
}

// Path: tagView
class TranslationsTagViewEn {
  TranslationsTagViewEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Tags'
  String get tags => TranslationOverrides.string(_root.$meta, 'tagView.tags', {}) ?? 'Tags';

  /// en: 'Comments'
  String get comments => TranslationOverrides.string(_root.$meta, 'tagView.comments', {}) ?? 'Comments';

  /// en: 'Show notes (${count: int})'
  String showNotes({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'tagView.showNotes', {'count': count}) ?? 'Show notes (${count})';

  /// en: 'Hide notes (${count: int})'
  String hideNotes({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'tagView.hideNotes', {'count': count}) ?? 'Hide notes (${count})';

  /// en: 'Load notes'
  String get loadNotes => TranslationOverrides.string(_root.$meta, 'tagView.loadNotes', {}) ?? 'Load notes';

  /// en: 'This tag is already in the current search query:'
  String get thisTagAlreadyInSearch =>
      TranslationOverrides.string(_root.$meta, 'tagView.thisTagAlreadyInSearch', {}) ?? 'This tag is already in the current search query:';

  /// en: 'Added to current search query:'
  String get addedToCurrentSearch => TranslationOverrides.string(_root.$meta, 'tagView.addedToCurrentSearch', {}) ?? 'Added to current search query:';

  /// en: 'Added new tab:'
  String get addedNewTab => TranslationOverrides.string(_root.$meta, 'tagView.addedNewTab', {}) ?? 'Added new tab:';

  /// en: 'ID'
  String get id => TranslationOverrides.string(_root.$meta, 'tagView.id', {}) ?? 'ID';

  /// en: 'Post URL'
  String get postURL => TranslationOverrides.string(_root.$meta, 'tagView.postURL', {}) ?? 'Post URL';

  /// en: 'Posted'
  String get posted => TranslationOverrides.string(_root.$meta, 'tagView.posted', {}) ?? 'Posted';

  /// en: 'Details'
  String get details => TranslationOverrides.string(_root.$meta, 'tagView.details', {}) ?? 'Details';

  /// en: 'Filename'
  String get filename => TranslationOverrides.string(_root.$meta, 'tagView.filename', {}) ?? 'Filename';

  /// en: 'URL'
  String get url => TranslationOverrides.string(_root.$meta, 'tagView.url', {}) ?? 'URL';

  /// en: 'Extension'
  String get extension => TranslationOverrides.string(_root.$meta, 'tagView.extension', {}) ?? 'Extension';

  /// en: 'Resolution'
  String get resolution => TranslationOverrides.string(_root.$meta, 'tagView.resolution', {}) ?? 'Resolution';

  /// en: 'Size'
  String get size => TranslationOverrides.string(_root.$meta, 'tagView.size', {}) ?? 'Size';

  /// en: 'MD5'
  String get md5 => TranslationOverrides.string(_root.$meta, 'tagView.md5', {}) ?? 'MD5';

  /// en: 'Rating'
  String get rating => TranslationOverrides.string(_root.$meta, 'tagView.rating', {}) ?? 'Rating';

  /// en: 'Score'
  String get score => TranslationOverrides.string(_root.$meta, 'tagView.score', {}) ?? 'Score';

  /// en: 'No tags found'
  String get noTagsFound => TranslationOverrides.string(_root.$meta, 'tagView.noTagsFound', {}) ?? 'No tags found';

  /// en: 'Copy'
  String get copy => TranslationOverrides.string(_root.$meta, 'tagView.copy', {}) ?? 'Copy';

  /// en: 'Remove from Search'
  String get removeFromSearch => TranslationOverrides.string(_root.$meta, 'tagView.removeFromSearch', {}) ?? 'Remove from Search';

  /// en: 'Add to Search'
  String get addToSearch => TranslationOverrides.string(_root.$meta, 'tagView.addToSearch', {}) ?? 'Add to Search';

  /// en: 'Added to search bar:'
  String get addedToSearchBar => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBar', {}) ?? 'Added to search bar:';

  /// en: 'Add to Search (Exclude)'
  String get addToSearchExclude => TranslationOverrides.string(_root.$meta, 'tagView.addToSearchExclude', {}) ?? 'Add to Search (Exclude)';

  /// en: 'Added to search bar (Exclude):'
  String get addedToSearchBarExclude =>
      TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBarExclude', {}) ?? 'Added to search bar (Exclude):';

  /// en: 'Add to Marked'
  String get addToMarked => TranslationOverrides.string(_root.$meta, 'tagView.addToMarked', {}) ?? 'Add to Marked';

  /// en: 'Add to Hidden'
  String get addToHidden => TranslationOverrides.string(_root.$meta, 'tagView.addToHidden', {}) ?? 'Add to Hidden';

  /// en: 'Remove from Marked'
  String get removeFromMarked => TranslationOverrides.string(_root.$meta, 'tagView.removeFromMarked', {}) ?? 'Remove from Marked';

  /// en: 'Remove from Hidden'
  String get removeFromHidden => TranslationOverrides.string(_root.$meta, 'tagView.removeFromHidden', {}) ?? 'Remove from Hidden';

  /// en: 'Edit tag'
  String get editTag => TranslationOverrides.string(_root.$meta, 'tagView.editTag', {}) ?? 'Edit tag';

  /// en: 'Copied ${type: String} to clipboard'
  String copiedSelected({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagView.copiedSelected', {'type': type}) ?? 'Copied ${type} to clipboard';

  /// en: 'selected text'
  String get selectedText => TranslationOverrides.string(_root.$meta, 'tagView.selectedText', {}) ?? 'selected text';

  /// en: 'source'
  String get source => TranslationOverrides.string(_root.$meta, 'tagView.source', {}) ?? 'source';

  /// en: 'Source'
  String get sourceDialogTitle => TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogTitle', {}) ?? 'Source';

  /// en: 'The text in source field can't be opened as a link, either because it's not a link or there are multiple URLs in a single string.'
  String get sourceDialogText1 =>
      TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogText1', {}) ??
      'The text in source field can\'t be opened as a link, either because it\'s not a link or there are multiple URLs in a single string.';

  /// en: 'You can select any text below by long tapping it and then press «Open selected» to try opening it as a link:'
  String get sourceDialogText2 =>
      TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogText2', {}) ??
      'You can select any text below by long tapping it and then press «Open selected» to try opening it as a link:';

  /// en: '[No text selected]'
  String get noTextSelected => TranslationOverrides.string(_root.$meta, 'tagView.noTextSelected', {}) ?? '[No text selected]';

  /// en: 'Copy ${type: String}'
  String copySelected({required String type}) => TranslationOverrides.string(_root.$meta, 'tagView.copySelected', {'type': type}) ?? 'Copy ${type}';

  /// en: 'selected'
  String get selected => TranslationOverrides.string(_root.$meta, 'tagView.selected', {}) ?? 'selected';

  /// en: 'all'
  String get all => TranslationOverrides.string(_root.$meta, 'tagView.all', {}) ?? 'all';

  /// en: 'Open ${type: String}'
  String openSelected({required String type}) => TranslationOverrides.string(_root.$meta, 'tagView.openSelected', {'type': type}) ?? 'Open ${type}';

  /// en: 'Preview'
  String get preview => TranslationOverrides.string(_root.$meta, 'tagView.preview', {}) ?? 'Preview';

  /// en: 'Booru'
  String get booru => TranslationOverrides.string(_root.$meta, 'tagView.booru', {}) ?? 'Booru';

  /// en: 'Select a booru to load'
  String get selectBooruToLoad => TranslationOverrides.string(_root.$meta, 'tagView.selectBooruToLoad', {}) ?? 'Select a booru to load';

  /// en: 'Preview is loading...'
  String get previewIsLoading => TranslationOverrides.string(_root.$meta, 'tagView.previewIsLoading', {}) ?? 'Preview is loading...';

  /// en: 'Failed to load preview'
  String get failedToLoadPreview => TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreview', {}) ?? 'Failed to load preview';

  /// en: 'Tap to try again'
  String get tapToTryAgain => TranslationOverrides.string(_root.$meta, 'tagView.tapToTryAgain', {}) ?? 'Tap to try again';

  /// en: 'Copied file URL to clipboard'
  String get copiedFileURL => TranslationOverrides.string(_root.$meta, 'tagView.copiedFileURL', {}) ?? 'Copied file URL to clipboard';

  /// en: 'Tag previews'
  String get tagPreviews => TranslationOverrides.string(_root.$meta, 'tagView.tagPreviews', {}) ?? 'Tag previews';

  /// en: 'Current state'
  String get currentState => TranslationOverrides.string(_root.$meta, 'tagView.currentState', {}) ?? 'Current state';

  /// en: 'History'
  String get history => TranslationOverrides.string(_root.$meta, 'tagView.history', {}) ?? 'History';

  /// en: 'Failed to load preview page'
  String get failedToLoadPreviewPage =>
      TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreviewPage', {}) ?? 'Failed to load preview page';

  /// en: 'Try again'
  String get tryAgain => TranslationOverrides.string(_root.$meta, 'tagView.tryAgain', {}) ?? 'Try again';
}

// Path: pinnedTags
class TranslationsPinnedTagsEn {
  TranslationsPinnedTagsEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Pinned tags'
  String get pinnedTags => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedTags', {}) ?? 'Pinned tags';

  /// en: 'Pin tag'
  String get pinTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinTag', {}) ?? 'Pin tag';

  /// en: 'Unpin tag'
  String get unpinTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinTag', {}) ?? 'Unpin tag';

  /// en: 'Pin'
  String get pin => TranslationOverrides.string(_root.$meta, 'pinnedTags.pin', {}) ?? 'Pin';

  /// en: 'Unpin'
  String get unpin => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpin', {}) ?? 'Unpin';

  /// en: 'Pin «${tag: String}» to quick access?'
  String pinQuestion({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinQuestion', {'tag': tag}) ?? 'Pin «${tag}» to quick access?';

  /// en: 'Remove «${tag: String}» from pinned tags?'
  String unpinQuestion({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinQuestion', {'tag': tag}) ?? 'Remove «${tag}» from pinned tags?';

  /// en: 'Only for ${name: String}'
  String onlyForBooru({required String name}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.onlyForBooru', {'name': name}) ?? 'Only for ${name}';

  /// en: 'Labels (optional)'
  String get labelsOptional => TranslationOverrides.string(_root.$meta, 'pinnedTags.labelsOptional', {}) ?? 'Labels (optional)';

  /// en: 'Type and press Send to add'
  String get typeAndEnterToAdd => TranslationOverrides.string(_root.$meta, 'pinnedTags.typeAndEnterToAdd', {}) ?? 'Type and press Send to add';

  /// en: 'Select existing label'
  String get selectExistingLabel => TranslationOverrides.string(_root.$meta, 'pinnedTags.selectExistingLabel', {}) ?? 'Select existing label';

  /// en: 'Tag pinned'
  String get tagPinned => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagPinned', {}) ?? 'Tag pinned';

  /// en: 'Pinned for ${name: String}${labels: String}'
  String pinnedForBooru({required String name, required String labels}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedForBooru', {'name': name, 'labels': labels}) ?? 'Pinned for ${name}${labels}';

  /// en: 'Pinned globally${labels: String}'
  String pinnedGloballyWithLabels({required String labels}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedGloballyWithLabels', {'labels': labels}) ?? 'Pinned globally${labels}';

  /// en: 'Tag unpinned'
  String get tagUnpinned => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagUnpinned', {}) ?? 'Tag unpinned';

  /// en: 'All'
  String get all => TranslationOverrides.string(_root.$meta, 'pinnedTags.all', {}) ?? 'All';

  /// en: 'Reorder pinned tags'
  String get reorderPinnedTags => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorderPinnedTags', {}) ?? 'Reorder pinned tags';

  /// en: 'Saving...'
  String get saving => TranslationOverrides.string(_root.$meta, 'pinnedTags.saving', {}) ?? 'Saving...';

  /// en: 'Search pinned tags...'
  String get searchPinnedTags => TranslationOverrides.string(_root.$meta, 'pinnedTags.searchPinnedTags', {}) ?? 'Search pinned tags...';

  /// en: 'Reorder'
  String get reorder => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorder', {}) ?? 'Reorder';

  /// en: 'Add tag manually'
  String get addTagManually => TranslationOverrides.string(_root.$meta, 'pinnedTags.addTagManually', {}) ?? 'Add tag manually';

  /// en: 'No tags match your search'
  String get noTagsMatchSearch => TranslationOverrides.string(_root.$meta, 'pinnedTags.noTagsMatchSearch', {}) ?? 'No tags match your search';

  /// en: 'No pinned tags yet'
  String get noPinnedTagsYet => TranslationOverrides.string(_root.$meta, 'pinnedTags.noPinnedTagsYet', {}) ?? 'No pinned tags yet';

  /// en: 'Edit labels'
  String get editLabels => TranslationOverrides.string(_root.$meta, 'pinnedTags.editLabels', {}) ?? 'Edit labels';

  /// en: 'Labels'
  String get labels => TranslationOverrides.string(_root.$meta, 'pinnedTags.labels', {}) ?? 'Labels';

  /// en: 'Add pinned tag'
  String get addPinnedTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.addPinnedTag', {}) ?? 'Add pinned tag';

  /// en: 'Tag query'
  String get tagQuery => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQuery', {}) ?? 'Tag query';

  /// en: 'tag_name'
  String get tagQueryHint => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQueryHint', {}) ?? 'tag_name';

  /// en: 'You can enter any search query, including tags with spaces'
  String get rawQueryHelp =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.rawQueryHelp', {}) ?? 'You can enter any search query, including tags with spaces';
}

// Path: searchBar
class TranslationsSearchBarEn {
  TranslationsSearchBarEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Search for tags'
  String get searchForTags => TranslationOverrides.string(_root.$meta, 'searchBar.searchForTags', {}) ?? 'Search for tags';

  /// en: 'Couldn't load suggestions. Tap to retry${msg: String}'
  String failedToLoadSuggestions({required String msg}) =>
      TranslationOverrides.string(_root.$meta, 'searchBar.failedToLoadSuggestions', {'msg': msg}) ?? 'Couldn\'t load suggestions. Tap to retry${msg}';

  /// en: 'No suggestions found'
  String get noSuggestionsFound => TranslationOverrides.string(_root.$meta, 'searchBar.noSuggestionsFound', {}) ?? 'No suggestions found';

  /// en: 'Tag suggestions unavailable for this booru'
  String get tagSuggestionsNotAvailable =>
      TranslationOverrides.string(_root.$meta, 'searchBar.tagSuggestionsNotAvailable', {}) ?? 'Tag suggestions unavailable for this booru';

  /// en: 'Copied «${tag: String}» to clipboard'
  String copiedTagToClipboard({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'searchBar.copiedTagToClipboard', {'tag': tag}) ?? 'Copied «${tag}» to clipboard';

  /// en: 'Prefix'
  String get prefix => TranslationOverrides.string(_root.$meta, 'searchBar.prefix', {}) ?? 'Prefix';

  /// en: 'Exclude (—)'
  String get exclude => TranslationOverrides.string(_root.$meta, 'searchBar.exclude', {}) ?? 'Exclude (—)';

  /// en: 'Booru (N#)'
  String get booruNumberPrefix => TranslationOverrides.string(_root.$meta, 'searchBar.booruNumberPrefix', {}) ?? 'Booru (N#)';

  /// en: 'Metatags'
  String get metatags => TranslationOverrides.string(_root.$meta, 'searchBar.metatags', {}) ?? 'Metatags';

  /// en: 'Free metatags'
  String get freeMetatags => TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatags', {}) ?? 'Free metatags';

  /// en: 'Free metatags do not count against the tag search limits'
  String get freeMetatagsDescription =>
      TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatagsDescription', {}) ?? 'Free metatags do not count against the tag search limits';

  /// en: 'Free'
  String get free => TranslationOverrides.string(_root.$meta, 'searchBar.free', {}) ?? 'Free';

  /// en: 'Single'
  String get single => TranslationOverrides.string(_root.$meta, 'searchBar.single', {}) ?? 'Single';

  /// en: 'Range'
  String get range => TranslationOverrides.string(_root.$meta, 'searchBar.range', {}) ?? 'Range';

  /// en: 'Popular'
  String get popular => TranslationOverrides.string(_root.$meta, 'searchBar.popular', {}) ?? 'Popular';

  /// en: 'Select date'
  String get selectDate => TranslationOverrides.string(_root.$meta, 'searchBar.selectDate', {}) ?? 'Select date';

  /// en: 'Select dates range'
  String get selectDatesRange => TranslationOverrides.string(_root.$meta, 'searchBar.selectDatesRange', {}) ?? 'Select dates range';

  /// en: 'History'
  String get history => TranslationOverrides.string(_root.$meta, 'searchBar.history', {}) ?? 'History';

  /// en: '...'
  String get more => TranslationOverrides.string(_root.$meta, 'searchBar.more', {}) ?? '...';
}

// Path: mobileHome
class TranslationsMobileHomeEn {
  TranslationsMobileHomeEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Select booru for webview'
  String get selectBooruForWebview => TranslationOverrides.string(_root.$meta, 'mobileHome.selectBooruForWebview', {}) ?? 'Select booru for webview';

  /// en: 'Lock app'
  String get lockApp => TranslationOverrides.string(_root.$meta, 'mobileHome.lockApp', {}) ?? 'Lock app';

  /// en: 'File already exists'
  String get fileAlreadyExists => TranslationOverrides.string(_root.$meta, 'mobileHome.fileAlreadyExists', {}) ?? 'File already exists';

  /// en: 'Failed to download'
  String get failedToDownload => TranslationOverrides.string(_root.$meta, 'mobileHome.failedToDownload', {}) ?? 'Failed to download';

  /// en: 'Cancelled by user'
  String get cancelledByUser => TranslationOverrides.string(_root.$meta, 'mobileHome.cancelledByUser', {}) ?? 'Cancelled by user';

  /// en: 'Save anyway'
  String get saveAnyway => TranslationOverrides.string(_root.$meta, 'mobileHome.saveAnyway', {}) ?? 'Save anyway';

  /// en: 'Skip'
  String get skip => TranslationOverrides.string(_root.$meta, 'mobileHome.skip', {}) ?? 'Skip';

  /// en: 'Retry all (${count: int})'
  String retryAll({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.retryAll', {'count': count}) ?? 'Retry all (${count})';

  /// en: 'Existing, failed or cancelled items'
  String get existingFailedOrCancelledItems =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.existingFailedOrCancelledItems', {}) ?? 'Existing, failed or cancelled items';

  /// en: 'Clear all retryable items'
  String get clearAllRetryableItems =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.clearAllRetryableItems', {}) ?? 'Clear all retryable items';
}

// Path: desktopHome
class TranslationsDesktopHomeEn {
  TranslationsDesktopHomeEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Snatcher'
  String get snatcher => TranslationOverrides.string(_root.$meta, 'desktopHome.snatcher', {}) ?? 'Snatcher';

  /// en: 'Add boorus in settings'
  String get addBoorusInSettings => TranslationOverrides.string(_root.$meta, 'desktopHome.addBoorusInSettings', {}) ?? 'Add boorus in settings';

  /// en: 'Settings'
  String get settings => TranslationOverrides.string(_root.$meta, 'desktopHome.settings', {}) ?? 'Settings';

  /// en: 'Save'
  String get save => TranslationOverrides.string(_root.$meta, 'desktopHome.save', {}) ?? 'Save';

  /// en: 'No items selected'
  String get noItemsSelected => TranslationOverrides.string(_root.$meta, 'desktopHome.noItemsSelected', {}) ?? 'No items selected';
}

// Path: galleryView
class TranslationsGalleryViewEn {
  TranslationsGalleryViewEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'No items'
  String get noItems => TranslationOverrides.string(_root.$meta, 'galleryView.noItems', {}) ?? 'No items';

  /// en: 'No item selected'
  String get noItemSelected => TranslationOverrides.string(_root.$meta, 'galleryView.noItemSelected', {}) ?? 'No item selected';

  /// en: 'Close'
  String get close => TranslationOverrides.string(_root.$meta, 'galleryView.close', {}) ?? 'Close';
}

// Path: mediaPreviews
class TranslationsMediaPreviewsEn {
  TranslationsMediaPreviewsEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'No booru configs found'
  String get noBooruConfigsFound => TranslationOverrides.string(_root.$meta, 'mediaPreviews.noBooruConfigsFound', {}) ?? 'No booru configs found';

  /// en: 'Add new Booru'
  String get addNewBooru => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? 'Add new Booru';

  /// en: 'Help'
  String get help => TranslationOverrides.string(_root.$meta, 'mediaPreviews.help', {}) ?? 'Help';

  /// en: 'Settings'
  String get settings => TranslationOverrides.string(_root.$meta, 'mediaPreviews.settings', {}) ?? 'Settings';

  /// en: 'Restoring previous session...'
  String get restoringPreviousSession =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoringPreviousSession', {}) ?? 'Restoring previous session...';

  /// en: 'Copied file URL to clipboard!'
  String get copiedFileURL => TranslationOverrides.string(_root.$meta, 'mediaPreviews.copiedFileURL', {}) ?? 'Copied file URL to clipboard!';
}

// Path: viewer
class TranslationsViewerEn {
  TranslationsViewerEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsViewerTutorialEn tutorial = TranslationsViewerTutorialEn.internal(_root);
  late final TranslationsViewerAppBarEn appBar = TranslationsViewerAppBarEn.internal(_root);
  late final TranslationsViewerNotesEn notes = TranslationsViewerNotesEn.internal(_root);
}

// Path: common
class TranslationsCommonEn {
  TranslationsCommonEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Select a booru'
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'common.selectABooru', {}) ?? 'Select a booru';

  /// en: 'Booru item copied to clipboard'
  String get booruItemCopiedToClipboard =>
      TranslationOverrides.string(_root.$meta, 'common.booruItemCopiedToClipboard', {}) ?? 'Booru item copied to clipboard';
}

// Path: gallery
class TranslationsGalleryEn {
  TranslationsGalleryEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Snatch?'
  String get snatchQuestion => TranslationOverrides.string(_root.$meta, 'gallery.snatchQuestion', {}) ?? 'Snatch?';

  /// en: 'No post URL!'
  String get noPostUrl => TranslationOverrides.string(_root.$meta, 'gallery.noPostUrl', {}) ?? 'No post URL!';

  /// en: 'Loading file...'
  String get loadingFile => TranslationOverrides.string(_root.$meta, 'gallery.loadingFile', {}) ?? 'Loading file...';

  /// en: 'This can take some time, please wait...'
  String get loadingFileMessage =>
      TranslationOverrides.string(_root.$meta, 'gallery.loadingFileMessage', {}) ?? 'This can take some time, please wait...';

  /// en: '(one) {Source} (other) {Sources}'
  String sources({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'gallery.sources', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'Source',
        other: 'Sources',
      );
}

// Path: galleryButtons
class TranslationsGalleryButtonsEn {
  TranslationsGalleryButtonsEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Snatch'
  String get snatch => TranslationOverrides.string(_root.$meta, 'galleryButtons.snatch', {}) ?? 'Snatch';

  /// en: 'Favourite'
  String get favourite => TranslationOverrides.string(_root.$meta, 'galleryButtons.favourite', {}) ?? 'Favourite';

  /// en: 'Info'
  String get info => TranslationOverrides.string(_root.$meta, 'galleryButtons.info', {}) ?? 'Info';

  /// en: 'Share'
  String get share => TranslationOverrides.string(_root.$meta, 'galleryButtons.share', {}) ?? 'Share';

  /// en: 'Select'
  String get select => TranslationOverrides.string(_root.$meta, 'galleryButtons.select', {}) ?? 'Select';

  /// en: 'Open in browser'
  String get open => TranslationOverrides.string(_root.$meta, 'galleryButtons.open', {}) ?? 'Open in browser';

  /// en: 'Slideshow'
  String get slideshow => TranslationOverrides.string(_root.$meta, 'galleryButtons.slideshow', {}) ?? 'Slideshow';

  /// en: 'Toggle scaling'
  String get reloadNoScale => TranslationOverrides.string(_root.$meta, 'galleryButtons.reloadNoScale', {}) ?? 'Toggle scaling';

  /// en: 'Toggle quality'
  String get toggleQuality => TranslationOverrides.string(_root.$meta, 'galleryButtons.toggleQuality', {}) ?? 'Toggle quality';

  /// en: 'External player'
  String get externalPlayer => TranslationOverrides.string(_root.$meta, 'galleryButtons.externalPlayer', {}) ?? 'External player';

  /// en: 'Image search'
  String get imageSearch => TranslationOverrides.string(_root.$meta, 'galleryButtons.imageSearch', {}) ?? 'Image search';
}

// Path: media
class TranslationsMediaEn {
  TranslationsMediaEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsMediaLoadingEn loading = TranslationsMediaLoadingEn.internal(_root);
  late final TranslationsMediaVideoEn video = TranslationsMediaVideoEn.internal(_root);
}

// Path: imageStats
class TranslationsImageStatsEn {
  TranslationsImageStatsEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Live: ${count: int}'
  String live({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.live', {'count': count}) ?? 'Live: ${count}';

  /// en: 'Pending: ${count: int}'
  String pending({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.pending', {'count': count}) ?? 'Pending: ${count}';

  /// en: 'Total: ${count: int}'
  String total({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.total', {'count': count}) ?? 'Total: ${count}';

  /// en: 'Size: ${size: String}'
  String size({required String size}) => TranslationOverrides.string(_root.$meta, 'imageStats.size', {'size': size}) ?? 'Size: ${size}';

  /// en: 'Max: ${max: String}'
  String max({required String max}) => TranslationOverrides.string(_root.$meta, 'imageStats.max', {'max': max}) ?? 'Max: ${max}';
}

// Path: preview
class TranslationsPreviewEn {
  TranslationsPreviewEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsPreviewErrorEn error = TranslationsPreviewErrorEn.internal(_root);
}

// Path: tagType
class TranslationsTagTypeEn {
  TranslationsTagTypeEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Artist'
  String get artist => TranslationOverrides.string(_root.$meta, 'tagType.artist', {}) ?? 'Artist';

  /// en: 'Character'
  String get character => TranslationOverrides.string(_root.$meta, 'tagType.character', {}) ?? 'Character';

  /// en: 'Copyright'
  String get copyright => TranslationOverrides.string(_root.$meta, 'tagType.copyright', {}) ?? 'Copyright';

  /// en: 'Meta'
  String get meta => TranslationOverrides.string(_root.$meta, 'tagType.meta', {}) ?? 'Meta';

  /// en: 'Species'
  String get species => TranslationOverrides.string(_root.$meta, 'tagType.species', {}) ?? 'Species';

  /// en: 'None/General'
  String get none => TranslationOverrides.string(_root.$meta, 'tagType.none', {}) ?? 'None/General';
}

// Path: tabs.filters
class TranslationsTabsFiltersEn {
  TranslationsTabsFiltersEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Loaded'
  String get loaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.loaded', {}) ?? 'Loaded';

  /// en: 'Tag type'
  String get tagType => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagType', {}) ?? 'Tag type';

  /// en: 'Multibooru'
  String get multibooru => TranslationOverrides.string(_root.$meta, 'tabs.filters.multibooru', {}) ?? 'Multibooru';

  /// en: 'Duplicates'
  String get duplicates => TranslationOverrides.string(_root.$meta, 'tabs.filters.duplicates', {}) ?? 'Duplicates';

  /// en: 'Check for duplicates on same Booru'
  String get checkDuplicatesOnSameBooru =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.checkDuplicatesOnSameBooru', {}) ?? 'Check for duplicates on same Booru';

  /// en: 'Empty search query'
  String get emptySearchQuery => TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? 'Empty search query';

  /// en: 'Tab Filters'
  String get title => TranslationOverrides.string(_root.$meta, 'tabs.filters.title', {}) ?? 'Tab Filters';

  /// en: 'All'
  String get all => TranslationOverrides.string(_root.$meta, 'tabs.filters.all', {}) ?? 'All';

  /// en: 'Not loaded'
  String get notLoaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.notLoaded', {}) ?? 'Not loaded';

  /// en: 'Enabled'
  String get enabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.enabled', {}) ?? 'Enabled';

  /// en: 'Disabled'
  String get disabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.disabled', {}) ?? 'Disabled';

  /// en: 'Will also enable sorting'
  String get willAlsoEnableSorting =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.willAlsoEnableSorting', {}) ?? 'Will also enable sorting';

  /// en: 'Filter tabs which contain at least one tag of selected type'
  String get tagTypeFilterHelp =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.tagTypeFilterHelp', {}) ?? 'Filter tabs which contain at least one tag of selected type';

  /// en: 'Any'
  String get any => TranslationOverrides.string(_root.$meta, 'tabs.filters.any', {}) ?? 'Any';

  /// en: 'Apply'
  String get apply => TranslationOverrides.string(_root.$meta, 'tabs.filters.apply', {}) ?? 'Apply';
}

// Path: tabs.move
class TranslationsTabsMoveEn {
  TranslationsTabsMoveEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Move to top'
  String get moveToTop => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToTop', {}) ?? 'Move to top';

  /// en: 'Move to bottom'
  String get moveToBottom => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToBottom', {}) ?? 'Move to bottom';

  /// en: 'Tab number'
  String get tabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.tabNumber', {}) ?? 'Tab number';

  /// en: 'Invalid tab number'
  String get invalidTabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidTabNumber', {}) ?? 'Invalid tab number';

  /// en: 'Invalid input'
  String get invalidInput => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidInput', {}) ?? 'Invalid input';

  /// en: 'Out of range'
  String get outOfRange => TranslationOverrides.string(_root.$meta, 'tabs.move.outOfRange', {}) ?? 'Out of range';

  /// en: 'Please enter a valid tab number'
  String get pleaseEnterValidTabNumber =>
      TranslationOverrides.string(_root.$meta, 'tabs.move.pleaseEnterValidTabNumber', {}) ?? 'Please enter a valid tab number';

  /// en: 'Move to #${formattedNumber: String}'
  String moveTo({required String formattedNumber}) =>
      TranslationOverrides.string(_root.$meta, 'tabs.move.moveTo', {'formattedNumber': formattedNumber}) ?? 'Move to #${formattedNumber}';

  /// en: 'Preview:'
  String get preview => TranslationOverrides.string(_root.$meta, 'tabs.move.preview', {}) ?? 'Preview:';
}

// Path: webview.navigation
class TranslationsWebviewNavigationEn {
  TranslationsWebviewNavigationEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Enter a URL'
  String get enterUrlLabel => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterUrlLabel', {}) ?? 'Enter a URL';

  /// en: 'Enter custom URL'
  String get enterCustomUrl => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterCustomUrl', {}) ?? 'Enter custom URL';

  /// en: 'Navigate to ${url: String}'
  String navigateTo({required String url}) =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.navigateTo', {'url': url}) ?? 'Navigate to ${url}';

  /// en: 'List cookies'
  String get listCookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.listCookies', {}) ?? 'List cookies';

  /// en: 'Clear cookies'
  String get clearCookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.clearCookies', {}) ?? 'Clear cookies';

  /// en: 'There were cookies. Now, they are gone'
  String get cookiesGone =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.cookiesGone', {}) ?? 'There were cookies. Now, they are gone';

  /// en: 'Get favicon'
  String get getFavicon => TranslationOverrides.string(_root.$meta, 'webview.navigation.getFavicon', {}) ?? 'Get favicon';

  /// en: 'No favicon found'
  String get noFaviconFound => TranslationOverrides.string(_root.$meta, 'webview.navigation.noFaviconFound', {}) ?? 'No favicon found';

  /// en: 'Host:'
  String get host => TranslationOverrides.string(_root.$meta, 'webview.navigation.host', {}) ?? 'Host:';

  /// en: '(text above is selectable)'
  String get textAboveSelectable =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.textAboveSelectable', {}) ?? '(text above is selectable)';

  /// en: 'Field to merge texts:'
  String get fieldToMergeTexts => TranslationOverrides.string(_root.$meta, 'webview.navigation.fieldToMergeTexts', {}) ?? 'Field to merge texts:';

  /// en: 'Copy URL'
  String get copyUrl => TranslationOverrides.string(_root.$meta, 'webview.navigation.copyUrl', {}) ?? 'Copy URL';

  /// en: 'Copied URL to clipboard'
  String get copiedUrlToClipboard =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.copiedUrlToClipboard', {}) ?? 'Copied URL to clipboard';

  /// en: 'Cookies'
  String get cookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookies', {}) ?? 'Cookies';

  /// en: 'Favicon'
  String get favicon => TranslationOverrides.string(_root.$meta, 'webview.navigation.favicon', {}) ?? 'Favicon';

  /// en: 'History'
  String get history => TranslationOverrides.string(_root.$meta, 'webview.navigation.history', {}) ?? 'History';

  /// en: 'No back history item'
  String get noBackHistoryItem => TranslationOverrides.string(_root.$meta, 'webview.navigation.noBackHistoryItem', {}) ?? 'No back history item';

  /// en: 'No forward history item'
  String get noForwardHistoryItem =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.noForwardHistoryItem', {}) ?? 'No forward history item';
}

// Path: settings.language
class TranslationsSettingsLanguageEn {
  TranslationsSettingsLanguageEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Language'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? 'Language';

  /// en: 'System'
  String get system => TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? 'System';

  /// en: 'Help us translate'
  String get helpUsTranslate => TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? 'Help us translate';

  /// en: 'Visit <a href='https://github.com/NO-ob/LoliSnatcher_Droid/wiki/Localization'>github</a> for details or tap on the image below to go to Weblate'
  String get visitForDetails =>
      TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ??
      'Visit <a href=\'https://github.com/NO-ob/LoliSnatcher_Droid/wiki/Localization\'>github</a> for details or tap on the image below to go to Weblate';
}

// Path: settings.booru
class TranslationsSettingsBooruEn {
  TranslationsSettingsBooruEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Boorus & Search'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Boorus & Search';

  /// en: 'Booru'
  String get dropdown => TranslationOverrides.string(_root.$meta, 'settings.booru.dropdown', {}) ?? 'Booru';

  /// en: 'Default tags'
  String get defaultTags => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? 'Default tags';

  /// en: 'Items fetched per page'
  String get itemsPerPage => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'Items fetched per page';

  /// en: 'Some boorus may ignore this'
  String get itemsPerPageTip => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'Some boorus may ignore this';

  /// en: '10-100'
  String get itemsPerPagePlaceholder => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPagePlaceholder', {}) ?? '10-100';

  /// en: 'Add Booru config'
  String get addBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Add Booru config';

  /// en: 'Share Booru config'
  String get shareBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? 'Share Booru config';

  /// en: 'Share ${booruName: String} config as a link. Include login/API key?'
  String shareBooruDialogMsgMobile({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
      'Share ${booruName} config as a link.\n\nInclude login/API key?';

  /// en: 'Copy ${booruName: String} config link to clipboard. Include login/API key?'
  String shareBooruDialogMsgDesktop({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
      'Copy ${booruName} config link to clipboard.\n\nInclude login/API key?';

  /// en: 'Booru sharing'
  String get booruSharing => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? 'Booru sharing';

  /// en: 'How to automatically open Booru config links in the app on Android 12 and higher: 1) Tap button below to open system app link defaults settings 2) Tap on «Add link» and select all available options'
  String get booruSharingMsgAndroid =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ??
      'How to automatically open Booru config links in the app on Android 12 and higher:\n1) Tap button below to open system app link defaults settings\n2) Tap on «Add link» and select all available options';

  /// en: 'Added Boorus'
  String get addedBoorus => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? 'Added Boorus';

  /// en: 'Edit Booru config'
  String get editBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? 'Edit Booru config';

  /// en: 'Import Booru config from clipboard'
  String get importBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? 'Import Booru config from clipboard';

  /// en: 'Only loli.snatcher URLs are supported!'
  String get onlyLSURLsSupported =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ?? 'Only loli.snatcher URLs are supported!';

  /// en: 'Delete Booru config'
  String get deleteBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? 'Delete Booru config';

  /// en: 'Something went wrong during deletion of a Booru config!'
  String get deleteBooruError =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ?? 'Something went wrong during deletion of a Booru config!';

  /// en: 'Booru config deleted'
  String get booruDeleted => TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? 'Booru config deleted';

  /// en: 'Selected booru becomes default after saving. Default booru appears first in dropdowns'
  String get booruDropdownInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ??
      'Selected booru becomes default after saving.\n\nDefault booru appears first in dropdowns';

  /// en: 'Change default Booru?'
  String get changeDefaultBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? 'Change default Booru?';

  /// en: 'Change to: '
  String get changeTo => TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? 'Change to: ';

  /// en: 'Tap [No] to keep current: '
  String get keepCurrentBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? 'Tap [No] to keep current: ';

  /// en: 'Tap [Yes] to change to: '
  String get changeToNewBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? 'Tap [Yes] to change to: ';

  /// en: 'Booru config link copied to clipboard'
  String get booruConfigLinkCopied =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ?? 'Booru config link copied to clipboard';

  /// en: 'No Booru selected!'
  String get noBooruSelected => TranslationOverrides.string(_root.$meta, 'settings.booru.noBooruSelected', {}) ?? 'No Booru selected!';

  /// en: 'Can't delete this Booru!'
  String get cantDeleteThisBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? 'Can\'t delete this Booru!';

  /// en: 'Remove related tabs first'
  String get removeRelatedTabsFirst =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.removeRelatedTabsFirst', {}) ?? 'Remove related tabs first';
}

// Path: settings.booruEditor
class TranslationsSettingsBooruEditorEn {
  TranslationsSettingsBooruEditorEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Booru Editor'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? 'Booru Editor';

  /// en: 'Booru test failed'
  String get testBooruFailedTitle => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'Booru test failed';

  /// en: 'Config parameters may be incorrect, booru doesn't allow api access, request didn't return any data or there was a network error.'
  String get testBooruFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ??
      'Config parameters may be incorrect, booru doesn\'t allow api access, request didn\'t return any data or there was a network error.';

  /// en: 'Save Booru'
  String get saveBooru => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Save Booru';

  /// en: 'Running test...'
  String get runningTest => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? 'Running test...';

  /// en: 'This Booru config already exists'
  String get booruConfigExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? 'This Booru config already exists';

  /// en: 'Booru config with same name already exists'
  String get booruSameNameExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ?? 'Booru config with same name already exists';

  /// en: 'Booru config with same URL already exists'
  String get booruSameUrlExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ?? 'Booru config with same URL already exists';

  /// en: 'This booru config won't be added'
  String get thisBooruConfigWontBeAdded =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ?? 'This booru config won\'t be added';

  /// en: 'Booru config saved'
  String get booruConfigSaved => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? 'Booru config saved';

  /// en: 'Existing tabs with this Booru need to be reloaded in order to apply changes!'
  String get existingTabsNeedReload =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ??
      'Existing tabs with this Booru need to be reloaded in order to apply changes!';

  /// en: 'Failed to verify api access for Hydrus'
  String get failedVerifyApiHydrus =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ?? 'Failed to verify api access for Hydrus';

  /// en: 'Access key requested'
  String get accessKeyRequestedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? 'Access key requested';

  /// en: 'Tap okay on Hydrus then apply. You can tap 'Test Booru' afterwards'
  String get accessKeyRequestedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ??
      'Tap okay on Hydrus then apply. You can tap \'Test Booru\' afterwards';

  /// en: 'Failed to get access key'
  String get accessKeyFailedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? 'Failed to get access key';

  /// en: 'Do you have the request window open in Hydrus?'
  String get accessKeyFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ?? 'Do you have the request window open in Hydrus?';

  /// en: 'To get the Hydrus key you need to open the request dialog in the Hydrus client. Services > Review services > Client api > Add > From API request'
  String get hydrusInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ??
      'To get the Hydrus key you need to open the request dialog in the Hydrus client. Services > Review services > Client api > Add > From API request';

  /// en: 'Get Hydrus API key'
  String get getHydrusApiKey => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? 'Get Hydrus API key';

  /// en: 'Booru Name'
  String get booruName => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? 'Booru Name';

  /// en: 'Booru Name is required!'
  String get booruNameRequired => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? 'Booru Name is required!';

  /// en: 'Booru URL'
  String get booruUrl => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? 'Booru URL';

  /// en: 'Booru URL is required!'
  String get booruUrlRequired => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? 'Booru URL is required!';

  /// en: 'Booru Type'
  String get booruType => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruType', {}) ?? 'Booru Type';

  /// en: 'Booru Type is ${booruType: String}'
  String booruTypeIs({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruTypeIs', {'booruType': booruType}) ?? 'Booru Type is ${booruType}';

  /// en: 'Favicon URL'
  String get booruFavicon => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? 'Favicon URL';

  /// en: '(Autofills if blank)'
  String get booruFaviconPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '(Autofills if blank)';

  /// en: '${userIdTitle: String} and ${apiKeyTitle: String} may be needed with some boorus but in most cases aren't necessary.'
  String booruApiCredsInfo({required String userIdTitle, required String apiKeyTitle}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruApiCredsInfo', {'userIdTitle': userIdTitle, 'apiKeyTitle': apiKeyTitle}) ??
      '${userIdTitle} and ${apiKeyTitle} may be needed with some boorus but in most cases aren\'t necessary.';

  /// en: 'Default tags'
  String get booruDefTags => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? 'Default tags';

  /// en: 'Default search for booru'
  String get booruDefTagsPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTagsPlaceholder', {}) ?? 'Default search for booru';

  /// en: 'Fields below may be required for some boorus'
  String get booruDefaultInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefaultInstructions', {}) ?? 'Fields below may be required for some boorus';

  /// en: 'Confirm saving this booru config'
  String get booruConfigShouldSave =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigShouldSave', {}) ?? 'Confirm saving this booru config';

  /// en: 'Selected/Detected booru type: ${booruType: String}'
  String booruConfigSelectedType({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSelectedType', {'booruType': booruType}) ??
      'Selected/Detected booru type: ${booruType}';
}

// Path: settings.interface
class TranslationsSettingsInterfaceEn {
  TranslationsSettingsInterfaceEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Interface'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? 'Interface';

  /// en: 'App UI mode'
  String get appUIMode => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIMode', {}) ?? 'App UI mode';

  /// en: 'App UI mode'
  String get appUIModeWarningTitle => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarningTitle', {}) ?? 'App UI mode';

  /// en: 'Use Desktop mode? May cause issues on mobile. DEPRECATED.'
  String get appUIModeWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarning', {}) ??
      'Use Desktop mode? May cause issues on mobile. DEPRECATED.';

  /// en: '- Mobile - Normal Mobile UI'
  String get appUIModeHelpMobile =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpMobile', {}) ?? '- Mobile - Normal Mobile UI';

  /// en: '- Desktop - Ahoviewer Style UI [DEPRECATED, NEEDS REWORK]'
  String get appUIModeHelpDesktop =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpDesktop', {}) ??
      '- Desktop - Ahoviewer Style UI [DEPRECATED, NEEDS REWORK]';

  /// en: '[Warning]: Do not set UI Mode to Desktop on a phone you might break the app and might have to wipe your settings including booru configs.'
  String get appUIModeHelpWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpWarning', {}) ??
      '[Warning]: Do not set UI Mode to Desktop on a phone you might break the app and might have to wipe your settings including booru configs.';

  /// en: 'Hand side'
  String get handSide => TranslationOverrides.string(_root.$meta, 'settings.interface.handSide', {}) ?? 'Hand side';

  /// en: 'Adjusts UI element positions to selected side'
  String get handSideHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.handSideHelp', {}) ?? 'Adjusts UI element positions to selected side';

  /// en: 'Show search bar in preview grid'
  String get showSearchBarInPreviewGrid =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.showSearchBarInPreviewGrid', {}) ?? 'Show search bar in preview grid';

  /// en: 'Move input to top in search view'
  String get moveInputToTopInSearchView =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.moveInputToTopInSearchView', {}) ?? 'Move input to top in search view';

  /// en: 'Search view quick actions panel'
  String get searchViewQuickActionsPanel =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewQuickActionsPanel', {}) ?? 'Search view quick actions panel';

  /// en: 'Search view input autofocus'
  String get searchViewInputAutofocus =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewInputAutofocus', {}) ?? 'Search view input autofocus';

  /// en: 'Disable vibration'
  String get disableVibration => TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibration', {}) ?? 'Disable vibration';

  /// en: 'May still happen on some actions even when disabled'
  String get disableVibrationSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibrationSubtitle', {}) ??
      'May still happen on some actions even when disabled';

  /// en: 'Predictive back gesture'
  String get usePredictiveBack => TranslationOverrides.string(_root.$meta, 'settings.interface.usePredictiveBack', {}) ?? 'Predictive back gesture';

  /// en: 'Preview columns (portrait)'
  String get previewColumnsPortrait =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsPortrait', {}) ?? 'Preview columns (portrait)';

  /// en: 'Preview columns (landscape)'
  String get previewColumnsLandscape =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsLandscape', {}) ?? 'Preview columns (landscape)';

  /// en: 'Preview quality'
  String get previewQuality => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQuality', {}) ?? 'Preview quality';

  /// en: 'Changes preview grid image resolution'
  String get previewQualityHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelp', {}) ?? 'Changes preview grid image resolution';

  /// en: ' - Sample - Medium resolution, app will also load a Thumbnail quality as a placeholder while higher quality loads'
  String get previewQualityHelpSample =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpSample', {}) ??
      ' - Sample - Medium resolution, app will also load a Thumbnail quality as a placeholder while higher quality loads';

  /// en: ' - Thumbnail - Low resolution'
  String get previewQualityHelpThumbnail =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpThumbnail', {}) ?? ' - Thumbnail - Low resolution';

  /// en: '[Note]: Sample quality can noticeably degrade performance, especially if you have too many columns in preview grid'
  String get previewQualityHelpNote =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpNote', {}) ??
      '[Note]: Sample quality can noticeably degrade performance, especially if you have too many columns in preview grid';

  /// en: 'Preview display'
  String get previewDisplay => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplay', {}) ?? 'Preview display';

  /// en: 'Preview display fallback'
  String get previewDisplayFallback =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallback', {}) ?? 'Preview display fallback';

  /// en: 'This will be used when Staggered option is not possible'
  String get previewDisplayFallbackHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallbackHelp', {}) ??
      'This will be used when Staggered option is not possible';

  /// en: 'Don't scale images'
  String get dontScaleImages => TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImages', {}) ?? 'Don\'t scale images';

  /// en: 'May reduce performance'
  String get dontScaleImagesSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesSubtitle', {}) ?? 'May reduce performance';

  /// en: 'Warning'
  String get dontScaleImagesWarningTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningTitle', {}) ?? 'Warning';

  /// en: 'Are you sure you want to disable image scaling?'
  String get dontScaleImagesWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarning', {}) ?? 'Are you sure you want to disable image scaling?';

  /// en: 'This can negatively impact the performance, especially on older devices'
  String get dontScaleImagesWarningMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningMsg', {}) ??
      'This can negatively impact the performance, especially on older devices';

  /// en: 'GIF thumbnails'
  String get gifThumbnails => TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnails', {}) ?? 'GIF thumbnails';

  /// en: 'Requires «Don't scale images»'
  String get gifThumbnailsRequires =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnailsRequires', {}) ?? 'Requires «Don\'t scale images»';

  /// en: 'Scroll previews buttons position'
  String get scrollPreviewsButtonsPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.scrollPreviewsButtonsPosition', {}) ?? 'Scroll previews buttons position';

  /// en: 'Mouse wheel scroll modifier'
  String get mouseWheelScrollModifier =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.mouseWheelScrollModifier', {}) ?? 'Mouse wheel scroll modifier';

  /// en: 'Scroll modifier'
  String get scrollModifier => TranslationOverrides.string(_root.$meta, 'settings.interface.scrollModifier', {}) ?? 'Scroll modifier';

  late final TranslationsSettingsInterfacePreviewQualityValuesEn previewQualityValues = TranslationsSettingsInterfacePreviewQualityValuesEn.internal(
    _root,
  );
  late final TranslationsSettingsInterfacePreviewDisplayModeValuesEn previewDisplayModeValues =
      TranslationsSettingsInterfacePreviewDisplayModeValuesEn.internal(_root);
  late final TranslationsSettingsInterfaceAppModeValuesEn appModeValues = TranslationsSettingsInterfaceAppModeValuesEn.internal(_root);
  late final TranslationsSettingsInterfaceHandSideValuesEn handSideValues = TranslationsSettingsInterfaceHandSideValuesEn.internal(_root);
}

// Path: settings.theme
class TranslationsSettingsThemeEn {
  TranslationsSettingsThemeEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Themes'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? 'Themes';

  /// en: 'Theme mode'
  String get themeMode => TranslationOverrides.string(_root.$meta, 'settings.theme.themeMode', {}) ?? 'Theme mode';

  /// en: 'Black background'
  String get blackBg => TranslationOverrides.string(_root.$meta, 'settings.theme.blackBg', {}) ?? 'Black background';

  /// en: 'Use dynamic color'
  String get useDynamicColor => TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? 'Use dynamic color';

  /// en: 'Android 12+ only'
  String get android12PlusOnly => TranslationOverrides.string(_root.$meta, 'settings.theme.android12PlusOnly', {}) ?? 'Android 12+ only';

  /// en: 'Theme'
  String get theme => TranslationOverrides.string(_root.$meta, 'settings.theme.theme', {}) ?? 'Theme';

  /// en: 'Primary color'
  String get primaryColor => TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? 'Primary color';

  /// en: 'Secondary color'
  String get secondaryColor => TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? 'Secondary color';

  /// en: 'Enable drawer mascot'
  String get enableDrawerMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.enableDrawerMascot', {}) ?? 'Enable drawer mascot';

  /// en: 'Set custom mascot'
  String get setCustomMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.setCustomMascot', {}) ?? 'Set custom mascot';

  /// en: 'Remove custom mascot'
  String get removeCustomMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? 'Remove custom mascot';

  /// en: 'Current mascot path'
  String get currentMascotPath => TranslationOverrides.string(_root.$meta, 'settings.theme.currentMascotPath', {}) ?? 'Current mascot path';

  /// en: 'System'
  String get system => TranslationOverrides.string(_root.$meta, 'settings.theme.system', {}) ?? 'System';

  /// en: 'Light'
  String get light => TranslationOverrides.string(_root.$meta, 'settings.theme.light', {}) ?? 'Light';

  /// en: 'Dark'
  String get dark => TranslationOverrides.string(_root.$meta, 'settings.theme.dark', {}) ?? 'Dark';

  /// en: 'Pink'
  String get pink => TranslationOverrides.string(_root.$meta, 'settings.theme.pink', {}) ?? 'Pink';

  /// en: 'Purple'
  String get purple => TranslationOverrides.string(_root.$meta, 'settings.theme.purple', {}) ?? 'Purple';

  /// en: 'Blue'
  String get blue => TranslationOverrides.string(_root.$meta, 'settings.theme.blue', {}) ?? 'Blue';

  /// en: 'Teal'
  String get teal => TranslationOverrides.string(_root.$meta, 'settings.theme.teal', {}) ?? 'Teal';

  /// en: 'Red'
  String get red => TranslationOverrides.string(_root.$meta, 'settings.theme.red', {}) ?? 'Red';

  /// en: 'Green'
  String get green => TranslationOverrides.string(_root.$meta, 'settings.theme.green', {}) ?? 'Green';

  /// en: 'Halloween'
  String get halloween => TranslationOverrides.string(_root.$meta, 'settings.theme.halloween', {}) ?? 'Halloween';

  /// en: 'Custom'
  String get custom => TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? 'Custom';

  /// en: 'Select color'
  String get selectColor => TranslationOverrides.string(_root.$meta, 'settings.theme.selectColor', {}) ?? 'Select color';

  /// en: 'Selected color'
  String get selectedColor => TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColor', {}) ?? 'Selected color';

  /// en: 'Selected color and its shades'
  String get selectedColorAndShades =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColorAndShades', {}) ?? 'Selected color and its shades';

  /// en: 'Font'
  String get fontFamily => TranslationOverrides.string(_root.$meta, 'settings.theme.fontFamily', {}) ?? 'Font';

  /// en: 'System default'
  String get systemDefault => TranslationOverrides.string(_root.$meta, 'settings.theme.systemDefault', {}) ?? 'System default';

  /// en: 'View more fonts'
  String get viewMoreFonts => TranslationOverrides.string(_root.$meta, 'settings.theme.viewMoreFonts', {}) ?? 'View more fonts';

  /// en: 'The quick brown fox jumps over the lazy dog'
  String get fontPreviewText =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.fontPreviewText', {}) ?? 'The quick brown fox jumps over the lazy dog';

  /// en: 'Custom font'
  String get customFont => TranslationOverrides.string(_root.$meta, 'settings.theme.customFont', {}) ?? 'Custom font';

  /// en: 'Enter any Google Font name'
  String get customFontSubtitle => TranslationOverrides.string(_root.$meta, 'settings.theme.customFontSubtitle', {}) ?? 'Enter any Google Font name';

  /// en: 'Font name'
  String get fontName => TranslationOverrides.string(_root.$meta, 'settings.theme.fontName', {}) ?? 'Font name';

  /// en: 'Browse fonts at fonts.google.com'
  String get customFontHint => TranslationOverrides.string(_root.$meta, 'settings.theme.customFontHint', {}) ?? 'Browse fonts at fonts.google.com';

  /// en: 'Font not found'
  String get fontNotFound => TranslationOverrides.string(_root.$meta, 'settings.theme.fontNotFound', {}) ?? 'Font not found';
}

// Path: settings.viewer
class TranslationsSettingsViewerEn {
  TranslationsSettingsViewerEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Viewer'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? 'Viewer';

  /// en: 'Preload amount'
  String get preloadAmount => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadAmount', {}) ?? 'Preload amount';

  /// en: 'Preload size limit'
  String get preloadSizeLimit => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimit', {}) ?? 'Preload size limit';

  /// en: 'in GB, 0 for no limit'
  String get preloadSizeLimitSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimitSubtitle', {}) ?? 'in GB, 0 for no limit';

  /// en: 'Preload height limit'
  String get preloadHeightLimit => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimit', {}) ?? 'Preload height limit';

  /// en: 'in pixels, 0 for no limit'
  String get preloadHeightLimitSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimitSubtitle', {}) ?? 'in pixels, 0 for no limit';

  /// en: 'Image quality'
  String get imageQuality => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQuality', {}) ?? 'Image quality';

  /// en: 'Viewer scroll direction'
  String get viewerScrollDirection =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerScrollDirection', {}) ?? 'Viewer scroll direction';

  /// en: 'Viewer toolbar position'
  String get viewerToolbarPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerToolbarPosition', {}) ?? 'Viewer toolbar position';

  /// en: 'Zoom button position'
  String get zoomButtonPosition => TranslationOverrides.string(_root.$meta, 'settings.viewer.zoomButtonPosition', {}) ?? 'Zoom button position';

  /// en: 'Change page buttons position'
  String get changePageButtonsPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.changePageButtonsPosition', {}) ?? 'Change page buttons position';

  /// en: 'Hide toolbar when opening viewer'
  String get hideToolbarWhenOpeningViewer =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.hideToolbarWhenOpeningViewer', {}) ?? 'Hide toolbar when opening viewer';

  /// en: 'Expand details by default'
  String get expandDetailsByDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.expandDetailsByDefault', {}) ?? 'Expand details by default';

  /// en: 'Hide translation notes by default'
  String get hideTranslationNotesByDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.hideTranslationNotesByDefault', {}) ?? 'Hide translation notes by default';

  /// en: 'Enable rotation'
  String get enableRotation => TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotation', {}) ?? 'Enable rotation';

  /// en: 'Double tap to reset'
  String get enableRotationSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotationSubtitle', {}) ?? 'Double tap to reset';

  /// en: 'Toolbar buttons order'
  String get toolbarButtonsOrder => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarButtonsOrder', {}) ?? 'Toolbar buttons order';

  /// en: 'Buttons order'
  String get buttonsOrder => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonsOrder', {}) ?? 'Buttons order';

  /// en: 'Long press to change item order.'
  String get longPressToChangeItemOrder =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToChangeItemOrder', {}) ?? 'Long press to change item order.';

  /// en: 'At least 4 buttons from this list will be always visible on Toolbar.'
  String get atLeast4ButtonsVisibleOnToolbar =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.atLeast4ButtonsVisibleOnToolbar', {}) ??
      'At least 4 buttons from this list will be always visible on Toolbar.';

  /// en: 'Other buttons will go into overflow (three dots) menu.'
  String get otherButtonsWillGoIntoOverflow =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.otherButtonsWillGoIntoOverflow', {}) ??
      'Other buttons will go into overflow (three dots) menu.';

  /// en: 'Long press to move items'
  String get longPressToMoveItems =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToMoveItems', {}) ?? 'Long press to move items';

  /// en: 'Only for videos'
  String get onlyForVideos => TranslationOverrides.string(_root.$meta, 'settings.viewer.onlyForVideos', {}) ?? 'Only for videos';

  /// en: 'This button cannot be disabled'
  String get thisButtonCannotBeDisabled =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.thisButtonCannotBeDisabled', {}) ?? 'This button cannot be disabled';

  /// en: 'Default share action'
  String get defaultShareAction => TranslationOverrides.string(_root.$meta, 'settings.viewer.defaultShareAction', {}) ?? 'Default share action';

  /// en: 'Share actions'
  String get shareActions => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActions', {}) ?? 'Share actions';

  /// en: '- Ask - always ask what to share'
  String get shareActionsAsk => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsAsk', {}) ?? '- Ask - always ask what to share';

  /// en: '- Post URL'
  String get shareActionsPostURL => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURL', {}) ?? '- Post URL';

  /// en: '- File URL - shares direct link to the original file (may not work with some sites)'
  String get shareActionsFileURL =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFileURL', {}) ??
      '- File URL - shares direct link to the original file (may not work with some sites)';

  /// en: '- Post URL/File URL/File with tags - shares url/file and tags which you select'
  String get shareActionsPostURLFileURLFileWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURLFileURLFileWithTags', {}) ??
      '- Post URL/File URL/File with tags - shares url/file and tags which you select';

  /// en: '- File - shares the file itself, may take some time to load, progress will be shown on the Share button'
  String get shareActionsFile =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFile', {}) ??
      '- File - shares the file itself, may take some time to load, progress will be shown on the Share button';

  /// en: '- Hydrus - sends the post url to Hydrus for import'
  String get shareActionsHydrus =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsHydrus', {}) ?? '- Hydrus - sends the post url to Hydrus for import';

  /// en: '[Note]: If File is saved in cache, it will be loaded from there. Otherwise it will be loaded again from network.'
  String get shareActionsNoteIfFileSavedInCache =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsNoteIfFileSavedInCache', {}) ??
      '[Note]: If File is saved in cache, it will be loaded from there. Otherwise it will be loaded again from network.';

  /// en: '[Tip]: You can open Share actions menu by long pressing Share button.'
  String get shareActionsTip =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsTip', {}) ??
      '[Tip]: You can open Share actions menu by long pressing Share button.';

  /// en: 'Use volume buttons for scrolling'
  String get useVolumeButtonsForScrolling =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.useVolumeButtonsForScrolling', {}) ?? 'Use volume buttons for scrolling';

  /// en: 'Volume buttons scrolling'
  String get volumeButtonsScrolling =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrolling', {}) ?? 'Volume buttons scrolling';

  /// en: 'Use volume buttons to scroll through previews and viewer'
  String get volumeButtonsScrollingHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollingHelp', {}) ??
      'Use volume buttons to scroll through previews and viewer';

  /// en: ' - Volume Down - next item'
  String get volumeButtonsVolumeDown =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeDown', {}) ?? ' - Volume Down - next item';

  /// en: ' - Volume Up - previous item'
  String get volumeButtonsVolumeUp =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeUp', {}) ?? ' - Volume Up - previous item';

  /// en: 'In viewer:'
  String get volumeButtonsInViewer => TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsInViewer', {}) ?? 'In viewer:';

  /// en: ' - Toolbar visible - controls volume'
  String get volumeButtonsToolbarVisible =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarVisible', {}) ?? ' - Toolbar visible - controls volume';

  /// en: ' - Toolbar hidden - controls scrolling'
  String get volumeButtonsToolbarHidden =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarHidden', {}) ?? ' - Toolbar hidden - controls scrolling';

  /// en: 'Volume buttons scroll speed'
  String get volumeButtonsScrollSpeed =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollSpeed', {}) ?? 'Volume buttons scroll speed';

  /// en: 'Slideshow duration (in ms)'
  String get slideshowDurationInMs =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowDurationInMs', {}) ?? 'Slideshow duration (in ms)';

  /// en: 'Slideshow'
  String get slideshow => TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshow', {}) ?? 'Slideshow';

  /// en: '[WIP] Videos/GIFs: manual scroll only'
  String get slideshowWIPNote =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowWIPNote', {}) ?? '[WIP] Videos/GIFs: manual scroll only';

  /// en: 'Prevent device from sleeping'
  String get preventDeviceFromSleeping =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preventDeviceFromSleeping', {}) ?? 'Prevent device from sleeping';

  /// en: 'Viewer open/close animation'
  String get viewerOpenCloseAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerOpenCloseAnimation', {}) ?? 'Viewer open/close animation';

  /// en: 'Viewer page change animation'
  String get viewerPageChangeAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerPageChangeAnimation', {}) ?? 'Viewer page change animation';

  /// en: 'Using default animation'
  String get usingDefaultAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.usingDefaultAnimation', {}) ?? 'Using default animation';

  /// en: 'Using custom animation'
  String get usingCustomAnimation => TranslationOverrides.string(_root.$meta, 'settings.viewer.usingCustomAnimation', {}) ?? 'Using custom animation';

  /// en: 'Kanna loading Gif'
  String get kannaLoadingGif => TranslationOverrides.string(_root.$meta, 'settings.viewer.kannaLoadingGif', {}) ?? 'Kanna loading Gif';

  late final TranslationsSettingsViewerImageQualityValuesEn imageQualityValues = TranslationsSettingsViewerImageQualityValuesEn.internal(_root);
  late final TranslationsSettingsViewerScrollDirectionValuesEn scrollDirectionValues = TranslationsSettingsViewerScrollDirectionValuesEn.internal(
    _root,
  );
  late final TranslationsSettingsViewerToolbarPositionValuesEn toolbarPositionValues = TranslationsSettingsViewerToolbarPositionValuesEn.internal(
    _root,
  );
  late final TranslationsSettingsViewerButtonPositionValuesEn buttonPositionValues = TranslationsSettingsViewerButtonPositionValuesEn.internal(_root);
  late final TranslationsSettingsViewerShareActionValuesEn shareActionValues = TranslationsSettingsViewerShareActionValuesEn.internal(_root);
}

// Path: settings.video
class TranslationsSettingsVideoEn {
  TranslationsSettingsVideoEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Video'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? 'Video';

  /// en: 'Disable videos'
  String get disableVideos => TranslationOverrides.string(_root.$meta, 'settings.video.disableVideos', {}) ?? 'Disable videos';

  /// en: 'Useful on low end devices that crash when trying to load videos. Gives options to view video in external player or browser instead.'
  String get disableVideosHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.disableVideosHelp', {}) ??
      'Useful on low end devices that crash when trying to load videos. Gives options to view video in external player or browser instead.';

  /// en: 'Autoplay videos'
  String get autoplayVideos => TranslationOverrides.string(_root.$meta, 'settings.video.autoplayVideos', {}) ?? 'Autoplay videos';

  /// en: 'Start videos muted'
  String get startVideosMuted => TranslationOverrides.string(_root.$meta, 'settings.video.startVideosMuted', {}) ?? 'Start videos muted';

  /// en: '[Experimental]'
  String get experimental => TranslationOverrides.string(_root.$meta, 'settings.video.experimental', {}) ?? '[Experimental]';

  /// en: 'Long tap to fast forward video'
  String get longTapToFastForwardVideo =>
      TranslationOverrides.string(_root.$meta, 'settings.video.longTapToFastForwardVideo', {}) ?? 'Long tap to fast forward video';

  /// en: 'When this is enabled toolbar can be hidden with the tap when video controls are visible. [Experimental] May become default behavior in the future.'
  String get longTapToFastForwardVideoHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.longTapToFastForwardVideoHelp', {}) ??
      'When this is enabled toolbar can be hidden with the tap when video controls are visible. [Experimental] May become default behavior in the future.';

  /// en: 'Video player backend'
  String get videoPlayerBackend => TranslationOverrides.string(_root.$meta, 'settings.video.videoPlayerBackend', {}) ?? 'Video player backend';

  /// en: 'Default'
  String get backendDefault => TranslationOverrides.string(_root.$meta, 'settings.video.backendDefault', {}) ?? 'Default';

  /// en: 'MPV'
  String get backendMPV => TranslationOverrides.string(_root.$meta, 'settings.video.backendMPV', {}) ?? 'MPV';

  /// en: 'MDK'
  String get backendMDK => TranslationOverrides.string(_root.$meta, 'settings.video.backendMDK', {}) ?? 'MDK';

  /// en: 'Based on exoplayer. Has best device compatibility, may have issues with 4K videos, some codecs or older devices'
  String get backendDefaultHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendDefaultHelp', {}) ??
      'Based on exoplayer. Has best device compatibility, may have issues with 4K videos, some codecs or older devices';

  /// en: 'Based on libmpv, has advanced settings which may help fix problems with some codecs/devices [MAY CAUSE CRASHES]'
  String get backendMPVHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendMPVHelp', {}) ??
      'Based on libmpv, has advanced settings which may help fix problems with some codecs/devices\n[MAY CAUSE CRASHES]';

  /// en: 'Based on libmdk, may have better performance for some codecs/devices [MAY CAUSE CRASHES]'
  String get backendMDKHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendMDKHelp', {}) ??
      'Based on libmdk, may have better performance for some codecs/devices\n[MAY CAUSE CRASHES]';

  /// en: 'Try different values of 'MPV' settings below if videos don't work correctly or give codec errors:'
  String get mpvSettingsHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.mpvSettingsHelp', {}) ??
      'Try different values of \'MPV\' settings below if videos don\'t work correctly or give codec errors:';

  /// en: 'MPV: use hardware acceleration'
  String get mpvUseHardwareAcceleration =>
      TranslationOverrides.string(_root.$meta, 'settings.video.mpvUseHardwareAcceleration', {}) ?? 'MPV: use hardware acceleration';

  /// en: 'MPV: VO'
  String get mpvVO => TranslationOverrides.string(_root.$meta, 'settings.video.mpvVO', {}) ?? 'MPV: VO';

  /// en: 'MPV: HWDEC'
  String get mpvHWDEC => TranslationOverrides.string(_root.$meta, 'settings.video.mpvHWDEC', {}) ?? 'MPV: HWDEC';

  /// en: 'Video cache mode'
  String get videoCacheMode => TranslationOverrides.string(_root.$meta, 'settings.video.videoCacheMode', {}) ?? 'Video cache mode';

  late final TranslationsSettingsVideoCacheModesEn cacheModes = TranslationsSettingsVideoCacheModesEn.internal(_root);
  late final TranslationsSettingsVideoCacheModeValuesEn cacheModeValues = TranslationsSettingsVideoCacheModeValuesEn.internal(_root);
  late final TranslationsSettingsVideoVideoBackendModeValuesEn videoBackendModeValues = TranslationsSettingsVideoVideoBackendModeValuesEn.internal(
    _root,
  );
}

// Path: settings.downloads
class TranslationsSettingsDownloadsEn {
  TranslationsSettingsDownloadsEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'From next item in queue'
  String get fromNextItemInQueue =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.fromNextItemInQueue', {}) ?? 'From next item in queue';

  /// en: 'Please provide storage permission in order to download files'
  String get pleaseProvideStoragePermission =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.pleaseProvideStoragePermission', {}) ??
      'Please provide storage permission in order to download files';

  /// en: 'No items selected'
  String get noItemsSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsSelected', {}) ?? 'No items selected';

  /// en: 'No items in queue'
  String get noItemsQueued => TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsQueued', {}) ?? 'No items in queue';

  /// en: 'Batch'
  String get batch => TranslationOverrides.string(_root.$meta, 'settings.downloads.batch', {}) ?? 'Batch';

  /// en: 'Snatch selected'
  String get snatchSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? 'Snatch selected';

  /// en: 'Remove snatched status from selected'
  String get removeSnatchedStatusFromSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ?? 'Remove snatched status from selected';

  /// en: 'Favorite selected'
  String get favouriteSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? 'Favorite selected';

  /// en: 'Unfavorite selected'
  String get unfavouriteSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? 'Unfavorite selected';

  /// en: 'Clear selected'
  String get clearSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? 'Clear selected';

  /// en: 'Updating data...'
  String get updatingData => TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? 'Updating data...';
}

// Path: settings.database
class TranslationsSettingsDatabaseEn {
  TranslationsSettingsDatabaseEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Database'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? 'Database';

  /// en: 'Indexing database'
  String get indexingDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? 'Indexing database';

  /// en: 'Dropping indexes'
  String get droppingIndexes => TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? 'Dropping indexes';

  /// en: 'Enable database'
  String get enableDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.enableDatabase', {}) ?? 'Enable database';

  /// en: 'Enable indexing'
  String get enableIndexing => TranslationOverrides.string(_root.$meta, 'settings.database.enableIndexing', {}) ?? 'Enable indexing';

  /// en: 'Enable search history'
  String get enableSearchHistory => TranslationOverrides.string(_root.$meta, 'settings.database.enableSearchHistory', {}) ?? 'Enable search history';

  /// en: 'Enable tag type fetching'
  String get enableTagTypeFetching =>
      TranslationOverrides.string(_root.$meta, 'settings.database.enableTagTypeFetching', {}) ?? 'Enable tag type fetching';

  /// en: 'Sankaku type to update'
  String get sankakuTypeToUpdate => TranslationOverrides.string(_root.$meta, 'settings.database.sankakuTypeToUpdate', {}) ?? 'Sankaku type to update';

  /// en: 'Search query'
  String get searchQuery => TranslationOverrides.string(_root.$meta, 'settings.database.searchQuery', {}) ?? 'Search query';

  /// en: '(optional, may make the process slower)'
  String get searchQueryOptional =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchQueryOptional', {}) ?? '(optional, may make the process slower)';

  /// en: 'Can't leave the page right now!'
  String get cantLeavePageNow =>
      TranslationOverrides.string(_root.$meta, 'settings.database.cantLeavePageNow', {}) ?? 'Can\'t leave the page right now!';

  /// en: 'Sankaku data is being updated, wait until it ends or cancel manually at the bottom of the page'
  String get sankakuDataUpdating =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDataUpdating', {}) ??
      'Sankaku data is being updated, wait until it ends or cancel manually at the bottom of the page';

  /// en: 'Please wait!'
  String get pleaseWaitTitle => TranslationOverrides.string(_root.$meta, 'settings.database.pleaseWaitTitle', {}) ?? 'Please wait!';

  /// en: 'Indexes are being changed'
  String get indexesBeingChanged =>
      TranslationOverrides.string(_root.$meta, 'settings.database.indexesBeingChanged', {}) ?? 'Indexes are being changed';

  /// en: 'Stores favourites and tracks snatched items'
  String get databaseInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfo', {}) ?? 'Stores favourites and tracks snatched items';

  /// en: 'Snatched items won't be re-downloaded'
  String get databaseInfoSnatch =>
      TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfoSnatch', {}) ?? 'Snatched items won\'t be re-downloaded';

  /// en: 'Speeds up database searches but uses more disk space (up to 2x). Don't leave page or close app while indexing.'
  String get indexingInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.indexingInfo', {}) ??
      'Speeds up database searches but uses more disk space (up to 2x).\n\nDon\'t leave page or close app while indexing.';

  /// en: 'Create Indexes [Debug]'
  String get createIndexesDebug => TranslationOverrides.string(_root.$meta, 'settings.database.createIndexesDebug', {}) ?? 'Create Indexes [Debug]';

  /// en: 'Drop Indexes [Debug]'
  String get dropIndexesDebug => TranslationOverrides.string(_root.$meta, 'settings.database.dropIndexesDebug', {}) ?? 'Drop Indexes [Debug]';

  /// en: 'Requires database to be enabled.'
  String get searchHistoryInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryInfo', {}) ?? 'Requires database to be enabled.';

  /// en: 'Saves last ${limit: int} searches'
  String searchHistoryRecords({required int limit}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryRecords', {'limit': limit}) ?? 'Saves last ${limit} searches';

  /// en: 'Tap entry for actions (Delete, Favourite...)'
  String get searchHistoryTapInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryTapInfo', {}) ?? 'Tap entry for actions (Delete, Favourite...)';

  /// en: 'Favourited queries are pinned to the top of the list and will not be counted towards the limit.'
  String get searchHistoryFavouritesInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryFavouritesInfo', {}) ??
      'Favourited queries are pinned to the top of the list and will not be counted towards the limit.';

  /// en: 'Fetches tag types from supported boorus'
  String get tagTypeFetchingInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingInfo', {}) ?? 'Fetches tag types from supported boorus';

  /// en: 'May cause rate limiting'
  String get tagTypeFetchingWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingWarning', {}) ?? 'May cause rate limiting';

  /// en: 'Delete database'
  String get deleteDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabase', {}) ?? 'Delete database';

  /// en: 'Delete database?'
  String get deleteDatabaseConfirm => TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabaseConfirm', {}) ?? 'Delete database?';

  /// en: 'Database deleted!'
  String get databaseDeleted => TranslationOverrides.string(_root.$meta, 'settings.database.databaseDeleted', {}) ?? 'Database deleted!';

  /// en: 'An app restart is required!'
  String get appRestartRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.database.appRestartRequired', {}) ?? 'An app restart is required!';

  /// en: 'Clear snatched items'
  String get clearSnatchedItems => TranslationOverrides.string(_root.$meta, 'settings.database.clearSnatchedItems', {}) ?? 'Clear snatched items';

  /// en: 'Clear all snatched items?'
  String get clearAllSnatchedConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearAllSnatchedConfirm', {}) ?? 'Clear all snatched items?';

  /// en: 'Snatched items cleared'
  String get snatchedItemsCleared =>
      TranslationOverrides.string(_root.$meta, 'settings.database.snatchedItemsCleared', {}) ?? 'Snatched items cleared';

  /// en: 'An app restart may be required!'
  String get appRestartMayBeRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.database.appRestartMayBeRequired', {}) ?? 'An app restart may be required!';

  /// en: 'Clear favourited items'
  String get clearFavouritedItems =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearFavouritedItems', {}) ?? 'Clear favourited items';

  /// en: 'Clear all favourited items?'
  String get clearAllFavouritedConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearAllFavouritedConfirm', {}) ?? 'Clear all favourited items?';

  /// en: 'Favourites cleared'
  String get favouritesCleared => TranslationOverrides.string(_root.$meta, 'settings.database.favouritesCleared', {}) ?? 'Favourites cleared';

  /// en: 'Clear search history'
  String get clearSearchHistory => TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistory', {}) ?? 'Clear search history';

  /// en: 'Clear search history?'
  String get clearSearchHistoryConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistoryConfirm', {}) ?? 'Clear search history?';

  /// en: 'Search history cleared'
  String get searchHistoryCleared =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryCleared', {}) ?? 'Search history cleared';

  /// en: 'Sankaku favourites update'
  String get sankakuFavouritesUpdate =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdate', {}) ?? 'Sankaku favourites update';

  /// en: 'Sankaku favourites update started'
  String get sankakuFavouritesUpdateStarted =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateStarted', {}) ?? 'Sankaku favourites update started';

  /// en: 'New image urls will be fetched for Sankaku items in your favourites'
  String get sankakuNewUrlsInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuNewUrlsInfo', {}) ??
      'New image urls will be fetched for Sankaku items in your favourites';

  /// en: 'Don't leave this page until the process is complete or stopped'
  String get sankakuDontLeavePage =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDontLeavePage', {}) ??
      'Don\'t leave this page until the process is complete or stopped';

  /// en: 'No Sankaku config found!'
  String get noSankakuConfigFound =>
      TranslationOverrides.string(_root.$meta, 'settings.database.noSankakuConfigFound', {}) ?? 'No Sankaku config found!';

  /// en: 'Sankaku favourites update complete'
  String get sankakuFavouritesUpdateComplete =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateComplete', {}) ?? 'Sankaku favourites update complete';

  /// en: 'Failed item purge started'
  String get failedItemsPurgeStartedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeStartedTitle', {}) ?? 'Failed item purge started';

  /// en: 'Items that failed to update will be removed from the database'
  String get failedItemsPurgeInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeInfo', {}) ??
      'Items that failed to update will be removed from the database';

  /// en: 'Update Sankaku URLs'
  String get updateSankakuUrls => TranslationOverrides.string(_root.$meta, 'settings.database.updateSankakuUrls', {}) ?? 'Update Sankaku URLs';

  /// en: 'Updating ${count: int} items:'
  String updating({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.updating', {'count': count}) ?? 'Updating ${count} items:';

  /// en: 'Left: ${count: int}'
  String left({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.left', {'count': count}) ?? 'Left: ${count}';

  /// en: 'Done: ${count: int}'
  String done({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.done', {'count': count}) ?? 'Done: ${count}';

  /// en: 'Failed/Skipped: ${count: int}'
  String failedSkipped({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedSkipped', {'count': count}) ?? 'Failed/Skipped: ${count}';

  /// en: 'Stop and try again later if you start seeing 'Failed' number constantly growing, you could have reached rate limit and/or Sankaku blocks requests from your IP.'
  String get sankakuRateLimitWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuRateLimitWarning', {}) ??
      'Stop and try again later if you start seeing \'Failed\' number constantly growing, you could have reached rate limit and/or Sankaku blocks requests from your IP.';

  /// en: 'Press here to skip current item'
  String get skipCurrentItem =>
      TranslationOverrides.string(_root.$meta, 'settings.database.skipCurrentItem', {}) ?? 'Press here to skip current item';

  /// en: 'Use if item appears to be stuck'
  String get useIfStuck => TranslationOverrides.string(_root.$meta, 'settings.database.useIfStuck', {}) ?? 'Use if item appears to be stuck';

  /// en: 'Press here to stop'
  String get pressToStop => TranslationOverrides.string(_root.$meta, 'settings.database.pressToStop', {}) ?? 'Press here to stop';

  /// en: 'Purge failed items (${count: int})'
  String purgeFailedItems({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.purgeFailedItems', {'count': count}) ?? 'Purge failed items (${count})';

  /// en: 'Retry failed items (${count: int})'
  String retryFailedItems({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.retryFailedItems', {'count': count}) ?? 'Retry failed items (${count})';
}

// Path: settings.backupAndRestore
class TranslationsSettingsBackupAndRestoreEn {
  TranslationsSettingsBackupAndRestoreEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Backup & Restore'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.title', {}) ?? 'Backup & Restore';

  /// en: 'Duplicate file detected!'
  String get duplicateFileDetectedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedTitle', {}) ?? 'Duplicate file detected!';

  /// en: 'The file ${fileName: String} already exists. Do you want to overwrite it? If you choose no, the backup will be cancelled.'
  String duplicateFileDetectedMsg({required String fileName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
      'The file ${fileName} already exists. Do you want to overwrite it? If you choose no, the backup will be cancelled.';

  /// en: 'This feature is only available on Android, on Desktop builds you can just copy/paste files from/to app's data folder, respective to your system'
  String get androidOnlyFeatureMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ??
      'This feature is only available on Android, on Desktop builds you can just copy/paste files from/to app\'s data folder, respective to your system';

  /// en: 'Select backup directory'
  String get selectBackupDir =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? 'Select backup directory';

  /// en: 'Failed to get backup path'
  String get failedToGetBackupPath =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ?? 'Failed to get backup path';

  /// en: 'Backup path is: ${backupPath: String}'
  String backupPathMsg({required String backupPath}) =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ??
      'Backup path is: ${backupPath}';

  /// en: 'No backup directory selected'
  String get noBackupDirSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ?? 'No backup directory selected';

  /// en: 'Files must be in directory root'
  String get restoreInfoMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ?? 'Files must be in directory root';

  /// en: 'Backup settings'
  String get backupSettings => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? 'Backup settings';

  /// en: 'Restore settings'
  String get restoreSettings => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? 'Restore settings';

  /// en: 'Settings backed up to settings.json'
  String get settingsBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ?? 'Settings backed up to settings.json';

  /// en: 'Settings restored from backup'
  String get settingsRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? 'Settings restored from backup';

  /// en: 'Failed to backup settings'
  String get backupSettingsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ?? 'Failed to backup settings';

  /// en: 'Failed to restore settings'
  String get restoreSettingsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ?? 'Failed to restore settings';

  /// en: 'Reset backup directory'
  String get resetBackupDir => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.resetBackupDir', {}) ?? 'Reset backup directory';

  /// en: 'Backup boorus'
  String get backupBoorus => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ?? 'Backup boorus';

  /// en: 'Restore boorus'
  String get restoreBoorus => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? 'Restore boorus';

  /// en: 'Boorus backed up to boorus.json'
  String get boorusBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ?? 'Boorus backed up to boorus.json';

  /// en: 'Boorus restored from backup'
  String get boorusRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ?? 'Boorus restored from backup';

  /// en: 'Failed to backup boorus'
  String get backupBoorusError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ?? 'Failed to backup boorus';

  /// en: 'Failed to restore boorus'
  String get restoreBoorusError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ?? 'Failed to restore boorus';

  /// en: 'Backup database'
  String get backupDatabase => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? 'Backup database';

  /// en: 'Restore database'
  String get restoreDatabase => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? 'Restore database';

  /// en: 'May take a while depending on the size of the database, will restart the app on success'
  String get restoreDatabaseInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ??
      'May take a while depending on the size of the database, will restart the app on success';

  /// en: 'Database backed up to store.db'
  String get databaseBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ?? 'Database backed up to store.db';

  /// en: 'Database restored from backup! App will restart in a few seconds!'
  String get databaseRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ??
      'Database restored from backup! App will restart in a few seconds!';

  /// en: 'Failed to backup database'
  String get backupDatabaseError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ?? 'Failed to backup database';

  /// en: 'Failed to restore database'
  String get restoreDatabaseError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ?? 'Failed to restore database';

  /// en: 'Database file not found or cannot be read!'
  String get databaseFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ?? 'Database file not found or cannot be read!';

  /// en: 'Backup tags'
  String get backupTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? 'Backup tags';

  /// en: 'Restore tags'
  String get restoreTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? 'Restore tags';

  /// en: 'May take a while if you have a lot of tags. If you did a database restore, you don't need to do this because it's already included in the database'
  String get restoreTagsInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ??
      'May take a while if you have a lot of tags. If you did a database restore, you don\'t need to do this because it\'s already included in the database';

  /// en: 'Tags backed up to tags.json'
  String get tagsBackedUp => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? 'Tags backed up to tags.json';

  /// en: 'Tags restored from backup'
  String get tagsRestored => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? 'Tags restored from backup';

  /// en: 'Failed to backup tags'
  String get backupTagsError => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? 'Failed to backup tags';

  /// en: 'Failed to restore tags'
  String get restoreTagsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? 'Failed to restore tags';

  /// en: 'Tags file not found or cannot be read!'
  String get tagsFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsFileNotFound', {}) ?? 'Tags file not found or cannot be read!';

  /// en: 'Press Hide below if it takes too long, operation will continue in background'
  String get operationTakesTooLongMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.operationTakesTooLongMsg', {}) ??
      'Press Hide below if it takes too long, operation will continue in background';

  /// en: 'Backup file not found or cannot be read!'
  String get backupFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupFileNotFound', {}) ?? 'Backup file not found or cannot be read!';

  /// en: 'No access to backup directory!'
  String get backupDirNoAccess =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDirNoAccess', {}) ?? 'No access to backup directory!';

  /// en: 'Backup cancelled'
  String get backupCancelled => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? 'Backup cancelled';
}

// Path: settings.network
class TranslationsSettingsNetworkEn {
  TranslationsSettingsNetworkEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Network'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? 'Network';

  /// en: 'Enable self signed SSL certificates'
  String get enableSelfSignedSSLCertificates =>
      TranslationOverrides.string(_root.$meta, 'settings.network.enableSelfSignedSSLCertificates', {}) ?? 'Enable self signed SSL certificates';

  /// en: 'Proxy'
  String get proxy => TranslationOverrides.string(_root.$meta, 'settings.network.proxy', {}) ?? 'Proxy';

  /// en: 'Does not apply to streaming video mode, use caching video mode instead'
  String get proxySubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.network.proxySubtitle', {}) ??
      'Does not apply to streaming video mode, use caching video mode instead';

  /// en: 'Custom user agent'
  String get customUserAgent => TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgent', {}) ?? 'Custom user agent';

  /// en: 'Custom user agent'
  String get customUserAgentTitle => TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgentTitle', {}) ?? 'Custom user agent';

  /// en: 'Keep empty to use default value'
  String get keepEmptyForDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.network.keepEmptyForDefault', {}) ?? 'Keep empty to use default value';

  /// en: 'Default: ${agent: String}'
  String defaultUserAgent({required String agent}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.defaultUserAgent', {'agent': agent}) ?? 'Default: ${agent}';

  /// en: 'Used for most booru requests and webview'
  String get userAgentUsedOnRequests =>
      TranslationOverrides.string(_root.$meta, 'settings.network.userAgentUsedOnRequests', {}) ?? 'Used for most booru requests and webview';

  /// en: 'Saved on page exit'
  String get valueSavedAfterLeaving =>
      TranslationOverrides.string(_root.$meta, 'settings.network.valueSavedAfterLeaving', {}) ?? 'Saved on page exit';

  /// en: 'Tap here to set suggested browser user agent (recommended only when sites you use ban non-browser user agents):'
  String get setBrowserUserAgent =>
      TranslationOverrides.string(_root.$meta, 'settings.network.setBrowserUserAgent', {}) ??
      'Tap here to set suggested browser user agent (recommended only when sites you use ban non-browser user agents):';

  /// en: 'Cookie cleaner'
  String get cookieCleaner => TranslationOverrides.string(_root.$meta, 'settings.network.cookieCleaner', {}) ?? 'Cookie cleaner';

  /// en: 'Booru'
  String get booru => TranslationOverrides.string(_root.$meta, 'settings.network.booru', {}) ?? 'Booru';

  /// en: 'Select a booru to clear cookies for or leave empty to clear all'
  String get selectBooruToClearCookies =>
      TranslationOverrides.string(_root.$meta, 'settings.network.selectBooruToClearCookies', {}) ??
      'Select a booru to clear cookies for or leave empty to clear all';

  /// en: 'Cookies for ${booruName: String}:'
  String cookiesFor({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookiesFor', {'booruName': booruName}) ?? 'Cookies for ${booruName}:';

  /// en: '«${cookieName: String}» cookie deleted'
  String cookieDeleted({required String cookieName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookieDeleted', {'cookieName': cookieName}) ?? '«${cookieName}» cookie deleted';

  /// en: 'Clear cookies'
  String get clearCookies => TranslationOverrides.string(_root.$meta, 'settings.network.clearCookies', {}) ?? 'Clear cookies';

  /// en: 'Clear cookies for ${booruName: String}'
  String clearCookiesFor({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.clearCookiesFor', {'booruName': booruName}) ?? 'Clear cookies for ${booruName}';

  /// en: 'Cookies for ${booruName: String} deleted'
  String cookiesForBooruDeleted({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookiesForBooruDeleted', {'booruName': booruName}) ??
      'Cookies for ${booruName} deleted';

  /// en: 'All cookies deleted'
  String get allCookiesDeleted => TranslationOverrides.string(_root.$meta, 'settings.network.allCookiesDeleted', {}) ?? 'All cookies deleted';

  /// en: 'No connection'
  String get noConnection => TranslationOverrides.string(_root.$meta, 'settings.network.noConnection', {}) ?? 'No connection';
}

// Path: settings.privacy
class TranslationsSettingsPrivacyEn {
  TranslationsSettingsPrivacyEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Privacy'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? 'Privacy';

  /// en: 'App lock'
  String get appLock => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? 'App lock';

  /// en: 'Lock app manually or after idle timeout. Requires PIN/biometrics'
  String get appLockMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ??
      'Lock app manually or after idle timeout. Requires PIN/biometrics';

  /// en: 'Auto lock after'
  String get autoLockAfter => TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfter', {}) ?? 'Auto lock after';

  /// en: 'in seconds, 0 to disable'
  String get autoLockAfterTip => TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfterTip', {}) ?? 'in seconds, 0 to disable';

  /// en: 'Blur screen when leaving the app'
  String get bluronLeave => TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeave', {}) ?? 'Blur screen when leaving the app';

  /// en: 'May not work on some devices due to system limitations'
  String get bluronLeaveMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeaveMsg', {}) ?? 'May not work on some devices due to system limitations';

  /// en: 'Incognito keyboard'
  String get incognitoKeyboard => TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboard', {}) ?? 'Incognito keyboard';

  /// en: 'Prevents keyboard from saving typing history. Applied to most text inputs'
  String get incognitoKeyboardMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboardMsg', {}) ??
      'Prevents keyboard from saving typing history.\nApplied to most text inputs';

  /// en: 'App display name'
  String get appDisplayName => TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayName', {}) ?? 'App display name';

  /// en: 'Change how the app name appears in your launcher'
  String get appDisplayNameDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayNameDescription', {}) ??
      'Change how the app name appears in your launcher';

  /// en: 'App name changed'
  String get appAliasChanged => TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChanged', {}) ?? 'App name changed';

  /// en: 'The app name change will take effect after restarting the app. Some launchers may need additional time or system reboot to update.'
  String get appAliasRestartHint =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasRestartHint', {}) ??
      'The app name change will take effect after restarting the app. Some launchers may need additional time or system reboot to update.';

  /// en: 'Failed to change app name. Please try again.'
  String get appAliasChangeFailed =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChangeFailed', {}) ?? 'Failed to change app name. Please try again.';

  /// en: 'Restart now'
  String get restartNow => TranslationOverrides.string(_root.$meta, 'settings.privacy.restartNow', {}) ?? 'Restart now';
}

// Path: settings.performance
class TranslationsSettingsPerformanceEn {
  TranslationsSettingsPerformanceEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Performance'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.performance.title', {}) ?? 'Performance';

  /// en: 'Low performance mode'
  String get lowPerformanceMode => TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceMode', {}) ?? 'Low performance mode';

  /// en: 'Recommended for old devices and devices with low RAM'
  String get lowPerformanceModeSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeSubtitle', {}) ??
      'Recommended for old devices and devices with low RAM';

  /// en: 'Low performance mode'
  String get lowPerformanceModeDialogTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogTitle', {}) ?? 'Low performance mode';

  /// en: '- Disables detailed loading progress information'
  String get lowPerformanceModeDialogDisablesDetailed =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesDetailed', {}) ??
      '- Disables detailed loading progress information';

  /// en: '- Disables resource-intensive elements (blurs, animated opacity, some animations...)'
  String get lowPerformanceModeDialogDisablesResourceIntensive =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive', {}) ??
      '- Disables resource-intensive elements (blurs, animated opacity, some animations...)';

  /// en: 'Sets optimal settings for these options (you can change them separately later):'
  String get lowPerformanceModeDialogSetsOptimal =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogSetsOptimal', {}) ??
      'Sets optimal settings for these options (you can change them separately later):';

  /// en: 'Autoplay videos'
  String get autoplayVideos => TranslationOverrides.string(_root.$meta, 'settings.performance.autoplayVideos', {}) ?? 'Autoplay videos';

  /// en: 'Disable videos'
  String get disableVideos => TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideos', {}) ?? 'Disable videos';

  /// en: 'Useful on low end devices that crash when trying to load videos. Gives options to view video in external player or browser instead.'
  String get disableVideosHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideosHelp', {}) ??
      'Useful on low end devices that crash when trying to load videos. Gives options to view video in external player or browser instead.';
}

// Path: settings.cache
class TranslationsSettingsCacheEn {
  TranslationsSettingsCacheEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Snatching & Caching'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? 'Snatching & Caching';

  /// en: 'Snatch quality'
  String get snatchQuality => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchQuality', {}) ?? 'Snatch quality';

  /// en: 'Snatch cooldown (in ms)'
  String get snatchCooldown => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchCooldown', {}) ?? 'Snatch cooldown (in ms)';

  /// en: 'Please enter a valid timeout value'
  String get pleaseEnterAValidTimeout =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.pleaseEnterAValidTimeout', {}) ?? 'Please enter a valid timeout value';

  /// en: 'Please enter a value bigger than 10ms'
  String get biggerThan10 => TranslationOverrides.string(_root.$meta, 'settings.cache.biggerThan10', {}) ?? 'Please enter a value bigger than 10ms';

  /// en: 'Show download notifications'
  String get showDownloadNotifications =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.showDownloadNotifications', {}) ?? 'Show download notifications';

  /// en: 'Snatch items on favouriting'
  String get snatchItemsOnFavouriting =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.snatchItemsOnFavouriting', {}) ?? 'Snatch items on favouriting';

  /// en: 'Favourite items on snatching'
  String get favouriteItemsOnSnatching =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.favouriteItemsOnSnatching', {}) ?? 'Favourite items on snatching';

  /// en: 'Write image data to JSON on save'
  String get writeImageDataOnSave =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.writeImageDataOnSave', {}) ?? 'Write image data to JSON on save';

  /// en: 'Requires custom directory'
  String get requiresCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.requiresCustomStorageDirectory', {}) ?? 'Requires custom directory';

  /// en: 'Set storage directory'
  String get setStorageDirectory => TranslationOverrides.string(_root.$meta, 'settings.cache.setStorageDirectory', {}) ?? 'Set storage directory';

  /// en: 'Current: ${path: String}'
  String currentPath({required String path}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.currentPath', {'path': path}) ?? 'Current: ${path}';

  /// en: 'Reset storage directory'
  String get resetStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.resetStorageDirectory', {}) ?? 'Reset storage directory';

  /// en: 'Cache previews'
  String get cachePreviews => TranslationOverrides.string(_root.$meta, 'settings.cache.cachePreviews', {}) ?? 'Cache previews';

  /// en: 'Cache media'
  String get cacheMedia => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheMedia', {}) ?? 'Cache media';

  /// en: 'Video cache mode'
  String get videoCacheMode => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheMode', {}) ?? 'Video cache mode';

  /// en: 'Video cache modes'
  String get videoCacheModesTitle => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModesTitle', {}) ?? 'Video cache modes';

  /// en: '- Stream - Don't cache, start playing as soon as possible'
  String get videoCacheModeStream =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStream', {}) ??
      '- Stream - Don\'t cache, start playing as soon as possible';

  /// en: '- Cache - Saves the file to device storage, plays only when download is complete'
  String get videoCacheModeCache =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeCache', {}) ??
      '- Cache - Saves the file to device storage, plays only when download is complete';

  /// en: '- Stream+Cache - Mix of both, but currently leads to double download'
  String get videoCacheModeStreamCache =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStreamCache', {}) ??
      '- Stream+Cache - Mix of both, but currently leads to double download';

  /// en: '[Note]: Videos will cache only if 'Cache Media' is enabled.'
  String get videoCacheNoteEnable =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheNoteEnable', {}) ??
      '[Note]: Videos will cache only if \'Cache Media\' is enabled.';

  /// en: '[Warning]: On desktop Stream mode can work incorrectly for some Boorus.'
  String get videoCacheWarningDesktop =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheWarningDesktop', {}) ??
      '[Warning]: On desktop Stream mode can work incorrectly for some Boorus.';

  /// en: 'Delete cache after:'
  String get deleteCacheAfter => TranslationOverrides.string(_root.$meta, 'settings.cache.deleteCacheAfter', {}) ?? 'Delete cache after:';

  /// en: 'Cache size Limit (in GB)'
  String get cacheSizeLimit => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheSizeLimit', {}) ?? 'Cache size Limit (in GB)';

  /// en: 'Maximum total cache size'
  String get maximumTotalCacheSize =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.maximumTotalCacheSize', {}) ?? 'Maximum total cache size';

  /// en: 'Cache stats:'
  String get cacheStats => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheStats', {}) ?? 'Cache stats:';

  /// en: 'Loading...'
  String get loading => TranslationOverrides.string(_root.$meta, 'settings.cache.loading', {}) ?? 'Loading...';

  /// en: 'Empty'
  String get empty => TranslationOverrides.string(_root.$meta, 'settings.cache.empty', {}) ?? 'Empty';

  /// en: '${size: String}, ${count: int} files'
  String inFilesPlural({required String size, required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.inFilesPlural', {'size': size, 'count': count}) ?? '${size}, ${count} files';

  /// en: '${size: String}, 1 file'
  String inFileSingular({required String size}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.inFileSingular', {'size': size}) ?? '${size}, 1 file';

  /// en: 'Total'
  String get cacheTypeTotal => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeTotal', {}) ?? 'Total';

  /// en: 'Favicons'
  String get cacheTypeFavicons => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeFavicons', {}) ?? 'Favicons';

  /// en: 'Thumbnails'
  String get cacheTypeThumbnails => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeThumbnails', {}) ?? 'Thumbnails';

  /// en: 'Samples'
  String get cacheTypeSamples => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeSamples', {}) ?? 'Samples';

  /// en: 'Media'
  String get cacheTypeMedia => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeMedia', {}) ?? 'Media';

  /// en: 'WebView'
  String get cacheTypeWebView => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeWebView', {}) ?? 'WebView';

  /// en: 'Cache cleared'
  String get cacheCleared => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheCleared', {}) ?? 'Cache cleared';

  /// en: 'Cleared ${type: String} cache'
  String clearedCacheType({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheType', {'type': type}) ?? 'Cleared ${type} cache';

  /// en: 'Clear all cache'
  String get clearAllCache => TranslationOverrides.string(_root.$meta, 'settings.cache.clearAllCache', {}) ?? 'Clear all cache';

  /// en: 'Cleared cache completely'
  String get clearedCacheCompletely =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheCompletely', {}) ?? 'Cleared cache completely';

  /// en: 'App Restart may be required!'
  String get appRestartRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.appRestartRequired', {}) ?? 'App Restart may be required!';

  /// en: 'Error!'
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'settings.cache.errorExclamation', {}) ?? 'Error!';

  /// en: 'Currently not available for this platform'
  String get notAvailableForPlatform =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.notAvailableForPlatform', {}) ?? 'Currently not available for this platform';
}

// Path: settings.itemFilters
class TranslationsSettingsItemFiltersEn {
  TranslationsSettingsItemFiltersEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Filters'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.title', {}) ?? 'Filters';

  /// en: 'Hidden'
  String get hidden => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.hidden', {}) ?? 'Hidden';

  /// en: 'Marked'
  String get marked => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.marked', {}) ?? 'Marked';

  /// en: 'Duplicate filter'
  String get duplicateFilter => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.duplicateFilter', {}) ?? 'Duplicate filter';

  /// en: ''${tag: String}' is already in ${type: String} list'
  String alreadyInList({required String tag, required String type}) =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.alreadyInList', {'tag': tag, 'type': type}) ??
      '\'${tag}\' is already in ${type} list';

  /// en: 'No filters found'
  String get noFiltersFound => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersFound', {}) ?? 'No filters found';

  /// en: 'No filters added'
  String get noFiltersAdded => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersAdded', {}) ?? 'No filters added';

  /// en: 'Completely hide items which match Hidden filters'
  String get removeHidden =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeHidden', {}) ?? 'Completely hide items which match Hidden filters';

  /// en: 'Remove favourited items'
  String get removeFavourited => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeFavourited', {}) ?? 'Remove favourited items';

  /// en: 'Remove snatched items'
  String get removeSnatched => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeSnatched', {}) ?? 'Remove snatched items';

  /// en: 'Remove AI items'
  String get removeAI => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeAI', {}) ?? 'Remove AI items';
}

// Path: settings.sync
class TranslationsSettingsSyncEn {
  TranslationsSettingsSyncEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'LoliSync'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? 'LoliSync';

  /// en: 'Database must be enabled to use LoliSync'
  String get dbError => TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ?? 'Database must be enabled to use LoliSync';

  /// en: 'Error!'
  String get errorTitle => TranslationOverrides.string(_root.$meta, 'settings.sync.errorTitle', {}) ?? 'Error!';

  /// en: 'Please enter IP address and port.'
  String get pleaseEnterIPAndPort =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.pleaseEnterIPAndPort', {}) ?? 'Please enter IP address and port.';

  /// en: 'Select what you want to do'
  String get selectWhatYouWantToDo =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.selectWhatYouWantToDo', {}) ?? 'Select what you want to do';

  /// en: 'SEND data TO another device'
  String get sendDataToDevice => TranslationOverrides.string(_root.$meta, 'settings.sync.sendDataToDevice', {}) ?? 'SEND data TO another device';

  /// en: 'RECEIVE data FROM another device'
  String get receiveDataFromDevice =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.receiveDataFromDevice', {}) ?? 'RECEIVE data FROM another device';

  /// en: 'Start server on other device, enter its IP/port, then tap Start sync'
  String get senderInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.senderInstructions', {}) ??
      'Start server on other device, enter its IP/port, then tap Start sync';

  /// en: 'IP Address'
  String get ipAddress => TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddress', {}) ?? 'IP Address';

  /// en: 'Host IP Address (i.e. 192.168.1.1)'
  String get ipAddressPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddressPlaceholder', {}) ?? 'Host IP Address (i.e. 192.168.1.1)';

  /// en: 'Port'
  String get port => TranslationOverrides.string(_root.$meta, 'settings.sync.port', {}) ?? 'Port';

  /// en: 'Host Port (i.e. 7777)'
  String get portPlaceholder => TranslationOverrides.string(_root.$meta, 'settings.sync.portPlaceholder', {}) ?? 'Host Port (i.e. 7777)';

  /// en: 'Send favourites'
  String get sendFavourites => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavourites', {}) ?? 'Send favourites';

  /// en: 'Favorites: ${count: String}'
  String favouritesCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.favouritesCount', {'count': count}) ?? 'Favorites: ${count}';

  /// en: 'Send favourites (Legacy)'
  String get sendFavouritesLegacy => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavouritesLegacy', {}) ?? 'Send favourites (Legacy)';

  /// en: 'Sync favs from #...'
  String get syncFavsFrom => TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFrom', {}) ?? 'Sync favs from #...';

  /// en: 'Allows to set from where the sync should start from, useful if you already synced all your favs before and want to sync only the newest items'
  String get syncFavsFromHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText1', {}) ??
      'Allows to set from where the sync should start from, useful if you already synced all your favs before and want to sync only the newest items';

  /// en: 'If you want to sync from the beginning leave this field blank'
  String get syncFavsFromHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText2', {}) ??
      'If you want to sync from the beginning leave this field blank';

  /// en: 'Example: You have X amount of favs, set this field to 100, sync will start from item #100 and go until it reaches X'
  String get syncFavsFromHelpText3 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText3', {}) ??
      'Example: You have X amount of favs, set this field to 100, sync will start from item #100 and go until it reaches X';

  /// en: 'Order of favs: From oldest (0) to newest (X)'
  String get syncFavsFromHelpText4 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText4', {}) ?? 'Order of favs: From oldest (0) to newest (X)';

  /// en: 'Send snatched history'
  String get sendSnatchedHistory => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSnatchedHistory', {}) ?? 'Send snatched history';

  /// en: 'Snatched: ${count: String}'
  String snatchedCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.snatchedCount', {'count': count}) ?? 'Snatched: ${count}';

  /// en: 'Sync snatched from #...'
  String get syncSnatchedFrom => TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFrom', {}) ?? 'Sync snatched from #...';

  /// en: 'Allows to set from where the sync should start from, useful if you already synced all your snatched history before and want to sync only the newest items'
  String get syncSnatchedFromHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText1', {}) ??
      'Allows to set from where the sync should start from, useful if you already synced all your snatched history before and want to sync only the newest items';

  /// en: 'If you want to sync from the beginning leave this field blank'
  String get syncSnatchedFromHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText2', {}) ??
      'If you want to sync from the beginning leave this field blank';

  /// en: 'Example: You have X amount of favs, set this field to 100, sync will start from item #100 and go until it reaches X'
  String get syncSnatchedFromHelpText3 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText3', {}) ??
      'Example: You have X amount of favs, set this field to 100, sync will start from item #100 and go until it reaches X';

  /// en: 'Order of favs: From oldest (0) to newest (X)'
  String get syncSnatchedFromHelpText4 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText4', {}) ?? 'Order of favs: From oldest (0) to newest (X)';

  /// en: 'Send settings'
  String get sendSettings => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSettings', {}) ?? 'Send settings';

  /// en: 'Send booru configs'
  String get sendBooruConfigs => TranslationOverrides.string(_root.$meta, 'settings.sync.sendBooruConfigs', {}) ?? 'Send booru configs';

  /// en: 'Configs: ${count: String}'
  String configsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.configsCount', {'count': count}) ?? 'Configs: ${count}';

  /// en: 'Send tabs'
  String get sendTabs => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTabs', {}) ?? 'Send tabs';

  /// en: 'Tabs: ${count: String}'
  String tabsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsCount', {'count': count}) ?? 'Tabs: ${count}';

  /// en: 'Tabs sync mode'
  String get tabsSyncMode => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncMode', {}) ?? 'Tabs sync mode';

  /// en: 'Merge: Merge the tabs from this device on the other device, tabs with unknown boorus and already existing tabs will be ignored'
  String get tabsSyncModeMerge =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeMerge', {}) ??
      'Merge: Merge the tabs from this device on the other device, tabs with unknown boorus and already existing tabs will be ignored';

  /// en: 'Replace: Completely replace the tabs on the other device with the tabs from this device'
  String get tabsSyncModeReplace =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeReplace', {}) ??
      'Replace: Completely replace the tabs on the other device with the tabs from this device';

  /// en: 'Merge'
  String get merge => TranslationOverrides.string(_root.$meta, 'settings.sync.merge', {}) ?? 'Merge';

  /// en: 'Replace'
  String get replace => TranslationOverrides.string(_root.$meta, 'settings.sync.replace', {}) ?? 'Replace';

  /// en: 'Send tags'
  String get sendTags => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTags', {}) ?? 'Send tags';

  /// en: 'Tags: ${count: String}'
  String tagsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsCount', {'count': count}) ?? 'Tags: ${count}';

  /// en: 'Tags sync mode'
  String get tagsSyncMode => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncMode', {}) ?? 'Tags sync mode';

  /// en: 'Preserve type: If the tag exists with a tag type on the other device and it doesn't on this device it will be skipped'
  String get tagsSyncModePreferTypeIfNone =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModePreferTypeIfNone', {}) ??
      'Preserve type: If the tag exists with a tag type on the other device and it doesn\'t on this device it will be skipped';

  /// en: 'Overwrite: All tags will be added, if a tag and tag type exists on the other device it will be overwritten'
  String get tagsSyncModeOverwrite =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModeOverwrite', {}) ??
      'Overwrite: All tags will be added, if a tag and tag type exists on the other device it will be overwritten';

  /// en: 'Preserve type'
  String get preferTypeIfNone => TranslationOverrides.string(_root.$meta, 'settings.sync.preferTypeIfNone', {}) ?? 'Preserve type';

  /// en: 'Overwrite'
  String get overwrite => TranslationOverrides.string(_root.$meta, 'settings.sync.overwrite', {}) ?? 'Overwrite';

  /// en: 'Test connection'
  String get testConnection => TranslationOverrides.string(_root.$meta, 'settings.sync.testConnection', {}) ?? 'Test connection';

  /// en: 'Sends test request to other device.'
  String get testConnectionHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText1', {}) ?? 'Sends test request to other device.';

  /// en: 'Shows success/failure notification.'
  String get testConnectionHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText2', {}) ?? 'Shows success/failure notification.';

  /// en: 'Start sync'
  String get startSync => TranslationOverrides.string(_root.$meta, 'settings.sync.startSync', {}) ?? 'Start sync';

  /// en: 'The Port and IP fields cannot be empty!'
  String get portAndIPCannotBeEmpty =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.portAndIPCannotBeEmpty', {}) ?? 'The Port and IP fields cannot be empty!';

  /// en: 'You haven't selected anything to sync!'
  String get nothingSelectedToSync =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.nothingSelectedToSync', {}) ?? 'You haven\'t selected anything to sync!';

  /// en: 'Stats of this device:'
  String get statsOfThisDevice => TranslationOverrides.string(_root.$meta, 'settings.sync.statsOfThisDevice', {}) ?? 'Stats of this device:';

  /// en: 'Start server to receive data. Avoid public WiFi for security'
  String get receiverInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.receiverInstructions', {}) ??
      'Start server to receive data. Avoid public WiFi for security';

  /// en: 'Available network interfaces'
  String get availableNetworkInterfaces =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.availableNetworkInterfaces', {}) ?? 'Available network interfaces';

  /// en: 'Selected interface IP: ${ip: String}'
  String selectedInterfaceIP({required String ip}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.selectedInterfaceIP', {'ip': ip}) ?? 'Selected interface IP: ${ip}';

  /// en: 'Server port'
  String get serverPort => TranslationOverrides.string(_root.$meta, 'settings.sync.serverPort', {}) ?? 'Server port';

  /// en: '(will default to '8080' if empty)'
  String get serverPortPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.serverPortPlaceholder', {}) ?? '(will default to \'8080\' if empty)';

  /// en: 'Start receiver server'
  String get startReceiverServer => TranslationOverrides.string(_root.$meta, 'settings.sync.startReceiverServer', {}) ?? 'Start receiver server';
}

// Path: settings.about
class TranslationsSettingsAboutEn {
  TranslationsSettingsAboutEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'About'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.about.title', {}) ?? 'About';

  /// en: 'LoliSnatcher is open source and licensed under GPLv3 the source code is available on github. Please report any issues or feature requests in the issues section of the repo.'
  String get appDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ??
      'LoliSnatcher is open source and licensed under GPLv3 the source code is available on github. Please report any issues or feature requests in the issues section of the repo.';

  /// en: 'LoliSnatcher on Github'
  String get appOnGitHub => TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? 'LoliSnatcher on Github';

  /// en: 'Contact'
  String get contact => TranslationOverrides.string(_root.$meta, 'settings.about.contact', {}) ?? 'Contact';

  /// en: 'Email copied to clipboard'
  String get emailCopied => TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? 'Email copied to clipboard';

  /// en: 'A big thanks to Showers-U for letting us use their artwork for the app logo. Please check them out on Pixiv'
  String get logoArtistThanks =>
      TranslationOverrides.string(_root.$meta, 'settings.about.logoArtistThanks', {}) ??
      'A big thanks to Showers-U for letting us use their artwork for the app logo. Please check them out on Pixiv';

  /// en: 'Developers'
  String get developers => TranslationOverrides.string(_root.$meta, 'settings.about.developers', {}) ?? 'Developers';

  /// en: 'Releases'
  String get releases => TranslationOverrides.string(_root.$meta, 'settings.about.releases', {}) ?? 'Releases';

  /// en: 'Latest version and full changelogs can be found at the Github Releases page:'
  String get releasesMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.about.releasesMsg', {}) ??
      'Latest version and full changelogs can be found at the Github Releases page:';

  /// en: 'Licenses'
  String get licenses => TranslationOverrides.string(_root.$meta, 'settings.about.licenses', {}) ?? 'Licenses';
}

// Path: settings.checkForUpdates
class TranslationsSettingsCheckForUpdatesEn {
  TranslationsSettingsCheckForUpdatesEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Check for updates'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.title', {}) ?? 'Check for updates';

  /// en: 'Update available!'
  String get updateAvailable => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateAvailable', {}) ?? 'Update available!';

  /// en: 'What's new'
  String get whatsNew => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.whatsNew', {}) ?? 'What\'s new';

  /// en: 'Update changelog'
  String get updateChangelog => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? 'Update changelog';

  /// en: 'Update check error!'
  String get updateCheckError => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? 'Update check error!';

  /// en: 'You have the latest version'
  String get youHaveLatestVersion =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? 'You have the latest version';

  /// en: 'View latest changelog'
  String get viewLatestChangelog =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ?? 'View latest changelog';

  /// en: 'Current version'
  String get currentVersion => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? 'Current version';

  /// en: 'Changelog'
  String get changelog => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? 'Changelog';

  /// en: 'Visit Play Store'
  String get visitPlayStore => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? 'Visit Play Store';

  /// en: 'Visit releases'
  String get visitReleases => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? 'Visit releases';
}

// Path: settings.logs
class TranslationsSettingsLogsEn {
  TranslationsSettingsLogsEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Logs'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.logs.title', {}) ?? 'Logs';

  /// en: 'Share logs'
  String get shareLogs => TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogs', {}) ?? 'Share logs';

  /// en: 'Share logs to external app?'
  String get shareLogsWarningTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningTitle', {}) ?? 'Share logs to external app?';

  /// en: '[WARNING]: Logs may contain sensitive information, share with caution!'
  String get shareLogsWarningMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningMsg', {}) ??
      '[WARNING]: Logs may contain sensitive information, share with caution!';
}

// Path: settings.help
class TranslationsSettingsHelpEn {
  TranslationsSettingsHelpEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Help'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? 'Help';
}

// Path: settings.debug
class TranslationsSettingsDebugEn {
  TranslationsSettingsDebugEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Debug'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.debug.title', {}) ?? 'Debug';

  /// en: 'Debug mode is enabled!'
  String get enabledSnackbarMsg => TranslationOverrides.string(_root.$meta, 'settings.debug.enabledSnackbarMsg', {}) ?? 'Debug mode is enabled!';

  /// en: 'Debug mode is disabled!'
  String get disabledSnackbarMsg => TranslationOverrides.string(_root.$meta, 'settings.debug.disabledSnackbarMsg', {}) ?? 'Debug mode is disabled!';

  /// en: 'Debug mode is already enabled!'
  String get alreadyEnabledSnackbarMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.alreadyEnabledSnackbarMsg', {}) ?? 'Debug mode is already enabled!';

  /// en: 'Show performance graph'
  String get showPerformanceGraph => TranslationOverrides.string(_root.$meta, 'settings.debug.showPerformanceGraph', {}) ?? 'Show performance graph';

  /// en: 'Show FPS graph'
  String get showFPSGraph => TranslationOverrides.string(_root.$meta, 'settings.debug.showFPSGraph', {}) ?? 'Show FPS graph';

  /// en: 'Show image stats'
  String get showImageStats => TranslationOverrides.string(_root.$meta, 'settings.debug.showImageStats', {}) ?? 'Show image stats';

  /// en: 'Show video stats'
  String get showVideoStats => TranslationOverrides.string(_root.$meta, 'settings.debug.showVideoStats', {}) ?? 'Show video stats';

  /// en: 'Blur images + mute videos [DEV only]'
  String get blurImagesAndMuteVideosDevOnly =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.blurImagesAndMuteVideosDevOnly', {}) ?? 'Blur images + mute videos [DEV only]';

  /// en: 'Enable drag scroll on lists [Desktop only]'
  String get enableDragScrollOnListsDesktopOnly =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.enableDragScrollOnListsDesktopOnly', {}) ??
      'Enable drag scroll on lists [Desktop only]';

  /// en: 'Animation speed (${speed: double})'
  String animationSpeed({required double speed}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.animationSpeed', {'speed': speed}) ?? 'Animation speed (${speed})';

  /// en: 'Tags Manager'
  String get tagsManager => TranslationOverrides.string(_root.$meta, 'settings.debug.tagsManager', {}) ?? 'Tags Manager';

  /// en: 'Vibration'
  String get vibration => TranslationOverrides.string(_root.$meta, 'settings.debug.vibration', {}) ?? 'Vibration';

  /// en: 'Vibration tests'
  String get vibrationTests => TranslationOverrides.string(_root.$meta, 'settings.debug.vibrationTests', {}) ?? 'Vibration tests';

  /// en: 'Duration'
  String get duration => TranslationOverrides.string(_root.$meta, 'settings.debug.duration', {}) ?? 'Duration';

  /// en: 'Amplitude'
  String get amplitude => TranslationOverrides.string(_root.$meta, 'settings.debug.amplitude', {}) ?? 'Amplitude';

  /// en: 'Flutterway'
  String get flutterway => TranslationOverrides.string(_root.$meta, 'settings.debug.flutterway', {}) ?? 'Flutterway';

  /// en: 'Vibrate'
  String get vibrate => TranslationOverrides.string(_root.$meta, 'settings.debug.vibrate', {}) ?? 'Vibrate';

  /// en: 'Res: ${width: String}x${height: String}'
  String resolution({required String width, required String height}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.resolution', {'width': width, 'height': height}) ?? 'Res: ${width}x${height}';

  /// en: 'Pixel ratio: ${ratio: String}'
  String pixelRatio({required String ratio}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.pixelRatio', {'ratio': ratio}) ?? 'Pixel ratio: ${ratio}';

  /// en: 'Logger'
  String get logger => TranslationOverrides.string(_root.$meta, 'settings.debug.logger', {}) ?? 'Logger';

  /// en: 'Webview'
  String get webview => TranslationOverrides.string(_root.$meta, 'settings.debug.webview', {}) ?? 'Webview';

  /// en: 'Delete all cookies'
  String get deleteAllCookies => TranslationOverrides.string(_root.$meta, 'settings.debug.deleteAllCookies', {}) ?? 'Delete all cookies';

  /// en: 'Clear secure storage'
  String get clearSecureStorage => TranslationOverrides.string(_root.$meta, 'settings.debug.clearSecureStorage', {}) ?? 'Clear secure storage';

  /// en: 'Get session string'
  String get getSessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.getSessionString', {}) ?? 'Get session string';

  /// en: 'Set session string'
  String get setSessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.setSessionString', {}) ?? 'Set session string';

  /// en: 'Session string'
  String get sessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.sessionString', {}) ?? 'Session string';

  /// en: 'Restored session from string'
  String get restoredSessionFromString =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.restoredSessionFromString', {}) ?? 'Restored session from string';
}

// Path: settings.logging
class TranslationsSettingsLoggingEn {
  TranslationsSettingsLoggingEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Logger'
  String get logger => TranslationOverrides.string(_root.$meta, 'settings.logging.logger', {}) ?? 'Logger';
}

// Path: settings.webview
class TranslationsSettingsWebviewEn {
  TranslationsSettingsWebviewEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Open webview'
  String get openWebview => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? 'Open webview';

  /// en: 'to login or obtain cookies'
  String get openWebviewTip => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? 'to login or obtain cookies';
}

// Path: settings.dirPicker
class TranslationsSettingsDirPickerEn {
  TranslationsSettingsDirPickerEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Directory name'
  String get directoryName => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryName', {}) ?? 'Directory name';

  /// en: 'Select a directory'
  String get selectADirectory => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.selectADirectory', {}) ?? 'Select a directory';

  /// en: 'Do you want to close the picker without choosing a directory?'
  String get closeWithoutChoosing =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.closeWithoutChoosing', {}) ??
      'Do you want to close the picker without choosing a directory?';

  /// en: 'No'
  String get no => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.no', {}) ?? 'No';

  /// en: 'Yes'
  String get yes => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.yes', {}) ?? 'Yes';

  /// en: 'Error!'
  String get error => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.error', {}) ?? 'Error!';

  /// en: 'Failed to create directory'
  String get failedToCreateDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.failedToCreateDirectory', {}) ?? 'Failed to create directory';

  /// en: 'Directory is not writable!'
  String get directoryNotWritable =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryNotWritable', {}) ?? 'Directory is not writable!';

  /// en: 'New directory'
  String get newDirectory => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.newDirectory', {}) ?? 'New directory';

  /// en: 'Create'
  String get create => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.create', {}) ?? 'Create';
}

// Path: viewer.tutorial
class TranslationsViewerTutorialEn {
  TranslationsViewerTutorialEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Images'
  String get images => TranslationOverrides.string(_root.$meta, 'viewer.tutorial.images', {}) ?? 'Images';

  /// en: 'Tap/Long tap: toggle immersive mode'
  String get tapLongTapToggleImmersive =>
      TranslationOverrides.string(_root.$meta, 'viewer.tutorial.tapLongTapToggleImmersive', {}) ?? 'Tap/Long tap: toggle immersive mode';

  /// en: 'Double tap: fit to screen / original size / reset zoom'
  String get doubleTapFitScreen =>
      TranslationOverrides.string(_root.$meta, 'viewer.tutorial.doubleTapFitScreen', {}) ?? 'Double tap: fit to screen / original size / reset zoom';
}

// Path: viewer.appBar
class TranslationsViewerAppBarEn {
  TranslationsViewerAppBarEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Can't start Slideshow'
  String get cantStartSlideshow => TranslationOverrides.string(_root.$meta, 'viewer.appBar.cantStartSlideshow', {}) ?? 'Can\'t start Slideshow';

  /// en: 'Reached the Last loaded Item'
  String get reachedLastLoadedItem =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.reachedLastLoadedItem', {}) ?? 'Reached the Last loaded Item';

  /// en: 'Pause'
  String get pause => TranslationOverrides.string(_root.$meta, 'viewer.appBar.pause', {}) ?? 'Pause';

  /// en: 'Start'
  String get start => TranslationOverrides.string(_root.$meta, 'viewer.appBar.start', {}) ?? 'Start';

  /// en: 'Unfavourite'
  String get unfavourite => TranslationOverrides.string(_root.$meta, 'viewer.appBar.unfavourite', {}) ?? 'Unfavourite';

  /// en: 'Deselect'
  String get deselect => TranslationOverrides.string(_root.$meta, 'viewer.appBar.deselect', {}) ?? 'Deselect';

  /// en: 'Reload with scaling'
  String get reloadWithScaling => TranslationOverrides.string(_root.$meta, 'viewer.appBar.reloadWithScaling', {}) ?? 'Reload with scaling';

  /// en: 'Load sample quality'
  String get loadSampleQuality => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadSampleQuality', {}) ?? 'Load sample quality';

  /// en: 'Load high quality'
  String get loadHighQuality => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadHighQuality', {}) ?? 'Load high quality';

  /// en: 'Drop snatched status'
  String get dropSnatchedStatus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.dropSnatchedStatus', {}) ?? 'Drop snatched status';

  /// en: 'Set snatched status'
  String get setSnatchedStatus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.setSnatchedStatus', {}) ?? 'Set snatched status';

  /// en: 'Snatch'
  String get snatch => TranslationOverrides.string(_root.$meta, 'viewer.appBar.snatch', {}) ?? 'Snatch';

  /// en: '(forced)'
  String get forced => TranslationOverrides.string(_root.$meta, 'viewer.appBar.forced', {}) ?? '(forced)';

  /// en: 'Hydrus share'
  String get hydrusShare => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusShare', {}) ?? 'Hydrus share';

  /// en: 'Which URL you want to share to Hydrus?'
  String get whichUrlToShareToHydrus =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.whichUrlToShareToHydrus', {}) ?? 'Which URL you want to share to Hydrus?';

  /// en: 'Post URL'
  String get postURL => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURL', {}) ?? 'Post URL';

  /// en: 'File URL'
  String get fileURL => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURL', {}) ?? 'File URL';

  /// en: 'Hydrus is not configured!'
  String get hydrusNotConfigured => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusNotConfigured', {}) ?? 'Hydrus is not configured!';

  /// en: 'Share file'
  String get shareFile => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareFile', {}) ?? 'Share file';

  /// en: 'Already downloading this file for sharing, do you want to abort?'
  String get alreadyDownloadingThisFile =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingThisFile', {}) ??
      'Already downloading this file for sharing, do you want to abort?';

  /// en: 'Already downloading file for sharing, do you want to abort current file and share a new file?'
  String get alreadyDownloadingFile =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingFile', {}) ??
      'Already downloading file for sharing, do you want to abort current file and share a new file?';

  /// en: 'Current:'
  String get current => TranslationOverrides.string(_root.$meta, 'viewer.appBar.current', {}) ?? 'Current:';

  /// en: 'New:'
  String get kNew => TranslationOverrides.string(_root.$meta, 'viewer.appBar.kNew', {}) ?? 'New:';

  /// en: 'Share new'
  String get shareNew => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareNew', {}) ?? 'Share new';

  /// en: 'Abort'
  String get abort => TranslationOverrides.string(_root.$meta, 'viewer.appBar.abort', {}) ?? 'Abort';

  /// en: 'Error!'
  String get error => TranslationOverrides.string(_root.$meta, 'viewer.appBar.error', {}) ?? 'Error!';

  /// en: 'Something went wrong when saving the File before Sharing'
  String get savingFileError =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.savingFileError', {}) ?? 'Something went wrong when saving the File before Sharing';

  /// en: 'What you want to Share?'
  String get whatToShare => TranslationOverrides.string(_root.$meta, 'viewer.appBar.whatToShare', {}) ?? 'What you want to Share?';

  /// en: 'Post URL with tags'
  String get postURLWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURLWithTags', {}) ?? 'Post URL with tags';

  /// en: 'File URL with tags'
  String get fileURLWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURLWithTags', {}) ?? 'File URL with tags';

  /// en: 'File'
  String get file => TranslationOverrides.string(_root.$meta, 'viewer.appBar.file', {}) ?? 'File';

  /// en: 'File with tags'
  String get fileWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileWithTags', {}) ?? 'File with tags';

  /// en: 'Hydrus'
  String get hydrus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrus', {}) ?? 'Hydrus';

  /// en: 'Select tags'
  String get selectTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.selectTags', {}) ?? 'Select tags';
}

// Path: viewer.notes
class TranslationsViewerNotesEn {
  TranslationsViewerNotesEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Note'
  String get note => TranslationOverrides.string(_root.$meta, 'viewer.notes.note', {}) ?? 'Note';

  /// en: 'Notes'
  String get notes => TranslationOverrides.string(_root.$meta, 'viewer.notes.notes', {}) ?? 'Notes';

  /// en: 'X:${posX: int}, Y:${posY: int}'
  String coordinates({required int posX, required int posY}) =>
      TranslationOverrides.string(_root.$meta, 'viewer.notes.coordinates', {'posX': posX, 'posY': posY}) ?? 'X:${posX}, Y:${posY}';
}

// Path: media.loading
class TranslationsMediaLoadingEn {
  TranslationsMediaLoadingEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Rendering...'
  String get rendering => TranslationOverrides.string(_root.$meta, 'media.loading.rendering', {}) ?? 'Rendering...';

  /// en: 'Loading and rendering from cache...'
  String get loadingAndRenderingFromCache =>
      TranslationOverrides.string(_root.$meta, 'media.loading.loadingAndRenderingFromCache', {}) ?? 'Loading and rendering from cache...';

  /// en: 'Loading from cache...'
  String get loadingFromCache => TranslationOverrides.string(_root.$meta, 'media.loading.loadingFromCache', {}) ?? 'Loading from cache...';

  /// en: 'Buffering...'
  String get buffering => TranslationOverrides.string(_root.$meta, 'media.loading.buffering', {}) ?? 'Buffering...';

  /// en: 'Loading...'
  String get loading => TranslationOverrides.string(_root.$meta, 'media.loading.loading', {}) ?? 'Loading...';

  /// en: 'Load anyway'
  String get loadAnyway => TranslationOverrides.string(_root.$meta, 'media.loading.loadAnyway', {}) ?? 'Load anyway';

  /// en: 'Restart loading'
  String get restartLoading => TranslationOverrides.string(_root.$meta, 'media.loading.restartLoading', {}) ?? 'Restart loading';

  /// en: 'Stop loading'
  String get stopLoading => TranslationOverrides.string(_root.$meta, 'media.loading.stopLoading', {}) ?? 'Stop loading';

  /// en: 'Started ${seconds: int}s ago'
  String startedSecondsAgo({required int seconds}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.startedSecondsAgo', {'seconds': seconds}) ?? 'Started ${seconds}s ago';

  late final TranslationsMediaLoadingStopReasonsEn stopReasons = TranslationsMediaLoadingStopReasonsEn.internal(_root);

  /// en: 'File is zero bytes'
  String get fileIsZeroBytes => TranslationOverrides.string(_root.$meta, 'media.loading.fileIsZeroBytes', {}) ?? 'File is zero bytes';

  /// en: 'File size: ${size: String}'
  String fileSize({required String size}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.fileSize', {'size': size}) ?? 'File size: ${size}';

  /// en: 'Limit: ${limit: String}'
  String sizeLimit({required String limit}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.sizeLimit', {'limit': limit}) ?? 'Limit: ${limit}';

  /// en: 'Frequent playback issues? Try changing [Settings > Video > Video player backend]'
  String get tryChangingVideoBackend =>
      TranslationOverrides.string(_root.$meta, 'media.loading.tryChangingVideoBackend', {}) ??
      'Frequent playback issues? Try changing [Settings > Video > Video player backend]';
}

// Path: media.video
class TranslationsMediaVideoEn {
  TranslationsMediaVideoEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Videos disabled or not supported'
  String get videosDisabledOrNotSupported =>
      TranslationOverrides.string(_root.$meta, 'media.video.videosDisabledOrNotSupported', {}) ?? 'Videos disabled or not supported';

  /// en: 'Open video in external player'
  String get openVideoInExternalPlayer =>
      TranslationOverrides.string(_root.$meta, 'media.video.openVideoInExternalPlayer', {}) ?? 'Open video in external player';

  /// en: 'Open video in browser'
  String get openVideoInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openVideoInBrowser', {}) ?? 'Open video in browser';

  /// en: 'Failed to load item data'
  String get failedToLoadItemData => TranslationOverrides.string(_root.$meta, 'media.video.failedToLoadItemData', {}) ?? 'Failed to load item data';

  /// en: 'Loading item data...'
  String get loadingItemData => TranslationOverrides.string(_root.$meta, 'media.video.loadingItemData', {}) ?? 'Loading item data...';

  /// en: 'Retry'
  String get retry => TranslationOverrides.string(_root.$meta, 'media.video.retry', {}) ?? 'Retry';

  /// en: 'Open file in browser'
  String get openFileInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openFileInBrowser', {}) ?? 'Open file in browser';

  /// en: 'Open post in browser'
  String get openPostInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openPostInBrowser', {}) ?? 'Open post in browser';

  /// en: 'Currently checking:'
  String get currentlyChecking => TranslationOverrides.string(_root.$meta, 'media.video.currentlyChecking', {}) ?? 'Currently checking:';

  /// en: 'Unknown file format (.${fileExt: String}), tap here to open in browser'
  String unknownFileFormat({required String fileExt}) =>
      TranslationOverrides.string(_root.$meta, 'media.video.unknownFileFormat', {'fileExt': fileExt}) ??
      'Unknown file format (.${fileExt}), tap here to open in browser';
}

// Path: preview.error
class TranslationsPreviewErrorEn {
  TranslationsPreviewErrorEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'No results'
  String get noResults => TranslationOverrides.string(_root.$meta, 'preview.error.noResults', {}) ?? 'No results';

  /// en: 'Change search query or tap to retry'
  String get noResultsSubtitle =>
      TranslationOverrides.string(_root.$meta, 'preview.error.noResultsSubtitle', {}) ?? 'Change search query or tap to retry';

  /// en: 'You reached the end'
  String get reachedEnd => TranslationOverrides.string(_root.$meta, 'preview.error.reachedEnd', {}) ?? 'You reached the end';

  /// en: 'Loaded pages: ${pageNum: int} Tap here to reload last page'
  String reachedEndSubtitle({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.reachedEndSubtitle', {'pageNum': pageNum}) ??
      'Loaded pages: ${pageNum}\nTap here to reload last page';

  /// en: 'Loading page #${pageNum: int}...'
  String loadingPage({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.loadingPage', {'pageNum': pageNum}) ?? 'Loading page #${pageNum}...';

  /// en: '(one) {Started ${seconds} second ago} (few) {Started ${seconds} seconds ago} (many) {Started ${seconds} seconds ago} (other) {Started ${seconds} seconds ago}'
  String startedAgo({required num seconds}) =>
      TranslationOverrides.plural(_root.$meta, 'preview.error.startedAgo', {'seconds': seconds}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        seconds,
        one: 'Started ${seconds} second ago',
        few: 'Started ${seconds} seconds ago',
        many: 'Started ${seconds} seconds ago',
        other: 'Started ${seconds} seconds ago',
      );

  /// en: 'Tap to retry if request seems stuck or taking too long'
  String get tapToRetryIfStuck =>
      TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetryIfStuck', {}) ?? 'Tap to retry if request seems stuck or taking too long';

  /// en: 'Error when loading page #${pageNum: int}'
  String errorLoadingPage({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.errorLoadingPage', {'pageNum': pageNum}) ?? 'Error when loading page #${pageNum}';

  /// en: 'Tap here to retry'
  String get errorWithMessage => TranslationOverrides.string(_root.$meta, 'preview.error.errorWithMessage', {}) ?? 'Tap here to retry';

  /// en: 'Error, no results loaded'
  String get errorNoResultsLoaded => TranslationOverrides.string(_root.$meta, 'preview.error.errorNoResultsLoaded', {}) ?? 'Error, no results loaded';

  /// en: 'Tap here to retry'
  String get tapToRetry => TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetry', {}) ?? 'Tap here to retry';
}

// Path: settings.interface.previewQualityValues
class TranslationsSettingsInterfacePreviewQualityValuesEn {
  TranslationsSettingsInterfacePreviewQualityValuesEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Thumbnail'
  String get thumbnail => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.thumbnail', {}) ?? 'Thumbnail';

  /// en: 'Sample'
  String get sample => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.sample', {}) ?? 'Sample';
}

// Path: settings.interface.previewDisplayModeValues
class TranslationsSettingsInterfacePreviewDisplayModeValuesEn {
  TranslationsSettingsInterfacePreviewDisplayModeValuesEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Square'
  String get square => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.square', {}) ?? 'Square';

  /// en: 'Rectangle'
  String get rectangle => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.rectangle', {}) ?? 'Rectangle';

  /// en: 'Staggered'
  String get staggered => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.staggered', {}) ?? 'Staggered';
}

// Path: settings.interface.appModeValues
class TranslationsSettingsInterfaceAppModeValuesEn {
  TranslationsSettingsInterfaceAppModeValuesEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Desktop'
  String get desktop => TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.desktop', {}) ?? 'Desktop';

  /// en: 'Mobile'
  String get mobile => TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.mobile', {}) ?? 'Mobile';
}

// Path: settings.interface.handSideValues
class TranslationsSettingsInterfaceHandSideValuesEn {
  TranslationsSettingsInterfaceHandSideValuesEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Left'
  String get left => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.left', {}) ?? 'Left';

  /// en: 'Right'
  String get right => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.right', {}) ?? 'Right';
}

// Path: settings.viewer.imageQualityValues
class TranslationsSettingsViewerImageQualityValuesEn {
  TranslationsSettingsViewerImageQualityValuesEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Sample'
  String get sample => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.sample', {}) ?? 'Sample';

  /// en: 'Original'
  String get fullRes => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.fullRes', {}) ?? 'Original';
}

// Path: settings.viewer.scrollDirectionValues
class TranslationsSettingsViewerScrollDirectionValuesEn {
  TranslationsSettingsViewerScrollDirectionValuesEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Horizontal'
  String get horizontal => TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.horizontal', {}) ?? 'Horizontal';

  /// en: 'Vertical'
  String get vertical => TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.vertical', {}) ?? 'Vertical';
}

// Path: settings.viewer.toolbarPositionValues
class TranslationsSettingsViewerToolbarPositionValuesEn {
  TranslationsSettingsViewerToolbarPositionValuesEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Top'
  String get top => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.top', {}) ?? 'Top';

  /// en: 'Bottom'
  String get bottom => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.bottom', {}) ?? 'Bottom';
}

// Path: settings.viewer.buttonPositionValues
class TranslationsSettingsViewerButtonPositionValuesEn {
  TranslationsSettingsViewerButtonPositionValuesEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Disabled'
  String get disabled => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.disabled', {}) ?? 'Disabled';

  /// en: 'Left'
  String get left => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.left', {}) ?? 'Left';

  /// en: 'Right'
  String get right => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.right', {}) ?? 'Right';
}

// Path: settings.viewer.shareActionValues
class TranslationsSettingsViewerShareActionValuesEn {
  TranslationsSettingsViewerShareActionValuesEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Ask'
  String get ask => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.ask', {}) ?? 'Ask';

  /// en: 'Post URL'
  String get postUrl => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrl', {}) ?? 'Post URL';

  /// en: 'Post URL with tags'
  String get postUrlWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrlWithTags', {}) ?? 'Post URL with tags';

  /// en: 'File URL'
  String get fileUrl => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrl', {}) ?? 'File URL';

  /// en: 'File URL with tags'
  String get fileUrlWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrlWithTags', {}) ?? 'File URL with tags';

  /// en: 'File'
  String get file => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.file', {}) ?? 'File';

  /// en: 'File with tags'
  String get fileWithTags => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileWithTags', {}) ?? 'File with tags';

  /// en: 'Hydrus'
  String get hydrus => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.hydrus', {}) ?? 'Hydrus';
}

// Path: settings.video.cacheModes
class TranslationsSettingsVideoCacheModesEn {
  TranslationsSettingsVideoCacheModesEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Video cache modes'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.title', {}) ?? 'Video cache modes';

  /// en: '- Stream - Don't cache, start playing as soon as possible'
  String get streamMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamMode', {}) ??
      '- Stream - Don\'t cache, start playing as soon as possible';

  /// en: '- Cache - Saves the file to device storage, plays only when download is complete'
  String get cacheMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheMode', {}) ??
      '- Cache - Saves the file to device storage, plays only when download is complete';

  /// en: '- Stream+Cache - Mix of both, but currently leads to double download'
  String get streamCacheMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamCacheMode', {}) ??
      '- Stream+Cache - Mix of both, but currently leads to double download';

  /// en: '[Note]: Videos will cache only if 'Cache Media' is enabled.'
  String get cacheNote =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheNote', {}) ??
      '[Note]: Videos will cache only if \'Cache Media\' is enabled.';

  /// en: '[Warning]: On desktop Stream mode can work incorrectly for some Boorus.'
  String get desktopWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.desktopWarning', {}) ??
      '[Warning]: On desktop Stream mode can work incorrectly for some Boorus.';
}

// Path: settings.video.cacheModeValues
class TranslationsSettingsVideoCacheModeValuesEn {
  TranslationsSettingsVideoCacheModeValuesEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Stream'
  String get stream => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.stream', {}) ?? 'Stream';

  /// en: 'Cache'
  String get cache => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.cache', {}) ?? 'Cache';

  /// en: 'Stream+Cache'
  String get streamCache => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.streamCache', {}) ?? 'Stream+Cache';
}

// Path: settings.video.videoBackendModeValues
class TranslationsSettingsVideoVideoBackendModeValuesEn {
  TranslationsSettingsVideoVideoBackendModeValuesEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Default'
  String get normal => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.normal', {}) ?? 'Default';

  /// en: 'MPV'
  String get mpv => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mpv', {}) ?? 'MPV';

  /// en: 'MDK'
  String get mdk => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mdk', {}) ?? 'MDK';
}

// Path: media.loading.stopReasons
class TranslationsMediaLoadingStopReasonsEn {
  TranslationsMediaLoadingStopReasonsEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Stopped by user'
  String get stoppedByUser => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.stoppedByUser', {}) ?? 'Stopped by user';

  /// en: 'Loading error'
  String get loadingError => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.loadingError', {}) ?? 'Loading error';

  /// en: 'File is too big'
  String get fileIsTooBig => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.fileIsTooBig', {}) ?? 'File is too big';

  /// en: 'Hidden by filters:'
  String get hiddenByFilters => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.hiddenByFilters', {}) ?? 'Hidden by filters:';

  /// en: 'Video error'
  String get videoError => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.videoError', {}) ?? 'Video error';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
          'locale' => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'en',
          'localeName' => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'English',
          'appName' => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher',
          'error' => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Error',
          'errorExclamation' => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'Error!',
          'success' => TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Success',
          'successExclamation' => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? 'Success!',
          'cancel' => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Cancel',
          'later' => TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Later',
          'close' => TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Close',
          'ok' => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'OK',
          'yes' => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Yes',
          'no' => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'No',
          'pleaseWait' => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Please wait...',
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
          'thisMayTakeSomeTime' => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'This may take some time...',
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
          'init.settingUpProxy' => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Setting up proxy...',
          'init.loadingDatabase' => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Loading database...',
          'init.loadingBoorus' => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Loading boorus...',
          'init.loadingTags' => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Loading tags...',
          'init.restoringTabs' => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Restoring tabs...',
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
                TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ?? 'Something went wrong: ${error}',
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
            TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? 'Starting next queue item...',
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
            TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Select secondary boorus:',
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
          'tabs.filterTabsByBooru' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? 'Filter by booru, state, duplicates...',
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
          'settings.booru.dropdown' => TranslationOverrides.string(_root.$meta, 'settings.booru.dropdown', {}) ?? 'Booru',
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
            TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ?? 'Only loli.snatcher URLs are supported!',
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
                'Config parameters may be incorrect, booru doesn\'t allow api access, request didn\'t return any data or there was a network error.',
          'settings.booruEditor.saveBooru' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Save Booru',
          'settings.booruEditor.runningTest' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? 'Running test...',
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
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ?? 'Failed to verify api access for Hydrus',
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
                'To get the Hydrus key you need to open the request dialog in the Hydrus client. Services > Review services > Client api > Add > From API request',
          'settings.booruEditor.getHydrusApiKey' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? 'Get Hydrus API key',
          'settings.booruEditor.booruName' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? 'Booru Name',
          'settings.booruEditor.booruNameRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? 'Booru Name is required!',
          'settings.booruEditor.booruUrl' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? 'Booru URL',
          'settings.booruEditor.booruUrlRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? 'Booru URL is required!',
          'settings.booruEditor.booruType' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruType', {}) ?? 'Booru Type',
          'settings.booruEditor.booruTypeIs' =>
            ({required String booruType}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruTypeIs', {'booruType': booruType}) ??
                'Booru Type is ${booruType}',
          'settings.booruEditor.booruFavicon' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? 'Favicon URL',
          'settings.booruEditor.booruFaviconPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '(Autofills if blank)',
          'settings.booruEditor.booruApiCredsInfo' =>
            ({required String userIdTitle, required String apiKeyTitle}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruApiCredsInfo', {
                  'userIdTitle': userIdTitle,
                  'apiKeyTitle': apiKeyTitle,
                }) ??
                '${userIdTitle} and ${apiKeyTitle} may be needed with some boorus but in most cases aren\'t necessary.',
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
          'settings.viewer.kannaLoadingGif' => TranslationOverrides.string(_root.$meta, 'settings.viewer.kannaLoadingGif', {}) ?? 'Kanna loading Gif',
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
          'settings.video.longTapToFastForwardVideo' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.longTapToFastForwardVideo', {}) ?? 'Long tap to fast forward video',
          'settings.video.longTapToFastForwardVideoHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.longTapToFastForwardVideoHelp', {}) ??
                'When this is enabled toolbar can be hidden with the tap when video controls are visible. [Experimental] May become default behavior in the future.',
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
          _ => null,
        } ??
        switch (path) {
          'settings.video.cacheModes.desktopWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.desktopWarning', {}) ??
                '[Warning]: On desktop Stream mode can work incorrectly for some Boorus.',
          'settings.video.cacheModeValues.stream' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.stream', {}) ?? 'Stream',
          'settings.video.cacheModeValues.cache' => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.cache', {}) ?? 'Cache',
          'settings.video.cacheModeValues.streamCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.streamCache', {}) ?? 'Stream+Cache',
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
          'settings.downloads.updatingData' => TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? 'Updating data...',
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
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryTapInfo', {}) ?? 'Tap entry for actions (Delete, Favourite...)',
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
            TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgent', {}) ?? 'Custom user agent',
          'settings.network.customUserAgentTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgentTitle', {}) ?? 'Custom user agent',
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
                'Tap here to set suggested browser user agent (recommended only when sites you use ban non-browser user agents):',
          'settings.network.cookieCleaner' => TranslationOverrides.string(_root.$meta, 'settings.network.cookieCleaner', {}) ?? 'Cookie cleaner',
          'settings.network.booru' => TranslationOverrides.string(_root.$meta, 'settings.network.booru', {}) ?? 'Booru',
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
          'settings.network.noConnection' => TranslationOverrides.string(_root.$meta, 'settings.network.noConnection', {}) ?? 'No connection',
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
                '- Disables resource-intensive elements (blurs, animated opacity, some animations...)',
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
          'settings.cache.loading' => TranslationOverrides.string(_root.$meta, 'settings.cache.loading', {}) ?? 'Loading...',
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
          'settings.sync.syncFavsFrom' => TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFrom', {}) ?? 'Sync favs from #...',
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
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFrom', {}) ?? 'Sync snatched from #...',
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
          'settings.debug.vibration' => TranslationOverrides.string(_root.$meta, 'settings.debug.vibration', {}) ?? 'Vibration',
          'settings.debug.vibrationTests' => TranslationOverrides.string(_root.$meta, 'settings.debug.vibrationTests', {}) ?? 'Vibration tests',
          'settings.debug.duration' => TranslationOverrides.string(_root.$meta, 'settings.debug.duration', {}) ?? 'Duration',
          'settings.debug.amplitude' => TranslationOverrides.string(_root.$meta, 'settings.debug.amplitude', {}) ?? 'Amplitude',
          'settings.debug.flutterway' => TranslationOverrides.string(_root.$meta, 'settings.debug.flutterway', {}) ?? 'Flutterway',
          'settings.debug.vibrate' => TranslationOverrides.string(_root.$meta, 'settings.debug.vibrate', {}) ?? 'Vibrate',
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
            TranslationOverrides.string(_root.$meta, 'loliSync.waitingForConnection', {}) ?? 'Waiting for connection...',
          'loliSync.startingServer' => TranslationOverrides.string(_root.$meta, 'loliSync.startingServer', {}) ?? 'Starting server...',
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
          'tagView.copiedSelected' =>
            ({required String type}) =>
                TranslationOverrides.string(_root.$meta, 'tagView.copiedSelected', {'type': type}) ?? 'Copied ${type} to clipboard',
          'tagView.selectedText' => TranslationOverrides.string(_root.$meta, 'tagView.selectedText', {}) ?? 'selected text',
          'tagView.source' => TranslationOverrides.string(_root.$meta, 'tagView.source', {}) ?? 'source',
          'tagView.sourceDialogTitle' => TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogTitle', {}) ?? 'Source',
          'tagView.sourceDialogText1' =>
            TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogText1', {}) ??
                'The text in source field can\'t be opened as a link, either because it\'s not a link or there are multiple URLs in a single string.',
          'tagView.sourceDialogText2' =>
            TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogText2', {}) ??
                'You can select any text below by long tapping it and then press «Open selected» to try opening it as a link:',
          'tagView.noTextSelected' => TranslationOverrides.string(_root.$meta, 'tagView.noTextSelected', {}) ?? '[No text selected]',
          'tagView.copySelected' =>
            ({required String type}) => TranslationOverrides.string(_root.$meta, 'tagView.copySelected', {'type': type}) ?? 'Copy ${type}',
          'tagView.selected' => TranslationOverrides.string(_root.$meta, 'tagView.selected', {}) ?? 'selected',
          'tagView.all' => TranslationOverrides.string(_root.$meta, 'tagView.all', {}) ?? 'all',
          'tagView.openSelected' =>
            ({required String type}) => TranslationOverrides.string(_root.$meta, 'tagView.openSelected', {'type': type}) ?? 'Open ${type}',
          'tagView.preview' => TranslationOverrides.string(_root.$meta, 'tagView.preview', {}) ?? 'Preview',
          'tagView.booru' => TranslationOverrides.string(_root.$meta, 'tagView.booru', {}) ?? 'Booru',
          'tagView.selectBooruToLoad' => TranslationOverrides.string(_root.$meta, 'tagView.selectBooruToLoad', {}) ?? 'Select a booru to load',
          'tagView.previewIsLoading' => TranslationOverrides.string(_root.$meta, 'tagView.previewIsLoading', {}) ?? 'Preview is loading...',
          'tagView.failedToLoadPreview' => TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreview', {}) ?? 'Failed to load preview',
          'tagView.tapToTryAgain' => TranslationOverrides.string(_root.$meta, 'tagView.tapToTryAgain', {}) ?? 'Tap to try again',
          'tagView.copiedFileURL' => TranslationOverrides.string(_root.$meta, 'tagView.copiedFileURL', {}) ?? 'Copied file URL to clipboard',
          'tagView.tagPreviews' => TranslationOverrides.string(_root.$meta, 'tagView.tagPreviews', {}) ?? 'Tag previews',
          'tagView.currentState' => TranslationOverrides.string(_root.$meta, 'tagView.currentState', {}) ?? 'Current state',
          'tagView.history' => TranslationOverrides.string(_root.$meta, 'tagView.history', {}) ?? 'History',
          'tagView.failedToLoadPreviewPage' =>
            TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreviewPage', {}) ?? 'Failed to load preview page',
          'tagView.tryAgain' => TranslationOverrides.string(_root.$meta, 'tagView.tryAgain', {}) ?? 'Try again',
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
          'pinnedTags.typeAndEnterToAdd' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.typeAndEnterToAdd', {}) ?? 'Type and press Send to add',
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
          'pinnedTags.saving' => TranslationOverrides.string(_root.$meta, 'pinnedTags.saving', {}) ?? 'Saving...',
          'pinnedTags.searchPinnedTags' => TranslationOverrides.string(_root.$meta, 'pinnedTags.searchPinnedTags', {}) ?? 'Search pinned tags...',
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
          'searchBar.more' => TranslationOverrides.string(_root.$meta, 'searchBar.more', {}) ?? '...',
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
          _ => null,
        } ??
        switch (path) {
          'galleryView.close' => TranslationOverrides.string(_root.$meta, 'galleryView.close', {}) ?? 'Close',
          'mediaPreviews.noBooruConfigsFound' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.noBooruConfigsFound', {}) ?? 'No booru configs found',
          'mediaPreviews.addNewBooru' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? 'Add new Booru',
          'mediaPreviews.help' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.help', {}) ?? 'Help',
          'mediaPreviews.settings' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.settings', {}) ?? 'Settings',
          'mediaPreviews.restoringPreviousSession' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoringPreviousSession', {}) ?? 'Restoring previous session...',
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
          'gallery.loadingFile' => TranslationOverrides.string(_root.$meta, 'gallery.loadingFile', {}) ?? 'Loading file...',
          'gallery.loadingFileMessage' =>
            TranslationOverrides.string(_root.$meta, 'gallery.loadingFileMessage', {}) ?? 'This can take some time, please wait...',
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
          'media.loading.rendering' => TranslationOverrides.string(_root.$meta, 'media.loading.rendering', {}) ?? 'Rendering...',
          'media.loading.loadingAndRenderingFromCache' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.loadingAndRenderingFromCache', {}) ?? 'Loading and rendering from cache...',
          'media.loading.loadingFromCache' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.loadingFromCache', {}) ?? 'Loading from cache...',
          'media.loading.buffering' => TranslationOverrides.string(_root.$meta, 'media.loading.buffering', {}) ?? 'Buffering...',
          'media.loading.loading' => TranslationOverrides.string(_root.$meta, 'media.loading.loading', {}) ?? 'Loading...',
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
          'media.video.loadingItemData' => TranslationOverrides.string(_root.$meta, 'media.video.loadingItemData', {}) ?? 'Loading item data...',
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
                TranslationOverrides.string(_root.$meta, 'preview.error.loadingPage', {'pageNum': pageNum}) ?? 'Loading page #${pageNum}...',
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
