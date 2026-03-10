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
class TranslationsJaJp extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  /// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
  TranslationsJaJp({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.jaJp,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
    super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <ja-JP>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsJaJp _root = this; // ignore: unused_field

  @override
  TranslationsJaJp $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsJaJp(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'ja-JP';
  @override
  String get localeName => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? '日本語';
  @override
  String get appName => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'エラー';
  @override
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'エラー！';
  @override
  late final _TranslationsSettingsJaJp settings = _TranslationsSettingsJaJp._(_root);
  @override
  String get yes => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'はい';
  @override
  String get no => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'いいえ';
  @override
  String get success => TranslationOverrides.string(_root.$meta, 'success', {}) ?? '成功';
  @override
  String get successExclamation => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? '成功！';
  @override
  String get cancel => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'キャンセル';
  @override
  String get kReturn => TranslationOverrides.string(_root.$meta, 'kReturn', {}) ?? '戻る';
  @override
  String get later => TranslationOverrides.string(_root.$meta, 'later', {}) ?? '後で';
  @override
  String get close => TranslationOverrides.string(_root.$meta, 'close', {}) ?? '閉じる';
  @override
  String get ok => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'OK';
  @override
  String get pleaseWait => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'お待ちください…';
  @override
  String get show => TranslationOverrides.string(_root.$meta, 'show', {}) ?? '見る';
  @override
  String get hide => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? '隠す';
  @override
  String get enable => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? '有効化';
  @override
  String get disable => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? '無効化';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'add', {}) ?? '追加';
  @override
  String get edit => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? '編集';
  @override
  String get remove => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? '削除';
  @override
  String get save => TranslationOverrides.string(_root.$meta, 'save', {}) ?? '保存';
  @override
  String get delete => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? '削除';
  @override
  String get confirm => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? '確認';
  @override
  String get retry => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? '再試行';
  @override
  String get clear => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? 'クリア';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'コピー';
  @override
  String get copied => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'コピー済み';
  @override
  String get copiedToClipboard => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? 'クリップボードにコピー';
  @override
  String get nothingFound => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? '何も見つかりませんでした';
  @override
  String get paste => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? '貼り付け';
  @override
  String get copyErrorText => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'コピーエラー';
  @override
  String get booru => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru';
  @override
  String get goToSettings => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? '設定に移動';
  @override
  String get thisMayTakeSomeTime => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? '少し時間がかかる場合があります…';
  @override
  String get exitTheAppQuestion => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? 'アプリを終了しますか？';
  @override
  String get closeTheApp => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'アプリを閉じる';
  @override
  String get invalidUrl => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? '無効なURLです！';
  @override
  String get clipboardIsEmpty => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'クリップボードが空です！';
  @override
  String get failedToOpenLink => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'リンクを開くことに失敗しました';
  @override
  String get apiKey => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'APIキー';
  @override
  String get userId => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'ユーザーID';
  @override
  String get login => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'ログイン';
  @override
  String get password => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'パスワード';
  @override
  String get pause => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? '一時停止';
  @override
  String get resume => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? '再開';
  @override
  String get discord => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord';
  @override
  String get visitOurDiscord => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Discordサーバーにアクセス';
  @override
  String get item => TranslationOverrides.string(_root.$meta, 'item', {}) ?? '項目';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'select', {}) ?? '選択';
  @override
  String get selectAll => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? '全て選択';
  @override
  String get reset => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'リセット';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'open', {}) ?? '開く';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? '新しいタブで開く';
  @override
  String get move => TranslationOverrides.string(_root.$meta, 'move', {}) ?? '移動';
  @override
  String get shuffle => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? 'シャッフル';
  @override
  String get sort => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? '並び替え';
  @override
  String get go => TranslationOverrides.string(_root.$meta, 'go', {}) ?? '移動';
  @override
  String get search => TranslationOverrides.string(_root.$meta, 'search', {}) ?? '検索';
  @override
  String get filter => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? 'フィルター';
  @override
  String get or => TranslationOverrides.string(_root.$meta, 'or', {}) ?? 'または (~)';
  @override
  String get page => TranslationOverrides.string(_root.$meta, 'page', {}) ?? 'ページ';
  @override
  String get pageNumber => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? 'ページ #';
  @override
  String get tags => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'タグ';
  @override
  String get type => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'タイプ';
  @override
  String get name => TranslationOverrides.string(_root.$meta, 'name', {}) ?? '名前';
  @override
  String get address => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'アドレス';
  @override
  String get username => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'ユーザー名';
  @override
  String get favourites => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'お気に入り';
  @override
  String get downloads => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'ダウンロード';
  @override
  late final _TranslationsValidationErrorsJaJp validationErrors = _TranslationsValidationErrorsJaJp._(_root);
  @override
  late final _TranslationsInitJaJp init = _TranslationsInitJaJp._(_root);
  @override
  late final _TranslationsPermissionsJaJp permissions = _TranslationsPermissionsJaJp._(_root);
  @override
  late final _TranslationsAuthenticationJaJp authentication = _TranslationsAuthenticationJaJp._(_root);
  @override
  late final _TranslationsSearchHandlerJaJp searchHandler = _TranslationsSearchHandlerJaJp._(_root);
  @override
  late final _TranslationsSnatcherJaJp snatcher = _TranslationsSnatcherJaJp._(_root);
  @override
  late final _TranslationsLoliSyncJaJp loliSync = _TranslationsLoliSyncJaJp._(_root);
  @override
  late final _TranslationsDesktopHomeJaJp desktopHome = _TranslationsDesktopHomeJaJp._(_root);
  @override
  late final _TranslationsViewerJaJp viewer = _TranslationsViewerJaJp._(_root);
  @override
  late final _TranslationsGalleryJaJp gallery = _TranslationsGalleryJaJp._(_root);
  @override
  late final _TranslationsGalleryButtonsJaJp galleryButtons = _TranslationsGalleryButtonsJaJp._(_root);
  @override
  late final _TranslationsMultibooruJaJp multibooru = _TranslationsMultibooruJaJp._(_root);
  @override
  late final _TranslationsTabsJaJp tabs = _TranslationsTabsJaJp._(_root);
  @override
  late final _TranslationsHistoryJaJp history = _TranslationsHistoryJaJp._(_root);
  @override
  late final _TranslationsTagsFiltersDialogsJaJp tagsFiltersDialogs = _TranslationsTagsFiltersDialogsJaJp._(_root);
  @override
  late final _TranslationsHydrusJaJp hydrus = _TranslationsHydrusJaJp._(_root);
  @override
  late final _TranslationsWebviewJaJp webview = _TranslationsWebviewJaJp._(_root);
  @override
  late final _TranslationsSearchBarJaJp searchBar = _TranslationsSearchBarJaJp._(_root);
  @override
  late final _TranslationsPreviewJaJp preview = _TranslationsPreviewJaJp._(_root);
  @override
  late final _TranslationsMediaJaJp media = _TranslationsMediaJaJp._(_root);
  @override
  late final _TranslationsPinnedTagsJaJp pinnedTags = _TranslationsPinnedTagsJaJp._(_root);
  @override
  late final _TranslationsMediaPreviewsJaJp mediaPreviews = _TranslationsMediaPreviewsJaJp._(_root);
  @override
  late final _TranslationsTagViewJaJp tagView = _TranslationsTagViewJaJp._(_root);
  @override
  late final _TranslationsTagTypeJaJp tagType = _TranslationsTagTypeJaJp._(_root);
  @override
  late final _TranslationsCommentsJaJp comments = _TranslationsCommentsJaJp._(_root);
  @override
  late final _TranslationsLockscreenJaJp lockscreen = _TranslationsLockscreenJaJp._(_root);
  @override
  late final _TranslationsImageSearchJaJp imageSearch = _TranslationsImageSearchJaJp._(_root);
  @override
  late final _TranslationsMobileHomeJaJp mobileHome = _TranslationsMobileHomeJaJp._(_root);
  @override
  late final _TranslationsPageChangerJaJp pageChanger = _TranslationsPageChangerJaJp._(_root);
  @override
  late final _TranslationsTagsManagerJaJp tagsManager = _TranslationsTagsManagerJaJp._(_root);
  @override
  late final _TranslationsGalleryViewJaJp galleryView = _TranslationsGalleryViewJaJp._(_root);
  @override
  late final _TranslationsCommonJaJp common = _TranslationsCommonJaJp._(_root);
  @override
  late final _TranslationsImageStatsJaJp imageStats = _TranslationsImageStatsJaJp._(_root);
}

// Path: settings
class _TranslationsSettingsJaJp extends TranslationsSettingsEn {
  _TranslationsSettingsJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsSettingsBooruJaJp booru = _TranslationsSettingsBooruJaJp._(_root);
  @override
  late final _TranslationsSettingsInterfaceJaJp interface = _TranslationsSettingsInterfaceJaJp._(_root);
  @override
  late final _TranslationsSettingsThemeJaJp theme = _TranslationsSettingsThemeJaJp._(_root);
  @override
  late final _TranslationsSettingsViewerJaJp viewer = _TranslationsSettingsViewerJaJp._(_root);
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? '設定';
  @override
  late final _TranslationsSettingsLanguageJaJp language = _TranslationsSettingsLanguageJaJp._(_root);
  @override
  late final _TranslationsSettingsDirPickerJaJp dirPicker = _TranslationsSettingsDirPickerJaJp._(_root);
  @override
  late final _TranslationsSettingsBooruEditorJaJp booruEditor = _TranslationsSettingsBooruEditorJaJp._(_root);
  @override
  late final _TranslationsSettingsCacheJaJp cache = _TranslationsSettingsCacheJaJp._(_root);
  @override
  late final _TranslationsSettingsDownloadsJaJp downloads = _TranslationsSettingsDownloadsJaJp._(_root);
  @override
  late final _TranslationsSettingsDatabaseJaJp database = _TranslationsSettingsDatabaseJaJp._(_root);
  @override
  late final _TranslationsSettingsItemFiltersJaJp itemFilters = _TranslationsSettingsItemFiltersJaJp._(_root);
  @override
  late final _TranslationsSettingsSyncJaJp sync = _TranslationsSettingsSyncJaJp._(_root);
  @override
  late final _TranslationsSettingsAboutJaJp about = _TranslationsSettingsAboutJaJp._(_root);
  @override
  late final _TranslationsSettingsNetworkJaJp network = _TranslationsSettingsNetworkJaJp._(_root);
  @override
  late final _TranslationsSettingsWebviewJaJp webview = _TranslationsSettingsWebviewJaJp._(_root);
  @override
  late final _TranslationsSettingsVideoJaJp video = _TranslationsSettingsVideoJaJp._(_root);
  @override
  late final _TranslationsSettingsBackupAndRestoreJaJp backupAndRestore = _TranslationsSettingsBackupAndRestoreJaJp._(_root);
  @override
  late final _TranslationsSettingsPrivacyJaJp privacy = _TranslationsSettingsPrivacyJaJp._(_root);
  @override
  late final _TranslationsSettingsPerformanceJaJp performance = _TranslationsSettingsPerformanceJaJp._(_root);
  @override
  late final _TranslationsSettingsCheckForUpdatesJaJp checkForUpdates = _TranslationsSettingsCheckForUpdatesJaJp._(_root);
  @override
  late final _TranslationsSettingsLogsJaJp logs = _TranslationsSettingsLogsJaJp._(_root);
  @override
  late final _TranslationsSettingsHelpJaJp help = _TranslationsSettingsHelpJaJp._(_root);
  @override
  late final _TranslationsSettingsDebugJaJp debug = _TranslationsSettingsDebugJaJp._(_root);
  @override
  String get version => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? 'バージョン';
  @override
  late final _TranslationsSettingsLoggingJaJp logging = _TranslationsSettingsLoggingJaJp._(_root);
}

