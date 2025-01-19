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
class TranslationsRu extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  /// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
  TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
      : $meta = TranslationMetadata(
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
  _TranslationsValidationErrorsRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsInitRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsSnatcherRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Загрузчик';
  @override
  String get snatchingHistory => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'История загрузок';
}

// Path: multibooru
class _TranslationsMultibooruRu extends TranslationsMultibooruEn {
  _TranslationsMultibooruRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsSettingsRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsSettingsLanguageRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? 'Язык';
  @override
  String get systemLanguageOption => TranslationOverrides.string(_root.$meta, 'settings.language.systemLanguageOption', {}) ?? 'Системный';
}

// Path: settings.booru
class _TranslationsSettingsBooruRu extends TranslationsSettingsBooruEn {
  _TranslationsSettingsBooruRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsSettingsBooruEditorRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

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
  String testBooruFailedMsg({required Object error}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {'error': error}) ??
      'Данные конфига неверны, сайт не дает доступ к API, запрос не вернул данные или есть проблемы с сетью. Подробности (нажми на кнопку для копирования): ${error}';
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
  String get canBeBlankPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.canBeBlankPlaceholder', {}) ?? '(Может быть пустым)';
  @override
  String get booruDefTags => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? 'Теги по умолчанию';
}

// Path: settings.interface
class _TranslationsSettingsInterfaceRu extends TranslationsSettingsInterfaceEn {
  _TranslationsSettingsInterfaceRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? 'Интерфейс';
}

// Path: settings.theme
class _TranslationsSettingsThemeRu extends TranslationsSettingsThemeEn {
  _TranslationsSettingsThemeRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? 'Темы';
}

// Path: settings.viewer
class _TranslationsSettingsViewerRu extends TranslationsSettingsViewerEn {
  _TranslationsSettingsViewerRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? 'Просмотрщик';
}

// Path: settings.video
class _TranslationsSettingsVideoRu extends TranslationsSettingsVideoEn {
  _TranslationsSettingsVideoRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? 'Видео';
}

// Path: settings.downloads
class _TranslationsSettingsDownloadsRu extends TranslationsSettingsDownloadsEn {
  _TranslationsSettingsDownloadsRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsSettingsCacheRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? 'Кэш';
}

// Path: settings.tagFilters
class _TranslationsSettingsTagFiltersRu extends TranslationsSettingsTagFiltersEn {
  _TranslationsSettingsTagFiltersRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.tagFilters.title', {}) ?? 'Фильтры тегов';
}

// Path: settings.database
class _TranslationsSettingsDatabaseRu extends TranslationsSettingsDatabaseEn {
  _TranslationsSettingsDatabaseRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsSettingsBackupAndRestoreRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsSettingsNetworkRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? 'Сеть';
}

// Path: settings.privacy
class _TranslationsSettingsPrivacyRu extends TranslationsSettingsPrivacyEn {
  _TranslationsSettingsPrivacyRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? 'Приватность';
}

// Path: settings.sync
class _TranslationsSettingsSyncRu extends TranslationsSettingsSyncEn {
  _TranslationsSettingsSyncRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsSettingsAboutRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsSettingsCheckForUpdatesRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsSettingsHelpRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? 'Помощь';
}

