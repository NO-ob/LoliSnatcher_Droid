import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title_settings => 'Settings';

  @override
  String get title_boorusSearch => 'Boorus & Search';

  @override
  String get title_interface => 'Interface';

  @override
  String get title_themes => 'Themes';

  @override
  String get title_gallery => 'Gallery';

  @override
  String get title_snatchingCaching => 'Snatching & Caching';

  @override
  String get title_tagFilters => 'Tag Filters';

  @override
  String get title_database => 'Database';

  @override
  String get title_backupRestore => 'Backup & Restore';

  @override
  String get title_backupRestoreBeta => 'Backup & Restore [BETA]';

  @override
  String get title_network => 'Network';

  @override
  String get title_privacy => 'Privacy';

  @override
  String get title_loliSync => 'LoliSync';

  @override
  String get title_about => 'About';

  @override
  String get title_checkForUpdates => 'Check for Updates';

  @override
  String get title_help => 'Help';

  @override
  String get title_debug => 'Debug';

  @override
  String get snackBar_loliSync_title => 'Error!';

  @override
  String get snackBar_loliSync_body => 'Database must be enabled to use LoliSync';

  @override
  String get snackBar_backupRestore_title_error => 'Error!';

  @override
  String get snackBar_backupRestore_title_success => 'Success!';

  @override
  String get alert_backupRestore_duplicateFile_title => 'Duplicate file detected!';

  @override
  String alert_backupRestore_duplicateFile_body(String fileName) {
    return 'The file $fileName already exists. Do you want to overwrite it? If you choose no, the backup will be cancelled.';
  }

  @override
  String get alert_action_yes => 'Yes';

  @override
  String get alert_action_no => 'No';

  @override
  String get button_yes => 'Yes';

  @override
  String get button_no => 'No';

  @override
  String get backupRestore_featureMessage => 'This feature is only available on Android, on Desktop builds you can just copy/paste files from/to app\'s data folder, respective to your system';

  @override
  String get backupRestore_selectBackupDir => 'Select Backup Directory';

  @override
  String backupRestore_backupPathMessage(String backupPath) {
    return 'Backup path is: $backupPath';
  }

  @override
  String get backupRestore_noBackupDirMessage => 'No backup directory selected';

  @override
  String get backupRestore_restoreInfoMessage => 'Restore will work only if the files are placed in the same directory.';

  @override
  String get backupRestore_backupSettings => 'Backup Settings';

  @override
  String get backupRestore_restoreSettings => 'Restore Settings';

  @override
  String get backupRestore_backupCancelled => 'Backup cancelled!';

  @override
  String get backupRestore_backupFailed => 'Failed to get backup path!';

  @override
  String get backupRestore_backupNoAccess => 'No Access to backup folder!';

  @override
  String get backupRestore_settingsSaved => 'Settings saved to settings.json';

  @override
  String backupRestore_settingsRestoreError(String error) {
    return 'Error while restoring settings! $error';
  }

  @override
  String backupRestore_settingsSaveError(String error) {
    return 'Error while saving settings! $error';
  }

  @override
  String backupRestore_boorusSaveError(String error) {
    return 'Error while saving boorus! $error';
  }

  @override
  String get backupRestore_settingsRestored => 'Settings restored from backup!';

  @override
  String get backupRestore_noRestoreFileFound => 'No Restore File Found!';

  @override
  String get backupRestore_backupBoorus => 'Backup Boorus';

  @override
  String get backupRestore_boorusSavedMessage => 'Boorus saved to boorus.json';

  @override
  String get backupRestore_restoreBoorus => 'Restore Boorus';

  @override
  String get backupRestore_boorusRestoredMessage => 'Boorus restored from backup!';

  @override
  String backupRestore_booruRestoreError(String error) {
    return 'Error while restoring boorus! $error';
  }

  @override
  String get backupRestore_backupTags => 'Backup Tags';

  @override
  String get backupRestore_restoreTags => 'Restore Tags';

  @override
  String get backupRestore_tagsRestoredMessage => 'Tags restored from backup!';

  @override
  String get backupRestore_tagsSavedMessage => 'Tags saved to tags.json';

  @override
  String backupRestore_tagSaveError(String error) {
    return 'Error while saving tags! $error';
  }

  @override
  String backupRestore_tagRestoreError(String error) {
    return 'Error while restoring tags! $error';
  }

  @override
  String get backupRestore_backupDatabase => 'Backup Database';

  @override
  String get backupRestore_restoreDatabase => 'Restore Database';

  @override
  String get backupRestore_databaseSaved => 'Database saved to store.db';

  @override
  String backupRestore_databaseRestoreError(String error) {
    return 'Error while restoring database! $error';
  }

  @override
  String backupRestore_databaseSaveError(String error) {
    return 'Error while saving database! $error';
  }

  @override
  String get backupRestore_databaseRestored => 'Database restored from backup! App will restart in a few seconds!';

  @override
  String get title_booruEditor => 'Booru editor';

  @override
  String get booruEdit_openWebview => 'Open webview to get cookies';

  @override
  String get booruEdit_beta => '[BETA]';

  @override
  String booruEdit_saveBooru(String testRequired) {
    return 'Save Booru $testRequired';
  }

  @override
  String get booruEdit_canBeBlankHint => '(Can be blank)';

  @override
  String get booruEdit_runTestFirst => 'Run Test First!';

  @override
  String get booruEdit_booruNameRequired => 'Booru Name is required!';

  @override
  String get booruEdit_booruUrlRequired => 'Booru URL is required!';

  @override
  String get booruEdit_booruType => 'Booru Type';

  @override
  String booruEdit_apiCreds(String userIDTitle, String apiKeyTitle) {
    return '$userIDTitle and $apiKeyTitle may be needed with some boorus but in most cases aren\'t necessary.';
  }

  @override
  String get booruEdit_testBooru => 'Test Booru';

  @override
  String get booruEdit_testingBooru => 'Testing Booru...';

  @override
  String get booruEdit_nameField => 'Name';

  @override
  String get booruEdit_booruNamePlaceholder => 'Enter Booru Name';

  @override
  String get booruEdit_urlField => 'URL';

  @override
  String get booruEdit_booruUrlPlaceholder => 'Enter Booru URL';

  @override
  String get booruEdit_defaultTags => 'Default Tags';

  @override
  String get booruEdit_defaultTagsHint => 'Default search for booru';

  @override
  String get booruEdit_favicon => 'Favicon';

  @override
  String get booruEdit_faviconHint => '(Autofills if blank)';

  @override
  String get booruEdit_apiKey => 'API Key';

  @override
  String get booruEdit_password => 'Password';

  @override
  String get booruEdit_login => 'Login';

  @override
  String get booruEdit_accessKeyRequested => 'Access Key Requested';

  @override
  String get booruEdit_accessKeyRequestedBody => 'Tap okay on hydrus then apply. You can test afterward';

  @override
  String get booruEdit_failedToGetAccessKey => 'Failed to get access key';

  @override
  String get booruEdit_failedToGetAccessKeyBody => 'Do you have the request window open in hydrus?';

  @override
  String get booruEdit_doYouHaveRequestWindowOpen => 'Do you have the request window open in hydrus?';

  @override
  String get booruEdit_accessKeyWidget_title => 'Get Hydrus Api Key';

  @override
  String get booruEdit_hydrusInstructions => 'To get the Hydrus key you need to open the request dialog in the hydrus client. services > review services > client api > add > from api request';

  @override
  String get booruEdit_noDataReturned => 'No Data Returned';

  @override
  String booruEdit_errorTextPlaceholder(Object error) {
    return 'Error text: \"$error\"';
  }

  @override
  String booruEdit_foundResultsAs(String booruTypeAlias) {
    return 'Found Results as $booruTypeAlias';
  }

  @override
  String booruEdit_booruTypeIs(String booruTypeAlias) {
    return 'Booru Type is $booruTypeAlias';
  }

  @override
  String get booruEdit_tapSaveButton => 'Tap the Save button to save this config';

  @override
  String booruEdit_noDataReturnedBody(String error) {
    return 'Entered Information may be incorrect, booru doesn\'t allow api access or there was a network error. $error';
  }

  @override
  String get booruEdit_existingTabsNeedReload => 'Existing tabs with this Booru need to be reloaded in order to apply changes!';

  @override
  String get booruEdit_booruConfigSaved => 'Booru Config Saved!';

  @override
  String get booruEdit_booruExists => 'This Booru Config already exists';

  @override
  String get booruEdit_booruExistsBody => '...and will not be added';

  @override
  String get booruEdit_booruConfigWithNameExists => 'Booru Config with same name already exists';

  @override
  String get booruEdit_booruConfigWithURLExists => 'Booru Config with same URL already exists';

  @override
  String booruEdit_getApiKey(String booruName) {
    return 'Get $booruName Api Key';
  }

  @override
  String get booruEdit_failedToVerifyApiAccessForHydrus => 'Failed to verify api access for Hydrus';

  @override
  String get booruEdit_savedToStoreDB => 'Database saved to store.db';

  @override
  String booruEdit_errorWhileRestoringDatabase(String error) {
    return 'Error while restoring database! $error';
  }

  @override
  String booruEdit_errorWhileSavingDatabase(String error) {
    return 'Error while saving database! $error';
  }

  @override
  String get booruEdit_databaseRestoredFromBackup => 'Database restored from backup! App will restart in a few seconds!';

  @override
  String booruEdit_errorWhileRestoringBoorus(String error) {
    return 'Error while restoring boorus! $error';
  }

  @override
  String get booruEdit_boorusRestoredMessage => 'Boorus restored from backup!';

  @override
  String booruEdit_errorWhileSavingBoorus(String error) {
    return 'Error while saving boorus! $error';
  }

  @override
  String get booruPage_title => 'Boorus & Search';

  @override
  String get booruPage_addedBoorus => 'Added Boorus';

  @override
  String get booruPage_booru => 'Booru';

  @override
  String get booruPage_booruSelectorHint => 'The Booru selected here will be set as default after saving.\n\nThe default Booru will be first to appear in the dropdown boxes.';

  @override
  String get booruPage_defaultTagsTitle => 'Default Tags';

  @override
  String get booruPage_defaultTagsHint => 'Tags searched when app opens';

  @override
  String get booruPage_itemsPerPageTitle => 'Items per Page';

  @override
  String get booruPage_itemsPerPageHint => 'Items to fetch per page 10-100';

  @override
  String get booruPage_itemsPerPageEmptyValue => 'Please enter a value';

  @override
  String get booruPage_itemsPerPageInvalidValue => 'Please enter a valid value';

  @override
  String get booruPage_itemsPerPageTooSmall => 'Please enter a value bigger than 10';

  @override
  String get booruPage_itemsPerPageTooBig => 'Please enter a value bigger than 10';

  @override
  String get booruPage_addButton => 'Add new Booru config';

  @override
  String get booruPage_shareDialogTitle => 'Share Booru';

  @override
  String booruPage_shareDialogAndroid(String? booruName) {
    return 'Booru Config of $booruName will be converted to a link and share dialog will open\n\nShould login/apikey data be included?';
  }

  @override
  String booruPage_shareDialogOther(String? booruName) {
    return 'Booru Config of $booruName will be converted to a link which will be copied to clipboard\n\nShould login/apikey data be included?';
  }

  @override
  String get booruPage_shareButton => 'Share Booru config';

  @override
  String get booruPage_editButton => 'Edit Booru config';

  @override
  String booruPage_deleteButton(String? booruName) {
    return 'Delete $booruName Booru config';
  }

  @override
  String get booruPage_webviewButton => 'Open webview to get cookies';

  @override
  String get booruPage_importButton => 'Import Booru config from clipboard';

  @override
  String get booruPage_noBooruSelected => 'No Booru Selected!';

  @override
  String get booruPage_booruCannotBeDeleted => 'Can\'t delete this Booru!';

  @override
  String get booruPage_removeTabsFirst => 'Remove all tabs which use it first!';

  @override
  String get booruPage_deleteDialogTitle => 'Are you sure?';

  @override
  String booruPage_deleteDialogBody(String? booruName) {
    return 'Delete Booru: $booruName';
  }

  @override
  String get booruPage_deleteBooru => 'Delete Booru';

  @override
  String get booruPage_invalidUrl => 'Invalid URL!';

  @override
  String get booruPage_onlyLoliSnatcherUrls => 'Only loli.snatcher URLs are supported!';

  @override
  String get booruPage_noTextInClipboard => 'No text in clipboard!';

  @override
  String get booruPage_booruConfigLinkCopied => 'Booru Config Link Copied!';

  @override
  String get booruPage_booruDeleted => 'Booru Deleted!';

  @override
  String get booruPage_errorDuringDeletion => 'Error!';

  @override
  String get booruPage_errorDuringDeletionContent => 'Something went wrong during deletion of a Booru config!';

  @override
  String get booruPage_changeDefaultBooru => 'Change default Booru?';

  @override
  String get booruPage_changeTo => 'Change to: ';

  @override
  String get booruPage_keepCurrentBooru => 'Tap [No] to keep current: ';

  @override
  String get booruPage_changeToNewBooru => 'Tap [Yes] to change to: ';

  @override
  String get booruPage_booruSharingDialogTitle => 'Booru sharing';

  @override
  String get booruPage_booruSharingDialogBodyAndroid => 'How to automatically open Booru config links in the app on Android 12 and higher:\n1) Tap button below to open system app link defaults settings\n2) Tap on \"Add link\" and select all available options';

  @override
  String get booruPage_gotoSettings => 'Go to settings';
}
