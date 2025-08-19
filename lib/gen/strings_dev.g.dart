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
class TranslationsDev extends Translations {
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
  String get copy => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? '{Copy}';
  @override
  String get copied => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? '{Copied!}';
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
  String get selectAll => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? '{Select all}';
  @override
  String get reset => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? '{Reset}';
  @override
  late final _TranslationsValidationErrorsDev validationErrors = _TranslationsValidationErrorsDev._(_root);
  @override
  late final _TranslationsInitDev init = _TranslationsInitDev._(_root);
  @override
  late final _TranslationsSnatcherDev snatcher = _TranslationsSnatcherDev._(_root);
  @override
  late final _TranslationsMultibooruDev multibooru = _TranslationsMultibooruDev._(_root);
  @override
  late final _TranslationsSettingsDev settings = _TranslationsSettingsDev._(_root);
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
  String tooSmall({required Object min}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? '{Please enter a value bigger than ${min}}';
  @override
  String tooBig({required Object max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? '{Please enter a value smaller than ${max}}';
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
  String get loadingDatabase => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? '{Loading Database...}';
  @override
  String get loadingBoorus => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? '{Loading Boorus...}';
  @override
  String get loadingTags => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? '{Loading Tags...}';
  @override
  String get restoringTabs => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? '{Restoring Tabs...}';
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
  late final _TranslationsSettingsCacheDev cache = _TranslationsSettingsCacheDev._(_root);
  @override
  String get downloadsAndCache => TranslationOverrides.string(_root.$meta, 'settings.downloadsAndCache', {}) ?? '{Snatching & Cache}';
  @override
  late final _TranslationsSettingsTagFiltersDev tagFilters = _TranslationsSettingsTagFiltersDev._(_root);
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
  String get version => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? '{Version}';
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
  String get defaultTags => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? '{Default tags}';
  @override
  String get itemsPerPage => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? '{Items fetched per page}';
  @override
  String get itemsPerPageTip =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? '{Some Boorus may ignore this setting}';
  @override
  String get addBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? '{Add Booru config}';
  @override
  String get shareBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? '{Share Booru config}';
  @override
  String shareBooruDialogMsgMobile({required Object booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
      '{Booru config of ${booruName} will be converted to a link which then can be shared to other apps\n\nShould login/apikey data be included?}';
  @override
  String shareBooruDialogMsgDesktop({required Object booruName}) =>
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
  String get booruDeleted => TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? '{Booru config deleted!}';
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
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ?? '{Booru config link copied to clipboard!}';
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
  String get booruConfigSaved => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? '{Booru config saved!}';
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
  String booruTypeIs({required Object booruType}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruTypeIs', {'booruType': booruType}) ?? '{Booru Type is ${booruType}}';
  @override
  String get booruFavicon => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? '{Favicon URL}';
  @override
  String get booruFaviconPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '{(Autofills if blank)}';
  @override
  String booruApiCredsInfo({required Object userIdTitle, required Object apiKeyTitle}) =>
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
}

// Path: settings.video
class _TranslationsSettingsVideoDev extends TranslationsSettingsVideoEn {
  _TranslationsSettingsVideoDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? '{Video}';
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

// Path: settings.cache
class _TranslationsSettingsCacheDev extends TranslationsSettingsCacheEn {
  _TranslationsSettingsCacheDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? '{Caching}';
}

// Path: settings.tagFilters
class _TranslationsSettingsTagFiltersDev extends TranslationsSettingsTagFiltersEn {
  _TranslationsSettingsTagFiltersDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.tagFilters.title', {}) ?? '{Tag filters}';
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
  String duplicateFileDetectedMsg({required Object fileName}) =>
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
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ?? '{Failed to get backup path!}';
  @override
  String backupPathMsg({required Object backupPath}) =>
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
  String get backupSettings => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? '{Backup Settings}';
  @override
  String get restoreSettings => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? '{Restore Settings}';
  @override
  String get settingsBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ?? '{Settings backed up to settings.json}';
  @override
  String get settingsRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? '{Settings restored from backup!}';
  @override
  String get backupSettingsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ?? '{Failed to backup settings!}';
  @override
  String get restoreSettingsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ?? '{Failed to restore settings!}';
  @override
  String get backupBoorus => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ?? '{Backup Boorus}';
  @override
  String get restoreBoorus => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? '{Restore Boorus}';
  @override
  String get boorusBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ?? '{Boorus backed up to boorus.json}';
  @override
  String get boorusRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ?? '{Boorus restored from backup!}';
  @override
  String get backupBoorusError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ?? '{Failed to backup boorus!}';
  @override
  String get restoreBoorusError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ?? '{Failed to restore boorus!}';
  @override
  String get backupDatabase => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? '{Backup Database}';
  @override
  String get restoreDatabase => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? '{Restore Database}';
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
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ?? '{Failed to backup database!}';
  @override
  String get restoreDatabaseError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ?? '{Failed to restore database!}';
  @override
  String get databaseFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ??
      '{Database file not found or cannot be read!}';
  @override
  String get backupTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? '{Backup Tags}';
  @override
  String get restoreTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? '{Restore Tags}';
  @override
  String get restoreTagsInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ??
      '{May take a while if you have a lot of tags. If you did a database restore, you don\'t need to do this because it\'s already included in the database}';
  @override
  String get tagsBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? '{Tags backed up to tags.json}';
  @override
  String get tagsRestored => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? '{Tags restored from backup!}';
  @override
  String get backupTagsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? '{Failed to backup tags!}';
  @override
  String get restoreTagsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? '{Failed to restore tags!}';
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
  String get backupCancelled => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? '{Backup cancelled!}';
}

// Path: settings.network
class _TranslationsSettingsNetworkDev extends TranslationsSettingsNetworkEn {
  _TranslationsSettingsNetworkDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? '{Network}';
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
  String get emailCopied => TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? '{Email copied to clipboard!}';
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
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? '{You have the latest version!}';
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
  String get visitReleases => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? '{Visit Releases}';
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
}

// Path: settings.logging
class _TranslationsSettingsLoggingDev extends TranslationsSettingsLoggingEn {
  _TranslationsSettingsLoggingDev._(TranslationsDev root) : this._root = root, super.internal(root);

  final TranslationsDev _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.logging.title', {}) ?? '{Logging}';
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

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsDev {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'locale':
        return TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'dev';
      case 'localeName':
        return TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'Dev';
      case 'appName':
        return TranslationOverrides.string(_root.$meta, 'appName', {}) ?? '{LoliSnatcher}';
      case 'error':
        return TranslationOverrides.string(_root.$meta, 'error', {}) ?? '{Error}';
      case 'errorExclamation':
        return TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? '{Error!}';
      case 'warning':
        return TranslationOverrides.string(_root.$meta, 'warning', {}) ?? '{Warning}';
      case 'warningExclamation':
        return TranslationOverrides.string(_root.$meta, 'warningExclamation', {}) ?? '{Warning!}';
      case 'info':
        return TranslationOverrides.string(_root.$meta, 'info', {}) ?? '{Info}';
      case 'success':
        return TranslationOverrides.string(_root.$meta, 'success', {}) ?? '{Success}';
      case 'successExclamation':
        return TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? '{Success!}';
      case 'cancel':
        return TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? '{Cancel}';
      case 'later':
        return TranslationOverrides.string(_root.$meta, 'later', {}) ?? '{Later}';
      case 'close':
        return TranslationOverrides.string(_root.$meta, 'close', {}) ?? '{Close}';
      case 'ok':
        return TranslationOverrides.string(_root.$meta, 'ok', {}) ?? '{OK}';
      case 'yes':
        return TranslationOverrides.string(_root.$meta, 'yes', {}) ?? '{Yes}';
      case 'no':
        return TranslationOverrides.string(_root.$meta, 'no', {}) ?? '{No}';
      case 'pleaseWait':
        return TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? '{Please wait...}';
      case 'show':
        return TranslationOverrides.string(_root.$meta, 'show', {}) ?? '{Show}';
      case 'hide':
        return TranslationOverrides.string(_root.$meta, 'hide', {}) ?? '{Hide}';
      case 'enable':
        return TranslationOverrides.string(_root.$meta, 'enable', {}) ?? '{Enable}';
      case 'disable':
        return TranslationOverrides.string(_root.$meta, 'disable', {}) ?? '{Disable}';
      case 'add':
        return TranslationOverrides.string(_root.$meta, 'add', {}) ?? '{Add}';
      case 'edit':
        return TranslationOverrides.string(_root.$meta, 'edit', {}) ?? '{Edit}';
      case 'remove':
        return TranslationOverrides.string(_root.$meta, 'remove', {}) ?? '{Remove}';
      case 'save':
        return TranslationOverrides.string(_root.$meta, 'save', {}) ?? '{Save}';
      case 'delete':
        return TranslationOverrides.string(_root.$meta, 'delete', {}) ?? '{Delete}';
      case 'copy':
        return TranslationOverrides.string(_root.$meta, 'copy', {}) ?? '{Copy}';
      case 'copied':
        return TranslationOverrides.string(_root.$meta, 'copied', {}) ?? '{Copied!}';
      case 'paste':
        return TranslationOverrides.string(_root.$meta, 'paste', {}) ?? '{Paste}';
      case 'copyErrorText':
        return TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? '{Copy error}';
      case 'booru':
        return TranslationOverrides.string(_root.$meta, 'booru', {}) ?? '{Booru}';
      case 'goToSettings':
        return TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? '{Go to settings}';
      case 'areYouSure':
        return TranslationOverrides.string(_root.$meta, 'areYouSure', {}) ?? '{Are you sure?}';
      case 'thisMayTakeSomeTime':
        return TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? '{This may take some time...}';
      case 'doYouWantToExitApp':
        return TranslationOverrides.string(_root.$meta, 'doYouWantToExitApp', {}) ?? '{Do you want to exit the app?}';
      case 'closeTheApp':
        return TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? '{Close the app}';
      case 'invalidUrl':
        return TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? '{Invalid URL!}';
      case 'clipboardIsEmpty':
        return TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? '{Clipboard is empty!}';
      case 'apiKey':
        return TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? '{API Key}';
      case 'userId':
        return TranslationOverrides.string(_root.$meta, 'userId', {}) ?? '{User ID}';
      case 'login':
        return TranslationOverrides.string(_root.$meta, 'login', {}) ?? '{Login}';
      case 'password':
        return TranslationOverrides.string(_root.$meta, 'password', {}) ?? '{Password}';
      case 'pause':
        return TranslationOverrides.string(_root.$meta, 'pause', {}) ?? '{Pause}';
      case 'resume':
        return TranslationOverrides.string(_root.$meta, 'resume', {}) ?? '{Resume}';
      case 'discord':
        return TranslationOverrides.string(_root.$meta, 'discord', {}) ?? '{Discord}';
      case 'visitOurDiscord':
        return TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? '{Visit our Discord server}';
      case 'item':
        return TranslationOverrides.string(_root.$meta, 'item', {}) ?? '{Item}';
      case 'selectAll':
        return TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? '{Select all}';
      case 'reset':
        return TranslationOverrides.string(_root.$meta, 'reset', {}) ?? '{Reset}';
      case 'validationErrors.required':
        return TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? '{Please enter a value}';
      case 'validationErrors.invalid':
        return TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? '{Please enter a valid value}';
      case 'validationErrors.tooSmall':
        return ({required Object min}) =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? '{Please enter a value bigger than ${min}}';
      case 'validationErrors.tooBig':
        return ({required Object max}) =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? '{Please enter a value smaller than ${max}}';
      case 'init.initError':
        return TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? '{Initialization error!}';
      case 'init.postInitError':
        return TranslationOverrides.string(_root.$meta, 'init.postInitError', {}) ?? '{Post initialization error!}';
      case 'init.settingUpProxy':
        return TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? '{Setting up proxy...}';
      case 'init.loadingDatabase':
        return TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? '{Loading Database...}';
      case 'init.loadingBoorus':
        return TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? '{Loading Boorus...}';
      case 'init.loadingTags':
        return TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? '{Loading Tags...}';
      case 'init.restoringTabs':
        return TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? '{Restoring Tabs...}';
      case 'snatcher.title':
        return TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? '{Snatcher}';
      case 'snatcher.snatchingHistory':
        return TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? '{Snatching history}';
      case 'multibooru.title':
        return TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? '{Multibooru}';
      case 'multibooru.multibooruMode':
        return TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? '{Multibooru mode}';
      case 'multibooru.multibooruRequiresAtLeastTwoBoorus':
        return TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ??
            '{Multibooru mode requires at least 2 boorus to be configured}';
      case 'multibooru.selectSecondaryBoorus':
        return TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? '{Select secondary boorus:}';
      case 'settings.title':
        return TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? '{Settings}';
      case 'settings.language.title':
        return TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? '{Language}';
      case 'settings.language.system':
        return TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? '{System}';
      case 'settings.language.helpUsTranslate':
        return TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? '{Help us translate}';
      case 'settings.language.visitForDetails':
        return TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ??
            '{Visit <a href="https://github.com/NO-ob/LoliSnatcher_Droid/wiki/Localization">github</a> for details or tap on the image below to go to Weblate}';
      case 'settings.booru.title':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? '{Boorus & Search}';
      case 'settings.booru.defaultTags':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? '{Default tags}';
      case 'settings.booru.itemsPerPage':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? '{Items fetched per page}';
      case 'settings.booru.itemsPerPageTip':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? '{Some Boorus may ignore this setting}';
      case 'settings.booru.addBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? '{Add Booru config}';
      case 'settings.booru.shareBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? '{Share Booru config}';
      case 'settings.booru.shareBooruDialogMsgMobile':
        return ({required Object booruName}) =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
            '{Booru config of ${booruName} will be converted to a link which then can be shared to other apps\n\nShould login/apikey data be included?}';
      case 'settings.booru.shareBooruDialogMsgDesktop':
        return ({required Object booruName}) =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
            '{Booru config of ${booruName} will be converted to a link which will be copied to clipboard\n\nShould login/apikey data be included?}';
      case 'settings.booru.booruSharing':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? '{Booru sharing}';
      case 'settings.booru.booruSharingMsgAndroid':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ??
            '{How to automatically open Booru config links in the app on Android 12 and higher:\n1) Tap button below to open system app link defaults settings\n2) Tap on "Add link" and select all available options}';
      case 'settings.booru.addedBoorus':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? '{Added Boorus}';
      case 'settings.booru.editBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? '{Edit Booru config}';
      case 'settings.booru.importBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? '{Import Booru config from clipboard}';
      case 'settings.booru.onlyLSURLsSupported':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ?? '{Only loli.snatcher URLs are supported!}';
      case 'settings.booru.deleteBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? '{Delete Booru config}';
      case 'settings.booru.deleteBooruError':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ??
            '{Something went wrong during deletion of a Booru config!}';
      case 'settings.booru.booruDeleted':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? '{Booru config deleted!}';
      case 'settings.booru.booruDropdownInfo':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ??
            '{The Booru selected here will be set as default after saving.\n\nThe default Booru will be first to appear in the dropdown boxes}';
      case 'settings.booru.changeDefaultBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? '{Change default Booru?}';
      case 'settings.booru.changeTo':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? '{Change to: }';
      case 'settings.booru.keepCurrentBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? '{Tap [No] to keep current: }';
      case 'settings.booru.changeToNewBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? '{Tap [Yes] to change to: }';
      case 'settings.booru.booruConfigLinkCopied':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ?? '{Booru config link copied to clipboard!}';
      case 'settings.booru.noBooruSelected':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.noBooruSelected', {}) ?? '{No Booru selected!}';
      case 'settings.booru.cantDeleteThisBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? '{Can\'t delete this Booru!}';
      case 'settings.booru.removeRelatedTabsFirst':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.removeRelatedTabsFirst', {}) ?? '{Remove related tabs first}';
      case 'settings.booruEditor.title':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? '{Booru Editor}';
      case 'settings.booruEditor.testBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooru', {}) ?? '{Test Booru}';
      case 'settings.booruEditor.testBooruSuccessMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruSuccessMsg', {}) ??
            '{Tap the Save button to save this config}';
      case 'settings.booruEditor.testBooruFailedTitle':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? '{Booru test failed}';
      case 'settings.booruEditor.testBooruFailedMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ??
            '{Config parameters may be incorrect, booru doesn\'t allow api access, request didn\'t return any data or there was a network error.}';
      case 'settings.booruEditor.saveBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? '{Save Booru}';
      case 'settings.booruEditor.runTestFirst':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runTestFirst', {}) ?? '{Run test first}';
      case 'settings.booruEditor.runningTest':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? '{Running test...}';
      case 'settings.booruEditor.booruConfigExistsError':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? '{This Booru config already exists}';
      case 'settings.booruEditor.booruSameNameExistsError':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ??
            '{Booru config with same name already exists}';
      case 'settings.booruEditor.booruSameUrlExistsError':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ??
            '{Booru config with same URL already exists}';
      case 'settings.booruEditor.thisBooruConfigWontBeAdded':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ??
            '{This booru config won\'t be added}';
      case 'settings.booruEditor.booruConfigSaved':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? '{Booru config saved!}';
      case 'settings.booruEditor.existingTabsNeedReload':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ??
            '{Existing tabs with this Booru need to be reloaded in order to apply changes!}';
      case 'settings.booruEditor.failedVerifyApiHydrus':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ??
            '{Failed to verify api access for Hydrus}';
      case 'settings.booruEditor.accessKeyRequestedTitle':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? '{Access key requested}';
      case 'settings.booruEditor.accessKeyRequestedMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ??
            '{Tap okay on Hydrus then apply. You can tap \'Test Booru\' afterwards}';
      case 'settings.booruEditor.accessKeyFailedTitle':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? '{Failed to get access key}';
      case 'settings.booruEditor.accessKeyFailedMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ??
            '{Do you have the request window open in Hydrus?}';
      case 'settings.booruEditor.hydrusInstructions':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ??
            '{To get the Hydrus key you need to open the request dialog in the Hydrus client. Services > Review services > Client api > Add > From API request}';
      case 'settings.booruEditor.getHydrusApiKey':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? '{Get Hydrus API key}';
      case 'settings.booruEditor.booruName':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? '{Booru Name}';
      case 'settings.booruEditor.booruNameRequired':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? '{Booru Name is required!}';
      case 'settings.booruEditor.booruUrl':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? '{Booru URL}';
      case 'settings.booruEditor.booruUrlRequired':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? '{Booru URL is required!}';
      case 'settings.booruEditor.booruType':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruType', {}) ?? '{Booru Type}';
      case 'settings.booruEditor.booruTypeIs':
        return ({required Object booruType}) =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruTypeIs', {'booruType': booruType}) ?? '{Booru Type is ${booruType}}';
      case 'settings.booruEditor.booruFavicon':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? '{Favicon URL}';
      case 'settings.booruEditor.booruFaviconPlaceholder':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '{(Autofills if blank)}';
      case 'settings.booruEditor.booruApiCredsInfo':
        return ({required Object userIdTitle, required Object apiKeyTitle}) =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruApiCredsInfo', {
              'userIdTitle': userIdTitle,
              'apiKeyTitle': apiKeyTitle,
            }) ??
            '{${userIdTitle} and ${apiKeyTitle} may be needed with some boorus but in most cases aren\'t necessary.}';
      case 'settings.booruEditor.booruDefTags':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? '{Default tags}';
      case 'settings.booruEditor.booruDefTagsPlaceholder':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTagsPlaceholder', {}) ?? '{Default search for booru}';
      case 'settings.booruEditor.booruDefaultInstructions':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefaultInstructions', {}) ??
            '{Fields below may be required for some boorus}';
      case 'settings.interface.title':
        return TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? '{Interface}';
      case 'settings.theme.title':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? '{Themes}';
      case 'settings.theme.themeMode':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.themeMode', {}) ?? '{Theme mode}';
      case 'settings.theme.blackBg':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.blackBg', {}) ?? '{Black background}';
      case 'settings.theme.useDynamicColor':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? '{Use dynamic color}';
      case 'settings.theme.android12PlusOnly':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.android12PlusOnly', {}) ?? '{Android 12+ only}';
      case 'settings.theme.theme':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.theme', {}) ?? '{Theme}';
      case 'settings.theme.primaryColor':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? '{Primary color}';
      case 'settings.theme.secondaryColor':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? '{Secondary color}';
      case 'settings.theme.enableDrawerMascot':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.enableDrawerMascot', {}) ?? '{Enable drawer mascot}';
      case 'settings.theme.setCustomMascot':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.setCustomMascot', {}) ?? '{Set custom mascot}';
      case 'settings.theme.removeCustomMascot':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? '{Remove custom mascot}';
      case 'settings.theme.currentMascotPath':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.currentMascotPath', {}) ?? '{Current mascot path}';
      case 'settings.theme.system':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.system', {}) ?? '{System}';
      case 'settings.theme.light':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.light', {}) ?? '{Light}';
      case 'settings.theme.dark':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.dark', {}) ?? '{Dark}';
      case 'settings.theme.pink':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.pink', {}) ?? '{Pink}';
      case 'settings.theme.purple':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.purple', {}) ?? '{Purple}';
      case 'settings.theme.blue':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.blue', {}) ?? '{Blue}';
      case 'settings.theme.teal':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.teal', {}) ?? '{Teal}';
      case 'settings.theme.red':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.red', {}) ?? '{Red}';
      case 'settings.theme.green':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.green', {}) ?? '{Green}';
      case 'settings.theme.halloween':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.halloween', {}) ?? '{Halloween}';
      case 'settings.theme.custom':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? '{Custom}';
      case 'settings.theme.selectColor':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.selectColor', {}) ?? '{Select color}';
      case 'settings.theme.selectedColor':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColor', {}) ?? '{Selected color}';
      case 'settings.theme.selectedColorAndShades':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColorAndShades', {}) ?? '{Selected color and its shades}';
      case 'settings.viewer.title':
        return TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? '{Viewer}';
      case 'settings.video.title':
        return TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? '{Video}';
      case 'settings.downloads.title':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.title', {}) ?? '{Snatching}';
      case 'settings.downloads.fromNextItemInQueue':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.fromNextItemInQueue', {}) ?? '{From next item in queue}';
      case 'settings.downloads.pleaseProvideStoragePermission':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.pleaseProvideStoragePermission', {}) ??
            '{Please provide storage permission in order to download files}';
      case 'settings.downloads.noItemsSelected':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsSelected', {}) ?? '{No items selected}';
      case 'settings.downloads.noItemsQueued':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsQueued', {}) ?? '{No items in queue}';
      case 'settings.downloads.batch':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.batch', {}) ?? '{Batch}';
      case 'settings.downloads.snatchSelected':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? '{Snatch selected}';
      case 'settings.downloads.removeSnatchedStatusFromSelected':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ??
            '{Remove snatched status from selected}';
      case 'settings.downloads.favouriteSelected':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? '{Favorite selected}';
      case 'settings.downloads.unfavouriteSelected':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? '{Unfavorite selected}';
      case 'settings.downloads.clearSelected':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? '{Clear selected}';
      case 'settings.downloads.updatingData':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? '{Updating data...}';
      case 'settings.cache.title':
        return TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? '{Caching}';
      case 'settings.downloadsAndCache':
        return TranslationOverrides.string(_root.$meta, 'settings.downloadsAndCache', {}) ?? '{Snatching & Cache}';
      case 'settings.tagFilters.title':
        return TranslationOverrides.string(_root.$meta, 'settings.tagFilters.title', {}) ?? '{Tag filters}';
      case 'settings.database.title':
        return TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? '{Database}';
      case 'settings.database.indexingDatabase':
        return TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? '{Indexing database}';
      case 'settings.database.droppingIndexes':
        return TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? '{Dropping indexes}';
      case 'settings.backupAndRestore.title':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.title', {}) ?? '{Backup & Restore}';
      case 'settings.backupAndRestore.duplicateFileDetectedTitle':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedTitle', {}) ?? '{Duplicate file detected!}';
      case 'settings.backupAndRestore.duplicateFileDetectedMsg':
        return ({required Object fileName}) =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
            '{The file ${fileName} already exists. Do you want to overwrite it? If you choose no, the backup will be cancelled.}';
      case 'settings.backupAndRestore.androidOnlyFeatureMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ??
            '{This feature is only available on Android, on Desktop builds you can just copy/paste files from/to app\'s data folder, respective to your system}';
      case 'settings.backupAndRestore.selectBackupDir':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? '{Select backup directory}';
      case 'settings.backupAndRestore.failedToGetBackupPath':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ?? '{Failed to get backup path!}';
      case 'settings.backupAndRestore.backupPathMsg':
        return ({required Object backupPath}) =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ??
            '{Backup path is: ${backupPath}}';
      case 'settings.backupAndRestore.noBackupDirSelected':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ?? '{No backup directory selected}';
      case 'settings.backupAndRestore.restoreInfoMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ??
            '{Restore will work only if the files are placed in the root of the directory.}';
      case 'settings.backupAndRestore.backupSettings':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? '{Backup Settings}';
      case 'settings.backupAndRestore.restoreSettings':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? '{Restore Settings}';
      case 'settings.backupAndRestore.settingsBackedUp':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ?? '{Settings backed up to settings.json}';
      case 'settings.backupAndRestore.settingsRestored':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? '{Settings restored from backup!}';
      case 'settings.backupAndRestore.backupSettingsError':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ?? '{Failed to backup settings!}';
      case 'settings.backupAndRestore.restoreSettingsError':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ?? '{Failed to restore settings!}';
      case 'settings.backupAndRestore.backupBoorus':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ?? '{Backup Boorus}';
      case 'settings.backupAndRestore.restoreBoorus':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? '{Restore Boorus}';
      case 'settings.backupAndRestore.boorusBackedUp':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ?? '{Boorus backed up to boorus.json}';
      case 'settings.backupAndRestore.boorusRestored':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ?? '{Boorus restored from backup!}';
      case 'settings.backupAndRestore.backupBoorusError':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ?? '{Failed to backup boorus!}';
      case 'settings.backupAndRestore.restoreBoorusError':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ?? '{Failed to restore boorus!}';
      case 'settings.backupAndRestore.backupDatabase':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? '{Backup Database}';
      case 'settings.backupAndRestore.restoreDatabase':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? '{Restore Database}';
      case 'settings.backupAndRestore.restoreDatabaseInfo':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ??
            '{May take a while depending on the size of the database, will restart the app on success}';
      case 'settings.backupAndRestore.databaseBackedUp':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ?? '{Database backed up to database.json}';
      case 'settings.backupAndRestore.databaseRestored':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ??
            '{Database restored from backup! App will restart in a few seconds!}';
      case 'settings.backupAndRestore.backupDatabaseError':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ?? '{Failed to backup database!}';
      case 'settings.backupAndRestore.restoreDatabaseError':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ?? '{Failed to restore database!}';
      case 'settings.backupAndRestore.databaseFileNotFound':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ??
            '{Database file not found or cannot be read!}';
      case 'settings.backupAndRestore.backupTags':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? '{Backup Tags}';
      case 'settings.backupAndRestore.restoreTags':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? '{Restore Tags}';
      case 'settings.backupAndRestore.restoreTagsInfo':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ??
            '{May take a while if you have a lot of tags. If you did a database restore, you don\'t need to do this because it\'s already included in the database}';
      case 'settings.backupAndRestore.tagsBackedUp':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? '{Tags backed up to tags.json}';
      case 'settings.backupAndRestore.tagsRestored':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? '{Tags restored from backup!}';
      case 'settings.backupAndRestore.backupTagsError':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? '{Failed to backup tags!}';
      case 'settings.backupAndRestore.restoreTagsError':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? '{Failed to restore tags!}';
      case 'settings.backupAndRestore.tagsFileNotFound':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsFileNotFound', {}) ??
            '{Tags file not found or cannot be read!}';
      case 'settings.backupAndRestore.operationTakesTooLongMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.operationTakesTooLongMsg', {}) ??
            '{Press Hide below if it takes too long, operation will continue in background}';
      case 'settings.backupAndRestore.backupFileNotFound':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupFileNotFound', {}) ??
            '{Backup file not found or cannot be read!}';
      case 'settings.backupAndRestore.backupDirNoAccess':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDirNoAccess', {}) ?? '{No access to backup directory!}';
      case 'settings.backupAndRestore.backupCancelled':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? '{Backup cancelled!}';
      case 'settings.network.title':
        return TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? '{Network}';
      case 'settings.privacy.title':
        return TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? '{Privacy}';
      case 'settings.privacy.appLock':
        return TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? '{App lock}';
      case 'settings.privacy.appLockMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ??
            '{Allows to lock the app manually or if left for too long. Requires system lock with PIN or biometrics to be enabled}';
      case 'settings.privacy.autoLockAfter':
        return TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfter', {}) ?? '{Auto lock after}';
      case 'settings.privacy.autoLockAfterTip':
        return TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfterTip', {}) ?? '{in seconds, 0 to disable}';
      case 'settings.privacy.bluronLeave':
        return TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeave', {}) ?? '{Blur screen when leaving the app}';
      case 'settings.privacy.bluronLeaveMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeaveMsg', {}) ??
            '{May not work on some devices due to system limitations}';
      case 'settings.privacy.incognitoKeyboard':
        return TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboard', {}) ?? '{Incognito keyboard}';
      case 'settings.privacy.incognitoKeyboardMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboardMsg', {}) ??
            '{Tells system keyboard to not save your typing history and disable learning based on your input.\nWill be applied to most of text inputs}';
      case 'settings.performance.title':
        return TranslationOverrides.string(_root.$meta, 'settings.performance.title', {}) ?? '{Performance}';
      case 'settings.sync.title':
        return TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? '{LoliSync}';
      case 'settings.sync.dbError':
        return TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ?? '{Database must be enabled to use LoliSync}';
      case 'settings.about.title':
        return TranslationOverrides.string(_root.$meta, 'settings.about.title', {}) ?? '{About}';
      case 'settings.about.appDescription':
        return TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ??
            '{LoliSnatcher is open source and licensed under GPLv3 the source code is available on github. Please report any issues or feature requests in the issues section of the repo.}';
      case 'settings.about.appOnGitHub':
        return TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? '{LoliSnatcher on Github}';
      case 'settings.about.contact':
        return TranslationOverrides.string(_root.$meta, 'settings.about.contact', {}) ?? '{Contact}';
      case 'settings.about.emailCopied':
        return TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? '{Email copied to clipboard!}';
      case 'settings.about.logoArtistThanks':
        return TranslationOverrides.string(_root.$meta, 'settings.about.logoArtistThanks', {}) ??
            '{A big thanks to Showers-U for letting us use their artwork for the app logo. Please check them out on Pixiv}';
      case 'settings.about.developers':
        return TranslationOverrides.string(_root.$meta, 'settings.about.developers', {}) ?? '{Developers}';
      case 'settings.about.releases':
        return TranslationOverrides.string(_root.$meta, 'settings.about.releases', {}) ?? '{Releases}';
      case 'settings.about.releasesMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.about.releasesMsg', {}) ??
            '{Latest version and full changelogs can be found at the Github Releases page:}';
      case 'settings.about.licenses':
        return TranslationOverrides.string(_root.$meta, 'settings.about.licenses', {}) ?? '{Licenses}';
      case 'settings.checkForUpdates.title':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.title', {}) ?? '{Check for updates}';
      case 'settings.checkForUpdates.updateAvailable':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateAvailable', {}) ?? '{Update available!}';
      case 'settings.checkForUpdates.updateChangelog':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? '{Update changelog}';
      case 'settings.checkForUpdates.updateCheckError':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? '{Update check error!}';
      case 'settings.checkForUpdates.youHaveLatestVersion':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? '{You have the latest version!}';
      case 'settings.checkForUpdates.viewLatestChangelog':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ?? '{View latest changelog}';
      case 'settings.checkForUpdates.currentVersion':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? '{Current version}';
      case 'settings.checkForUpdates.changelog':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? '{Changelog}';
      case 'settings.checkForUpdates.visitPlayStore':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? '{Visit Play Store}';
      case 'settings.checkForUpdates.visitReleases':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? '{Visit Releases}';
      case 'settings.logs.title':
        return TranslationOverrides.string(_root.$meta, 'settings.logs.title', {}) ?? '{Logs}';
      case 'settings.logs.shareLogs':
        return TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogs', {}) ?? '{Share logs}';
      case 'settings.logs.shareLogsWarningTitle':
        return TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningTitle', {}) ?? '{Share logs to external app?}';
      case 'settings.logs.shareLogsWarningMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningMsg', {}) ??
            '{[WARNING]: Logs may contain sensitive information, share with caution!}';
      case 'settings.help.title':
        return TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? '{Help}';
      case 'settings.debug.title':
        return TranslationOverrides.string(_root.$meta, 'settings.debug.title', {}) ?? '{Debug}';
      case 'settings.debug.enabledSnackbarMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.debug.enabledSnackbarMsg', {}) ?? '{Debug mode is enabled!}';
      case 'settings.debug.disabledSnackbarMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.debug.disabledSnackbarMsg', {}) ?? '{Debug mode is disabled!}';
      case 'settings.debug.alreadyEnabledSnackbarMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.debug.alreadyEnabledSnackbarMsg', {}) ?? '{Debug mode is already enabled!}';
      case 'settings.debug.openAlice':
        return TranslationOverrides.string(_root.$meta, 'settings.debug.openAlice', {}) ?? '{Open network inspector}';
      case 'settings.debug.openLogger':
        return TranslationOverrides.string(_root.$meta, 'settings.debug.openLogger', {}) ?? '{Open logger}';
      case 'settings.logging.title':
        return TranslationOverrides.string(_root.$meta, 'settings.logging.title', {}) ?? '{Logging}';
      case 'settings.logging.enabledMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.logging.enabledMsg', {}) ?? '{Logging is enabled}';
      case 'settings.logging.enabledLogTypes':
        return TranslationOverrides.string(_root.$meta, 'settings.logging.enabledLogTypes', {}) ?? '{Enabled log types}';
      case 'settings.logging.disableTip':
        return TranslationOverrides.string(_root.$meta, 'settings.logging.disableTip', {}) ?? '{You can disable logging in the debug settings}';
      case 'settings.webview.openWebview':
        return TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? '{Open webview}';
      case 'settings.webview.openWebviewTip':
        return TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? '{to login or obtain cookies}';
      case 'settings.version':
        return TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? '{Version}';
      default:
        return null;
    }
  }
}