// Path: settings.debug
class _TranslationsSettingsDebugRu extends TranslationsSettingsDebugEn {
  _TranslationsSettingsDebugRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsSettingsLoggingRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

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
  _TranslationsSettingsWebviewRu._(TranslationsRu root)
      : this._root = root,
        super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get openWebview => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? 'Открыть webview';
  @override
  String get openWebviewTip =>
      TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? 'чтобы залогиниться или получить куки';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsRu {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'locale':
        return TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'ru';
      case 'localeName':
        return TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'Русский';
      case 'appName':
        return TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher';
      case 'error':
        return TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Ошибка';
      case 'errorExclamation':
        return TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'Ошибка!';
      case 'warning':
        return TranslationOverrides.string(_root.$meta, 'warning', {}) ?? 'Внимание';
      case 'warningExclamation':
        return TranslationOverrides.string(_root.$meta, 'warningExclamation', {}) ?? 'Внимание!';
      case 'info':
        return TranslationOverrides.string(_root.$meta, 'info', {}) ?? 'Инфо';
      case 'success':
        return TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Успешно';
      case 'successExclamation':
        return TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? 'Успешно!';
      case 'cancel':
        return TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Отмена';
      case 'later':
        return TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Позже';
      case 'close':
        return TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Закрыть';
      case 'ok':
        return TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'OK';
      case 'yes':
        return TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Да';
      case 'no':
        return TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'Нет';
      case 'pleaseWait':
        return TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Подожди...';
      case 'show':
        return TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Показать';
      case 'hide':
        return TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Скрыть';
      case 'enable':
        return TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'Включить';
      case 'disable':
        return TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Выключить';
      case 'add':
        return TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Добавить';
      case 'edit':
        return TranslationOverrides.string(_root.$meta, 'edit', {}) ?? 'Редактировать';
      case 'remove':
        return TranslationOverrides.string(_root.$meta, 'remove', {}) ?? 'Убрать';
      case 'save':
        return TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Сохранить';
      case 'delete':
        return TranslationOverrides.string(_root.$meta, 'delete', {}) ?? 'Удалить';
      case 'copy':
        return TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Копировать';
      case 'copied':
        return TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Скопировано!';
      case 'paste':
        return TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Вставить';
      case 'copyErrorText':
        return TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Скопировать ошибку';
      case 'booru':
        return TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Сайт';
      case 'goToSettings':
        return TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'В настройки';
      case 'areYouSure':
        return TranslationOverrides.string(_root.$meta, 'areYouSure', {}) ?? 'Ты уверен?';
      case 'thisMayTakeSomeTime':
        return TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'Это может занять некоторое время...';
      case 'doYouWantToExitApp':
        return TranslationOverrides.string(_root.$meta, 'doYouWantToExitApp', {}) ?? 'Ты хочешь выйти из приложения?';
      case 'closeTheApp':
        return TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Закрыть приложение';
      case 'invalidUrl':
        return TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'Неправильная ссылка!';
      case 'clipboardIsEmpty':
        return TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'Буфер обмена пуст!';
      case 'apiKey':
        return TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'API ключ';
      case 'userId':
        return TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'ID юзера';
      case 'login':
        return TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Логин';
      case 'password':
        return TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Пароль';
      case 'pause':
        return TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Пауза';
      case 'resume':
        return TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Продолжить';
      case 'discord':
        return TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord';
      case 'visitOurDiscord':
        return TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Заходи на наш Discord сервер';
      case 'item':
        return TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Элемент';
      case 'selectAll':
        return TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Выбрать все';
      case 'validationErrors.required':
        return TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Введи значение';
      case 'validationErrors.invalid':
        return TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Введи валидное значение';
      case 'validationErrors.tooSmall':
        return ({required Object min}) =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Введи значение больше ${min}';
      case 'validationErrors.tooBig':
        return ({required Object max}) =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Введи значение меньше ${max}';
      case 'init.initError':
        return TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Ошибка инициализации!';
      case 'init.postInitError':
        return TranslationOverrides.string(_root.$meta, 'init.postInitError', {}) ?? 'Ошибка постинициализации!';
      case 'init.settingUpProxy':
        return TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Настройка прокси...';
      case 'init.loadingDatabase':
        return TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Загрузка базы данных...';
      case 'init.loadingBoorus':
        return TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Загрузка конфигов сайтов...';
      case 'init.loadingTags':
        return TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Загрузка тегов...';
      case 'init.restoringTabs':
        return TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Восстановление вкладок...';
      case 'snatcher.title':
        return TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Загрузчик';
      case 'snatcher.snatchingHistory':
        return TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'История загрузок';
      case 'multibooru.title':
        return TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? 'Мультисайт';
      case 'multibooru.multibooruMode':
        return TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Режим мультисайта';
      case 'multibooru.multibooruRequiresAtLeastTwoBoorus':
        return TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ??
            'Режим мультисайта требует не менее двух настроенных конфигов сайтов';
      case 'multibooru.selectSecondaryBoorus':
        return TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Выбери второстепенные конфиги:';
      case 'settings.title':
        return TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Настройки';
      case 'settings.language.title':
        return TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? 'Язык';
      case 'settings.language.systemLanguageOption':
        return TranslationOverrides.string(_root.$meta, 'settings.language.systemLanguageOption', {}) ?? 'Системный';
      case 'settings.booru.title':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Сайты и Поиск';
      case 'settings.booru.defaultTags':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? 'Теги по умолчанию';
      case 'settings.booru.itemsPerPage':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'Элементов на странице';
      case 'settings.booru.itemsPerPageTip':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'Некоторые сайты могут игнорировать этот параметр';
      case 'settings.booru.addBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Добавить конфиг сайта';
      case 'settings.booru.shareBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? 'Поделиться конфигом сайта';
      case 'settings.booru.shareBooruDialogMsgMobile':
        return ({required Object booruName}) =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
            'Конфиг сайта ${booruName} будет превращен в ссылку, которой затем можно поделиться в других приложениях\n\nВключить ли данные логина/ключа api?';
      case 'settings.booru.shareBooruDialogMsgDesktop':
        return ({required Object booruName}) =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
            'Конфиг сайта ${booruName} будет превращен в ссылку, которая будет скопирована в буфер обмена\n\nВключить ли данные логина/ключа api?';
      case 'settings.booru.booruSharing':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? 'Поделиться конфигом сайта';
      case 'settings.booru.booruSharingMsgAndroid':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ??
            'Как автоматически открывать ссылки с конфигами сайта в приложении на Android 12 и выше:\n1) Нажми на кнопку снизу чтобы открыть системные настройки ссылок по умолчанию\n2) Нажми на "Добавить ссылку" и выберите все доступные опции';
      case 'settings.booru.addedBoorus':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? 'Добавленные сайты';
      case 'settings.booru.editBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? 'Редактировать конфиг';
      case 'settings.booru.importBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? 'Импортировать конфиг из буфера обмена';
      case 'settings.booru.onlyLSURLsSupported':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ??
            'Поддерживаются только ссылки формата loli.snatcher';
      case 'settings.booru.deleteBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? 'Удалить конфиг сайта';
      case 'settings.booru.deleteBooruError':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ?? 'Что-то пошло не так при удалении конфига!';
      case 'settings.booru.booruDeleted':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? 'Конфиг удален!';
      case 'settings.booru.booruDropdownInfo':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ??
            'Сайт выбранный здесь будет назначен сайтом по умолчанию после сохранения.\n\nСайт по умолчанию будет появляться в топе выпадающих списков';
      case 'settings.booru.changeDefaultBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? 'Сменить сайт по умолчанию?';
      case 'settings.booru.changeTo':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? 'Сменить на: ';
      case 'settings.booru.keepCurrentBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? 'Нажми [Нет] чтобы оставить текущий: ';
      case 'settings.booru.changeToNewBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? 'Нажми [Да] чтобы сменить на: ';
      case 'settings.booru.booruConfigLinkCopied':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ?? 'Конфиг в виде ссылки скопирован!';
      case 'settings.booru.noBooruSelected':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.noBooruSelected', {}) ?? 'Сайт не выбран!';
      case 'settings.booru.cantDeleteThisBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? 'Нельзя удалить этот сайт!';
      case 'settings.booru.removeRelatedTabsFirst':
        return TranslationOverrides.string(_root.$meta, 'settings.booru.removeRelatedTabsFirst', {}) ?? 'Сначала удалите связанные вкладки';
      case 'settings.booruEditor.title':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? 'Редактор конфига сайта';
      case 'settings.booruEditor.testBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooru', {}) ?? 'Проверить сайт';
      case 'settings.booruEditor.testBooruSuccessMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruSuccessMsg', {}) ??
            'Нажми кнопку Сохранить чтобы сохранить этот конфиг';
      case 'settings.booruEditor.testBooruFailedTitle':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'Проверка сайта не удалась';
      case 'settings.booruEditor.testBooruFailedMsg':
        return ({required Object error}) =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {'error': error}) ??
            'Данные конфига неверны, сайт не дает доступ к API, запрос не вернул данные или есть проблемы с сетью. Подробности (нажми на кнопку для копирования): ${error}';
      case 'settings.booruEditor.saveBooru':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Сохранить конфиг';
      case 'settings.booruEditor.runTestFirst':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runTestFirst', {}) ?? 'Сначала запусти проверку';
      case 'settings.booruEditor.booruConfigExistsError':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? 'Такой конфиг уже существует';
      case 'settings.booruEditor.booruSameNameExistsError':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ??
            'Конфиг с таким именем уже существует';
      case 'settings.booruEditor.booruSameUrlExistsError':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ?? 'Конфиг с таким URL уже существует';
      case 'settings.booruEditor.thisBooruConfigWontBeAdded':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ?? 'Этот конфиг не будет добавлен';
      case 'settings.booruEditor.booruConfigSaved':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? 'Конфиг сохранен!';
      case 'settings.booruEditor.existingTabsNeedReload':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ??
            'Существующие вкладки с этим сайтом должны быть перезагружены, чтобы применить изменения!';
      case 'settings.booruEditor.failedVerifyApiHydrus':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ??
            'Не удалось проверить доступ к API для Hydrus';
      case 'settings.booruEditor.accessKeyRequestedTitle':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? 'Запрос ключа доступа';
      case 'settings.booruEditor.accessKeyRequestedMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ??
            'Нажми [Ок] в Hydrus, затем примени. Можешь нажать [Проверить сайт] после этого';
      case 'settings.booruEditor.accessKeyFailedTitle':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? 'Не удалось получить ключ доступа';
      case 'settings.booruEditor.accessKeyFailedMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ?? 'Открыл ли ты окно запроса в Hydrus?';
      case 'settings.booruEditor.hydrusInstructions':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ??
            'Для получения ключа Hydrus нужно открыть окно запроса в клиенте Hydrus. Services > Review services > Client api > Add > From API request';
      case 'settings.booruEditor.getHydrusApiKey':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? 'Получить ключ API Hydrus';
      case 'settings.booruEditor.booruName':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? 'Имя конфига';
      case 'settings.booruEditor.booruNameRequired':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? 'Имя конфига обязательно!';
      case 'settings.booruEditor.booruUrl':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? 'URL сайта';
      case 'settings.booruEditor.booruUrlRequired':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? 'URL обязательно!';
      case 'settings.booruEditor.booruType':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruType', {}) ?? 'Тип конфига';
      case 'settings.booruEditor.booruTypeIs':
        return ({required Object booruType}) =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruTypeIs', {'booruType': booruType}) ?? 'Сайт типа: ${booruType}';
      case 'settings.booruEditor.booruFavicon':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? 'URL иконки';
      case 'settings.booruEditor.booruFaviconPlaceholder':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ??
            '(Автоматически заполняется, если оставить пустым)';
      case 'settings.booruEditor.booruApiCredsInfo':
        return ({required Object userIdTitle, required Object apiKeyTitle}) =>
            TranslationOverrides.string(
                _root.$meta, 'settings.booruEditor.booruApiCredsInfo', {'userIdTitle': userIdTitle, 'apiKeyTitle': apiKeyTitle}) ??
            '${userIdTitle} и ${apiKeyTitle} могут быть обязательны для некоторых сайтов, но в большинстве случаев не нужны.';
      case 'settings.booruEditor.canBeBlankPlaceholder':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.canBeBlankPlaceholder', {}) ?? '(Может быть пустым)';
      case 'settings.booruEditor.booruDefTags':
        return TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? 'Теги по умолчанию';
      case 'settings.interface.title':
        return TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? 'Интерфейс';
      case 'settings.theme.title':
        return TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? 'Темы';
      case 'settings.viewer.title':
        return TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? 'Просмотрщик';
      case 'settings.video.title':
        return TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? 'Видео';
      case 'settings.downloads.title':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.title', {}) ?? 'Скачивание';
      case 'settings.downloads.fromNextItemInQueue':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.fromNextItemInQueue', {}) ?? 'Со следующего элемента в очереди';
      case 'settings.downloads.pleaseProvideStoragePermission':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.pleaseProvideStoragePermission', {}) ??
            'Пожалуйста, предоставь разрешение на доступ к хранилищу, чтобы сохранять файлы';
      case 'settings.downloads.noItemsSelected':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsSelected', {}) ?? 'Нет выбранных элементов';
      case 'settings.downloads.noItemsQueued':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsQueued', {}) ?? 'Нет элементов в очереди';
      case 'settings.downloads.batch':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.batch', {}) ?? 'Пачка';
      case 'settings.downloads.snatchSelected':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? 'Скачать выбранные';
      case 'settings.downloads.removeSnatchedStatusFromSelected':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ??
            'Удалить статус скачивания у выбранных';
      case 'settings.downloads.favouriteSelected':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? 'Добавить выбранные в избранное';
      case 'settings.downloads.unfavouriteSelected':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? 'Удалить выбранные из избранного';
      case 'settings.downloads.clearSelected':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? 'Очистить выбранные';
      case 'settings.downloads.updatingData':
        return TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? 'Обновление данных...';
      case 'settings.cache.title':
        return TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? 'Кэш';
      case 'settings.downloadsAndCache':
        return TranslationOverrides.string(_root.$meta, 'settings.downloadsAndCache', {}) ?? 'Загрузки и Кэширование';
      case 'settings.tagFilters.title':
        return TranslationOverrides.string(_root.$meta, 'settings.tagFilters.title', {}) ?? 'Фильтры тегов';
      case 'settings.database.title':
        return TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? 'База данных';
      case 'settings.database.indexingDatabase':
        return TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? 'Индексирование базы данных';
      case 'settings.database.droppingIndexes':
        return TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? 'Удаление индексов';
      case 'settings.backupAndRestore.title':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.title', {}) ?? 'Резервное копирование и восстановление';
      case 'settings.backupAndRestore.duplicateFileDetectedTitle':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedTitle', {}) ?? 'Дублирующийся файл!';
      case 'settings.backupAndRestore.duplicateFileDetectedMsg':
        return ({required Object fileName}) =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
            'Файл ${fileName} уже существует. Ты хочешь его перезаписать? Усли выбрать нет, то бэкап будет отменен.';
      case 'settings.backupAndRestore.androidOnlyFeatureMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ??
            'Эта функция доступна только на Android, на десктопных билдах можно просто копировать файлы из папки данных приложения';
      case 'settings.backupAndRestore.selectBackupDir':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? 'Выбери папку для бэкапов';
      case 'settings.backupAndRestore.failedToGetBackupPath':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ??
            'Не удалось получить путь к папке бэкапов!';
      case 'settings.backupAndRestore.backupPathMsg':
        return ({required Object backupPath}) =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ??
            'Папка бэкапов: ${backupPath}';
      case 'settings.backupAndRestore.noBackupDirSelected':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ?? 'Нет выбранной папки бэкапов';
      case 'settings.backupAndRestore.restoreInfoMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ??
            'Восстановление будет работать только если файлы расположены в корне папки.';
      case 'settings.backupAndRestore.backupSettings':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? 'Бэкап настроек';
      case 'settings.backupAndRestore.restoreSettings':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? 'Восстановление настроек';
      case 'settings.backupAndRestore.settingsBackedUp':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ?? 'Настроики сохранены в settings.json';
      case 'settings.backupAndRestore.settingsRestored':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? 'Настроики восстановлены из бэкапа!';
      case 'settings.backupAndRestore.backupSettingsError':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ?? 'Не удалось сохранить настроики!';
      case 'settings.backupAndRestore.restoreSettingsError':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ?? 'Не удалось восстановить настроики!';
      case 'settings.backupAndRestore.backupBoorus':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ?? 'Бэкап конфигов сайтов';
      case 'settings.backupAndRestore.restoreBoorus':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? 'Восстановление конфигов сайтов';
      case 'settings.backupAndRestore.boorusBackedUp':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ?? 'Конфиги сохранены в boorus.json';
      case 'settings.backupAndRestore.boorusRestored':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ?? 'Конфиги восстановлены из бэкапа!';
      case 'settings.backupAndRestore.backupBoorusError':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ?? 'Не удалось сохранить конфиги сайтов!';
      case 'settings.backupAndRestore.restoreBoorusError':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ??
            'Не удалось восстановить конфиги сайтов!';
      case 'settings.backupAndRestore.backupDatabase':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? 'Бэкап базы данных';
      case 'settings.backupAndRestore.restoreDatabase':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? 'Восстановление базы данных';
      case 'settings.backupAndRestore.restoreDatabaseInfo':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ??
            'Может занять время в зависимости от объема базы данных, приложение перезапустится после успешного восстановления';
      case 'settings.backupAndRestore.databaseBackedUp':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ?? 'База данных сохранена в database.json';
      case 'settings.backupAndRestore.databaseRestored':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ??
            'База данных восстановлена из бэкапа! Приложение будет перезапущено через несколько секунд!';
      case 'settings.backupAndRestore.backupDatabaseError':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ?? 'Не удалось сохранить базу данных!';
      case 'settings.backupAndRestore.restoreDatabaseError':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ??
            'Не удалось восстановить базу данных!';
      case 'settings.backupAndRestore.databaseFileNotFound':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ??
            'Файл базы данных не найден или не может быть прочитан!';
      case 'settings.backupAndRestore.backupTags':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? 'Бэкап тегов';
      case 'settings.backupAndRestore.restoreTags':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? 'Восстановление тегов';
      case 'settings.backupAndRestore.restoreTagsInfo':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ??
            'Может занять время, если у тебя много тегов. Если ты сделал восстановление базы данных, то эта операция не нужна, потому что теги уже включены в базу данных';
      case 'settings.backupAndRestore.tagsBackedUp':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? 'Теги сохранены в tags.json';
      case 'settings.backupAndRestore.tagsRestored':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? 'Теги восстановлены из бэкапа!';
      case 'settings.backupAndRestore.backupTagsError':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? 'Не удалось сохранить теги!';
      case 'settings.backupAndRestore.restoreTagsError':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? 'Не удалось восстановить теги!';
      case 'settings.backupAndRestore.tagsFileNotFound':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsFileNotFound', {}) ??
            'Файл тегов не найден или не может быть прочитан!';
      case 'settings.backupAndRestore.operationTakesTooLongMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.operationTakesTooLongMsg', {}) ??
            'Нажми Скрыть, если операция занимает слишком много времени, операция будет продолжена в фоновом режиме';
      case 'settings.backupAndRestore.backupFileNotFound':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupFileNotFound', {}) ??
            'Файл бэкапа не найден или не может быть прочитан!';
      case 'settings.backupAndRestore.backupDirNoAccess':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDirNoAccess', {}) ?? 'Нет доступа к папке бэкапов!';
      case 'settings.backupAndRestore.backupCancelled':
        return TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? 'Бэкап отменен!';
      case 'settings.network.title':
        return TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? 'Сеть';
      case 'settings.privacy.title':
        return TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? 'Приватность';
      case 'settings.sync.title':
        return TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? 'LoliSync';
      case 'settings.sync.dbError':
        return TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ??
            'База данных должна быть включена чтобы использовать LoliSync';
      case 'settings.about.title':
        return TranslationOverrides.string(_root.$meta, 'settings.about.title', {}) ?? 'О приложении';
      case 'settings.about.appDescription':
        return TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ??
            'LoliSnatcher - это открытое программное обеспечение, распространяемое по лицензии GPLv3. Исходный код доступен на GitHub. Пожалуйста, сообщайте о любых проблемах или просьбах в разделе issues репозитория.';
      case 'settings.about.appOnGitHub':
        return TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? 'LoliSnatcher на Github';
      case 'settings.about.contact':
        return TranslationOverrides.string(_root.$meta, 'settings.about.contact', {}) ?? 'Связаться';
      case 'settings.about.emailCopied':
        return TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? 'Email скопирован!';
      case 'settings.about.logoArtistThanks':
        return TranslationOverrides.string(_root.$meta, 'settings.about.logoArtistThanks', {}) ??
            'Большая благодарность Showers-U за разрешение на использование их работы для лого приложения. Пожалуйста, зацените их работы на Pixiv';
      case 'settings.about.developers':
        return TranslationOverrides.string(_root.$meta, 'settings.about.developers', {}) ?? 'Разработчики';
      case 'settings.about.releases':
        return TranslationOverrides.string(_root.$meta, 'settings.about.releases', {}) ?? 'Релизы';
      case 'settings.about.releasesMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.about.releasesMsg', {}) ??
            'Последняя версия и полные списки изменений можно найти на странице релизов в GitHub:';
      case 'settings.about.licenses':
        return TranslationOverrides.string(_root.$meta, 'settings.about.licenses', {}) ?? 'Лицензии';
      case 'settings.checkForUpdates.title':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.title', {}) ?? 'Проверить наличие обновлений';
      case 'settings.checkForUpdates.updateAvailable':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateAvailable', {}) ?? 'Доступно обновление!';
      case 'settings.checkForUpdates.updateChangelog':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? 'Список изменений обновления';
      case 'settings.checkForUpdates.updateCheckError':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? 'Ошибка при проверке обновлений!';
      case 'settings.checkForUpdates.youHaveLatestVersion':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? 'У тебя последняя версия!';
      case 'settings.checkForUpdates.viewLatestChangelog':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ??
            'Посмотреть последний список изменений';
      case 'settings.checkForUpdates.currentVersion':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? 'Текущая версия';
      case 'settings.checkForUpdates.changelog':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? 'Список изменений';
      case 'settings.checkForUpdates.visitPlayStore':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? 'Перейти в Play Store';
      case 'settings.checkForUpdates.visitReleases':
        return TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? 'Перейти к Релизам';
      case 'settings.help.title':
        return TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? 'Помощь';
      case 'settings.debug.title':
        return TranslationOverrides.string(_root.$meta, 'settings.debug.title', {}) ?? 'Дебаг';
      case 'settings.debug.enabledSnackbarMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.debug.enabledSnackbarMsg', {}) ?? 'Дебаг включен!';
      case 'settings.debug.disabledSnackbarMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.debug.disabledSnackbarMsg', {}) ?? 'Дебаг выключен!';
      case 'settings.debug.alreadyEnabledSnackbarMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.debug.alreadyEnabledSnackbarMsg', {}) ?? 'Дебаг уже включен!';
      case 'settings.debug.openAlice':
        return TranslationOverrides.string(_root.$meta, 'settings.debug.openAlice', {}) ?? 'Открыть инфо о сетевых запросах';
      case 'settings.debug.openLogger':
        return TranslationOverrides.string(_root.$meta, 'settings.debug.openLogger', {}) ?? 'Открыть логгер';
      case 'settings.logging.title':
        return TranslationOverrides.string(_root.$meta, 'settings.logging.title', {}) ?? 'Логгирование';
      case 'settings.logging.enabledMsg':
        return TranslationOverrides.string(_root.$meta, 'settings.logging.enabledMsg', {}) ?? 'Логгирование включено';
      case 'settings.logging.enabledLogTypes':
        return TranslationOverrides.string(_root.$meta, 'settings.logging.enabledLogTypes', {}) ?? 'Включенные типы логов';
      case 'settings.logging.disableTip':
        return TranslationOverrides.string(_root.$meta, 'settings.logging.disableTip', {}) ?? 'Выключить логгирование можно в дебаг настройках';
      case 'settings.webview.openWebview':
        return TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? 'Открыть webview';
      case 'settings.webview.openWebviewTip':
        return TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? 'чтобы залогиниться или получить куки';
      case 'settings.version':
        return TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? 'Версия';
      default:
        return null;
    }
  }
}
