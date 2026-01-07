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
class TranslationsRu extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  /// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
  TranslationsRu({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.ru,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
    super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <ru>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsRu _root = this; // ignore: unused_field

  @override
  TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'ru';
  @override
  String get localeName => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'Русский';
  @override
  String get appName => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Ошибка';
  @override
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'Ошибка!';
  @override
  String get warning => TranslationOverrides.string(_root.$meta, 'warning', {}) ?? 'Внимание';
  @override
  String get warningExclamation => TranslationOverrides.string(_root.$meta, 'warningExclamation', {}) ?? 'Внимание!';
  @override
  String get info => TranslationOverrides.string(_root.$meta, 'info', {}) ?? 'Инфо';
  @override
  String get success => TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Успешно';
  @override
  String get successExclamation => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? 'Успешно!';
  @override
  String get cancel => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Отмена';
  @override
  String get later => TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Позже';
  @override
  String get close => TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Закрыть';
  @override
  String get ok => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'OK';
  @override
  String get yes => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Да';
  @override
  String get no => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'Нет';
  @override
  String get pleaseWait => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Подожди...';
  @override
  String get show => TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Показать';
  @override
  String get hide => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Скрыть';
  @override
  String get enable => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'Включить';
  @override
  String get disable => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Выключить';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Добавить';
  @override
  String get edit => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? 'Редактировать';
  @override
  String get remove => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? 'Убрать';
  @override
  String get save => TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Сохранить';
  @override
  String get delete => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? 'Удалить';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Копировать';
  @override
  String get copied => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Скопировано!';
  @override
  String get paste => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Вставить';
  @override
  String get copyErrorText => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Скопировать ошибку';
  @override
  String get booru => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Сайт';
  @override
  String get goToSettings => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'В настройки';
  @override
  String get areYouSure => TranslationOverrides.string(_root.$meta, 'areYouSure', {}) ?? 'Ты уверен?';
  @override
  String get thisMayTakeSomeTime => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'Это может занять некоторое время...';
  @override
  String get doYouWantToExitApp => TranslationOverrides.string(_root.$meta, 'doYouWantToExitApp', {}) ?? 'Ты хочешь выйти из приложения?';
  @override
  String get closeTheApp => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Закрыть приложение';
  @override
  String get invalidUrl => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'Неправильная ссылка!';
  @override
  String get clipboardIsEmpty => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'Буфер обмена пуст!';
  @override
  String get apiKey => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'API ключ';
  @override
  String get userId => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'ID юзера';
  @override
  String get login => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Логин';
  @override
  String get password => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Пароль';
  @override
  String get pause => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Пауза';
  @override
  String get resume => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Продолжить';
  @override
  String get discord => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord';
  @override
  String get visitOurDiscord => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Заходи на наш Discord сервер';
  @override
  String get item => TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Элемент';
  @override
  String get selectAll => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Выбрать все';
  @override
  late final _TranslationsValidationErrorsRu validationErrors = _TranslationsValidationErrorsRu._(_root);
  @override
  late final _TranslationsInitRu init = _TranslationsInitRu._(_root);
  @override
  late final _TranslationsSnatcherRu snatcher = _TranslationsSnatcherRu._(_root);
  @override
  late final _TranslationsMultibooruRu multibooru = _TranslationsMultibooruRu._(_root);
  @override
  late final _TranslationsSettingsRu settings = _TranslationsSettingsRu._(_root);
}

// Path: validationErrors
class _TranslationsValidationErrorsRu extends TranslationsValidationErrorsEn {
  _TranslationsValidationErrorsRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get required => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Введи значение';
  @override
  String get invalid => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Введи валидное значение';
  @override
  String tooSmall({required Object min}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Введи значение больше ${min}';
  @override
  String tooBig({required Object max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Введи значение меньше ${max}';
}

// Path: init
class _TranslationsInitRu extends TranslationsInitEn {
  _TranslationsInitRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get initError => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Ошибка инициализации!';
  @override
  String get postInitError => TranslationOverrides.string(_root.$meta, 'init.postInitError', {}) ?? 'Ошибка постинициализации!';
  @override
  String get settingUpProxy => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Настройка прокси...';
  @override
  String get loadingDatabase => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Загрузка базы данных...';
  @override
  String get loadingBoorus => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Загрузка конфигов сайтов...';
  @override
  String get loadingTags => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Загрузка тегов...';
  @override
  String get restoringTabs => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Восстановление вкладок...';
}

// Path: snatcher
class _TranslationsSnatcherRu extends TranslationsSnatcherEn {
  _TranslationsSnatcherRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Загрузчик';
  @override
  String get snatchingHistory => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'История загрузок';
}

// Path: multibooru
class _TranslationsMultibooruRu extends TranslationsMultibooruEn {
  _TranslationsMultibooruRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? 'Мультисайт';
  @override
  String get multibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Режим мультисайта';
  @override
  String get multibooruRequiresAtLeastTwoBoorus =>
      TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ??
      'Режим мультисайта требует не менее двух настроенных конфигов сайтов';
  @override
  String get selectSecondaryBoorus =>
      TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Выбери второстепенные конфиги:';
}

// Path: settings
class _TranslationsSettingsRu extends TranslationsSettingsEn {
  _TranslationsSettingsRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Настройки';
  @override
  late final _TranslationsSettingsLanguageRu language = _TranslationsSettingsLanguageRu._(_root);
  @override
  late final _TranslationsSettingsBooruRu booru = _TranslationsSettingsBooruRu._(_root);
  @override
  late final _TranslationsSettingsBooruEditorRu booruEditor = _TranslationsSettingsBooruEditorRu._(_root);
  @override
  late final _TranslationsSettingsInterfaceRu interface = _TranslationsSettingsInterfaceRu._(_root);
  @override
  late final _TranslationsSettingsThemeRu theme = _TranslationsSettingsThemeRu._(_root);
  @override
  late final _TranslationsSettingsViewerRu viewer = _TranslationsSettingsViewerRu._(_root);
  @override
  late final _TranslationsSettingsVideoRu video = _TranslationsSettingsVideoRu._(_root);
  @override
  late final _TranslationsSettingsDownloadsRu downloads = _TranslationsSettingsDownloadsRu._(_root);
  @override
  late final _TranslationsSettingsCacheRu cache = _TranslationsSettingsCacheRu._(_root);
  @override
  String get downloadsAndCache => TranslationOverrides.string(_root.$meta, 'settings.downloadsAndCache', {}) ?? 'Загрузки и Кэширование';
  @override
  late final _TranslationsSettingsTagFiltersRu tagFilters = _TranslationsSettingsTagFiltersRu._(_root);
  @override
  late final _TranslationsSettingsDatabaseRu database = _TranslationsSettingsDatabaseRu._(_root);
  @override
  late final _TranslationsSettingsBackupAndRestoreRu backupAndRestore = _TranslationsSettingsBackupAndRestoreRu._(_root);
  @override
  late final _TranslationsSettingsNetworkRu network = _TranslationsSettingsNetworkRu._(_root);
  @override
  late final _TranslationsSettingsPrivacyRu privacy = _TranslationsSettingsPrivacyRu._(_root);
  @override
  late final _TranslationsSettingsSyncRu sync = _TranslationsSettingsSyncRu._(_root);
  @override
  late final _TranslationsSettingsAboutRu about = _TranslationsSettingsAboutRu._(_root);
  @override
  late final _TranslationsSettingsCheckForUpdatesRu checkForUpdates = _TranslationsSettingsCheckForUpdatesRu._(_root);
  @override
  late final _TranslationsSettingsHelpRu help = _TranslationsSettingsHelpRu._(_root);
  @override
  late final _TranslationsSettingsDebugRu debug = _TranslationsSettingsDebugRu._(_root);
  @override
  late final _TranslationsSettingsLoggingRu logging = _TranslationsSettingsLoggingRu._(_root);
  @override
  late final _TranslationsSettingsWebviewRu webview = _TranslationsSettingsWebviewRu._(_root);
  @override
  String get version => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? 'Версия';
}

// Path: settings.language
class _TranslationsSettingsLanguageRu extends TranslationsSettingsLanguageEn {
  _TranslationsSettingsLanguageRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? 'Язык';
}

// Path: settings.booru
class _TranslationsSettingsBooruRu extends TranslationsSettingsBooruEn {
  _TranslationsSettingsBooruRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Сайты и Поиск';
  @override
  String get defaultTags => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? 'Теги по умолчанию';
  @override
  String get itemsPerPage => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'Элементов на странице';
  @override
  String get itemsPerPageTip =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'Некоторые сайты могут игнорировать этот параметр';
  @override
  String get addBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Добавить конфиг сайта';
  @override
  String get shareBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? 'Поделиться конфигом сайта';
  @override
  String shareBooruDialogMsgMobile({required Object booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
      'Конфиг сайта ${booruName} будет превращен в ссылку, которой затем можно поделиться в других приложениях\n\nВключить ли данные логина/ключа api?';
  @override
  String shareBooruDialogMsgDesktop({required Object booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
      'Конфиг сайта ${booruName} будет превращен в ссылку, которая будет скопирована в буфер обмена\n\nВключить ли данные логина/ключа api?';
  @override
  String get booruSharing => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? 'Поделиться конфигом сайта';
  @override
  String get booruSharingMsgAndroid =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ??
      'Как автоматически открывать ссылки с конфигами сайта в приложении на Android 12 и выше:\n1) Нажми на кнопку снизу чтобы открыть системные настройки ссылок по умолчанию\n2) Нажми на "Добавить ссылку" и выберите все доступные опции';
  @override
  String get addedBoorus => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? 'Добавленные сайты';
  @override
  String get editBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? 'Редактировать конфиг';
  @override
  String get importBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? 'Импортировать конфиг из буфера обмена';
  @override
  String get onlyLSURLsSupported =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ?? 'Поддерживаются только ссылки формата loli.snatcher';
  @override
  String get deleteBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? 'Удалить конфиг сайта';
  @override
  String get deleteBooruError =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ?? 'Что-то пошло не так при удалении конфига!';
  @override
  String get booruDeleted => TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? 'Конфиг удален!';
  @override
  String get booruDropdownInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ??
      'Сайт выбранный здесь будет назначен сайтом по умолчанию после сохранения.\n\nСайт по умолчанию будет появляться в топе выпадающих списков';
  @override
  String get changeDefaultBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? 'Сменить сайт по умолчанию?';
  @override
  String get changeTo => TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? 'Сменить на: ';
  @override
  String get keepCurrentBooru =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? 'Нажми [Нет] чтобы оставить текущий: ';
  @override
  String get changeToNewBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? 'Нажми [Да] чтобы сменить на: ';
  @override
  String get booruConfigLinkCopied =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ?? 'Конфиг в виде ссылки скопирован!';
  @override
  String get noBooruSelected => TranslationOverrides.string(_root.$meta, 'settings.booru.noBooruSelected', {}) ?? 'Сайт не выбран!';
  @override
  String get cantDeleteThisBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? 'Нельзя удалить этот сайт!';
  @override
  String get removeRelatedTabsFirst =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.removeRelatedTabsFirst', {}) ?? 'Сначала удалите связанные вкладки';
}

// Path: settings.booruEditor
class _TranslationsSettingsBooruEditorRu extends TranslationsSettingsBooruEditorEn {
  _TranslationsSettingsBooruEditorRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? 'Редактор конфига сайта';
  @override
  String get testBooru => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooru', {}) ?? 'Проверить сайт';
  @override
  String get testBooruSuccessMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruSuccessMsg', {}) ??
      'Нажми кнопку Сохранить чтобы сохранить этот конфиг';
  @override
  String get testBooruFailedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'Проверка сайта не удалась';
  @override
  String get testBooruFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ??
      'Данные конфига неверны, сайт не дает доступ к API, запрос не вернул данные или есть проблемы с сетью.';
  @override
  String get saveBooru => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Сохранить конфиг';
  @override
  String get runTestFirst => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runTestFirst', {}) ?? 'Сначала запусти проверку';
  @override
  String get booruConfigExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? 'Такой конфиг уже существует';
  @override
  String get booruSameNameExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ?? 'Конфиг с таким именем уже существует';
  @override
  String get booruSameUrlExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ?? 'Конфиг с таким URL уже существует';
  @override
  String get thisBooruConfigWontBeAdded =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ?? 'Этот конфиг не будет добавлен';
  @override
  String get booruConfigSaved => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? 'Конфиг сохранен!';
  @override
  String get existingTabsNeedReload =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ??
      'Существующие вкладки с этим сайтом должны быть перезагружены, чтобы применить изменения!';
  @override
  String get failedVerifyApiHydrus =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ?? 'Не удалось проверить доступ к API для Hydrus';
  @override
  String get accessKeyRequestedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? 'Запрос ключа доступа';
  @override
  String get accessKeyRequestedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ??
      'Нажми [Ок] в Hydrus, затем примени. Можешь нажать [Проверить сайт] после этого';
  @override
  String get accessKeyFailedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? 'Не удалось получить ключ доступа';
  @override
  String get accessKeyFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ?? 'Открыл ли ты окно запроса в Hydrus?';
  @override
  String get hydrusInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ??
      'Для получения ключа Hydrus нужно открыть окно запроса в клиенте Hydrus. Services > Review services > Client api > Add > From API request';
  @override
  String get getHydrusApiKey => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? 'Получить ключ API Hydrus';
  @override
  String get booruName => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? 'Имя конфига';
  @override
  String get booruNameRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? 'Имя конфига обязательно!';
  @override
  String get booruUrl => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? 'URL сайта';
  @override
  String get booruUrlRequired => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? 'URL обязательно!';
  @override
  String get booruType => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruType', {}) ?? 'Тип конфига';
  @override
  String booruTypeIs({required Object booruType}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruTypeIs', {'booruType': booruType}) ?? 'Сайт типа: ${booruType}';
  @override
  String get booruFavicon => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? 'URL иконки';
  @override
  String get booruFaviconPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ??
      '(Автоматически заполняется, если оставить пустым)';
  @override
  String booruApiCredsInfo({required Object userIdTitle, required Object apiKeyTitle}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruApiCredsInfo', {'userIdTitle': userIdTitle, 'apiKeyTitle': apiKeyTitle}) ??
      '${userIdTitle} и ${apiKeyTitle} могут быть обязательны для некоторых сайтов, но в большинстве случаев не нужны.';
  @override
  String get booruDefTags => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? 'Теги по умолчанию';
}

// Path: settings.interface
class _TranslationsSettingsInterfaceRu extends TranslationsSettingsInterfaceEn {
  _TranslationsSettingsInterfaceRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? 'Интерфейс';
}

// Path: settings.theme
class _TranslationsSettingsThemeRu extends TranslationsSettingsThemeEn {
  _TranslationsSettingsThemeRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? 'Темы';
}

// Path: settings.viewer
class _TranslationsSettingsViewerRu extends TranslationsSettingsViewerEn {
  _TranslationsSettingsViewerRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? 'Просмотрщик';
}

// Path: settings.video
class _TranslationsSettingsVideoRu extends TranslationsSettingsVideoEn {
  _TranslationsSettingsVideoRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? 'Видео';
}

// Path: settings.downloads
class _TranslationsSettingsDownloadsRu extends TranslationsSettingsDownloadsEn {
  _TranslationsSettingsDownloadsRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.downloads.title', {}) ?? 'Скачивание';
  @override
  String get fromNextItemInQueue =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.fromNextItemInQueue', {}) ?? 'Со следующего элемента в очереди';
  @override
  String get pleaseProvideStoragePermission =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.pleaseProvideStoragePermission', {}) ??
      'Пожалуйста, предоставь разрешение на доступ к хранилищу, чтобы сохранять файлы';
  @override
  String get noItemsSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsSelected', {}) ?? 'Нет выбранных элементов';
  @override
  String get noItemsQueued => TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsQueued', {}) ?? 'Нет элементов в очереди';
  @override
  String get batch => TranslationOverrides.string(_root.$meta, 'settings.downloads.batch', {}) ?? 'Пачка';
  @override
  String get snatchSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? 'Скачать выбранные';
  @override
  String get removeSnatchedStatusFromSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ?? 'Удалить статус скачивания у выбранных';
  @override
  String get favouriteSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? 'Добавить выбранные в избранное';
  @override
  String get unfavouriteSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? 'Удалить выбранные из избранного';
  @override
  String get clearSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? 'Очистить выбранные';
  @override
  String get updatingData => TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? 'Обновление данных...';
}

// Path: settings.cache
class _TranslationsSettingsCacheRu extends TranslationsSettingsCacheEn {
  _TranslationsSettingsCacheRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? 'Кэш';
}

// Path: settings.tagFilters
class _TranslationsSettingsTagFiltersRu extends TranslationsSettingsTagFiltersEn {
  _TranslationsSettingsTagFiltersRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.tagFilters.title', {}) ?? 'Фильтры тегов';
}

// Path: settings.database
class _TranslationsSettingsDatabaseRu extends TranslationsSettingsDatabaseEn {
  _TranslationsSettingsDatabaseRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? 'База данных';
  @override
  String get indexingDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? 'Индексирование базы данных';
  @override
  String get droppingIndexes => TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? 'Удаление индексов';
}

// Path: settings.backupAndRestore
class _TranslationsSettingsBackupAndRestoreRu extends TranslationsSettingsBackupAndRestoreEn {
  _TranslationsSettingsBackupAndRestoreRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.title', {}) ?? 'Резервное копирование и восстановление';
  @override
  String get duplicateFileDetectedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedTitle', {}) ?? 'Дублирующийся файл!';
  @override
  String duplicateFileDetectedMsg({required Object fileName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
      'Файл ${fileName} уже существует. Ты хочешь его перезаписать? Усли выбрать нет, то бэкап будет отменен.';
  @override
  String get androidOnlyFeatureMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ??
      'Эта функция доступна только на Android, на десктопных билдах можно просто копировать файлы из папки данных приложения';
  @override
  String get selectBackupDir =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? 'Выбери папку для бэкапов';
  @override
  String get failedToGetBackupPath =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ?? 'Не удалось получить путь к папке бэкапов!';
  @override
  String backupPathMsg({required Object backupPath}) =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ??
      'Папка бэкапов: ${backupPath}';
  @override
  String get noBackupDirSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ?? 'Нет выбранной папки бэкапов';
  @override
  String get restoreInfoMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ??
      'Восстановление будет работать только если файлы расположены в корне папки.';
  @override
  String get backupSettings => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? 'Бэкап настроек';
  @override
  String get restoreSettings =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? 'Восстановление настроек';
  @override
  String get settingsBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ?? 'Настроики сохранены в settings.json';
  @override
  String get settingsRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? 'Настроики восстановлены из бэкапа!';
  @override
  String get backupSettingsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ?? 'Не удалось сохранить настроики!';
  @override
  String get restoreSettingsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ?? 'Не удалось восстановить настроики!';
  @override
  String get backupBoorus => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ?? 'Бэкап конфигов сайтов';
  @override
  String get restoreBoorus =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? 'Восстановление конфигов сайтов';
  @override
  String get boorusBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ?? 'Конфиги сохранены в boorus.json';
  @override
  String get boorusRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ?? 'Конфиги восстановлены из бэкапа!';
  @override
  String get backupBoorusError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ?? 'Не удалось сохранить конфиги сайтов!';
  @override
  String get restoreBoorusError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ?? 'Не удалось восстановить конфиги сайтов!';
  @override
  String get backupDatabase => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? 'Бэкап базы данных';
  @override
  String get restoreDatabase =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? 'Восстановление базы данных';
  @override
  String get restoreDatabaseInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ??
      'Может занять время в зависимости от объема базы данных, приложение перезапустится после успешного восстановления';
  @override
  String get databaseBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ?? 'База данных сохранена в database.json';
  @override
  String get databaseRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ??
      'База данных восстановлена из бэкапа! Приложение будет перезапущено через несколько секунд!';
  @override
  String get backupDatabaseError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ?? 'Не удалось сохранить базу данных!';
  @override
  String get restoreDatabaseError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ?? 'Не удалось восстановить базу данных!';
  @override
  String get databaseFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ??
      'Файл базы данных не найден или не может быть прочитан!';
  @override
  String get backupTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? 'Бэкап тегов';
  @override
  String get restoreTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? 'Восстановление тегов';
  @override
  String get restoreTagsInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ??
      'Может занять время, если у тебя много тегов. Если ты сделал восстановление базы данных, то эта операция не нужна, потому что теги уже включены в базу данных';
  @override
  String get tagsBackedUp => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? 'Теги сохранены в tags.json';
  @override
  String get tagsRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? 'Теги восстановлены из бэкапа!';
  @override
  String get backupTagsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? 'Не удалось сохранить теги!';
  @override
  String get restoreTagsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? 'Не удалось восстановить теги!';
  @override
  String get tagsFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsFileNotFound', {}) ??
      'Файл тегов не найден или не может быть прочитан!';
  @override
  String get operationTakesTooLongMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.operationTakesTooLongMsg', {}) ??
      'Нажми Скрыть, если операция занимает слишком много времени, операция будет продолжена в фоновом режиме';
  @override
  String get backupFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupFileNotFound', {}) ??
      'Файл бэкапа не найден или не может быть прочитан!';
  @override
  String get backupDirNoAccess =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDirNoAccess', {}) ?? 'Нет доступа к папке бэкапов!';
  @override
  String get backupCancelled => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? 'Бэкап отменен!';
}

// Path: settings.network
class _TranslationsSettingsNetworkRu extends TranslationsSettingsNetworkEn {
  _TranslationsSettingsNetworkRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? 'Сеть';
}

// Path: settings.privacy
class _TranslationsSettingsPrivacyRu extends TranslationsSettingsPrivacyEn {
  _TranslationsSettingsPrivacyRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? 'Приватность';
}

// Path: settings.sync
class _TranslationsSettingsSyncRu extends TranslationsSettingsSyncEn {
  _TranslationsSettingsSyncRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? 'LoliSync';
  @override
  String get dbError =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ?? 'База данных должна быть включена чтобы использовать LoliSync';
}

// Path: settings.about
class _TranslationsSettingsAboutRu extends TranslationsSettingsAboutEn {
  _TranslationsSettingsAboutRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.about.title', {}) ?? 'О приложении';
  @override
  String get appDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ??
      'LoliSnatcher - это открытое программное обеспечение, распространяемое по лицензии GPLv3. Исходный код доступен на GitHub. Пожалуйста, сообщайте о любых проблемах или просьбах в разделе issues репозитория.';
  @override
  String get appOnGitHub => TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? 'LoliSnatcher на Github';
  @override
  String get contact => TranslationOverrides.string(_root.$meta, 'settings.about.contact', {}) ?? 'Связаться';
  @override
  String get emailCopied => TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? 'Email скопирован!';
  @override
  String get logoArtistThanks =>
      TranslationOverrides.string(_root.$meta, 'settings.about.logoArtistThanks', {}) ??
      'Большая благодарность Showers-U за разрешение на использование их работы для лого приложения. Пожалуйста, зацените их работы на Pixiv';
  @override
  String get developers => TranslationOverrides.string(_root.$meta, 'settings.about.developers', {}) ?? 'Разработчики';
  @override
  String get releases => TranslationOverrides.string(_root.$meta, 'settings.about.releases', {}) ?? 'Релизы';
  @override
  String get releasesMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.about.releasesMsg', {}) ??
      'Последняя версия и полные списки изменений можно найти на странице релизов в GitHub:';
  @override
  String get licenses => TranslationOverrides.string(_root.$meta, 'settings.about.licenses', {}) ?? 'Лицензии';
}

// Path: settings.checkForUpdates
class _TranslationsSettingsCheckForUpdatesRu extends TranslationsSettingsCheckForUpdatesEn {
  _TranslationsSettingsCheckForUpdatesRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.title', {}) ?? 'Проверить наличие обновлений';
  @override
  String get updateAvailable => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateAvailable', {}) ?? 'Доступно обновление!';
  @override
  String get updateChangelog =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? 'Список изменений обновления';
  @override
  String get updateCheckError =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? 'Ошибка при проверке обновлений!';
  @override
  String get youHaveLatestVersion =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? 'У тебя последняя версия!';
  @override
  String get viewLatestChangelog =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ?? 'Посмотреть последний список изменений';
  @override
  String get currentVersion => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? 'Текущая версия';
  @override
  String get changelog => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? 'Список изменений';
  @override
  String get visitPlayStore => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? 'Перейти в Play Store';
  @override
  String get visitReleases => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? 'Перейти к Релизам';
}

// Path: settings.help
class _TranslationsSettingsHelpRu extends TranslationsSettingsHelpEn {
  _TranslationsSettingsHelpRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? 'Помощь';
}

// Path: settings.debug
class _TranslationsSettingsDebugRu extends TranslationsSettingsDebugEn {
  _TranslationsSettingsDebugRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.debug.title', {}) ?? 'Дебаг';
  @override
  String get enabledSnackbarMsg => TranslationOverrides.string(_root.$meta, 'settings.debug.enabledSnackbarMsg', {}) ?? 'Дебаг включен!';
  @override
  String get disabledSnackbarMsg => TranslationOverrides.string(_root.$meta, 'settings.debug.disabledSnackbarMsg', {}) ?? 'Дебаг выключен!';
  @override
  String get alreadyEnabledSnackbarMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.alreadyEnabledSnackbarMsg', {}) ?? 'Дебаг уже включен!';
  @override
  String get openAlice => TranslationOverrides.string(_root.$meta, 'settings.debug.openAlice', {}) ?? 'Открыть инфо о сетевых запросах';
  @override
  String get openLogger => TranslationOverrides.string(_root.$meta, 'settings.debug.openLogger', {}) ?? 'Открыть логгер';
}

// Path: settings.logging
class _TranslationsSettingsLoggingRu extends TranslationsSettingsLoggingEn {
  _TranslationsSettingsLoggingRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.logging.title', {}) ?? 'Логгирование';
  @override
  String get enabledMsg => TranslationOverrides.string(_root.$meta, 'settings.logging.enabledMsg', {}) ?? 'Логгирование включено';
  @override
  String get enabledLogTypes => TranslationOverrides.string(_root.$meta, 'settings.logging.enabledLogTypes', {}) ?? 'Включенные типы логов';
  @override
  String get disableTip =>
      TranslationOverrides.string(_root.$meta, 'settings.logging.disableTip', {}) ?? 'Выключить логгирование можно в дебаг настройках';
}

// Path: settings.webview
class _TranslationsSettingsWebviewRu extends TranslationsSettingsWebviewEn {
  _TranslationsSettingsWebviewRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get openWebview => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? 'Открыть webview';
  @override
  String get openWebviewTip =>
      TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? 'чтобы залогиниться или получить куки';
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsRu {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'locale' => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'ru',
      'localeName' => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'Русский',
      'appName' => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher',
      'error' => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Ошибка',
      'errorExclamation' => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'Ошибка!',
      'warning' => TranslationOverrides.string(_root.$meta, 'warning', {}) ?? 'Внимание',
      'warningExclamation' => TranslationOverrides.string(_root.$meta, 'warningExclamation', {}) ?? 'Внимание!',
      'info' => TranslationOverrides.string(_root.$meta, 'info', {}) ?? 'Инфо',
      'success' => TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Успешно',
      'successExclamation' => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? 'Успешно!',
      'cancel' => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Отмена',
      'later' => TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Позже',
      'close' => TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Закрыть',
      'ok' => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'OK',
      'yes' => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Да',
      'no' => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'Нет',
      'pleaseWait' => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Подожди...',
      'show' => TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Показать',
      'hide' => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Скрыть',
      'enable' => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'Включить',
      'disable' => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Выключить',
      'add' => TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Добавить',
      'edit' => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? 'Редактировать',
      'remove' => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? 'Убрать',
      'save' => TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Сохранить',
      'delete' => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? 'Удалить',
      'copy' => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Копировать',
      'copied' => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Скопировано!',
      'paste' => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Вставить',
      'copyErrorText' => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Скопировать ошибку',
      'booru' => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Сайт',
      'goToSettings' => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'В настройки',
      'areYouSure' => TranslationOverrides.string(_root.$meta, 'areYouSure', {}) ?? 'Ты уверен?',
      'thisMayTakeSomeTime' => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'Это может занять некоторое время...',
      'doYouWantToExitApp' => TranslationOverrides.string(_root.$meta, 'doYouWantToExitApp', {}) ?? 'Ты хочешь выйти из приложения?',
      'closeTheApp' => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Закрыть приложение',
      'invalidUrl' => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'Неправильная ссылка!',
      'clipboardIsEmpty' => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'Буфер обмена пуст!',
      'apiKey' => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'API ключ',
      'userId' => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'ID юзера',
      'login' => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Логин',
      'password' => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Пароль',
      'pause' => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Пауза',
      'resume' => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Продолжить',
      'discord' => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord',
      'visitOurDiscord' => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Заходи на наш Discord сервер',
      'item' => TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Элемент',
      'selectAll' => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Выбрать все',
      'validationErrors.required' => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Введи значение',
      'validationErrors.invalid' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Введи валидное значение',
      'validationErrors.tooSmall' =>
        ({required Object min}) =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Введи значение больше ${min}',
      'validationErrors.tooBig' =>
        ({required Object max}) =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Введи значение меньше ${max}',
      'init.initError' => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Ошибка инициализации!',
      'init.postInitError' => TranslationOverrides.string(_root.$meta, 'init.postInitError', {}) ?? 'Ошибка постинициализации!',
      'init.settingUpProxy' => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Настройка прокси...',
      'init.loadingDatabase' => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Загрузка базы данных...',
      'init.loadingBoorus' => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Загрузка конфигов сайтов...',
      'init.loadingTags' => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Загрузка тегов...',
      'init.restoringTabs' => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Восстановление вкладок...',
      'snatcher.title' => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Загрузчик',
      'snatcher.snatchingHistory' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'История загрузок',
      'multibooru.title' => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? 'Мультисайт',
      'multibooru.multibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Режим мультисайта',
      'multibooru.multibooruRequiresAtLeastTwoBoorus' =>
        TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ??
            'Режим мультисайта требует не менее двух настроенных конфигов сайтов',
      'multibooru.selectSecondaryBoorus' =>
        TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Выбери второстепенные конфиги:',
      'settings.title' => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Настройки',
      'settings.language.title' => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? 'Язык',
      'settings.booru.title' => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Сайты и Поиск',
      'settings.booru.defaultTags' => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? 'Теги по умолчанию',
      'settings.booru.itemsPerPage' => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'Элементов на странице',
      'settings.booru.itemsPerPageTip' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'Некоторые сайты могут игнорировать этот параметр',
      'settings.booru.addBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Добавить конфиг сайта',
      'settings.booru.shareBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? 'Поделиться конфигом сайта',
      'settings.booru.shareBooruDialogMsgMobile' =>
        ({required Object booruName}) =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
            'Конфиг сайта ${booruName} будет превращен в ссылку, которой затем можно поделиться в других приложениях\n\nВключить ли данные логина/ключа api?',
      'settings.booru.shareBooruDialogMsgDesktop' =>
        ({required Object booruName}) =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
            'Конфиг сайта ${booruName} будет превращен в ссылку, которая будет скопирована в буфер обмена\n\nВключить ли данные логина/ключа api?',
      'settings.booru.booruSharing' => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? 'Поделиться конфигом сайта',
      'settings.booru.booruSharingMsgAndroid' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ??
            'Как автоматически открывать ссылки с конфигами сайта в приложении на Android 12 и выше:\n1) Нажми на кнопку снизу чтобы открыть системные настройки ссылок по умолчанию\n2) Нажми на "Добавить ссылку" и выберите все доступные опции',
      'settings.booru.addedBoorus' => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? 'Добавленные сайты',
      'settings.booru.editBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? 'Редактировать конфиг',
      'settings.booru.importBooru' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? 'Импортировать конфиг из буфера обмена',
      'settings.booru.onlyLSURLsSupported' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ?? 'Поддерживаются только ссылки формата loli.snatcher',
      'settings.booru.deleteBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? 'Удалить конфиг сайта',
      'settings.booru.deleteBooruError' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ?? 'Что-то пошло не так при удалении конфига!',
      'settings.booru.booruDeleted' => TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? 'Конфиг удален!',
      'settings.booru.booruDropdownInfo' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ??
            'Сайт выбранный здесь будет назначен сайтом по умолчанию после сохранения.\n\nСайт по умолчанию будет появляться в топе выпадающих списков',
      'settings.booru.changeDefaultBooru' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? 'Сменить сайт по умолчанию?',
      'settings.booru.changeTo' => TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? 'Сменить на: ',
      'settings.booru.keepCurrentBooru' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? 'Нажми [Нет] чтобы оставить текущий: ',
      'settings.booru.changeToNewBooru' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? 'Нажми [Да] чтобы сменить на: ',
      'settings.booru.booruConfigLinkCopied' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ?? 'Конфиг в виде ссылки скопирован!',
      'settings.booru.noBooruSelected' => TranslationOverrides.string(_root.$meta, 'settings.booru.noBooruSelected', {}) ?? 'Сайт не выбран!',
      'settings.booru.cantDeleteThisBooru' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? 'Нельзя удалить этот сайт!',
      'settings.booru.removeRelatedTabsFirst' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.removeRelatedTabsFirst', {}) ?? 'Сначала удалите связанные вкладки',
      'settings.booruEditor.title' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? 'Редактор конфига сайта',
      'settings.booruEditor.testBooru' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooru', {}) ?? 'Проверить сайт',
      'settings.booruEditor.testBooruSuccessMsg' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruSuccessMsg', {}) ??
            'Нажми кнопку Сохранить чтобы сохранить этот конфиг',
      'settings.booruEditor.testBooruFailedTitle' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'Проверка сайта не удалась',
      'settings.booruEditor.testBooruFailedMsg' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ??
            'Данные конфига неверны, сайт не дает доступ к API, запрос не вернул данные или есть проблемы с сетью.',
      'settings.booruEditor.saveBooru' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Сохранить конфиг',
      'settings.booruEditor.runTestFirst' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runTestFirst', {}) ?? 'Сначала запусти проверку',
      'settings.booruEditor.booruConfigExistsError' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? 'Такой конфиг уже существует',
      'settings.booruEditor.booruSameNameExistsError' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ?? 'Конфиг с таким именем уже существует',
      'settings.booruEditor.booruSameUrlExistsError' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ?? 'Конфиг с таким URL уже существует',
      'settings.booruEditor.thisBooruConfigWontBeAdded' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ?? 'Этот конфиг не будет добавлен',
      'settings.booruEditor.booruConfigSaved' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? 'Конфиг сохранен!',
      'settings.booruEditor.existingTabsNeedReload' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ??
            'Существующие вкладки с этим сайтом должны быть перезагружены, чтобы применить изменения!',
      'settings.booruEditor.failedVerifyApiHydrus' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ?? 'Не удалось проверить доступ к API для Hydrus',
      'settings.booruEditor.accessKeyRequestedTitle' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? 'Запрос ключа доступа',
      'settings.booruEditor.accessKeyRequestedMsg' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ??
            'Нажми [Ок] в Hydrus, затем примени. Можешь нажать [Проверить сайт] после этого',
      'settings.booruEditor.accessKeyFailedTitle' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? 'Не удалось получить ключ доступа',
      'settings.booruEditor.accessKeyFailedMsg' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ?? 'Открыл ли ты окно запроса в Hydrus?',
      'settings.booruEditor.hydrusInstructions' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ??
            'Для получения ключа Hydrus нужно открыть окно запроса в клиенте Hydrus. Services > Review services > Client api > Add > From API request',
      'settings.booruEditor.getHydrusApiKey' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? 'Получить ключ API Hydrus',
      'settings.booruEditor.booruName' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? 'Имя конфига',
      'settings.booruEditor.booruNameRequired' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? 'Имя конфига обязательно!',
      'settings.booruEditor.booruUrl' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? 'URL сайта',
      'settings.booruEditor.booruUrlRequired' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? 'URL обязательно!',
      'settings.booruEditor.booruType' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruType', {}) ?? 'Тип конфига',
      'settings.booruEditor.booruTypeIs' =>
        ({required Object booruType}) =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruTypeIs', {'booruType': booruType}) ?? 'Сайт типа: ${booruType}',
      'settings.booruEditor.booruFavicon' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? 'URL иконки',
      'settings.booruEditor.booruFaviconPlaceholder' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ??
            '(Автоматически заполняется, если оставить пустым)',
      'settings.booruEditor.booruApiCredsInfo' =>
        ({required Object userIdTitle, required Object apiKeyTitle}) =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruApiCredsInfo', {
              'userIdTitle': userIdTitle,
              'apiKeyTitle': apiKeyTitle,
            }) ??
            '${userIdTitle} и ${apiKeyTitle} могут быть обязательны для некоторых сайтов, но в большинстве случаев не нужны.',
      'settings.booruEditor.booruDefTags' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? 'Теги по умолчанию',
      'settings.interface.title' => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? 'Интерфейс',
      'settings.theme.title' => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? 'Темы',
      'settings.viewer.title' => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? 'Просмотрщик',
      'settings.video.title' => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? 'Видео',
      'settings.downloads.title' => TranslationOverrides.string(_root.$meta, 'settings.downloads.title', {}) ?? 'Скачивание',
      'settings.downloads.fromNextItemInQueue' =>
        TranslationOverrides.string(_root.$meta, 'settings.downloads.fromNextItemInQueue', {}) ?? 'Со следующего элемента в очереди',
      'settings.downloads.pleaseProvideStoragePermission' =>
        TranslationOverrides.string(_root.$meta, 'settings.downloads.pleaseProvideStoragePermission', {}) ??
            'Пожалуйста, предоставь разрешение на доступ к хранилищу, чтобы сохранять файлы',
      'settings.downloads.noItemsSelected' =>
        TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsSelected', {}) ?? 'Нет выбранных элементов',
      'settings.downloads.noItemsQueued' =>
        TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsQueued', {}) ?? 'Нет элементов в очереди',
      'settings.downloads.batch' => TranslationOverrides.string(_root.$meta, 'settings.downloads.batch', {}) ?? 'Пачка',
      'settings.downloads.snatchSelected' => TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? 'Скачать выбранные',
      'settings.downloads.removeSnatchedStatusFromSelected' =>
        TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ??
            'Удалить статус скачивания у выбранных',
      'settings.downloads.favouriteSelected' =>
        TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? 'Добавить выбранные в избранное',
      'settings.downloads.unfavouriteSelected' =>
        TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? 'Удалить выбранные из избранного',
      'settings.downloads.clearSelected' => TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? 'Очистить выбранные',
      'settings.downloads.updatingData' => TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? 'Обновление данных...',
      'settings.cache.title' => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? 'Кэш',
      'settings.downloadsAndCache' => TranslationOverrides.string(_root.$meta, 'settings.downloadsAndCache', {}) ?? 'Загрузки и Кэширование',
      'settings.tagFilters.title' => TranslationOverrides.string(_root.$meta, 'settings.tagFilters.title', {}) ?? 'Фильтры тегов',
      'settings.database.title' => TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? 'База данных',
      'settings.database.indexingDatabase' =>
        TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? 'Индексирование базы данных',
      'settings.database.droppingIndexes' => TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? 'Удаление индексов',
      'settings.backupAndRestore.title' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.title', {}) ?? 'Резервное копирование и восстановление',
      'settings.backupAndRestore.duplicateFileDetectedTitle' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedTitle', {}) ?? 'Дублирующийся файл!',
      'settings.backupAndRestore.duplicateFileDetectedMsg' =>
        ({required Object fileName}) =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
            'Файл ${fileName} уже существует. Ты хочешь его перезаписать? Усли выбрать нет, то бэкап будет отменен.',
      'settings.backupAndRestore.androidOnlyFeatureMsg' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ??
            'Эта функция доступна только на Android, на десктопных билдах можно просто копировать файлы из папки данных приложения',
      'settings.backupAndRestore.selectBackupDir' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? 'Выбери папку для бэкапов',
      'settings.backupAndRestore.failedToGetBackupPath' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ??
            'Не удалось получить путь к папке бэкапов!',
      'settings.backupAndRestore.backupPathMsg' =>
        ({required Object backupPath}) =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ??
            'Папка бэкапов: ${backupPath}',
      'settings.backupAndRestore.noBackupDirSelected' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ?? 'Нет выбранной папки бэкапов',
      'settings.backupAndRestore.restoreInfoMsg' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ??
            'Восстановление будет работать только если файлы расположены в корне папки.',
      'settings.backupAndRestore.backupSettings' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? 'Бэкап настроек',
      'settings.backupAndRestore.restoreSettings' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? 'Восстановление настроек',
      'settings.backupAndRestore.settingsBackedUp' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ?? 'Настроики сохранены в settings.json',
      'settings.backupAndRestore.settingsRestored' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? 'Настроики восстановлены из бэкапа!',
      'settings.backupAndRestore.backupSettingsError' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ?? 'Не удалось сохранить настроики!',
      'settings.backupAndRestore.restoreSettingsError' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ?? 'Не удалось восстановить настроики!',
      'settings.backupAndRestore.backupBoorus' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ?? 'Бэкап конфигов сайтов',
      'settings.backupAndRestore.restoreBoorus' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? 'Восстановление конфигов сайтов',
      'settings.backupAndRestore.boorusBackedUp' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ?? 'Конфиги сохранены в boorus.json',
      'settings.backupAndRestore.boorusRestored' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ?? 'Конфиги восстановлены из бэкапа!',
      'settings.backupAndRestore.backupBoorusError' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ?? 'Не удалось сохранить конфиги сайтов!',
      'settings.backupAndRestore.restoreBoorusError' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ?? 'Не удалось восстановить конфиги сайтов!',
      'settings.backupAndRestore.backupDatabase' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? 'Бэкап базы данных',
      'settings.backupAndRestore.restoreDatabase' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? 'Восстановление базы данных',
      'settings.backupAndRestore.restoreDatabaseInfo' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ??
            'Может занять время в зависимости от объема базы данных, приложение перезапустится после успешного восстановления',
      'settings.backupAndRestore.databaseBackedUp' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ?? 'База данных сохранена в database.json',
      'settings.backupAndRestore.databaseRestored' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ??
            'База данных восстановлена из бэкапа! Приложение будет перезапущено через несколько секунд!',
      'settings.backupAndRestore.backupDatabaseError' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ?? 'Не удалось сохранить базу данных!',
      'settings.backupAndRestore.restoreDatabaseError' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ?? 'Не удалось восстановить базу данных!',
      'settings.backupAndRestore.databaseFileNotFound' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ??
            'Файл базы данных не найден или не может быть прочитан!',
      'settings.backupAndRestore.backupTags' => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? 'Бэкап тегов',
      'settings.backupAndRestore.restoreTags' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? 'Восстановление тегов',
      'settings.backupAndRestore.restoreTagsInfo' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ??
            'Может занять время, если у тебя много тегов. Если ты сделал восстановление базы данных, то эта операция не нужна, потому что теги уже включены в базу данных',
      'settings.backupAndRestore.tagsBackedUp' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? 'Теги сохранены в tags.json',
      'settings.backupAndRestore.tagsRestored' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? 'Теги восстановлены из бэкапа!',
      'settings.backupAndRestore.backupTagsError' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? 'Не удалось сохранить теги!',
      'settings.backupAndRestore.restoreTagsError' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? 'Не удалось восстановить теги!',
      'settings.backupAndRestore.tagsFileNotFound' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsFileNotFound', {}) ??
            'Файл тегов не найден или не может быть прочитан!',
      'settings.backupAndRestore.operationTakesTooLongMsg' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.operationTakesTooLongMsg', {}) ??
            'Нажми Скрыть, если операция занимает слишком много времени, операция будет продолжена в фоновом режиме',
      'settings.backupAndRestore.backupFileNotFound' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupFileNotFound', {}) ??
            'Файл бэкапа не найден или не может быть прочитан!',
      'settings.backupAndRestore.backupDirNoAccess' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDirNoAccess', {}) ?? 'Нет доступа к папке бэкапов!',
      'settings.backupAndRestore.backupCancelled' =>
        TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? 'Бэкап отменен!',
      'settings.network.title' => TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? 'Сеть',
      'settings.privacy.title' => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? 'Приватность',
      'settings.sync.title' => TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? 'LoliSync',
      'settings.sync.dbError' =>
        TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ?? 'База данных должна быть включена чтобы использовать LoliSync',
      'settings.about.title' => TranslationOverrides.string(_root.$meta, 'settings.about.title', {}) ?? 'О приложении',
      'settings.about.appDescription' =>
        TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ??
            'LoliSnatcher - это открытое программное обеспечение, распространяемое по лицензии GPLv3. Исходный код доступен на GitHub. Пожалуйста, сообщайте о любых проблемах или просьбах в разделе issues репозитория.',
      'settings.about.appOnGitHub' => TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? 'LoliSnatcher на Github',
      'settings.about.contact' => TranslationOverrides.string(_root.$meta, 'settings.about.contact', {}) ?? 'Связаться',
      'settings.about.emailCopied' => TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? 'Email скопирован!',
      'settings.about.logoArtistThanks' =>
        TranslationOverrides.string(_root.$meta, 'settings.about.logoArtistThanks', {}) ??
            'Большая благодарность Showers-U за разрешение на использование их работы для лого приложения. Пожалуйста, зацените их работы на Pixiv',
      'settings.about.developers' => TranslationOverrides.string(_root.$meta, 'settings.about.developers', {}) ?? 'Разработчики',
      'settings.about.releases' => TranslationOverrides.string(_root.$meta, 'settings.about.releases', {}) ?? 'Релизы',
      'settings.about.releasesMsg' =>
        TranslationOverrides.string(_root.$meta, 'settings.about.releasesMsg', {}) ??
            'Последняя версия и полные списки изменений можно найти на странице релизов в GitHub:',
      'settings.about.licenses' => TranslationOverrides.string(_root.$meta, 'settings.about.licenses', {}) ?? 'Лицензии',
      'settings.checkForUpdates.title' =>
        TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.title', {}) ?? 'Проверить наличие обновлений',
      'settings.checkForUpdates.updateAvailable' =>
        TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateAvailable', {}) ?? 'Доступно обновление!',
      'settings.checkForUpdates.updateChangelog' =>
        TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? 'Список изменений обновления',
      'settings.checkForUpdates.updateCheckError' =>
        TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? 'Ошибка при проверке обновлений!',
      'settings.checkForUpdates.youHaveLatestVersion' =>
        TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? 'У тебя последняя версия!',
      'settings.checkForUpdates.viewLatestChangelog' =>
        TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ?? 'Посмотреть последний список изменений',
      'settings.checkForUpdates.currentVersion' =>
        TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? 'Текущая версия',
      'settings.checkForUpdates.changelog' =>
        TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? 'Список изменений',
      'settings.checkForUpdates.visitPlayStore' =>
        TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? 'Перейти в Play Store',
      'settings.checkForUpdates.visitReleases' =>
        TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? 'Перейти к Релизам',
      'settings.help.title' => TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? 'Помощь',
      'settings.debug.title' => TranslationOverrides.string(_root.$meta, 'settings.debug.title', {}) ?? 'Дебаг',
      'settings.debug.enabledSnackbarMsg' => TranslationOverrides.string(_root.$meta, 'settings.debug.enabledSnackbarMsg', {}) ?? 'Дебаг включен!',
      'settings.debug.disabledSnackbarMsg' => TranslationOverrides.string(_root.$meta, 'settings.debug.disabledSnackbarMsg', {}) ?? 'Дебаг выключен!',
      'settings.debug.alreadyEnabledSnackbarMsg' =>
        TranslationOverrides.string(_root.$meta, 'settings.debug.alreadyEnabledSnackbarMsg', {}) ?? 'Дебаг уже включен!',
      'settings.debug.openAlice' => TranslationOverrides.string(_root.$meta, 'settings.debug.openAlice', {}) ?? 'Открыть инфо о сетевых запросах',
      'settings.debug.openLogger' => TranslationOverrides.string(_root.$meta, 'settings.debug.openLogger', {}) ?? 'Открыть логгер',
      'settings.logging.title' => TranslationOverrides.string(_root.$meta, 'settings.logging.title', {}) ?? 'Логгирование',
      'settings.logging.enabledMsg' => TranslationOverrides.string(_root.$meta, 'settings.logging.enabledMsg', {}) ?? 'Логгирование включено',
      'settings.logging.enabledLogTypes' =>
        TranslationOverrides.string(_root.$meta, 'settings.logging.enabledLogTypes', {}) ?? 'Включенные типы логов',
      'settings.logging.disableTip' =>
        TranslationOverrides.string(_root.$meta, 'settings.logging.disableTip', {}) ?? 'Выключить логгирование можно в дебаг настройках',
      'settings.webview.openWebview' => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? 'Открыть webview',
      'settings.webview.openWebviewTip' =>
        TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? 'чтобы залогиниться или получить куки',
      'settings.version' => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? 'Версия',
      _ => null,
    };
  }
}