// Path: validationErrors
class _TranslationsValidationErrorsJaJp extends TranslationsValidationErrorsEn {
  _TranslationsValidationErrorsJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get required => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? '値を入力';
  @override
  String get invalid => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? '有効な値を入力してください';
  @override
  String get invalidNumber => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? '数字を入力';
  @override
  String get invalidNumericValue => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? '有効な数値を入力してください';
  @override
  String tooSmall({required double min}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? '${min} より大きい値を入力してください';
  @override
  String tooBig({required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? '${max} より小さい値を入力してください';
  @override
  String rangeError({required double min, required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ?? '${min} から ${max} までの値を入力してください';
  @override
  String get greaterThanOrEqualZero => TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? '0 以上の値を入力してください';
  @override
  String get lessThan4 => TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? '4 未満の値を入力してください';
  @override
  String get biggerThan100 => TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? '100 より大きい値を入力してください';
  @override
  String get moreThan4ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ?? '4 列以上を設定するとパフォーマンスに影響を及ぼす可能性があります';
  @override
  String get moreThan8ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ?? '8 列以上を設定するとパフォーマンスに影響を及ぼす可能性があります';
}

// Path: init
class _TranslationsInitJaJp extends TranslationsInitEn {
  _TranslationsInitJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get initError => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? '初期化エラー！';
  @override
  String get settingUpProxy => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'プロキシを設定中…';
  @override
  String get loadingDatabase => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'データベースを読み込み中…';
  @override
  String get loadingBoorus => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Booruを読み込み中…';
  @override
  String get loadingTags => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'タグを読み込み中…';
  @override
  String get restoringTabs => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'タブを復元中…';
}

// Path: permissions
class _TranslationsPermissionsJaJp extends TranslationsPermissionsEn {
  _TranslationsPermissionsJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get noAccessToCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ?? 'カスタムストレージディレクトリにアクセスできません';
  @override
  String get pleaseSetStorageDirectoryAgain =>
      TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ?? 'アプリにアクセスを許可するには、ストレージディレクトリを再度設定する必要があります';
  @override
  String currentPath({required String path}) =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? '現在のパス: ${path}';
  @override
  String get setDirectory => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? 'ディレクトリを設定';
  @override
  String get currentlyNotAvailableForThisPlatform =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ?? 'このプラットフォームでは使用できません';
  @override
  String get resetDirectory => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? 'ディレクトリをリセット';
  @override
  String get afterResetFilesWillBeSavedToDefaultDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ??
      'リセット後、ファイルはデフォルトのディレクトリに保存されるようになります';
}

// Path: authentication
class _TranslationsAuthenticationJaJp extends TranslationsAuthenticationEn {
  _TranslationsAuthenticationJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get pleaseAuthenticateToUseTheApp =>
      TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ?? 'アプリを使用するには認証が必要です';
  @override
  String get noBiometricHardwareAvailable =>
      TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? '生体認証ハードウェアは利用できません';
  @override
  String get temporaryLockout => TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? '一時ロックアウト';
  @override
  String somethingWentWrong({required String error}) =>
      TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ?? '認証中に問題が発生しました: ${error}';
}

// Path: searchHandler
class _TranslationsSearchHandlerJaJp extends TranslationsSearchHandlerEn {
  _TranslationsSearchHandlerJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get removedLastTab => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? '最後のタブを削除しました';
  @override
  String get resettingSearchToDefaultTags =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? 'デフォルトのタグにリセットします';
  @override
  String get uoh => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'うおおおおああああああ';
  @override
  String get ratingsChanged => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? 'レーティングが変更されました';
  @override
  String ratingsChangedMessage({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
      '${booruType} では、 [rating:safe] の代わりに [rating:general] と [rating:sensitive] が使用されるので置き換えられました';
  @override
  String get appFixedRatingAutomatically =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ?? 'レーティングは自動で修正されました。今後は正しいレーティングを使用して検索してみてください';
  @override
  String get tabsRestored => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? 'タブを復元';
  @override
  String restoredTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
        count,
        one: '以前のセッションから${count}個のタブを復元しました',
        few: '以前のセッションから${count}個のタブを復元しました',
        many: '以前のセッションから${count}個のタブを復元しました',
        other: '以前のセッションから${count}個のタブを復元しました',
      );
  @override
  String get someRestoredTabsHadIssues =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ?? '復元されたタブには、不明なBooruや壊れた文字が含まれているものがありました。';
  @override
  String get theyWereSetToDefaultOrIgnored =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ?? 'これらはデフォルト値に設定されたか、無視されました。';
  @override
  String get listOfBrokenTabs => TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? '壊れたタブのリスト:';
  @override
  String get tabsMerged => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? 'タブが結合されました';
  @override
  String addedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
        count,
        one: '${count}個の新しいタブを追加',
        few: '${count}個の新しいタブを追加',
        many: '${count}個の新しいタブを追加',
        other: '${count}個の新しいタブを追加',
      );
  @override
  String get tabsReplaced => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? 'タブを置き換えました';
  @override
  String receivedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
        count,
        one: '${count}個のタブを受け取りました',
        few: '${count}個のタブを受け取りました',
        many: '${count}個のタブを受け取りました',
        other: '${count}個のタブを受け取りました',
      );
}

// Path: snatcher
class _TranslationsSnatcherJaJp extends TranslationsSnatcherEn {
  _TranslationsSnatcherJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'ダウンローダー';
  @override
  String get snatchingHistory => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'ダウンロード履歴';
  @override
  String get enterTags => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'タグを入力';
  @override
  String get amount => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? '数';
  @override
  String get amountOfFilesToSnatch => TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? 'ダウンロードするファイル数';
  @override
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? '間隔 (ms)';
  @override
  String get delayBetweenEachDownload => TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? 'ダウンロードごとの間隔';
  @override
  String get snatchFiles => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? 'ファイルをまとめてダウンロード';
  @override
  String get itemWasAlreadySnatched => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? 'アイテムはすでに保存済みです';
  @override
  String get failedToSnatchItem => TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? 'ダウンロードに失敗';
  @override
  String get itemWasCancelled => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? 'アイテムはキャンセルされました';
  @override
  String get startingNextQueueItem => TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? '次のキューを開始中…';
  @override
  String get itemsSnatched => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? 'ダウンロード完了';
  @override
  String snatchedCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
        count,
        one: 'ダウンロード済み: ${count}個',
        few: 'ダウンロード済み: ${count}個',
        many: 'ダウンロード済み: ${count}個',
        other: 'ダウンロード済み: ${count}個',
      );
  @override
  String filesAlreadySnatched({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
        count,
        one: '${count} 個のファイルがすでに保存済みです',
        few: '${count} 個のファイルがすでに保存済みです',
        many: '${count} 個のファイルがすでに保存済みです',
        other: '${count} 個のファイルがすでに保存済みです',
      );
  @override
  String failedToSnatchFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
        count,
        one: '${count} 個のファイルの保存に失敗',
        few: '${count} 個のファイルの保存に失敗',
        many: '${count} 個のファイルの保存に失敗',
        other: '${count} 個のファイルの保存に失敗',
      );
  @override
  String cancelledFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
        count,
        one: '${count} 個のファイルがキャンセルされました',
        few: '${count} 個のファイルがキャンセルされました',
        many: '${count} 個のファイルがキャンセルされました',
        other: '${count} 個のファイルがキャンセルされました',
      );
  @override
  String get snatchingImages => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? '画像を保存中';
  @override
  String get doNotCloseApp => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? 'アプリを終了しないでください！';
  @override
  String get addedItemToQueue => TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? 'ダウンロードキューに追加';
  @override
  String addedItemsToQueue({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
        count,
        one: '${count} 個のアイテムをキューに追加しました',
        few: '${count} 個のアイテムをキューに追加しました',
        many: '${count} 個のアイテムをキューに追加しました',
        other: '${count} 個のアイテムをキューに追加しました',
      );
}

// Path: loliSync
class _TranslationsLoliSyncJaJp extends TranslationsLoliSyncEn {
  _TranslationsLoliSyncJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'loliSync.title', {}) ?? 'LoliSync';
  @override
  String get stopSyncingQuestion => TranslationOverrides.string(_root.$meta, 'loliSync.stopSyncingQuestion', {}) ?? '同期を停止しますか？';
  @override
  String get stopServerQuestion => TranslationOverrides.string(_root.$meta, 'loliSync.stopServerQuestion', {}) ?? 'サーバーを停止しますか？';
  @override
  String get waitingForConnection => TranslationOverrides.string(_root.$meta, 'loliSync.waitingForConnection', {}) ?? '接続を待機中…';
  @override
  String get startingServer => TranslationOverrides.string(_root.$meta, 'loliSync.startingServer', {}) ?? 'サーバーの開始…';
  @override
  String get keepScreenAwake => TranslationOverrides.string(_root.$meta, 'loliSync.keepScreenAwake', {}) ?? 'スクリーンを点灯したままにする';
  @override
  String get serverKilled => TranslationOverrides.string(_root.$meta, 'loliSync.serverKilled', {}) ?? 'LoliSync サーバーを終了';
  @override
  String testError({required int statusCode, required String reasonPhrase}) =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testError', {'statusCode': statusCode, 'reasonPhrase': reasonPhrase}) ??
      'テスト時エラー: ${statusCode} ${reasonPhrase}';
  @override
  String testErrorException({required String error}) =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testErrorException', {'error': error}) ?? 'テスト時エラー: ${error}';
  @override
  String get testSuccess => TranslationOverrides.string(_root.$meta, 'loliSync.testSuccess', {}) ?? 'テストリクエストは正常な返答を受け取りました';
  @override
  String get testSuccessMessage =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testSuccessMessage', {}) ?? '先のデバイスに \'Test\' というメッセージが表示されるはずです';
  @override
  String get noConnection => TranslationOverrides.string(_root.$meta, 'loliSync.noConnection', {}) ?? '接続なし';
}

// Path: desktopHome
class _TranslationsDesktopHomeJaJp extends TranslationsDesktopHomeEn {
  _TranslationsDesktopHomeJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get snatcher => TranslationOverrides.string(_root.$meta, 'desktopHome.snatcher', {}) ?? 'ダウンローダー';
  @override
  String get addBoorusInSettings => TranslationOverrides.string(_root.$meta, 'desktopHome.addBoorusInSettings', {}) ?? '設定からBooruを追加';
  @override
  String get settings => TranslationOverrides.string(_root.$meta, 'desktopHome.settings', {}) ?? '設定';
  @override
  String get save => TranslationOverrides.string(_root.$meta, 'desktopHome.save', {}) ?? '保存';
  @override
  String get noItemsSelected => TranslationOverrides.string(_root.$meta, 'desktopHome.noItemsSelected', {}) ?? 'アイテムは選択されていません';
}

// Path: viewer
class _TranslationsViewerJaJp extends TranslationsViewerEn {
  _TranslationsViewerJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsViewerAppBarJaJp appBar = _TranslationsViewerAppBarJaJp._(_root);
  @override
  late final _TranslationsViewerNotesJaJp notes = _TranslationsViewerNotesJaJp._(_root);
  @override
  late final _TranslationsViewerTutorialJaJp tutorial = _TranslationsViewerTutorialJaJp._(_root);
}

// Path: gallery
class _TranslationsGalleryJaJp extends TranslationsGalleryEn {
  _TranslationsGalleryJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get snatchQuestion => TranslationOverrides.string(_root.$meta, 'gallery.snatchQuestion', {}) ?? 'ダウンロードしますか？';
  @override
  String get noPostUrl => TranslationOverrides.string(_root.$meta, 'gallery.noPostUrl', {}) ?? '投稿URLがありません！';
  @override
  String get loadingFile => TranslationOverrides.string(_root.$meta, 'gallery.loadingFile', {}) ?? 'ファイルの読み込み中…';
  @override
  String get loadingFileMessage => TranslationOverrides.string(_root.$meta, 'gallery.loadingFileMessage', {}) ?? 'これには少し時間がかかる場合があります。お待ちください…';
  @override
  String sources({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'gallery.sources', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
        count,
        one: 'ソース',
        other: 'ソース',
      );
}

// Path: galleryButtons
class _TranslationsGalleryButtonsJaJp extends TranslationsGalleryButtonsEn {
  _TranslationsGalleryButtonsJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get snatch => TranslationOverrides.string(_root.$meta, 'galleryButtons.snatch', {}) ?? 'ダウンロード';
  @override
  String get favourite => TranslationOverrides.string(_root.$meta, 'galleryButtons.favourite', {}) ?? 'お気に入り';
  @override
  String get info => TranslationOverrides.string(_root.$meta, 'galleryButtons.info', {}) ?? '情報';
  @override
  String get share => TranslationOverrides.string(_root.$meta, 'galleryButtons.share', {}) ?? '共有';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'galleryButtons.select', {}) ?? '選択';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'galleryButtons.open', {}) ?? 'ブラウザで開く';
  @override
  String get slideshow => TranslationOverrides.string(_root.$meta, 'galleryButtons.slideshow', {}) ?? 'スライドショー';
  @override
  String get reloadNoScale => TranslationOverrides.string(_root.$meta, 'galleryButtons.reloadNoScale', {}) ?? 'スケーリングの切り替え';
  @override
  String get toggleQuality => TranslationOverrides.string(_root.$meta, 'galleryButtons.toggleQuality', {}) ?? '画質の切り替え';
  @override
  String get externalPlayer => TranslationOverrides.string(_root.$meta, 'galleryButtons.externalPlayer', {}) ?? '外部プレイヤー';
  @override
  String get imageSearch => TranslationOverrides.string(_root.$meta, 'galleryButtons.imageSearch', {}) ?? '画像検索';
}

// Path: multibooru
class _TranslationsMultibooruJaJp extends TranslationsMultibooruEn {
  _TranslationsMultibooruJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get multibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Multibooruモード';
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? 'Multibooru';
  @override
  String get selectSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? '追加するbooruを選択:';
  @override
  String get akaMultibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? '別名をMultibooruモード';
  @override
  String get labelSecondaryBoorusToInclude =>
      TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? '追加のBooruを含める';
  @override
  String get multibooruRequiresAtLeastTwoBoorus =>
      TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ?? '少なくとも2つのBooruが設定されている必要があります';
}

// Path: tabs
class _TranslationsTabsJaJp extends TranslationsTabsEn {
  _TranslationsTabsJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsTabsFiltersJaJp filters = _TranslationsTabsFiltersJaJp._(_root);
  @override
  String get secondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? '追加のBooru';
  @override
  String get addSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? '追加のBooruを追加';
  @override
  String get keepSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? '追加のBooruを保持';
  @override
  String get empty => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '[未指定]';
  @override
  String get tab => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? 'タブ';
  @override
  String get addBoorusInSettings => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? '設定でBooruを追加';
  @override
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? 'Booruを選択';
  @override
  String get addNewTab => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? '新しいタブを追加';
  @override
  String get selectABooruOrLeaveEmpty => TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? 'Booruを選択するか空のままにしておく';
  @override
  String get addPosition => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? 'ポジションを追加';
  @override
  String get addModePrevTab => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? '以前のタブ';
  @override
  String get addModeNextTab => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? '次のタブ';
  @override
  String get addModeListEnd => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? 'リストの最後';
  @override
  String get usedQuery => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? '使用されたクエリ';
  @override
  String get queryModeDefault => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? 'デフォルト';
  @override
  String get queryModeCurrent => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? '現在';
  @override
  String get queryModeCustom => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? 'カスタム';
  @override
  String get customQuery => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? 'カスタムクエリ';
  @override
  String get startFromCustomPageNumber => TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? '特定のページ番号から開始';
  @override
  String get switchToNewTab => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? '新しいタブに移動';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? '追加';
  @override
  String get tabsManager => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? 'タブマネージャー';
  @override
  String get selectMode => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? 'モードの変更';
  @override
  String get sortMode => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? 'タブをソート';
  @override
  String get help => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? 'ヘルプ';
  @override
  String get deleteTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? 'タブを削除';
  @override
  String get shuffleTabs => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? 'タブをシャッフル';
  @override
  String get tabRandomlyShuffled => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? 'タブはシャッフルされました';
  @override
  String get tabOrderSaved => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? 'タブの順番を保存しました';
  @override
  String get scrollToCurrent => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? '現在のタブまで移動';
  @override
  String get scrollToTop => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? '一番上に移動';
  @override
  String get scrollToBottom => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? '一番下に移動';
  @override
  String get filterTabsByBooru => TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? 'Booru, 状態, 重複をフィルター…';
  @override
  String get scrolling => TranslationOverrides.string(_root.$meta, 'tabs.scrolling', {}) ?? 'リストのスクロール:';
  @override
  String get sorting => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? '並び替え:';
  @override
  String get defaultTabsOrder => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? '自分の設定';
  @override
  String get sortAlphabetically => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? 'アルファベット (昇順)';
  @override
  String get sortAlphabeticallyReversed => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? 'アルファベット (降順)';
  @override
  String get sortByBooruName => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? 'Booru名のアルファベット順 (昇順)';
  @override
  String get sortByBooruNameReversed => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ?? 'Booru名のアルファベット順 (降順)';
  @override
  String get longPressSortToSave => TranslationOverrides.string(_root.$meta, 'tabs.longPressSortToSave', {}) ?? '長押しで現在の並びを保存';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? '選択:';
  @override
  String get toggleSelectMode => TranslationOverrides.string(_root.$meta, 'tabs.toggleSelectMode', {}) ?? '選択モードの切り替え';
  @override
  String get onTheBottomOfPage => TranslationOverrides.string(_root.$meta, 'tabs.onTheBottomOfPage', {}) ?? 'メニュー下のボタン: ';
  @override
  String get selectDeselectAll => TranslationOverrides.string(_root.$meta, 'tabs.selectDeselectAll', {}) ?? 'すべて選択/解除';
  @override
  String get deleteSelectedTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? '選択したタブをすべて削除';
  @override
  String get longPressToMove => TranslationOverrides.string(_root.$meta, 'tabs.longPressToMove', {}) ?? 'タブを長押しして移動';
  @override
  String get numbersInBottomRight => TranslationOverrides.string(_root.$meta, 'tabs.numbersInBottomRight', {}) ?? 'タブの右下に表示される数字:';
  @override
  String get firstNumberTabIndex => TranslationOverrides.string(_root.$meta, 'tabs.firstNumberTabIndex', {}) ?? '最初の数字: 自分の並びでのタブ番号';
  @override
  String get secondNumberTabIndex =>
      TranslationOverrides.string(_root.$meta, 'tabs.secondNumberTabIndex', {}) ?? '2つ目の数字: 現在の並びでのタブの順番 フィルター/並び替え時に表示されます';
  @override
  String get specialFilters => TranslationOverrides.string(_root.$meta, 'tabs.specialFilters', {}) ?? '特殊なフィルター:';
  @override
  String get loadedFilter => TranslationOverrides.string(_root.$meta, 'tabs.loadedFilter', {}) ?? '«ロード済み» - 項目がすでにロードされているタブを表示';
  @override
  String get notLoadedFilter => TranslationOverrides.string(_root.$meta, 'tabs.notLoadedFilter', {}) ?? '«未ロード» - ロードされていない、またはアイテムが見つからないタブを表示';
  @override
  String get notLoadedItalic => TranslationOverrides.string(_root.$meta, 'tabs.notLoadedItalic', {}) ?? '読み込まれていないタブは斜体で表示されます:';
  @override
  String get noTabsFound => TranslationOverrides.string(_root.$meta, 'tabs.noTabsFound', {}) ?? 'タブが見つかりませんでした';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tabs.copy', {}) ?? 'コピー';
  @override
  String get moveAction => TranslationOverrides.string(_root.$meta, 'tabs.moveAction', {}) ?? '移動';
  @override
  String get remove => TranslationOverrides.string(_root.$meta, 'tabs.remove', {}) ?? '削除';
  @override
  String get shuffle => TranslationOverrides.string(_root.$meta, 'tabs.shuffle', {}) ?? 'シャッフル';
  @override
  String get sort => TranslationOverrides.string(_root.$meta, 'tabs.sort', {}) ?? '並び替え';
  @override
  String get shuffleTabsQuestion => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabsQuestion', {}) ?? 'タブをランダムにシャッフルしますか？';
  @override
  String get saveTabsInCurrentOrder => TranslationOverrides.string(_root.$meta, 'tabs.saveTabsInCurrentOrder', {}) ?? 'タブを現在の並びで確定しますか？';
  @override
  String get byBooru => TranslationOverrides.string(_root.$meta, 'tabs.byBooru', {}) ?? 'By booru';
  @override
  String get alphabetically => TranslationOverrides.string(_root.$meta, 'tabs.alphabetically', {}) ?? 'アルファベット順';
  @override
  String get reversed => TranslationOverrides.string(_root.$meta, 'tabs.reversed', {}) ?? '(降順)';
  @override
  String areYouSureDeleteTabs({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'tabs.areYouSureDeleteTabs', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
        count,
        one: '${count} 個のタブを削除してよろしいですか？',
        few: '${count} 個のタブを削除してよろしいですか？',
        many: '${count} 個のタブを削除してよろしいですか？',
        other: '${count} 個のタブを削除してよろしいですか？',
      );
  @override
  late final _TranslationsTabsMoveJaJp move = _TranslationsTabsMoveJaJp._(_root);
}

// Path: history
class _TranslationsHistoryJaJp extends TranslationsHistoryEn {
  _TranslationsHistoryJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get searchHistoryIsEmpty => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsEmpty', {}) ?? '検索履歴は空です';
  @override
  String get searchHistory => TranslationOverrides.string(_root.$meta, 'history.searchHistory', {}) ?? '検索履歴';
  @override
  String get searchHistoryIsDisabled => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsDisabled', {}) ?? '検索履歴は無効です';
  @override
  String get searchHistoryRequiresDatabase =>
      TranslationOverrides.string(_root.$meta, 'history.searchHistoryRequiresDatabase', {}) ?? '設定で検索履歴のデータベースを有効化';
  @override
  String lastSearch({required String search}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearch', {'search': search}) ?? '最後の検索: ${search}';
  @override
  String lastSearchWithDate({required String date}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearchWithDate', {'date': date}) ?? '最後の検索日: ${date}';
  @override
  String get unknownBooruType => TranslationOverrides.string(_root.$meta, 'history.unknownBooruType', {}) ?? '不明なBooruタイプです！';
  @override
  String unknownBooru({required String name, required String type}) =>
      TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ?? '不明なBooru (${name}-${type})';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? '開く';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? '新しいタブで開く';
  @override
  String get removeFromFavourites => TranslationOverrides.string(_root.$meta, 'history.removeFromFavourites', {}) ?? 'お気に入りから削除';
  @override
  String get setAsFavourite => TranslationOverrides.string(_root.$meta, 'history.setAsFavourite', {}) ?? 'お気に入りとして設定';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'history.copy', {}) ?? 'コピー';
  @override
  String get delete => TranslationOverrides.string(_root.$meta, 'history.delete', {}) ?? '削除';
  @override
  String get deleteHistoryEntries => TranslationOverrides.string(_root.$meta, 'history.deleteHistoryEntries', {}) ?? '履歴エントリーを削除';
  @override
  String deleteItemsConfirm({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'history.deleteItemsConfirm', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
        count,
        one: '${count} 個のアイテムを削除してよろしいですか？',
        few: '${count} 個のアイテムを削除してよろしいですか？',
        many: '${count} 個のアイテムを削除してよろしいですか？',
        other: '${count} 個のアイテムを削除してよろしいですか？',
      );
  @override
  String get clearSelection => TranslationOverrides.string(_root.$meta, 'history.clearSelection', {}) ?? '選択を解除';
  @override
  String deleteItems({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'history.deleteItems', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
        count,
        one: '${count} 個のアイテムを削除',
        few: '${count} 個のアイテムを削除',
        many: '${count} 個のアイテムを削除',
        other: '${count} 個のアイテムを削除',
      );
}

// Path: tagsFiltersDialogs
class _TranslationsTagsFiltersDialogsJaJp extends TranslationsTagsFiltersDialogsEn {
  _TranslationsTagsFiltersDialogsJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get emptyInput => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.emptyInput', {}) ?? '空の入力！';
  @override
  String addNewFilter({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.addNewFilter', {'type': type}) ?? '[${type} フィルターに新規追加]';
  @override
  String newTagFilter({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newTagFilter', {'type': type}) ?? '新規 ${type} タグフィルター';
  @override
  String get newFilter => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newFilter', {}) ?? '追加するフィルター';
  @override
  String get editFilter => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.editFilter', {}) ?? 'フィルターの編集';
}

// Path: hydrus
class _TranslationsHydrusJaJp extends TranslationsHydrusEn {
  _TranslationsHydrusJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get importError => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'Hydrusのインポート中に問題が発生しました';
  @override
  String get apiPermissionsRequired =>
      TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ??
      '正しいAPI権限を付与していない可能性があります。これは、Services > Review Servicesで編集できます';
  @override
  String get addTagsToFile => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? 'タグをファイルに追加';
  @override
  String get addUrls => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'URLを追加';
}

// Path: webview
class _TranslationsWebviewJaJp extends TranslationsWebviewEn {
  _TranslationsWebviewJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'webview.title', {}) ?? 'Webview';
  @override
  String get notSupportedOnDevice => TranslationOverrides.string(_root.$meta, 'webview.notSupportedOnDevice', {}) ?? 'このデバイスではサポートされていません';
  @override
  late final _TranslationsWebviewNavigationJaJp navigation = _TranslationsWebviewNavigationJaJp._(_root);
}

// Path: searchBar
class _TranslationsSearchBarJaJp extends TranslationsSearchBarEn {
  _TranslationsSearchBarJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get searchForTags => TranslationOverrides.string(_root.$meta, 'searchBar.searchForTags', {}) ?? 'タグを検索';
  @override
  String get tagSuggestionsNotAvailable =>
      TranslationOverrides.string(_root.$meta, 'searchBar.tagSuggestionsNotAvailable', {}) ?? 'このBooruではタグ候補を利用できません';
  @override
  String failedToLoadSuggestions({required String msg}) =>
      TranslationOverrides.string(_root.$meta, 'searchBar.failedToLoadSuggestions', {'msg': msg}) ?? '候補が見つかりませんでした。タップして再試行 ${msg}';
  @override
  String get noSuggestionsFound => TranslationOverrides.string(_root.$meta, 'searchBar.noSuggestionsFound', {}) ?? '候補が見つかりませんでした';
  @override
  String copiedTagToClipboard({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'searchBar.copiedTagToClipboard', {'tag': tag}) ?? 'タグ «${tag}» をクリップボードにコピーしました';
  @override
  String get prefix => TranslationOverrides.string(_root.$meta, 'searchBar.prefix', {}) ?? 'プレフィックス';
  @override
  String get exclude => TranslationOverrides.string(_root.$meta, 'searchBar.exclude', {}) ?? '除外 (—)';
  @override
  String get booruNumberPrefix => TranslationOverrides.string(_root.$meta, 'searchBar.booruNumberPrefix', {}) ?? 'Booru (N#)';
  @override
  String get metatags => TranslationOverrides.string(_root.$meta, 'searchBar.metatags', {}) ?? 'メタタグ';
  @override
  String get freeMetatags => TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatags', {}) ?? 'フリーのメタタグ';
  @override
  String get freeMetatagsDescription =>
      TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatagsDescription', {}) ?? 'Free のつくメタタグはタグ検索制限にカウントされません';
  @override
  String get free => TranslationOverrides.string(_root.$meta, 'searchBar.free', {}) ?? 'Free';
  @override
  String get single => TranslationOverrides.string(_root.$meta, 'searchBar.single', {}) ?? '1日';
  @override
  String get range => TranslationOverrides.string(_root.$meta, 'searchBar.range', {}) ?? '範囲';
  @override
  String get popular => TranslationOverrides.string(_root.$meta, 'searchBar.popular', {}) ?? '人気';
  @override
  String get selectDate => TranslationOverrides.string(_root.$meta, 'searchBar.selectDate', {}) ?? '日付を選択';
  @override
  String get selectDatesRange => TranslationOverrides.string(_root.$meta, 'searchBar.selectDatesRange', {}) ?? '日付の範囲を選択';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'searchBar.history', {}) ?? '履歴';
  @override
  String get more => TranslationOverrides.string(_root.$meta, 'searchBar.more', {}) ?? '…';
}

// Path: preview
class _TranslationsPreviewJaJp extends TranslationsPreviewEn {
  _TranslationsPreviewJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsPreviewErrorJaJp error = _TranslationsPreviewErrorJaJp._(_root);
}

// Path: media
class _TranslationsMediaJaJp extends TranslationsMediaEn {
  _TranslationsMediaJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsMediaLoadingJaJp loading = _TranslationsMediaLoadingJaJp._(_root);
  @override
  late final _TranslationsMediaVideoJaJp video = _TranslationsMediaVideoJaJp._(_root);
}

// Path: pinnedTags
class _TranslationsPinnedTagsJaJp extends TranslationsPinnedTagsEn {
  _TranslationsPinnedTagsJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get pinnedTags => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedTags', {}) ?? 'ピン留めされたタグ';
  @override
  String get pinTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinTag', {}) ?? 'タグをピン留め';
  @override
  String get unpinTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinTag', {}) ?? 'タグのピン留めを解除';
  @override
  String get pin => TranslationOverrides.string(_root.$meta, 'pinnedTags.pin', {}) ?? 'ピン留め';
  @override
  String get unpin => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpin', {}) ?? 'ピン留め解除';
  @override
  String pinQuestion({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinQuestion', {'tag': tag}) ?? '«${tag}» をクイックアクセスにピン留めしますか？';
  @override
  String unpinQuestion({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinQuestion', {'tag': tag}) ?? '«${tag}» をピン留めされたタグから解除しますか？';
  @override
  String onlyForBooru({required String name}) => TranslationOverrides.string(_root.$meta, 'pinnedTags.onlyForBooru', {'name': name}) ?? '${name} のみで';
  @override
  String get labelsOptional => TranslationOverrides.string(_root.$meta, 'pinnedTags.labelsOptional', {}) ?? 'ラベル (オプション)';
  @override
  String get typeAndPressAdd => TranslationOverrides.string(_root.$meta, 'pinnedTags.typeAndPressAdd', {}) ?? '入力して追加ボタンを押してラベルを追加';
  @override
  String get selectExistingLabel => TranslationOverrides.string(_root.$meta, 'pinnedTags.selectExistingLabel', {}) ?? '既存のラベルを選択';
  @override
  String get tagPinned => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagPinned', {}) ?? 'ピン留め完了';
  @override
  String pinnedForBooru({required String name, required String labels}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedForBooru', {'name': name, 'labels': labels}) ?? '${name} にピン留めしました ${labels}';
  @override
  String pinnedGloballyWithLabels({required String labels}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedGloballyWithLabels', {'labels': labels}) ?? '${labels} 全てにピン留めしました';
  @override
  String get tagUnpinned => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagUnpinned', {}) ?? 'ピン留め解除';
  @override
  String get all => TranslationOverrides.string(_root.$meta, 'pinnedTags.all', {}) ?? 'すべて';
  @override
  String get reorderPinnedTags => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorderPinnedTags', {}) ?? 'ピン留めタグの並び替え';
  @override
  String get saving => TranslationOverrides.string(_root.$meta, 'pinnedTags.saving', {}) ?? '保存中…';
  @override
  String get reorder => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorder', {}) ?? '並び替え';
  @override
  String get addTagManually => TranslationOverrides.string(_root.$meta, 'pinnedTags.addTagManually', {}) ?? 'タグを手動で追加';
  @override
  String get noTagsMatchSearch => TranslationOverrides.string(_root.$meta, 'pinnedTags.noTagsMatchSearch', {}) ?? '検索に一致するピン留めタグは見つかりません';
  @override
  String get noPinnedTagsYet => TranslationOverrides.string(_root.$meta, 'pinnedTags.noPinnedTagsYet', {}) ?? 'タグはピン留めされていません';
  @override
  String get editLabels => TranslationOverrides.string(_root.$meta, 'pinnedTags.editLabels', {}) ?? 'ラベルを編集';
  @override
  String get labels => TranslationOverrides.string(_root.$meta, 'pinnedTags.labels', {}) ?? 'ラベル';
  @override
  String get addPinnedTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.addPinnedTag', {}) ?? 'ピン留めタグを追加';
  @override
  String get tagQuery => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQuery', {}) ?? 'タグクエリ';
  @override
  String get tagQueryHint => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQueryHint', {}) ?? 'tag_name';
  @override
  String get rawQueryHelp => TranslationOverrides.string(_root.$meta, 'pinnedTags.rawQueryHelp', {}) ?? '複数のタグを含むどんな検索クエリでも入力できます';
}

// Path: mediaPreviews
class _TranslationsMediaPreviewsJaJp extends TranslationsMediaPreviewsEn {
  _TranslationsMediaPreviewsJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get noBooruConfigsFound => TranslationOverrides.string(_root.$meta, 'mediaPreviews.noBooruConfigsFound', {}) ?? 'Booruの設定が追加されていません';
  @override
  String get addNewBooru => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? 'Booruを新規追加';
  @override
  String get help => TranslationOverrides.string(_root.$meta, 'mediaPreviews.help', {}) ?? 'ヘルプ (英語)';
  @override
  String get settings => TranslationOverrides.string(_root.$meta, 'mediaPreviews.settings', {}) ?? '設定';
  @override
  String get restoringPreviousSession => TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoringPreviousSession', {}) ?? '以前のセッションを復元中…';
  @override
  String get copiedFileURL => TranslationOverrides.string(_root.$meta, 'mediaPreviews.copiedFileURL', {}) ?? 'ファイルURLをクリップボードにコピーしました！';
}

// Path: tagView
class _TranslationsTagViewJaJp extends TranslationsTagViewEn {
  _TranslationsTagViewJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get tags => TranslationOverrides.string(_root.$meta, 'tagView.tags', {}) ?? 'タグ';
  @override
  String get comments => TranslationOverrides.string(_root.$meta, 'tagView.comments', {}) ?? 'コメント';
  @override
  String showNotes({required int count}) => TranslationOverrides.string(_root.$meta, 'tagView.showNotes', {'count': count}) ?? 'ノートを表示 (${count})';
  @override
  String hideNotes({required int count}) => TranslationOverrides.string(_root.$meta, 'tagView.hideNotes', {'count': count}) ?? 'ノートを隠す (${count})';
  @override
  String get loadNotes => TranslationOverrides.string(_root.$meta, 'tagView.loadNotes', {}) ?? 'ノートを読み込み';
  @override
  String get thisTagAlreadyInSearch => TranslationOverrides.string(_root.$meta, 'tagView.thisTagAlreadyInSearch', {}) ?? 'このタグは既に現在の検索に含まれています:';
  @override
  String get addedToCurrentSearch => TranslationOverrides.string(_root.$meta, 'tagView.addedToCurrentSearch', {}) ?? '現在の検索クエリに追加されました:';
  @override
  String get addedNewTab => TranslationOverrides.string(_root.$meta, 'tagView.addedNewTab', {}) ?? '新規タブに追加:';
  @override
  String get id => TranslationOverrides.string(_root.$meta, 'tagView.id', {}) ?? 'ID';
  @override
  String get postURL => TranslationOverrides.string(_root.$meta, 'tagView.postURL', {}) ?? '投稿URL';
  @override
  String get posted => TranslationOverrides.string(_root.$meta, 'tagView.posted', {}) ?? '投稿日時';
  @override
  String get details => TranslationOverrides.string(_root.$meta, 'tagView.details', {}) ?? '詳細';
  @override
  String get filename => TranslationOverrides.string(_root.$meta, 'tagView.filename', {}) ?? 'ファイル名';
  @override
  String get url => TranslationOverrides.string(_root.$meta, 'tagView.url', {}) ?? 'コンテンツURL';
  @override
  String get extension => TranslationOverrides.string(_root.$meta, 'tagView.extension', {}) ?? '拡張子';
  @override
  String get resolution => TranslationOverrides.string(_root.$meta, 'tagView.resolution', {}) ?? '解像度';
  @override
  String get size => TranslationOverrides.string(_root.$meta, 'tagView.size', {}) ?? 'サイズ';
  @override
  String get md5 => TranslationOverrides.string(_root.$meta, 'tagView.md5', {}) ?? 'MD5';
  @override
  String get rating => TranslationOverrides.string(_root.$meta, 'tagView.rating', {}) ?? 'レーティング';
  @override
  String get score => TranslationOverrides.string(_root.$meta, 'tagView.score', {}) ?? '評価';
  @override
  String get noTagsFound => TranslationOverrides.string(_root.$meta, 'tagView.noTagsFound', {}) ?? 'タグが見つかりませんでした';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tagView.copy', {}) ?? 'コピー';
  @override
  String get removeFromSearch => TranslationOverrides.string(_root.$meta, 'tagView.removeFromSearch', {}) ?? '現在の検索から削除';
  @override
  String get addToSearch => TranslationOverrides.string(_root.$meta, 'tagView.addToSearch', {}) ?? '検索に追加';
  @override
  String get addedToSearchBar => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBar', {}) ?? '検索バーに追加:';
  @override
  String get addToSearchExclude => TranslationOverrides.string(_root.$meta, 'tagView.addToSearchExclude', {}) ?? '現在の検索に追加 (除外)';
  @override
  String get addedToSearchBarExclude => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBarExclude', {}) ?? '除外として検索バーに追加:';
  @override
  String get addToMarked => TranslationOverrides.string(_root.$meta, 'tagView.addToMarked', {}) ?? 'お気に入りタグに追加';
  @override
  String get addToHidden => TranslationOverrides.string(_root.$meta, 'tagView.addToHidden', {}) ?? '非表示タグに追加';
  @override
  String get removeFromMarked => TranslationOverrides.string(_root.$meta, 'tagView.removeFromMarked', {}) ?? 'お気に入りタグから削除';
  @override
  String get removeFromHidden => TranslationOverrides.string(_root.$meta, 'tagView.removeFromHidden', {}) ?? '非表示タグから削除';
  @override
  String get editTag => TranslationOverrides.string(_root.$meta, 'tagView.editTag', {}) ?? 'タグを編集';
  @override
  String get sourceDialogTitle => TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogTitle', {}) ?? 'ソース';
  @override
  String get preview => TranslationOverrides.string(_root.$meta, 'tagView.preview', {}) ?? 'プレビュー';
  @override
  String get selectBooruToLoad => TranslationOverrides.string(_root.$meta, 'tagView.selectBooruToLoad', {}) ?? '読み込むBooruを選択';
  @override
  String get previewIsLoading => TranslationOverrides.string(_root.$meta, 'tagView.previewIsLoading', {}) ?? 'プレビュー読み込み中…';
  @override
  String get failedToLoadPreview => TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreview', {}) ?? 'プレビューの読み込みに失敗しました';
  @override
  String get tapToTryAgain => TranslationOverrides.string(_root.$meta, 'tagView.tapToTryAgain', {}) ?? 'タップして再試行';
  @override
  String get copiedFileURL => TranslationOverrides.string(_root.$meta, 'tagView.copiedFileURL', {}) ?? 'ファイルのURLをクリップボードにコピーしました';
  @override
  String get tagPreviews => TranslationOverrides.string(_root.$meta, 'tagView.tagPreviews', {}) ?? 'タグプレビュー';
  @override
  String get currentState => TranslationOverrides.string(_root.$meta, 'tagView.currentState', {}) ?? '現在の状態';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'tagView.history', {}) ?? '履歴';
  @override
  String get failedToLoadPreviewPage => TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreviewPage', {}) ?? 'プレビューページの読み込みに失敗';
  @override
  String get tryAgain => TranslationOverrides.string(_root.$meta, 'tagView.tryAgain', {}) ?? '再試行';
  @override
  String get detectedLinks => TranslationOverrides.string(_root.$meta, 'tagView.detectedLinks', {}) ?? '見つかったリンク:';
  @override
  String get relatedTabs => TranslationOverrides.string(_root.$meta, 'tagView.relatedTabs', {}) ?? '関連タブ';
  @override
  String get tabsWithOnlyTag => TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTag', {}) ?? 'このタグのみのタブ';
  @override
  String get tabsWithOnlyTagDifferentBooru =>
      TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTagDifferentBooru', {}) ?? 'このタグのみで、違うBooruのタブ';
  @override
  String get tabsContainingTag => TranslationOverrides.string(_root.$meta, 'tagView.tabsContainingTag', {}) ?? 'このタグを含むタブ';
}

// Path: tagType
class _TranslationsTagTypeJaJp extends TranslationsTagTypeEn {
  _TranslationsTagTypeJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get artist => TranslationOverrides.string(_root.$meta, 'tagType.artist', {}) ?? 'アーティスト';
  @override
  String get character => TranslationOverrides.string(_root.$meta, 'tagType.character', {}) ?? 'キャラクター';
  @override
  String get copyright => TranslationOverrides.string(_root.$meta, 'tagType.copyright', {}) ?? 'コピーライト / シリーズ';
  @override
  String get meta => TranslationOverrides.string(_root.$meta, 'tagType.meta', {}) ?? 'メタ';
  @override
  String get species => TranslationOverrides.string(_root.$meta, 'tagType.species', {}) ?? '種';
  @override
  String get none => TranslationOverrides.string(_root.$meta, 'tagType.none', {}) ?? 'なし/一般';
}

// Path: comments
class _TranslationsCommentsJaJp extends TranslationsCommentsEn {
  _TranslationsCommentsJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'comments.title', {}) ?? 'コメント';
  @override
  String get noComments => TranslationOverrides.string(_root.$meta, 'comments.noComments', {}) ?? 'コメントなし';
  @override
  String get noBooruAPIForComments =>
      TranslationOverrides.string(_root.$meta, 'comments.noBooruAPIForComments', {}) ?? 'このBooruにはコメントかコメント用のAPIがありません';
}

// Path: lockscreen
class _TranslationsLockscreenJaJp extends TranslationsLockscreenEn {
  _TranslationsLockscreenJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get testingMessage =>
      TranslationOverrides.string(_root.$meta, 'lockscreen.testingMessage', {}) ??
      '[TESTING]: 通常の方法でアプリのロックを解除できない場合はこのボタンを押してください。デバイスの詳細を開発者に報告してください。';
  @override
  String get tapToAuthenticate => TranslationOverrides.string(_root.$meta, 'lockscreen.tapToAuthenticate', {}) ?? 'タップして認証';
  @override
  String get devUnlock => TranslationOverrides.string(_root.$meta, 'lockscreen.devUnlock', {}) ?? 'DEV UNLOCK';
}

// Path: imageSearch
class _TranslationsImageSearchJaJp extends TranslationsImageSearchEn {
  _TranslationsImageSearchJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'imageSearch.title', {}) ?? '画像検索';
}

// Path: mobileHome
class _TranslationsMobileHomeJaJp extends TranslationsMobileHomeEn {
  _TranslationsMobileHomeJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get lockApp => TranslationOverrides.string(_root.$meta, 'mobileHome.lockApp', {}) ?? 'アプリをロック';
  @override
  String get cancelledByUser => TranslationOverrides.string(_root.$meta, 'mobileHome.cancelledByUser', {}) ?? 'ユーザーによるキャンセル';
  @override
  String get saveAnyway => TranslationOverrides.string(_root.$meta, 'mobileHome.saveAnyway', {}) ?? 'とにかく保存';
  @override
  String get skip => TranslationOverrides.string(_root.$meta, 'mobileHome.skip', {}) ?? 'スキップ';
  @override
  String get failedToDownload => TranslationOverrides.string(_root.$meta, 'mobileHome.failedToDownload', {}) ?? 'ダウンロード失敗';
  @override
  String get fileAlreadyExists => TranslationOverrides.string(_root.$meta, 'mobileHome.fileAlreadyExists', {}) ?? 'ファイルはすでに存在します';
  @override
  String retryAll({required int count}) => TranslationOverrides.string(_root.$meta, 'mobileHome.retryAll', {'count': count}) ?? 'すべて再試行 (${count})';
  @override
  String get selectBooruForWebview => TranslationOverrides.string(_root.$meta, 'mobileHome.selectBooruForWebview', {}) ?? 'WebviewでBooruを選択';
  @override
  String get existingFailedOrCancelledItems =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.existingFailedOrCancelledItems', {}) ?? '既に存在、失敗またはキャンセルされたアイテム';
  @override
  String get clearAllRetryableItems => TranslationOverrides.string(_root.$meta, 'mobileHome.clearAllRetryableItems', {}) ?? 'すべてクリア';
}

// Path: pageChanger
class _TranslationsPageChangerJaJp extends TranslationsPageChangerEn {
  _TranslationsPageChangerJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'pageChanger.title', {}) ?? 'ページスイッチャー';
  @override
  String get pageLabel => TranslationOverrides.string(_root.$meta, 'pageChanger.pageLabel', {}) ?? 'ページ #';
  @override
  String get delayBetweenLoadings => TranslationOverrides.string(_root.$meta, 'pageChanger.delayBetweenLoadings', {}) ?? '読み込み間隔 (ms)';
  @override
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'pageChanger.delayInMs', {}) ?? '間隔 (ms)';
  @override
  String currentPage({required int number}) =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.currentPage', {'number': number}) ?? '現在のベージ: #${number}';
  @override
  String possibleMaxPage({required int number}) =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.possibleMaxPage', {'number': number}) ?? '最大可能ページ: #~${number}';
  @override
  String get searchCurrentlyRunning => TranslationOverrides.string(_root.$meta, 'pageChanger.searchCurrentlyRunning', {}) ?? '検索が進行中です！';
  @override
  String get jumpToPage => TranslationOverrides.string(_root.$meta, 'pageChanger.jumpToPage', {}) ?? '指定ページへジャンプ';
  @override
  String get searchUntilPage => TranslationOverrides.string(_root.$meta, 'pageChanger.searchUntilPage', {}) ?? '指定ページまで読み込み';
  @override
  String get stopSearching => TranslationOverrides.string(_root.$meta, 'pageChanger.stopSearching', {}) ?? '検索の停止';
}

// Path: tagsManager
class _TranslationsTagsManagerJaJp extends TranslationsTagsManagerEn {
  _TranslationsTagsManagerJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'tagsManager.title', {}) ?? 'すべてのタグ';
  @override
  String get addTag => TranslationOverrides.string(_root.$meta, 'tagsManager.addTag', {}) ?? 'タグの追加';
  @override
  String get name => TranslationOverrides.string(_root.$meta, 'tagsManager.name', {}) ?? '名前';
  @override
  String get type => TranslationOverrides.string(_root.$meta, 'tagsManager.type', {}) ?? 'タイプ';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'tagsManager.add', {}) ?? '追加';
  @override
  String get addedATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addedATab', {}) ?? 'タブを追加しました';
  @override
  String get addATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addATab', {}) ?? 'タブに追加';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tagsManager.copy', {}) ?? 'コピー';
  @override
  String get setStale => TranslationOverrides.string(_root.$meta, 'tagsManager.setStale', {}) ?? 'レガシー状態にする';
  @override
  String get resetStale => TranslationOverrides.string(_root.$meta, 'tagsManager.resetStale', {}) ?? '期限をリセット';
  @override
  String staleAfter({required String staleText}) =>
      TranslationOverrides.string(_root.$meta, 'tagsManager.staleAfter', {'staleText': staleText}) ?? '${staleText} にレガシー化';
  @override
  String get makeUnstaleable => TranslationOverrides.string(_root.$meta, 'tagsManager.makeUnstaleable', {}) ?? 'レガシー化を無効にする';
  @override
  String deleteTags({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'tagsManager.deleteTags', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
        count,
        one: '${count} 個のタグを削除',
        few: '${count} 個のタグを削除',
        many: '${count} 個のタグを削除',
        other: '${count} 個のタグを削除',
      );
  @override
  String get deleteTagsTitle => TranslationOverrides.string(_root.$meta, 'tagsManager.deleteTagsTitle', {}) ?? 'タグの削除';
  @override
  String get clearSelection => TranslationOverrides.string(_root.$meta, 'tagsManager.clearSelection', {}) ?? '選択をクリア';
}

// Path: galleryView
class _TranslationsGalleryViewJaJp extends TranslationsGalleryViewEn {
  _TranslationsGalleryViewJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get noItemSelected => TranslationOverrides.string(_root.$meta, 'galleryView.noItemSelected', {}) ?? 'アイテムは選択されていません';
  @override
  String get noItems => TranslationOverrides.string(_root.$meta, 'galleryView.noItems', {}) ?? 'アイテムなし';
  @override
  String get close => TranslationOverrides.string(_root.$meta, 'galleryView.close', {}) ?? '閉じる';
}

// Path: common
class _TranslationsCommonJaJp extends TranslationsCommonEn {
  _TranslationsCommonJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'common.selectABooru', {}) ?? 'Booruを選択';
  @override
  String get booruItemCopiedToClipboard =>
      TranslationOverrides.string(_root.$meta, 'common.booruItemCopiedToClipboard', {}) ?? 'Booruアイテムがクリップボードにコピーされました';
}

// Path: imageStats
class _TranslationsImageStatsJaJp extends TranslationsImageStatsEn {
  _TranslationsImageStatsJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String live({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.live', {'count': count}) ?? 'アクティブ: ${count}';
  @override
  String pending({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.pending', {'count': count}) ?? '保留中: ${count}';
  @override
  String total({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.total', {'count': count}) ?? '合計: ${count}';
  @override
  String size({required String size}) => TranslationOverrides.string(_root.$meta, 'imageStats.size', {'size': size}) ?? 'サイズ: ${size}';
  @override
  String max({required String max}) => TranslationOverrides.string(_root.$meta, 'imageStats.max', {'max': max}) ?? '最大: ${max}';
}

// Path: settings.booru
class _TranslationsSettingsBooruJaJp extends TranslationsSettingsBooruEn {
  _TranslationsSettingsBooruJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Booru & 検索';
  @override
  String get defaultTags => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? 'デフォルトのタグ';
  @override
  String get itemsPerPage => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'ページごとに取得される項目数';
  @override
  String get itemsPerPageTip => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'いくつかのbooruでは設定が無視される場合があります';
  @override
  String get itemsPerPagePlaceholder => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPagePlaceholder', {}) ?? '10-100';
  @override
  String get addBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Booruを追加';
  @override
  String get shareBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? 'Booruとその設定を共有';
  @override
  String shareBooruDialogMsgMobile({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
      '${booruName} とそのサイトの設定が共有されます。\n\nログインやAPIキーなどの認証情報を含めますか？';
  @override
  String shareBooruDialogMsgDesktop({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
      '${booruName} 設定リンクをクリップボードにコピーします。\n\nログインやAPIキーなどの認証情報を含めますか？';
  @override
  String get booruSharing => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? 'Booruの共有';
  @override
  String get addedBoorus => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? 'Booruリスト';
  @override
  String get editBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? 'Booruの設定を編集';
  @override
  String get importBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? 'クリップボードからBooru設定をインポート';
  @override
  String get onlyLSURLsSupported =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ?? 'loli.snatcher URLのみがサポートされています';
  @override
  String get deleteBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? 'Booruの設定を削除';
  @override
  String get deleteBooruError => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ?? 'Booruの設定削除中に問題が発生しました！';
  @override
  String get booruDeleted => TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? 'Booruの設定が削除されました';
  @override
  String get booruDropdownInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ??
      '選択されたBooruは設定保存後、デフォルトになります。\n\nデフォルトのBooruはドロップダウンメニューの最初に表示されます';
  @override
  String get changeDefaultBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? 'デフォルトのBooruを変更しますか？';
  @override
  String get changeTo => TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? 'このBooruに変更: ';
  @override
  String get keepCurrentBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? '[いいえ] をタップ: ';
  @override
  String get changeToNewBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? '[はい] をタップすると: ';
  @override
  String get booruConfigLinkCopied =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ?? 'Booruの設定リンクがクリップボードにコピーされました';
  @override
  String get noBooruSelected => TranslationOverrides.string(_root.$meta, 'settings.booru.noBooruSelected', {}) ?? 'Booruが未選択です！';
  @override
  String get cantDeleteThisBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? 'このBooruは削除できません！';
  @override
  String get removeRelatedTabsFirst => TranslationOverrides.string(_root.$meta, 'settings.booru.removeRelatedTabsFirst', {}) ?? '関連するタブを先に削除してください';
  @override
  String get booruSharingMsgAndroid =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ??
      'Android 12 以降のアプリで Booru設定リンクを自動的に開く方法:\n1) 下のボタンをタップして、アプリの デフォルトで開く 設定を開きます\n2) «リンクを追加» をタップし、利用可能なすべてのオプションを選択します';
}

// Path: settings.interface
class _TranslationsSettingsInterfaceJaJp extends TranslationsSettingsInterfaceEn {
  _TranslationsSettingsInterfaceJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? 'インターフェース';
  @override
  String get appUIMode => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIMode', {}) ?? 'アプリUIモード';
  @override
  String get appUIModeWarningTitle => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarningTitle', {}) ?? 'アプリUIモード';
  @override
  String get appUIModeWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarning', {}) ?? 'デスクトップモードを使用しますか？モバイルでは問題が発生する可能性があり、非推奨です。';
  @override
  String get appUIModeHelpMobile => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpMobile', {}) ?? '- モバイル - 標準のモバイル用UI';
  @override
  String get appUIModeHelpDesktop =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpDesktop', {}) ?? '- デスクトップ - Ahoviewer スタイルのUI [非推奨！再設計が必要です]';
  @override
  String get appUIModeHelpWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpWarning', {}) ??
      '[警告]: 携帯電話でUIモードをデスクトップに設定しないでください。アプリが壊れて、Booru設定を含むすべての設定を消去しなければならない可能性があります。';
  @override
  String get handSide => TranslationOverrides.string(_root.$meta, 'settings.interface.handSide', {}) ?? '利き手';
  @override
  String get handSideHelp => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideHelp', {}) ?? 'UIの位置を選択した側に調整します';
  @override
  String get showSearchBarInPreviewGrid =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.showSearchBarInPreviewGrid', {}) ?? 'プレビューグリッドに検索バーを表示';
  @override
  String get moveInputToTopInSearchView =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.moveInputToTopInSearchView', {}) ?? '検索時に検索バーを一番上に移動';
  @override
  String get searchViewQuickActionsPanel =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewQuickActionsPanel', {}) ?? '検索時にクイックアクションパネルを表示';
  @override
  String get searchViewInputAutofocus =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewInputAutofocus', {}) ?? '検索時に自動的に入力欄にフォーカス';
  @override
  String get disableVibration => TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibration', {}) ?? '振動を無効化';
  @override
  String get disableVibrationSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibrationSubtitle', {}) ?? '無効にしても一部のアクションで振動が発生する可能性があります';
  @override
  String get usePredictiveBack => TranslationOverrides.string(_root.$meta, 'settings.interface.usePredictiveBack', {}) ?? 'スワイプキャンセルアニメーション';
  @override
  String get previewColumnsPortrait => TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsPortrait', {}) ?? 'プレビュー列数 (縦)';
  @override
  String get previewColumnsLandscape => TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsLandscape', {}) ?? 'プレビュー列数 (横)';
  @override
  String get previewQuality => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQuality', {}) ?? 'プレビュー品質';
  @override
  String get previewQualityHelp => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelp', {}) ?? 'プレビューグリッドの画像解像度を指定します';
  @override
  String get previewQualityHelpSample =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpSample', {}) ?? ' - サンプル - 中解像度。アプリは、サムネイル品質もプレースホルダーとして読み込みます';
  @override
  String get previewQualityHelpThumbnail =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpThumbnail', {}) ?? ' - サムネイル - 低解像度';
  @override
  late final _TranslationsSettingsInterfacePreviewQualityValuesJaJp previewQualityValues = _TranslationsSettingsInterfacePreviewQualityValuesJaJp._(
    _root,
  );
  @override
  String get previewQualityHelpNote =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpNote', {}) ??
      '[注意]: サンプル品質ではパフォーマンスが著しく低下する場合があります。特にプレビューグリッドに列が多すぎる場合に顕著です';
  @override
  String get previewDisplay => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplay', {}) ?? 'プレビュー表示方法';
  @override
  String get previewDisplayFallback => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallback', {}) ?? 'プレビュー表示のフォールバック';
  @override
  String get previewDisplayFallbackHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallbackHelp', {}) ?? 'これは、適応型オプションが使用できない場合に使用されます';
  @override
  late final _TranslationsSettingsInterfacePreviewDisplayModeValuesJaJp previewDisplayModeValues =
      _TranslationsSettingsInterfacePreviewDisplayModeValuesJaJp._(_root);
  @override
  String get dontScaleImages => TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImages', {}) ?? '画像のスケーリングを行わない';
  @override
  String get dontScaleImagesSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesSubtitle', {}) ?? 'パフォーマンスに影響する可能性があります';
  @override
  String get dontScaleImagesWarningTitle => TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningTitle', {}) ?? '注意';
  @override
  String get dontScaleImagesWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarning', {}) ?? '画像のスケーリングを無効にしてよろしいですか？';
  @override
  String get dontScaleImagesWarningMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningMsg', {}) ?? '特に古いデバイスでは、パフォーマンスに悪影響を及ぼす可能性があります';
  @override
  String get gifThumbnails => TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnails', {}) ?? 'GIFサムネイル';
  @override
  String get gifThumbnailsRequires =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnailsRequires', {}) ?? '«画像のスケーリングを行わない» が必要です';
  @override
  String get scrollPreviewsButtonsPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.scrollPreviewsButtonsPosition', {}) ?? 'スクロールプレビューボタンの位置';
  @override
  String get mouseWheelScrollModifier =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.mouseWheelScrollModifier', {}) ?? 'マウスホイールのスクロール乗数';
  @override
  String get scrollModifier => TranslationOverrides.string(_root.$meta, 'settings.interface.scrollModifier', {}) ?? 'スクロール乗数';
  @override
  late final _TranslationsSettingsInterfaceAppModeValuesJaJp appModeValues = _TranslationsSettingsInterfaceAppModeValuesJaJp._(_root);
  @override
  late final _TranslationsSettingsInterfaceHandSideValuesJaJp handSideValues = _TranslationsSettingsInterfaceHandSideValuesJaJp._(_root);
}

// Path: settings.theme
class _TranslationsSettingsThemeJaJp extends TranslationsSettingsThemeEn {
  _TranslationsSettingsThemeJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? 'テーマ';
  @override
  String get themeMode => TranslationOverrides.string(_root.$meta, 'settings.theme.themeMode', {}) ?? 'テーマモード';
  @override
  String get blackBg => TranslationOverrides.string(_root.$meta, 'settings.theme.blackBg', {}) ?? '黒の背景';
  @override
  String get useDynamicColor => TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? 'ダイナミックカラーを使用';
  @override
  String get android12PlusOnly => TranslationOverrides.string(_root.$meta, 'settings.theme.android12PlusOnly', {}) ?? 'Android 12+ が必要';
  @override
  String get theme => TranslationOverrides.string(_root.$meta, 'settings.theme.theme', {}) ?? 'テーマ';
  @override
  String get primaryColor => TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? 'プライマリカラー';
  @override
  String get secondaryColor => TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? 'セカンダリカラー';
  @override
  String get enableDrawerMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.enableDrawerMascot', {}) ?? 'ドロワーマスコットを有効化';
  @override
  String get setCustomMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.setCustomMascot', {}) ?? 'カスタムマスコットを指定';
  @override
  String get removeCustomMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? 'カスタムマスコットを削除';
  @override
  String get currentMascotPath => TranslationOverrides.string(_root.$meta, 'settings.theme.currentMascotPath', {}) ?? '現在のマスコットのパス';
  @override
  String get system => TranslationOverrides.string(_root.$meta, 'settings.theme.system', {}) ?? 'システム';
  @override
  String get light => TranslationOverrides.string(_root.$meta, 'settings.theme.light', {}) ?? 'ライトテーマ';
  @override
  String get dark => TranslationOverrides.string(_root.$meta, 'settings.theme.dark', {}) ?? 'ダークテーマ';
  @override
  String get pink => TranslationOverrides.string(_root.$meta, 'settings.theme.pink', {}) ?? 'ピンク';
  @override
  String get purple => TranslationOverrides.string(_root.$meta, 'settings.theme.purple', {}) ?? 'パープル';
  @override
  String get blue => TranslationOverrides.string(_root.$meta, 'settings.theme.blue', {}) ?? 'ブルー';
  @override
  String get teal => TranslationOverrides.string(_root.$meta, 'settings.theme.teal', {}) ?? '鴨の羽色';
  @override
  String get red => TranslationOverrides.string(_root.$meta, 'settings.theme.red', {}) ?? 'レッド';
  @override
  String get green => TranslationOverrides.string(_root.$meta, 'settings.theme.green', {}) ?? 'グリーン';
  @override
  String get halloween => TranslationOverrides.string(_root.$meta, 'settings.theme.halloween', {}) ?? 'ハロウィン';
  @override
  String get custom => TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? 'カスタム';
  @override
  String get selectColor => TranslationOverrides.string(_root.$meta, 'settings.theme.selectColor', {}) ?? '色の選択';
  @override
  String get selectedColor => TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColor', {}) ?? '選択済みの色';
  @override
  String get selectedColorAndShades => TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColorAndShades', {}) ?? '選択済みの色の色合い';
  @override
  String get fontFamily => TranslationOverrides.string(_root.$meta, 'settings.theme.fontFamily', {}) ?? 'フォント';
  @override
  String get systemDefault => TranslationOverrides.string(_root.$meta, 'settings.theme.systemDefault', {}) ?? 'システムのデフォルト';
  @override
  String get viewMoreFonts => TranslationOverrides.string(_root.$meta, 'settings.theme.viewMoreFonts', {}) ?? 'さらに見る';
  @override
  String get fontPreviewText =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.fontPreviewText', {}) ??
      'あのイーハトーヴォのすきとおった風、夏でも底に冷たさをもつ青いそら、うつくしい森で飾られたモリーオ市、郊外のぎらぎらひかる草の波。';
  @override
  String get customFont => TranslationOverrides.string(_root.$meta, 'settings.theme.customFont', {}) ?? 'カスタムフォント';
  @override
  String get customFontSubtitle => TranslationOverrides.string(_root.$meta, 'settings.theme.customFontSubtitle', {}) ?? 'Google Fontから';
  @override
  String get fontName => TranslationOverrides.string(_root.$meta, 'settings.theme.fontName', {}) ?? 'フォント名';
  @override
  String get customFontHint => TranslationOverrides.string(_root.$meta, 'settings.theme.customFontHint', {}) ?? 'fonts.google.com でフォントを閲覧';
  @override
  String get fontNotFound => TranslationOverrides.string(_root.$meta, 'settings.theme.fontNotFound', {}) ?? 'フォントが見つかりません';
}

// Path: settings.viewer
class _TranslationsSettingsViewerJaJp extends TranslationsSettingsViewerEn {
  _TranslationsSettingsViewerJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? 'ビューアー';
  @override
  late final _TranslationsSettingsViewerShareActionValuesJaJp shareActionValues = _TranslationsSettingsViewerShareActionValuesJaJp._(_root);
  @override
  late final _TranslationsSettingsViewerImageQualityValuesJaJp imageQualityValues = _TranslationsSettingsViewerImageQualityValuesJaJp._(_root);
  @override
  String get kannaLoadingGif => TranslationOverrides.string(_root.$meta, 'settings.viewer.kannaLoadingGif', {}) ?? '読み込み時にカンナのGIFを表示';
  @override
  String get preloadAmount => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadAmount', {}) ?? 'プリロード数';
  @override
  String get preloadSizeLimit => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimit', {}) ?? 'プリロードサイズ制限';
  @override
  String get preloadSizeLimitSubtitle => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimitSubtitle', {}) ?? '(GB), 0 で無制限';
  @override
  String get preloadHeightLimit => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimit', {}) ?? 'プリロード高さ制限';
  @override
  String get preloadHeightLimitSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimitSubtitle', {}) ?? '(ピクセル), 0 で無制限';
  @override
  String get imageQuality => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQuality', {}) ?? '画像品質';
  @override
  String get viewerScrollDirection => TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerScrollDirection', {}) ?? 'ビューアーのスクロール方向';
  @override
  String get viewerToolbarPosition => TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerToolbarPosition', {}) ?? 'ビューアーのツールバー位置';
  @override
  String get zoomButtonPosition => TranslationOverrides.string(_root.$meta, 'settings.viewer.zoomButtonPosition', {}) ?? 'ズームボタンの位置';
  @override
  String get changePageButtonsPosition => TranslationOverrides.string(_root.$meta, 'settings.viewer.changePageButtonsPosition', {}) ?? 'ページ変更ボタンの位置';
  @override
  String get hideToolbarWhenOpeningViewer =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.hideToolbarWhenOpeningViewer', {}) ?? 'ビューアーを開いたときにツールバーを非表示にする';
  @override
  String get expandDetailsByDefault => TranslationOverrides.string(_root.$meta, 'settings.viewer.expandDetailsByDefault', {}) ?? 'デフォルトで情報の詳細を展開';
  @override
  String get hideTranslationNotesByDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.hideTranslationNotesByDefault', {}) ?? '翻訳ノートをデフォルトで非表示';
  @override
  String get enableRotation => TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotation', {}) ?? '画像の回転を有効化';
  @override
  String get enableRotationSubtitle => TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotationSubtitle', {}) ?? 'ダブルタップで元に戻す';
  @override
  String get toolbarButtonsOrder => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarButtonsOrder', {}) ?? 'ツールバーボタンの順番';
  @override
  String get buttonsOrder => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonsOrder', {}) ?? 'ボタンの順番';
  @override
  String get longPressToChangeItemOrder =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToChangeItemOrder', {}) ?? '長押しすると項目の順番を移動できます。';
  @override
  String get atLeast4ButtonsVisibleOnToolbar =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.atLeast4ButtonsVisibleOnToolbar', {}) ?? 'このリストの少なくとも4つのボタンがツールバーに常に表示されます。';
  @override
  String get otherButtonsWillGoIntoOverflow =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.otherButtonsWillGoIntoOverflow', {}) ?? 'その他のボタンはオーバーフローメニュー(3つのドット)に表示されます。';
  @override
  String get longPressToMoveItems => TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToMoveItems', {}) ?? '長押しして項目を移動';
  @override
  String get onlyForVideos => TranslationOverrides.string(_root.$meta, 'settings.viewer.onlyForVideos', {}) ?? '動画にのみ表示';
  @override
  String get thisButtonCannotBeDisabled =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.thisButtonCannotBeDisabled', {}) ?? 'このボタンは無効にできません';
  @override
  String get defaultShareAction => TranslationOverrides.string(_root.$meta, 'settings.viewer.defaultShareAction', {}) ?? 'デフォルトの共有アクション';
  @override
  String get shareActions => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActions', {}) ?? '共有アクション';
  @override
  String get shareActionsAsk => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsAsk', {}) ?? '- 尋ねる - 常に何を共有するか質問します';
  @override
  String get shareActionsPostURL => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURL', {}) ?? '- 投稿のURL';
  @override
  String get shareActionsFileURL =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFileURL', {}) ?? '- ファイルのURL - 元のファイルへの直接リンクを共有します (一部サイトでは機能しない場合があります)';
  @override
  String get shareActionsPostURLFileURLFileWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURLFileURLFileWithTags', {}) ??
      '- 投稿URL/ファイルURL/ファイル とタグ - 選択したURL/ファイルと一緒にタグを共有します';
  @override
  String get shareActionsFile =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFile', {}) ?? '- ファイル - ファイル自体を共有します。読み込みに時間がかかる場合があり、進行状況は共有ボタンに表示されます';
  @override
  String get shareActionsNoteIfFileSavedInCache =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsNoteIfFileSavedInCache', {}) ??
      '[注意]: ファイルがキャッシュに保存されている場合はそこから読み込まれ、そうでない場合はネットワークから再度読み込まれます。';
  @override
  String get shareActionsTip =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsTip', {}) ?? '[ヒント]: 共有ボタンを長押しすると、共有アクションメニューを開くことができます。';
  @override
  String get useVolumeButtonsForScrolling =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.useVolumeButtonsForScrolling', {}) ?? '音量ボタンを使用してスクロール';
  @override
  String get volumeButtonsScrolling => TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrolling', {}) ?? '音量ボタンスクロール';
  @override
  String get volumeButtonsScrollingHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollingHelp', {}) ?? '音量ボタンを使用してプレビューとビューアーをスクロールします';
  @override
  String get volumeButtonsVolumeDown => TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeDown', {}) ?? ' - 音量下 - 次の項目';
  @override
  String get volumeButtonsVolumeUp => TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeUp', {}) ?? ' - 音量上 - 前の項目';
  @override
  String get volumeButtonsInViewer => TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsInViewer', {}) ?? 'ビューアー内:';
  @override
  String get volumeButtonsToolbarVisible =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarVisible', {}) ?? ' - ツールバーが表示されている場合 - 音量を調整';
  @override
  String get volumeButtonsToolbarHidden =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarHidden', {}) ?? ' - ツールバーが表示されていない場合 - スクロール';
  @override
  String get volumeButtonsScrollSpeed =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollSpeed', {}) ?? 'ボリュームボタンでのスクロール速度';
  @override
  String get slideshowDurationInMs => TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowDurationInMs', {}) ?? 'スライドショー間隔 (ms)';
  @override
  String get slideshow => TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshow', {}) ?? 'スライドショー';
  @override
  String get preventDeviceFromSleeping =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preventDeviceFromSleeping', {}) ?? 'デバイスがスリープ状態にならないようにする';
  @override
  String get viewerOpenCloseAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerOpenCloseAnimation', {}) ?? 'ビューアーの開閉アニメーション';
  @override
  String get viewerPageChangeAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerPageChangeAnimation', {}) ?? 'ビューアーページ変更アニメーション';
  @override
  String get usingDefaultAnimation => TranslationOverrides.string(_root.$meta, 'settings.viewer.usingDefaultAnimation', {}) ?? 'デフォルトのアニメーションを使用';
  @override
  String get usingCustomAnimation => TranslationOverrides.string(_root.$meta, 'settings.viewer.usingCustomAnimation', {}) ?? 'カスタムのアニメーションを使用';
  @override
  late final _TranslationsSettingsViewerScrollDirectionValuesJaJp scrollDirectionValues = _TranslationsSettingsViewerScrollDirectionValuesJaJp._(
    _root,
  );
  @override
  late final _TranslationsSettingsViewerToolbarPositionValuesJaJp toolbarPositionValues = _TranslationsSettingsViewerToolbarPositionValuesJaJp._(
    _root,
  );
  @override
  late final _TranslationsSettingsViewerButtonPositionValuesJaJp buttonPositionValues = _TranslationsSettingsViewerButtonPositionValuesJaJp._(_root);
  @override
  String get slideshowWIPNote => TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowWIPNote', {}) ?? '[作業中] 動画/GIFは手動スクロールのみ';
  @override
  String get shareActionsHydrus =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsHydrus', {}) ?? '- Hydrus - 投稿のURLをインポートのためにHydrusに送信';
}

// Path: settings.language
class _TranslationsSettingsLanguageJaJp extends TranslationsSettingsLanguageEn {
  _TranslationsSettingsLanguageJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? '言語 - Language';
  @override
  String get system => TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? 'システム';
  @override
  String get helpUsTranslate => TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? '翻訳に貢献する';
  @override
  String get visitForDetails =>
      TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ??
      '詳細については、 <a href=\'https://github.com/NO-ob/LoliSnatcher_Droid/wiki/Localization\'>GitHub</a> を確認するか、下の画像をタップしてWeblateにアクセスできます';
}

// Path: settings.dirPicker
class _TranslationsSettingsDirPickerJaJp extends TranslationsSettingsDirPickerEn {
  _TranslationsSettingsDirPickerJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get yes => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.yes', {}) ?? 'はい';
  @override
  String get no => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.no', {}) ?? 'いいえ';
  @override
  String get directoryName => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryName', {}) ?? 'ディレクトリ名';
  @override
  String get selectADirectory => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.selectADirectory', {}) ?? 'ディレクトリを選択';
  @override
  String get closeWithoutChoosing =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.closeWithoutChoosing', {}) ?? 'ディレクトリを選択せずにピッカーを閉じますか？';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.error', {}) ?? 'エラー！';
  @override
  String get failedToCreateDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.failedToCreateDirectory', {}) ?? 'ディレクトリの作成に失敗しました';
  @override
  String get directoryNotWritable => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryNotWritable', {}) ?? 'ディレクトリは書き込み不可です！';
  @override
  String get newDirectory => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.newDirectory', {}) ?? '新規ディレクトリ';
  @override
  String get create => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.create', {}) ?? '作成';
}

// Path: settings.booruEditor
class _TranslationsSettingsBooruEditorJaJp extends TranslationsSettingsBooruEditorEn {
  _TranslationsSettingsBooruEditorJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? 'Booru エディター';
  @override
  String get testBooruFailedTitle => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'Booruのテストに失敗';
  @override
  String get testBooruFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ??
      '構成パラメータが正しくない、booruがAPIアクセスを許可していない、リクエストがデータを返さない、またはネットワークエラーが発生しました。';
  @override
  String get saveBooru => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Booruを保存';
  @override
  String get runningTest => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? 'テストの実行中…';
  @override
  String get booruConfigExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? 'このBooruの設定は既に存在しています';
  @override
  String get booruSameNameExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ?? '同じ名前のBooruの設定がすでに存在します';
  @override
  String get booruSameUrlExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ?? '同じURLのBooruの設定がすでに存在しています';
  @override
  String get thisBooruConfigWontBeAdded =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ?? 'このBooru設定は追加されません';
  @override
  String get booruConfigSaved => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? 'Booruの設定が保存されました';
  @override
  String get booruName => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? 'Booruの名前';
  @override
  String get booruConfigShouldSave => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigShouldSave', {}) ?? 'このBooru設定を保存';
  @override
  String booruConfigSelectedType({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSelectedType', {'booruType': booruType}) ??
      '選択/自動検出されたBooruタイプ: ${booruType}';
  @override
  String get booruUrl => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? 'BooruのURL';
  @override
  String get existingTabsNeedReload =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ?? '変更を適用するには、このBooruに関連する既存のタブを再読み込みする必要があります！';
  @override
  String get failedVerifyApiHydrus =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ?? 'HydrusのAPIアクセスを検証できませんでした';
  @override
  String get accessKeyRequestedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? 'アクセスキーをリクエストしました';
  @override
  String get accessKeyRequestedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ?? 'Hydrus上でokayをタップして許可します。その後、Booruをテストすることができます';
  @override
  String get accessKeyFailedTitle => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? 'アクセスキーの取得に失敗';
  @override
  String get accessKeyFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ?? 'Hydrusでリクエストウィンドウを開いていますか？';
  @override
  String get hydrusInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ??
      'Hydrusのキーを取得するには、Hydrus クライアントでリクエストダイアログを開く必要があります: Services > Review services > Client API > Add > From API request';
  @override
  String get getHydrusApiKey => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? 'Hydrus APIキーを取得';
  @override
  String get booruNameRequired => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? 'Booruの名前の設定が必要です！';
  @override
  String get booruUrlRequired => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? 'BooruのURLの設定が必要です！';
  @override
  String get booruType => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruType', {}) ?? 'Booruのタイプ';
  @override
  String get booruFavicon => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? 'FaviconのURL';
  @override
  String get booruFaviconPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '(空白の場合は自動で入力されます)';
  @override
  String get booruDefTags => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? 'デフォルトのタグ';
  @override
  String get booruDefTagsPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTagsPlaceholder', {}) ?? 'Booruを開いたときのデフォルトのタグ';
  @override
  String get booruDefaultInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefaultInstructions', {}) ?? '一部のBooruでは、以下のフィールドが必須の場合があります';
}

// Path: settings.cache
class _TranslationsSettingsCacheJaJp extends TranslationsSettingsCacheEn {
  _TranslationsSettingsCacheJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? 'ダウンロードとキャッシュ';
  @override
  String get snatchQuality => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchQuality', {}) ?? 'ダウンロードの品質';
  @override
  String get snatchCooldown => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchCooldown', {}) ?? 'ダウンロードの間隔 (ミリ秒)';
  @override
  String get snatchItemsOnFavouriting =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.snatchItemsOnFavouriting', {}) ?? 'お気に入りしたアイテムをダウンロード';
  @override
  String get favouriteItemsOnSnatching =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.favouriteItemsOnSnatching', {}) ?? 'ダウンロードしたアイテムをお気に入りに追加';
  @override
  String get cacheTypeThumbnails => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeThumbnails', {}) ?? 'サムネイル';
  @override
  String get cacheTypeSamples => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeSamples', {}) ?? 'サンプル';
  @override
  String get cacheMedia => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheMedia', {}) ?? 'メディアをキャッシュ';
  @override
  String get videoCacheNoteEnable =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheNoteEnable', {}) ?? '[注意]: 動画は「メディアをキャッシュ」が有効になっている場合のみキャッシュされます。';
  @override
  String get pleaseEnterAValidTimeout =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.pleaseEnterAValidTimeout', {}) ?? '有効なタイムアウト値を入力してください';
  @override
  String get biggerThan10 => TranslationOverrides.string(_root.$meta, 'settings.cache.biggerThan10', {}) ?? '10msより大きい値を入力してください';
  @override
  String get showDownloadNotifications => TranslationOverrides.string(_root.$meta, 'settings.cache.showDownloadNotifications', {}) ?? 'ダウンロード通知を表示';
  @override
  String get writeImageDataOnSave => TranslationOverrides.string(_root.$meta, 'settings.cache.writeImageDataOnSave', {}) ?? '保存時に画像データをJSONに書き込む';
  @override
  String get requiresCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.requiresCustomStorageDirectory', {}) ?? 'カスタムディレクトリが必要です';
  @override
  String get setStorageDirectory => TranslationOverrides.string(_root.$meta, 'settings.cache.setStorageDirectory', {}) ?? 'ストレージディレクトリを設定';
  @override
  String currentPath({required String path}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.currentPath', {'path': path}) ?? '現在: ${path}';
  @override
  String get resetStorageDirectory => TranslationOverrides.string(_root.$meta, 'settings.cache.resetStorageDirectory', {}) ?? 'ストレージディレクトリをリセット';
  @override
  String get cachePreviews => TranslationOverrides.string(_root.$meta, 'settings.cache.cachePreviews', {}) ?? 'キャッシュプレビュー';
  @override
  String get videoCacheMode => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheMode', {}) ?? 'ビデオキャッシュモード';
  @override
  String get videoCacheModesTitle => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModesTitle', {}) ?? 'ビデオキャッシュモード';
  @override
  String get videoCacheModeStream =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStream', {}) ?? '- ストリーム - キャッシュなし、できるだけ早く再生を開始';
  @override
  String get videoCacheModeCache =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeCache', {}) ?? '- キャッシュ - ファイルをデバイスストレージに保存、ダウンロード完了後に再生';
  @override
  String get videoCacheModeStreamCache =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStreamCache', {}) ?? '- ストリーム+キャッシュ - 両方の組み合わせ、現在は2重ダウンロードが発生します';
  @override
  String get videoCacheWarningDesktop =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheWarningDesktop', {}) ??
      '[警告]: デスクトップ版では、一部のBooruで ストリーム モードが正しく動作しない場合があります。';
  @override
  String get deleteCacheAfter => TranslationOverrides.string(_root.$meta, 'settings.cache.deleteCacheAfter', {}) ?? 'キャッシュを次の期間後に削除:';
  @override
  String get cacheSizeLimit => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheSizeLimit', {}) ?? 'キャッシュサイズ制限 (GB)';
  @override
  String get maximumTotalCacheSize => TranslationOverrides.string(_root.$meta, 'settings.cache.maximumTotalCacheSize', {}) ?? '最大合計キャッシュサイズ';
  @override
  String get cacheStats => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheStats', {}) ?? 'キャッシュの統計:';
  @override
  String get loading => TranslationOverrides.string(_root.$meta, 'settings.cache.loading', {}) ?? '読み込み中…';
  @override
  String get empty => TranslationOverrides.string(_root.$meta, 'settings.cache.empty', {}) ?? '空';
  @override
  String inFilesPlural({required String size, required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.inFilesPlural', {'size': size, 'count': count}) ?? '${size}, ${count} ファイル';
  @override
  String inFileSingular({required String size}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.inFileSingular', {'size': size}) ?? '${size}, 1 ファイル';
  @override
  String get cacheTypeTotal => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeTotal', {}) ?? '合計';
  @override
  String get cacheTypeFavicons => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeFavicons', {}) ?? 'Favicon';
  @override
  String get cacheTypeMedia => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeMedia', {}) ?? 'メディア';
  @override
  String get cacheTypeWebView => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeWebView', {}) ?? 'WebView';
  @override
  String get cacheCleared => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheCleared', {}) ?? 'キャッシュがクリアされました';
  @override
  String clearedCacheType({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheType', {'type': type}) ?? '${type} キャッシュをクリアしました';
  @override
  String get clearAllCache => TranslationOverrides.string(_root.$meta, 'settings.cache.clearAllCache', {}) ?? 'すべてのキャッシュをクリア';
  @override
  String get clearedCacheCompletely => TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheCompletely', {}) ?? 'キャッシュを完全にクリアしました';
  @override
  String get appRestartRequired => TranslationOverrides.string(_root.$meta, 'settings.cache.appRestartRequired', {}) ?? 'アプリの再起動が必要な可能性があります！';
  @override
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'settings.cache.errorExclamation', {}) ?? 'エラー！';
  @override
  String get notAvailableForPlatform =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.notAvailableForPlatform', {}) ?? '現在このプラットフォームでは使用できません';
}

// Path: settings.downloads
class _TranslationsSettingsDownloadsJaJp extends TranslationsSettingsDownloadsEn {
  _TranslationsSettingsDownloadsJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get snatchSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? '選択したものをダウンロード';
  @override
  String get removeSnatchedStatusFromSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ?? '選択したものをダウンロード項目から削除';
  @override
  String get noItemsQueued => TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsQueued', {}) ?? 'キューにアイテムがありません';
  @override
  String get fromNextItemInQueue => TranslationOverrides.string(_root.$meta, 'settings.downloads.fromNextItemInQueue', {}) ?? 'キューの次の項目から';
  @override
  String get pleaseProvideStoragePermission =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.pleaseProvideStoragePermission', {}) ?? 'ファイルをダウンロードするには、ストレージへのアクセス許可を付与してください';
  @override
  String get batch => TranslationOverrides.string(_root.$meta, 'settings.downloads.batch', {}) ?? 'バッチ';
  @override
  String get favouriteSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? '選択したアイテムをお気に入りに追加';
  @override
  String get unfavouriteSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? '選択したアイテムをお気に入りから解除';
  @override
  String get clearSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? '選択をクリア';
  @override
  String get updatingData => TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? 'データを更新中…';
  @override
  String get noItemsSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsSelected', {}) ?? 'アイテムは選択されていません';
}

// Path: settings.database
class _TranslationsSettingsDatabaseJaJp extends TranslationsSettingsDatabaseEn {
  _TranslationsSettingsDatabaseJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get databaseInfo => TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfo', {}) ?? 'お気に入りを保存し、ダウンロードしたアイテムを追跡します';
  @override
  String get databaseInfoSnatch =>
      TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfoSnatch', {}) ?? 'すでにダウンロードされたアイテムを再度ダウンロードすることはできません';
  @override
  String get clearSnatchedItems => TranslationOverrides.string(_root.$meta, 'settings.database.clearSnatchedItems', {}) ?? 'ダウンロード済みアイテムをクリア';
  @override
  String get clearAllSnatchedConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearAllSnatchedConfirm', {}) ?? 'ダウンロードしたアイテムをすべてクリアしますか？';
  @override
  String get snatchedItemsCleared =>
      TranslationOverrides.string(_root.$meta, 'settings.database.snatchedItemsCleared', {}) ?? 'ダウンロードしたアイテムがクリアされました';
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? 'データベース';
  @override
  String get indexingDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? 'データベースのインデックスを作成中';
  @override
  String get droppingIndexes => TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? 'インデックスの削除中';
  @override
  String get enableDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.enableDatabase', {}) ?? 'データベースを有効化';
  @override
  String get enableIndexing => TranslationOverrides.string(_root.$meta, 'settings.database.enableIndexing', {}) ?? 'インデックスを有効化';
  @override
  String get enableSearchHistory => TranslationOverrides.string(_root.$meta, 'settings.database.enableSearchHistory', {}) ?? '検索履歴を有効化';
  @override
  String get enableTagTypeFetching => TranslationOverrides.string(_root.$meta, 'settings.database.enableTagTypeFetching', {}) ?? 'タグタイプの取得を有効化';
  @override
  String get sankakuTypeToUpdate => TranslationOverrides.string(_root.$meta, 'settings.database.sankakuTypeToUpdate', {}) ?? '更新するSankakuタイプ';
  @override
  String get searchQuery => TranslationOverrides.string(_root.$meta, 'settings.database.searchQuery', {}) ?? '検索クエリ';
  @override
  String get searchQueryOptional =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchQueryOptional', {}) ?? '(オプション、プロセスが遅くなる可能性があります)';
  @override
  String get cantLeavePageNow => TranslationOverrides.string(_root.$meta, 'settings.database.cantLeavePageNow', {}) ?? '今はこのページを離れることはできません！';
  @override
  String get sankakuDataUpdating =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDataUpdating', {}) ?? 'Sankakuデータの更新中です。終了するまで待つか、ページ下部で手動でキャンセルしてください';
  @override
  String get pleaseWaitTitle => TranslationOverrides.string(_root.$meta, 'settings.database.pleaseWaitTitle', {}) ?? 'お待ちください！';
  @override
  String get indexesBeingChanged => TranslationOverrides.string(_root.$meta, 'settings.database.indexesBeingChanged', {}) ?? 'インデックスが変更されています';
  @override
  String get indexingInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.indexingInfo', {}) ??
      'データベース検索が高速化されますが、より多くのディスク領域が使用されます (最大 2 倍)。\n\nインデックス作成中は、ページを離れたりアプリを閉じたりしないでください。';
  @override
  String get createIndexesDebug => TranslationOverrides.string(_root.$meta, 'settings.database.createIndexesDebug', {}) ?? 'インデックスの作成 [デバッグ]';
  @override
  String get dropIndexesDebug => TranslationOverrides.string(_root.$meta, 'settings.database.dropIndexesDebug', {}) ?? 'インデックスの削除 [デバッグ]';
  @override
  String get searchHistoryInfo => TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryInfo', {}) ?? 'データベースが有効になっている必要があります。';
  @override
  String searchHistoryRecords({required int limit}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryRecords', {'limit': limit}) ?? '過去 ${limit}件の検索を保存します';
  @override
  String get searchHistoryTapInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryTapInfo', {}) ?? 'エントリーをタップしてアクションを実行できます (削除、お気に入り...)';
  @override
  String get searchHistoryFavouritesInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryFavouritesInfo', {}) ?? 'お気に入りのクエリはリストの上部に固定され、制限にカウントされません。';
  @override
  String get tagTypeFetchingInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingInfo', {}) ?? 'サポートされているBooruからタグタイプを取得します';
  @override
  String get tagTypeFetchingWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingWarning', {}) ?? 'レート制限が発生する可能性があります';
  @override
  String get deleteDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabase', {}) ?? 'データベースを削除';
  @override
  String get deleteDatabaseConfirm => TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabaseConfirm', {}) ?? 'データベースを削除しますか？';
  @override
  String get databaseDeleted => TranslationOverrides.string(_root.$meta, 'settings.database.databaseDeleted', {}) ?? 'データベースが削除されました！';
  @override
  String get appRestartRequired => TranslationOverrides.string(_root.$meta, 'settings.database.appRestartRequired', {}) ?? 'アプリの再起動が必要です！';
  @override
  String get appRestartMayBeRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.database.appRestartMayBeRequired', {}) ?? 'アプリの再起動が必要な可能性があります！';
  @override
  String get clearFavouritedItems => TranslationOverrides.string(_root.$meta, 'settings.database.clearFavouritedItems', {}) ?? 'お気に入りアイテムをクリア';
  @override
  String get clearAllFavouritedConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearAllFavouritedConfirm', {}) ?? 'お気に入りしたアイテムをすべてクリアしますか？';
  @override
  String get favouritesCleared => TranslationOverrides.string(_root.$meta, 'settings.database.favouritesCleared', {}) ?? 'お気に入りをクリアしました';
  @override
  String get clearSearchHistory => TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistory', {}) ?? '検索履歴をクリア';
  @override
  String get clearSearchHistoryConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistoryConfirm', {}) ?? '検索履歴をクリアしますか？';
  @override
  String get searchHistoryCleared => TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryCleared', {}) ?? '検索履歴がクリアされました';
  @override
  String get sankakuFavouritesUpdate =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdate', {}) ?? 'Sankaku お気に入りのアップデート';
  @override
  String get sankakuFavouritesUpdateStarted =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateStarted', {}) ?? 'Sankaku お気に入りアップデート開始';
  @override
  String get sankakuDontLeavePage =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDontLeavePage', {}) ?? 'プロセスが完了するか停止するまでこのページを離れないでください';
  @override
  String get noSankakuConfigFound =>
      TranslationOverrides.string(_root.$meta, 'settings.database.noSankakuConfigFound', {}) ?? 'Sankaku 設定が見つかりませんでした！';
  @override
  String get sankakuFavouritesUpdateComplete =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateComplete', {}) ?? 'Sankaku お気に入りの更新が完了しました';
  @override
  String get failedItemsPurgeStartedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeStartedTitle', {}) ?? '失敗したアイテムの削除を開始しました';
  @override
  String get failedItemsPurgeInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeInfo', {}) ?? '更新に失敗したアイテムはデータベースから削除されます';
  @override
  String get updateSankakuUrls => TranslationOverrides.string(_root.$meta, 'settings.database.updateSankakuUrls', {}) ?? 'Sankaku URLをアップデート';
  @override
  String updating({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.updating', {'count': count}) ?? '${count}個のアイテムを更新中:';
  @override
  String left({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.left', {'count': count}) ?? '残り: ${count}';
  @override
  String done({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.done', {'count': count}) ?? '完了: ${count}';
  @override
  String failedSkipped({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedSkipped', {'count': count}) ?? '失敗/スキップ: ${count}';
  @override
  String get skipCurrentItem => TranslationOverrides.string(_root.$meta, 'settings.database.skipCurrentItem', {}) ?? '現在のアイテムをスキップするにはここをタップしてください';
  @override
  String get pressToStop => TranslationOverrides.string(_root.$meta, 'settings.database.pressToStop', {}) ?? 'ここをタップして停止';
  @override
  String purgeFailedItems({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.purgeFailedItems', {'count': count}) ?? '失敗したアイテムを消去します (${count})';
  @override
  String retryFailedItems({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.retryFailedItems', {'count': count}) ?? '失敗したアイテムを再試行します (${count})';
  @override
  String get useIfStuck => TranslationOverrides.string(_root.$meta, 'settings.database.useIfStuck', {}) ?? 'アイテムでスタックしているように見える場合に使用します';
}

// Path: settings.itemFilters
class _TranslationsSettingsItemFiltersJaJp extends TranslationsSettingsItemFiltersEn {
  _TranslationsSettingsItemFiltersJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get removeSnatched => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeSnatched', {}) ?? 'ダウンロードしたアイテムを削除';
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.title', {}) ?? 'フィルター';
  @override
  String get marked => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.marked', {}) ?? 'お気に入り';
  @override
  String get removeMarked => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeMarked', {}) ?? 'お気に入りタグを含むアイテムを完全に非表示';
  @override
  String get removeHidden => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeHidden', {}) ?? '非表示タグを含むアイテムを完全に非表示';
  @override
  String get hidden => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.hidden', {}) ?? '非表示';
  @override
  String get removeFavourited => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeFavourited', {}) ?? 'お気に入りにしたアイテムを非表示';
  @override
  String get removeAI => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeAI', {}) ?? 'AIを使用したアイテムを非表示';
  @override
  String get duplicateFilter => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.duplicateFilter', {}) ?? '重複フィルター';
  @override
  String alreadyInList({required String tag, required String type}) =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.alreadyInList', {'tag': tag, 'type': type}) ??
      '\'${tag}\'はすでに ${type} リストに存在します';
  @override
  String get noFiltersFound => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersFound', {}) ?? 'フィルターが見つかりません';
  @override
  String get noFiltersAdded => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersAdded', {}) ?? 'フィルターがありません';
}

// Path: settings.sync
class _TranslationsSettingsSyncJaJp extends TranslationsSettingsSyncEn {
  _TranslationsSettingsSyncJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get sendSnatchedHistory => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSnatchedHistory', {}) ?? 'ダウンロード履歴を送信';
  @override
  String snatchedCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.snatchedCount', {'count': count}) ?? 'ダウンロード済み: ${count}';
  @override
  String get syncSnatchedFrom => TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFrom', {}) ?? '#... からダウンロードを同期';
  @override
  String get syncSnatchedFromHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText1', {}) ??
      '同期を開始する場所を設定できます。これは、以前のダウンロード履歴を既に同期していて、最近のアイテムを同期したい場合に便利です';
  @override
  String get syncSnatchedFromHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText2', {}) ?? '最初からすべて同期する場合はこのフィールドを空白のままにしておいてください';
  @override
  String get syncFavsFromHelpText3 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText3', {}) ??
      '例: お気に入りの数がXの場合、このフィールドを100に設定すると、 アイテム #100 から X まで同期されます';
  @override
  String get syncSnatchedFromHelpText3 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText3', {}) ??
      '例: お気に入りの数がXの場合、このフィールドを100に設定すると、 アイテム #100 から X まで同期されます';
  @override
  String get syncSnatchedFromHelpText4 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText4', {}) ?? 'お気に入りの順序: 古いもの (0) から新しい順 (X)';
  @override
  String get syncFavsFromHelpText4 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText4', {}) ?? 'お気に入りの順序: 古いもの (0) から新しい順 (X)';
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? 'LoliSync';
  @override
  String get portAndIPCannotBeEmpty =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.portAndIPCannotBeEmpty', {}) ?? 'ポートとIPのフィールドは空にできません！';
  @override
  String get serverPortPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.serverPortPlaceholder', {}) ?? '(空の場合はデフォルトで\'8080\'になります)';
  @override
  String get dbError => TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ?? 'LoliSyncを使用するにはデータベースを有効にする必要があります';
  @override
  String get errorTitle => TranslationOverrides.string(_root.$meta, 'settings.sync.errorTitle', {}) ?? 'エラー！';
  @override
  String get pleaseEnterIPAndPort => TranslationOverrides.string(_root.$meta, 'settings.sync.pleaseEnterIPAndPort', {}) ?? 'IPアドレスとポートを入力してください。';
  @override
  String get selectWhatYouWantToDo => TranslationOverrides.string(_root.$meta, 'settings.sync.selectWhatYouWantToDo', {}) ?? '何をしたいか選択してください';
  @override
  String get sendDataToDevice => TranslationOverrides.string(_root.$meta, 'settings.sync.sendDataToDevice', {}) ?? '他のデバイスにデータを送信';
  @override
  String get receiveDataFromDevice => TranslationOverrides.string(_root.$meta, 'settings.sync.receiveDataFromDevice', {}) ?? '他のデバイスからデータを引き継ぎ';
  @override
  String get senderInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.senderInstructions', {}) ?? 'もう一方のデバイスでサーバーを起動し、IP/ポートを入力して、Syncを開始 をタップします';
  @override
  String get ipAddress => TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddress', {}) ?? 'IPアドレス';
  @override
  String get ipAddressPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddressPlaceholder', {}) ?? 'ホストIPアドレス (192.168.1.1 など)';
  @override
  String get port => TranslationOverrides.string(_root.$meta, 'settings.sync.port', {}) ?? 'ポート';
  @override
  String get portPlaceholder => TranslationOverrides.string(_root.$meta, 'settings.sync.portPlaceholder', {}) ?? 'ホストのポート (7777 など)';
  @override
  String get sendFavourites => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavourites', {}) ?? 'お気に入りを送信';
  @override
  String favouritesCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.favouritesCount', {'count': count}) ?? 'お気に入り: ${count}';
  @override
  String get sendFavouritesLegacy => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavouritesLegacy', {}) ?? 'お気に入りを送信 (レガシー)';
  @override
  String get syncFavsFrom => TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFrom', {}) ?? '#... からお気に入りを同期';
  @override
  String get syncFavsFromHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText1', {}) ??
      '同期を開始する場所を設定できます。これは、以前までのお気に入りを既に同期していて、最近のアイテムのみ同期したい場合に便利です';
  @override
  String get syncFavsFromHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText2', {}) ?? '最初からすべて同期する場合はこのフィールドを空白のままにしておいてください';
  @override
  String get sendSettings => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSettings', {}) ?? '設定を送信';
  @override
  String get sendBooruConfigs => TranslationOverrides.string(_root.$meta, 'settings.sync.sendBooruConfigs', {}) ?? 'Booru 設定を送信';
  @override
  String configsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.configsCount', {'count': count}) ?? '設定: ${count}';
  @override
  String get sendTabs => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTabs', {}) ?? 'タブを送信';
  @override
  String tabsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsCount', {'count': count}) ?? 'タブ: ${count}';
  @override
  String get tabsSyncMode => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncMode', {}) ?? 'タブ同期モード';
  @override
  String get tabsSyncModeMerge =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeMerge', {}) ?? '結合: このデバイスのタブを先のデバイスにマージします。不明なタブや既存のタブは無視されます';
  @override
  String get tabsSyncModeReplace =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeReplace', {}) ?? '置換: 先のデバイスのタブをこのデバイスと同じタブに完全に置き換えます';
  @override
  String get merge => TranslationOverrides.string(_root.$meta, 'settings.sync.merge', {}) ?? '結合';
  @override
  String get replace => TranslationOverrides.string(_root.$meta, 'settings.sync.replace', {}) ?? '置換';
  @override
  String get sendTags => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTags', {}) ?? 'タグを送信';
  @override
  String tagsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsCount', {'count': count}) ?? 'タグ: ${count}';
  @override
  String get tagsSyncMode => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncMode', {}) ?? 'タグ同期モード';
  @override
  String get tagsSyncModePreferTypeIfNone =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModePreferTypeIfNone', {}) ??
      'タイプを保持: 他のデバイスにタグタイプが既に存在し、このデバイスには存在しない場合はスキップされます';
  @override
  String get tagsSyncModeOverwrite =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModeOverwrite', {}) ?? '上書き: すべてのタグが追加されます。他のデバイスにタグとタグタイプが存在する場合は上書きされます';
  @override
  String get preferTypeIfNone => TranslationOverrides.string(_root.$meta, 'settings.sync.preferTypeIfNone', {}) ?? 'タイプを保持';
  @override
  String get overwrite => TranslationOverrides.string(_root.$meta, 'settings.sync.overwrite', {}) ?? '上書き';
  @override
  String get testConnection => TranslationOverrides.string(_root.$meta, 'settings.sync.testConnection', {}) ?? '接続テスト';
  @override
  String get testConnectionHelpText1 => TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText1', {}) ?? '先のデバイスにテストを送信します。';
  @override
  String get testConnectionHelpText2 => TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText2', {}) ?? '成功/失敗の通知を表示します。';
  @override
  String get startSync => TranslationOverrides.string(_root.$meta, 'settings.sync.startSync', {}) ?? 'Syncを開始';
  @override
  String get nothingSelectedToSync => TranslationOverrides.string(_root.$meta, 'settings.sync.nothingSelectedToSync', {}) ?? '同期する項目が選択されていません！';
  @override
  String get statsOfThisDevice => TranslationOverrides.string(_root.$meta, 'settings.sync.statsOfThisDevice', {}) ?? 'このデバイスの統計情報:';
  @override
  String get receiverInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.receiverInstructions', {}) ?? 'サーバーを起動してデータを受信できます。セキュリティのため、公共Wi-Fiは使用しないでください';
  @override
  String get availableNetworkInterfaces =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.availableNetworkInterfaces', {}) ?? '利用可能なネットワークインターフェース';
  @override
  String selectedInterfaceIP({required String ip}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.selectedInterfaceIP', {'ip': ip}) ?? '選択されたインターフェースでのIP: ${ip}';
  @override
  String get serverPort => TranslationOverrides.string(_root.$meta, 'settings.sync.serverPort', {}) ?? 'サーバーポート';
  @override
  String get startReceiverServer => TranslationOverrides.string(_root.$meta, 'settings.sync.startReceiverServer', {}) ?? 'レシーバーサーバーを開始';
}

// Path: settings.about
class _TranslationsSettingsAboutJaJp extends TranslationsSettingsAboutEn {
  _TranslationsSettingsAboutJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get appDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ??
      'LoliSnatcherはオープンソースで、GPLv3ライセンスに基づいており、ソースコードはGitHubで公開されています。問題や機能リクエストがありましたら、リポジトリの Issues セクションにご報告ください。';
  @override
  String get appOnGitHub => TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? 'LoliSnatcher (GitHub)';
  @override
  String get releasesMsg => TranslationOverrides.string(_root.$meta, 'settings.about.releasesMsg', {}) ?? '最新バージョンと完全な変更ログは、GitHubのリリースページにあります:';
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.about.title', {}) ?? 'このアプリについて';
  @override
  String get logoArtistThanks =>
      TranslationOverrides.string(_root.$meta, 'settings.about.logoArtistThanks', {}) ??
      'アプリのロゴにイラストを使用させていただいた、Showers-U さんに心より感謝を申し上げます。Pixivでぜひチェックしてみてください';
  @override
  String get contact => TranslationOverrides.string(_root.$meta, 'settings.about.contact', {}) ?? 'Contact';
  @override
  String get releases => TranslationOverrides.string(_root.$meta, 'settings.about.releases', {}) ?? 'リリースページ';
  @override
  String get licenses => TranslationOverrides.string(_root.$meta, 'settings.about.licenses', {}) ?? 'ライセンス';
  @override
  String get developers => TranslationOverrides.string(_root.$meta, 'settings.about.developers', {}) ?? '開発';
  @override
  String get emailCopied => TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? 'Eメールがクリップボードにコピーされました';
}

// Path: settings.network
class _TranslationsSettingsNetworkJaJp extends TranslationsSettingsNetworkEn {
  _TranslationsSettingsNetworkJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get keepEmptyForDefault => TranslationOverrides.string(_root.$meta, 'settings.network.keepEmptyForDefault', {}) ?? 'デフォルトのままにしておくには空にしてください';
  @override
  String get selectBooruToClearCookies =>
      TranslationOverrides.string(_root.$meta, 'settings.network.selectBooruToClearCookies', {}) ?? 'Cookieを消去するBooruを選択するか、空白のままにしてすべてから消去';
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? 'ネットワーク';
  @override
  String get enableSelfSignedSSLCertificates =>
      TranslationOverrides.string(_root.$meta, 'settings.network.enableSelfSignedSSLCertificates', {}) ?? '自己署名SSL証明書を有効化';
  @override
  String get proxy => TranslationOverrides.string(_root.$meta, 'settings.network.proxy', {}) ?? 'プロキシ';
  @override
  String get proxySubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.network.proxySubtitle', {}) ?? '動画のストリームモードには適用されません。代わりにキャッシュモードを使用してください';
  @override
  String get customUserAgent => TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgent', {}) ?? 'カスタム User-Agent';
  @override
  String get customUserAgentTitle => TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgentTitle', {}) ?? 'カスタム User-Agent';
  @override
  String defaultUserAgent({required String agent}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.defaultUserAgent', {'agent': agent}) ?? 'デフォルト: ${agent}';
  @override
  String get userAgentUsedOnRequests =>
      TranslationOverrides.string(_root.$meta, 'settings.network.userAgentUsedOnRequests', {}) ?? 'ほとんどのBooruリクエストとWebviewに使用されます';
  @override
  String get valueSavedAfterLeaving => TranslationOverrides.string(_root.$meta, 'settings.network.valueSavedAfterLeaving', {}) ?? 'ページを閉じて保存';
  @override
  String get setBrowserUserAgent =>
      TranslationOverrides.string(_root.$meta, 'settings.network.setBrowserUserAgent', {}) ??
      'Chromeブラウザのユーザーエージェントを使用 (サイトでブラウザ以外のユーザーエージェントが禁止されている場合にのみ推奨されます)';
  @override
  String get cookieCleaner => TranslationOverrides.string(_root.$meta, 'settings.network.cookieCleaner', {}) ?? 'Cookie クリーナー';
  @override
  String cookiesFor({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookiesFor', {'booruName': booruName}) ?? '${booruName} 上のCookie:';
  @override
  String cookieDeleted({required String cookieName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookieDeleted', {'cookieName': cookieName}) ?? 'Cookie «${cookieName}» が削除されました';
  @override
  String get clearCookies => TranslationOverrides.string(_root.$meta, 'settings.network.clearCookies', {}) ?? 'Cookieをクリア';
  @override
  String clearCookiesFor({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.clearCookiesFor', {'booruName': booruName}) ?? '${booruName} のCookieを消去します';
  @override
  String cookiesForBooruDeleted({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookiesForBooruDeleted', {'booruName': booruName}) ?? '${booruName} のCookieが消去されました';
  @override
  String get allCookiesDeleted => TranslationOverrides.string(_root.$meta, 'settings.network.allCookiesDeleted', {}) ?? 'すべてのCookieを消去しました';
}

// Path: settings.webview
class _TranslationsSettingsWebviewJaJp extends TranslationsSettingsWebviewEn {
  _TranslationsSettingsWebviewJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get openWebview => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? 'Webviewを開く';
  @override
  String get openWebviewTip => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? 'ログインまたはクッキーを取得する場合';
}

// Path: settings.video
class _TranslationsSettingsVideoJaJp extends TranslationsSettingsVideoEn {
  _TranslationsSettingsVideoJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? '動画';
  @override
  String get videoPlayerBackend => TranslationOverrides.string(_root.$meta, 'settings.video.videoPlayerBackend', {}) ?? 'プレーヤーのバックエンド';
  @override
  String get backendDefaultHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendDefaultHelp', {}) ??
      'Exoplayerに基づいています。デバイスとの互換性は最も高いですが、4Kや一部コーデックの動画、古いデバイスでは問題が発生する可能性があります';
  @override
  String get backendMPVHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendMPVHelp', {}) ??
      'libmpvに基づいており、一部のコーデックやデバイスの問題を解決するのに役立つ高度な設定があります \n[クラッシュを引き起こす可能性があります！]';
  @override
  String get backendMDKHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendMDKHelp', {}) ??
      'libmdkに基づいており、一部のコーデック/デバイスではパフォーマンスが向上する可能性があります\n[クラッシュを引き起こす可能性があります！]';
  @override
  String get experimental => TranslationOverrides.string(_root.$meta, 'settings.video.experimental', {}) ?? '[実験的機能]';
  @override
  String get disableVideos => TranslationOverrides.string(_root.$meta, 'settings.video.disableVideos', {}) ?? '動画の無効化';
  @override
  String get disableVideosHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.disableVideosHelp', {}) ??
      '動画の読み込み時にクラッシュするローエンドデバイスに便利です。代わりに外部プレイヤーやブラウザで視聴するオプションを提供します。';
  @override
  String get autoplayVideos => TranslationOverrides.string(_root.$meta, 'settings.video.autoplayVideos', {}) ?? '動画の自動再生';
  @override
  String get startVideosMuted => TranslationOverrides.string(_root.$meta, 'settings.video.startVideosMuted', {}) ?? '動画をミュート状態で開始';
  @override
  String get backendDefault => TranslationOverrides.string(_root.$meta, 'settings.video.backendDefault', {}) ?? 'デフォルト';
  @override
  String get backendMPV => TranslationOverrides.string(_root.$meta, 'settings.video.backendMPV', {}) ?? 'MPV';
  @override
  String get backendMDK => TranslationOverrides.string(_root.$meta, 'settings.video.backendMDK', {}) ?? 'MDK';
  @override
  String get mpvSettingsHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.mpvSettingsHelp', {}) ?? '動画が正しく動作しない、またはコーデックエラーが発生する場合は、以下の\'MPV\'設定の調整を試してみてください:';
  @override
  String get mpvUseHardwareAcceleration =>
      TranslationOverrides.string(_root.$meta, 'settings.video.mpvUseHardwareAcceleration', {}) ?? 'MPV: ハードウェアアクセラレーションを使用';
  @override
  String get mpvVO => TranslationOverrides.string(_root.$meta, 'settings.video.mpvVO', {}) ?? 'MPV: VO';
  @override
  String get mpvHWDEC => TranslationOverrides.string(_root.$meta, 'settings.video.mpvHWDEC', {}) ?? 'MPV: HWDEC';
  @override
  String get videoCacheMode => TranslationOverrides.string(_root.$meta, 'settings.video.videoCacheMode', {}) ?? 'ビデオキャッシュモード';
  @override
  late final _TranslationsSettingsVideoCacheModesJaJp cacheModes = _TranslationsSettingsVideoCacheModesJaJp._(_root);
  @override
  late final _TranslationsSettingsVideoCacheModeValuesJaJp cacheModeValues = _TranslationsSettingsVideoCacheModeValuesJaJp._(_root);
  @override
  late final _TranslationsSettingsVideoVideoBackendModeValuesJaJp videoBackendModeValues = _TranslationsSettingsVideoVideoBackendModeValuesJaJp._(
    _root,
  );
}

// Path: settings.backupAndRestore
class _TranslationsSettingsBackupAndRestoreJaJp extends TranslationsSettingsBackupAndRestoreEn {
  _TranslationsSettingsBackupAndRestoreJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.title', {}) ?? 'バックアップと復元';
  @override
  String get duplicateFileDetectedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedTitle', {}) ?? '重複ファイルが検出されました！';
  @override
  String duplicateFileDetectedMsg({required String fileName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
      'ファイル ${fileName} は既に存在します。上書きしますか？「いいえ」を選択した場合、バックアップはキャンセルされます。';
  @override
  String get androidOnlyFeatureMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ??
      'この機能はAndroidでのみ利用可能です。デスクトップ版では、システムに応じてアプリのデータフォルダからファイルをコピー/ペーストできます';
  @override
  String get selectBackupDir => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? 'バックアップディレクトリを選択';
  @override
  String get failedToGetBackupPath =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ?? 'バックアップパスの取得に失敗しました';
  @override
  String backupPathMsg({required String backupPath}) =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ?? 'バックアップパス: ${backupPath}';
  @override
  String get noBackupDirSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ?? 'バックアップディレクトリは選択されていません';
  @override
  String get restoreInfoMsg => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ?? 'ファイルはディレクトリルートにある必要があります';
  @override
  String get backupSettings => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? '設定をバックアップ';
  @override
  String get restoreSettings => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? '設定を復元';
  @override
  String get settingsBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ?? '設定を settings.json にバックアップしました';
  @override
  String get settingsRestored => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? '設定をバックアップから復元しました';
  @override
  String get backupSettingsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ?? '設定のバックアップに失敗しました';
  @override
  String get restoreSettingsError => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ?? '設定の復元に失敗しました';
  @override
  String get resetBackupDir => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.resetBackupDir', {}) ?? 'バックアップディレクトリをリセット';
  @override
  String get backupBoorus => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ?? 'Booruをバックアップ';
  @override
  String get restoreBoorus => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? 'Booruを復元';
  @override
  String get boorusBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ?? 'Booruを boorus.json にパックアップしました';
  @override
  String get boorusRestored => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ?? 'Booruをバックアップから復元しました';
  @override
  String get backupBoorusError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ?? 'Booruのバックアップに失敗しました';
  @override
  String get restoreBoorusError => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ?? 'Booruの復元に失敗しました';
  @override
  String get backupDatabase => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? 'データベースのバックアップ';
  @override
  String get restoreDatabase => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? 'データベースの復元';
  @override
  String get restoreDatabaseInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ??
      'データベースのサイズによっては時間がかかる場合があります、成功した場合はアプリを再起動します';
  @override
  String get databaseBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ?? 'データベースを store.db にバックアップしました';
  @override
  String get databaseRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ?? 'データベースをバックアップから復元しました！アプリは数秒後再起動されます！';
  @override
  String get backupDatabaseError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ?? 'データベースのバックアップに失敗しました';
  @override
  String get restoreDatabaseError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ?? 'データベースの復元に失敗しました';
  @override
  String get databaseFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ?? 'データベースファイルが見つからないか読み取れません！';
  @override
  String get backupTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? 'タグのバックアップ';
  @override
  String get restoreTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? 'タグの復元';
  @override
  String get restoreTagsInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ??
      'タグの数が多い場合は時間がかかる場合があります。データベースを復元した場合は、既にデータベースに含まれているためこの操作は不要です';
  @override
  String get tagsBackedUp => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? 'タグを tags.json にバックアップしました';
  @override
  String get tagsRestored => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? 'タグをバックアップから復元しました';
  @override
  String get backupTagsError => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? 'タグのバックアップに失敗しました';
  @override
  String get restoreTagsError => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? 'タグの復元に失敗しました';
  @override
  String get tagsFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsFileNotFound', {}) ?? 'タグファイルが見つからないか読み取れません！';
  @override
  String get backupFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupFileNotFound', {}) ?? 'バックアップファイルが見つからないか読み取れません！';
  @override
  String get operationTakesTooLongMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.operationTakesTooLongMsg', {}) ??
      '時間がかかりすぎる場合は、下の隠すボタンを押すとバックグラウンドで操作が続行されます';
  @override
  String get backupDirNoAccess =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDirNoAccess', {}) ?? 'バックアップディレクトリにアクセスできません！';
  @override
  String get backupCancelled => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? 'バックアップをキャンセルしました';
}

// Path: settings.privacy
class _TranslationsSettingsPrivacyJaJp extends TranslationsSettingsPrivacyEn {
  _TranslationsSettingsPrivacyJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? 'プライバシー';
  @override
  String get appLock => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? 'アプリのロック';
  @override
  String get appLockMsg => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ?? '手動で、またはアイドル状態の場合にアプリをロックします。PIN/生体認証が必要です';
  @override
  String get autoLockAfter => TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfter', {}) ?? 'ロックまでのアイドル時間';
  @override
  String get autoLockAfterTip => TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfterTip', {}) ?? '秒, 0で無効';
  @override
  String get bluronLeave => TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeave', {}) ?? 'アプリを離れるときに画面をぼかす';
  @override
  String get bluronLeaveMsg => TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeaveMsg', {}) ?? 'システムの制限により、一部デバイスでは動作しない場合があります';
  @override
  String get incognitoKeyboard => TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboard', {}) ?? 'シークレットキーボード';
  @override
  String get incognitoKeyboardMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboardMsg', {}) ?? 'キーボードが入力履歴を保存しないようにします。 \nほとんどのテキスト入力に適用されます';
  @override
  String get appDisplayName => TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayName', {}) ?? 'アプリの表示名';
  @override
  String get appDisplayNameDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayNameDescription', {}) ?? 'ランチャーでのアプリ名の表示を変更します';
  @override
  String get appAliasChanged => TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChanged', {}) ?? 'アプリ名が変更されました';
  @override
  String get appAliasRestartHint =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasRestartHint', {}) ??
      'アプリ名の変更はアプリの再起動後に有効になります。一部のランチャーでは、更新に時間がかかったりシステムの再起動が必要になる場合があります。';
  @override
  String get appAliasChangeFailed =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChangeFailed', {}) ?? 'アプリ名の変更に失敗しました。もう一度お試しください。';
  @override
  String get restartNow => TranslationOverrides.string(_root.$meta, 'settings.privacy.restartNow', {}) ?? '今すぐ再起動';
}

// Path: settings.performance
class _TranslationsSettingsPerformanceJaJp extends TranslationsSettingsPerformanceEn {
  _TranslationsSettingsPerformanceJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.performance.title', {}) ?? 'パフォーマンス';
  @override
  String get lowPerformanceMode => TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceMode', {}) ?? '低パフォーマンスモード';
  @override
  String get lowPerformanceModeSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeSubtitle', {}) ?? '古いデバイスやRAMの少ないデバイスに推奨';
  @override
  String get lowPerformanceModeDialogTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogTitle', {}) ?? '低パフォーマンスモード';
  @override
  String get lowPerformanceModeDialogDisablesDetailed =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesDetailed', {}) ?? '- 読み込み中の詳細情報を無効にします';
  @override
  String get lowPerformanceModeDialogDisablesResourceIntensive =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive', {}) ??
      '- リソースを大量に消費する要素を無効にします (ぼかし、アニメーション化された不透明度、一部アニメーションなど...)';
  @override
  String get lowPerformanceModeDialogSetsOptimal =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogSetsOptimal', {}) ??
      '以下のオプションに最適な設定を設定します (後で個別に変更できます):';
  @override
  String get autoplayVideos => TranslationOverrides.string(_root.$meta, 'settings.performance.autoplayVideos', {}) ?? '動画の自動再生';
  @override
  String get disableVideos => TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideos', {}) ?? '動画の無効化';
  @override
  String get disableVideosHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideosHelp', {}) ??
      '動画の読み込み時にクラッシュするローエンドデバイスに便利です。代わりに外部プレイヤーやブラウザで視聴するオプションを提供します。';
}

// Path: settings.checkForUpdates
class _TranslationsSettingsCheckForUpdatesJaJp extends TranslationsSettingsCheckForUpdatesEn {
  _TranslationsSettingsCheckForUpdatesJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.title', {}) ?? 'アップデートの確認';
  @override
  String get visitReleases => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? 'リリースを見る';
  @override
  String get updateAvailable => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateAvailable', {}) ?? 'アップデートが利用可能！';
  @override
  String get whatsNew => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.whatsNew', {}) ?? '新着情報';
  @override
  String get updateChangelog => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? 'アップデートの変更ログ';
  @override
  String get updateCheckError => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? 'アップデート確認エラー！';
  @override
  String get youHaveLatestVersion =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? '最新バージョンを実行しています';
  @override
  String get viewLatestChangelog => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ?? '最新の変更履歴を表示';
  @override
  String get currentVersion => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? '現在のバージョン';
  @override
  String get changelog => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? '変更ログ';
  @override
  String get visitPlayStore => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? 'Play Storeへアクセス';
}

// Path: settings.logs
class _TranslationsSettingsLogsJaJp extends TranslationsSettingsLogsEn {
  _TranslationsSettingsLogsJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.logs.title', {}) ?? 'ログ';
  @override
  String get shareLogs => TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogs', {}) ?? 'ログの共有';
  @override
  String get shareLogsWarningTitle => TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningTitle', {}) ?? 'ログを外部アプリに共有しますか？';
  @override
  String get shareLogsWarningMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningMsg', {}) ?? '[警告]: ログには機密情報が含まれている可能性があります。注意して共有してください！';
}

// Path: settings.help
class _TranslationsSettingsHelpJaJp extends TranslationsSettingsHelpEn {
  _TranslationsSettingsHelpJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? 'ヘルプ (英語)';
}

// Path: settings.debug
class _TranslationsSettingsDebugJaJp extends TranslationsSettingsDebugEn {
  _TranslationsSettingsDebugJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.debug.title', {}) ?? 'デバッグ';
  @override
  String get enabledSnackbarMsg => TranslationOverrides.string(_root.$meta, 'settings.debug.enabledSnackbarMsg', {}) ?? 'デバッグモードが有効化されました！';
  @override
  String get disabledSnackbarMsg => TranslationOverrides.string(_root.$meta, 'settings.debug.disabledSnackbarMsg', {}) ?? 'デバッグモードが無効になりました！';
  @override
  String get alreadyEnabledSnackbarMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.alreadyEnabledSnackbarMsg', {}) ?? 'デバッグモードは既に有効です！';
  @override
  String get showPerformanceGraph => TranslationOverrides.string(_root.$meta, 'settings.debug.showPerformanceGraph', {}) ?? 'パフォーマンスグラフの表示';
  @override
  String get showFPSGraph => TranslationOverrides.string(_root.$meta, 'settings.debug.showFPSGraph', {}) ?? 'FPSグラフの表示';
  @override
  String get showImageStats => TranslationOverrides.string(_root.$meta, 'settings.debug.showImageStats', {}) ?? '画像の統計情報の表示';
  @override
  String get showVideoStats => TranslationOverrides.string(_root.$meta, 'settings.debug.showVideoStats', {}) ?? '動画の統計情報の表示';
  @override
  String get blurImagesAndMuteVideosDevOnly =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.blurImagesAndMuteVideosDevOnly', {}) ?? '画像のぼかし + 動画のミュート [DEV only]';
  @override
  String get enableDragScrollOnListsDesktopOnly =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.enableDragScrollOnListsDesktopOnly', {}) ?? 'リストのドラッグスクロールを有効化 [デスクトップのみ]';
  @override
  String animationSpeed({required double speed}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.animationSpeed', {'speed': speed}) ?? 'アニメーション速度 (${speed})';
  @override
  String get tagsManager => TranslationOverrides.string(_root.$meta, 'settings.debug.tagsManager', {}) ?? 'タグマネージャー';
  @override
  String resolution({required String width, required String height}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.resolution', {'width': width, 'height': height}) ?? '解像度: ${width}x${height}';
  @override
  String pixelRatio({required String ratio}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.pixelRatio', {'ratio': ratio}) ?? 'ピクセル比: ${ratio}';
  @override
  String get webview => TranslationOverrides.string(_root.$meta, 'settings.debug.webview', {}) ?? 'Webview';
  @override
  String get deleteAllCookies => TranslationOverrides.string(_root.$meta, 'settings.debug.deleteAllCookies', {}) ?? 'すべてのCookieを削除';
  @override
  String get getSessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.getSessionString', {}) ?? 'セッション文字列を取得';
  @override
  String get setSessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.setSessionString', {}) ?? 'セッション文字列を設定';
  @override
  String get sessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.sessionString', {}) ?? 'セッション文字列';
  @override
  String get restoredSessionFromString =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.restoredSessionFromString', {}) ?? 'セッションを文字列から復元しました';
  @override
  String get clearSecureStorage => TranslationOverrides.string(_root.$meta, 'settings.debug.clearSecureStorage', {}) ?? 'セキュアストレージをクリア';
  @override
  String get logger => TranslationOverrides.string(_root.$meta, 'settings.debug.logger', {}) ?? 'ロガー';
}

// Path: settings.logging
class _TranslationsSettingsLoggingJaJp extends TranslationsSettingsLoggingEn {
  _TranslationsSettingsLoggingJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get logger => TranslationOverrides.string(_root.$meta, 'settings.logging.logger', {}) ?? 'Logger';
}

// Path: viewer.appBar
class _TranslationsViewerAppBarJaJp extends TranslationsViewerAppBarEn {
  _TranslationsViewerAppBarJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get hydrus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrus', {}) ?? 'Hydrus';
  @override
  String get cantStartSlideshow => TranslationOverrides.string(_root.$meta, 'viewer.appBar.cantStartSlideshow', {}) ?? 'スライドショーを開始できません';
  @override
  String get reachedLastLoadedItem => TranslationOverrides.string(_root.$meta, 'viewer.appBar.reachedLastLoadedItem', {}) ?? '最後に読み込まれたアイテムに到達しました';
  @override
  String get pause => TranslationOverrides.string(_root.$meta, 'viewer.appBar.pause', {}) ?? '一時停止';
  @override
  String get start => TranslationOverrides.string(_root.$meta, 'viewer.appBar.start', {}) ?? '開始';
  @override
  String get unfavourite => TranslationOverrides.string(_root.$meta, 'viewer.appBar.unfavourite', {}) ?? 'お気に入り解除';
  @override
  String get deselect => TranslationOverrides.string(_root.$meta, 'viewer.appBar.deselect', {}) ?? '選択解除';
  @override
  String get reloadWithScaling => TranslationOverrides.string(_root.$meta, 'viewer.appBar.reloadWithScaling', {}) ?? 'スケーリングして再読み込み';
  @override
  String get loadSampleQuality => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadSampleQuality', {}) ?? 'サンプル品質の読み込み';
  @override
  String get loadHighQuality => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadHighQuality', {}) ?? '高品質の読み込み';
  @override
  String get dropSnatchedStatus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.dropSnatchedStatus', {}) ?? 'ダウンロードステータスを削除';
  @override
  String get setSnatchedStatus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.setSnatchedStatus', {}) ?? 'ダウンロードステータスを設定';
  @override
  String get snatch => TranslationOverrides.string(_root.$meta, 'viewer.appBar.snatch', {}) ?? 'ダウンロード';
  @override
  String get forced => TranslationOverrides.string(_root.$meta, 'viewer.appBar.forced', {}) ?? '(強制)';
  @override
  String get hydrusShare => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusShare', {}) ?? 'Hydrus 共有';
  @override
  String get postURL => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURL', {}) ?? '投稿のURL';
  @override
  String get fileURL => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURL', {}) ?? 'ファイルのURL';
  @override
  String get shareFile => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareFile', {}) ?? 'ファイルの共有';
  @override
  String get alreadyDownloadingThisFile =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingThisFile', {}) ?? 'このファイルはすでに共有用にダウンロード中です、中止しますか？';
  @override
  String get alreadyDownloadingFile =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingFile', {}) ?? 'すでに共有用のファイルをダウンロードしています。現在のファイルを中止して新しいファイルを共有しますか？';
  @override
  String get current => TranslationOverrides.string(_root.$meta, 'viewer.appBar.current', {}) ?? '現在:';
  @override
  String get kNew => TranslationOverrides.string(_root.$meta, 'viewer.appBar.kNew', {}) ?? '新規:';
  @override
  String get abort => TranslationOverrides.string(_root.$meta, 'viewer.appBar.abort', {}) ?? 'キャンセル';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'viewer.appBar.error', {}) ?? 'エラー！';
  @override
  String get savingFileError => TranslationOverrides.string(_root.$meta, 'viewer.appBar.savingFileError', {}) ?? '共有前にファイルを保存する際に問題が発生しました';
  @override
  String get whatToShare => TranslationOverrides.string(_root.$meta, 'viewer.appBar.whatToShare', {}) ?? '何を共有しますか？';
  @override
  String get postURLWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURLWithTags', {}) ?? '投稿URLとタグ';
  @override
  String get fileURLWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURLWithTags', {}) ?? 'ファイルURLとタグ';
  @override
  String get file => TranslationOverrides.string(_root.$meta, 'viewer.appBar.file', {}) ?? 'ファイル';
  @override
  String get fileWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileWithTags', {}) ?? 'ファイルとタグ';
  @override
  String get selectTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.selectTags', {}) ?? 'タグを選択';
  @override
  String get whichUrlToShareToHydrus =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.whichUrlToShareToHydrus', {}) ?? 'Hydrusと共有するURLはどれですか？';
  @override
  String get hydrusNotConfigured => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusNotConfigured', {}) ?? 'Hydrusが設定されていません！';
  @override
  String get shareNew => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareNew', {}) ?? '新規を共有';
}

// Path: viewer.notes
class _TranslationsViewerNotesJaJp extends TranslationsViewerNotesEn {
  _TranslationsViewerNotesJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String coordinates({required int posX, required int posY}) =>
      TranslationOverrides.string(_root.$meta, 'viewer.notes.coordinates', {'posX': posX, 'posY': posY}) ?? 'X:${posX}, Y:${posY}';
  @override
  String get note => TranslationOverrides.string(_root.$meta, 'viewer.notes.note', {}) ?? 'ノート';
  @override
  String get notes => TranslationOverrides.string(_root.$meta, 'viewer.notes.notes', {}) ?? 'ノート';
}

// Path: viewer.tutorial
class _TranslationsViewerTutorialJaJp extends TranslationsViewerTutorialEn {
  _TranslationsViewerTutorialJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get images => TranslationOverrides.string(_root.$meta, 'viewer.tutorial.images', {}) ?? '画像';
  @override
  String get tapLongTapToggleImmersive =>
      TranslationOverrides.string(_root.$meta, 'viewer.tutorial.tapLongTapToggleImmersive', {}) ?? 'タップ/長押し: 没入モードを切り替え';
  @override
  String get doubleTapFitScreen =>
      TranslationOverrides.string(_root.$meta, 'viewer.tutorial.doubleTapFitScreen', {}) ?? 'ダブルタップ: 画面にフィット / オリジナルサイズ / ズームのリセット';
}

// Path: tabs.filters
class _TranslationsTabsFiltersJaJp extends TranslationsTabsFiltersEn {
  _TranslationsTabsFiltersJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get multibooru => TranslationOverrides.string(_root.$meta, 'tabs.filters.multibooru', {}) ?? 'Multibooru';
  @override
  String get loaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.loaded', {}) ?? 'ロード済み';
  @override
  String get notLoaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.notLoaded', {}) ?? '未ロード';
  @override
  String get tagType => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagType', {}) ?? 'タグのタイプ';
  @override
  String get duplicates => TranslationOverrides.string(_root.$meta, 'tabs.filters.duplicates', {}) ?? '重複タブ';
  @override
  String get checkDuplicatesOnSameBooru =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.checkDuplicatesOnSameBooru', {}) ?? '同じBooruでの重複のみを確認';
  @override
  String get emptySearchQuery => TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? '検索クエリが未指定のタブのみ';
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'tabs.filters.title', {}) ?? 'タブフィルター';
  @override
  String get all => TranslationOverrides.string(_root.$meta, 'tabs.filters.all', {}) ?? 'すべて';
  @override
  String get enabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.enabled', {}) ?? '有効';
  @override
  String get disabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.disabled', {}) ?? '無効';
  @override
  String get willAlsoEnableSorting => TranslationOverrides.string(_root.$meta, 'tabs.filters.willAlsoEnableSorting', {}) ?? '並び替えも有効になります';
  @override
  String get tagTypeFilterHelp => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagTypeFilterHelp', {}) ?? '選択したタイプのタグを少なくとも1つ含むタブをフィルターします';
  @override
  String get any => TranslationOverrides.string(_root.$meta, 'tabs.filters.any', {}) ?? 'すべて';
  @override
  String get apply => TranslationOverrides.string(_root.$meta, 'tabs.filters.apply', {}) ?? '適用';
}

// Path: tabs.move
class _TranslationsTabsMoveJaJp extends TranslationsTabsMoveEn {
  _TranslationsTabsMoveJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get moveToTop => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToTop', {}) ?? '一番上に移動';
  @override
  String get moveToBottom => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToBottom', {}) ?? '一番下に移動';
  @override
  String get tabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.tabNumber', {}) ?? 'タブ番号';
  @override
  String get invalidTabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidTabNumber', {}) ?? '無効なタブ番号';
  @override
  String get invalidInput => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidInput', {}) ?? '無効な入力';
  @override
  String get outOfRange => TranslationOverrides.string(_root.$meta, 'tabs.move.outOfRange', {}) ?? '範囲外';
  @override
  String get pleaseEnterValidTabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.pleaseEnterValidTabNumber', {}) ?? '有効なタブ番号を入力してください';
  @override
  String moveTo({required String formattedNumber}) =>
      TranslationOverrides.string(_root.$meta, 'tabs.move.moveTo', {'formattedNumber': formattedNumber}) ?? '#${formattedNumber} に移動';
  @override
  String get preview => TranslationOverrides.string(_root.$meta, 'tabs.move.preview', {}) ?? 'プレビュー:';
}

// Path: webview.navigation
class _TranslationsWebviewNavigationJaJp extends TranslationsWebviewNavigationEn {
  _TranslationsWebviewNavigationJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get enterUrlLabel => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterUrlLabel', {}) ?? 'URLを入力';
  @override
  String get enterCustomUrl => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterCustomUrl', {}) ?? 'カスタムURLを入力';
  @override
  String navigateTo({required String url}) => TranslationOverrides.string(_root.$meta, 'webview.navigation.navigateTo', {'url': url}) ?? '${url} へ移動';
  @override
  String get listCookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.listCookies', {}) ?? 'Cookieのリスト';
  @override
  String get clearCookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.clearCookies', {}) ?? 'Cookieをクリア';
  @override
  String get cookiesGone => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookiesGone', {}) ?? 'Cookieがありましたが、今はもうありません';
  @override
  String get getFavicon => TranslationOverrides.string(_root.$meta, 'webview.navigation.getFavicon', {}) ?? 'Faviconを取得';
  @override
  String get noFaviconFound => TranslationOverrides.string(_root.$meta, 'webview.navigation.noFaviconFound', {}) ?? 'Faviconが見つかりませんでした';
  @override
  String get host => TranslationOverrides.string(_root.$meta, 'webview.navigation.host', {}) ?? 'ホスト:';
  @override
  String get textAboveSelectable => TranslationOverrides.string(_root.$meta, 'webview.navigation.textAboveSelectable', {}) ?? '(上のテキストは選択可能です)';
  @override
  String get copyUrl => TranslationOverrides.string(_root.$meta, 'webview.navigation.copyUrl', {}) ?? 'URLをコピー';
  @override
  String get copiedUrlToClipboard => TranslationOverrides.string(_root.$meta, 'webview.navigation.copiedUrlToClipboard', {}) ?? 'URLをクリップボードにコピーしました';
  @override
  String get cookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookies', {}) ?? 'Cookies';
  @override
  String get favicon => TranslationOverrides.string(_root.$meta, 'webview.navigation.favicon', {}) ?? 'Favicon';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'webview.navigation.history', {}) ?? '履歴';
  @override
  String get noBackHistoryItem => TranslationOverrides.string(_root.$meta, 'webview.navigation.noBackHistoryItem', {}) ?? '戻る履歴はありません';
  @override
  String get noForwardHistoryItem => TranslationOverrides.string(_root.$meta, 'webview.navigation.noForwardHistoryItem', {}) ?? '進む履歴はありません';
}

// Path: preview.error
class _TranslationsPreviewErrorJaJp extends TranslationsPreviewErrorEn {
  _TranslationsPreviewErrorJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String loadingPage({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.loadingPage', {'pageNum': pageNum}) ?? 'ページ #${pageNum} の読み込み中…';
  @override
  String errorLoadingPage({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.errorLoadingPage', {'pageNum': pageNum}) ?? 'ページ #${pageNum} の読み込み中にエラーが発生しました';
  @override
  String startedAgo({required num seconds}) =>
      TranslationOverrides.plural(_root.$meta, 'preview.error.startedAgo', {'seconds': seconds}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
        seconds,
        one: '${seconds} 秒前から開始',
        few: '${seconds} 秒前から開始',
        many: '${seconds} 秒前から開始',
        other: '${seconds} 秒前から開始',
      );
  @override
  String get errorWithMessage => TranslationOverrides.string(_root.$meta, 'preview.error.errorWithMessage', {}) ?? 'ここをタップして再試行';
  @override
  String get tapToRetry => TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetry', {}) ?? 'ここをタップして再試行';
  @override
  String get tapToRetryIfStuck =>
      TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetryIfStuck', {}) ?? 'リクエストが停止しているか時間がかかりすぎている場合は、ここをタップして再試行できます';
  @override
  String get noResults => TranslationOverrides.string(_root.$meta, 'preview.error.noResults', {}) ?? '結果が見つかりませんでした';
  @override
  String get noResultsSubtitle => TranslationOverrides.string(_root.$meta, 'preview.error.noResultsSubtitle', {}) ?? '検索クエリを変更するか、タップして再試行できます';
  @override
  String get errorNoResultsLoaded => TranslationOverrides.string(_root.$meta, 'preview.error.errorNoResultsLoaded', {}) ?? 'エラー, 結果を読み込めませんでした';
  @override
  String get reachedEnd => TranslationOverrides.string(_root.$meta, 'preview.error.reachedEnd', {}) ?? '結果の最後に到達しました';
  @override
  String reachedEndSubtitle({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.reachedEndSubtitle', {'pageNum': pageNum}) ??
      '読み込まれたページ数: ${pageNum}\nここをタップして最後のページを再読み込み';
}

// Path: media.loading
class _TranslationsMediaLoadingJaJp extends TranslationsMediaLoadingEn {
  _TranslationsMediaLoadingJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String startedSecondsAgo({required int seconds}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.startedSecondsAgo', {'seconds': seconds}) ?? '${seconds} 秒前から開始';
  @override
  String get stopLoading => TranslationOverrides.string(_root.$meta, 'media.loading.stopLoading', {}) ?? '読み込みを停止';
  @override
  String get rendering => TranslationOverrides.string(_root.$meta, 'media.loading.rendering', {}) ?? 'ロード中…';
  @override
  String get loadingAndRenderingFromCache =>
      TranslationOverrides.string(_root.$meta, 'media.loading.loadingAndRenderingFromCache', {}) ?? 'キャッシュから読み込み中…';
  @override
  String get loadingFromCache => TranslationOverrides.string(_root.$meta, 'media.loading.loadingFromCache', {}) ?? 'キャッシュから読み込み中…';
  @override
  String get buffering => TranslationOverrides.string(_root.$meta, 'media.loading.buffering', {}) ?? 'バッファリング中…';
  @override
  String get loading => TranslationOverrides.string(_root.$meta, 'media.loading.loading', {}) ?? '読み込み中…';
  @override
  String get loadAnyway => TranslationOverrides.string(_root.$meta, 'media.loading.loadAnyway', {}) ?? 'とにかく読み込む';
  @override
  String get restartLoading => TranslationOverrides.string(_root.$meta, 'media.loading.restartLoading', {}) ?? '再度読み込む';
  @override
  late final _TranslationsMediaLoadingStopReasonsJaJp stopReasons = _TranslationsMediaLoadingStopReasonsJaJp._(_root);
  @override
  String get fileIsZeroBytes => TranslationOverrides.string(_root.$meta, 'media.loading.fileIsZeroBytes', {}) ?? '空のファイル';
  @override
  String fileSize({required String size}) => TranslationOverrides.string(_root.$meta, 'media.loading.fileSize', {'size': size}) ?? 'ファイルサイズ: ${size}';
  @override
  String sizeLimit({required String limit}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.sizeLimit', {'limit': limit}) ?? '制限: ${limit}';
  @override
  String get tryChangingVideoBackend =>
      TranslationOverrides.string(_root.$meta, 'media.loading.tryChangingVideoBackend', {}) ??
      '再生時に問題が頻繁に発生しますか？ [設定 > 動画 > プレーヤーのバックエンド] を変更してみてください';
}

// Path: media.video
class _TranslationsMediaVideoJaJp extends TranslationsMediaVideoEn {
  _TranslationsMediaVideoJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get videosDisabledOrNotSupported =>
      TranslationOverrides.string(_root.$meta, 'media.video.videosDisabledOrNotSupported', {}) ?? '動画は無効かサポートされていません';
  @override
  String get openVideoInExternalPlayer => TranslationOverrides.string(_root.$meta, 'media.video.openVideoInExternalPlayer', {}) ?? '外部プレイヤーで動画を開く';
  @override
  String get openVideoInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openVideoInBrowser', {}) ?? '動画をブラウザで開く';
  @override
  String get failedToLoadItemData => TranslationOverrides.string(_root.$meta, 'media.video.failedToLoadItemData', {}) ?? 'アイテムデータの読み込みに失敗しました';
  @override
  String get loadingItemData => TranslationOverrides.string(_root.$meta, 'media.video.loadingItemData', {}) ?? 'アイテムデータの読み込み中…';
  @override
  String get retry => TranslationOverrides.string(_root.$meta, 'media.video.retry', {}) ?? '再試行';
  @override
  String get openFileInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openFileInBrowser', {}) ?? 'ファイルをブラウザで開く';
  @override
  String get openPostInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openPostInBrowser', {}) ?? '投稿をブラウザで開く';
  @override
  String get currentlyChecking => TranslationOverrides.string(_root.$meta, 'media.video.currentlyChecking', {}) ?? '現在確認中:';
  @override
  String unknownFileFormat({required String fileExt}) =>
      TranslationOverrides.string(_root.$meta, 'media.video.unknownFileFormat', {'fileExt': fileExt}) ??
      '不明なファイルフォーマットです (.${fileExt})。ここをタップしてブラウザで開く';
}

// Path: settings.interface.previewQualityValues
class _TranslationsSettingsInterfacePreviewQualityValuesJaJp extends TranslationsSettingsInterfacePreviewQualityValuesEn {
  _TranslationsSettingsInterfacePreviewQualityValuesJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get thumbnail => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.thumbnail', {}) ?? 'サムネイル';
  @override
  String get sample => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.sample', {}) ?? 'サンプル';
}

// Path: settings.interface.previewDisplayModeValues
class _TranslationsSettingsInterfacePreviewDisplayModeValuesJaJp extends TranslationsSettingsInterfacePreviewDisplayModeValuesEn {
  _TranslationsSettingsInterfacePreviewDisplayModeValuesJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get staggered => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.staggered', {}) ?? '適応型';
  @override
  String get square => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.square', {}) ?? '正方形';
  @override
  String get rectangle => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.rectangle', {}) ?? '長方形';
}

// Path: settings.interface.appModeValues
class _TranslationsSettingsInterfaceAppModeValuesJaJp extends TranslationsSettingsInterfaceAppModeValuesEn {
  _TranslationsSettingsInterfaceAppModeValuesJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get desktop => TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.desktop', {}) ?? 'デスクトップ';
  @override
  String get mobile => TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.mobile', {}) ?? 'モバイル';
}

// Path: settings.interface.handSideValues
class _TranslationsSettingsInterfaceHandSideValuesJaJp extends TranslationsSettingsInterfaceHandSideValuesEn {
  _TranslationsSettingsInterfaceHandSideValuesJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get left => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.left', {}) ?? '左';
  @override
  String get right => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.right', {}) ?? '右';
}

// Path: settings.viewer.shareActionValues
class _TranslationsSettingsViewerShareActionValuesJaJp extends TranslationsSettingsViewerShareActionValuesEn {
  _TranslationsSettingsViewerShareActionValuesJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get hydrus => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.hydrus', {}) ?? 'Hydrus';
  @override
  String get ask => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.ask', {}) ?? '尋ねる';
  @override
  String get postUrl => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrl', {}) ?? '投稿のURL';
  @override
  String get postUrlWithTags => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrlWithTags', {}) ?? '投稿URLとタグ';
  @override
  String get fileUrl => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrl', {}) ?? 'ファイルのURL';
  @override
  String get fileUrlWithTags => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrlWithTags', {}) ?? 'ファイルURLとタグ';
  @override
  String get file => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.file', {}) ?? 'ファイル';
  @override
  String get fileWithTags => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileWithTags', {}) ?? 'ファイルとタグ';
}

// Path: settings.viewer.imageQualityValues
class _TranslationsSettingsViewerImageQualityValuesJaJp extends TranslationsSettingsViewerImageQualityValuesEn {
  _TranslationsSettingsViewerImageQualityValuesJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get sample => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.sample', {}) ?? 'サンプル';
  @override
  String get fullRes => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.fullRes', {}) ?? 'オリジナル (フル)';
}

// Path: settings.viewer.scrollDirectionValues
class _TranslationsSettingsViewerScrollDirectionValuesJaJp extends TranslationsSettingsViewerScrollDirectionValuesEn {
  _TranslationsSettingsViewerScrollDirectionValuesJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get horizontal => TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.horizontal', {}) ?? '水平 (横)';
  @override
  String get vertical => TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.vertical', {}) ?? '垂直 (縦)';
}

// Path: settings.viewer.toolbarPositionValues
class _TranslationsSettingsViewerToolbarPositionValuesJaJp extends TranslationsSettingsViewerToolbarPositionValuesEn {
  _TranslationsSettingsViewerToolbarPositionValuesJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get top => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.top', {}) ?? '上部';
  @override
  String get bottom => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.bottom', {}) ?? '下部';
}

// Path: settings.viewer.buttonPositionValues
class _TranslationsSettingsViewerButtonPositionValuesJaJp extends TranslationsSettingsViewerButtonPositionValuesEn {
  _TranslationsSettingsViewerButtonPositionValuesJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get disabled => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.disabled', {}) ?? '無効';
  @override
  String get left => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.left', {}) ?? '左';
  @override
  String get right => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.right', {}) ?? '右';
}

// Path: settings.video.cacheModes
class _TranslationsSettingsVideoCacheModesJaJp extends TranslationsSettingsVideoCacheModesEn {
  _TranslationsSettingsVideoCacheModesJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.title', {}) ?? 'ビデオキャッシュモード';
  @override
  String get streamMode => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamMode', {}) ?? '- ストリーム - キャッシュなし、できるだけ早く再生を開始';
  @override
  String get cacheMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheMode', {}) ?? '- キャッシュ - ファイルをデバイスストレージに保存、ダウンロード完了後に再生';
  @override
  String get streamCacheMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamCacheMode', {}) ?? '- ストリーム+キャッシュ - 両方の組み合わせ、現在は2重ダウンロードが発生します';
  @override
  String get cacheNote =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheNote', {}) ?? '[注意]: 動画は「メディアをキャッシュ」が有効になっている場合のみキャッシュされます。';
  @override
  String get desktopWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.desktopWarning', {}) ??
      '[警告]: デスクトップ版では、一部のBooruで ストリーム モードが正しく動作しない場合があります。';
}

// Path: settings.video.cacheModeValues
class _TranslationsSettingsVideoCacheModeValuesJaJp extends TranslationsSettingsVideoCacheModeValuesEn {
  _TranslationsSettingsVideoCacheModeValuesJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get stream => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.stream', {}) ?? 'ストリーム';
  @override
  String get cache => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.cache', {}) ?? 'キャッシュ';
  @override
  String get streamCache => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.streamCache', {}) ?? 'ストリーム+キャッシュ';
}

// Path: settings.video.videoBackendModeValues
class _TranslationsSettingsVideoVideoBackendModeValuesJaJp extends TranslationsSettingsVideoVideoBackendModeValuesEn {
  _TranslationsSettingsVideoVideoBackendModeValuesJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get normal => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.normal', {}) ?? 'デフォルト';
  @override
  String get mpv => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mpv', {}) ?? 'MPV';
  @override
  String get mdk => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mdk', {}) ?? 'MDK';
}

// Path: media.loading.stopReasons
class _TranslationsMediaLoadingStopReasonsJaJp extends TranslationsMediaLoadingStopReasonsEn {
  _TranslationsMediaLoadingStopReasonsJaJp._(TranslationsJaJp root) : this._root = root, super.internal(root);

  final TranslationsJaJp _root; // ignore: unused_field

  // Translations
  @override
  String get stoppedByUser => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.stoppedByUser', {}) ?? 'ユーザーによる停止';
  @override
  String get loadingError => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.loadingError', {}) ?? 'ロード時エラー';
  @override
  String get fileIsTooBig => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.fileIsTooBig', {}) ?? 'ファイルが大きすぎます';
  @override
  String get hiddenByFilters => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.hiddenByFilters', {}) ?? 'フィルターにより非表示:';
  @override
  String get videoError => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.videoError', {}) ?? '動画エラー';
}

/// The flat map containing all translations for locale <ja-JP>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsJaJp {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
          'locale' => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'ja-JP',
          'localeName' => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? '日本語',
          'appName' => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher',
          'error' => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'エラー',
          'errorExclamation' => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'エラー！',
          'settings.booru.title' => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Booru & 検索',
          'settings.booru.defaultTags' => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? 'デフォルトのタグ',
          'settings.booru.itemsPerPage' => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'ページごとに取得される項目数',
          'settings.booru.itemsPerPageTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'いくつかのbooruでは設定が無視される場合があります',
          'settings.booru.itemsPerPagePlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPagePlaceholder', {}) ?? '10-100',
          'settings.booru.addBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Booruを追加',
          'settings.booru.shareBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? 'Booruとその設定を共有',
          'settings.booru.shareBooruDialogMsgMobile' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
                '${booruName} とそのサイトの設定が共有されます。\n\nログインやAPIキーなどの認証情報を含めますか？',
          'settings.booru.shareBooruDialogMsgDesktop' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
                '${booruName} 設定リンクをクリップボードにコピーします。\n\nログインやAPIキーなどの認証情報を含めますか？',
          'settings.booru.booruSharing' => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? 'Booruの共有',
          'settings.booru.addedBoorus' => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? 'Booruリスト',
          'settings.booru.editBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? 'Booruの設定を編集',
          'settings.booru.importBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? 'クリップボードからBooru設定をインポート',
          'settings.booru.onlyLSURLsSupported' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ?? 'loli.snatcher URLのみがサポートされています',
          'settings.booru.deleteBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? 'Booruの設定を削除',
          'settings.booru.deleteBooruError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ?? 'Booruの設定削除中に問題が発生しました！',
          'settings.booru.booruDeleted' => TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? 'Booruの設定が削除されました',
          'settings.booru.booruDropdownInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ??
                '選択されたBooruは設定保存後、デフォルトになります。\n\nデフォルトのBooruはドロップダウンメニューの最初に表示されます',
          'settings.booru.changeDefaultBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? 'デフォルトのBooruを変更しますか？',
          'settings.booru.changeTo' => TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? 'このBooruに変更: ',
          'settings.booru.keepCurrentBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? '[いいえ] をタップ: ',
          'settings.booru.changeToNewBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? '[はい] をタップすると: ',
          'settings.booru.booruConfigLinkCopied' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ?? 'Booruの設定リンクがクリップボードにコピーされました',
          'settings.booru.noBooruSelected' => TranslationOverrides.string(_root.$meta, 'settings.booru.noBooruSelected', {}) ?? 'Booruが未選択です！',
          'settings.booru.cantDeleteThisBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? 'このBooruは削除できません！',
          'settings.booru.removeRelatedTabsFirst' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.removeRelatedTabsFirst', {}) ?? '関連するタブを先に削除してください',
          'settings.booru.booruSharingMsgAndroid' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ??
                'Android 12 以降のアプリで Booru設定リンクを自動的に開く方法:\n1) 下のボタンをタップして、アプリの デフォルトで開く 設定を開きます\n2) «リンクを追加» をタップし、利用可能なすべてのオプションを選択します',
          'settings.interface.title' => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? 'インターフェース',
          'settings.interface.appUIMode' => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIMode', {}) ?? 'アプリUIモード',
          'settings.interface.appUIModeWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarningTitle', {}) ?? 'アプリUIモード',
          'settings.interface.appUIModeWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarning', {}) ?? 'デスクトップモードを使用しますか？モバイルでは問題が発生する可能性があり、非推奨です。',
          'settings.interface.appUIModeHelpMobile' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpMobile', {}) ?? '- モバイル - 標準のモバイル用UI',
          'settings.interface.appUIModeHelpDesktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpDesktop', {}) ?? '- デスクトップ - Ahoviewer スタイルのUI [非推奨！再設計が必要です]',
          'settings.interface.appUIModeHelpWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpWarning', {}) ??
                '[警告]: 携帯電話でUIモードをデスクトップに設定しないでください。アプリが壊れて、Booru設定を含むすべての設定を消去しなければならない可能性があります。',
          'settings.interface.handSide' => TranslationOverrides.string(_root.$meta, 'settings.interface.handSide', {}) ?? '利き手',
          'settings.interface.handSideHelp' => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideHelp', {}) ?? 'UIの位置を選択した側に調整します',
          'settings.interface.showSearchBarInPreviewGrid' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.showSearchBarInPreviewGrid', {}) ?? 'プレビューグリッドに検索バーを表示',
          'settings.interface.moveInputToTopInSearchView' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.moveInputToTopInSearchView', {}) ?? '検索時に検索バーを一番上に移動',
          'settings.interface.searchViewQuickActionsPanel' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewQuickActionsPanel', {}) ?? '検索時にクイックアクションパネルを表示',
          'settings.interface.searchViewInputAutofocus' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewInputAutofocus', {}) ?? '検索時に自動的に入力欄にフォーカス',
          'settings.interface.disableVibration' => TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibration', {}) ?? '振動を無効化',
          'settings.interface.disableVibrationSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibrationSubtitle', {}) ?? '無効にしても一部のアクションで振動が発生する可能性があります',
          'settings.interface.usePredictiveBack' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.usePredictiveBack', {}) ?? 'スワイプキャンセルアニメーション',
          'settings.interface.previewColumnsPortrait' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsPortrait', {}) ?? 'プレビュー列数 (縦)',
          'settings.interface.previewColumnsLandscape' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsLandscape', {}) ?? 'プレビュー列数 (横)',
          'settings.interface.previewQuality' => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQuality', {}) ?? 'プレビュー品質',
          'settings.interface.previewQualityHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelp', {}) ?? 'プレビューグリッドの画像解像度を指定します',
          'settings.interface.previewQualityHelpSample' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpSample', {}) ??
                ' - サンプル - 中解像度。アプリは、サムネイル品質もプレースホルダーとして読み込みます',
          'settings.interface.previewQualityHelpThumbnail' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpThumbnail', {}) ?? ' - サムネイル - 低解像度',
          'settings.interface.previewQualityValues.thumbnail' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.thumbnail', {}) ?? 'サムネイル',
          'settings.interface.previewQualityValues.sample' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.sample', {}) ?? 'サンプル',
          'settings.interface.previewQualityHelpNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpNote', {}) ??
                '[注意]: サンプル品質ではパフォーマンスが著しく低下する場合があります。特にプレビューグリッドに列が多すぎる場合に顕著です',
          'settings.interface.previewDisplay' => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplay', {}) ?? 'プレビュー表示方法',
          'settings.interface.previewDisplayFallback' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallback', {}) ?? 'プレビュー表示のフォールバック',
          'settings.interface.previewDisplayFallbackHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallbackHelp', {}) ?? 'これは、適応型オプションが使用できない場合に使用されます',
          'settings.interface.previewDisplayModeValues.staggered' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.staggered', {}) ?? '適応型',
          'settings.interface.previewDisplayModeValues.square' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.square', {}) ?? '正方形',
          'settings.interface.previewDisplayModeValues.rectangle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.rectangle', {}) ?? '長方形',
          'settings.interface.dontScaleImages' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImages', {}) ?? '画像のスケーリングを行わない',
          'settings.interface.dontScaleImagesSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesSubtitle', {}) ?? 'パフォーマンスに影響する可能性があります',
          'settings.interface.dontScaleImagesWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningTitle', {}) ?? '注意',
          'settings.interface.dontScaleImagesWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarning', {}) ?? '画像のスケーリングを無効にしてよろしいですか？',
          'settings.interface.dontScaleImagesWarningMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningMsg', {}) ?? '特に古いデバイスでは、パフォーマンスに悪影響を及ぼす可能性があります',
          'settings.interface.gifThumbnails' => TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnails', {}) ?? 'GIFサムネイル',
          'settings.interface.gifThumbnailsRequires' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnailsRequires', {}) ?? '«画像のスケーリングを行わない» が必要です',
          'settings.interface.scrollPreviewsButtonsPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.scrollPreviewsButtonsPosition', {}) ?? 'スクロールプレビューボタンの位置',
          'settings.interface.mouseWheelScrollModifier' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.mouseWheelScrollModifier', {}) ?? 'マウスホイールのスクロール乗数',
          'settings.interface.scrollModifier' => TranslationOverrides.string(_root.$meta, 'settings.interface.scrollModifier', {}) ?? 'スクロール乗数',
          'settings.interface.appModeValues.desktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.desktop', {}) ?? 'デスクトップ',
          'settings.interface.appModeValues.mobile' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.mobile', {}) ?? 'モバイル',
          'settings.interface.handSideValues.left' => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.left', {}) ?? '左',
          'settings.interface.handSideValues.right' => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.right', {}) ?? '右',
          'settings.theme.title' => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? 'テーマ',
          'settings.theme.themeMode' => TranslationOverrides.string(_root.$meta, 'settings.theme.themeMode', {}) ?? 'テーマモード',
          'settings.theme.blackBg' => TranslationOverrides.string(_root.$meta, 'settings.theme.blackBg', {}) ?? '黒の背景',
          'settings.theme.useDynamicColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? 'ダイナミックカラーを使用',
          'settings.theme.android12PlusOnly' => TranslationOverrides.string(_root.$meta, 'settings.theme.android12PlusOnly', {}) ?? 'Android 12+ が必要',
          'settings.theme.theme' => TranslationOverrides.string(_root.$meta, 'settings.theme.theme', {}) ?? 'テーマ',
          'settings.theme.primaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? 'プライマリカラー',
          'settings.theme.secondaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? 'セカンダリカラー',
          'settings.theme.enableDrawerMascot' => TranslationOverrides.string(_root.$meta, 'settings.theme.enableDrawerMascot', {}) ?? 'ドロワーマスコットを有効化',
          'settings.theme.setCustomMascot' => TranslationOverrides.string(_root.$meta, 'settings.theme.setCustomMascot', {}) ?? 'カスタムマスコットを指定',
          'settings.theme.removeCustomMascot' => TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? 'カスタムマスコットを削除',
          'settings.theme.currentMascotPath' => TranslationOverrides.string(_root.$meta, 'settings.theme.currentMascotPath', {}) ?? '現在のマスコットのパス',
          'settings.theme.system' => TranslationOverrides.string(_root.$meta, 'settings.theme.system', {}) ?? 'システム',
          'settings.theme.light' => TranslationOverrides.string(_root.$meta, 'settings.theme.light', {}) ?? 'ライトテーマ',
          'settings.theme.dark' => TranslationOverrides.string(_root.$meta, 'settings.theme.dark', {}) ?? 'ダークテーマ',
          'settings.theme.pink' => TranslationOverrides.string(_root.$meta, 'settings.theme.pink', {}) ?? 'ピンク',
          'settings.theme.purple' => TranslationOverrides.string(_root.$meta, 'settings.theme.purple', {}) ?? 'パープル',
          'settings.theme.blue' => TranslationOverrides.string(_root.$meta, 'settings.theme.blue', {}) ?? 'ブルー',
          'settings.theme.teal' => TranslationOverrides.string(_root.$meta, 'settings.theme.teal', {}) ?? '鴨の羽色',
          'settings.theme.red' => TranslationOverrides.string(_root.$meta, 'settings.theme.red', {}) ?? 'レッド',
          'settings.theme.green' => TranslationOverrides.string(_root.$meta, 'settings.theme.green', {}) ?? 'グリーン',
          'settings.theme.halloween' => TranslationOverrides.string(_root.$meta, 'settings.theme.halloween', {}) ?? 'ハロウィン',
          'settings.theme.custom' => TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? 'カスタム',
          'settings.theme.selectColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.selectColor', {}) ?? '色の選択',
          'settings.theme.selectedColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColor', {}) ?? '選択済みの色',
          'settings.theme.selectedColorAndShades' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColorAndShades', {}) ?? '選択済みの色の色合い',
          'settings.theme.fontFamily' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontFamily', {}) ?? 'フォント',
          'settings.theme.systemDefault' => TranslationOverrides.string(_root.$meta, 'settings.theme.systemDefault', {}) ?? 'システムのデフォルト',
          'settings.theme.viewMoreFonts' => TranslationOverrides.string(_root.$meta, 'settings.theme.viewMoreFonts', {}) ?? 'さらに見る',
          'settings.theme.fontPreviewText' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.fontPreviewText', {}) ??
                'あのイーハトーヴォのすきとおった風、夏でも底に冷たさをもつ青いそら、うつくしい森で飾られたモリーオ市、郊外のぎらぎらひかる草の波。',
          'settings.theme.customFont' => TranslationOverrides.string(_root.$meta, 'settings.theme.customFont', {}) ?? 'カスタムフォント',
          'settings.theme.customFontSubtitle' => TranslationOverrides.string(_root.$meta, 'settings.theme.customFontSubtitle', {}) ?? 'Google Fontから',
          'settings.theme.fontName' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontName', {}) ?? 'フォント名',
          'settings.theme.customFontHint' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.customFontHint', {}) ?? 'fonts.google.com でフォントを閲覧',
          'settings.theme.fontNotFound' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontNotFound', {}) ?? 'フォントが見つかりません',
          'settings.viewer.title' => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? 'ビューアー',
          'settings.viewer.shareActionValues.hydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.hydrus', {}) ?? 'Hydrus',
          'settings.viewer.shareActionValues.ask' => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.ask', {}) ?? '尋ねる',
          'settings.viewer.shareActionValues.postUrl' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrl', {}) ?? '投稿のURL',
          'settings.viewer.shareActionValues.postUrlWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrlWithTags', {}) ?? '投稿URLとタグ',
          'settings.viewer.shareActionValues.fileUrl' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrl', {}) ?? 'ファイルのURL',
          'settings.viewer.shareActionValues.fileUrlWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrlWithTags', {}) ?? 'ファイルURLとタグ',
          'settings.viewer.shareActionValues.file' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.file', {}) ?? 'ファイル',
          'settings.viewer.shareActionValues.fileWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileWithTags', {}) ?? 'ファイルとタグ',
          'settings.viewer.imageQualityValues.sample' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.sample', {}) ?? 'サンプル',
          'settings.viewer.imageQualityValues.fullRes' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.fullRes', {}) ?? 'オリジナル (フル)',
          'settings.viewer.kannaLoadingGif' => TranslationOverrides.string(_root.$meta, 'settings.viewer.kannaLoadingGif', {}) ?? '読み込み時にカンナのGIFを表示',
          'settings.viewer.preloadAmount' => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadAmount', {}) ?? 'プリロード数',
          'settings.viewer.preloadSizeLimit' => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimit', {}) ?? 'プリロードサイズ制限',
          'settings.viewer.preloadSizeLimitSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimitSubtitle', {}) ?? '(GB), 0 で無制限',
          'settings.viewer.preloadHeightLimit' => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimit', {}) ?? 'プリロード高さ制限',
          'settings.viewer.preloadHeightLimitSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimitSubtitle', {}) ?? '(ピクセル), 0 で無制限',
          'settings.viewer.imageQuality' => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQuality', {}) ?? '画像品質',
          'settings.viewer.viewerScrollDirection' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerScrollDirection', {}) ?? 'ビューアーのスクロール方向',
          'settings.viewer.viewerToolbarPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerToolbarPosition', {}) ?? 'ビューアーのツールバー位置',
          'settings.viewer.zoomButtonPosition' => TranslationOverrides.string(_root.$meta, 'settings.viewer.zoomButtonPosition', {}) ?? 'ズームボタンの位置',
          'settings.viewer.changePageButtonsPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.changePageButtonsPosition', {}) ?? 'ページ変更ボタンの位置',
          'settings.viewer.hideToolbarWhenOpeningViewer' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.hideToolbarWhenOpeningViewer', {}) ?? 'ビューアーを開いたときにツールバーを非表示にする',
          'settings.viewer.expandDetailsByDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.expandDetailsByDefault', {}) ?? 'デフォルトで情報の詳細を展開',
          'settings.viewer.hideTranslationNotesByDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.hideTranslationNotesByDefault', {}) ?? '翻訳ノートをデフォルトで非表示',
          'settings.viewer.enableRotation' => TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotation', {}) ?? '画像の回転を有効化',
          'settings.viewer.enableRotationSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotationSubtitle', {}) ?? 'ダブルタップで元に戻す',
          'settings.viewer.toolbarButtonsOrder' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarButtonsOrder', {}) ?? 'ツールバーボタンの順番',
          'settings.viewer.buttonsOrder' => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonsOrder', {}) ?? 'ボタンの順番',
          'settings.viewer.longPressToChangeItemOrder' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToChangeItemOrder', {}) ?? '長押しすると項目の順番を移動できます。',
          'settings.viewer.atLeast4ButtonsVisibleOnToolbar' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.atLeast4ButtonsVisibleOnToolbar', {}) ?? 'このリストの少なくとも4つのボタンがツールバーに常に表示されます。',
          'settings.viewer.otherButtonsWillGoIntoOverflow' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.otherButtonsWillGoIntoOverflow', {}) ?? 'その他のボタンはオーバーフローメニュー(3つのドット)に表示されます。',
          'settings.viewer.longPressToMoveItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToMoveItems', {}) ?? '長押しして項目を移動',
          'settings.viewer.onlyForVideos' => TranslationOverrides.string(_root.$meta, 'settings.viewer.onlyForVideos', {}) ?? '動画にのみ表示',
          'settings.viewer.thisButtonCannotBeDisabled' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.thisButtonCannotBeDisabled', {}) ?? 'このボタンは無効にできません',
          'settings.viewer.defaultShareAction' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.defaultShareAction', {}) ?? 'デフォルトの共有アクション',
          'settings.viewer.shareActions' => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActions', {}) ?? '共有アクション',
          'settings.viewer.shareActionsAsk' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsAsk', {}) ?? '- 尋ねる - 常に何を共有するか質問します',
          'settings.viewer.shareActionsPostURL' => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURL', {}) ?? '- 投稿のURL',
          'settings.viewer.shareActionsFileURL' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFileURL', {}) ??
                '- ファイルのURL - 元のファイルへの直接リンクを共有します (一部サイトでは機能しない場合があります)',
          'settings.viewer.shareActionsPostURLFileURLFileWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURLFileURLFileWithTags', {}) ??
                '- 投稿URL/ファイルURL/ファイル とタグ - 選択したURL/ファイルと一緒にタグを共有します',
          'settings.viewer.shareActionsFile' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFile', {}) ??
                '- ファイル - ファイル自体を共有します。読み込みに時間がかかる場合があり、進行状況は共有ボタンに表示されます',
          'settings.viewer.shareActionsNoteIfFileSavedInCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsNoteIfFileSavedInCache', {}) ??
                '[注意]: ファイルがキャッシュに保存されている場合はそこから読み込まれ、そうでない場合はネットワークから再度読み込まれます。',
          'settings.viewer.shareActionsTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsTip', {}) ?? '[ヒント]: 共有ボタンを長押しすると、共有アクションメニューを開くことができます。',
          'settings.viewer.useVolumeButtonsForScrolling' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.useVolumeButtonsForScrolling', {}) ?? '音量ボタンを使用してスクロール',
          'settings.viewer.volumeButtonsScrolling' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrolling', {}) ?? '音量ボタンスクロール',
          'settings.viewer.volumeButtonsScrollingHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollingHelp', {}) ?? '音量ボタンを使用してプレビューとビューアーをスクロールします',
          'settings.viewer.volumeButtonsVolumeDown' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeDown', {}) ?? ' - 音量下 - 次の項目',
          'settings.viewer.volumeButtonsVolumeUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeUp', {}) ?? ' - 音量上 - 前の項目',
          'settings.viewer.volumeButtonsInViewer' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsInViewer', {}) ?? 'ビューアー内:',
          'settings.viewer.volumeButtonsToolbarVisible' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarVisible', {}) ?? ' - ツールバーが表示されている場合 - 音量を調整',
          'settings.viewer.volumeButtonsToolbarHidden' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarHidden', {}) ?? ' - ツールバーが表示されていない場合 - スクロール',
          'settings.viewer.volumeButtonsScrollSpeed' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollSpeed', {}) ?? 'ボリュームボタンでのスクロール速度',
          'settings.viewer.slideshowDurationInMs' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowDurationInMs', {}) ?? 'スライドショー間隔 (ms)',
          'settings.viewer.slideshow' => TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshow', {}) ?? 'スライドショー',
          'settings.viewer.preventDeviceFromSleeping' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preventDeviceFromSleeping', {}) ?? 'デバイスがスリープ状態にならないようにする',
          'settings.viewer.viewerOpenCloseAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerOpenCloseAnimation', {}) ?? 'ビューアーの開閉アニメーション',
          'settings.viewer.viewerPageChangeAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerPageChangeAnimation', {}) ?? 'ビューアーページ変更アニメーション',
          'settings.viewer.usingDefaultAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.usingDefaultAnimation', {}) ?? 'デフォルトのアニメーションを使用',
          'settings.viewer.usingCustomAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.usingCustomAnimation', {}) ?? 'カスタムのアニメーションを使用',
          'settings.viewer.scrollDirectionValues.horizontal' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.horizontal', {}) ?? '水平 (横)',
          'settings.viewer.scrollDirectionValues.vertical' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.vertical', {}) ?? '垂直 (縦)',
          'settings.viewer.toolbarPositionValues.top' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.top', {}) ?? '上部',
          'settings.viewer.toolbarPositionValues.bottom' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.bottom', {}) ?? '下部',
          'settings.viewer.buttonPositionValues.disabled' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.disabled', {}) ?? '無効',
          'settings.viewer.buttonPositionValues.left' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.left', {}) ?? '左',
          'settings.viewer.buttonPositionValues.right' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.right', {}) ?? '右',
          'settings.viewer.slideshowWIPNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowWIPNote', {}) ?? '[作業中] 動画/GIFは手動スクロールのみ',
          'settings.viewer.shareActionsHydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsHydrus', {}) ?? '- Hydrus - 投稿のURLをインポートのためにHydrusに送信',
          'settings.title' => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? '設定',
          'settings.language.title' => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? '言語 - Language',
          'settings.language.system' => TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? 'システム',
          'settings.language.helpUsTranslate' => TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? '翻訳に貢献する',
          'settings.language.visitForDetails' =>
            TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ??
                '詳細については、 <a href=\'https://github.com/NO-ob/LoliSnatcher_Droid/wiki/Localization\'>GitHub</a> を確認するか、下の画像をタップしてWeblateにアクセスできます',
          'settings.dirPicker.yes' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.yes', {}) ?? 'はい',
          'settings.dirPicker.no' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.no', {}) ?? 'いいえ',
          'settings.dirPicker.directoryName' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryName', {}) ?? 'ディレクトリ名',
          'settings.dirPicker.selectADirectory' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.selectADirectory', {}) ?? 'ディレクトリを選択',
          'settings.dirPicker.closeWithoutChoosing' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.closeWithoutChoosing', {}) ?? 'ディレクトリを選択せずにピッカーを閉じますか？',
          'settings.dirPicker.error' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.error', {}) ?? 'エラー！',
          'settings.dirPicker.failedToCreateDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.failedToCreateDirectory', {}) ?? 'ディレクトリの作成に失敗しました',
          'settings.dirPicker.directoryNotWritable' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryNotWritable', {}) ?? 'ディレクトリは書き込み不可です！',
          'settings.dirPicker.newDirectory' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.newDirectory', {}) ?? '新規ディレクトリ',
          'settings.dirPicker.create' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.create', {}) ?? '作成',
          'settings.booruEditor.title' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? 'Booru エディター',
          'settings.booruEditor.testBooruFailedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'Booruのテストに失敗',
          'settings.booruEditor.testBooruFailedMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ??
                '構成パラメータが正しくない、booruがAPIアクセスを許可していない、リクエストがデータを返さない、またはネットワークエラーが発生しました。',
          'settings.booruEditor.saveBooru' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Booruを保存',
          'settings.booruEditor.runningTest' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? 'テストの実行中…',
          'settings.booruEditor.booruConfigExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? 'このBooruの設定は既に存在しています',
          'settings.booruEditor.booruSameNameExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ?? '同じ名前のBooruの設定がすでに存在します',
          'settings.booruEditor.booruSameUrlExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ?? '同じURLのBooruの設定がすでに存在しています',
          'settings.booruEditor.thisBooruConfigWontBeAdded' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ?? 'このBooru設定は追加されません',
          'settings.booruEditor.booruConfigSaved' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? 'Booruの設定が保存されました',
          'settings.booruEditor.booruName' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? 'Booruの名前',
          'settings.booruEditor.booruConfigShouldSave' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigShouldSave', {}) ?? 'このBooru設定を保存',
          'settings.booruEditor.booruConfigSelectedType' =>
            ({required String booruType}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSelectedType', {'booruType': booruType}) ??
                '選択/自動検出されたBooruタイプ: ${booruType}',
          'settings.booruEditor.booruUrl' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? 'BooruのURL',
          'settings.booruEditor.existingTabsNeedReload' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ??
                '変更を適用するには、このBooruに関連する既存のタブを再読み込みする必要があります！',
          'settings.booruEditor.failedVerifyApiHydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ?? 'HydrusのAPIアクセスを検証できませんでした',
          'settings.booruEditor.accessKeyRequestedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? 'アクセスキーをリクエストしました',
          'settings.booruEditor.accessKeyRequestedMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ??
                'Hydrus上でokayをタップして許可します。その後、Booruをテストすることができます',
          'settings.booruEditor.accessKeyFailedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? 'アクセスキーの取得に失敗',
          'settings.booruEditor.accessKeyFailedMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ?? 'Hydrusでリクエストウィンドウを開いていますか？',
          'settings.booruEditor.hydrusInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ??
                'Hydrusのキーを取得するには、Hydrus クライアントでリクエストダイアログを開く必要があります: Services > Review services > Client API > Add > From API request',
          'settings.booruEditor.getHydrusApiKey' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? 'Hydrus APIキーを取得',
          'settings.booruEditor.booruNameRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? 'Booruの名前の設定が必要です！',
          'settings.booruEditor.booruUrlRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? 'BooruのURLの設定が必要です！',
          'settings.booruEditor.booruType' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruType', {}) ?? 'Booruのタイプ',
          'settings.booruEditor.booruFavicon' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? 'FaviconのURL',
          'settings.booruEditor.booruFaviconPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '(空白の場合は自動で入力されます)',
          'settings.booruEditor.booruDefTags' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? 'デフォルトのタグ',
          'settings.booruEditor.booruDefTagsPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTagsPlaceholder', {}) ?? 'Booruを開いたときのデフォルトのタグ',
          'settings.booruEditor.booruDefaultInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefaultInstructions', {}) ?? '一部のBooruでは、以下のフィールドが必須の場合があります',
          'settings.cache.title' => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? 'ダウンロードとキャッシュ',
          'settings.cache.snatchQuality' => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchQuality', {}) ?? 'ダウンロードの品質',
          'settings.cache.snatchCooldown' => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchCooldown', {}) ?? 'ダウンロードの間隔 (ミリ秒)',
          'settings.cache.snatchItemsOnFavouriting' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.snatchItemsOnFavouriting', {}) ?? 'お気に入りしたアイテムをダウンロード',
          'settings.cache.favouriteItemsOnSnatching' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.favouriteItemsOnSnatching', {}) ?? 'ダウンロードしたアイテムをお気に入りに追加',
          'settings.cache.cacheTypeThumbnails' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeThumbnails', {}) ?? 'サムネイル',
          'settings.cache.cacheTypeSamples' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeSamples', {}) ?? 'サンプル',
          'settings.cache.cacheMedia' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheMedia', {}) ?? 'メディアをキャッシュ',
          'settings.cache.videoCacheNoteEnable' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheNoteEnable', {}) ?? '[注意]: 動画は「メディアをキャッシュ」が有効になっている場合のみキャッシュされます。',
          'settings.cache.pleaseEnterAValidTimeout' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.pleaseEnterAValidTimeout', {}) ?? '有効なタイムアウト値を入力してください',
          'settings.cache.biggerThan10' => TranslationOverrides.string(_root.$meta, 'settings.cache.biggerThan10', {}) ?? '10msより大きい値を入力してください',
          'settings.cache.showDownloadNotifications' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.showDownloadNotifications', {}) ?? 'ダウンロード通知を表示',
          'settings.cache.writeImageDataOnSave' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.writeImageDataOnSave', {}) ?? '保存時に画像データをJSONに書き込む',
          'settings.cache.requiresCustomStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.requiresCustomStorageDirectory', {}) ?? 'カスタムディレクトリが必要です',
          'settings.cache.setStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.setStorageDirectory', {}) ?? 'ストレージディレクトリを設定',
          'settings.cache.currentPath' =>
            ({required String path}) => TranslationOverrides.string(_root.$meta, 'settings.cache.currentPath', {'path': path}) ?? '現在: ${path}',
          'settings.cache.resetStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.resetStorageDirectory', {}) ?? 'ストレージディレクトリをリセット',
          'settings.cache.cachePreviews' => TranslationOverrides.string(_root.$meta, 'settings.cache.cachePreviews', {}) ?? 'キャッシュプレビュー',
          'settings.cache.videoCacheMode' => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheMode', {}) ?? 'ビデオキャッシュモード',
          'settings.cache.videoCacheModesTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModesTitle', {}) ?? 'ビデオキャッシュモード',
          'settings.cache.videoCacheModeStream' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStream', {}) ?? '- ストリーム - キャッシュなし、できるだけ早く再生を開始',
          'settings.cache.videoCacheModeCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeCache', {}) ?? '- キャッシュ - ファイルをデバイスストレージに保存、ダウンロード完了後に再生',
          'settings.cache.videoCacheModeStreamCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStreamCache', {}) ?? '- ストリーム+キャッシュ - 両方の組み合わせ、現在は2重ダウンロードが発生します',
          'settings.cache.videoCacheWarningDesktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheWarningDesktop', {}) ??
                '[警告]: デスクトップ版では、一部のBooruで ストリーム モードが正しく動作しない場合があります。',
          'settings.cache.deleteCacheAfter' => TranslationOverrides.string(_root.$meta, 'settings.cache.deleteCacheAfter', {}) ?? 'キャッシュを次の期間後に削除:',
          'settings.cache.cacheSizeLimit' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheSizeLimit', {}) ?? 'キャッシュサイズ制限 (GB)',
          'settings.cache.maximumTotalCacheSize' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.maximumTotalCacheSize', {}) ?? '最大合計キャッシュサイズ',
          'settings.cache.cacheStats' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheStats', {}) ?? 'キャッシュの統計:',
          'settings.cache.loading' => TranslationOverrides.string(_root.$meta, 'settings.cache.loading', {}) ?? '読み込み中…',
          'settings.cache.empty' => TranslationOverrides.string(_root.$meta, 'settings.cache.empty', {}) ?? '空',
          'settings.cache.inFilesPlural' =>
            ({required String size, required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.cache.inFilesPlural', {'size': size, 'count': count}) ?? '${size}, ${count} ファイル',
          'settings.cache.inFileSingular' =>
            ({required String size}) =>
                TranslationOverrides.string(_root.$meta, 'settings.cache.inFileSingular', {'size': size}) ?? '${size}, 1 ファイル',
          'settings.cache.cacheTypeTotal' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeTotal', {}) ?? '合計',
          'settings.cache.cacheTypeFavicons' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeFavicons', {}) ?? 'Favicon',
          'settings.cache.cacheTypeMedia' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeMedia', {}) ?? 'メディア',
          'settings.cache.cacheTypeWebView' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeWebView', {}) ?? 'WebView',
          'settings.cache.cacheCleared' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheCleared', {}) ?? 'キャッシュがクリアされました',
          'settings.cache.clearedCacheType' =>
            ({required String type}) =>
                TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheType', {'type': type}) ?? '${type} キャッシュをクリアしました',
          'settings.cache.clearAllCache' => TranslationOverrides.string(_root.$meta, 'settings.cache.clearAllCache', {}) ?? 'すべてのキャッシュをクリア',
          'settings.cache.clearedCacheCompletely' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheCompletely', {}) ?? 'キャッシュを完全にクリアしました',
          'settings.cache.appRestartRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.appRestartRequired', {}) ?? 'アプリの再起動が必要な可能性があります！',
          'settings.cache.errorExclamation' => TranslationOverrides.string(_root.$meta, 'settings.cache.errorExclamation', {}) ?? 'エラー！',
          'settings.cache.notAvailableForPlatform' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.notAvailableForPlatform', {}) ?? '現在このプラットフォームでは使用できません',
          'settings.downloads.snatchSelected' => TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? '選択したものをダウンロード',
          'settings.downloads.removeSnatchedStatusFromSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ?? '選択したものをダウンロード項目から削除',
          'settings.downloads.noItemsQueued' => TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsQueued', {}) ?? 'キューにアイテムがありません',
          'settings.downloads.fromNextItemInQueue' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.fromNextItemInQueue', {}) ?? 'キューの次の項目から',
          'settings.downloads.pleaseProvideStoragePermission' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.pleaseProvideStoragePermission', {}) ??
                'ファイルをダウンロードするには、ストレージへのアクセス許可を付与してください',
          'settings.downloads.batch' => TranslationOverrides.string(_root.$meta, 'settings.downloads.batch', {}) ?? 'バッチ',
          'settings.downloads.favouriteSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? '選択したアイテムをお気に入りに追加',
          'settings.downloads.unfavouriteSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? '選択したアイテムをお気に入りから解除',
          'settings.downloads.clearSelected' => TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? '選択をクリア',
          'settings.downloads.updatingData' => TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? 'データを更新中…',
          'settings.downloads.noItemsSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsSelected', {}) ?? 'アイテムは選択されていません',
          'settings.database.databaseInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfo', {}) ?? 'お気に入りを保存し、ダウンロードしたアイテムを追跡します',
          'settings.database.databaseInfoSnatch' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfoSnatch', {}) ?? 'すでにダウンロードされたアイテムを再度ダウンロードすることはできません',
          'settings.database.clearSnatchedItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSnatchedItems', {}) ?? 'ダウンロード済みアイテムをクリア',
          'settings.database.clearAllSnatchedConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearAllSnatchedConfirm', {}) ?? 'ダウンロードしたアイテムをすべてクリアしますか？',
          'settings.database.snatchedItemsCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.snatchedItemsCleared', {}) ?? 'ダウンロードしたアイテムがクリアされました',
          'settings.database.title' => TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? 'データベース',
          'settings.database.indexingDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? 'データベースのインデックスを作成中',
          'settings.database.droppingIndexes' => TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? 'インデックスの削除中',
          'settings.database.enableDatabase' => TranslationOverrides.string(_root.$meta, 'settings.database.enableDatabase', {}) ?? 'データベースを有効化',
          'settings.database.enableIndexing' => TranslationOverrides.string(_root.$meta, 'settings.database.enableIndexing', {}) ?? 'インデックスを有効化',
          'settings.database.enableSearchHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableSearchHistory', {}) ?? '検索履歴を有効化',
          'settings.database.enableTagTypeFetching' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableTagTypeFetching', {}) ?? 'タグタイプの取得を有効化',
          'settings.database.sankakuTypeToUpdate' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuTypeToUpdate', {}) ?? '更新するSankakuタイプ',
          'settings.database.searchQuery' => TranslationOverrides.string(_root.$meta, 'settings.database.searchQuery', {}) ?? '検索クエリ',
          'settings.database.searchQueryOptional' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchQueryOptional', {}) ?? '(オプション、プロセスが遅くなる可能性があります)',
          'settings.database.cantLeavePageNow' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.cantLeavePageNow', {}) ?? '今はこのページを離れることはできません！',
          'settings.database.sankakuDataUpdating' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDataUpdating', {}) ??
                'Sankakuデータの更新中です。終了するまで待つか、ページ下部で手動でキャンセルしてください',
          'settings.database.pleaseWaitTitle' => TranslationOverrides.string(_root.$meta, 'settings.database.pleaseWaitTitle', {}) ?? 'お待ちください！',
          'settings.database.indexesBeingChanged' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexesBeingChanged', {}) ?? 'インデックスが変更されています',
          'settings.database.indexingInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexingInfo', {}) ??
                'データベース検索が高速化されますが、より多くのディスク領域が使用されます (最大 2 倍)。\n\nインデックス作成中は、ページを離れたりアプリを閉じたりしないでください。',
          'settings.database.createIndexesDebug' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.createIndexesDebug', {}) ?? 'インデックスの作成 [デバッグ]',
          'settings.database.dropIndexesDebug' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.dropIndexesDebug', {}) ?? 'インデックスの削除 [デバッグ]',
          'settings.database.searchHistoryInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryInfo', {}) ?? 'データベースが有効になっている必要があります。',
          'settings.database.searchHistoryRecords' =>
            ({required int limit}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryRecords', {'limit': limit}) ?? '過去 ${limit}件の検索を保存します',
          'settings.database.searchHistoryTapInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryTapInfo', {}) ?? 'エントリーをタップしてアクションを実行できます (削除、お気に入り...)',
          'settings.database.searchHistoryFavouritesInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryFavouritesInfo', {}) ?? 'お気に入りのクエリはリストの上部に固定され、制限にカウントされません。',
          'settings.database.tagTypeFetchingInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingInfo', {}) ?? 'サポートされているBooruからタグタイプを取得します',
          'settings.database.tagTypeFetchingWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingWarning', {}) ?? 'レート制限が発生する可能性があります',
          'settings.database.deleteDatabase' => TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabase', {}) ?? 'データベースを削除',
          'settings.database.deleteDatabaseConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabaseConfirm', {}) ?? 'データベースを削除しますか？',
          'settings.database.databaseDeleted' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseDeleted', {}) ?? 'データベースが削除されました！',
          'settings.database.appRestartRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.appRestartRequired', {}) ?? 'アプリの再起動が必要です！',
          'settings.database.appRestartMayBeRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.appRestartMayBeRequired', {}) ?? 'アプリの再起動が必要な可能性があります！',
          'settings.database.clearFavouritedItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearFavouritedItems', {}) ?? 'お気に入りアイテムをクリア',
          'settings.database.clearAllFavouritedConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearAllFavouritedConfirm', {}) ?? 'お気に入りしたアイテムをすべてクリアしますか？',
          'settings.database.favouritesCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.favouritesCleared', {}) ?? 'お気に入りをクリアしました',
          'settings.database.clearSearchHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistory', {}) ?? '検索履歴をクリア',
          'settings.database.clearSearchHistoryConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistoryConfirm', {}) ?? '検索履歴をクリアしますか？',
          'settings.database.searchHistoryCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryCleared', {}) ?? '検索履歴がクリアされました',
          'settings.database.sankakuFavouritesUpdate' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdate', {}) ?? 'Sankaku お気に入りのアップデート',
          'settings.database.sankakuFavouritesUpdateStarted' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateStarted', {}) ?? 'Sankaku お気に入りアップデート開始',
          'settings.database.sankakuDontLeavePage' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDontLeavePage', {}) ?? 'プロセスが完了するか停止するまでこのページを離れないでください',
          'settings.database.noSankakuConfigFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.noSankakuConfigFound', {}) ?? 'Sankaku 設定が見つかりませんでした！',
          'settings.database.sankakuFavouritesUpdateComplete' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateComplete', {}) ?? 'Sankaku お気に入りの更新が完了しました',
          'settings.database.failedItemsPurgeStartedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeStartedTitle', {}) ?? '失敗したアイテムの削除を開始しました',
          'settings.database.failedItemsPurgeInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeInfo', {}) ?? '更新に失敗したアイテムはデータベースから削除されます',
          'settings.database.updateSankakuUrls' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.updateSankakuUrls', {}) ?? 'Sankaku URLをアップデート',
          'settings.database.updating' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.updating', {'count': count}) ?? '${count}個のアイテムを更新中:',
          'settings.database.left' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.left', {'count': count}) ?? '残り: ${count}',
          'settings.database.done' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.done', {'count': count}) ?? '完了: ${count}',
          'settings.database.failedSkipped' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.failedSkipped', {'count': count}) ?? '失敗/スキップ: ${count}',
          'settings.database.skipCurrentItem' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.skipCurrentItem', {}) ?? '現在のアイテムをスキップするにはここをタップしてください',
          'settings.database.pressToStop' => TranslationOverrides.string(_root.$meta, 'settings.database.pressToStop', {}) ?? 'ここをタップして停止',
          'settings.database.purgeFailedItems' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.purgeFailedItems', {'count': count}) ?? '失敗したアイテムを消去します (${count})',
          'settings.database.retryFailedItems' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.retryFailedItems', {'count': count}) ?? '失敗したアイテムを再試行します (${count})',
          'settings.database.useIfStuck' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.useIfStuck', {}) ?? 'アイテムでスタックしているように見える場合に使用します',
          'settings.itemFilters.removeSnatched' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeSnatched', {}) ?? 'ダウンロードしたアイテムを削除',
          'settings.itemFilters.title' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.title', {}) ?? 'フィルター',
          'settings.itemFilters.marked' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.marked', {}) ?? 'お気に入り',
          'settings.itemFilters.removeMarked' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeMarked', {}) ?? 'お気に入りタグを含むアイテムを完全に非表示',
          'settings.itemFilters.removeHidden' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeHidden', {}) ?? '非表示タグを含むアイテムを完全に非表示',
          'settings.itemFilters.hidden' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.hidden', {}) ?? '非表示',
          'settings.itemFilters.removeFavourited' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeFavourited', {}) ?? 'お気に入りにしたアイテムを非表示',
          'settings.itemFilters.removeAI' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeAI', {}) ?? 'AIを使用したアイテムを非表示',
          'settings.itemFilters.duplicateFilter' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.duplicateFilter', {}) ?? '重複フィルター',
          'settings.itemFilters.alreadyInList' =>
            ({required String tag, required String type}) =>
                TranslationOverrides.string(_root.$meta, 'settings.itemFilters.alreadyInList', {'tag': tag, 'type': type}) ??
                '\'${tag}\'はすでに ${type} リストに存在します',
          'settings.itemFilters.noFiltersFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersFound', {}) ?? 'フィルターが見つかりません',
          'settings.itemFilters.noFiltersAdded' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersAdded', {}) ?? 'フィルターがありません',
          'settings.sync.sendSnatchedHistory' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSnatchedHistory', {}) ?? 'ダウンロード履歴を送信',
          'settings.sync.snatchedCount' =>
            ({required String count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.snatchedCount', {'count': count}) ?? 'ダウンロード済み: ${count}',
          'settings.sync.syncSnatchedFrom' => TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFrom', {}) ?? '#... からダウンロードを同期',
          'settings.sync.syncSnatchedFromHelpText1' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText1', {}) ??
                '同期を開始する場所を設定できます。これは、以前のダウンロード履歴を既に同期していて、最近のアイテムを同期したい場合に便利です',
          'settings.sync.syncSnatchedFromHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText2', {}) ?? '最初からすべて同期する場合はこのフィールドを空白のままにしておいてください',
          'settings.sync.syncFavsFromHelpText3' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText3', {}) ??
                '例: お気に入りの数がXの場合、このフィールドを100に設定すると、 アイテム #100 から X まで同期されます',
          'settings.sync.syncSnatchedFromHelpText3' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText3', {}) ??
                '例: お気に入りの数がXの場合、このフィールドを100に設定すると、 アイテム #100 から X まで同期されます',
          'settings.sync.syncSnatchedFromHelpText4' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText4', {}) ?? 'お気に入りの順序: 古いもの (0) から新しい順 (X)',
          'settings.sync.syncFavsFromHelpText4' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText4', {}) ?? 'お気に入りの順序: 古いもの (0) から新しい順 (X)',
          'settings.sync.title' => TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? 'LoliSync',
          'settings.sync.portAndIPCannotBeEmpty' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.portAndIPCannotBeEmpty', {}) ?? 'ポートとIPのフィールドは空にできません！',
          'settings.sync.serverPortPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.serverPortPlaceholder', {}) ?? '(空の場合はデフォルトで\'8080\'になります)',
          'settings.sync.dbError' => TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ?? 'LoliSyncを使用するにはデータベースを有効にする必要があります',
          'settings.sync.errorTitle' => TranslationOverrides.string(_root.$meta, 'settings.sync.errorTitle', {}) ?? 'エラー！',
          'settings.sync.pleaseEnterIPAndPort' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.pleaseEnterIPAndPort', {}) ?? 'IPアドレスとポートを入力してください。',
          'settings.sync.selectWhatYouWantToDo' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.selectWhatYouWantToDo', {}) ?? '何をしたいか選択してください',
          'settings.sync.sendDataToDevice' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendDataToDevice', {}) ?? '他のデバイスにデータを送信',
          'settings.sync.receiveDataFromDevice' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.receiveDataFromDevice', {}) ?? '他のデバイスからデータを引き継ぎ',
          'settings.sync.senderInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.senderInstructions', {}) ?? 'もう一方のデバイスでサーバーを起動し、IP/ポートを入力して、Syncを開始 をタップします',
          'settings.sync.ipAddress' => TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddress', {}) ?? 'IPアドレス',
          'settings.sync.ipAddressPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddressPlaceholder', {}) ?? 'ホストIPアドレス (192.168.1.1 など)',
          'settings.sync.port' => TranslationOverrides.string(_root.$meta, 'settings.sync.port', {}) ?? 'ポート',
          'settings.sync.portPlaceholder' => TranslationOverrides.string(_root.$meta, 'settings.sync.portPlaceholder', {}) ?? 'ホストのポート (7777 など)',
          'settings.sync.sendFavourites' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavourites', {}) ?? 'お気に入りを送信',
          'settings.sync.favouritesCount' =>
            ({required String count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.favouritesCount', {'count': count}) ?? 'お気に入り: ${count}',
          'settings.sync.sendFavouritesLegacy' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavouritesLegacy', {}) ?? 'お気に入りを送信 (レガシー)',
          'settings.sync.syncFavsFrom' => TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFrom', {}) ?? '#... からお気に入りを同期',
          'settings.sync.syncFavsFromHelpText1' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText1', {}) ??
                '同期を開始する場所を設定できます。これは、以前までのお気に入りを既に同期していて、最近のアイテムのみ同期したい場合に便利です',
          'settings.sync.syncFavsFromHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText2', {}) ?? '最初からすべて同期する場合はこのフィールドを空白のままにしておいてください',
          'settings.sync.sendSettings' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSettings', {}) ?? '設定を送信',
          'settings.sync.sendBooruConfigs' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendBooruConfigs', {}) ?? 'Booru 設定を送信',
          'settings.sync.configsCount' =>
            ({required String count}) => TranslationOverrides.string(_root.$meta, 'settings.sync.configsCount', {'count': count}) ?? '設定: ${count}',
          'settings.sync.sendTabs' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTabs', {}) ?? 'タブを送信',
          'settings.sync.tabsCount' =>
            ({required String count}) => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsCount', {'count': count}) ?? 'タブ: ${count}',
          'settings.sync.tabsSyncMode' => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncMode', {}) ?? 'タブ同期モード',
          'settings.sync.tabsSyncModeMerge' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeMerge', {}) ?? '結合: このデバイスのタブを先のデバイスにマージします。不明なタブや既存のタブは無視されます',
          'settings.sync.tabsSyncModeReplace' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeReplace', {}) ?? '置換: 先のデバイスのタブをこのデバイスと同じタブに完全に置き換えます',
          'settings.sync.merge' => TranslationOverrides.string(_root.$meta, 'settings.sync.merge', {}) ?? '結合',
          'settings.sync.replace' => TranslationOverrides.string(_root.$meta, 'settings.sync.replace', {}) ?? '置換',
          'settings.sync.sendTags' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTags', {}) ?? 'タグを送信',
          'settings.sync.tagsCount' =>
            ({required String count}) => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsCount', {'count': count}) ?? 'タグ: ${count}',
          'settings.sync.tagsSyncMode' => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncMode', {}) ?? 'タグ同期モード',
          'settings.sync.tagsSyncModePreferTypeIfNone' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModePreferTypeIfNone', {}) ??
                'タイプを保持: 他のデバイスにタグタイプが既に存在し、このデバイスには存在しない場合はスキップされます',
          'settings.sync.tagsSyncModeOverwrite' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModeOverwrite', {}) ??
                '上書き: すべてのタグが追加されます。他のデバイスにタグとタグタイプが存在する場合は上書きされます',
          'settings.sync.preferTypeIfNone' => TranslationOverrides.string(_root.$meta, 'settings.sync.preferTypeIfNone', {}) ?? 'タイプを保持',
          'settings.sync.overwrite' => TranslationOverrides.string(_root.$meta, 'settings.sync.overwrite', {}) ?? '上書き',
          'settings.sync.testConnection' => TranslationOverrides.string(_root.$meta, 'settings.sync.testConnection', {}) ?? '接続テスト',
          'settings.sync.testConnectionHelpText1' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText1', {}) ?? '先のデバイスにテストを送信します。',
          'settings.sync.testConnectionHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText2', {}) ?? '成功/失敗の通知を表示します。',
          'settings.sync.startSync' => TranslationOverrides.string(_root.$meta, 'settings.sync.startSync', {}) ?? 'Syncを開始',
          'settings.sync.nothingSelectedToSync' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.nothingSelectedToSync', {}) ?? '同期する項目が選択されていません！',
          'settings.sync.statsOfThisDevice' => TranslationOverrides.string(_root.$meta, 'settings.sync.statsOfThisDevice', {}) ?? 'このデバイスの統計情報:',
          'settings.sync.receiverInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.receiverInstructions', {}) ?? 'サーバーを起動してデータを受信できます。セキュリティのため、公共Wi-Fiは使用しないでください',
          'settings.sync.availableNetworkInterfaces' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.availableNetworkInterfaces', {}) ?? '利用可能なネットワークインターフェース',
          'settings.sync.selectedInterfaceIP' =>
            ({required String ip}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.selectedInterfaceIP', {'ip': ip}) ?? '選択されたインターフェースでのIP: ${ip}',
          'settings.sync.serverPort' => TranslationOverrides.string(_root.$meta, 'settings.sync.serverPort', {}) ?? 'サーバーポート',
          'settings.sync.startReceiverServer' => TranslationOverrides.string(_root.$meta, 'settings.sync.startReceiverServer', {}) ?? 'レシーバーサーバーを開始',
          'settings.about.appDescription' =>
            TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ??
                'LoliSnatcherはオープンソースで、GPLv3ライセンスに基づいており、ソースコードはGitHubで公開されています。問題や機能リクエストがありましたら、リポジトリの Issues セクションにご報告ください。',
          'settings.about.appOnGitHub' => TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? 'LoliSnatcher (GitHub)',
          'settings.about.releasesMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.about.releasesMsg', {}) ?? '最新バージョンと完全な変更ログは、GitHubのリリースページにあります:',
          'settings.about.title' => TranslationOverrides.string(_root.$meta, 'settings.about.title', {}) ?? 'このアプリについて',
          'settings.about.logoArtistThanks' =>
            TranslationOverrides.string(_root.$meta, 'settings.about.logoArtistThanks', {}) ??
                'アプリのロゴにイラストを使用させていただいた、Showers-U さんに心より感謝を申し上げます。Pixivでぜひチェックしてみてください',
          'settings.about.contact' => TranslationOverrides.string(_root.$meta, 'settings.about.contact', {}) ?? 'Contact',
          'settings.about.releases' => TranslationOverrides.string(_root.$meta, 'settings.about.releases', {}) ?? 'リリースページ',
          'settings.about.licenses' => TranslationOverrides.string(_root.$meta, 'settings.about.licenses', {}) ?? 'ライセンス',
          'settings.about.developers' => TranslationOverrides.string(_root.$meta, 'settings.about.developers', {}) ?? '開発',
          'settings.about.emailCopied' => TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? 'Eメールがクリップボードにコピーされました',
          'settings.network.keepEmptyForDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.keepEmptyForDefault', {}) ?? 'デフォルトのままにしておくには空にしてください',
          'settings.network.selectBooruToClearCookies' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.selectBooruToClearCookies', {}) ?? 'Cookieを消去するBooruを選択するか、空白のままにしてすべてから消去',
          'settings.network.title' => TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? 'ネットワーク',
          'settings.network.enableSelfSignedSSLCertificates' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.enableSelfSignedSSLCertificates', {}) ?? '自己署名SSL証明書を有効化',
          'settings.network.proxy' => TranslationOverrides.string(_root.$meta, 'settings.network.proxy', {}) ?? 'プロキシ',
          'settings.network.proxySubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.proxySubtitle', {}) ?? '動画のストリームモードには適用されません。代わりにキャッシュモードを使用してください',
          'settings.network.customUserAgent' => TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgent', {}) ?? 'カスタム User-Agent',
          'settings.network.customUserAgentTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgentTitle', {}) ?? 'カスタム User-Agent',
          'settings.network.defaultUserAgent' =>
            ({required String agent}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.defaultUserAgent', {'agent': agent}) ?? 'デフォルト: ${agent}',
          'settings.network.userAgentUsedOnRequests' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.userAgentUsedOnRequests', {}) ?? 'ほとんどのBooruリクエストとWebviewに使用されます',
          'settings.network.valueSavedAfterLeaving' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.valueSavedAfterLeaving', {}) ?? 'ページを閉じて保存',
          'settings.network.setBrowserUserAgent' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.setBrowserUserAgent', {}) ??
                'Chromeブラウザのユーザーエージェントを使用 (サイトでブラウザ以外のユーザーエージェントが禁止されている場合にのみ推奨されます)',
          'settings.network.cookieCleaner' => TranslationOverrides.string(_root.$meta, 'settings.network.cookieCleaner', {}) ?? 'Cookie クリーナー',
          'settings.network.cookiesFor' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookiesFor', {'booruName': booruName}) ?? '${booruName} 上のCookie:',
          'settings.network.cookieDeleted' =>
            ({required String cookieName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookieDeleted', {'cookieName': cookieName}) ??
                'Cookie «${cookieName}» が削除されました',
          'settings.network.clearCookies' => TranslationOverrides.string(_root.$meta, 'settings.network.clearCookies', {}) ?? 'Cookieをクリア',
          'settings.network.clearCookiesFor' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.clearCookiesFor', {'booruName': booruName}) ??
                '${booruName} のCookieを消去します',
          'settings.network.cookiesForBooruDeleted' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookiesForBooruDeleted', {'booruName': booruName}) ??
                '${booruName} のCookieが消去されました',
          'settings.network.allCookiesDeleted' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.allCookiesDeleted', {}) ?? 'すべてのCookieを消去しました',
          'settings.webview.openWebview' => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? 'Webviewを開く',
          'settings.webview.openWebviewTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? 'ログインまたはクッキーを取得する場合',
          'settings.video.title' => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? '動画',
          'settings.video.videoPlayerBackend' => TranslationOverrides.string(_root.$meta, 'settings.video.videoPlayerBackend', {}) ?? 'プレーヤーのバックエンド',
          'settings.video.backendDefaultHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.backendDefaultHelp', {}) ??
                'Exoplayerに基づいています。デバイスとの互換性は最も高いですが、4Kや一部コーデックの動画、古いデバイスでは問題が発生する可能性があります',
          'settings.video.backendMPVHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.backendMPVHelp', {}) ??
                'libmpvに基づいており、一部のコーデックやデバイスの問題を解決するのに役立つ高度な設定があります \n[クラッシュを引き起こす可能性があります！]',
          'settings.video.backendMDKHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.backendMDKHelp', {}) ??
                'libmdkに基づいており、一部のコーデック/デバイスではパフォーマンスが向上する可能性があります\n[クラッシュを引き起こす可能性があります！]',
          'settings.video.experimental' => TranslationOverrides.string(_root.$meta, 'settings.video.experimental', {}) ?? '[実験的機能]',
          'settings.video.disableVideos' => TranslationOverrides.string(_root.$meta, 'settings.video.disableVideos', {}) ?? '動画の無効化',
          'settings.video.disableVideosHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.disableVideosHelp', {}) ??
                '動画の読み込み時にクラッシュするローエンドデバイスに便利です。代わりに外部プレイヤーやブラウザで視聴するオプションを提供します。',
          'settings.video.autoplayVideos' => TranslationOverrides.string(_root.$meta, 'settings.video.autoplayVideos', {}) ?? '動画の自動再生',
          'settings.video.startVideosMuted' => TranslationOverrides.string(_root.$meta, 'settings.video.startVideosMuted', {}) ?? '動画をミュート状態で開始',
          'settings.video.backendDefault' => TranslationOverrides.string(_root.$meta, 'settings.video.backendDefault', {}) ?? 'デフォルト',
          'settings.video.backendMPV' => TranslationOverrides.string(_root.$meta, 'settings.video.backendMPV', {}) ?? 'MPV',
          'settings.video.backendMDK' => TranslationOverrides.string(_root.$meta, 'settings.video.backendMDK', {}) ?? 'MDK',
          'settings.video.mpvSettingsHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.mpvSettingsHelp', {}) ??
                '動画が正しく動作しない、またはコーデックエラーが発生する場合は、以下の\'MPV\'設定の調整を試してみてください:',
          'settings.video.mpvUseHardwareAcceleration' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.mpvUseHardwareAcceleration', {}) ?? 'MPV: ハードウェアアクセラレーションを使用',
          'settings.video.mpvVO' => TranslationOverrides.string(_root.$meta, 'settings.video.mpvVO', {}) ?? 'MPV: VO',
          'settings.video.mpvHWDEC' => TranslationOverrides.string(_root.$meta, 'settings.video.mpvHWDEC', {}) ?? 'MPV: HWDEC',
          'settings.video.videoCacheMode' => TranslationOverrides.string(_root.$meta, 'settings.video.videoCacheMode', {}) ?? 'ビデオキャッシュモード',
          'settings.video.cacheModes.title' => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.title', {}) ?? 'ビデオキャッシュモード',
          'settings.video.cacheModes.streamMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamMode', {}) ?? '- ストリーム - キャッシュなし、できるだけ早く再生を開始',
          'settings.video.cacheModes.cacheMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheMode', {}) ?? '- キャッシュ - ファイルをデバイスストレージに保存、ダウンロード完了後に再生',
          'settings.video.cacheModes.streamCacheMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamCacheMode', {}) ?? '- ストリーム+キャッシュ - 両方の組み合わせ、現在は2重ダウンロードが発生します',
          'settings.video.cacheModes.cacheNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheNote', {}) ?? '[注意]: 動画は「メディアをキャッシュ」が有効になっている場合のみキャッシュされます。',
          'settings.video.cacheModes.desktopWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.desktopWarning', {}) ??
                '[警告]: デスクトップ版では、一部のBooruで ストリーム モードが正しく動作しない場合があります。',
          'settings.video.cacheModeValues.stream' => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.stream', {}) ?? 'ストリーム',
          'settings.video.cacheModeValues.cache' => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.cache', {}) ?? 'キャッシュ',
          'settings.video.cacheModeValues.streamCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.streamCache', {}) ?? 'ストリーム+キャッシュ',
          'settings.video.videoBackendModeValues.normal' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.normal', {}) ?? 'デフォルト',
          'settings.video.videoBackendModeValues.mpv' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mpv', {}) ?? 'MPV',
          'settings.video.videoBackendModeValues.mdk' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mdk', {}) ?? 'MDK',
          'settings.backupAndRestore.title' => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.title', {}) ?? 'バックアップと復元',
          'settings.backupAndRestore.duplicateFileDetectedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedTitle', {}) ?? '重複ファイルが検出されました！',
          'settings.backupAndRestore.duplicateFileDetectedMsg' =>
            ({required String fileName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
                'ファイル ${fileName} は既に存在します。上書きしますか？「いいえ」を選択した場合、バックアップはキャンセルされます。',
          'settings.backupAndRestore.androidOnlyFeatureMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ??
                'この機能はAndroidでのみ利用可能です。デスクトップ版では、システムに応じてアプリのデータフォルダからファイルをコピー/ペーストできます',
          'settings.backupAndRestore.selectBackupDir' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? 'バックアップディレクトリを選択',
          'settings.backupAndRestore.failedToGetBackupPath' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ?? 'バックアップパスの取得に失敗しました',
          'settings.backupAndRestore.backupPathMsg' =>
            ({required String backupPath}) =>
                TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ??
                'バックアップパス: ${backupPath}',
          'settings.backupAndRestore.noBackupDirSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ?? 'バックアップディレクトリは選択されていません',
          'settings.backupAndRestore.restoreInfoMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ?? 'ファイルはディレクトリルートにある必要があります',
          'settings.backupAndRestore.backupSettings' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? '設定をバックアップ',
          'settings.backupAndRestore.restoreSettings' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? '設定を復元',
          'settings.backupAndRestore.settingsBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ?? '設定を settings.json にバックアップしました',
          'settings.backupAndRestore.settingsRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? '設定をバックアップから復元しました',
          'settings.backupAndRestore.backupSettingsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ?? '設定のバックアップに失敗しました',
          'settings.backupAndRestore.restoreSettingsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ?? '設定の復元に失敗しました',
          'settings.backupAndRestore.resetBackupDir' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.resetBackupDir', {}) ?? 'バックアップディレクトリをリセット',
          'settings.backupAndRestore.backupBoorus' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ?? 'Booruをバックアップ',
          'settings.backupAndRestore.restoreBoorus' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? 'Booruを復元',
          'settings.backupAndRestore.boorusBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ?? 'Booruを boorus.json にパックアップしました',
          'settings.backupAndRestore.boorusRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ?? 'Booruをバックアップから復元しました',
          'settings.backupAndRestore.backupBoorusError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ?? 'Booruのバックアップに失敗しました',
          'settings.backupAndRestore.restoreBoorusError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ?? 'Booruの復元に失敗しました',
          'settings.backupAndRestore.backupDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? 'データベースのバックアップ',
          'settings.backupAndRestore.restoreDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? 'データベースの復元',
          'settings.backupAndRestore.restoreDatabaseInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ??
                'データベースのサイズによっては時間がかかる場合があります、成功した場合はアプリを再起動します',
          'settings.backupAndRestore.databaseBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ?? 'データベースを store.db にバックアップしました',
          'settings.backupAndRestore.databaseRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ?? 'データベースをバックアップから復元しました！アプリは数秒後再起動されます！',
          'settings.backupAndRestore.backupDatabaseError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ?? 'データベースのバックアップに失敗しました',
          'settings.backupAndRestore.restoreDatabaseError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ?? 'データベースの復元に失敗しました',
          'settings.backupAndRestore.databaseFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ?? 'データベースファイルが見つからないか読み取れません！',
          'settings.backupAndRestore.backupTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? 'タグのバックアップ',
          'settings.backupAndRestore.restoreTags' => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? 'タグの復元',
          'settings.backupAndRestore.restoreTagsInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ??
                'タグの数が多い場合は時間がかかる場合があります。データベースを復元した場合は、既にデータベースに含まれているためこの操作は不要です',
          'settings.backupAndRestore.tagsBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? 'タグを tags.json にバックアップしました',
          'settings.backupAndRestore.tagsRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? 'タグをバックアップから復元しました',
          'settings.backupAndRestore.backupTagsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? 'タグのバックアップに失敗しました',
          'settings.backupAndRestore.restoreTagsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? 'タグの復元に失敗しました',
          'settings.backupAndRestore.tagsFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsFileNotFound', {}) ?? 'タグファイルが見つからないか読み取れません！',
          'settings.backupAndRestore.backupFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupFileNotFound', {}) ?? 'バックアップファイルが見つからないか読み取れません！',
          'settings.backupAndRestore.operationTakesTooLongMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.operationTakesTooLongMsg', {}) ??
                '時間がかかりすぎる場合は、下の隠すボタンを押すとバックグラウンドで操作が続行されます',
          'settings.backupAndRestore.backupDirNoAccess' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDirNoAccess', {}) ?? 'バックアップディレクトリにアクセスできません！',
          'settings.backupAndRestore.backupCancelled' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? 'バックアップをキャンセルしました',
          'settings.privacy.title' => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? 'プライバシー',
          'settings.privacy.appLock' => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? 'アプリのロック',
          'settings.privacy.appLockMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ?? '手動で、またはアイドル状態の場合にアプリをロックします。PIN/生体認証が必要です',
          'settings.privacy.autoLockAfter' => TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfter', {}) ?? 'ロックまでのアイドル時間',
          _ => null,
        } ??
        switch (path) {
          'settings.privacy.autoLockAfterTip' => TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfterTip', {}) ?? '秒, 0で無効',
          'settings.privacy.bluronLeave' => TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeave', {}) ?? 'アプリを離れるときに画面をぼかす',
          'settings.privacy.bluronLeaveMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeaveMsg', {}) ?? 'システムの制限により、一部デバイスでは動作しない場合があります',
          'settings.privacy.incognitoKeyboard' => TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboard', {}) ?? 'シークレットキーボード',
          'settings.privacy.incognitoKeyboardMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboardMsg', {}) ?? 'キーボードが入力履歴を保存しないようにします。 \nほとんどのテキスト入力に適用されます',
          'settings.privacy.appDisplayName' => TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayName', {}) ?? 'アプリの表示名',
          'settings.privacy.appDisplayNameDescription' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayNameDescription', {}) ?? 'ランチャーでのアプリ名の表示を変更します',
          'settings.privacy.appAliasChanged' => TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChanged', {}) ?? 'アプリ名が変更されました',
          'settings.privacy.appAliasRestartHint' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasRestartHint', {}) ??
                'アプリ名の変更はアプリの再起動後に有効になります。一部のランチャーでは、更新に時間がかかったりシステムの再起動が必要になる場合があります。',
          'settings.privacy.appAliasChangeFailed' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChangeFailed', {}) ?? 'アプリ名の変更に失敗しました。もう一度お試しください。',
          'settings.privacy.restartNow' => TranslationOverrides.string(_root.$meta, 'settings.privacy.restartNow', {}) ?? '今すぐ再起動',
          'settings.performance.title' => TranslationOverrides.string(_root.$meta, 'settings.performance.title', {}) ?? 'パフォーマンス',
          'settings.performance.lowPerformanceMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceMode', {}) ?? '低パフォーマンスモード',
          'settings.performance.lowPerformanceModeSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeSubtitle', {}) ?? '古いデバイスやRAMの少ないデバイスに推奨',
          'settings.performance.lowPerformanceModeDialogTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogTitle', {}) ?? '低パフォーマンスモード',
          'settings.performance.lowPerformanceModeDialogDisablesDetailed' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesDetailed', {}) ?? '- 読み込み中の詳細情報を無効にします',
          'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive', {}) ??
                '- リソースを大量に消費する要素を無効にします (ぼかし、アニメーション化された不透明度、一部アニメーションなど...)',
          'settings.performance.lowPerformanceModeDialogSetsOptimal' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogSetsOptimal', {}) ??
                '以下のオプションに最適な設定を設定します (後で個別に変更できます):',
          'settings.performance.autoplayVideos' => TranslationOverrides.string(_root.$meta, 'settings.performance.autoplayVideos', {}) ?? '動画の自動再生',
          'settings.performance.disableVideos' => TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideos', {}) ?? '動画の無効化',
          'settings.performance.disableVideosHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideosHelp', {}) ??
                '動画の読み込み時にクラッシュするローエンドデバイスに便利です。代わりに外部プレイヤーやブラウザで視聴するオプションを提供します。',
          'settings.checkForUpdates.title' => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.title', {}) ?? 'アップデートの確認',
          'settings.checkForUpdates.visitReleases' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? 'リリースを見る',
          'settings.checkForUpdates.updateAvailable' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateAvailable', {}) ?? 'アップデートが利用可能！',
          'settings.checkForUpdates.whatsNew' => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.whatsNew', {}) ?? '新着情報',
          'settings.checkForUpdates.updateChangelog' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? 'アップデートの変更ログ',
          'settings.checkForUpdates.updateCheckError' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? 'アップデート確認エラー！',
          'settings.checkForUpdates.youHaveLatestVersion' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? '最新バージョンを実行しています',
          'settings.checkForUpdates.viewLatestChangelog' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ?? '最新の変更履歴を表示',
          'settings.checkForUpdates.currentVersion' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? '現在のバージョン',
          'settings.checkForUpdates.changelog' => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? '変更ログ',
          'settings.checkForUpdates.visitPlayStore' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? 'Play Storeへアクセス',
          'settings.logs.title' => TranslationOverrides.string(_root.$meta, 'settings.logs.title', {}) ?? 'ログ',
          'settings.logs.shareLogs' => TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogs', {}) ?? 'ログの共有',
          'settings.logs.shareLogsWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningTitle', {}) ?? 'ログを外部アプリに共有しますか？',
          'settings.logs.shareLogsWarningMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningMsg', {}) ?? '[警告]: ログには機密情報が含まれている可能性があります。注意して共有してください！',
          'settings.help.title' => TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? 'ヘルプ (英語)',
          'settings.debug.title' => TranslationOverrides.string(_root.$meta, 'settings.debug.title', {}) ?? 'デバッグ',
          'settings.debug.enabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.enabledSnackbarMsg', {}) ?? 'デバッグモードが有効化されました！',
          'settings.debug.disabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.disabledSnackbarMsg', {}) ?? 'デバッグモードが無効になりました！',
          'settings.debug.alreadyEnabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.alreadyEnabledSnackbarMsg', {}) ?? 'デバッグモードは既に有効です！',
          'settings.debug.showPerformanceGraph' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.showPerformanceGraph', {}) ?? 'パフォーマンスグラフの表示',
          'settings.debug.showFPSGraph' => TranslationOverrides.string(_root.$meta, 'settings.debug.showFPSGraph', {}) ?? 'FPSグラフの表示',
          'settings.debug.showImageStats' => TranslationOverrides.string(_root.$meta, 'settings.debug.showImageStats', {}) ?? '画像の統計情報の表示',
          'settings.debug.showVideoStats' => TranslationOverrides.string(_root.$meta, 'settings.debug.showVideoStats', {}) ?? '動画の統計情報の表示',
          'settings.debug.blurImagesAndMuteVideosDevOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.blurImagesAndMuteVideosDevOnly', {}) ?? '画像のぼかし + 動画のミュート [DEV only]',
          'settings.debug.enableDragScrollOnListsDesktopOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.enableDragScrollOnListsDesktopOnly', {}) ?? 'リストのドラッグスクロールを有効化 [デスクトップのみ]',
          'settings.debug.animationSpeed' =>
            ({required double speed}) =>
                TranslationOverrides.string(_root.$meta, 'settings.debug.animationSpeed', {'speed': speed}) ?? 'アニメーション速度 (${speed})',
          'settings.debug.tagsManager' => TranslationOverrides.string(_root.$meta, 'settings.debug.tagsManager', {}) ?? 'タグマネージャー',
          'settings.debug.resolution' =>
            ({required String width, required String height}) =>
                TranslationOverrides.string(_root.$meta, 'settings.debug.resolution', {'width': width, 'height': height}) ??
                '解像度: ${width}x${height}',
          'settings.debug.pixelRatio' =>
            ({required String ratio}) => TranslationOverrides.string(_root.$meta, 'settings.debug.pixelRatio', {'ratio': ratio}) ?? 'ピクセル比: ${ratio}',
          'settings.debug.webview' => TranslationOverrides.string(_root.$meta, 'settings.debug.webview', {}) ?? 'Webview',
          'settings.debug.deleteAllCookies' => TranslationOverrides.string(_root.$meta, 'settings.debug.deleteAllCookies', {}) ?? 'すべてのCookieを削除',
          'settings.debug.getSessionString' => TranslationOverrides.string(_root.$meta, 'settings.debug.getSessionString', {}) ?? 'セッション文字列を取得',
          'settings.debug.setSessionString' => TranslationOverrides.string(_root.$meta, 'settings.debug.setSessionString', {}) ?? 'セッション文字列を設定',
          'settings.debug.sessionString' => TranslationOverrides.string(_root.$meta, 'settings.debug.sessionString', {}) ?? 'セッション文字列',
          'settings.debug.restoredSessionFromString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.restoredSessionFromString', {}) ?? 'セッションを文字列から復元しました',
          'settings.debug.clearSecureStorage' => TranslationOverrides.string(_root.$meta, 'settings.debug.clearSecureStorage', {}) ?? 'セキュアストレージをクリア',
          'settings.debug.logger' => TranslationOverrides.string(_root.$meta, 'settings.debug.logger', {}) ?? 'ロガー',
          'settings.version' => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? 'バージョン',
          'settings.logging.logger' => TranslationOverrides.string(_root.$meta, 'settings.logging.logger', {}) ?? 'Logger',
          'yes' => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'はい',
          'no' => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'いいえ',
          'success' => TranslationOverrides.string(_root.$meta, 'success', {}) ?? '成功',
          'successExclamation' => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? '成功！',
          'cancel' => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'キャンセル',
          'kReturn' => TranslationOverrides.string(_root.$meta, 'kReturn', {}) ?? '戻る',
          'later' => TranslationOverrides.string(_root.$meta, 'later', {}) ?? '後で',
          'close' => TranslationOverrides.string(_root.$meta, 'close', {}) ?? '閉じる',
          'ok' => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'OK',
          'pleaseWait' => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'お待ちください…',
          'show' => TranslationOverrides.string(_root.$meta, 'show', {}) ?? '見る',
          'hide' => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? '隠す',
          'enable' => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? '有効化',
          'disable' => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? '無効化',
          'add' => TranslationOverrides.string(_root.$meta, 'add', {}) ?? '追加',
          'edit' => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? '編集',
          'remove' => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? '削除',
          'save' => TranslationOverrides.string(_root.$meta, 'save', {}) ?? '保存',
          'delete' => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? '削除',
          'confirm' => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? '確認',
          'retry' => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? '再試行',
          'clear' => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? 'クリア',
          'copy' => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'コピー',
          'copied' => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'コピー済み',
          'copiedToClipboard' => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? 'クリップボードにコピー',
          'nothingFound' => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? '何も見つかりませんでした',
          'paste' => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? '貼り付け',
          'copyErrorText' => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'コピーエラー',
          'booru' => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru',
          'goToSettings' => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? '設定に移動',
          'thisMayTakeSomeTime' => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? '少し時間がかかる場合があります…',
          'exitTheAppQuestion' => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? 'アプリを終了しますか？',
          'closeTheApp' => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'アプリを閉じる',
          'invalidUrl' => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? '無効なURLです！',
          'clipboardIsEmpty' => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'クリップボードが空です！',
          'failedToOpenLink' => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'リンクを開くことに失敗しました',
          'apiKey' => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'APIキー',
          'userId' => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'ユーザーID',
          'login' => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'ログイン',
          'password' => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'パスワード',
          'pause' => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? '一時停止',
          'resume' => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? '再開',
          'discord' => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord',
          'visitOurDiscord' => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Discordサーバーにアクセス',
          'item' => TranslationOverrides.string(_root.$meta, 'item', {}) ?? '項目',
          'select' => TranslationOverrides.string(_root.$meta, 'select', {}) ?? '選択',
          'selectAll' => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? '全て選択',
          'reset' => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'リセット',
          'open' => TranslationOverrides.string(_root.$meta, 'open', {}) ?? '開く',
          'openInNewTab' => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? '新しいタブで開く',
          'move' => TranslationOverrides.string(_root.$meta, 'move', {}) ?? '移動',
          'shuffle' => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? 'シャッフル',
          'sort' => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? '並び替え',
          'go' => TranslationOverrides.string(_root.$meta, 'go', {}) ?? '移動',
          'search' => TranslationOverrides.string(_root.$meta, 'search', {}) ?? '検索',
          'filter' => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? 'フィルター',
          'or' => TranslationOverrides.string(_root.$meta, 'or', {}) ?? 'または (~)',
          'page' => TranslationOverrides.string(_root.$meta, 'page', {}) ?? 'ページ',
          'pageNumber' => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? 'ページ #',
          'tags' => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'タグ',
          'type' => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'タイプ',
          'name' => TranslationOverrides.string(_root.$meta, 'name', {}) ?? '名前',
          'address' => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'アドレス',
          'username' => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'ユーザー名',
          'favourites' => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'お気に入り',
          'downloads' => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'ダウンロード',
          'validationErrors.required' => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? '値を入力',
          'validationErrors.invalid' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? '有効な値を入力してください',
          'validationErrors.invalidNumber' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? '数字を入力',
          'validationErrors.invalidNumericValue' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? '有効な数値を入力してください',
          'validationErrors.tooSmall' =>
            ({required double min}) =>
                TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? '${min} より大きい値を入力してください',
          'validationErrors.tooBig' =>
            ({required double max}) => TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? '${max} より小さい値を入力してください',
          'validationErrors.rangeError' =>
            ({required double min, required double max}) =>
                TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ?? '${min} から ${max} までの値を入力してください',
          'validationErrors.greaterThanOrEqualZero' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? '0 以上の値を入力してください',
          'validationErrors.lessThan4' => TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? '4 未満の値を入力してください',
          'validationErrors.biggerThan100' => TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? '100 より大きい値を入力してください',
          'validationErrors.moreThan4ColumnsWarning' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ?? '4 列以上を設定するとパフォーマンスに影響を及ぼす可能性があります',
          'validationErrors.moreThan8ColumnsWarning' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ?? '8 列以上を設定するとパフォーマンスに影響を及ぼす可能性があります',
          'init.initError' => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? '初期化エラー！',
          'init.settingUpProxy' => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'プロキシを設定中…',
          'init.loadingDatabase' => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'データベースを読み込み中…',
          'init.loadingBoorus' => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Booruを読み込み中…',
          'init.loadingTags' => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'タグを読み込み中…',
          'init.restoringTabs' => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'タブを復元中…',
          'permissions.noAccessToCustomStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ?? 'カスタムストレージディレクトリにアクセスできません',
          'permissions.pleaseSetStorageDirectoryAgain' =>
            TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ?? 'アプリにアクセスを許可するには、ストレージディレクトリを再度設定する必要があります',
          'permissions.currentPath' =>
            ({required String path}) => TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? '現在のパス: ${path}',
          'permissions.setDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? 'ディレクトリを設定',
          'permissions.currentlyNotAvailableForThisPlatform' =>
            TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ?? 'このプラットフォームでは使用できません',
          'permissions.resetDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? 'ディレクトリをリセット',
          'permissions.afterResetFilesWillBeSavedToDefaultDirectory' =>
            TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ??
                'リセット後、ファイルはデフォルトのディレクトリに保存されるようになります',
          'authentication.pleaseAuthenticateToUseTheApp' =>
            TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ?? 'アプリを使用するには認証が必要です',
          'authentication.noBiometricHardwareAvailable' =>
            TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? '生体認証ハードウェアは利用できません',
          'authentication.temporaryLockout' => TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? '一時ロックアウト',
          'authentication.somethingWentWrong' =>
            ({required String error}) =>
                TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ?? '認証中に問題が発生しました: ${error}',
          'searchHandler.removedLastTab' => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? '最後のタブを削除しました',
          'searchHandler.resettingSearchToDefaultTags' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? 'デフォルトのタグにリセットします',
          'searchHandler.uoh' => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'うおおおおああああああ',
          'searchHandler.ratingsChanged' => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? 'レーティングが変更されました',
          'searchHandler.ratingsChangedMessage' =>
            ({required String booruType}) =>
                TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
                '${booruType} では、 [rating:safe] の代わりに [rating:general] と [rating:sensitive] が使用されるので置き換えられました',
          'searchHandler.appFixedRatingAutomatically' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ??
                'レーティングは自動で修正されました。今後は正しいレーティングを使用して検索してみてください',
          'searchHandler.tabsRestored' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? 'タブを復元',
          'searchHandler.restoredTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
                  count,
                  one: '以前のセッションから${count}個のタブを復元しました',
                  few: '以前のセッションから${count}個のタブを復元しました',
                  many: '以前のセッションから${count}個のタブを復元しました',
                  other: '以前のセッションから${count}個のタブを復元しました',
                ),
          'searchHandler.someRestoredTabsHadIssues' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ?? '復元されたタブには、不明なBooruや壊れた文字が含まれているものがありました。',
          'searchHandler.theyWereSetToDefaultOrIgnored' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ?? 'これらはデフォルト値に設定されたか、無視されました。',
          'searchHandler.listOfBrokenTabs' => TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? '壊れたタブのリスト:',
          'searchHandler.tabsMerged' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? 'タブが結合されました',
          'searchHandler.addedTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
                  count,
                  one: '${count}個の新しいタブを追加',
                  few: '${count}個の新しいタブを追加',
                  many: '${count}個の新しいタブを追加',
                  other: '${count}個の新しいタブを追加',
                ),
          'searchHandler.tabsReplaced' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? 'タブを置き換えました',
          'searchHandler.receivedTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
                  count,
                  one: '${count}個のタブを受け取りました',
                  few: '${count}個のタブを受け取りました',
                  many: '${count}個のタブを受け取りました',
                  other: '${count}個のタブを受け取りました',
                ),
          'snatcher.title' => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'ダウンローダー',
          'snatcher.snatchingHistory' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'ダウンロード履歴',
          'snatcher.enterTags' => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'タグを入力',
          'snatcher.amount' => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? '数',
          'snatcher.amountOfFilesToSnatch' => TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? 'ダウンロードするファイル数',
          'snatcher.delayInMs' => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? '間隔 (ms)',
          'snatcher.delayBetweenEachDownload' => TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? 'ダウンロードごとの間隔',
          'snatcher.snatchFiles' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? 'ファイルをまとめてダウンロード',
          'snatcher.itemWasAlreadySnatched' => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? 'アイテムはすでに保存済みです',
          'snatcher.failedToSnatchItem' => TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? 'ダウンロードに失敗',
          'snatcher.itemWasCancelled' => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? 'アイテムはキャンセルされました',
          'snatcher.startingNextQueueItem' => TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? '次のキューを開始中…',
          'snatcher.itemsSnatched' => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? 'ダウンロード完了',
          'snatcher.snatchedCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
                  count,
                  one: 'ダウンロード済み: ${count}個',
                  few: 'ダウンロード済み: ${count}個',
                  many: 'ダウンロード済み: ${count}個',
                  other: 'ダウンロード済み: ${count}個',
                ),
          'snatcher.filesAlreadySnatched' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
                  count,
                  one: '${count} 個のファイルがすでに保存済みです',
                  few: '${count} 個のファイルがすでに保存済みです',
                  many: '${count} 個のファイルがすでに保存済みです',
                  other: '${count} 個のファイルがすでに保存済みです',
                ),
          'snatcher.failedToSnatchFiles' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
                  count,
                  one: '${count} 個のファイルの保存に失敗',
                  few: '${count} 個のファイルの保存に失敗',
                  many: '${count} 個のファイルの保存に失敗',
                  other: '${count} 個のファイルの保存に失敗',
                ),
          'snatcher.cancelledFiles' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
                  count,
                  one: '${count} 個のファイルがキャンセルされました',
                  few: '${count} 個のファイルがキャンセルされました',
                  many: '${count} 個のファイルがキャンセルされました',
                  other: '${count} 個のファイルがキャンセルされました',
                ),
          'snatcher.snatchingImages' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? '画像を保存中',
          'snatcher.doNotCloseApp' => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? 'アプリを終了しないでください！',
          'snatcher.addedItemToQueue' => TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? 'ダウンロードキューに追加',
          'snatcher.addedItemsToQueue' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
                  count,
                  one: '${count} 個のアイテムをキューに追加しました',
                  few: '${count} 個のアイテムをキューに追加しました',
                  many: '${count} 個のアイテムをキューに追加しました',
                  other: '${count} 個のアイテムをキューに追加しました',
                ),
          'loliSync.title' => TranslationOverrides.string(_root.$meta, 'loliSync.title', {}) ?? 'LoliSync',
          'loliSync.stopSyncingQuestion' => TranslationOverrides.string(_root.$meta, 'loliSync.stopSyncingQuestion', {}) ?? '同期を停止しますか？',
          'loliSync.stopServerQuestion' => TranslationOverrides.string(_root.$meta, 'loliSync.stopServerQuestion', {}) ?? 'サーバーを停止しますか？',
          'loliSync.waitingForConnection' => TranslationOverrides.string(_root.$meta, 'loliSync.waitingForConnection', {}) ?? '接続を待機中…',
          'loliSync.startingServer' => TranslationOverrides.string(_root.$meta, 'loliSync.startingServer', {}) ?? 'サーバーの開始…',
          'loliSync.keepScreenAwake' => TranslationOverrides.string(_root.$meta, 'loliSync.keepScreenAwake', {}) ?? 'スクリーンを点灯したままにする',
          'loliSync.serverKilled' => TranslationOverrides.string(_root.$meta, 'loliSync.serverKilled', {}) ?? 'LoliSync サーバーを終了',
          'loliSync.testError' =>
            ({required int statusCode, required String reasonPhrase}) =>
                TranslationOverrides.string(_root.$meta, 'loliSync.testError', {'statusCode': statusCode, 'reasonPhrase': reasonPhrase}) ??
                'テスト時エラー: ${statusCode} ${reasonPhrase}',
          'loliSync.testErrorException' =>
            ({required String error}) =>
                TranslationOverrides.string(_root.$meta, 'loliSync.testErrorException', {'error': error}) ?? 'テスト時エラー: ${error}',
          'loliSync.testSuccess' => TranslationOverrides.string(_root.$meta, 'loliSync.testSuccess', {}) ?? 'テストリクエストは正常な返答を受け取りました',
          'loliSync.testSuccessMessage' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.testSuccessMessage', {}) ?? '先のデバイスに \'Test\' というメッセージが表示されるはずです',
          'loliSync.noConnection' => TranslationOverrides.string(_root.$meta, 'loliSync.noConnection', {}) ?? '接続なし',
          'desktopHome.snatcher' => TranslationOverrides.string(_root.$meta, 'desktopHome.snatcher', {}) ?? 'ダウンローダー',
          'desktopHome.addBoorusInSettings' => TranslationOverrides.string(_root.$meta, 'desktopHome.addBoorusInSettings', {}) ?? '設定からBooruを追加',
          'desktopHome.settings' => TranslationOverrides.string(_root.$meta, 'desktopHome.settings', {}) ?? '設定',
          'desktopHome.save' => TranslationOverrides.string(_root.$meta, 'desktopHome.save', {}) ?? '保存',
          'desktopHome.noItemsSelected' => TranslationOverrides.string(_root.$meta, 'desktopHome.noItemsSelected', {}) ?? 'アイテムは選択されていません',
          'viewer.appBar.hydrus' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrus', {}) ?? 'Hydrus',
          'viewer.appBar.cantStartSlideshow' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.cantStartSlideshow', {}) ?? 'スライドショーを開始できません',
          'viewer.appBar.reachedLastLoadedItem' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.reachedLastLoadedItem', {}) ?? '最後に読み込まれたアイテムに到達しました',
          'viewer.appBar.pause' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.pause', {}) ?? '一時停止',
          'viewer.appBar.start' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.start', {}) ?? '開始',
          'viewer.appBar.unfavourite' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.unfavourite', {}) ?? 'お気に入り解除',
          'viewer.appBar.deselect' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.deselect', {}) ?? '選択解除',
          'viewer.appBar.reloadWithScaling' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.reloadWithScaling', {}) ?? 'スケーリングして再読み込み',
          'viewer.appBar.loadSampleQuality' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadSampleQuality', {}) ?? 'サンプル品質の読み込み',
          'viewer.appBar.loadHighQuality' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadHighQuality', {}) ?? '高品質の読み込み',
          'viewer.appBar.dropSnatchedStatus' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.dropSnatchedStatus', {}) ?? 'ダウンロードステータスを削除',
          'viewer.appBar.setSnatchedStatus' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.setSnatchedStatus', {}) ?? 'ダウンロードステータスを設定',
          'viewer.appBar.snatch' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.snatch', {}) ?? 'ダウンロード',
          'viewer.appBar.forced' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.forced', {}) ?? '(強制)',
          'viewer.appBar.hydrusShare' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusShare', {}) ?? 'Hydrus 共有',
          'viewer.appBar.postURL' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURL', {}) ?? '投稿のURL',
          'viewer.appBar.fileURL' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURL', {}) ?? 'ファイルのURL',
          'viewer.appBar.shareFile' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareFile', {}) ?? 'ファイルの共有',
          'viewer.appBar.alreadyDownloadingThisFile' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingThisFile', {}) ?? 'このファイルはすでに共有用にダウンロード中です、中止しますか？',
          'viewer.appBar.alreadyDownloadingFile' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingFile', {}) ??
                'すでに共有用のファイルをダウンロードしています。現在のファイルを中止して新しいファイルを共有しますか？',
          'viewer.appBar.current' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.current', {}) ?? '現在:',
          'viewer.appBar.kNew' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.kNew', {}) ?? '新規:',
          'viewer.appBar.abort' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.abort', {}) ?? 'キャンセル',
          'viewer.appBar.error' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.error', {}) ?? 'エラー！',
          'viewer.appBar.savingFileError' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.savingFileError', {}) ?? '共有前にファイルを保存する際に問題が発生しました',
          'viewer.appBar.whatToShare' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.whatToShare', {}) ?? '何を共有しますか？',
          'viewer.appBar.postURLWithTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURLWithTags', {}) ?? '投稿URLとタグ',
          'viewer.appBar.fileURLWithTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURLWithTags', {}) ?? 'ファイルURLとタグ',
          'viewer.appBar.file' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.file', {}) ?? 'ファイル',
          'viewer.appBar.fileWithTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileWithTags', {}) ?? 'ファイルとタグ',
          'viewer.appBar.selectTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.selectTags', {}) ?? 'タグを選択',
          'viewer.appBar.whichUrlToShareToHydrus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.whichUrlToShareToHydrus', {}) ?? 'Hydrusと共有するURLはどれですか？',
          'viewer.appBar.hydrusNotConfigured' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusNotConfigured', {}) ?? 'Hydrusが設定されていません！',
          'viewer.appBar.shareNew' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareNew', {}) ?? '新規を共有',
          'viewer.notes.coordinates' =>
            ({required int posX, required int posY}) =>
                TranslationOverrides.string(_root.$meta, 'viewer.notes.coordinates', {'posX': posX, 'posY': posY}) ?? 'X:${posX}, Y:${posY}',
          'viewer.notes.note' => TranslationOverrides.string(_root.$meta, 'viewer.notes.note', {}) ?? 'ノート',
          'viewer.notes.notes' => TranslationOverrides.string(_root.$meta, 'viewer.notes.notes', {}) ?? 'ノート',
          'viewer.tutorial.images' => TranslationOverrides.string(_root.$meta, 'viewer.tutorial.images', {}) ?? '画像',
          'viewer.tutorial.tapLongTapToggleImmersive' =>
            TranslationOverrides.string(_root.$meta, 'viewer.tutorial.tapLongTapToggleImmersive', {}) ?? 'タップ/長押し: 没入モードを切り替え',
          'viewer.tutorial.doubleTapFitScreen' =>
            TranslationOverrides.string(_root.$meta, 'viewer.tutorial.doubleTapFitScreen', {}) ?? 'ダブルタップ: 画面にフィット / オリジナルサイズ / ズームのリセット',
          'gallery.snatchQuestion' => TranslationOverrides.string(_root.$meta, 'gallery.snatchQuestion', {}) ?? 'ダウンロードしますか？',
          'gallery.noPostUrl' => TranslationOverrides.string(_root.$meta, 'gallery.noPostUrl', {}) ?? '投稿URLがありません！',
          'gallery.loadingFile' => TranslationOverrides.string(_root.$meta, 'gallery.loadingFile', {}) ?? 'ファイルの読み込み中…',
          'gallery.loadingFileMessage' =>
            TranslationOverrides.string(_root.$meta, 'gallery.loadingFileMessage', {}) ?? 'これには少し時間がかかる場合があります。お待ちください…',
          'gallery.sources' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'gallery.sources', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
                  count,
                  one: 'ソース',
                  other: 'ソース',
                ),
          'galleryButtons.snatch' => TranslationOverrides.string(_root.$meta, 'galleryButtons.snatch', {}) ?? 'ダウンロード',
          'galleryButtons.favourite' => TranslationOverrides.string(_root.$meta, 'galleryButtons.favourite', {}) ?? 'お気に入り',
          'galleryButtons.info' => TranslationOverrides.string(_root.$meta, 'galleryButtons.info', {}) ?? '情報',
          'galleryButtons.share' => TranslationOverrides.string(_root.$meta, 'galleryButtons.share', {}) ?? '共有',
          'galleryButtons.select' => TranslationOverrides.string(_root.$meta, 'galleryButtons.select', {}) ?? '選択',
          'galleryButtons.open' => TranslationOverrides.string(_root.$meta, 'galleryButtons.open', {}) ?? 'ブラウザで開く',
          'galleryButtons.slideshow' => TranslationOverrides.string(_root.$meta, 'galleryButtons.slideshow', {}) ?? 'スライドショー',
          'galleryButtons.reloadNoScale' => TranslationOverrides.string(_root.$meta, 'galleryButtons.reloadNoScale', {}) ?? 'スケーリングの切り替え',
          'galleryButtons.toggleQuality' => TranslationOverrides.string(_root.$meta, 'galleryButtons.toggleQuality', {}) ?? '画質の切り替え',
          'galleryButtons.externalPlayer' => TranslationOverrides.string(_root.$meta, 'galleryButtons.externalPlayer', {}) ?? '外部プレイヤー',
          'galleryButtons.imageSearch' => TranslationOverrides.string(_root.$meta, 'galleryButtons.imageSearch', {}) ?? '画像検索',
          'multibooru.multibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Multibooruモード',
          'multibooru.title' => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? 'Multibooru',
          'multibooru.selectSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? '追加するbooruを選択:',
          'multibooru.akaMultibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? '別名をMultibooruモード',
          'multibooru.labelSecondaryBoorusToInclude' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? '追加のBooruを含める',
          'multibooru.multibooruRequiresAtLeastTwoBoorus' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ?? '少なくとも2つのBooruが設定されている必要があります',
          'tabs.filters.multibooru' => TranslationOverrides.string(_root.$meta, 'tabs.filters.multibooru', {}) ?? 'Multibooru',
          'tabs.filters.loaded' => TranslationOverrides.string(_root.$meta, 'tabs.filters.loaded', {}) ?? 'ロード済み',
          'tabs.filters.notLoaded' => TranslationOverrides.string(_root.$meta, 'tabs.filters.notLoaded', {}) ?? '未ロード',
          'tabs.filters.tagType' => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagType', {}) ?? 'タグのタイプ',
          'tabs.filters.duplicates' => TranslationOverrides.string(_root.$meta, 'tabs.filters.duplicates', {}) ?? '重複タブ',
          'tabs.filters.checkDuplicatesOnSameBooru' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.checkDuplicatesOnSameBooru', {}) ?? '同じBooruでの重複のみを確認',
          'tabs.filters.emptySearchQuery' => TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? '検索クエリが未指定のタブのみ',
          'tabs.filters.title' => TranslationOverrides.string(_root.$meta, 'tabs.filters.title', {}) ?? 'タブフィルター',
          'tabs.filters.all' => TranslationOverrides.string(_root.$meta, 'tabs.filters.all', {}) ?? 'すべて',
          'tabs.filters.enabled' => TranslationOverrides.string(_root.$meta, 'tabs.filters.enabled', {}) ?? '有効',
          'tabs.filters.disabled' => TranslationOverrides.string(_root.$meta, 'tabs.filters.disabled', {}) ?? '無効',
          'tabs.filters.willAlsoEnableSorting' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.willAlsoEnableSorting', {}) ?? '並び替えも有効になります',
          'tabs.filters.tagTypeFilterHelp' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.tagTypeFilterHelp', {}) ?? '選択したタイプのタグを少なくとも1つ含むタブをフィルターします',
          'tabs.filters.any' => TranslationOverrides.string(_root.$meta, 'tabs.filters.any', {}) ?? 'すべて',
          'tabs.filters.apply' => TranslationOverrides.string(_root.$meta, 'tabs.filters.apply', {}) ?? '適用',
          'tabs.secondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? '追加のBooru',
          'tabs.addSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? '追加のBooruを追加',
          'tabs.keepSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? '追加のBooruを保持',
          'tabs.empty' => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '[未指定]',
          'tabs.tab' => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? 'タブ',
          'tabs.addBoorusInSettings' => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? '設定でBooruを追加',
          'tabs.selectABooru' => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? 'Booruを選択',
          'tabs.addNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? '新しいタブを追加',
          'tabs.selectABooruOrLeaveEmpty' => TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? 'Booruを選択するか空のままにしておく',
          'tabs.addPosition' => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? 'ポジションを追加',
          'tabs.addModePrevTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? '以前のタブ',
          'tabs.addModeNextTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? '次のタブ',
          'tabs.addModeListEnd' => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? 'リストの最後',
          'tabs.usedQuery' => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? '使用されたクエリ',
          'tabs.queryModeDefault' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? 'デフォルト',
          'tabs.queryModeCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? '現在',
          'tabs.queryModeCustom' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? 'カスタム',
          'tabs.customQuery' => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? 'カスタムクエリ',
          'tabs.startFromCustomPageNumber' => TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? '特定のページ番号から開始',
          'tabs.switchToNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? '新しいタブに移動',
          'tabs.add' => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? '追加',
          'tabs.tabsManager' => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? 'タブマネージャー',
          'tabs.selectMode' => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? 'モードの変更',
          'tabs.sortMode' => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? 'タブをソート',
          'tabs.help' => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? 'ヘルプ',
          'tabs.deleteTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? 'タブを削除',
          'tabs.shuffleTabs' => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? 'タブをシャッフル',
          'tabs.tabRandomlyShuffled' => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? 'タブはシャッフルされました',
          'tabs.tabOrderSaved' => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? 'タブの順番を保存しました',
          'tabs.scrollToCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? '現在のタブまで移動',
          'tabs.scrollToTop' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? '一番上に移動',
          'tabs.scrollToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? '一番下に移動',
          'tabs.filterTabsByBooru' => TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? 'Booru, 状態, 重複をフィルター…',
          'tabs.scrolling' => TranslationOverrides.string(_root.$meta, 'tabs.scrolling', {}) ?? 'リストのスクロール:',
          'tabs.sorting' => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? '並び替え:',
          'tabs.defaultTabsOrder' => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? '自分の設定',
          'tabs.sortAlphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? 'アルファベット (昇順)',
          'tabs.sortAlphabeticallyReversed' => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? 'アルファベット (降順)',
          'tabs.sortByBooruName' => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? 'Booru名のアルファベット順 (昇順)',
          'tabs.sortByBooruNameReversed' => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ?? 'Booru名のアルファベット順 (降順)',
          'tabs.longPressSortToSave' => TranslationOverrides.string(_root.$meta, 'tabs.longPressSortToSave', {}) ?? '長押しで現在の並びを保存',
          'tabs.select' => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? '選択:',
          'tabs.toggleSelectMode' => TranslationOverrides.string(_root.$meta, 'tabs.toggleSelectMode', {}) ?? '選択モードの切り替え',
          'tabs.onTheBottomOfPage' => TranslationOverrides.string(_root.$meta, 'tabs.onTheBottomOfPage', {}) ?? 'メニュー下のボタン: ',
          'tabs.selectDeselectAll' => TranslationOverrides.string(_root.$meta, 'tabs.selectDeselectAll', {}) ?? 'すべて選択/解除',
          'tabs.deleteSelectedTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? '選択したタブをすべて削除',
          'tabs.longPressToMove' => TranslationOverrides.string(_root.$meta, 'tabs.longPressToMove', {}) ?? 'タブを長押しして移動',
          'tabs.numbersInBottomRight' => TranslationOverrides.string(_root.$meta, 'tabs.numbersInBottomRight', {}) ?? 'タブの右下に表示される数字:',
          'tabs.firstNumberTabIndex' => TranslationOverrides.string(_root.$meta, 'tabs.firstNumberTabIndex', {}) ?? '最初の数字: 自分の並びでのタブ番号',
          'tabs.secondNumberTabIndex' =>
            TranslationOverrides.string(_root.$meta, 'tabs.secondNumberTabIndex', {}) ?? '2つ目の数字: 現在の並びでのタブの順番 フィルター/並び替え時に表示されます',
          'tabs.specialFilters' => TranslationOverrides.string(_root.$meta, 'tabs.specialFilters', {}) ?? '特殊なフィルター:',
          'tabs.loadedFilter' => TranslationOverrides.string(_root.$meta, 'tabs.loadedFilter', {}) ?? '«ロード済み» - 項目がすでにロードされているタブを表示',
          'tabs.notLoadedFilter' => TranslationOverrides.string(_root.$meta, 'tabs.notLoadedFilter', {}) ?? '«未ロード» - ロードされていない、またはアイテムが見つからないタブを表示',
          'tabs.notLoadedItalic' => TranslationOverrides.string(_root.$meta, 'tabs.notLoadedItalic', {}) ?? '読み込まれていないタブは斜体で表示されます:',
          'tabs.noTabsFound' => TranslationOverrides.string(_root.$meta, 'tabs.noTabsFound', {}) ?? 'タブが見つかりませんでした',
          'tabs.copy' => TranslationOverrides.string(_root.$meta, 'tabs.copy', {}) ?? 'コピー',
          'tabs.moveAction' => TranslationOverrides.string(_root.$meta, 'tabs.moveAction', {}) ?? '移動',
          'tabs.remove' => TranslationOverrides.string(_root.$meta, 'tabs.remove', {}) ?? '削除',
          'tabs.shuffle' => TranslationOverrides.string(_root.$meta, 'tabs.shuffle', {}) ?? 'シャッフル',
          'tabs.sort' => TranslationOverrides.string(_root.$meta, 'tabs.sort', {}) ?? '並び替え',
          'tabs.shuffleTabsQuestion' => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabsQuestion', {}) ?? 'タブをランダムにシャッフルしますか？',
          'tabs.saveTabsInCurrentOrder' => TranslationOverrides.string(_root.$meta, 'tabs.saveTabsInCurrentOrder', {}) ?? 'タブを現在の並びで確定しますか？',
          'tabs.byBooru' => TranslationOverrides.string(_root.$meta, 'tabs.byBooru', {}) ?? 'By booru',
          'tabs.alphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.alphabetically', {}) ?? 'アルファベット順',
          'tabs.reversed' => TranslationOverrides.string(_root.$meta, 'tabs.reversed', {}) ?? '(降順)',
          'tabs.areYouSureDeleteTabs' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'tabs.areYouSureDeleteTabs', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
                  count,
                  one: '${count} 個のタブを削除してよろしいですか？',
                  few: '${count} 個のタブを削除してよろしいですか？',
                  many: '${count} 個のタブを削除してよろしいですか？',
                  other: '${count} 個のタブを削除してよろしいですか？',
                ),
          'tabs.move.moveToTop' => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToTop', {}) ?? '一番上に移動',
          'tabs.move.moveToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToBottom', {}) ?? '一番下に移動',
          'tabs.move.tabNumber' => TranslationOverrides.string(_root.$meta, 'tabs.move.tabNumber', {}) ?? 'タブ番号',
          'tabs.move.invalidTabNumber' => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidTabNumber', {}) ?? '無効なタブ番号',
          'tabs.move.invalidInput' => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidInput', {}) ?? '無効な入力',
          'tabs.move.outOfRange' => TranslationOverrides.string(_root.$meta, 'tabs.move.outOfRange', {}) ?? '範囲外',
          'tabs.move.pleaseEnterValidTabNumber' =>
            TranslationOverrides.string(_root.$meta, 'tabs.move.pleaseEnterValidTabNumber', {}) ?? '有効なタブ番号を入力してください',
          'tabs.move.moveTo' =>
            ({required String formattedNumber}) =>
                TranslationOverrides.string(_root.$meta, 'tabs.move.moveTo', {'formattedNumber': formattedNumber}) ?? '#${formattedNumber} に移動',
          'tabs.move.preview' => TranslationOverrides.string(_root.$meta, 'tabs.move.preview', {}) ?? 'プレビュー:',
          'history.searchHistoryIsEmpty' => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsEmpty', {}) ?? '検索履歴は空です',
          'history.searchHistory' => TranslationOverrides.string(_root.$meta, 'history.searchHistory', {}) ?? '検索履歴',
          'history.searchHistoryIsDisabled' => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsDisabled', {}) ?? '検索履歴は無効です',
          'history.searchHistoryRequiresDatabase' =>
            TranslationOverrides.string(_root.$meta, 'history.searchHistoryRequiresDatabase', {}) ?? '設定で検索履歴のデータベースを有効化',
          'history.lastSearch' =>
            ({required String search}) => TranslationOverrides.string(_root.$meta, 'history.lastSearch', {'search': search}) ?? '最後の検索: ${search}',
          'history.lastSearchWithDate' =>
            ({required String date}) => TranslationOverrides.string(_root.$meta, 'history.lastSearchWithDate', {'date': date}) ?? '最後の検索日: ${date}',
          'history.unknownBooruType' => TranslationOverrides.string(_root.$meta, 'history.unknownBooruType', {}) ?? '不明なBooruタイプです！',
          'history.unknownBooru' =>
            ({required String name, required String type}) =>
                TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ?? '不明なBooru (${name}-${type})',
          'history.open' => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? '開く',
          'history.openInNewTab' => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? '新しいタブで開く',
          'history.removeFromFavourites' => TranslationOverrides.string(_root.$meta, 'history.removeFromFavourites', {}) ?? 'お気に入りから削除',
          'history.setAsFavourite' => TranslationOverrides.string(_root.$meta, 'history.setAsFavourite', {}) ?? 'お気に入りとして設定',
          'history.copy' => TranslationOverrides.string(_root.$meta, 'history.copy', {}) ?? 'コピー',
          'history.delete' => TranslationOverrides.string(_root.$meta, 'history.delete', {}) ?? '削除',
          'history.deleteHistoryEntries' => TranslationOverrides.string(_root.$meta, 'history.deleteHistoryEntries', {}) ?? '履歴エントリーを削除',
          'history.deleteItemsConfirm' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'history.deleteItemsConfirm', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
                  count,
                  one: '${count} 個のアイテムを削除してよろしいですか？',
                  few: '${count} 個のアイテムを削除してよろしいですか？',
                  many: '${count} 個のアイテムを削除してよろしいですか？',
                  other: '${count} 個のアイテムを削除してよろしいですか？',
                ),
          'history.clearSelection' => TranslationOverrides.string(_root.$meta, 'history.clearSelection', {}) ?? '選択を解除',
          'history.deleteItems' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'history.deleteItems', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
                  count,
                  one: '${count} 個のアイテムを削除',
                  few: '${count} 個のアイテムを削除',
                  many: '${count} 個のアイテムを削除',
                  other: '${count} 個のアイテムを削除',
                ),
          'tagsFiltersDialogs.emptyInput' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.emptyInput', {}) ?? '空の入力！',
          'tagsFiltersDialogs.addNewFilter' =>
            ({required String type}) =>
                TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.addNewFilter', {'type': type}) ?? '[${type} フィルターに新規追加]',
          'tagsFiltersDialogs.newTagFilter' =>
            ({required String type}) =>
                TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newTagFilter', {'type': type}) ?? '新規 ${type} タグフィルター',
          'tagsFiltersDialogs.newFilter' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newFilter', {}) ?? '追加するフィルター',
          'tagsFiltersDialogs.editFilter' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.editFilter', {}) ?? 'フィルターの編集',
          'hydrus.importError' => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'Hydrusのインポート中に問題が発生しました',
          'hydrus.apiPermissionsRequired' =>
            TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ??
                '正しいAPI権限を付与していない可能性があります。これは、Services > Review Servicesで編集できます',
          'hydrus.addTagsToFile' => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? 'タグをファイルに追加',
          'hydrus.addUrls' => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'URLを追加',
          'webview.title' => TranslationOverrides.string(_root.$meta, 'webview.title', {}) ?? 'Webview',
          'webview.notSupportedOnDevice' => TranslationOverrides.string(_root.$meta, 'webview.notSupportedOnDevice', {}) ?? 'このデバイスではサポートされていません',
          'webview.navigation.enterUrlLabel' => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterUrlLabel', {}) ?? 'URLを入力',
          'webview.navigation.enterCustomUrl' => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterCustomUrl', {}) ?? 'カスタムURLを入力',
          'webview.navigation.navigateTo' =>
            ({required String url}) => TranslationOverrides.string(_root.$meta, 'webview.navigation.navigateTo', {'url': url}) ?? '${url} へ移動',
          'webview.navigation.listCookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.listCookies', {}) ?? 'Cookieのリスト',
          'webview.navigation.clearCookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.clearCookies', {}) ?? 'Cookieをクリア',
          'webview.navigation.cookiesGone' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.cookiesGone', {}) ?? 'Cookieがありましたが、今はもうありません',
          'webview.navigation.getFavicon' => TranslationOverrides.string(_root.$meta, 'webview.navigation.getFavicon', {}) ?? 'Faviconを取得',
          'webview.navigation.noFaviconFound' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noFaviconFound', {}) ?? 'Faviconが見つかりませんでした',
          'webview.navigation.host' => TranslationOverrides.string(_root.$meta, 'webview.navigation.host', {}) ?? 'ホスト:',
          'webview.navigation.textAboveSelectable' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.textAboveSelectable', {}) ?? '(上のテキストは選択可能です)',
          'webview.navigation.copyUrl' => TranslationOverrides.string(_root.$meta, 'webview.navigation.copyUrl', {}) ?? 'URLをコピー',
          'webview.navigation.copiedUrlToClipboard' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.copiedUrlToClipboard', {}) ?? 'URLをクリップボードにコピーしました',
          'webview.navigation.cookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookies', {}) ?? 'Cookies',
          'webview.navigation.favicon' => TranslationOverrides.string(_root.$meta, 'webview.navigation.favicon', {}) ?? 'Favicon',
          'webview.navigation.history' => TranslationOverrides.string(_root.$meta, 'webview.navigation.history', {}) ?? '履歴',
          'webview.navigation.noBackHistoryItem' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noBackHistoryItem', {}) ?? '戻る履歴はありません',
          'webview.navigation.noForwardHistoryItem' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noForwardHistoryItem', {}) ?? '進む履歴はありません',
          'searchBar.searchForTags' => TranslationOverrides.string(_root.$meta, 'searchBar.searchForTags', {}) ?? 'タグを検索',
          'searchBar.tagSuggestionsNotAvailable' =>
            TranslationOverrides.string(_root.$meta, 'searchBar.tagSuggestionsNotAvailable', {}) ?? 'このBooruではタグ候補を利用できません',
          'searchBar.failedToLoadSuggestions' =>
            ({required String msg}) =>
                TranslationOverrides.string(_root.$meta, 'searchBar.failedToLoadSuggestions', {'msg': msg}) ?? '候補が見つかりませんでした。タップして再試行 ${msg}',
          'searchBar.noSuggestionsFound' => TranslationOverrides.string(_root.$meta, 'searchBar.noSuggestionsFound', {}) ?? '候補が見つかりませんでした',
          'searchBar.copiedTagToClipboard' =>
            ({required String tag}) =>
                TranslationOverrides.string(_root.$meta, 'searchBar.copiedTagToClipboard', {'tag': tag}) ?? 'タグ «${tag}» をクリップボードにコピーしました',
          'searchBar.prefix' => TranslationOverrides.string(_root.$meta, 'searchBar.prefix', {}) ?? 'プレフィックス',
          'searchBar.exclude' => TranslationOverrides.string(_root.$meta, 'searchBar.exclude', {}) ?? '除外 (—)',
          'searchBar.booruNumberPrefix' => TranslationOverrides.string(_root.$meta, 'searchBar.booruNumberPrefix', {}) ?? 'Booru (N#)',
          'searchBar.metatags' => TranslationOverrides.string(_root.$meta, 'searchBar.metatags', {}) ?? 'メタタグ',
          'searchBar.freeMetatags' => TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatags', {}) ?? 'フリーのメタタグ',
          'searchBar.freeMetatagsDescription' =>
            TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatagsDescription', {}) ?? 'Free のつくメタタグはタグ検索制限にカウントされません',
          'searchBar.free' => TranslationOverrides.string(_root.$meta, 'searchBar.free', {}) ?? 'Free',
          'searchBar.single' => TranslationOverrides.string(_root.$meta, 'searchBar.single', {}) ?? '1日',
          'searchBar.range' => TranslationOverrides.string(_root.$meta, 'searchBar.range', {}) ?? '範囲',
          'searchBar.popular' => TranslationOverrides.string(_root.$meta, 'searchBar.popular', {}) ?? '人気',
          'searchBar.selectDate' => TranslationOverrides.string(_root.$meta, 'searchBar.selectDate', {}) ?? '日付を選択',
          'searchBar.selectDatesRange' => TranslationOverrides.string(_root.$meta, 'searchBar.selectDatesRange', {}) ?? '日付の範囲を選択',
          'searchBar.history' => TranslationOverrides.string(_root.$meta, 'searchBar.history', {}) ?? '履歴',
          'searchBar.more' => TranslationOverrides.string(_root.$meta, 'searchBar.more', {}) ?? '…',
          'preview.error.loadingPage' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.loadingPage', {'pageNum': pageNum}) ?? 'ページ #${pageNum} の読み込み中…',
          'preview.error.errorLoadingPage' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.errorLoadingPage', {'pageNum': pageNum}) ??
                'ページ #${pageNum} の読み込み中にエラーが発生しました',
          'preview.error.startedAgo' =>
            ({required num seconds}) =>
                TranslationOverrides.plural(_root.$meta, 'preview.error.startedAgo', {'seconds': seconds}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
                  seconds,
                  one: '${seconds} 秒前から開始',
                  few: '${seconds} 秒前から開始',
                  many: '${seconds} 秒前から開始',
                  other: '${seconds} 秒前から開始',
                ),
          'preview.error.errorWithMessage' => TranslationOverrides.string(_root.$meta, 'preview.error.errorWithMessage', {}) ?? 'ここをタップして再試行',
          'preview.error.tapToRetry' => TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetry', {}) ?? 'ここをタップして再試行',
          'preview.error.tapToRetryIfStuck' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetryIfStuck', {}) ?? 'リクエストが停止しているか時間がかかりすぎている場合は、ここをタップして再試行できます',
          'preview.error.noResults' => TranslationOverrides.string(_root.$meta, 'preview.error.noResults', {}) ?? '結果が見つかりませんでした',
          'preview.error.noResultsSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.noResultsSubtitle', {}) ?? '検索クエリを変更するか、タップして再試行できます',
          'preview.error.errorNoResultsLoaded' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.errorNoResultsLoaded', {}) ?? 'エラー, 結果を読み込めませんでした',
          'preview.error.reachedEnd' => TranslationOverrides.string(_root.$meta, 'preview.error.reachedEnd', {}) ?? '結果の最後に到達しました',
          'preview.error.reachedEndSubtitle' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.reachedEndSubtitle', {'pageNum': pageNum}) ??
                '読み込まれたページ数: ${pageNum}\nここをタップして最後のページを再読み込み',
          'media.loading.startedSecondsAgo' =>
            ({required int seconds}) =>
                TranslationOverrides.string(_root.$meta, 'media.loading.startedSecondsAgo', {'seconds': seconds}) ?? '${seconds} 秒前から開始',
          'media.loading.stopLoading' => TranslationOverrides.string(_root.$meta, 'media.loading.stopLoading', {}) ?? '読み込みを停止',
          'media.loading.rendering' => TranslationOverrides.string(_root.$meta, 'media.loading.rendering', {}) ?? 'ロード中…',
          'media.loading.loadingAndRenderingFromCache' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.loadingAndRenderingFromCache', {}) ?? 'キャッシュから読み込み中…',
          'media.loading.loadingFromCache' => TranslationOverrides.string(_root.$meta, 'media.loading.loadingFromCache', {}) ?? 'キャッシュから読み込み中…',
          'media.loading.buffering' => TranslationOverrides.string(_root.$meta, 'media.loading.buffering', {}) ?? 'バッファリング中…',
          'media.loading.loading' => TranslationOverrides.string(_root.$meta, 'media.loading.loading', {}) ?? '読み込み中…',
          'media.loading.loadAnyway' => TranslationOverrides.string(_root.$meta, 'media.loading.loadAnyway', {}) ?? 'とにかく読み込む',
          'media.loading.restartLoading' => TranslationOverrides.string(_root.$meta, 'media.loading.restartLoading', {}) ?? '再度読み込む',
          'media.loading.stopReasons.stoppedByUser' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.stoppedByUser', {}) ?? 'ユーザーによる停止',
          'media.loading.stopReasons.loadingError' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.loadingError', {}) ?? 'ロード時エラー',
          'media.loading.stopReasons.fileIsTooBig' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.fileIsTooBig', {}) ?? 'ファイルが大きすぎます',
          'media.loading.stopReasons.hiddenByFilters' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.hiddenByFilters', {}) ?? 'フィルターにより非表示:',
          'media.loading.stopReasons.videoError' => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.videoError', {}) ?? '動画エラー',
          'media.loading.fileIsZeroBytes' => TranslationOverrides.string(_root.$meta, 'media.loading.fileIsZeroBytes', {}) ?? '空のファイル',
          'media.loading.fileSize' =>
            ({required String size}) => TranslationOverrides.string(_root.$meta, 'media.loading.fileSize', {'size': size}) ?? 'ファイルサイズ: ${size}',
          'media.loading.sizeLimit' =>
            ({required String limit}) => TranslationOverrides.string(_root.$meta, 'media.loading.sizeLimit', {'limit': limit}) ?? '制限: ${limit}',
          'media.loading.tryChangingVideoBackend' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.tryChangingVideoBackend', {}) ??
                '再生時に問題が頻繁に発生しますか？ [設定 > 動画 > プレーヤーのバックエンド] を変更してみてください',
          'media.video.videosDisabledOrNotSupported' =>
            TranslationOverrides.string(_root.$meta, 'media.video.videosDisabledOrNotSupported', {}) ?? '動画は無効かサポートされていません',
          'media.video.openVideoInExternalPlayer' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openVideoInExternalPlayer', {}) ?? '外部プレイヤーで動画を開く',
          'media.video.openVideoInBrowser' => TranslationOverrides.string(_root.$meta, 'media.video.openVideoInBrowser', {}) ?? '動画をブラウザで開く',
          'media.video.failedToLoadItemData' =>
            TranslationOverrides.string(_root.$meta, 'media.video.failedToLoadItemData', {}) ?? 'アイテムデータの読み込みに失敗しました',
          'media.video.loadingItemData' => TranslationOverrides.string(_root.$meta, 'media.video.loadingItemData', {}) ?? 'アイテムデータの読み込み中…',
          'media.video.retry' => TranslationOverrides.string(_root.$meta, 'media.video.retry', {}) ?? '再試行',
          'media.video.openFileInBrowser' => TranslationOverrides.string(_root.$meta, 'media.video.openFileInBrowser', {}) ?? 'ファイルをブラウザで開く',
          'media.video.openPostInBrowser' => TranslationOverrides.string(_root.$meta, 'media.video.openPostInBrowser', {}) ?? '投稿をブラウザで開く',
          'media.video.currentlyChecking' => TranslationOverrides.string(_root.$meta, 'media.video.currentlyChecking', {}) ?? '現在確認中:',
          'media.video.unknownFileFormat' =>
            ({required String fileExt}) =>
                TranslationOverrides.string(_root.$meta, 'media.video.unknownFileFormat', {'fileExt': fileExt}) ??
                '不明なファイルフォーマットです (.${fileExt})。ここをタップしてブラウザで開く',
          'pinnedTags.pinnedTags' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedTags', {}) ?? 'ピン留めされたタグ',
          'pinnedTags.pinTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinTag', {}) ?? 'タグをピン留め',
          'pinnedTags.unpinTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinTag', {}) ?? 'タグのピン留めを解除',
          'pinnedTags.pin' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pin', {}) ?? 'ピン留め',
          'pinnedTags.unpin' => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpin', {}) ?? 'ピン留め解除',
          'pinnedTags.pinQuestion' =>
            ({required String tag}) =>
                TranslationOverrides.string(_root.$meta, 'pinnedTags.pinQuestion', {'tag': tag}) ?? '«${tag}» をクイックアクセスにピン留めしますか？',
          'pinnedTags.unpinQuestion' =>
            ({required String tag}) =>
                TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinQuestion', {'tag': tag}) ?? '«${tag}» をピン留めされたタグから解除しますか？',
          'pinnedTags.onlyForBooru' =>
            ({required String name}) => TranslationOverrides.string(_root.$meta, 'pinnedTags.onlyForBooru', {'name': name}) ?? '${name} のみで',
          'pinnedTags.labelsOptional' => TranslationOverrides.string(_root.$meta, 'pinnedTags.labelsOptional', {}) ?? 'ラベル (オプション)',
          'pinnedTags.typeAndPressAdd' => TranslationOverrides.string(_root.$meta, 'pinnedTags.typeAndPressAdd', {}) ?? '入力して追加ボタンを押してラベルを追加',
          'pinnedTags.selectExistingLabel' => TranslationOverrides.string(_root.$meta, 'pinnedTags.selectExistingLabel', {}) ?? '既存のラベルを選択',
          'pinnedTags.tagPinned' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagPinned', {}) ?? 'ピン留め完了',
          'pinnedTags.pinnedForBooru' =>
            ({required String name, required String labels}) =>
                TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedForBooru', {'name': name, 'labels': labels}) ??
                '${name} にピン留めしました ${labels}',
          'pinnedTags.pinnedGloballyWithLabels' =>
            ({required String labels}) =>
                TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedGloballyWithLabels', {'labels': labels}) ?? '${labels} 全てにピン留めしました',
          'pinnedTags.tagUnpinned' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagUnpinned', {}) ?? 'ピン留め解除',
          'pinnedTags.all' => TranslationOverrides.string(_root.$meta, 'pinnedTags.all', {}) ?? 'すべて',
          'pinnedTags.reorderPinnedTags' => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorderPinnedTags', {}) ?? 'ピン留めタグの並び替え',
          'pinnedTags.saving' => TranslationOverrides.string(_root.$meta, 'pinnedTags.saving', {}) ?? '保存中…',
          'pinnedTags.reorder' => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorder', {}) ?? '並び替え',
          'pinnedTags.addTagManually' => TranslationOverrides.string(_root.$meta, 'pinnedTags.addTagManually', {}) ?? 'タグを手動で追加',
          'pinnedTags.noTagsMatchSearch' => TranslationOverrides.string(_root.$meta, 'pinnedTags.noTagsMatchSearch', {}) ?? '検索に一致するピン留めタグは見つかりません',
          'pinnedTags.noPinnedTagsYet' => TranslationOverrides.string(_root.$meta, 'pinnedTags.noPinnedTagsYet', {}) ?? 'タグはピン留めされていません',
          'pinnedTags.editLabels' => TranslationOverrides.string(_root.$meta, 'pinnedTags.editLabels', {}) ?? 'ラベルを編集',
          'pinnedTags.labels' => TranslationOverrides.string(_root.$meta, 'pinnedTags.labels', {}) ?? 'ラベル',
          'pinnedTags.addPinnedTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.addPinnedTag', {}) ?? 'ピン留めタグを追加',
          'pinnedTags.tagQuery' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQuery', {}) ?? 'タグクエリ',
          'pinnedTags.tagQueryHint' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQueryHint', {}) ?? 'tag_name',
          'pinnedTags.rawQueryHelp' => TranslationOverrides.string(_root.$meta, 'pinnedTags.rawQueryHelp', {}) ?? '複数のタグを含むどんな検索クエリでも入力できます',
          'mediaPreviews.noBooruConfigsFound' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.noBooruConfigsFound', {}) ?? 'Booruの設定が追加されていません',
          'mediaPreviews.addNewBooru' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? 'Booruを新規追加',
          'mediaPreviews.help' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.help', {}) ?? 'ヘルプ (英語)',
          'mediaPreviews.settings' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.settings', {}) ?? '設定',
          'mediaPreviews.restoringPreviousSession' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoringPreviousSession', {}) ?? '以前のセッションを復元中…',
          'mediaPreviews.copiedFileURL' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.copiedFileURL', {}) ?? 'ファイルURLをクリップボードにコピーしました！',
          'tagView.tags' => TranslationOverrides.string(_root.$meta, 'tagView.tags', {}) ?? 'タグ',
          'tagView.comments' => TranslationOverrides.string(_root.$meta, 'tagView.comments', {}) ?? 'コメント',
          'tagView.showNotes' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'tagView.showNotes', {'count': count}) ?? 'ノートを表示 (${count})',
          'tagView.hideNotes' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'tagView.hideNotes', {'count': count}) ?? 'ノートを隠す (${count})',
          'tagView.loadNotes' => TranslationOverrides.string(_root.$meta, 'tagView.loadNotes', {}) ?? 'ノートを読み込み',
          'tagView.thisTagAlreadyInSearch' =>
            TranslationOverrides.string(_root.$meta, 'tagView.thisTagAlreadyInSearch', {}) ?? 'このタグは既に現在の検索に含まれています:',
          'tagView.addedToCurrentSearch' => TranslationOverrides.string(_root.$meta, 'tagView.addedToCurrentSearch', {}) ?? '現在の検索クエリに追加されました:',
          'tagView.addedNewTab' => TranslationOverrides.string(_root.$meta, 'tagView.addedNewTab', {}) ?? '新規タブに追加:',
          'tagView.id' => TranslationOverrides.string(_root.$meta, 'tagView.id', {}) ?? 'ID',
          'tagView.postURL' => TranslationOverrides.string(_root.$meta, 'tagView.postURL', {}) ?? '投稿URL',
          'tagView.posted' => TranslationOverrides.string(_root.$meta, 'tagView.posted', {}) ?? '投稿日時',
          'tagView.details' => TranslationOverrides.string(_root.$meta, 'tagView.details', {}) ?? '詳細',
          'tagView.filename' => TranslationOverrides.string(_root.$meta, 'tagView.filename', {}) ?? 'ファイル名',
          _ => null,
        } ??
        switch (path) {
          'tagView.url' => TranslationOverrides.string(_root.$meta, 'tagView.url', {}) ?? 'コンテンツURL',
          'tagView.extension' => TranslationOverrides.string(_root.$meta, 'tagView.extension', {}) ?? '拡張子',
          'tagView.resolution' => TranslationOverrides.string(_root.$meta, 'tagView.resolution', {}) ?? '解像度',
          'tagView.size' => TranslationOverrides.string(_root.$meta, 'tagView.size', {}) ?? 'サイズ',
          'tagView.md5' => TranslationOverrides.string(_root.$meta, 'tagView.md5', {}) ?? 'MD5',
          'tagView.rating' => TranslationOverrides.string(_root.$meta, 'tagView.rating', {}) ?? 'レーティング',
          'tagView.score' => TranslationOverrides.string(_root.$meta, 'tagView.score', {}) ?? '評価',
          'tagView.noTagsFound' => TranslationOverrides.string(_root.$meta, 'tagView.noTagsFound', {}) ?? 'タグが見つかりませんでした',
          'tagView.copy' => TranslationOverrides.string(_root.$meta, 'tagView.copy', {}) ?? 'コピー',
          'tagView.removeFromSearch' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromSearch', {}) ?? '現在の検索から削除',
          'tagView.addToSearch' => TranslationOverrides.string(_root.$meta, 'tagView.addToSearch', {}) ?? '検索に追加',
          'tagView.addedToSearchBar' => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBar', {}) ?? '検索バーに追加:',
          'tagView.addToSearchExclude' => TranslationOverrides.string(_root.$meta, 'tagView.addToSearchExclude', {}) ?? '現在の検索に追加 (除外)',
          'tagView.addedToSearchBarExclude' => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBarExclude', {}) ?? '除外として検索バーに追加:',
          'tagView.addToMarked' => TranslationOverrides.string(_root.$meta, 'tagView.addToMarked', {}) ?? 'お気に入りタグに追加',
          'tagView.addToHidden' => TranslationOverrides.string(_root.$meta, 'tagView.addToHidden', {}) ?? '非表示タグに追加',
          'tagView.removeFromMarked' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromMarked', {}) ?? 'お気に入りタグから削除',
          'tagView.removeFromHidden' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromHidden', {}) ?? '非表示タグから削除',
          'tagView.editTag' => TranslationOverrides.string(_root.$meta, 'tagView.editTag', {}) ?? 'タグを編集',
          'tagView.sourceDialogTitle' => TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogTitle', {}) ?? 'ソース',
          'tagView.preview' => TranslationOverrides.string(_root.$meta, 'tagView.preview', {}) ?? 'プレビュー',
          'tagView.selectBooruToLoad' => TranslationOverrides.string(_root.$meta, 'tagView.selectBooruToLoad', {}) ?? '読み込むBooruを選択',
          'tagView.previewIsLoading' => TranslationOverrides.string(_root.$meta, 'tagView.previewIsLoading', {}) ?? 'プレビュー読み込み中…',
          'tagView.failedToLoadPreview' => TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreview', {}) ?? 'プレビューの読み込みに失敗しました',
          'tagView.tapToTryAgain' => TranslationOverrides.string(_root.$meta, 'tagView.tapToTryAgain', {}) ?? 'タップして再試行',
          'tagView.copiedFileURL' => TranslationOverrides.string(_root.$meta, 'tagView.copiedFileURL', {}) ?? 'ファイルのURLをクリップボードにコピーしました',
          'tagView.tagPreviews' => TranslationOverrides.string(_root.$meta, 'tagView.tagPreviews', {}) ?? 'タグプレビュー',
          'tagView.currentState' => TranslationOverrides.string(_root.$meta, 'tagView.currentState', {}) ?? '現在の状態',
          'tagView.history' => TranslationOverrides.string(_root.$meta, 'tagView.history', {}) ?? '履歴',
          'tagView.failedToLoadPreviewPage' => TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreviewPage', {}) ?? 'プレビューページの読み込みに失敗',
          'tagView.tryAgain' => TranslationOverrides.string(_root.$meta, 'tagView.tryAgain', {}) ?? '再試行',
          'tagView.detectedLinks' => TranslationOverrides.string(_root.$meta, 'tagView.detectedLinks', {}) ?? '見つかったリンク:',
          'tagView.relatedTabs' => TranslationOverrides.string(_root.$meta, 'tagView.relatedTabs', {}) ?? '関連タブ',
          'tagView.tabsWithOnlyTag' => TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTag', {}) ?? 'このタグのみのタブ',
          'tagView.tabsWithOnlyTagDifferentBooru' =>
            TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTagDifferentBooru', {}) ?? 'このタグのみで、違うBooruのタブ',
          'tagView.tabsContainingTag' => TranslationOverrides.string(_root.$meta, 'tagView.tabsContainingTag', {}) ?? 'このタグを含むタブ',
          'tagType.artist' => TranslationOverrides.string(_root.$meta, 'tagType.artist', {}) ?? 'アーティスト',
          'tagType.character' => TranslationOverrides.string(_root.$meta, 'tagType.character', {}) ?? 'キャラクター',
          'tagType.copyright' => TranslationOverrides.string(_root.$meta, 'tagType.copyright', {}) ?? 'コピーライト / シリーズ',
          'tagType.meta' => TranslationOverrides.string(_root.$meta, 'tagType.meta', {}) ?? 'メタ',
          'tagType.species' => TranslationOverrides.string(_root.$meta, 'tagType.species', {}) ?? '種',
          'tagType.none' => TranslationOverrides.string(_root.$meta, 'tagType.none', {}) ?? 'なし/一般',
          'comments.title' => TranslationOverrides.string(_root.$meta, 'comments.title', {}) ?? 'コメント',
          'comments.noComments' => TranslationOverrides.string(_root.$meta, 'comments.noComments', {}) ?? 'コメントなし',
          'comments.noBooruAPIForComments' =>
            TranslationOverrides.string(_root.$meta, 'comments.noBooruAPIForComments', {}) ?? 'このBooruにはコメントかコメント用のAPIがありません',
          'lockscreen.testingMessage' =>
            TranslationOverrides.string(_root.$meta, 'lockscreen.testingMessage', {}) ??
                '[TESTING]: 通常の方法でアプリのロックを解除できない場合はこのボタンを押してください。デバイスの詳細を開発者に報告してください。',
          'lockscreen.tapToAuthenticate' => TranslationOverrides.string(_root.$meta, 'lockscreen.tapToAuthenticate', {}) ?? 'タップして認証',
          'lockscreen.devUnlock' => TranslationOverrides.string(_root.$meta, 'lockscreen.devUnlock', {}) ?? 'DEV UNLOCK',
          'imageSearch.title' => TranslationOverrides.string(_root.$meta, 'imageSearch.title', {}) ?? '画像検索',
          'mobileHome.lockApp' => TranslationOverrides.string(_root.$meta, 'mobileHome.lockApp', {}) ?? 'アプリをロック',
          'mobileHome.cancelledByUser' => TranslationOverrides.string(_root.$meta, 'mobileHome.cancelledByUser', {}) ?? 'ユーザーによるキャンセル',
          'mobileHome.saveAnyway' => TranslationOverrides.string(_root.$meta, 'mobileHome.saveAnyway', {}) ?? 'とにかく保存',
          'mobileHome.skip' => TranslationOverrides.string(_root.$meta, 'mobileHome.skip', {}) ?? 'スキップ',
          'mobileHome.failedToDownload' => TranslationOverrides.string(_root.$meta, 'mobileHome.failedToDownload', {}) ?? 'ダウンロード失敗',
          'mobileHome.fileAlreadyExists' => TranslationOverrides.string(_root.$meta, 'mobileHome.fileAlreadyExists', {}) ?? 'ファイルはすでに存在します',
          'mobileHome.retryAll' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'mobileHome.retryAll', {'count': count}) ?? 'すべて再試行 (${count})',
          'mobileHome.selectBooruForWebview' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.selectBooruForWebview', {}) ?? 'WebviewでBooruを選択',
          'mobileHome.existingFailedOrCancelledItems' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.existingFailedOrCancelledItems', {}) ?? '既に存在、失敗またはキャンセルされたアイテム',
          'mobileHome.clearAllRetryableItems' => TranslationOverrides.string(_root.$meta, 'mobileHome.clearAllRetryableItems', {}) ?? 'すべてクリア',
          'pageChanger.title' => TranslationOverrides.string(_root.$meta, 'pageChanger.title', {}) ?? 'ページスイッチャー',
          'pageChanger.pageLabel' => TranslationOverrides.string(_root.$meta, 'pageChanger.pageLabel', {}) ?? 'ページ #',
          'pageChanger.delayBetweenLoadings' => TranslationOverrides.string(_root.$meta, 'pageChanger.delayBetweenLoadings', {}) ?? '読み込み間隔 (ms)',
          'pageChanger.delayInMs' => TranslationOverrides.string(_root.$meta, 'pageChanger.delayInMs', {}) ?? '間隔 (ms)',
          'pageChanger.currentPage' =>
            ({required int number}) =>
                TranslationOverrides.string(_root.$meta, 'pageChanger.currentPage', {'number': number}) ?? '現在のベージ: #${number}',
          'pageChanger.possibleMaxPage' =>
            ({required int number}) =>
                TranslationOverrides.string(_root.$meta, 'pageChanger.possibleMaxPage', {'number': number}) ?? '最大可能ページ: #~${number}',
          'pageChanger.searchCurrentlyRunning' => TranslationOverrides.string(_root.$meta, 'pageChanger.searchCurrentlyRunning', {}) ?? '検索が進行中です！',
          'pageChanger.jumpToPage' => TranslationOverrides.string(_root.$meta, 'pageChanger.jumpToPage', {}) ?? '指定ページへジャンプ',
          'pageChanger.searchUntilPage' => TranslationOverrides.string(_root.$meta, 'pageChanger.searchUntilPage', {}) ?? '指定ページまで読み込み',
          'pageChanger.stopSearching' => TranslationOverrides.string(_root.$meta, 'pageChanger.stopSearching', {}) ?? '検索の停止',
          'tagsManager.title' => TranslationOverrides.string(_root.$meta, 'tagsManager.title', {}) ?? 'すべてのタグ',
          'tagsManager.addTag' => TranslationOverrides.string(_root.$meta, 'tagsManager.addTag', {}) ?? 'タグの追加',
          'tagsManager.name' => TranslationOverrides.string(_root.$meta, 'tagsManager.name', {}) ?? '名前',
          'tagsManager.type' => TranslationOverrides.string(_root.$meta, 'tagsManager.type', {}) ?? 'タイプ',
          'tagsManager.add' => TranslationOverrides.string(_root.$meta, 'tagsManager.add', {}) ?? '追加',
          'tagsManager.addedATab' => TranslationOverrides.string(_root.$meta, 'tagsManager.addedATab', {}) ?? 'タブを追加しました',
          'tagsManager.addATab' => TranslationOverrides.string(_root.$meta, 'tagsManager.addATab', {}) ?? 'タブに追加',
          'tagsManager.copy' => TranslationOverrides.string(_root.$meta, 'tagsManager.copy', {}) ?? 'コピー',
          'tagsManager.setStale' => TranslationOverrides.string(_root.$meta, 'tagsManager.setStale', {}) ?? 'レガシー状態にする',
          'tagsManager.resetStale' => TranslationOverrides.string(_root.$meta, 'tagsManager.resetStale', {}) ?? '期限をリセット',
          'tagsManager.staleAfter' =>
            ({required String staleText}) =>
                TranslationOverrides.string(_root.$meta, 'tagsManager.staleAfter', {'staleText': staleText}) ?? '${staleText} にレガシー化',
          'tagsManager.makeUnstaleable' => TranslationOverrides.string(_root.$meta, 'tagsManager.makeUnstaleable', {}) ?? 'レガシー化を無効にする',
          'tagsManager.deleteTags' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'tagsManager.deleteTags', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
                  count,
                  one: '${count} 個のタグを削除',
                  few: '${count} 個のタグを削除',
                  many: '${count} 個のタグを削除',
                  other: '${count} 個のタグを削除',
                ),
          'tagsManager.deleteTagsTitle' => TranslationOverrides.string(_root.$meta, 'tagsManager.deleteTagsTitle', {}) ?? 'タグの削除',
          'tagsManager.clearSelection' => TranslationOverrides.string(_root.$meta, 'tagsManager.clearSelection', {}) ?? '選択をクリア',
          'galleryView.noItemSelected' => TranslationOverrides.string(_root.$meta, 'galleryView.noItemSelected', {}) ?? 'アイテムは選択されていません',
          'galleryView.noItems' => TranslationOverrides.string(_root.$meta, 'galleryView.noItems', {}) ?? 'アイテムなし',
          'galleryView.close' => TranslationOverrides.string(_root.$meta, 'galleryView.close', {}) ?? '閉じる',
          'common.selectABooru' => TranslationOverrides.string(_root.$meta, 'common.selectABooru', {}) ?? 'Booruを選択',
          'common.booruItemCopiedToClipboard' =>
            TranslationOverrides.string(_root.$meta, 'common.booruItemCopiedToClipboard', {}) ?? 'Booruアイテムがクリップボードにコピーされました',
          'imageStats.live' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.live', {'count': count}) ?? 'アクティブ: ${count}',
          'imageStats.pending' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.pending', {'count': count}) ?? '保留中: ${count}',
          'imageStats.total' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.total', {'count': count}) ?? '合計: ${count}',
          'imageStats.size' =>
            ({required String size}) => TranslationOverrides.string(_root.$meta, 'imageStats.size', {'size': size}) ?? 'サイズ: ${size}',
          'imageStats.max' => ({required String max}) => TranslationOverrides.string(_root.$meta, 'imageStats.max', {'max': max}) ?? '最大: ${max}',
          _ => null,
        };
  }
}
