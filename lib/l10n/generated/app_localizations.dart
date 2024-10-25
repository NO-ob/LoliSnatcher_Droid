import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// Settings title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get title_settings;

  /// Boorus & Search setting button
  ///
  /// In en, this message translates to:
  /// **'Boorus & Search'**
  String get title_boorusSearch;

  /// Interface setting button
  ///
  /// In en, this message translates to:
  /// **'Interface'**
  String get title_interface;

  /// Themes setting button
  ///
  /// In en, this message translates to:
  /// **'Themes'**
  String get title_themes;

  /// Gallery setting button
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get title_gallery;

  /// Snatching & Caching setting button
  ///
  /// In en, this message translates to:
  /// **'Snatching & Caching'**
  String get title_snatchingCaching;

  /// Tag Filters setting button
  ///
  /// In en, this message translates to:
  /// **'Tag Filters'**
  String get title_tagFilters;

  /// Database setting button
  ///
  /// In en, this message translates to:
  /// **'Database'**
  String get title_database;

  /// Backup & Restore setting button
  ///
  /// In en, this message translates to:
  /// **'Backup & Restore'**
  String get title_backupRestore;

  /// Backup & Restore title
  ///
  /// In en, this message translates to:
  /// **'Backup & Restore [BETA]'**
  String get title_backupRestoreBeta;

  /// Network setting button
  ///
  /// In en, this message translates to:
  /// **'Network'**
  String get title_network;

  /// Privacy setting button (Android only)
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get title_privacy;

  /// LoliSync setting button
  ///
  /// In en, this message translates to:
  /// **'LoliSync'**
  String get title_loliSync;

  /// About setting button
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get title_about;

  /// Check for Updates setting button
  ///
  /// In en, this message translates to:
  /// **'Check for Updates'**
  String get title_checkForUpdates;

  /// Help setting button
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get title_help;

  /// Debug setting button
  ///
  /// In en, this message translates to:
  /// **'Debug'**
  String get title_debug;

  /// Lolisync button error snackbar title
  ///
  /// In en, this message translates to:
  /// **'Error!'**
  String get snackBar_loliSync_title;

  /// Lolisync button error snackbar body
  ///
  /// In en, this message translates to:
  /// **'Database must be enabled to use LoliSync'**
  String get snackBar_loliSync_body;

  /// Backup Restore error snackbar title
  ///
  /// In en, this message translates to:
  /// **'Error!'**
  String get snackBar_backupRestore_title_error;

  /// Backup Restore success snackbar title
  ///
  /// In en, this message translates to:
  /// **'Success!'**
  String get snackBar_backupRestore_title_success;

  /// Backup Restore alert title for duplicate file
  ///
  /// In en, this message translates to:
  /// **'Duplicate file detected!'**
  String get alert_backupRestore_duplicateFile_title;

  /// Backup Restore alert body for duplicate file
  ///
  /// In en, this message translates to:
  /// **'The file {fileName} already exists. Do you want to overwrite it? If you choose no, the backup will be cancelled.'**
  String alert_backupRestore_duplicateFile_body(String fileName);

  /// Yes alert action
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get alert_action_yes;

  /// No alert action
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get alert_action_no;

  /// Yes button text
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get button_yes;

  /// No button text
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get button_no;

  /// Feature message for backup restore page
  ///
  /// In en, this message translates to:
  /// **'This feature is only available on Android, on Desktop builds you can just copy/paste files from/to app\'s data folder, respective to your system'**
  String get backupRestore_featureMessage;

  /// Select backup dir button
  ///
  /// In en, this message translates to:
  /// **'Select Backup Directory'**
  String get backupRestore_selectBackupDir;

  /// Message displaying the backup path
  ///
  /// In en, this message translates to:
  /// **'Backup path is: {backupPath}'**
  String backupRestore_backupPathMessage(String backupPath);

  /// Message indicating no backup directory is selected
  ///
  /// In en, this message translates to:
  /// **'No backup directory selected'**
  String get backupRestore_noBackupDirMessage;

  /// Info message for restore functionality
  ///
  /// In en, this message translates to:
  /// **'Restore will work only if the files are placed in the same directory.'**
  String get backupRestore_restoreInfoMessage;

  /// Backup settings button
  ///
  /// In en, this message translates to:
  /// **'Backup Settings'**
  String get backupRestore_backupSettings;

  /// Restore settings button
  ///
  /// In en, this message translates to:
  /// **'Restore Settings'**
  String get backupRestore_restoreSettings;

  /// Message indicating backup was cancelled
  ///
  /// In en, this message translates to:
  /// **'Backup cancelled!'**
  String get backupRestore_backupCancelled;

  /// Message indicating backup path retrieval failed
  ///
  /// In en, this message translates to:
  /// **'Failed to get backup path!'**
  String get backupRestore_backupFailed;

  /// Message indicating no access to backup folder
  ///
  /// In en, this message translates to:
  /// **'No Access to backup folder!'**
  String get backupRestore_backupNoAccess;

  /// Message indicating settings were saved
  ///
  /// In en, this message translates to:
  /// **'Settings saved to settings.json'**
  String get backupRestore_settingsSaved;

  /// Message indicating error while restoring settings
  ///
  /// In en, this message translates to:
  /// **'Error while restoring settings! {error}'**
  String backupRestore_settingsRestoreError(String error);

  /// Message indicating error while saving settings
  ///
  /// In en, this message translates to:
  /// **'Error while saving settings! {error}'**
  String backupRestore_settingsSaveError(String error);

  /// Message indicating error while saving boorus
  ///
  /// In en, this message translates to:
  /// **'Error while saving boorus! {error}'**
  String backupRestore_boorusSaveError(String error);

  /// Message indicating settings were restored
  ///
  /// In en, this message translates to:
  /// **'Settings restored from backup!'**
  String get backupRestore_settingsRestored;

  /// Message indicating no restore file was found
  ///
  /// In en, this message translates to:
  /// **'No Restore File Found!'**
  String get backupRestore_noRestoreFileFound;

  /// Backup boorus button
  ///
  /// In en, this message translates to:
  /// **'Backup Boorus'**
  String get backupRestore_backupBoorus;

  /// Boorus saved message
  ///
  /// In en, this message translates to:
  /// **'Boorus saved to boorus.json'**
  String get backupRestore_boorusSavedMessage;

  /// Restore boorus button
  ///
  /// In en, this message translates to:
  /// **'Restore Boorus'**
  String get backupRestore_restoreBoorus;

  /// Boorus restored message
  ///
  /// In en, this message translates to:
  /// **'Boorus restored from backup!'**
  String get backupRestore_boorusRestoredMessage;

  /// Message indicating error while restoring boorus
  ///
  /// In en, this message translates to:
  /// **'Error while restoring boorus! {error}'**
  String backupRestore_booruRestoreError(String error);

  /// Backup tags button
  ///
  /// In en, this message translates to:
  /// **'Backup Tags'**
  String get backupRestore_backupTags;

  /// Restore tags button
  ///
  /// In en, this message translates to:
  /// **'Restore Tags'**
  String get backupRestore_restoreTags;

  /// Tags restored message
  ///
  /// In en, this message translates to:
  /// **'Tags restored from backup!'**
  String get backupRestore_tagsRestoredMessage;

  /// No description provided for @backupRestore_tagsSavedMessage.
  ///
  /// In en, this message translates to:
  /// **'Tags saved to tags.json'**
  String get backupRestore_tagsSavedMessage;

  /// Message indicating error while saving tags
  ///
  /// In en, this message translates to:
  /// **'Error while saving tags! {error}'**
  String backupRestore_tagSaveError(String error);

  /// Message indicating error while restoring tags
  ///
  /// In en, this message translates to:
  /// **'Error while restoring tags! {error}'**
  String backupRestore_tagRestoreError(String error);

  /// Backup database button
  ///
  /// In en, this message translates to:
  /// **'Backup Database'**
  String get backupRestore_backupDatabase;

  /// Restore database button
  ///
  /// In en, this message translates to:
  /// **'Restore Database'**
  String get backupRestore_restoreDatabase;

  /// Message indicating database was saved
  ///
  /// In en, this message translates to:
  /// **'Database saved to store.db'**
  String get backupRestore_databaseSaved;

  /// Message indicating error while restoring database
  ///
  /// In en, this message translates to:
  /// **'Error while restoring database! {error}'**
  String backupRestore_databaseRestoreError(String error);

  /// Message indicating error while saving database
  ///
  /// In en, this message translates to:
  /// **'Error while saving database! {error}'**
  String backupRestore_databaseSaveError(String error);

  /// Message indicating database was restored
  ///
  /// In en, this message translates to:
  /// **'Database restored from backup! App will restart in a few seconds!'**
  String get backupRestore_databaseRestored;

  /// Booru editor title
  ///
  /// In en, this message translates to:
  /// **'Booru editor'**
  String get title_booruEditor;

  /// Button text to open webview for getting cookies
  ///
  /// In en, this message translates to:
  /// **'Open webview to get cookies'**
  String get booruEdit_openWebview;

  /// Button subtitle beta
  ///
  /// In en, this message translates to:
  /// **'[BETA]'**
  String get booruEdit_beta;

  /// Button text to save Booru configuration
  ///
  /// In en, this message translates to:
  /// **'Save Booru {testRequired}'**
  String booruEdit_saveBooru(String testRequired);

  /// can be blank hint
  ///
  /// In en, this message translates to:
  /// **'(Can be blank)'**
  String get booruEdit_canBeBlankHint;

  /// Error message indicating user needs to run test before saving
  ///
  /// In en, this message translates to:
  /// **'Run Test First!'**
  String get booruEdit_runTestFirst;

  /// Error message indicating Booru Name field is required
  ///
  /// In en, this message translates to:
  /// **'Booru Name is required!'**
  String get booruEdit_booruNameRequired;

  /// Error message indicating Booru URL field is required
  ///
  /// In en, this message translates to:
  /// **'Booru URL is required!'**
  String get booruEdit_booruUrlRequired;

  /// Label for Booru Type dropdown
  ///
  /// In en, this message translates to:
  /// **'Booru Type'**
  String get booruEdit_booruType;

  /// Info message regarding the need for user ID and API key
  ///
  /// In en, this message translates to:
  /// **'{userIDTitle} and {apiKeyTitle} may be needed with some boorus but in most cases aren\'t necessary.'**
  String booruEdit_apiCreds(String userIDTitle, String apiKeyTitle);

  /// Button text to test Booru configuration
  ///
  /// In en, this message translates to:
  /// **'Test Booru'**
  String get booruEdit_testBooru;

  /// Message indicating Booru testing is in progress
  ///
  /// In en, this message translates to:
  /// **'Testing Booru...'**
  String get booruEdit_testingBooru;

  /// Booru Name input field
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get booruEdit_nameField;

  /// Placeholder text for Booru Name input field
  ///
  /// In en, this message translates to:
  /// **'Enter Booru Name'**
  String get booruEdit_booruNamePlaceholder;

  /// Booru URL input field
  ///
  /// In en, this message translates to:
  /// **'URL'**
  String get booruEdit_urlField;

  /// Placeholder text for Booru URL input field
  ///
  /// In en, this message translates to:
  /// **'Enter Booru URL'**
  String get booruEdit_booruUrlPlaceholder;

  /// Label for Default Tags input field
  ///
  /// In en, this message translates to:
  /// **'Default Tags'**
  String get booruEdit_defaultTags;

  /// Placeholder text for Default Tags input field
  ///
  /// In en, this message translates to:
  /// **'Default search for booru'**
  String get booruEdit_defaultTagsHint;

  /// Label for Favicon input field
  ///
  /// In en, this message translates to:
  /// **'Favicon'**
  String get booruEdit_favicon;

  /// Favicon field hint
  ///
  /// In en, this message translates to:
  /// **'(Autofills if blank)'**
  String get booruEdit_faviconHint;

  /// Label for API Key input field
  ///
  /// In en, this message translates to:
  /// **'API Key'**
  String get booruEdit_apiKey;

  /// Label for Password input field
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get booruEdit_password;

  /// Label for Login input field
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get booruEdit_login;

  /// Snackbar title for Access Key requested message
  ///
  /// In en, this message translates to:
  /// **'Access Key Requested'**
  String get booruEdit_accessKeyRequested;

  /// Snackbar body for Access Key requested message
  ///
  /// In en, this message translates to:
  /// **'Tap okay on hydrus then apply. You can test afterward'**
  String get booruEdit_accessKeyRequestedBody;

  /// Snackbar title for failure to get access key message
  ///
  /// In en, this message translates to:
  /// **'Failed to get access key'**
  String get booruEdit_failedToGetAccessKey;

  /// Snackbar body for failure to get access key message
  ///
  /// In en, this message translates to:
  /// **'Do you have the request window open in hydrus?'**
  String get booruEdit_failedToGetAccessKeyBody;

  /// Content for failure to get access key message
  ///
  /// In en, this message translates to:
  /// **'Do you have the request window open in hydrus?'**
  String get booruEdit_doYouHaveRequestWindowOpen;

  /// Button text for getting Hydrus API Key
  ///
  /// In en, this message translates to:
  /// **'Get Hydrus Api Key'**
  String get booruEdit_accessKeyWidget_title;

  /// Inbstructions for hydrus
  ///
  /// In en, this message translates to:
  /// **'To get the Hydrus key you need to open the request dialog in the hydrus client. services > review services > client api > add > from api request'**
  String get booruEdit_hydrusInstructions;

  /// Error message indicating no data returned from Booru test
  ///
  /// In en, this message translates to:
  /// **'No Data Returned'**
  String get booruEdit_noDataReturned;

  /// Placeholder for error text message
  ///
  /// In en, this message translates to:
  /// **'Error text: \"{error}\"'**
  String booruEdit_errorTextPlaceholder(Object error);

  /// Message indicating Booru test found results
  ///
  /// In en, this message translates to:
  /// **'Found Results as {booruTypeAlias}'**
  String booruEdit_foundResultsAs(String booruTypeAlias);

  /// Snackbar title indicating Booru type
  ///
  /// In en, this message translates to:
  /// **'Booru Type is {booruTypeAlias}'**
  String booruEdit_booruTypeIs(String booruTypeAlias);

  /// Snackbar content indicating action to save configuration
  ///
  /// In en, this message translates to:
  /// **'Tap the Save button to save this config'**
  String get booruEdit_tapSaveButton;

  /// Snackbar content for getting no data from api
  ///
  /// In en, this message translates to:
  /// **'Entered Information may be incorrect, booru doesn\'t allow api access or there was a network error. {error}'**
  String booruEdit_noDataReturnedBody(String error);

  /// Snackbar content indicating existing tabs need to be reloaded
  ///
  /// In en, this message translates to:
  /// **'Existing tabs with this Booru need to be reloaded in order to apply changes!'**
  String get booruEdit_existingTabsNeedReload;

  /// Snackbar title indicating Booru configuration saved
  ///
  /// In en, this message translates to:
  /// **'Booru Config Saved!'**
  String get booruEdit_booruConfigSaved;

  /// Snackbar message indicating Booru configuration already exists
  ///
  /// In en, this message translates to:
  /// **'This Booru Config already exists'**
  String get booruEdit_booruExists;

  /// Snackbar message body for existing booru
  ///
  /// In en, this message translates to:
  /// **'...and will not be added'**
  String get booruEdit_booruExistsBody;

  /// Snackbar message indicating Booru configuration with same name exists
  ///
  /// In en, this message translates to:
  /// **'Booru Config with same name already exists'**
  String get booruEdit_booruConfigWithNameExists;

  /// Snackbar message indicating Booru configuration with same URL exists
  ///
  /// In en, this message translates to:
  /// **'Booru Config with same URL already exists'**
  String get booruEdit_booruConfigWithURLExists;

  /// Button text to get specific Booru API Key
  ///
  /// In en, this message translates to:
  /// **'Get {booruName} Api Key'**
  String booruEdit_getApiKey(String booruName);

  /// Error message indicating failure to verify API access for Hydrus
  ///
  /// In en, this message translates to:
  /// **'Failed to verify api access for Hydrus'**
  String get booruEdit_failedToVerifyApiAccessForHydrus;

  /// Message indicating database was saved to store.db
  ///
  /// In en, this message translates to:
  /// **'Database saved to store.db'**
  String get booruEdit_savedToStoreDB;

  /// Message indicating error while restoring database
  ///
  /// In en, this message translates to:
  /// **'Error while restoring database! {error}'**
  String booruEdit_errorWhileRestoringDatabase(String error);

  /// Message indicating error while saving database
  ///
  /// In en, this message translates to:
  /// **'Error while saving database! {error}'**
  String booruEdit_errorWhileSavingDatabase(String error);

  /// Message indicating database was restored from backup
  ///
  /// In en, this message translates to:
  /// **'Database restored from backup! App will restart in a few seconds!'**
  String get booruEdit_databaseRestoredFromBackup;

  /// Message indicating error while restoring boorus
  ///
  /// In en, this message translates to:
  /// **'Error while restoring boorus! {error}'**
  String booruEdit_errorWhileRestoringBoorus(String error);

  /// Message indicating boorus were restored from backup
  ///
  /// In en, this message translates to:
  /// **'Boorus restored from backup!'**
  String get booruEdit_boorusRestoredMessage;

  /// Message indicating error while saving boorus
  ///
  /// In en, this message translates to:
  /// **'Error while saving boorus! {error}'**
  String booruEdit_errorWhileSavingBoorus(String error);

  /// Title of the Booru page
  ///
  /// In en, this message translates to:
  /// **'Boorus & Search'**
  String get booruPage_title;

  /// Title for booru selector
  ///
  /// In en, this message translates to:
  /// **'Added Boorus'**
  String get booruPage_addedBoorus;

  /// Settings dialog booru title
  ///
  /// In en, this message translates to:
  /// **'Booru'**
  String get booruPage_booru;

  /// Booru selector hint
  ///
  /// In en, this message translates to:
  /// **'The Booru selected here will be set as default after saving.\n\nThe default Booru will be first to appear in the dropdown boxes.'**
  String get booruPage_booruSelectorHint;

  /// Title for the default tags input field
  ///
  /// In en, this message translates to:
  /// **'Default Tags'**
  String get booruPage_defaultTagsTitle;

  /// Hint text for the default tags input field
  ///
  /// In en, this message translates to:
  /// **'Tags searched when app opens'**
  String get booruPage_defaultTagsHint;

  /// Title for the items per page input field
  ///
  /// In en, this message translates to:
  /// **'Items per Page'**
  String get booruPage_itemsPerPageTitle;

  /// Hint text for the items per page input field
  ///
  /// In en, this message translates to:
  /// **'Items to fetch per page 10-100'**
  String get booruPage_itemsPerPageHint;

  /// items per page validation empty
  ///
  /// In en, this message translates to:
  /// **'Please enter a value'**
  String get booruPage_itemsPerPageEmptyValue;

  /// items per page validation invalid
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid value'**
  String get booruPage_itemsPerPageInvalidValue;

  /// items per page validation  smaller than 10
  ///
  /// In en, this message translates to:
  /// **'Please enter a value bigger than 10'**
  String get booruPage_itemsPerPageTooSmall;

  /// items per page validation  bigger than 100
  ///
  /// In en, this message translates to:
  /// **'Please enter a value bigger than 10'**
  String get booruPage_itemsPerPageTooBig;

  /// Button text for adding a new Booru configuration
  ///
  /// In en, this message translates to:
  /// **'Add new Booru config'**
  String get booruPage_addButton;

  /// Share dialog title
  ///
  /// In en, this message translates to:
  /// **'Share Booru'**
  String get booruPage_shareDialogTitle;

  /// Share dialog message for android
  ///
  /// In en, this message translates to:
  /// **'Booru Config of {booruName} will be converted to a link and share dialog will open\n\nShould login/apikey data be included?'**
  String booruPage_shareDialogAndroid(String? booruName);

  /// Share dialog message for android
  ///
  /// In en, this message translates to:
  /// **'Booru Config of {booruName} will be converted to a link which will be copied to clipboard\n\nShould login/apikey data be included?'**
  String booruPage_shareDialogOther(String? booruName);

  /// Button text for sharing a Booru configuration
  ///
  /// In en, this message translates to:
  /// **'Share Booru config'**
  String get booruPage_shareButton;

  /// Button text for editing a Booru configuration
  ///
  /// In en, this message translates to:
  /// **'Edit Booru config'**
  String get booruPage_editButton;

  /// Button text for deleting a Booru configuration
  ///
  /// In en, this message translates to:
  /// **'Delete {booruName} Booru config'**
  String booruPage_deleteButton(String? booruName);

  /// Button text for opening webview to get cookies
  ///
  /// In en, this message translates to:
  /// **'Open webview to get cookies'**
  String get booruPage_webviewButton;

  /// Button text for importing Booru configuration from clipboard
  ///
  /// In en, this message translates to:
  /// **'Import Booru config from clipboard'**
  String get booruPage_importButton;

  /// Snackbar title when no Booru is selected
  ///
  /// In en, this message translates to:
  /// **'No Booru Selected!'**
  String get booruPage_noBooruSelected;

  /// Snackbar title when Booru cannot be deleted
  ///
  /// In en, this message translates to:
  /// **'Can\'t delete this Booru!'**
  String get booruPage_booruCannotBeDeleted;

  /// Snackbar content when trying to delete a Booru that is being used by tabs
  ///
  /// In en, this message translates to:
  /// **'Remove all tabs which use it first!'**
  String get booruPage_removeTabsFirst;

  /// Booru delete dialog title
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get booruPage_deleteDialogTitle;

  /// Booru delete dialog body
  ///
  /// In en, this message translates to:
  /// **'Delete Booru: {booruName}'**
  String booruPage_deleteDialogBody(String? booruName);

  /// Booru delete label
  ///
  /// In en, this message translates to:
  /// **'Delete Booru'**
  String get booruPage_deleteBooru;

  /// Snackbar title for invalid URL
  ///
  /// In en, this message translates to:
  /// **'Invalid URL!'**
  String get booruPage_invalidUrl;

  /// Snackbar content for invalid URLs that are not loli.snatcher
  ///
  /// In en, this message translates to:
  /// **'Only loli.snatcher URLs are supported!'**
  String get booruPage_onlyLoliSnatcherUrls;

  /// Snackbar title when there is no text in clipboard
  ///
  /// In en, this message translates to:
  /// **'No text in clipboard!'**
  String get booruPage_noTextInClipboard;

  /// Snackbar title when Booru config link is copied to clipboard
  ///
  /// In en, this message translates to:
  /// **'Booru Config Link Copied!'**
  String get booruPage_booruConfigLinkCopied;

  /// Snackbar title when a Booru is deleted successfully
  ///
  /// In en, this message translates to:
  /// **'Booru Deleted!'**
  String get booruPage_booruDeleted;

  /// Snackbar title when an error occurs during Booru deletion
  ///
  /// In en, this message translates to:
  /// **'Error!'**
  String get booruPage_errorDuringDeletion;

  /// Snackbar content when an error occurs during Booru deletion
  ///
  /// In en, this message translates to:
  /// **'Something went wrong during deletion of a Booru config!'**
  String get booruPage_errorDuringDeletionContent;

  /// Dialog title for changing default Booru
  ///
  /// In en, this message translates to:
  /// **'Change default Booru?'**
  String get booruPage_changeDefaultBooru;

  /// Dialog content for changing to a new default Booru
  ///
  /// In en, this message translates to:
  /// **'Change to: '**
  String get booruPage_changeTo;

  /// Dialog content for keeping the current default Booru
  ///
  /// In en, this message translates to:
  /// **'Tap [No] to keep current: '**
  String get booruPage_keepCurrentBooru;

  /// Dialog content for changing to the new default Booru
  ///
  /// In en, this message translates to:
  /// **'Tap [Yes] to change to: '**
  String get booruPage_changeToNewBooru;

  /// Booru sharing dialog title
  ///
  /// In en, this message translates to:
  /// **'Booru sharing'**
  String get booruPage_booruSharingDialogTitle;

  /// Booru sharing dialog body for android
  ///
  /// In en, this message translates to:
  /// **'How to automatically open Booru config links in the app on Android 12 and higher:\n1) Tap button below to open system app link defaults settings\n2) Tap on \"Add link\" and select all available options'**
  String get booruPage_booruSharingDialogBodyAndroid;

  /// Booru sharing dialog button to open settings
  ///
  /// In en, this message translates to:
  /// **'Go to settings'**
  String get booruPage_gotoSettings;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
