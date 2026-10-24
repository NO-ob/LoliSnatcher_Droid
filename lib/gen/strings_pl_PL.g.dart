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
class TranslationsPlPl extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  /// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
  TranslationsPlPl({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : _meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.plPl,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
    _meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <pl-PL>.
  final TranslationMetadata<AppLocale, Translations> _meta;
  @override
  TranslationMetadata<AppLocale, Translations> get $meta => _meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => _meta.getTranslation(key) ?? super[key];

  late final TranslationsPlPl _root = this; // ignore: unused_field

  @override
  TranslationsPlPl $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPlPl(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'pl-PL';
  @override
  String get localeName => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'Polski';
  @override
  String get appName => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Błąd';
  @override
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'Błąd!';
  @override
  String get success => TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Sukces';
  @override
  String get successExclamation => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? 'Sukces!';
  @override
  String get cancel => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Anuluj';
  @override
  String get kReturn => TranslationOverrides.string(_root.$meta, 'kReturn', {}) ?? 'Powrót';
  @override
  String get later => TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Później';
  @override
  String get close => TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Zamknij';
  @override
  String get ok => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'OK';
  @override
  String get yes => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Tak';
  @override
  String get no => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'Nie';
  @override
  String get pleaseWait => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Poczekaj…';
  @override
  String get show => TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Pokaż';
  @override
  String get hide => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Ukryj';
  @override
  String get enable => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'Włącz';
  @override
  String get disable => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Wyłącz';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Dodaj';
  @override
  String get edit => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? 'Edytuj';
  @override
  String get remove => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? 'Usuń';
  @override
  String get save => TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Zapisz';
  @override
  String get delete => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? 'Usuń';
  @override
  String get confirm => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? 'Potwierdź';
  @override
  String get retry => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? 'Ponów';
  @override
  String get clear => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? 'Wyczyść';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Kopiuj';
  @override
  String get copied => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Skopiowano';
  @override
  String get copiedToClipboard => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? 'Skopiowano do schowka';
  @override
  String get nothingFound => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? 'Brak wyników';
  @override
  String get paste => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Wklej';
  @override
  String get copyErrorText => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Skopiuj błąd';
  @override
  String get booru => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru';
  @override
  String get goToSettings => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'Przejdź do ustawień';
  @override
  String get thisMayTakeSomeTime => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'To chwilę potrwa…';
  @override
  String get exitTheAppQuestion => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? 'Wyjść z aplikacji?';
  @override
  String get closeTheApp => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Zamknij aplikację';
  @override
  String get invalidUrl => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'Nieprawidłowy URL!';
  @override
  String get clipboardIsEmpty => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'Schowek jest pusty!';
  @override
  String get failedToOpenLink => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'Błąd ładowania linku';
  @override
  String get apiKey => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'Klucz API';
  @override
  String get userId => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'ID Użytkownika';
  @override
  String get login => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Login';
  @override
  String get password => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Hasło';
  @override
  String get pause => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Wstrzymaj';
  @override
  String get resume => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Wznów';
  @override
  String get discord => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord';
  @override
  String get visitOurDiscord => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Odwiedź naszego Discorda';
  @override
  String get item => TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Plik';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'select', {}) ?? 'Zaznacz';
  @override
  String get selectAll => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Zaznacz wszystko';
  @override
  String get reset => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'Resetuj';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'open', {}) ?? 'Otwórz';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? 'Otwórz w nowej karcie';
  @override
  String get move => TranslationOverrides.string(_root.$meta, 'move', {}) ?? 'Przenieś';
  @override
  String get shuffle => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? 'Tasuj';
  @override
  String get sort => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? 'Sortuj';
  @override
  String get go => TranslationOverrides.string(_root.$meta, 'go', {}) ?? 'Przejdź';
  @override
  String get search => TranslationOverrides.string(_root.$meta, 'search', {}) ?? 'Szukaj';
  @override
  String get filter => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? 'Filtruj';
  @override
  String get or => TranslationOverrides.string(_root.$meta, 'or', {}) ?? 'Lub (~)';
  @override
  String get page => TranslationOverrides.string(_root.$meta, 'page', {}) ?? 'Strona';
  @override
  String get pageNumber => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? 'Strona #';
  @override
  String get tags => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'Tagi';
  @override
  String get type => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'Typ';
  @override
  String get name => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Nazwa';
  @override
  String get address => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'Adres IP';
  @override
  String get username => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'Nazwa użytkownika';
  @override
  String get favourites => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'Ulubione';
  @override
  String get downloads => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'Pobrane';
  @override
  late final _Translations$validationErrors$pl_PL validationErrors = _Translations$validationErrors$pl_PL._(_root);
  @override
  late final _Translations$init$pl_PL init = _Translations$init$pl_PL._(_root);
  @override
  late final _Translations$permissions$pl_PL permissions = _Translations$permissions$pl_PL._(_root);
  @override
  late final _Translations$authentication$pl_PL authentication = _Translations$authentication$pl_PL._(_root);
  @override
  late final _Translations$searchHandler$pl_PL searchHandler = _Translations$searchHandler$pl_PL._(_root);
  @override
  late final _Translations$snatcher$pl_PL snatcher = _Translations$snatcher$pl_PL._(_root);
  @override
  late final _Translations$multibooru$pl_PL multibooru = _Translations$multibooru$pl_PL._(_root);
  @override
  late final _Translations$hydrus$pl_PL hydrus = _Translations$hydrus$pl_PL._(_root);
  @override
  late final _Translations$tabs$pl_PL tabs = _Translations$tabs$pl_PL._(_root);
  @override
  late final _Translations$history$pl_PL history = _Translations$history$pl_PL._(_root);
  @override
  late final _Translations$webview$pl_PL webview = _Translations$webview$pl_PL._(_root);
  @override
  late final _Translations$settings$pl_PL settings = _Translations$settings$pl_PL._(_root);
  @override
  late final _Translations$tagView$pl_PL tagView = _Translations$tagView$pl_PL._(_root);
  @override
  late final _Translations$pinnedTags$pl_PL pinnedTags = _Translations$pinnedTags$pl_PL._(_root);
  @override
  late final _Translations$preview$pl_PL preview = _Translations$preview$pl_PL._(_root);
}

// Path: validationErrors
class _Translations$validationErrors$pl_PL extends Translations$validationErrors$en {
  _Translations$validationErrors$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  String get required => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Wprowadź wartość';
  @override
  String get invalid => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Wprowadź prawidłową wartość';
  @override
  String get invalidNumber => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? 'Wpisz liczbę';
  @override
  String get invalidNumericValue => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? 'Wartość musi być liczbą';
  @override
  String tooSmall({required double min}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Wpisz wartość większą niż ${min}';
  @override
  String tooBig({required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Wpisz wartość mniejszą niż ${max}';
  @override
  String rangeError({required double min, required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ?? 'Wpisz wartość między ${min} a ${max}';
  @override
  String get greaterThanOrEqualZero =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? 'Wartość musi być większa niż 0';
  @override
  String get lessThan4 => TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? 'Wartość musi być mniejsza niż 4';
  @override
  String get biggerThan100 => TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? 'Wpisz wartość większą niż 100';
  @override
  String get moreThan4ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ?? 'Więcej niż 4 kolumny obniżają wydajność';
  @override
  String get moreThan8ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ?? 'Więcej niż 8 kolumn obniża wydajność';
}

// Path: init
class _Translations$init$pl_PL extends Translations$init$en {
  _Translations$init$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  String get initError => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Błąd inicjalizacji!';
  @override
  String get settingUpProxy => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Konfigurowanie proxy…';
  @override
  String get loadingDatabase => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Ładowanie bazy danych…';
  @override
  String get loadingBoorus => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Ładowanie booru…';
  @override
  String get loadingTags => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Ładowanie tagów…';
  @override
  String get restoringTabs => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Przywracanie kart…';
}

// Path: permissions
class _Translations$permissions$pl_PL extends Translations$permissions$en {
  _Translations$permissions$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  String get noAccessToCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ?? 'Brak dostępu do niestandardowego katalogu';
  @override
  String get pleaseSetStorageDirectoryAgain =>
      TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ??
      'Proszę ustaw katalog ponownie, aby przyznać dostęp aplikacji do niego';
  @override
  String currentPath({required String path}) =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? 'Obecna ścieżka: ${path}';
  @override
  String get setDirectory => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? 'Wybierz katalog';
  @override
  String get currentlyNotAvailableForThisPlatform =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ?? 'Niedostępne na tym urządzeniu';
  @override
  String get resetDirectory => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? 'Zresetuj katalog';
  @override
  String get afterResetFilesWillBeSavedToDefaultDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ??
      'Pliki będą zapisywane do domyślnego katalogi po restarcie';
}

// Path: authentication
class _Translations$authentication$pl_PL extends Translations$authentication$en {
  _Translations$authentication$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  String get pleaseAuthenticateToUseTheApp =>
      TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ??
      'Proszę potwierdzić tożsamości, aby używać aplikacji';
  @override
  String get noBiometricHardwareAvailable =>
      TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? 'Nie znaleziono sprzętu biometrycznych';
  @override
  String get temporaryLockout => TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? 'Tymczasowa blokada';
  @override
  String somethingWentWrong({required String error}) =>
      TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ??
      'Coś poszło nie tak podczas potwierdzania tożsamości: ${error}';
}

// Path: searchHandler
class _Translations$searchHandler$pl_PL extends Translations$searchHandler$en {
  _Translations$searchHandler$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  String get removedLastTab => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? 'Usunięto ostatnią kartę';
  @override
  String get resettingSearchToDefaultTags =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? 'Resetowanie do domyślnych tagów';
  @override
  String get uoh => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'UOOOOOOOHHH';
  @override
  String get ratingsChanged => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? 'Zmieniono kategorie wiekowe';
  @override
  String ratingsChangedMessage({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
      'W ${booruType} oznaczenie [rating:safe] zostało zastąpione przez [rating:general] i [rating:sensitive]';
  @override
  String get appFixedRatingAutomatically =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ??
      'Automatycznie poprawiono kategorię. Użyj właściwej przy nstepnych wyszukiwaniach';
  @override
  String get tabsRestored => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? 'Karty przywrócone';
  @override
  String restoredTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'Przywrócono ${count} kartę z poprzedniej sesji',
        few: 'Przywrócono ${count} karty z poprzedniej sesji',
        many: 'Przywrócono ${count} kart z poprzedniej sesji',
        other: 'Przywrócono ${count} kart z poprzedniej sesji',
      );
  @override
  String get someRestoredTabsHadIssues =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ??
      'Nie rozpoznano niektórych znaków lub booru w przywróconych kartach.';
  @override
  String get theyWereSetToDefaultOrIgnored =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ??
      'Zostały one przywrócone do domyślnych lub ignorowane.';
  @override
  String get listOfBrokenTabs => TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? 'Lista uszkodzonych kart:';
  @override
  String get tabsMerged => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? 'Karty scalone';
  @override
  String addedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'Dodano ${count} nowych kart',
        few: 'Dodano ${count} nowe karty',
        many: 'Dodano ${count} nowych kart',
        other: 'Dodano ${count} nowych kart',
      );
  @override
  String get tabsReplaced => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? 'Zastąpiono karty';
  @override
  String receivedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'Otrzymano ${count} kartę',
        few: 'Otrzymano ${count} karty',
        many: 'Otrzymano ${count} kart',
        other: 'Otrzymano ${count} kart',
      );
}

// Path: snatcher
class _Translations$snatcher$pl_PL extends Translations$snatcher$en {
  _Translations$snatcher$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Pobieranie';
  @override
  String get snatchingHistory => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'Historia pobierania';
  @override
  String get enterTags => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'Wybierz tagi';
  @override
  String get amount => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? 'Ilość';
  @override
  String get amountOfFilesToSnatch => TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? 'Ilość Plików do pobrania';
  @override
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? 'Opóźnienie (w ms)';
  @override
  String get delayBetweenEachDownload =>
      TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? 'Opóźnienie między pobraniami';
  @override
  String get snatchFiles => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? 'Pobierz pliki';
  @override
  String get itemWasAlreadySnatched => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? 'Plik był już pobierany';
  @override
  String get failedToSnatchItem => TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? 'Pobranie nieudane';
  @override
  String get itemWasCancelled => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? 'Anulowano';
  @override
  String get startingNextQueueItem =>
      TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? 'Rozpoczęto kolejny element z kolejki…';
  @override
  String get itemsSnatched => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? 'Pobrane pliki';
  @override
  String snatchedCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'Pobrano: ${count} element',
        few: 'Pobrano: ${count} elementy',
        many: 'Pobrano: ${count} elementów',
        other: 'Pobrano: ${count} elementów',
      );
  @override
  String filesAlreadySnatched({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: '${count} plik był już pobrany',
        few: '${count} pliki były już pobrane',
        many: '${count} plików było już pobranych',
        other: '${count} plików było już pobranych',
      );
  @override
  String failedToSnatchFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'Nie udało się pobrać ${count} pliku',
        few: 'Nie udało się pobrać ${count} pliki',
        many: 'Nie udało się pobrać ${count} plików',
        other: 'Nie udało się pobrać ${count} plików',
      );
  @override
  String cancelledFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'Anulowano ${count} plik',
        few: 'Anulowano ${count} pliki',
        many: 'Anulowano ${count} plików',
        other: 'Anulowano ${count} plików',
      );
  @override
  String get snatchingImages => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? 'Pobieranie obrazów';
  @override
  String get doNotCloseApp => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? 'Nie zamykaj aplikacji!';
  @override
  String get addedItemToQueue => TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? 'Dodano element do kolejki pobierania';
  @override
  String addedItemsToQueue({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'Dodano ${count} element do kolejki pobierania',
        few: 'Dodano ${count} elementy do kolejki pobierania',
        many: 'Dodano ${count} elementów do kolejki pobierania',
        other: 'Dodano ${count} elementów do kolejki pobierania',
      );
}

// Path: multibooru
class _Translations$multibooru$pl_PL extends Translations$multibooru$en {
  _Translations$multibooru$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? 'Multibooru';
  @override
  String get multibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Tryb Multibooru';
  @override
  String get multibooruRequiresAtLeastTwoBoorus =>
      TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ?? 'Wymagane są przynajmniej 2 booru';
  @override
  String get selectSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Wybierz dodatkowe booru:';
  @override
  String get akaMultibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? 'czyli tryb Multibooru';
  @override
  String get labelSecondaryBoorusToInclude =>
      TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? 'Dodatkowe booru do uwzględnienia';
}

// Path: hydrus
class _Translations$hydrus$pl_PL extends Translations$hydrus$en {
  _Translations$hydrus$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  String get importError => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'Coś poszło nie tak przy imporcie do hydrusa';
  @override
  String get apiPermissionsRequired =>
      TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ??
      'Prawdopodobnie nadano nieprawidłowe uprawnienia API, można to zmienić w sekcji Review Services';
  @override
  String get addTagsToFile => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? 'Dodaj tagi do plików';
  @override
  String get addUrls => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'Dodaj Linki';
}

// Path: tabs
class _Translations$tabs$pl_PL extends Translations$tabs$en {
  _Translations$tabs$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  String get tab => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? 'Karta';
  @override
  String get addBoorusInSettings => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? 'Dodaj booru w ustawieniach';
  @override
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? 'Wybierz Booru';
  @override
  String get secondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? 'Dodatkowe booru';
  @override
  String get addNewTab => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? 'Dodaj nową kartę';
  @override
  String get selectABooruOrLeaveEmpty =>
      TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? 'Wybierz booru lub pozostaw puste';
  @override
  String get addPosition => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? 'Dodaj pozycję';
  @override
  String get addModePrevTab => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? 'Poprzednia karta';
  @override
  String get addModeNextTab => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? 'Następna karta';
  @override
  String get addModeListEnd => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? 'Koniec listy';
  @override
  String get usedQuery => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? 'Użyte zapytanie';
  @override
  String get queryModeDefault => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? 'Domyślna';
  @override
  String get queryModeCurrent => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? 'Obecna';
  @override
  String get queryModeCustom => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? 'Niestandardowa';
  @override
  String get customQuery => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? 'Niestandardowe zapytanie';
  @override
  String get empty => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '[pusta]';
  @override
  String get addSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? 'Dodaj dodatkowe booru';
  @override
  String get keepSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? 'Zachowaj dodatkowe booru';
  @override
  String get startFromCustomPageNumber =>
      TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? 'Zacznij od niestandardowego numeru strony';
  @override
  String get switchToNewTab => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? 'Zmień na nową kartę';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? 'Dodaj';
  @override
  String get tabsManager => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? 'Menedżer kart';
  @override
  String get selectMode => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? 'Tryb wyboru';
  @override
  String get sortMode => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? 'Sortuj karty';
  @override
  String get help => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? 'Pomoc';
  @override
  String get deleteTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? 'Usuń karty';
  @override
  String get shuffleTabs => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? 'Tasuj Karty';
  @override
  String get tabRandomlyShuffled => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? 'Losowa kolejność kart';
  @override
  String get tabOrderSaved => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? 'Zapisano kolejność kart';
  @override
  String get scrollToCurrent => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? 'Przewiń do obecnej karty';
  @override
  String get scrollToTop => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? 'Przewiń w górę';
  @override
  String get scrollToBottom => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? 'Przewiń na dół';
  @override
  String get filterTabsByBooru => TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? 'Filtruj po booru, stanie, duplikatach…';
  @override
  String get scrolling => TranslationOverrides.string(_root.$meta, 'tabs.scrolling', {}) ?? 'Przewijanie:';
  @override
  String get sorting => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? 'Sortowanie:';
  @override
  String get defaultTabsOrder => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? 'Domyślna kolejność kart';
  @override
  String get sortAlphabetically => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? 'Sortuj alfabetyzcznie';
  @override
  String get sortAlphabeticallyReversed =>
      TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? 'Sortuj alfabetycznie (odwrotnie)';
  @override
  String get sortByBooruName => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? 'Sortuj po nazwie booru';
  @override
  String get sortByBooruNameReversed =>
      TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ?? 'Sortuj po nazwie booru (odwrotnie)';
  @override
  String get longPressSortToSave =>
      TranslationOverrides.string(_root.$meta, 'tabs.longPressSortToSave', {}) ?? 'Przytrzymaj przycisk sortowania, aby zapisać obecną kolejność';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? 'Wybierz:';
  @override
  String get toggleSelectMode => TranslationOverrides.string(_root.$meta, 'tabs.toggleSelectMode', {}) ?? 'Przełącz tryb wyboru';
  @override
  String get onTheBottomOfPage => TranslationOverrides.string(_root.$meta, 'tabs.onTheBottomOfPage', {}) ?? 'W dolnej części strony: ';
  @override
  String get selectDeselectAll => TranslationOverrides.string(_root.$meta, 'tabs.selectDeselectAll', {}) ?? 'Zaznacz/odznacz wszystkie karty';
  @override
  String get deleteSelectedTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? 'Usuń zaznaczone karty';
  @override
  String get longPressToMove => TranslationOverrides.string(_root.$meta, 'tabs.longPressToMove', {}) ?? 'Przytrzymaj kartę aby ją przesunąć';
  @override
  String get numbersInBottomRight =>
      TranslationOverrides.string(_root.$meta, 'tabs.numbersInBottomRight', {}) ?? 'Liczby w prawym dolnym rogu karty:';
  @override
  String get firstNumberTabIndex =>
      TranslationOverrides.string(_root.$meta, 'tabs.firstNumberTabIndex', {}) ?? 'Pierwsza liczba - indeks karty w domyślnej kolejności listy';
  @override
  String get secondNumberTabIndex =>
      TranslationOverrides.string(_root.$meta, 'tabs.secondNumberTabIndex', {}) ??
      'Druga liczba - indeks karty w aktualnej kolejności listy, pojawia się po włączeniu filtrowania/sortowania';
  @override
  String get specialFilters => TranslationOverrides.string(_root.$meta, 'tabs.specialFilters', {}) ?? 'Filtry specjalne:';
  @override
  String get loadedFilter =>
      TranslationOverrides.string(_root.$meta, 'tabs.loadedFilter', {}) ?? '„Załadowane” - pokaż karty z załadowanymi elementami';
  @override
  String get notLoadedFilter =>
      TranslationOverrides.string(_root.$meta, 'tabs.notLoadedFilter', {}) ??
      '„Niezaładowane” - pokaż karty, które nie są załadowane i/lub nie zawierają elementów';
  @override
  String get notLoadedItalic => TranslationOverrides.string(_root.$meta, 'tabs.notLoadedItalic', {}) ?? 'Nie załadowane karty mają tekst kursywy';
  @override
  String get noTabsFound => TranslationOverrides.string(_root.$meta, 'tabs.noTabsFound', {}) ?? 'Nie znaleziono kart';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tabs.copy', {}) ?? 'Kopjuj';
  @override
  String get moveAction => TranslationOverrides.string(_root.$meta, 'tabs.moveAction', {}) ?? 'Przenieś';
  @override
  String get remove => TranslationOverrides.string(_root.$meta, 'tabs.remove', {}) ?? 'Usuń';
  @override
  String get shuffle => TranslationOverrides.string(_root.$meta, 'tabs.shuffle', {}) ?? 'Tasuj';
  @override
  String get sort => TranslationOverrides.string(_root.$meta, 'tabs.sort', {}) ?? 'Sortuj';
  @override
  String get shuffleTabsQuestion => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabsQuestion', {}) ?? 'Wymieszać karty losowo?';
  @override
  String get saveTabsInCurrentOrder =>
      TranslationOverrides.string(_root.$meta, 'tabs.saveTabsInCurrentOrder', {}) ?? 'Zapisać obecną kolejność kart?';
  @override
  String get byBooru => TranslationOverrides.string(_root.$meta, 'tabs.byBooru', {}) ?? 'Według booru';
  @override
  String get alphabetically => TranslationOverrides.string(_root.$meta, 'tabs.alphabetically', {}) ?? 'Alfabetycznie';
  @override
  String get reversed => TranslationOverrides.string(_root.$meta, 'tabs.reversed', {}) ?? '(odwrócone)';
  @override
  String areYouSureDeleteTabs({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'tabs.areYouSureDeleteTabs', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'Czy na pewno chcesz usunąć ${count} kartę?',
        few: 'Czy na pewno chcesz usunąć ${count} karty?',
        many: 'Czy na pewno chcesz usunąć ${count} kart?',
        other: 'Czy na pewno chcesz usunąć ${count} kart?',
      );
  @override
  late final _Translations$tabs$filters$pl_PL filters = _Translations$tabs$filters$pl_PL._(_root);
  @override
  late final _Translations$tabs$move$pl_PL move = _Translations$tabs$move$pl_PL._(_root);
}

// Path: history
class _Translations$history$pl_PL extends Translations$history$en {
  _Translations$history$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  String get searchHistory => TranslationOverrides.string(_root.$meta, 'history.searchHistory', {}) ?? 'Historia przeglądania';
  @override
  String get searchHistoryIsEmpty => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsEmpty', {}) ?? 'Historia jest pusta';
  @override
  String get searchHistoryIsDisabled => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsDisabled', {}) ?? 'Historia wyłączona';
  @override
  String get searchHistoryRequiresDatabase =>
      TranslationOverrides.string(_root.$meta, 'history.searchHistoryRequiresDatabase', {}) ?? 'Włącz bazę danych w ustawieniach dla historii';
  @override
  String lastSearch({required String search}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearch', {'search': search}) ?? 'Ostatnie wyszukanie: ${search}';
  @override
  String lastSearchWithDate({required String search}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearchWithDate', {'search': search}) ?? 'Ostatnie wyszukanie: ${search}';
  @override
  String get unknownBooruType => TranslationOverrides.string(_root.$meta, 'history.unknownBooruType', {}) ?? 'Nieznany typ Booru!';
  @override
  String unknownBooru({required String name, required String type}) =>
      TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ?? 'Nieznane (${name}-${type})';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? 'Otwórz';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? 'Otwórz w nowej karcie';
}

// Path: webview
class _Translations$webview$pl_PL extends Translations$webview$en {
  _Translations$webview$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$webview$navigation$pl_PL navigation = _Translations$webview$navigation$pl_PL._(_root);
}

// Path: settings
class _Translations$settings$pl_PL extends Translations$settings$en {
  _Translations$settings$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Ustawienia';
  @override
  late final _Translations$settings$language$pl_PL language = _Translations$settings$language$pl_PL._(_root);
  @override
  late final _Translations$settings$booru$pl_PL booru = _Translations$settings$booru$pl_PL._(_root);
  @override
  late final _Translations$settings$booruEditor$pl_PL booruEditor = _Translations$settings$booruEditor$pl_PL._(_root);
  @override
  late final _Translations$settings$interface$pl_PL interface = _Translations$settings$interface$pl_PL._(_root);
  @override
  late final _Translations$settings$theme$pl_PL theme = _Translations$settings$theme$pl_PL._(_root);
  @override
  late final _Translations$settings$viewer$pl_PL viewer = _Translations$settings$viewer$pl_PL._(_root);
  @override
  late final _Translations$settings$database$pl_PL database = _Translations$settings$database$pl_PL._(_root);
}

// Path: tagView
class _Translations$tagView$pl_PL extends Translations$tagView$en {
  _Translations$tagView$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  String get thisTagAlreadyInSearch =>
      TranslationOverrides.string(_root.$meta, 'tagView.thisTagAlreadyInSearch', {}) ?? 'Ten tag znajduje się już w obecnym zapytaniu:';
  @override
  String get addedToCurrentSearch => TranslationOverrides.string(_root.$meta, 'tagView.addedToCurrentSearch', {}) ?? 'Dodano do obecnego zapytania:';
}

// Path: pinnedTags
class _Translations$pinnedTags$pl_PL extends Translations$pinnedTags$en {
  _Translations$pinnedTags$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  String get tagQuery => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQuery', {}) ?? 'Zapytanie tagów';
  @override
  String get tagQueryHint => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQueryHint', {}) ?? 'nazwa_tagu';
  @override
  String get rawQueryHelp =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.rawQueryHelp', {}) ??
      'Możesz wpisać dowolne zapytanie wyszukiwania, w tym tagi ze spacjami';
}

// Path: preview
class _Translations$preview$pl_PL extends Translations$preview$en {
  _Translations$preview$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$preview$error$pl_PL error = _Translations$preview$error$pl_PL._(_root);
}

// Path: tabs.filters
class _Translations$tabs$filters$pl_PL extends Translations$tabs$filters$en {
  _Translations$tabs$filters$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  String get loaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.loaded', {}) ?? 'Załadowano';
  @override
  String get tagType => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagType', {}) ?? 'Według typu';
  @override
  String get multibooru => TranslationOverrides.string(_root.$meta, 'tabs.filters.multibooru', {}) ?? 'Multibooru';
  @override
  String get duplicates => TranslationOverrides.string(_root.$meta, 'tabs.filters.duplicates', {}) ?? 'Duplikaty';
  @override
  String get checkDuplicatesOnSameBooru =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.checkDuplicatesOnSameBooru', {}) ?? 'Sprawdź duplikaty na tym samym Booru';
  @override
  String get emptySearchQuery => TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? 'Puste zapytanie wyszukiwania';
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'tabs.filters.title', {}) ?? 'Filtry kart';
  @override
  String get all => TranslationOverrides.string(_root.$meta, 'tabs.filters.all', {}) ?? 'Wszytkie';
  @override
  String get notLoaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.notLoaded', {}) ?? 'Nie załadowano';
  @override
  String get enabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.enabled', {}) ?? 'Włączone';
  @override
  String get disabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.disabled', {}) ?? 'Wyłączone';
  @override
  String get willAlsoEnableSorting => TranslationOverrides.string(_root.$meta, 'tabs.filters.willAlsoEnableSorting', {}) ?? 'Włączy też sortowanie';
  @override
  String get tagTypeFilterHelp =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.tagTypeFilterHelp', {}) ?? 'Wyklucz karty zawierające dany tag';
  @override
  String get any => TranslationOverrides.string(_root.$meta, 'tabs.filters.any', {}) ?? 'Dowolny';
  @override
  String get apply => TranslationOverrides.string(_root.$meta, 'tabs.filters.apply', {}) ?? 'Zastosuj';
}

// Path: tabs.move
class _Translations$tabs$move$pl_PL extends Translations$tabs$move$en {
  _Translations$tabs$move$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  String get moveToTop => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToTop', {}) ?? 'Przenieś na górę';
  @override
  String get moveToBottom => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToBottom', {}) ?? 'Przenieś na koniec';
  @override
  String get tabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.tabNumber', {}) ?? 'Numer karty';
  @override
  String get invalidTabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidTabNumber', {}) ?? 'Nieprawidłowa wartość';
  @override
  String get invalidInput => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidInput', {}) ?? 'Nieprawidłowa wartość';
  @override
  String get outOfRange => TranslationOverrides.string(_root.$meta, 'tabs.move.outOfRange', {}) ?? 'Poza zakresem';
  @override
  String get pleaseEnterValidTabNumber =>
      TranslationOverrides.string(_root.$meta, 'tabs.move.pleaseEnterValidTabNumber', {}) ?? 'Wprowadź prawidłową wartość';
  @override
  String moveTo({required String formattedNumber}) =>
      TranslationOverrides.string(_root.$meta, 'tabs.move.moveTo', {'formattedNumber': formattedNumber}) ?? 'Przenieś do #${formattedNumber}';
  @override
  String get preview => TranslationOverrides.string(_root.$meta, 'tabs.move.preview', {}) ?? 'Podgląd:';
}

// Path: webview.navigation
class _Translations$webview$navigation$pl_PL extends Translations$webview$navigation$en {
  _Translations$webview$navigation$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  String get copyUrl => TranslationOverrides.string(_root.$meta, 'webview.navigation.copyUrl', {}) ?? 'Skopiuj URL';
  @override
  String get copiedUrlToClipboard =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.copiedUrlToClipboard', {}) ?? 'Skopiowano do schowka';
  @override
  String get cookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookies', {}) ?? 'Ciasteczka';
  @override
  String get favicon => TranslationOverrides.string(_root.$meta, 'webview.navigation.favicon', {}) ?? 'Favicon';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'webview.navigation.history', {}) ?? 'Historia';
  @override
  String get noBackHistoryItem => TranslationOverrides.string(_root.$meta, 'webview.navigation.noBackHistoryItem', {}) ?? 'Brak poprzedniej wartości';
  @override
  String get noForwardHistoryItem =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.noForwardHistoryItem', {}) ?? 'Brak następnej wartości';
}

// Path: settings.language
class _Translations$settings$language$pl_PL extends Translations$settings$language$en {
  _Translations$settings$language$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? 'Język';
  @override
  String get system => TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? 'System';
  @override
  String get helpUsTranslate => TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? 'Pomóż w tłumaczeniu';
  @override
  String get visitForDetails =>
      TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ??
      'Odwiedź repozytorium <a href=\'https://github.com/NO-ob/LoliSnatcher_Droid/blob/master/CONTRIBUTING.md#localization--translations\'>github</a> po szczegóły lub kliknij grafikę poniżej, aby przejść do POEditor';
}

// Path: settings.booru
class _Translations$settings$booru$pl_PL extends Translations$settings$booru$en {
  _Translations$settings$booru$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Booru i wyszukiwanie';
  @override
  String get defaultTags => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? 'Domyślne tagi';
  @override
  String get itemsPerPage => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'Ilość wczytywana na stronę';
  @override
  String get itemsPerPageTip => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'Niektóre booru mogą to ignorować';
  @override
  String get itemsPerPagePlaceholder => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPagePlaceholder', {}) ?? '10-100';
  @override
  String get addBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Dodaj konfigurację Booru';
  @override
  String get shareBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? 'Udostępnij konfigurację Booru';
  @override
  String shareBooruDialogMsgMobile({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
      'Udostępnij konfigurację ${booruName} jako link.\n\nDołączyc login/klucz API?';
}

// Path: settings.booruEditor
class _Translations$settings$booruEditor$pl_PL extends Translations$settings$booruEditor$en {
  _Translations$settings$booruEditor$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  String get testBooruFailedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'Testy Booru nieudane';
  @override
  String get testBooruFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ??
      'Być może parametry konfiguracyjne są nieprawidłowe, booru nie zezwala na dostęp do API, żądanie nie zwróciło żadnych danych lub wystąpił błąd sieciowy.';
  @override
  String get saveBooru => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Zapisz Booru';
  @override
  String get runningTest => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? 'Uruchamiam test...';
  @override
  String get booruConfigExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? 'Konfiguracja dla tego Booru już istnieje';
  @override
  String get booruSameNameExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ?? 'Konfiguracja Booru o tej nazwie już istnieje';
  @override
  String get booruSameUrlExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ?? 'Konfiguracja Booru o tym samym URL istnieje';
  @override
  String get thisBooruConfigWontBeAdded =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ??
      'Konfiguracja tego Booru nie zostanie dodana';
  @override
  String get booruConfigSaved =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? 'Konfiguracja Booru zapisana';
  @override
  String get existingTabsNeedReload =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ??
      'Aby zmiany zaczęły działać, należy ponownie załadować istniejące karty tego Booru!';
  @override
  String get failedVerifyApiHydrus =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ?? 'Weryfikacja API Hydrus nieudana';
  @override
  String get accessKeyRequestedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? 'Wymagany klucz dostępu';
  @override
  String get accessKeyRequestedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ??
      'Naciśnij „OK” w Hydrus, a następnie zatwierdź zmiany. Potem możesz nacisnąć „Test Booru”';
  @override
  String get accessKeyFailedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? 'Nie udało się uzyskać klucza dostępu';
  @override
  String get accessKeyFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ?? 'Czy masz otwarte "request window" w Hydrus?';
  @override
  String get hydrusInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ??
      'Aby uzyskać klucz Hydrus, otwórz okno żądania w klincie Hydrus: Services > Review services > Client API > Add > From API request';
  @override
  String get getHydrusApiKey => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? 'Uzyskaj klucz API Hydrus';
  @override
  String get booruName => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? 'Nazwa Booru';
  @override
  String get booruNameRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? 'Nazwa Booru jest wymagana!';
  @override
  String get booruUrl => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? 'URL Booru';
  @override
  String get booruUrlRequired => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? 'URL Booru jest wymagane!';
}

// Path: settings.interface
class _Translations$settings$interface$pl_PL extends Translations$settings$interface$en {
  _Translations$settings$interface$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  String get searchViewInputAutofocus =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewInputAutofocus', {}) ?? 'Autofokus w polu wyszukiwania';
  @override
  String get disableVibration => TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibration', {}) ?? 'Wyłącz wibracje';
  @override
  String get disableVibrationSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibrationSubtitle', {}) ?? 'W niektórych przypadkach wciąz może działać';
  @override
  String get usePredictiveBack =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.usePredictiveBack', {}) ?? 'Gest przewidywania cofania';
  @override
  String get previewColumnsPortrait =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsPortrait', {}) ?? 'Podgląd kolumn (układ pionowy)';
  @override
  String get previewColumnsLandscape =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsLandscape', {}) ?? 'Podgląd kolumn (układ poziomy)';
  @override
  String get previewQuality => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQuality', {}) ?? 'Jakość podglądu';
  @override
  String get previewQualityHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelp', {}) ?? 'Zmienia rozdzielczość obrazu w siatce podglądu';
  @override
  String get previewQualityHelpSample =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpSample', {}) ??
      ' - Próbka - Średnia rozdzielczość; aplikacja wyświetli miniaturę placeholder do załadowania obrazu w wyższej jakości';
  @override
  String get previewQualityHelpThumbnail =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpThumbnail', {}) ?? ' - Miniatura - Niska jakość';
  @override
  String get previewQualityHelpNote =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpNote', {}) ??
      '[Uwaga]: Jakość próbek może znacząco obniżyć wydajność, zwłaszcza przy wielu kolumnach w siatce podglądu';
  @override
  String get previewDisplay => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplay', {}) ?? 'Wyświetlanie podglądu';
  @override
  String get previewDisplayFallback =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallback', {}) ?? 'Alternatywa dla podglądu';
  @override
  String get previewDisplayFallbackHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallbackHelp', {}) ??
      'Używane, gdy opcja Staggered jest niedostępna';
  @override
  String get dontScaleImages => TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImages', {}) ?? 'Nie skaluj obrazów';
  @override
  String get dontScaleImagesSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesSubtitle', {}) ?? 'Może obniżyć wydajność';
  @override
  String get dontScaleImagesWarningTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningTitle', {}) ?? 'Ostrzeżenie';
  @override
  String get dontScaleImagesWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarning', {}) ?? 'Na pewno chcesz wyłączyć skalowanie obrazów?';
  @override
  String get dontScaleImagesWarningMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningMsg', {}) ??
      'Może obniżyć wydajność, szczególnie na starszych urządzeniach';
  @override
  String get gifThumbnails => TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnails', {}) ?? 'Miniatura GIFów';
}

// Path: settings.theme
class _Translations$settings$theme$pl_PL extends Translations$settings$theme$en {
  _Translations$settings$theme$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  String get useDynamicColor => TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? 'Użyj dynamicznego koloru';
  @override
  String get primaryColor => TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? 'Główny kolor';
  @override
  String get secondaryColor => TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? 'Dodatkowy kolor';
  @override
  String get removeCustomMascot =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? 'Usuń niestandardowe maskotki';
  @override
  String get currentMascotPath => TranslationOverrides.string(_root.$meta, 'settings.theme.currentMascotPath', {}) ?? 'Ścieżka do maskotki';
  @override
  String get system => TranslationOverrides.string(_root.$meta, 'settings.theme.system', {}) ?? 'System';
  @override
  String get light => TranslationOverrides.string(_root.$meta, 'settings.theme.light', {}) ?? 'Jasny';
  @override
  String get dark => TranslationOverrides.string(_root.$meta, 'settings.theme.dark', {}) ?? 'Ciemny';
  @override
  String get pink => TranslationOverrides.string(_root.$meta, 'settings.theme.pink', {}) ?? 'Różowy';
  @override
  String get purple => TranslationOverrides.string(_root.$meta, 'settings.theme.purple', {}) ?? 'Fioletowy';
  @override
  String get blue => TranslationOverrides.string(_root.$meta, 'settings.theme.blue', {}) ?? 'Niebieski';
  @override
  String get teal => TranslationOverrides.string(_root.$meta, 'settings.theme.teal', {}) ?? 'Turkusowy';
  @override
  String get red => TranslationOverrides.string(_root.$meta, 'settings.theme.red', {}) ?? 'Czerwony';
  @override
  String get green => TranslationOverrides.string(_root.$meta, 'settings.theme.green', {}) ?? 'Zielony';
  @override
  String get halloween => TranslationOverrides.string(_root.$meta, 'settings.theme.halloween', {}) ?? 'Halloween';
  @override
  String get custom => TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? 'Niestandardowy';
  @override
  String get selectColor => TranslationOverrides.string(_root.$meta, 'settings.theme.selectColor', {}) ?? 'Wybierz kolor';
  @override
  String get selectedColor => TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColor', {}) ?? 'Wybrany kolor';
  @override
  String get selectedColorAndShades =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColorAndShades', {}) ?? 'Wybrany kolor i jego odcienie';
  @override
  String get fontFamily => TranslationOverrides.string(_root.$meta, 'settings.theme.fontFamily', {}) ?? 'Czcionka';
  @override
  String get systemDefault => TranslationOverrides.string(_root.$meta, 'settings.theme.systemDefault', {}) ?? 'Domyślny systemu';
  @override
  String get viewMoreFonts => TranslationOverrides.string(_root.$meta, 'settings.theme.viewMoreFonts', {}) ?? 'Przejrzyj więcej';
  @override
  String get fontPreviewText => TranslationOverrides.string(_root.$meta, 'settings.theme.fontPreviewText', {}) ?? 'Zażółć gęślą jaźń';
  @override
  String get customFont => TranslationOverrides.string(_root.$meta, 'settings.theme.customFont', {}) ?? 'Niestandardowa czcionka';
  @override
  String get customFontSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.customFontSubtitle', {}) ?? 'Wpisz dowolną czcionkę Google';
  @override
  String get fontName => TranslationOverrides.string(_root.$meta, 'settings.theme.fontName', {}) ?? 'Nazwa czcionki';
}

// Path: settings.viewer
class _Translations$settings$viewer$pl_PL extends Translations$settings$viewer$en {
  _Translations$settings$viewer$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  String get longPressToChangeItemOrder =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToChangeItemOrder', {}) ?? 'Przytrzymaj, aby zmienić kolejność.';
  @override
  String get atLeast4ButtonsVisibleOnToolbar =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.atLeast4ButtonsVisibleOnToolbar', {}) ??
      'Co najmniej 4 przyciski będą zawsze widoczne na pasku narzędzi.';
  @override
  String get otherButtonsWillGoIntoOverflow =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.otherButtonsWillGoIntoOverflow', {}) ??
      'Pozostałe przyciski będą w menu rozszerzonym (trzy kropki).';
  @override
  String get longPressToMoveItems =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToMoveItems', {}) ?? 'Przytrzymaj, aby przenieść';
  @override
  String get onlyForVideos => TranslationOverrides.string(_root.$meta, 'settings.viewer.onlyForVideos', {}) ?? 'Tylka dla filmów';
  @override
  String get thisButtonCannotBeDisabled =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.thisButtonCannotBeDisabled', {}) ?? 'Tego przycisku nie można wyłączyć';
  @override
  String get defaultShareAction =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.defaultShareAction', {}) ?? 'Domyślna akcja przy udostępnianiu';
  @override
  String get shareActions => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActions', {}) ?? 'Akcje przy udostępnianiu';
  @override
  String get shareActionsAsk =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsAsk', {}) ?? '- Pytaj - zawsze pytaj, co udostępnić';
  @override
  String get shareActionsPostURL => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURL', {}) ?? '- Link postu';
  @override
  String get shareActionsFileURL =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFileURL', {}) ??
      '- Link do pliku - udostępnia link do pliku (może nie działać dla niektórych stron)';
  @override
  String get shareActionsPostURLFileURLFileWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURLFileURLFileWithTags', {}) ??
      '- Link postu/Pliku/Pliku z tagami - udostępnia link/plik i tagi, które wybierzesz';
  @override
  String get shareActionsFile =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFile', {}) ??
      '- Plik - udostępnia plik bezpośrednio, co może chwilę zając, progres widoczny będzie na przycisku Udostępnij';
  @override
  String get shareActionsHydrus =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsHydrus', {}) ?? '- Hydrus - wysyła link postu do Hydrus do importu';
  @override
  String get shareActionsNoteIfFileSavedInCache =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsNoteIfFileSavedInCache', {}) ??
      '[Uwaga]: Plik zostanie załadowany z pamięci podręcznej, jeśli tam jest. Inaczej zostanie pobrany ponownie.';
  @override
  String get shareActionsTip =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsTip', {}) ??
      '[Wskazówka]: Menu akcji Udostępniania otworzysz przytrzymując przycisk Udostępnij.';
  @override
  String get useVolumeButtonsForScrolling =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.useVolumeButtonsForScrolling', {}) ?? 'Używaj przycisków głośności do przewijania';
  @override
  String get volumeButtonsScrolling =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrolling', {}) ?? 'Przewijanie przyciskami głośności';
  @override
  String get volumeButtonsVolumeDown => TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeDown', {}) ?? ' ';
}

// Path: settings.database
class _Translations$settings$database$pl_PL extends Translations$settings$database$en {
  _Translations$settings$database$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  String get searchQuery => TranslationOverrides.string(_root.$meta, 'settings.database.searchQuery', {}) ?? 'Szukane zapytanie';
  @override
  String get searchQueryOptional =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchQueryOptional', {}) ?? '(opcjonalnie, może spowolnić proces)';
}

// Path: preview.error
class _Translations$preview$error$pl_PL extends Translations$preview$error$en {
  _Translations$preview$error$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  String get noResultsSubtitle =>
      TranslationOverrides.string(_root.$meta, 'preview.error.noResultsSubtitle', {}) ??
      'Zmień zapytanie wyszukiwania lub kliknij, aby spróbować ponownie';
}

/// The flat map containing all translations for locale <pl-PL>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsPlPl {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'locale' => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'pl-PL',
      'localeName' => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'Polski',
      'appName' => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher',
      'error' => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Błąd',
      'errorExclamation' => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'Błąd!',
      'success' => TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Sukces',
      'successExclamation' => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? 'Sukces!',
      'cancel' => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Anuluj',
      'kReturn' => TranslationOverrides.string(_root.$meta, 'kReturn', {}) ?? 'Powrót',
      'later' => TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Później',
      'close' => TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Zamknij',
      'ok' => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'OK',
      'yes' => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Tak',
      'no' => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'Nie',
      'pleaseWait' => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Poczekaj…',
      'show' => TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Pokaż',
      'hide' => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Ukryj',
      'enable' => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'Włącz',
      'disable' => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Wyłącz',
      'add' => TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Dodaj',
      'edit' => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? 'Edytuj',
      'remove' => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? 'Usuń',
      'save' => TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Zapisz',
      'delete' => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? 'Usuń',
      'confirm' => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? 'Potwierdź',
      'retry' => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? 'Ponów',
      'clear' => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? 'Wyczyść',
      'copy' => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Kopiuj',
      'copied' => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Skopiowano',
      'copiedToClipboard' => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? 'Skopiowano do schowka',
      'nothingFound' => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? 'Brak wyników',
      'paste' => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Wklej',
      'copyErrorText' => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Skopiuj błąd',
      'booru' => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru',
      'goToSettings' => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'Przejdź do ustawień',
      'thisMayTakeSomeTime' => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'To chwilę potrwa…',
      'exitTheAppQuestion' => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? 'Wyjść z aplikacji?',
      'closeTheApp' => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Zamknij aplikację',
      'invalidUrl' => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'Nieprawidłowy URL!',
      'clipboardIsEmpty' => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'Schowek jest pusty!',
      'failedToOpenLink' => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'Błąd ładowania linku',
      'apiKey' => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'Klucz API',
      'userId' => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'ID Użytkownika',
      'login' => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Login',
      'password' => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Hasło',
      'pause' => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Wstrzymaj',
      'resume' => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Wznów',
      'discord' => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord',
      'visitOurDiscord' => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Odwiedź naszego Discorda',
      'item' => TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Plik',
      'select' => TranslationOverrides.string(_root.$meta, 'select', {}) ?? 'Zaznacz',
      'selectAll' => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Zaznacz wszystko',
      'reset' => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'Resetuj',
      'open' => TranslationOverrides.string(_root.$meta, 'open', {}) ?? 'Otwórz',
      'openInNewTab' => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? 'Otwórz w nowej karcie',
      'move' => TranslationOverrides.string(_root.$meta, 'move', {}) ?? 'Przenieś',
      'shuffle' => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? 'Tasuj',
      'sort' => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? 'Sortuj',
      'go' => TranslationOverrides.string(_root.$meta, 'go', {}) ?? 'Przejdź',
      'search' => TranslationOverrides.string(_root.$meta, 'search', {}) ?? 'Szukaj',
      'filter' => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? 'Filtruj',
      'or' => TranslationOverrides.string(_root.$meta, 'or', {}) ?? 'Lub (~)',
      'page' => TranslationOverrides.string(_root.$meta, 'page', {}) ?? 'Strona',
      'pageNumber' => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? 'Strona #',
      'tags' => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'Tagi',
      'type' => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'Typ',
      'name' => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Nazwa',
      'address' => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'Adres IP',
      'username' => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'Nazwa użytkownika',
      'favourites' => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'Ulubione',
      'downloads' => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'Pobrane',
      'validationErrors.required' => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Wprowadź wartość',
      'validationErrors.invalid' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Wprowadź prawidłową wartość',
      'validationErrors.invalidNumber' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? 'Wpisz liczbę',
      'validationErrors.invalidNumericValue' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? 'Wartość musi być liczbą',
      'validationErrors.tooSmall' => ({
        required double min,
      }) => TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Wpisz wartość większą niż ${min}',
      'validationErrors.tooBig' => ({
        required double max,
      }) => TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Wpisz wartość mniejszą niż ${max}',
      'validationErrors.rangeError' =>
        ({required double min, required double max}) =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ??
            'Wpisz wartość między ${min} a ${max}',
      'validationErrors.greaterThanOrEqualZero' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? 'Wartość musi być większa niż 0',
      'validationErrors.lessThan4' => TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? 'Wartość musi być mniejsza niż 4',
      'validationErrors.biggerThan100' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? 'Wpisz wartość większą niż 100',
      'validationErrors.moreThan4ColumnsWarning' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ?? 'Więcej niż 4 kolumny obniżają wydajność',
      'validationErrors.moreThan8ColumnsWarning' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ?? 'Więcej niż 8 kolumn obniża wydajność',
      'init.initError' => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Błąd inicjalizacji!',
      'init.settingUpProxy' => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Konfigurowanie proxy…',
      'init.loadingDatabase' => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Ładowanie bazy danych…',
      'init.loadingBoorus' => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Ładowanie booru…',
      'init.loadingTags' => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Ładowanie tagów…',
      'init.restoringTabs' => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Przywracanie kart…',
      'permissions.noAccessToCustomStorageDirectory' =>
        TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ?? 'Brak dostępu do niestandardowego katalogu',
      'permissions.pleaseSetStorageDirectoryAgain' =>
        TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ??
            'Proszę ustaw katalog ponownie, aby przyznać dostęp aplikacji do niego',
      'permissions.currentPath' => ({
        required String path,
      }) => TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? 'Obecna ścieżka: ${path}',
      'permissions.setDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? 'Wybierz katalog',
      'permissions.currentlyNotAvailableForThisPlatform' =>
        TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ?? 'Niedostępne na tym urządzeniu',
      'permissions.resetDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? 'Zresetuj katalog',
      'permissions.afterResetFilesWillBeSavedToDefaultDirectory' =>
        TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ??
            'Pliki będą zapisywane do domyślnego katalogi po restarcie',
      'authentication.pleaseAuthenticateToUseTheApp' =>
        TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ??
            'Proszę potwierdzić tożsamości, aby używać aplikacji',
      'authentication.noBiometricHardwareAvailable' =>
        TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? 'Nie znaleziono sprzętu biometrycznych',
      'authentication.temporaryLockout' => TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? 'Tymczasowa blokada',
      'authentication.somethingWentWrong' =>
        ({required String error}) =>
            TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ??
            'Coś poszło nie tak podczas potwierdzania tożsamości: ${error}',
      'searchHandler.removedLastTab' => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? 'Usunięto ostatnią kartę',
      'searchHandler.resettingSearchToDefaultTags' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? 'Resetowanie do domyślnych tagów',
      'searchHandler.uoh' => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'UOOOOOOOHHH',
      'searchHandler.ratingsChanged' => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? 'Zmieniono kategorie wiekowe',
      'searchHandler.ratingsChangedMessage' =>
        ({required String booruType}) =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
            'W ${booruType} oznaczenie [rating:safe] zostało zastąpione przez [rating:general] i [rating:sensitive]',
      'searchHandler.appFixedRatingAutomatically' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ??
            'Automatycznie poprawiono kategorię. Użyj właściwej przy nstepnych wyszukiwaniach',
      'searchHandler.tabsRestored' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? 'Karty przywrócone',
      'searchHandler.restoredTabsCount' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
              count,
              one: 'Przywrócono ${count} kartę z poprzedniej sesji',
              few: 'Przywrócono ${count} karty z poprzedniej sesji',
              many: 'Przywrócono ${count} kart z poprzedniej sesji',
              other: 'Przywrócono ${count} kart z poprzedniej sesji',
            ),
      'searchHandler.someRestoredTabsHadIssues' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ??
            'Nie rozpoznano niektórych znaków lub booru w przywróconych kartach.',
      'searchHandler.theyWereSetToDefaultOrIgnored' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ??
            'Zostały one przywrócone do domyślnych lub ignorowane.',
      'searchHandler.listOfBrokenTabs' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? 'Lista uszkodzonych kart:',
      'searchHandler.tabsMerged' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? 'Karty scalone',
      'searchHandler.addedTabsCount' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
              count,
              one: 'Dodano ${count} nowych kart',
              few: 'Dodano ${count} nowe karty',
              many: 'Dodano ${count} nowych kart',
              other: 'Dodano ${count} nowych kart',
            ),
      'searchHandler.tabsReplaced' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? 'Zastąpiono karty',
      'searchHandler.receivedTabsCount' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
              count,
              one: 'Otrzymano ${count} kartę',
              few: 'Otrzymano ${count} karty',
              many: 'Otrzymano ${count} kart',
              other: 'Otrzymano ${count} kart',
            ),
      'snatcher.title' => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Pobieranie',
      'snatcher.snatchingHistory' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'Historia pobierania',
      'snatcher.enterTags' => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'Wybierz tagi',
      'snatcher.amount' => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? 'Ilość',
      'snatcher.amountOfFilesToSnatch' =>
        TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? 'Ilość Plików do pobrania',
      'snatcher.delayInMs' => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? 'Opóźnienie (w ms)',
      'snatcher.delayBetweenEachDownload' =>
        TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? 'Opóźnienie między pobraniami',
      'snatcher.snatchFiles' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? 'Pobierz pliki',
      'snatcher.itemWasAlreadySnatched' =>
        TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? 'Plik był już pobierany',
      'snatcher.failedToSnatchItem' => TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? 'Pobranie nieudane',
      'snatcher.itemWasCancelled' => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? 'Anulowano',
      'snatcher.startingNextQueueItem' =>
        TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? 'Rozpoczęto kolejny element z kolejki…',
      'snatcher.itemsSnatched' => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? 'Pobrane pliki',
      'snatcher.snatchedCount' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
              count,
              one: 'Pobrano: ${count} element',
              few: 'Pobrano: ${count} elementy',
              many: 'Pobrano: ${count} elementów',
              other: 'Pobrano: ${count} elementów',
            ),
      'snatcher.filesAlreadySnatched' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
              count,
              one: '${count} plik był już pobrany',
              few: '${count} pliki były już pobrane',
              many: '${count} plików było już pobranych',
              other: '${count} plików było już pobranych',
            ),
      'snatcher.failedToSnatchFiles' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
              count,
              one: 'Nie udało się pobrać ${count} pliku',
              few: 'Nie udało się pobrać ${count} pliki',
              many: 'Nie udało się pobrać ${count} plików',
              other: 'Nie udało się pobrać ${count} plików',
            ),
      'snatcher.cancelledFiles' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
              count,
              one: 'Anulowano ${count} plik',
              few: 'Anulowano ${count} pliki',
              many: 'Anulowano ${count} plików',
              other: 'Anulowano ${count} plików',
            ),
      'snatcher.snatchingImages' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? 'Pobieranie obrazów',
      'snatcher.doNotCloseApp' => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? 'Nie zamykaj aplikacji!',
      'snatcher.addedItemToQueue' =>
        TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? 'Dodano element do kolejki pobierania',
      'snatcher.addedItemsToQueue' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
              count,
              one: 'Dodano ${count} element do kolejki pobierania',
              few: 'Dodano ${count} elementy do kolejki pobierania',
              many: 'Dodano ${count} elementów do kolejki pobierania',
              other: 'Dodano ${count} elementów do kolejki pobierania',
            ),
      'multibooru.title' => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? 'Multibooru',
      'multibooru.multibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Tryb Multibooru',
      'multibooru.multibooruRequiresAtLeastTwoBoorus' =>
        TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ?? 'Wymagane są przynajmniej 2 booru',
      'multibooru.selectSecondaryBoorus' =>
        TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Wybierz dodatkowe booru:',
      'multibooru.akaMultibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? 'czyli tryb Multibooru',
      'multibooru.labelSecondaryBoorusToInclude' =>
        TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? 'Dodatkowe booru do uwzględnienia',
      'hydrus.importError' => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'Coś poszło nie tak przy imporcie do hydrusa',
      'hydrus.apiPermissionsRequired' =>
        TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ??
            'Prawdopodobnie nadano nieprawidłowe uprawnienia API, można to zmienić w sekcji Review Services',
      'hydrus.addTagsToFile' => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? 'Dodaj tagi do plików',
      'hydrus.addUrls' => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'Dodaj Linki',
      'tabs.tab' => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? 'Karta',
      'tabs.addBoorusInSettings' => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? 'Dodaj booru w ustawieniach',
      'tabs.selectABooru' => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? 'Wybierz Booru',
      'tabs.secondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? 'Dodatkowe booru',
      'tabs.addNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? 'Dodaj nową kartę',
      'tabs.selectABooruOrLeaveEmpty' =>
        TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? 'Wybierz booru lub pozostaw puste',
      'tabs.addPosition' => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? 'Dodaj pozycję',
      'tabs.addModePrevTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? 'Poprzednia karta',
      'tabs.addModeNextTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? 'Następna karta',
      'tabs.addModeListEnd' => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? 'Koniec listy',
      'tabs.usedQuery' => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? 'Użyte zapytanie',
      'tabs.queryModeDefault' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? 'Domyślna',
      'tabs.queryModeCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? 'Obecna',
      'tabs.queryModeCustom' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? 'Niestandardowa',
      'tabs.customQuery' => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? 'Niestandardowe zapytanie',
      'tabs.empty' => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '[pusta]',
      'tabs.addSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? 'Dodaj dodatkowe booru',
      'tabs.keepSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? 'Zachowaj dodatkowe booru',
      'tabs.startFromCustomPageNumber' =>
        TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? 'Zacznij od niestandardowego numeru strony',
      'tabs.switchToNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? 'Zmień na nową kartę',
      'tabs.add' => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? 'Dodaj',
      'tabs.tabsManager' => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? 'Menedżer kart',
      'tabs.selectMode' => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? 'Tryb wyboru',
      'tabs.sortMode' => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? 'Sortuj karty',
      'tabs.help' => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? 'Pomoc',
      'tabs.deleteTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? 'Usuń karty',
      'tabs.shuffleTabs' => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? 'Tasuj Karty',
      'tabs.tabRandomlyShuffled' => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? 'Losowa kolejność kart',
      'tabs.tabOrderSaved' => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? 'Zapisano kolejność kart',
      'tabs.scrollToCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? 'Przewiń do obecnej karty',
      'tabs.scrollToTop' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? 'Przewiń w górę',
      'tabs.scrollToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? 'Przewiń na dół',
      'tabs.filterTabsByBooru' => TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? 'Filtruj po booru, stanie, duplikatach…',
      'tabs.scrolling' => TranslationOverrides.string(_root.$meta, 'tabs.scrolling', {}) ?? 'Przewijanie:',
      'tabs.sorting' => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? 'Sortowanie:',
      'tabs.defaultTabsOrder' => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? 'Domyślna kolejność kart',
      'tabs.sortAlphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? 'Sortuj alfabetyzcznie',
      'tabs.sortAlphabeticallyReversed' =>
        TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? 'Sortuj alfabetycznie (odwrotnie)',
      'tabs.sortByBooruName' => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? 'Sortuj po nazwie booru',
      'tabs.sortByBooruNameReversed' =>
        TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ?? 'Sortuj po nazwie booru (odwrotnie)',
      'tabs.longPressSortToSave' =>
        TranslationOverrides.string(_root.$meta, 'tabs.longPressSortToSave', {}) ?? 'Przytrzymaj przycisk sortowania, aby zapisać obecną kolejność',
      'tabs.select' => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? 'Wybierz:',
      'tabs.toggleSelectMode' => TranslationOverrides.string(_root.$meta, 'tabs.toggleSelectMode', {}) ?? 'Przełącz tryb wyboru',
      'tabs.onTheBottomOfPage' => TranslationOverrides.string(_root.$meta, 'tabs.onTheBottomOfPage', {}) ?? 'W dolnej części strony: ',
      'tabs.selectDeselectAll' => TranslationOverrides.string(_root.$meta, 'tabs.selectDeselectAll', {}) ?? 'Zaznacz/odznacz wszystkie karty',
      'tabs.deleteSelectedTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? 'Usuń zaznaczone karty',
      'tabs.longPressToMove' => TranslationOverrides.string(_root.$meta, 'tabs.longPressToMove', {}) ?? 'Przytrzymaj kartę aby ją przesunąć',
      'tabs.numbersInBottomRight' =>
        TranslationOverrides.string(_root.$meta, 'tabs.numbersInBottomRight', {}) ?? 'Liczby w prawym dolnym rogu karty:',
      'tabs.firstNumberTabIndex' =>
        TranslationOverrides.string(_root.$meta, 'tabs.firstNumberTabIndex', {}) ?? 'Pierwsza liczba - indeks karty w domyślnej kolejności listy',
      'tabs.secondNumberTabIndex' =>
        TranslationOverrides.string(_root.$meta, 'tabs.secondNumberTabIndex', {}) ??
            'Druga liczba - indeks karty w aktualnej kolejności listy, pojawia się po włączeniu filtrowania/sortowania',
      'tabs.specialFilters' => TranslationOverrides.string(_root.$meta, 'tabs.specialFilters', {}) ?? 'Filtry specjalne:',
      'tabs.loadedFilter' =>
        TranslationOverrides.string(_root.$meta, 'tabs.loadedFilter', {}) ?? '„Załadowane” - pokaż karty z załadowanymi elementami',
      'tabs.notLoadedFilter' =>
        TranslationOverrides.string(_root.$meta, 'tabs.notLoadedFilter', {}) ??
            '„Niezaładowane” - pokaż karty, które nie są załadowane i/lub nie zawierają elementów',
      'tabs.notLoadedItalic' => TranslationOverrides.string(_root.$meta, 'tabs.notLoadedItalic', {}) ?? 'Nie załadowane karty mają tekst kursywy',
      'tabs.noTabsFound' => TranslationOverrides.string(_root.$meta, 'tabs.noTabsFound', {}) ?? 'Nie znaleziono kart',
      'tabs.copy' => TranslationOverrides.string(_root.$meta, 'tabs.copy', {}) ?? 'Kopjuj',
      'tabs.moveAction' => TranslationOverrides.string(_root.$meta, 'tabs.moveAction', {}) ?? 'Przenieś',
      'tabs.remove' => TranslationOverrides.string(_root.$meta, 'tabs.remove', {}) ?? 'Usuń',
      'tabs.shuffle' => TranslationOverrides.string(_root.$meta, 'tabs.shuffle', {}) ?? 'Tasuj',
      'tabs.sort' => TranslationOverrides.string(_root.$meta, 'tabs.sort', {}) ?? 'Sortuj',
      'tabs.shuffleTabsQuestion' => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabsQuestion', {}) ?? 'Wymieszać karty losowo?',
      'tabs.saveTabsInCurrentOrder' =>
        TranslationOverrides.string(_root.$meta, 'tabs.saveTabsInCurrentOrder', {}) ?? 'Zapisać obecną kolejność kart?',
      'tabs.byBooru' => TranslationOverrides.string(_root.$meta, 'tabs.byBooru', {}) ?? 'Według booru',
      'tabs.alphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.alphabetically', {}) ?? 'Alfabetycznie',
      'tabs.reversed' => TranslationOverrides.string(_root.$meta, 'tabs.reversed', {}) ?? '(odwrócone)',
      'tabs.areYouSureDeleteTabs' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'tabs.areYouSureDeleteTabs', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
              count,
              one: 'Czy na pewno chcesz usunąć ${count} kartę?',
              few: 'Czy na pewno chcesz usunąć ${count} karty?',
              many: 'Czy na pewno chcesz usunąć ${count} kart?',
              other: 'Czy na pewno chcesz usunąć ${count} kart?',
            ),
      'tabs.filters.loaded' => TranslationOverrides.string(_root.$meta, 'tabs.filters.loaded', {}) ?? 'Załadowano',
      'tabs.filters.tagType' => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagType', {}) ?? 'Według typu',
      'tabs.filters.multibooru' => TranslationOverrides.string(_root.$meta, 'tabs.filters.multibooru', {}) ?? 'Multibooru',
      'tabs.filters.duplicates' => TranslationOverrides.string(_root.$meta, 'tabs.filters.duplicates', {}) ?? 'Duplikaty',
      'tabs.filters.checkDuplicatesOnSameBooru' =>
        TranslationOverrides.string(_root.$meta, 'tabs.filters.checkDuplicatesOnSameBooru', {}) ?? 'Sprawdź duplikaty na tym samym Booru',
      'tabs.filters.emptySearchQuery' =>
        TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? 'Puste zapytanie wyszukiwania',
      'tabs.filters.title' => TranslationOverrides.string(_root.$meta, 'tabs.filters.title', {}) ?? 'Filtry kart',
      'tabs.filters.all' => TranslationOverrides.string(_root.$meta, 'tabs.filters.all', {}) ?? 'Wszytkie',
      'tabs.filters.notLoaded' => TranslationOverrides.string(_root.$meta, 'tabs.filters.notLoaded', {}) ?? 'Nie załadowano',
      'tabs.filters.enabled' => TranslationOverrides.string(_root.$meta, 'tabs.filters.enabled', {}) ?? 'Włączone',
      'tabs.filters.disabled' => TranslationOverrides.string(_root.$meta, 'tabs.filters.disabled', {}) ?? 'Wyłączone',
      'tabs.filters.willAlsoEnableSorting' =>
        TranslationOverrides.string(_root.$meta, 'tabs.filters.willAlsoEnableSorting', {}) ?? 'Włączy też sortowanie',
      'tabs.filters.tagTypeFilterHelp' =>
        TranslationOverrides.string(_root.$meta, 'tabs.filters.tagTypeFilterHelp', {}) ?? 'Wyklucz karty zawierające dany tag',
      'tabs.filters.any' => TranslationOverrides.string(_root.$meta, 'tabs.filters.any', {}) ?? 'Dowolny',
      'tabs.filters.apply' => TranslationOverrides.string(_root.$meta, 'tabs.filters.apply', {}) ?? 'Zastosuj',
      'tabs.move.moveToTop' => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToTop', {}) ?? 'Przenieś na górę',
      'tabs.move.moveToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToBottom', {}) ?? 'Przenieś na koniec',
      'tabs.move.tabNumber' => TranslationOverrides.string(_root.$meta, 'tabs.move.tabNumber', {}) ?? 'Numer karty',
      'tabs.move.invalidTabNumber' => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidTabNumber', {}) ?? 'Nieprawidłowa wartość',
      'tabs.move.invalidInput' => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidInput', {}) ?? 'Nieprawidłowa wartość',
      'tabs.move.outOfRange' => TranslationOverrides.string(_root.$meta, 'tabs.move.outOfRange', {}) ?? 'Poza zakresem',
      'tabs.move.pleaseEnterValidTabNumber' =>
        TranslationOverrides.string(_root.$meta, 'tabs.move.pleaseEnterValidTabNumber', {}) ?? 'Wprowadź prawidłową wartość',
      'tabs.move.moveTo' => ({
        required String formattedNumber,
      }) => TranslationOverrides.string(_root.$meta, 'tabs.move.moveTo', {'formattedNumber': formattedNumber}) ?? 'Przenieś do #${formattedNumber}',
      'tabs.move.preview' => TranslationOverrides.string(_root.$meta, 'tabs.move.preview', {}) ?? 'Podgląd:',
      'history.searchHistory' => TranslationOverrides.string(_root.$meta, 'history.searchHistory', {}) ?? 'Historia przeglądania',
      'history.searchHistoryIsEmpty' => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsEmpty', {}) ?? 'Historia jest pusta',
      'history.searchHistoryIsDisabled' => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsDisabled', {}) ?? 'Historia wyłączona',
      'history.searchHistoryRequiresDatabase' =>
        TranslationOverrides.string(_root.$meta, 'history.searchHistoryRequiresDatabase', {}) ?? 'Włącz bazę danych w ustawieniach dla historii',
      'history.lastSearch' => ({
        required String search,
      }) => TranslationOverrides.string(_root.$meta, 'history.lastSearch', {'search': search}) ?? 'Ostatnie wyszukanie: ${search}',
      'history.lastSearchWithDate' => ({
        required String search,
      }) => TranslationOverrides.string(_root.$meta, 'history.lastSearchWithDate', {'search': search}) ?? 'Ostatnie wyszukanie: ${search}',
      'history.unknownBooruType' => TranslationOverrides.string(_root.$meta, 'history.unknownBooruType', {}) ?? 'Nieznany typ Booru!',
      'history.unknownBooru' => ({
        required String name,
        required String type,
      }) => TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ?? 'Nieznane (${name}-${type})',
      'history.open' => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? 'Otwórz',
      'history.openInNewTab' => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? 'Otwórz w nowej karcie',
      'webview.navigation.copyUrl' => TranslationOverrides.string(_root.$meta, 'webview.navigation.copyUrl', {}) ?? 'Skopiuj URL',
      'webview.navigation.copiedUrlToClipboard' =>
        TranslationOverrides.string(_root.$meta, 'webview.navigation.copiedUrlToClipboard', {}) ?? 'Skopiowano do schowka',
      'webview.navigation.cookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookies', {}) ?? 'Ciasteczka',
      'webview.navigation.favicon' => TranslationOverrides.string(_root.$meta, 'webview.navigation.favicon', {}) ?? 'Favicon',
      'webview.navigation.history' => TranslationOverrides.string(_root.$meta, 'webview.navigation.history', {}) ?? 'Historia',
      'webview.navigation.noBackHistoryItem' =>
        TranslationOverrides.string(_root.$meta, 'webview.navigation.noBackHistoryItem', {}) ?? 'Brak poprzedniej wartości',
      'webview.navigation.noForwardHistoryItem' =>
        TranslationOverrides.string(_root.$meta, 'webview.navigation.noForwardHistoryItem', {}) ?? 'Brak następnej wartości',
      'settings.title' => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Ustawienia',
      'settings.language.title' => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? 'Język',
      'settings.language.system' => TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? 'System',
      'settings.language.helpUsTranslate' =>
        TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? 'Pomóż w tłumaczeniu',
      'settings.language.visitForDetails' => TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ?? 'Odwiedź repozytorium <a href=\'https://github.com/NO-ob/LoliSnatcher_Droid/blob/master/CONTRIBUTING.md#localization--translations\'>github</a> po szczegóły lub kliknij grafikę poniżej, aby przejść do POEditor',
      'settings.booru.title' => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Booru i wyszukiwanie',
      'settings.booru.defaultTags' => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? 'Domyślne tagi',
      'settings.booru.itemsPerPage' => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'Ilość wczytywana na stronę',
      'settings.booru.itemsPerPageTip' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'Niektóre booru mogą to ignorować',
      'settings.booru.itemsPerPagePlaceholder' => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPagePlaceholder', {}) ?? '10-100',
      'settings.booru.addBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Dodaj konfigurację Booru',
      'settings.booru.shareBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? 'Udostępnij konfigurację Booru',
      'settings.booru.shareBooruDialogMsgMobile' =>
        ({required String booruName}) =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
            'Udostępnij konfigurację ${booruName} jako link.\n\nDołączyc login/klucz API?',
      'settings.booruEditor.testBooruFailedTitle' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'Testy Booru nieudane',
      'settings.booruEditor.testBooruFailedMsg' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ?? 'Być może parametry konfiguracyjne są nieprawidłowe, booru nie zezwala na dostęp do API, żądanie nie zwróciło żadnych danych lub wystąpił błąd sieciowy.',
      'settings.booruEditor.saveBooru' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Zapisz Booru',
      'settings.booruEditor.runningTest' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? 'Uruchamiam test...',
      'settings.booruEditor.booruConfigExistsError' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? 'Konfiguracja dla tego Booru już istnieje',
      'settings.booruEditor.booruSameNameExistsError' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ??
            'Konfiguracja Booru o tej nazwie już istnieje',
      'settings.booruEditor.booruSameUrlExistsError' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ?? 'Konfiguracja Booru o tym samym URL istnieje',
      'settings.booruEditor.thisBooruConfigWontBeAdded' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ??
            'Konfiguracja tego Booru nie zostanie dodana',
      'settings.booruEditor.booruConfigSaved' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? 'Konfiguracja Booru zapisana',
      'settings.booruEditor.existingTabsNeedReload' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ??
            'Aby zmiany zaczęły działać, należy ponownie załadować istniejące karty tego Booru!',
      'settings.booruEditor.failedVerifyApiHydrus' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ?? 'Weryfikacja API Hydrus nieudana',
      'settings.booruEditor.accessKeyRequestedTitle' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? 'Wymagany klucz dostępu',
      'settings.booruEditor.accessKeyRequestedMsg' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ??
            'Naciśnij „OK” w Hydrus, a następnie zatwierdź zmiany. Potem możesz nacisnąć „Test Booru”',
      'settings.booruEditor.accessKeyFailedTitle' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? 'Nie udało się uzyskać klucza dostępu',
      'settings.booruEditor.accessKeyFailedMsg' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ?? 'Czy masz otwarte "request window" w Hydrus?',
      'settings.booruEditor.hydrusInstructions' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ??
            'Aby uzyskać klucz Hydrus, otwórz okno żądania w klincie Hydrus: Services > Review services > Client API > Add > From API request',
      'settings.booruEditor.getHydrusApiKey' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? 'Uzyskaj klucz API Hydrus',
      'settings.booruEditor.booruName' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? 'Nazwa Booru',
      'settings.booruEditor.booruNameRequired' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? 'Nazwa Booru jest wymagana!',
      'settings.booruEditor.booruUrl' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? 'URL Booru',
      'settings.booruEditor.booruUrlRequired' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? 'URL Booru jest wymagane!',
      'settings.interface.searchViewInputAutofocus' =>
        TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewInputAutofocus', {}) ?? 'Autofokus w polu wyszukiwania',
      'settings.interface.disableVibration' =>
        TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibration', {}) ?? 'Wyłącz wibracje',
      'settings.interface.disableVibrationSubtitle' =>
        TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibrationSubtitle', {}) ?? 'W niektórych przypadkach wciąz może działać',
      'settings.interface.usePredictiveBack' =>
        TranslationOverrides.string(_root.$meta, 'settings.interface.usePredictiveBack', {}) ?? 'Gest przewidywania cofania',
      'settings.interface.previewColumnsPortrait' =>
        TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsPortrait', {}) ?? 'Podgląd kolumn (układ pionowy)',
      'settings.interface.previewColumnsLandscape' =>
        TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsLandscape', {}) ?? 'Podgląd kolumn (układ poziomy)',
      'settings.interface.previewQuality' => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQuality', {}) ?? 'Jakość podglądu',
      'settings.interface.previewQualityHelp' =>
        TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelp', {}) ?? 'Zmienia rozdzielczość obrazu w siatce podglądu',
      'settings.interface.previewQualityHelpSample' =>
        TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpSample', {}) ??
            ' - Próbka - Średnia rozdzielczość; aplikacja wyświetli miniaturę placeholder do załadowania obrazu w wyższej jakości',
      'settings.interface.previewQualityHelpThumbnail' =>
        TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpThumbnail', {}) ?? ' - Miniatura - Niska jakość',
      'settings.interface.previewQualityHelpNote' =>
        TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpNote', {}) ??
            '[Uwaga]: Jakość próbek może znacząco obniżyć wydajność, zwłaszcza przy wielu kolumnach w siatce podglądu',
      'settings.interface.previewDisplay' =>
        TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplay', {}) ?? 'Wyświetlanie podglądu',
      'settings.interface.previewDisplayFallback' =>
        TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallback', {}) ?? 'Alternatywa dla podglądu',
      'settings.interface.previewDisplayFallbackHelp' =>
        TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallbackHelp', {}) ??
            'Używane, gdy opcja Staggered jest niedostępna',
      'settings.interface.dontScaleImages' =>
        TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImages', {}) ?? 'Nie skaluj obrazów',
      'settings.interface.dontScaleImagesSubtitle' =>
        TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesSubtitle', {}) ?? 'Może obniżyć wydajność',
      'settings.interface.dontScaleImagesWarningTitle' =>
        TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningTitle', {}) ?? 'Ostrzeżenie',
      'settings.interface.dontScaleImagesWarning' =>
        TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarning', {}) ?? 'Na pewno chcesz wyłączyć skalowanie obrazów?',
      'settings.interface.dontScaleImagesWarningMsg' =>
        TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningMsg', {}) ??
            'Może obniżyć wydajność, szczególnie na starszych urządzeniach',
      'settings.interface.gifThumbnails' => TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnails', {}) ?? 'Miniatura GIFów',
      'settings.theme.useDynamicColor' =>
        TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? 'Użyj dynamicznego koloru',
      'settings.theme.primaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? 'Główny kolor',
      'settings.theme.secondaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? 'Dodatkowy kolor',
      'settings.theme.removeCustomMascot' =>
        TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? 'Usuń niestandardowe maskotki',
      'settings.theme.currentMascotPath' => TranslationOverrides.string(_root.$meta, 'settings.theme.currentMascotPath', {}) ?? 'Ścieżka do maskotki',
      'settings.theme.system' => TranslationOverrides.string(_root.$meta, 'settings.theme.system', {}) ?? 'System',
      'settings.theme.light' => TranslationOverrides.string(_root.$meta, 'settings.theme.light', {}) ?? 'Jasny',
      'settings.theme.dark' => TranslationOverrides.string(_root.$meta, 'settings.theme.dark', {}) ?? 'Ciemny',
      'settings.theme.pink' => TranslationOverrides.string(_root.$meta, 'settings.theme.pink', {}) ?? 'Różowy',
      'settings.theme.purple' => TranslationOverrides.string(_root.$meta, 'settings.theme.purple', {}) ?? 'Fioletowy',
      'settings.theme.blue' => TranslationOverrides.string(_root.$meta, 'settings.theme.blue', {}) ?? 'Niebieski',
      'settings.theme.teal' => TranslationOverrides.string(_root.$meta, 'settings.theme.teal', {}) ?? 'Turkusowy',
      'settings.theme.red' => TranslationOverrides.string(_root.$meta, 'settings.theme.red', {}) ?? 'Czerwony',
      'settings.theme.green' => TranslationOverrides.string(_root.$meta, 'settings.theme.green', {}) ?? 'Zielony',
      'settings.theme.halloween' => TranslationOverrides.string(_root.$meta, 'settings.theme.halloween', {}) ?? 'Halloween',
      'settings.theme.custom' => TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? 'Niestandardowy',
      'settings.theme.selectColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.selectColor', {}) ?? 'Wybierz kolor',
      'settings.theme.selectedColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColor', {}) ?? 'Wybrany kolor',
      'settings.theme.selectedColorAndShades' =>
        TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColorAndShades', {}) ?? 'Wybrany kolor i jego odcienie',
      'settings.theme.fontFamily' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontFamily', {}) ?? 'Czcionka',
      'settings.theme.systemDefault' => TranslationOverrides.string(_root.$meta, 'settings.theme.systemDefault', {}) ?? 'Domyślny systemu',
      'settings.theme.viewMoreFonts' => TranslationOverrides.string(_root.$meta, 'settings.theme.viewMoreFonts', {}) ?? 'Przejrzyj więcej',
      'settings.theme.fontPreviewText' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontPreviewText', {}) ?? 'Zażółć gęślą jaźń',
      'settings.theme.customFont' => TranslationOverrides.string(_root.$meta, 'settings.theme.customFont', {}) ?? 'Niestandardowa czcionka',
      'settings.theme.customFontSubtitle' =>
        TranslationOverrides.string(_root.$meta, 'settings.theme.customFontSubtitle', {}) ?? 'Wpisz dowolną czcionkę Google',
      'settings.theme.fontName' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontName', {}) ?? 'Nazwa czcionki',
      'settings.viewer.longPressToChangeItemOrder' =>
        TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToChangeItemOrder', {}) ?? 'Przytrzymaj, aby zmienić kolejność.',
      'settings.viewer.atLeast4ButtonsVisibleOnToolbar' =>
        TranslationOverrides.string(_root.$meta, 'settings.viewer.atLeast4ButtonsVisibleOnToolbar', {}) ??
            'Co najmniej 4 przyciski będą zawsze widoczne na pasku narzędzi.',
      'settings.viewer.otherButtonsWillGoIntoOverflow' =>
        TranslationOverrides.string(_root.$meta, 'settings.viewer.otherButtonsWillGoIntoOverflow', {}) ??
            'Pozostałe przyciski będą w menu rozszerzonym (trzy kropki).',
      'settings.viewer.longPressToMoveItems' =>
        TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToMoveItems', {}) ?? 'Przytrzymaj, aby przenieść',
      'settings.viewer.onlyForVideos' => TranslationOverrides.string(_root.$meta, 'settings.viewer.onlyForVideos', {}) ?? 'Tylka dla filmów',
      'settings.viewer.thisButtonCannotBeDisabled' =>
        TranslationOverrides.string(_root.$meta, 'settings.viewer.thisButtonCannotBeDisabled', {}) ?? 'Tego przycisku nie można wyłączyć',
      'settings.viewer.defaultShareAction' =>
        TranslationOverrides.string(_root.$meta, 'settings.viewer.defaultShareAction', {}) ?? 'Domyślna akcja przy udostępnianiu',
      'settings.viewer.shareActions' => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActions', {}) ?? 'Akcje przy udostępnianiu',
      'settings.viewer.shareActionsAsk' =>
        TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsAsk', {}) ?? '- Pytaj - zawsze pytaj, co udostępnić',
      'settings.viewer.shareActionsPostURL' => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURL', {}) ?? '- Link postu',
      'settings.viewer.shareActionsFileURL' =>
        TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFileURL', {}) ??
            '- Link do pliku - udostępnia link do pliku (może nie działać dla niektórych stron)',
      'settings.viewer.shareActionsPostURLFileURLFileWithTags' =>
        TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURLFileURLFileWithTags', {}) ??
            '- Link postu/Pliku/Pliku z tagami - udostępnia link/plik i tagi, które wybierzesz',
      'settings.viewer.shareActionsFile' =>
        TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFile', {}) ??
            '- Plik - udostępnia plik bezpośrednio, co może chwilę zając, progres widoczny będzie na przycisku Udostępnij',
      'settings.viewer.shareActionsHydrus' =>
        TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsHydrus', {}) ?? '- Hydrus - wysyła link postu do Hydrus do importu',
      'settings.viewer.shareActionsNoteIfFileSavedInCache' =>
        TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsNoteIfFileSavedInCache', {}) ??
            '[Uwaga]: Plik zostanie załadowany z pamięci podręcznej, jeśli tam jest. Inaczej zostanie pobrany ponownie.',
      'settings.viewer.shareActionsTip' =>
        TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsTip', {}) ??
            '[Wskazówka]: Menu akcji Udostępniania otworzysz przytrzymując przycisk Udostępnij.',
      'settings.viewer.useVolumeButtonsForScrolling' =>
        TranslationOverrides.string(_root.$meta, 'settings.viewer.useVolumeButtonsForScrolling', {}) ?? 'Używaj przycisków głośności do przewijania',
      'settings.viewer.volumeButtonsScrolling' =>
        TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrolling', {}) ?? 'Przewijanie przyciskami głośności',
      'settings.viewer.volumeButtonsVolumeDown' => TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeDown', {}) ?? ' ',
      'settings.database.searchQuery' => TranslationOverrides.string(_root.$meta, 'settings.database.searchQuery', {}) ?? 'Szukane zapytanie',
      'settings.database.searchQueryOptional' =>
        TranslationOverrides.string(_root.$meta, 'settings.database.searchQueryOptional', {}) ?? '(opcjonalnie, może spowolnić proces)',
      'tagView.thisTagAlreadyInSearch' =>
        TranslationOverrides.string(_root.$meta, 'tagView.thisTagAlreadyInSearch', {}) ?? 'Ten tag znajduje się już w obecnym zapytaniu:',
      'tagView.addedToCurrentSearch' =>
        TranslationOverrides.string(_root.$meta, 'tagView.addedToCurrentSearch', {}) ?? 'Dodano do obecnego zapytania:',
      'pinnedTags.tagQuery' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQuery', {}) ?? 'Zapytanie tagów',
      'pinnedTags.tagQueryHint' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQueryHint', {}) ?? 'nazwa_tagu',
      'pinnedTags.rawQueryHelp' =>
        TranslationOverrides.string(_root.$meta, 'pinnedTags.rawQueryHelp', {}) ??
            'Możesz wpisać dowolne zapytanie wyszukiwania, w tym tagi ze spacjami',
      'preview.error.noResultsSubtitle' =>
        TranslationOverrides.string(_root.$meta, 'preview.error.noResultsSubtitle', {}) ??
            'Zmień zapytanie wyszukiwania lub kliknij, aby spróbować ponownie',
      _ => null,
    };
  }
}
