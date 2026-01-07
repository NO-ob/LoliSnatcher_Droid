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

  /// en: 'Reset'
  String get reset => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'Reset';

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

  /// en: 'Please enter a value bigger than ${min}'
  String tooSmall({required Object min}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Please enter a value bigger than ${min}';

  /// en: 'Please enter a value smaller than ${max}'
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
  late final TranslationsSettingsPerformanceEn performance = TranslationsSettingsPerformanceEn.internal(_root);
  late final TranslationsSettingsSyncEn sync = TranslationsSettingsSyncEn.internal(_root);
  late final TranslationsSettingsAboutEn about = TranslationsSettingsAboutEn.internal(_root);
  late final TranslationsSettingsCheckForUpdatesEn checkForUpdates = TranslationsSettingsCheckForUpdatesEn.internal(_root);
  late final TranslationsSettingsLogsEn logs = TranslationsSettingsLogsEn.internal(_root);
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
  String get system => TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? 'System';

  /// en: 'Help us translate'
  String get helpUsTranslate => TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? 'Help us translate';

  /// en: 'Visit <a href="https://github.com/NO-ob/LoliSnatcher_Droid/wiki/Localization">github</a> for details or tap on the image below to go to Weblate'
  String get visitForDetails =>
      TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ??
      'Visit <a href="https://github.com/NO-ob/LoliSnatcher_Droid/wiki/Localization">github</a> for details or tap on the image below to go to Weblate';
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

  /// en: 'Booru config of ${booruName} will be converted to a link which then can be shared to other apps Should login/apikey data be included?'
  String shareBooruDialogMsgMobile({required Object booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
      'Booru config of ${booruName} will be converted to a link which then can be shared to other apps\n\nShould login/apikey data be included?';

  /// en: 'Booru config of ${booruName} will be converted to a link which will be copied to clipboard Should login/apikey data be included?'
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

  /// en: 'Booru Type is ${booruType}'
  String booruTypeIs({required Object booruType}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruTypeIs', {'booruType': booruType}) ?? 'Booru Type is ${booruType}';

  /// en: 'Favicon URL'
  String get booruFavicon => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? 'Favicon URL';

  /// en: '(Autofills if blank)'
  String get booruFaviconPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '(Autofills if blank)';

  /// en: '${userIdTitle} and ${apiKeyTitle} may be needed with some boorus but in most cases aren't necessary.'
  String booruApiCredsInfo({required Object userIdTitle, required Object apiKeyTitle}) =>
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

  /// en: 'The file ${fileName} already exists. Do you want to overwrite it? If you choose no, the backup will be cancelled.'
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

  /// en: 'Backup path is: ${backupPath}'
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

  /// en: 'App lock'
  String get appLock => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? 'App lock';

  /// en: 'Allows to lock the app manually or if left for too long. Requires system lock with PIN or biometrics to be enabled'
  String get appLockMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ??
      'Allows to lock the app manually or if left for too long. Requires system lock with PIN or biometrics to be enabled';

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

  /// en: 'Tells system keyboard to not save your typing history and disable learning based on your input. Will be applied to most of text inputs'
  String get incognitoKeyboardMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboardMsg', {}) ??
      'Tells system keyboard to not save your typing history and disable learning based on your input.\nWill be applied to most of text inputs';
}

// Path: settings.performance
class TranslationsSettingsPerformanceEn {
  TranslationsSettingsPerformanceEn.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Performance'
  String get title => TranslationOverrides.string(_root.$meta, 'settings.performance.title', {}) ?? 'Performance';
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
      'warning' => TranslationOverrides.string(_root.$meta, 'warning', {}) ?? 'Warning',
      'warningExclamation' => TranslationOverrides.string(_root.$meta, 'warningExclamation', {}) ?? 'Warning!',
      'info' => TranslationOverrides.string(_root.$meta, 'info', {}) ?? 'Info',
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
      'copy' => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Copy',
      'copied' => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Copied!',
      'paste' => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Paste',
      'copyErrorText' => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Copy error',
      'booru' => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru',
      'goToSettings' => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'Go to settings',
      'areYouSure' => TranslationOverrides.string(_root.$meta, 'areYouSure', {}) ?? 'Are you sure?',
      'thisMayTakeSomeTime' => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'This may take some time...',
      'doYouWantToExitApp' => TranslationOverrides.string(_root.$meta, 'doYouWantToExitApp', {}) ?? 'Do you want to exit the app?',
      'closeTheApp' => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Close the app',
      'invalidUrl' => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'Invalid URL!',
      'clipboardIsEmpty' => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'Clipboard is empty!',
      'apiKey' => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'API Key',
      'userId' => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'User ID',
      'login' => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Login',
      'password' => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Password',
      'pause' => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Pause',
      'resume' => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Resume',
      'discord' => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord',
      'visitOurDiscord' => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Visit our Discord server',
      'item' => TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Item',
      'selectAll' => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Select all',
      'reset' => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'Reset',
      'validationErrors.required' => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Please enter a value',
      'validationErrors.invalid' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Please enter a valid value',
      'validationErrors.tooSmall' =>
        ({required Object min}) =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Please enter a value bigger than ${min}',
      'validationErrors.tooBig' =>
        ({required Object max}) =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Please enter a value smaller than ${max}',
      'init.initError' => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Initialization error!',
      'init.postInitError' => TranslationOverrides.string(_root.$meta, 'init.postInitError', {}) ?? 'Post initialization error!',
      'init.settingUpProxy' => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Setting up proxy...',
      'init.loadingDatabase' => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Loading Database...',
      'init.loadingBoorus' => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Loading Boorus...',
      'init.loadingTags' => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Loading Tags...',
      'init.restoringTabs' => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Restoring Tabs...',
      'snatcher.title' => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Snatcher',
      'snatcher.snatchingHistory' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'Snatching history',
      'multibooru.title' => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? 'Multibooru',
      'multibooru.multibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Multibooru mode',
      'multibooru.multibooruRequiresAtLeastTwoBoorus' =>
        TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ??
            'Multibooru mode requires at least 2 boorus to be configured',
      'multibooru.selectSecondaryBoorus' =>
        TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Select secondary boorus:',
      'settings.title' => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Settings',
      'settings.language.title' => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? 'Language',
      'settings.language.system' => TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? 'System',
      'settings.language.helpUsTranslate' => TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? 'Help us translate',
      'settings.language.visitForDetails' =>
        TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ??
            'Visit <a href="https://github.com/NO-ob/LoliSnatcher_Droid/wiki/Localization">github</a> for details or tap on the image below to go to Weblate',
      'settings.booru.title' => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Boorus & Search',
      'settings.booru.defaultTags' => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? 'Default tags',
      'settings.booru.itemsPerPage' => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'Items fetched per page',
      'settings.booru.itemsPerPageTip' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'Some Boorus may ignore this setting',
      'settings.booru.addBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Add Booru config',
      'settings.booru.shareBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? 'Share Booru config',
      'settings.booru.shareBooruDialogMsgMobile' =>
        ({required Object booruName}) =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
            'Booru config of ${booruName} will be converted to a link which then can be shared to other apps\n\nShould login/apikey data be included?',
      'settings.booru.shareBooruDialogMsgDesktop' =>
        ({required Object booruName}) =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
            'Booru config of ${booruName} will be converted to a link which will be copied to clipboard\n\nShould login/apikey data be included?',
      'settings.booru.booruSharing' => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? 'Booru sharing',
      'settings.booru.booruSharingMsgAndroid' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ??
            'How to automatically open Booru config links in the app on Android 12 and higher:\n1) Tap button below to open system app link defaults settings\n2) Tap on "Add link" and select all available options',
      'settings.booru.addedBoorus' => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? 'Added Boorus',
      'settings.booru.editBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? 'Edit Booru config',
      'settings.booru.importBooru' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? 'Import Booru config from clipboard',
      'settings.booru.onlyLSURLsSupported' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ?? 'Only loli.snatcher URLs are supported!',
      'settings.booru.deleteBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? 'Delete Booru config',
      'settings.booru.deleteBooruError' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ?? 'Something went wrong during deletion of a Booru config!',
      'settings.booru.booruDeleted' => TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? 'Booru config deleted!',
      'settings.booru.booruDropdownInfo' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ??
            'The Booru selected here will be set as default after saving.\n\nThe default Booru will be first to appear in the dropdown boxes',
      'settings.booru.changeDefaultBooru' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? 'Change default Booru?',
      'settings.booru.changeTo' => TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? 'Change to: ',
      'settings.booru.keepCurrentBooru' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? 'Tap [No] to keep current: ',
      'settings.booru.changeToNewBooru' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? 'Tap [Yes] to change to: ',
      'settings.booru.booruConfigLinkCopied' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ?? 'Booru config link copied to clipboard!',
      'settings.booru.noBooruSelected' => TranslationOverrides.string(_root.$meta, 'settings.booru.noBooruSelected', {}) ?? 'No Booru selected!',
      'settings.booru.cantDeleteThisBooru' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? 'Can\'t delete this Booru!',
      'settings.booru.removeRelatedTabsFirst' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.removeRelatedTabsFirst', {}) ?? 'Remove related tabs first',
      'settings.booruEditor.title' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? 'Booru Editor',
      'settings.booruEditor.testBooru' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooru', {}) ?? 'Test Booru',
      'settings.booruEditor.testBooruSuccessMsg' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruSuccessMsg', {}) ?? 'Tap the Save button to save this config',
      'settings.booruEditor.testBooruFailedTitle' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'Booru test failed',
      'settings.booruEditor.testBooruFailedMsg' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ??
            'Config parameters may be incorrect, booru doesn\'t allow api access, request didn\'t return any data or there was a network error.',
      'settings.booruEditor.saveBooru' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Save Booru',
      'settings.booruEditor.runTestFirst' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runTestFirst', {}) ?? 'Run test first',
      'settings.booruEditor.runningTest' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? 'Running test...',
      'settings.booruEditor.booruConfigExistsError' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? 'This Booru config already exists',
      'settings.booruEditor.booruSameNameExistsError' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ?? 'Booru config with same name already exists',
      'settings.booruEditor.booruSameUrlExistsError' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ?? 'Booru config with same URL already exists',
      'settings.booruEditor.thisBooruConfigWontBeAdded' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ?? 'This booru config won\'t be added',
      'settings.booruEditor.booruConfigSaved' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? 'Booru config saved!',
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
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ?? 'Do you have the request window open in Hydrus?',
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
        ({required Object booruType}) =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruTypeIs', {'booruType': booruType}) ?? 'Booru Type is ${booruType}',
      'settings.booruEditor.booruFavicon' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? 'Favicon URL',
      'settings.booruEditor.booruFaviconPlaceholder' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '(Autofills if blank)',
      'settings.booruEditor.booruApiCredsInfo' =>
        ({required Object userIdTitle, required Object apiKeyTitle}) =>
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
      'settings.interface.title' => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? 'Interface',
      'settings.theme.title' => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? 'Themes',
      'settings.theme.themeMode' => TranslationOverrides.string(_root.$meta, 'settings.theme.themeMode', {}) ?? 'Theme mode',
      'settings.theme.blackBg' => TranslationOverrides.string(_root.$meta, 'settings.theme.blackBg', {}) ?? 'Black background',
      'settings.theme.useDynamicColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? 'Use dynamic color',
      'settings.theme.android12PlusOnly' => TranslationOverrides.string(_root.$meta, 'settings.theme.android12PlusOnly', {}) ?? 'Android 12+ only',
      'settings.theme.theme' => TranslationOverrides.string(_root.$meta, 'settings.theme.theme', {}) ?? 'Theme',
      'settings.theme.primaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? 'Primary color',
      'settings.theme.secondaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? 'Secondary color',
      'settings.theme.enableDrawerMascot' =>
        TranslationOverrides.string(_root.$meta, 'settings.theme.enableDrawerMascot', {}) ?? 'Enable drawer mascot',
      'settings.theme.setCustomMascot' => TranslationOverrides.string(_root.$meta, 'settings.theme.setCustomMascot', {}) ?? 'Set custom mascot',
      'settings.theme.removeCustomMascot' =>
        TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? 'Remove custom mascot',
      'settings.theme.currentMascotPath' => TranslationOverrides.string(_root.$meta, 'settings.theme.currentMascotPath', {}) ?? 'Current mascot path',
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
      'settings.viewer.title' => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? 'Viewer',
      'settings.video.title' => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? 'Video',
      'settings.downloads.title' => TranslationOverrides.string(_root.$meta, 'settings.downloads.title', {}) ?? 'Snatching',
      'settings.downloads.fromNextItemInQueue' =>
        TranslationOverrides.string(_root.$meta, 'settings.downloads.fromNextItemInQueue', {}) ?? 'From next item in queue',
      'settings.downloads.pleaseProvideStoragePermission' =>
        TranslationOverrides.string(_root.$meta, 'settings.downloads.pleaseProvideStoragePermission', {}) ??
            'Please provide storage permission in order to download files',
      'settings.downloads.noItemsSelected' =>
        TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsSelected', {}) ?? 'No items selected',
      'settings.downloads.noItemsQueued' => TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsQueued', {}) ?? 'No items in queue',
      'settings.downloads.batch' => TranslationOverrides.string(_root.$meta, 'settings.downloads.batch', {}) ?? 'Batch',
      'settings.downloads.snatchSelected' => TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? 'Snatch selected',
      'settings.downloads.removeSnatchedStatusFromSelected' =>
        TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ?? 'Remove snatched status from selected',
      'settings.downloads.favouriteSelected' =>
        TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? 'Favorite selected',
      'settings.downloads.unfavouriteSelected' =>
        TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? 'Unfavorite selected',
      'settings.downloads.clearSelected' => TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? 'Clear selected',
      'settings.downloads.updatingData' => TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? 'Updating data...',
      'settings.cache.title' => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? 'Caching',
      'settings.downloadsAndCache' => TranslationOverrides.string(_root.$meta, 'settings.downloadsAndCache', {}) ?? 'Snatching & Cache',
      'settings.tagFilters.title' => TranslationOverrides.string(_root.$meta, 'settings.tagFilters.title', {}) ?? 'Tag filters',
      'settings.database.title' => TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? 'Database',
      'settings.database.indexingDatabase' =>
        TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? 'Indexing database',
      'settings.database.droppingIndexes' => TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? 'Dropping indexes',
      'settings.backupAndRestore.title' => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.title', {}) ?? 'Backup & Restore',
      'settings.backupAndRestore.duplicateFileDetectedTitle' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedTitle', {}) ?? 'Duplicate file detected!',
      'settings.backupAndRestore.duplicateFileDetectedMsg' =>
        ({required Object fileName}) =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
            'The file ${fileName} already exists. Do you want to overwrite it? If you choose no, the backup will be cancelled.',
      'settings.backupAndRestore.androidOnlyFeatureMsg' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ??
            'This feature is only available on Android, on Desktop builds you can just copy/paste files from/to app\'s data folder, respective to your system',
      'settings.backupAndRestore.selectBackupDir' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? 'Select backup directory',
      'settings.backupAndRestore.failedToGetBackupPath' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ?? 'Failed to get backup path!',
      'settings.backupAndRestore.backupPathMsg' =>
        ({required Object backupPath}) =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ??
            'Backup path is: ${backupPath}',
      'settings.backupAndRestore.noBackupDirSelected' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ?? 'No backup directory selected',
      'settings.backupAndRestore.restoreInfoMsg' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ??
            'Restore will work only if the files are placed in the root of the directory.',
      'settings.backupAndRestore.backupSettings' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? 'Backup Settings',
      'settings.backupAndRestore.restoreSettings' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? 'Restore Settings',
      'settings.backupAndRestore.settingsBackedUp' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ?? 'Settings backed up to settings.json',
      'settings.backupAndRestore.settingsRestored' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? 'Settings restored from backup!',
      'settings.backupAndRestore.backupSettingsError' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ?? 'Failed to backup settings!',
      'settings.backupAndRestore.restoreSettingsError' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ?? 'Failed to restore settings!',
      'settings.backupAndRestore.backupBoorus' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ?? 'Backup Boorus',
      'settings.backupAndRestore.restoreBoorus' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? 'Restore Boorus',
      'settings.backupAndRestore.boorusBackedUp' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ?? 'Boorus backed up to boorus.json',
      'settings.backupAndRestore.boorusRestored' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ?? 'Boorus restored from backup!',
      'settings.backupAndRestore.backupBoorusError' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ?? 'Failed to backup boorus!',
      'settings.backupAndRestore.restoreBoorusError' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ?? 'Failed to restore boorus!',
      'settings.backupAndRestore.backupDatabase' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? 'Backup Database',
      'settings.backupAndRestore.restoreDatabase' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? 'Restore Database',
      'settings.backupAndRestore.restoreDatabaseInfo' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ??
            'May take a while depending on the size of the database, will restart the app on success',
      'settings.backupAndRestore.databaseBackedUp' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ?? 'Database backed up to database.json',
      'settings.backupAndRestore.databaseRestored' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ??
            'Database restored from backup! App will restart in a few seconds!',
      'settings.backupAndRestore.backupDatabaseError' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ?? 'Failed to backup database!',
      'settings.backupAndRestore.restoreDatabaseError' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ?? 'Failed to restore database!',
      'settings.backupAndRestore.databaseFileNotFound' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ??
            'Database file not found or cannot be read!',
      'settings.backupAndRestore.backupTags' => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? 'Backup Tags',
      'settings.backupAndRestore.restoreTags' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? 'Restore Tags',
      'settings.backupAndRestore.restoreTagsInfo' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ??
            'May take a while if you have a lot of tags. If you did a database restore, you don\'t need to do this because it\'s already included in the database',
      'settings.backupAndRestore.tagsBackedUp' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? 'Tags backed up to tags.json',
      'settings.backupAndRestore.tagsRestored' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? 'Tags restored from backup!',
      'settings.backupAndRestore.backupTagsError' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? 'Failed to backup tags!',
      'settings.backupAndRestore.restoreTagsError' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? 'Failed to restore tags!',
      'settings.backupAndRestore.tagsFileNotFound' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsFileNotFound', {}) ?? 'Tags file not found or cannot be read!',
      'settings.backupAndRestore.operationTakesTooLongMsg' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.operationTakesTooLongMsg', {}) ??
            'Press Hide below if it takes too long, operation will continue in background',
      'settings.backupAndRestore.backupFileNotFound' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupFileNotFound', {}) ?? 'Backup file not found or cannot be read!',
      'settings.backupAndRestore.backupDirNoAccess' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDirNoAccess', {}) ?? 'No access to backup directory!',
      'settings.backupAndRestore.backupCancelled' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? 'Backup cancelled!',
      'settings.network.title' => TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? 'Network',
      'settings.privacy.title' => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? 'Privacy',
      'settings.privacy.appLock' => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? 'App lock',
      'settings.privacy.appLockMsg' =>
        TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ??
            'Allows to lock the app manually or if left for too long. Requires system lock with PIN or biometrics to be enabled',
      'settings.privacy.autoLockAfter' => TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfter', {}) ?? 'Auto lock after',
      'settings.privacy.autoLockAfterTip' =>
        TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfterTip', {}) ?? 'in seconds, 0 to disable',
      'settings.privacy.bluronLeave' =>
        TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeave', {}) ?? 'Blur screen when leaving the app',
      'settings.privacy.bluronLeaveMsg' =>
        TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeaveMsg', {}) ?? 'May not work on some devices due to system limitations',
      'settings.privacy.incognitoKeyboard' =>
        TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboard', {}) ?? 'Incognito keyboard',
      'settings.privacy.incognitoKeyboardMsg' =>
        TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboardMsg', {}) ??
            'Tells system keyboard to not save your typing history and disable learning based on your input.\nWill be applied to most of text inputs',
      'settings.performance.title' => TranslationOverrides.string(_root.$meta, 'settings.performance.title', {}) ?? 'Performance',
      'settings.sync.title' => TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? 'LoliSync',
      'settings.sync.dbError' => TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ?? 'Database must be enabled to use LoliSync',
      'settings.about.title' => TranslationOverrides.string(_root.$meta, 'settings.about.title', {}) ?? 'About',
      'settings.about.appDescription' =>
        TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ??
            'LoliSnatcher is open source and licensed under GPLv3 the source code is available on github. Please report any issues or feature requests in the issues section of the repo.',
      'settings.about.appOnGitHub' => TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? 'LoliSnatcher on Github',
      'settings.about.contact' => TranslationOverrides.string(_root.$meta, 'settings.about.contact', {}) ?? 'Contact',
      'settings.about.emailCopied' => TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? 'Email copied to clipboard!',
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
      'settings.checkForUpdates.updateChangelog' =>
        TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? 'Update changelog',
      'settings.checkForUpdates.updateCheckError' =>
        TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? 'Update check error!',
      'settings.checkForUpdates.youHaveLatestVersion' =>
        TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? 'You have the latest version!',
      'settings.checkForUpdates.viewLatestChangelog' =>
        TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ?? 'View latest changelog',
      'settings.checkForUpdates.currentVersion' =>
        TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? 'Current version',
      'settings.checkForUpdates.changelog' => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? 'Changelog',
      'settings.checkForUpdates.visitPlayStore' =>
        TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? 'Visit Play Store',
      'settings.checkForUpdates.visitReleases' =>
        TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? 'Visit Releases',
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
      'settings.debug.openAlice' => TranslationOverrides.string(_root.$meta, 'settings.debug.openAlice', {}) ?? 'Open network inspector',
      'settings.debug.openLogger' => TranslationOverrides.string(_root.$meta, 'settings.debug.openLogger', {}) ?? 'Open logger',
      'settings.logging.title' => TranslationOverrides.string(_root.$meta, 'settings.logging.title', {}) ?? 'Logging',
      'settings.logging.enabledMsg' => TranslationOverrides.string(_root.$meta, 'settings.logging.enabledMsg', {}) ?? 'Logging is enabled',
      'settings.logging.enabledLogTypes' => TranslationOverrides.string(_root.$meta, 'settings.logging.enabledLogTypes', {}) ?? 'Enabled log types',
      'settings.logging.disableTip' =>
        TranslationOverrides.string(_root.$meta, 'settings.logging.disableTip', {}) ?? 'You can disable logging in the debug settings',
      'settings.webview.openWebview' => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? 'Open webview',
      'settings.webview.openWebviewTip' =>
        TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? 'to login or obtain cookies',
      'settings.version' => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? 'Version',
      _ => null,
    };
  }
}
