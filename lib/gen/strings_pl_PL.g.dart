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
  String get pleaseWait => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Poczekaj...';
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
  String get thisMayTakeSomeTime => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'To chwilę potrwa...';
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
  late final _Translations$searchHandler$pl_PL searchHandler = _Translations$searchHandler$pl_PL._(_root);
  @override
  late final _Translations$snatcher$pl_PL snatcher = _Translations$snatcher$pl_PL._(_root);
  @override
  late final _Translations$hydrus$pl_PL hydrus = _Translations$hydrus$pl_PL._(_root);
  @override
  late final _Translations$tabs$pl_PL tabs = _Translations$tabs$pl_PL._(_root);
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
  String get settingUpProxy => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Konfigurowanie proxy...';
  @override
  String get loadingDatabase => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Ładowanie bazy danych...';
  @override
  String get loadingBoorus => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Ładowanie booru...';
  @override
  String get loadingTags => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Ładowanie tagów...';
  @override
  String get restoringTabs => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Przywracanie kart...';
}

// Path: permissions
class _Translations$permissions$pl_PL extends Translations$permissions$en {
  _Translations$permissions$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
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
}

// Path: searchHandler
class _Translations$searchHandler$pl_PL extends Translations$searchHandler$en {
  _Translations$searchHandler$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
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
  String get listOfBrokenTabs => TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? 'Lista uszkodzonych kart:';
  @override
  String get tabsMerged => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? 'Karty scalone';
  @override
  String addedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'Dodano ${count} nowych kart',
        few: 'Dodano ${count} nowych kart',
        many: 'Dodano ${count} nowych kart',
        other: 'Dodano ${count} nowych kart',
      );
}

// Path: snatcher
class _Translations$snatcher$pl_PL extends Translations$snatcher$en {
  _Translations$snatcher$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
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
  String get itemsSnatched => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? 'Pobrane pliki';
  @override
  String snatchedCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'Pobrano: ${count} plik',
        few: 'Pobrano: ${count} plików',
        many: 'Pobrano: ${count} plików',
        other: 'Pobrano: ${count} plików',
      );
}

// Path: hydrus
class _Translations$hydrus$pl_PL extends Translations$hydrus$en {
  _Translations$hydrus$pl_PL._(TranslationsPlPl root) : this._root = root, super.internal(root);

  final TranslationsPlPl _root; // ignore: unused_field

  // Translations
  @override
  String get importError => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'Coś poszło nie tak przy imporcie do hydrusa';
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
  String get addModePrevTab => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? 'Poprzednia karta';
  @override
  String get addModeNextTab => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? 'Następna karta';
  @override
  String get queryModeDefault => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? 'Domyślna';
  @override
  String get queryModeCurrent => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? 'Obecna';
  @override
  String get queryModeCustom => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? 'Niestandardowa';
  @override
  String get tabRandomlyShuffled => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? 'Losowa kolejność kart';
  @override
  String get scrollToCurrent => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? 'Przewiń do obecnej karty';
  @override
  String get scrollToTop => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? 'Przewiń w górę';
  @override
  String get scrollToBottom => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? 'Przewiń na dół';
  @override
  String get filterTabsByBooru =>
      TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? 'Filtruj po booru, stanie, duplikatach...';
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
  String get select => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? 'Wybierz:';
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
      'pleaseWait' => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Poczekaj...',
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
      'thisMayTakeSomeTime' => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'To chwilę potrwa...',
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
      'init.settingUpProxy' => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Konfigurowanie proxy...',
      'init.loadingDatabase' => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Ładowanie bazy danych...',
      'init.loadingBoorus' => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Ładowanie booru...',
      'init.loadingTags' => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Ładowanie tagów...',
      'init.restoringTabs' => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Przywracanie kart...',
      'permissions.currentPath' => ({
        required String path,
      }) => TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? 'Obecna ścieżka: ${path}',
      'permissions.setDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? 'Wybierz katalog',
      'permissions.currentlyNotAvailableForThisPlatform' =>
        TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ?? 'Niedostępne na tym urządzeniu',
      'permissions.resetDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? 'Zresetuj katalog',
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
      'searchHandler.listOfBrokenTabs' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? 'Lista uszkodzonych kart:',
      'searchHandler.tabsMerged' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? 'Karty scalone',
      'searchHandler.addedTabsCount' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
              count,
              one: 'Dodano ${count} nowych kart',
              few: 'Dodano ${count} nowych kart',
              many: 'Dodano ${count} nowych kart',
              other: 'Dodano ${count} nowych kart',
            ),
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
      'snatcher.itemsSnatched' => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? 'Pobrane pliki',
      'snatcher.snatchedCount' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
              count,
              one: 'Pobrano: ${count} plik',
              few: 'Pobrano: ${count} plików',
              many: 'Pobrano: ${count} plików',
              other: 'Pobrano: ${count} plików',
            ),
      'hydrus.importError' => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'Coś poszło nie tak przy imporcie do hydrusa',
      'hydrus.addTagsToFile' => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? 'Dodaj tagi do plików',
      'hydrus.addUrls' => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'Dodaj Linki',
      'tabs.tab' => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? 'Karta',
      'tabs.addBoorusInSettings' => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? 'Dodaj booru w ustawieniach',
      'tabs.selectABooru' => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? 'Wybierz Booru',
      'tabs.secondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? 'Dodatkowe booru',
      'tabs.addNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? 'Dodaj nową kartę',
      'tabs.selectABooruOrLeaveEmpty' =>
        TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? 'Wybierz booru lub pozostaw puste',
      'tabs.addModePrevTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? 'Poprzednia karta',
      'tabs.addModeNextTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? 'Następna karta',
      'tabs.queryModeDefault' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? 'Domyślna',
      'tabs.queryModeCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? 'Obecna',
      'tabs.queryModeCustom' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? 'Niestandardowa',
      'tabs.tabRandomlyShuffled' => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? 'Losowa kolejność kart',
      'tabs.scrollToCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? 'Przewiń do obecnej karty',
      'tabs.scrollToTop' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? 'Przewiń w górę',
      'tabs.scrollToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? 'Przewiń na dół',
      'tabs.filterTabsByBooru' =>
        TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? 'Filtruj po booru, stanie, duplikatach...',
      'tabs.scrolling' => TranslationOverrides.string(_root.$meta, 'tabs.scrolling', {}) ?? 'Przewijanie:',
      'tabs.sorting' => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? 'Sortowanie:',
      'tabs.defaultTabsOrder' => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? 'Domyślna kolejność kart',
      'tabs.sortAlphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? 'Sortuj alfabetyzcznie',
      'tabs.sortAlphabeticallyReversed' =>
        TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? 'Sortuj alfabetycznie (odwrotnie)',
      'tabs.sortByBooruName' => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? 'Sortuj po nazwie booru',
      'tabs.sortByBooruNameReversed' =>
        TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ?? 'Sortuj po nazwie booru (odwrotnie)',
      'tabs.select' => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? 'Wybierz:',
      _ => null,
    };
  }
}
