///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'package:slang/overrides.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsDev extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  /// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
  TranslationsDev({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.dev,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
    super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <dev>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsDev _root = this; // ignore: unused_field

  @override
  TranslationsDev $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsDev(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'dev';
  @override
  String get localeName => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'Dev';
  @override
  String get appName => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? '{LoliSnatcher}';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'error', {}) ?? '{Error}';
  @override
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? '{Error!}';
  @override
  String get warning => TranslationOverrides.string(_root.$meta, 'warning', {}) ?? '{Warning}';
  @override
  String get warningExclamation => TranslationOverrides.string(_root.$meta, 'warningExclamation', {}) ?? '{Warning!}';
  @override
  String get info => TranslationOverrides.string(_root.$meta, 'info', {}) ?? '{Info}';
  @override
  String get success => TranslationOverrides.string(_root.$meta, 'success', {}) ?? '{Success}';
  @override
  String get successExclamation => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? '{Success!}';
  @override
  String get cancel => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? '{Cancel}';
  @override
  String get later => TranslationOverrides.string(_root.$meta, 'later', {}) ?? '{Later}';
  @override
  String get close => TranslationOverrides.string(_root.$meta, 'close', {}) ?? '{Close}';
  @override
  String get ok => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? '{OK}';
  @override
  String get yes => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? '{Yes}';
  @override
  String get no => TranslationOverrides.string(_root.$meta, 'no', {}) ?? '{No}';
  @override
  String get pleaseWait => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? '{Please wait...}';
  @override
  String get show => TranslationOverrides.string(_root.$meta, 'show', {}) ?? '{Show}';
  @override
  String get hide => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? '{Hide}';
  @override
  String get enable => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? '{Enable}';
  @override
  String get disable => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? '{Disable}';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'add', {}) ?? '{Add}';
  @override
  String get edit => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? '{Edit}';
  @override
  String get remove => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? '{Remove}';
  @override
  String get save => TranslationOverrides.string(_root.$meta, 'save', {}) ?? '{Save}';
  @override
  String get delete => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? '{Delete}';
  @override
  String get confirm => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? '{Confirm}';
  @override
  String get retry => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? '{Retry}';
  @override
  String get clear => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? '{Clear}';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? '{Copy}';
  @override
  String get copied => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? '{Copied}';
  @override
  String get copiedToClipboard => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? '{Copied to clipboard}';
  @override
  String get nothingFound => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? '{Nothing found}';
  @override
  String get paste => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? '{Paste}';
  @override
  String get copyErrorText => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? '{Copy error}';
  @override
  String get booru => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? '{Booru}';
  @override
  String get goToSettings => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? '{Go to settings}';
  @override
  String get areYouSure => TranslationOverrides.string(_root.$meta, 'areYouSure', {}) ?? '{Are you sure?}';
  @override
  String get thisMayTakeSomeTime => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? '{This may take some time...}';
  @override
  String get doYouWantToExitApp => TranslationOverrides.string(_root.$meta, 'doYouWantToExitApp', {}) ?? '{Do you want to exit the app?}';
  @override
  String get closeTheApp => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? '{Close the app}';
  @override
  String get invalidUrl => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? '{Invalid URL!}';
  @override
  String get clipboardIsEmpty => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? '{Clipboard is empty!}';
  @override
  String get failedToOpenLink => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? '{Failed to open link}';
  @override
  String get apiKey => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? '{API Key}';
  @override
  String get userId => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? '{User ID}';
  @override
  String get login => TranslationOverrides.string(_root.$meta, 'login', {}) ?? '{Login}';
  @override
  String get password => TranslationOverrides.string(_root.$meta, 'password', {}) ?? '{Password}';
  @override
  String get pause => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? '{Pause}';
  @override
  String get resume => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? '{Resume}';
  @override
  String get discord => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? '{Discord}';
  @override
  String get visitOurDiscord => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? '{Visit our Discord server}';
  @override
  String get item => TranslationOverrides.string(_root.$meta, 'item', {}) ?? '{Item}';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'select', {}) ?? '{Select}';
  @override
  String get selectAll => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? '{Select all}';
  @override
  String get reset => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? '{Reset}';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'open', {}) ?? '{Open}';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? '{Open in new tab}';
  @override
  String get move => TranslationOverrides.string(_root.$meta, 'move', {}) ?? '{Move}';
  @override
  String get shuffle => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? '{Shuffle}';
  @override
  String get sort => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? '{Sort}';
  @override
  String get sortTabs => TranslationOverrides.string(_root.$meta, 'sortTabs', {}) ?? '{Sort tabs}';
  @override
  String get go => TranslationOverrides.string(_root.$meta, 'go', {}) ?? '{Go}';
  @override
  String get jump => TranslationOverrides.string(_root.$meta, 'jump', {}) ?? '{Jump}';
  @override
  String get jumpToPage => TranslationOverrides.string(_root.$meta, 'jumpToPage', {}) ?? '{Jump to page}';
  @override
  String get searchUntilPage => TranslationOverrides.string(_root.$meta, 'searchUntilPage', {}) ?? '{Search until page}';
  @override
  String get stopSearching => TranslationOverrides.string(_root.$meta, 'stopSearching', {}) ?? '{Stop searching}';
  @override
  String get search => TranslationOverrides.string(_root.$meta, 'search', {}) ?? '{Search}';
  @override
  String get filter => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? '{Filter}';
  @override
  String get or => TranslationOverrides.string(_root.$meta, 'or', {}) ?? '{Or (~)}';
  @override
  String get page => TranslationOverrides.string(_root.$meta, 'page', {}) ?? '{Page}';
  @override
  String get pageNumber => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? '{Page #}';
  @override
  String get tags => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? '{Tags}';
  @override
  String get type => TranslationOverrides.string(_root.$meta, 'type', {}) ?? '{Type}';
  @override
  String get name => TranslationOverrides.string(_root.$meta, 'name', {}) ?? '{Name}';
  @override
  String get address => TranslationOverrides.string(_root.$meta, 'address', {}) ?? '{Address}';
  @override
  String get username => TranslationOverrides.string(_root.$meta, 'username', {}) ?? '{Username}';
  @override
  late final _TranslationsValidationErrorsDev validationErrors = _TranslationsValidationErrorsDev._(_root);
  @override
  late final _TranslationsInitDev init = _TranslationsInitDev._(_root);
  @override
  late final _TranslationsPermissionsDev permissions = _TranslationsPermissionsDev._(_root);
  @override
  late final _TranslationsAuthenticationDev authentication = _TranslationsAuthenticationDev._(_root);
  @override
  late final _TranslationsSearchHandlerDev searchHandler = _TranslationsSearchHandlerDev._(_root);
  @override
  late final _TranslationsSnatcherDev snatcher = _TranslationsSnatcherDev._(_root);
  @override
  late final _TranslationsMultibooruDev multibooru = _TranslationsMultibooruDev._(_root);
  @override
  late final _TranslationsHydrusDev hydrus = _TranslationsHydrusDev._(_root);
  @override
  late final _TranslationsTabsDev tabs = _TranslationsTabsDev._(_root);
  @override
  late final _TranslationsDialogsDev dialogs = _TranslationsDialogsDev._(_root);
  @override
  late final _TranslationsHistoryDev history = _TranslationsHistoryDev._(_root);
  @override
  late final _TranslationsWebviewDev webview = _TranslationsWebviewDev._(_root);
  @override
  late final _TranslationsSettingsDev settings = _TranslationsSettingsDev._(_root);
  @override
  late final _TranslationsCommentsDev comments = _TranslationsCommentsDev._(_root);
  @override
  late final _TranslationsPageChangerDev pageChanger = _TranslationsPageChangerDev._(_root);
  @override
  late final _TranslationsTagsFiltersDialogsDev tagsFiltersDialogs = _TranslationsTagsFiltersDialogsDev._(_root);
  @override
  late final _TranslationsTagsManagerDev tagsManager = _TranslationsTagsManagerDev._(_root);
  @override
  late final _TranslationsLockscreenDev lockscreen = _TranslationsLockscreenDev._(_root);
  @override
  late final _TranslationsLoliSyncDev loliSync = _TranslationsLoliSyncDev._(_root);
  @override
  late final _TranslationsImageSearchDev imageSearch = _TranslationsImageSearchDev._(_root);
  @override
  late final _TranslationsTagViewDev tagView = _TranslationsTagViewDev._(_root);
  @override
  late final _TranslationsSearchBarDev searchBar = _TranslationsSearchBarDev._(_root);
  @override
  late final _TranslationsMobileHomeDev mobileHome = _TranslationsMobileHomeDev._(_root);
  @override
  late final _TranslationsDesktopHomeDev desktopHome = _TranslationsDesktopHomeDev._(_root);
  @override
  late final _TranslationsGalleryViewDev galleryView = _TranslationsGalleryViewDev._(_root);
  @override
  late final _TranslationsMediaPreviewsDev mediaPreviews = _TranslationsMediaPreviewsDev._(_root);
  @override
  late final _TranslationsViewerDev viewer = _TranslationsViewerDev._(_root);
  @override
  late final _TranslationsCommonDev common = _TranslationsCommonDev._(_root);
  @override
  late final _TranslationsGalleryDev gallery = _TranslationsGalleryDev._(_root);
  @override
  late final _TranslationsMediaDev media = _TranslationsMediaDev._(_root);
  @override
  late final _TranslationsImageStatsDev imageStats = _TranslationsImageStatsDev._(_root);
  @override
  late final _TranslationsPreviewDev preview = _TranslationsPreviewDev._(_root);
}

