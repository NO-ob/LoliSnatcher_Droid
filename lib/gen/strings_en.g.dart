///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element

class Translations implements BaseTranslations<AppLocale, Translations> {
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

  /// en: 'Warning'
  String get warning => TranslationOverrides.string(_root.$meta, 'warning', {}) ?? 'Warning';

  /// en: 'Warning!'
  String get warningExclamation => TranslationOverrides.string(_root.$meta, 'warningExclamation', {}) ?? 'Warning!';

  /// en: 'Info'
  String get info => TranslationOverrides.string(_root.$meta, 'info', {}) ?? 'Info';

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

  /// en: 'Copy'
  String get copy => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Copy';

  /// en: 'Copied!'
  String get copied => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Copied!';

  /// en: 'Paste'
  String get paste => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Paste';

  /// en: 'Copy error'
  String get copyErrorText => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Copy error';

  /// en: 'Booru'
  String get booru => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru';

  /// en: 'Go to settings'
  String get goToSettings => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'Go to settings';

  /// en: 'Are you sure?'
  String get areYouSure => TranslationOverrides.string(_root.$meta, 'areYouSure', {}) ?? 'Are you sure?';

  /// en: 'This may take some time...'
  String get thisMayTakeSomeTime => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'This may take some time...';

  /// en: 'Do you want to exit the app?'
  String get doYouWantToExitApp => TranslationOverrides.string(_root.$meta, 'doYouWantToExitApp', {}) ?? 'Do you want to exit the app?';

  /// en: 'Close the app'
  String get closeTheApp => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Close the app';

  /// en: 'Invalid URL!'
  String get invalidUrl => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'Invalid URL!';

  /// en: 'Clipboard is empty!'
  String get clipboardIsEmpty => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'Clipboard is empty!';

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

  /// en: 'Select all'
  String get selectAll => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Select all';

  late final TranslationsValidationErrorsEn validationErrors = TranslationsValidationErrorsEn.internal(_root);
  late final TranslationsInitEn init = TranslationsInitEn.internal(_root);
  late final TranslationsSnatcherEn snatcher = TranslationsSnatcherEn.internal(_root);
  late final TranslationsMultibooruEn multibooru = TranslationsMultibooruEn.internal(_root);
  late final TranslationsSettingsEn settings = TranslationsSettingsEn.internal(_root);
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

