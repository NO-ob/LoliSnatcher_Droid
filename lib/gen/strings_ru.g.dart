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
  String get confirm => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? 'Подтвердить';
  @override
  String get retry => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? 'Повторить';
  @override
  String get clear => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? 'Сбросить';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Копировать';
  @override
  String get copied => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Скопировано!';
  @override
  String get copiedToClipboard => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? 'Скопировано в буфер обмена';
  @override
  String get nothingFound => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? 'Ничего не найдено';
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
  String get failedToOpenLink => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'Не удалось открыть ссылку';
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
  String get select => TranslationOverrides.string(_root.$meta, 'select', {}) ?? 'Выбрать';
  @override
  String get selectAll => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Выбрать все';
  @override
  String get reset => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'Сбросить';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'open', {}) ?? 'Открыть';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? 'Открыть в новой вкладке';
  @override
  String get move => TranslationOverrides.string(_root.$meta, 'move', {}) ?? 'Переместить';
  @override
  String get shuffle => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? 'Перемешать';
  @override
  String get sort => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? 'Сортировать';
  @override
  String get go => TranslationOverrides.string(_root.$meta, 'go', {}) ?? 'Перейти';
  @override
  String get search => TranslationOverrides.string(_root.$meta, 'search', {}) ?? 'Поиск';
  @override
  String get filter => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? 'Фильтр';
  @override
  String get or => TranslationOverrides.string(_root.$meta, 'or', {}) ?? 'Или (~)';
  @override
  String get page => TranslationOverrides.string(_root.$meta, 'page', {}) ?? 'Страница';
  @override
  String get pageNumber => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? 'Страница №';
  @override
  String get tags => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'Теги';
  @override
  String get type => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'Тип';
  @override
  String get name => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Имя';
  @override
  String get address => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'Адрес';
  @override
  String get username => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'Имя пользователя';
  @override
  String get favourites => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'Избранное';
  @override
  String get downloads => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'Скачанное';
  @override
  late final _TranslationsValidationErrorsRu validationErrors = _TranslationsValidationErrorsRu._(_root);
  @override
  late final _TranslationsInitRu init = _TranslationsInitRu._(_root);
  @override
  late final _TranslationsPermissionsRu permissions = _TranslationsPermissionsRu._(_root);
  @override
  late final _TranslationsAuthenticationRu authentication = _TranslationsAuthenticationRu._(_root);
  @override
  late final _TranslationsSearchHandlerRu searchHandler = _TranslationsSearchHandlerRu._(_root);
  @override
  late final _TranslationsSnatcherRu snatcher = _TranslationsSnatcherRu._(_root);
  @override
  late final _TranslationsMultibooruRu multibooru = _TranslationsMultibooruRu._(_root);
  @override
  late final _TranslationsHydrusRu hydrus = _TranslationsHydrusRu._(_root);
  @override
  late final _TranslationsTabsRu tabs = _TranslationsTabsRu._(_root);
  @override
  late final _TranslationsHistoryRu history = _TranslationsHistoryRu._(_root);
  @override
  late final _TranslationsWebviewRu webview = _TranslationsWebviewRu._(_root);
  @override
  late final _TranslationsSettingsRu settings = _TranslationsSettingsRu._(_root);
  @override
  late final _TranslationsCommentsRu comments = _TranslationsCommentsRu._(_root);
  @override
  late final _TranslationsPageChangerRu pageChanger = _TranslationsPageChangerRu._(_root);
  @override
  late final _TranslationsTagsFiltersDialogsRu tagsFiltersDialogs = _TranslationsTagsFiltersDialogsRu._(_root);
  @override
  late final _TranslationsTagsManagerRu tagsManager = _TranslationsTagsManagerRu._(_root);
  @override
  late final _TranslationsLockscreenRu lockscreen = _TranslationsLockscreenRu._(_root);
  @override
  late final _TranslationsLoliSyncRu loliSync = _TranslationsLoliSyncRu._(_root);
  @override
  late final _TranslationsImageSearchRu imageSearch = _TranslationsImageSearchRu._(_root);
  @override
  late final _TranslationsTagViewRu tagView = _TranslationsTagViewRu._(_root);
  @override
  late final _TranslationsPinnedTagsRu pinnedTags = _TranslationsPinnedTagsRu._(_root);
  @override
  late final _TranslationsSearchBarRu searchBar = _TranslationsSearchBarRu._(_root);
  @override
  late final _TranslationsMobileHomeRu mobileHome = _TranslationsMobileHomeRu._(_root);
  @override
  late final _TranslationsDesktopHomeRu desktopHome = _TranslationsDesktopHomeRu._(_root);
  @override
  late final _TranslationsGalleryViewRu galleryView = _TranslationsGalleryViewRu._(_root);
  @override
  late final _TranslationsMediaPreviewsRu mediaPreviews = _TranslationsMediaPreviewsRu._(_root);
  @override
  late final _TranslationsViewerRu viewer = _TranslationsViewerRu._(_root);
  @override
  late final _TranslationsCommonRu common = _TranslationsCommonRu._(_root);
  @override
  late final _TranslationsGalleryRu gallery = _TranslationsGalleryRu._(_root);
  @override
  late final _TranslationsGalleryButtonsRu galleryButtons = _TranslationsGalleryButtonsRu._(_root);
  @override
  late final _TranslationsMediaRu media = _TranslationsMediaRu._(_root);
  @override
  late final _TranslationsImageStatsRu imageStats = _TranslationsImageStatsRu._(_root);
  @override
  late final _TranslationsPreviewRu preview = _TranslationsPreviewRu._(_root);
  @override
  late final _TranslationsTagTypeRu tagType = _TranslationsTagTypeRu._(_root);
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
  String get invalidNumber => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? 'Пожалуйста, введи число';
  @override
  String get invalidNumericValue =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? 'Пожалуйста, введи корректное числовое значение';
  @override
  String tooSmall({required Object min}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Введи значение больше ${min}';
  @override
  String tooBig({required Object max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Введи значение меньше ${max}';
  @override
  String rangeError({required double min, required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ??
      'Пожалуйста, введи значение между ${min} и ${max}';
  @override
  String get greaterThanOrEqualZero =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? 'Пожалуйста, введи значение равное или больше 0';
  @override
  String get lessThan4 => TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? 'Пожалуйста, введи значение меньше 4';
  @override
  String get biggerThan100 =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? 'Пожалуйста, введи значение больше 100';
  @override
  String get moreThan4ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ??
      'Использование более 4 столбцов может повлиять на производительность';
  @override
  String get moreThan8ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ??
      'Использование более 8 столбцов может повлиять на производительность';
}

// Path: init
class _TranslationsInitRu extends TranslationsInitEn {
  _TranslationsInitRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get initError => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Ошибка инициализации!';
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

// Path: permissions
class _TranslationsPermissionsRu extends TranslationsPermissionsEn {
  _TranslationsPermissionsRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get noAccessToCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ?? 'Нет доступа к выбранной папке хранилища';
  @override
  String get pleaseSetStorageDirectoryAgain =>
      TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ??
      'Пожалуйста, назначь папку хранилища снова, чтобы предоставить приложению доступ к ней';
  @override
  String currentPath({required String path}) =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? 'Текущий путь: ${path}';
  @override
  String get setDirectory => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? 'Назначить папку';
  @override
  String get currentlyNotAvailableForThisPlatform =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ?? 'Недоступно на этой платформе';
  @override
  String get resetDirectory => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? 'Сбросить папку';
  @override
  String get afterResetFilesWillBeSavedToDefaultDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ??
      'Файлы будут сохраняться в папку по умолчанию после сброса';
}

// Path: authentication
class _TranslationsAuthenticationRu extends TranslationsAuthenticationEn {
  _TranslationsAuthenticationRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get pleaseAuthenticateToUseTheApp =>
      TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ??
      'Пожалуйста, пройди аутентификацию для использования приложения';
  @override
  String get noBiometricHardwareAvailable =>
      TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? 'Биометрия недоступна';
  @override
  String get temporaryLockout => TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? 'Временная блокировка';
  @override
  String somethingWentWrong({required String error}) =>
      TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ?? 'Что-то пошло не так: ${error}';
}

// Path: searchHandler
class _TranslationsSearchHandlerRu extends TranslationsSearchHandlerEn {
  _TranslationsSearchHandlerRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get removedLastTab => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? 'Последняя вкладка удалена';
  @override
  String get resettingSearchToDefaultTags =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? 'Сброс к тегам по умолчанию';
  @override
  String get uoh => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'UOOOOOOOHHH';
  @override
  String get ratingsChanged => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? 'Рейтинги изменились';
  @override
  String ratingsChangedMessage({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
      'На ${booruType} [rating:safe] теперь заменён на [rating:general] и [rating:sensitive]';
  @override
  String get appFixedRatingAutomatically =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ??
      'Рейтинг исправлен автоматически. В будущих запросах используй правильный рейтинг';
  @override
  String get tabsRestored => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? 'Вкладки восстановлены';
  @override
  String restoredTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'Восстановлена ${count} вкладка из предыдущей сессии',
        few: 'Восстановлено ${count} вкладки из предыдущей сессии',
        many: 'Восстановлено ${count} вкладок из предыдущей сессии',
        other: 'Восстановлено ${count} вкладок из предыдущей сессии',
      );
  @override
  String get someRestoredTabsHadIssues =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ??
      'Некоторые восстановленные вкладки были для неизвестных сайтов или содержали повреждённые символы.';
  @override
  String get theyWereSetToDefaultOrIgnored =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ??
      'Им были установлены значения по умолчанию или они были проигнорированы.';
  @override
  String get listOfBrokenTabs => TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? 'Список повреждённых вкладок:';
  @override
  String get tabsMerged => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? 'Вкладки объединены';
  @override
  String addedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'Добавлена ${count} новая вкладка',
        few: 'Добавлены ${count} новых вкладки',
        many: 'Добавлено ${count} новых вкладок',
        other: 'Добавлено ${count} новых вкладок',
      );
  @override
  String get tabsReplaced => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? 'Вкладки заменены';
  @override
  String receivedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'Получена ${count} вкладка',
        few: 'Получены ${count} вкладки',
        many: 'Получено ${count} вкладок',
        other: 'Получено ${count} вкладок',
      );
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
  @override
  String get enterTags => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'Введи теги';
  @override
  String get amount => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? 'Количество';
  @override
  String get amountOfFilesToSnatch =>
      TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? 'Количество файлов для скачивания';
  @override
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? 'Задержка (в мс)';
  @override
  String get delayBetweenEachDownload =>
      TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? 'Задержка между каждой загрузкой';
  @override
  String get snatchFiles => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? 'Скачать файлы';
  @override
  String get itemWasAlreadySnatched =>
      TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? 'Элемент уже был загружен ранее';
  @override
  String get failedToSnatchItem => TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? 'Не удалось скачать элемент';
  @override
  String get itemWasCancelled => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? 'Элемент был отменён';
  @override
  String get startingNextQueueItem =>
      TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? 'Запуск следующего элемента очереди...';
  @override
  String get itemsSnatched => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? 'Элементы скачаны';
  @override
  String snatchedCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'Скачано: ${count} элемент',
        few: 'Скачано: ${count} элемента',
        many: 'Скачано: ${count} элементов',
        other: 'Скачано: ${count} элементов',
      );
  @override
  String filesAlreadySnatched({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: '${count} файл уже был скачан',
        few: '${count} файла уже были скачаны',
        many: '${count} файлов уже были скачаны',
        other: '${count} файлов уже были скачаны',
      );
  @override
  String failedToSnatchFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'Не удалось скачать ${count} файл',
        few: 'Не удалось скачать ${count} файла',
        many: 'Не удалось скачать ${count} файлов',
        other: 'Не удалось скачать ${count} файлов',
      );
  @override
  String cancelledFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'Отменён ${count} файл',
        few: 'Отменено ${count} файла',
        many: 'Отменено ${count} файлов',
        other: 'Отменено ${count} файлов',
      );
  @override
  String get snatchingImages => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? 'Скачивание изображений';
  @override
  String get doNotCloseApp => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? 'Не закрывай приложение!';
  @override
  String get addedItemToQueue => TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? 'Элемент добавлен в очередь загрузки';
  @override
  String addedItemsToQueue({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'Добавлен ${count} элемент в очередь загрузки',
        few: 'Добавлено ${count} элемента в очередь загрузки',
        many: 'Добавлено ${count} элементов в очередь загрузки',
        other: 'Добавлено ${count} элементов в очередь загрузки',
      );
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
      TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ?? 'Требует как минимум 2 настроенных сайта';
  @override
  String get selectSecondaryBoorus =>
      TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Выбери второстепенные конфиги:';
  @override
  String get akaMultibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? 'режим Мультисайта';
  @override
  String get labelSecondaryBoorusToInclude =>
      TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? 'Выбранные дополнительные сайты';
}

// Path: hydrus
class _TranslationsHydrusRu extends TranslationsHydrusEn {
  _TranslationsHydrusRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get importError => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'Что-то пошло не так при импорте в Hydrus';
  @override
  String get apiPermissionsRequired =>
      TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ??
      'Возможно, ты не предоставил правильные разрешения API, это можно изменить в Review Services';
  @override
  String get addTagsToFile => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? 'Добавить теги к файлу';
  @override
  String get addUrls => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'Добавить ссылки';
}

// Path: tabs
class _TranslationsTabsRu extends TranslationsTabsEn {
  _TranslationsTabsRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get tab => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? 'Вкладка';
  @override
  String get addBoorusInSettings => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? 'Добавь сайт в настройках';
  @override
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? 'Выбери сайт';
  @override
  String get secondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? 'Дополнительные сайты';
  @override
  String get addNewTab => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? 'Добавить новую вкладку';
  @override
  String get selectABooruOrLeaveEmpty =>
      TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? 'Выбери сайт или оставь пустым';
  @override
  String get addPosition => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? 'Позиция добавления:';
  @override
  String get addModePrevTab => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? 'Предыдущая вкладка';
  @override
  String get addModeNextTab => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? 'Следующая вкладка';
  @override
  String get addModeListEnd => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? 'Конец списка';
  @override
  String get usedQuery => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? 'Используемый запрос:';
  @override
  String get queryModeDefault => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? 'По умолчанию';
  @override
  String get queryModeCurrent => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? 'Текущий';
  @override
  String get queryModeCustom => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? 'Пользовательский';
  @override
  String get customQuery => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? 'Запрос';
  @override
  String get empty => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '[пусто]';
  @override
  String get addSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? 'Добавить дополнительные сайты';
  @override
  String get keepSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? 'Сохранить дополнительные сайты';
  @override
  String get startFromCustomPageNumber => TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? 'Начать со страницы';
  @override
  String get switchToNewTab => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? 'Переключиться на новую вкладку';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? 'Добавить';
  @override
  String get tabsManager => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? 'Менеджер вкладок';
  @override
  String get selectMode => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? 'Режим выбора';
  @override
  String get sortMode => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? 'Сортировать вкладки';
  @override
  String get help => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? 'Помощь';
  @override
  String get deleteTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? 'Удалить вкладки';
  @override
  String get shuffleTabs => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? 'Перемешать вкладки';
  @override
  String get tabRandomlyShuffled => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? 'Вкладки случайно перемешаны';
  @override
  String get tabOrderSaved => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? 'Порядок вкладок сохранён';
  @override
  String get scrollToCurrent => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? 'Прокрутить к текущей вкладке';
  @override
  String get scrollToTop => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? 'Прокрутить вверх';
  @override
  String get scrollToBottom => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? 'Прокрутить вниз';
  @override
  String get filterTabsByBooru =>
      TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? 'Фильтровать по сайту, состоянию, дубликатам...';
  @override
  String get scrolling => TranslationOverrides.string(_root.$meta, 'tabs.scrolling', {}) ?? 'Прокрутка:';
  @override
  String get sorting => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? 'Сортировка:';
  @override
  String get defaultTabsOrder => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? 'Порядок вкладок по умолчанию';
  @override
  String get sortAlphabetically => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? 'Сортировать по алфавиту';
  @override
  String get sortAlphabeticallyReversed =>
      TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? 'Сортировать по алфавиту (обратный порядок)';
  @override
  String get sortByBooruName =>
      TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? 'Сортировать по имени сайта в алфавитном порядке';
  @override
  String get sortByBooruNameReversed =>
      TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ?? 'Сортировать по имени сайта в обратном алфавитном порядке';
  @override
  String get longPressSortToSave =>
      TranslationOverrides.string(_root.$meta, 'tabs.longPressSortToSave', {}) ?? 'Зажми кнопку сортировки для сохранения порядка вкладок';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? 'Выбрать:';
  @override
  String get toggleSelectMode => TranslationOverrides.string(_root.$meta, 'tabs.toggleSelectMode', {}) ?? 'Переключить режим выбора';
  @override
  String get onTheBottomOfPage => TranslationOverrides.string(_root.$meta, 'tabs.onTheBottomOfPage', {}) ?? 'Внизу страницы: ';
  @override
  String get selectDeselectAll => TranslationOverrides.string(_root.$meta, 'tabs.selectDeselectAll', {}) ?? 'Выбрать/сбросить выбор для всех вкладок';
  @override
  String get deleteSelectedTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? 'Удалить выбранные вкладки';
  @override
  String get longPressToMove =>
      TranslationOverrides.string(_root.$meta, 'tabs.longPressToMove', {}) ?? 'Длительное нажатие на вкладку для её перемещения';
  @override
  String get numbersInBottomRight =>
      TranslationOverrides.string(_root.$meta, 'tabs.numbersInBottomRight', {}) ?? 'Числа в правом нижнем углу вкладки:';
  @override
  String get firstNumberTabIndex =>
      TranslationOverrides.string(_root.$meta, 'tabs.firstNumberTabIndex', {}) ?? 'Первое число - индекс вкладки в списке по умолчанию';
  @override
  String get secondNumberTabIndex =>
      TranslationOverrides.string(_root.$meta, 'tabs.secondNumberTabIndex', {}) ??
      'Второе число - индекс вкладки в текущем списке, появляется при активной фильтрации/сортировке';
  @override
  String get specialFilters => TranslationOverrides.string(_root.$meta, 'tabs.specialFilters', {}) ?? 'Специальные фильтры:';
  @override
  String get loadedFilter =>
      TranslationOverrides.string(_root.$meta, 'tabs.loadedFilter', {}) ?? '"Загружено" - показать вкладки с загруженными элементами';
  @override
  String get notLoadedFilter =>
      TranslationOverrides.string(_root.$meta, 'tabs.notLoadedFilter', {}) ??
      '"Не загружено" - показать вкладки, которые не загружены и/или имеют ноль элементов';
  @override
  String get notLoadedItalic => TranslationOverrides.string(_root.$meta, 'tabs.notLoadedItalic', {}) ?? 'Незагруженные вкладки имеют курсивный текст';
  @override
  String get noTabsFound => TranslationOverrides.string(_root.$meta, 'tabs.noTabsFound', {}) ?? 'Вкладки не найдены';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tabs.copy', {}) ?? 'Копировать';
  @override
  String get moveAction => TranslationOverrides.string(_root.$meta, 'tabs.moveAction', {}) ?? 'Переместить';
  @override
  String get remove => TranslationOverrides.string(_root.$meta, 'tabs.remove', {}) ?? 'Удалить';
  @override
  String get shuffle => TranslationOverrides.string(_root.$meta, 'tabs.shuffle', {}) ?? 'Перемешать';
  @override
  String get sort => TranslationOverrides.string(_root.$meta, 'tabs.sort', {}) ?? 'Сортировать';
  @override
  String get shuffleTabsQuestion =>
      TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabsQuestion', {}) ?? 'Перемешать порядок вкладок случайным образом?';
  @override
  String get saveTabsInCurrentOrder =>
      TranslationOverrides.string(_root.$meta, 'tabs.saveTabsInCurrentOrder', {}) ?? 'Сохранить вкладки в текущем порядке сортировки?';
  @override
  String get byBooru => TranslationOverrides.string(_root.$meta, 'tabs.byBooru', {}) ?? 'По сайту';
  @override
  String get alphabetically => TranslationOverrides.string(_root.$meta, 'tabs.alphabetically', {}) ?? 'По алфавиту';
  @override
  String get reversed => TranslationOverrides.string(_root.$meta, 'tabs.reversed', {}) ?? '(обратный порядок)';
  @override
  String areYouSureDeleteTabs({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'tabs.areYouSureDeleteTabs', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'Ты уверен, что хочешь удалить ${count} вкладку?',
        few: 'Ты уверен, что хочешь удалить ${count} вкладки?',
        many: 'Ты уверен, что хочешь удалить ${count} вкладок?',
        other: 'Ты уверен, что хочешь удалить ${count} вкладок?',
      );
  @override
  late final _TranslationsTabsFiltersRu filters = _TranslationsTabsFiltersRu._(_root);
  @override
  late final _TranslationsTabsMoveRu move = _TranslationsTabsMoveRu._(_root);
}

// Path: history
class _TranslationsHistoryRu extends TranslationsHistoryEn {
  _TranslationsHistoryRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get searchHistory => TranslationOverrides.string(_root.$meta, 'history.searchHistory', {}) ?? 'История поиска';
  @override
  String get searchHistoryIsEmpty => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsEmpty', {}) ?? 'История поиска пуста';
  @override
  String get searchHistoryIsDisabled => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsDisabled', {}) ?? 'История поиска отключена';
  @override
  String get searchHistoryRequiresDatabase =>
      TranslationOverrides.string(_root.$meta, 'history.searchHistoryRequiresDatabase', {}) ?? 'История поиска требует включения базы данных';
  @override
  String lastSearch({required String search}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearch', {'search': search}) ?? 'Последний поиск: ${search}';
  @override
  String lastSearchWithDate({required String date}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearchWithDate', {'date': date}) ?? 'Последний поиск: ${date}';
  @override
  String get unknownBooruType => TranslationOverrides.string(_root.$meta, 'history.unknownBooruType', {}) ?? 'Неизвестный тип сайта!';
  @override
  String unknownBooru({required String name, required String type}) =>
      TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ?? 'Неизвестный сайт (${name}-${type})';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? 'Открыть';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? 'Открыть в новой вкладке';
  @override
  String get removeFromFavourites => TranslationOverrides.string(_root.$meta, 'history.removeFromFavourites', {}) ?? 'Удалить из избранного';
  @override
  String get setAsFavourite => TranslationOverrides.string(_root.$meta, 'history.setAsFavourite', {}) ?? 'Добавить в избранное';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'history.copy', {}) ?? 'Копировать';
  @override
  String get delete => TranslationOverrides.string(_root.$meta, 'history.delete', {}) ?? 'Удалить';
  @override
  String get deleteHistoryEntries => TranslationOverrides.string(_root.$meta, 'history.deleteHistoryEntries', {}) ?? 'Удалить записи из истории';
  @override
  String deleteItemsConfirm({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'history.deleteItemsConfirm', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'Ты уверен, что хочешь удалить ${count} элемент?',
        few: 'Ты уверен, что хочешь удалить ${count} элемента?',
        many: 'Ты уверен, что хочешь удалить ${count} элементов?',
        other: 'Ты уверен, что хочешь удалить ${count} элементов?',
      );
  @override
  String get clearSelection => TranslationOverrides.string(_root.$meta, 'history.clearSelection', {}) ?? 'Очистить выбор';
  @override
  String deleteItems({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'history.deleteItems', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'Удалить ${count} элемент',
        few: 'Удалить ${count} элемента',
        many: 'Удалить ${count} элементов',
        other: 'Удалить ${count} элементов',
      );
}

// Path: webview
class _TranslationsWebviewRu extends TranslationsWebviewEn {
  _TranslationsWebviewRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'webview.title', {}) ?? 'Вебвью';
  @override
  String get notSupportedOnDevice =>
      TranslationOverrides.string(_root.$meta, 'webview.notSupportedOnDevice', {}) ?? 'Не поддерживается на этом устройстве';
  @override
  late final _TranslationsWebviewNavigationRu navigation = _TranslationsWebviewNavigationRu._(_root);
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
  late final _TranslationsSettingsDatabaseRu database = _TranslationsSettingsDatabaseRu._(_root);
  @override
  late final _TranslationsSettingsBackupAndRestoreRu backupAndRestore = _TranslationsSettingsBackupAndRestoreRu._(_root);
  @override
  late final _TranslationsSettingsNetworkRu network = _TranslationsSettingsNetworkRu._(_root);
  @override
  late final _TranslationsSettingsPrivacyRu privacy = _TranslationsSettingsPrivacyRu._(_root);
  @override
  late final _TranslationsSettingsPerformanceRu performance = _TranslationsSettingsPerformanceRu._(_root);
  @override
  late final _TranslationsSettingsCacheRu cache = _TranslationsSettingsCacheRu._(_root);
  @override
  late final _TranslationsSettingsTagsFiltersRu tagsFilters = _TranslationsSettingsTagsFiltersRu._(_root);
  @override
  late final _TranslationsSettingsSyncRu sync = _TranslationsSettingsSyncRu._(_root);
  @override
  late final _TranslationsSettingsAboutRu about = _TranslationsSettingsAboutRu._(_root);
  @override
  late final _TranslationsSettingsCheckForUpdatesRu checkForUpdates = _TranslationsSettingsCheckForUpdatesRu._(_root);
  @override
  late final _TranslationsSettingsLogsRu logs = _TranslationsSettingsLogsRu._(_root);
  @override
  late final _TranslationsSettingsHelpRu help = _TranslationsSettingsHelpRu._(_root);
  @override
  late final _TranslationsSettingsDebugRu debug = _TranslationsSettingsDebugRu._(_root);
  @override
  late final _TranslationsSettingsLoggingRu logging = _TranslationsSettingsLoggingRu._(_root);
  @override
  late final _TranslationsSettingsWebviewRu webview = _TranslationsSettingsWebviewRu._(_root);
  @override
  late final _TranslationsSettingsDirPickerRu dirPicker = _TranslationsSettingsDirPickerRu._(_root);
  @override
  String get version => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? 'Версия';
}

// Path: comments
class _TranslationsCommentsRu extends TranslationsCommentsEn {
  _TranslationsCommentsRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'comments.title', {}) ?? 'Комментарии';
  @override
  String get noComments => TranslationOverrides.string(_root.$meta, 'comments.noComments', {}) ?? 'Нет комментариев';
  @override
  String get noBooruAPIForComments =>
      TranslationOverrides.string(_root.$meta, 'comments.noBooruAPIForComments', {}) ?? 'У этого сайта нет комментариев или API для них';
}

// Path: pageChanger
class _TranslationsPageChangerRu extends TranslationsPageChangerEn {
  _TranslationsPageChangerRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'pageChanger.title', {}) ?? 'Переключатель страниц';
  @override
  String get pageLabel => TranslationOverrides.string(_root.$meta, 'pageChanger.pageLabel', {}) ?? 'Страница №';
  @override
  String get delayBetweenLoadings =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.delayBetweenLoadings', {}) ?? 'Задержка между загрузками (мс)';
  @override
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'pageChanger.delayInMs', {}) ?? 'Задержка в мс';
  @override
  String currentPage({required int number}) =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.currentPage', {'number': number}) ?? 'Текущая страница №${number}';
  @override
  String possibleMaxPage({required int number}) =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.possibleMaxPage', {'number': number}) ?? 'Возможная макс. страница №~${number}';
  @override
  String get searchCurrentlyRunning =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.searchCurrentlyRunning', {}) ?? 'В данный момент выполняется поиск!';
  @override
  String get jumpToPage => TranslationOverrides.string(_root.$meta, 'pageChanger.jumpToPage', {}) ?? 'Перейти на страницу';
  @override
  String get searchUntilPage => TranslationOverrides.string(_root.$meta, 'pageChanger.searchUntilPage', {}) ?? 'Искать до страницы';
  @override
  String get stopSearching => TranslationOverrides.string(_root.$meta, 'pageChanger.stopSearching', {}) ?? 'Остановить поиск';
}

// Path: tagsFiltersDialogs
class _TranslationsTagsFiltersDialogsRu extends TranslationsTagsFiltersDialogsEn {
  _TranslationsTagsFiltersDialogsRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get emptyInput => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.emptyInput', {}) ?? 'Пустой ввод!';
  @override
  String addNewFilter({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.addNewFilter', {'type': type}) ?? '[Добавить новый фильтр: ${type}]';
  @override
  String newTagFilter({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newTagFilter', {'type': type}) ?? 'Новый фильтр тега типа: ${type}';
  @override
  String get newFilter => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newFilter', {}) ?? 'Новый фильтр';
  @override
  String get editFilter => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.editFilter', {}) ?? 'Изменить фильтр';
}

// Path: tagsManager
class _TranslationsTagsManagerRu extends TranslationsTagsManagerEn {
  _TranslationsTagsManagerRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'tagsManager.title', {}) ?? 'Теги';
  @override
  String get addTag => TranslationOverrides.string(_root.$meta, 'tagsManager.addTag', {}) ?? 'Добавить тег';
  @override
  String get name => TranslationOverrides.string(_root.$meta, 'tagsManager.name', {}) ?? 'Имя';
  @override
  String get type => TranslationOverrides.string(_root.$meta, 'tagsManager.type', {}) ?? 'Тип';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'tagsManager.add', {}) ?? 'Добавить';
  @override
  String staleAfter({required String staleText}) =>
      TranslationOverrides.string(_root.$meta, 'tagsManager.staleAfter', {'staleText': staleText}) ?? 'Устаревает после: ${staleText}';
  @override
  String get addedATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addedATab', {}) ?? 'Вкладка добавлена';
  @override
  String get addATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addATab', {}) ?? 'Добавить вкладку';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tagsManager.copy', {}) ?? 'Копировать';
  @override
  String get setStale => TranslationOverrides.string(_root.$meta, 'tagsManager.setStale', {}) ?? 'Установить как устаревший';
  @override
  String get resetStale => TranslationOverrides.string(_root.$meta, 'tagsManager.resetStale', {}) ?? 'Сбросить устаревание';
  @override
  String get makeUnstaleable => TranslationOverrides.string(_root.$meta, 'tagsManager.makeUnstaleable', {}) ?? 'Сделать не устаревающим';
  @override
  String deleteTags({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'tagsManager.deleteTags', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'Удалить ${count} тег',
        few: 'Удалить ${count} тега',
        many: 'Удалить ${count} тегов',
        other: 'Удалить ${count} тегов',
      );
  @override
  String get deleteTagsTitle => TranslationOverrides.string(_root.$meta, 'tagsManager.deleteTagsTitle', {}) ?? 'Удалить теги';
  @override
  String get clearSelection => TranslationOverrides.string(_root.$meta, 'tagsManager.clearSelection', {}) ?? 'Очистить выбор';
}

// Path: lockscreen
class _TranslationsLockscreenRu extends TranslationsLockscreenEn {
  _TranslationsLockscreenRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get tapToAuthenticate => TranslationOverrides.string(_root.$meta, 'lockscreen.tapToAuthenticate', {}) ?? 'Нажми для входа';
  @override
  String get devUnlock => TranslationOverrides.string(_root.$meta, 'lockscreen.devUnlock', {}) ?? 'РАЗБЛОКИРОВАТЬ (ОТЛАДКА)';
  @override
  String get testingMessage =>
      TranslationOverrides.string(_root.$meta, 'lockscreen.testingMessage', {}) ??
      '[ТЕСТИРОВАНИЕ]: Нажми это, если ты не можешь разблокировать приложение обычными способами. Сообщи разработчику с подробностями о твоём устройстве.';
}

// Path: loliSync
class _TranslationsLoliSyncRu extends TranslationsLoliSyncEn {
  _TranslationsLoliSyncRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'loliSync.title', {}) ?? 'LoliSync';
  @override
  String get stopSyncingQuestion =>
      TranslationOverrides.string(_root.$meta, 'loliSync.stopSyncingQuestion', {}) ?? 'Ты хочешь остановить синхронизацию?';
  @override
  String get stopServerQuestion => TranslationOverrides.string(_root.$meta, 'loliSync.stopServerQuestion', {}) ?? 'Ты хочешь остановить сервер?';
  @override
  String get noConnection => TranslationOverrides.string(_root.$meta, 'loliSync.noConnection', {}) ?? 'Нет соединения';
  @override
  String get waitingForConnection => TranslationOverrides.string(_root.$meta, 'loliSync.waitingForConnection', {}) ?? 'Ожидание соединения...';
  @override
  String get startingServer => TranslationOverrides.string(_root.$meta, 'loliSync.startingServer', {}) ?? 'Запуск сервера...';
  @override
  String get keepScreenAwake => TranslationOverrides.string(_root.$meta, 'loliSync.keepScreenAwake', {}) ?? 'Держать экран активным';
  @override
  String get serverKilled => TranslationOverrides.string(_root.$meta, 'loliSync.serverKilled', {}) ?? 'Сервер остановлен';
  @override
  String testError({required int statusCode, required String reasonPhrase}) =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testError', {'statusCode': statusCode, 'reasonPhrase': reasonPhrase}) ??
      'Ошибка теста: ${statusCode} ${reasonPhrase}';
  @override
  String testErrorException({required String error}) =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testErrorException', {'error': error}) ?? 'Ошибка теста: ${error}';
  @override
  String get testSuccess => TranslationOverrides.string(_root.$meta, 'loliSync.testSuccess', {}) ?? 'Тестовый запрос получил положительный ответ';
  @override
  String get testSuccessMessage =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testSuccessMessage', {}) ?? 'Должно быть сообщение \'Тест\' на другом устройстве';
}

// Path: imageSearch
class _TranslationsImageSearchRu extends TranslationsImageSearchEn {
  _TranslationsImageSearchRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'imageSearch.title', {}) ?? 'Поиск изображений';
}

// Path: tagView
class _TranslationsTagViewRu extends TranslationsTagViewEn {
  _TranslationsTagViewRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get tags => TranslationOverrides.string(_root.$meta, 'tagView.tags', {}) ?? 'Теги';
  @override
  String get comments => TranslationOverrides.string(_root.$meta, 'tagView.comments', {}) ?? 'Комментарии';
  @override
  String showNotes({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'tagView.showNotes', {'count': count}) ?? 'Показать заметки (${count})';
  @override
  String hideNotes({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'tagView.hideNotes', {'count': count}) ?? 'Скрыть заметки (${count})';
  @override
  String get loadNotes => TranslationOverrides.string(_root.$meta, 'tagView.loadNotes', {}) ?? 'Загрузить заметки';
  @override
  String get thisTagAlreadyInSearch =>
      TranslationOverrides.string(_root.$meta, 'tagView.thisTagAlreadyInSearch', {}) ?? 'Этот тег уже есть в текущем поисковом запросе:';
  @override
  String get addedToCurrentSearch =>
      TranslationOverrides.string(_root.$meta, 'tagView.addedToCurrentSearch', {}) ?? 'Добавлено к текущему поисковому запросу:';
  @override
  String get addedNewTab => TranslationOverrides.string(_root.$meta, 'tagView.addedNewTab', {}) ?? 'Добавлена новая вкладка:';
  @override
  String get id => TranslationOverrides.string(_root.$meta, 'tagView.id', {}) ?? 'ID';
  @override
  String get postURL => TranslationOverrides.string(_root.$meta, 'tagView.postURL', {}) ?? 'Ссылка на пост';
  @override
  String get posted => TranslationOverrides.string(_root.$meta, 'tagView.posted', {}) ?? 'Опубликовано';
  @override
  String get details => TranslationOverrides.string(_root.$meta, 'tagView.details', {}) ?? 'Детали';
  @override
  String get filename => TranslationOverrides.string(_root.$meta, 'tagView.filename', {}) ?? 'Имя файла';
  @override
  String get url => TranslationOverrides.string(_root.$meta, 'tagView.url', {}) ?? 'Ссылка';
  @override
  String get extension => TranslationOverrides.string(_root.$meta, 'tagView.extension', {}) ?? 'Расширение';
  @override
  String get resolution => TranslationOverrides.string(_root.$meta, 'tagView.resolution', {}) ?? 'Разрешение';
  @override
  String get size => TranslationOverrides.string(_root.$meta, 'tagView.size', {}) ?? 'Размер';
  @override
  String get md5 => TranslationOverrides.string(_root.$meta, 'tagView.md5', {}) ?? 'MD5';
  @override
  String get rating => TranslationOverrides.string(_root.$meta, 'tagView.rating', {}) ?? 'Рейтинг';
  @override
  String get score => TranslationOverrides.string(_root.$meta, 'tagView.score', {}) ?? 'Оценка';
  @override
  String get noTagsFound => TranslationOverrides.string(_root.$meta, 'tagView.noTagsFound', {}) ?? 'Теги не найдены';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tagView.copy', {}) ?? 'Копировать';
  @override
  String get removeFromSearch => TranslationOverrides.string(_root.$meta, 'tagView.removeFromSearch', {}) ?? 'Удалить из поиска';
  @override
  String get addToSearch => TranslationOverrides.string(_root.$meta, 'tagView.addToSearch', {}) ?? 'Добавить в поиск';
  @override
  String get addedToSearchBar => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBar', {}) ?? 'Добавлено в строку поиска:';
  @override
  String get addToSearchExclude => TranslationOverrides.string(_root.$meta, 'tagView.addToSearchExclude', {}) ?? 'Добавить в поиск (Исключить)';
  @override
  String get addedToSearchBarExclude =>
      TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBarExclude', {}) ?? 'Добавлено в строку поиска (Исключить):';
  @override
  String get addToLoved => TranslationOverrides.string(_root.$meta, 'tagView.addToLoved', {}) ?? 'Добавить в любимые';
  @override
  String get addToHated => TranslationOverrides.string(_root.$meta, 'tagView.addToHated', {}) ?? 'Добавить в ненавистные';
  @override
  String get removeFromLoved => TranslationOverrides.string(_root.$meta, 'tagView.removeFromLoved', {}) ?? 'Удалить из любимых';
  @override
  String get removeFromHated => TranslationOverrides.string(_root.$meta, 'tagView.removeFromHated', {}) ?? 'Удалить из ненавистных';
  @override
  String get editTag => TranslationOverrides.string(_root.$meta, 'tagView.editTag', {}) ?? 'Редактировать тег';
  @override
  String copiedSelected({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagView.copiedSelected', {'type': type}) ?? '${type}: скопировано в буфер обмена';
  @override
  String get selectedText => TranslationOverrides.string(_root.$meta, 'tagView.selectedText', {}) ?? 'выбранный текст';
  @override
  String get source => TranslationOverrides.string(_root.$meta, 'tagView.source', {}) ?? 'источник';
  @override
  String get sourceDialogTitle => TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogTitle', {}) ?? 'Источник';
  @override
  String get sourceDialogText1 =>
      TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogText1', {}) ??
      'Текст в поле источника не может быть открыт как ссылка, либо потому что это не ссылка, либо потому что несколько ссылок в одной строке.';
  @override
  String get sourceDialogText2 =>
      TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogText2', {}) ??
      'Ты можешь выбрать любой текст ниже длительным нажатием, затем нажми "Открыть выбранное", чтобы попытаться открыть его как ссылку:';
  @override
  String get noTextSelected => TranslationOverrides.string(_root.$meta, 'tagView.noTextSelected', {}) ?? '[Текст не выбран]';
  @override
  String copySelected({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagView.copySelected', {'type': type}) ?? 'Копировать ${type}';
  @override
  String get selected => TranslationOverrides.string(_root.$meta, 'tagView.selected', {}) ?? 'выбранное';
  @override
  String get all => TranslationOverrides.string(_root.$meta, 'tagView.all', {}) ?? 'всё';
  @override
  String openSelected({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagView.openSelected', {'type': type}) ?? 'Открыть ${type}';
  @override
  String get preview => TranslationOverrides.string(_root.$meta, 'tagView.preview', {}) ?? 'Предпросмотр';
  @override
  String get booru => TranslationOverrides.string(_root.$meta, 'tagView.booru', {}) ?? 'Сайт';
  @override
  String get selectBooruToLoad => TranslationOverrides.string(_root.$meta, 'tagView.selectBooruToLoad', {}) ?? 'Выбери сайт для загрузки';
  @override
  String get previewIsLoading => TranslationOverrides.string(_root.$meta, 'tagView.previewIsLoading', {}) ?? 'Предпросмотр загружается...';
  @override
  String get failedToLoadPreview =>
      TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreview', {}) ?? 'Не удалось загрузить предпросмотр';
  @override
  String get tapToTryAgain => TranslationOverrides.string(_root.$meta, 'tagView.tapToTryAgain', {}) ?? 'Нажми, чтобы попробовать снова';
  @override
  String get copiedFileURL => TranslationOverrides.string(_root.$meta, 'tagView.copiedFileURL', {}) ?? 'Ссылка на файл скопирована в буфер обмена';
  @override
  String get tagPreviews => TranslationOverrides.string(_root.$meta, 'tagView.tagPreviews', {}) ?? 'Предпросмотры тегов';
  @override
  String get currentState => TranslationOverrides.string(_root.$meta, 'tagView.currentState', {}) ?? 'Текущее состояние';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'tagView.history', {}) ?? 'История';
  @override
  String get failedToLoadPreviewPage =>
      TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreviewPage', {}) ?? 'Не удалось загрузить страницу предпросмотра';
  @override
  String get tryAgain => TranslationOverrides.string(_root.$meta, 'tagView.tryAgain', {}) ?? 'Попробовать снова';
}

// Path: pinnedTags
class _TranslationsPinnedTagsRu extends TranslationsPinnedTagsEn {
  _TranslationsPinnedTagsRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get pinnedTags => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedTags', {}) ?? 'Закрепленные теги';
  @override
  String get pinTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinTag', {}) ?? 'Закрепить тег';
  @override
  String get unpinTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinTag', {}) ?? 'Открепить тег';
  @override
  String get pin => TranslationOverrides.string(_root.$meta, 'pinnedTags.pin', {}) ?? 'Закрепить';
  @override
  String get unpin => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpin', {}) ?? 'Открепить';
  @override
  String pinQuestion({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinQuestion', {'tag': tag}) ?? 'Закрепить "${tag}" для быстрого доступа?';
  @override
  String unpinQuestion({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinQuestion', {'tag': tag}) ?? 'Убрать "${tag}" из закрепленных тегов?';
  @override
  String onlyForBooru({required String name}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.onlyForBooru', {'name': name}) ?? 'Только для ${name}';
  @override
  String get labelsOptional => TranslationOverrides.string(_root.$meta, 'pinnedTags.labelsOptional', {}) ?? 'Метки (необязательно)';
  @override
  String get typeAndEnterToAdd =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.typeAndEnterToAdd', {}) ?? 'Введи и нажми отправить для добавления';
  @override
  String get selectExistingLabel => TranslationOverrides.string(_root.$meta, 'pinnedTags.selectExistingLabel', {}) ?? 'Выбери существующую метку';
  @override
  String get tagPinned => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagPinned', {}) ?? 'Тег закреплен';
  @override
  String pinnedForBooru({required String name, required String labels}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedForBooru', {'name': name, 'labels': labels}) ?? 'Закреплен для ${name}${labels}';
  @override
  String pinnedGloballyWithLabels({required String labels}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedGloballyWithLabels', {'labels': labels}) ?? 'Закреплен глобально${labels}';
  @override
  String get tagUnpinned => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagUnpinned', {}) ?? 'Тег откреплен';
  @override
  String get all => TranslationOverrides.string(_root.$meta, 'pinnedTags.all', {}) ?? 'Все';
  @override
  String get reorderPinnedTags =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.reorderPinnedTags', {}) ?? 'Поменять порядок закрепленных тегов';
  @override
  String get saving => TranslationOverrides.string(_root.$meta, 'pinnedTags.saving', {}) ?? 'Сохраняется...';
  @override
  String get searchPinnedTags => TranslationOverrides.string(_root.$meta, 'pinnedTags.searchPinnedTags', {}) ?? 'Искать закрепленные теги...';
  @override
  String get reorder => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorder', {}) ?? 'Поменять порядок';
  @override
  String get addTagManually => TranslationOverrides.string(_root.$meta, 'pinnedTags.addTagManually', {}) ?? 'Добавить тег вручную';
  @override
  String get noTagsMatchSearch => TranslationOverrides.string(_root.$meta, 'pinnedTags.noTagsMatchSearch', {}) ?? 'Нет подходящих тегов';
  @override
  String get noPinnedTagsYet => TranslationOverrides.string(_root.$meta, 'pinnedTags.noPinnedTagsYet', {}) ?? 'Пока нет закрепленных тегов';
  @override
  String get editLabels => TranslationOverrides.string(_root.$meta, 'pinnedTags.editLabels', {}) ?? 'Редактировать метки';
  @override
  String get labels => TranslationOverrides.string(_root.$meta, 'pinnedTags.labels', {}) ?? 'Метки';
  @override
  String get addPinnedTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.addPinnedTag', {}) ?? 'Добавить закрепленный тег';
  @override
  String get tagQuery => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQuery', {}) ?? 'Строка тега';
  @override
  String get tagQueryHint => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQueryHint', {}) ?? 'tag_name';
  @override
  String get rawQueryHelp => TranslationOverrides.string(_root.$meta, 'pinnedTags.rawQueryHelp', {}) ?? 'Можно ввести любую строку, включая пробелы';
}

// Path: searchBar
class _TranslationsSearchBarRu extends TranslationsSearchBarEn {
  _TranslationsSearchBarRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get searchForTags => TranslationOverrides.string(_root.$meta, 'searchBar.searchForTags', {}) ?? 'Искать теги';
  @override
  String failedToLoadSuggestions({required String msg}) =>
      TranslationOverrides.string(_root.$meta, 'searchBar.failedToLoadSuggestions', {'msg': msg}) ??
      'Не удалось загрузить предложения. Нажми для повтора${msg}';
  @override
  String get noSuggestionsFound => TranslationOverrides.string(_root.$meta, 'searchBar.noSuggestionsFound', {}) ?? 'Подсказки не найдены';
  @override
  String get tagSuggestionsNotAvailable =>
      TranslationOverrides.string(_root.$meta, 'searchBar.tagSuggestionsNotAvailable', {}) ?? 'Предложения тегов недоступны для этого сайта';
  @override
  String copiedTagToClipboard({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'searchBar.copiedTagToClipboard', {'tag': tag}) ?? '"${tag}": скопировано в буфер обмена';
  @override
  String get prefix => TranslationOverrides.string(_root.$meta, 'searchBar.prefix', {}) ?? 'Префикс';
  @override
  String get exclude => TranslationOverrides.string(_root.$meta, 'searchBar.exclude', {}) ?? 'Исключить (—)';
  @override
  String get booruNumberPrefix => TranslationOverrides.string(_root.$meta, 'searchBar.booruNumberPrefix', {}) ?? 'Сайт (N#)';
  @override
  String get metatags => TranslationOverrides.string(_root.$meta, 'searchBar.metatags', {}) ?? 'Метатеги';
  @override
  String get freeMetatags => TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatags', {}) ?? 'Бесплатные метатеги';
  @override
  String get freeMetatagsDescription =>
      TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatagsDescription', {}) ??
      'Бесплатные метатеги не учитываются в лимитах поиска тегов';
  @override
  String get free => TranslationOverrides.string(_root.$meta, 'searchBar.free', {}) ?? 'Бесплатно';
  @override
  String get single => TranslationOverrides.string(_root.$meta, 'searchBar.single', {}) ?? 'Одиночный';
  @override
  String get range => TranslationOverrides.string(_root.$meta, 'searchBar.range', {}) ?? 'Диапазон';
  @override
  String get popular => TranslationOverrides.string(_root.$meta, 'searchBar.popular', {}) ?? 'Популярное';
  @override
  String get selectDate => TranslationOverrides.string(_root.$meta, 'searchBar.selectDate', {}) ?? 'Выбери дату';
  @override
  String get selectDatesRange => TranslationOverrides.string(_root.$meta, 'searchBar.selectDatesRange', {}) ?? 'Выбери диапазон дат';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'searchBar.history', {}) ?? 'История';
  @override
  String get more => TranslationOverrides.string(_root.$meta, 'searchBar.more', {}) ?? '...';
}

// Path: mobileHome
class _TranslationsMobileHomeRu extends TranslationsMobileHomeEn {
  _TranslationsMobileHomeRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get selectBooruForWebview => TranslationOverrides.string(_root.$meta, 'mobileHome.selectBooruForWebview', {}) ?? 'Выбери сайт для вебвью';
  @override
  String get lockApp => TranslationOverrides.string(_root.$meta, 'mobileHome.lockApp', {}) ?? 'Заблокировать приложение';
  @override
  String get fileAlreadyExists => TranslationOverrides.string(_root.$meta, 'mobileHome.fileAlreadyExists', {}) ?? 'Файл уже существует';
  @override
  String get failedToDownload => TranslationOverrides.string(_root.$meta, 'mobileHome.failedToDownload', {}) ?? 'Не удалось загрузить';
  @override
  String get cancelledByUser => TranslationOverrides.string(_root.$meta, 'mobileHome.cancelledByUser', {}) ?? 'Отменено пользователем';
  @override
  String get saveAnyway => TranslationOverrides.string(_root.$meta, 'mobileHome.saveAnyway', {}) ?? 'Сохранить в любом случае';
  @override
  String get skip => TranslationOverrides.string(_root.$meta, 'mobileHome.skip', {}) ?? 'Пропустить';
  @override
  String retryAll({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.retryAll', {'count': count}) ?? 'Повторить все (${count})';
  @override
  String get existingFailedOrCancelledItems =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.existingFailedOrCancelledItems', {}) ??
      'Скачанные ранее, неудачные или отменённые элементы';
  @override
  String get clearAllRetryableItems =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.clearAllRetryableItems', {}) ?? 'Очистить все элементы для повтора';
}

// Path: desktopHome
class _TranslationsDesktopHomeRu extends TranslationsDesktopHomeEn {
  _TranslationsDesktopHomeRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get snatcher => TranslationOverrides.string(_root.$meta, 'desktopHome.snatcher', {}) ?? 'Загрузчик';
  @override
  String get addBoorusInSettings => TranslationOverrides.string(_root.$meta, 'desktopHome.addBoorusInSettings', {}) ?? 'Добавь сайт в настройках';
  @override
  String get settings => TranslationOverrides.string(_root.$meta, 'desktopHome.settings', {}) ?? 'Настройки';
  @override
  String get save => TranslationOverrides.string(_root.$meta, 'desktopHome.save', {}) ?? 'Сохранить';
  @override
  String get noItemsSelected => TranslationOverrides.string(_root.$meta, 'desktopHome.noItemsSelected', {}) ?? 'Ничего не выбрано';
}

// Path: galleryView
class _TranslationsGalleryViewRu extends TranslationsGalleryViewEn {
  _TranslationsGalleryViewRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get noItems => TranslationOverrides.string(_root.$meta, 'galleryView.noItems', {}) ?? 'Нет элементов';
  @override
  String get noItemSelected => TranslationOverrides.string(_root.$meta, 'galleryView.noItemSelected', {}) ?? 'Нет выбранного элемента';
  @override
  String get close => TranslationOverrides.string(_root.$meta, 'galleryView.close', {}) ?? 'Закрыть';
}

// Path: mediaPreviews
class _TranslationsMediaPreviewsRu extends TranslationsMediaPreviewsEn {
  _TranslationsMediaPreviewsRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get noBooruConfigsFound =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.noBooruConfigsFound', {}) ?? 'Конфигурации сайтов не найдены';
  @override
  String get addNewBooru => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? 'Добавить новый сайт';
  @override
  String get help => TranslationOverrides.string(_root.$meta, 'mediaPreviews.help', {}) ?? 'Помощь';
  @override
  String get settings => TranslationOverrides.string(_root.$meta, 'mediaPreviews.settings', {}) ?? 'Настройки';
  @override
  String get restoringPreviousSession =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoringPreviousSession', {}) ?? 'Восстановление предыдущей сессии...';
  @override
  String get copiedFileURL =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.copiedFileURL', {}) ?? 'Ссылка на файл скопирована в буфер обмена!';
}

// Path: viewer
class _TranslationsViewerRu extends TranslationsViewerEn {
  _TranslationsViewerRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsViewerTutorialRu tutorial = _TranslationsViewerTutorialRu._(_root);
  @override
  late final _TranslationsViewerAppBarRu appBar = _TranslationsViewerAppBarRu._(_root);
  @override
  late final _TranslationsViewerNotesRu notes = _TranslationsViewerNotesRu._(_root);
}

// Path: common
class _TranslationsCommonRu extends TranslationsCommonEn {
  _TranslationsCommonRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'common.selectABooru', {}) ?? 'Выбери сайт';
  @override
  String get booruItemCopiedToClipboard =>
      TranslationOverrides.string(_root.$meta, 'common.booruItemCopiedToClipboard', {}) ?? 'Элемент скопирован в буфер обмена';
}

// Path: gallery
class _TranslationsGalleryRu extends TranslationsGalleryEn {
  _TranslationsGalleryRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get snatchQuestion => TranslationOverrides.string(_root.$meta, 'gallery.snatchQuestion', {}) ?? 'Загрузить?';
  @override
  String get noPostUrl => TranslationOverrides.string(_root.$meta, 'gallery.noPostUrl', {}) ?? 'Нет ссылки на пост!';
  @override
  String get loadingFile => TranslationOverrides.string(_root.$meta, 'gallery.loadingFile', {}) ?? 'Загрузка файла...';
  @override
  String get loadingFileMessage =>
      TranslationOverrides.string(_root.$meta, 'gallery.loadingFileMessage', {}) ?? 'Это может занять некоторое время, пожалуйста, подожди...';
  @override
  String sources({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'gallery.sources', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'Источник',
        other: 'Источников',
      );
}

// Path: galleryButtons
class _TranslationsGalleryButtonsRu extends TranslationsGalleryButtonsEn {
  _TranslationsGalleryButtonsRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get snatch => TranslationOverrides.string(_root.$meta, 'galleryButtons.snatch', {}) ?? 'Скачать';
  @override
  String get favourite => TranslationOverrides.string(_root.$meta, 'galleryButtons.favourite', {}) ?? 'В избранное';
  @override
  String get info => TranslationOverrides.string(_root.$meta, 'galleryButtons.info', {}) ?? 'Инфо';
  @override
  String get share => TranslationOverrides.string(_root.$meta, 'galleryButtons.share', {}) ?? 'Поделиться';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'galleryButtons.select', {}) ?? 'Выбрать';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'galleryButtons.open', {}) ?? 'Открыть в браузере';
  @override
  String get slideshow => TranslationOverrides.string(_root.$meta, 'galleryButtons.slideshow', {}) ?? 'Слайдшоу';
  @override
  String get reloadNoScale => TranslationOverrides.string(_root.$meta, 'galleryButtons.reloadNoScale', {}) ?? 'Переключить масштабирование';
  @override
  String get toggleQuality => TranslationOverrides.string(_root.$meta, 'galleryButtons.toggleQuality', {}) ?? 'Переключить качество';
  @override
  String get externalPlayer => TranslationOverrides.string(_root.$meta, 'galleryButtons.externalPlayer', {}) ?? 'Внешний плеер';
  @override
  String get imageSearch => TranslationOverrides.string(_root.$meta, 'galleryButtons.imageSearch', {}) ?? 'Поиск по картинке';
}

// Path: media
class _TranslationsMediaRu extends TranslationsMediaEn {
  _TranslationsMediaRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsMediaLoadingRu loading = _TranslationsMediaLoadingRu._(_root);
  @override
  late final _TranslationsMediaVideoRu video = _TranslationsMediaVideoRu._(_root);
}

// Path: imageStats
class _TranslationsImageStatsRu extends TranslationsImageStatsEn {
  _TranslationsImageStatsRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String live({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.live', {'count': count}) ?? 'Активно: ${count}';
  @override
  String pending({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.pending', {'count': count}) ?? 'В ожидании: ${count}';
  @override
  String total({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.total', {'count': count}) ?? 'Всего: ${count}';
  @override
  String size({required String size}) => TranslationOverrides.string(_root.$meta, 'imageStats.size', {'size': size}) ?? 'Размер: ${size}';
  @override
  String max({required String max}) => TranslationOverrides.string(_root.$meta, 'imageStats.max', {'max': max}) ?? 'Максимум: ${max}';
}

// Path: preview
class _TranslationsPreviewRu extends TranslationsPreviewEn {
  _TranslationsPreviewRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsPreviewErrorRu error = _TranslationsPreviewErrorRu._(_root);
}

// Path: tagType
class _TranslationsTagTypeRu extends TranslationsTagTypeEn {
  _TranslationsTagTypeRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get artist => TranslationOverrides.string(_root.$meta, 'tagType.artist', {}) ?? 'Автор';
  @override
  String get character => TranslationOverrides.string(_root.$meta, 'tagType.character', {}) ?? 'Персонаж';
  @override
  String get copyright => TranslationOverrides.string(_root.$meta, 'tagType.copyright', {}) ?? 'Франшиза';
  @override
  String get meta => TranslationOverrides.string(_root.$meta, 'tagType.meta', {}) ?? 'Мета';
  @override
  String get species => TranslationOverrides.string(_root.$meta, 'tagType.species', {}) ?? 'Раса';
  @override
  String get none => TranslationOverrides.string(_root.$meta, 'tagType.none', {}) ?? 'Нет/Общее';
}

// Path: tabs.filters
class _TranslationsTabsFiltersRu extends TranslationsTabsFiltersEn {
  _TranslationsTabsFiltersRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get loaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.loaded', {}) ?? 'Загружено';
  @override
  String get tagType => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagType', {}) ?? 'Тип тега';
  @override
  String get multibooru => TranslationOverrides.string(_root.$meta, 'tabs.filters.multibooru', {}) ?? 'Мультисайт';
  @override
  String get duplicates => TranslationOverrides.string(_root.$meta, 'tabs.filters.duplicates', {}) ?? 'Дубликаты';
  @override
  String get checkDuplicatesOnSameBooru =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.checkDuplicatesOnSameBooru', {}) ?? 'Проверять дубликаты на том же сайте';
  @override
  String get emptySearchQuery => TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? 'Пустой запрос';
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'tabs.filters.title', {}) ?? 'Фильтры вкладок';
  @override
  String get all => TranslationOverrides.string(_root.$meta, 'tabs.filters.all', {}) ?? 'Все';
  @override
  String get notLoaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.notLoaded', {}) ?? 'Не загружено';
  @override
  String get enabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.enabled', {}) ?? 'Включено';
  @override
  String get disabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.disabled', {}) ?? 'Отключено';
  @override
  String get willAlsoEnableSorting =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.willAlsoEnableSorting', {}) ?? 'Также включит сортировку';
  @override
  String get tagTypeFilterHelp =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.tagTypeFilterHelp', {}) ??
      'Фильтровать вкладки, которые содержат хотя бы один тег выбранного типа';
  @override
  String get any => TranslationOverrides.string(_root.$meta, 'tabs.filters.any', {}) ?? 'Любой';
  @override
  String get apply => TranslationOverrides.string(_root.$meta, 'tabs.filters.apply', {}) ?? 'Применить';
}

// Path: tabs.move
class _TranslationsTabsMoveRu extends TranslationsTabsMoveEn {
  _TranslationsTabsMoveRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get moveToTop => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToTop', {}) ?? 'Переместить наверх';
  @override
  String get moveToBottom => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToBottom', {}) ?? 'Переместить вниз';
  @override
  String get tabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.tabNumber', {}) ?? 'Номер вкладки';
  @override
  String get invalidTabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidTabNumber', {}) ?? 'Неверный номер вкладки';
  @override
  String get invalidInput => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidInput', {}) ?? 'Неверный ввод';
  @override
  String get outOfRange => TranslationOverrides.string(_root.$meta, 'tabs.move.outOfRange', {}) ?? 'Вне диапазона';
  @override
  String get pleaseEnterValidTabNumber =>
      TranslationOverrides.string(_root.$meta, 'tabs.move.pleaseEnterValidTabNumber', {}) ?? 'Пожалуйста, введи корректный номер вкладки';
  @override
  String moveTo({required String formattedNumber}) =>
      TranslationOverrides.string(_root.$meta, 'tabs.move.moveTo', {'formattedNumber': formattedNumber}) ?? 'Переместить на #${formattedNumber}';
  @override
  String get preview => TranslationOverrides.string(_root.$meta, 'tabs.move.preview', {}) ?? 'Предпросмотр:';
}

// Path: webview.navigation
class _TranslationsWebviewNavigationRu extends TranslationsWebviewNavigationEn {
  _TranslationsWebviewNavigationRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get enterUrlLabel => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterUrlLabel', {}) ?? 'Введи ссылку';
  @override
  String get enterCustomUrl => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterCustomUrl', {}) ?? 'Введи ссылку';
  @override
  String navigateTo({required String url}) =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.navigateTo', {'url': url}) ?? 'Перейти на ${url}';
  @override
  String get listCookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.listCookies', {}) ?? 'Список куки';
  @override
  String get clearCookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.clearCookies', {}) ?? 'Очистить куки';
  @override
  String get cookiesGone => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookiesGone', {}) ?? 'Были куки. Теперь их нет';
  @override
  String get getFavicon => TranslationOverrides.string(_root.$meta, 'webview.navigation.getFavicon', {}) ?? 'Получить иконку сайта';
  @override
  String get noFaviconFound => TranslationOverrides.string(_root.$meta, 'webview.navigation.noFaviconFound', {}) ?? 'Иконка сайта не найдена';
  @override
  String get host => TranslationOverrides.string(_root.$meta, 'webview.navigation.host', {}) ?? 'Хост:';
  @override
  String get textAboveSelectable =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.textAboveSelectable', {}) ?? '(текст выше можно выбрать)';
  @override
  String get fieldToMergeTexts =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.fieldToMergeTexts', {}) ?? 'Поле для объединения текстов:';
  @override
  String get copyUrl => TranslationOverrides.string(_root.$meta, 'webview.navigation.copyUrl', {}) ?? 'Копировать ссылку';
  @override
  String get copiedUrlToClipboard =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.copiedUrlToClipboard', {}) ?? 'Ссылка скопирована в буфер обмена';
  @override
  String get cookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookies', {}) ?? 'Куки';
  @override
  String get favicon => TranslationOverrides.string(_root.$meta, 'webview.navigation.favicon', {}) ?? 'Иконка сайта';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'webview.navigation.history', {}) ?? 'История';
  @override
  String get noBackHistoryItem =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.noBackHistoryItem', {}) ?? 'Нет элемента для возврата назад';
  @override
  String get noForwardHistoryItem =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.noForwardHistoryItem', {}) ?? 'Нет элемента для перехода вперёд';
}

// Path: settings.language
class _TranslationsSettingsLanguageRu extends TranslationsSettingsLanguageEn {
  _TranslationsSettingsLanguageRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? 'Язык';
  @override
  String get system => TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? 'Системный';
  @override
  String get helpUsTranslate => TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? 'Помоги нам с переводом';
  @override
  String get visitForDetails =>
      TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ??
      'Посети <a href="https://github.com/NO-ob/LoliSnatcher_Droid/wiki/Localization">github</a> для подробностей или нажми на изображение ниже, чтобы перейти на Weblate';
}

// Path: settings.booru
class _TranslationsSettingsBooruRu extends TranslationsSettingsBooruEn {
  _TranslationsSettingsBooruRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Сайты и Поиск';
  @override
  String get dropdown => TranslationOverrides.string(_root.$meta, 'settings.booru.dropdown', {}) ?? 'Сайт';
  @override
  String get defaultTags => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? 'Теги по умолчанию';
  @override
  String get itemsPerPage => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'Элементов на странице';
  @override
  String get itemsPerPageTip =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'Некоторые сайты могут игнорировать этот параметр';
  @override
  String get itemsPerPagePlaceholder => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPagePlaceholder', {}) ?? '10-100';
  @override
  String get addBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Добавить конфиг сайта';
  @override
  String get shareBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? 'Поделиться конфигом сайта';
  @override
  String shareBooruDialogMsgMobile({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
      'Поделиться конфигом ${booruName} как ссылкой.\n\nВключить ли в нее логин/API ключ?';
  @override
  String shareBooruDialogMsgDesktop({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
      'Скопировать ссылку конфига ${booruName} в буфер обмена.\n\nВключить ли в нее логин/API ключ?';
  @override
  String get booruSharing => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? 'Поделиться конфигом сайта';
  @override
  String get booruSharingMsgAndroid =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ??
      'Как автоматически открывать ссылки с конфигами сайта в приложении на Android 12 и выше:\n1) Нажми на кнопку снизу чтобы открыть системные настройки ссылок по умолчанию\n2) Нажми на "Добавить ссылку" и выбери все доступные опции';
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
      'Выбранный сайт будет использоваться по умолчанию после сохранения.\n\nСайт по умолчанию будет первым в выпадающих списках';
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
  String get testBooruFailedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'Проверка сайта не удалась';
  @override
  String get testBooruFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ??
      'Данные конфига неверны, сайт не дает доступ к API, запрос не вернул данные или есть проблемы с сетью.';
  @override
  String get saveBooru => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Сохранить конфиг';
  @override
  String get runningTest => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? 'Выполнение теста...';
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
  @override
  String get booruDefTagsPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTagsPlaceholder', {}) ?? 'Поиск по умолчанию для сайта';
  @override
  String get booruDefaultInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefaultInstructions', {}) ??
      'Поля ниже могут быть обязательны для некоторых сайтов';
  @override
  String get booruConfigShouldSave =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigShouldSave', {}) ?? 'Подтверди сохранение конфига для этого сайта';
  @override
  String booruConfigSelectedType({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSelectedType', {'booruType': booruType}) ??
      'Выбранный/Обнаруженный тип сайта: ${booruType}';
}

// Path: settings.interface
class _TranslationsSettingsInterfaceRu extends TranslationsSettingsInterfaceEn {
  _TranslationsSettingsInterfaceRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? 'Интерфейс';
  @override
  String get appUIMode => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIMode', {}) ?? 'Режим интерфейса приложения';
  @override
  String get appUIModeWarningTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarningTitle', {}) ?? 'Режим интерфейса приложения';
  @override
  String get appUIModeWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarning', {}) ??
      'Использовать Компьютерный режим? Может привести к проблемам на мобильных устройствах. УСТАРЕВШЕЕ.';
  @override
  String get appUIModeHelpMobile =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpMobile', {}) ?? '- Мобильный - Обычный мобильный интерфейс';
  @override
  String get appUIModeHelpDesktop =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpDesktop', {}) ??
      '- Компьютерный - Интерфейс в стиле Ahoviewer [УСТАРЕЛ, ТРЕБУЕТ ДОРАБОТКИ]';
  @override
  String get appUIModeHelpWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpWarning', {}) ??
      '[Предупреждение]: Не устанавливай режим интерфейса на Компьютерный на телефоне, ты можешь сломать приложение и тебе придётся удалить все настройки, включая конфигурации сайтов.';
  @override
  String get handSide => TranslationOverrides.string(_root.$meta, 'settings.interface.handSide', {}) ?? 'Преобладающая рука';
  @override
  String get handSideHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.handSideHelp', {}) ??
      'Изменяет расположение некоторых элементов интерфейса в соответствии с выбранной стороной';
  @override
  String get showSearchBarInPreviewGrid =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.showSearchBarInPreviewGrid', {}) ?? 'Показывать строку поиска в сетке превью';
  @override
  String get moveInputToTopInSearchView =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.moveInputToTopInSearchView', {}) ??
      'Переместить поле ввода вверх на экране поиска';
  @override
  String get searchViewQuickActionsPanel =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewQuickActionsPanel', {}) ?? 'Панель быстрых действий на экране поиска';
  @override
  String get searchViewInputAutofocus =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewInputAutofocus', {}) ?? 'Автофокус поля ввода на экране поиска';
  @override
  String get disableVibration => TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibration', {}) ?? 'Отключить вибрацию';
  @override
  String get disableVibrationSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibrationSubtitle', {}) ??
      'Может всё ещё происходить при некоторых действиях даже при отключении';
  @override
  String get previewColumnsPortrait =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsPortrait', {}) ?? 'Столбцы превью (портрет)';
  @override
  String get previewColumnsLandscape =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsLandscape', {}) ?? 'Столбцы превью (ландшафт)';
  @override
  String get previewQuality => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQuality', {}) ?? 'Качество превью';
  @override
  String get previewQualityHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelp', {}) ?? 'Изменяет разрешение изображений в сетке превью';
  @override
  String get previewQualityHelpSample =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpSample', {}) ??
      ' - Семплы - Среднее разрешение, приложение также загрузит качество Миниатюры в качестве заполнителя, пока загружается более высокое качество';
  @override
  String get previewQualityHelpThumbnail =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpThumbnail', {}) ?? ' - Миниатюра - Низкое разрешение';
  @override
  String get previewQualityHelpNote =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpNote', {}) ??
      '[Примечание]: Качество "Семплы" может заметно снизить производительность, особенно если у тебя слишком много столбцов в сетке превью';
  @override
  String get previewDisplay => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplay', {}) ?? 'Отображение превью';
  @override
  String get previewDisplayFallback =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallback', {}) ?? 'Резервное отображение превью';
  @override
  String get previewDisplayFallbackHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallbackHelp', {}) ??
      'Это будет использоваться, когда опция Ступенчатый невозможна';
  @override
  String get dontScaleImages => TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImages', {}) ?? 'Не масштабировать изображения';
  @override
  String get dontScaleImagesSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesSubtitle', {}) ?? 'Может снизить производительность';
  @override
  String get dontScaleImagesWarningTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningTitle', {}) ?? 'Предупреждение';
  @override
  String get dontScaleImagesWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarning', {}) ??
      'Ты уверен, что хочешь отключить масштабирование изображений?';
  @override
  String get dontScaleImagesWarningMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningMsg', {}) ??
      'Это может негативно повлиять на производительность, особенно на старых устройствах';
  @override
  String get gifThumbnails => TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnails', {}) ?? 'GIF превью';
  @override
  String get gifThumbnailsRequires =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnailsRequires', {}) ?? 'Требует "Не масштабировать изображения"';
  @override
  String get scrollPreviewsButtonsPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.scrollPreviewsButtonsPosition', {}) ?? 'Позиция кнопок прокрутки превью';
  @override
  String get mouseWheelScrollModifier =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.mouseWheelScrollModifier', {}) ?? 'Модификатор прокрутки колёсиком мыши';
  @override
  String get scrollModifier => TranslationOverrides.string(_root.$meta, 'settings.interface.scrollModifier', {}) ?? 'Модификатор прокрутки';
  @override
  late final _TranslationsSettingsInterfacePreviewQualityValuesRu previewQualityValues = _TranslationsSettingsInterfacePreviewQualityValuesRu._(
    _root,
  );
  @override
  late final _TranslationsSettingsInterfacePreviewDisplayModeValuesRu previewDisplayModeValues =
      _TranslationsSettingsInterfacePreviewDisplayModeValuesRu._(_root);
  @override
  late final _TranslationsSettingsInterfaceAppModeValuesRu appModeValues = _TranslationsSettingsInterfaceAppModeValuesRu._(_root);
  @override
  late final _TranslationsSettingsInterfaceHandSideValuesRu handSideValues = _TranslationsSettingsInterfaceHandSideValuesRu._(_root);
}

// Path: settings.theme
class _TranslationsSettingsThemeRu extends TranslationsSettingsThemeEn {
  _TranslationsSettingsThemeRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? 'Темы';
  @override
  String get themeMode => TranslationOverrides.string(_root.$meta, 'settings.theme.themeMode', {}) ?? 'Режим темы';
  @override
  String get blackBg => TranslationOverrides.string(_root.$meta, 'settings.theme.blackBg', {}) ?? 'Чёрный фон';
  @override
  String get useDynamicColor => TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? 'Использовать динамический цвет';
  @override
  String get android12PlusOnly => TranslationOverrides.string(_root.$meta, 'settings.theme.android12PlusOnly', {}) ?? 'Только на Android 12+';
  @override
  String get theme => TranslationOverrides.string(_root.$meta, 'settings.theme.theme', {}) ?? 'Тема';
  @override
  String get primaryColor => TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? 'Основной цвет';
  @override
  String get secondaryColor => TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? 'Вторичный цвет';
  @override
  String get enableDrawerMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.enableDrawerMascot', {}) ?? 'Включить маскот в меню';
  @override
  String get setCustomMascot =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.setCustomMascot', {}) ?? 'Установить пользовательский маскот';
  @override
  String get removeCustomMascot =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? 'Удалить пользовательский маскот';
  @override
  String get currentMascotPath => TranslationOverrides.string(_root.$meta, 'settings.theme.currentMascotPath', {}) ?? 'Текущий путь к маскоту';
  @override
  String get system => TranslationOverrides.string(_root.$meta, 'settings.theme.system', {}) ?? 'Системная';
  @override
  String get light => TranslationOverrides.string(_root.$meta, 'settings.theme.light', {}) ?? 'Светлая';
  @override
  String get dark => TranslationOverrides.string(_root.$meta, 'settings.theme.dark', {}) ?? 'Тёмная';
  @override
  String get pink => TranslationOverrides.string(_root.$meta, 'settings.theme.pink', {}) ?? 'Розовая';
  @override
  String get purple => TranslationOverrides.string(_root.$meta, 'settings.theme.purple', {}) ?? 'Фиолетовая';
  @override
  String get blue => TranslationOverrides.string(_root.$meta, 'settings.theme.blue', {}) ?? 'Синяя';
  @override
  String get teal => TranslationOverrides.string(_root.$meta, 'settings.theme.teal', {}) ?? 'Бирюзовая';
  @override
  String get red => TranslationOverrides.string(_root.$meta, 'settings.theme.red', {}) ?? 'Красная';
  @override
  String get green => TranslationOverrides.string(_root.$meta, 'settings.theme.green', {}) ?? 'Зелёная';
  @override
  String get halloween => TranslationOverrides.string(_root.$meta, 'settings.theme.halloween', {}) ?? 'Хэллоуин';
  @override
  String get custom => TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? 'Пользовательская';
  @override
  String get selectColor => TranslationOverrides.string(_root.$meta, 'settings.theme.selectColor', {}) ?? 'Выбери цвет';
  @override
  String get selectedColor => TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColor', {}) ?? 'Выбранный цвет';
  @override
  String get selectedColorAndShades =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColorAndShades', {}) ?? 'Выбранный цвет и его оттенки';
  @override
  String get fontFamily => TranslationOverrides.string(_root.$meta, 'settings.theme.fontFamily', {}) ?? 'Шрифт';
  @override
  String get systemDefault => TranslationOverrides.string(_root.$meta, 'settings.theme.systemDefault', {}) ?? 'Системный';
  @override
  String get viewMoreFonts => TranslationOverrides.string(_root.$meta, 'settings.theme.viewMoreFonts', {}) ?? 'Посмотреть больше шрифтов';
  @override
  String get fontPreviewText =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.fontPreviewText', {}) ?? 'Съешь ещё этих мягких французских булок, да выпей же чаю';
  @override
  String get customFont => TranslationOverrides.string(_root.$meta, 'settings.theme.customFont', {}) ?? 'Свой шрифт';
  @override
  String get customFontSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.customFontSubtitle', {}) ?? 'Введи имя любого шрифта Google';
  @override
  String get fontName => TranslationOverrides.string(_root.$meta, 'settings.theme.fontName', {}) ?? 'Имя шрифта';
  @override
  String get customFontHint => TranslationOverrides.string(_root.$meta, 'settings.theme.customFontHint', {}) ?? 'Смотри шрифты на fonts.google.com';
  @override
  String get fontNotFound => TranslationOverrides.string(_root.$meta, 'settings.theme.fontNotFound', {}) ?? 'Шрифт не найден';
}

// Path: settings.viewer
class _TranslationsSettingsViewerRu extends TranslationsSettingsViewerEn {
  _TranslationsSettingsViewerRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? 'Просмотрщик';
  @override
  String get preloadAmount => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadAmount', {}) ?? 'Количество предзагрузки';
  @override
  String get preloadSizeLimit => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimit', {}) ?? 'Лимит размера предзагрузки';
  @override
  String get preloadSizeLimitSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimitSubtitle', {}) ?? 'в ГБ, 0 для отключения лимита';
  @override
  String get imageQuality => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQuality', {}) ?? 'Качество изображения';
  @override
  String get viewerScrollDirection =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerScrollDirection', {}) ?? 'Направление прокрутки просмотрщика';
  @override
  String get viewerToolbarPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerToolbarPosition', {}) ?? 'Позиция панели инструментов просмотрщика';
  @override
  String get zoomButtonPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.zoomButtonPosition', {}) ?? 'Позиция кнопки масштабирования';
  @override
  String get changePageButtonsPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.changePageButtonsPosition', {}) ?? 'Позиция кнопок смены страниц';
  @override
  String get hideToolbarWhenOpeningViewer =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.hideToolbarWhenOpeningViewer', {}) ??
      'Скрывать панель инструментов при открытии просмотрщика';
  @override
  String get expandDetailsByDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.expandDetailsByDefault', {}) ?? 'Раскрывать детали по умолчанию';
  @override
  String get hideTranslationNotesByDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.hideTranslationNotesByDefault', {}) ?? 'Скрывать заметки перевода по умолчанию';
  @override
  String get enableRotation => TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotation', {}) ?? 'Включить вращение';
  @override
  String get enableRotationSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotationSubtitle', {}) ??
      'Двойное нажатие для сброса (работает только на изображениях)';
  @override
  String get toolbarButtonsOrder =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarButtonsOrder', {}) ?? 'Порядок кнопок панели инструментов';
  @override
  String get buttonsOrder => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonsOrder', {}) ?? 'Порядок кнопок';
  @override
  String get longPressToChangeItemOrder =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToChangeItemOrder', {}) ??
      'Длительное нажатие для изменения порядка элементов.';
  @override
  String get atLeast4ButtonsVisibleOnToolbar =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.atLeast4ButtonsVisibleOnToolbar', {}) ??
      'Минимум 4 кнопки из этого списка всегда будут видны на панели инструментов.';
  @override
  String get otherButtonsWillGoIntoOverflow =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.otherButtonsWillGoIntoOverflow', {}) ??
      'Остальные кнопки перейдут в меню переполнения (три точки).';
  @override
  String get longPressToMoveItems =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToMoveItems', {}) ?? 'Длительное нажатие для перемещения элементов';
  @override
  String get onlyForVideos => TranslationOverrides.string(_root.$meta, 'settings.viewer.onlyForVideos', {}) ?? 'Только для видео';
  @override
  String get thisButtonCannotBeDisabled =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.thisButtonCannotBeDisabled', {}) ?? 'Эта кнопка не может быть отключена';
  @override
  String get defaultShareAction =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.defaultShareAction', {}) ?? 'Действие при "Поделиться" по умолчанию';
  @override
  String get shareActions => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActions', {}) ?? 'Поделиться';
  @override
  String get shareActionsAsk =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsAsk', {}) ?? '- Спросить - всегда спрашивать, как поделиться';
  @override
  String get shareActionsPostURL => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURL', {}) ?? '- Ссылка на пост';
  @override
  String get shareActionsFileURL =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFileURL', {}) ??
      '- Ссылка на файл - делиться прямой ссылкой на оригинальный файл (может не работать с некоторыми сайтами)';
  @override
  String get shareActionsPostURLFileURLFileWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURLFileURLFileWithTags', {}) ??
      '- Ссылка на пост/Ссылка на файл/Файл с тегами - делиться ссылкой/файлом и тегами, которые ты выберешь';
  @override
  String get shareActionsFile =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFile', {}) ??
      '- Файл - делиться самим файлом, может занять некоторое время для загрузки, прогресс будет показан на кнопке Поделиться';
  @override
  String get shareActionsHydrus =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsHydrus', {}) ?? '- Hydrus - отправляет ссылку поста в Hydrus для импорта';
  @override
  String get shareActionsNoteIfFileSavedInCache =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsNoteIfFileSavedInCache', {}) ??
      '[Примечание]: Если файл сохранён в кэше, он будет загружен оттуда. В противном случае он будет загружен снова из сети.';
  @override
  String get shareActionsTip =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsTip', {}) ??
      '[Совет]: Ты можешь открыть меню действий Поделиться, длительно нажав кнопку Поделиться.';
  @override
  String get useVolumeButtonsForScrolling =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.useVolumeButtonsForScrolling', {}) ?? 'Использовать кнопки громкости для прокрутки';
  @override
  String get volumeButtonsScrolling =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrolling', {}) ?? 'Прокрутка кнопками громкости';
  @override
  String get volumeButtonsScrollingHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollingHelp', {}) ??
      'Используй кнопки громкости для прокрутки превью и просмотрщика';
  @override
  String get volumeButtonsVolumeDown =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeDown', {}) ?? ' - Громкость вниз - следующий элемент';
  @override
  String get volumeButtonsVolumeUp =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeUp', {}) ?? ' - Громкость вверх - предыдущий элемент';
  @override
  String get volumeButtonsInViewer => TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsInViewer', {}) ?? 'В просмотрщике:';
  @override
  String get volumeButtonsToolbarVisible =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarVisible', {}) ??
      ' - Панель инструментов видна - управляет громкостью';
  @override
  String get volumeButtonsToolbarHidden =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarHidden', {}) ??
      ' - Панель инструментов скрыта - управляет прокруткой';
  @override
  String get volumeButtonsScrollSpeed =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollSpeed', {}) ?? 'Скорость прокрутки кнопками громкости';
  @override
  String get slideshowDurationInMs =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowDurationInMs', {}) ?? 'Длительность слайдшоу (в мс)';
  @override
  String get slideshow => TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshow', {}) ?? 'Слайдшоу';
  @override
  String get slideshowWIPNote =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowWIPNote', {}) ?? '[WIP] Видео/гифки: только прокрутка вручную';
  @override
  String get preventDeviceFromSleeping =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preventDeviceFromSleeping', {}) ?? 'Предотвратить переход устройства в спящий режим';
  @override
  String get viewerOpenCloseAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerOpenCloseAnimation', {}) ?? 'Анимация открытия/закрытия просмотрщика';
  @override
  String get viewerPageChangeAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerPageChangeAnimation', {}) ?? 'Анимация смены страниц просмотрщика';
  @override
  String get usingDefaultAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.usingDefaultAnimation', {}) ?? 'Использование анимации по умолчанию';
  @override
  String get usingCustomAnimation => TranslationOverrides.string(_root.$meta, 'settings.viewer.usingCustomAnimation', {}) ?? 'Анимация просмотрщика';
  @override
  String get kannaLoadingGif => TranslationOverrides.string(_root.$meta, 'settings.viewer.kannaLoadingGif', {}) ?? 'GIF-пасхалка во время загрузки';
  @override
  late final _TranslationsSettingsViewerImageQualityValuesRu imageQualityValues = _TranslationsSettingsViewerImageQualityValuesRu._(_root);
  @override
  late final _TranslationsSettingsViewerScrollDirectionValuesRu scrollDirectionValues = _TranslationsSettingsViewerScrollDirectionValuesRu._(_root);
  @override
  late final _TranslationsSettingsViewerToolbarPositionValuesRu toolbarPositionValues = _TranslationsSettingsViewerToolbarPositionValuesRu._(_root);
  @override
  late final _TranslationsSettingsViewerButtonPositionValuesRu buttonPositionValues = _TranslationsSettingsViewerButtonPositionValuesRu._(_root);
  @override
  late final _TranslationsSettingsViewerShareActionValuesRu shareActionValues = _TranslationsSettingsViewerShareActionValuesRu._(_root);
}

// Path: settings.video
class _TranslationsSettingsVideoRu extends TranslationsSettingsVideoEn {
  _TranslationsSettingsVideoRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? 'Видео';
  @override
  String get disableVideos => TranslationOverrides.string(_root.$meta, 'settings.video.disableVideos', {}) ?? 'Отключить видео';
  @override
  String get disableVideosHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.disableVideosHelp', {}) ??
      'Полезно на слабых устройствах, которые вылетают при попытке загрузить видео. Даёт возможность просмотреть видео во внешнем плеере или браузере.';
  @override
  String get autoplayVideos => TranslationOverrides.string(_root.$meta, 'settings.video.autoplayVideos', {}) ?? 'Автовоспроизведение видео';
  @override
  String get startVideosMuted => TranslationOverrides.string(_root.$meta, 'settings.video.startVideosMuted', {}) ?? 'Запускать видео без звука';
  @override
  String get experimental => TranslationOverrides.string(_root.$meta, 'settings.video.experimental', {}) ?? '[Экспериментально]';
  @override
  String get longTapToFastForwardVideo =>
      TranslationOverrides.string(_root.$meta, 'settings.video.longTapToFastForwardVideo', {}) ?? 'Длительное нажатие для перемотки видео';
  @override
  String get longTapToFastForwardVideoHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.longTapToFastForwardVideoHelp', {}) ??
      'Когда это включено, панель инструментов можно скрыть нажатием, когда элементы управления видео видны. [Экспериментально] Может стать поведением по умолчанию в будущем.';
  @override
  String get videoPlayerBackend => TranslationOverrides.string(_root.$meta, 'settings.video.videoPlayerBackend', {}) ?? 'Движок видеоплеера';
  @override
  String get backendDefault => TranslationOverrides.string(_root.$meta, 'settings.video.backendDefault', {}) ?? 'По умолчанию';
  @override
  String get backendMPV => TranslationOverrides.string(_root.$meta, 'settings.video.backendMPV', {}) ?? 'MPV';
  @override
  String get backendMDK => TranslationOverrides.string(_root.$meta, 'settings.video.backendMDK', {}) ?? 'MDK';
  @override
  String get backendDefaultHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendDefaultHelp', {}) ??
      'Основан на exoplayer. Имеет лучшую совместимость с устройствами, могут быть проблемы с 4K видео, некоторыми кодеками или старыми устройствами';
  @override
  String get backendMPVHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendMPVHelp', {}) ??
      'Основан на libmpv, имеет продвинутые настройки, которые могут помочь решить проблемы с некоторыми кодеками/устройствами\n[МОЖЕТ ВЫЗВАТЬ ВЫЛЕТЫ]';
  @override
  String get backendMDKHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendMDKHelp', {}) ??
      'Основан на libmdk, может иметь лучшую производительность для некоторых кодеков/устройств\n[МОЖЕТ ВЫЗВАТЬ ВЫЛЕТЫ]';
  @override
  String get mpvSettingsHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.mpvSettingsHelp', {}) ??
      'Попробуй разные значения настроек \'MPV\' ниже, если видео не работают корректно или выдают ошибки кодеков:';
  @override
  String get mpvUseHardwareAcceleration =>
      TranslationOverrides.string(_root.$meta, 'settings.video.mpvUseHardwareAcceleration', {}) ?? 'MPV: использовать аппаратное ускорение';
  @override
  String get mpvVO => TranslationOverrides.string(_root.$meta, 'settings.video.mpvVO', {}) ?? 'MPV: VO';
  @override
  String get mpvHWDEC => TranslationOverrides.string(_root.$meta, 'settings.video.mpvHWDEC', {}) ?? 'MPV: HWDEC';
  @override
  String get videoCacheMode => TranslationOverrides.string(_root.$meta, 'settings.video.videoCacheMode', {}) ?? 'Режим кэширования видео';
  @override
  late final _TranslationsSettingsVideoCacheModesRu cacheModes = _TranslationsSettingsVideoCacheModesRu._(_root);
  @override
  late final _TranslationsSettingsVideoCacheModeValuesRu cacheModeValues = _TranslationsSettingsVideoCacheModeValuesRu._(_root);
  @override
  late final _TranslationsSettingsVideoVideoBackendModeValuesRu videoBackendModeValues = _TranslationsSettingsVideoVideoBackendModeValuesRu._(_root);
}

// Path: settings.downloads
class _TranslationsSettingsDownloadsRu extends TranslationsSettingsDownloadsEn {
  _TranslationsSettingsDownloadsRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
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
  @override
  String get enableDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.enableDatabase', {}) ?? 'Включить базу данных';
  @override
  String get enableIndexing => TranslationOverrides.string(_root.$meta, 'settings.database.enableIndexing', {}) ?? 'Включить индексацию';
  @override
  String get enableSearchHistory =>
      TranslationOverrides.string(_root.$meta, 'settings.database.enableSearchHistory', {}) ?? 'Включить историю поиска';
  @override
  String get enableTagTypeFetching =>
      TranslationOverrides.string(_root.$meta, 'settings.database.enableTagTypeFetching', {}) ?? 'Включить получение типов тегов';
  @override
  String get sankakuTypeToUpdate =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuTypeToUpdate', {}) ?? 'Тип Sankaku для обновления';
  @override
  String get searchQuery => TranslationOverrides.string(_root.$meta, 'settings.database.searchQuery', {}) ?? 'Поисковый запрос';
  @override
  String get searchQueryOptional =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchQueryOptional', {}) ?? '(опционально, может замедлить процесс)';
  @override
  String get cantLeavePageNow =>
      TranslationOverrides.string(_root.$meta, 'settings.database.cantLeavePageNow', {}) ?? 'Нельзя покинуть страницу сейчас!';
  @override
  String get sankakuDataUpdating =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDataUpdating', {}) ??
      'Данные Sankaku обновляются, подожди, пока это закончится, или отмени вручную внизу страницы';
  @override
  String get pleaseWaitTitle => TranslationOverrides.string(_root.$meta, 'settings.database.pleaseWaitTitle', {}) ?? 'Пожалуйста, подожди!';
  @override
  String get indexesBeingChanged => TranslationOverrides.string(_root.$meta, 'settings.database.indexesBeingChanged', {}) ?? 'Индексы изменяются';
  @override
  String get databaseInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfo', {}) ?? 'Хранит избранные и скачанные элементы';
  @override
  String get databaseInfoSnatch =>
      TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfoSnatch', {}) ?? 'Уже скачанные элементы не будут скачаны заново';
  @override
  String get indexingInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.indexingInfo', {}) ??
      'Ускоряет поиск по базе данных, но занимает больше места на диске (до 2 раз).\n\nНе закрывай приложение или этот экран, пока идет индексация.';
  @override
  String get createIndexesDebug =>
      TranslationOverrides.string(_root.$meta, 'settings.database.createIndexesDebug', {}) ?? 'Создать индексы [Отладка]';
  @override
  String get dropIndexesDebug => TranslationOverrides.string(_root.$meta, 'settings.database.dropIndexesDebug', {}) ?? 'Удалить индексы [Отладка]';
  @override
  String get searchHistoryInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryInfo', {}) ?? 'Требует включения базы данных.';
  @override
  String searchHistoryRecords({required int limit}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryRecords', {'limit': limit}) ?? 'Сохраняет последние ${limit} поисков.';
  @override
  String get searchHistoryTapInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryTapInfo', {}) ??
      'Нажми на элемент для действий (Удалить, В избранное...)';
  @override
  String get searchHistoryFavouritesInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryFavouritesInfo', {}) ??
      'Избранные запросы закреплены вверху списка и не будут учитываться в лимите.';
  @override
  String get tagTypeFetchingInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingInfo', {}) ??
      'Подтягивает информацию о типах тегов с поддерживаемых сайтов';
  @override
  String get tagTypeFetchingWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingWarning', {}) ?? 'Может привести к ограничению запросов';
  @override
  String get deleteDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabase', {}) ?? 'Удалить базу данных';
  @override
  String get deleteDatabaseConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabaseConfirm', {}) ?? 'Удалить базу данных?';
  @override
  String get databaseDeleted => TranslationOverrides.string(_root.$meta, 'settings.database.databaseDeleted', {}) ?? 'База данных удалена!';
  @override
  String get appRestartRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.database.appRestartRequired', {}) ?? 'Требуется перезапуск приложения!';
  @override
  String get clearSnatchedItems =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearSnatchedItems', {}) ?? 'Очистить загруженные элементы';
  @override
  String get clearAllSnatchedConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearAllSnatchedConfirm', {}) ?? 'Очистить все загруженные элементы?';
  @override
  String get snatchedItemsCleared =>
      TranslationOverrides.string(_root.$meta, 'settings.database.snatchedItemsCleared', {}) ?? 'Скачанные элементы очищены';
  @override
  String get appRestartMayBeRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.database.appRestartMayBeRequired', {}) ?? 'Может потребоваться перезапуск приложения!';
  @override
  String get clearFavouritedItems =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearFavouritedItems', {}) ?? 'Очистить избранные элементы';
  @override
  String get clearAllFavouritedConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearAllFavouritedConfirm', {}) ?? 'Очистить все избранные элементы?';
  @override
  String get favouritesCleared => TranslationOverrides.string(_root.$meta, 'settings.database.favouritesCleared', {}) ?? 'Избранное очищено';
  @override
  String get clearSearchHistory => TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistory', {}) ?? 'Очистить историю поиска';
  @override
  String get clearSearchHistoryConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistoryConfirm', {}) ?? 'Очистить историю поиска?';
  @override
  String get searchHistoryCleared =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryCleared', {}) ?? 'История поиска очищена';
  @override
  String get sankakuFavouritesUpdate =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdate', {}) ?? 'Обновление избранного из Sankaku';
  @override
  String get sankakuFavouritesUpdateStarted =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateStarted', {}) ?? 'Обновление избранного из Sankaku начато';
  @override
  String get sankakuNewUrlsInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuNewUrlsInfo', {}) ??
      'Новые ссылки изображений будут получены для элементов из Sankaku в твоем избранном';
  @override
  String get sankakuDontLeavePage =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDontLeavePage', {}) ??
      'Не покидай эту страницу, пока процесс не завершится или не будет остановлен';
  @override
  String get noSankakuConfigFound =>
      TranslationOverrides.string(_root.$meta, 'settings.database.noSankakuConfigFound', {}) ?? 'Конфигурация Sankaku не найдена!';
  @override
  String get sankakuFavouritesUpdateComplete =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateComplete', {}) ??
      'Обновление избранного из Sankaku завершено';
  @override
  String get failedItemsPurgeStartedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeStartedTitle', {}) ?? 'Начата очистка неудачных элементов';
  @override
  String get failedItemsPurgeInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeInfo', {}) ??
      'Элементы, которые не удалось обновить, будут удалены из базы данных';
  @override
  String get updateSankakuUrls => TranslationOverrides.string(_root.$meta, 'settings.database.updateSankakuUrls', {}) ?? 'Обновить ссылки из Sankaku';
  @override
  String updating({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.updating', {'count': count}) ?? 'Обновление ${count} элементов:';
  @override
  String left({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.left', {'count': count}) ?? 'Осталось: ${count}';
  @override
  String done({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.done', {'count': count}) ?? 'Готово: ${count}';
  @override
  String failedSkipped({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedSkipped', {'count': count}) ?? 'Неудачно/Пропущено: ${count}';
  @override
  String get sankakuRateLimitWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuRateLimitWarning', {}) ??
      'Остановись и попробуй позже, если ты начнёшь видеть, что число \'Неудачно\' постоянно растёт, возможно, ты достиг лимита запросов и/или Sankaku блокирует запросы с твоего IP.';
  @override
  String get skipCurrentItem =>
      TranslationOverrides.string(_root.$meta, 'settings.database.skipCurrentItem', {}) ?? 'Нажми здесь, чтобы пропустить текущий элемент';
  @override
  String get useIfStuck => TranslationOverrides.string(_root.$meta, 'settings.database.useIfStuck', {}) ?? 'Используй, если элемент завис';
  @override
  String get pressToStop => TranslationOverrides.string(_root.$meta, 'settings.database.pressToStop', {}) ?? 'Нажми здесь, чтобы остановить';
  @override
  String purgeFailedItems({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.purgeFailedItems', {'count': count}) ?? 'Очистить неудачные элементы (${count})';
  @override
  String retryFailedItems({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.retryFailedItems', {'count': count}) ?? 'Повторить неудачные элементы (${count})';
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
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ?? 'Файлы должны быть в корне папки';
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
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ?? 'База данных сохранена в store.db';
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
  @override
  String get enableSelfSignedSSLCertificates =>
      TranslationOverrides.string(_root.$meta, 'settings.network.enableSelfSignedSSLCertificates', {}) ?? 'Разрешить самоподписанные SSL сертификаты';
  @override
  String get proxy => TranslationOverrides.string(_root.$meta, 'settings.network.proxy', {}) ?? 'Прокси';
  @override
  String get proxySubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.network.proxySubtitle', {}) ??
      'Не применяется к режиму потокового видео, используй вместо него режим кэширования видео';
  @override
  String get customUserAgent => TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgent', {}) ?? 'Пользовательский user agent';
  @override
  String get customUserAgentTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgentTitle', {}) ?? 'Пользовательский user agent';
  @override
  String get keepEmptyForDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.network.keepEmptyForDefault', {}) ?? 'Оставь пустым для использования значения по умолчанию';
  @override
  String defaultUserAgent({required String agent}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.defaultUserAgent', {'agent': agent}) ?? 'По умолчанию: ${agent}';
  @override
  String get userAgentUsedOnRequests =>
      TranslationOverrides.string(_root.$meta, 'settings.network.userAgentUsedOnRequests', {}) ??
      'Используется для большинства запросов к сайтам и вебвью';
  @override
  String get valueSavedAfterLeaving =>
      TranslationOverrides.string(_root.$meta, 'settings.network.valueSavedAfterLeaving', {}) ?? 'Сохраняется при закрытии страницы';
  @override
  String get setBrowserUserAgent =>
      TranslationOverrides.string(_root.$meta, 'settings.network.setBrowserUserAgent', {}) ??
      'Нажми здесь, чтобы установить рекомендуемый user agent браузера (рекомендуется только когда сайты, которые ты используешь, банят небраузерные user agent):';
  @override
  String get cookieCleaner => TranslationOverrides.string(_root.$meta, 'settings.network.cookieCleaner', {}) ?? 'Очистка куки';
  @override
  String get booru => TranslationOverrides.string(_root.$meta, 'settings.network.booru', {}) ?? 'Сайт';
  @override
  String get selectBooruToClearCookies =>
      TranslationOverrides.string(_root.$meta, 'settings.network.selectBooruToClearCookies', {}) ??
      'Выбери сайт для очистки куки или оставь пустым для очистки всех';
  @override
  String cookiesFor({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookiesFor', {'booruName': booruName}) ?? 'Куки для ${booruName}:';
  @override
  String cookieDeleted({required String cookieName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookieDeleted', {'cookieName': cookieName}) ?? 'Куки "${cookieName}" удалено';
  @override
  String get clearCookies => TranslationOverrides.string(_root.$meta, 'settings.network.clearCookies', {}) ?? 'Очистить куки';
  @override
  String clearCookiesFor({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.clearCookiesFor', {'booruName': booruName}) ?? 'Очистить куки для ${booruName}';
  @override
  String cookiesForBooruDeleted({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookiesForBooruDeleted', {'booruName': booruName}) ??
      'Куки для ${booruName} удалены';
  @override
  String get allCookiesDeleted => TranslationOverrides.string(_root.$meta, 'settings.network.allCookiesDeleted', {}) ?? 'Все куки удалены';
}

// Path: settings.privacy
class _TranslationsSettingsPrivacyRu extends TranslationsSettingsPrivacyEn {
  _TranslationsSettingsPrivacyRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? 'Приватность';
  @override
  String get appLock => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? 'Блокировка приложения';
  @override
  String get appLockMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ??
      'Заблокировать приложение вручную или после бездействия. Требует ПИН-код/биометрию';
  @override
  String get autoLockAfter => TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfter', {}) ?? 'Автоблокировка после';
  @override
  String get autoLockAfterTip => TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfterTip', {}) ?? 'в секундах, 0 для отключения';
  @override
  String get bluronLeave =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeave', {}) ?? 'Размывать экран при выходе из приложения';
  @override
  String get bluronLeaveMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeaveMsg', {}) ??
      'Может не работать на некоторых устройствах из-за системных ограничений';
  @override
  String get incognitoKeyboard => TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboard', {}) ?? 'Режим инкогнито клавиатуры';
  @override
  String get incognitoKeyboardMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboardMsg', {}) ??
      'Запрещает клавиатуре сохранять историю ввода.\nПрименяется к большинству текстовых полей ввода';
  @override
  String get appDisplayName => TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayName', {}) ?? 'Название приложения';
  @override
  String get appDisplayNameDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayNameDescription', {}) ??
      'Изменит название приложения в системном лаунчере';
  @override
  String get appAliasChanged => TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChanged', {}) ?? 'Название приложения изменено';
  @override
  String get appAliasRestartHint =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasRestartHint', {}) ??
      'Изменение названия приложения вступит в силу после перезапуска приложения. Некоторым лаунчерам может потребоваться некоторое время или перезапуск системы для обновления.';
  @override
  String get appAliasChangeFailed =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChangeFailed', {}) ??
      'Не удалось изменить название приложения. Пожалуйста, попробуй снова.';
  @override
  String get restartNow => TranslationOverrides.string(_root.$meta, 'settings.privacy.restartNow', {}) ?? 'Перезапустить сейчас';
}

// Path: settings.performance
class _TranslationsSettingsPerformanceRu extends TranslationsSettingsPerformanceEn {
  _TranslationsSettingsPerformanceRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.performance.title', {}) ?? 'Производительность';
  @override
  String get lowPerformanceMode =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceMode', {}) ?? 'Режим низкой производительности';
  @override
  String get lowPerformanceModeSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeSubtitle', {}) ??
      'Рекомендуется для старых устройств и устройств с низким объёмом оперативной памяти';
  @override
  String get lowPerformanceModeDialogTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogTitle', {}) ?? 'Режим низкой производительности';
  @override
  String get lowPerformanceModeDialogDisablesDetailed =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesDetailed', {}) ??
      '- Отключает подробную информацию о прогрессе загрузки';
  @override
  String get lowPerformanceModeDialogDisablesResourceIntensive =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive', {}) ??
      '- Отключает ресурсоёмкие элементы (размытие, анимированная прозрачность, некоторые анимации...)';
  @override
  String get lowPerformanceModeDialogSetsOptimal =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogSetsOptimal', {}) ??
      '- Устанавливает оптимальные настройки для этих опций (ты можешь потом изменить их отдельно):';
  @override
  String get lowPerformanceModeDialogPreviewQuality =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogPreviewQuality', {}) ??
      '   - Качество предпросмотра [Миниатюра]';
  @override
  String get lowPerformanceModeDialogImageQuality =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogImageQuality', {}) ??
      '   - Качество изображения [Семпл]';
  @override
  String get lowPerformanceModeDialogPreviewColumns =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogPreviewColumns', {}) ??
      '   - Столбцы превью [2 - портрет, 4 - ландшафт]';
  @override
  String get lowPerformanceModeDialogPreloadAmount =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogPreloadAmount', {}) ??
      '   - Количество и лимит предзагрузки [0, 0.2]';
  @override
  String get lowPerformanceModeDialogVideoAutoplay =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogVideoAutoplay', {}) ??
      '   - Автовоспроизведение видео [отключено]';
  @override
  String get lowPerformanceModeDialogDontScaleImages =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDontScaleImages', {}) ??
      '   - Не масштабировать изображения [отключено]';
  @override
  String get previewQuality => TranslationOverrides.string(_root.$meta, 'settings.performance.previewQuality', {}) ?? 'Качество превью';
  @override
  String get imageQuality => TranslationOverrides.string(_root.$meta, 'settings.performance.imageQuality', {}) ?? 'Качество изображения';
  @override
  String get previewColumnsPortrait =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.previewColumnsPortrait', {}) ?? 'Столбцы превью (портрет)';
  @override
  String get previewColumnsLandscape =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.previewColumnsLandscape', {}) ?? 'Столбцы превью (ландшафт)';
  @override
  String get preloadAmount => TranslationOverrides.string(_root.$meta, 'settings.performance.preloadAmount', {}) ?? 'Количество предзагрузки';
  @override
  String get preloadSizeLimit =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.preloadSizeLimit', {}) ?? 'Лимит размера предзагрузки';
  @override
  String get preloadSizeLimitSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.preloadSizeLimitSubtitle', {}) ?? 'в ГБ, 0 чтобы убрать лимит';
  @override
  String get dontScaleImages =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.dontScaleImages', {}) ?? 'Не масштабировать изображения';
  @override
  String get dontScaleImagesSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.dontScaleImagesSubtitle', {}) ??
      'Отключает масштабирование изображений, которое используется для улучшения производительности';
  @override
  String get dontScaleImagesWarningTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.dontScaleImagesWarningTitle', {}) ?? 'Предупреждение';
  @override
  String get dontScaleImagesWarningMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.dontScaleImagesWarningMsg', {}) ??
      'Ты уверен, что хочешь отключить масштабирование изображений?';
  @override
  String get dontScaleImagesWarningPerformance =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.dontScaleImagesWarningPerformance', {}) ??
      'Это может негативно повлиять на производительность, особенно на старых устройствах';
  @override
  String get autoplayVideos => TranslationOverrides.string(_root.$meta, 'settings.performance.autoplayVideos', {}) ?? 'Автовоспроизведение видео';
  @override
  String get disableVideos => TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideos', {}) ?? 'Отключить видео';
  @override
  String get disableVideosHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideosHelp', {}) ??
      'Полезно на слабых устройствах, которые вылетают при попытке загрузить видео. Даёт возможность просмотреть видео во внешнем плеере или браузере.';
}

// Path: settings.cache
class _TranslationsSettingsCacheRu extends TranslationsSettingsCacheEn {
  _TranslationsSettingsCacheRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? 'Кэш';
  @override
  String get snatchQuality => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchQuality', {}) ?? 'Качество сохраненных';
  @override
  String get snatchCooldown => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchCooldown', {}) ?? 'Задержка между загрузками (в мс)';
  @override
  String get pleaseEnterAValidTimeout =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.pleaseEnterAValidTimeout', {}) ??
      'Пожалуйста, введи корректное значение времени ожидания';
  @override
  String get biggerThan10 => TranslationOverrides.string(_root.$meta, 'settings.cache.biggerThan10', {}) ?? 'Пожалуйста, введи значение больше 10мс';
  @override
  String get showDownloadNotifications =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.showDownloadNotifications', {}) ?? 'Показывать уведомления о загрузке';
  @override
  String get snatchItemsOnFavouriting =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.snatchItemsOnFavouriting', {}) ?? 'Скачивать при добавлении в избранное';
  @override
  String get favouriteItemsOnSnatching =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.favouriteItemsOnSnatching', {}) ?? 'Добавлять в избранное при сохранении';
  @override
  String get writeImageDataOnSave =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.writeImageDataOnSave', {}) ?? 'Записывать данные в JSON при сохранении';
  @override
  String get requiresCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.requiresCustomStorageDirectory', {}) ?? 'Необходимо настроить пользовательскую папку';
  @override
  String get setStorageDirectory => TranslationOverrides.string(_root.$meta, 'settings.cache.setStorageDirectory', {}) ?? 'Назначить папку хранилища';
  @override
  String currentPath({required String path}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.currentPath', {'path': path}) ?? 'Текущая: ${path}';
  @override
  String get resetStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.resetStorageDirectory', {}) ?? 'Сбросить папку хранилища';
  @override
  String get cachePreviews => TranslationOverrides.string(_root.$meta, 'settings.cache.cachePreviews', {}) ?? 'Кэшировать превью';
  @override
  String get cacheMedia => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheMedia', {}) ?? 'Кэшировать медиа';
  @override
  String get videoCacheMode => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheMode', {}) ?? 'Режим кэширования видео';
  @override
  String get videoCacheModesTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModesTitle', {}) ?? 'Режимы кэширования видео';
  @override
  String get videoCacheModeStream =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStream', {}) ??
      '- Потоковый - Не кэшировать, начать воспроизведение как можно скорее';
  @override
  String get videoCacheModeCache =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeCache', {}) ??
      '- Кэш - Сохраняет файл в хранилище устройства, воспроизводит только когда загрузка завершена';
  @override
  String get videoCacheModeStreamCache =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStreamCache', {}) ??
      '- Потоковый+Кэш - Смешанный режим, но в данный момент приводит к двойной загрузке';
  @override
  String get videoCacheNoteEnable =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheNoteEnable', {}) ??
      '[Примечание]: Видео будут кэшироваться только если включено \'Кэшировать медиа\'.';
  @override
  String get videoCacheWarningDesktop =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheWarningDesktop', {}) ??
      '[Предупреждение]: На компьютерах потоковый режим может работать некорректно для некоторых сайтов.';
  @override
  String get deleteCacheAfter => TranslationOverrides.string(_root.$meta, 'settings.cache.deleteCacheAfter', {}) ?? 'Удалять кэш после:';
  @override
  String get cacheSizeLimit => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheSizeLimit', {}) ?? 'Лимит размера кэша (в ГБ)';
  @override
  String get maximumTotalCacheSize =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.maximumTotalCacheSize', {}) ?? 'Максимальный общий размер кэша';
  @override
  String get cacheStats => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheStats', {}) ?? 'Статистика кэша:';
  @override
  String get loading => TranslationOverrides.string(_root.$meta, 'settings.cache.loading', {}) ?? 'Загрузка...';
  @override
  String get empty => TranslationOverrides.string(_root.$meta, 'settings.cache.empty', {}) ?? 'Пусто';
  @override
  String inFilesPlural({required String size, required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.inFilesPlural', {'size': size, 'count': count}) ?? '${size}, ${count} файлов';
  @override
  String inFileSingular({required String size}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.inFileSingular', {'size': size}) ?? '${size}, 1 файл';
  @override
  String get cacheTypeTotal => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeTotal', {}) ?? 'Всего';
  @override
  String get cacheTypeFavicons => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeFavicons', {}) ?? 'Иконки сайтов';
  @override
  String get cacheTypeThumbnails => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeThumbnails', {}) ?? 'Превью';
  @override
  String get cacheTypeSamples => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeSamples', {}) ?? 'Семплы';
  @override
  String get cacheTypeMedia => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeMedia', {}) ?? 'Медиа';
  @override
  String get cacheTypeWebView => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeWebView', {}) ?? 'Вебвью';
  @override
  String get cacheCleared => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheCleared', {}) ?? 'Кэш очищен';
  @override
  String clearedCacheType({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheType', {'type': type}) ?? 'Очищен кэш ${type}';
  @override
  String get clearAllCache => TranslationOverrides.string(_root.$meta, 'settings.cache.clearAllCache', {}) ?? 'Очистить весь кэш';
  @override
  String get clearedCacheCompletely =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheCompletely', {}) ?? 'Кэш полностью очищен';
  @override
  String get appRestartRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.appRestartRequired', {}) ?? 'Может потребоваться перезапуск приложения!';
  @override
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'settings.cache.errorExclamation', {}) ?? 'Ошибка!';
  @override
  String get notAvailableForPlatform =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.notAvailableForPlatform', {}) ?? 'В данный момент недоступно для этой платформы';
}

// Path: settings.tagsFilters
class _TranslationsSettingsTagsFiltersRu extends TranslationsSettingsTagsFiltersEn {
  _TranslationsSettingsTagsFiltersRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.title', {}) ?? 'Фильтры тегов';
  @override
  String get hated => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.hated', {}) ?? 'Ненавистные';
  @override
  String get loved => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.loved', {}) ?? 'Любимые';
  @override
  String get duplicateTag => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.duplicateTag', {}) ?? 'Дублирующийся тег';
  @override
  String alreadyInList({required String tag, required String type}) =>
      TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.alreadyInList', {'tag': tag, 'type': type}) ??
      '\'${tag}\' уже есть в списке ${type}';
  @override
  String get noFiltersFound => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.noFiltersFound', {}) ?? 'Фильтры не найдены';
  @override
  String get noFiltersAdded => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.noFiltersAdded', {}) ?? 'Нет фильтров';
  @override
  String get removeHated =>
      TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.removeHated', {}) ?? 'Скрывать элементы с ненавистными тегами';
  @override
  String get removeFavourited =>
      TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.removeFavourited', {}) ?? 'Скрывать избранные элементы';
  @override
  String get removeSnatched => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.removeSnatched', {}) ?? 'Скрывать скачанные элементы';
  @override
  String get removeAI => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.removeAI', {}) ?? 'Скрывать элементы с ИИ тегами';
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
  @override
  String get errorTitle => TranslationOverrides.string(_root.$meta, 'settings.sync.errorTitle', {}) ?? 'Ошибка!';
  @override
  String get pleaseEnterIPAndPort =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.pleaseEnterIPAndPort', {}) ?? 'Пожалуйста, введи IP адрес и порт.';
  @override
  String get selectWhatYouWantToDo =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.selectWhatYouWantToDo', {}) ?? 'Выбери, что ты хочешь сделать';
  @override
  String get sendDataToDevice =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.sendDataToDevice', {}) ?? 'ОТПРАВИТЬ данные НА другое устройство';
  @override
  String get receiveDataFromDevice =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.receiveDataFromDevice', {}) ?? 'ПОЛУЧИТЬ данные С другого устройства';
  @override
  String get senderInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.senderInstructions', {}) ??
      'Запусти сервер на другом устройстве, введи его IP/порт, затем нажми Начать синхронизацию';
  @override
  String get ipAddress => TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddress', {}) ?? 'IP адрес';
  @override
  String get ipAddressPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddressPlaceholder', {}) ?? 'IP адрес хоста (например 192.168.1.1)';
  @override
  String get port => TranslationOverrides.string(_root.$meta, 'settings.sync.port', {}) ?? 'Порт';
  @override
  String get portPlaceholder => TranslationOverrides.string(_root.$meta, 'settings.sync.portPlaceholder', {}) ?? 'Порт хоста (например 7777)';
  @override
  String get sendFavourites => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavourites', {}) ?? 'Отправить избранное';
  @override
  String favouritesCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.favouritesCount', {'count': count}) ?? 'Избранное: ${count}';
  @override
  String get sendFavouritesLegacy =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavouritesLegacy', {}) ?? 'Отправить избранное (Устаревшее)';
  @override
  String get syncFavsFrom => TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFrom', {}) ?? 'Синхронизировать избранное с #...';
  @override
  String get syncFavsFromHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText1', {}) ??
      'Позволяет установить, с какого места должна начаться синхронизация, полезно, если ты уже синхронизировал всё избранное ранее и хочешь синхронизировать только новейшие элементы';
  @override
  String get syncFavsFromHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText2', {}) ??
      'Если ты хочешь синхронизировать с начала, оставь это поле пустым';
  @override
  String get syncFavsFromHelpText3 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText3', {}) ??
      'Пример: У тебя есть X элементов в избранном, введи в это поле 100, синхронизация начнётся с элемента #100 и будет продолжаться, пока не достигнет X';
  @override
  String get syncFavsFromHelpText4 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText4', {}) ?? 'Порядок избранного: От старого (0) к новому (X)';
  @override
  String get sendSnatchedHistory => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSnatchedHistory', {}) ?? 'Отправить историю загрузок';
  @override
  String snatchedCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.snatchedCount', {'count': count}) ?? 'Скачанное: ${count}';
  @override
  String get syncSnatchedFrom =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFrom', {}) ?? 'Синхронизировать скачанное с #...';
  @override
  String get syncSnatchedFromHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText1', {}) ??
      'Позволяет установить, с какого места должна начаться синхронизация, полезно, если ты уже синхронизировал всю историю загрузок ранее и хочешь синхронизировать только новейшие элементы';
  @override
  String get syncSnatchedFromHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText2', {}) ??
      'Если ты хочешь синхронизировать с начала, оставь это поле пустым';
  @override
  String get syncSnatchedFromHelpText3 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText3', {}) ??
      'Пример: У тебя есть X скачанных элементов, введи в это поле 100, синхронизация начнётся с элемента #100 и будет продолжаться, пока не достигнет X';
  @override
  String get syncSnatchedFromHelpText4 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText4', {}) ?? 'Порядок скачанного: От старого (0) к новому (X)';
  @override
  String get sendSettings => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSettings', {}) ?? 'Отправить настройки';
  @override
  String get sendBooruConfigs => TranslationOverrides.string(_root.$meta, 'settings.sync.sendBooruConfigs', {}) ?? 'Отправить конфигурации сайтов';
  @override
  String configsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.configsCount', {'count': count}) ?? 'Сайты: ${count}';
  @override
  String get sendTabs => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTabs', {}) ?? 'Отправить вкладки';
  @override
  String tabsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsCount', {'count': count}) ?? 'Вкладки: ${count}';
  @override
  String get tabsSyncMode => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncMode', {}) ?? 'Режим синхронизации вкладок';
  @override
  String get tabsSyncModeMerge =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeMerge', {}) ??
      'Объединить: Объединить вкладки с этого устройства на другом устройстве, вкладки с неизвестными сайтами и уже существующие вкладки будут проигнорированы';
  @override
  String get tabsSyncModeReplace =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeReplace', {}) ??
      'Заменить: Полностью заменить вкладки на другом устройстве вкладками с этого устройства';
  @override
  String get merge => TranslationOverrides.string(_root.$meta, 'settings.sync.merge', {}) ?? 'Объединить';
  @override
  String get replace => TranslationOverrides.string(_root.$meta, 'settings.sync.replace', {}) ?? 'Заменить';
  @override
  String get sendTags => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTags', {}) ?? 'Отправить теги';
  @override
  String tagsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsCount', {'count': count}) ?? 'Теги: ${count}';
  @override
  String get tagsSyncMode => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncMode', {}) ?? 'Режим синхронизации тегов';
  @override
  String get tagsSyncModePreferTypeIfNone =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModePreferTypeIfNone', {}) ??
      'Сохранять тип: Если тег существует с типом тега на другом устройстве, а на этом устройстве нет, он будет пропущен';
  @override
  String get tagsSyncModeOverwrite =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModeOverwrite', {}) ??
      'Перезаписать: Все теги будут добавлены, если тег и тип тега существуют на другом устройстве, они будут перезаписаны';
  @override
  String get preferTypeIfNone => TranslationOverrides.string(_root.$meta, 'settings.sync.preferTypeIfNone', {}) ?? 'Сохранять тип';
  @override
  String get overwrite => TranslationOverrides.string(_root.$meta, 'settings.sync.overwrite', {}) ?? 'Перезаписать';
  @override
  String get testConnection => TranslationOverrides.string(_root.$meta, 'settings.sync.testConnection', {}) ?? 'Проверить соединение';
  @override
  String get testConnectionHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText1', {}) ?? 'Отправляет тестовый запрос на другое устройство.';
  @override
  String get testConnectionHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText2', {}) ?? 'Показывает успех/провал уведомлением.';
  @override
  String get startSync => TranslationOverrides.string(_root.$meta, 'settings.sync.startSync', {}) ?? 'Начать синхронизацию';
  @override
  String get portAndIPCannotBeEmpty =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.portAndIPCannotBeEmpty', {}) ?? 'Поля Порт и IP не могут быть пустыми!';
  @override
  String get nothingSelectedToSync =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.nothingSelectedToSync', {}) ?? 'Ты не выбрал ничего для синхронизации!';
  @override
  String get statsOfThisDevice => TranslationOverrides.string(_root.$meta, 'settings.sync.statsOfThisDevice', {}) ?? 'Статистика этого устройства:';
  @override
  String get receiverInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.receiverInstructions', {}) ??
      'Запусти сервер для получения данных. Избегай публичных сетей в целях безопасности';
  @override
  String get availableNetworkInterfaces =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.availableNetworkInterfaces', {}) ?? 'Доступные сетевые интерфейсы';
  @override
  String selectedInterfaceIP({required String ip}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.selectedInterfaceIP', {'ip': ip}) ?? 'IP выбранного интерфейса: ${ip}';
  @override
  String get serverPort => TranslationOverrides.string(_root.$meta, 'settings.sync.serverPort', {}) ?? 'Порт сервера';
  @override
  String get serverPortPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.serverPortPlaceholder', {}) ?? '(по умолчанию \'8080\', если поле пусто)';
  @override
  String get startReceiverServer =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.startReceiverServer', {}) ?? 'Запустить сервер получателя';
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
  String get whatsNew => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.whatsNew', {}) ?? 'Что нового';
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
  String get visitReleases => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? 'Перейти к релизам';
}

// Path: settings.logs
class _TranslationsSettingsLogsRu extends TranslationsSettingsLogsEn {
  _TranslationsSettingsLogsRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.logs.title', {}) ?? 'Логи';
  @override
  String get shareLogs => TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogs', {}) ?? 'Поделиться логами';
  @override
  String get shareLogsWarningTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningTitle', {}) ?? 'Отправить логи в стороннее приложение?';
  @override
  String get shareLogsWarningMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningMsg', {}) ??
      '[ПРЕДУПРЕЖДЕНИЕ]: Логи могут содержать чувствительную информацию, делитесь с осторожностью!';
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
  String get showPerformanceGraph =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.showPerformanceGraph', {}) ?? 'Показывать график производительности';
  @override
  String get showFPSGraph => TranslationOverrides.string(_root.$meta, 'settings.debug.showFPSGraph', {}) ?? 'Показывать график FPS';
  @override
  String get showImageStats => TranslationOverrides.string(_root.$meta, 'settings.debug.showImageStats', {}) ?? 'Показывать статистику изображений';
  @override
  String get showVideoStats => TranslationOverrides.string(_root.$meta, 'settings.debug.showVideoStats', {}) ?? 'Показывать статистику видео';
  @override
  String get blurImagesAndMuteVideosDevOnly =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.blurImagesAndMuteVideosDevOnly', {}) ??
      'Размывать изображения + отключать звук видео [только для разработчиков]';
  @override
  String get enableDragScrollOnListsDesktopOnly =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.enableDragScrollOnListsDesktopOnly', {}) ??
      'Включить прокрутку перетаскиванием в списках [только для компьютеров]';
  @override
  String animationSpeed({required double speed}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.animationSpeed', {'speed': speed}) ?? 'Скорость анимации (${speed})';
  @override
  String get tagsManager => TranslationOverrides.string(_root.$meta, 'settings.debug.tagsManager', {}) ?? 'Менеджер тегов';
  @override
  String get vibration => TranslationOverrides.string(_root.$meta, 'settings.debug.vibration', {}) ?? 'Вибрация';
  @override
  String get vibrationTests => TranslationOverrides.string(_root.$meta, 'settings.debug.vibrationTests', {}) ?? 'Тесты вибрации';
  @override
  String get duration => TranslationOverrides.string(_root.$meta, 'settings.debug.duration', {}) ?? 'Длительность';
  @override
  String get amplitude => TranslationOverrides.string(_root.$meta, 'settings.debug.amplitude', {}) ?? 'Амплитуда';
  @override
  String get flutterway => TranslationOverrides.string(_root.$meta, 'settings.debug.flutterway', {}) ?? 'Flutterway';
  @override
  String get vibrate => TranslationOverrides.string(_root.$meta, 'settings.debug.vibrate', {}) ?? 'Вибрировать';
  @override
  String resolution({required String width, required String height}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.resolution', {'width': width, 'height': height}) ?? 'Разрешение: ${width}x${height}';
  @override
  String pixelRatio({required String ratio}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.pixelRatio', {'ratio': ratio}) ?? 'Соотношение пикселей: ${ratio}';
  @override
  String get logger => TranslationOverrides.string(_root.$meta, 'settings.debug.logger', {}) ?? 'Логгер';
  @override
  String get webview => TranslationOverrides.string(_root.$meta, 'settings.debug.webview', {}) ?? 'Вебвью';
  @override
  String get deleteAllCookies => TranslationOverrides.string(_root.$meta, 'settings.debug.deleteAllCookies', {}) ?? 'Удалить все куки';
  @override
  String get clearSecureStorage =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.clearSecureStorage', {}) ?? 'Очистить защищённое хранилище';
  @override
  String get getSessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.getSessionString', {}) ?? 'Получить строку сессии';
  @override
  String get setSessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.setSessionString', {}) ?? 'Установить строку сессии';
  @override
  String get sessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.sessionString', {}) ?? 'Строка сессии';
  @override
  String get restoredSessionFromString =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.restoredSessionFromString', {}) ?? 'Сессия восстановлена из строки';
}

// Path: settings.logging
class _TranslationsSettingsLoggingRu extends TranslationsSettingsLoggingEn {
  _TranslationsSettingsLoggingRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get logger => TranslationOverrides.string(_root.$meta, 'settings.logging.logger', {}) ?? 'Логгер';
}

// Path: settings.webview
class _TranslationsSettingsWebviewRu extends TranslationsSettingsWebviewEn {
  _TranslationsSettingsWebviewRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get openWebview => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? 'Открыть вебвью';
  @override
  String get openWebviewTip =>
      TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? 'чтобы залогиниться или получить куки';
}

// Path: settings.dirPicker
class _TranslationsSettingsDirPickerRu extends TranslationsSettingsDirPickerEn {
  _TranslationsSettingsDirPickerRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get directoryName => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryName', {}) ?? 'Имя папки';
  @override
  String get selectADirectory => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.selectADirectory', {}) ?? 'Выбери папку';
  @override
  String get closeWithoutChoosing =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.closeWithoutChoosing', {}) ?? 'Ты хочешь закрыть выбор папки без выбора?';
  @override
  String get no => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.no', {}) ?? 'Нет';
  @override
  String get yes => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.yes', {}) ?? 'Да';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.error', {}) ?? 'Ошибка!';
  @override
  String get failedToCreateDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.failedToCreateDirectory', {}) ?? 'Не удалось создать папку';
  @override
  String get directoryNotWritable =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryNotWritable', {}) ?? 'Папка недоступна для записи!';
  @override
  String get newDirectory => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.newDirectory', {}) ?? 'Новая папка';
  @override
  String get create => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.create', {}) ?? 'Создать';
}

// Path: viewer.tutorial
class _TranslationsViewerTutorialRu extends TranslationsViewerTutorialEn {
  _TranslationsViewerTutorialRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get images => TranslationOverrides.string(_root.$meta, 'viewer.tutorial.images', {}) ?? 'Изображения';
  @override
  String get tapLongTapToggleImmersive =>
      TranslationOverrides.string(_root.$meta, 'viewer.tutorial.tapLongTapToggleImmersive', {}) ??
      'Нажатие/Длительное нажатие: переключить режим погружения';
  @override
  String get doubleTapFitScreen =>
      TranslationOverrides.string(_root.$meta, 'viewer.tutorial.doubleTapFitScreen', {}) ??
      'Двойное нажатие: вписать в экран / оригинальный размер / сбросить масштаб';
}

// Path: viewer.appBar
class _TranslationsViewerAppBarRu extends TranslationsViewerAppBarEn {
  _TranslationsViewerAppBarRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get cantStartSlideshow =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.cantStartSlideshow', {}) ?? 'Невозможно запустить слайдшоу';
  @override
  String get reachedLastLoadedItem =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.reachedLastLoadedItem', {}) ?? 'Достигнут последний загруженный элемент';
  @override
  String get pause => TranslationOverrides.string(_root.$meta, 'viewer.appBar.pause', {}) ?? 'Пауза';
  @override
  String get start => TranslationOverrides.string(_root.$meta, 'viewer.appBar.start', {}) ?? 'Старт';
  @override
  String get unfavourite => TranslationOverrides.string(_root.$meta, 'viewer.appBar.unfavourite', {}) ?? 'Удалить из избранного';
  @override
  String get deselect => TranslationOverrides.string(_root.$meta, 'viewer.appBar.deselect', {}) ?? 'Снять выбор';
  @override
  String get reloadWithScaling =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.reloadWithScaling', {}) ?? 'Перезагрузить с масштабированием';
  @override
  String get loadSampleQuality => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadSampleQuality', {}) ?? 'Загрузить семпл качество';
  @override
  String get loadHighQuality => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadHighQuality', {}) ?? 'Загрузить высокое качество';
  @override
  String get dropSnatchedStatus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.dropSnatchedStatus', {}) ?? 'Сбросить статус скачанного';
  @override
  String get setSnatchedStatus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.setSnatchedStatus', {}) ?? 'Установить статус скачанного';
  @override
  String get snatch => TranslationOverrides.string(_root.$meta, 'viewer.appBar.snatch', {}) ?? 'Скачать';
  @override
  String get forced => TranslationOverrides.string(_root.$meta, 'viewer.appBar.forced', {}) ?? '(принудительно)';
  @override
  String get hydrusShare => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusShare', {}) ?? 'Поделиться в Hydrus';
  @override
  String get whichUrlToShareToHydrus =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.whichUrlToShareToHydrus', {}) ?? 'Какой ссылкой ты хочешь поделиться с Hydrus?';
  @override
  String get postURL => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURL', {}) ?? 'Ссылка на пост';
  @override
  String get fileURL => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURL', {}) ?? 'Ссылка на файл';
  @override
  String get hydrusNotConfigured => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusNotConfigured', {}) ?? 'Hydrus не настроен!';
  @override
  String get shareFile => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareFile', {}) ?? 'Поделиться файлом';
  @override
  String get alreadyDownloadingThisFile =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingThisFile', {}) ??
      'Уже скачивается этот файл для Поделиться, хочешь прервать?';
  @override
  String get alreadyDownloadingFile =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingFile', {}) ??
      'Уже скачивается файл для Поделиться, хочешь прервать текущий файл и поделиться новым файлом?';
  @override
  String get current => TranslationOverrides.string(_root.$meta, 'viewer.appBar.current', {}) ?? 'Текущий:';
  @override
  String get kNew => TranslationOverrides.string(_root.$meta, 'viewer.appBar.kNew', {}) ?? 'Новый:';
  @override
  String get shareNew => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareNew', {}) ?? 'Поделиться новым';
  @override
  String get abort => TranslationOverrides.string(_root.$meta, 'viewer.appBar.abort', {}) ?? 'Прервать';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'viewer.appBar.error', {}) ?? 'Ошибка!';
  @override
  String get savingFileError =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.savingFileError', {}) ?? 'Что-то пошло не так при скачивании файла перед отправкой';
  @override
  String get whatToShare => TranslationOverrides.string(_root.$meta, 'viewer.appBar.whatToShare', {}) ?? 'Чем ты хочешь поделиться?';
  @override
  String get postURLWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURLWithTags', {}) ?? 'Ссылка на пост с тегами';
  @override
  String get fileURLWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURLWithTags', {}) ?? 'Ссылка на файл с тегами';
  @override
  String get file => TranslationOverrides.string(_root.$meta, 'viewer.appBar.file', {}) ?? 'Файл';
  @override
  String get fileWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileWithTags', {}) ?? 'Файл с тегами';
  @override
  String get hydrus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrus', {}) ?? 'Hydrus';
  @override
  String get selectTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.selectTags', {}) ?? 'Выбрать теги';
}

// Path: viewer.notes
class _TranslationsViewerNotesRu extends TranslationsViewerNotesEn {
  _TranslationsViewerNotesRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get note => TranslationOverrides.string(_root.$meta, 'viewer.notes.note', {}) ?? 'Заметка';
  @override
  String get notes => TranslationOverrides.string(_root.$meta, 'viewer.notes.notes', {}) ?? 'Заметки';
  @override
  String coordinates({required int posX, required int posY}) =>
      TranslationOverrides.string(_root.$meta, 'viewer.notes.coordinates', {'posX': posX, 'posY': posY}) ?? 'X:${posX}, Y:${posY}';
}

// Path: media.loading
class _TranslationsMediaLoadingRu extends TranslationsMediaLoadingEn {
  _TranslationsMediaLoadingRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get rendering => TranslationOverrides.string(_root.$meta, 'media.loading.rendering', {}) ?? 'Рендеринг...';
  @override
  String get loadingAndRenderingFromCache =>
      TranslationOverrides.string(_root.$meta, 'media.loading.loadingAndRenderingFromCache', {}) ?? 'Загрузка и рендеринг из кэша...';
  @override
  String get loadingFromCache => TranslationOverrides.string(_root.$meta, 'media.loading.loadingFromCache', {}) ?? 'Загрузка из кэша...';
  @override
  String get buffering => TranslationOverrides.string(_root.$meta, 'media.loading.buffering', {}) ?? 'Буферизация...';
  @override
  String get loading => TranslationOverrides.string(_root.$meta, 'media.loading.loading', {}) ?? 'Загрузка...';
  @override
  String get loadAnyway => TranslationOverrides.string(_root.$meta, 'media.loading.loadAnyway', {}) ?? 'Все равно загрузить';
  @override
  String get restartLoading => TranslationOverrides.string(_root.$meta, 'media.loading.restartLoading', {}) ?? 'Перезапустить загрузку';
  @override
  String get stopLoading => TranslationOverrides.string(_root.$meta, 'media.loading.stopLoading', {}) ?? 'Остановить загрузку';
  @override
  String startedSecondsAgo({required int seconds}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.startedSecondsAgo', {'seconds': seconds}) ?? 'Начато ${seconds}с назад';
  @override
  late final _TranslationsMediaLoadingStopReasonsRu stopReasons = _TranslationsMediaLoadingStopReasonsRu._(_root);
  @override
  String get fileIsZeroBytes => TranslationOverrides.string(_root.$meta, 'media.loading.fileIsZeroBytes', {}) ?? 'Пустой файл';
  @override
  String fileSize({required String size}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.fileSize', {'size': size}) ?? 'Размер файла: ${size}';
  @override
  String sizeLimit({required String limit}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.sizeLimit', {'limit': limit}) ?? 'Лимит: ${limit}';
  @override
  String get tryChangingVideoBackend =>
      TranslationOverrides.string(_root.$meta, 'media.loading.tryChangingVideoBackend', {}) ??
      'Частые проблемы с воспроизведением? Попробуй изменить [Настройки > Видео > Движок видеоплеера]';
}

// Path: media.video
class _TranslationsMediaVideoRu extends TranslationsMediaVideoEn {
  _TranslationsMediaVideoRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get videosDisabledOrNotSupported =>
      TranslationOverrides.string(_root.$meta, 'media.video.videosDisabledOrNotSupported', {}) ?? 'Видео отключены или не поддерживаются';
  @override
  String get openVideoInExternalPlayer =>
      TranslationOverrides.string(_root.$meta, 'media.video.openVideoInExternalPlayer', {}) ?? 'Открыть видео во внешнем плеере';
  @override
  String get openVideoInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openVideoInBrowser', {}) ?? 'Открыть видео в браузере';
  @override
  String get failedToLoadItemData =>
      TranslationOverrides.string(_root.$meta, 'media.video.failedToLoadItemData', {}) ?? 'Не удалось загрузить данные об элементе';
  @override
  String get loadingItemData => TranslationOverrides.string(_root.$meta, 'media.video.loadingItemData', {}) ?? 'Загрузка данных об элементе...';
  @override
  String get retry => TranslationOverrides.string(_root.$meta, 'media.video.retry', {}) ?? 'Повторить';
  @override
  String get openFileInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openFileInBrowser', {}) ?? 'Открыть файл в браузере';
  @override
  String get openPostInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openPostInBrowser', {}) ?? 'Открыть пост в браузере';
  @override
  String get currentlyChecking => TranslationOverrides.string(_root.$meta, 'media.video.currentlyChecking', {}) ?? 'В данный момент проверяется:';
  @override
  String unknownFileFormat({required String fileExt}) =>
      TranslationOverrides.string(_root.$meta, 'media.video.unknownFileFormat', {'fileExt': fileExt}) ??
      'Неизвестный формат файла (.${fileExt}), нажми здесь, чтобы открыть в браузере';
}

// Path: preview.error
class _TranslationsPreviewErrorRu extends TranslationsPreviewErrorEn {
  _TranslationsPreviewErrorRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get noResults => TranslationOverrides.string(_root.$meta, 'preview.error.noResults', {}) ?? 'Нет результатов';
  @override
  String get noResultsSubtitle =>
      TranslationOverrides.string(_root.$meta, 'preview.error.noResultsSubtitle', {}) ?? 'Измени поисковый запрос или нажми чтобы попробовать снова';
  @override
  String get reachedEnd => TranslationOverrides.string(_root.$meta, 'preview.error.reachedEnd', {}) ?? 'Ты достиг конца';
  @override
  String reachedEndSubtitle({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.reachedEndSubtitle', {'pageNum': pageNum}) ??
      'Загружено ${pageNum} страниц\nНажми здесь, чтобы перезагрузить последнюю страницу';
  @override
  String loadingPage({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.loadingPage', {'pageNum': pageNum}) ?? 'Загрузка страницы №${pageNum}...';
  @override
  String startedAgo({required num seconds}) =>
      TranslationOverrides.plural(_root.$meta, 'preview.error.startedAgo', {'seconds': seconds}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        seconds,
        one: 'Начато ${seconds} секунду назад',
        few: 'Начато ${seconds} секунды назад',
        many: 'Начато ${seconds} секунд назад',
        other: 'Начато ${seconds} секунд назад',
      );
  @override
  String get tapToRetryIfStuck =>
      TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetryIfStuck', {}) ??
      'Нажми чтобы попробовать снова, если запрос застрял или идет слишком долго';
  @override
  String errorLoadingPage({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.errorLoadingPage', {'pageNum': pageNum}) ?? 'Ошибка при загрузке страницы №${pageNum}';
  @override
  String get errorWithMessage => TranslationOverrides.string(_root.$meta, 'preview.error.errorWithMessage', {}) ?? 'Нажми здесь для повтора';
  @override
  String get errorNoResultsLoaded =>
      TranslationOverrides.string(_root.$meta, 'preview.error.errorNoResultsLoaded', {}) ?? 'Ошибка, результаты не загружены';
  @override
  String get tapToRetry => TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetry', {}) ?? 'Нажми здесь для повтора';
}

// Path: settings.interface.previewQualityValues
class _TranslationsSettingsInterfacePreviewQualityValuesRu extends TranslationsSettingsInterfacePreviewQualityValuesEn {
  _TranslationsSettingsInterfacePreviewQualityValuesRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get thumbnail => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.thumbnail', {}) ?? 'Превью';
  @override
  String get sample => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.sample', {}) ?? 'Сэмпл';
}

// Path: settings.interface.previewDisplayModeValues
class _TranslationsSettingsInterfacePreviewDisplayModeValuesRu extends TranslationsSettingsInterfacePreviewDisplayModeValuesEn {
  _TranslationsSettingsInterfacePreviewDisplayModeValuesRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get square => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.square', {}) ?? 'Квадрат';
  @override
  String get rectangle => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.rectangle', {}) ?? 'Прямоугольник';
  @override
  String get staggered => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.staggered', {}) ?? 'Шахматный';
}

// Path: settings.interface.appModeValues
class _TranslationsSettingsInterfaceAppModeValuesRu extends TranslationsSettingsInterfaceAppModeValuesEn {
  _TranslationsSettingsInterfaceAppModeValuesRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get desktop => TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.desktop', {}) ?? 'Компьютер';
  @override
  String get mobile => TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.mobile', {}) ?? 'Мобильный';
}

// Path: settings.interface.handSideValues
class _TranslationsSettingsInterfaceHandSideValuesRu extends TranslationsSettingsInterfaceHandSideValuesEn {
  _TranslationsSettingsInterfaceHandSideValuesRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get left => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.left', {}) ?? 'Левая';
  @override
  String get right => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.right', {}) ?? 'Правая';
}

// Path: settings.viewer.imageQualityValues
class _TranslationsSettingsViewerImageQualityValuesRu extends TranslationsSettingsViewerImageQualityValuesEn {
  _TranslationsSettingsViewerImageQualityValuesRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get sample => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.sample', {}) ?? 'Сэмпл';
  @override
  String get fullRes => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.fullRes', {}) ?? 'Оригинал';
}

// Path: settings.viewer.scrollDirectionValues
class _TranslationsSettingsViewerScrollDirectionValuesRu extends TranslationsSettingsViewerScrollDirectionValuesEn {
  _TranslationsSettingsViewerScrollDirectionValuesRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get horizontal => TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.horizontal', {}) ?? 'Горизонтально';
  @override
  String get vertical => TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.vertical', {}) ?? 'Вертикально';
}

// Path: settings.viewer.toolbarPositionValues
class _TranslationsSettingsViewerToolbarPositionValuesRu extends TranslationsSettingsViewerToolbarPositionValuesEn {
  _TranslationsSettingsViewerToolbarPositionValuesRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get top => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.top', {}) ?? 'Сверху';
  @override
  String get bottom => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.bottom', {}) ?? 'Снизу';
}

// Path: settings.viewer.buttonPositionValues
class _TranslationsSettingsViewerButtonPositionValuesRu extends TranslationsSettingsViewerButtonPositionValuesEn {
  _TranslationsSettingsViewerButtonPositionValuesRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get disabled => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.disabled', {}) ?? 'Отключено';
  @override
  String get left => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.left', {}) ?? 'Слева';
  @override
  String get right => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.right', {}) ?? 'Справа';
}

// Path: settings.viewer.shareActionValues
class _TranslationsSettingsViewerShareActionValuesRu extends TranslationsSettingsViewerShareActionValuesEn {
  _TranslationsSettingsViewerShareActionValuesRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get ask => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.ask', {}) ?? 'Спрашивать';
  @override
  String get postUrl => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrl', {}) ?? 'URL поста';
  @override
  String get postUrlWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrlWithTags', {}) ?? 'URL поста с тегами';
  @override
  String get fileUrl => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrl', {}) ?? 'URL файла';
  @override
  String get fileUrlWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrlWithTags', {}) ?? 'URL файла с тегами';
  @override
  String get file => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.file', {}) ?? 'Файл';
  @override
  String get fileWithTags => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileWithTags', {}) ?? 'Файл с тегами';
  @override
  String get hydrus => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.hydrus', {}) ?? 'Hydrus';
}

// Path: settings.video.cacheModes
class _TranslationsSettingsVideoCacheModesRu extends TranslationsSettingsVideoCacheModesEn {
  _TranslationsSettingsVideoCacheModesRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.title', {}) ?? 'Режимы кэширования видео';
  @override
  String get streamMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamMode', {}) ??
      '- Потоковый - Не кэшировать, начать воспроизведение как можно скорее';
  @override
  String get cacheMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheMode', {}) ??
      '- Кэш - Сохраняет файл в хранилище устройства, воспроизводит только когда загрузка завершена';
  @override
  String get streamCacheMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamCacheMode', {}) ??
      '- Потоковый+Кэш - Смешанный режим, но в данный момент приводит к двойной загрузке';
  @override
  String get cacheNote =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheNote', {}) ??
      '[Примечание]: Видео будут кэшироваться только если включено \'Кэшировать медиа\'.';
  @override
  String get desktopWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.desktopWarning', {}) ??
      '[Предупреждение]: На компьютерах потоковый режим может работать некорректно для некоторых сайтов.';
}

// Path: settings.video.cacheModeValues
class _TranslationsSettingsVideoCacheModeValuesRu extends TranslationsSettingsVideoCacheModeValuesEn {
  _TranslationsSettingsVideoCacheModeValuesRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get stream => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.stream', {}) ?? 'Потоковый';
  @override
  String get cache => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.cache', {}) ?? 'Кэш';
  @override
  String get streamCache => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.streamCache', {}) ?? 'Потоковый+Кэш';
}

// Path: settings.video.videoBackendModeValues
class _TranslationsSettingsVideoVideoBackendModeValuesRu extends TranslationsSettingsVideoVideoBackendModeValuesEn {
  _TranslationsSettingsVideoVideoBackendModeValuesRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get normal => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.normal', {}) ?? 'По умолчанию';
  @override
  String get mpv => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mpv', {}) ?? 'MPV';
  @override
  String get mdk => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mdk', {}) ?? 'MDK';
}

// Path: media.loading.stopReasons
class _TranslationsMediaLoadingStopReasonsRu extends TranslationsMediaLoadingStopReasonsEn {
  _TranslationsMediaLoadingStopReasonsRu._(TranslationsRu root) : this._root = root, super.internal(root);

  final TranslationsRu _root; // ignore: unused_field

  // Translations
  @override
  String get stoppedByUser => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.stoppedByUser', {}) ?? 'Остановлено пользователем';
  @override
  String get loadingError => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.loadingError', {}) ?? 'Ошибка загрузки';
  @override
  String get fileIsTooBig => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.fileIsTooBig', {}) ?? 'Файл слишком большой';
  @override
  String get containsHatedTags =>
      TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.containsHatedTags', {}) ?? 'Содержит ненавистные теги';
  @override
  String get videoError => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.videoError', {}) ?? 'Ошибка видео';
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
          'confirm' => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? 'Подтвердить',
          'retry' => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? 'Повторить',
          'clear' => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? 'Сбросить',
          'copy' => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Копировать',
          'copied' => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Скопировано!',
          'copiedToClipboard' => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? 'Скопировано в буфер обмена',
          'nothingFound' => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? 'Ничего не найдено',
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
          'failedToOpenLink' => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'Не удалось открыть ссылку',
          'apiKey' => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'API ключ',
          'userId' => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'ID юзера',
          'login' => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Логин',
          'password' => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Пароль',
          'pause' => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Пауза',
          'resume' => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Продолжить',
          'discord' => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord',
          'visitOurDiscord' => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Заходи на наш Discord сервер',
          'item' => TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Элемент',
          'select' => TranslationOverrides.string(_root.$meta, 'select', {}) ?? 'Выбрать',
          'selectAll' => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Выбрать все',
          'reset' => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'Сбросить',
          'open' => TranslationOverrides.string(_root.$meta, 'open', {}) ?? 'Открыть',
          'openInNewTab' => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? 'Открыть в новой вкладке',
          'move' => TranslationOverrides.string(_root.$meta, 'move', {}) ?? 'Переместить',
          'shuffle' => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? 'Перемешать',
          'sort' => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? 'Сортировать',
          'go' => TranslationOverrides.string(_root.$meta, 'go', {}) ?? 'Перейти',
          'search' => TranslationOverrides.string(_root.$meta, 'search', {}) ?? 'Поиск',
          'filter' => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? 'Фильтр',
          'or' => TranslationOverrides.string(_root.$meta, 'or', {}) ?? 'Или (~)',
          'page' => TranslationOverrides.string(_root.$meta, 'page', {}) ?? 'Страница',
          'pageNumber' => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? 'Страница №',
          'tags' => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'Теги',
          'type' => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'Тип',
          'name' => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Имя',
          'address' => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'Адрес',
          'username' => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'Имя пользователя',
          'favourites' => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'Избранное',
          'downloads' => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'Скачанное',
          'validationErrors.required' => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Введи значение',
          'validationErrors.invalid' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Введи валидное значение',
          'validationErrors.invalidNumber' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? 'Пожалуйста, введи число',
          'validationErrors.invalidNumericValue' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? 'Пожалуйста, введи корректное числовое значение',
          'validationErrors.tooSmall' =>
            ({required Object min}) =>
                TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Введи значение больше ${min}',
          'validationErrors.tooBig' =>
            ({required Object max}) =>
                TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Введи значение меньше ${max}',
          'validationErrors.rangeError' =>
            ({required double min, required double max}) =>
                TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ??
                'Пожалуйста, введи значение между ${min} и ${max}',
          'validationErrors.greaterThanOrEqualZero' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ??
                'Пожалуйста, введи значение равное или больше 0',
          'validationErrors.lessThan4' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? 'Пожалуйста, введи значение меньше 4',
          'validationErrors.biggerThan100' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? 'Пожалуйста, введи значение больше 100',
          'validationErrors.moreThan4ColumnsWarning' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ??
                'Использование более 4 столбцов может повлиять на производительность',
          'validationErrors.moreThan8ColumnsWarning' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ??
                'Использование более 8 столбцов может повлиять на производительность',
          'init.initError' => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Ошибка инициализации!',
          'init.settingUpProxy' => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Настройка прокси...',
          'init.loadingDatabase' => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Загрузка базы данных...',
          'init.loadingBoorus' => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Загрузка конфигов сайтов...',
          'init.loadingTags' => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Загрузка тегов...',
          'init.restoringTabs' => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Восстановление вкладок...',
          'permissions.noAccessToCustomStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ?? 'Нет доступа к выбранной папке хранилища',
          'permissions.pleaseSetStorageDirectoryAgain' =>
            TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ??
                'Пожалуйста, назначь папку хранилища снова, чтобы предоставить приложению доступ к ней',
          'permissions.currentPath' =>
            ({required String path}) =>
                TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? 'Текущий путь: ${path}',
          'permissions.setDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? 'Назначить папку',
          'permissions.currentlyNotAvailableForThisPlatform' =>
            TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ?? 'Недоступно на этой платформе',
          'permissions.resetDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? 'Сбросить папку',
          'permissions.afterResetFilesWillBeSavedToDefaultDirectory' =>
            TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ??
                'Файлы будут сохраняться в папку по умолчанию после сброса',
          'authentication.pleaseAuthenticateToUseTheApp' =>
            TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ??
                'Пожалуйста, пройди аутентификацию для использования приложения',
          'authentication.noBiometricHardwareAvailable' =>
            TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? 'Биометрия недоступна',
          'authentication.temporaryLockout' =>
            TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? 'Временная блокировка',
          'authentication.somethingWentWrong' =>
            ({required String error}) =>
                TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ?? 'Что-то пошло не так: ${error}',
          'searchHandler.removedLastTab' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? 'Последняя вкладка удалена',
          'searchHandler.resettingSearchToDefaultTags' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? 'Сброс к тегам по умолчанию',
          'searchHandler.uoh' => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'UOOOOOOOHHH',
          'searchHandler.ratingsChanged' => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? 'Рейтинги изменились',
          'searchHandler.ratingsChangedMessage' =>
            ({required String booruType}) =>
                TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
                'На ${booruType} [rating:safe] теперь заменён на [rating:general] и [rating:sensitive]',
          'searchHandler.appFixedRatingAutomatically' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ??
                'Рейтинг исправлен автоматически. В будущих запросах используй правильный рейтинг',
          'searchHandler.tabsRestored' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? 'Вкладки восстановлены',
          'searchHandler.restoredTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
                  count,
                  one: 'Восстановлена ${count} вкладка из предыдущей сессии',
                  few: 'Восстановлено ${count} вкладки из предыдущей сессии',
                  many: 'Восстановлено ${count} вкладок из предыдущей сессии',
                  other: 'Восстановлено ${count} вкладок из предыдущей сессии',
                ),
          'searchHandler.someRestoredTabsHadIssues' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ??
                'Некоторые восстановленные вкладки были для неизвестных сайтов или содержали повреждённые символы.',
          'searchHandler.theyWereSetToDefaultOrIgnored' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ??
                'Им были установлены значения по умолчанию или они были проигнорированы.',
          'searchHandler.listOfBrokenTabs' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? 'Список повреждённых вкладок:',
          'searchHandler.tabsMerged' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? 'Вкладки объединены',
          'searchHandler.addedTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
                  count,
                  one: 'Добавлена ${count} новая вкладка',
                  few: 'Добавлены ${count} новых вкладки',
                  many: 'Добавлено ${count} новых вкладок',
                  other: 'Добавлено ${count} новых вкладок',
                ),
          'searchHandler.tabsReplaced' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? 'Вкладки заменены',
          'searchHandler.receivedTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
                  count,
                  one: 'Получена ${count} вкладка',
                  few: 'Получены ${count} вкладки',
                  many: 'Получено ${count} вкладок',
                  other: 'Получено ${count} вкладок',
                ),
          'snatcher.title' => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Загрузчик',
          'snatcher.snatchingHistory' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'История загрузок',
          'snatcher.enterTags' => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'Введи теги',
          'snatcher.amount' => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? 'Количество',
          'snatcher.amountOfFilesToSnatch' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? 'Количество файлов для скачивания',
          'snatcher.delayInMs' => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? 'Задержка (в мс)',
          'snatcher.delayBetweenEachDownload' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? 'Задержка между каждой загрузкой',
          'snatcher.snatchFiles' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? 'Скачать файлы',
          'snatcher.itemWasAlreadySnatched' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? 'Элемент уже был загружен ранее',
          'snatcher.failedToSnatchItem' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? 'Не удалось скачать элемент',
          'snatcher.itemWasCancelled' => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? 'Элемент был отменён',
          'snatcher.startingNextQueueItem' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? 'Запуск следующего элемента очереди...',
          'snatcher.itemsSnatched' => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? 'Элементы скачаны',
          'snatcher.snatchedCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
                  count,
                  one: 'Скачано: ${count} элемент',
                  few: 'Скачано: ${count} элемента',
                  many: 'Скачано: ${count} элементов',
                  other: 'Скачано: ${count} элементов',
                ),
          'snatcher.filesAlreadySnatched' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
                  count,
                  one: '${count} файл уже был скачан',
                  few: '${count} файла уже были скачаны',
                  many: '${count} файлов уже были скачаны',
                  other: '${count} файлов уже были скачаны',
                ),
          'snatcher.failedToSnatchFiles' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
                  count,
                  one: 'Не удалось скачать ${count} файл',
                  few: 'Не удалось скачать ${count} файла',
                  many: 'Не удалось скачать ${count} файлов',
                  other: 'Не удалось скачать ${count} файлов',
                ),
          'snatcher.cancelledFiles' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
                  count,
                  one: 'Отменён ${count} файл',
                  few: 'Отменено ${count} файла',
                  many: 'Отменено ${count} файлов',
                  other: 'Отменено ${count} файлов',
                ),
          'snatcher.snatchingImages' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? 'Скачивание изображений',
          'snatcher.doNotCloseApp' => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? 'Не закрывай приложение!',
          'snatcher.addedItemToQueue' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? 'Элемент добавлен в очередь загрузки',
          'snatcher.addedItemsToQueue' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
                  count,
                  one: 'Добавлен ${count} элемент в очередь загрузки',
                  few: 'Добавлено ${count} элемента в очередь загрузки',
                  many: 'Добавлено ${count} элементов в очередь загрузки',
                  other: 'Добавлено ${count} элементов в очередь загрузки',
                ),
          'multibooru.title' => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? 'Мультисайт',
          'multibooru.multibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Режим мультисайта',
          'multibooru.multibooruRequiresAtLeastTwoBoorus' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ??
                'Требует как минимум 2 настроенных сайта',
          'multibooru.selectSecondaryBoorus' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Выбери второстепенные конфиги:',
          'multibooru.akaMultibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? 'режим Мультисайта',
          'multibooru.labelSecondaryBoorusToInclude' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? 'Выбранные дополнительные сайты',
          'hydrus.importError' => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'Что-то пошло не так при импорте в Hydrus',
          'hydrus.apiPermissionsRequired' =>
            TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ??
                'Возможно, ты не предоставил правильные разрешения API, это можно изменить в Review Services',
          'hydrus.addTagsToFile' => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? 'Добавить теги к файлу',
          'hydrus.addUrls' => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'Добавить ссылки',
          'tabs.tab' => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? 'Вкладка',
          'tabs.addBoorusInSettings' => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? 'Добавь сайт в настройках',
          'tabs.selectABooru' => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? 'Выбери сайт',
          'tabs.secondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? 'Дополнительные сайты',
          'tabs.addNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? 'Добавить новую вкладку',
          'tabs.selectABooruOrLeaveEmpty' =>
            TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? 'Выбери сайт или оставь пустым',
          'tabs.addPosition' => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? 'Позиция добавления:',
          'tabs.addModePrevTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? 'Предыдущая вкладка',
          'tabs.addModeNextTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? 'Следующая вкладка',
          'tabs.addModeListEnd' => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? 'Конец списка',
          'tabs.usedQuery' => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? 'Используемый запрос:',
          'tabs.queryModeDefault' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? 'По умолчанию',
          'tabs.queryModeCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? 'Текущий',
          'tabs.queryModeCustom' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? 'Пользовательский',
          'tabs.customQuery' => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? 'Запрос',
          'tabs.empty' => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '[пусто]',
          'tabs.addSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? 'Добавить дополнительные сайты',
          'tabs.keepSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? 'Сохранить дополнительные сайты',
          'tabs.startFromCustomPageNumber' => TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? 'Начать со страницы',
          'tabs.switchToNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? 'Переключиться на новую вкладку',
          'tabs.add' => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? 'Добавить',
          'tabs.tabsManager' => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? 'Менеджер вкладок',
          'tabs.selectMode' => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? 'Режим выбора',
          'tabs.sortMode' => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? 'Сортировать вкладки',
          'tabs.help' => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? 'Помощь',
          'tabs.deleteTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? 'Удалить вкладки',
          'tabs.shuffleTabs' => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? 'Перемешать вкладки',
          'tabs.tabRandomlyShuffled' => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? 'Вкладки случайно перемешаны',
          'tabs.tabOrderSaved' => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? 'Порядок вкладок сохранён',
          'tabs.scrollToCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? 'Прокрутить к текущей вкладке',
          'tabs.scrollToTop' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? 'Прокрутить вверх',
          'tabs.scrollToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? 'Прокрутить вниз',
          'tabs.filterTabsByBooru' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? 'Фильтровать по сайту, состоянию, дубликатам...',
          'tabs.scrolling' => TranslationOverrides.string(_root.$meta, 'tabs.scrolling', {}) ?? 'Прокрутка:',
          'tabs.sorting' => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? 'Сортировка:',
          'tabs.defaultTabsOrder' => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? 'Порядок вкладок по умолчанию',
          'tabs.sortAlphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? 'Сортировать по алфавиту',
          'tabs.sortAlphabeticallyReversed' =>
            TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? 'Сортировать по алфавиту (обратный порядок)',
          'tabs.sortByBooruName' =>
            TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? 'Сортировать по имени сайта в алфавитном порядке',
          'tabs.sortByBooruNameReversed' =>
            TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ??
                'Сортировать по имени сайта в обратном алфавитном порядке',
          'tabs.longPressSortToSave' =>
            TranslationOverrides.string(_root.$meta, 'tabs.longPressSortToSave', {}) ?? 'Зажми кнопку сортировки для сохранения порядка вкладок',
          'tabs.select' => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? 'Выбрать:',
          'tabs.toggleSelectMode' => TranslationOverrides.string(_root.$meta, 'tabs.toggleSelectMode', {}) ?? 'Переключить режим выбора',
          'tabs.onTheBottomOfPage' => TranslationOverrides.string(_root.$meta, 'tabs.onTheBottomOfPage', {}) ?? 'Внизу страницы: ',
          'tabs.selectDeselectAll' =>
            TranslationOverrides.string(_root.$meta, 'tabs.selectDeselectAll', {}) ?? 'Выбрать/сбросить выбор для всех вкладок',
          'tabs.deleteSelectedTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? 'Удалить выбранные вкладки',
          'tabs.longPressToMove' =>
            TranslationOverrides.string(_root.$meta, 'tabs.longPressToMove', {}) ?? 'Длительное нажатие на вкладку для её перемещения',
          'tabs.numbersInBottomRight' =>
            TranslationOverrides.string(_root.$meta, 'tabs.numbersInBottomRight', {}) ?? 'Числа в правом нижнем углу вкладки:',
          'tabs.firstNumberTabIndex' =>
            TranslationOverrides.string(_root.$meta, 'tabs.firstNumberTabIndex', {}) ?? 'Первое число - индекс вкладки в списке по умолчанию',
          'tabs.secondNumberTabIndex' =>
            TranslationOverrides.string(_root.$meta, 'tabs.secondNumberTabIndex', {}) ??
                'Второе число - индекс вкладки в текущем списке, появляется при активной фильтрации/сортировке',
          'tabs.specialFilters' => TranslationOverrides.string(_root.$meta, 'tabs.specialFilters', {}) ?? 'Специальные фильтры:',
          'tabs.loadedFilter' =>
            TranslationOverrides.string(_root.$meta, 'tabs.loadedFilter', {}) ?? '"Загружено" - показать вкладки с загруженными элементами',
          'tabs.notLoadedFilter' =>
            TranslationOverrides.string(_root.$meta, 'tabs.notLoadedFilter', {}) ??
                '"Не загружено" - показать вкладки, которые не загружены и/или имеют ноль элементов',
          'tabs.notLoadedItalic' =>
            TranslationOverrides.string(_root.$meta, 'tabs.notLoadedItalic', {}) ?? 'Незагруженные вкладки имеют курсивный текст',
          'tabs.noTabsFound' => TranslationOverrides.string(_root.$meta, 'tabs.noTabsFound', {}) ?? 'Вкладки не найдены',
          'tabs.copy' => TranslationOverrides.string(_root.$meta, 'tabs.copy', {}) ?? 'Копировать',
          'tabs.moveAction' => TranslationOverrides.string(_root.$meta, 'tabs.moveAction', {}) ?? 'Переместить',
          'tabs.remove' => TranslationOverrides.string(_root.$meta, 'tabs.remove', {}) ?? 'Удалить',
          'tabs.shuffle' => TranslationOverrides.string(_root.$meta, 'tabs.shuffle', {}) ?? 'Перемешать',
          'tabs.sort' => TranslationOverrides.string(_root.$meta, 'tabs.sort', {}) ?? 'Сортировать',
          'tabs.shuffleTabsQuestion' =>
            TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabsQuestion', {}) ?? 'Перемешать порядок вкладок случайным образом?',
          'tabs.saveTabsInCurrentOrder' =>
            TranslationOverrides.string(_root.$meta, 'tabs.saveTabsInCurrentOrder', {}) ?? 'Сохранить вкладки в текущем порядке сортировки?',
          'tabs.byBooru' => TranslationOverrides.string(_root.$meta, 'tabs.byBooru', {}) ?? 'По сайту',
          'tabs.alphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.alphabetically', {}) ?? 'По алфавиту',
          'tabs.reversed' => TranslationOverrides.string(_root.$meta, 'tabs.reversed', {}) ?? '(обратный порядок)',
          'tabs.areYouSureDeleteTabs' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'tabs.areYouSureDeleteTabs', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
                  count,
                  one: 'Ты уверен, что хочешь удалить ${count} вкладку?',
                  few: 'Ты уверен, что хочешь удалить ${count} вкладки?',
                  many: 'Ты уверен, что хочешь удалить ${count} вкладок?',
                  other: 'Ты уверен, что хочешь удалить ${count} вкладок?',
                ),
          'tabs.filters.loaded' => TranslationOverrides.string(_root.$meta, 'tabs.filters.loaded', {}) ?? 'Загружено',
          'tabs.filters.tagType' => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagType', {}) ?? 'Тип тега',
          'tabs.filters.multibooru' => TranslationOverrides.string(_root.$meta, 'tabs.filters.multibooru', {}) ?? 'Мультисайт',
          'tabs.filters.duplicates' => TranslationOverrides.string(_root.$meta, 'tabs.filters.duplicates', {}) ?? 'Дубликаты',
          'tabs.filters.checkDuplicatesOnSameBooru' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.checkDuplicatesOnSameBooru', {}) ?? 'Проверять дубликаты на том же сайте',
          'tabs.filters.emptySearchQuery' => TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? 'Пустой запрос',
          'tabs.filters.title' => TranslationOverrides.string(_root.$meta, 'tabs.filters.title', {}) ?? 'Фильтры вкладок',
          'tabs.filters.all' => TranslationOverrides.string(_root.$meta, 'tabs.filters.all', {}) ?? 'Все',
          'tabs.filters.notLoaded' => TranslationOverrides.string(_root.$meta, 'tabs.filters.notLoaded', {}) ?? 'Не загружено',
          'tabs.filters.enabled' => TranslationOverrides.string(_root.$meta, 'tabs.filters.enabled', {}) ?? 'Включено',
          'tabs.filters.disabled' => TranslationOverrides.string(_root.$meta, 'tabs.filters.disabled', {}) ?? 'Отключено',
          'tabs.filters.willAlsoEnableSorting' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.willAlsoEnableSorting', {}) ?? 'Также включит сортировку',
          'tabs.filters.tagTypeFilterHelp' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.tagTypeFilterHelp', {}) ??
                'Фильтровать вкладки, которые содержат хотя бы один тег выбранного типа',
          'tabs.filters.any' => TranslationOverrides.string(_root.$meta, 'tabs.filters.any', {}) ?? 'Любой',
          'tabs.filters.apply' => TranslationOverrides.string(_root.$meta, 'tabs.filters.apply', {}) ?? 'Применить',
          'tabs.move.moveToTop' => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToTop', {}) ?? 'Переместить наверх',
          'tabs.move.moveToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToBottom', {}) ?? 'Переместить вниз',
          'tabs.move.tabNumber' => TranslationOverrides.string(_root.$meta, 'tabs.move.tabNumber', {}) ?? 'Номер вкладки',
          'tabs.move.invalidTabNumber' => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidTabNumber', {}) ?? 'Неверный номер вкладки',
          'tabs.move.invalidInput' => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidInput', {}) ?? 'Неверный ввод',
          'tabs.move.outOfRange' => TranslationOverrides.string(_root.$meta, 'tabs.move.outOfRange', {}) ?? 'Вне диапазона',
          'tabs.move.pleaseEnterValidTabNumber' =>
            TranslationOverrides.string(_root.$meta, 'tabs.move.pleaseEnterValidTabNumber', {}) ?? 'Пожалуйста, введи корректный номер вкладки',
          'tabs.move.moveTo' =>
            ({required String formattedNumber}) =>
                TranslationOverrides.string(_root.$meta, 'tabs.move.moveTo', {'formattedNumber': formattedNumber}) ??
                'Переместить на #${formattedNumber}',
          'tabs.move.preview' => TranslationOverrides.string(_root.$meta, 'tabs.move.preview', {}) ?? 'Предпросмотр:',
          'history.searchHistory' => TranslationOverrides.string(_root.$meta, 'history.searchHistory', {}) ?? 'История поиска',
          'history.searchHistoryIsEmpty' => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsEmpty', {}) ?? 'История поиска пуста',
          'history.searchHistoryIsDisabled' =>
            TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsDisabled', {}) ?? 'История поиска отключена',
          'history.searchHistoryRequiresDatabase' =>
            TranslationOverrides.string(_root.$meta, 'history.searchHistoryRequiresDatabase', {}) ?? 'История поиска требует включения базы данных',
          'history.lastSearch' =>
            ({required String search}) =>
                TranslationOverrides.string(_root.$meta, 'history.lastSearch', {'search': search}) ?? 'Последний поиск: ${search}',
          'history.lastSearchWithDate' =>
            ({required String date}) =>
                TranslationOverrides.string(_root.$meta, 'history.lastSearchWithDate', {'date': date}) ?? 'Последний поиск: ${date}',
          'history.unknownBooruType' => TranslationOverrides.string(_root.$meta, 'history.unknownBooruType', {}) ?? 'Неизвестный тип сайта!',
          'history.unknownBooru' =>
            ({required String name, required String type}) =>
                TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ??
                'Неизвестный сайт (${name}-${type})',
          'history.open' => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? 'Открыть',
          'history.openInNewTab' => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? 'Открыть в новой вкладке',
          'history.removeFromFavourites' => TranslationOverrides.string(_root.$meta, 'history.removeFromFavourites', {}) ?? 'Удалить из избранного',
          'history.setAsFavourite' => TranslationOverrides.string(_root.$meta, 'history.setAsFavourite', {}) ?? 'Добавить в избранное',
          'history.copy' => TranslationOverrides.string(_root.$meta, 'history.copy', {}) ?? 'Копировать',
          'history.delete' => TranslationOverrides.string(_root.$meta, 'history.delete', {}) ?? 'Удалить',
          'history.deleteHistoryEntries' =>
            TranslationOverrides.string(_root.$meta, 'history.deleteHistoryEntries', {}) ?? 'Удалить записи из истории',
          'history.deleteItemsConfirm' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'history.deleteItemsConfirm', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
                  count,
                  one: 'Ты уверен, что хочешь удалить ${count} элемент?',
                  few: 'Ты уверен, что хочешь удалить ${count} элемента?',
                  many: 'Ты уверен, что хочешь удалить ${count} элементов?',
                  other: 'Ты уверен, что хочешь удалить ${count} элементов?',
                ),
          'history.clearSelection' => TranslationOverrides.string(_root.$meta, 'history.clearSelection', {}) ?? 'Очистить выбор',
          'history.deleteItems' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'history.deleteItems', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
                  count,
                  one: 'Удалить ${count} элемент',
                  few: 'Удалить ${count} элемента',
                  many: 'Удалить ${count} элементов',
                  other: 'Удалить ${count} элементов',
                ),
          'webview.title' => TranslationOverrides.string(_root.$meta, 'webview.title', {}) ?? 'Вебвью',
          'webview.notSupportedOnDevice' =>
            TranslationOverrides.string(_root.$meta, 'webview.notSupportedOnDevice', {}) ?? 'Не поддерживается на этом устройстве',
          'webview.navigation.enterUrlLabel' => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterUrlLabel', {}) ?? 'Введи ссылку',
          'webview.navigation.enterCustomUrl' => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterCustomUrl', {}) ?? 'Введи ссылку',
          'webview.navigation.navigateTo' =>
            ({required String url}) => TranslationOverrides.string(_root.$meta, 'webview.navigation.navigateTo', {'url': url}) ?? 'Перейти на ${url}',
          'webview.navigation.listCookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.listCookies', {}) ?? 'Список куки',
          'webview.navigation.clearCookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.clearCookies', {}) ?? 'Очистить куки',
          'webview.navigation.cookiesGone' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.cookiesGone', {}) ?? 'Были куки. Теперь их нет',
          'webview.navigation.getFavicon' => TranslationOverrides.string(_root.$meta, 'webview.navigation.getFavicon', {}) ?? 'Получить иконку сайта',
          'webview.navigation.noFaviconFound' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noFaviconFound', {}) ?? 'Иконка сайта не найдена',
          'webview.navigation.host' => TranslationOverrides.string(_root.$meta, 'webview.navigation.host', {}) ?? 'Хост:',
          'webview.navigation.textAboveSelectable' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.textAboveSelectable', {}) ?? '(текст выше можно выбрать)',
          'webview.navigation.fieldToMergeTexts' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.fieldToMergeTexts', {}) ?? 'Поле для объединения текстов:',
          'webview.navigation.copyUrl' => TranslationOverrides.string(_root.$meta, 'webview.navigation.copyUrl', {}) ?? 'Копировать ссылку',
          'webview.navigation.copiedUrlToClipboard' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.copiedUrlToClipboard', {}) ?? 'Ссылка скопирована в буфер обмена',
          'webview.navigation.cookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookies', {}) ?? 'Куки',
          'webview.navigation.favicon' => TranslationOverrides.string(_root.$meta, 'webview.navigation.favicon', {}) ?? 'Иконка сайта',
          'webview.navigation.history' => TranslationOverrides.string(_root.$meta, 'webview.navigation.history', {}) ?? 'История',
          'webview.navigation.noBackHistoryItem' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noBackHistoryItem', {}) ?? 'Нет элемента для возврата назад',
          'webview.navigation.noForwardHistoryItem' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noForwardHistoryItem', {}) ?? 'Нет элемента для перехода вперёд',
          'settings.title' => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Настройки',
          'settings.language.title' => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? 'Язык',
          'settings.language.system' => TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? 'Системный',
          'settings.language.helpUsTranslate' =>
            TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? 'Помоги нам с переводом',
          'settings.language.visitForDetails' =>
            TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ??
                'Посети <a href="https://github.com/NO-ob/LoliSnatcher_Droid/wiki/Localization">github</a> для подробностей или нажми на изображение ниже, чтобы перейти на Weblate',
          'settings.booru.title' => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Сайты и Поиск',
          'settings.booru.dropdown' => TranslationOverrides.string(_root.$meta, 'settings.booru.dropdown', {}) ?? 'Сайт',
          'settings.booru.defaultTags' => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? 'Теги по умолчанию',
          'settings.booru.itemsPerPage' => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'Элементов на странице',
          'settings.booru.itemsPerPageTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'Некоторые сайты могут игнорировать этот параметр',
          'settings.booru.itemsPerPagePlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPagePlaceholder', {}) ?? '10-100',
          'settings.booru.addBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Добавить конфиг сайта',
          'settings.booru.shareBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? 'Поделиться конфигом сайта',
          'settings.booru.shareBooruDialogMsgMobile' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
                'Поделиться конфигом ${booruName} как ссылкой.\n\nВключить ли в нее логин/API ключ?',
          'settings.booru.shareBooruDialogMsgDesktop' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
                'Скопировать ссылку конфига ${booruName} в буфер обмена.\n\nВключить ли в нее логин/API ключ?',
          'settings.booru.booruSharing' => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? 'Поделиться конфигом сайта',
          'settings.booru.booruSharingMsgAndroid' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ??
                'Как автоматически открывать ссылки с конфигами сайта в приложении на Android 12 и выше:\n1) Нажми на кнопку снизу чтобы открыть системные настройки ссылок по умолчанию\n2) Нажми на "Добавить ссылку" и выбери все доступные опции',
          'settings.booru.addedBoorus' => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? 'Добавленные сайты',
          'settings.booru.editBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? 'Редактировать конфиг',
          'settings.booru.importBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? 'Импортировать конфиг из буфера обмена',
          'settings.booru.onlyLSURLsSupported' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ??
                'Поддерживаются только ссылки формата loli.snatcher',
          'settings.booru.deleteBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? 'Удалить конфиг сайта',
          'settings.booru.deleteBooruError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ?? 'Что-то пошло не так при удалении конфига!',
          'settings.booru.booruDeleted' => TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? 'Конфиг удален!',
          'settings.booru.booruDropdownInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ??
                'Выбранный сайт будет использоваться по умолчанию после сохранения.\n\nСайт по умолчанию будет первым в выпадающих списках',
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
          'settings.booruEditor.testBooruFailedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'Проверка сайта не удалась',
          'settings.booruEditor.testBooruFailedMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ??
                'Данные конфига неверны, сайт не дает доступ к API, запрос не вернул данные или есть проблемы с сетью.',
          'settings.booruEditor.saveBooru' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Сохранить конфиг',
          'settings.booruEditor.runningTest' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? 'Выполнение теста...',
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
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ??
                'Не удалось проверить доступ к API для Hydrus',
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
          'settings.booruEditor.booruDefTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? 'Теги по умолчанию',
          'settings.booruEditor.booruDefTagsPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTagsPlaceholder', {}) ?? 'Поиск по умолчанию для сайта',
          'settings.booruEditor.booruDefaultInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefaultInstructions', {}) ??
                'Поля ниже могут быть обязательны для некоторых сайтов',
          'settings.booruEditor.booruConfigShouldSave' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigShouldSave', {}) ??
                'Подтверди сохранение конфига для этого сайта',
          'settings.booruEditor.booruConfigSelectedType' =>
            ({required String booruType}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSelectedType', {'booruType': booruType}) ??
                'Выбранный/Обнаруженный тип сайта: ${booruType}',
          'settings.interface.title' => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? 'Интерфейс',
          'settings.interface.appUIMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIMode', {}) ?? 'Режим интерфейса приложения',
          'settings.interface.appUIModeWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarningTitle', {}) ?? 'Режим интерфейса приложения',
          'settings.interface.appUIModeWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarning', {}) ??
                'Использовать Компьютерный режим? Может привести к проблемам на мобильных устройствах. УСТАРЕВШЕЕ.',
          'settings.interface.appUIModeHelpMobile' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpMobile', {}) ?? '- Мобильный - Обычный мобильный интерфейс',
          'settings.interface.appUIModeHelpDesktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpDesktop', {}) ??
                '- Компьютерный - Интерфейс в стиле Ahoviewer [УСТАРЕЛ, ТРЕБУЕТ ДОРАБОТКИ]',
          'settings.interface.appUIModeHelpWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpWarning', {}) ??
                '[Предупреждение]: Не устанавливай режим интерфейса на Компьютерный на телефоне, ты можешь сломать приложение и тебе придётся удалить все настройки, включая конфигурации сайтов.',
          'settings.interface.handSide' => TranslationOverrides.string(_root.$meta, 'settings.interface.handSide', {}) ?? 'Преобладающая рука',
          'settings.interface.handSideHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.handSideHelp', {}) ??
                'Изменяет расположение некоторых элементов интерфейса в соответствии с выбранной стороной',
          'settings.interface.showSearchBarInPreviewGrid' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.showSearchBarInPreviewGrid', {}) ??
                'Показывать строку поиска в сетке превью',
          'settings.interface.moveInputToTopInSearchView' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.moveInputToTopInSearchView', {}) ??
                'Переместить поле ввода вверх на экране поиска',
          'settings.interface.searchViewQuickActionsPanel' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewQuickActionsPanel', {}) ??
                'Панель быстрых действий на экране поиска',
          'settings.interface.searchViewInputAutofocus' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewInputAutofocus', {}) ?? 'Автофокус поля ввода на экране поиска',
          'settings.interface.disableVibration' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibration', {}) ?? 'Отключить вибрацию',
          'settings.interface.disableVibrationSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibrationSubtitle', {}) ??
                'Может всё ещё происходить при некоторых действиях даже при отключении',
          'settings.interface.previewColumnsPortrait' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsPortrait', {}) ?? 'Столбцы превью (портрет)',
          'settings.interface.previewColumnsLandscape' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsLandscape', {}) ?? 'Столбцы превью (ландшафт)',
          'settings.interface.previewQuality' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQuality', {}) ?? 'Качество превью',
          'settings.interface.previewQualityHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelp', {}) ?? 'Изменяет разрешение изображений в сетке превью',
          'settings.interface.previewQualityHelpSample' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpSample', {}) ??
                ' - Семплы - Среднее разрешение, приложение также загрузит качество Миниатюры в качестве заполнителя, пока загружается более высокое качество',
          'settings.interface.previewQualityHelpThumbnail' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpThumbnail', {}) ?? ' - Миниатюра - Низкое разрешение',
          'settings.interface.previewQualityHelpNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpNote', {}) ??
                '[Примечание]: Качество "Семплы" может заметно снизить производительность, особенно если у тебя слишком много столбцов в сетке превью',
          'settings.interface.previewDisplay' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplay', {}) ?? 'Отображение превью',
          'settings.interface.previewDisplayFallback' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallback', {}) ?? 'Резервное отображение превью',
          'settings.interface.previewDisplayFallbackHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallbackHelp', {}) ??
                'Это будет использоваться, когда опция Ступенчатый невозможна',
          'settings.interface.dontScaleImages' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImages', {}) ?? 'Не масштабировать изображения',
          'settings.interface.dontScaleImagesSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesSubtitle', {}) ?? 'Может снизить производительность',
          'settings.interface.dontScaleImagesWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningTitle', {}) ?? 'Предупреждение',
          'settings.interface.dontScaleImagesWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarning', {}) ??
                'Ты уверен, что хочешь отключить масштабирование изображений?',
          'settings.interface.dontScaleImagesWarningMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningMsg', {}) ??
                'Это может негативно повлиять на производительность, особенно на старых устройствах',
          'settings.interface.gifThumbnails' => TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnails', {}) ?? 'GIF превью',
          'settings.interface.gifThumbnailsRequires' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnailsRequires', {}) ?? 'Требует "Не масштабировать изображения"',
          'settings.interface.scrollPreviewsButtonsPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.scrollPreviewsButtonsPosition', {}) ?? 'Позиция кнопок прокрутки превью',
          'settings.interface.mouseWheelScrollModifier' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.mouseWheelScrollModifier', {}) ?? 'Модификатор прокрутки колёсиком мыши',
          'settings.interface.scrollModifier' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.scrollModifier', {}) ?? 'Модификатор прокрутки',
          'settings.interface.previewQualityValues.thumbnail' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.thumbnail', {}) ?? 'Превью',
          'settings.interface.previewQualityValues.sample' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.sample', {}) ?? 'Сэмпл',
          'settings.interface.previewDisplayModeValues.square' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.square', {}) ?? 'Квадрат',
          'settings.interface.previewDisplayModeValues.rectangle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.rectangle', {}) ?? 'Прямоугольник',
          'settings.interface.previewDisplayModeValues.staggered' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.staggered', {}) ?? 'Шахматный',
          'settings.interface.appModeValues.desktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.desktop', {}) ?? 'Компьютер',
          'settings.interface.appModeValues.mobile' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.mobile', {}) ?? 'Мобильный',
          'settings.interface.handSideValues.left' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.left', {}) ?? 'Левая',
          'settings.interface.handSideValues.right' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.right', {}) ?? 'Правая',
          'settings.theme.title' => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? 'Темы',
          'settings.theme.themeMode' => TranslationOverrides.string(_root.$meta, 'settings.theme.themeMode', {}) ?? 'Режим темы',
          'settings.theme.blackBg' => TranslationOverrides.string(_root.$meta, 'settings.theme.blackBg', {}) ?? 'Чёрный фон',
          'settings.theme.useDynamicColor' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? 'Использовать динамический цвет',
          'settings.theme.android12PlusOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.android12PlusOnly', {}) ?? 'Только на Android 12+',
          'settings.theme.theme' => TranslationOverrides.string(_root.$meta, 'settings.theme.theme', {}) ?? 'Тема',
          'settings.theme.primaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? 'Основной цвет',
          'settings.theme.secondaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? 'Вторичный цвет',
          'settings.theme.enableDrawerMascot' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.enableDrawerMascot', {}) ?? 'Включить маскот в меню',
          'settings.theme.setCustomMascot' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.setCustomMascot', {}) ?? 'Установить пользовательский маскот',
          'settings.theme.removeCustomMascot' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? 'Удалить пользовательский маскот',
          'settings.theme.currentMascotPath' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.currentMascotPath', {}) ?? 'Текущий путь к маскоту',
          'settings.theme.system' => TranslationOverrides.string(_root.$meta, 'settings.theme.system', {}) ?? 'Системная',
          'settings.theme.light' => TranslationOverrides.string(_root.$meta, 'settings.theme.light', {}) ?? 'Светлая',
          'settings.theme.dark' => TranslationOverrides.string(_root.$meta, 'settings.theme.dark', {}) ?? 'Тёмная',
          'settings.theme.pink' => TranslationOverrides.string(_root.$meta, 'settings.theme.pink', {}) ?? 'Розовая',
          'settings.theme.purple' => TranslationOverrides.string(_root.$meta, 'settings.theme.purple', {}) ?? 'Фиолетовая',
          'settings.theme.blue' => TranslationOverrides.string(_root.$meta, 'settings.theme.blue', {}) ?? 'Синяя',
          'settings.theme.teal' => TranslationOverrides.string(_root.$meta, 'settings.theme.teal', {}) ?? 'Бирюзовая',
          'settings.theme.red' => TranslationOverrides.string(_root.$meta, 'settings.theme.red', {}) ?? 'Красная',
          'settings.theme.green' => TranslationOverrides.string(_root.$meta, 'settings.theme.green', {}) ?? 'Зелёная',
          'settings.theme.halloween' => TranslationOverrides.string(_root.$meta, 'settings.theme.halloween', {}) ?? 'Хэллоуин',
          'settings.theme.custom' => TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? 'Пользовательская',
          'settings.theme.selectColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.selectColor', {}) ?? 'Выбери цвет',
          'settings.theme.selectedColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColor', {}) ?? 'Выбранный цвет',
          'settings.theme.selectedColorAndShades' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColorAndShades', {}) ?? 'Выбранный цвет и его оттенки',
          'settings.theme.fontFamily' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontFamily', {}) ?? 'Шрифт',
          'settings.theme.systemDefault' => TranslationOverrides.string(_root.$meta, 'settings.theme.systemDefault', {}) ?? 'Системный',
          'settings.theme.viewMoreFonts' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.viewMoreFonts', {}) ?? 'Посмотреть больше шрифтов',
          'settings.theme.fontPreviewText' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.fontPreviewText', {}) ??
                'Съешь ещё этих мягких французских булок, да выпей же чаю',
          'settings.theme.customFont' => TranslationOverrides.string(_root.$meta, 'settings.theme.customFont', {}) ?? 'Свой шрифт',
          'settings.theme.customFontSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.customFontSubtitle', {}) ?? 'Введи имя любого шрифта Google',
          'settings.theme.fontName' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontName', {}) ?? 'Имя шрифта',
          'settings.theme.customFontHint' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.customFontHint', {}) ?? 'Смотри шрифты на fonts.google.com',
          'settings.theme.fontNotFound' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontNotFound', {}) ?? 'Шрифт не найден',
          'settings.viewer.title' => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? 'Просмотрщик',
          'settings.viewer.preloadAmount' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadAmount', {}) ?? 'Количество предзагрузки',
          'settings.viewer.preloadSizeLimit' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimit', {}) ?? 'Лимит размера предзагрузки',
          'settings.viewer.preloadSizeLimitSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimitSubtitle', {}) ?? 'в ГБ, 0 для отключения лимита',
          'settings.viewer.imageQuality' => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQuality', {}) ?? 'Качество изображения',
          'settings.viewer.viewerScrollDirection' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerScrollDirection', {}) ?? 'Направление прокрутки просмотрщика',
          'settings.viewer.viewerToolbarPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerToolbarPosition', {}) ?? 'Позиция панели инструментов просмотрщика',
          'settings.viewer.zoomButtonPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.zoomButtonPosition', {}) ?? 'Позиция кнопки масштабирования',
          'settings.viewer.changePageButtonsPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.changePageButtonsPosition', {}) ?? 'Позиция кнопок смены страниц',
          'settings.viewer.hideToolbarWhenOpeningViewer' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.hideToolbarWhenOpeningViewer', {}) ??
                'Скрывать панель инструментов при открытии просмотрщика',
          'settings.viewer.expandDetailsByDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.expandDetailsByDefault', {}) ?? 'Раскрывать детали по умолчанию',
          'settings.viewer.hideTranslationNotesByDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.hideTranslationNotesByDefault', {}) ?? 'Скрывать заметки перевода по умолчанию',
          'settings.viewer.enableRotation' => TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotation', {}) ?? 'Включить вращение',
          'settings.viewer.enableRotationSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotationSubtitle', {}) ??
                'Двойное нажатие для сброса (работает только на изображениях)',
          'settings.viewer.toolbarButtonsOrder' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarButtonsOrder', {}) ?? 'Порядок кнопок панели инструментов',
          'settings.viewer.buttonsOrder' => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonsOrder', {}) ?? 'Порядок кнопок',
          'settings.viewer.longPressToChangeItemOrder' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToChangeItemOrder', {}) ??
                'Длительное нажатие для изменения порядка элементов.',
          'settings.viewer.atLeast4ButtonsVisibleOnToolbar' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.atLeast4ButtonsVisibleOnToolbar', {}) ??
                'Минимум 4 кнопки из этого списка всегда будут видны на панели инструментов.',
          'settings.viewer.otherButtonsWillGoIntoOverflow' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.otherButtonsWillGoIntoOverflow', {}) ??
                'Остальные кнопки перейдут в меню переполнения (три точки).',
          'settings.viewer.longPressToMoveItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToMoveItems', {}) ?? 'Длительное нажатие для перемещения элементов',
          'settings.viewer.onlyForVideos' => TranslationOverrides.string(_root.$meta, 'settings.viewer.onlyForVideos', {}) ?? 'Только для видео',
          'settings.viewer.thisButtonCannotBeDisabled' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.thisButtonCannotBeDisabled', {}) ?? 'Эта кнопка не может быть отключена',
          'settings.viewer.defaultShareAction' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.defaultShareAction', {}) ?? 'Действие при "Поделиться" по умолчанию',
          'settings.viewer.shareActions' => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActions', {}) ?? 'Поделиться',
          'settings.viewer.shareActionsAsk' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsAsk', {}) ?? '- Спросить - всегда спрашивать, как поделиться',
          'settings.viewer.shareActionsPostURL' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURL', {}) ?? '- Ссылка на пост',
          'settings.viewer.shareActionsFileURL' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFileURL', {}) ??
                '- Ссылка на файл - делиться прямой ссылкой на оригинальный файл (может не работать с некоторыми сайтами)',
          'settings.viewer.shareActionsPostURLFileURLFileWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURLFileURLFileWithTags', {}) ??
                '- Ссылка на пост/Ссылка на файл/Файл с тегами - делиться ссылкой/файлом и тегами, которые ты выберешь',
          'settings.viewer.shareActionsFile' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFile', {}) ??
                '- Файл - делиться самим файлом, может занять некоторое время для загрузки, прогресс будет показан на кнопке Поделиться',
          'settings.viewer.shareActionsHydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsHydrus', {}) ??
                '- Hydrus - отправляет ссылку поста в Hydrus для импорта',
          'settings.viewer.shareActionsNoteIfFileSavedInCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsNoteIfFileSavedInCache', {}) ??
                '[Примечание]: Если файл сохранён в кэше, он будет загружен оттуда. В противном случае он будет загружен снова из сети.',
          'settings.viewer.shareActionsTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsTip', {}) ??
                '[Совет]: Ты можешь открыть меню действий Поделиться, длительно нажав кнопку Поделиться.',
          'settings.viewer.useVolumeButtonsForScrolling' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.useVolumeButtonsForScrolling', {}) ??
                'Использовать кнопки громкости для прокрутки',
          'settings.viewer.volumeButtonsScrolling' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrolling', {}) ?? 'Прокрутка кнопками громкости',
          'settings.viewer.volumeButtonsScrollingHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollingHelp', {}) ??
                'Используй кнопки громкости для прокрутки превью и просмотрщика',
          'settings.viewer.volumeButtonsVolumeDown' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeDown', {}) ?? ' - Громкость вниз - следующий элемент',
          'settings.viewer.volumeButtonsVolumeUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeUp', {}) ?? ' - Громкость вверх - предыдущий элемент',
          'settings.viewer.volumeButtonsInViewer' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsInViewer', {}) ?? 'В просмотрщике:',
          'settings.viewer.volumeButtonsToolbarVisible' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarVisible', {}) ??
                ' - Панель инструментов видна - управляет громкостью',
          'settings.viewer.volumeButtonsToolbarHidden' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarHidden', {}) ??
                ' - Панель инструментов скрыта - управляет прокруткой',
          'settings.viewer.volumeButtonsScrollSpeed' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollSpeed', {}) ?? 'Скорость прокрутки кнопками громкости',
          'settings.viewer.slideshowDurationInMs' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowDurationInMs', {}) ?? 'Длительность слайдшоу (в мс)',
          'settings.viewer.slideshow' => TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshow', {}) ?? 'Слайдшоу',
          'settings.viewer.slideshowWIPNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowWIPNote', {}) ?? '[WIP] Видео/гифки: только прокрутка вручную',
          'settings.viewer.preventDeviceFromSleeping' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preventDeviceFromSleeping', {}) ??
                'Предотвратить переход устройства в спящий режим',
          'settings.viewer.viewerOpenCloseAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerOpenCloseAnimation', {}) ?? 'Анимация открытия/закрытия просмотрщика',
          'settings.viewer.viewerPageChangeAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerPageChangeAnimation', {}) ?? 'Анимация смены страниц просмотрщика',
          'settings.viewer.usingDefaultAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.usingDefaultAnimation', {}) ?? 'Использование анимации по умолчанию',
          'settings.viewer.usingCustomAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.usingCustomAnimation', {}) ?? 'Анимация просмотрщика',
          'settings.viewer.kannaLoadingGif' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.kannaLoadingGif', {}) ?? 'GIF-пасхалка во время загрузки',
          'settings.viewer.imageQualityValues.sample' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.sample', {}) ?? 'Сэмпл',
          'settings.viewer.imageQualityValues.fullRes' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.fullRes', {}) ?? 'Оригинал',
          'settings.viewer.scrollDirectionValues.horizontal' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.horizontal', {}) ?? 'Горизонтально',
          'settings.viewer.scrollDirectionValues.vertical' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.vertical', {}) ?? 'Вертикально',
          'settings.viewer.toolbarPositionValues.top' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.top', {}) ?? 'Сверху',
          'settings.viewer.toolbarPositionValues.bottom' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.bottom', {}) ?? 'Снизу',
          'settings.viewer.buttonPositionValues.disabled' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.disabled', {}) ?? 'Отключено',
          'settings.viewer.buttonPositionValues.left' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.left', {}) ?? 'Слева',
          'settings.viewer.buttonPositionValues.right' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.right', {}) ?? 'Справа',
          'settings.viewer.shareActionValues.ask' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.ask', {}) ?? 'Спрашивать',
          'settings.viewer.shareActionValues.postUrl' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrl', {}) ?? 'URL поста',
          'settings.viewer.shareActionValues.postUrlWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrlWithTags', {}) ?? 'URL поста с тегами',
          'settings.viewer.shareActionValues.fileUrl' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrl', {}) ?? 'URL файла',
          'settings.viewer.shareActionValues.fileUrlWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrlWithTags', {}) ?? 'URL файла с тегами',
          'settings.viewer.shareActionValues.file' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.file', {}) ?? 'Файл',
          'settings.viewer.shareActionValues.fileWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileWithTags', {}) ?? 'Файл с тегами',
          'settings.viewer.shareActionValues.hydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.hydrus', {}) ?? 'Hydrus',
          'settings.video.title' => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? 'Видео',
          'settings.video.disableVideos' => TranslationOverrides.string(_root.$meta, 'settings.video.disableVideos', {}) ?? 'Отключить видео',
          'settings.video.disableVideosHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.disableVideosHelp', {}) ??
                'Полезно на слабых устройствах, которые вылетают при попытке загрузить видео. Даёт возможность просмотреть видео во внешнем плеере или браузере.',
          'settings.video.autoplayVideos' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.autoplayVideos', {}) ?? 'Автовоспроизведение видео',
          'settings.video.startVideosMuted' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.startVideosMuted', {}) ?? 'Запускать видео без звука',
          'settings.video.experimental' => TranslationOverrides.string(_root.$meta, 'settings.video.experimental', {}) ?? '[Экспериментально]',
          'settings.video.longTapToFastForwardVideo' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.longTapToFastForwardVideo', {}) ?? 'Длительное нажатие для перемотки видео',
          'settings.video.longTapToFastForwardVideoHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.longTapToFastForwardVideoHelp', {}) ??
                'Когда это включено, панель инструментов можно скрыть нажатием, когда элементы управления видео видны. [Экспериментально] Может стать поведением по умолчанию в будущем.',
          'settings.video.videoPlayerBackend' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoPlayerBackend', {}) ?? 'Движок видеоплеера',
          'settings.video.backendDefault' => TranslationOverrides.string(_root.$meta, 'settings.video.backendDefault', {}) ?? 'По умолчанию',
          'settings.video.backendMPV' => TranslationOverrides.string(_root.$meta, 'settings.video.backendMPV', {}) ?? 'MPV',
          'settings.video.backendMDK' => TranslationOverrides.string(_root.$meta, 'settings.video.backendMDK', {}) ?? 'MDK',
          'settings.video.backendDefaultHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.backendDefaultHelp', {}) ??
                'Основан на exoplayer. Имеет лучшую совместимость с устройствами, могут быть проблемы с 4K видео, некоторыми кодеками или старыми устройствами',
          'settings.video.backendMPVHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.backendMPVHelp', {}) ??
                'Основан на libmpv, имеет продвинутые настройки, которые могут помочь решить проблемы с некоторыми кодеками/устройствами\n[МОЖЕТ ВЫЗВАТЬ ВЫЛЕТЫ]',
          'settings.video.backendMDKHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.backendMDKHelp', {}) ??
                'Основан на libmdk, может иметь лучшую производительность для некоторых кодеков/устройств\n[МОЖЕТ ВЫЗВАТЬ ВЫЛЕТЫ]',
          'settings.video.mpvSettingsHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.mpvSettingsHelp', {}) ??
                'Попробуй разные значения настроек \'MPV\' ниже, если видео не работают корректно или выдают ошибки кодеков:',
          'settings.video.mpvUseHardwareAcceleration' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.mpvUseHardwareAcceleration', {}) ?? 'MPV: использовать аппаратное ускорение',
          'settings.video.mpvVO' => TranslationOverrides.string(_root.$meta, 'settings.video.mpvVO', {}) ?? 'MPV: VO',
          'settings.video.mpvHWDEC' => TranslationOverrides.string(_root.$meta, 'settings.video.mpvHWDEC', {}) ?? 'MPV: HWDEC',
          'settings.video.videoCacheMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoCacheMode', {}) ?? 'Режим кэширования видео',
          'settings.video.cacheModes.title' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.title', {}) ?? 'Режимы кэширования видео',
          'settings.video.cacheModes.streamMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamMode', {}) ??
                '- Потоковый - Не кэшировать, начать воспроизведение как можно скорее',
          'settings.video.cacheModes.cacheMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheMode', {}) ??
                '- Кэш - Сохраняет файл в хранилище устройства, воспроизводит только когда загрузка завершена',
          'settings.video.cacheModes.streamCacheMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamCacheMode', {}) ??
                '- Потоковый+Кэш - Смешанный режим, но в данный момент приводит к двойной загрузке',
          'settings.video.cacheModes.cacheNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheNote', {}) ??
                '[Примечание]: Видео будут кэшироваться только если включено \'Кэшировать медиа\'.',
          'settings.video.cacheModes.desktopWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.desktopWarning', {}) ??
                '[Предупреждение]: На компьютерах потоковый режим может работать некорректно для некоторых сайтов.',
          'settings.video.cacheModeValues.stream' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.stream', {}) ?? 'Потоковый',
          _ => null,
        } ??
        switch (path) {
          'settings.video.cacheModeValues.cache' => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.cache', {}) ?? 'Кэш',
          'settings.video.cacheModeValues.streamCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.streamCache', {}) ?? 'Потоковый+Кэш',
          'settings.video.videoBackendModeValues.normal' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.normal', {}) ?? 'По умолчанию',
          'settings.video.videoBackendModeValues.mpv' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mpv', {}) ?? 'MPV',
          'settings.video.videoBackendModeValues.mdk' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mdk', {}) ?? 'MDK',
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
          'settings.downloads.snatchSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? 'Скачать выбранные',
          'settings.downloads.removeSnatchedStatusFromSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ??
                'Удалить статус скачивания у выбранных',
          'settings.downloads.favouriteSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? 'Добавить выбранные в избранное',
          'settings.downloads.unfavouriteSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? 'Удалить выбранные из избранного',
          'settings.downloads.clearSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? 'Очистить выбранные',
          'settings.downloads.updatingData' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? 'Обновление данных...',
          'settings.database.title' => TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? 'База данных',
          'settings.database.indexingDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? 'Индексирование базы данных',
          'settings.database.droppingIndexes' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? 'Удаление индексов',
          'settings.database.enableDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableDatabase', {}) ?? 'Включить базу данных',
          'settings.database.enableIndexing' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableIndexing', {}) ?? 'Включить индексацию',
          'settings.database.enableSearchHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableSearchHistory', {}) ?? 'Включить историю поиска',
          'settings.database.enableTagTypeFetching' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableTagTypeFetching', {}) ?? 'Включить получение типов тегов',
          'settings.database.sankakuTypeToUpdate' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuTypeToUpdate', {}) ?? 'Тип Sankaku для обновления',
          'settings.database.searchQuery' => TranslationOverrides.string(_root.$meta, 'settings.database.searchQuery', {}) ?? 'Поисковый запрос',
          'settings.database.searchQueryOptional' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchQueryOptional', {}) ?? '(опционально, может замедлить процесс)',
          'settings.database.cantLeavePageNow' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.cantLeavePageNow', {}) ?? 'Нельзя покинуть страницу сейчас!',
          'settings.database.sankakuDataUpdating' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDataUpdating', {}) ??
                'Данные Sankaku обновляются, подожди, пока это закончится, или отмени вручную внизу страницы',
          'settings.database.pleaseWaitTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.pleaseWaitTitle', {}) ?? 'Пожалуйста, подожди!',
          'settings.database.indexesBeingChanged' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexesBeingChanged', {}) ?? 'Индексы изменяются',
          'settings.database.databaseInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfo', {}) ?? 'Хранит избранные и скачанные элементы',
          'settings.database.databaseInfoSnatch' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfoSnatch', {}) ?? 'Уже скачанные элементы не будут скачаны заново',
          'settings.database.indexingInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexingInfo', {}) ??
                'Ускоряет поиск по базе данных, но занимает больше места на диске (до 2 раз).\n\nНе закрывай приложение или этот экран, пока идет индексация.',
          'settings.database.createIndexesDebug' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.createIndexesDebug', {}) ?? 'Создать индексы [Отладка]',
          'settings.database.dropIndexesDebug' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.dropIndexesDebug', {}) ?? 'Удалить индексы [Отладка]',
          'settings.database.searchHistoryInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryInfo', {}) ?? 'Требует включения базы данных.',
          'settings.database.searchHistoryRecords' =>
            ({required int limit}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryRecords', {'limit': limit}) ??
                'Сохраняет последние ${limit} поисков.',
          'settings.database.searchHistoryTapInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryTapInfo', {}) ??
                'Нажми на элемент для действий (Удалить, В избранное...)',
          'settings.database.searchHistoryFavouritesInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryFavouritesInfo', {}) ??
                'Избранные запросы закреплены вверху списка и не будут учитываться в лимите.',
          'settings.database.tagTypeFetchingInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingInfo', {}) ??
                'Подтягивает информацию о типах тегов с поддерживаемых сайтов',
          'settings.database.tagTypeFetchingWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingWarning', {}) ?? 'Может привести к ограничению запросов',
          'settings.database.deleteDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabase', {}) ?? 'Удалить базу данных',
          'settings.database.deleteDatabaseConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabaseConfirm', {}) ?? 'Удалить базу данных?',
          'settings.database.databaseDeleted' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseDeleted', {}) ?? 'База данных удалена!',
          'settings.database.appRestartRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.appRestartRequired', {}) ?? 'Требуется перезапуск приложения!',
          'settings.database.clearSnatchedItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSnatchedItems', {}) ?? 'Очистить загруженные элементы',
          'settings.database.clearAllSnatchedConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearAllSnatchedConfirm', {}) ?? 'Очистить все загруженные элементы?',
          'settings.database.snatchedItemsCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.snatchedItemsCleared', {}) ?? 'Скачанные элементы очищены',
          'settings.database.appRestartMayBeRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.appRestartMayBeRequired', {}) ?? 'Может потребоваться перезапуск приложения!',
          'settings.database.clearFavouritedItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearFavouritedItems', {}) ?? 'Очистить избранные элементы',
          'settings.database.clearAllFavouritedConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearAllFavouritedConfirm', {}) ?? 'Очистить все избранные элементы?',
          'settings.database.favouritesCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.favouritesCleared', {}) ?? 'Избранное очищено',
          'settings.database.clearSearchHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistory', {}) ?? 'Очистить историю поиска',
          'settings.database.clearSearchHistoryConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistoryConfirm', {}) ?? 'Очистить историю поиска?',
          'settings.database.searchHistoryCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryCleared', {}) ?? 'История поиска очищена',
          'settings.database.sankakuFavouritesUpdate' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdate', {}) ?? 'Обновление избранного из Sankaku',
          'settings.database.sankakuFavouritesUpdateStarted' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateStarted', {}) ??
                'Обновление избранного из Sankaku начато',
          'settings.database.sankakuNewUrlsInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuNewUrlsInfo', {}) ??
                'Новые ссылки изображений будут получены для элементов из Sankaku в твоем избранном',
          'settings.database.sankakuDontLeavePage' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDontLeavePage', {}) ??
                'Не покидай эту страницу, пока процесс не завершится или не будет остановлен',
          'settings.database.noSankakuConfigFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.noSankakuConfigFound', {}) ?? 'Конфигурация Sankaku не найдена!',
          'settings.database.sankakuFavouritesUpdateComplete' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateComplete', {}) ??
                'Обновление избранного из Sankaku завершено',
          'settings.database.failedItemsPurgeStartedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeStartedTitle', {}) ?? 'Начата очистка неудачных элементов',
          'settings.database.failedItemsPurgeInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeInfo', {}) ??
                'Элементы, которые не удалось обновить, будут удалены из базы данных',
          'settings.database.updateSankakuUrls' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.updateSankakuUrls', {}) ?? 'Обновить ссылки из Sankaku',
          'settings.database.updating' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.updating', {'count': count}) ?? 'Обновление ${count} элементов:',
          'settings.database.left' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.left', {'count': count}) ?? 'Осталось: ${count}',
          'settings.database.done' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.done', {'count': count}) ?? 'Готово: ${count}',
          'settings.database.failedSkipped' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.failedSkipped', {'count': count}) ?? 'Неудачно/Пропущено: ${count}',
          'settings.database.sankakuRateLimitWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuRateLimitWarning', {}) ??
                'Остановись и попробуй позже, если ты начнёшь видеть, что число \'Неудачно\' постоянно растёт, возможно, ты достиг лимита запросов и/или Sankaku блокирует запросы с твоего IP.',
          'settings.database.skipCurrentItem' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.skipCurrentItem', {}) ?? 'Нажми здесь, чтобы пропустить текущий элемент',
          'settings.database.useIfStuck' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.useIfStuck', {}) ?? 'Используй, если элемент завис',
          'settings.database.pressToStop' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.pressToStop', {}) ?? 'Нажми здесь, чтобы остановить',
          'settings.database.purgeFailedItems' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.purgeFailedItems', {'count': count}) ??
                'Очистить неудачные элементы (${count})',
          'settings.database.retryFailedItems' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.retryFailedItems', {'count': count}) ??
                'Повторить неудачные элементы (${count})',
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
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ?? 'Файлы должны быть в корне папки',
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
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ?? 'База данных сохранена в store.db',
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
          'settings.backupAndRestore.backupTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? 'Бэкап тегов',
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
          'settings.network.enableSelfSignedSSLCertificates' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.enableSelfSignedSSLCertificates', {}) ??
                'Разрешить самоподписанные SSL сертификаты',
          'settings.network.proxy' => TranslationOverrides.string(_root.$meta, 'settings.network.proxy', {}) ?? 'Прокси',
          'settings.network.proxySubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.proxySubtitle', {}) ??
                'Не применяется к режиму потокового видео, используй вместо него режим кэширования видео',
          'settings.network.customUserAgent' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgent', {}) ?? 'Пользовательский user agent',
          'settings.network.customUserAgentTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgentTitle', {}) ?? 'Пользовательский user agent',
          'settings.network.keepEmptyForDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.keepEmptyForDefault', {}) ??
                'Оставь пустым для использования значения по умолчанию',
          'settings.network.defaultUserAgent' =>
            ({required String agent}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.defaultUserAgent', {'agent': agent}) ?? 'По умолчанию: ${agent}',
          'settings.network.userAgentUsedOnRequests' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.userAgentUsedOnRequests', {}) ??
                'Используется для большинства запросов к сайтам и вебвью',
          'settings.network.valueSavedAfterLeaving' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.valueSavedAfterLeaving', {}) ?? 'Сохраняется при закрытии страницы',
          'settings.network.setBrowserUserAgent' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.setBrowserUserAgent', {}) ??
                'Нажми здесь, чтобы установить рекомендуемый user agent браузера (рекомендуется только когда сайты, которые ты используешь, банят небраузерные user agent):',
          'settings.network.cookieCleaner' => TranslationOverrides.string(_root.$meta, 'settings.network.cookieCleaner', {}) ?? 'Очистка куки',
          'settings.network.booru' => TranslationOverrides.string(_root.$meta, 'settings.network.booru', {}) ?? 'Сайт',
          'settings.network.selectBooruToClearCookies' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.selectBooruToClearCookies', {}) ??
                'Выбери сайт для очистки куки или оставь пустым для очистки всех',
          'settings.network.cookiesFor' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookiesFor', {'booruName': booruName}) ?? 'Куки для ${booruName}:',
          'settings.network.cookieDeleted' =>
            ({required String cookieName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookieDeleted', {'cookieName': cookieName}) ??
                'Куки "${cookieName}" удалено',
          'settings.network.clearCookies' => TranslationOverrides.string(_root.$meta, 'settings.network.clearCookies', {}) ?? 'Очистить куки',
          'settings.network.clearCookiesFor' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.clearCookiesFor', {'booruName': booruName}) ??
                'Очистить куки для ${booruName}',
          'settings.network.cookiesForBooruDeleted' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookiesForBooruDeleted', {'booruName': booruName}) ??
                'Куки для ${booruName} удалены',
          'settings.network.allCookiesDeleted' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.allCookiesDeleted', {}) ?? 'Все куки удалены',
          'settings.privacy.title' => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? 'Приватность',
          'settings.privacy.appLock' => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? 'Блокировка приложения',
          'settings.privacy.appLockMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ??
                'Заблокировать приложение вручную или после бездействия. Требует ПИН-код/биометрию',
          'settings.privacy.autoLockAfter' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfter', {}) ?? 'Автоблокировка после',
          'settings.privacy.autoLockAfterTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfterTip', {}) ?? 'в секундах, 0 для отключения',
          'settings.privacy.bluronLeave' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeave', {}) ?? 'Размывать экран при выходе из приложения',
          'settings.privacy.bluronLeaveMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeaveMsg', {}) ??
                'Может не работать на некоторых устройствах из-за системных ограничений',
          'settings.privacy.incognitoKeyboard' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboard', {}) ?? 'Режим инкогнито клавиатуры',
          'settings.privacy.incognitoKeyboardMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboardMsg', {}) ??
                'Запрещает клавиатуре сохранять историю ввода.\nПрименяется к большинству текстовых полей ввода',
          'settings.privacy.appDisplayName' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayName', {}) ?? 'Название приложения',
          'settings.privacy.appDisplayNameDescription' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayNameDescription', {}) ??
                'Изменит название приложения в системном лаунчере',
          'settings.privacy.appAliasChanged' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChanged', {}) ?? 'Название приложения изменено',
          'settings.privacy.appAliasRestartHint' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasRestartHint', {}) ??
                'Изменение названия приложения вступит в силу после перезапуска приложения. Некоторым лаунчерам может потребоваться некоторое время или перезапуск системы для обновления.',
          'settings.privacy.appAliasChangeFailed' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChangeFailed', {}) ??
                'Не удалось изменить название приложения. Пожалуйста, попробуй снова.',
          'settings.privacy.restartNow' => TranslationOverrides.string(_root.$meta, 'settings.privacy.restartNow', {}) ?? 'Перезапустить сейчас',
          'settings.performance.title' => TranslationOverrides.string(_root.$meta, 'settings.performance.title', {}) ?? 'Производительность',
          'settings.performance.lowPerformanceMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceMode', {}) ?? 'Режим низкой производительности',
          'settings.performance.lowPerformanceModeSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeSubtitle', {}) ??
                'Рекомендуется для старых устройств и устройств с низким объёмом оперативной памяти',
          'settings.performance.lowPerformanceModeDialogTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogTitle', {}) ?? 'Режим низкой производительности',
          'settings.performance.lowPerformanceModeDialogDisablesDetailed' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesDetailed', {}) ??
                '- Отключает подробную информацию о прогрессе загрузки',
          'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive', {}) ??
                '- Отключает ресурсоёмкие элементы (размытие, анимированная прозрачность, некоторые анимации...)',
          'settings.performance.lowPerformanceModeDialogSetsOptimal' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogSetsOptimal', {}) ??
                '- Устанавливает оптимальные настройки для этих опций (ты можешь потом изменить их отдельно):',
          'settings.performance.lowPerformanceModeDialogPreviewQuality' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogPreviewQuality', {}) ??
                '   - Качество предпросмотра [Миниатюра]',
          'settings.performance.lowPerformanceModeDialogImageQuality' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogImageQuality', {}) ??
                '   - Качество изображения [Семпл]',
          'settings.performance.lowPerformanceModeDialogPreviewColumns' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogPreviewColumns', {}) ??
                '   - Столбцы превью [2 - портрет, 4 - ландшафт]',
          'settings.performance.lowPerformanceModeDialogPreloadAmount' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogPreloadAmount', {}) ??
                '   - Количество и лимит предзагрузки [0, 0.2]',
          'settings.performance.lowPerformanceModeDialogVideoAutoplay' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogVideoAutoplay', {}) ??
                '   - Автовоспроизведение видео [отключено]',
          'settings.performance.lowPerformanceModeDialogDontScaleImages' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDontScaleImages', {}) ??
                '   - Не масштабировать изображения [отключено]',
          'settings.performance.previewQuality' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.previewQuality', {}) ?? 'Качество превью',
          'settings.performance.imageQuality' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.imageQuality', {}) ?? 'Качество изображения',
          'settings.performance.previewColumnsPortrait' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.previewColumnsPortrait', {}) ?? 'Столбцы превью (портрет)',
          'settings.performance.previewColumnsLandscape' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.previewColumnsLandscape', {}) ?? 'Столбцы превью (ландшафт)',
          'settings.performance.preloadAmount' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.preloadAmount', {}) ?? 'Количество предзагрузки',
          'settings.performance.preloadSizeLimit' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.preloadSizeLimit', {}) ?? 'Лимит размера предзагрузки',
          'settings.performance.preloadSizeLimitSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.preloadSizeLimitSubtitle', {}) ?? 'в ГБ, 0 чтобы убрать лимит',
          'settings.performance.dontScaleImages' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.dontScaleImages', {}) ?? 'Не масштабировать изображения',
          'settings.performance.dontScaleImagesSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.dontScaleImagesSubtitle', {}) ??
                'Отключает масштабирование изображений, которое используется для улучшения производительности',
          'settings.performance.dontScaleImagesWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.dontScaleImagesWarningTitle', {}) ?? 'Предупреждение',
          'settings.performance.dontScaleImagesWarningMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.dontScaleImagesWarningMsg', {}) ??
                'Ты уверен, что хочешь отключить масштабирование изображений?',
          'settings.performance.dontScaleImagesWarningPerformance' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.dontScaleImagesWarningPerformance', {}) ??
                'Это может негативно повлиять на производительность, особенно на старых устройствах',
          'settings.performance.autoplayVideos' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.autoplayVideos', {}) ?? 'Автовоспроизведение видео',
          'settings.performance.disableVideos' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideos', {}) ?? 'Отключить видео',
          'settings.performance.disableVideosHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideosHelp', {}) ??
                'Полезно на слабых устройствах, которые вылетают при попытке загрузить видео. Даёт возможность просмотреть видео во внешнем плеере или браузере.',
          'settings.cache.title' => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? 'Кэш',
          'settings.cache.snatchQuality' => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchQuality', {}) ?? 'Качество сохраненных',
          'settings.cache.snatchCooldown' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.snatchCooldown', {}) ?? 'Задержка между загрузками (в мс)',
          'settings.cache.pleaseEnterAValidTimeout' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.pleaseEnterAValidTimeout', {}) ??
                'Пожалуйста, введи корректное значение времени ожидания',
          'settings.cache.biggerThan10' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.biggerThan10', {}) ?? 'Пожалуйста, введи значение больше 10мс',
          'settings.cache.showDownloadNotifications' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.showDownloadNotifications', {}) ?? 'Показывать уведомления о загрузке',
          'settings.cache.snatchItemsOnFavouriting' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.snatchItemsOnFavouriting', {}) ?? 'Скачивать при добавлении в избранное',
          'settings.cache.favouriteItemsOnSnatching' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.favouriteItemsOnSnatching', {}) ?? 'Добавлять в избранное при сохранении',
          'settings.cache.writeImageDataOnSave' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.writeImageDataOnSave', {}) ?? 'Записывать данные в JSON при сохранении',
          'settings.cache.requiresCustomStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.requiresCustomStorageDirectory', {}) ??
                'Необходимо настроить пользовательскую папку',
          'settings.cache.setStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.setStorageDirectory', {}) ?? 'Назначить папку хранилища',
          'settings.cache.currentPath' =>
            ({required String path}) => TranslationOverrides.string(_root.$meta, 'settings.cache.currentPath', {'path': path}) ?? 'Текущая: ${path}',
          'settings.cache.resetStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.resetStorageDirectory', {}) ?? 'Сбросить папку хранилища',
          'settings.cache.cachePreviews' => TranslationOverrides.string(_root.$meta, 'settings.cache.cachePreviews', {}) ?? 'Кэшировать превью',
          'settings.cache.cacheMedia' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheMedia', {}) ?? 'Кэшировать медиа',
          'settings.cache.videoCacheMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheMode', {}) ?? 'Режим кэширования видео',
          'settings.cache.videoCacheModesTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModesTitle', {}) ?? 'Режимы кэширования видео',
          'settings.cache.videoCacheModeStream' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStream', {}) ??
                '- Потоковый - Не кэшировать, начать воспроизведение как можно скорее',
          'settings.cache.videoCacheModeCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeCache', {}) ??
                '- Кэш - Сохраняет файл в хранилище устройства, воспроизводит только когда загрузка завершена',
          'settings.cache.videoCacheModeStreamCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStreamCache', {}) ??
                '- Потоковый+Кэш - Смешанный режим, но в данный момент приводит к двойной загрузке',
          'settings.cache.videoCacheNoteEnable' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheNoteEnable', {}) ??
                '[Примечание]: Видео будут кэшироваться только если включено \'Кэшировать медиа\'.',
          'settings.cache.videoCacheWarningDesktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheWarningDesktop', {}) ??
                '[Предупреждение]: На компьютерах потоковый режим может работать некорректно для некоторых сайтов.',
          'settings.cache.deleteCacheAfter' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.deleteCacheAfter', {}) ?? 'Удалять кэш после:',
          'settings.cache.cacheSizeLimit' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.cacheSizeLimit', {}) ?? 'Лимит размера кэша (в ГБ)',
          'settings.cache.maximumTotalCacheSize' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.maximumTotalCacheSize', {}) ?? 'Максимальный общий размер кэша',
          'settings.cache.cacheStats' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheStats', {}) ?? 'Статистика кэша:',
          'settings.cache.loading' => TranslationOverrides.string(_root.$meta, 'settings.cache.loading', {}) ?? 'Загрузка...',
          'settings.cache.empty' => TranslationOverrides.string(_root.$meta, 'settings.cache.empty', {}) ?? 'Пусто',
          'settings.cache.inFilesPlural' =>
            ({required String size, required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.cache.inFilesPlural', {'size': size, 'count': count}) ??
                '${size}, ${count} файлов',
          'settings.cache.inFileSingular' =>
            ({required String size}) =>
                TranslationOverrides.string(_root.$meta, 'settings.cache.inFileSingular', {'size': size}) ?? '${size}, 1 файл',
          'settings.cache.cacheTypeTotal' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeTotal', {}) ?? 'Всего',
          'settings.cache.cacheTypeFavicons' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeFavicons', {}) ?? 'Иконки сайтов',
          'settings.cache.cacheTypeThumbnails' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeThumbnails', {}) ?? 'Превью',
          'settings.cache.cacheTypeSamples' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeSamples', {}) ?? 'Семплы',
          'settings.cache.cacheTypeMedia' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeMedia', {}) ?? 'Медиа',
          'settings.cache.cacheTypeWebView' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeWebView', {}) ?? 'Вебвью',
          'settings.cache.cacheCleared' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheCleared', {}) ?? 'Кэш очищен',
          'settings.cache.clearedCacheType' =>
            ({required String type}) =>
                TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheType', {'type': type}) ?? 'Очищен кэш ${type}',
          'settings.cache.clearAllCache' => TranslationOverrides.string(_root.$meta, 'settings.cache.clearAllCache', {}) ?? 'Очистить весь кэш',
          'settings.cache.clearedCacheCompletely' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheCompletely', {}) ?? 'Кэш полностью очищен',
          'settings.cache.appRestartRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.appRestartRequired', {}) ?? 'Может потребоваться перезапуск приложения!',
          'settings.cache.errorExclamation' => TranslationOverrides.string(_root.$meta, 'settings.cache.errorExclamation', {}) ?? 'Ошибка!',
          'settings.cache.notAvailableForPlatform' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.notAvailableForPlatform', {}) ?? 'В данный момент недоступно для этой платформы',
          'settings.tagsFilters.title' => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.title', {}) ?? 'Фильтры тегов',
          'settings.tagsFilters.hated' => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.hated', {}) ?? 'Ненавистные',
          'settings.tagsFilters.loved' => TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.loved', {}) ?? 'Любимые',
          'settings.tagsFilters.duplicateTag' =>
            TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.duplicateTag', {}) ?? 'Дублирующийся тег',
          'settings.tagsFilters.alreadyInList' =>
            ({required String tag, required String type}) =>
                TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.alreadyInList', {'tag': tag, 'type': type}) ??
                '\'${tag}\' уже есть в списке ${type}',
          'settings.tagsFilters.noFiltersFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.noFiltersFound', {}) ?? 'Фильтры не найдены',
          'settings.tagsFilters.noFiltersAdded' =>
            TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.noFiltersAdded', {}) ?? 'Нет фильтров',
          'settings.tagsFilters.removeHated' =>
            TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.removeHated', {}) ?? 'Скрывать элементы с ненавистными тегами',
          'settings.tagsFilters.removeFavourited' =>
            TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.removeFavourited', {}) ?? 'Скрывать избранные элементы',
          'settings.tagsFilters.removeSnatched' =>
            TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.removeSnatched', {}) ?? 'Скрывать скачанные элементы',
          'settings.tagsFilters.removeAI' =>
            TranslationOverrides.string(_root.$meta, 'settings.tagsFilters.removeAI', {}) ?? 'Скрывать элементы с ИИ тегами',
          'settings.sync.title' => TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? 'LoliSync',
          'settings.sync.dbError' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ?? 'База данных должна быть включена чтобы использовать LoliSync',
          'settings.sync.errorTitle' => TranslationOverrides.string(_root.$meta, 'settings.sync.errorTitle', {}) ?? 'Ошибка!',
          'settings.sync.pleaseEnterIPAndPort' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.pleaseEnterIPAndPort', {}) ?? 'Пожалуйста, введи IP адрес и порт.',
          'settings.sync.selectWhatYouWantToDo' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.selectWhatYouWantToDo', {}) ?? 'Выбери, что ты хочешь сделать',
          'settings.sync.sendDataToDevice' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendDataToDevice', {}) ?? 'ОТПРАВИТЬ данные НА другое устройство',
          'settings.sync.receiveDataFromDevice' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.receiveDataFromDevice', {}) ?? 'ПОЛУЧИТЬ данные С другого устройства',
          'settings.sync.senderInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.senderInstructions', {}) ??
                'Запусти сервер на другом устройстве, введи его IP/порт, затем нажми Начать синхронизацию',
          'settings.sync.ipAddress' => TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddress', {}) ?? 'IP адрес',
          'settings.sync.ipAddressPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddressPlaceholder', {}) ?? 'IP адрес хоста (например 192.168.1.1)',
          'settings.sync.port' => TranslationOverrides.string(_root.$meta, 'settings.sync.port', {}) ?? 'Порт',
          'settings.sync.portPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.portPlaceholder', {}) ?? 'Порт хоста (например 7777)',
          'settings.sync.sendFavourites' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavourites', {}) ?? 'Отправить избранное',
          'settings.sync.favouritesCount' =>
            ({required String count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.favouritesCount', {'count': count}) ?? 'Избранное: ${count}',
          'settings.sync.sendFavouritesLegacy' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavouritesLegacy', {}) ?? 'Отправить избранное (Устаревшее)',
          'settings.sync.syncFavsFrom' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFrom', {}) ?? 'Синхронизировать избранное с #...',
          'settings.sync.syncFavsFromHelpText1' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText1', {}) ??
                'Позволяет установить, с какого места должна начаться синхронизация, полезно, если ты уже синхронизировал всё избранное ранее и хочешь синхронизировать только новейшие элементы',
          'settings.sync.syncFavsFromHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText2', {}) ??
                'Если ты хочешь синхронизировать с начала, оставь это поле пустым',
          'settings.sync.syncFavsFromHelpText3' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText3', {}) ??
                'Пример: У тебя есть X элементов в избранном, введи в это поле 100, синхронизация начнётся с элемента #100 и будет продолжаться, пока не достигнет X',
          'settings.sync.syncFavsFromHelpText4' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText4', {}) ?? 'Порядок избранного: От старого (0) к новому (X)',
          'settings.sync.sendSnatchedHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendSnatchedHistory', {}) ?? 'Отправить историю загрузок',
          'settings.sync.snatchedCount' =>
            ({required String count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.snatchedCount', {'count': count}) ?? 'Скачанное: ${count}',
          'settings.sync.syncSnatchedFrom' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFrom', {}) ?? 'Синхронизировать скачанное с #...',
          'settings.sync.syncSnatchedFromHelpText1' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText1', {}) ??
                'Позволяет установить, с какого места должна начаться синхронизация, полезно, если ты уже синхронизировал всю историю загрузок ранее и хочешь синхронизировать только новейшие элементы',
          'settings.sync.syncSnatchedFromHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText2', {}) ??
                'Если ты хочешь синхронизировать с начала, оставь это поле пустым',
          'settings.sync.syncSnatchedFromHelpText3' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText3', {}) ??
                'Пример: У тебя есть X скачанных элементов, введи в это поле 100, синхронизация начнётся с элемента #100 и будет продолжаться, пока не достигнет X',
          'settings.sync.syncSnatchedFromHelpText4' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText4', {}) ??
                'Порядок скачанного: От старого (0) к новому (X)',
          'settings.sync.sendSettings' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSettings', {}) ?? 'Отправить настройки',
          'settings.sync.sendBooruConfigs' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendBooruConfigs', {}) ?? 'Отправить конфигурации сайтов',
          'settings.sync.configsCount' =>
            ({required String count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.configsCount', {'count': count}) ?? 'Сайты: ${count}',
          'settings.sync.sendTabs' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTabs', {}) ?? 'Отправить вкладки',
          'settings.sync.tabsCount' =>
            ({required String count}) => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsCount', {'count': count}) ?? 'Вкладки: ${count}',
          'settings.sync.tabsSyncMode' => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncMode', {}) ?? 'Режим синхронизации вкладок',
          'settings.sync.tabsSyncModeMerge' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeMerge', {}) ??
                'Объединить: Объединить вкладки с этого устройства на другом устройстве, вкладки с неизвестными сайтами и уже существующие вкладки будут проигнорированы',
          'settings.sync.tabsSyncModeReplace' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeReplace', {}) ??
                'Заменить: Полностью заменить вкладки на другом устройстве вкладками с этого устройства',
          'settings.sync.merge' => TranslationOverrides.string(_root.$meta, 'settings.sync.merge', {}) ?? 'Объединить',
          'settings.sync.replace' => TranslationOverrides.string(_root.$meta, 'settings.sync.replace', {}) ?? 'Заменить',
          'settings.sync.sendTags' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTags', {}) ?? 'Отправить теги',
          'settings.sync.tagsCount' =>
            ({required String count}) => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsCount', {'count': count}) ?? 'Теги: ${count}',
          'settings.sync.tagsSyncMode' => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncMode', {}) ?? 'Режим синхронизации тегов',
          'settings.sync.tagsSyncModePreferTypeIfNone' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModePreferTypeIfNone', {}) ??
                'Сохранять тип: Если тег существует с типом тега на другом устройстве, а на этом устройстве нет, он будет пропущен',
          'settings.sync.tagsSyncModeOverwrite' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModeOverwrite', {}) ??
                'Перезаписать: Все теги будут добавлены, если тег и тип тега существуют на другом устройстве, они будут перезаписаны',
          'settings.sync.preferTypeIfNone' => TranslationOverrides.string(_root.$meta, 'settings.sync.preferTypeIfNone', {}) ?? 'Сохранять тип',
          'settings.sync.overwrite' => TranslationOverrides.string(_root.$meta, 'settings.sync.overwrite', {}) ?? 'Перезаписать',
          'settings.sync.testConnection' => TranslationOverrides.string(_root.$meta, 'settings.sync.testConnection', {}) ?? 'Проверить соединение',
          'settings.sync.testConnectionHelpText1' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText1', {}) ??
                'Отправляет тестовый запрос на другое устройство.',
          'settings.sync.testConnectionHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText2', {}) ?? 'Показывает успех/провал уведомлением.',
          'settings.sync.startSync' => TranslationOverrides.string(_root.$meta, 'settings.sync.startSync', {}) ?? 'Начать синхронизацию',
          'settings.sync.portAndIPCannotBeEmpty' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.portAndIPCannotBeEmpty', {}) ?? 'Поля Порт и IP не могут быть пустыми!',
          'settings.sync.nothingSelectedToSync' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.nothingSelectedToSync', {}) ?? 'Ты не выбрал ничего для синхронизации!',
          'settings.sync.statsOfThisDevice' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.statsOfThisDevice', {}) ?? 'Статистика этого устройства:',
          'settings.sync.receiverInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.receiverInstructions', {}) ??
                'Запусти сервер для получения данных. Избегай публичных сетей в целях безопасности',
          'settings.sync.availableNetworkInterfaces' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.availableNetworkInterfaces', {}) ?? 'Доступные сетевые интерфейсы',
          'settings.sync.selectedInterfaceIP' =>
            ({required String ip}) =>
                TranslationOverrides.string(_root.$meta, 'settings.sync.selectedInterfaceIP', {'ip': ip}) ?? 'IP выбранного интерфейса: ${ip}',
          'settings.sync.serverPort' => TranslationOverrides.string(_root.$meta, 'settings.sync.serverPort', {}) ?? 'Порт сервера',
          'settings.sync.serverPortPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.serverPortPlaceholder', {}) ?? '(по умолчанию \'8080\', если поле пусто)',
          'settings.sync.startReceiverServer' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.startReceiverServer', {}) ?? 'Запустить сервер получателя',
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
          'settings.checkForUpdates.whatsNew' => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.whatsNew', {}) ?? 'Что нового',
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
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? 'Перейти к релизам',
          'settings.logs.title' => TranslationOverrides.string(_root.$meta, 'settings.logs.title', {}) ?? 'Логи',
          'settings.logs.shareLogs' => TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogs', {}) ?? 'Поделиться логами',
          'settings.logs.shareLogsWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningTitle', {}) ?? 'Отправить логи в стороннее приложение?',
          'settings.logs.shareLogsWarningMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningMsg', {}) ??
                '[ПРЕДУПРЕЖДЕНИЕ]: Логи могут содержать чувствительную информацию, делитесь с осторожностью!',
          'settings.help.title' => TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? 'Помощь',
          'settings.debug.title' => TranslationOverrides.string(_root.$meta, 'settings.debug.title', {}) ?? 'Дебаг',
          'settings.debug.enabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.enabledSnackbarMsg', {}) ?? 'Дебаг включен!',
          'settings.debug.disabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.disabledSnackbarMsg', {}) ?? 'Дебаг выключен!',
          'settings.debug.alreadyEnabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.alreadyEnabledSnackbarMsg', {}) ?? 'Дебаг уже включен!',
          'settings.debug.showPerformanceGraph' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.showPerformanceGraph', {}) ?? 'Показывать график производительности',
          'settings.debug.showFPSGraph' => TranslationOverrides.string(_root.$meta, 'settings.debug.showFPSGraph', {}) ?? 'Показывать график FPS',
          'settings.debug.showImageStats' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.showImageStats', {}) ?? 'Показывать статистику изображений',
          'settings.debug.showVideoStats' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.showVideoStats', {}) ?? 'Показывать статистику видео',
          'settings.debug.blurImagesAndMuteVideosDevOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.blurImagesAndMuteVideosDevOnly', {}) ??
                'Размывать изображения + отключать звук видео [только для разработчиков]',
          'settings.debug.enableDragScrollOnListsDesktopOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.enableDragScrollOnListsDesktopOnly', {}) ??
                'Включить прокрутку перетаскиванием в списках [только для компьютеров]',
          'settings.debug.animationSpeed' =>
            ({required double speed}) =>
                TranslationOverrides.string(_root.$meta, 'settings.debug.animationSpeed', {'speed': speed}) ?? 'Скорость анимации (${speed})',
          'settings.debug.tagsManager' => TranslationOverrides.string(_root.$meta, 'settings.debug.tagsManager', {}) ?? 'Менеджер тегов',
          'settings.debug.vibration' => TranslationOverrides.string(_root.$meta, 'settings.debug.vibration', {}) ?? 'Вибрация',
          'settings.debug.vibrationTests' => TranslationOverrides.string(_root.$meta, 'settings.debug.vibrationTests', {}) ?? 'Тесты вибрации',
          'settings.debug.duration' => TranslationOverrides.string(_root.$meta, 'settings.debug.duration', {}) ?? 'Длительность',
          'settings.debug.amplitude' => TranslationOverrides.string(_root.$meta, 'settings.debug.amplitude', {}) ?? 'Амплитуда',
          'settings.debug.flutterway' => TranslationOverrides.string(_root.$meta, 'settings.debug.flutterway', {}) ?? 'Flutterway',
          'settings.debug.vibrate' => TranslationOverrides.string(_root.$meta, 'settings.debug.vibrate', {}) ?? 'Вибрировать',
          'settings.debug.resolution' =>
            ({required String width, required String height}) =>
                TranslationOverrides.string(_root.$meta, 'settings.debug.resolution', {'width': width, 'height': height}) ??
                'Разрешение: ${width}x${height}',
          'settings.debug.pixelRatio' =>
            ({required String ratio}) =>
                TranslationOverrides.string(_root.$meta, 'settings.debug.pixelRatio', {'ratio': ratio}) ?? 'Соотношение пикселей: ${ratio}',
          'settings.debug.logger' => TranslationOverrides.string(_root.$meta, 'settings.debug.logger', {}) ?? 'Логгер',
          'settings.debug.webview' => TranslationOverrides.string(_root.$meta, 'settings.debug.webview', {}) ?? 'Вебвью',
          'settings.debug.deleteAllCookies' => TranslationOverrides.string(_root.$meta, 'settings.debug.deleteAllCookies', {}) ?? 'Удалить все куки',
          'settings.debug.clearSecureStorage' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.clearSecureStorage', {}) ?? 'Очистить защищённое хранилище',
          'settings.debug.getSessionString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.getSessionString', {}) ?? 'Получить строку сессии',
          'settings.debug.setSessionString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.setSessionString', {}) ?? 'Установить строку сессии',
          'settings.debug.sessionString' => TranslationOverrides.string(_root.$meta, 'settings.debug.sessionString', {}) ?? 'Строка сессии',
          'settings.debug.restoredSessionFromString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.restoredSessionFromString', {}) ?? 'Сессия восстановлена из строки',
          'settings.logging.logger' => TranslationOverrides.string(_root.$meta, 'settings.logging.logger', {}) ?? 'Логгер',
          'settings.webview.openWebview' => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? 'Открыть вебвью',
          'settings.webview.openWebviewTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? 'чтобы залогиниться или получить куки',
          'settings.dirPicker.directoryName' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryName', {}) ?? 'Имя папки',
          'settings.dirPicker.selectADirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.selectADirectory', {}) ?? 'Выбери папку',
          'settings.dirPicker.closeWithoutChoosing' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.closeWithoutChoosing', {}) ?? 'Ты хочешь закрыть выбор папки без выбора?',
          'settings.dirPicker.no' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.no', {}) ?? 'Нет',
          'settings.dirPicker.yes' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.yes', {}) ?? 'Да',
          'settings.dirPicker.error' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.error', {}) ?? 'Ошибка!',
          'settings.dirPicker.failedToCreateDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.failedToCreateDirectory', {}) ?? 'Не удалось создать папку',
          'settings.dirPicker.directoryNotWritable' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryNotWritable', {}) ?? 'Папка недоступна для записи!',
          'settings.dirPicker.newDirectory' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.newDirectory', {}) ?? 'Новая папка',
          'settings.dirPicker.create' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.create', {}) ?? 'Создать',
          'settings.version' => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? 'Версия',
          'comments.title' => TranslationOverrides.string(_root.$meta, 'comments.title', {}) ?? 'Комментарии',
          'comments.noComments' => TranslationOverrides.string(_root.$meta, 'comments.noComments', {}) ?? 'Нет комментариев',
          'comments.noBooruAPIForComments' =>
            TranslationOverrides.string(_root.$meta, 'comments.noBooruAPIForComments', {}) ?? 'У этого сайта нет комментариев или API для них',
          'pageChanger.title' => TranslationOverrides.string(_root.$meta, 'pageChanger.title', {}) ?? 'Переключатель страниц',
          'pageChanger.pageLabel' => TranslationOverrides.string(_root.$meta, 'pageChanger.pageLabel', {}) ?? 'Страница №',
          'pageChanger.delayBetweenLoadings' =>
            TranslationOverrides.string(_root.$meta, 'pageChanger.delayBetweenLoadings', {}) ?? 'Задержка между загрузками (мс)',
          'pageChanger.delayInMs' => TranslationOverrides.string(_root.$meta, 'pageChanger.delayInMs', {}) ?? 'Задержка в мс',
          'pageChanger.currentPage' =>
            ({required int number}) =>
                TranslationOverrides.string(_root.$meta, 'pageChanger.currentPage', {'number': number}) ?? 'Текущая страница №${number}',
          'pageChanger.possibleMaxPage' =>
            ({required int number}) =>
                TranslationOverrides.string(_root.$meta, 'pageChanger.possibleMaxPage', {'number': number}) ?? 'Возможная макс. страница №~${number}',
          'pageChanger.searchCurrentlyRunning' =>
            TranslationOverrides.string(_root.$meta, 'pageChanger.searchCurrentlyRunning', {}) ?? 'В данный момент выполняется поиск!',
          'pageChanger.jumpToPage' => TranslationOverrides.string(_root.$meta, 'pageChanger.jumpToPage', {}) ?? 'Перейти на страницу',
          'pageChanger.searchUntilPage' => TranslationOverrides.string(_root.$meta, 'pageChanger.searchUntilPage', {}) ?? 'Искать до страницы',
          'pageChanger.stopSearching' => TranslationOverrides.string(_root.$meta, 'pageChanger.stopSearching', {}) ?? 'Остановить поиск',
          'tagsFiltersDialogs.emptyInput' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.emptyInput', {}) ?? 'Пустой ввод!',
          'tagsFiltersDialogs.addNewFilter' =>
            ({required String type}) =>
                TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.addNewFilter', {'type': type}) ?? '[Добавить новый фильтр: ${type}]',
          'tagsFiltersDialogs.newTagFilter' =>
            ({required String type}) =>
                TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newTagFilter', {'type': type}) ?? 'Новый фильтр тега типа: ${type}',
          'tagsFiltersDialogs.newFilter' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newFilter', {}) ?? 'Новый фильтр',
          'tagsFiltersDialogs.editFilter' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.editFilter', {}) ?? 'Изменить фильтр',
          'tagsManager.title' => TranslationOverrides.string(_root.$meta, 'tagsManager.title', {}) ?? 'Теги',
          'tagsManager.addTag' => TranslationOverrides.string(_root.$meta, 'tagsManager.addTag', {}) ?? 'Добавить тег',
          'tagsManager.name' => TranslationOverrides.string(_root.$meta, 'tagsManager.name', {}) ?? 'Имя',
          'tagsManager.type' => TranslationOverrides.string(_root.$meta, 'tagsManager.type', {}) ?? 'Тип',
          'tagsManager.add' => TranslationOverrides.string(_root.$meta, 'tagsManager.add', {}) ?? 'Добавить',
          'tagsManager.staleAfter' =>
            ({required String staleText}) =>
                TranslationOverrides.string(_root.$meta, 'tagsManager.staleAfter', {'staleText': staleText}) ?? 'Устаревает после: ${staleText}',
          'tagsManager.addedATab' => TranslationOverrides.string(_root.$meta, 'tagsManager.addedATab', {}) ?? 'Вкладка добавлена',
          'tagsManager.addATab' => TranslationOverrides.string(_root.$meta, 'tagsManager.addATab', {}) ?? 'Добавить вкладку',
          'tagsManager.copy' => TranslationOverrides.string(_root.$meta, 'tagsManager.copy', {}) ?? 'Копировать',
          'tagsManager.setStale' => TranslationOverrides.string(_root.$meta, 'tagsManager.setStale', {}) ?? 'Установить как устаревший',
          'tagsManager.resetStale' => TranslationOverrides.string(_root.$meta, 'tagsManager.resetStale', {}) ?? 'Сбросить устаревание',
          'tagsManager.makeUnstaleable' => TranslationOverrides.string(_root.$meta, 'tagsManager.makeUnstaleable', {}) ?? 'Сделать не устаревающим',
          'tagsManager.deleteTags' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'tagsManager.deleteTags', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
                  count,
                  one: 'Удалить ${count} тег',
                  few: 'Удалить ${count} тега',
                  many: 'Удалить ${count} тегов',
                  other: 'Удалить ${count} тегов',
                ),
          'tagsManager.deleteTagsTitle' => TranslationOverrides.string(_root.$meta, 'tagsManager.deleteTagsTitle', {}) ?? 'Удалить теги',
          'tagsManager.clearSelection' => TranslationOverrides.string(_root.$meta, 'tagsManager.clearSelection', {}) ?? 'Очистить выбор',
          'lockscreen.tapToAuthenticate' => TranslationOverrides.string(_root.$meta, 'lockscreen.tapToAuthenticate', {}) ?? 'Нажми для входа',
          'lockscreen.devUnlock' => TranslationOverrides.string(_root.$meta, 'lockscreen.devUnlock', {}) ?? 'РАЗБЛОКИРОВАТЬ (ОТЛАДКА)',
          'lockscreen.testingMessage' =>
            TranslationOverrides.string(_root.$meta, 'lockscreen.testingMessage', {}) ??
                '[ТЕСТИРОВАНИЕ]: Нажми это, если ты не можешь разблокировать приложение обычными способами. Сообщи разработчику с подробностями о твоём устройстве.',
          'loliSync.title' => TranslationOverrides.string(_root.$meta, 'loliSync.title', {}) ?? 'LoliSync',
          'loliSync.stopSyncingQuestion' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.stopSyncingQuestion', {}) ?? 'Ты хочешь остановить синхронизацию?',
          'loliSync.stopServerQuestion' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.stopServerQuestion', {}) ?? 'Ты хочешь остановить сервер?',
          'loliSync.noConnection' => TranslationOverrides.string(_root.$meta, 'loliSync.noConnection', {}) ?? 'Нет соединения',
          'loliSync.waitingForConnection' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.waitingForConnection', {}) ?? 'Ожидание соединения...',
          'loliSync.startingServer' => TranslationOverrides.string(_root.$meta, 'loliSync.startingServer', {}) ?? 'Запуск сервера...',
          'loliSync.keepScreenAwake' => TranslationOverrides.string(_root.$meta, 'loliSync.keepScreenAwake', {}) ?? 'Держать экран активным',
          'loliSync.serverKilled' => TranslationOverrides.string(_root.$meta, 'loliSync.serverKilled', {}) ?? 'Сервер остановлен',
          'loliSync.testError' =>
            ({required int statusCode, required String reasonPhrase}) =>
                TranslationOverrides.string(_root.$meta, 'loliSync.testError', {'statusCode': statusCode, 'reasonPhrase': reasonPhrase}) ??
                'Ошибка теста: ${statusCode} ${reasonPhrase}',
          'loliSync.testErrorException' =>
            ({required String error}) =>
                TranslationOverrides.string(_root.$meta, 'loliSync.testErrorException', {'error': error}) ?? 'Ошибка теста: ${error}',
          'loliSync.testSuccess' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.testSuccess', {}) ?? 'Тестовый запрос получил положительный ответ',
          'loliSync.testSuccessMessage' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.testSuccessMessage', {}) ?? 'Должно быть сообщение \'Тест\' на другом устройстве',
          'imageSearch.title' => TranslationOverrides.string(_root.$meta, 'imageSearch.title', {}) ?? 'Поиск изображений',
          'tagView.tags' => TranslationOverrides.string(_root.$meta, 'tagView.tags', {}) ?? 'Теги',
          'tagView.comments' => TranslationOverrides.string(_root.$meta, 'tagView.comments', {}) ?? 'Комментарии',
          'tagView.showNotes' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'tagView.showNotes', {'count': count}) ?? 'Показать заметки (${count})',
          'tagView.hideNotes' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'tagView.hideNotes', {'count': count}) ?? 'Скрыть заметки (${count})',
          'tagView.loadNotes' => TranslationOverrides.string(_root.$meta, 'tagView.loadNotes', {}) ?? 'Загрузить заметки',
          'tagView.thisTagAlreadyInSearch' =>
            TranslationOverrides.string(_root.$meta, 'tagView.thisTagAlreadyInSearch', {}) ?? 'Этот тег уже есть в текущем поисковом запросе:',
          'tagView.addedToCurrentSearch' =>
            TranslationOverrides.string(_root.$meta, 'tagView.addedToCurrentSearch', {}) ?? 'Добавлено к текущему поисковому запросу:',
          'tagView.addedNewTab' => TranslationOverrides.string(_root.$meta, 'tagView.addedNewTab', {}) ?? 'Добавлена новая вкладка:',
          'tagView.id' => TranslationOverrides.string(_root.$meta, 'tagView.id', {}) ?? 'ID',
          'tagView.postURL' => TranslationOverrides.string(_root.$meta, 'tagView.postURL', {}) ?? 'Ссылка на пост',
          'tagView.posted' => TranslationOverrides.string(_root.$meta, 'tagView.posted', {}) ?? 'Опубликовано',
          'tagView.details' => TranslationOverrides.string(_root.$meta, 'tagView.details', {}) ?? 'Детали',
          'tagView.filename' => TranslationOverrides.string(_root.$meta, 'tagView.filename', {}) ?? 'Имя файла',
          'tagView.url' => TranslationOverrides.string(_root.$meta, 'tagView.url', {}) ?? 'Ссылка',
          'tagView.extension' => TranslationOverrides.string(_root.$meta, 'tagView.extension', {}) ?? 'Расширение',
          'tagView.resolution' => TranslationOverrides.string(_root.$meta, 'tagView.resolution', {}) ?? 'Разрешение',
          'tagView.size' => TranslationOverrides.string(_root.$meta, 'tagView.size', {}) ?? 'Размер',
          'tagView.md5' => TranslationOverrides.string(_root.$meta, 'tagView.md5', {}) ?? 'MD5',
          'tagView.rating' => TranslationOverrides.string(_root.$meta, 'tagView.rating', {}) ?? 'Рейтинг',
          'tagView.score' => TranslationOverrides.string(_root.$meta, 'tagView.score', {}) ?? 'Оценка',
          'tagView.noTagsFound' => TranslationOverrides.string(_root.$meta, 'tagView.noTagsFound', {}) ?? 'Теги не найдены',
          'tagView.copy' => TranslationOverrides.string(_root.$meta, 'tagView.copy', {}) ?? 'Копировать',
          'tagView.removeFromSearch' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromSearch', {}) ?? 'Удалить из поиска',
          'tagView.addToSearch' => TranslationOverrides.string(_root.$meta, 'tagView.addToSearch', {}) ?? 'Добавить в поиск',
          'tagView.addedToSearchBar' => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBar', {}) ?? 'Добавлено в строку поиска:',
          'tagView.addToSearchExclude' =>
            TranslationOverrides.string(_root.$meta, 'tagView.addToSearchExclude', {}) ?? 'Добавить в поиск (Исключить)',
          'tagView.addedToSearchBarExclude' =>
            TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBarExclude', {}) ?? 'Добавлено в строку поиска (Исключить):',
          'tagView.addToLoved' => TranslationOverrides.string(_root.$meta, 'tagView.addToLoved', {}) ?? 'Добавить в любимые',
          'tagView.addToHated' => TranslationOverrides.string(_root.$meta, 'tagView.addToHated', {}) ?? 'Добавить в ненавистные',
          'tagView.removeFromLoved' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromLoved', {}) ?? 'Удалить из любимых',
          'tagView.removeFromHated' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromHated', {}) ?? 'Удалить из ненавистных',
          'tagView.editTag' => TranslationOverrides.string(_root.$meta, 'tagView.editTag', {}) ?? 'Редактировать тег',
          'tagView.copiedSelected' =>
            ({required String type}) =>
                TranslationOverrides.string(_root.$meta, 'tagView.copiedSelected', {'type': type}) ?? '${type}: скопировано в буфер обмена',
          'tagView.selectedText' => TranslationOverrides.string(_root.$meta, 'tagView.selectedText', {}) ?? 'выбранный текст',
          'tagView.source' => TranslationOverrides.string(_root.$meta, 'tagView.source', {}) ?? 'источник',
          'tagView.sourceDialogTitle' => TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogTitle', {}) ?? 'Источник',
          'tagView.sourceDialogText1' =>
            TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogText1', {}) ??
                'Текст в поле источника не может быть открыт как ссылка, либо потому что это не ссылка, либо потому что несколько ссылок в одной строке.',
          'tagView.sourceDialogText2' =>
            TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogText2', {}) ??
                'Ты можешь выбрать любой текст ниже длительным нажатием, затем нажми "Открыть выбранное", чтобы попытаться открыть его как ссылку:',
          'tagView.noTextSelected' => TranslationOverrides.string(_root.$meta, 'tagView.noTextSelected', {}) ?? '[Текст не выбран]',
          'tagView.copySelected' =>
            ({required String type}) => TranslationOverrides.string(_root.$meta, 'tagView.copySelected', {'type': type}) ?? 'Копировать ${type}',
          'tagView.selected' => TranslationOverrides.string(_root.$meta, 'tagView.selected', {}) ?? 'выбранное',
          'tagView.all' => TranslationOverrides.string(_root.$meta, 'tagView.all', {}) ?? 'всё',
          'tagView.openSelected' =>
            ({required String type}) => TranslationOverrides.string(_root.$meta, 'tagView.openSelected', {'type': type}) ?? 'Открыть ${type}',
          'tagView.preview' => TranslationOverrides.string(_root.$meta, 'tagView.preview', {}) ?? 'Предпросмотр',
          'tagView.booru' => TranslationOverrides.string(_root.$meta, 'tagView.booru', {}) ?? 'Сайт',
          'tagView.selectBooruToLoad' => TranslationOverrides.string(_root.$meta, 'tagView.selectBooruToLoad', {}) ?? 'Выбери сайт для загрузки',
          'tagView.previewIsLoading' => TranslationOverrides.string(_root.$meta, 'tagView.previewIsLoading', {}) ?? 'Предпросмотр загружается...',
          'tagView.failedToLoadPreview' =>
            TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreview', {}) ?? 'Не удалось загрузить предпросмотр',
          'tagView.tapToTryAgain' => TranslationOverrides.string(_root.$meta, 'tagView.tapToTryAgain', {}) ?? 'Нажми, чтобы попробовать снова',
          'tagView.copiedFileURL' =>
            TranslationOverrides.string(_root.$meta, 'tagView.copiedFileURL', {}) ?? 'Ссылка на файл скопирована в буфер обмена',
          'tagView.tagPreviews' => TranslationOverrides.string(_root.$meta, 'tagView.tagPreviews', {}) ?? 'Предпросмотры тегов',
          'tagView.currentState' => TranslationOverrides.string(_root.$meta, 'tagView.currentState', {}) ?? 'Текущее состояние',
          'tagView.history' => TranslationOverrides.string(_root.$meta, 'tagView.history', {}) ?? 'История',
          'tagView.failedToLoadPreviewPage' =>
            TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreviewPage', {}) ?? 'Не удалось загрузить страницу предпросмотра',
          'tagView.tryAgain' => TranslationOverrides.string(_root.$meta, 'tagView.tryAgain', {}) ?? 'Попробовать снова',
          'pinnedTags.pinnedTags' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedTags', {}) ?? 'Закрепленные теги',
          'pinnedTags.pinTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinTag', {}) ?? 'Закрепить тег',
          'pinnedTags.unpinTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinTag', {}) ?? 'Открепить тег',
          'pinnedTags.pin' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pin', {}) ?? 'Закрепить',
          'pinnedTags.unpin' => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpin', {}) ?? 'Открепить',
          'pinnedTags.pinQuestion' =>
            ({required String tag}) =>
                TranslationOverrides.string(_root.$meta, 'pinnedTags.pinQuestion', {'tag': tag}) ?? 'Закрепить "${tag}" для быстрого доступа?',
          'pinnedTags.unpinQuestion' =>
            ({required String tag}) =>
                TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinQuestion', {'tag': tag}) ?? 'Убрать "${tag}" из закрепленных тегов?',
          'pinnedTags.onlyForBooru' =>
            ({required String name}) => TranslationOverrides.string(_root.$meta, 'pinnedTags.onlyForBooru', {'name': name}) ?? 'Только для ${name}',
          'pinnedTags.labelsOptional' => TranslationOverrides.string(_root.$meta, 'pinnedTags.labelsOptional', {}) ?? 'Метки (необязательно)',
          'pinnedTags.typeAndEnterToAdd' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.typeAndEnterToAdd', {}) ?? 'Введи и нажми отправить для добавления',
          'pinnedTags.selectExistingLabel' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.selectExistingLabel', {}) ?? 'Выбери существующую метку',
          'pinnedTags.tagPinned' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagPinned', {}) ?? 'Тег закреплен',
          'pinnedTags.pinnedForBooru' =>
            ({required String name, required String labels}) =>
                TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedForBooru', {'name': name, 'labels': labels}) ??
                'Закреплен для ${name}${labels}',
          'pinnedTags.pinnedGloballyWithLabels' =>
            ({required String labels}) =>
                TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedGloballyWithLabels', {'labels': labels}) ?? 'Закреплен глобально${labels}',
          'pinnedTags.tagUnpinned' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagUnpinned', {}) ?? 'Тег откреплен',
          'pinnedTags.all' => TranslationOverrides.string(_root.$meta, 'pinnedTags.all', {}) ?? 'Все',
          'pinnedTags.reorderPinnedTags' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.reorderPinnedTags', {}) ?? 'Поменять порядок закрепленных тегов',
          'pinnedTags.saving' => TranslationOverrides.string(_root.$meta, 'pinnedTags.saving', {}) ?? 'Сохраняется...',
          'pinnedTags.searchPinnedTags' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.searchPinnedTags', {}) ?? 'Искать закрепленные теги...',
          'pinnedTags.reorder' => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorder', {}) ?? 'Поменять порядок',
          'pinnedTags.addTagManually' => TranslationOverrides.string(_root.$meta, 'pinnedTags.addTagManually', {}) ?? 'Добавить тег вручную',
          'pinnedTags.noTagsMatchSearch' => TranslationOverrides.string(_root.$meta, 'pinnedTags.noTagsMatchSearch', {}) ?? 'Нет подходящих тегов',
          'pinnedTags.noPinnedTagsYet' => TranslationOverrides.string(_root.$meta, 'pinnedTags.noPinnedTagsYet', {}) ?? 'Пока нет закрепленных тегов',
          'pinnedTags.editLabels' => TranslationOverrides.string(_root.$meta, 'pinnedTags.editLabels', {}) ?? 'Редактировать метки',
          'pinnedTags.labels' => TranslationOverrides.string(_root.$meta, 'pinnedTags.labels', {}) ?? 'Метки',
          'pinnedTags.addPinnedTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.addPinnedTag', {}) ?? 'Добавить закрепленный тег',
          'pinnedTags.tagQuery' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQuery', {}) ?? 'Строка тега',
          'pinnedTags.tagQueryHint' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQueryHint', {}) ?? 'tag_name',
          'pinnedTags.rawQueryHelp' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.rawQueryHelp', {}) ?? 'Можно ввести любую строку, включая пробелы',
          'searchBar.searchForTags' => TranslationOverrides.string(_root.$meta, 'searchBar.searchForTags', {}) ?? 'Искать теги',
          'searchBar.failedToLoadSuggestions' =>
            ({required String msg}) =>
                TranslationOverrides.string(_root.$meta, 'searchBar.failedToLoadSuggestions', {'msg': msg}) ??
                'Не удалось загрузить предложения. Нажми для повтора${msg}',
          'searchBar.noSuggestionsFound' => TranslationOverrides.string(_root.$meta, 'searchBar.noSuggestionsFound', {}) ?? 'Подсказки не найдены',
          'searchBar.tagSuggestionsNotAvailable' =>
            TranslationOverrides.string(_root.$meta, 'searchBar.tagSuggestionsNotAvailable', {}) ?? 'Предложения тегов недоступны для этого сайта',
          'searchBar.copiedTagToClipboard' =>
            ({required String tag}) =>
                TranslationOverrides.string(_root.$meta, 'searchBar.copiedTagToClipboard', {'tag': tag}) ?? '"${tag}": скопировано в буфер обмена',
          'searchBar.prefix' => TranslationOverrides.string(_root.$meta, 'searchBar.prefix', {}) ?? 'Префикс',
          'searchBar.exclude' => TranslationOverrides.string(_root.$meta, 'searchBar.exclude', {}) ?? 'Исключить (—)',
          'searchBar.booruNumberPrefix' => TranslationOverrides.string(_root.$meta, 'searchBar.booruNumberPrefix', {}) ?? 'Сайт (N#)',
          'searchBar.metatags' => TranslationOverrides.string(_root.$meta, 'searchBar.metatags', {}) ?? 'Метатеги',
          'searchBar.freeMetatags' => TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatags', {}) ?? 'Бесплатные метатеги',
          'searchBar.freeMetatagsDescription' =>
            TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatagsDescription', {}) ??
                'Бесплатные метатеги не учитываются в лимитах поиска тегов',
          'searchBar.free' => TranslationOverrides.string(_root.$meta, 'searchBar.free', {}) ?? 'Бесплатно',
          'searchBar.single' => TranslationOverrides.string(_root.$meta, 'searchBar.single', {}) ?? 'Одиночный',
          'searchBar.range' => TranslationOverrides.string(_root.$meta, 'searchBar.range', {}) ?? 'Диапазон',
          'searchBar.popular' => TranslationOverrides.string(_root.$meta, 'searchBar.popular', {}) ?? 'Популярное',
          'searchBar.selectDate' => TranslationOverrides.string(_root.$meta, 'searchBar.selectDate', {}) ?? 'Выбери дату',
          'searchBar.selectDatesRange' => TranslationOverrides.string(_root.$meta, 'searchBar.selectDatesRange', {}) ?? 'Выбери диапазон дат',
          'searchBar.history' => TranslationOverrides.string(_root.$meta, 'searchBar.history', {}) ?? 'История',
          'searchBar.more' => TranslationOverrides.string(_root.$meta, 'searchBar.more', {}) ?? '...',
          'mobileHome.selectBooruForWebview' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.selectBooruForWebview', {}) ?? 'Выбери сайт для вебвью',
          'mobileHome.lockApp' => TranslationOverrides.string(_root.$meta, 'mobileHome.lockApp', {}) ?? 'Заблокировать приложение',
          'mobileHome.fileAlreadyExists' => TranslationOverrides.string(_root.$meta, 'mobileHome.fileAlreadyExists', {}) ?? 'Файл уже существует',
          _ => null,
        } ??
        switch (path) {
          'mobileHome.failedToDownload' => TranslationOverrides.string(_root.$meta, 'mobileHome.failedToDownload', {}) ?? 'Не удалось загрузить',
          'mobileHome.cancelledByUser' => TranslationOverrides.string(_root.$meta, 'mobileHome.cancelledByUser', {}) ?? 'Отменено пользователем',
          'mobileHome.saveAnyway' => TranslationOverrides.string(_root.$meta, 'mobileHome.saveAnyway', {}) ?? 'Сохранить в любом случае',
          'mobileHome.skip' => TranslationOverrides.string(_root.$meta, 'mobileHome.skip', {}) ?? 'Пропустить',
          'mobileHome.retryAll' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'mobileHome.retryAll', {'count': count}) ?? 'Повторить все (${count})',
          'mobileHome.existingFailedOrCancelledItems' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.existingFailedOrCancelledItems', {}) ??
                'Скачанные ранее, неудачные или отменённые элементы',
          'mobileHome.clearAllRetryableItems' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.clearAllRetryableItems', {}) ?? 'Очистить все элементы для повтора',
          'desktopHome.snatcher' => TranslationOverrides.string(_root.$meta, 'desktopHome.snatcher', {}) ?? 'Загрузчик',
          'desktopHome.addBoorusInSettings' =>
            TranslationOverrides.string(_root.$meta, 'desktopHome.addBoorusInSettings', {}) ?? 'Добавь сайт в настройках',
          'desktopHome.settings' => TranslationOverrides.string(_root.$meta, 'desktopHome.settings', {}) ?? 'Настройки',
          'desktopHome.save' => TranslationOverrides.string(_root.$meta, 'desktopHome.save', {}) ?? 'Сохранить',
          'desktopHome.noItemsSelected' => TranslationOverrides.string(_root.$meta, 'desktopHome.noItemsSelected', {}) ?? 'Ничего не выбрано',
          'galleryView.noItems' => TranslationOverrides.string(_root.$meta, 'galleryView.noItems', {}) ?? 'Нет элементов',
          'galleryView.noItemSelected' => TranslationOverrides.string(_root.$meta, 'galleryView.noItemSelected', {}) ?? 'Нет выбранного элемента',
          'galleryView.close' => TranslationOverrides.string(_root.$meta, 'galleryView.close', {}) ?? 'Закрыть',
          'mediaPreviews.noBooruConfigsFound' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.noBooruConfigsFound', {}) ?? 'Конфигурации сайтов не найдены',
          'mediaPreviews.addNewBooru' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? 'Добавить новый сайт',
          'mediaPreviews.help' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.help', {}) ?? 'Помощь',
          'mediaPreviews.settings' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.settings', {}) ?? 'Настройки',
          'mediaPreviews.restoringPreviousSession' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoringPreviousSession', {}) ?? 'Восстановление предыдущей сессии...',
          'mediaPreviews.copiedFileURL' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.copiedFileURL', {}) ?? 'Ссылка на файл скопирована в буфер обмена!',
          'viewer.tutorial.images' => TranslationOverrides.string(_root.$meta, 'viewer.tutorial.images', {}) ?? 'Изображения',
          'viewer.tutorial.tapLongTapToggleImmersive' =>
            TranslationOverrides.string(_root.$meta, 'viewer.tutorial.tapLongTapToggleImmersive', {}) ??
                'Нажатие/Длительное нажатие: переключить режим погружения',
          'viewer.tutorial.doubleTapFitScreen' =>
            TranslationOverrides.string(_root.$meta, 'viewer.tutorial.doubleTapFitScreen', {}) ??
                'Двойное нажатие: вписать в экран / оригинальный размер / сбросить масштаб',
          'viewer.appBar.cantStartSlideshow' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.cantStartSlideshow', {}) ?? 'Невозможно запустить слайдшоу',
          'viewer.appBar.reachedLastLoadedItem' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.reachedLastLoadedItem', {}) ?? 'Достигнут последний загруженный элемент',
          'viewer.appBar.pause' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.pause', {}) ?? 'Пауза',
          'viewer.appBar.start' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.start', {}) ?? 'Старт',
          'viewer.appBar.unfavourite' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.unfavourite', {}) ?? 'Удалить из избранного',
          'viewer.appBar.deselect' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.deselect', {}) ?? 'Снять выбор',
          'viewer.appBar.reloadWithScaling' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.reloadWithScaling', {}) ?? 'Перезагрузить с масштабированием',
          'viewer.appBar.loadSampleQuality' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadSampleQuality', {}) ?? 'Загрузить семпл качество',
          'viewer.appBar.loadHighQuality' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadHighQuality', {}) ?? 'Загрузить высокое качество',
          'viewer.appBar.dropSnatchedStatus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.dropSnatchedStatus', {}) ?? 'Сбросить статус скачанного',
          'viewer.appBar.setSnatchedStatus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.setSnatchedStatus', {}) ?? 'Установить статус скачанного',
          'viewer.appBar.snatch' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.snatch', {}) ?? 'Скачать',
          'viewer.appBar.forced' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.forced', {}) ?? '(принудительно)',
          'viewer.appBar.hydrusShare' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusShare', {}) ?? 'Поделиться в Hydrus',
          'viewer.appBar.whichUrlToShareToHydrus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.whichUrlToShareToHydrus', {}) ?? 'Какой ссылкой ты хочешь поделиться с Hydrus?',
          'viewer.appBar.postURL' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURL', {}) ?? 'Ссылка на пост',
          'viewer.appBar.fileURL' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURL', {}) ?? 'Ссылка на файл',
          'viewer.appBar.hydrusNotConfigured' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusNotConfigured', {}) ?? 'Hydrus не настроен!',
          'viewer.appBar.shareFile' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareFile', {}) ?? 'Поделиться файлом',
          'viewer.appBar.alreadyDownloadingThisFile' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingThisFile', {}) ??
                'Уже скачивается этот файл для Поделиться, хочешь прервать?',
          'viewer.appBar.alreadyDownloadingFile' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingFile', {}) ??
                'Уже скачивается файл для Поделиться, хочешь прервать текущий файл и поделиться новым файлом?',
          'viewer.appBar.current' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.current', {}) ?? 'Текущий:',
          'viewer.appBar.kNew' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.kNew', {}) ?? 'Новый:',
          'viewer.appBar.shareNew' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareNew', {}) ?? 'Поделиться новым',
          'viewer.appBar.abort' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.abort', {}) ?? 'Прервать',
          'viewer.appBar.error' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.error', {}) ?? 'Ошибка!',
          'viewer.appBar.savingFileError' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.savingFileError', {}) ??
                'Что-то пошло не так при скачивании файла перед отправкой',
          'viewer.appBar.whatToShare' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.whatToShare', {}) ?? 'Чем ты хочешь поделиться?',
          'viewer.appBar.postURLWithTags' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURLWithTags', {}) ?? 'Ссылка на пост с тегами',
          'viewer.appBar.fileURLWithTags' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURLWithTags', {}) ?? 'Ссылка на файл с тегами',
          'viewer.appBar.file' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.file', {}) ?? 'Файл',
          'viewer.appBar.fileWithTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileWithTags', {}) ?? 'Файл с тегами',
          'viewer.appBar.hydrus' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrus', {}) ?? 'Hydrus',
          'viewer.appBar.selectTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.selectTags', {}) ?? 'Выбрать теги',
          'viewer.notes.note' => TranslationOverrides.string(_root.$meta, 'viewer.notes.note', {}) ?? 'Заметка',
          'viewer.notes.notes' => TranslationOverrides.string(_root.$meta, 'viewer.notes.notes', {}) ?? 'Заметки',
          'viewer.notes.coordinates' =>
            ({required int posX, required int posY}) =>
                TranslationOverrides.string(_root.$meta, 'viewer.notes.coordinates', {'posX': posX, 'posY': posY}) ?? 'X:${posX}, Y:${posY}',
          'common.selectABooru' => TranslationOverrides.string(_root.$meta, 'common.selectABooru', {}) ?? 'Выбери сайт',
          'common.booruItemCopiedToClipboard' =>
            TranslationOverrides.string(_root.$meta, 'common.booruItemCopiedToClipboard', {}) ?? 'Элемент скопирован в буфер обмена',
          'gallery.snatchQuestion' => TranslationOverrides.string(_root.$meta, 'gallery.snatchQuestion', {}) ?? 'Загрузить?',
          'gallery.noPostUrl' => TranslationOverrides.string(_root.$meta, 'gallery.noPostUrl', {}) ?? 'Нет ссылки на пост!',
          'gallery.loadingFile' => TranslationOverrides.string(_root.$meta, 'gallery.loadingFile', {}) ?? 'Загрузка файла...',
          'gallery.loadingFileMessage' =>
            TranslationOverrides.string(_root.$meta, 'gallery.loadingFileMessage', {}) ?? 'Это может занять некоторое время, пожалуйста, подожди...',
          'gallery.sources' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'gallery.sources', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
                  count,
                  one: 'Источник',
                  other: 'Источников',
                ),
          'galleryButtons.snatch' => TranslationOverrides.string(_root.$meta, 'galleryButtons.snatch', {}) ?? 'Скачать',
          'galleryButtons.favourite' => TranslationOverrides.string(_root.$meta, 'galleryButtons.favourite', {}) ?? 'В избранное',
          'galleryButtons.info' => TranslationOverrides.string(_root.$meta, 'galleryButtons.info', {}) ?? 'Инфо',
          'galleryButtons.share' => TranslationOverrides.string(_root.$meta, 'galleryButtons.share', {}) ?? 'Поделиться',
          'galleryButtons.select' => TranslationOverrides.string(_root.$meta, 'galleryButtons.select', {}) ?? 'Выбрать',
          'galleryButtons.open' => TranslationOverrides.string(_root.$meta, 'galleryButtons.open', {}) ?? 'Открыть в браузере',
          'galleryButtons.slideshow' => TranslationOverrides.string(_root.$meta, 'galleryButtons.slideshow', {}) ?? 'Слайдшоу',
          'galleryButtons.reloadNoScale' =>
            TranslationOverrides.string(_root.$meta, 'galleryButtons.reloadNoScale', {}) ?? 'Переключить масштабирование',
          'galleryButtons.toggleQuality' => TranslationOverrides.string(_root.$meta, 'galleryButtons.toggleQuality', {}) ?? 'Переключить качество',
          'galleryButtons.externalPlayer' => TranslationOverrides.string(_root.$meta, 'galleryButtons.externalPlayer', {}) ?? 'Внешний плеер',
          'galleryButtons.imageSearch' => TranslationOverrides.string(_root.$meta, 'galleryButtons.imageSearch', {}) ?? 'Поиск по картинке',
          'media.loading.rendering' => TranslationOverrides.string(_root.$meta, 'media.loading.rendering', {}) ?? 'Рендеринг...',
          'media.loading.loadingAndRenderingFromCache' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.loadingAndRenderingFromCache', {}) ?? 'Загрузка и рендеринг из кэша...',
          'media.loading.loadingFromCache' => TranslationOverrides.string(_root.$meta, 'media.loading.loadingFromCache', {}) ?? 'Загрузка из кэша...',
          'media.loading.buffering' => TranslationOverrides.string(_root.$meta, 'media.loading.buffering', {}) ?? 'Буферизация...',
          'media.loading.loading' => TranslationOverrides.string(_root.$meta, 'media.loading.loading', {}) ?? 'Загрузка...',
          'media.loading.loadAnyway' => TranslationOverrides.string(_root.$meta, 'media.loading.loadAnyway', {}) ?? 'Все равно загрузить',
          'media.loading.restartLoading' => TranslationOverrides.string(_root.$meta, 'media.loading.restartLoading', {}) ?? 'Перезапустить загрузку',
          'media.loading.stopLoading' => TranslationOverrides.string(_root.$meta, 'media.loading.stopLoading', {}) ?? 'Остановить загрузку',
          'media.loading.startedSecondsAgo' =>
            ({required int seconds}) =>
                TranslationOverrides.string(_root.$meta, 'media.loading.startedSecondsAgo', {'seconds': seconds}) ?? 'Начато ${seconds}с назад',
          'media.loading.stopReasons.stoppedByUser' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.stoppedByUser', {}) ?? 'Остановлено пользователем',
          'media.loading.stopReasons.loadingError' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.loadingError', {}) ?? 'Ошибка загрузки',
          'media.loading.stopReasons.fileIsTooBig' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.fileIsTooBig', {}) ?? 'Файл слишком большой',
          'media.loading.stopReasons.containsHatedTags' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.containsHatedTags', {}) ?? 'Содержит ненавистные теги',
          'media.loading.stopReasons.videoError' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.videoError', {}) ?? 'Ошибка видео',
          'media.loading.fileIsZeroBytes' => TranslationOverrides.string(_root.$meta, 'media.loading.fileIsZeroBytes', {}) ?? 'Пустой файл',
          'media.loading.fileSize' =>
            ({required String size}) => TranslationOverrides.string(_root.$meta, 'media.loading.fileSize', {'size': size}) ?? 'Размер файла: ${size}',
          'media.loading.sizeLimit' =>
            ({required String limit}) => TranslationOverrides.string(_root.$meta, 'media.loading.sizeLimit', {'limit': limit}) ?? 'Лимит: ${limit}',
          'media.loading.tryChangingVideoBackend' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.tryChangingVideoBackend', {}) ??
                'Частые проблемы с воспроизведением? Попробуй изменить [Настройки > Видео > Движок видеоплеера]',
          'media.video.videosDisabledOrNotSupported' =>
            TranslationOverrides.string(_root.$meta, 'media.video.videosDisabledOrNotSupported', {}) ?? 'Видео отключены или не поддерживаются',
          'media.video.openVideoInExternalPlayer' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openVideoInExternalPlayer', {}) ?? 'Открыть видео во внешнем плеере',
          'media.video.openVideoInBrowser' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openVideoInBrowser', {}) ?? 'Открыть видео в браузере',
          'media.video.failedToLoadItemData' =>
            TranslationOverrides.string(_root.$meta, 'media.video.failedToLoadItemData', {}) ?? 'Не удалось загрузить данные об элементе',
          'media.video.loadingItemData' =>
            TranslationOverrides.string(_root.$meta, 'media.video.loadingItemData', {}) ?? 'Загрузка данных об элементе...',
          'media.video.retry' => TranslationOverrides.string(_root.$meta, 'media.video.retry', {}) ?? 'Повторить',
          'media.video.openFileInBrowser' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openFileInBrowser', {}) ?? 'Открыть файл в браузере',
          'media.video.openPostInBrowser' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openPostInBrowser', {}) ?? 'Открыть пост в браузере',
          'media.video.currentlyChecking' =>
            TranslationOverrides.string(_root.$meta, 'media.video.currentlyChecking', {}) ?? 'В данный момент проверяется:',
          'media.video.unknownFileFormat' =>
            ({required String fileExt}) =>
                TranslationOverrides.string(_root.$meta, 'media.video.unknownFileFormat', {'fileExt': fileExt}) ??
                'Неизвестный формат файла (.${fileExt}), нажми здесь, чтобы открыть в браузере',
          'imageStats.live' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.live', {'count': count}) ?? 'Активно: ${count}',
          'imageStats.pending' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.pending', {'count': count}) ?? 'В ожидании: ${count}',
          'imageStats.total' =>
            ({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.total', {'count': count}) ?? 'Всего: ${count}',
          'imageStats.size' =>
            ({required String size}) => TranslationOverrides.string(_root.$meta, 'imageStats.size', {'size': size}) ?? 'Размер: ${size}',
          'imageStats.max' =>
            ({required String max}) => TranslationOverrides.string(_root.$meta, 'imageStats.max', {'max': max}) ?? 'Максимум: ${max}',
          'preview.error.noResults' => TranslationOverrides.string(_root.$meta, 'preview.error.noResults', {}) ?? 'Нет результатов',
          'preview.error.noResultsSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.noResultsSubtitle', {}) ??
                'Измени поисковый запрос или нажми чтобы попробовать снова',
          'preview.error.reachedEnd' => TranslationOverrides.string(_root.$meta, 'preview.error.reachedEnd', {}) ?? 'Ты достиг конца',
          'preview.error.reachedEndSubtitle' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.reachedEndSubtitle', {'pageNum': pageNum}) ??
                'Загружено ${pageNum} страниц\nНажми здесь, чтобы перезагрузить последнюю страницу',
          'preview.error.loadingPage' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.loadingPage', {'pageNum': pageNum}) ?? 'Загрузка страницы №${pageNum}...',
          'preview.error.startedAgo' =>
            ({required num seconds}) =>
                TranslationOverrides.plural(_root.$meta, 'preview.error.startedAgo', {'seconds': seconds}) ??
                (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
                  seconds,
                  one: 'Начато ${seconds} секунду назад',
                  few: 'Начато ${seconds} секунды назад',
                  many: 'Начато ${seconds} секунд назад',
                  other: 'Начато ${seconds} секунд назад',
                ),
          'preview.error.tapToRetryIfStuck' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetryIfStuck', {}) ??
                'Нажми чтобы попробовать снова, если запрос застрял или идет слишком долго',
          'preview.error.errorLoadingPage' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.errorLoadingPage', {'pageNum': pageNum}) ??
                'Ошибка при загрузке страницы №${pageNum}',
          'preview.error.errorWithMessage' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.errorWithMessage', {}) ?? 'Нажми здесь для повтора',
          'preview.error.errorNoResultsLoaded' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.errorNoResultsLoaded', {}) ?? 'Ошибка, результаты не загружены',
          'preview.error.tapToRetry' => TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetry', {}) ?? 'Нажми здесь для повтора',
          'tagType.artist' => TranslationOverrides.string(_root.$meta, 'tagType.artist', {}) ?? 'Автор',
          'tagType.character' => TranslationOverrides.string(_root.$meta, 'tagType.character', {}) ?? 'Персонаж',
          'tagType.copyright' => TranslationOverrides.string(_root.$meta, 'tagType.copyright', {}) ?? 'Франшиза',
          'tagType.meta' => TranslationOverrides.string(_root.$meta, 'tagType.meta', {}) ?? 'Мета',
          'tagType.species' => TranslationOverrides.string(_root.$meta, 'tagType.species', {}) ?? 'Раса',
          'tagType.none' => TranslationOverrides.string(_root.$meta, 'tagType.none', {}) ?? 'Нет/Общее',
          _ => null,
        };
  }
}