// Path: validationErrors
class _TranslationsValidationErrorsDev extends TranslationsValidationErrorsEn {
  _TranslationsValidationErrorsDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get required => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? '{Please enter a value}';
  @override
  String get invalid => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? '{Please enter a valid value}';
  @override
  String get invalidNumber => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? '{Please enter a number}';
  @override
  String get invalidNumericValue =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? '{Please enter a valid numeric value}';
  @override
  String tooSmall({required double min}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? '{Please enter a value bigger than ${min}}';
  @override
  String tooBig({required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? '{Please enter a value smaller than ${max}}';
  @override
  String rangeError({required double min, required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ??
      '{Please enter a value between ${min} and ${max}}';
  @override
  String get greaterThanOrEqualZero =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? '{Please enter a value equal to or greater than 0}';
  @override
  String get lessThan4 => TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? '{Please enter a value less than 4}';
  @override
  String get biggerThan100 =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? '{Please enter a value bigger than 100}';
  @override
  String get validTabNumber => TranslationOverrides.string(_root.$meta, 'validationErrors.validTabNumber', {}) ?? '{Please enter a valid tab number}';
  @override
  String get moreThan4ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ??
      '{Using more than 4 columns can affect performance}';
  @override
  String get moreThan8ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ??
      '{Using more than 8 columns can affect performance}';
}

// Path: init
class _TranslationsInitDev extends TranslationsInitEn {
  _TranslationsInitDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get initError => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? '{Initialization error!}';
  @override
  String get postInitError => TranslationOverrides.string(_root.$meta, 'init.postInitError', {}) ?? '{Post initialization error!}';
  @override
  String get settingUpProxy => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? '{Setting up proxy...}';
  @override
  String get loadingDatabase => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? '{Loading database...}';
  @override
  String get loadingBoorus => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? '{Loading boorus...}';
  @override
  String get loadingTags => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? '{Loading tags...}';
  @override
  String get restoringTabs => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? '{Restoring tabs...}';
}

// Path: permissions
class _TranslationsPermissionsDev extends TranslationsPermissionsEn {
  _TranslationsPermissionsDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get noAccessToCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ?? '{No access to custom storage directory}';
  @override
  String get pleaseSetStorageDirectoryAgain =>
      TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ??
      '{Please set storage directory again to grant the app access to it}';
  @override
  String currentPath({required String path}) =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? '{Current path: ${path}}';
  @override
  String get setDirectory => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? '{Set directory}';
  @override
  String get currentlyNotAvailableForThisPlatform =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ??
      '{Currently not available for this platform}';
  @override
  String get resetDirectory => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? '{Reset directory}';
  @override
  String get afterResetFilesWillBeSavedToDefaultDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ??
      '{After reset files will be saved to default system directory}';
}

// Path: authentication
class _TranslationsAuthenticationDev extends TranslationsAuthenticationEn {
  _TranslationsAuthenticationDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get pleaseAuthenticateToUseTheApp =>
      TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ?? '{Please authenticate to use the app}';
  @override
  String get noBiometricHardwareAvailable =>
      TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? '{No biometric hardware available}';
  @override
  String get temporaryLockout => TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? '{Temporary lockout}';
  @override
  String somethingWentWrong({required String error}) =>
      TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ?? '{Something went wrong: ${error}}';
}

// Path: searchHandler
class _TranslationsSearchHandlerDev extends TranslationsSearchHandlerEn {
  _TranslationsSearchHandlerDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get removedLastTab => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? '{Removed last tab}';
  @override
  String get resettingSearchToDefaultTags =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? '{Resetting search to default tags}';
  @override
  String get uoh => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? '{UOOOOOOOHHH}';
  @override
  String get ratingsChanged => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? '{Ratings changed}';
  @override
  String ratingsChangedMessage({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
      '{On ${booruType} [rating:safe] is now replaced with [rating:general] and [rating:sensitive]}';
  @override
  String get appFixedRatingAutomatically =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ??
      '{App fixed the rating automatically, but consider changing to correct rating in your future queries}';
  @override
  String get tabsRestored => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? '{Tabs restored}';
  @override
  String restoredTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
        count,
        one: '{Restored 1 tab from previous session}',
        other: '{Restored ${count} tabs from previous session}',
      );
  @override
  String get someRestoredTabsHadIssues =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ??
      '{Some restored tabs had unknown boorus or broken characters.}';
  @override
  String get theyWereSetToDefaultOrIgnored =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ?? '{They were set to default or ignored.}';
  @override
  String get listOfBrokenTabs => TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? '{List of broken tabs:}';
  @override
  String get tabsMerged => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? '{Tabs merged}';
  @override
  String addedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
        count,
        one: '{Added 1 new tab}',
        other: '{Added ${count} new tabs}',
      );
  @override
  String get tabsReplaced => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? '{Tabs replaced}';
  @override
  String receivedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
        count,
        one: '{Received 1 tab}',
        other: '{Received ${count} tabs}',
      );
}

// Path: snatcher
class _TranslationsSnatcherDev extends TranslationsSnatcherEn {
  _TranslationsSnatcherDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? '{Snatcher}';
  @override
  String get snatchingHistory => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? '{Snatching history}';
  @override
  String get enterTags => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? '{Enter tags}';
  @override
  String get amount => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? '{Amount}';
  @override
  String get amountOfFilesToSnatch => TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? '{Amount of Files to Snatch}';
  @override
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? '{Delay (in ms)}';
  @override
  String get delayBetweenEachDownload =>
      TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? '{Delay between each download}';
  @override
  String get snatchFiles => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? '{Snatch files}';
  @override
  String get itemWasAlreadySnatched =>
      TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? '{Item was already snatched before}';
  @override
  String get failedToSnatchItem => TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? '{Failed to snatch the item}';
  @override
  String get itemWasCancelled => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? '{Item was cancelled}';
  @override
  String get startingNextQueueItem =>
      TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? '{Starting next queue item...}';
  @override
  String get itemsSnatched => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? '{Items snatched}';
  @override
  String snatchedCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
        count,
        one: '{Snatched: 1 item}',
        other: '{Snatched: ${count} items}',
      );
  @override
  String filesAlreadySnatched({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
        count,
        one: '{1 file was already snatched}',
        other: '{${count} files were already snatched}',
      );
  @override
  String failedToSnatchFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
        count,
        one: '{Failed to snatch 1 file}',
        other: '{Failed to snatch ${count} files}',
      );
  @override
  String cancelledFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
        count,
        one: '{Cancelled 1 file}',
        other: '{Cancelled ${count} files}',
      );
  @override
  String get snatchingImages => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? '{Snatching images}';
  @override
  String get doNotCloseApp => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? '{Do not close the app!}';
  @override
  String get addedItemToQueue => TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? '{Added item to snatch queue}';
  @override
  String addedItemsToQueue({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
        count,
        one: '{Added 1 item to snatch queue}',
        other: '{Added ${count} items to snatch queue}',
      );
}

// Path: multibooru
class _TranslationsMultibooruDev extends TranslationsMultibooruEn {
  _TranslationsMultibooruDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? '{Multibooru}';
  @override
  String get multibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? '{Multibooru mode}';
  @override
  String get multibooruRequiresAtLeastTwoBoorus =>
      TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ??
      '{Multibooru mode requires at least 2 boorus to be configured}';
  @override
  String get selectSecondaryBoorus =>
      TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? '{Select secondary boorus:}';
  @override
  String get akaMultibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? '{aka Multibooru mode}';
  @override
  String get labelSecondaryBoorusToInclude =>
      TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? '{Secondary boorus to include}';
}

// Path: hydrus
class _TranslationsHydrusDev extends TranslationsHydrusEn {
  _TranslationsHydrusDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get importError => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? '{Something went wrong importing to hydrus}';
  @override
  String get apiPermissionsRequired =>
      TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ??
      '{You might not have given the correct API permissions, this can be edited in Review Services}';
  @override
  String get addTagsToFile => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? '{Add tags to file}';
  @override
  String get addUrls => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? '{Add URLs}';
}

// Path: tabs
class _TranslationsTabsDev extends TranslationsTabsEn {
  _TranslationsTabsDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get tab => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? '{Tab}';
  @override
  String get addBoorusInSettings => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? '{Add boorus in settings}';
  @override
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? '{Select a Booru}';
  @override
  String get secondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? '{Secondary boorus}';
  @override
  String get addNewTab => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? '{Add new tab}';
  @override
  String get selectABooruOrLeaveEmpty =>
      TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? '{Select a booru or leave empty}';
  @override
  String get addPosition => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? '{Add position:}';
  @override
  String get addModePrevTab => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? '{Prev tab}';
  @override
  String get addModeNextTab => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? '{Next tab}';
  @override
  String get addModeListEnd => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? '{List end}';
  @override
  String get usedQuery => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? '{Used query:}';
  @override
  String get queryModeDefault => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? '{Default}';
  @override
  String get queryModeCurrent => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? '{Current}';
  @override
  String get queryModeCustom => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? '{Custom}';
  @override
  String get customQuery => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? '{Custom query}';
  @override
  String get empty => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '{[empty]}';
  @override
  String get addSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? '{Add secondary boorus}';
  @override
  String get keepSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? '{Keep secondary boorus}';
  @override
  String get startFromCustomPageNumber =>
      TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? '{Start from custom page number}';
  @override
  String get switchToNewTab => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? '{Switch to new tab}';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? '{Add}';
  @override
  String get tabsManager => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? '{Tabs Manager}';
  @override
  String get selectMode => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? '{Select mode}';
  @override
  String get sortMode => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? '{Sort tabs}';
  @override
  String get help => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? '{Help}';
  @override
  String get deleteTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? '{Delete tabs}';
  @override
  String get shuffleTabs => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? '{Shuffle tabs}';
  @override
  String get tabRandomlyShuffled => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? '{Tab randomly shuffled}';
  @override
  String get tabOrderSaved => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? '{Tab order saved}';
  @override
  String get scrollToCurrent => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? '{Scroll to current tab}';
  @override
  String get scrollToTop => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? '{Scroll to top}';
  @override
  String get scrollToBottom => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? '{Scroll to bottom}';
  @override
  String get filterTabsByBooru =>
      TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? '{Filter tabs by booru, loaded state, duplicates, etc.}';
  @override
  String get scrolling => TranslationOverrides.string(_root.$meta, 'tabs.scrolling', {}) ?? '{Scrolling:}';
  @override
  String get sorting => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? '{Sorting:}';
  @override
  String get defaultTabsOrder => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? '{Default tabs order}';
  @override
  String get sortAlphabetically => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? '{Sort alphabetically}';
  @override
  String get sortAlphabeticallyReversed =>
      TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? '{Sort alphabetically (reversed)}';
  @override
  String get sortByBooruName => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? '{Sort by booru name alphabetically}';
  @override
  String get sortByBooruNameReversed =>
      TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ?? '{Sort by booru name alphabetically (reversed)}';
  @override
  String get longPressSortToSave =>
      TranslationOverrides.string(_root.$meta, 'tabs.longPressSortToSave', {}) ?? '{Long press on the sort button to save tabs in the current order}';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? '{Select:}';
  @override
  String get toggleSelectMode => TranslationOverrides.string(_root.$meta, 'tabs.toggleSelectMode', {}) ?? '{Toggle select mode}';
  @override
  String get onTheBottomOfPage => TranslationOverrides.string(_root.$meta, 'tabs.onTheBottomOfPage', {}) ?? '{On the bottom of the page: }';
  @override
  String get selectDeselectAll => TranslationOverrides.string(_root.$meta, 'tabs.selectDeselectAll', {}) ?? '{Select/deselect all tabs}';
  @override
  String get deleteSelectedTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? '{Delete selected tabs}';
  @override
  String get longPressToMove => TranslationOverrides.string(_root.$meta, 'tabs.longPressToMove', {}) ?? '{Long press on a tab to move it}';
  @override
  String get removedLastTab => TranslationOverrides.string(_root.$meta, 'tabs.removedLastTab', {}) ?? '{Removed last tab}';
  @override
  String get resettingToDefaultTags =>
      TranslationOverrides.string(_root.$meta, 'tabs.resettingToDefaultTags', {}) ?? '{Resetting search to default tags}';
  @override
  String get ratingsChanged => TranslationOverrides.string(_root.$meta, 'tabs.ratingsChanged', {}) ?? '{Ratings changed}';
  @override
  String ratingsChangedOn({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'tabs.ratingsChangedOn', {'booruType': booruType}) ?? '{On ${booruType} }';
  @override
  String get ratingReplacedWith => TranslationOverrides.string(_root.$meta, 'tabs.ratingReplacedWith', {}) ?? '{ is now replaced with }';
  @override
  String get ratingAnd => TranslationOverrides.string(_root.$meta, 'tabs.ratingAnd', {}) ?? '{ and }';
  @override
  String get ratingsFixedAutomatically =>
      TranslationOverrides.string(_root.$meta, 'tabs.ratingsFixedAutomatically', {}) ??
      '{App fixed the rating automatically, but consider changing to correct rating in your future queries}';
  @override
  String get tabsRestored => TranslationOverrides.string(_root.$meta, 'tabs.tabsRestored', {}) ?? '{Tabs restored}';
  @override
  String restoredTabs({required int count, required String tabsPlural}) =>
      TranslationOverrides.string(_root.$meta, 'tabs.restoredTabs', {'count': count, 'tabsPlural': tabsPlural}) ??
      '{Restored ${count} ${tabsPlural} from previous session}';
  @override
  String get someTabsHadUnknownBoorus =>
      TranslationOverrides.string(_root.$meta, 'tabs.someTabsHadUnknownBoorus', {}) ??
      '{Some restored tabs had unknown boorus or broken characters.}';
  @override
  String get brokenTabsSetToDefault =>
      TranslationOverrides.string(_root.$meta, 'tabs.brokenTabsSetToDefault', {}) ?? '{They were set to default or ignored.}';
  @override
  String get listOfBrokenTabs => TranslationOverrides.string(_root.$meta, 'tabs.listOfBrokenTabs', {}) ?? '{List of broken tabs:}';
  @override
  String get tabsMerged => TranslationOverrides.string(_root.$meta, 'tabs.tabsMerged', {}) ?? '{Tabs merged}';
  @override
  String addedNewTabs({required int count, required String tabsPlural}) =>
      TranslationOverrides.string(_root.$meta, 'tabs.addedNewTabs', {'count': count, 'tabsPlural': tabsPlural}) ??
      '{Added ${count} new ${tabsPlural}}';
  @override
  String get tabsReplaced => TranslationOverrides.string(_root.$meta, 'tabs.tabsReplaced', {}) ?? '{Tabs replaced}';
  @override
  String receivedTabs({required int count, required String tabsPlural}) =>
      TranslationOverrides.string(_root.$meta, 'tabs.receivedTabs', {'count': count, 'tabsPlural': tabsPlural}) ??
      '{Received ${count} ${tabsPlural}}';
  @override
  String get numbersInBottomRight =>
      TranslationOverrides.string(_root.$meta, 'tabs.numbersInBottomRight', {}) ?? '{Numbers in the bottom right of the tab:}';
  @override
  String get firstNumberTabIndex =>
      TranslationOverrides.string(_root.$meta, 'tabs.firstNumberTabIndex', {}) ?? '{First number - tab index in default list order}';
  @override
  String get secondNumberTabIndex =>
      TranslationOverrides.string(_root.$meta, 'tabs.secondNumberTabIndex', {}) ??
      '{Second number - tab index in current list order, appears when filtering/sorting is active}';
  @override
  String get specialFilters => TranslationOverrides.string(_root.$meta, 'tabs.specialFilters', {}) ?? '{Special filters:}';
  @override
  String get loadedFilter => TranslationOverrides.string(_root.$meta, 'tabs.loadedFilter', {}) ?? '{"Loaded" - show tabs which have loaded items}';
  @override
  String get notLoadedFilter =>
      TranslationOverrides.string(_root.$meta, 'tabs.notLoadedFilter', {}) ??
      '{"Not loaded" - show tabs which are not loaded and/or have zero items}';
  @override
  String get notLoadedItalic => TranslationOverrides.string(_root.$meta, 'tabs.notLoadedItalic', {}) ?? '{Not loaded tabs have italic text}';
  @override
  String get filterTabsInput => TranslationOverrides.string(_root.$meta, 'tabs.filterTabsInput', {}) ?? '{Filter tabs}';
  @override
  String get noTabsFound => TranslationOverrides.string(_root.$meta, 'tabs.noTabsFound', {}) ?? '{No tabs found}';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tabs.copy', {}) ?? '{Copy}';
  @override
  String get moveAction => TranslationOverrides.string(_root.$meta, 'tabs.moveAction', {}) ?? '{Move}';
  @override
  String get remove => TranslationOverrides.string(_root.$meta, 'tabs.remove', {}) ?? '{Remove}';
  @override
  String get shuffle => TranslationOverrides.string(_root.$meta, 'tabs.shuffle', {}) ?? '{Shuffle}';
  @override
  String get sort => TranslationOverrides.string(_root.$meta, 'tabs.sort', {}) ?? '{Sort}';
  @override
  String get shuffleTabsQuestion => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabsQuestion', {}) ?? '{Shuffle tabs order randomly?}';
  @override
  String get saveTabsInCurrentOrder =>
      TranslationOverrides.string(_root.$meta, 'tabs.saveTabsInCurrentOrder', {}) ?? '{Save tabs in current sorting order?}';
  @override
  String get byBooru => TranslationOverrides.string(_root.$meta, 'tabs.byBooru', {}) ?? '{By booru}';
  @override
  String get alphabetically => TranslationOverrides.string(_root.$meta, 'tabs.alphabetically', {}) ?? '{Alphabetically}';
  @override
  String get reversed => TranslationOverrides.string(_root.$meta, 'tabs.reversed', {}) ?? '{(reversed)}';
  @override
  String areYouSureDeleteTabs({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'tabs.areYouSureDeleteTabs', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
        count,
        one: '{Are you sure you want to delete 1 tab?}',
        other: '{Are you sure you want to delete ${count} tabs?}',
      );
  @override
  late final _TranslationsTabsFiltersDev filters = _TranslationsTabsFiltersDev._(_root);
  @override
  late final _TranslationsTabsMoveDev move = _TranslationsTabsMoveDev._(_root);
}

// Path: dialogs
class _TranslationsDialogsDev extends TranslationsDialogsEn {
  _TranslationsDialogsDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get pageChanger => TranslationOverrides.string(_root.$meta, 'dialogs.pageChanger', {}) ?? '{Page changer}';
  @override
  String get delayBetweenLoadingsMs =>
      TranslationOverrides.string(_root.$meta, 'dialogs.delayBetweenLoadingsMs', {}) ?? '{Delay between loadings (ms)}';
  @override
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'dialogs.delayInMs', {}) ?? '{Delay in ms}';
  @override
  String get cookies => TranslationOverrides.string(_root.$meta, 'dialogs.cookies', {}) ?? '{Cookies}';
  @override
  String get cookiesGone => TranslationOverrides.string(_root.$meta, 'dialogs.cookiesGone', {}) ?? '{There were cookies. Now, they are gone}';
  @override
  String get favicon => TranslationOverrides.string(_root.$meta, 'dialogs.favicon', {}) ?? '{Favicon}';
  @override
  String get noFaviconFound => TranslationOverrides.string(_root.$meta, 'dialogs.noFaviconFound', {}) ?? '{No favicon found}';
  @override
  String get host => TranslationOverrides.string(_root.$meta, 'dialogs.host', {}) ?? '{Host:}';
  @override
  String get textAboveIsSelectable => TranslationOverrides.string(_root.$meta, 'dialogs.textAboveIsSelectable', {}) ?? '{(text above is selectable)}';
  @override
  String get fieldToMergeTexts => TranslationOverrides.string(_root.$meta, 'dialogs.fieldToMergeTexts', {}) ?? '{Field to merge texts:}';
  @override
  String navigateTo({required String url}) => TranslationOverrides.string(_root.$meta, 'dialogs.navigateTo', {'url': url}) ?? '{Navigate to ${url}}';
  @override
  String get listCookies => TranslationOverrides.string(_root.$meta, 'dialogs.listCookies', {}) ?? '{List cookies}';
  @override
  String get clearCookies => TranslationOverrides.string(_root.$meta, 'dialogs.clearCookies', {}) ?? '{Clear cookies}';
  @override
  String get getFavicon => TranslationOverrides.string(_root.$meta, 'dialogs.getFavicon', {}) ?? '{Get favicon}';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'dialogs.history', {}) ?? '{History}';
  @override
  String get noBackHistoryItem => TranslationOverrides.string(_root.$meta, 'dialogs.noBackHistoryItem', {}) ?? '{No back history item}';
  @override
  String get noForwardHistoryItem => TranslationOverrides.string(_root.$meta, 'dialogs.noForwardHistoryItem', {}) ?? '{No forward history item}';
}

// Path: history
class _TranslationsHistoryDev extends TranslationsHistoryEn {
  _TranslationsHistoryDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get searchHistory => TranslationOverrides.string(_root.$meta, 'history.searchHistory', {}) ?? '{Search history}';
  @override
  String get searchHistoryIsEmpty => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsEmpty', {}) ?? '{Search history is empty}';
  @override
  String get searchHistoryIsDisabled =>
      TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsDisabled', {}) ?? '{Search history is disabled.}';
  @override
  String get searchHistoryRequiresDatabase =>
      TranslationOverrides.string(_root.$meta, 'history.searchHistoryRequiresDatabase', {}) ??
      '{Search history requires enabling database in settings.}';
  @override
  String get filterSearchHistory => TranslationOverrides.string(_root.$meta, 'history.filterSearchHistory', {}) ?? '{Filter search history}';
  @override
  String lastSearch({required String search}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearch', {'search': search}) ?? '{Last search: ${search}}';
  @override
  String lastSearchWithDate({required String date}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearchWithDate', {'date': date}) ?? '{Last search: ${date}}';
  @override
  String get unknownBooruType => TranslationOverrides.string(_root.$meta, 'history.unknownBooruType', {}) ?? '{Unknown Booru type!}';
  @override
  String unknownBooru({required String name, required String type}) =>
      TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ?? '{Unknown booru (${name}-${type})}';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? '{Open}';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? '{Open in new tab}';
  @override
  String get removeFromFavourites => TranslationOverrides.string(_root.$meta, 'history.removeFromFavourites', {}) ?? '{Remove from Favourites}';
  @override
  String get setAsFavourite => TranslationOverrides.string(_root.$meta, 'history.setAsFavourite', {}) ?? '{Set as Favourite}';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'history.copy', {}) ?? '{Copy}';
  @override
  String get delete => TranslationOverrides.string(_root.$meta, 'history.delete', {}) ?? '{Delete}';
  @override
  String get deleteHistoryEntries => TranslationOverrides.string(_root.$meta, 'history.deleteHistoryEntries', {}) ?? '{Delete history entries}';
  @override
  String deleteItemsConfirm({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'history.deleteItemsConfirm', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
        count,
        one: '{Are you sure you want to delete 1 item?}',
        other: '{Are you sure you want to delete ${count} items?}',
      );
  @override
  String get clearSelection => TranslationOverrides.string(_root.$meta, 'history.clearSelection', {}) ?? '{Clear selection}';
  @override
  String deleteItems({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'history.deleteItems', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
        count,
        one: '{Delete 1 item}',
        other: '{Delete ${count} items}',
      );
}

// Path: webview
class _TranslationsWebviewDev extends TranslationsWebviewEn {
  _TranslationsWebviewDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'webview.title', {}) ?? '{Webview}';
  @override
  String get notSupportedOnDevice => TranslationOverrides.string(_root.$meta, 'webview.notSupportedOnDevice', {}) ?? '{Not supported on this device}';
  @override
  late final _TranslationsWebviewNavigationDev navigation = _TranslationsWebviewNavigationDev._(_root);
}

// Path: settings
class _TranslationsSettingsDev extends TranslationsSettingsEn {
  _TranslationsSettingsDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? '{Settings}';
  @override
  late final _TranslationsSettingsLanguageDev language = _TranslationsSettingsLanguageDev._(_root);
  @override
  late final _TranslationsSettingsBooruDev booru = _TranslationsSettingsBooruDev._(_root);
  @override
  late final _TranslationsSettingsBooruEditorDev booruEditor = _TranslationsSettingsBooruEditorDev._(_root);
  @override
  late final _TranslationsSettingsInterfaceDev interface = _TranslationsSettingsInterfaceDev._(_root);
  @override
  late final _TranslationsSettingsThemeDev theme = _TranslationsSettingsThemeDev._(_root);
  @override
  late final _TranslationsSettingsViewerDev viewer = _TranslationsSettingsViewerDev._(_root);
  @override
  late final _TranslationsSettingsVideoDev video = _TranslationsSettingsVideoDev._(_root);
  @override
  late final _TranslationsSettingsDownloadsDev downloads = _TranslationsSettingsDownloadsDev._(_root);
  @override
  String get downloadsAndCache => TranslationOverrides.string(_root.$meta, 'settings.downloadsAndCache', {}) ?? '{Snatching & Cache}';
  @override
  late final _TranslationsSettingsDatabaseDev database = _TranslationsSettingsDatabaseDev._(_root);
  @override
  late final _TranslationsSettingsBackupAndRestoreDev backupAndRestore = _TranslationsSettingsBackupAndRestoreDev._(_root);
  @override
  late final _TranslationsSettingsNetworkDev network = _TranslationsSettingsNetworkDev._(_root);
  @override
  late final _TranslationsSettingsPrivacyDev privacy = _TranslationsSettingsPrivacyDev._(_root);
  @override
  late final _TranslationsSettingsPerformanceDev performance = _TranslationsSettingsPerformanceDev._(_root);
  @override
  late final _TranslationsSettingsCacheDev cache = _TranslationsSettingsCacheDev._(_root);
  @override
  late final _TranslationsSettingsTagsFiltersDev tagsFilters = _TranslationsSettingsTagsFiltersDev._(_root);
  @override
  late final _TranslationsSettingsSyncDev sync = _TranslationsSettingsSyncDev._(_root);
  @override
  late final _TranslationsSettingsAboutDev about = _TranslationsSettingsAboutDev._(_root);
  @override
  late final _TranslationsSettingsCheckForUpdatesDev checkForUpdates = _TranslationsSettingsCheckForUpdatesDev._(_root);
  @override
  late final _TranslationsSettingsLogsDev logs = _TranslationsSettingsLogsDev._(_root);
  @override
  late final _TranslationsSettingsHelpDev help = _TranslationsSettingsHelpDev._(_root);
  @override
  late final _TranslationsSettingsDebugDev debug = _TranslationsSettingsDebugDev._(_root);
  @override
  late final _TranslationsSettingsLoggingDev logging = _TranslationsSettingsLoggingDev._(_root);
  @override
  late final _TranslationsSettingsWebviewDev webview = _TranslationsSettingsWebviewDev._(_root);
  @override
  late final _TranslationsSettingsDirPickerDev dirPicker = _TranslationsSettingsDirPickerDev._(_root);
  @override
  String get version => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? '{Version}';
}

// Path: comments
class _TranslationsCommentsDev extends TranslationsCommentsEn {
  _TranslationsCommentsDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'comments.title', {}) ?? '{Comments}';
  @override
  String get noComments => TranslationOverrides.string(_root.$meta, 'comments.noComments', {}) ?? '{No comments}';
  @override
  String get noBooruAPIForComments =>
      TranslationOverrides.string(_root.$meta, 'comments.noBooruAPIForComments', {}) ??
      '{This Booru doesn\'t have comments or there is no API for them}';
}

// Path: pageChanger
class _TranslationsPageChangerDev extends TranslationsPageChangerEn {
  _TranslationsPageChangerDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'pageChanger.title', {}) ?? '{Page changer}';
  @override
  String get pageLabel => TranslationOverrides.string(_root.$meta, 'pageChanger.pageLabel', {}) ?? '{Page #}';
  @override
  String get delayBetweenLoadings =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.delayBetweenLoadings', {}) ?? '{Delay between loadings (ms)}';
  @override
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'pageChanger.delayInMs', {}) ?? '{Delay in ms}';
  @override
  String currentPage({required int number}) =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.currentPage', {'number': number}) ?? '{Current page #${number}}';
  @override
  String possibleMaxPage({required int number}) =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.possibleMaxPage', {'number': number}) ?? '{Possible max page #~${number}}';
  @override
  String get searchCurrentlyRunning =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.searchCurrentlyRunning', {}) ?? '{Search currently running!}';
  @override
  String get jumpToPage => TranslationOverrides.string(_root.$meta, 'pageChanger.jumpToPage', {}) ?? '{Jump to page}';
  @override
  String get searchUntilPage => TranslationOverrides.string(_root.$meta, 'pageChanger.searchUntilPage', {}) ?? '{Search until page}';
  @override
  String get stopSearching => TranslationOverrides.string(_root.$meta, 'pageChanger.stopSearching', {}) ?? '{Stop searching}';
}

// Path: tagsFiltersDialogs
class _TranslationsTagsFiltersDialogsDev extends TranslationsTagsFiltersDialogsEn {
  _TranslationsTagsFiltersDialogsDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get emptyInput => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.emptyInput', {}) ?? '{Empty input!}';
  @override
  String addNewFilter({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.addNewFilter', {'type': type}) ?? '{[Add new ${type} filter]}';
  @override
  String newTagFilter({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newTagFilter', {'type': type}) ?? '{New ${type} tag filter}';
  @override
  String get newFilter => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newFilter', {}) ?? '{New filter}';
  @override
  String get editTagFilter => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.editTagFilter', {}) ?? '{Edit tag filter}';
  @override
  String get confirmDelete => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.confirmDelete', {}) ?? '{Confirm delete}';
}

// Path: tagsManager
class _TranslationsTagsManagerDev extends TranslationsTagsManagerEn {
  _TranslationsTagsManagerDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'tagsManager.title', {}) ?? '{Tags}';
  @override
  String get addTag => TranslationOverrides.string(_root.$meta, 'tagsManager.addTag', {}) ?? '{Add tag}';
  @override
  String get name => TranslationOverrides.string(_root.$meta, 'tagsManager.name', {}) ?? '{Name}';
  @override
  String get type => TranslationOverrides.string(_root.$meta, 'tagsManager.type', {}) ?? '{Type}';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'tagsManager.add', {}) ?? '{Add}';
  @override
  String staleAfter({required String staleText}) =>
      TranslationOverrides.string(_root.$meta, 'tagsManager.staleAfter', {'staleText': staleText}) ?? '{Stale after: ${staleText}}';
  @override
  String get addedATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addedATab', {}) ?? '{Added a tab}';
  @override
  String get addATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addATab', {}) ?? '{Add a tab}';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tagsManager.copy', {}) ?? '{Copy}';
  @override
  String get setStale => TranslationOverrides.string(_root.$meta, 'tagsManager.setStale', {}) ?? '{Set stale}';
  @override
  String get resetStale => TranslationOverrides.string(_root.$meta, 'tagsManager.resetStale', {}) ?? '{Reset stale}';
  @override
  String get makeUnstaleable => TranslationOverrides.string(_root.$meta, 'tagsManager.makeUnstaleable', {}) ?? '{Make unstaleable}';
  @override
  String deleteTags({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'tagsManager.deleteTags', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
        count,
        one: '{Delete 1 tag}',
        other: '{Delete ${count} tags}',
      );
  @override
  String get deleteTagsTitle => TranslationOverrides.string(_root.$meta, 'tagsManager.deleteTagsTitle', {}) ?? '{Delete tags}';
  @override
  String get clearSelection => TranslationOverrides.string(_root.$meta, 'tagsManager.clearSelection', {}) ?? '{Clear selection}';
}

// Path: lockscreen
class _TranslationsLockscreenDev extends TranslationsLockscreenEn {
  _TranslationsLockscreenDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get tapToAuthenticate => TranslationOverrides.string(_root.$meta, 'lockscreen.tapToAuthenticate', {}) ?? '{Tap to authenticate}';
  @override
  String get devUnlock => TranslationOverrides.string(_root.$meta, 'lockscreen.devUnlock', {}) ?? '{DEV UNLOCK}';
  @override
  String get testingMessage =>
      TranslationOverrides.string(_root.$meta, 'lockscreen.testingMessage', {}) ??
      '{[TESTING]: Press this if you cannot unlock the app through normal means. Report to developer with details about your device.}';
}

// Path: loliSync
class _TranslationsLoliSyncDev extends TranslationsLoliSyncEn {
  _TranslationsLoliSyncDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'loliSync.title', {}) ?? '{LoliSync}';
  @override
  String get favourites => TranslationOverrides.string(_root.$meta, 'loliSync.favourites', {}) ?? '{Favourites}';
  @override
  String get favouritesv2 => TranslationOverrides.string(_root.$meta, 'loliSync.favouritesv2', {}) ?? '{Favouritesv2}';
  @override
  String get snatched => TranslationOverrides.string(_root.$meta, 'loliSync.snatched', {}) ?? '{Snatched}';
  @override
  String get settingsData => TranslationOverrides.string(_root.$meta, 'loliSync.settingsData', {}) ?? '{Settings}';
  @override
  String get booruData => TranslationOverrides.string(_root.$meta, 'loliSync.booruData', {}) ?? '{Booru}';
  @override
  String get tabsData => TranslationOverrides.string(_root.$meta, 'loliSync.tabsData', {}) ?? '{Tabs}';
  @override
  String get tagsData => TranslationOverrides.string(_root.$meta, 'loliSync.tagsData', {}) ?? '{Tags}';
  @override
  String get stopSyncingQuestion => TranslationOverrides.string(_root.$meta, 'loliSync.stopSyncingQuestion', {}) ?? '{Do you want to stop syncing?}';
  @override
  String get stopServerQuestion => TranslationOverrides.string(_root.$meta, 'loliSync.stopServerQuestion', {}) ?? '{Do you want to stop the server?}';
  @override
  String get noConnection => TranslationOverrides.string(_root.$meta, 'loliSync.noConnection', {}) ?? '{No connection}';
  @override
  String get waitingForConnection => TranslationOverrides.string(_root.$meta, 'loliSync.waitingForConnection', {}) ?? '{Waiting for connection...}';
  @override
  String get startingServer => TranslationOverrides.string(_root.$meta, 'loliSync.startingServer', {}) ?? '{Starting server...}';
  @override
  String get keepScreenAwake => TranslationOverrides.string(_root.$meta, 'loliSync.keepScreenAwake', {}) ?? '{Keep the screen awake}';
  @override
  String get serverKilled => TranslationOverrides.string(_root.$meta, 'loliSync.serverKilled', {}) ?? '{LoliSync server killed}';
  @override
  String testError({required int statusCode, required String reasonPhrase}) =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testError', {'statusCode': statusCode, 'reasonPhrase': reasonPhrase}) ??
      '{Test error: ${statusCode} ${reasonPhrase}}';
  @override
  String testErrorException({required String error}) =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testErrorException', {'error': error}) ?? '{Test error: ${error}}';
  @override
  String get testSuccess => TranslationOverrides.string(_root.$meta, 'loliSync.testSuccess', {}) ?? '{Test request received a positive response}';
  @override
  String get testSuccessMessage =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testSuccessMessage', {}) ?? '{There should be a \'Test\' message on the other device}';
}

// Path: imageSearch
class _TranslationsImageSearchDev extends TranslationsImageSearchEn {
  _TranslationsImageSearchDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'imageSearch.title', {}) ?? '{Image search}';
}

// Path: tagView
class _TranslationsTagViewDev extends TranslationsTagViewEn {
  _TranslationsTagViewDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get tags => TranslationOverrides.string(_root.$meta, 'tagView.tags', {}) ?? '{Tags}';
  @override
  String get comments => TranslationOverrides.string(_root.$meta, 'tagView.comments', {}) ?? '{Comments}';
  @override
  String showNotes({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'tagView.showNotes', {'count': count}) ?? '{Show notes (${count})}';
  @override
  String hideNotes({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'tagView.hideNotes', {'count': count}) ?? '{Hide notes (${count})}';
  @override
  String get loadNotes => TranslationOverrides.string(_root.$meta, 'tagView.loadNotes', {}) ?? '{Load notes}';
  @override
  String copiedToClipboard({required String title}) =>
      TranslationOverrides.string(_root.$meta, 'tagView.copiedToClipboard', {'title': title}) ?? '{Copied ${title} to clipboard}';
  @override
  String get thisTagAlreadyInSearch =>
      TranslationOverrides.string(_root.$meta, 'tagView.thisTagAlreadyInSearch', {}) ?? '{This tag is already in the current search query:}';
  @override
  String get addedToCurrentSearch =>
      TranslationOverrides.string(_root.$meta, 'tagView.addedToCurrentSearch', {}) ?? '{Added to current search query:}';
  @override
  String get addedNewTab => TranslationOverrides.string(_root.$meta, 'tagView.addedNewTab', {}) ?? '{Added new tab:}';
  @override
  String get id => TranslationOverrides.string(_root.$meta, 'tagView.id', {}) ?? '{ID}';
  @override
  String get postURL => TranslationOverrides.string(_root.$meta, 'tagView.postURL', {}) ?? '{Post URL}';
  @override
  String get posted => TranslationOverrides.string(_root.$meta, 'tagView.posted', {}) ?? '{Posted}';
  @override
  String get details => TranslationOverrides.string(_root.$meta, 'tagView.details', {}) ?? '{Details}';
  @override
  String get filename => TranslationOverrides.string(_root.$meta, 'tagView.filename', {}) ?? '{Filename}';
  @override
  String get url => TranslationOverrides.string(_root.$meta, 'tagView.url', {}) ?? '{URL}';
  @override
  String get extension => TranslationOverrides.string(_root.$meta, 'tagView.extension', {}) ?? '{Extension}';
  @override
  String get resolution => TranslationOverrides.string(_root.$meta, 'tagView.resolution', {}) ?? '{Resolution}';
  @override
  String get size => TranslationOverrides.string(_root.$meta, 'tagView.size', {}) ?? '{Size}';
  @override
  String get md5 => TranslationOverrides.string(_root.$meta, 'tagView.md5', {}) ?? '{MD5}';
  @override
  String get rating => TranslationOverrides.string(_root.$meta, 'tagView.rating', {}) ?? '{Rating}';
  @override
  String get score => TranslationOverrides.string(_root.$meta, 'tagView.score', {}) ?? '{Score}';
  @override
  String get searchTags => TranslationOverrides.string(_root.$meta, 'tagView.searchTags', {}) ?? '{Search tags}';
  @override
  String get noTagsFound => TranslationOverrides.string(_root.$meta, 'tagView.noTagsFound', {}) ?? '{No tags found}';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tagView.copy', {}) ?? '{Copy}';
  @override
  String get removeFromSearch => TranslationOverrides.string(_root.$meta, 'tagView.removeFromSearch', {}) ?? '{Remove from Search}';
  @override
  String get addToSearch => TranslationOverrides.string(_root.$meta, 'tagView.addToSearch', {}) ?? '{Add to Search}';
  @override
  String get addedToSearchBar => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBar', {}) ?? '{Added to search bar:}';
  @override
  String get addToSearchExclude => TranslationOverrides.string(_root.$meta, 'tagView.addToSearchExclude', {}) ?? '{Add to Search (Exclude)}';
  @override
  String get addedToSearchBarExclude =>
      TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBarExclude', {}) ?? '{Added to search bar (Exclude):}';
  @override
  String get addToLoved => TranslationOverrides.string(_root.$meta, 'tagView.addToLoved', {}) ?? '{Add to Loved}';
  @override
  String get addToHated => TranslationOverrides.string(_root.$meta, 'tagView.addToHated', {}) ?? '{Add to Hated}';
  @override
  String get removeFromLoved => TranslationOverrides.string(_root.$meta, 'tagView.removeFromLoved', {}) ?? '{Remove from Loved}';
  @override
  String get removeFromHated => TranslationOverrides.string(_root.$meta, 'tagView.removeFromHated', {}) ?? '{Remove from Hated}';
  @override
  String get editTag => TranslationOverrides.string(_root.$meta, 'tagView.editTag', {}) ?? '{Edit tag}';
  @override
  String copiedSelected({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagView.copiedSelected', {'type': type}) ?? '{Copied ${type} to clipboard}';
  @override
  String get selectedText => TranslationOverrides.string(_root.$meta, 'tagView.selectedText', {}) ?? '{selected text}';
  @override
  String get source => TranslationOverrides.string(_root.$meta, 'tagView.source', {}) ?? '{source}';
  @override
  String get sourceDialogTitle => TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogTitle', {}) ?? '{Source}';
  @override
  String get sourceDialogText1 =>
      TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogText1', {}) ??
      '{The text in source field can\'t be opened as a link, either because it\'s not a link or there are multiple URLs in a single string.}';
  @override
  String get sourceDialogText2 =>
      TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogText2', {}) ??
      '{You can select any text below by long tapping it and then press "Open selected" to try opening it as a link:}';
  @override
  String get noTextSelected => TranslationOverrides.string(_root.$meta, 'tagView.noTextSelected', {}) ?? '{[No text selected]}';
  @override
  String copySelected({required String type}) => TranslationOverrides.string(_root.$meta, 'tagView.copySelected', {'type': type}) ?? '{Copy ${type}}';
  @override
  String get selected => TranslationOverrides.string(_root.$meta, 'tagView.selected', {}) ?? '{selected}';
  @override
  String get all => TranslationOverrides.string(_root.$meta, 'tagView.all', {}) ?? '{all}';
  @override
  String openSelected({required String type}) => TranslationOverrides.string(_root.$meta, 'tagView.openSelected', {'type': type}) ?? '{Open ${type}}';
  @override
  String get returnButton => TranslationOverrides.string(_root.$meta, 'tagView.returnButton', {}) ?? '{Return}';
  @override
  String get preview => TranslationOverrides.string(_root.$meta, 'tagView.preview', {}) ?? '{Preview}';
  @override
  String get booru => TranslationOverrides.string(_root.$meta, 'tagView.booru', {}) ?? '{Booru}';
  @override
  String get selectBooruToLoad => TranslationOverrides.string(_root.$meta, 'tagView.selectBooruToLoad', {}) ?? '{Select a booru to load}';
  @override
  String get previewIsLoading => TranslationOverrides.string(_root.$meta, 'tagView.previewIsLoading', {}) ?? '{Preview is loading...}';
  @override
  String get failedToLoadPreview => TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreview', {}) ?? '{Failed to load preview}';
  @override
  String get tapToTryAgain => TranslationOverrides.string(_root.$meta, 'tagView.tapToTryAgain', {}) ?? '{Tap to try again}';
  @override
  String get copiedFileURL => TranslationOverrides.string(_root.$meta, 'tagView.copiedFileURL', {}) ?? '{Copied file URL to clipboard}';
  @override
  String get tagPreviews => TranslationOverrides.string(_root.$meta, 'tagView.tagPreviews', {}) ?? '{Tag previews}';
  @override
  String get currentState => TranslationOverrides.string(_root.$meta, 'tagView.currentState', {}) ?? '{Current state}';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'tagView.history', {}) ?? '{History}';
  @override
  String get failedToLoadPreviewPage =>
      TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreviewPage', {}) ?? '{Failed to load preview page}';
  @override
  String get tryAgain => TranslationOverrides.string(_root.$meta, 'tagView.tryAgain', {}) ?? '{Try again}';
}

// Path: searchBar
class _TranslationsSearchBarDev extends TranslationsSearchBarEn {
  _TranslationsSearchBarDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get searchForTags => TranslationOverrides.string(_root.$meta, 'searchBar.searchForTags', {}) ?? '{Search for tags}';
  @override
  String failedToLoadSuggestions({required String msg}) =>
      TranslationOverrides.string(_root.$meta, 'searchBar.failedToLoadSuggestions', {'msg': msg}) ??
      '{Failed to load suggestions, tap to retry${msg}}';
  @override
  String get noSuggestionsFound => TranslationOverrides.string(_root.$meta, 'searchBar.noSuggestionsFound', {}) ?? '{No suggestions found}';
  @override
  String get tagSuggestionsNotAvailable =>
      TranslationOverrides.string(_root.$meta, 'searchBar.tagSuggestionsNotAvailable', {}) ?? '{Tag suggestions are not available for this booru}';
  @override
  String copiedTagToClipboard({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'searchBar.copiedTagToClipboard', {'tag': tag}) ?? '{Copied "${tag}" to clipboard}';
  @override
  String get prefix => TranslationOverrides.string(_root.$meta, 'searchBar.prefix', {}) ?? '{Prefix}';
  @override
  String get exclude => TranslationOverrides.string(_root.$meta, 'searchBar.exclude', {}) ?? '{Exclude (—)}';
  @override
  String get booruNumberPrefix => TranslationOverrides.string(_root.$meta, 'searchBar.booruNumberPrefix', {}) ?? '{Booru (N#)}';
  @override
  String get returnButton => TranslationOverrides.string(_root.$meta, 'searchBar.returnButton', {}) ?? '{Return}';
  @override
  String get metatags => TranslationOverrides.string(_root.$meta, 'searchBar.metatags', {}) ?? '{Metatags}';
  @override
  String get freeMetatags => TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatags', {}) ?? '{Free metatags}';
  @override
  String get freeMetatagsDescription =>
      TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatagsDescription', {}) ??
      '{Free metatags do not count against the tag search limits}';
  @override
  String get free => TranslationOverrides.string(_root.$meta, 'searchBar.free', {}) ?? '{Free}';
  @override
  String get single => TranslationOverrides.string(_root.$meta, 'searchBar.single', {}) ?? '{Single}';
  @override
  String get range => TranslationOverrides.string(_root.$meta, 'searchBar.range', {}) ?? '{Range}';
  @override
  String get popular => TranslationOverrides.string(_root.$meta, 'searchBar.popular', {}) ?? '{Popular}';
  @override
  String get favourites => TranslationOverrides.string(_root.$meta, 'searchBar.favourites', {}) ?? '{Favourties}';
  @override
  String get all => TranslationOverrides.string(_root.$meta, 'searchBar.all', {}) ?? '{[All]}';
  @override
  String get selectDate => TranslationOverrides.string(_root.$meta, 'searchBar.selectDate', {}) ?? '{Select date}';
  @override
  String get selectDatesRange => TranslationOverrides.string(_root.$meta, 'searchBar.selectDatesRange', {}) ?? '{Select dates range}';
  @override
  String lastSearch({required String date}) =>
      TranslationOverrides.string(_root.$meta, 'searchBar.lastSearch', {'date': date}) ?? '{Last search: ${date}}';
  @override
  String get unknownBooruType => TranslationOverrides.string(_root.$meta, 'searchBar.unknownBooruType', {}) ?? '{Unknown Booru type!}';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'searchBar.history', {}) ?? '{History}';
  @override
  String get more => TranslationOverrides.string(_root.$meta, 'searchBar.more', {}) ?? '{...}';
}

// Path: mobileHome
class _TranslationsMobileHomeDev extends TranslationsMobileHomeEn {
  _TranslationsMobileHomeDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get selectBooruForWebview =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.selectBooruForWebview', {}) ?? '{Select booru for webview}';
  @override
  String get lockApp => TranslationOverrides.string(_root.$meta, 'mobileHome.lockApp', {}) ?? '{Lock app}';
  @override
  String get fileAlreadyExists => TranslationOverrides.string(_root.$meta, 'mobileHome.fileAlreadyExists', {}) ?? '{File already exists}';
  @override
  String get failedToDownload => TranslationOverrides.string(_root.$meta, 'mobileHome.failedToDownload', {}) ?? '{Failed to download}';
  @override
  String get cancelledByUser => TranslationOverrides.string(_root.$meta, 'mobileHome.cancelledByUser', {}) ?? '{Cancelled by user}';
  @override
  String get saveAnyway => TranslationOverrides.string(_root.$meta, 'mobileHome.saveAnyway', {}) ?? '{Save anyway}';
  @override
  String get skip => TranslationOverrides.string(_root.$meta, 'mobileHome.skip', {}) ?? '{Skip}';
  @override
  String retryAll({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.retryAll', {'count': count}) ?? '{Retry all (${count})}';
  @override
  String get existingFailedOrCancelledItems =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.existingFailedOrCancelledItems', {}) ?? '{Existing, failed or cancelled items}';
  @override
  String get clearAllRetryableItems =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.clearAllRetryableItems', {}) ?? '{Clear all retryable items}';
}

// Path: desktopHome
class _TranslationsDesktopHomeDev extends TranslationsDesktopHomeEn {
  _TranslationsDesktopHomeDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get snatcher => TranslationOverrides.string(_root.$meta, 'desktopHome.snatcher', {}) ?? '{Snatcher}';
  @override
  String get addBoorusInSettings => TranslationOverrides.string(_root.$meta, 'desktopHome.addBoorusInSettings', {}) ?? '{Add boorus in settings}';
  @override
  String get settings => TranslationOverrides.string(_root.$meta, 'desktopHome.settings', {}) ?? '{Settings}';
  @override
  String get save => TranslationOverrides.string(_root.$meta, 'desktopHome.save', {}) ?? '{Save}';
  @override
  String get noItemsSelected => TranslationOverrides.string(_root.$meta, 'desktopHome.noItemsSelected', {}) ?? '{No items selected}';
}

// Path: galleryView
class _TranslationsGalleryViewDev extends TranslationsGalleryViewEn {
  _TranslationsGalleryViewDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get noItems => TranslationOverrides.string(_root.$meta, 'galleryView.noItems', {}) ?? '{No items}';
  @override
  String get noItemSelected => TranslationOverrides.string(_root.$meta, 'galleryView.noItemSelected', {}) ?? '{No item selected}';
  @override
  String get close => TranslationOverrides.string(_root.$meta, 'galleryView.close', {}) ?? '{Close}';
}

// Path: mediaPreviews
class _TranslationsMediaPreviewsDev extends TranslationsMediaPreviewsEn {
  _TranslationsMediaPreviewsDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get noBooruConfigsFound => TranslationOverrides.string(_root.$meta, 'mediaPreviews.noBooruConfigsFound', {}) ?? '{No booru configs found}';
  @override
  String get addNewBooru => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? '{Add new Booru}';
  @override
  String get help => TranslationOverrides.string(_root.$meta, 'mediaPreviews.help', {}) ?? '{Help}';
  @override
  String get settings => TranslationOverrides.string(_root.$meta, 'mediaPreviews.settings', {}) ?? '{Settings}';
  @override
  String get restoringPreviousSession =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoringPreviousSession', {}) ?? '{Restoring previous session...}';
  @override
  String get copiedFileURL => TranslationOverrides.string(_root.$meta, 'mediaPreviews.copiedFileURL', {}) ?? '{Copied file URL to clipboard!}';
}

// Path: viewer
class _TranslationsViewerDev extends TranslationsViewerEn {
  _TranslationsViewerDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsViewerTutorialDev tutorial = _TranslationsViewerTutorialDev._(_root);
  @override
  late final _TranslationsViewerAppBarDev appBar = _TranslationsViewerAppBarDev._(_root);
  @override
  late final _TranslationsViewerNotesDev notes = _TranslationsViewerNotesDev._(_root);
}

// Path: common
class _TranslationsCommonDev extends TranslationsCommonEn {
  _TranslationsCommonDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'common.selectABooru', {}) ?? '{Select a booru}';
  @override
  String get booruItemCopiedToClipboard =>
      TranslationOverrides.string(_root.$meta, 'common.booruItemCopiedToClipboard', {}) ?? '{Booru item copied to clipboard}';
}

// Path: gallery
class _TranslationsGalleryDev extends TranslationsGalleryEn {
  _TranslationsGalleryDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get snatchQuestion => TranslationOverrides.string(_root.$meta, 'gallery.snatchQuestion', {}) ?? '{Snatch?}';
  @override
  String get noPostUrl => TranslationOverrides.string(_root.$meta, 'gallery.noPostUrl', {}) ?? '{No post URL!}';
  @override
  String get loadingFile => TranslationOverrides.string(_root.$meta, 'gallery.loadingFile', {}) ?? '{Loading file...}';
  @override
  String get loadingFileMessage =>
      TranslationOverrides.string(_root.$meta, 'gallery.loadingFileMessage', {}) ?? '{This can take some time, please wait...}';
  @override
  String sources({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'gallery.sources', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
        count,
        one: '{Source}',
        other: '{Sources}',
      );
}

// Path: media
class _TranslationsMediaDev extends TranslationsMediaEn {
  _TranslationsMediaDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsMediaLoadingDev loading = _TranslationsMediaLoadingDev._(_root);
  @override
  late final _TranslationsMediaVideoDev video = _TranslationsMediaVideoDev._(_root);
}

// Path: imageStats
class _TranslationsImageStatsDev extends TranslationsImageStatsEn {
  _TranslationsImageStatsDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String live({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.live', {'count': count}) ?? '{Live: ${count}}';
  @override
  String pending({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.pending', {'count': count}) ?? '{Pending: ${count}}';
  @override
  String total({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.total', {'count': count}) ?? '{Total: ${count}}';
  @override
  String size({required String size}) => TranslationOverrides.string(_root.$meta, 'imageStats.size', {'size': size}) ?? '{Size: ${size}}';
  @override
  String max({required String max}) => TranslationOverrides.string(_root.$meta, 'imageStats.max', {'max': max}) ?? '{Max: ${max}}';
}

// Path: preview
class _TranslationsPreviewDev extends TranslationsPreviewEn {
  _TranslationsPreviewDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get searchForTags => TranslationOverrides.string(_root.$meta, 'preview.searchForTags', {}) ?? '{Search for tags}';
  @override
  String booruNumber({required int number}) =>
      TranslationOverrides.string(_root.$meta, 'preview.booruNumber', {'number': number}) ?? '{Booru (${number}#)}';
  @override
  late final _TranslationsPreviewErrorDev error = _TranslationsPreviewErrorDev._(_root);
}

// Path: tabs.filters
class _TranslationsTabsFiltersDev extends TranslationsTabsFiltersEn {
  _TranslationsTabsFiltersDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get loaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.loaded', {}) ?? '{Loaded}';
  @override
  String get tagType => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagType', {}) ?? '{Tag type}';
  @override
  String get multibooru => TranslationOverrides.string(_root.$meta, 'tabs.filters.multibooru', {}) ?? '{Multibooru}';
  @override
  String get duplicates => TranslationOverrides.string(_root.$meta, 'tabs.filters.duplicates', {}) ?? '{Duplicates}';
  @override
  String get checkDuplicatesOnSameBooru =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.checkDuplicatesOnSameBooru', {}) ?? '{Check for duplicates on same Booru}';
  @override
  String get emptySearchQuery => TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? '{Empty search query}';
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'tabs.filters.title', {}) ?? '{Tab Filters}';
  @override
  String get all => TranslationOverrides.string(_root.$meta, 'tabs.filters.all', {}) ?? '{All}';
  @override
  String get notLoaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.notLoaded', {}) ?? '{Not loaded}';
  @override
  String get enabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.enabled', {}) ?? '{Enabled}';
  @override
  String get disabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.disabled', {}) ?? '{Disabled}';
  @override
  String get willAlsoEnableSorting =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.willAlsoEnableSorting', {}) ?? '{Will also enable sorting}';
  @override
  String get tagTypeFilterHelp =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.tagTypeFilterHelp', {}) ??
      '{Filter tabs which contain at least one tag of selected type}';
  @override
  String get any => TranslationOverrides.string(_root.$meta, 'tabs.filters.any', {}) ?? '{Any}';
  @override
  String get apply => TranslationOverrides.string(_root.$meta, 'tabs.filters.apply', {}) ?? '{Apply}';
}

// Path: tabs.move
class _TranslationsTabsMoveDev extends TranslationsTabsMoveEn {
  _TranslationsTabsMoveDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get moveToTop => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToTop', {}) ?? '{Move to top}';
  @override
  String get moveToBottom => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToBottom', {}) ?? '{Move to bottom}';
  @override
  String get tabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.tabNumber', {}) ?? '{Tab number}';
  @override
  String get invalidTabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidTabNumber', {}) ?? '{Invalid tab number}';
  @override
  String get invalidInput => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidInput', {}) ?? '{Invalid input}';
  @override
  String get outOfRange => TranslationOverrides.string(_root.$meta, 'tabs.move.outOfRange', {}) ?? '{Out of range}';
  @override
  String get pleaseEnterValidTabNumber =>
      TranslationOverrides.string(_root.$meta, 'tabs.move.pleaseEnterValidTabNumber', {}) ?? '{Please enter a valid tab number}';
  @override
  String moveTo({required String formattedNumber}) =>
      TranslationOverrides.string(_root.$meta, 'tabs.move.moveTo', {'formattedNumber': formattedNumber}) ?? '{Move to #${formattedNumber}}';
  @override
  String get returnButton => TranslationOverrides.string(_root.$meta, 'tabs.move.returnButton', {}) ?? '{Return}';
  @override
  String get preview => TranslationOverrides.string(_root.$meta, 'tabs.move.preview', {}) ?? '{Preview:}';
}

// Path: webview.navigation
class _TranslationsWebviewNavigationDev extends TranslationsWebviewNavigationEn {
  _TranslationsWebviewNavigationDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get enterUrlLabel => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterUrlLabel', {}) ?? '{Enter a URL}';
  @override
  String get enterCustomUrl => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterCustomUrl', {}) ?? '{Enter custom URL}';
  @override
  String navigateTo({required String url}) =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.navigateTo', {'url': url}) ?? '{Navigate to ${url}}';
  @override
  String get listCookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.listCookies', {}) ?? '{List cookies}';
  @override
  String get clearCookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.clearCookies', {}) ?? '{Clear cookies}';
  @override
  String get cookiesGone =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.cookiesGone', {}) ?? '{There were cookies. Now, they are gone}';
  @override
  String get getFavicon => TranslationOverrides.string(_root.$meta, 'webview.navigation.getFavicon', {}) ?? '{Get favicon}';
  @override
  String get noFaviconFound => TranslationOverrides.string(_root.$meta, 'webview.navigation.noFaviconFound', {}) ?? '{No favicon found}';
  @override
  String get host => TranslationOverrides.string(_root.$meta, 'webview.navigation.host', {}) ?? '{Host:}';
  @override
  String get textAboveSelectable =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.textAboveSelectable', {}) ?? '{(text above is selectable)}';
  @override
  String get fieldToMergeTexts => TranslationOverrides.string(_root.$meta, 'webview.navigation.fieldToMergeTexts', {}) ?? '{Field to merge texts:}';
  @override
  String get copyUrl => TranslationOverrides.string(_root.$meta, 'webview.navigation.copyUrl', {}) ?? '{Copy URL}';
  @override
  String get copiedUrlToClipboard =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.copiedUrlToClipboard', {}) ?? '{Copied URL to clipboard}';
  @override
  String get cookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookies', {}) ?? '{Cookies}';
  @override
  String get favicon => TranslationOverrides.string(_root.$meta, 'webview.navigation.favicon', {}) ?? '{Favicon}';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'webview.navigation.history', {}) ?? '{History}';
  @override
  String get noBackHistoryItem => TranslationOverrides.string(_root.$meta, 'webview.navigation.noBackHistoryItem', {}) ?? '{No back history item}';
  @override
  String get noForwardHistoryItem =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.noForwardHistoryItem', {}) ?? '{No forward history item}';
}

// Path: settings.language
class _TranslationsSettingsLanguageDev extends TranslationsSettingsLanguageEn {
  _TranslationsSettingsLanguageDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? '{Language}';
  @override
  String get system => TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? '{System}';
  @override
  String get helpUsTranslate => TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? '{Help us translate}';
  @override
  String get visitForDetails =>
      TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ??
      '{Visit <a href="https://github.com/NO-ob/LoliSnatcher_Droid/wiki/Localization">github</a> for details or tap on the image below to go to Weblate}';
}

// Path: settings.booru
class _TranslationsSettingsBooruDev extends TranslationsSettingsBooruEn {
  _TranslationsSettingsBooruDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? '{Boorus & Search}';
  @override
  String get dropdown => TranslationOverrides.string(_root.$meta, 'settings.booru.dropdown', {}) ?? '{Booru}';
  @override
  String get defaultTags => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? '{Default tags}';
  @override
  String get itemsPerPage => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? '{Items fetched per page}';
  @override
  String get itemsPerPageTip =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? '{Some Boorus may ignore this setting}';
  @override
  String get itemsPerPagePlaceholder => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPagePlaceholder', {}) ?? '{10-100}';
  @override
  String get addBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? '{Add Booru config}';
  @override
  String get shareBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? '{Share Booru config}';
  @override
  String shareBooruDialogMsgMobile({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
      '{Booru config of ${booruName} will be converted to a link which then can be shared to other apps\n\nShould login/apikey data be included?}';
  @override
  String shareBooruDialogMsgDesktop({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
      '{Booru config of ${booruName} will be converted to a link which will be copied to clipboard\n\nShould login/apikey data be included?}';
  @override
  String get booruSharing => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? '{Booru sharing}';
  @override
  String get booruSharingMsgAndroid =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ??
      '{How to automatically open Booru config links in the app on Android 12 and higher:\n1) Tap button below to open system app link defaults settings\n2) Tap on "Add link" and select all available options}';
  @override
  String get addedBoorus => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? '{Added Boorus}';
  @override
  String get editBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? '{Edit Booru config}';
  @override
  String get importBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? '{Import Booru config from clipboard}';
  @override
  String get onlyLSURLsSupported =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ?? '{Only loli.snatcher URLs are supported!}';
  @override
  String get deleteBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? '{Delete Booru config}';
  @override
  String get deleteBooruError =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ?? '{Something went wrong during deletion of a Booru config!}';
  @override
  String get booruDeleted => TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? '{Booru config deleted}';
  @override
  String get booruDropdownInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ??
      '{The Booru selected here will be set as default after saving.\n\nThe default Booru will be first to appear in the dropdown boxes}';
  @override
  String get changeDefaultBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? '{Change default Booru?}';
  @override
  String get changeTo => TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? '{Change to: }';
  @override
  String get keepCurrentBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? '{Tap [No] to keep current: }';
  @override
  String get changeToNewBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? '{Tap [Yes] to change to: }';
  @override
  String get booruConfigLinkCopied =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ?? '{Booru config link copied to clipboard}';
  @override
  String get noBooruSelected => TranslationOverrides.string(_root.$meta, 'settings.booru.noBooruSelected', {}) ?? '{No Booru selected!}';
  @override
  String get cantDeleteThisBooru =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? '{Can\'t delete this Booru!}';
  @override
  String get removeRelatedTabsFirst =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.removeRelatedTabsFirst', {}) ?? '{Remove related tabs first}';
}

// Path: settings.booruEditor
class _TranslationsSettingsBooruEditorDev extends TranslationsSettingsBooruEditorEn {
  _TranslationsSettingsBooruEditorDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? '{Booru Editor}';
  @override
  String get testBooru => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooru', {}) ?? '{Test Booru}';
  @override
  String get testBooruSuccessMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruSuccessMsg', {}) ?? '{Tap the Save button to save this config}';
  @override
  String get testBooruFailedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? '{Booru test failed}';
  @override
  String get testBooruFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ??
      '{Config parameters may be incorrect, booru doesn\'t allow api access, request didn\'t return any data or there was a network error.}';
  @override
  String get saveBooru => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? '{Save Booru}';
  @override
  String get runTestFirst => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runTestFirst', {}) ?? '{Run test first}';
  @override
  String get runningTest => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? '{Running test...}';
  @override
  String get booruConfigExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? '{This Booru config already exists}';
  @override
  String get booruSameNameExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ?? '{Booru config with same name already exists}';
  @override
  String get booruSameUrlExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ?? '{Booru config with same URL already exists}';
  @override
  String get thisBooruConfigWontBeAdded =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ?? '{This booru config won\'t be added}';
  @override
  String get booruConfigSaved => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? '{Booru config saved}';
  @override
  String get existingTabsNeedReload =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ??
      '{Existing tabs with this Booru need to be reloaded in order to apply changes!}';
  @override
  String get failedVerifyApiHydrus =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ?? '{Failed to verify api access for Hydrus}';
  @override
  String get accessKeyRequestedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? '{Access key requested}';
  @override
  String get accessKeyRequestedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ??
      '{Tap okay on Hydrus then apply. You can tap \'Test Booru\' afterwards}';
  @override
  String get accessKeyFailedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? '{Failed to get access key}';
  @override
  String get accessKeyFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ?? '{Do you have the request window open in Hydrus?}';
  @override
  String get hydrusInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ??
      '{To get the Hydrus key you need to open the request dialog in the Hydrus client. Services > Review services > Client api > Add > From API request}';
  @override
  String get getHydrusApiKey => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? '{Get Hydrus API key}';
  @override
  String get booruName => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? '{Booru Name}';
  @override
  String get booruNameRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? '{Booru Name is required!}';
  @override
  String get booruUrl => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? '{Booru URL}';
  @override
  String get booruUrlRequired => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? '{Booru URL is required!}';
  @override
  String get booruType => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruType', {}) ?? '{Booru Type}';
  @override
  String booruTypeIs({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruTypeIs', {'booruType': booruType}) ?? '{Booru Type is ${booruType}}';
  @override
  String get booruFavicon => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? '{Favicon URL}';
  @override
  String get booruFaviconPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '{(Autofills if blank)}';
  @override
  String booruApiCredsInfo({required String userIdTitle, required String apiKeyTitle}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruApiCredsInfo', {'userIdTitle': userIdTitle, 'apiKeyTitle': apiKeyTitle}) ??
      '{${userIdTitle} and ${apiKeyTitle} may be needed with some boorus but in most cases aren\'t necessary.}';
  @override
  String get booruDefTags => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? '{Default tags}';
  @override
  String get booruDefTagsPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTagsPlaceholder', {}) ?? '{Default search for booru}';
  @override
  String get booruDefaultInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefaultInstructions', {}) ??
      '{Fields below may be required for some boorus}';
}

// Path: settings.interface
class _TranslationsSettingsInterfaceDev extends TranslationsSettingsInterfaceEn {
  _TranslationsSettingsInterfaceDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? '{Interface}';
  @override
  String get appUIMode => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIMode', {}) ?? '{App UI mode}';
  @override
  String get appUIModeWarningTitle => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarningTitle', {}) ?? '{App UI mode}';
  @override
  String get appUIModeWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarning', {}) ??
      '{Are you sure you want to use Desktop mode? It may cause problems on Mobile devices and is considered DEPRECATED.}';
  @override
  String get appUIModeHelpMobile =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpMobile', {}) ?? '{- Mobile - Normal Mobile UI}';
  @override
  String get appUIModeHelpDesktop =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpDesktop', {}) ??
      '{- Desktop - Ahoviewer Style UI [DEPRECATED, NEEDS REWORK]}';
  @override
  String get appUIModeHelpWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpWarning', {}) ??
      '{[Warning]: Do not set UI Mode to Desktop on a phone you might break the app and might have to wipe your settings including booru configs.}';
  @override
  String get appUIModeHelpAndroid10 =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpAndroid10', {}) ??
      '{If you are on android versions below 11 you can remove the appMode line from /LoliSnatcher/config/settings.json}';
  @override
  String get appUIModeHelpAndroid11 =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpAndroid11', {}) ??
      '{If you are on android 11 or higher you will have to wipe app data via system settings}';
  @override
  String get handSide => TranslationOverrides.string(_root.$meta, 'settings.interface.handSide', {}) ?? '{Hand side}';
  @override
  String get handSideHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.handSideHelp', {}) ??
      '{Changes position of some UI elements according to selected side}';
  @override
  String get showSearchBarInPreviewGrid =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.showSearchBarInPreviewGrid', {}) ?? '{Show search bar in preview grid}';
  @override
  String get moveInputToTopInSearchView =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.moveInputToTopInSearchView', {}) ?? '{Move input to top in search view}';
  @override
  String get searchViewQuickActionsPanel =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewQuickActionsPanel', {}) ?? '{Search view quick actions panel}';
  @override
  String get searchViewInputAutofocus =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewInputAutofocus', {}) ?? '{Search view input autofocus}';
  @override
  String get disableVibration => TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibration', {}) ?? '{Disable vibration}';
  @override
  String get disableVibrationSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibrationSubtitle', {}) ??
      '{May still happen on some actions even when disabled}';
  @override
  String get previewColumnsPortrait =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsPortrait', {}) ?? '{Preview columns (portrait)}';
  @override
  String get previewColumnsLandscape =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsLandscape', {}) ?? '{Preview columns (landscape)}';
  @override
  String get previewQuality => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQuality', {}) ?? '{Preview quality}';
  @override
  String get previewQualityHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelp', {}) ??
      '{This setting changes the resolution of images in the preview grid}';
  @override
  String get previewQualityHelpSample =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpSample', {}) ??
      '{ - Sample - Medium resolution, app will also load a Thumbnail quality as a placeholder while higher quality loads}';
  @override
  String get previewQualityHelpThumbnail =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpThumbnail', {}) ?? '{ - Thumbnail - Low resolution}';
  @override
  String get previewQualityHelpNote =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpNote', {}) ??
      '{[Note]: Sample quality can noticeably degrade performance, especially if you have too many columns in preview grid}';
  @override
  String get previewDisplay => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplay', {}) ?? '{Preview display}';
  @override
  String get previewDisplayFallback =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallback', {}) ?? '{Preview display fallback}';
  @override
  String get previewDisplayFallbackHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallbackHelp', {}) ??
      '{This will be used when Staggered option is not possible}';
  @override
  String get dontScaleImages => TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImages', {}) ?? '{Don\'t scale images}';
  @override
  String get dontScaleImagesSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesSubtitle', {}) ??
      '{Disables image scaling which is used to improve performance}';
  @override
  String get dontScaleImagesWarningTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningTitle', {}) ?? '{Warning}';
  @override
  String get dontScaleImagesWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarning', {}) ??
      '{Are you sure you want to disable image scaling?}';
  @override
  String get dontScaleImagesWarningMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningMsg', {}) ??
      '{This can negatively impact the performance, especially on older devices}';
  @override
  String get gifThumbnails => TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnails', {}) ?? '{GIF thumbnails}';
  @override
  String get gifThumbnailsRequires =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnailsRequires', {}) ?? '{Requires "Don\'t scale images"}';
  @override
  String get scrollPreviewsButtonsPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.scrollPreviewsButtonsPosition', {}) ?? '{Scroll previews buttons position}';
  @override
  String get mouseWheelScrollModifier =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.mouseWheelScrollModifier', {}) ?? '{Mouse wheel scroll modifier}';
  @override
  String get scrollModifier => TranslationOverrides.string(_root.$meta, 'settings.interface.scrollModifier', {}) ?? '{Scroll modifier}';
}

// Path: settings.theme
class _TranslationsSettingsThemeDev extends TranslationsSettingsThemeEn {
  _TranslationsSettingsThemeDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? '{Themes}';
  @override
  String get themeMode => TranslationOverrides.string(_root.$meta, 'settings.theme.themeMode', {}) ?? '{Theme mode}';
  @override
  String get blackBg => TranslationOverrides.string(_root.$meta, 'settings.theme.blackBg', {}) ?? '{Black background}';
  @override
  String get useDynamicColor => TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? '{Use dynamic color}';
  @override
  String get android12PlusOnly => TranslationOverrides.string(_root.$meta, 'settings.theme.android12PlusOnly', {}) ?? '{Android 12+ only}';
  @override
  String get theme => TranslationOverrides.string(_root.$meta, 'settings.theme.theme', {}) ?? '{Theme}';
  @override
  String get primaryColor => TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? '{Primary color}';
  @override
  String get secondaryColor => TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? '{Secondary color}';
  @override
  String get enableDrawerMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.enableDrawerMascot', {}) ?? '{Enable drawer mascot}';
  @override
  String get setCustomMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.setCustomMascot', {}) ?? '{Set custom mascot}';
  @override
  String get removeCustomMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? '{Remove custom mascot}';
  @override
  String get currentMascotPath => TranslationOverrides.string(_root.$meta, 'settings.theme.currentMascotPath', {}) ?? '{Current mascot path}';
  @override
  String get system => TranslationOverrides.string(_root.$meta, 'settings.theme.system', {}) ?? '{System}';
  @override
  String get light => TranslationOverrides.string(_root.$meta, 'settings.theme.light', {}) ?? '{Light}';
  @override
  String get dark => TranslationOverrides.string(_root.$meta, 'settings.theme.dark', {}) ?? '{Dark}';
  @override
  String get pink => TranslationOverrides.string(_root.$meta, 'settings.theme.pink', {}) ?? '{Pink}';
  @override
  String get purple => TranslationOverrides.string(_root.$meta, 'settings.theme.purple', {}) ?? '{Purple}';
  @override
  String get blue => TranslationOverrides.string(_root.$meta, 'settings.theme.blue', {}) ?? '{Blue}';
  @override
  String get teal => TranslationOverrides.string(_root.$meta, 'settings.theme.teal', {}) ?? '{Teal}';
  @override
  String get red => TranslationOverrides.string(_root.$meta, 'settings.theme.red', {}) ?? '{Red}';
  @override
  String get green => TranslationOverrides.string(_root.$meta, 'settings.theme.green', {}) ?? '{Green}';
  @override
  String get halloween => TranslationOverrides.string(_root.$meta, 'settings.theme.halloween', {}) ?? '{Halloween}';
  @override
  String get custom => TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? '{Custom}';
  @override
  String get selectColor => TranslationOverrides.string(_root.$meta, 'settings.theme.selectColor', {}) ?? '{Select color}';
  @override
  String get selectedColor => TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColor', {}) ?? '{Selected color}';
  @override
  String get selectedColorAndShades =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColorAndShades', {}) ?? '{Selected color and its shades}';
}

// Path: settings.viewer
class _TranslationsSettingsViewerDev extends TranslationsSettingsViewerEn {
  _TranslationsSettingsViewerDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? '{Viewer}';
  @override
  String get preloadAmount => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadAmount', {}) ?? '{Preload amount}';
  @override
  String get preloadSizeLimit => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimit', {}) ?? '{Preload size limit}';
  @override
  String get preloadSizeLimitSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimitSubtitle', {}) ?? '{in GB, 0 for no limit}';
  @override
  String get imageQuality => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQuality', {}) ?? '{Image quality}';
  @override
  String get viewerScrollDirection =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerScrollDirection', {}) ?? '{Viewer scroll direction}';
  @override
  String get viewerToolbarPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerToolbarPosition', {}) ?? '{Viewer toolbar position}';
  @override
  String get zoomButtonPosition => TranslationOverrides.string(_root.$meta, 'settings.viewer.zoomButtonPosition', {}) ?? '{Zoom button position}';
  @override
  String get changePageButtonsPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.changePageButtonsPosition', {}) ?? '{Change page buttons position}';
  @override
  String get hideToolbarWhenOpeningViewer =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.hideToolbarWhenOpeningViewer', {}) ?? '{Hide toolbar when opening viewer}';
  @override
  String get expandDetailsByDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.expandDetailsByDefault', {}) ?? '{Expand details by default}';
  @override
  String get hideTranslationNotesByDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.hideTranslationNotesByDefault', {}) ?? '{Hide translation notes by default}';
  @override
  String get enableRotation => TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotation', {}) ?? '{Enable rotation}';
  @override
  String get enableRotationSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotationSubtitle', {}) ?? '{Double tap to reset (only works on images)}';
  @override
  String get toolbarButtonsOrder => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarButtonsOrder', {}) ?? '{Toolbar buttons order}';
  @override
  String get buttonsOrder => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonsOrder', {}) ?? '{Buttons order}';
  @override
  String get longPressToChangeItemOrder =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToChangeItemOrder', {}) ?? '{Long press to change item order.}';
  @override
  String get atLeast4ButtonsVisibleOnToolbar =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.atLeast4ButtonsVisibleOnToolbar', {}) ??
      '{At least 4 buttons from this list will be always visible on Toolbar.}';
  @override
  String get otherButtonsWillGoIntoOverflow =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.otherButtonsWillGoIntoOverflow', {}) ??
      '{Other buttons will go into overflow (three dots) menu.}';
  @override
  String get longPressToMoveItems =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToMoveItems', {}) ?? '{Long press to move items}';
  @override
  String get onlyForVideos => TranslationOverrides.string(_root.$meta, 'settings.viewer.onlyForVideos', {}) ?? '{Only for videos}';
  @override
  String get thisButtonCannotBeDisabled =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.thisButtonCannotBeDisabled', {}) ?? '{This button cannot be disabled}';
  @override
  String get defaultShareAction => TranslationOverrides.string(_root.$meta, 'settings.viewer.defaultShareAction', {}) ?? '{Default share action}';
  @override
  String get shareActions => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActions', {}) ?? '{Share actions}';
  @override
  String get shareActionsAsk =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsAsk', {}) ?? '{- Ask - always ask what to share}';
  @override
  String get shareActionsPostURL => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURL', {}) ?? '{- Post URL}';
  @override
  String get shareActionsFileURL =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFileURL', {}) ??
      '{- File URL - shares direct link to the original file (may not work with some sites)}';
  @override
  String get shareActionsPostURLFileURLFileWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURLFileURLFileWithTags', {}) ??
      '{- Post URL/File URL/File with tags - shares url/file and tags which you select}';
  @override
  String get shareActionsFile =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFile', {}) ??
      '{- File - shares the file itself, may take some time to load, progress will be shown on the Share button}';
  @override
  String get shareActionsHydrus =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsHydrus', {}) ?? '{- Hydrus - sends the post url to Hydrus for import}';
  @override
  String get shareActionsNoteIfFileSavedInCache =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsNoteIfFileSavedInCache', {}) ??
      '{[Note]: If File is saved in cache, it will be loaded from there. Otherwise it will be loaded again from network.}';
  @override
  String get shareActionsTip =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsTip', {}) ??
      '{[Tip]: You can open Share actions menu by long pressing Share button.}';
  @override
  String get useVolumeButtonsForScrolling =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.useVolumeButtonsForScrolling', {}) ?? '{Use volume buttons for scrolling}';
  @override
  String get volumeButtonsScrolling =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrolling', {}) ?? '{Volume buttons scrolling}';
  @override
  String get volumeButtonsScrollingHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollingHelp', {}) ??
      '{Allows to scroll through previews grid and viewer items using volume buttons}';
  @override
  String get volumeButtonsVolumeDown =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeDown', {}) ?? '{ - Volume Down - next item}';
  @override
  String get volumeButtonsVolumeUp =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeUp', {}) ?? '{ - Volume Up - previous item}';
  @override
  String get volumeButtonsInViewer => TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsInViewer', {}) ?? '{In viewer:}';
  @override
  String get volumeButtonsToolbarVisible =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarVisible', {}) ?? '{ - Toolbar visible - controls volume}';
  @override
  String get volumeButtonsToolbarHidden =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarHidden', {}) ?? '{ - Toolbar hidden - controls scrolling}';
  @override
  String get volumeButtonsScrollSpeed =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollSpeed', {}) ?? '{Volume buttons scroll speed}';
  @override
  String get slideshowDurationInMs =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowDurationInMs', {}) ?? '{Slideshow duration (in ms)}';
  @override
  String get slideshow => TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshow', {}) ?? '{Slideshow}';
  @override
  String get slideshowWIPNote =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowWIPNote', {}) ??
      '{[WIP] Videos and gifs must be scrolled manually for now.}';
  @override
  String get preventDeviceFromSleeping =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preventDeviceFromSleeping', {}) ?? '{Prevent device from sleeping}';
  @override
  String get viewerOpenCloseAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerOpenCloseAnimation', {}) ?? '{Viewer open/close animation}';
  @override
  String get viewerPageChangeAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerPageChangeAnimation', {}) ?? '{Viewer page change animation}';
  @override
  String get usingDefaultAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.usingDefaultAnimation', {}) ?? '{Using default animation}';
  @override
  String get usingCustomAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.usingCustomAnimation', {}) ?? '{Using custom animation}';
  @override
  String get kannaLoadingGif => TranslationOverrides.string(_root.$meta, 'settings.viewer.kannaLoadingGif', {}) ?? '{Kanna loading Gif}';
  @override
  String get searchTags => TranslationOverrides.string(_root.$meta, 'settings.viewer.searchTags', {}) ?? '{Search tags}';
  @override
  String get selectTags => TranslationOverrides.string(_root.$meta, 'settings.viewer.selectTags', {}) ?? '{Select tags}';
  @override
  String noteCoordinates({required double x, required double y}) =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.noteCoordinates', {'x': x, 'y': y}) ?? '{X:${x}, Y:${y}}';
}

// Path: settings.video
class _TranslationsSettingsVideoDev extends TranslationsSettingsVideoEn {
  _TranslationsSettingsVideoDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? '{Video}';
  @override
  String get disableVideos => TranslationOverrides.string(_root.$meta, 'settings.video.disableVideos', {}) ?? '{Disable videos}';
  @override
  String get disableVideosHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.disableVideosHelp', {}) ??
      '{Useful on low end devices that crash when trying to load videos. Gives options to view video in external player or browser instead.}';
  @override
  String get autoplayVideos => TranslationOverrides.string(_root.$meta, 'settings.video.autoplayVideos', {}) ?? '{Autoplay videos}';
  @override
  String get startVideosMuted => TranslationOverrides.string(_root.$meta, 'settings.video.startVideosMuted', {}) ?? '{Start videos muted}';
  @override
  String get experimental => TranslationOverrides.string(_root.$meta, 'settings.video.experimental', {}) ?? '{[Experimental]}';
  @override
  String get longTapToFastForwardVideo =>
      TranslationOverrides.string(_root.$meta, 'settings.video.longTapToFastForwardVideo', {}) ?? '{Long tap to fast forward video}';
  @override
  String get longTapToFastForwardVideoHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.longTapToFastForwardVideoHelp', {}) ??
      '{When this is enabled toolbar can be hidden with the tap when video controls are visible. [Experimental] May become default behavior in the future.}';
  @override
  String get videoPlayerBackend => TranslationOverrides.string(_root.$meta, 'settings.video.videoPlayerBackend', {}) ?? '{Video player backend}';
  @override
  String get backendDefault => TranslationOverrides.string(_root.$meta, 'settings.video.backendDefault', {}) ?? '{Default}';
  @override
  String get backendMPV => TranslationOverrides.string(_root.$meta, 'settings.video.backendMPV', {}) ?? '{MPV}';
  @override
  String get backendMDK => TranslationOverrides.string(_root.$meta, 'settings.video.backendMDK', {}) ?? '{MDK}';
  @override
  String get backendDefaultHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendDefaultHelp', {}) ??
      '{Based on exoplayer. Has best device compatibility, may have issues with 4K videos, some codecs or older devices}';
  @override
  String get backendMPVHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendMPVHelp', {}) ??
      '{Based on libmpv, has advanced settings which may help fix problems with some codecs/devices\n[MAY CAUSE CRASHES]}';
  @override
  String get backendMDKHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendMDKHelp', {}) ??
      '{Based on libmdk, may have better performance for some codecs/devices\n[MAY CAUSE CRASHES]}';
  @override
  String get mpvSettingsHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.mpvSettingsHelp', {}) ??
      '{Try different values of \'MPV\' settings below if videos don\'t work correctly or give codec errors:}';
  @override
  String get mpvUseHardwareAcceleration =>
      TranslationOverrides.string(_root.$meta, 'settings.video.mpvUseHardwareAcceleration', {}) ?? '{MPV: use hardware acceleration}';
  @override
  String get mpvVO => TranslationOverrides.string(_root.$meta, 'settings.video.mpvVO', {}) ?? '{MPV: VO}';
  @override
  String get mpvHWDEC => TranslationOverrides.string(_root.$meta, 'settings.video.mpvHWDEC', {}) ?? '{MPV: HWDEC}';
  @override
  String get videoCacheMode => TranslationOverrides.string(_root.$meta, 'settings.video.videoCacheMode', {}) ?? '{Video cache mode}';
  @override
  late final _TranslationsSettingsVideoCacheModesDev cacheModes = _TranslationsSettingsVideoCacheModesDev._(_root);
}

// Path: settings.downloads
class _TranslationsSettingsDownloadsDev extends TranslationsSettingsDownloadsEn {
  _TranslationsSettingsDownloadsDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.downloads.title', {}) ?? '{Snatching}';
  @override
  String get fromNextItemInQueue =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.fromNextItemInQueue', {}) ?? '{From next item in queue}';
  @override
  String get pleaseProvideStoragePermission =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.pleaseProvideStoragePermission', {}) ??
      '{Please provide storage permission in order to download files}';
  @override
  String get noItemsSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsSelected', {}) ?? '{No items selected}';
  @override
  String get noItemsQueued => TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsQueued', {}) ?? '{No items in queue}';
  @override
  String get batch => TranslationOverrides.string(_root.$meta, 'settings.downloads.batch', {}) ?? '{Batch}';
  @override
  String get snatchSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? '{Snatch selected}';
  @override
  String get removeSnatchedStatusFromSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ?? '{Remove snatched status from selected}';
  @override
  String get favouriteSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? '{Favorite selected}';
  @override
  String get unfavouriteSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? '{Unfavorite selected}';
  @override
  String get clearSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? '{Clear selected}';
  @override
  String get updatingData => TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? '{Updating data...}';
}

// Path: settings.database
class _TranslationsSettingsDatabaseDev extends TranslationsSettingsDatabaseEn {
  _TranslationsSettingsDatabaseDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? '{Database}';
  @override
  String get indexingDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? '{Indexing database}';
  @override
  String get droppingIndexes => TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? '{Dropping indexes}';
  @override
  String get enableDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.enableDatabase', {}) ?? '{Enable database}';
  @override
  String get enableIndexing => TranslationOverrides.string(_root.$meta, 'settings.database.enableIndexing', {}) ?? '{Enable indexing}';
  @override
  String get enableSearchHistory =>
      TranslationOverrides.string(_root.$meta, 'settings.database.enableSearchHistory', {}) ?? '{Enable search history}';
  @override
  String get enableTagTypeFetching =>
      TranslationOverrides.string(_root.$meta, 'settings.database.enableTagTypeFetching', {}) ?? '{Enable tag type fetching}';
  @override
  String get failedItemPurgeStarted =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedItemPurgeStarted', {}) ?? '{Failed item purge started}';
  @override
  String get sankakuTypeToUpdate =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuTypeToUpdate', {}) ?? '{Sankaku type to update}';
  @override
  String get searchQuery => TranslationOverrides.string(_root.$meta, 'settings.database.searchQuery', {}) ?? '{Search query}';
  @override
  String get searchQueryOptional =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchQueryOptional', {}) ?? '{(optional, may make the process slower)}';
  @override
  String get errorLoadingTags => TranslationOverrides.string(_root.$meta, 'settings.database.errorLoadingTags', {}) ?? '{Error loading tags}';
  @override
  String get cantLeavePageNow =>
      TranslationOverrides.string(_root.$meta, 'settings.database.cantLeavePageNow', {}) ?? '{Can\'t leave the page right now!}';
  @override
  String get sankakuDataUpdating =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDataUpdating', {}) ??
      '{Sankaku data is being updated, wait until it ends or cancel manually at the bottom of the page}';
  @override
  String get pleaseWaitTitle => TranslationOverrides.string(_root.$meta, 'settings.database.pleaseWaitTitle', {}) ?? '{Please wait!}';
  @override
  String get indexesBeingChanged =>
      TranslationOverrides.string(_root.$meta, 'settings.database.indexesBeingChanged', {}) ?? '{Indexes are being changed}';
  @override
  String get databaseInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfo', {}) ??
      '{The database will store favourites and also track if an item is snatched}';
  @override
  String get databaseInfoSnatch =>
      TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfoSnatch', {}) ?? '{If an item is snatched it wont be snatched again}';
  @override
  String get indexingInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.indexingInfo', {}) ??
      '{Indexing helps make searching database faster, but it takes up more space on disk (possibly doubling the size of your database).\nDo not leave the page or close the app while indexing is running to avoid database corruption.}';
  @override
  String get createIndexesDebug => TranslationOverrides.string(_root.$meta, 'settings.database.createIndexesDebug', {}) ?? '{Create Indexes [Debug]}';
  @override
  String get dropIndexesDebug => TranslationOverrides.string(_root.$meta, 'settings.database.dropIndexesDebug', {}) ?? '{Drop Indexes [Debug]}';
  @override
  String get searchHistoryInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryInfo', {}) ?? '{Requires database to be enabled.}';
  @override
  String searchHistoryRecords({required int limit}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryRecords', {'limit': limit}) ??
      '{Records last ${limit} search queries.}';
  @override
  String get searchHistoryTapInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryTapInfo', {}) ??
      '{Tap any history entry for additional actions (Delete, Set as Favourite...)}';
  @override
  String get searchHistoryFavouritesInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryFavouritesInfo', {}) ??
      '{Favourited queries are pinned to the top of the list and will not be counted towards the limit.}';
  @override
  String get tagTypeFetchingInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingInfo', {}) ?? '{Will search for tag types on supported boorus}';
  @override
  String get tagTypeFetchingWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingWarning', {}) ?? '{This can lead to rate limiting}';
  @override
  String get deleteDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabase', {}) ?? '{Delete database}';
  @override
  String get deleteDatabaseConfirm => TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabaseConfirm', {}) ?? '{Delete database?}';
  @override
  String get databaseDeleted => TranslationOverrides.string(_root.$meta, 'settings.database.databaseDeleted', {}) ?? '{Database deleted!}';
  @override
  String get appRestartRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.database.appRestartRequired', {}) ?? '{An app restart is required!}';
  @override
  String get clearSnatchedItems => TranslationOverrides.string(_root.$meta, 'settings.database.clearSnatchedItems', {}) ?? '{Clear snatched items}';
  @override
  String get clearAllSnatchedConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearAllSnatchedConfirm', {}) ?? '{Clear all snatched items?}';
  @override
  String get snatchedItemsCleared =>
      TranslationOverrides.string(_root.$meta, 'settings.database.snatchedItemsCleared', {}) ?? '{Snatched items cleared}';
  @override
  String get appRestartMayBeRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.database.appRestartMayBeRequired', {}) ?? '{An app restart may be required!}';
  @override
  String get clearFavouritedItems =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearFavouritedItems', {}) ?? '{Clear favourited items}';
  @override
  String get clearAllFavouritedConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearAllFavouritedConfirm', {}) ?? '{Clear all favourited items?}';
  @override
  String get favouritesCleared => TranslationOverrides.string(_root.$meta, 'settings.database.favouritesCleared', {}) ?? '{Favourites cleared}';
  @override
  String get clearSearchHistory => TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistory', {}) ?? '{Clear search history}';
  @override
  String get clearSearchHistoryConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistoryConfirm', {}) ?? '{Clear search history?}';
  @override
  String get searchHistoryCleared =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryCleared', {}) ?? '{Search history cleared}';
  @override
  String get sankakuFavouritesUpdate =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdate', {}) ?? '{Sankaku favourites update}';
  @override
  String get sankakuFavouritesUpdateStarted =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateStarted', {}) ?? '{Sankaku favourites update started}';
  @override
  String get sankakuNewUrlsInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuNewUrlsInfo', {}) ??
      '{New image urls will be fetched for Sankaku items in your favourites}';
  @override
  String get sankakuDontLeavePage =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDontLeavePage', {}) ??
      '{Don\'t leave this page until the process is complete or stopped}';
  @override
  String get noSankakuConfigFound =>
      TranslationOverrides.string(_root.$meta, 'settings.database.noSankakuConfigFound', {}) ?? '{No Sankaku config found!}';
  @override
  String get sankakuFavouritesUpdateComplete =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateComplete', {}) ?? '{Sankaku favourites update complete}';
  @override
  String get failedItemsPurgeStartedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeStartedTitle', {}) ?? '{Failed item purge started}';
  @override
  String get failedItemsPurgeInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeInfo', {}) ??
      '{Items that failed to update will be removed from the database}';
  @override
  String get updateSankakuUrls => TranslationOverrides.string(_root.$meta, 'settings.database.updateSankakuUrls', {}) ?? '{Update Sankaku URLs}';
  @override
  String updating({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.updating', {'count': count}) ?? '{Updating ${count} items:}';
  @override
  String left({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.left', {'count': count}) ?? '{Left: ${count}}';
  @override
  String done({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.done', {'count': count}) ?? '{Done: ${count}}';
  @override
  String failedSkipped({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedSkipped', {'count': count}) ?? '{Failed/Skipped: ${count}}';
  @override
  String get sankakuRateLimitWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuRateLimitWarning', {}) ??
      '{Stop and try again later if you start seeing \'Failed\' number constantly growing, you could have reached rate limit and/or Sankaku blocks requests from your IP.}';
  @override
  String get skipCurrentItem =>
      TranslationOverrides.string(_root.$meta, 'settings.database.skipCurrentItem', {}) ?? '{Press here to skip current item}';
  @override
  String get useIfStuck => TranslationOverrides.string(_root.$meta, 'settings.database.useIfStuck', {}) ?? '{Use if item appears to be stuck}';
  @override
  String get pressToStop => TranslationOverrides.string(_root.$meta, 'settings.database.pressToStop', {}) ?? '{Press here to stop}';
  @override
  String purgeFailedItems({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.purgeFailedItems', {'count': count}) ?? '{Purge failed items (${count})}';
  @override
  String retryFailedItems({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.retryFailedItems', {'count': count}) ?? '{Retry failed items (${count})}';
}

// Path: settings.backupAndRestore
class _TranslationsSettingsBackupAndRestoreDev extends TranslationsSettingsBackupAndRestoreEn {
  _TranslationsSettingsBackupAndRestoreDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.title', {}) ?? '{Backup & Restore}';
  @override
  String get duplicateFileDetectedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedTitle', {}) ?? '{Duplicate file detected!}';
  @override
  String duplicateFileDetectedMsg({required String fileName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
      '{The file ${fileName} already exists. Do you want to overwrite it? If you choose no, the backup will be cancelled.}';
  @override
  String get androidOnlyFeatureMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ??
      '{This feature is only available on Android, on Desktop builds you can just copy/paste files from/to app\'s data folder, respective to your system}';
  @override
  String get selectBackupDir =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? '{Select backup directory}';
  @override
  String get failedToGetBackupPath =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ?? '{Failed to get backup path}';
  @override
  String backupPathMsg({required String backupPath}) =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ??
      '{Backup path is: ${backupPath}}';
  @override
  String get noBackupDirSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ?? '{No backup directory selected}';
  @override
  String get restoreInfoMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ??
      '{Restore will work only if the files are placed in the root of the directory.}';
  @override
  String get backupSettings => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? '{Backup settings}';
  @override
  String get restoreSettings => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? '{Restore settings}';
  @override
  String get settingsBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ?? '{Settings backed up to settings.json}';
  @override
  String get settingsRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? '{Settings restored from backup}';
  @override
  String get backupSettingsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ?? '{Failed to backup settings}';
  @override
  String get restoreSettingsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ?? '{Failed to restore settings}';
  @override
  String get backupBoorus => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ?? '{Backup boorus}';
  @override
  String get restoreBoorus => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? '{Restore boorus}';
  @override
  String get boorusBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ?? '{Boorus backed up to boorus.json}';
  @override
  String get boorusRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ?? '{Boorus restored from backup}';
  @override
  String get backupBoorusError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ?? '{Failed to backup boorus}';
  @override
  String get restoreBoorusError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ?? '{Failed to restore boorus}';
  @override
  String get backupDatabase => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? '{Backup database}';
  @override
  String get restoreDatabase => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? '{Restore database}';
  @override
  String get restoreDatabaseInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ??
      '{May take a while depending on the size of the database, will restart the app on success}';
  @override
  String get databaseBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ?? '{Database backed up to database.json}';
  @override
  String get databaseRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ??
      '{Database restored from backup! App will restart in a few seconds!}';
  @override
  String get backupDatabaseError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ?? '{Failed to backup database}';
  @override
  String get restoreDatabaseError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ?? '{Failed to restore database}';
  @override
  String get databaseFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ??
      '{Database file not found or cannot be read!}';
  @override
  String get backupTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? '{Backup tags}';
  @override
  String get restoreTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? '{Restore tags}';
  @override
  String get restoreTagsInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ??
      '{May take a while if you have a lot of tags. If you did a database restore, you don\'t need to do this because it\'s already included in the database}';
  @override
  String get tagsBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? '{Tags backed up to tags.json}';
  @override
  String get tagsRestored => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? '{Tags restored from backup}';
  @override
  String get backupTagsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? '{Failed to backup tags}';
  @override
  String get restoreTagsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? '{Failed to restore tags}';
  @override
  String get tagsFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsFileNotFound', {}) ?? '{Tags file not found or cannot be read!}';
  @override
  String get operationTakesTooLongMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.operationTakesTooLongMsg', {}) ??
      '{Press Hide below if it takes too long, operation will continue in background}';
  @override
  String get backupFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupFileNotFound', {}) ?? '{Backup file not found or cannot be read!}';
  @override
  String get backupDirNoAccess =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDirNoAccess', {}) ?? '{No access to backup directory!}';
  @override
  String get backupCancelled => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? '{Backup cancelled}';
}

// Path: settings.network
class _TranslationsSettingsNetworkDev extends TranslationsSettingsNetworkEn {
  _TranslationsSettingsNetworkDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? '{Network}';
  @override
  String get enableSelfSignedSSLCertificates =>
      TranslationOverrides.string(_root.$meta, 'settings.network.enableSelfSignedSSLCertificates', {}) ?? '{Enable self signed SSL certificates}';
  @override
  String get proxy => TranslationOverrides.string(_root.$meta, 'settings.network.proxy', {}) ?? '{Proxy}';
  @override
  String get proxySubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.network.proxySubtitle', {}) ??
      '{Does not apply to streaming video mode, use caching video mode instead}';
  @override
  String get customUserAgent => TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgent', {}) ?? '{Custom user agent}';
  @override
  String get customUserAgentTitle => TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgentTitle', {}) ?? '{Custom user agent}';
  @override
  String get keepEmptyForDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.network.keepEmptyForDefault', {}) ?? '{Keep empty to use default value}';
  @override
  String defaultUserAgent({required String agent}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.defaultUserAgent', {'agent': agent}) ?? '{Default: ${agent}}';
  @override
  String get userAgentUsedOnRequests =>
      TranslationOverrides.string(_root.$meta, 'settings.network.userAgentUsedOnRequests', {}) ??
      '{Will be used on requests for almost all boorus and on the webview}';
  @override
  String get valueSavedAfterLeaving =>
      TranslationOverrides.string(_root.$meta, 'settings.network.valueSavedAfterLeaving', {}) ?? '{Value is saved after leaving this page}';
  @override
  String get setBrowserUserAgent =>
      TranslationOverrides.string(_root.$meta, 'settings.network.setBrowserUserAgent', {}) ??
      '{Tap here to set suggested browser user agent (recommended only when sites you use ban non-browser user agents):}';
  @override
  String get cookieCleaner => TranslationOverrides.string(_root.$meta, 'settings.network.cookieCleaner', {}) ?? '{Cookie cleaner}';
  @override
  String get booru => TranslationOverrides.string(_root.$meta, 'settings.network.booru', {}) ?? '{Booru}';
  @override
  String get selectBooruToClearCookies =>
      TranslationOverrides.string(_root.$meta, 'settings.network.selectBooruToClearCookies', {}) ??
      '{Select a booru to clear cookies for or leave empty to clear all}';
  @override
  String cookiesFor({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookiesFor', {'booruName': booruName}) ?? '{Cookies for ${booruName}:}';
  @override
  String cookieDeleted({required String cookieName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookieDeleted', {'cookieName': cookieName}) ?? '{"${cookieName}" cookie deleted}';
  @override
  String get clearCookies => TranslationOverrides.string(_root.$meta, 'settings.network.clearCookies', {}) ?? '{Clear cookies}';
  @override
  String clearCookiesFor({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.clearCookiesFor', {'booruName': booruName}) ?? '{Clear cookies for ${booruName}}';
  @override
  String cookiesForBooruDeleted({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookiesForBooruDeleted', {'booruName': booruName}) ??
      '{Cookies for ${booruName} deleted}';
  @override
  String get allCookiesDeleted => TranslationOverrides.string(_root.$meta, 'settings.network.allCookiesDeleted', {}) ?? '{All cookies deleted}';
}

// Path: settings.privacy
class _TranslationsSettingsPrivacyDev extends TranslationsSettingsPrivacyEn {
  _TranslationsSettingsPrivacyDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? '{Privacy}';
  @override
  String get appLock => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? '{App lock}';
  @override
  String get appLockMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ??
      '{Allows to lock the app manually or if left for too long. Requires system lock with PIN or biometrics to be enabled}';
  @override
  String get autoLockAfter => TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfter', {}) ?? '{Auto lock after}';
  @override
  String get autoLockAfterTip => TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfterTip', {}) ?? '{in seconds, 0 to disable}';
  @override
  String get bluronLeave => TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeave', {}) ?? '{Blur screen when leaving the app}';
  @override
  String get bluronLeaveMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeaveMsg', {}) ?? '{May not work on some devices due to system limitations}';
  @override
  String get incognitoKeyboard => TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboard', {}) ?? '{Incognito keyboard}';
  @override
  String get incognitoKeyboardMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboardMsg', {}) ??
      '{Tells system keyboard to not save your typing history and disable learning based on your input.\nWill be applied to most of text inputs}';
}

// Path: settings.performance
class _TranslationsSettingsPerformanceDev extends TranslationsSettingsPerformanceEn {
  _TranslationsSettingsPerformanceDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.performance.title', {}) ?? '{Performance}';
  @override
  String get lowPerformanceMode =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceMode', {}) ?? '{Low performance mode}';
  @override
  String get lowPerformanceModeSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeSubtitle', {}) ??
      '{Recommended for old devices and devices with low RAM}';
  @override
  String get lowPerformanceModeDialogTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogTitle', {}) ?? '{Low performance mode}';
  @override
  String get lowPerformanceModeDialogDisablesDetailed =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesDetailed', {}) ??
      '{- Disables detailed loading progress information}';
  @override
  String get lowPerformanceModeDialogDisablesResourceIntensive =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive', {}) ??
      '{- Disables resource-intensive elements (blurs, animated opacity, some animations...)}';
  @override
  String get lowPerformanceModeDialogSetsOptimal =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogSetsOptimal', {}) ??
      '{- Sets optimal settings for these options (you can change them separately later):}';
  @override
  String get lowPerformanceModeDialogPreviewQuality =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogPreviewQuality', {}) ??
      '{   - Preview quality [Thumbnail]}';
  @override
  String get lowPerformanceModeDialogImageQuality =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogImageQuality', {}) ?? '{   - Image quality [Sample]}';
  @override
  String get lowPerformanceModeDialogPreviewColumns =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogPreviewColumns', {}) ??
      '{   - Preview columns [2 - portrait, 4 - landscape]}';
  @override
  String get lowPerformanceModeDialogPreloadAmount =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogPreloadAmount', {}) ??
      '{   - Preload amount and size [0, 0.2]}';
  @override
  String get lowPerformanceModeDialogVideoAutoplay =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogVideoAutoplay', {}) ?? '{   - Video autoplay [false]}';
  @override
  String get lowPerformanceModeDialogDontScaleImages =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDontScaleImages', {}) ??
      '{   - Don\'t scale images [false]}';
  @override
  String get previewQuality => TranslationOverrides.string(_root.$meta, 'settings.performance.previewQuality', {}) ?? '{Preview quality}';
  @override
  String get imageQuality => TranslationOverrides.string(_root.$meta, 'settings.performance.imageQuality', {}) ?? '{Image quality}';
  @override
  String get previewColumnsPortrait =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.previewColumnsPortrait', {}) ?? '{Preview columns (portrait)}';
  @override
  String get previewColumnsLandscape =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.previewColumnsLandscape', {}) ?? '{Preview columns (landscape)}';
  @override
  String get preloadAmount => TranslationOverrides.string(_root.$meta, 'settings.performance.preloadAmount', {}) ?? '{Preload amount}';
  @override
  String get preloadSizeLimit => TranslationOverrides.string(_root.$meta, 'settings.performance.preloadSizeLimit', {}) ?? '{Preload size limit}';
  @override
  String get preloadSizeLimitSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.preloadSizeLimitSubtitle', {}) ?? '{in GB, 0 for no limit}';
  @override
  String get dontScaleImages => TranslationOverrides.string(_root.$meta, 'settings.performance.dontScaleImages', {}) ?? '{Don\'t scale images}';
  @override
  String get dontScaleImagesSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.dontScaleImagesSubtitle', {}) ??
      '{Disables image scaling which is used to improve performance}';
  @override
  String get dontScaleImagesWarningTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.dontScaleImagesWarningTitle', {}) ?? '{Warning}';
  @override
  String get dontScaleImagesWarningMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.dontScaleImagesWarningMsg', {}) ??
      '{Are you sure you want to disable image scaling?}';
  @override
  String get dontScaleImagesWarningPerformance =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.dontScaleImagesWarningPerformance', {}) ??
      '{This can negatively impact the performance, especially on older devices}';
  @override
  String get autoplayVideos => TranslationOverrides.string(_root.$meta, 'settings.performance.autoplayVideos', {}) ?? '{Autoplay videos}';
  @override
  String get disableVideos => TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideos', {}) ?? '{Disable videos}';
  @override
  String get disableVideosHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideosHelp', {}) ??
      '{Useful on low end devices that crash when trying to load videos. Gives options to view video in external player or browser instead.}';
}

// Path: settings.cache
class _TranslationsSettingsCacheDev extends TranslationsSettingsCacheEn {
  _TranslationsSettingsCacheDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? '{Snatching & Caching}';
  @override
  String get snatchQuality => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchQuality', {}) ?? '{Snatch quality}';
  @override
  String get snatchCooldown => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchCooldown', {}) ?? '{Snatch cooldown (in ms)}';
  @override
  String get pleaseEnterAValidTimeout =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.pleaseEnterAValidTimeout', {}) ?? '{Please enter a valid timeout value}';
  @override
  String get biggerThan10 => TranslationOverrides.string(_root.$meta, 'settings.cache.biggerThan10', {}) ?? '{Please enter a value bigger than 10ms}';
  @override
  String get showDownloadNotifications =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.showDownloadNotifications', {}) ?? '{Show download notifications}';
  @override
  String get snatchItemsOnFavouriting =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.snatchItemsOnFavouriting', {}) ?? '{Snatch items on favouriting}';
  @override
  String get favouriteItemsOnSnatching =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.favouriteItemsOnSnatching', {}) ?? '{Favourite items on snatching}';
  @override
  String get writeImageDataOnSave =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.writeImageDataOnSave', {}) ?? '{Write image data to JSON on save}';
  @override
  String get requiresCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.requiresCustomStorageDirectory', {}) ?? '{Requires custom storage directory}';
  @override
  String get setStorageDirectory => TranslationOverrides.string(_root.$meta, 'settings.cache.setStorageDirectory', {}) ?? '{Set storage directory}';
  @override
  String currentPath({required String path}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.currentPath', {'path': path}) ?? '{Current: ${path}}';
  @override
  String get resetStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.resetStorageDirectory', {}) ?? '{Reset storage directory}';
  @override
  String get cachePreviews => TranslationOverrides.string(_root.$meta, 'settings.cache.cachePreviews', {}) ?? '{Cache previews}';
  @override
  String get cacheMedia => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheMedia', {}) ?? '{Cache media}';
  @override
  String get videoCacheMode => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheMode', {}) ?? '{Video cache mode}';
  @override
  String get videoCacheModesTitle => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModesTitle', {}) ?? '{Video cache modes}';
  @override
  String get videoCacheModeStream =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStream', {}) ??
      '{- Stream - Don\'t cache, start playing as soon as possible}';
  @override
  String get videoCacheModeCache =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeCache', {}) ??
      '{- Cache - Saves the file to device storage, plays only when download is complete}';
  @override
  String get videoCacheModeStreamCache =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStreamCache', {}) ??
      '{- Stream+Cache - Mix of both, but currently leads to double download}';
  @override
  String get videoCacheNoteEnable =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheNoteEnable', {}) ??
      '{[Note]: Videos will cache only if \'Cache Media\' is enabled.}';
  @override
  String get videoCacheWarningDesktop =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheWarningDesktop', {}) ??
      '{[Warning]: On desktop Stream mode can work incorrectly for some Boorus.}';
  @override
  String get deleteCacheAfter => TranslationOverrides.string(_root.$meta, 'settings.cache.deleteCacheAfter', {}) ?? '{Delete cache after:}';
  @override
  String get cacheSizeLimit => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheSizeLimit', {}) ?? '{Cache size Limit (in GB)}';
  @override
  String get maximumTotalCacheSize =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.maximumTotalCacheSize', {}) ?? '{Maximum total cache size}';
  @override
  String get cacheStats => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheStats', {}) ?? '{Cache stats:}';
  @override
  String get loading => TranslationOverrides.string(_root.$meta, 'settings.cache.loading', {}) ?? '{Loading...}';
  @override
  String get empty => TranslationOverrides.string(_root.$meta, 'settings.cache.empty', {}) ?? '{Empty}';
  @override
  String inFilesPlural({required String size, required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.inFilesPlural', {'size': size, 'count': count}) ?? '{${size}, ${count} files}';
  @override
  String inFileSingular({required String size}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.inFileSingular', {'size': size}) ?? '{${size}, 1 file}';
  @override
  String get cacheTypeTotal => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeTotal', {}) ?? '{Total}';
  @override
  String get cacheTypeFavicons => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeFavicons', {}) ?? '{Favicons}';
  @override
  String get cacheTypeThumbnails => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeThumbnails', {}) ?? '{Thumbnails}';
  @override
  String get cacheTypeSamples => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeSamples', {}) ?? '{Samples}';
  @override
  String get cacheTypeMedia => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeMedia', {}) ?? '{Media}';
  @override
  String get cacheTypeWebView => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeWebView', {}) ?? '{WebView}';
  @override
  String get cacheCleared => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheCleared', {}) ?? '{Cache cleared}';
  @override
  String clearedCacheType({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheType', {'type': type}) ?? '{Cleared ${type} cache}';
  @override
  String get clearAllCache => TranslationOverrides.string(_root.$meta, 'settings.cache.clearAllCache', {}) ?? '{Clear all cache}';
  @override
  String get clearedCacheCompletely =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheCompletely', {}) ?? '{Cleared cache completely}';
  @override
  String get appRestartRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.appRestartRequired', {}) ?? '{App Restart may be required!}';
  @override
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'settings.cache.errorExclamation', {}) ?? '{Error!}';
  @override
  String get notAvailableForPlatform =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.notAvailableForPlatform', {}) ?? '{Currently not available for this platform}';
}

// Path: settings.tagsFilters
class _TranslationsSettingsTagsFiltersDev extends TranslationsSettingsTagsFiltersEn {
  _TranslationsSettingsTagsFiltersDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.title', {}) ?? '{Tag filters}';
  @override
  String get hated => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.hated', {}) ?? '{Hated}';
  @override
  String get loved => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.loved', {}) ?? '{Loved}';
  @override
  String get duplicateTag => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.duplicateTag', {}) ?? '{Duplicate tag}';
  @override
  String alreadyInList({required String tag, required String type}) =>
      TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.alreadyInList', {'tag': tag, 'type': type}) ??
      '{\'${tag}\' is already in ${type} list}';
  @override
  String searchFiltersCount({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.searchFiltersCount', {'count': count}) ?? '{Search filters (${count})}';
  @override
  String searchFiltersFilteredCount({required int filtered, required int total}) =>
      TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.searchFiltersFilteredCount', {'filtered': filtered, 'total': total}) ??
      '{Search filters (${filtered}/${total})}';
  @override
  String get noFiltersFound => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.noFiltersFound', {}) ?? '{No filters found}';
  @override
  String get noFiltersAdded => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.noFiltersAdded', {}) ?? '{No filters added}';
  @override
  String newFilterType({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.newFilterType', {'type': type}) ?? '{New ${type} tag filter}';
  @override
  String get newFilter => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.newFilter', {}) ?? '{New filter}';
  @override
  String get editFilter => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.editFilter', {}) ?? '{Edit Filter}';
  @override
  String get searchFilters => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.searchFilters', {}) ?? '{Search filters}';
  @override
  String get removeHated => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.removeHated', {}) ?? '{Remove items with Hated tags}';
  @override
  String get removeFavourited => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.removeFavourited', {}) ?? '{Remove favourited items}';
  @override
  String get removeSnatched => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.removeSnatched', {}) ?? '{Remove snatched items}';
  @override
  String get removeAI => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.removeAI', {}) ?? '{Remove AI items}';
}

// Path: settings.sync
class _TranslationsSettingsSyncDev extends TranslationsSettingsSyncEn {
  _TranslationsSettingsSyncDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? '{LoliSync}';
  @override
  String get dbError => TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ?? '{Database must be enabled to use LoliSync}';
  @override
  String get errorTitle => TranslationOverrides.string(_root.$meta, 'settings.sync.errorTitle', {}) ?? '{Error!}';
  @override
  String get pleaseEnterIPAndPort =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.pleaseEnterIPAndPort', {}) ?? '{Please enter IP address and port.}';
  @override
  String get selectWhatYouWantToDo =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.selectWhatYouWantToDo', {}) ?? '{Select what you want to do}';
  @override
  String get sendDataToDevice => TranslationOverrides.string(_root.$meta, 'settings.sync.sendDataToDevice', {}) ?? '{SEND data TO another device}';
  @override
  String get receiveDataFromDevice =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.receiveDataFromDevice', {}) ?? '{RECEIVE data FROM another device}';
  @override
  String get senderInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.senderInstructions', {}) ??
      '{Start the server on another device it will show an ip and port, fill those in and then hit start sync to send data from this device to the other}';
  @override
  String get ipAddress => TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddress', {}) ?? '{IP Address}';
  @override
  String get ipAddressPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddressPlaceholder', {}) ?? '{Host IP Address (i.e. 192.168.1.1)}';
  @override
  String get port => TranslationOverrides.string(_root.$meta, 'settings.sync.port', {}) ?? '{Port}';
  @override
  String get portPlaceholder => TranslationOverrides.string(_root.$meta, 'settings.sync.portPlaceholder', {}) ?? '{Host Port (i.e. 7777)}';
  @override
  String get sendFavourites => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavourites', {}) ?? '{Send favourites}';
  @override
  String favouritesCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.favouritesCount', {'count': count}) ?? '{Favorites: ${count}}';
  @override
  String get sendFavouritesLegacy =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavouritesLegacy', {}) ?? '{Send favourites (Legacy)}';
  @override
  String get syncFavsFrom => TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFrom', {}) ?? '{Sync favs from #...}';
  @override
  String get syncFavsFromHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText1', {}) ??
      '{Allows to set from where the sync should start from, useful if you already synced all your favs before and want to sync only the newest items}';
  @override
  String get syncFavsFromHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText2', {}) ??
      '{If you want to sync from the beginning leave this field blank}';
  @override
  String get syncFavsFromHelpText3 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText3', {}) ??
      '{Example: You have X amount of favs, set this field to 100, sync will start from item #100 and go until it reaches X}';
  @override
  String get syncFavsFromHelpText4 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText4', {}) ?? '{Order of favs: From oldest (0) to newest (X)}';
  @override
  String get sendSnatchedHistory => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSnatchedHistory', {}) ?? '{Send snatched history}';
  @override
  String snatchedCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.snatchedCount', {'count': count}) ?? '{Snatched: ${count}}';
  @override
  String get syncSnatchedFrom => TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFrom', {}) ?? '{Sync snatched from #...}';
  @override
  String get syncSnatchedFromHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText1', {}) ??
      '{Allows to set from where the sync should start from, useful if you already synced all your snatched history before and want to sync only the newest items}';
  @override
  String get syncSnatchedFromHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText2', {}) ??
      '{If you want to sync from the beginning leave this field blank}';
  @override
  String get syncSnatchedFromHelpText3 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText3', {}) ??
      '{Example: You have X amount of favs, set this field to 100, sync will start from item #100 and go until it reaches X}';
  @override
  String get syncSnatchedFromHelpText4 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText4', {}) ?? '{Order of favs: From oldest (0) to newest (X)}';
  @override
  String get sendSettings => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSettings', {}) ?? '{Send settings}';
  @override
  String get sendBooruConfigs => TranslationOverrides.string(_root.$meta, 'settings.sync.sendBooruConfigs', {}) ?? '{Send booru configs}';
  @override
  String configsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.configsCount', {'count': count}) ?? '{Configs: ${count}}';
  @override
  String get sendTabs => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTabs', {}) ?? '{Send tabs}';
  @override
  String tabsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsCount', {'count': count}) ?? '{Tabs: ${count}}';
  @override
  String get tabsSyncMode => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncMode', {}) ?? '{Tabs sync mode}';
  @override
  String get tabsSyncModeMerge =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeMerge', {}) ??
      '{Merge: Merge the tabs from this device on the other device, tabs with unknown boorus and already existing tabs will be ignored}';
  @override
  String get tabsSyncModeReplace =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeReplace', {}) ??
      '{Replace: Completely replace the tabs on the other device with the tabs from this device}';
  @override
  String get merge => TranslationOverrides.string(_root.$meta, 'settings.sync.merge', {}) ?? '{Merge}';
  @override
  String get replace => TranslationOverrides.string(_root.$meta, 'settings.sync.replace', {}) ?? '{Replace}';
  @override
  String get sendTags => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTags', {}) ?? '{Send tags}';
  @override
  String tagsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsCount', {'count': count}) ?? '{Tags: ${count}}';
  @override
  String get tagsSyncMode => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncMode', {}) ?? '{Tags sync mode}';
  @override
  String get tagsSyncModePreferTypeIfNone =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModePreferTypeIfNone', {}) ??
      '{PreferTypeIfNone: If the tag exists with a tag type on the other device and it doesn\'t on this device it will be skipped}';
  @override
  String get tagsSyncModeOverwrite =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModeOverwrite', {}) ??
      '{Overwrite: All tags will be added, if a tag and tag type exists on the other device it will be overwritten}';
  @override
  String get preferTypeIfNone => TranslationOverrides.string(_root.$meta, 'settings.sync.preferTypeIfNone', {}) ?? '{PreferTypeIfNone}';
  @override
  String get overwrite => TranslationOverrides.string(_root.$meta, 'settings.sync.overwrite', {}) ?? '{Overwrite}';
  @override
  String get testConnection => TranslationOverrides.string(_root.$meta, 'settings.sync.testConnection', {}) ?? '{Test connection}';
  @override
  String get testConnectionHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText1', {}) ?? '{This will send a test request to the other device.}';
  @override
  String get testConnectionHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText2', {}) ??
      '{There will be a notification stating if the request was successful or not.}';
  @override
  String get startSync => TranslationOverrides.string(_root.$meta, 'settings.sync.startSync', {}) ?? '{Start sync}';
  @override
  String get portAndIPCannotBeEmpty =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.portAndIPCannotBeEmpty', {}) ?? '{The Port and IP fields cannot be empty!}';
  @override
  String get nothingSelectedToSync =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.nothingSelectedToSync', {}) ?? '{You haven\'t selected anything to sync!}';
  @override
  String get statsOfThisDevice => TranslationOverrides.string(_root.$meta, 'settings.sync.statsOfThisDevice', {}) ?? '{Stats of this device:}';
  @override
  String get receiverInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.receiverInstructions', {}) ??
      '{Start the server if you want to recieve data from another device, do not use this on public wifi as you might get pozzed}';
  @override
  String get availableNetworkInterfaces =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.availableNetworkInterfaces', {}) ?? '{Available network interfaces}';
  @override
  String selectedInterfaceIP({required String ip}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.selectedInterfaceIP', {'ip': ip}) ?? '{Selected interface IP: ${ip}}';
  @override
  String get serverPort => TranslationOverrides.string(_root.$meta, 'settings.sync.serverPort', {}) ?? '{Server port}';
  @override
  String get serverPortPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.serverPortPlaceholder', {}) ?? '{(will default to \'8080\' if empty)}';
  @override
  String get startReceiverServer => TranslationOverrides.string(_root.$meta, 'settings.sync.startReceiverServer', {}) ?? '{Start receiver server}';
  @override
  String get keepTheScreenAwake => TranslationOverrides.string(_root.$meta, 'settings.sync.keepTheScreenAwake', {}) ?? '{Keep the screen awake}';
}

// Path: settings.about
class _TranslationsSettingsAboutDev extends TranslationsSettingsAboutEn {
  _TranslationsSettingsAboutDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.about.title', {}) ?? '{About}';
  @override
  String get appDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ??
      '{LoliSnatcher is open source and licensed under GPLv3 the source code is available on github. Please report any issues or feature requests in the issues section of the repo.}';
  @override
  String get appOnGitHub => TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? '{LoliSnatcher on Github}';
  @override
  String get contact => TranslationOverrides.string(_root.$meta, 'settings.about.contact', {}) ?? '{Contact}';
  @override
  String get emailCopied => TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? '{Email copied to clipboard}';
  @override
  String get logoArtistThanks =>
      TranslationOverrides.string(_root.$meta, 'settings.about.logoArtistThanks', {}) ??
      '{A big thanks to Showers-U for letting us use their artwork for the app logo. Please check them out on Pixiv}';
  @override
  String get developers => TranslationOverrides.string(_root.$meta, 'settings.about.developers', {}) ?? '{Developers}';
  @override
  String get releases => TranslationOverrides.string(_root.$meta, 'settings.about.releases', {}) ?? '{Releases}';
  @override
  String get releasesMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.about.releasesMsg', {}) ??
      '{Latest version and full changelogs can be found at the Github Releases page:}';
  @override
  String get licenses => TranslationOverrides.string(_root.$meta, 'settings.about.licenses', {}) ?? '{Licenses}';
}

// Path: settings.checkForUpdates
class _TranslationsSettingsCheckForUpdatesDev extends TranslationsSettingsCheckForUpdatesEn {
  _TranslationsSettingsCheckForUpdatesDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.title', {}) ?? '{Check for updates}';
  @override
  String get updateAvailable => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateAvailable', {}) ?? '{Update available!}';
  @override
  String get updateChangelog => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? '{Update changelog}';
  @override
  String get updateCheckError => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? '{Update check error!}';
  @override
  String get youHaveLatestVersion =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? '{You have the latest version}';
  @override
  String get viewLatestChangelog =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ?? '{View latest changelog}';
  @override
  String get currentVersion => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? '{Current version}';
  @override
  String get changelog => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? '{Changelog}';
  @override
  String get visitPlayStore => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? '{Visit Play Store}';
  @override
  String get visitReleases => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? '{Visit releases}';
}

// Path: settings.logs
class _TranslationsSettingsLogsDev extends TranslationsSettingsLogsEn {
  _TranslationsSettingsLogsDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.logs.title', {}) ?? '{Logs}';
  @override
  String get shareLogs => TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogs', {}) ?? '{Share logs}';
  @override
  String get shareLogsWarningTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningTitle', {}) ?? '{Share logs to external app?}';
  @override
  String get shareLogsWarningMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningMsg', {}) ??
      '{[WARNING]: Logs may contain sensitive information, share with caution!}';
}

// Path: settings.help
class _TranslationsSettingsHelpDev extends TranslationsSettingsHelpEn {
  _TranslationsSettingsHelpDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? '{Help}';
}

// Path: settings.debug
class _TranslationsSettingsDebugDev extends TranslationsSettingsDebugEn {
  _TranslationsSettingsDebugDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.debug.title', {}) ?? '{Debug}';
  @override
  String get enabledSnackbarMsg => TranslationOverrides.string(_root.$meta, 'settings.debug.enabledSnackbarMsg', {}) ?? '{Debug mode is enabled!}';
  @override
  String get disabledSnackbarMsg => TranslationOverrides.string(_root.$meta, 'settings.debug.disabledSnackbarMsg', {}) ?? '{Debug mode is disabled!}';
  @override
  String get alreadyEnabledSnackbarMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.alreadyEnabledSnackbarMsg', {}) ?? '{Debug mode is already enabled!}';
  @override
  String get openAlice => TranslationOverrides.string(_root.$meta, 'settings.debug.openAlice', {}) ?? '{Open network inspector}';
  @override
  String get openLogger => TranslationOverrides.string(_root.$meta, 'settings.debug.openLogger', {}) ?? '{Open logger}';
  @override
  String get showPerformanceGraph =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.showPerformanceGraph', {}) ?? '{Show performance graph}';
  @override
  String get showFPSGraph => TranslationOverrides.string(_root.$meta, 'settings.debug.showFPSGraph', {}) ?? '{Show FPS graph}';
  @override
  String get showImageStats => TranslationOverrides.string(_root.$meta, 'settings.debug.showImageStats', {}) ?? '{Show image stats}';
  @override
  String get showVideoStats => TranslationOverrides.string(_root.$meta, 'settings.debug.showVideoStats', {}) ?? '{Show video stats}';
  @override
  String get blurImagesAndMuteVideosDevOnly =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.blurImagesAndMuteVideosDevOnly', {}) ?? '{Blur images + mute videos [DEV only]}';
  @override
  String get enableDragScrollOnListsDesktopOnly =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.enableDragScrollOnListsDesktopOnly', {}) ??
      '{Enable drag scroll on lists [Desktop only]}';
  @override
  String animationSpeed({required double speed}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.animationSpeed', {'speed': speed}) ?? '{Animation speed (${speed})}';
  @override
  String get tagsManager => TranslationOverrides.string(_root.$meta, 'settings.debug.tagsManager', {}) ?? '{Tags Manager}';
  @override
  String get vibration => TranslationOverrides.string(_root.$meta, 'settings.debug.vibration', {}) ?? '{Vibration}';
  @override
  String get vibrationTests => TranslationOverrides.string(_root.$meta, 'settings.debug.vibrationTests', {}) ?? '{Vibration tests}';
  @override
  String get duration => TranslationOverrides.string(_root.$meta, 'settings.debug.duration', {}) ?? '{Duration}';
  @override
  String get amplitude => TranslationOverrides.string(_root.$meta, 'settings.debug.amplitude', {}) ?? '{Amplitude}';
  @override
  String get flutterway => TranslationOverrides.string(_root.$meta, 'settings.debug.flutterway', {}) ?? '{Flutterway}';
  @override
  String get vibrate => TranslationOverrides.string(_root.$meta, 'settings.debug.vibrate', {}) ?? '{Vibrate}';
  @override
  String resolution({required String width, required String height}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.resolution', {'width': width, 'height': height}) ?? '{Res: ${width}x${height}}';
  @override
  String pixelRatio({required String ratio}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.pixelRatio', {'ratio': ratio}) ?? '{Pixel ratio: ${ratio}}';
  @override
  String get logger => TranslationOverrides.string(_root.$meta, 'settings.debug.logger', {}) ?? '{Logger}';
  @override
  String get webview => TranslationOverrides.string(_root.$meta, 'settings.debug.webview', {}) ?? '{Webview}';
  @override
  String get deleteAllCookies => TranslationOverrides.string(_root.$meta, 'settings.debug.deleteAllCookies', {}) ?? '{Delete all cookies}';
  @override
  String get clearSecureStorage => TranslationOverrides.string(_root.$meta, 'settings.debug.clearSecureStorage', {}) ?? '{Clear secure storage}';
  @override
  String get getSessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.getSessionString', {}) ?? '{Get session string}';
  @override
  String get setSessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.setSessionString', {}) ?? '{Set session string}';
  @override
  String get sessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.sessionString', {}) ?? '{Session string}';
  @override
  String get restoredSessionFromString =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.restoredSessionFromString', {}) ?? '{Restored session from string}';
}

// Path: settings.logging
class _TranslationsSettingsLoggingDev extends TranslationsSettingsLoggingEn {
  _TranslationsSettingsLoggingDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.logging.title', {}) ?? '{Logging}';
  @override
  String get logger => TranslationOverrides.string(_root.$meta, 'settings.logging.logger', {}) ?? '{Logger}';
  @override
  String get enabledMsg => TranslationOverrides.string(_root.$meta, 'settings.logging.enabledMsg', {}) ?? '{Logging is enabled}';
  @override
  String get enabledLogTypes => TranslationOverrides.string(_root.$meta, 'settings.logging.enabledLogTypes', {}) ?? '{Enabled log types}';
  @override
  String get disableTip =>
      TranslationOverrides.string(_root.$meta, 'settings.logging.disableTip', {}) ?? '{You can disable logging in the debug settings}';
}

// Path: settings.webview
class _TranslationsSettingsWebviewDev extends TranslationsSettingsWebviewEn {
  _TranslationsSettingsWebviewDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get openWebview => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? '{Open webview}';
  @override
  String get openWebviewTip => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? '{to login or obtain cookies}';
}

// Path: settings.dirPicker
class _TranslationsSettingsDirPickerDev extends TranslationsSettingsDirPickerEn {
  _TranslationsSettingsDirPickerDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get defaultPath => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.defaultPath', {}) ?? '{/0}';
  @override
  String get directoryName => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryName', {}) ?? '{Directory name}';
  @override
  String get selectADirectory => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.selectADirectory', {}) ?? '{Select a directory}';
  @override
  String get closeWithoutChoosing =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.closeWithoutChoosing', {}) ??
      '{Do you want to close the picker without choosing a directory?}';
  @override
  String get no => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.no', {}) ?? '{No}';
  @override
  String get yes => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.yes', {}) ?? '{Yes}';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.error', {}) ?? '{Error!}';
  @override
  String get failedToCreateDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.failedToCreateDirectory', {}) ?? '{Failed to create directory}';
  @override
  String get directoryNotWritable =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryNotWritable', {}) ?? '{Directory is not writable!}';
  @override
  String get newDirectory => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.newDirectory', {}) ?? '{New directory}';
  @override
  String get create => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.create', {}) ?? '{Create}';
}

// Path: viewer.tutorial
class _TranslationsViewerTutorialDev extends TranslationsViewerTutorialEn {
  _TranslationsViewerTutorialDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get images => TranslationOverrides.string(_root.$meta, 'viewer.tutorial.images', {}) ?? '{Images}';
  @override
  String get tapLongTapToggleImmersive =>
      TranslationOverrides.string(_root.$meta, 'viewer.tutorial.tapLongTapToggleImmersive', {}) ?? '{Tap/Long tap: toggle immersive mode}';
  @override
  String get doubleTapFitScreen =>
      TranslationOverrides.string(_root.$meta, 'viewer.tutorial.doubleTapFitScreen', {}) ??
      '{Double tap: fit to screen / original size / reset zoom}';
}

// Path: viewer.appBar
class _TranslationsViewerAppBarDev extends TranslationsViewerAppBarEn {
  _TranslationsViewerAppBarDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get cantStartSlideshow => TranslationOverrides.string(_root.$meta, 'viewer.appBar.cantStartSlideshow', {}) ?? '{Can\'t start Slideshow}';
  @override
  String get reachedLastLoadedItem =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.reachedLastLoadedItem', {}) ?? '{Reached the Last loaded Item}';
  @override
  String get pause => TranslationOverrides.string(_root.$meta, 'viewer.appBar.pause', {}) ?? '{Pause}';
  @override
  String get start => TranslationOverrides.string(_root.$meta, 'viewer.appBar.start', {}) ?? '{Start}';
  @override
  String get unfavourite => TranslationOverrides.string(_root.$meta, 'viewer.appBar.unfavourite', {}) ?? '{Unfavourite}';
  @override
  String get deselect => TranslationOverrides.string(_root.$meta, 'viewer.appBar.deselect', {}) ?? '{Deselect}';
  @override
  String get reloadWithScaling => TranslationOverrides.string(_root.$meta, 'viewer.appBar.reloadWithScaling', {}) ?? '{Reload with scaling}';
  @override
  String get loadSampleQuality => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadSampleQuality', {}) ?? '{Load sample quality}';
  @override
  String get loadHighQuality => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadHighQuality', {}) ?? '{Load high quality}';
  @override
  String get dropSnatchedStatus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.dropSnatchedStatus', {}) ?? '{Drop snatched status}';
  @override
  String get setSnatchedStatus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.setSnatchedStatus', {}) ?? '{Set snatched status}';
  @override
  String get snatch => TranslationOverrides.string(_root.$meta, 'viewer.appBar.snatch', {}) ?? '{Snatch}';
  @override
  String get forced => TranslationOverrides.string(_root.$meta, 'viewer.appBar.forced', {}) ?? '{(forced)}';
  @override
  String get hydrusShare => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusShare', {}) ?? '{Hydrus share}';
  @override
  String get whichUrlToShareToHydrus =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.whichUrlToShareToHydrus', {}) ?? '{Which URL you want to share to Hydrus?}';
  @override
  String get postURL => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURL', {}) ?? '{Post URL}';
  @override
  String get fileURL => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURL', {}) ?? '{File URL}';
  @override
  String get hydrusNotConfigured =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusNotConfigured', {}) ?? '{Hydrus is not configured!}';
  @override
  String get shareFile => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareFile', {}) ?? '{Share file}';
  @override
  String get alreadyDownloadingThisFile =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingThisFile', {}) ??
      '{Already downloading this file for sharing, do you want to abort?}';
  @override
  String get alreadyDownloadingFile =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingFile', {}) ??
      '{Already downloading file for sharing, do you want to abort current file and share a new file?}';
  @override
  String get current => TranslationOverrides.string(_root.$meta, 'viewer.appBar.current', {}) ?? '{Current:}';
  @override
  String get kNew => TranslationOverrides.string(_root.$meta, 'viewer.appBar.kNew', {}) ?? '{New:}';
  @override
  String get shareNew => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareNew', {}) ?? '{Share new}';
  @override
  String get abort => TranslationOverrides.string(_root.$meta, 'viewer.appBar.abort', {}) ?? '{Abort}';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'viewer.appBar.error', {}) ?? '{Error!}';
  @override
  String get savingFileError =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.savingFileError', {}) ?? '{Something went wrong when saving the File before Sharing}';
  @override
  String get whatToShare => TranslationOverrides.string(_root.$meta, 'viewer.appBar.whatToShare', {}) ?? '{What you want to Share?}';
  @override
  String get postURLWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURLWithTags', {}) ?? '{Post URL with tags}';
  @override
  String get fileURLWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURLWithTags', {}) ?? '{File URL with tags}';
  @override
  String get file => TranslationOverrides.string(_root.$meta, 'viewer.appBar.file', {}) ?? '{File}';
  @override
  String get fileWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileWithTags', {}) ?? '{File with tags}';
  @override
  String get hydrus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrus', {}) ?? '{Hydrus}';
  @override
  String get selectTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.selectTags', {}) ?? '{Select tags}';
}

// Path: viewer.notes
class _TranslationsViewerNotesDev extends TranslationsViewerNotesEn {
  _TranslationsViewerNotesDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get note => TranslationOverrides.string(_root.$meta, 'viewer.notes.note', {}) ?? '{Note}';
  @override
  String get notes => TranslationOverrides.string(_root.$meta, 'viewer.notes.notes', {}) ?? '{Notes}';
  @override
  String get closeDialog => TranslationOverrides.string(_root.$meta, 'viewer.notes.closeDialog', {}) ?? '{Close}';
  @override
  String coordinates({required int posX, required int posY}) =>
      TranslationOverrides.string(_root.$meta, 'viewer.notes.coordinates', {'posX': posX, 'posY': posY}) ?? '{X:${posX}, Y:${posY}}';
}

// Path: media.loading
class _TranslationsMediaLoadingDev extends TranslationsMediaLoadingEn {
  _TranslationsMediaLoadingDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get rendering => TranslationOverrides.string(_root.$meta, 'media.loading.rendering', {}) ?? '{Rendering...}';
  @override
  String get loadingAndRenderingFromCache =>
      TranslationOverrides.string(_root.$meta, 'media.loading.loadingAndRenderingFromCache', {}) ?? '{Loading and rendering from cache...}';
  @override
  String get loadingFromCache => TranslationOverrides.string(_root.$meta, 'media.loading.loadingFromCache', {}) ?? '{Loading from cache...}';
  @override
  String get buffering => TranslationOverrides.string(_root.$meta, 'media.loading.buffering', {}) ?? '{Buffering...}';
  @override
  String get loading => TranslationOverrides.string(_root.$meta, 'media.loading.loading', {}) ?? '{Loading...}';
  @override
  String get loadAnyway => TranslationOverrides.string(_root.$meta, 'media.loading.loadAnyway', {}) ?? '{Load anyway}';
  @override
  String get restartLoading => TranslationOverrides.string(_root.$meta, 'media.loading.restartLoading', {}) ?? '{Restart loading}';
  @override
  String get stopLoading => TranslationOverrides.string(_root.$meta, 'media.loading.stopLoading', {}) ?? '{Stop loading}';
  @override
  String startedSecondsAgo({required int seconds}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.startedSecondsAgo', {'seconds': seconds}) ?? '{Started ${seconds}s ago}';
}

// Path: media.video
class _TranslationsMediaVideoDev extends TranslationsMediaVideoEn {
  _TranslationsMediaVideoDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get videosDisabledOrNotSupported =>
      TranslationOverrides.string(_root.$meta, 'media.video.videosDisabledOrNotSupported', {}) ?? '{Videos disabled or not supported}';
  @override
  String get openVideoInExternalPlayer =>
      TranslationOverrides.string(_root.$meta, 'media.video.openVideoInExternalPlayer', {}) ?? '{Open video in external player}';
  @override
  String get openVideoInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openVideoInBrowser', {}) ?? '{Open video in browser}';
  @override
  String get failedToLoadItemData => TranslationOverrides.string(_root.$meta, 'media.video.failedToLoadItemData', {}) ?? '{Failed to load item data}';
  @override
  String get loadingItemData => TranslationOverrides.string(_root.$meta, 'media.video.loadingItemData', {}) ?? '{Loading item data...}';
  @override
  String get retry => TranslationOverrides.string(_root.$meta, 'media.video.retry', {}) ?? '{Retry}';
  @override
  String get openFileInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openFileInBrowser', {}) ?? '{Open file in browser}';
  @override
  String get openPostInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openPostInBrowser', {}) ?? '{Open post in browser}';
  @override
  String get currentlyChecking => TranslationOverrides.string(_root.$meta, 'media.video.currentlyChecking', {}) ?? '{Currently checking:}';
  @override
  String unknownFileFormat({required String fileExt}) =>
      TranslationOverrides.string(_root.$meta, 'media.video.unknownFileFormat', {'fileExt': fileExt}) ??
      '{Unknown file format (.${fileExt}), tap here to open in browser}';
}

// Path: preview.error
class _TranslationsPreviewErrorDev extends TranslationsPreviewErrorEn {
  _TranslationsPreviewErrorDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get noResults => TranslationOverrides.string(_root.$meta, 'preview.error.noResults', {}) ?? '{No results}';
  @override
  String get noResultsSubtitle =>
      TranslationOverrides.string(_root.$meta, 'preview.error.noResultsSubtitle', {}) ?? '{Try changing your search query or tap here to retry}';
  @override
  String get reachedEnd => TranslationOverrides.string(_root.$meta, 'preview.error.reachedEnd', {}) ?? '{You reached the end}';
  @override
  String reachedEndSubtitle({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.reachedEndSubtitle', {'pageNum': pageNum}) ??
      '{Loaded ${pageNum} pages\nTap here to reload last page}';
  @override
  String loadingPage({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.loadingPage', {'pageNum': pageNum}) ?? '{Loading page #${pageNum}...}';
  @override
  String startedAgo({required num seconds}) =>
      TranslationOverrides.plural(_root.$meta, 'preview.error.startedAgo', {'seconds': seconds}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
        seconds,
        one: '{Started 1 second ago}',
        other: '{Started ${seconds} seconds ago}',
      );
  @override
  String get tapToRetryIfStuck =>
      TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetryIfStuck', {}) ??
      '{Tap here to retry if search is taking too long or seems stuck}';
  @override
  String errorLoadingPage({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.errorLoadingPage', {'pageNum': pageNum}) ?? '{Error when loading page #${pageNum}}';
  @override
  String get errorWithMessage => TranslationOverrides.string(_root.$meta, 'preview.error.errorWithMessage', {}) ?? '{Tap here to retry}';
  @override
  String get errorNoResultsLoaded =>
      TranslationOverrides.string(_root.$meta, 'preview.error.errorNoResultsLoaded', {}) ?? '{Error, no results loaded}';
  @override
  String get tapToRetry => TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetry', {}) ?? '{Tap here to retry}';
}

// Path: settings.video.cacheModes
class _TranslationsSettingsVideoCacheModesDev extends TranslationsSettingsVideoCacheModesEn {
  _TranslationsSettingsVideoCacheModesDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.title', {}) ?? '{Video cache modes}';
  @override
  String get streamMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamMode', {}) ??
      '{- Stream - Don\'t cache, start playing as soon as possible}';
  @override
  String get cacheMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheMode', {}) ??
      '{- Cache - Saves the file to device storage, plays only when download is complete}';
  @override
  String get streamCacheMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamCacheMode', {}) ??
      '{- Stream+Cache - Mix of both, but currently leads to double download}';
  @override
  String get cacheNote =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheNote', {}) ??
      '{[Note]: Videos will cache only if \'Cache Media\' is enabled.}';
  @override
  String get desktopWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.desktopWarning', {}) ??
      '{[Warning]: On desktop Stream mode can work incorrectly for some Boorus.}';
}

/// The flat map containing all translations for locale <dev>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsDev {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
          'locale' => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'dev',
          'localeName' => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'Dev',
          'appName' => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? '{LoliSnatcher}',
          'error' => TranslationOverrides.string(_root.$meta, 'error', {}) ?? '{Error}',
          'errorExclamation' => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? '{Error!}',
          'warning' => TranslationOverrides.string(_root.$meta, 'warning', {}) ?? '{Warning}',
          'warningExclamation' => TranslationOverrides.string(_root.$meta, 'warningExclamation', {}) ?? '{Warning!}',
          'info' => TranslationOverrides.string(_root.$meta, 'info', {}) ?? '{Info}',
          'success' => TranslationOverrides.string(_root.$meta, 'success', {}) ?? '{Success}',
          'successExclamation' => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? '{Success!}',
          'cancel' => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? '{Cancel}',
          'later' => TranslationOverrides.string(_root.$meta, 'later', {}) ?? '{Later}',
          'close' => TranslationOverrides.string(_root.$meta, 'close', {}) ?? '{Close}',
          'ok' => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? '{OK}',
          'yes' => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? '{Yes}',
          'no' => TranslationOverrides.string(_root.$meta, 'no', {}) ?? '{No}',
          'pleaseWait' => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? '{Please wait...}',
          'show' => TranslationOverrides.string(_root.$meta, 'show', {}) ?? '{Show}',
          'hide' => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? '{Hide}',
          'enable' => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? '{Enable}',
          'disable' => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? '{Disable}',
          'add' => TranslationOverrides.string(_root.$meta, 'add', {}) ?? '{Add}',
          'edit' => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? '{Edit}',
          'remove' => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? '{Remove}',
          'save' => TranslationOverrides.string(_root.$meta, 'save', {}) ?? '{Save}',
          'delete' => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? '{Delete}',
          'confirm' => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? '{Confirm}',
          'retry' => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? '{Retry}',
          'clear' => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? '{Clear}',
          'copy' => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? '{Copy}',
          'copied' => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? '{Copied}',
          'copiedToClipboard' => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? '{Copied to clipboard}',
          'nothingFound' => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? '{Nothing found}',
          'paste' => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? '{Paste}',
          'copyErrorText' => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? '{Copy error}',
          'booru' => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? '{Booru}',
          'goToSettings' => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? '{Go to settings}',
          'areYouSure' => TranslationOverrides.string(_root.$meta, 'areYouSure', {}) ?? '{Are you sure?}',
          'thisMayTakeSomeTime' => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? '{This may take some time...}',
          'doYouWantToExitApp' => TranslationOverrides.string(_root.$meta, 'doYouWantToExitApp', {}) ?? '{Do you want to exit the app?}',
          'closeTheApp' => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? '{Close the app}',
          'invalidUrl' => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? '{Invalid URL!}',
          'clipboardIsEmpty' => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? '{Clipboard is empty!}',
          'failedToOpenLink' => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? '{Failed to open link}',
          'apiKey' => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? '{API Key}',
          'userId' => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? '{User ID}',
          'login' => TranslationOverrides.string(_root.$meta, 'login', {}) ?? '{Login}',
          'password' => TranslationOverrides.string(_root.$meta, 'password', {}) ?? '{Password}',
          'pause' => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? '{Pause}',
          'resume' => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? '{Resume}',
          'discord' => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? '{Discord}',
          'visitOurDiscord' => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? '{Visit our Discord server}',
          'item' => TranslationOverrides.string(_root.$meta, 'item', {}) ?? '{Item}',
          'select' => TranslationOverrides.string(_root.$meta, 'select', {}) ?? '{Select}',
          'selectAll' => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? '{Select all}',
          'reset' => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? '{Reset}',
          'open' => TranslationOverrides.string(_root.$meta, 'open', {}) ?? '{Open}',
          'openInNewTab' => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? '{Open in new tab}',
          'move' => TranslationOverrides.string(_root.$meta, 'move', {}) ?? '{Move}',
          'shuffle' => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? '{Shuffle}',
          'sort' => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? '{Sort}',
          'sortTabs' => TranslationOverrides.string(_root.$meta, 'sortTabs', {}) ?? '{Sort tabs}',
          'go' => TranslationOverrides.string(_root.$meta, 'go', {}) ?? '{Go}',
          'jump' => TranslationOverrides.string(_root.$meta, 'jump', {}) ?? '{Jump}',
          'jumpToPage' => TranslationOverrides.string(_root.$meta, 'jumpToPage', {}) ?? '{Jump to page}',
          'searchUntilPage' => TranslationOverrides.string(_root.$meta, 'searchUntilPage', {}) ?? '{Search until page}',
          'stopSearching' => TranslationOverrides.string(_root.$meta, 'stopSearching', {}) ?? '{Stop searching}',
          'search' => TranslationOverrides.string(_root.$meta, 'search', {}) ?? '{Search}',
          'filter' => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? '{Filter}',
          'or' => TranslationOverrides.string(_root.$meta, 'or', {}) ?? '{Or (~)}',
          'page' => TranslationOverrides.string(_root.$meta, 'page', {}) ?? '{Page}',
          'pageNumber' => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? '{Page #}',
          'tags' => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? '{Tags}',
          'type' => TranslationOverrides.string(_root.$meta, 'type', {}) ?? '{Type}',
          'name' => TranslationOverrides.string(_root.$meta, 'name', {}) ?? '{Name}',
          'address' => TranslationOverrides.string(_root.$meta, 'address', {}) ?? '{Address}',
          'username' => TranslationOverrides.string(_root.$meta, 'username', {}) ?? '{Username}',
          'validationErrors.required' => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? '{Please enter a value}',
          'validationErrors.invalid' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? '{Please enter a valid value}',
          'validationErrors.invalidNumber' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? '{Please enter a number}',
          'validationErrors.invalidNumericValue' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? '{Please enter a valid numeric value}',
          'validationErrors.tooSmall' =>
            ({required double min}) =>
                TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? '{Please enter a value bigger than ${min}}',
          'validationErrors.tooBig' =>
            ({required double max}) =>
                TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? '{Please enter a value smaller than ${max}}',
          'validationErrors.rangeError' =>
            ({required double min, required double max}) =>
                TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ??
                '{Please enter a value between ${min} and ${max}}',
          'validationErrors.greaterThanOrEqualZero' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ??
                '{Please enter a value equal to or greater than 0}',
          'validationErrors.lessThan4' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? '{Please enter a value less than 4}',
          'validationErrors.biggerThan100' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? '{Please enter a value bigger than 100}',
          'validationErrors.validTabNumber' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.validTabNumber', {}) ?? '{Please enter a valid tab number}',
          'validationErrors.moreThan4ColumnsWarning' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ??
                '{Using more than 4 columns can affect performance}',
          'validationErrors.moreThan8ColumnsWarning' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ??
                '{Using more than 8 columns can affect performance}',
          'init.initError' => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? '{Initialization error!}',
          'init.postInitError' => TranslationOverrides.string(_root.$meta, 'init.postInitError', {}) ?? '{Post initialization error!}',
          'init.settingUpProxy' => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? '{Setting up proxy...}',
          'init.loadingDatabase' => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? '{Loading database...}',
          'init.loadingBoorus' => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? '{Loading boorus...}',
          'init.loadingTags' => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? '{Loading tags...}',
          'init.restoringTabs' => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? '{Restoring tabs...}',
          'permissions.noAccessToCustomStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ?? '{No access to custom storage directory}',
          'permissions.pleaseSetStorageDirectoryAgain' =>
            TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ??
                '{Please set storage directory again to grant the app access to it}',
          'permissions.currentPath' =>
            ({required String path}) =>
                TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? '{Current path: ${path}}',
          'permissions.setDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? '{Set directory}',
          'permissions.currentlyNotAvailableForThisPlatform' =>
            TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ??
                '{Currently not available for this platform}',
          'permissions.resetDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? '{Reset directory}',
          'permissions.afterResetFilesWillBeSavedToDefaultDirectory' =>
            TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ??
                '{After reset files will be saved to default system directory}',
          'authentication.pleaseAuthenticateToUseTheApp' =>
            TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ?? '{Please authenticate to use the app}',
          'authentication.noBiometricHardwareAvailable' =>
            TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? '{No biometric hardware available}',
          'authentication.temporaryLockout' =>
            TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? '{Temporary lockout}',
          'authentication.somethingWentWrong' =>
            ({required String error}) =>
                TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ?? '{Something went wrong: ${error}}',
          'searchHandler.removedLastTab' => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? '{Removed last tab}',
          'searchHandler.resettingSearchToDefaultTags' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? '{Resetting search to default tags}',
          'searchHandler.uoh' => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? '{UOOOOOOOHHH}',
          'searchHandler.ratingsChanged' => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? '{Ratings changed}',
          'searchHandler.ratingsChangedMessage' =>
            ({required String booruType}) =>
                TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
                '{On ${booruType} [rating:safe] is now replaced with [rating:general] and [rating:sensitive]}',
          'searchHandler.appFixedRatingAutomatically' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ??
                '{App fixed the rating automatically, but consider changing to correct rating in your future queries}',
          'searchHandler.tabsRestored' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? '{Tabs restored}',
          'searchHandler.restoredTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
                  count,
                  one: '{Restored 1 tab from previous session}',
                  other: '{Restored ${count} tabs from previous session}',
                ),
          'searchHandler.someRestoredTabsHadIssues' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ??
                '{Some restored tabs had unknown boorus or broken characters.}',
          'searchHandler.theyWereSetToDefaultOrIgnored' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ?? '{They were set to default or ignored.}',
          'searchHandler.listOfBrokenTabs' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? '{List of broken tabs:}',
          'searchHandler.tabsMerged' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? '{Tabs merged}',
          'searchHandler.addedTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
                  count,
                  one: '{Added 1 new tab}',
                  other: '{Added ${count} new tabs}',
                ),
          'searchHandler.tabsReplaced' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? '{Tabs replaced}',
          'searchHandler.receivedTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
                  count,
                  one: '{Received 1 tab}',
                  other: '{Received ${count} tabs}',
                ),
          'snatcher.title' => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? '{Snatcher}',
          'snatcher.snatchingHistory' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? '{Snatching history}',
          'snatcher.enterTags' => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? '{Enter tags}',
          'snatcher.amount' => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? '{Amount}',
          'snatcher.amountOfFilesToSnatch' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? '{Amount of Files to Snatch}',
          'snatcher.delayInMs' => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? '{Delay (in ms)}',
          'snatcher.delayBetweenEachDownload' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? '{Delay between each download}',
          'snatcher.snatchFiles' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? '{Snatch files}',
          'snatcher.itemWasAlreadySnatched' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? '{Item was already snatched before}',
          'snatcher.failedToSnatchItem' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? '{Failed to snatch the item}',
          'snatcher.itemWasCancelled' => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? '{Item was cancelled}',
          'snatcher.startingNextQueueItem' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? '{Starting next queue item...}',
          'snatcher.itemsSnatched' => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? '{Items snatched}',
          'snatcher.snatchedCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
                  count,
                  one: '{Snatched: 1 item}',
                  other: '{Snatched: ${count} items}',
                ),
          'snatcher.filesAlreadySnatched' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
                  count,
                  one: '{1 file was already snatched}',
                  other: '{${count} files were already snatched}',
                ),
          'snatcher.failedToSnatchFiles' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
                  count,
                  one: '{Failed to snatch 1 file}',
                  other: '{Failed to snatch ${count} files}',
                ),
          'snatcher.cancelledFiles' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
                  count,
                  one: '{Cancelled 1 file}',
                  other: '{Cancelled ${count} files}',
                ),
          'snatcher.snatchingImages' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? '{Snatching images}',
          'snatcher.doNotCloseApp' => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? '{Do not close the app!}',
          'snatcher.addedItemToQueue' => TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? '{Added item to snatch queue}',
          'snatcher.addedItemsToQueue' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
                  count,
                  one: '{Added 1 item to snatch queue}',
                  other: '{Added ${count} items to snatch queue}',
                ),
          'multibooru.title' => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? '{Multibooru}',
          'multibooru.multibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? '{Multibooru mode}',
          'multibooru.multibooruRequiresAtLeastTwoBoorus' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ??
                '{Multibooru mode requires at least 2 boorus to be configured}',
          'multibooru.selectSecondaryBoorus' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? '{Select secondary boorus:}',
          'multibooru.akaMultibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? '{aka Multibooru mode}',
          'multibooru.labelSecondaryBoorusToInclude' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? '{Secondary boorus to include}',
          'hydrus.importError' => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? '{Something went wrong importing to hydrus}',
          'hydrus.apiPermissionsRequired' =>
            TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ??
                '{You might not have given the correct API permissions, this can be edited in Review Services}',
          'hydrus.addTagsToFile' => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? '{Add tags to file}',
          'hydrus.addUrls' => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? '{Add URLs}',
          'tabs.tab' => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? '{Tab}',
          'tabs.addBoorusInSettings' => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? '{Add boorus in settings}',
          'tabs.selectABooru' => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? '{Select a Booru}',
          'tabs.secondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? '{Secondary boorus}',
          'tabs.addNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? '{Add new tab}',
          'tabs.selectABooruOrLeaveEmpty' =>
            TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? '{Select a booru or leave empty}',
          'tabs.addPosition' => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? '{Add position:}',
          'tabs.addModePrevTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? '{Prev tab}',
          'tabs.addModeNextTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? '{Next tab}',
          'tabs.addModeListEnd' => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? '{List end}',
          'tabs.usedQuery' => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? '{Used query:}',
          'tabs.queryModeDefault' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? '{Default}',
          'tabs.queryModeCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? '{Current}',
          'tabs.queryModeCustom' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? '{Custom}',
          'tabs.customQuery' => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? '{Custom query}',
          'tabs.empty' => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '{[empty]}',
          'tabs.addSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? '{Add secondary boorus}',
          'tabs.keepSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? '{Keep secondary boorus}',
          'tabs.startFromCustomPageNumber' =>
            TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? '{Start from custom page number}',
          'tabs.switchToNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? '{Switch to new tab}',
          'tabs.add' => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? '{Add}',
          'tabs.tabsManager' => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? '{Tabs Manager}',
          'tabs.selectMode' => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? '{Select mode}',
          'tabs.sortMode' => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? '{Sort tabs}',
          'tabs.help' => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? '{Help}',
          'tabs.deleteTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? '{Delete tabs}',
          'tabs.shuffleTabs' => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? '{Shuffle tabs}',
          'tabs.tabRandomlyShuffled' => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? '{Tab randomly shuffled}',
          'tabs.tabOrderSaved' => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? '{Tab order saved}',
          'tabs.scrollToCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? '{Scroll to current tab}',
          'tabs.scrollToTop' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? '{Scroll to top}',
          'tabs.scrollToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? '{Scroll to bottom}',
          'tabs.filterTabsByBooru' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? '{Filter tabs by booru, loaded state, duplicates, etc.}',
          'tabs.scrolling' => TranslationOverrides.string(_root.$meta, 'tabs.scrolling', {}) ?? '{Scrolling:}',
          'tabs.sorting' => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? '{Sorting:}',
          'tabs.defaultTabsOrder' => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? '{Default tabs order}',
          'tabs.sortAlphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? '{Sort alphabetically}',
          'tabs.sortAlphabeticallyReversed' =>
            TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? '{Sort alphabetically (reversed)}',
          'tabs.sortByBooruName' => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? '{Sort by booru name alphabetically}',
          'tabs.sortByBooruNameReversed' =>
            TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ?? '{Sort by booru name alphabetically (reversed)}',
          'tabs.longPressSortToSave' =>
            TranslationOverrides.string(_root.$meta, 'tabs.longPressSortToSave', {}) ??
                '{Long press on the sort button to save tabs in the current order}',
          'tabs.select' => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? '{Select:}',
          'tabs.toggleSelectMode' => TranslationOverrides.string(_root.$meta, 'tabs.toggleSelectMode', {}) ?? '{Toggle select mode}',
          'tabs.onTheBottomOfPage' => TranslationOverrides.string(_root.$meta, 'tabs.onTheBottomOfPage', {}) ?? '{On the bottom of the page: }',
          'tabs.selectDeselectAll' => TranslationOverrides.string(_root.$meta, 'tabs.selectDeselectAll', {}) ?? '{Select/deselect all tabs}',
          'tabs.deleteSelectedTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? '{Delete selected tabs}',
          'tabs.longPressToMove' => TranslationOverrides.string(_root.$meta, 'tabs.longPressToMove', {}) ?? '{Long press on a tab to move it}',
          'tabs.removedLastTab' => TranslationOverrides.string(_root.$meta, 'tabs.removedLastTab', {}) ?? '{Removed last tab}',
          'tabs.resettingToDefaultTags' =>
            TranslationOverrides.string(_root.$meta, 'tabs.resettingToDefaultTags', {}) ?? '{Resetting search to default tags}',
          'tabs.ratingsChanged' => TranslationOverrides.string(_root.$meta, 'tabs.ratingsChanged', {}) ?? '{Ratings changed}',
          'tabs.ratingsChangedOn' =>
            ({required String booruType}) =>
                TranslationOverrides.string(_root.$meta, 'tabs.ratingsChangedOn', {'booruType': booruType}) ?? '{On ${booruType} }',
          'tabs.ratingReplacedWith' => TranslationOverrides.string(_root.$meta, 'tabs.ratingReplacedWith', {}) ?? '{ is now replaced with }',
          'tabs.ratingAnd' => TranslationOverrides.string(_root.$meta, 'tabs.ratingAnd', {}) ?? '{ and }',
          'tabs.ratingsFixedAutomatically' =>
            TranslationOverrides.string(_root.$meta, 'tabs.ratingsFixedAutomatically', {}) ??
                '{App fixed the rating automatically, but consider changing to correct rating in your future queries}',
          'tabs.tabsRestored' => TranslationOverrides.string(_root.$meta, 'tabs.tabsRestored', {}) ?? '{Tabs restored}',
          'tabs.restoredTabs' =>
            ({required int count, required String tabsPlural}) =>
                TranslationOverrides.string(_root.$meta, 'tabs.restoredTabs', {'count': count, 'tabsPlural': tabsPlural}) ??
                '{Restored ${count} ${tabsPlural} from previous session}',
          'tabs.someTabsHadUnknownBoorus' =>
            TranslationOverrides.string(_root.$meta, 'tabs.someTabsHadUnknownBoorus', {}) ??
                '{Some restored tabs had unknown boorus or broken characters.}',
          'tabs.brokenTabsSetToDefault' =>
            TranslationOverrides.string(_root.$meta, 'tabs.brokenTabsSetToDefault', {}) ?? '{They were set to default or ignored.}',
          'tabs.listOfBrokenTabs' => TranslationOverrides.string(_root.$meta, 'tabs.listOfBrokenTabs', {}) ?? '{List of broken tabs:}',
          'tabs.tabsMerged' => TranslationOverrides.string(_root.$meta, 'tabs.tabsMerged', {}) ?? '{Tabs merged}',
          'tabs.addedNewTabs' =>
            ({required int count, required String tabsPlural}) =>
                TranslationOverrides.string(_root.$meta, 'tabs.addedNewTabs', {'count': count, 'tabsPlural': tabsPlural}) ??
                '{Added ${count} new ${tabsPlural}}',
          'tabs.tabsReplaced' => TranslationOverrides.string(_root.$meta, 'tabs.tabsReplaced', {}) ?? '{Tabs replaced}',
          'tabs.receivedTabs' =>
            ({required int count, required String tabsPlural}) =>
                TranslationOverrides.string(_root.$meta, 'tabs.receivedTabs', {'count': count, 'tabsPlural': tabsPlural}) ??
                '{Received ${count} ${tabsPlural}}',
          'tabs.numbersInBottomRight' =>
            TranslationOverrides.string(_root.$meta, 'tabs.numbersInBottomRight', {}) ?? '{Numbers in the bottom right of the tab:}',
          'tabs.firstNumberTabIndex' =>
            TranslationOverrides.string(_root.$meta, 'tabs.firstNumberTabIndex', {}) ?? '{First number - tab index in default list order}',
          'tabs.secondNumberTabIndex' =>
            TranslationOverrides.string(_root.$meta, 'tabs.secondNumberTabIndex', {}) ??
                '{Second number - tab index in current list order, appears when filtering/sorting is active}',
          'tabs.specialFilters' => TranslationOverrides.string(_root.$meta, 'tabs.specialFilters', {}) ?? '{Special filters:}',
          'tabs.loadedFilter' =>
            TranslationOverrides.string(_root.$meta, 'tabs.loadedFilter', {}) ?? '{"Loaded" - show tabs which have loaded items}',
          'tabs.notLoadedFilter' =>
            TranslationOverrides.string(_root.$meta, 'tabs.notLoadedFilter', {}) ??
                '{"Not loaded" - show tabs which are not loaded and/or have zero items}',
          'tabs.notLoadedItalic' => TranslationOverrides.string(_root.$meta, 'tabs.notLoadedItalic', {}) ?? '{Not loaded tabs have italic text}',
          'tabs.filterTabsInput' => TranslationOverrides.string(_root.$meta, 'tabs.filterTabsInput', {}) ?? '{Filter tabs}',
          'tabs.noTabsFound' => TranslationOverrides.string(_root.$meta, 'tabs.noTabsFound', {}) ?? '{No tabs found}',
          'tabs.copy' => TranslationOverrides.string(_root.$meta, 'tabs.copy', {}) ?? '{Copy}',
          'tabs.moveAction' => TranslationOverrides.string(_root.$meta, 'tabs.moveAction', {}) ?? '{Move}',
          'tabs.remove' => TranslationOverrides.string(_root.$meta, 'tabs.remove', {}) ?? '{Remove}',
          'tabs.shuffle' => TranslationOverrides.string(_root.$meta, 'tabs.shuffle', {}) ?? '{Shuffle}',
          'tabs.sort' => TranslationOverrides.string(_root.$meta, 'tabs.sort', {}) ?? '{Sort}',
          'tabs.shuffleTabsQuestion' => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabsQuestion', {}) ?? '{Shuffle tabs order randomly?}',
          'tabs.saveTabsInCurrentOrder' =>
            TranslationOverrides.string(_root.$meta, 'tabs.saveTabsInCurrentOrder', {}) ?? '{Save tabs in current sorting order?}',
          'tabs.byBooru' => TranslationOverrides.string(_root.$meta, 'tabs.byBooru', {}) ?? '{By booru}',
          'tabs.alphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.alphabetically', {}) ?? '{Alphabetically}',
          'tabs.reversed' => TranslationOverrides.string(_root.$meta, 'tabs.reversed', {}) ?? '{(reversed)}',
          'tabs.areYouSureDeleteTabs' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'tabs.areYouSureDeleteTabs', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
                  count,
                  one: '{Are you sure you want to delete 1 tab?}',
                  other: '{Are you sure you want to delete ${count} tabs?}',
                ),
          'tabs.filters.loaded' => TranslationOverrides.string(_root.$meta, 'tabs.filters.loaded', {}) ?? '{Loaded}',
          'tabs.filters.tagType' => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagType', {}) ?? '{Tag type}',
          'tabs.filters.multibooru' => TranslationOverrides.string(_root.$meta, 'tabs.filters.multibooru', {}) ?? '{Multibooru}',
          'tabs.filters.duplicates' => TranslationOverrides.string(_root.$meta, 'tabs.filters.duplicates', {}) ?? '{Duplicates}',
          'tabs.filters.checkDuplicatesOnSameBooru' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.checkDuplicatesOnSameBooru', {}) ?? '{Check for duplicates on same Booru}',
          'tabs.filters.emptySearchQuery' => TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? '{Empty search query}',
          'tabs.filters.title' => TranslationOverrides.string(_root.$meta, 'tabs.filters.title', {}) ?? '{Tab Filters}',
          'tabs.filters.all' => TranslationOverrides.string(_root.$meta, 'tabs.filters.all', {}) ?? '{All}',
          'tabs.filters.notLoaded' => TranslationOverrides.string(_root.$meta, 'tabs.filters.notLoaded', {}) ?? '{Not loaded}',
          'tabs.filters.enabled' => TranslationOverrides.string(_root.$meta, 'tabs.filters.enabled', {}) ?? '{Enabled}',
          'tabs.filters.disabled' => TranslationOverrides.string(_root.$meta, 'tabs.filters.disabled', {}) ?? '{Disabled}',
          'tabs.filters.willAlsoEnableSorting' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.willAlsoEnableSorting', {}) ?? '{Will also enable sorting}',
          'tabs.filters.tagTypeFilterHelp' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.tagTypeFilterHelp', {}) ??
                '{Filter tabs which contain at least one tag of selected type}',
          'tabs.filters.any' => TranslationOverrides.string(_root.$meta, 'tabs.filters.any', {}) ?? '{Any}',
          'tabs.filters.apply' => TranslationOverrides.string(_root.$meta, 'tabs.filters.apply', {}) ?? '{Apply}',
          'tabs.move.moveToTop' => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToTop', {}) ?? '{Move to top}',
          'tabs.move.moveToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToBottom', {}) ?? '{Move to bottom}',
          'tabs.move.tabNumber' => TranslationOverrides.string(_root.$meta, 'tabs.move.tabNumber', {}) ?? '{Tab number}',
          'tabs.move.invalidTabNumber' => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidTabNumber', {}) ?? '{Invalid tab number}',
          'tabs.move.invalidInput' => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidInput', {}) ?? '{Invalid input}',
          'tabs.move.outOfRange' => TranslationOverrides.string(_root.$meta, 'tabs.move.outOfRange', {}) ?? '{Out of range}',
          'tabs.move.pleaseEnterValidTabNumber' =>
            TranslationOverrides.string(_root.$meta, 'tabs.move.pleaseEnterValidTabNumber', {}) ?? '{Please enter a valid tab number}',
          'tabs.move.moveTo' =>
            ({required String formattedNumber}) =>
                TranslationOverrides.string(_root.$meta, 'tabs.move.moveTo', {'formattedNumber': formattedNumber}) ?? '{Move to #${formattedNumber}}',
          'tabs.move.returnButton' => TranslationOverrides.string(_root.$meta, 'tabs.move.returnButton', {}) ?? '{Return}',
          'tabs.move.preview' => TranslationOverrides.string(_root.$meta, 'tabs.move.preview', {}) ?? '{Preview:}',
          'dialogs.pageChanger' => TranslationOverrides.string(_root.$meta, 'dialogs.pageChanger', {}) ?? '{Page changer}',
          'dialogs.delayBetweenLoadingsMs' =>
            TranslationOverrides.string(_root.$meta, 'dialogs.delayBetweenLoadingsMs', {}) ?? '{Delay between loadings (ms)}',
          'dialogs.delayInMs' => TranslationOverrides.string(_root.$meta, 'dialogs.delayInMs', {}) ?? '{Delay in ms}',
          'dialogs.cookies' => TranslationOverrides.string(_root.$meta, 'dialogs.cookies', {}) ?? '{Cookies}',
          'dialogs.cookiesGone' => TranslationOverrides.string(_root.$meta, 'dialogs.cookiesGone', {}) ?? '{There were cookies. Now, they are gone}',
          'dialogs.favicon' => TranslationOverrides.string(_root.$meta, 'dialogs.favicon', {}) ?? '{Favicon}',
          'dialogs.noFaviconFound' => TranslationOverrides.string(_root.$meta, 'dialogs.noFaviconFound', {}) ?? '{No favicon found}',
          'dialogs.host' => TranslationOverrides.string(_root.$meta, 'dialogs.host', {}) ?? '{Host:}',
          'dialogs.textAboveIsSelectable' =>
            TranslationOverrides.string(_root.$meta, 'dialogs.textAboveIsSelectable', {}) ?? '{(text above is selectable)}',
          'dialogs.fieldToMergeTexts' => TranslationOverrides.string(_root.$meta, 'dialogs.fieldToMergeTexts', {}) ?? '{Field to merge texts:}',
          'dialogs.navigateTo' =>
            ({required String url}) => TranslationOverrides.string(_root.$meta, 'dialogs.navigateTo', {'url': url}) ?? '{Navigate to ${url}}',
          'dialogs.listCookies' => TranslationOverrides.string(_root.$meta, 'dialogs.listCookies', {}) ?? '{List cookies}',
          'dialogs.clearCookies' => TranslationOverrides.string(_root.$meta, 'dialogs.clearCookies', {}) ?? '{Clear cookies}',
          'dialogs.getFavicon' => TranslationOverrides.string(_root.$meta, 'dialogs.getFavicon', {}) ?? '{Get favicon}',
          'dialogs.history' => TranslationOverrides.string(_root.$meta, 'dialogs.history', {}) ?? '{History}',
          'dialogs.noBackHistoryItem' => TranslationOverrides.string(_root.$meta, 'dialogs.noBackHistoryItem', {}) ?? '{No back history item}',
          'dialogs.noForwardHistoryItem' =>
            TranslationOverrides.string(_root.$meta, 'dialogs.noForwardHistoryItem', {}) ?? '{No forward history item}',
          'history.searchHistory' => TranslationOverrides.string(_root.$meta, 'history.searchHistory', {}) ?? '{Search history}',
          'history.searchHistoryIsEmpty' =>
            TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsEmpty', {}) ?? '{Search history is empty}',
          'history.searchHistoryIsDisabled' =>
            TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsDisabled', {}) ?? '{Search history is disabled.}',
          'history.searchHistoryRequiresDatabase' =>
            TranslationOverrides.string(_root.$meta, 'history.searchHistoryRequiresDatabase', {}) ??
                '{Search history requires enabling database in settings.}',
          'history.filterSearchHistory' => TranslationOverrides.string(_root.$meta, 'history.filterSearchHistory', {}) ?? '{Filter search history}',
          'history.lastSearch' =>
            ({required String search}) =>
                TranslationOverrides.string(_root.$meta, 'history.lastSearch', {'search': search}) ?? '{Last search: ${search}}',
          'history.lastSearchWithDate' =>
            ({required String date}) =>
                TranslationOverrides.string(_root.$meta, 'history.lastSearchWithDate', {'date': date}) ?? '{Last search: ${date}}',
          'history.unknownBooruType' => TranslationOverrides.string(_root.$meta, 'history.unknownBooruType', {}) ?? '{Unknown Booru type!}',
          'history.unknownBooru' =>
            ({required String name, required String type}) =>
                TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ?? '{Unknown booru (${name}-${type})}',
          'history.open' => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? '{Open}',
          'history.openInNewTab' => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? '{Open in new tab}',
          'history.removeFromFavourites' =>
            TranslationOverrides.string(_root.$meta, 'history.removeFromFavourites', {}) ?? '{Remove from Favourites}',
          'history.setAsFavourite' => TranslationOverrides.string(_root.$meta, 'history.setAsFavourite', {}) ?? '{Set as Favourite}',
          'history.copy' => TranslationOverrides.string(_root.$meta, 'history.copy', {}) ?? '{Copy}',
          'history.delete' => TranslationOverrides.string(_root.$meta, 'history.delete', {}) ?? '{Delete}',
          'history.deleteHistoryEntries' =>
            TranslationOverrides.string(_root.$meta, 'history.deleteHistoryEntries', {}) ?? '{Delete history entries}',
          'history.deleteItemsConfirm' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'history.deleteItemsConfirm', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
                  count,
                  one: '{Are you sure you want to delete 1 item?}',
                  other: '{Are you sure you want to delete ${count} items?}',
                ),
          'history.clearSelection' => TranslationOverrides.string(_root.$meta, 'history.clearSelection', {}) ?? '{Clear selection}',
          'history.deleteItems' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'history.deleteItems', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
                  count,
                  one: '{Delete 1 item}',
                  other: '{Delete ${count} items}',
                ),
          'webview.title' => TranslationOverrides.string(_root.$meta, 'webview.title', {}) ?? '{Webview}',
          'webview.notSupportedOnDevice' =>
            TranslationOverrides.string(_root.$meta, 'webview.notSupportedOnDevice', {}) ?? '{Not supported on this device}',
          'webview.navigation.enterUrlLabel' => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterUrlLabel', {}) ?? '{Enter a URL}',
          'webview.navigation.enterCustomUrl' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.enterCustomUrl', {}) ?? '{Enter custom URL}',
          'webview.navigation.navigateTo' =>
            ({required String url}) =>
                TranslationOverrides.string(_root.$meta, 'webview.navigation.navigateTo', {'url': url}) ?? '{Navigate to ${url}}',
          'webview.navigation.listCookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.listCookies', {}) ?? '{List cookies}',
          'webview.navigation.clearCookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.clearCookies', {}) ?? '{Clear cookies}',
          'webview.navigation.cookiesGone' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.cookiesGone', {}) ?? '{There were cookies. Now, they are gone}',
          'webview.navigation.getFavicon' => TranslationOverrides.string(_root.$meta, 'webview.navigation.getFavicon', {}) ?? '{Get favicon}',
          'webview.navigation.noFaviconFound' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noFaviconFound', {}) ?? '{No favicon found}',
          'webview.navigation.host' => TranslationOverrides.string(_root.$meta, 'webview.navigation.host', {}) ?? '{Host:}',
          'webview.navigation.textAboveSelectable' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.textAboveSelectable', {}) ?? '{(text above is selectable)}',
          'webview.navigation.fieldToMergeTexts' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.fieldToMergeTexts', {}) ?? '{Field to merge texts:}',
          'webview.navigation.copyUrl' => TranslationOverrides.string(_root.$meta, 'webview.navigation.copyUrl', {}) ?? '{Copy URL}',
          'webview.navigation.copiedUrlToClipboard' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.copiedUrlToClipboard', {}) ?? '{Copied URL to clipboard}',
          'webview.navigation.cookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookies', {}) ?? '{Cookies}',
          'webview.navigation.favicon' => TranslationOverrides.string(_root.$meta, 'webview.navigation.favicon', {}) ?? '{Favicon}',
          'webview.navigation.history' => TranslationOverrides.string(_root.$meta, 'webview.navigation.history', {}) ?? '{History}',
          'webview.navigation.noBackHistoryItem' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noBackHistoryItem', {}) ?? '{No back history item}',
          'webview.navigation.noForwardHistoryItem' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noForwardHistoryItem', {}) ?? '{No forward history item}',
          'settings.title' => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? '{Settings}',
          'settings.language.title' => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? '{Language}',
          'settings.language.system' => TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? '{System}',
          'settings.language.helpUsTranslate' =>
            TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? '{Help us translate}',
          'settings.language.visitForDetails' =>
            TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ??
                '{Visit <a href="https://github.com/NO-ob/LoliSnatcher_Droid/wiki/Localization">github</a> for details or tap on the image below to go to Weblate}',
          'settings.booru.title' => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? '{Boorus & Search}',
          'settings.booru.dropdown' => TranslationOverrides.string(_root.$meta, 'settings.booru.dropdown', {}) ?? '{Booru}',
          'settings.booru.defaultTags' => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? '{Default tags}',
          'settings.booru.itemsPerPage' => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? '{Items fetched per page}',
          'settings.booru.itemsPerPageTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? '{Some Boorus may ignore this setting}',
          'settings.booru.itemsPerPagePlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPagePlaceholder', {}) ?? '{10-100}',
          'settings.booru.addBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? '{Add Booru config}',
          'settings.booru.shareBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? '{Share Booru config}',
          'settings.booru.shareBooruDialogMsgMobile' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
                '{Booru config of ${booruName} will be converted to a link which then can be shared to other apps\n\nShould login/apikey data be included?}',
          'settings.booru.shareBooruDialogMsgDesktop' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
                '{Booru config of ${booruName} will be converted to a link which will be copied to clipboard\n\nShould login/apikey data be included?}',
          'settings.booru.booruSharing' => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? '{Booru sharing}',
          'settings.booru.booruSharingMsgAndroid' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ??
                '{How to automatically open Booru config links in the app on Android 12 and higher:\n1) Tap button below to open system app link defaults settings\n2) Tap on "Add link" and select all available options}',
          'settings.booru.addedBoorus' => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? '{Added Boorus}',
          'settings.booru.editBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? '{Edit Booru config}',
          'settings.booru.importBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? '{Import Booru config from clipboard}',
          'settings.booru.onlyLSURLsSupported' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ?? '{Only loli.snatcher URLs are supported!}',
          'settings.booru.deleteBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? '{Delete Booru config}',
          'settings.booru.deleteBooruError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ??
                '{Something went wrong during deletion of a Booru config!}',
          'settings.booru.booruDeleted' => TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? '{Booru config deleted}',
          'settings.booru.booruDropdownInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ??
                '{The Booru selected here will be set as default after saving.\n\nThe default Booru will be first to appear in the dropdown boxes}',
          'settings.booru.changeDefaultBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? '{Change default Booru?}',
          'settings.booru.changeTo' => TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? '{Change to: }',
          'settings.booru.keepCurrentBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? '{Tap [No] to keep current: }',
          'settings.booru.changeToNewBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? '{Tap [Yes] to change to: }',
          'settings.booru.booruConfigLinkCopied' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ?? '{Booru config link copied to clipboard}',
          'settings.booru.noBooruSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.noBooruSelected', {}) ?? '{No Booru selected!}',
          'settings.booru.cantDeleteThisBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? '{Can\'t delete this Booru!}',
          'settings.booru.removeRelatedTabsFirst' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.removeRelatedTabsFirst', {}) ?? '{Remove related tabs first}',
          'settings.booruEditor.title' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? '{Booru Editor}',
          'settings.booruEditor.testBooru' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooru', {}) ?? '{Test Booru}',
          'settings.booruEditor.testBooruSuccessMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruSuccessMsg', {}) ?? '{Tap the Save button to save this config}',
          'settings.booruEditor.testBooruFailedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? '{Booru test failed}',
          'settings.booruEditor.testBooruFailedMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ??
                '{Config parameters may be incorrect, booru doesn\'t allow api access, request didn\'t return any data or there was a network error.}',
          'settings.booruEditor.saveBooru' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? '{Save Booru}',
          'settings.booruEditor.runTestFirst' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runTestFirst', {}) ?? '{Run test first}',
          'settings.booruEditor.runningTest' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? '{Running test...}',
          'settings.booruEditor.booruConfigExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? '{This Booru config already exists}',
          'settings.booruEditor.booruSameNameExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ??
                '{Booru config with same name already exists}',
          'settings.booruEditor.booruSameUrlExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ??
                '{Booru config with same URL already exists}',
          'settings.booruEditor.thisBooruConfigWontBeAdded' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ?? '{This booru config won\'t be added}',
          'settings.booruEditor.booruConfigSaved' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? '{Booru config saved}',
          'settings.booruEditor.existingTabsNeedReload' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ??
                '{Existing tabs with this Booru need to be reloaded in order to apply changes!}',
          'settings.booruEditor.failedVerifyApiHydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ?? '{Failed to verify api access for Hydrus}',
          'settings.booruEditor.accessKeyRequestedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? '{Access key requested}',
          'settings.booruEditor.accessKeyRequestedMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ??
                '{Tap okay on Hydrus then apply. You can tap \'Test Booru\' afterwards}',
          'settings.booruEditor.accessKeyFailedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? '{Failed to get access key}',
          'settings.booruEditor.accessKeyFailedMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ??
                '{Do you have the request window open in Hydrus?}',
          'settings.booruEditor.hydrusInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ??
                '{To get the Hydrus key you need to open the request dialog in the Hydrus client. Services > Review services > Client api > Add > From API request}',
          'settings.booruEditor.getHydrusApiKey' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? '{Get Hydrus API key}',
          'settings.booruEditor.booruName' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? '{Booru Name}',
          'settings.booruEditor.booruNameRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? '{Booru Name is required!}',
          'settings.booruEditor.booruUrl' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? '{Booru URL}',
          'settings.booruEditor.booruUrlRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? '{Booru URL is required!}',
          'settings.booruEditor.booruType' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruType', {}) ?? '{Booru Type}',
          'settings.booruEditor.booruTypeIs' =>
            ({required String booruType}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruTypeIs', {'booruType': booruType}) ??
                '{Booru Type is ${booruType}}',
          'settings.booruEditor.booruFavicon' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? '{Favicon URL}',
          'settings.booruEditor.booruFaviconPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '{(Autofills if blank)}',
          'settings.booruEditor.booruApiCredsInfo' =>
            ({required String userIdTitle, required String apiKeyTitle}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruApiCredsInfo', {
                  'userIdTitle': userIdTitle,
                  'apiKeyTitle': apiKeyTitle,
                }) ??
                '{${userIdTitle} and ${apiKeyTitle} may be needed with some boorus but in most cases aren\'t necessary.}',
          'settings.booruEditor.booruDefTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? '{Default tags}',
          'settings.booruEditor.booruDefTagsPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTagsPlaceholder', {}) ?? '{Default search for booru}',
          'settings.booruEditor.booruDefaultInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefaultInstructions', {}) ??
                '{Fields below may be required for some boorus}',
          'settings.interface.title' => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? '{Interface}',
          'settings.interface.appUIMode' => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIMode', {}) ?? '{App UI mode}',
          'settings.interface.appUIModeWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarningTitle', {}) ?? '{App UI mode}',
          'settings.interface.appUIModeWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarning', {}) ??
                '{Are you sure you want to use Desktop mode? It may cause problems on Mobile devices and is considered DEPRECATED.}',
          'settings.interface.appUIModeHelpMobile' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpMobile', {}) ?? '{- Mobile - Normal Mobile UI}',
          'settings.interface.appUIModeHelpDesktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpDesktop', {}) ??
                '{- Desktop - Ahoviewer Style UI [DEPRECATED, NEEDS REWORK]}',
          'settings.interface.appUIModeHelpWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpWarning', {}) ??
                '{[Warning]: Do not set UI Mode to Desktop on a phone you might break the app and might have to wipe your settings including booru configs.}',
          'settings.interface.appUIModeHelpAndroid10' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpAndroid10', {}) ??
                '{If you are on android versions below 11 you can remove the appMode line from /LoliSnatcher/config/settings.json}',
          'settings.interface.appUIModeHelpAndroid11' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpAndroid11', {}) ??
                '{If you are on android 11 or higher you will have to wipe app data via system settings}',
          'settings.interface.handSide' => TranslationOverrides.string(_root.$meta, 'settings.interface.handSide', {}) ?? '{Hand side}',
          'settings.interface.handSideHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.handSideHelp', {}) ??
                '{Changes position of some UI elements according to selected side}',
          'settings.interface.showSearchBarInPreviewGrid' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.showSearchBarInPreviewGrid', {}) ?? '{Show search bar in preview grid}',
          'settings.interface.moveInputToTopInSearchView' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.moveInputToTopInSearchView', {}) ?? '{Move input to top in search view}',
          'settings.interface.searchViewQuickActionsPanel' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewQuickActionsPanel', {}) ?? '{Search view quick actions panel}',
          'settings.interface.searchViewInputAutofocus' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewInputAutofocus', {}) ?? '{Search view input autofocus}',
          'settings.interface.disableVibration' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibration', {}) ?? '{Disable vibration}',
          'settings.interface.disableVibrationSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibrationSubtitle', {}) ??
                '{May still happen on some actions even when disabled}',
          'settings.interface.previewColumnsPortrait' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsPortrait', {}) ?? '{Preview columns (portrait)}',
          'settings.interface.previewColumnsLandscape' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsLandscape', {}) ?? '{Preview columns (landscape)}',
          'settings.interface.previewQuality' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQuality', {}) ?? '{Preview quality}',
          'settings.interface.previewQualityHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelp', {}) ??
                '{This setting changes the resolution of images in the preview grid}',
          'settings.interface.previewQualityHelpSample' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpSample', {}) ??
                '{ - Sample - Medium resolution, app will also load a Thumbnail quality as a placeholder while higher quality loads}',
          'settings.interface.previewQualityHelpThumbnail' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpThumbnail', {}) ?? '{ - Thumbnail - Low resolution}',
          'settings.interface.previewQualityHelpNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpNote', {}) ??
                '{[Note]: Sample quality can noticeably degrade performance, especially if you have too many columns in preview grid}',
          'settings.interface.previewDisplay' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplay', {}) ?? '{Preview display}',
          'settings.interface.previewDisplayFallback' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallback', {}) ?? '{Preview display fallback}',
          'settings.interface.previewDisplayFallbackHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallbackHelp', {}) ??
                '{This will be used when Staggered option is not possible}',
          'settings.interface.dontScaleImages' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImages', {}) ?? '{Don\'t scale images}',
          'settings.interface.dontScaleImagesSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesSubtitle', {}) ??
                '{Disables image scaling which is used to improve performance}',
          'settings.interface.dontScaleImagesWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningTitle', {}) ?? '{Warning}',
          'settings.interface.dontScaleImagesWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarning', {}) ??
                '{Are you sure you want to disable image scaling?}',
          'settings.interface.dontScaleImagesWarningMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningMsg', {}) ??
                '{This can negatively impact the performance, especially on older devices}',
          'settings.interface.gifThumbnails' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnails', {}) ?? '{GIF thumbnails}',
          'settings.interface.gifThumbnailsRequires' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnailsRequires', {}) ?? '{Requires "Don\'t scale images"}',
          'settings.interface.scrollPreviewsButtonsPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.scrollPreviewsButtonsPosition', {}) ?? '{Scroll previews buttons position}',
          'settings.interface.mouseWheelScrollModifier' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.mouseWheelScrollModifier', {}) ?? '{Mouse wheel scroll modifier}',
          'settings.interface.scrollModifier' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.scrollModifier', {}) ?? '{Scroll modifier}',
          'settings.theme.title' => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? '{Themes}',
          'settings.theme.themeMode' => TranslationOverrides.string(_root.$meta, 'settings.theme.themeMode', {}) ?? '{Theme mode}',
          'settings.theme.blackBg' => TranslationOverrides.string(_root.$meta, 'settings.theme.blackBg', {}) ?? '{Black background}',
          'settings.theme.useDynamicColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? '{Use dynamic color}',
          'settings.theme.android12PlusOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.android12PlusOnly', {}) ?? '{Android 12+ only}',
          'settings.theme.theme' => TranslationOverrides.string(_root.$meta, 'settings.theme.theme', {}) ?? '{Theme}',
          'settings.theme.primaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? '{Primary color}',
          'settings.theme.secondaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? '{Secondary color}',
          'settings.theme.enableDrawerMascot' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.enableDrawerMascot', {}) ?? '{Enable drawer mascot}',
          'settings.theme.setCustomMascot' => TranslationOverrides.string(_root.$meta, 'settings.theme.setCustomMascot', {}) ?? '{Set custom mascot}',
          'settings.theme.removeCustomMascot' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? '{Remove custom mascot}',
          'settings.theme.currentMascotPath' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.currentMascotPath', {}) ?? '{Current mascot path}',
          'settings.theme.system' => TranslationOverrides.string(_root.$meta, 'settings.theme.system', {}) ?? '{System}',
          'settings.theme.light' => TranslationOverrides.string(_root.$meta, 'settings.theme.light', {}) ?? '{Light}',
          'settings.theme.dark' => TranslationOverrides.string(_root.$meta, 'settings.theme.dark', {}) ?? '{Dark}',
          'settings.theme.pink' => TranslationOverrides.string(_root.$meta, 'settings.theme.pink', {}) ?? '{Pink}',
          'settings.theme.purple' => TranslationOverrides.string(_root.$meta, 'settings.theme.purple', {}) ?? '{Purple}',
          'settings.theme.blue' => TranslationOverrides.string(_root.$meta, 'settings.theme.blue', {}) ?? '{Blue}',
          'settings.theme.teal' => TranslationOverrides.string(_root.$meta, 'settings.theme.teal', {}) ?? '{Teal}',
          'settings.theme.red' => TranslationOverrides.string(_root.$meta, 'settings.theme.red', {}) ?? '{Red}',
          'settings.theme.green' => TranslationOverrides.string(_root.$meta, 'settings.theme.green', {}) ?? '{Green}',
          'settings.theme.halloween' => TranslationOverrides.string(_root.$meta, 'settings.theme.halloween', {}) ?? '{Halloween}',
          'settings.theme.custom' => TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? '{Custom}',
          'settings.theme.selectColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.selectColor', {}) ?? '{Select color}',
          'settings.theme.selectedColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColor', {}) ?? '{Selected color}',
          'settings.theme.selectedColorAndShades' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColorAndShades', {}) ?? '{Selected color and its shades}',
          'settings.viewer.title' => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? '{Viewer}',
          'settings.viewer.preloadAmount' => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadAmount', {}) ?? '{Preload amount}',
          'settings.viewer.preloadSizeLimit' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimit', {}) ?? '{Preload size limit}',
          'settings.viewer.preloadSizeLimitSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimitSubtitle', {}) ?? '{in GB, 0 for no limit}',
          'settings.viewer.imageQuality' => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQuality', {}) ?? '{Image quality}',
          'settings.viewer.viewerScrollDirection' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerScrollDirection', {}) ?? '{Viewer scroll direction}',
          'settings.viewer.viewerToolbarPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerToolbarPosition', {}) ?? '{Viewer toolbar position}',
          'settings.viewer.zoomButtonPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.zoomButtonPosition', {}) ?? '{Zoom button position}',
          'settings.viewer.changePageButtonsPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.changePageButtonsPosition', {}) ?? '{Change page buttons position}',
          'settings.viewer.hideToolbarWhenOpeningViewer' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.hideToolbarWhenOpeningViewer', {}) ?? '{Hide toolbar when opening viewer}',
          'settings.viewer.expandDetailsByDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.expandDetailsByDefault', {}) ?? '{Expand details by default}',
          'settings.viewer.hideTranslationNotesByDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.hideTranslationNotesByDefault', {}) ?? '{Hide translation notes by default}',
          'settings.viewer.enableRotation' => TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotation', {}) ?? '{Enable rotation}',
          'settings.viewer.enableRotationSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotationSubtitle', {}) ?? '{Double tap to reset (only works on images)}',
          'settings.viewer.toolbarButtonsOrder' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarButtonsOrder', {}) ?? '{Toolbar buttons order}',
          'settings.viewer.buttonsOrder' => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonsOrder', {}) ?? '{Buttons order}',
          'settings.viewer.longPressToChangeItemOrder' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToChangeItemOrder', {}) ?? '{Long press to change item order.}',
          'settings.viewer.atLeast4ButtonsVisibleOnToolbar' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.atLeast4ButtonsVisibleOnToolbar', {}) ??
                '{At least 4 buttons from this list will be always visible on Toolbar.}',
          'settings.viewer.otherButtonsWillGoIntoOverflow' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.otherButtonsWillGoIntoOverflow', {}) ??
                '{Other buttons will go into overflow (three dots) menu.}',
          'settings.viewer.longPressToMoveItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToMoveItems', {}) ?? '{Long press to move items}',
          'settings.viewer.onlyForVideos' => TranslationOverrides.string(_root.$meta, 'settings.viewer.onlyForVideos', {}) ?? '{Only for videos}',
          'settings.viewer.thisButtonCannotBeDisabled' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.thisButtonCannotBeDisabled', {}) ?? '{This button cannot be disabled}',
          'settings.viewer.defaultShareAction' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.defaultShareAction', {}) ?? '{Default share action}',
          'settings.viewer.shareActions' => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActions', {}) ?? '{Share actions}',
          'settings.viewer.shareActionsAsk' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsAsk', {}) ?? '{- Ask - always ask what to share}',
          'settings.viewer.shareActionsPostURL' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURL', {}) ?? '{- Post URL}',
          'settings.viewer.shareActionsFileURL' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFileURL', {}) ??
                '{- File URL - shares direct link to the original file (may not work with some sites)}',
          'settings.viewer.shareActionsPostURLFileURLFileWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURLFileURLFileWithTags', {}) ??
                '{- Post URL/File URL/File with tags - shares url/file and tags which you select}',
          'settings.viewer.shareActionsFile' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFile', {}) ??
                '{- File - shares the file itself, may take some time to load, progress will be shown on the Share button}',
          'settings.viewer.shareActionsHydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsHydrus', {}) ??
                '{- Hydrus - sends the post url to Hydrus for import}',
          'settings.viewer.shareActionsNoteIfFileSavedInCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsNoteIfFileSavedInCache', {}) ??
                '{[Note]: If File is saved in cache, it will be loaded from there. Otherwise it will be loaded again from network.}',
          'settings.viewer.shareActionsTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsTip', {}) ??
                '{[Tip]: You can open Share actions menu by long pressing Share button.}',
          'settings.viewer.useVolumeButtonsForScrolling' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.useVolumeButtonsForScrolling', {}) ?? '{Use volume buttons for scrolling}',
          'settings.viewer.volumeButtonsScrolling' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrolling', {}) ?? '{Volume buttons scrolling}',
          'settings.viewer.volumeButtonsScrollingHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollingHelp', {}) ??
                '{Allows to scroll through previews grid and viewer items using volume buttons}',
          'settings.viewer.volumeButtonsVolumeDown' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeDown', {}) ?? '{ - Volume Down - next item}',
          'settings.viewer.volumeButtonsVolumeUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeUp', {}) ?? '{ - Volume Up - previous item}',
          'settings.viewer.volumeButtonsInViewer' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsInViewer', {}) ?? '{In viewer:}',
          'settings.viewer.volumeButtonsToolbarVisible' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarVisible', {}) ?? '{ - Toolbar visible - controls volume}',
          'settings.viewer.volumeButtonsToolbarHidden' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarHidden', {}) ?? '{ - Toolbar hidden - controls scrolling}',
          'settings.viewer.volumeButtonsScrollSpeed' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollSpeed', {}) ?? '{Volume buttons scroll speed}',
          'settings.viewer.slideshowDurationInMs' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowDurationInMs', {}) ?? '{Slideshow duration (in ms)}',
          'settings.viewer.slideshow' => TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshow', {}) ?? '{Slideshow}',
          'settings.viewer.slideshowWIPNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowWIPNote', {}) ??
                '{[WIP] Videos and gifs must be scrolled manually for now.}',
          'settings.viewer.preventDeviceFromSleeping' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preventDeviceFromSleeping', {}) ?? '{Prevent device from sleeping}',
          'settings.viewer.viewerOpenCloseAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerOpenCloseAnimation', {}) ?? '{Viewer open/close animation}',
          'settings.viewer.viewerPageChangeAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerPageChangeAnimation', {}) ?? '{Viewer page change animation}',
          'settings.viewer.usingDefaultAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.usingDefaultAnimation', {}) ?? '{Using default animation}',
          'settings.viewer.usingCustomAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.usingCustomAnimation', {}) ?? '{Using custom animation}',
          'settings.viewer.kannaLoadingGif' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.kannaLoadingGif', {}) ?? '{Kanna loading Gif}',
          'settings.viewer.searchTags' => TranslationOverrides.string(_root.$meta, 'settings.viewer.searchTags', {}) ?? '{Search tags}',
          'settings.viewer.selectTags' => TranslationOverrides.string(_root.$meta, 'settings.viewer.selectTags', {}) ?? '{Select tags}',
          'settings.viewer.noteCoordinates' =>
            ({required double x, required double y}) =>
                TranslationOverrides.string(_root.$meta, 'settings.viewer.noteCoordinates', {'x': x, 'y': y}) ?? '{X:${x}, Y:${y}}',
          'settings.video.title' => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? '{Video}',
          'settings.video.disableVideos' => TranslationOverrides.string(_root.$meta, 'settings.video.disableVideos', {}) ?? '{Disable videos}',
          'settings.video.disableVideosHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.disableVideosHelp', {}) ??
                '{Useful on low end devices that crash when trying to load videos. Gives options to view video in external player or browser instead.}',
          'settings.video.autoplayVideos' => TranslationOverrides.string(_root.$meta, 'settings.video.autoplayVideos', {}) ?? '{Autoplay videos}',
          'settings.video.startVideosMuted' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.startVideosMuted', {}) ?? '{Start videos muted}',
          'settings.video.experimental' => TranslationOverrides.string(_root.$meta, 'settings.video.experimental', {}) ?? '{[Experimental]}',
          'settings.video.longTapToFastForwardVideo' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.longTapToFastForwardVideo', {}) ?? '{Long tap to fast forward video}',
          'settings.video.longTapToFastForwardVideoHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.longTapToFastForwardVideoHelp', {}) ??
                '{When this is enabled toolbar can be hidden with the tap when video controls are visible. [Experimental] May become default behavior in the future.}',
          'settings.video.videoPlayerBackend' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoPlayerBackend', {}) ?? '{Video player backend}',
          'settings.video.backendDefault' => TranslationOverrides.string(_root.$meta, 'settings.video.backendDefault', {}) ?? '{Default}',
          'settings.video.backendMPV' => TranslationOverrides.string(_root.$meta, 'settings.video.backendMPV', {}) ?? '{MPV}',
          'settings.video.backendMDK' => TranslationOverrides.string(_root.$meta, 'settings.video.backendMDK', {}) ?? '{MDK}',
          _ => null,
        } ??
        switch (path) {
          'settings.video.backendDefaultHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.backendDefaultHelp', {}) ??
                '{Based on exoplayer. Has best device compatibility, may have issues with 4K videos, some codecs or older devices}',
          'settings.video.backendMPVHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.backendMPVHelp', {}) ??
                '{Based on libmpv, has advanced settings which may help fix problems with some codecs/devices\n[MAY CAUSE CRASHES]}',
          'settings.video.backendMDKHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.backendMDKHelp', {}) ??
                '{Based on libmdk, may have better performance for some codecs/devices\n[MAY CAUSE CRASHES]}',
          'settings.video.mpvSettingsHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.mpvSettingsHelp', {}) ??
                '{Try different values of \'MPV\' settings below if videos don\'t work correctly or give codec errors:}',
          'settings.video.mpvUseHardwareAcceleration' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.mpvUseHardwareAcceleration', {}) ?? '{MPV: use hardware acceleration}',
          'settings.video.mpvVO' => TranslationOverrides.string(_root.$meta, 'settings.video.mpvVO', {}) ?? '{MPV: VO}',
          'settings.video.mpvHWDEC' => TranslationOverrides.string(_root.$meta, 'settings.video.mpvHWDEC', {}) ?? '{MPV: HWDEC}',
          'settings.video.videoCacheMode' => TranslationOverrides.string(_root.$meta, 'settings.video.videoCacheMode', {}) ?? '{Video cache mode}',
          'settings.video.cacheModes.title' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.title', {}) ?? '{Video cache modes}',
          'settings.video.cacheModes.streamMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamMode', {}) ??
                '{- Stream - Don\'t cache, start playing as soon as possible}',
          'settings.video.cacheModes.cacheMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheMode', {}) ??
                '{- Cache - Saves the file to device storage, plays only when download is complete}',
          'settings.video.cacheModes.streamCacheMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamCacheMode', {}) ??
                '{- Stream+Cache - Mix of both, but currently leads to double download}',
          'settings.video.cacheModes.cacheNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheNote', {}) ??
                '{[Note]: Videos will cache only if \'Cache Media\' is enabled.}',
          'settings.video.cacheModes.desktopWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.desktopWarning', {}) ??
                '{[Warning]: On desktop Stream mode can work incorrectly for some Boorus.}',
          'settings.downloads.title' => TranslationOverrides.string(_root.$meta, 'settings.downloads.title', {}) ?? '{Snatching}',
          'settings.downloads.fromNextItemInQueue' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.fromNextItemInQueue', {}) ?? '{From next item in queue}',
          'settings.downloads.pleaseProvideStoragePermission' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.pleaseProvideStoragePermission', {}) ??
                '{Please provide storage permission in order to download files}',
          'settings.downloads.noItemsSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsSelected', {}) ?? '{No items selected}',
          'settings.downloads.noItemsQueued' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsQueued', {}) ?? '{No items in queue}',
          'settings.downloads.batch' => TranslationOverrides.string(_root.$meta, 'settings.downloads.batch', {}) ?? '{Batch}',
          'settings.downloads.snatchSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? '{Snatch selected}',
          'settings.downloads.removeSnatchedStatusFromSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ??
                '{Remove snatched status from selected}',
          'settings.downloads.favouriteSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? '{Favorite selected}',
          'settings.downloads.unfavouriteSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? '{Unfavorite selected}',
          'settings.downloads.clearSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? '{Clear selected}',
          'settings.downloads.updatingData' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? '{Updating data...}',
          'settings.downloadsAndCache' => TranslationOverrides.string(_root.$meta, 'settings.downloadsAndCache', {}) ?? '{Snatching & Cache}',
          'settings.database.title' => TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? '{Database}',
          'settings.database.indexingDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? '{Indexing database}',
          'settings.database.droppingIndexes' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? '{Dropping indexes}',
          'settings.database.enableDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableDatabase', {}) ?? '{Enable database}',
          'settings.database.enableIndexing' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableIndexing', {}) ?? '{Enable indexing}',
          'settings.database.enableSearchHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableSearchHistory', {}) ?? '{Enable search history}',
          'settings.database.enableTagTypeFetching' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableTagTypeFetching', {}) ?? '{Enable tag type fetching}',
          'settings.database.failedItemPurgeStarted' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.failedItemPurgeStarted', {}) ?? '{Failed item purge started}',
          'settings.database.sankakuTypeToUpdate' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuTypeToUpdate', {}) ?? '{Sankaku type to update}',
          'settings.database.searchQuery' => TranslationOverrides.string(_root.$meta, 'settings.database.searchQuery', {}) ?? '{Search query}',
          'settings.database.searchQueryOptional' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchQueryOptional', {}) ?? '{(optional, may make the process slower)}',
          'settings.database.errorLoadingTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.errorLoadingTags', {}) ?? '{Error loading tags}',
          'settings.database.cantLeavePageNow' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.cantLeavePageNow', {}) ?? '{Can\'t leave the page right now!}',
          'settings.database.sankakuDataUpdating' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDataUpdating', {}) ??
                '{Sankaku data is being updated, wait until it ends or cancel manually at the bottom of the page}',
          'settings.database.pleaseWaitTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.pleaseWaitTitle', {}) ?? '{Please wait!}',
          'settings.database.indexesBeingChanged' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexesBeingChanged', {}) ?? '{Indexes are being changed}',
          'settings.database.databaseInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfo', {}) ??
                '{The database will store favourites and also track if an item is snatched}',
          'settings.database.databaseInfoSnatch' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfoSnatch', {}) ??
                '{If an item is snatched it wont be snatched again}',
          'settings.database.indexingInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexingInfo', {}) ??
                '{Indexing helps make searching database faster, but it takes up more space on disk (possibly doubling the size of your database).\nDo not leave the page or close the app while indexing is running to avoid database corruption.}',
          'settings.database.createIndexesDebug' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.createIndexesDebug', {}) ?? '{Create Indexes [Debug]}',
          'settings.database.dropIndexesDebug' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.dropIndexesDebug', {}) ?? '{Drop Indexes [Debug]}',
          'settings.database.searchHistoryInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryInfo', {}) ?? '{Requires database to be enabled.}',
          'settings.database.searchHistoryRecords' =>
            ({required int limit}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryRecords', {'limit': limit}) ??
                '{Records last ${limit} search queries.}',
          'settings.database.searchHistoryTapInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryTapInfo', {}) ??
                '{Tap any history entry for additional actions (Delete, Set as Favourite...)}',
          'settings.database.searchHistoryFavouritesInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryFavouritesInfo', {}) ??
                '{Favourited queries are pinned to the top of the list and will not be counted towards the limit.}',
          'settings.database.tagTypeFetchingInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingInfo', {}) ??
                '{Will search for tag types on supported boorus}',
          'settings.database.tagTypeFetchingWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingWarning', {}) ?? '{This can lead to rate limiting}',
          'settings.database.deleteDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabase', {}) ?? '{Delete database}',
          'settings.database.deleteDatabaseConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabaseConfirm', {}) ?? '{Delete database?}',
          'settings.database.databaseDeleted' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseDeleted', {}) ?? '{Database deleted!}',
          'settings.database.appRestartRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.appRestartRequired', {}) ?? '{An app restart is required!}',
          'settings.database.clearSnatchedItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSnatchedItems', {}) ?? '{Clear snatched items}',
          'settings.database.clearAllSnatchedConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearAllSnatchedConfirm', {}) ?? '{Clear all snatched items?}',
          'settings.database.snatchedItemsCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.snatchedItemsCleared', {}) ?? '{Snatched items cleared}',
          'settings.database.appRestartMayBeRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.appRestartMayBeRequired', {}) ?? '{An app restart may be required!}',
          'settings.database.clearFavouritedItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearFavouritedItems', {}) ?? '{Clear favourited items}',
          'settings.database.clearAllFavouritedConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearAllFavouritedConfirm', {}) ?? '{Clear all favourited items?}',
          'settings.database.favouritesCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.favouritesCleared', {}) ?? '{Favourites cleared}',
          'settings.database.clearSearchHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistory', {}) ?? '{Clear search history}',
          'settings.database.clearSearchHistoryConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistoryConfirm', {}) ?? '{Clear search history?}',
          'settings.database.searchHistoryCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryCleared', {}) ?? '{Search history cleared}',
          'settings.database.sankakuFavouritesUpdate' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdate', {}) ?? '{Sankaku favourites update}',
          'settings.database.sankakuFavouritesUpdateStarted' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateStarted', {}) ?? '{Sankaku favourites update started}',
          'settings.database.sankakuNewUrlsInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuNewUrlsInfo', {}) ??
                '{New image urls will be fetched for Sankaku items in your favourites}',
          'settings.database.sankakuDontLeavePage' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDontLeavePage', {}) ??
                '{Don\'t leave this page until the process is complete or stopped}',
          'settings.database.noSankakuConfigFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.noSankakuConfigFound', {}) ?? '{No Sankaku config found!}',
          'settings.database.sankakuFavouritesUpdateComplete' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateComplete', {}) ??
                '{Sankaku favourites update complete}',
          'settings.database.failedItemsPurgeStartedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeStartedTitle', {}) ?? '{Failed item purge started}',
          'settings.database.failedItemsPurgeInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeInfo', {}) ??
                '{Items that failed to update will be removed from the database}',
          'settings.database.updateSankakuUrls' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.updateSankakuUrls', {}) ?? '{Update Sankaku URLs}',
          'settings.database.updating' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.updating', {'count': count}) ?? '{Updating ${count} items:}',
          'settings.database.left' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.left', {'count': count}) ?? '{Left: ${count}}',
          'settings.database.done' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.done', {'count': count}) ?? '{Done: ${count}}',
          'settings.database.failedSkipped' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.failedSkipped', {'count': count}) ?? '{Failed/Skipped: ${count}}',
          'settings.database.sankakuRateLimitWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuRateLimitWarning', {}) ??
                '{Stop and try again later if you start seeing \'Failed\' number constantly growing, you could have reached rate limit and/or Sankaku blocks requests from your IP.}',
          'settings.database.skipCurrentItem' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.skipCurrentItem', {}) ?? '{Press here to skip current item}',
          'settings.database.useIfStuck' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.useIfStuck', {}) ?? '{Use if item appears to be stuck}',
          'settings.database.pressToStop' => TranslationOverrides.string(_root.$meta, 'settings.database.pressToStop', {}) ?? '{Press here to stop}',
          'settings.database.purgeFailedItems' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.purgeFailedItems', {'count': count}) ?? '{Purge failed items (${count})}',
          'settings.database.retryFailedItems' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.retryFailedItems', {'count': count}) ?? '{Retry failed items (${count})}',
          'settings.backupAndRestore.title' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.title', {}) ?? '{Backup & Restore}',
          'settings.backupAndRestore.duplicateFileDetectedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedTitle', {}) ?? '{Duplicate file detected!}',
          'settings.backupAndRestore.duplicateFileDetectedMsg' =>
            ({required String fileName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
                '{The file ${fileName} already exists. Do you want to overwrite it? If you choose no, the backup will be cancelled.}',
          'settings.backupAndRestore.androidOnlyFeatureMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ??
                '{This feature is only available on Android, on Desktop builds you can just copy/paste files from/to app\'s data folder, respective to your system}',
          'settings.backupAndRestore.selectBackupDir' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? '{Select backup directory}',
          'settings.backupAndRestore.failedToGetBackupPath' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ?? '{Failed to get backup path}',
          'settings.backupAndRestore.backupPathMsg' =>
            ({required String backupPath}) =>
                TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ??
                '{Backup path is: ${backupPath}}',
          'settings.backupAndRestore.noBackupDirSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ?? '{No backup directory selected}',
          'settings.backupAndRestore.restoreInfoMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ??
                '{Restore will work only if the files are placed in the root of the directory.}',
          'settings.backupAndRestore.backupSettings' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? '{Backup settings}',
          'settings.backupAndRestore.restoreSettings' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? '{Restore settings}',
          'settings.backupAndRestore.settingsBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ?? '{Settings backed up to settings.json}',
          'settings.backupAndRestore.settingsRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? '{Settings restored from backup}',
          'settings.backupAndRestore.backupSettingsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ?? '{Failed to backup settings}',
          'settings.backupAndRestore.restoreSettingsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ?? '{Failed to restore settings}',
          'settings.backupAndRestore.backupBoorus' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ?? '{Backup boorus}',
          'settings.backupAndRestore.restoreBoorus' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? '{Restore boorus}',
          'settings.backupAndRestore.boorusBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ?? '{Boorus backed up to boorus.json}',
          'settings.backupAndRestore.boorusRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ?? '{Boorus restored from backup}',
          'settings.backupAndRestore.backupBoorusError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ?? '{Failed to backup boorus}',
          'settings.backupAndRestore.restoreBoorusError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ?? '{Failed to restore boorus}',
          'settings.backupAndRestore.backupDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? '{Backup database}',
          'settings.backupAndRestore.restoreDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? '{Restore database}',
          'settings.backupAndRestore.restoreDatabaseInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ??
                '{May take a while depending on the size of the database, will restart the app on success}',
          'settings.backupAndRestore.databaseBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ?? '{Database backed up to database.json}',
          'settings.backupAndRestore.databaseRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ??
                '{Database restored from backup! App will restart in a few seconds!}',
          'settings.backupAndRestore.backupDatabaseError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ?? '{Failed to backup database}',
          'settings.backupAndRestore.restoreDatabaseError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ?? '{Failed to restore database}',
          'settings.backupAndRestore.databaseFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ??
                '{Database file not found or cannot be read!}',
          'settings.backupAndRestore.backupTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? '{Backup tags}',
          'settings.backupAndRestore.restoreTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? '{Restore tags}',
          'settings.backupAndRestore.restoreTagsInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ??
                '{May take a while if you have a lot of tags. If you did a database restore, you don\'t need to do this because it\'s already included in the database}',
          'settings.backupAndRestore.tagsBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? '{Tags backed up to tags.json}',
          'settings.backupAndRestore.tagsRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? '{Tags restored from backup}',
          'settings.backupAndRestore.backupTagsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? '{Failed to backup tags}',
          'settings.backupAndRestore.restoreTagsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? '{Failed to restore tags}',
          'settings.backupAndRestore.tagsFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsFileNotFound', {}) ?? '{Tags file not found or cannot be read!}',
          'settings.backupAndRestore.operationTakesTooLongMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.operationTakesTooLongMsg', {}) ??
                '{Press Hide below if it takes too long, operation will continue in background}',
          'settings.backupAndRestore.backupFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupFileNotFound', {}) ??
                '{Backup file not found or cannot be read!}',
          'settings.backupAndRestore.backupDirNoAccess' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDirNoAccess', {}) ?? '{No access to backup directory!}',
          'settings.backupAndRestore.backupCancelled' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? '{Backup cancelled}',
          'settings.network.title' => TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? '{Network}',
          'settings.network.enableSelfSignedSSLCertificates' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.enableSelfSignedSSLCertificates', {}) ??
                '{Enable self signed SSL certificates}',
          'settings.network.proxy' => TranslationOverrides.string(_root.$meta, 'settings.network.proxy', {}) ?? '{Proxy}',
          'settings.network.proxySubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.proxySubtitle', {}) ??
                '{Does not apply to streaming video mode, use caching video mode instead}',
          'settings.network.customUserAgent' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgent', {}) ?? '{Custom user agent}',
          'settings.network.customUserAgentTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgentTitle', {}) ?? '{Custom user agent}',
          'settings.network.keepEmptyForDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.keepEmptyForDefault', {}) ?? '{Keep empty to use default value}',
          'settings.network.defaultUserAgent' =>
            ({required String agent}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.defaultUserAgent', {'agent': agent}) ?? '{Default: ${agent}}',
          'settings.network.userAgentUsedOnRequests' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.userAgentUsedOnRequests', {}) ??
                '{Will be used on requests for almost all boorus and on the webview}',
          'settings.network.valueSavedAfterLeaving' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.valueSavedAfterLeaving', {}) ?? '{Value is saved after leaving this page}',
          'settings.network.setBrowserUserAgent' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.setBrowserUserAgent', {}) ??
                '{Tap here to set suggested browser user agent (recommended only when sites you use ban non-browser user agents):}',
          'settings.network.cookieCleaner' => TranslationOverrides.string(_root.$meta, 'settings.network.cookieCleaner', {}) ?? '{Cookie cleaner}',
          'settings.network.booru' => TranslationOverrides.string(_root.$meta, 'settings.network.booru', {}) ?? '{Booru}',
          'settings.network.selectBooruToClearCookies' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.selectBooruToClearCookies', {}) ??
                '{Select a booru to clear cookies for or leave empty to clear all}',
          'settings.network.cookiesFor' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookiesFor', {'booruName': booruName}) ?? '{Cookies for ${booruName}:}',
          'settings.network.cookieDeleted' =>
            ({required String cookieName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookieDeleted', {'cookieName': cookieName}) ??
                '{"${cookieName}" cookie deleted}',
          'settings.network.clearCookies' => TranslationOverrides.string(_root.$meta, 'settings.network.clearCookies', {}) ?? '{Clear cookies}',
          'settings.network.clearCookiesFor' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.clearCookiesFor', {'booruName': booruName}) ??
                '{Clear cookies for ${booruName}}',
          'settings.network.cookiesForBooruDeleted' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookiesForBooruDeleted', {'booruName': booruName}) ??
                '{Cookies for ${booruName} deleted}',
          'settings.network.allCookiesDeleted' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.allCookiesDeleted', {}) ?? '{All cookies deleted}',
          'settings.privacy.title' => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? '{Privacy}',
          'settings.privacy.appLock' => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? '{App lock}',
          'settings.privacy.appLockMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ??
                '{Allows to lock the app manually or if left for too long. Requires system lock with PIN or biometrics to be enabled}',
          'settings.privacy.autoLockAfter' => TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfter', {}) ?? '{Auto lock after}',
          'settings.privacy.autoLockAfterTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfterTip', {}) ?? '{in seconds, 0 to disable}',
          'settings.privacy.bluronLeave' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeave', {}) ?? '{Blur screen when leaving the app}',
          'settings.privacy.bluronLeaveMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeaveMsg', {}) ??
                '{May not work on some devices due to system limitations}',
          'settings.privacy.incognitoKeyboard' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboard', {}) ?? '{Incognito keyboard}',
          'settings.privacy.incognitoKeyboardMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboardMsg', {}) ??
                '{Tells system keyboard to not save your typing history and disable learning based on your input.\nWill be applied to most of text inputs}',
          'settings.performance.title' => TranslationOverrides.string(_root.$meta, 'settings.performance.title', {}) ?? '{Performance}',
          'settings.performance.lowPerformanceMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceMode', {}) ?? '{Low performance mode}',
          'settings.performance.lowPerformanceModeSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeSubtitle', {}) ??
                '{Recommended for old devices and devices with low RAM}',
          'settings.performance.lowPerformanceModeDialogTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogTitle', {}) ?? '{Low performance mode}',
          'settings.performance.lowPerformanceModeDialogDisablesDetailed' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesDetailed', {}) ??
                '{- Disables detailed loading progress information}',
          'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive', {}) ??
                '{- Disables resource-intensive elements (blurs, animated opacity, some animations...)}',
          'settings.performance.lowPerformanceModeDialogSetsOptimal' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogSetsOptimal', {}) ??
                '{- Sets optimal settings for these options (you can change them separately later):}',
          'settings.performance.lowPerformanceModeDialogPreviewQuality' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogPreviewQuality', {}) ??
                '{   - Preview quality [Thumbnail]}',
          'settings.performance.lowPerformanceModeDialogImageQuality' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogImageQuality', {}) ??
                '{   - Image quality [Sample]}',
          'settings.performance.lowPerformanceModeDialogPreviewColumns' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogPreviewColumns', {}) ??
                '{   - Preview columns [2 - portrait, 4 - landscape]}',
          'settings.performance.lowPerformanceModeDialogPreloadAmount' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogPreloadAmount', {}) ??
                '{   - Preload amount and size [0, 0.2]}',
          'settings.performance.lowPerformanceModeDialogVideoAutoplay' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogVideoAutoplay', {}) ??
                '{   - Video autoplay [false]}',
          'settings.performance.lowPerformanceModeDialogDontScaleImages' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDontScaleImages', {}) ??
                '{   - Don\'t scale images [false]}',
          'settings.performance.previewQuality' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.previewQuality', {}) ?? '{Preview quality}',
          'settings.performance.imageQuality' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.imageQuality', {}) ?? '{Image quality}',
          'settings.performance.previewColumnsPortrait' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.previewColumnsPortrait', {}) ?? '{Preview columns (portrait)}',
          'settings.performance.previewColumnsLandscape' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.previewColumnsLandscape', {}) ?? '{Preview columns (landscape)}',
          'settings.performance.preloadAmount' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.preloadAmount', {}) ?? '{Preload amount}',
          'settings.performance.preloadSizeLimit' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.preloadSizeLimit', {}) ?? '{Preload size limit}',
          'settings.performance.preloadSizeLimitSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.preloadSizeLimitSubtitle', {}) ?? '{in GB, 0 for no limit}',
          'settings.performance.dontScaleImages' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.dontScaleImages', {}) ?? '{Don\'t scale images}',
          'settings.performance.dontScaleImagesSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.dontScaleImagesSubtitle', {}) ??
                '{Disables image scaling which is used to improve performance}',
          'settings.performance.dontScaleImagesWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.dontScaleImagesWarningTitle', {}) ?? '{Warning}',
          'settings.performance.dontScaleImagesWarningMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.dontScaleImagesWarningMsg', {}) ??
                '{Are you sure you want to disable image scaling?}',
          'settings.performance.dontScaleImagesWarningPerformance' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.dontScaleImagesWarningPerformance', {}) ??
                '{This can negatively impact the performance, especially on older devices}',
          'settings.performance.autoplayVideos' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.autoplayVideos', {}) ?? '{Autoplay videos}',
          'settings.performance.disableVideos' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideos', {}) ?? '{Disable videos}',
          'settings.performance.disableVideosHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideosHelp', {}) ??
                '{Useful on low end devices that crash when trying to load videos. Gives options to view video in external player or browser instead.}',
          'settings.cache.title' => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? '{Snatching & Caching}',
          'settings.cache.snatchQuality' => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchQuality', {}) ?? '{Snatch quality}',
          'settings.cache.snatchCooldown' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.snatchCooldown', {}) ?? '{Snatch cooldown (in ms)}',
          'settings.cache.pleaseEnterAValidTimeout' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.pleaseEnterAValidTimeout', {}) ?? '{Please enter a valid timeout value}',
          'settings.cache.biggerThan10' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.biggerThan10', {}) ?? '{Please enter a value bigger than 10ms}',
          'settings.cache.showDownloadNotifications' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.showDownloadNotifications', {}) ?? '{Show download notifications}',
          'settings.cache.snatchItemsOnFavouriting' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.snatchItemsOnFavouriting', {}) ?? '{Snatch items on favouriting}',
          'settings.cache.favouriteItemsOnSnatching' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.favouriteItemsOnSnatching', {}) ?? '{Favourite items on snatching}',
          'settings.cache.writeImageDataOnSave' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.writeImageDataOnSave', {}) ?? '{Write image data to JSON on save}',
          'settings.cache.requiresCustomStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.requiresCustomStorageDirectory', {}) ?? '{Requires custom storage directory}',
          'settings.cache.setStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.setStorageDirectory', {}) ?? '{Set storage directory}',
          'settings.cache.currentPath' =>
            ({required String path}) =>
                TranslationOverrides.string(_root.$meta, 'settings.cache.currentPath', {'path': path}) ?? '{Current: ${path}}',
          'settings.cache.resetStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.resetStorageDirectory', {}) ?? '{Reset storage directory}',
          'settings.cache.cachePreviews' => TranslationOverrides.string(_root.$meta, 'settings.cache.cachePreviews', {}) ?? '{Cache previews}',
          'settings.cache.cacheMedia' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheMedia', {}) ?? '{Cache media}',
          'settings.cache.videoCacheMode' => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheMode', {}) ?? '{Video cache mode}',
          'settings.cache.videoCacheModesTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModesTitle', {}) ?? '{Video cache modes}',
          'settings.cache.videoCacheModeStream' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStream', {}) ??
                '{- Stream - Don\'t cache, start playing as soon as possible}',
          'settings.cache.videoCacheModeCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeCache', {}) ??
                '{- Cache - Saves the file to device storage, plays only when download is complete}',
          'settings.cache.videoCacheModeStreamCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStreamCache', {}) ??
                '{- Stream+Cache - Mix of both, but currently leads to double download}',
          'settings.cache.videoCacheNoteEnable' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheNoteEnable', {}) ??
                '{[Note]: Videos will cache only if \'Cache Media\' is enabled.}',
          'settings.cache.videoCacheWarningDesktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheWarningDesktop', {}) ??
                '{[Warning]: On desktop Stream mode can work incorrectly for some Boorus.}',
          'settings.cache.deleteCacheAfter' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.deleteCacheAfter', {}) ?? '{Delete cache after:}',
          'settings.cache.cacheSizeLimit' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.cacheSizeLimit', {}) ?? '{Cache size Limit (in GB)}',
          'settings.cache.maximumTotalCacheSize' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.maximumTotalCacheSize', {}) ?? '{Maximum total cache size}',
          'settings.cache.cacheStats' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheStats', {}) ?? '{Cache stats:}',
          'settings.cache.loading' => TranslationOverrides.string(_root.$meta, 'settings.cache.loading', {}) ?? '{Loading...}',
          'settings.cache.empty' => TranslationOverrides.string(_root.$meta, 'settings.cache.empty', {}) ?? '{Empty}',
          'settings.cache.inFilesPlural' =>
            ({required String size, required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.cache.inFilesPlural', {'size': size, 'count': count}) ??
                '{${size}, ${count} files}',
          'settings.cache.inFileSingular' =>
            ({required String size}) =>
                TranslationOverrides.string(_root.$meta, 'settings.cache.inFileSingular', {'size': size}) ?? '{${size}, 1 file}',
          'settings.cache.cacheTypeTotal' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeTotal', {}) ?? '{Total}',
          'settings.cache.cacheTypeFavicons' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeFavicons', {}) ?? '{Favicons}',
          'settings.cache.cacheTypeThumbnails' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeThumbnails', {}) ?? '{Thumbnails}',
          'settings.cache.cacheTypeSamples' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeSamples', {}) ?? '{Samples}',
          'settings.cache.cacheTypeMedia' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeMedia', {}) ?? '{Media}',
          'settings.cache.cacheTypeWebView' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeWebView', {}) ?? '{WebView}',
          'settings.cache.cacheCleared' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheCleared', {}) ?? '{Cache cleared}',
          'settings.cache.clearedCacheType' =>
            ({required String type}) =>
                TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheType', {'type': type}) ?? '{Cleared ${type} cache}',
          'settings.cache.clearAllCache' => TranslationOverrides.string(_root.$meta, 'settings.cache.clearAllCache', {}) ?? '{Clear all cache}',
          'settings.cache.clearedCacheCompletely' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheCompletely', {}) ?? '{Cleared cache completely}',
          'settings.cache.appRestartRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.appRestartRequired', {}) ?? '{App Restart may be required!}',
          'settings.cache.errorExclamation' => TranslationOverrides.string(_root.$meta, 'settings.cache.errorExclamation', {}) ?? '{Error!}',
          'settings.cache.notAvailableForPlatform' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.notAvailableForPlatform', {}) ?? '{Currently not available for this platform}',
          'settings.tagsFilters.title' => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.title', {}) ?? '{Tag filters}',
          'settings.tagsFilters.hated' => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.hated', {}) ?? '{Hated}',
          'settings.tagsFilters.loved' => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.loved', {}) ?? '{Loved}',
          'settings.tagsFilters.duplicateTag' =>
            TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.duplicateTag', {}) ?? '{Duplicate tag}',
          'settings.tagsFilters.alreadyInList' =>
            ({required String tag, required String type}) =>
                TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.alreadyInList', {'tag': tag, 'type': type}) ??
                '{\'${tag}\' is already in ${type} list}',
          'settings.tagsFilters.searchFiltersCount' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.searchFiltersCount', {'count': count}) ??
                '{Search filters (${count})}',
          'settings.tagsFilters.searchFiltersFilteredCount' =>
            ({required int filtered, required int total}) =>
                TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.searchFiltersFilteredCount', {'filtered': filtered, 'total': total}) ??
                '{Search filters (${filtered}/${total})}',
          'settings.tagsFilters.noFiltersFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.noFiltersFound', {}) ?? '{No filters found}',
          'settings.tagsFilters.noFiltersAdded' =>
            TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.noFiltersAdded', {}) ?? '{No filters added}',
          'settings.tagsFilters.newFilterType' =>
            ({required String type}) =>
                TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.newFilterType', {'type': type}) ?? '{New ${type} tag filter}',
          'settings.tagsFilters.newFilter' => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.newFilter', {}) ?? '{New filter}',
          'settings.tagsFilters.editFilter' => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.editFilter', {}) ?? '{Edit Filter}',
          'settings.tagsFilters.searchFilters' =>
            TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.searchFilters', {}) ?? '{Search filters}',
          'settings.tagsFilters.removeHated' =>
            TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.removeHated', {}) ?? '{Remove items with Hated tags}',
          'settings.tagsFilters.removeFavourited' =>
            TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.removeFavourited', {}) ?? '{Remove favourited items}',
          'settings.tagsFilters.removeSnatched' =>
            TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.removeSnatched', {}) ?? '{Remove snatched items}',
          'settings.tagsFilters.removeAI' => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.removeAI', {}) ?? '{Remove AI items}',
          'settings.sync.title' => TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? '{LoliSync}',
          'settings.sync.dbError' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ?? '{Database must be enabled to use LoliSync}',
          'settings.sync.errorTitle' => TranslationOverrides.string(_root.$meta, 'settings.sync.errorTitle', {}) ?? '{Error!}',
          'settings.sync.pleaseEnterIPAndPort' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.pleaseEnterIPAndPort', {}) ?? '{Please enter IP address and port.}',
          'settings.sync.selectWhatYouWantToDo' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.selectWhatYouWantToDo', {}) ?? '{Select what you want to do}',
          'settings.sync.sendDataToDevice' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendDataToDevice', {}) ?? '{SEND data TO another device}',
          'settings.sync.receiveDataFromDevice' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.receiveDataFromDevice', {}) ?? '{RECEIVE data FROM another device}',
          'settings.sync.senderInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.senderInstructions', {}) ??
                '{Start the server on another device it will show an ip and port, fill those in and then hit start sync to send data from this device to the other}',
          'settings.sync.ipAddress' => TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddress', {}) ?? '{IP Address}',
          'settings.sync.ipAddressPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddressPlaceholder', {}) ?? '{Host IP Address (i.e. 192.168.1.1)}',
          'settings.sync.port' => TranslationOverrides.string(_root.$meta, 'settings.sync.port', {}) ?? '{Port}',
          'settings.sync.portPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.portPlaceholder', {}) ?? '{Host Port (i.e. 7777)}',
          'settings.sync.sendFavourites' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavourites', {}) ?? '{Send favourites}',
          'settings.sync.favouritesCount' =>
            ({required String count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.favouritesCount', {'count': count}) ?? '{Favorites: ${count}}',
          'settings.sync.sendFavouritesLegacy' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavouritesLegacy', {}) ?? '{Send favourites (Legacy)}',
          'settings.sync.syncFavsFrom' => TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFrom', {}) ?? '{Sync favs from #...}',
          'settings.sync.syncFavsFromHelpText1' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText1', {}) ??
                '{Allows to set from where the sync should start from, useful if you already synced all your favs before and want to sync only the newest items}',
          'settings.sync.syncFavsFromHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText2', {}) ??
                '{If you want to sync from the beginning leave this field blank}',
          'settings.sync.syncFavsFromHelpText3' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText3', {}) ??
                '{Example: You have X amount of favs, set this field to 100, sync will start from item #100 and go until it reaches X}',
          'settings.sync.syncFavsFromHelpText4' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText4', {}) ?? '{Order of favs: From oldest (0) to newest (X)}',
          'settings.sync.sendSnatchedHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendSnatchedHistory', {}) ?? '{Send snatched history}',
          'settings.sync.snatchedCount' =>
            ({required String count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.snatchedCount', {'count': count}) ?? '{Snatched: ${count}}',
          'settings.sync.syncSnatchedFrom' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFrom', {}) ?? '{Sync snatched from #...}',
          'settings.sync.syncSnatchedFromHelpText1' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText1', {}) ??
                '{Allows to set from where the sync should start from, useful if you already synced all your snatched history before and want to sync only the newest items}',
          'settings.sync.syncSnatchedFromHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText2', {}) ??
                '{If you want to sync from the beginning leave this field blank}',
          'settings.sync.syncSnatchedFromHelpText3' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText3', {}) ??
                '{Example: You have X amount of favs, set this field to 100, sync will start from item #100 and go until it reaches X}',
          'settings.sync.syncSnatchedFromHelpText4' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText4', {}) ??
                '{Order of favs: From oldest (0) to newest (X)}',
          'settings.sync.sendSettings' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSettings', {}) ?? '{Send settings}',
          'settings.sync.sendBooruConfigs' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendBooruConfigs', {}) ?? '{Send booru configs}',
          'settings.sync.configsCount' =>
            ({required String count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.configsCount', {'count': count}) ?? '{Configs: ${count}}',
          'settings.sync.sendTabs' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTabs', {}) ?? '{Send tabs}',
          'settings.sync.tabsCount' =>
            ({required String count}) => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsCount', {'count': count}) ?? '{Tabs: ${count}}',
          'settings.sync.tabsSyncMode' => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncMode', {}) ?? '{Tabs sync mode}',
          'settings.sync.tabsSyncModeMerge' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeMerge', {}) ??
                '{Merge: Merge the tabs from this device on the other device, tabs with unknown boorus and already existing tabs will be ignored}',
          'settings.sync.tabsSyncModeReplace' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeReplace', {}) ??
                '{Replace: Completely replace the tabs on the other device with the tabs from this device}',
          'settings.sync.merge' => TranslationOverrides.string(_root.$meta, 'settings.sync.merge', {}) ?? '{Merge}',
          'settings.sync.replace' => TranslationOverrides.string(_root.$meta, 'settings.sync.replace', {}) ?? '{Replace}',
          'settings.sync.sendTags' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTags', {}) ?? '{Send tags}',
          'settings.sync.tagsCount' =>
            ({required String count}) => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsCount', {'count': count}) ?? '{Tags: ${count}}',
          'settings.sync.tagsSyncMode' => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncMode', {}) ?? '{Tags sync mode}',
          'settings.sync.tagsSyncModePreferTypeIfNone' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModePreferTypeIfNone', {}) ??
                '{PreferTypeIfNone: If the tag exists with a tag type on the other device and it doesn\'t on this device it will be skipped}',
          'settings.sync.tagsSyncModeOverwrite' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModeOverwrite', {}) ??
                '{Overwrite: All tags will be added, if a tag and tag type exists on the other device it will be overwritten}',
          'settings.sync.preferTypeIfNone' => TranslationOverrides.string(_root.$meta, 'settings.sync.preferTypeIfNone', {}) ?? '{PreferTypeIfNone}',
          'settings.sync.overwrite' => TranslationOverrides.string(_root.$meta, 'settings.sync.overwrite', {}) ?? '{Overwrite}',
          'settings.sync.testConnection' => TranslationOverrides.string(_root.$meta, 'settings.sync.testConnection', {}) ?? '{Test connection}',
          'settings.sync.testConnectionHelpText1' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText1', {}) ??
                '{This will send a test request to the other device.}',
          'settings.sync.testConnectionHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText2', {}) ??
                '{There will be a notification stating if the request was successful or not.}',
          'settings.sync.startSync' => TranslationOverrides.string(_root.$meta, 'settings.sync.startSync', {}) ?? '{Start sync}',
          'settings.sync.portAndIPCannotBeEmpty' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.portAndIPCannotBeEmpty', {}) ?? '{The Port and IP fields cannot be empty!}',
          'settings.sync.nothingSelectedToSync' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.nothingSelectedToSync', {}) ?? '{You haven\'t selected anything to sync!}',
          'settings.sync.statsOfThisDevice' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.statsOfThisDevice', {}) ?? '{Stats of this device:}',
          'settings.sync.receiverInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.receiverInstructions', {}) ??
                '{Start the server if you want to recieve data from another device, do not use this on public wifi as you might get pozzed}',
          'settings.sync.availableNetworkInterfaces' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.availableNetworkInterfaces', {}) ?? '{Available network interfaces}',
          'settings.sync.selectedInterfaceIP' =>
            ({required String ip}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.selectedInterfaceIP', {'ip': ip}) ?? '{Selected interface IP: ${ip}}',
          'settings.sync.serverPort' => TranslationOverrides.string(_root.$meta, 'settings.sync.serverPort', {}) ?? '{Server port}',
          'settings.sync.serverPortPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.serverPortPlaceholder', {}) ?? '{(will default to \'8080\' if empty)}',
          'settings.sync.startReceiverServer' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.startReceiverServer', {}) ?? '{Start receiver server}',
          'settings.sync.keepTheScreenAwake' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.keepTheScreenAwake', {}) ?? '{Keep the screen awake}',
          'settings.about.title' => TranslationOverrides.string(_root.$meta, 'settings.about.title', {}) ?? '{About}',
          'settings.about.appDescription' =>
            TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ??
                '{LoliSnatcher is open source and licensed under GPLv3 the source code is available on github. Please report any issues or feature requests in the issues section of the repo.}',
          'settings.about.appOnGitHub' => TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? '{LoliSnatcher on Github}',
          'settings.about.contact' => TranslationOverrides.string(_root.$meta, 'settings.about.contact', {}) ?? '{Contact}',
          'settings.about.emailCopied' => TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? '{Email copied to clipboard}',
          'settings.about.logoArtistThanks' =>
            TranslationOverrides.string(_root.$meta, 'settings.about.logoArtistThanks', {}) ??
                '{A big thanks to Showers-U for letting us use their artwork for the app logo. Please check them out on Pixiv}',
          'settings.about.developers' => TranslationOverrides.string(_root.$meta, 'settings.about.developers', {}) ?? '{Developers}',
          'settings.about.releases' => TranslationOverrides.string(_root.$meta, 'settings.about.releases', {}) ?? '{Releases}',
          'settings.about.releasesMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.about.releasesMsg', {}) ??
                '{Latest version and full changelogs can be found at the Github Releases page:}',
          'settings.about.licenses' => TranslationOverrides.string(_root.$meta, 'settings.about.licenses', {}) ?? '{Licenses}',
          'settings.checkForUpdates.title' => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.title', {}) ?? '{Check for updates}',
          'settings.checkForUpdates.updateAvailable' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateAvailable', {}) ?? '{Update available!}',
          'settings.checkForUpdates.updateChangelog' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? '{Update changelog}',
          'settings.checkForUpdates.updateCheckError' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? '{Update check error!}',
          'settings.checkForUpdates.youHaveLatestVersion' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? '{You have the latest version}',
          'settings.checkForUpdates.viewLatestChangelog' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ?? '{View latest changelog}',
          'settings.checkForUpdates.currentVersion' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? '{Current version}',
          'settings.checkForUpdates.changelog' => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? '{Changelog}',
          'settings.checkForUpdates.visitPlayStore' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? '{Visit Play Store}',
          'settings.checkForUpdates.visitReleases' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? '{Visit releases}',
          'settings.logs.title' => TranslationOverrides.string(_root.$meta, 'settings.logs.title', {}) ?? '{Logs}',
          'settings.logs.shareLogs' => TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogs', {}) ?? '{Share logs}',
          'settings.logs.shareLogsWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningTitle', {}) ?? '{Share logs to external app?}',
          'settings.logs.shareLogsWarningMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningMsg', {}) ??
                '{[WARNING]: Logs may contain sensitive information, share with caution!}',
          'settings.help.title' => TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? '{Help}',
          'settings.debug.title' => TranslationOverrides.string(_root.$meta, 'settings.debug.title', {}) ?? '{Debug}',
          'settings.debug.enabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.enabledSnackbarMsg', {}) ?? '{Debug mode is enabled!}',
          'settings.debug.disabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.disabledSnackbarMsg', {}) ?? '{Debug mode is disabled!}',
          'settings.debug.alreadyEnabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.alreadyEnabledSnackbarMsg', {}) ?? '{Debug mode is already enabled!}',
          'settings.debug.openAlice' => TranslationOverrides.string(_root.$meta, 'settings.debug.openAlice', {}) ?? '{Open network inspector}',
          'settings.debug.openLogger' => TranslationOverrides.string(_root.$meta, 'settings.debug.openLogger', {}) ?? '{Open logger}',
          'settings.debug.showPerformanceGraph' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.showPerformanceGraph', {}) ?? '{Show performance graph}',
          'settings.debug.showFPSGraph' => TranslationOverrides.string(_root.$meta, 'settings.debug.showFPSGraph', {}) ?? '{Show FPS graph}',
          'settings.debug.showImageStats' => TranslationOverrides.string(_root.$meta, 'settings.debug.showImageStats', {}) ?? '{Show image stats}',
          'settings.debug.showVideoStats' => TranslationOverrides.string(_root.$meta, 'settings.debug.showVideoStats', {}) ?? '{Show video stats}',
          'settings.debug.blurImagesAndMuteVideosDevOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.blurImagesAndMuteVideosDevOnly', {}) ?? '{Blur images + mute videos [DEV only]}',
          'settings.debug.enableDragScrollOnListsDesktopOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.enableDragScrollOnListsDesktopOnly', {}) ??
                '{Enable drag scroll on lists [Desktop only]}',
          'settings.debug.animationSpeed' =>
            ({required double speed}) =>
                TranslationOverrides.string(_root.$meta, 'settings.debug.animationSpeed', {'speed': speed}) ?? '{Animation speed (${speed})}',
          'settings.debug.tagsManager' => TranslationOverrides.string(_root.$meta, 'settings.debug.tagsManager', {}) ?? '{Tags Manager}',
          'settings.debug.vibration' => TranslationOverrides.string(_root.$meta, 'settings.debug.vibration', {}) ?? '{Vibration}',
          'settings.debug.vibrationTests' => TranslationOverrides.string(_root.$meta, 'settings.debug.vibrationTests', {}) ?? '{Vibration tests}',
          'settings.debug.duration' => TranslationOverrides.string(_root.$meta, 'settings.debug.duration', {}) ?? '{Duration}',
          'settings.debug.amplitude' => TranslationOverrides.string(_root.$meta, 'settings.debug.amplitude', {}) ?? '{Amplitude}',
          'settings.debug.flutterway' => TranslationOverrides.string(_root.$meta, 'settings.debug.flutterway', {}) ?? '{Flutterway}',
          'settings.debug.vibrate' => TranslationOverrides.string(_root.$meta, 'settings.debug.vibrate', {}) ?? '{Vibrate}',
          'settings.debug.resolution' =>
            ({required String width, required String height}) =>
                TranslationOverrides.string(_root.$meta, 'settings.debug.resolution', {'width': width, 'height': height}) ??
                '{Res: ${width}x${height}}',
          'settings.debug.pixelRatio' =>
            ({required String ratio}) =>
                TranslationOverrides.string(_root.$meta, 'settings.debug.pixelRatio', {'ratio': ratio}) ?? '{Pixel ratio: ${ratio}}',
          'settings.debug.logger' => TranslationOverrides.string(_root.$meta, 'settings.debug.logger', {}) ?? '{Logger}',
          'settings.debug.webview' => TranslationOverrides.string(_root.$meta, 'settings.debug.webview', {}) ?? '{Webview}',
          'settings.debug.deleteAllCookies' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.deleteAllCookies', {}) ?? '{Delete all cookies}',
          'settings.debug.clearSecureStorage' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.clearSecureStorage', {}) ?? '{Clear secure storage}',
          'settings.debug.getSessionString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.getSessionString', {}) ?? '{Get session string}',
          'settings.debug.setSessionString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.setSessionString', {}) ?? '{Set session string}',
          'settings.debug.sessionString' => TranslationOverrides.string(_root.$meta, 'settings.debug.sessionString', {}) ?? '{Session string}',
          'settings.debug.restoredSessionFromString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.restoredSessionFromString', {}) ?? '{Restored session from string}',
          'settings.logging.title' => TranslationOverrides.string(_root.$meta, 'settings.logging.title', {}) ?? '{Logging}',
          'settings.logging.logger' => TranslationOverrides.string(_root.$meta, 'settings.logging.logger', {}) ?? '{Logger}',
          'settings.logging.enabledMsg' => TranslationOverrides.string(_root.$meta, 'settings.logging.enabledMsg', {}) ?? '{Logging is enabled}',
          'settings.logging.enabledLogTypes' =>
            TranslationOverrides.string(_root.$meta, 'settings.logging.enabledLogTypes', {}) ?? '{Enabled log types}',
          'settings.logging.disableTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.logging.disableTip', {}) ?? '{You can disable logging in the debug settings}',
          'settings.webview.openWebview' => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? '{Open webview}',
          'settings.webview.openWebviewTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? '{to login or obtain cookies}',
          'settings.dirPicker.defaultPath' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.defaultPath', {}) ?? '{/0}',
          'settings.dirPicker.directoryName' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryName', {}) ?? '{Directory name}',
          'settings.dirPicker.selectADirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.selectADirectory', {}) ?? '{Select a directory}',
          'settings.dirPicker.closeWithoutChoosing' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.closeWithoutChoosing', {}) ??
                '{Do you want to close the picker without choosing a directory?}',
          'settings.dirPicker.no' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.no', {}) ?? '{No}',
          'settings.dirPicker.yes' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.yes', {}) ?? '{Yes}',
          'settings.dirPicker.error' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.error', {}) ?? '{Error!}',
          'settings.dirPicker.failedToCreateDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.failedToCreateDirectory', {}) ?? '{Failed to create directory}',
          'settings.dirPicker.directoryNotWritable' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryNotWritable', {}) ?? '{Directory is not writable!}',
          'settings.dirPicker.newDirectory' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.newDirectory', {}) ?? '{New directory}',
          'settings.dirPicker.create' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.create', {}) ?? '{Create}',
          'settings.version' => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? '{Version}',
          'comments.title' => TranslationOverrides.string(_root.$meta, 'comments.title', {}) ?? '{Comments}',
          'comments.noComments' => TranslationOverrides.string(_root.$meta, 'comments.noComments', {}) ?? '{No comments}',
          'comments.noBooruAPIForComments' =>
            TranslationOverrides.string(_root.$meta, 'comments.noBooruAPIForComments', {}) ??
                '{This Booru doesn\'t have comments or there is no API for them}',
          'pageChanger.title' => TranslationOverrides.string(_root.$meta, 'pageChanger.title', {}) ?? '{Page changer}',
          'pageChanger.pageLabel' => TranslationOverrides.string(_root.$meta, 'pageChanger.pageLabel', {}) ?? '{Page #}',
          'pageChanger.delayBetweenLoadings' =>
            TranslationOverrides.string(_root.$meta, 'pageChanger.delayBetweenLoadings', {}) ?? '{Delay between loadings (ms)}',
          'pageChanger.delayInMs' => TranslationOverrides.string(_root.$meta, 'pageChanger.delayInMs', {}) ?? '{Delay in ms}',
          'pageChanger.currentPage' =>
            ({required int number}) =>
                TranslationOverrides.string(_root.$meta, 'pageChanger.currentPage', {'number': number}) ?? '{Current page #${number}}',
          'pageChanger.possibleMaxPage' =>
            ({required int number}) =>
                TranslationOverrides.string(_root.$meta, 'pageChanger.possibleMaxPage', {'number': number}) ?? '{Possible max page #~${number}}',
          'pageChanger.searchCurrentlyRunning' =>
            TranslationOverrides.string(_root.$meta, 'pageChanger.searchCurrentlyRunning', {}) ?? '{Search currently running!}',
          'pageChanger.jumpToPage' => TranslationOverrides.string(_root.$meta, 'pageChanger.jumpToPage', {}) ?? '{Jump to page}',
          'pageChanger.searchUntilPage' => TranslationOverrides.string(_root.$meta, 'pageChanger.searchUntilPage', {}) ?? '{Search until page}',
          'pageChanger.stopSearching' => TranslationOverrides.string(_root.$meta, 'pageChanger.stopSearching', {}) ?? '{Stop searching}',
          'tagsFiltersDialogs.emptyInput' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.emptyInput', {}) ?? '{Empty input!}',
          'tagsFiltersDialogs.addNewFilter' =>
            ({required String type}) =>
                TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.addNewFilter', {'type': type}) ?? '{[Add new ${type} filter]}',
          'tagsFiltersDialogs.newTagFilter' =>
            ({required String type}) =>
                TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newTagFilter', {'type': type}) ?? '{New ${type} tag filter}',
          'tagsFiltersDialogs.newFilter' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newFilter', {}) ?? '{New filter}',
          'tagsFiltersDialogs.editTagFilter' =>
            TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.editTagFilter', {}) ?? '{Edit tag filter}',
          'tagsFiltersDialogs.confirmDelete' =>
            TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.confirmDelete', {}) ?? '{Confirm delete}',
          'tagsManager.title' => TranslationOverrides.string(_root.$meta, 'tagsManager.title', {}) ?? '{Tags}',
          'tagsManager.addTag' => TranslationOverrides.string(_root.$meta, 'tagsManager.addTag', {}) ?? '{Add tag}',
          'tagsManager.name' => TranslationOverrides.string(_root.$meta, 'tagsManager.name', {}) ?? '{Name}',
          'tagsManager.type' => TranslationOverrides.string(_root.$meta, 'tagsManager.type', {}) ?? '{Type}',
          'tagsManager.add' => TranslationOverrides.string(_root.$meta, 'tagsManager.add', {}) ?? '{Add}',
          'tagsManager.staleAfter' =>
            ({required String staleText}) =>
                TranslationOverrides.string(_root.$meta, 'tagsManager.staleAfter', {'staleText': staleText}) ?? '{Stale after: ${staleText}}',
          'tagsManager.addedATab' => TranslationOverrides.string(_root.$meta, 'tagsManager.addedATab', {}) ?? '{Added a tab}',
          'tagsManager.addATab' => TranslationOverrides.string(_root.$meta, 'tagsManager.addATab', {}) ?? '{Add a tab}',
          'tagsManager.copy' => TranslationOverrides.string(_root.$meta, 'tagsManager.copy', {}) ?? '{Copy}',
          'tagsManager.setStale' => TranslationOverrides.string(_root.$meta, 'tagsManager.setStale', {}) ?? '{Set stale}',
          'tagsManager.resetStale' => TranslationOverrides.string(_root.$meta, 'tagsManager.resetStale', {}) ?? '{Reset stale}',
          'tagsManager.makeUnstaleable' => TranslationOverrides.string(_root.$meta, 'tagsManager.makeUnstaleable', {}) ?? '{Make unstaleable}',
          'tagsManager.deleteTags' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'tagsManager.deleteTags', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
                  count,
                  one: '{Delete 1 tag}',
                  other: '{Delete ${count} tags}',
                ),
          'tagsManager.deleteTagsTitle' => TranslationOverrides.string(_root.$meta, 'tagsManager.deleteTagsTitle', {}) ?? '{Delete tags}',
          'tagsManager.clearSelection' => TranslationOverrides.string(_root.$meta, 'tagsManager.clearSelection', {}) ?? '{Clear selection}',
          'lockscreen.tapToAuthenticate' => TranslationOverrides.string(_root.$meta, 'lockscreen.tapToAuthenticate', {}) ?? '{Tap to authenticate}',
          'lockscreen.devUnlock' => TranslationOverrides.string(_root.$meta, 'lockscreen.devUnlock', {}) ?? '{DEV UNLOCK}',
          'lockscreen.testingMessage' =>
            TranslationOverrides.string(_root.$meta, 'lockscreen.testingMessage', {}) ??
                '{[TESTING]: Press this if you cannot unlock the app through normal means. Report to developer with details about your device.}',
          'loliSync.title' => TranslationOverrides.string(_root.$meta, 'loliSync.title', {}) ?? '{LoliSync}',
          'loliSync.favourites' => TranslationOverrides.string(_root.$meta, 'loliSync.favourites', {}) ?? '{Favourites}',
          'loliSync.favouritesv2' => TranslationOverrides.string(_root.$meta, 'loliSync.favouritesv2', {}) ?? '{Favouritesv2}',
          'loliSync.snatched' => TranslationOverrides.string(_root.$meta, 'loliSync.snatched', {}) ?? '{Snatched}',
          'loliSync.settingsData' => TranslationOverrides.string(_root.$meta, 'loliSync.settingsData', {}) ?? '{Settings}',
          'loliSync.booruData' => TranslationOverrides.string(_root.$meta, 'loliSync.booruData', {}) ?? '{Booru}',
          'loliSync.tabsData' => TranslationOverrides.string(_root.$meta, 'loliSync.tabsData', {}) ?? '{Tabs}',
          'loliSync.tagsData' => TranslationOverrides.string(_root.$meta, 'loliSync.tagsData', {}) ?? '{Tags}',
          'loliSync.stopSyncingQuestion' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.stopSyncingQuestion', {}) ?? '{Do you want to stop syncing?}',
          'loliSync.stopServerQuestion' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.stopServerQuestion', {}) ?? '{Do you want to stop the server?}',
          'loliSync.noConnection' => TranslationOverrides.string(_root.$meta, 'loliSync.noConnection', {}) ?? '{No connection}',
          'loliSync.waitingForConnection' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.waitingForConnection', {}) ?? '{Waiting for connection...}',
          'loliSync.startingServer' => TranslationOverrides.string(_root.$meta, 'loliSync.startingServer', {}) ?? '{Starting server...}',
          'loliSync.keepScreenAwake' => TranslationOverrides.string(_root.$meta, 'loliSync.keepScreenAwake', {}) ?? '{Keep the screen awake}',
          'loliSync.serverKilled' => TranslationOverrides.string(_root.$meta, 'loliSync.serverKilled', {}) ?? '{LoliSync server killed}',
          'loliSync.testError' =>
            ({required int statusCode, required String reasonPhrase}) =>
                TranslationOverrides.string(_root.$meta, 'loliSync.testError', {'statusCode': statusCode, 'reasonPhrase': reasonPhrase}) ??
                '{Test error: ${statusCode} ${reasonPhrase}}',
          'loliSync.testErrorException' =>
            ({required String error}) =>
                TranslationOverrides.string(_root.$meta, 'loliSync.testErrorException', {'error': error}) ?? '{Test error: ${error}}',
          'loliSync.testSuccess' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.testSuccess', {}) ?? '{Test request received a positive response}',
          'loliSync.testSuccessMessage' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.testSuccessMessage', {}) ?? '{There should be a \'Test\' message on the other device}',
          'imageSearch.title' => TranslationOverrides.string(_root.$meta, 'imageSearch.title', {}) ?? '{Image search}',
          'tagView.tags' => TranslationOverrides.string(_root.$meta, 'tagView.tags', {}) ?? '{Tags}',
          'tagView.comments' => TranslationOverrides.string(_root.$meta, 'tagView.comments', {}) ?? '{Comments}',
          'tagView.showNotes' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'tagView.showNotes', {'count': count}) ?? '{Show notes (${count})}',
          'tagView.hideNotes' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'tagView.hideNotes', {'count': count}) ?? '{Hide notes (${count})}',
          'tagView.loadNotes' => TranslationOverrides.string(_root.$meta, 'tagView.loadNotes', {}) ?? '{Load notes}',
          'tagView.copiedToClipboard' =>
            ({required String title}) =>
                TranslationOverrides.string(_root.$meta, 'tagView.copiedToClipboard', {'title': title}) ?? '{Copied ${title} to clipboard}',
          'tagView.thisTagAlreadyInSearch' =>
            TranslationOverrides.string(_root.$meta, 'tagView.thisTagAlreadyInSearch', {}) ?? '{This tag is already in the current search query:}',
          'tagView.addedToCurrentSearch' =>
            TranslationOverrides.string(_root.$meta, 'tagView.addedToCurrentSearch', {}) ?? '{Added to current search query:}',
          'tagView.addedNewTab' => TranslationOverrides.string(_root.$meta, 'tagView.addedNewTab', {}) ?? '{Added new tab:}',
          'tagView.id' => TranslationOverrides.string(_root.$meta, 'tagView.id', {}) ?? '{ID}',
          'tagView.postURL' => TranslationOverrides.string(_root.$meta, 'tagView.postURL', {}) ?? '{Post URL}',
          'tagView.posted' => TranslationOverrides.string(_root.$meta, 'tagView.posted', {}) ?? '{Posted}',
          'tagView.details' => TranslationOverrides.string(_root.$meta, 'tagView.details', {}) ?? '{Details}',
          'tagView.filename' => TranslationOverrides.string(_root.$meta, 'tagView.filename', {}) ?? '{Filename}',
          'tagView.url' => TranslationOverrides.string(_root.$meta, 'tagView.url', {}) ?? '{URL}',
          'tagView.extension' => TranslationOverrides.string(_root.$meta, 'tagView.extension', {}) ?? '{Extension}',
          'tagView.resolution' => TranslationOverrides.string(_root.$meta, 'tagView.resolution', {}) ?? '{Resolution}',
          'tagView.size' => TranslationOverrides.string(_root.$meta, 'tagView.size', {}) ?? '{Size}',
          'tagView.md5' => TranslationOverrides.string(_root.$meta, 'tagView.md5', {}) ?? '{MD5}',
          'tagView.rating' => TranslationOverrides.string(_root.$meta, 'tagView.rating', {}) ?? '{Rating}',
          'tagView.score' => TranslationOverrides.string(_root.$meta, 'tagView.score', {}) ?? '{Score}',
          'tagView.searchTags' => TranslationOverrides.string(_root.$meta, 'tagView.searchTags', {}) ?? '{Search tags}',
          'tagView.noTagsFound' => TranslationOverrides.string(_root.$meta, 'tagView.noTagsFound', {}) ?? '{No tags found}',
          'tagView.copy' => TranslationOverrides.string(_root.$meta, 'tagView.copy', {}) ?? '{Copy}',
          'tagView.removeFromSearch' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromSearch', {}) ?? '{Remove from Search}',
          'tagView.addToSearch' => TranslationOverrides.string(_root.$meta, 'tagView.addToSearch', {}) ?? '{Add to Search}',
          'tagView.addedToSearchBar' => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBar', {}) ?? '{Added to search bar:}',
          'tagView.addToSearchExclude' => TranslationOverrides.string(_root.$meta, 'tagView.addToSearchExclude', {}) ?? '{Add to Search (Exclude)}',
          'tagView.addedToSearchBarExclude' =>
            TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBarExclude', {}) ?? '{Added to search bar (Exclude):}',
          'tagView.addToLoved' => TranslationOverrides.string(_root.$meta, 'tagView.addToLoved', {}) ?? '{Add to Loved}',
          'tagView.addToHated' => TranslationOverrides.string(_root.$meta, 'tagView.addToHated', {}) ?? '{Add to Hated}',
          'tagView.removeFromLoved' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromLoved', {}) ?? '{Remove from Loved}',
          'tagView.removeFromHated' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromHated', {}) ?? '{Remove from Hated}',
          'tagView.editTag' => TranslationOverrides.string(_root.$meta, 'tagView.editTag', {}) ?? '{Edit tag}',
          'tagView.copiedSelected' =>
            ({required String type}) =>
                TranslationOverrides.string(_root.$meta, 'tagView.copiedSelected', {'type': type}) ?? '{Copied ${type} to clipboard}',
          'tagView.selectedText' => TranslationOverrides.string(_root.$meta, 'tagView.selectedText', {}) ?? '{selected text}',
          'tagView.source' => TranslationOverrides.string(_root.$meta, 'tagView.source', {}) ?? '{source}',
          'tagView.sourceDialogTitle' => TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogTitle', {}) ?? '{Source}',
          'tagView.sourceDialogText1' =>
            TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogText1', {}) ??
                '{The text in source field can\'t be opened as a link, either because it\'s not a link or there are multiple URLs in a single string.}',
          'tagView.sourceDialogText2' =>
            TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogText2', {}) ??
                '{You can select any text below by long tapping it and then press "Open selected" to try opening it as a link:}',
          'tagView.noTextSelected' => TranslationOverrides.string(_root.$meta, 'tagView.noTextSelected', {}) ?? '{[No text selected]}',
          'tagView.copySelected' =>
            ({required String type}) => TranslationOverrides.string(_root.$meta, 'tagView.copySelected', {'type': type}) ?? '{Copy ${type}}',
          'tagView.selected' => TranslationOverrides.string(_root.$meta, 'tagView.selected', {}) ?? '{selected}',
          'tagView.all' => TranslationOverrides.string(_root.$meta, 'tagView.all', {}) ?? '{all}',
          'tagView.openSelected' =>
            ({required String type}) => TranslationOverrides.string(_root.$meta, 'tagView.openSelected', {'type': type}) ?? '{Open ${type}}',
          'tagView.returnButton' => TranslationOverrides.string(_root.$meta, 'tagView.returnButton', {}) ?? '{Return}',
          'tagView.preview' => TranslationOverrides.string(_root.$meta, 'tagView.preview', {}) ?? '{Preview}',
          'tagView.booru' => TranslationOverrides.string(_root.$meta, 'tagView.booru', {}) ?? '{Booru}',
          'tagView.selectBooruToLoad' => TranslationOverrides.string(_root.$meta, 'tagView.selectBooruToLoad', {}) ?? '{Select a booru to load}',
          'tagView.previewIsLoading' => TranslationOverrides.string(_root.$meta, 'tagView.previewIsLoading', {}) ?? '{Preview is loading...}',
          'tagView.failedToLoadPreview' => TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreview', {}) ?? '{Failed to load preview}',
          'tagView.tapToTryAgain' => TranslationOverrides.string(_root.$meta, 'tagView.tapToTryAgain', {}) ?? '{Tap to try again}',
          'tagView.copiedFileURL' => TranslationOverrides.string(_root.$meta, 'tagView.copiedFileURL', {}) ?? '{Copied file URL to clipboard}',
          'tagView.tagPreviews' => TranslationOverrides.string(_root.$meta, 'tagView.tagPreviews', {}) ?? '{Tag previews}',
          'tagView.currentState' => TranslationOverrides.string(_root.$meta, 'tagView.currentState', {}) ?? '{Current state}',
          'tagView.history' => TranslationOverrides.string(_root.$meta, 'tagView.history', {}) ?? '{History}',
          'tagView.failedToLoadPreviewPage' =>
            TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreviewPage', {}) ?? '{Failed to load preview page}',
          'tagView.tryAgain' => TranslationOverrides.string(_root.$meta, 'tagView.tryAgain', {}) ?? '{Try again}',
          'searchBar.searchForTags' => TranslationOverrides.string(_root.$meta, 'searchBar.searchForTags', {}) ?? '{Search for tags}',
          'searchBar.failedToLoadSuggestions' =>
            ({required String msg}) =>
                TranslationOverrides.string(_root.$meta, 'searchBar.failedToLoadSuggestions', {'msg': msg}) ??
                '{Failed to load suggestions, tap to retry${msg}}',
          'searchBar.noSuggestionsFound' => TranslationOverrides.string(_root.$meta, 'searchBar.noSuggestionsFound', {}) ?? '{No suggestions found}',
          'searchBar.tagSuggestionsNotAvailable' =>
            TranslationOverrides.string(_root.$meta, 'searchBar.tagSuggestionsNotAvailable', {}) ??
                '{Tag suggestions are not available for this booru}',
          'searchBar.copiedTagToClipboard' =>
            ({required String tag}) =>
                TranslationOverrides.string(_root.$meta, 'searchBar.copiedTagToClipboard', {'tag': tag}) ?? '{Copied "${tag}" to clipboard}',
          'searchBar.prefix' => TranslationOverrides.string(_root.$meta, 'searchBar.prefix', {}) ?? '{Prefix}',
          'searchBar.exclude' => TranslationOverrides.string(_root.$meta, 'searchBar.exclude', {}) ?? '{Exclude (—)}',
          'searchBar.booruNumberPrefix' => TranslationOverrides.string(_root.$meta, 'searchBar.booruNumberPrefix', {}) ?? '{Booru (N#)}',
          'searchBar.returnButton' => TranslationOverrides.string(_root.$meta, 'searchBar.returnButton', {}) ?? '{Return}',
          'searchBar.metatags' => TranslationOverrides.string(_root.$meta, 'searchBar.metatags', {}) ?? '{Metatags}',
          'searchBar.freeMetatags' => TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatags', {}) ?? '{Free metatags}',
          'searchBar.freeMetatagsDescription' =>
            TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatagsDescription', {}) ??
                '{Free metatags do not count against the tag search limits}',
          'searchBar.free' => TranslationOverrides.string(_root.$meta, 'searchBar.free', {}) ?? '{Free}',
          'searchBar.single' => TranslationOverrides.string(_root.$meta, 'searchBar.single', {}) ?? '{Single}',
          'searchBar.range' => TranslationOverrides.string(_root.$meta, 'searchBar.range', {}) ?? '{Range}',
          'searchBar.popular' => TranslationOverrides.string(_root.$meta, 'searchBar.popular', {}) ?? '{Popular}',
          'searchBar.favourites' => TranslationOverrides.string(_root.$meta, 'searchBar.favourites', {}) ?? '{Favourties}',
          'searchBar.all' => TranslationOverrides.string(_root.$meta, 'searchBar.all', {}) ?? '{[All]}',
          'searchBar.selectDate' => TranslationOverrides.string(_root.$meta, 'searchBar.selectDate', {}) ?? '{Select date}',
          'searchBar.selectDatesRange' => TranslationOverrides.string(_root.$meta, 'searchBar.selectDatesRange', {}) ?? '{Select dates range}',
          _ => null,
        } ??
        switch (path) {
          'searchBar.lastSearch' =>
            ({required String date}) => TranslationOverrides.string(_root.$meta, 'searchBar.lastSearch', {'date': date}) ?? '{Last search: ${date}}',
          'searchBar.unknownBooruType' => TranslationOverrides.string(_root.$meta, 'searchBar.unknownBooruType', {}) ?? '{Unknown Booru type!}',
          'searchBar.history' => TranslationOverrides.string(_root.$meta, 'searchBar.history', {}) ?? '{History}',
          'searchBar.more' => TranslationOverrides.string(_root.$meta, 'searchBar.more', {}) ?? '{...}',
          'mobileHome.selectBooruForWebview' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.selectBooruForWebview', {}) ?? '{Select booru for webview}',
          'mobileHome.lockApp' => TranslationOverrides.string(_root.$meta, 'mobileHome.lockApp', {}) ?? '{Lock app}',
          'mobileHome.fileAlreadyExists' => TranslationOverrides.string(_root.$meta, 'mobileHome.fileAlreadyExists', {}) ?? '{File already exists}',
          'mobileHome.failedToDownload' => TranslationOverrides.string(_root.$meta, 'mobileHome.failedToDownload', {}) ?? '{Failed to download}',
          'mobileHome.cancelledByUser' => TranslationOverrides.string(_root.$meta, 'mobileHome.cancelledByUser', {}) ?? '{Cancelled by user}',
          'mobileHome.saveAnyway' => TranslationOverrides.string(_root.$meta, 'mobileHome.saveAnyway', {}) ?? '{Save anyway}',
          'mobileHome.skip' => TranslationOverrides.string(_root.$meta, 'mobileHome.skip', {}) ?? '{Skip}',
          'mobileHome.retryAll' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'mobileHome.retryAll', {'count': count}) ?? '{Retry all (${count})}',
          'mobileHome.existingFailedOrCancelledItems' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.existingFailedOrCancelledItems', {}) ?? '{Existing, failed or cancelled items}',
          'mobileHome.clearAllRetryableItems' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.clearAllRetryableItems', {}) ?? '{Clear all retryable items}',
          'desktopHome.snatcher' => TranslationOverrides.string(_root.$meta, 'desktopHome.snatcher', {}) ?? '{Snatcher}',
          'desktopHome.addBoorusInSettings' =>
            TranslationOverrides.string(_root.$meta, 'desktopHome.addBoorusInSettings', {}) ?? '{Add boorus in settings}',
          'desktopHome.settings' => TranslationOverrides.string(_root.$meta, 'desktopHome.settings', {}) ?? '{Settings}',
          'desktopHome.save' => TranslationOverrides.string(_root.$meta, 'desktopHome.save', {}) ?? '{Save}',
          'desktopHome.noItemsSelected' => TranslationOverrides.string(_root.$meta, 'desktopHome.noItemsSelected', {}) ?? '{No items selected}',
          'galleryView.noItems' => TranslationOverrides.string(_root.$meta, 'galleryView.noItems', {}) ?? '{No items}',
          'galleryView.noItemSelected' => TranslationOverrides.string(_root.$meta, 'galleryView.noItemSelected', {}) ?? '{No item selected}',
          'galleryView.close' => TranslationOverrides.string(_root.$meta, 'galleryView.close', {}) ?? '{Close}',
          'mediaPreviews.noBooruConfigsFound' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.noBooruConfigsFound', {}) ?? '{No booru configs found}',
          'mediaPreviews.addNewBooru' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? '{Add new Booru}',
          'mediaPreviews.help' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.help', {}) ?? '{Help}',
          'mediaPreviews.settings' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.settings', {}) ?? '{Settings}',
          'mediaPreviews.restoringPreviousSession' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoringPreviousSession', {}) ?? '{Restoring previous session...}',
          'mediaPreviews.copiedFileURL' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.copiedFileURL', {}) ?? '{Copied file URL to clipboard!}',
          'viewer.tutorial.images' => TranslationOverrides.string(_root.$meta, 'viewer.tutorial.images', {}) ?? '{Images}',
          'viewer.tutorial.tapLongTapToggleImmersive' =>
            TranslationOverrides.string(_root.$meta, 'viewer.tutorial.tapLongTapToggleImmersive', {}) ?? '{Tap/Long tap: toggle immersive mode}',
          'viewer.tutorial.doubleTapFitScreen' =>
            TranslationOverrides.string(_root.$meta, 'viewer.tutorial.doubleTapFitScreen', {}) ??
                '{Double tap: fit to screen / original size / reset zoom}',
          'viewer.appBar.cantStartSlideshow' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.cantStartSlideshow', {}) ?? '{Can\'t start Slideshow}',
          'viewer.appBar.reachedLastLoadedItem' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.reachedLastLoadedItem', {}) ?? '{Reached the Last loaded Item}',
          'viewer.appBar.pause' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.pause', {}) ?? '{Pause}',
          'viewer.appBar.start' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.start', {}) ?? '{Start}',
          'viewer.appBar.unfavourite' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.unfavourite', {}) ?? '{Unfavourite}',
          'viewer.appBar.deselect' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.deselect', {}) ?? '{Deselect}',
          'viewer.appBar.reloadWithScaling' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.reloadWithScaling', {}) ?? '{Reload with scaling}',
          'viewer.appBar.loadSampleQuality' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadSampleQuality', {}) ?? '{Load sample quality}',
          'viewer.appBar.loadHighQuality' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadHighQuality', {}) ?? '{Load high quality}',
          'viewer.appBar.dropSnatchedStatus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.dropSnatchedStatus', {}) ?? '{Drop snatched status}',
          'viewer.appBar.setSnatchedStatus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.setSnatchedStatus', {}) ?? '{Set snatched status}',
          'viewer.appBar.snatch' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.snatch', {}) ?? '{Snatch}',
          'viewer.appBar.forced' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.forced', {}) ?? '{(forced)}',
          'viewer.appBar.hydrusShare' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusShare', {}) ?? '{Hydrus share}',
          'viewer.appBar.whichUrlToShareToHydrus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.whichUrlToShareToHydrus', {}) ?? '{Which URL you want to share to Hydrus?}',
          'viewer.appBar.postURL' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURL', {}) ?? '{Post URL}',
          'viewer.appBar.fileURL' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURL', {}) ?? '{File URL}',
          'viewer.appBar.hydrusNotConfigured' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusNotConfigured', {}) ?? '{Hydrus is not configured!}',
          'viewer.appBar.shareFile' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareFile', {}) ?? '{Share file}',
          'viewer.appBar.alreadyDownloadingThisFile' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingThisFile', {}) ??
                '{Already downloading this file for sharing, do you want to abort?}',
          'viewer.appBar.alreadyDownloadingFile' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingFile', {}) ??
                '{Already downloading file for sharing, do you want to abort current file and share a new file?}',
          'viewer.appBar.current' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.current', {}) ?? '{Current:}',
          'viewer.appBar.kNew' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.kNew', {}) ?? '{New:}',
          'viewer.appBar.shareNew' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareNew', {}) ?? '{Share new}',
          'viewer.appBar.abort' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.abort', {}) ?? '{Abort}',
          'viewer.appBar.error' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.error', {}) ?? '{Error!}',
          'viewer.appBar.savingFileError' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.savingFileError', {}) ??
                '{Something went wrong when saving the File before Sharing}',
          'viewer.appBar.whatToShare' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.whatToShare', {}) ?? '{What you want to Share?}',
          'viewer.appBar.postURLWithTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURLWithTags', {}) ?? '{Post URL with tags}',
          'viewer.appBar.fileURLWithTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURLWithTags', {}) ?? '{File URL with tags}',
          'viewer.appBar.file' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.file', {}) ?? '{File}',
          'viewer.appBar.fileWithTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileWithTags', {}) ?? '{File with tags}',
          'viewer.appBar.hydrus' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrus', {}) ?? '{Hydrus}',
          'viewer.appBar.selectTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.selectTags', {}) ?? '{Select tags}',
          'viewer.notes.note' => TranslationOverrides.string(_root.$meta, 'viewer.notes.note', {}) ?? '{Note}',
          'viewer.notes.notes' => TranslationOverrides.string(_root.$meta, 'viewer.notes.notes', {}) ?? '{Notes}',
          'viewer.notes.closeDialog' => TranslationOverrides.string(_root.$meta, 'viewer.notes.closeDialog', {}) ?? '{Close}',
          'viewer.notes.coordinates' =>
            ({required int posX, required int posY}) =>
                TranslationOverrides.string(_root.$meta, 'viewer.notes.coordinates', {'posX': posX, 'posY': posY}) ?? '{X:${posX}, Y:${posY}}',
          'common.selectABooru' => TranslationOverrides.string(_root.$meta, 'common.selectABooru', {}) ?? '{Select a booru}',
          'common.booruItemCopiedToClipboard' =>
            TranslationOverrides.string(_root.$meta, 'common.booruItemCopiedToClipboard', {}) ?? '{Booru item copied to clipboard}',
          'gallery.snatchQuestion' => TranslationOverrides.string(_root.$meta, 'gallery.snatchQuestion', {}) ?? '{Snatch?}',
          'gallery.noPostUrl' => TranslationOverrides.string(_root.$meta, 'gallery.noPostUrl', {}) ?? '{No post URL!}',
          'gallery.loadingFile' => TranslationOverrides.string(_root.$meta, 'gallery.loadingFile', {}) ?? '{Loading file...}',
          'gallery.loadingFileMessage' =>
            TranslationOverrides.string(_root.$meta, 'gallery.loadingFileMessage', {}) ?? '{This can take some time, please wait...}',
          'gallery.sources' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'gallery.sources', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
                  count,
                  one: '{Source}',
                  other: '{Sources}',
                ),
          'media.loading.rendering' => TranslationOverrides.string(_root.$meta, 'media.loading.rendering', {}) ?? '{Rendering...}',
          'media.loading.loadingAndRenderingFromCache' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.loadingAndRenderingFromCache', {}) ?? '{Loading and rendering from cache...}',
          'media.loading.loadingFromCache' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.loadingFromCache', {}) ?? '{Loading from cache...}',
          'media.loading.buffering' => TranslationOverrides.string(_root.$meta, 'media.loading.buffering', {}) ?? '{Buffering...}',
          'media.loading.loading' => TranslationOverrides.string(_root.$meta, 'media.loading.loading', {}) ?? '{Loading...}',
          'media.loading.loadAnyway' => TranslationOverrides.string(_root.$meta, 'media.loading.loadAnyway', {}) ?? '{Load anyway}',
          'media.loading.restartLoading' => TranslationOverrides.string(_root.$meta, 'media.loading.restartLoading', {}) ?? '{Restart loading}',
          'media.loading.stopLoading' => TranslationOverrides.string(_root.$meta, 'media.loading.stopLoading', {}) ?? '{Stop loading}',
          'media.loading.startedSecondsAgo' =>
            ({required int seconds}) =>
                TranslationOverrides.string(_root.$meta, 'media.loading.startedSecondsAgo', {'seconds': seconds}) ?? '{Started ${seconds}s ago}',
          'media.video.videosDisabledOrNotSupported' =>
            TranslationOverrides.string(_root.$meta, 'media.video.videosDisabledOrNotSupported', {}) ?? '{Videos disabled or not supported}',
          'media.video.openVideoInExternalPlayer' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openVideoInExternalPlayer', {}) ?? '{Open video in external player}',
          'media.video.openVideoInBrowser' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openVideoInBrowser', {}) ?? '{Open video in browser}',
          'media.video.failedToLoadItemData' =>
            TranslationOverrides.string(_root.$meta, 'media.video.failedToLoadItemData', {}) ?? '{Failed to load item data}',
          'media.video.loadingItemData' => TranslationOverrides.string(_root.$meta, 'media.video.loadingItemData', {}) ?? '{Loading item data...}',
          'media.video.retry' => TranslationOverrides.string(_root.$meta, 'media.video.retry', {}) ?? '{Retry}',
          'media.video.openFileInBrowser' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openFileInBrowser', {}) ?? '{Open file in browser}',
          'media.video.openPostInBrowser' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openPostInBrowser', {}) ?? '{Open post in browser}',
          'media.video.currentlyChecking' => TranslationOverrides.string(_root.$meta, 'media.video.currentlyChecking', {}) ?? '{Currently checking:}',
          'media.video.unknownFileFormat' =>
            ({required String fileExt}) =>
                TranslationOverrides.string(_root.$meta, 'media.video.unknownFileFormat', {'fileExt': fileExt}) ??
                '{Unknown file format (.${fileExt}), tap here to open in browser}',
          'imageStats.live' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.live', {'count': count}) ?? '{Live: ${count}}',
          'imageStats.pending' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.pending', {'count': count}) ?? '{Pending: ${count}}',
          'imageStats.total' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.total', {'count': count}) ?? '{Total: ${count}}',
          'imageStats.size' =>
            ({required String size}) => TranslationOverrides.string(_root.$meta, 'imageStats.size', {'size': size}) ?? '{Size: ${size}}',
          'imageStats.max' => ({required String max}) => TranslationOverrides.string(_root.$meta, 'imageStats.max', {'max': max}) ?? '{Max: ${max}}',
          'preview.searchForTags' => TranslationOverrides.string(_root.$meta, 'preview.searchForTags', {}) ?? '{Search for tags}',
          'preview.booruNumber' =>
            ({required int number}) => TranslationOverrides.string(_root.$meta, 'preview.booruNumber', {'number': number}) ?? '{Booru (${number}#)}',
          'preview.error.noResults' => TranslationOverrides.string(_root.$meta, 'preview.error.noResults', {}) ?? '{No results}',
          'preview.error.noResultsSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.noResultsSubtitle', {}) ??
                '{Try changing your search query or tap here to retry}',
          'preview.error.reachedEnd' => TranslationOverrides.string(_root.$meta, 'preview.error.reachedEnd', {}) ?? '{You reached the end}',
          'preview.error.reachedEndSubtitle' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.reachedEndSubtitle', {'pageNum': pageNum}) ??
                '{Loaded ${pageNum} pages\nTap here to reload last page}',
          'preview.error.loadingPage' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.loadingPage', {'pageNum': pageNum}) ?? '{Loading page #${pageNum}...}',
          'preview.error.startedAgo' =>
            ({required num seconds}) =>
                TranslationOverrides.plural(_root.$meta, 'preview.error.startedAgo', {'seconds': seconds}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('dev'))(
                  seconds,
                  one: '{Started 1 second ago}',
                  other: '{Started ${seconds} seconds ago}',
                ),
          'preview.error.tapToRetryIfStuck' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetryIfStuck', {}) ??
                '{Tap here to retry if search is taking too long or seems stuck}',
          'preview.error.errorLoadingPage' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.errorLoadingPage', {'pageNum': pageNum}) ??
                '{Error when loading page #${pageNum}}',
          'preview.error.errorWithMessage' => TranslationOverrides.string(_root.$meta, 'preview.error.errorWithMessage', {}) ?? '{Tap here to retry}',
          'preview.error.errorNoResultsLoaded' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.errorNoResultsLoaded', {}) ?? '{Error, no results loaded}',
          'preview.error.tapToRetry' => TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetry', {}) ?? '{Tap here to retry}',
          _ => null,
        };
  }
}