  /// en: 'Please enter a value bigger than {min}'
  String tooSmall({required Object min}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Please enter a value bigger than ${min}';

  /// en: 'Please enter a value smaller than {max}'
  String tooBig({required Object max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Please enter a value smaller than ${max}';
}

// Path: init
class TranslationsInitEn {
  TranslationsInitEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Initialization error!'
  String get initError => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Initialization error!';

  /// en: 'Post initialization error!'
  String get postInitError => TranslationOverrides.string(_root.$meta, 'init.postInitError', {}) ?? 'Post initialization error!';

  /// en: 'Setting up proxy...'
  String get settingUpProxy => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Setting up proxy...';

  /// en: 'Loading Database...'
  String get loadingDatabase => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Loading Database...';

  /// en: 'Loading Boorus...'
  String get loadingBoorus => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Loading Boorus...';

  /// en: 'Loading Tags...'
  String get loadingTags => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Loading Tags...';

  /// en: 'Restoring Tabs...'
  String get restoringTabs => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Restoring Tabs...';
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

  /// en: 'Multibooru mode requires at least 2 boorus to be configured'
  String get multibooruRequiresAtLeastTwoBoorus =>
      TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ??
      'Multibooru mode requires at least 2 boorus to be configured';

  /// en: 'Select secondary boorus:'
  String get selectSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Select secondary boorus:';
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
  late final TranslationsSettingsCacheEn cache = TranslationsSettingsCacheEn.internal(_root);

  /// en: 'Snatching & Cache'
  String get downloadsAndCache => TranslationOverrides.string(_root.$meta, 'settings.downloadsAndCache', {}) ?? 'Snatching & Cache';

  late final TranslationsSettingsTagFiltersEn tagFilters = TranslationsSettingsTagFiltersEn.internal(_root);
  late final TranslationsSettingsDatabaseEn database = TranslationsSettingsDatabaseEn.internal(_root);
  late final TranslationsSettingsBackupAndRestoreEn backupAndRestore = TranslationsSettingsBackupAndRestoreEn.internal(_root);
  late final TranslationsSettingsNetworkEn network = TranslationsSettingsNetworkEn.internal(_root);
  late final TranslationsSettingsPrivacyEn privacy = TranslationsSettingsPrivacyEn.internal(_root);
  late final TranslationsSettingsSyncEn sync = TranslationsSettingsSyncEn.internal(_root);
  late final TranslationsSettingsAboutEn about = TranslationsSettingsAboutEn.internal(_root);
  late final TranslationsSettingsCheckForUpdatesEn checkForUpdates = TranslationsSettingsCheckForUpdatesEn.internal(_root);
  late final TranslationsSettingsHelpEn help = TranslationsSettingsHelpEn.internal(_root);
  late final TranslationsSettingsDebugEn debug = TranslationsSettingsDebugEn.internal(_root);
  late final TranslationsSettingsLoggingEn logging = TranslationsSettingsLoggingEn.internal(_root);
  late final TranslationsSettingsWebviewEn webview = TranslationsSettingsWebviewEn.internal(_root);

  /// en: 'Version'
  String get version => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? 'Version';
}

// Path: settings.language
class TranslationsSettingsLanguageEn {
  TranslationsSettingsLanguageEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Language'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? 'Language';

  /// en: 'System'
  String get systemLanguageOption => TranslationOverrides.string(_root.$meta, 'settings.language.systemLanguageOption', {}) ?? 'System';
}

// Path: settings.booru
class TranslationsSettingsBooruEn {
  TranslationsSettingsBooruEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Boorus & Search'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Boorus & Search';

  /// en: 'Default tags'
  String get defaultTags => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? 'Default tags';

  /// en: 'Items fetched per page'
  String get itemsPerPage => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'Items fetched per page';

  /// en: 'Some Boorus may ignore this setting'
  String get itemsPerPageTip =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'Some Boorus may ignore this setting';

  /// en: 'Add Booru config'
  String get addBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Add Booru config';

  /// en: 'Share Booru config'
  String get shareBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? 'Share Booru config';

  /// en: 'Booru config of {booruName} will be converted to a link which then can be shared to other apps Should login/apikey data be included?'
  String shareBooruDialogMsgMobile({required Object booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
      'Booru config of ${booruName} will be converted to a link which then can be shared to other apps\n\nShould login/apikey data be included?';

  /// en: 'Booru config of {booruName} will be converted to a link which will be copied to clipboard Should login/apikey data be included?'
  String shareBooruDialogMsgDesktop({required Object booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
      'Booru config of ${booruName} will be converted to a link which will be copied to clipboard\n\nShould login/apikey data be included?';

  /// en: 'Booru sharing'
  String get booruSharing => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? 'Booru sharing';

  /// en: 'How to automatically open Booru config links in the app on Android 12 and higher: 1) Tap button below to open system app link defaults settings 2) Tap on "Add link" and select all available options'
  String get booruSharingMsgAndroid =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ??
      'How to automatically open Booru config links in the app on Android 12 and higher:\n1) Tap button below to open system app link defaults settings\n2) Tap on "Add link" and select all available options';

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

  /// en: 'Booru config deleted!'
  String get booruDeleted => TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? 'Booru config deleted!';

  /// en: 'The Booru selected here will be set as default after saving. The default Booru will be first to appear in the dropdown boxes'
  String get booruDropdownInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ??
      'The Booru selected here will be set as default after saving.\n\nThe default Booru will be first to appear in the dropdown boxes';

  /// en: 'Change default Booru?'
  String get changeDefaultBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? 'Change default Booru?';

  /// en: 'Change to: '
  String get changeTo => TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? 'Change to: ';

  /// en: 'Tap [No] to keep current: '
  String get keepCurrentBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? 'Tap [No] to keep current: ';

  /// en: 'Tap [Yes] to change to: '
  String get changeToNewBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? 'Tap [Yes] to change to: ';

  /// en: 'Booru config link copied to clipboard!'
  String get booruConfigLinkCopied =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ?? 'Booru config link copied to clipboard!';

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

  /// en: 'Test Booru'
  String get testBooru => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooru', {}) ?? 'Test Booru';

  /// en: 'Tap the Save button to save this config'
  String get testBooruSuccessMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruSuccessMsg', {}) ?? 'Tap the Save button to save this config';

  /// en: 'Booru test failed'
  String get testBooruFailedTitle => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'Booru test failed';

  /// en: 'Config parameters may be incorrect, booru doesn't allow api access, request didn't return any data or there was a network error.'
  String get testBooruFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ??
      'Config parameters may be incorrect, booru doesn\'t allow api access, request didn\'t return any data or there was a network error.';

  /// en: 'Save Booru'
  String get saveBooru => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Save Booru';

  /// en: 'Run test first'
  String get runTestFirst => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runTestFirst', {}) ?? 'Run test first';

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

  /// en: 'Booru config saved!'
  String get booruConfigSaved => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? 'Booru config saved!';

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

  /// en: 'Booru Type is {booruType}'
  String booruTypeIs({required Object booruType}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruTypeIs', {'booruType': booruType}) ?? 'Booru Type is ${booruType}';

  /// en: 'Favicon URL'
  String get booruFavicon => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? 'Favicon URL';

  /// en: '(Autofills if blank)'
  String get booruFaviconPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '(Autofills if blank)';

  /// en: '{userIdTitle} and {apiKeyTitle} may be needed with some boorus but in most cases aren't necessary.'
  String booruApiCredsInfo({required Object userIdTitle, required Object apiKeyTitle}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruApiCredsInfo', {'userIdTitle': userIdTitle, 'apiKeyTitle': apiKeyTitle}) ??
      '${userIdTitle} and ${apiKeyTitle} may be needed with some boorus but in most cases aren\'t necessary.';

  /// en: '(Can be blank)'
  String get canBeBlankPlaceholder => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.canBeBlankPlaceholder', {}) ?? '(Can be blank)';

  /// en: 'Default tags'
  String get booruDefTags => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? 'Default tags';
}

// Path: settings.interface
class TranslationsSettingsInterfaceEn {
  TranslationsSettingsInterfaceEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Interface'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? 'Interface';
}

// Path: settings.theme
class TranslationsSettingsThemeEn {
  TranslationsSettingsThemeEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Themes'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? 'Themes';
}

// Path: settings.viewer
class TranslationsSettingsViewerEn {
  TranslationsSettingsViewerEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Viewer'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? 'Viewer';
}

// Path: settings.video
class TranslationsSettingsVideoEn {
  TranslationsSettingsVideoEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Video'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? 'Video';
}

// Path: settings.downloads
class TranslationsSettingsDownloadsEn {
  TranslationsSettingsDownloadsEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Snatching'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.downloads.title', {}) ?? 'Snatching';

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

// Path: settings.cache
class TranslationsSettingsCacheEn {
  TranslationsSettingsCacheEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Caching'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? 'Caching';
}

// Path: settings.tagFilters
class TranslationsSettingsTagFiltersEn {
  TranslationsSettingsTagFiltersEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Tag filters'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.tagFilters.title', {}) ?? 'Tag filters';
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

  /// en: 'The file {fileName} already exists. Do you want to overwrite it? If you choose no, the backup will be cancelled.'
  String duplicateFileDetectedMsg({required Object fileName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
      'The file ${fileName} already exists. Do you want to overwrite it? If you choose no, the backup will be cancelled.';

  /// en: 'This feature is only available on Android, on Desktop builds you can just copy/paste files from/to app's data folder, respective to your system'
  String get androidOnlyFeatureMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ??
      'This feature is only available on Android, on Desktop builds you can just copy/paste files from/to app\'s data folder, respective to your system';

  /// en: 'Select backup directory'
  String get selectBackupDir =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? 'Select backup directory';

  /// en: 'Failed to get backup path!'
  String get failedToGetBackupPath =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ?? 'Failed to get backup path!';

  /// en: 'Backup path is: {backupPath}'
  String backupPathMsg({required Object backupPath}) =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ??
      'Backup path is: ${backupPath}';

  /// en: 'No backup directory selected'
  String get noBackupDirSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ?? 'No backup directory selected';

  /// en: 'Restore will work only if the files are placed in the root of the directory.'
  String get restoreInfoMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ??
      'Restore will work only if the files are placed in the root of the directory.';

  /// en: 'Backup Settings'
  String get backupSettings => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? 'Backup Settings';

  /// en: 'Restore Settings'
  String get restoreSettings => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? 'Restore Settings';

  /// en: 'Settings backed up to settings.json'
  String get settingsBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ?? 'Settings backed up to settings.json';

  /// en: 'Settings restored from backup!'
  String get settingsRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? 'Settings restored from backup!';

  /// en: 'Failed to backup settings!'
  String get backupSettingsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ?? 'Failed to backup settings!';

  /// en: 'Failed to restore settings!'
  String get restoreSettingsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ?? 'Failed to restore settings!';

  /// en: 'Backup Boorus'
  String get backupBoorus => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ?? 'Backup Boorus';

  /// en: 'Restore Boorus'
  String get restoreBoorus => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? 'Restore Boorus';

  /// en: 'Boorus backed up to boorus.json'
  String get boorusBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ?? 'Boorus backed up to boorus.json';

  /// en: 'Boorus restored from backup!'
  String get boorusRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ?? 'Boorus restored from backup!';

  /// en: 'Failed to backup boorus!'
  String get backupBoorusError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ?? 'Failed to backup boorus!';

  /// en: 'Failed to restore boorus!'
  String get restoreBoorusError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ?? 'Failed to restore boorus!';

  /// en: 'Backup Database'
  String get backupDatabase => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? 'Backup Database';

  /// en: 'Restore Database'
  String get restoreDatabase => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? 'Restore Database';

  /// en: 'May take a while depending on the size of the database, will restart the app on success'
  String get restoreDatabaseInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ??
      'May take a while depending on the size of the database, will restart the app on success';

  /// en: 'Database backed up to database.json'
  String get databaseBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ?? 'Database backed up to database.json';

  /// en: 'Database restored from backup! App will restart in a few seconds!'
  String get databaseRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ??
      'Database restored from backup! App will restart in a few seconds!';

  /// en: 'Failed to backup database!'
  String get backupDatabaseError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ?? 'Failed to backup database!';

  /// en: 'Failed to restore database!'
  String get restoreDatabaseError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ?? 'Failed to restore database!';

  /// en: 'Database file not found or cannot be read!'
  String get databaseFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ?? 'Database file not found or cannot be read!';

  /// en: 'Backup Tags'
  String get backupTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? 'Backup Tags';

  /// en: 'Restore Tags'
  String get restoreTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? 'Restore Tags';

  /// en: 'May take a while if you have a lot of tags. If you did a database restore, you don't need to do this because it's already included in the database'
  String get restoreTagsInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ??
      'May take a while if you have a lot of tags. If you did a database restore, you don\'t need to do this because it\'s already included in the database';

  /// en: 'Tags backed up to tags.json'
  String get tagsBackedUp => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? 'Tags backed up to tags.json';

  /// en: 'Tags restored from backup!'
  String get tagsRestored => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? 'Tags restored from backup!';

  /// en: 'Failed to backup tags!'
  String get backupTagsError => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? 'Failed to backup tags!';

  /// en: 'Failed to restore tags!'
  String get restoreTagsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? 'Failed to restore tags!';

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

  /// en: 'Backup cancelled!'
  String get backupCancelled => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? 'Backup cancelled!';
}

// Path: settings.network
class TranslationsSettingsNetworkEn {
  TranslationsSettingsNetworkEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Network'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? 'Network';
}

// Path: settings.privacy
class TranslationsSettingsPrivacyEn {
  TranslationsSettingsPrivacyEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Privacy'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? 'Privacy';
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

  /// en: 'Email copied to clipboard!'
  String get emailCopied => TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? 'Email copied to clipboard!';

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

  /// en: 'Update changelog'
  String get updateChangelog => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? 'Update changelog';

  /// en: 'Update check error!'
  String get updateCheckError => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? 'Update check error!';

  /// en: 'You have the latest version!'
  String get youHaveLatestVersion =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? 'You have the latest version!';

  /// en: 'View latest changelog'
  String get viewLatestChangelog =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ?? 'View latest changelog';

  /// en: 'Current version'
  String get currentVersion => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? 'Current version';

  /// en: 'Changelog'
  String get changelog => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? 'Changelog';

  /// en: 'Visit Play Store'
  String get visitPlayStore => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? 'Visit Play Store';

  /// en: 'Visit Releases'
  String get visitReleases => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? 'Visit Releases';
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

  /// en: 'Open network inspector'
  String get openAlice => TranslationOverrides.string(_root.$meta, 'settings.debug.openAlice', {}) ?? 'Open network inspector';

  /// en: 'Open logger'
  String get openLogger => TranslationOverrides.string(_root.$meta, 'settings.debug.openLogger', {}) ?? 'Open logger';
}

// Path: settings.logging
class TranslationsSettingsLoggingEn {
  TranslationsSettingsLoggingEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Logging'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.logging.title', {}) ?? 'Logging';

  /// en: 'Logging is enabled'
  String get enabledMsg => TranslationOverrides.string(_root.$meta, 'settings.logging.enabledMsg', {}) ?? 'Logging is enabled';

  /// en: 'Enabled log types'
  String get enabledLogTypes => TranslationOverrides.string(_root.$meta, 'settings.logging.enabledLogTypes', {}) ?? 'Enabled log types';

  /// en: 'You can disable logging in the debug settings'
  String get disableTip =>
      TranslationOverrides.string(_root.$meta, 'settings.logging.disableTip', {}) ?? 'You can disable logging in the debug settings';
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

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'locale':
        return TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'en';
      case 'localeName':
        return TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'English';
      case 'appName':
        return TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher';
      case 'error':
        return TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Error';
      case 'errorExclamation':
        return TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'Error!';
      case 'warning':
        return TranslationOverrides.string(_root.$meta, 'warning', {}) ?? 'Warning';
      case 'warningExclamation':
        return TranslationOverrides.string(_root.$meta, 'warningExclamation', {}) ?? 'Warning!';
      case 'info':
        return TranslationOverrides.string(_root.$meta, 'info', {}) ?? 'Info';
      case 'success':
        return TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Success';
      case 'successExclamation':
        return TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? 'Success!';
      case 'cancel':
        return TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Cancel';
      case 'later':
        return TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Later';
      case 'close':
        return TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Close';
      case 'ok':
        return TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'OK';
      case 'yes':
        return TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Yes';
      case 'no':
        return TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'No';
      case 'pleaseWait':
        return TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Please wait...';
      case 'show':
        return TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Show';
      case 'hide':
        return TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Hide';
      case 'enable':
        return TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'Enable';
      case 'disable':
        return TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Disable';
      case 'add':
        return TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Add';
      case 'edit':
        return TranslationOverrides.string(_root.$meta, 'edit', {}) ?? 'Edit';
      case 'remove':
        return TranslationOverrides.string(_root.$meta, 'remove', {}) ?? 'Remove';
      case 'save':
        return TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Save';
      case 'delete':
        return TranslationOverrides.string(_root.$meta, 'delete', {}) ?? 'Delete';
      case 'copy':
        return TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Copy';
      case 'copied':
        return TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Copied!';
      case 'paste':
        return TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Paste';
      case 'copyErrorText':
        return TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Copy error';
      case 'booru':
        return TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru';
      case 'goToSettings':
        return TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'Go to settings';
      case 'areYouSure':
        return TranslationOverrides.string(_root.$meta, 'areYouSure', {}) ?? 'Are you sure?';
      case 'thisMayTakeSomeTime':
        return TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'This may take some time...';
      case 'doYouWantToExitApp':
        return TranslationOverrides.string(_root.$meta, 'doYouWantToExitApp', {}) ?? 'Do you want to exit the app?';
      case 'closeTheApp':
        return TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Close the app';
      case 'invalidUrl':
        return TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'Invalid URL!';
      case 'clipboardIsEmpty':
        return TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'Clipboard is empty!';
      case 'apiKey':
        return TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'API Key';
      case 'userId':
        return TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'User ID';
      case 'login':
        return TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Login';
      case 'password':
        return TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Password';
      case 'pause':
        return TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Pause';
      case 'resume':
        return TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Resume';
      case 'discord':
        return TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord';
      case 'visitOurDiscord':
        return TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Visit our Discord server';
      case 'item':
        return TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Item';
      case 'selectAll':
        return TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Select all';
      case 'validationErrors.required':
        return TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Please enter a value';
      case 'validationErrors.invalid':
        return TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Please enter a valid value';
      case 'validationErrors.tooSmall':
        return ({required Object min}) =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Please enter a value bigger than ${min}';
      case 'validationErrors.tooBig':
        return ({required Object max}) =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Please enter a value smaller than ${max}';
      case 'init.initError':
        return TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Initialization error!';
      case 'init.postInitError':
        return TranslationOverrides.string(_root.$meta, 'init.postInitError', {}) ?? 'Post initialization error!';
      case 'init.settingUpProxy':
        return TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Setting up proxy...';
      case 'init.loadingDatabase':
        return TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Loading Database...';
      case 'init.loadingBoorus':
        return TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Loading Boorus...';
      case 'init.loadingTags':
        return TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Loading Tags...';
      case 'init.restoringTabs':
        return TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Restoring Tabs...';
      case 'snatcher.title':
        return TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Snatcher';
      case 'snatcher.snatchingHistory':
        return TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'Snatching history';
      case 'multibooru.title':
        return TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? 'Multibooru';
      case 'multibooru.multibooruMode':
        return TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Multibooru mode';
      case 'multibooru.multibooruRequiresAtLeastTwoBoorus':
        return TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ??
            'Multibooru mode requires at least 2 boorus to be configured';
      case 'multibooru.selectSecondaryBoorus':
        return TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Select secondary boorus:';
      case 'settings.title':
        return TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Settings';
      case 'settings.language.title':
        return TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? 'Language';
      case 'settings.language.systemLanguageOption':
        return TranslationOverrides.string(_root.$meta, 'settings.language.systemLanguageOption', {}) ?? 'System';
      case 'settings.booru.title':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Boorus & Search';
      case 'settings.booru.defaultTags':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? 'Default tags';
      case 'settings.booru.itemsPerPage':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'Items fetched per page';
      case 'settings.booru.itemsPerPageTip':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'Some Boorus may ignore this setting';
      case 'settings.booru.addBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Add Booru config';
      case 'settings.booru.shareBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? 'Share Booru config';
      case 'settings.booru.shareBooruDialogMsgMobile':
        return ({required Object booruName}) =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
            'Booru config of ${booruName} will be converted to a link which then can be shared to other apps\n\nShould login/apikey data be included?';
      case 'settings.booru.shareBooruDialogMsgDesktop':
        return ({required Object booruName}) =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
            'Booru config of ${booruName} will be converted to a link which will be copied to clipboard\n\nShould login/apikey data be included?';
      case 'settings.booru.booruSharing':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? 'Booru sharing';
      case 'settings.booru.booruSharingMsgAndroid':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ??
            'How to automatically open Booru config links in the app on Android 12 and higher:\n1) Tap button below to open system app link defaults settings\n2) Tap on "Add link" and select all available options';
      case 'settings.booru.addedBoorus':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? 'Added Boorus';
      case 'settings.booru.editBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? 'Edit Booru config';
      case 'settings.booru.importBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? 'Import Booru config from clipboard';
      case 'settings.booru.onlyLSURLsSupported':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ?? 'Only loli.snatcher URLs are supported!';
      case 'settings.booru.deleteBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? 'Delete Booru config';
      case 'settings.booru.deleteBooruError':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ??
            'Something went wrong during deletion of a Booru config!';
      case 'settings.booru.booruDeleted':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? 'Booru config deleted!';
      case 'settings.booru.booruDropdownInfo':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ??
            'The Booru selected here will be set as default after saving.\n\nThe default Booru will be first to appear in the dropdown boxes';
      case 'settings.booru.changeDefaultBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? 'Change default Booru?';
      case 'settings.booru.changeTo':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? 'Change to: ';
      case 'settings.booru.keepCurrentBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? 'Tap [No] to keep current: ';
      case 'settings.booru.changeToNewBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? 'Tap [Yes] to change to: ';
      case 'settings.booru.booruConfigLinkCopied':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ?? 'Booru config link copied to clipboard!';
      case 'settings.booru.noBooruSelected':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.noBooruSelected', {}) ?? 'No Booru selected!';
      case 'settings.booru.cantDeleteThisBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? 'Can\'t delete this Booru!';
      case 'settings.booru.removeRelatedTabsFirst':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.removeRelatedTabsFirst', {}) ?? 'Remove related tabs first';
      case 'settings.booruEditor.title':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? 'Booru Editor';
      case 'settings.booruEditor.testBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooru', {}) ?? 'Test Booru';
      case 'settings.booruEditor.testBooruSuccessMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruSuccessMsg', {}) ?? 'Tap the Save button to save this config';
      case 'settings.booruEditor.testBooruFailedTitle':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'Booru test failed';
      case 'settings.booruEditor.testBooruFailedMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ??
            'Config parameters may be incorrect, booru doesn\'t allow api access, request didn\'t return any data or there was a network error.';
      case 'settings.booruEditor.saveBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Save Booru';
      case 'settings.booruEditor.runTestFirst':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runTestFirst', {}) ?? 'Run test first';
      case 'settings.booruEditor.booruConfigExistsError':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? 'This Booru config already exists';
      case 'settings.booruEditor.booruSameNameExistsError':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ??
            'Booru config with same name already exists';
      case 'settings.booruEditor.booruSameUrlExistsError':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ??
            'Booru config with same URL already exists';
      case 'settings.booruEditor.thisBooruConfigWontBeAdded':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ?? 'This booru config won\'t be added';
      case 'settings.booruEditor.booruConfigSaved':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? 'Booru config saved!';
      case 'settings.booruEditor.existingTabsNeedReload':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ??
            'Existing tabs with this Booru need to be reloaded in order to apply changes!';
      case 'settings.booruEditor.failedVerifyApiHydrus':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ?? 'Failed to verify api access for Hydrus';
      case 'settings.booruEditor.accessKeyRequestedTitle':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? 'Access key requested';
      case 'settings.booruEditor.accessKeyRequestedMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ??
            'Tap okay on Hydrus then apply. You can tap \'Test Booru\' afterwards';
      case 'settings.booruEditor.accessKeyFailedTitle':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? 'Failed to get access key';
      case 'settings.booruEditor.accessKeyFailedMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ??
            'Do you have the request window open in Hydrus?';
      case 'settings.booruEditor.hydrusInstructions':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ??
            'To get the Hydrus key you need to open the request dialog in the Hydrus client. Services > Review services > Client api > Add > From API request';
      case 'settings.booruEditor.getHydrusApiKey':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? 'Get Hydrus API key';
      case 'settings.booruEditor.booruName':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? 'Booru Name';
      case 'settings.booruEditor.booruNameRequired':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? 'Booru Name is required!';
      case 'settings.booruEditor.booruUrl':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? 'Booru URL';
      case 'settings.booruEditor.booruUrlRequired':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? 'Booru URL is required!';
      case 'settings.booruEditor.booruType':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruType', {}) ?? 'Booru Type';
      case 'settings.booruEditor.booruTypeIs':
        return ({required Object booruType}) =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruTypeIs', {'booruType': booruType}) ?? 'Booru Type is ${booruType}';
      case 'settings.booruEditor.booruFavicon':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? 'Favicon URL';
      case 'settings.booruEditor.booruFaviconPlaceholder':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '(Autofills if blank)';
      case 'settings.booruEditor.booruApiCredsInfo':
        return ({required Object userIdTitle, required Object apiKeyTitle}) =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruApiCredsInfo', {
              'userIdTitle': userIdTitle,
              'apiKeyTitle': apiKeyTitle,
            }) ??
            '${userIdTitle} and ${apiKeyTitle} may be needed with some boorus but in most cases aren\'t necessary.';
      case 'settings.booruEditor.canBeBlankPlaceholder':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.canBeBlankPlaceholder', {}) ?? '(Can be blank)';
      case 'settings.booruEditor.booruDefTags':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? 'Default tags';
      case 'settings.interface.title':
        return TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? 'Interface';
      case 'settings.theme.title':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? 'Themes';
      case 'settings.viewer.title':
        return TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? 'Viewer';
      case 'settings.video.title':
        return TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? 'Video';
      case 'settings.downloads.title':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.title', {}) ?? 'Snatching';
      case 'settings.downloads.fromNextItemInQueue':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.fromNextItemInQueue', {}) ?? 'From next item in queue';
      case 'settings.downloads.pleaseProvideStoragePermission':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.pleaseProvideStoragePermission', {}) ??
            'Please provide storage permission in order to download files';
      case 'settings.downloads.noItemsSelected':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsSelected', {}) ?? 'No items selected';
      case 'settings.downloads.noItemsQueued':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsQueued', {}) ?? 'No items in queue';
      case 'settings.downloads.batch':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.batch', {}) ?? 'Batch';
      case 'settings.downloads.snatchSelected':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? 'Snatch selected';
      case 'settings.downloads.removeSnatchedStatusFromSelected':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ??
            'Remove snatched status from selected';
      case 'settings.downloads.favouriteSelected':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? 'Favorite selected';
      case 'settings.downloads.unfavouriteSelected':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? 'Unfavorite selected';
      case 'settings.downloads.clearSelected':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? 'Clear selected';
      case 'settings.downloads.updatingData':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? 'Updating data...';
      case 'settings.cache.title':
        return TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? 'Caching';
      case 'settings.downloadsAndCache':
        return TranslationOverrides.string(_root.$meta, 'settings.downloadsAndCache', {}) ?? 'Snatching & Cache';
      case 'settings.tagFilters.title':
        return TranslationOverrides.string(_root.$meta, 'settings.tagFilters.title', {}) ?? 'Tag filters';
      case 'settings.database.title':
        return TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? 'Database';
      case 'settings.database.indexingDatabase':
        return TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? 'Indexing database';
      case 'settings.database.droppingIndexes':
        return TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? 'Dropping indexes';
      case 'settings.backupAndRestore.title':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.title', {}) ?? 'Backup & Restore';
      case 'settings.backupAndRestore.duplicateFileDetectedTitle':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedTitle', {}) ?? 'Duplicate file detected!';
      case 'settings.backupAndRestore.duplicateFileDetectedMsg':
        return ({required Object fileName}) =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
            'The file ${fileName} already exists. Do you want to overwrite it? If you choose no, the backup will be cancelled.';
      case 'settings.backupAndRestore.androidOnlyFeatureMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ??
            'This feature is only available on Android, on Desktop builds you can just copy/paste files from/to app\'s data folder, respective to your system';
      case 'settings.backupAndRestore.selectBackupDir':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? 'Select backup directory';
      case 'settings.backupAndRestore.failedToGetBackupPath':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ?? 'Failed to get backup path!';
      case 'settings.backupAndRestore.backupPathMsg':
        return ({required Object backupPath}) =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ??
            'Backup path is: ${backupPath}';
      case 'settings.backupAndRestore.noBackupDirSelected':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ?? 'No backup directory selected';
      case 'settings.backupAndRestore.restoreInfoMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ??
            'Restore will work only if the files are placed in the root of the directory.';
      case 'settings.backupAndRestore.backupSettings':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? 'Backup Settings';
      case 'settings.backupAndRestore.restoreSettings':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? 'Restore Settings';
      case 'settings.backupAndRestore.settingsBackedUp':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ?? 'Settings backed up to settings.json';
      case 'settings.backupAndRestore.settingsRestored':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? 'Settings restored from backup!';
      case 'settings.backupAndRestore.backupSettingsError':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ?? 'Failed to backup settings!';
      case 'settings.backupAndRestore.restoreSettingsError':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ?? 'Failed to restore settings!';
      case 'settings.backupAndRestore.backupBoorus':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ?? 'Backup Boorus';
      case 'settings.backupAndRestore.restoreBoorus':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? 'Restore Boorus';
      case 'settings.backupAndRestore.boorusBackedUp':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ?? 'Boorus backed up to boorus.json';
      case 'settings.backupAndRestore.boorusRestored':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ?? 'Boorus restored from backup!';
      case 'settings.backupAndRestore.backupBoorusError':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ?? 'Failed to backup boorus!';
      case 'settings.backupAndRestore.restoreBoorusError':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ?? 'Failed to restore boorus!';
      case 'settings.backupAndRestore.backupDatabase':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? 'Backup Database';
      case 'settings.backupAndRestore.restoreDatabase':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? 'Restore Database';
      case 'settings.backupAndRestore.restoreDatabaseInfo':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ??
            'May take a while depending on the size of the database, will restart the app on success';
      case 'settings.backupAndRestore.databaseBackedUp':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ?? 'Database backed up to database.json';
      case 'settings.backupAndRestore.databaseRestored':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ??
            'Database restored from backup! App will restart in a few seconds!';
      case 'settings.backupAndRestore.backupDatabaseError':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ?? 'Failed to backup database!';
      case 'settings.backupAndRestore.restoreDatabaseError':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ?? 'Failed to restore database!';
      case 'settings.backupAndRestore.databaseFileNotFound':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ??
            'Database file not found or cannot be read!';
      case 'settings.backupAndRestore.backupTags':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? 'Backup Tags';
      case 'settings.backupAndRestore.restoreTags':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? 'Restore Tags';
      case 'settings.backupAndRestore.restoreTagsInfo':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ??
            'May take a while if you have a lot of tags. If you did a database restore, you don\'t need to do this because it\'s already included in the database';
      case 'settings.backupAndRestore.tagsBackedUp':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? 'Tags backed up to tags.json';
      case 'settings.backupAndRestore.tagsRestored':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? 'Tags restored from backup!';
      case 'settings.backupAndRestore.backupTagsError':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? 'Failed to backup tags!';
      case 'settings.backupAndRestore.restoreTagsError':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? 'Failed to restore tags!';
      case 'settings.backupAndRestore.tagsFileNotFound':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsFileNotFound', {}) ?? 'Tags file not found or cannot be read!';
      case 'settings.backupAndRestore.operationTakesTooLongMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.operationTakesTooLongMsg', {}) ??
            'Press Hide below if it takes too long, operation will continue in background';
      case 'settings.backupAndRestore.backupFileNotFound':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupFileNotFound', {}) ??
            'Backup file not found or cannot be read!';
      case 'settings.backupAndRestore.backupDirNoAccess':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDirNoAccess', {}) ?? 'No access to backup directory!';
      case 'settings.backupAndRestore.backupCancelled':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? 'Backup cancelled!';
      case 'settings.network.title':
        return TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? 'Network';
      case 'settings.privacy.title':
        return TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? 'Privacy';
      case 'settings.sync.title':
        return TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? 'LoliSync';
      case 'settings.sync.dbError':
        return TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ?? 'Database must be enabled to use LoliSync';
      case 'settings.about.title':
        return TranslationOverrides.string(_root.$meta, 'settings.about.title', {}) ?? 'About';
      case 'settings.about.appDescription':
        return TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ??
            'LoliSnatcher is open source and licensed under GPLv3 the source code is available on github. Please report any issues or feature requests in the issues section of the repo.';
      case 'settings.about.appOnGitHub':
        return TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? 'LoliSnatcher on Github';
      case 'settings.about.contact':
        return TranslationOverrides.string(_root.$meta, 'settings.about.contact', {}) ?? 'Contact';
      case 'settings.about.emailCopied':
        return TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? 'Email copied to clipboard!';
      case 'settings.about.logoArtistThanks':
        return TranslationOverrides.string(_root.$meta, 'settings.about.logoArtistThanks', {}) ??
            'A big thanks to Showers-U for letting us use their artwork for the app logo. Please check them out on Pixiv';
      case 'settings.about.developers':
        return TranslationOverrides.string(_root.$meta, 'settings.about.developers', {}) ?? 'Developers';
      case 'settings.about.releases':
        return TranslationOverrides.string(_root.$meta, 'settings.about.releases', {}) ?? 'Releases';
      case 'settings.about.releasesMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.about.releasesMsg', {}) ??
            'Latest version and full changelogs can be found at the Github Releases page:';
      case 'settings.about.licenses':
        return TranslationOverrides.string(_root.$meta, 'settings.about.licenses', {}) ?? 'Licenses';
      case 'settings.checkForUpdates.title':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.title', {}) ?? 'Check for updates';
      case 'settings.checkForUpdates.updateAvailable':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateAvailable', {}) ?? 'Update available!';
      case 'settings.checkForUpdates.updateChangelog':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? 'Update changelog';
      case 'settings.checkForUpdates.updateCheckError':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? 'Update check error!';
      case 'settings.checkForUpdates.youHaveLatestVersion':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? 'You have the latest version!';
      case 'settings.checkForUpdates.viewLatestChangelog':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ?? 'View latest changelog';
      case 'settings.checkForUpdates.currentVersion':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? 'Current version';
      case 'settings.checkForUpdates.changelog':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? 'Changelog';
      case 'settings.checkForUpdates.visitPlayStore':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? 'Visit Play Store';
      case 'settings.checkForUpdates.visitReleases':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? 'Visit Releases';
      case 'settings.help.title':
        return TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? 'Help';
      case 'settings.debug.title':
        return TranslationOverrides.string(_root.$meta, 'settings.debug.title', {}) ?? 'Debug';
      case 'settings.debug.enabledSnackbarMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.debug.enabledSnackbarMsg', {}) ?? 'Debug mode is enabled!';
      case 'settings.debug.disabledSnackbarMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.debug.disabledSnackbarMsg', {}) ?? 'Debug mode is disabled!';
      case 'settings.debug.alreadyEnabledSnackbarMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.debug.alreadyEnabledSnackbarMsg', {}) ?? 'Debug mode is already enabled!';
      case 'settings.debug.openAlice':
        return TranslationOverrides.string(_root.$meta, 'settings.debug.openAlice', {}) ?? 'Open network inspector';
      case 'settings.debug.openLogger':
        return TranslationOverrides.string(_root.$meta, 'settings.debug.openLogger', {}) ?? 'Open logger';
      case 'settings.logging.title':
        return TranslationOverrides.string(_root.$meta, 'settings.logging.title', {}) ?? 'Logging';
      case 'settings.logging.enabledMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.logging.enabledMsg', {}) ?? 'Logging is enabled';
      case 'settings.logging.enabledLogTypes':
        return TranslationOverrides.string(_root.$meta, 'settings.logging.enabledLogTypes', {}) ?? 'Enabled log types';
      case 'settings.logging.disableTip':
        return TranslationOverrides.string(_root.$meta, 'settings.logging.disableTip', {}) ?? 'You can disable logging in the debug settings';
      case 'settings.webview.openWebview':
        return TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? 'Open webview';
      case 'settings.webview.openWebviewTip':
        return TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? 'to login or obtain cookies';
      case 'settings.version':
        return TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? 'Version';
      default:
        return null;
    }
  }
}
