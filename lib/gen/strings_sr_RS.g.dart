///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:lolisnatcher/src/utils/localization_plural_rules.dart';
import 'package:slang/generated.dart';
import 'package:slang/overrides.dart';

import 'strings.g.dart';

// Path: <root>
class TranslationsSrRs extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  /// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
  TranslationsSrRs({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : _meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.srRs,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
    _meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <sr-RS>.
  final TranslationMetadata<AppLocale, Translations> _meta;
  @override
  TranslationMetadata<AppLocale, Translations> get $meta => _meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => _meta.getTranslation(key) ?? super[key];

  late final TranslationsSrRs _root = this; // ignore: unused_field

  @override
  TranslationsSrRs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsSrRs(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'sr-RS';
  @override
  String get localeName => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'Srpski';
  @override
  String get appName => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Greška';
  @override
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'Greška!';
  @override
  String get success => TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Uspešno';
  @override
  String get successExclamation => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? 'Uspešno!';
  @override
  String get cancel => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Otkaži';
  @override
  String get kReturn => TranslationOverrides.string(_root.$meta, 'kReturn', {}) ?? 'Nazad';
  @override
  String get later => TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Kasnije';
  @override
  String get close => TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Zatvori';
  @override
  String get ok => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'U redu';
  @override
  String get yes => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Da';
  @override
  String get no => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'Ne';
  @override
  String get pleaseWait => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Sačekajte…';
  @override
  String get show => TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Prikaži';
  @override
  String get hide => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Sakrij';
  @override
  String get enable => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'Omogući';
  @override
  String get disable => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Onemogući';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Dodaj';
  @override
  String get exclude => TranslationOverrides.string(_root.$meta, 'exclude', {}) ?? 'Izuzmi';
  @override
  String get edit => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? 'Uredi';
  @override
  String get remove => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? 'Ukloni';
  @override
  String get save => TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Sačuvaj';
  @override
  String get delete => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? 'Obriši';
  @override
  String get confirm => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? 'Potvrdi';
  @override
  String get retry => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? 'Pokušaj ponovo';
  @override
  String get clear => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? 'Očisti';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Kopiraj';
  @override
  String get copied => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Kopirano';
  @override
  String get copiedToClipboard => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? 'Kopirano u privremenu memoriju';
  @override
  String get nothingFound => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? 'Ništa nije pronađeno';
  @override
  String get paste => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Nalepi';
  @override
  String get copyErrorText => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Kopiraj grešku';
  @override
  String get booru => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru';
  @override
  String get goToSettings => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'Idi u podešavanja';
  @override
  String get thisMayTakeSomeTime => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'Ovo može potrajati…';
  @override
  String get exitTheAppQuestion => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? 'Izaći iz aplikacije?';
  @override
  String get closeTheApp => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Zatvori aplikaciju';
  @override
  String get invalidUrl => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'Nevažeći URL!';
  @override
  String get clipboardIsEmpty => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'Privremena memorija je prazna!';
  @override
  String get failedToOpenLink => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'Otvaranje veze nije uspelo';
  @override
  String get apiKey => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'API ključ';
  @override
  String get userId => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'ID korisnika';
  @override
  String get login => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Korisničko ime';
  @override
  String get password => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Lozinka';
  @override
  String get pause => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Pauziraj';
  @override
  String get resume => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Nastavi';
  @override
  String get discord => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord';
  @override
  String get visitOurDiscord => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Posetite naš Discord server';
  @override
  String get item => TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Stavka';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'select', {}) ?? 'Izaberi';
  @override
  String get selectAll => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Izaberi sve';
  @override
  String get reset => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'Resetuj';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'open', {}) ?? 'Otvori';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? 'Otvori u novoj kartici';
  @override
  String get move => TranslationOverrides.string(_root.$meta, 'move', {}) ?? 'Premesti';
  @override
  String get shuffle => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? 'Promešaj';
  @override
  String get sort => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? 'Sortiraj';
  @override
  String get go => TranslationOverrides.string(_root.$meta, 'go', {}) ?? 'Idi';
  @override
  String get search => TranslationOverrides.string(_root.$meta, 'search', {}) ?? 'Pretraži';
  @override
  String get filter => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? 'Filter';
  @override
  String get or => TranslationOverrides.string(_root.$meta, 'or', {}) ?? 'Ili (~)';
  @override
  String get page => TranslationOverrides.string(_root.$meta, 'page', {}) ?? 'Stranica';
  @override
  String get pageNumber => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? 'Stranica #';
  @override
  String get tags => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'Oznake';
  @override
  String get type => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'Tip';
  @override
  String get name => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Naziv';
  @override
  String get address => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'Adresa';
  @override
  String get username => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'Korisničko ime';
  @override
  String get favourites => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'Omiljeno';
  @override
  String get downloads => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'Preuzimanja';
  @override
  String get secondsShort => TranslationOverrides.string(_root.$meta, 'secondsShort', {}) ?? 's';
  @override
  String get minutesShort => TranslationOverrides.string(_root.$meta, 'minutesShort', {}) ?? 'm';
  @override
  String get hoursShort => TranslationOverrides.string(_root.$meta, 'hoursShort', {}) ?? 'h';
  @override
  String get daysShort => TranslationOverrides.string(_root.$meta, 'daysShort', {}) ?? 'd';
  @override
  String get leaveThisPageQuestion => TranslationOverrides.string(_root.$meta, 'leaveThisPageQuestion', {}) ?? 'Napustiti ovu stranicu?';
  @override
  String get pageWillCloseAutomatically =>
      TranslationOverrides.string(_root.$meta, 'pageWillCloseAutomatically', {}) ?? 'Ova stranica će se automatski zatvoriti';
  @override
  String get stay => TranslationOverrides.string(_root.$meta, 'stay', {}) ?? 'Ostani';
  @override
  String get leaveNow => TranslationOverrides.string(_root.$meta, 'leaveNow', {}) ?? 'Napusti odmah';
  @override
  late final _Translations$validationErrors$sr_RS validationErrors = _Translations$validationErrors$sr_RS._(_root);
  @override
  late final _Translations$init$sr_RS init = _Translations$init$sr_RS._(_root);
  @override
  late final _Translations$permissions$sr_RS permissions = _Translations$permissions$sr_RS._(_root);
  @override
  late final _Translations$authentication$sr_RS authentication = _Translations$authentication$sr_RS._(_root);
  @override
  late final _Translations$searchHandler$sr_RS searchHandler = _Translations$searchHandler$sr_RS._(_root);
  @override
  late final _Translations$snatcher$sr_RS snatcher = _Translations$snatcher$sr_RS._(_root);
  @override
  late final _Translations$multibooru$sr_RS multibooru = _Translations$multibooru$sr_RS._(_root);
  @override
  late final _Translations$hydrus$sr_RS hydrus = _Translations$hydrus$sr_RS._(_root);
  @override
  late final _Translations$tabs$sr_RS tabs = _Translations$tabs$sr_RS._(_root);
  @override
  late final _Translations$history$sr_RS history = _Translations$history$sr_RS._(_root);
  @override
  late final _Translations$webview$sr_RS webview = _Translations$webview$sr_RS._(_root);
  @override
  late final _Translations$settings$sr_RS settings = _Translations$settings$sr_RS._(_root);
  @override
  late final _Translations$comments$sr_RS comments = _Translations$comments$sr_RS._(_root);
  @override
  late final _Translations$pageChanger$sr_RS pageChanger = _Translations$pageChanger$sr_RS._(_root);
  @override
  late final _Translations$tagsFiltersDialogs$sr_RS tagsFiltersDialogs = _Translations$tagsFiltersDialogs$sr_RS._(_root);
  @override
  late final _Translations$tagsManager$sr_RS tagsManager = _Translations$tagsManager$sr_RS._(_root);
  @override
  late final _Translations$lockscreen$sr_RS lockscreen = _Translations$lockscreen$sr_RS._(_root);
  @override
  late final _Translations$loliSync$sr_RS loliSync = _Translations$loliSync$sr_RS._(_root);
  @override
  late final _Translations$imageSearch$sr_RS imageSearch = _Translations$imageSearch$sr_RS._(_root);
  @override
  late final _Translations$tagView$sr_RS tagView = _Translations$tagView$sr_RS._(_root);
  @override
  late final _Translations$pinnedTags$sr_RS pinnedTags = _Translations$pinnedTags$sr_RS._(_root);
  @override
  late final _Translations$searchBar$sr_RS searchBar = _Translations$searchBar$sr_RS._(_root);
  @override
  late final _Translations$mobileHome$sr_RS mobileHome = _Translations$mobileHome$sr_RS._(_root);
  @override
  late final _Translations$desktopHome$sr_RS desktopHome = _Translations$desktopHome$sr_RS._(_root);
  @override
  late final _Translations$galleryView$sr_RS galleryView = _Translations$galleryView$sr_RS._(_root);
  @override
  late final _Translations$mediaPreviews$sr_RS mediaPreviews = _Translations$mediaPreviews$sr_RS._(_root);
  @override
  late final _Translations$viewer$sr_RS viewer = _Translations$viewer$sr_RS._(_root);
  @override
  late final _Translations$common$sr_RS common = _Translations$common$sr_RS._(_root);
  @override
  late final _Translations$gallery$sr_RS gallery = _Translations$gallery$sr_RS._(_root);
  @override
  late final _Translations$galleryButtons$sr_RS galleryButtons = _Translations$galleryButtons$sr_RS._(_root);
  @override
  late final _Translations$media$sr_RS media = _Translations$media$sr_RS._(_root);
  @override
  late final _Translations$imageStats$sr_RS imageStats = _Translations$imageStats$sr_RS._(_root);
  @override
  late final _Translations$preview$sr_RS preview = _Translations$preview$sr_RS._(_root);
  @override
  late final _Translations$tagType$sr_RS tagType = _Translations$tagType$sr_RS._(_root);
}

// Path: validationErrors
class _Translations$validationErrors$sr_RS extends Translations$validationErrors$en {
  _Translations$validationErrors$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get required => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Unesite vrednost';
  @override
  String get invalid => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Unesite važeću vrednost';
  @override
  String get invalidNumber => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? 'Unesite broj';
  @override
  String get invalidNumericValue =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? 'Unesite važeću brojčanu vrednost';
  @override
  String tooSmall({required double min}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Unesite vrednost veću od ${min}';
  @override
  String tooBig({required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Unesite vrednost manju od ${max}';
  @override
  String rangeError({required double min, required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ?? 'Unesite vrednost između ${min} i ${max}';
  @override
  String get greaterThanOrEqualZero =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? 'Unesite vrednost veću ili jednaku 0';
  @override
  String get lessThan4 => TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? 'Unesite vrednost manju od 4';
  @override
  String get biggerThan100 => TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? 'Unesite vrednost veću od 100';
  @override
  String get moreThan4ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ??
      'Korišćenje više od 4 kolone može uticati na performanse';
  @override
  String get moreThan8ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ??
      'Korišćenje više od 8 kolona može uticati na performanse';
}

// Path: init
class _Translations$init$sr_RS extends Translations$init$en {
  _Translations$init$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get initError => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Greška pri inicijalizaciji!';
  @override
  String get settingUpProxy => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Podešavanje proksija…';
  @override
  String get loadingDatabase => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Učitavanje baze podataka…';
  @override
  String get loadingBoorus => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Učitavanje booru sajtova…';
  @override
  String get loadingTags => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Učitavanje oznaka…';
  @override
  String get restoringTabs => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Vraćanje kartica…';
}

// Path: permissions
class _Translations$permissions$sr_RS extends Translations$permissions$en {
  _Translations$permissions$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get localNetworkRequired =>
      TranslationOverrides.string(_root.$meta, 'permissions.localNetworkRequired', {}) ??
      'Za otvaranje ove adrese potreban je pristup lokalnoj mreži. Odobrite dozvolu „Uređaji u blizini“, pa pokušajte ponovo.';
  @override
  String get localNetworkExplanationTitle =>
      TranslationOverrides.string(_root.$meta, 'permissions.localNetworkExplanationTitle', {}) ?? 'Pristup lokalnoj mreži';
  @override
  String get localNetworkExplanation =>
      TranslationOverrides.string(_root.$meta, 'permissions.localNetworkExplanation', {}) ??
      'Za otvaranje lokalnih booru servera ili sinhronizaciju sa drugim uređajem, aplikaciji je potreban pristup vašoj lokalnoj mreži. Android će prikazati zahtev za dozvolu „Uređaji u blizini“.';
  @override
  String get noAccessToCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ??
      'Nema pristupa prilagođenom direktorijumu za skladištenje';
  @override
  String get pleaseSetStorageDirectoryAgain =>
      TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ??
      'Ponovo postavite direktorijum za skladištenje kako biste aplikaciji omogućili pristup';
  @override
  String currentPath({required String path}) =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? 'Trenutna putanja: ${path}';
  @override
  String get setDirectory => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? 'Postavi direktorijum';
  @override
  String get currentlyNotAvailableForThisPlatform =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ?? 'Nije dostupno na ovoj platformi';
  @override
  String get resetDirectory => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? 'Resetuj direktorijum';
  @override
  String get afterResetFilesWillBeSavedToDefaultDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ??
      'Nakon resetovanja, datoteke će se čuvati u podrazumevanom direktorijumu';
}

// Path: authentication
class _Translations$authentication$sr_RS extends Translations$authentication$en {
  _Translations$authentication$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get pleaseAuthenticateToUseTheApp =>
      TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ??
      'Potvrdite identitet da biste koristili aplikaciju';
  @override
  String get noBiometricHardwareAvailable =>
      TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? 'Biometrijski hardver nije dostupan';
  @override
  String get temporaryLockout => TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? 'Privremeno zaključavanje';
  @override
  String somethingWentWrong({required String error}) =>
      TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ??
      'Došlo je do greške tokom autentifikacije: ${error}';
}

// Path: searchHandler
class _Translations$searchHandler$sr_RS extends Translations$searchHandler$en {
  _Translations$searchHandler$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get removedLastTab => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? 'Poslednja kartica je uklonjena';
  @override
  String get resettingSearchToDefaultTags =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? 'Vraćanje na podrazumevane oznake';
  @override
  String get uoh => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'UOOOOOOOHHH';
  @override
  String get ratingsChanged => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? 'Kategorije sadržaja su promenjene';
  @override
  String ratingsChangedMessage({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
      'Na ${booruType} [rating:safe] je sada zamenjen sa [rating:general] i [rating:sensitive]';
  @override
  String get appFixedRatingAutomatically =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ??
      'Kategorija sadržaja je automatski ispravljena. Koristite ispravnu kategoriju sadržaja u budućim pretragama';
  @override
  String get tabsRestored => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? 'Kartice su vraćene';
  @override
  String restoredTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
        count,
        one: 'Vraćena je ${count} kartica iz prethodne sesije',
        few: 'Vraćene su ${count} kartice iz prethodne sesije',
        other: 'Vraćeno je ${count} kartica iz prethodne sesije',
      );
  @override
  String get someRestoredTabsHadIssues =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ??
      'Neke vraćene kartice su imale nepoznate booru sajtove ili neispravne znakove.';
  @override
  String get theyWereSetToDefaultOrIgnored =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ??
      'Postavljene su na podrazumevane ili su ignorisane.';
  @override
  String get listOfBrokenTabs => TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? 'Spisak neispravnih kartica:';
  @override
  String get tabsMerged => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? 'Kartice su spojene';
  @override
  String addedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
        count,
        one: 'Dodata je ${count} nova kartica',
        few: 'Dodate su ${count} nove kartice',
        other: 'Dodato je ${count} novih kartica',
      );
  @override
  String get tabsReplaced => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? 'Kartice su zamenjene';
  @override
  String receivedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
        count,
        one: 'Primljena je ${count} kartica',
        few: 'Primljene su ${count} kartice',
        other: 'Primljeno je ${count} kartica',
      );
}

// Path: snatcher
class _Translations$snatcher$sr_RS extends Translations$snatcher$en {
  _Translations$snatcher$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Preuzimanje';
  @override
  String get snatchingHistory => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'Istorija preuzimanja';
  @override
  String get enterTags => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'Unesite oznake';
  @override
  String get amount => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? 'Količina';
  @override
  String get amountOfFilesToSnatch =>
      TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? 'Broj datoteka za preuzimanje';
  @override
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? 'Pauza (u ms)';
  @override
  String get delayBetweenEachDownload =>
      TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? 'Pauza između svakog preuzimanja';
  @override
  String get snatchFiles => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? 'Preuzmi datoteke';
  @override
  String get itemWasAlreadySnatched =>
      TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? 'Stavka je već ranije preuzeta';
  @override
  String get failedToSnatchItem => TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? 'Preuzimanje stavke nije uspelo';
  @override
  String get itemWasCancelled => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? 'Stavka je otkazana';
  @override
  String get startingNextQueueItem =>
      TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? 'Pokretanje sledeće stavke u redu…';
  @override
  String get itemsSnatched => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? 'Preuzete stavke';
  @override
  String snatchedCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
        count,
        one: 'Preuzeta: ${count} stavka',
        few: 'Preuzete: ${count} stavke',
        other: 'Preuzeto: ${count} stavki',
      );
  @override
  String filesAlreadySnatched({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
        count,
        one: '${count} datoteka je već preuzeta',
        few: '${count} datoteke su već preuzete',
        other: '${count} datoteka je već preuzeto',
      );
  @override
  String failedToSnatchFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
        count,
        one: 'Preuzimanje ${count} datoteke nije uspelo',
        few: 'Preuzimanje ${count} datoteke nije uspelo',
        other: 'Preuzimanje ${count} datoteka nije uspelo',
      );
  @override
  String cancelledFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
        count,
        one: 'Otkazana je ${count} datoteka',
        few: 'Otkazane su ${count} datoteke',
        other: 'Otkazano je ${count} datoteka',
      );
  @override
  String get snatchingImages => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? 'Preuzimanje slika';
  @override
  String get doNotCloseApp => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? 'Ne zatvarajte aplikaciju!';
  @override
  String get addedItemToQueue => TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? 'Stavka je dodata u red za preuzimanje';
  @override
  String addedItemsToQueue({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
        count,
        one: 'Dodata je ${count} stavka u red za preuzimanje',
        few: 'Dodate su ${count} stavke u red za preuzimanje',
        other: 'Dodato je ${count} stavki u red za preuzimanje',
      );
}

// Path: multibooru
class _Translations$multibooru$sr_RS extends Translations$multibooru$en {
  _Translations$multibooru$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? 'Multibooru';
  @override
  String get multibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Multibooru režim';
  @override
  String get multibooruRequiresAtLeastTwoBoorus =>
      TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ?? 'Zahteva najmanje 2 konfigurisana booru sajta';
  @override
  String get selectSecondaryBoorus =>
      TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Izaberite dodatne booru sajtove:';
  @override
  String get akaMultibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? 'odnosno Multibooru režim';
  @override
  String get labelSecondaryBoorusToInclude =>
      TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? 'Dodatni booru sajtovi za uključivanje';
}

// Path: hydrus
class _Translations$hydrus$sr_RS extends Translations$hydrus$en {
  _Translations$hydrus$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get importError => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'Došlo je do greške prilikom uvoza u Hydrus';
  @override
  String get apiPermissionsRequired =>
      TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ??
      'Možda niste dali odgovarajuće API dozvole, ovo se može izmeniti u Review Services';
  @override
  String get addTagsToFile => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? 'Dodaj oznake datoteci';
  @override
  String get addUrls => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'Dodaj URL-ove';
}

// Path: tabs
class _Translations$tabs$sr_RS extends Translations$tabs$en {
  _Translations$tabs$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get tab => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? 'Kartica';
  @override
  String get addBoorusInSettings =>
      TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? 'Dodajte booru sajtove u podešavanjima';
  @override
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? 'Izaberite Booru';
  @override
  String get secondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? 'Dodatni booru sajtovi';
  @override
  String get addNewTab => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? 'Dodaj novu karticu';
  @override
  String get selectABooruOrLeaveEmpty =>
      TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? 'Izaberite booru ili ostavite prazno';
  @override
  String get addPosition => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? 'Pozicija dodavanja';
  @override
  String get addModePrevTab => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? 'Prethodna kartica';
  @override
  String get addModeNextTab => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? 'Sledeća kartica';
  @override
  String get addModeListEnd => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? 'Kraj liste';
  @override
  String get usedQuery => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? 'Korišćeni upit';
  @override
  String get queryModeDefault => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? 'Podrazumevano';
  @override
  String get queryModeCurrent => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? 'Trenutno';
  @override
  String get queryModeCustom => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? 'Prilagođeno';
  @override
  String get customQuery => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? 'Prilagođeni upit';
  @override
  String get empty => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '[prazno]';
  @override
  String get addSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? 'Dodaj dodatne booru sajtove';
  @override
  String get keepSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? 'Zadrži dodatne booru sajtove';
  @override
  String get startFromCustomPageNumber =>
      TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? 'Započni od prilagođenog broja stranice';
  @override
  String get switchToNewTab => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? 'Prebaci na novu karticu';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? 'Dodaj';
  @override
  String get tabsManager => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? 'Upravljač karticama';
  @override
  String get selectMode => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? 'Režim izbora';
  @override
  String get sortMode => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? 'Sortiraj kartice';
  @override
  String get help => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? 'Pomoć';
  @override
  String get deleteTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? 'Obriši kartice';
  @override
  String get deleteDuplicateTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteDuplicateTabs', {}) ?? 'Obriši duplirane kartice';
  @override
  String get deleteDuplicateTabsQuestion =>
      TranslationOverrides.string(_root.$meta, 'tabs.deleteDuplicateTabsQuestion', {}) ??
      'Pronađene su duplirane kartice. Izaberite kartice koje želite da zadržite u svakoj grupi:';
  @override
  String get keepFirstDuplicateTabs => TranslationOverrides.string(_root.$meta, 'tabs.keepFirstDuplicateTabs', {}) ?? 'Zadrži prvu';
  @override
  String get keepLastDuplicateTabs => TranslationOverrides.string(_root.$meta, 'tabs.keepLastDuplicateTabs', {}) ?? 'Zadrži poslednju';
  @override
  String get skipDuplicateTabDelete => TranslationOverrides.string(_root.$meta, 'tabs.skipDuplicateTabDelete', {}) ?? 'Preskoči';
  @override
  String get shuffleTabs => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? 'Promešaj kartice';
  @override
  String get tabRandomlyShuffled => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? 'Kartice su nasumično promešane';
  @override
  String get tabOrderSaved => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? 'Redosled kartica je sačuvan';
  @override
  String get scrollToCurrent => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? 'Pomeri do trenutne kartice';
  @override
  String get scrollToTop => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? 'Pomeri na vrh';
  @override
  String get scrollToBottom => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? 'Pomeri na dno';
  @override
  String get filterTabsByBooru =>
      TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? 'Filtriraj po booru sajtu, statusu, duplikatima…';
  @override
  String get scrolling => TranslationOverrides.string(_root.$meta, 'tabs.scrolling', {}) ?? 'Pomeranje:';
  @override
  String get sorting => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? 'Sortiranje:';
  @override
  String get defaultTabsOrder => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? 'Podrazumevani redosled kartica';
  @override
  String get sortAlphabetically => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? 'Sortiraj abecedno';
  @override
  String get sortAlphabeticallyReversed =>
      TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? 'Sortiraj abecedno (obrnuto)';
  @override
  String get sortByBooruName => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? 'Sortiraj po imenu booru sajta abecedno';
  @override
  String get sortByBooruNameReversed =>
      TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ?? 'Sortiraj po imenu booru sajta abecedno (obrnuto)';
  @override
  String get longPressSortToSave =>
      TranslationOverrides.string(_root.$meta, 'tabs.longPressSortToSave', {}) ??
      'Dugo pritisnite dugme za sortiranje da biste sačuvali trenutni redosled';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? 'Izbor:';
  @override
  String get toggleSelectMode => TranslationOverrides.string(_root.$meta, 'tabs.toggleSelectMode', {}) ?? 'Uključi/isključi režim izbora';
  @override
  String get onTheBottomOfPage => TranslationOverrides.string(_root.$meta, 'tabs.onTheBottomOfPage', {}) ?? 'Na dnu stranice: ';
  @override
  String get selectDeselectAll => TranslationOverrides.string(_root.$meta, 'tabs.selectDeselectAll', {}) ?? 'Izaberi/poništi izbor svih kartica';
  @override
  String get deleteSelectedTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? 'Obriši izabrane kartice';
  @override
  String get longPressToMove =>
      TranslationOverrides.string(_root.$meta, 'tabs.longPressToMove', {}) ?? 'Dugo pritisnite karticu da biste je premestili';
  @override
  String get numbersInBottomRight =>
      TranslationOverrides.string(_root.$meta, 'tabs.numbersInBottomRight', {}) ?? 'Brojevi u donjem desnom uglu kartice:';
  @override
  String get firstNumberTabIndex =>
      TranslationOverrides.string(_root.$meta, 'tabs.firstNumberTabIndex', {}) ?? 'Prvi broj - indeks kartice u podrazumevanom redosledu liste';
  @override
  String get secondNumberTabIndex =>
      TranslationOverrides.string(_root.$meta, 'tabs.secondNumberTabIndex', {}) ??
      'Drugi broj - indeks kartice u trenutnom redosledu liste, prikazuje se kada je filtriranje/sortiranje aktivno';
  @override
  String get specialFilters => TranslationOverrides.string(_root.$meta, 'tabs.specialFilters', {}) ?? 'Specijalni filteri:';
  @override
  String get loadedFilter =>
      TranslationOverrides.string(_root.$meta, 'tabs.loadedFilter', {}) ?? '«Učitano» - prikaži kartice koje imaju učitane stavke';
  @override
  String get notLoadedFilter =>
      TranslationOverrides.string(_root.$meta, 'tabs.notLoadedFilter', {}) ??
      '«Nije učitano» - prikaži kartice koje nisu učitane i/ili imaju nula stavki';
  @override
  String get notLoadedItalic =>
      TranslationOverrides.string(_root.$meta, 'tabs.notLoadedItalic', {}) ?? 'Kartice koje nisu učitane imaju tekst u kurzivu';
  @override
  String get noTabsFound => TranslationOverrides.string(_root.$meta, 'tabs.noTabsFound', {}) ?? 'Nema pronađenih kartica';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tabs.copy', {}) ?? 'Kopiraj';
  @override
  String get moveAction => TranslationOverrides.string(_root.$meta, 'tabs.moveAction', {}) ?? 'Premesti';
  @override
  String get remove => TranslationOverrides.string(_root.$meta, 'tabs.remove', {}) ?? 'Ukloni';
  @override
  String get shuffle => TranslationOverrides.string(_root.$meta, 'tabs.shuffle', {}) ?? 'Promešaj';
  @override
  String get sort => TranslationOverrides.string(_root.$meta, 'tabs.sort', {}) ?? 'Sortiraj';
  @override
  String get shuffleTabsQuestion =>
      TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabsQuestion', {}) ?? 'Nasumično promešati redosled kartica?';
  @override
  String get saveTabsInCurrentOrder =>
      TranslationOverrides.string(_root.$meta, 'tabs.saveTabsInCurrentOrder', {}) ?? 'Sačuvati kartice u trenutnom redosledu sortiranja?';
  @override
  String get byBooru => TranslationOverrides.string(_root.$meta, 'tabs.byBooru', {}) ?? 'Po booru sajtu';
  @override
  String get alphabetically => TranslationOverrides.string(_root.$meta, 'tabs.alphabetically', {}) ?? 'Abecedno';
  @override
  String get reversed => TranslationOverrides.string(_root.$meta, 'tabs.reversed', {}) ?? '(obrnuto)';
  @override
  String areYouSureDeleteTabs({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'tabs.areYouSureDeleteTabs', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
        count,
        one: 'Da li ste sigurni da želite da obrišete ${count} karticu?',
        few: 'Da li ste sigurni da želite da obrišete ${count} kartice?',
        other: 'Da li ste sigurni da želite da obrišete ${count} kartica?',
      );
  @override
  late final _Translations$tabs$filters$sr_RS filters = _Translations$tabs$filters$sr_RS._(_root);
  @override
  late final _Translations$tabs$move$sr_RS move = _Translations$tabs$move$sr_RS._(_root);
}

// Path: history
class _Translations$history$sr_RS extends Translations$history$en {
  _Translations$history$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get searchHistory => TranslationOverrides.string(_root.$meta, 'history.searchHistory', {}) ?? 'Istorija pretrage';
  @override
  String get searchHistoryIsEmpty => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsEmpty', {}) ?? 'Istorija pretrage je prazna';
  @override
  String get searchHistoryIsDisabled =>
      TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsDisabled', {}) ?? 'Istorija pretrage je onemogućena';
  @override
  String get searchHistoryRequiresDatabase =>
      TranslationOverrides.string(_root.$meta, 'history.searchHistoryRequiresDatabase', {}) ??
      'Omogućite bazu podataka u podešavanjima za istoriju pretrage';
  @override
  String lastSearch({required String search}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearch', {'search': search}) ?? 'Poslednja pretraga: ${search}';
  @override
  String lastSearchWithDate({required String date}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearchWithDate', {'date': date}) ?? 'Poslednja pretraga: ${date}';
  @override
  String get unknownBooruType => TranslationOverrides.string(_root.$meta, 'history.unknownBooruType', {}) ?? 'Nepoznat tip booru sajta!';
  @override
  String unknownBooru({required String name, required String type}) =>
      TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ?? 'Nepoznat booru (${name}-${type})';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? 'Otvori';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? 'Otvori u novoj kartici';
  @override
  String get removeFromFavourites => TranslationOverrides.string(_root.$meta, 'history.removeFromFavourites', {}) ?? 'Ukloni iz omiljenih';
  @override
  String get setAsFavourite => TranslationOverrides.string(_root.$meta, 'history.setAsFavourite', {}) ?? 'Postavi kao omiljeno';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'history.copy', {}) ?? 'Kopiraj';
  @override
  String get delete => TranslationOverrides.string(_root.$meta, 'history.delete', {}) ?? 'Obriši';
  @override
  String get deleteHistoryEntries => TranslationOverrides.string(_root.$meta, 'history.deleteHistoryEntries', {}) ?? 'Obriši stavke istorije';
  @override
  String deleteItemsConfirm({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'history.deleteItemsConfirm', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
        count,
        one: 'Da li ste sigurni da želite da obrišete ${count} stavku?',
        few: 'Da li ste sigurni da želite da obrišete ${count} stavke?',
        other: 'Da li ste sigurni da želite da obrišete ${count} stavki?',
      );
  @override
  String get clearSelection => TranslationOverrides.string(_root.$meta, 'history.clearSelection', {}) ?? 'Poništi izbor';
  @override
  String deleteItems({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'history.deleteItems', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
        count,
        one: 'Obriši ${count} stavku',
        few: 'Obriši ${count} stavke',
        other: 'Obriši ${count} stavki',
      );
}

// Path: webview
class _Translations$webview$sr_RS extends Translations$webview$en {
  _Translations$webview$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'webview.title', {}) ?? 'Webview';
  @override
  String get notSupportedOnDevice => TranslationOverrides.string(_root.$meta, 'webview.notSupportedOnDevice', {}) ?? 'Nije podržano na ovom uređaju';
  @override
  String get captcha => TranslationOverrides.string(_root.$meta, 'webview.captcha', {}) ?? 'Captcha';
  @override
  String get captchaCheckDescription =>
      TranslationOverrides.string(_root.$meta, 'webview.captchaCheckDescription', {}) ??
      'Otkrivena je moguća Captcha, rešite je i vratite se kada završite';
  @override
  String get captchaCompleted => TranslationOverrides.string(_root.$meta, 'webview.captchaCompleted', {}) ?? 'Captcha je rešena';
  @override
  late final _Translations$webview$navigation$sr_RS navigation = _Translations$webview$navigation$sr_RS._(_root);
}

// Path: settings
class _Translations$settings$sr_RS extends Translations$settings$en {
  _Translations$settings$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Podešavanja';
  @override
  late final _Translations$settings$language$sr_RS language = _Translations$settings$language$sr_RS._(_root);
  @override
  late final _Translations$settings$booru$sr_RS booru = _Translations$settings$booru$sr_RS._(_root);
  @override
  late final _Translations$settings$booruEditor$sr_RS booruEditor = _Translations$settings$booruEditor$sr_RS._(_root);
  @override
  late final _Translations$settings$interface$sr_RS interface = _Translations$settings$interface$sr_RS._(_root);
  @override
  late final _Translations$settings$theme$sr_RS theme = _Translations$settings$theme$sr_RS._(_root);
  @override
  late final _Translations$settings$viewer$sr_RS viewer = _Translations$settings$viewer$sr_RS._(_root);
  @override
  late final _Translations$settings$video$sr_RS video = _Translations$settings$video$sr_RS._(_root);
  @override
  late final _Translations$settings$downloads$sr_RS downloads = _Translations$settings$downloads$sr_RS._(_root);
  @override
  late final _Translations$settings$database$sr_RS database = _Translations$settings$database$sr_RS._(_root);
  @override
  late final _Translations$settings$backupAndRestore$sr_RS backupAndRestore = _Translations$settings$backupAndRestore$sr_RS._(_root);
  @override
  late final _Translations$settings$network$sr_RS network = _Translations$settings$network$sr_RS._(_root);
  @override
  late final _Translations$settings$privacy$sr_RS privacy = _Translations$settings$privacy$sr_RS._(_root);
  @override
  late final _Translations$settings$performance$sr_RS performance = _Translations$settings$performance$sr_RS._(_root);
  @override
  late final _Translations$settings$cache$sr_RS cache = _Translations$settings$cache$sr_RS._(_root);
  @override
  late final _Translations$settings$itemFilters$sr_RS itemFilters = _Translations$settings$itemFilters$sr_RS._(_root);
  @override
  late final _Translations$settings$sync$sr_RS sync = _Translations$settings$sync$sr_RS._(_root);
  @override
  late final _Translations$settings$about$sr_RS about = _Translations$settings$about$sr_RS._(_root);
  @override
  late final _Translations$settings$checkForUpdates$sr_RS checkForUpdates = _Translations$settings$checkForUpdates$sr_RS._(_root);
  @override
  late final _Translations$settings$logs$sr_RS logs = _Translations$settings$logs$sr_RS._(_root);
  @override
  late final _Translations$settings$help$sr_RS help = _Translations$settings$help$sr_RS._(_root);
  @override
  late final _Translations$settings$debug$sr_RS debug = _Translations$settings$debug$sr_RS._(_root);
  @override
  late final _Translations$settings$logging$sr_RS logging = _Translations$settings$logging$sr_RS._(_root);
  @override
  late final _Translations$settings$webview$sr_RS webview = _Translations$settings$webview$sr_RS._(_root);
  @override
  late final _Translations$settings$dirPicker$sr_RS dirPicker = _Translations$settings$dirPicker$sr_RS._(_root);
  @override
  String get version => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? 'Verzija';
}

// Path: comments
class _Translations$comments$sr_RS extends Translations$comments$en {
  _Translations$comments$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'comments.title', {}) ?? 'Komentari';
  @override
  String get noComments => TranslationOverrides.string(_root.$meta, 'comments.noComments', {}) ?? 'Nema komentara';
  @override
  String get noBooruAPIForComments =>
      TranslationOverrides.string(_root.$meta, 'comments.noBooruAPIForComments', {}) ?? 'Ovaj Booru nema komentare ili ne postoji API za njih';
}

// Path: pageChanger
class _Translations$pageChanger$sr_RS extends Translations$pageChanger$en {
  _Translations$pageChanger$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'pageChanger.title', {}) ?? 'Promena stranice';
  @override
  String get pageLabel => TranslationOverrides.string(_root.$meta, 'pageChanger.pageLabel', {}) ?? 'Stranica br.';
  @override
  String get delayBetweenLoadings =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.delayBetweenLoadings', {}) ?? 'Kašnjenje između učitavanja (ms)';
  @override
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'pageChanger.delayInMs', {}) ?? 'Kašnjenje u ms';
  @override
  String currentPage({required int number}) =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.currentPage', {'number': number}) ?? 'Trenutna stranica br. ${number}';
  @override
  String possibleMaxPage({required int number}) =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.possibleMaxPage', {'number': number}) ?? 'Moguća maks. stranica br. ~${number}';
  @override
  String get searchCurrentlyRunning =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.searchCurrentlyRunning', {}) ?? 'Pretraga je trenutno u toku!';
  @override
  String get jumpToPage => TranslationOverrides.string(_root.$meta, 'pageChanger.jumpToPage', {}) ?? 'Idi na stranicu';
  @override
  String get searchUntilPage => TranslationOverrides.string(_root.$meta, 'pageChanger.searchUntilPage', {}) ?? 'Pretražuj do stranice';
  @override
  String get stopSearching => TranslationOverrides.string(_root.$meta, 'pageChanger.stopSearching', {}) ?? 'Zaustavi pretragu';
}

// Path: tagsFiltersDialogs
class _Translations$tagsFiltersDialogs$sr_RS extends Translations$tagsFiltersDialogs$en {
  _Translations$tagsFiltersDialogs$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get emptyInput => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.emptyInput', {}) ?? 'Prazan unos!';
  @override
  String addNewFilter({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.addNewFilter', {'type': type}) ?? '[Dodaj novi ${type} filter]';
  @override
  String newTagFilter({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newTagFilter', {'type': type}) ?? 'Novi ${type} filter oznaka';
  @override
  String get newFilter => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newFilter', {}) ?? 'Novi filter';
  @override
  String get editFilter => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.editFilter', {}) ?? 'Uredi filter';
}

// Path: tagsManager
class _Translations$tagsManager$sr_RS extends Translations$tagsManager$en {
  _Translations$tagsManager$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'tagsManager.title', {}) ?? 'Oznake';
  @override
  String get addTag => TranslationOverrides.string(_root.$meta, 'tagsManager.addTag', {}) ?? 'Dodaj oznaku';
  @override
  String get name => TranslationOverrides.string(_root.$meta, 'tagsManager.name', {}) ?? 'Naziv';
  @override
  String get type => TranslationOverrides.string(_root.$meta, 'tagsManager.type', {}) ?? 'Tip';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'tagsManager.add', {}) ?? 'Dodaj';
  @override
  String staleAfter({required String staleText}) =>
      TranslationOverrides.string(_root.$meta, 'tagsManager.staleAfter', {'staleText': staleText}) ?? 'Zastareva nakon: ${staleText}';
  @override
  String get addedATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addedATab', {}) ?? 'Dodata je kartica';
  @override
  String get addATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addATab', {}) ?? 'Dodaj karticu';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tagsManager.copy', {}) ?? 'Kopiraj';
  @override
  String get setStale => TranslationOverrides.string(_root.$meta, 'tagsManager.setStale', {}) ?? 'Postavi kao zastarelo';
  @override
  String get resetStale => TranslationOverrides.string(_root.$meta, 'tagsManager.resetStale', {}) ?? 'Resetuj zastarelost';
  @override
  String get makeUnstaleable => TranslationOverrides.string(_root.$meta, 'tagsManager.makeUnstaleable', {}) ?? 'Onemogući zastarevanje';
  @override
  String deleteTags({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'tagsManager.deleteTags', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
        count,
        one: 'Obriši ${count} oznaku',
        few: 'Obriši ${count} oznake',
        other: 'Obriši ${count} oznaka',
      );
  @override
  String get deleteTagsTitle => TranslationOverrides.string(_root.$meta, 'tagsManager.deleteTagsTitle', {}) ?? 'Obriši oznake';
  @override
  String get clearSelection => TranslationOverrides.string(_root.$meta, 'tagsManager.clearSelection', {}) ?? 'Poništi izbor';
}

// Path: lockscreen
class _Translations$lockscreen$sr_RS extends Translations$lockscreen$en {
  _Translations$lockscreen$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get tapToAuthenticate => TranslationOverrides.string(_root.$meta, 'lockscreen.tapToAuthenticate', {}) ?? 'Dodirnite za potvrdu identiteta';
  @override
  String get devUnlock => TranslationOverrides.string(_root.$meta, 'lockscreen.devUnlock', {}) ?? 'OTKLJUČAJ ZA TESTIRANJE';
  @override
  String get testingMessage =>
      TranslationOverrides.string(_root.$meta, 'lockscreen.testingMessage', {}) ??
      '[TESTIRANJE]: Pritisnite ovo ako ne možete da otključate aplikaciju na uobičajen način. Prijavite programeru uz detalje o svom uređaju.';
}

// Path: loliSync
class _Translations$loliSync$sr_RS extends Translations$loliSync$en {
  _Translations$loliSync$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'loliSync.title', {}) ?? 'Sinhronizacija';
  @override
  String get stopSyncingQuestion =>
      TranslationOverrides.string(_root.$meta, 'loliSync.stopSyncingQuestion', {}) ?? 'Da li želite da zaustavite sinhronizaciju?';
  @override
  String get stopServerQuestion =>
      TranslationOverrides.string(_root.$meta, 'loliSync.stopServerQuestion', {}) ?? 'Da li želite da zaustavite server?';
  @override
  String get noConnection => TranslationOverrides.string(_root.$meta, 'loliSync.noConnection', {}) ?? 'Nema veze';
  @override
  String get waitingForConnection => TranslationOverrides.string(_root.$meta, 'loliSync.waitingForConnection', {}) ?? 'Čekanje na vezu…';
  @override
  String get startingServer => TranslationOverrides.string(_root.$meta, 'loliSync.startingServer', {}) ?? 'Pokretanje servera…';
  @override
  String get keepScreenAwake => TranslationOverrides.string(_root.$meta, 'loliSync.keepScreenAwake', {}) ?? 'Drži ekran uključenim';
  @override
  String get serverKilled => TranslationOverrides.string(_root.$meta, 'loliSync.serverKilled', {}) ?? 'Server za sinhronizaciju je zaustavljen';
  @override
  String testError({required int statusCode, required String reasonPhrase}) =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testError', {'statusCode': statusCode, 'reasonPhrase': reasonPhrase}) ??
      'Greška pri testiranju: ${statusCode} ${reasonPhrase}';
  @override
  String testErrorException({required String error}) =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testErrorException', {'error': error}) ?? 'Greška pri testiranju: ${error}';
  @override
  String get testSuccess => TranslationOverrides.string(_root.$meta, 'loliSync.testSuccess', {}) ?? 'Probni zahtev je dobio pozitivan odgovor';
  @override
  String get testSuccessMessage =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testSuccessMessage', {}) ?? 'Na drugom uređaju bi trebalo da se pojavi poruka \'Test\'';
}

// Path: imageSearch
class _Translations$imageSearch$sr_RS extends Translations$imageSearch$en {
  _Translations$imageSearch$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'imageSearch.title', {}) ?? 'Pretraga po slici';
}

// Path: tagView
class _Translations$tagView$sr_RS extends Translations$tagView$en {
  _Translations$tagView$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get tags => TranslationOverrides.string(_root.$meta, 'tagView.tags', {}) ?? 'Oznake';
  @override
  String get comments => TranslationOverrides.string(_root.$meta, 'tagView.comments', {}) ?? 'Komentari';
  @override
  String showNotes({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'tagView.showNotes', {'count': count}) ?? 'Prikaži beleške (${count})';
  @override
  String hideNotes({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'tagView.hideNotes', {'count': count}) ?? 'Sakrij beleške (${count})';
  @override
  String get loadNotes => TranslationOverrides.string(_root.$meta, 'tagView.loadNotes', {}) ?? 'Učitaj beleške';
  @override
  String get thisTagAlreadyInSearch =>
      TranslationOverrides.string(_root.$meta, 'tagView.thisTagAlreadyInSearch', {}) ?? 'Ova oznaka je već u trenutnom upitu za pretragu:';
  @override
  String get addedToCurrentSearch =>
      TranslationOverrides.string(_root.$meta, 'tagView.addedToCurrentSearch', {}) ?? 'Dodato u trenutni upit za pretragu:';
  @override
  String get addedNewTab => TranslationOverrides.string(_root.$meta, 'tagView.addedNewTab', {}) ?? 'Dodata nova kartica:';
  @override
  String get id => TranslationOverrides.string(_root.$meta, 'tagView.id', {}) ?? 'ID';
  @override
  String get postURL => TranslationOverrides.string(_root.$meta, 'tagView.postURL', {}) ?? 'URL objave';
  @override
  String get uploader => TranslationOverrides.string(_root.$meta, 'tagView.uploader', {}) ?? 'Otpremalac';
  @override
  String get posted => TranslationOverrides.string(_root.$meta, 'tagView.posted', {}) ?? 'Objavljeno';
  @override
  String get details => TranslationOverrides.string(_root.$meta, 'tagView.details', {}) ?? 'Detalji';
  @override
  String get filename => TranslationOverrides.string(_root.$meta, 'tagView.filename', {}) ?? 'Naziv datoteke';
  @override
  String get url => TranslationOverrides.string(_root.$meta, 'tagView.url', {}) ?? 'URL';
  @override
  String get extension => TranslationOverrides.string(_root.$meta, 'tagView.extension', {}) ?? 'Ekstenzija';
  @override
  String get resolution => TranslationOverrides.string(_root.$meta, 'tagView.resolution', {}) ?? 'Rezolucija';
  @override
  String get size => TranslationOverrides.string(_root.$meta, 'tagView.size', {}) ?? 'Veličina';
  @override
  String get md5 => TranslationOverrides.string(_root.$meta, 'tagView.md5', {}) ?? 'MD5';
  @override
  String get rating => TranslationOverrides.string(_root.$meta, 'tagView.rating', {}) ?? 'Kategorija sadržaja';
  @override
  String get score => TranslationOverrides.string(_root.$meta, 'tagView.score', {}) ?? 'Broj poena';
  @override
  String get noTagsFound => TranslationOverrides.string(_root.$meta, 'tagView.noTagsFound', {}) ?? 'Nisu pronađene oznake';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tagView.copy', {}) ?? 'Kopiraj';
  @override
  String get removeFromSearch => TranslationOverrides.string(_root.$meta, 'tagView.removeFromSearch', {}) ?? 'Ukloni iz pretrage';
  @override
  String get addToSearch => TranslationOverrides.string(_root.$meta, 'tagView.addToSearch', {}) ?? 'Dodaj u pretragu';
  @override
  String get addedToSearchBar => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBar', {}) ?? 'Dodato u traku za pretragu:';
  @override
  String get excludeFromSearch => TranslationOverrides.string(_root.$meta, 'tagView.excludeFromSearch', {}) ?? 'Izuzmi iz pretrage';
  @override
  String get exclusionAddedToSearchBar =>
      TranslationOverrides.string(_root.$meta, 'tagView.exclusionAddedToSearchBar', {}) ?? 'Dodato izuzimanje u traku za pretragu:';
  @override
  String get addToMarked => TranslationOverrides.string(_root.$meta, 'tagView.addToMarked', {}) ?? 'Dodaj u označeno';
  @override
  String get addToHidden => TranslationOverrides.string(_root.$meta, 'tagView.addToHidden', {}) ?? 'Dodaj u skriveno';
  @override
  String get removeFromMarked => TranslationOverrides.string(_root.$meta, 'tagView.removeFromMarked', {}) ?? 'Ukloni iz označenog';
  @override
  String get removeFromHidden => TranslationOverrides.string(_root.$meta, 'tagView.removeFromHidden', {}) ?? 'Ukloni iz skrivenog';
  @override
  String get editTag => TranslationOverrides.string(_root.$meta, 'tagView.editTag', {}) ?? 'Uredi oznaku';
  @override
  String get sourceDialogTitle => TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogTitle', {}) ?? 'Izvor';
  @override
  String get preview => TranslationOverrides.string(_root.$meta, 'tagView.preview', {}) ?? 'Pregled';
  @override
  String get selectBooruToLoad => TranslationOverrides.string(_root.$meta, 'tagView.selectBooruToLoad', {}) ?? 'Izaberite Booru za učitavanje';
  @override
  String get previewIsLoading => TranslationOverrides.string(_root.$meta, 'tagView.previewIsLoading', {}) ?? 'Pregled se učitava…';
  @override
  String get failedToLoadPreview => TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreview', {}) ?? 'Učitavanje pregleda nije uspelo';
  @override
  String get tapToTryAgain => TranslationOverrides.string(_root.$meta, 'tagView.tapToTryAgain', {}) ?? 'Dodirnite za ponovni pokušaj';
  @override
  String get copiedFileURL =>
      TranslationOverrides.string(_root.$meta, 'tagView.copiedFileURL', {}) ?? 'URL datoteke je kopiran u privremenu memoriju';
  @override
  String get tagPreviews => TranslationOverrides.string(_root.$meta, 'tagView.tagPreviews', {}) ?? 'Pregledi oznaka';
  @override
  String get currentState => TranslationOverrides.string(_root.$meta, 'tagView.currentState', {}) ?? 'Trenutno stanje';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'tagView.history', {}) ?? 'Istorija';
  @override
  String get failedToLoadPreviewPage =>
      TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreviewPage', {}) ?? 'Učitavanje stranice pregleda nije uspelo';
  @override
  String get tryAgain => TranslationOverrides.string(_root.$meta, 'tagView.tryAgain', {}) ?? 'Pokušajte ponovo';
  @override
  String get detectedLinks => TranslationOverrides.string(_root.$meta, 'tagView.detectedLinks', {}) ?? 'Otkriveni linkovi:';
  @override
  String get relatedTabs => TranslationOverrides.string(_root.$meta, 'tagView.relatedTabs', {}) ?? 'Povezane kartice';
  @override
  String get tabsWithOnlyTag => TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTag', {}) ?? 'Kartice koje sadrže samo ovu oznaku';
  @override
  String get tabsWithOnlyTagDifferentBooru =>
      TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTagDifferentBooru', {}) ??
      'Kartice koje sadrže samo ovu oznaku ali na drugom Booru-u';
  @override
  String get tabsContainingTag => TranslationOverrides.string(_root.$meta, 'tagView.tabsContainingTag', {}) ?? 'Kartice koje sadrže ovu oznaku';
}

// Path: pinnedTags
class _Translations$pinnedTags$sr_RS extends Translations$pinnedTags$en {
  _Translations$pinnedTags$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get pinnedTags => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedTags', {}) ?? 'Zakačene oznake';
  @override
  String get pinTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinTag', {}) ?? 'Zakači oznaku';
  @override
  String get unpinTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinTag', {}) ?? 'Otkači oznaku';
  @override
  String get pin => TranslationOverrides.string(_root.$meta, 'pinnedTags.pin', {}) ?? 'Zakači';
  @override
  String get unpin => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpin', {}) ?? 'Otkači';
  @override
  String pinQuestion({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinQuestion', {'tag': tag}) ?? 'Zakačiti «${tag}» u brzi pristup?';
  @override
  String unpinQuestion({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinQuestion', {'tag': tag}) ?? 'Ukloniti «${tag}» iz zakačenih oznaka?';
  @override
  String onlyForBooru({required String name}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.onlyForBooru', {'name': name}) ?? 'Samo za ${name}';
  @override
  String get labelsOptional => TranslationOverrides.string(_root.$meta, 'pinnedTags.labelsOptional', {}) ?? 'Labele (opciono)';
  @override
  String get typeAndPressAdd =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.typeAndPressAdd', {}) ??
      'Unesite tekst i pritisnite dugme Dodaj da biste uključili labelu';
  @override
  String get selectExistingLabel => TranslationOverrides.string(_root.$meta, 'pinnedTags.selectExistingLabel', {}) ?? 'Izaberite postojeću labelu';
  @override
  String get tagPinned => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagPinned', {}) ?? 'Oznaka je zakačena';
  @override
  String pinnedForBooru({required String name, required String labels}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedForBooru', {'name': name, 'labels': labels}) ?? 'Zakačeno za ${name}${labels}';
  @override
  String pinnedGloballyWithLabels({required String labels}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedGloballyWithLabels', {'labels': labels}) ?? 'Zakačeno globalno${labels}';
  @override
  String get tagUnpinned => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagUnpinned', {}) ?? 'Oznaka je otkačena';
  @override
  String get all => TranslationOverrides.string(_root.$meta, 'pinnedTags.all', {}) ?? 'Sve';
  @override
  String get reorderPinnedTags => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorderPinnedTags', {}) ?? 'Promeni redosled zakačenih oznaka';
  @override
  String get saving => TranslationOverrides.string(_root.$meta, 'pinnedTags.saving', {}) ?? 'Čuvanje…';
  @override
  String get reorder => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorder', {}) ?? 'Promeni redosled';
  @override
  String get addTagManually => TranslationOverrides.string(_root.$meta, 'pinnedTags.addTagManually', {}) ?? 'Dodaj oznaku ručno';
  @override
  String get noTagsMatchSearch =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.noTagsMatchSearch', {}) ?? 'Nijedna oznaka ne odgovara vašoj pretrazi';
  @override
  String get noPinnedTagsYet => TranslationOverrides.string(_root.$meta, 'pinnedTags.noPinnedTagsYet', {}) ?? 'Još nema zakačenih oznaka';
  @override
  String get editLabels => TranslationOverrides.string(_root.$meta, 'pinnedTags.editLabels', {}) ?? 'Uredi labele';
  @override
  String get labels => TranslationOverrides.string(_root.$meta, 'pinnedTags.labels', {}) ?? 'Labele';
  @override
  String get addPinnedTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.addPinnedTag', {}) ?? 'Dodaj zakačenu oznaku';
  @override
  String get tagQuery => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQuery', {}) ?? 'Upit oznake';
  @override
  String get tagQueryHint => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQueryHint', {}) ?? 'naziv_oznake';
  @override
  String get rawQueryHelp =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.rawQueryHelp', {}) ??
      'Možete uneti bilo koji upit za pretragu, uključujući oznake sa razmacima';
}

// Path: searchBar
class _Translations$searchBar$sr_RS extends Translations$searchBar$en {
  _Translations$searchBar$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get searchForTags => TranslationOverrides.string(_root.$meta, 'searchBar.searchForTags', {}) ?? 'Pretraži oznake';
  @override
  String failedToLoadSuggestions({required String msg}) =>
      TranslationOverrides.string(_root.$meta, 'searchBar.failedToLoadSuggestions', {'msg': msg}) ??
      'Učitavanje predloga nije uspelo. Dodirnite za ponovni pokušaj${msg}';
  @override
  String get noSuggestionsFound => TranslationOverrides.string(_root.$meta, 'searchBar.noSuggestionsFound', {}) ?? 'Nema pronađenih predloga';
  @override
  String get tagSuggestionsNotAvailable =>
      TranslationOverrides.string(_root.$meta, 'searchBar.tagSuggestionsNotAvailable', {}) ?? 'Predlozi oznaka nisu dostupni za ovaj Booru';
  @override
  String copiedTagToClipboard({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'searchBar.copiedTagToClipboard', {'tag': tag}) ?? 'Kopirano «${tag}» u privremenu memoriju';
  @override
  String get prefix => TranslationOverrides.string(_root.$meta, 'searchBar.prefix', {}) ?? 'Prefiks';
  @override
  String get exclude => TranslationOverrides.string(_root.$meta, 'searchBar.exclude', {}) ?? 'Izuzmi (—)';
  @override
  String get booruNumberPrefix => TranslationOverrides.string(_root.$meta, 'searchBar.booruNumberPrefix', {}) ?? 'Booru (N#)';
  @override
  String get metatags => TranslationOverrides.string(_root.$meta, 'searchBar.metatags', {}) ?? 'Metaoznake';
  @override
  String get freeMetatags => TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatags', {}) ?? 'Metaoznake van limita';
  @override
  String get freeMetatagsDescription =>
      TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatagsDescription', {}) ??
      'Ove metaoznake se ne računaju u ograničenje broja oznaka u pretrazi';
  @override
  String get free => TranslationOverrides.string(_root.$meta, 'searchBar.free', {}) ?? 'Van limita';
  @override
  String get single => TranslationOverrides.string(_root.$meta, 'searchBar.single', {}) ?? 'Pojedinačno';
  @override
  String get range => TranslationOverrides.string(_root.$meta, 'searchBar.range', {}) ?? 'Opseg';
  @override
  String get popular => TranslationOverrides.string(_root.$meta, 'searchBar.popular', {}) ?? 'Popularno';
  @override
  String get selectDate => TranslationOverrides.string(_root.$meta, 'searchBar.selectDate', {}) ?? 'Izaberite datum';
  @override
  String get selectDatesRange => TranslationOverrides.string(_root.$meta, 'searchBar.selectDatesRange', {}) ?? 'Izaberite opseg datuma';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'searchBar.history', {}) ?? 'Istorija';
  @override
  String get more => TranslationOverrides.string(_root.$meta, 'searchBar.more', {}) ?? '…';
}

// Path: mobileHome
class _Translations$mobileHome$sr_RS extends Translations$mobileHome$en {
  _Translations$mobileHome$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get selectBooruForWebview =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.selectBooruForWebview', {}) ?? 'Izaberite Booru za Webview';
  @override
  String get lockApp => TranslationOverrides.string(_root.$meta, 'mobileHome.lockApp', {}) ?? 'Zaključaj aplikaciju';
  @override
  String get fileAlreadyExists => TranslationOverrides.string(_root.$meta, 'mobileHome.fileAlreadyExists', {}) ?? 'Datoteka već postoji';
  @override
  String get failedToDownload => TranslationOverrides.string(_root.$meta, 'mobileHome.failedToDownload', {}) ?? 'Preuzimanje nije uspelo';
  @override
  String get cancelledByUser => TranslationOverrides.string(_root.$meta, 'mobileHome.cancelledByUser', {}) ?? 'Otkazao korisnik';
  @override
  String get saveAnyway => TranslationOverrides.string(_root.$meta, 'mobileHome.saveAnyway', {}) ?? 'Ipak sačuvaj';
  @override
  String get skip => TranslationOverrides.string(_root.$meta, 'mobileHome.skip', {}) ?? 'Preskoči';
  @override
  String retryAll({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.retryAll', {'count': count}) ?? 'Pokušaj ponovo za sve (${count})';
  @override
  String get existingFailedOrCancelledItems =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.existingFailedOrCancelledItems', {}) ?? 'Postojeće, neuspele ili otkazane stavke';
  @override
  String get clearAllRetryableItems =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.clearAllRetryableItems', {}) ?? 'Očisti sve stavke koje se mogu ponoviti';
}

// Path: desktopHome
class _Translations$desktopHome$sr_RS extends Translations$desktopHome$en {
  _Translations$desktopHome$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get snatcher => TranslationOverrides.string(_root.$meta, 'desktopHome.snatcher', {}) ?? 'Preuzimanje';
  @override
  String get addBoorusInSettings =>
      TranslationOverrides.string(_root.$meta, 'desktopHome.addBoorusInSettings', {}) ?? 'Dodajte booru sajtove u podešavanjima';
  @override
  String get settings => TranslationOverrides.string(_root.$meta, 'desktopHome.settings', {}) ?? 'Podešavanja';
  @override
  String get save => TranslationOverrides.string(_root.$meta, 'desktopHome.save', {}) ?? 'Sačuvaj';
  @override
  String get noItemsSelected => TranslationOverrides.string(_root.$meta, 'desktopHome.noItemsSelected', {}) ?? 'Nijedna stavka nije izabrana';
}

// Path: galleryView
class _Translations$galleryView$sr_RS extends Translations$galleryView$en {
  _Translations$galleryView$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get noItems => TranslationOverrides.string(_root.$meta, 'galleryView.noItems', {}) ?? 'Nema stavki';
  @override
  String get noItemSelected => TranslationOverrides.string(_root.$meta, 'galleryView.noItemSelected', {}) ?? 'Nijedna stavka nije izabrana';
  @override
  String get close => TranslationOverrides.string(_root.$meta, 'galleryView.close', {}) ?? 'Zatvori';
}

// Path: mediaPreviews
class _Translations$mediaPreviews$sr_RS extends Translations$mediaPreviews$en {
  _Translations$mediaPreviews$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get noBooruConfigsFound =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.noBooruConfigsFound', {}) ?? 'Nisu pronađene booru konfiguracije';
  @override
  String get addNewBooru => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? 'Dodaj novi Booru';
  @override
  String get help => TranslationOverrides.string(_root.$meta, 'mediaPreviews.help', {}) ?? 'Pomoć';
  @override
  String get settings => TranslationOverrides.string(_root.$meta, 'mediaPreviews.settings', {}) ?? 'Podešavanja';
  @override
  String get onboardingTitle => TranslationOverrides.string(_root.$meta, 'mediaPreviews.onboardingTitle', {}) ?? 'Podesite svoj prvi izvor';
  @override
  String get onboardingSubtitle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.onboardingSubtitle', {}) ??
      'Dodajte booru konfiguraciju ili vratite rezervnu kopiju da biste započeli pregledanje';
  @override
  String get addBooruAction => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addBooruAction', {}) ?? 'Dodaj novi booru';
  @override
  String get addBooruActionSubtitle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.addBooruActionSubtitle', {}) ??
      'Povežite sajt dodavanjem njegovog URL-a i podešavanja pretrage';
  @override
  String get restoreBackupAction =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoreBackupAction', {}) ?? 'Vrati podatke iz rezervne kopije ili upravljaj kopijama';
  @override
  String get restoreBackupActionSubtitle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoreBackupActionSubtitle', {}) ??
      'Vratite podešavanja, booru sajtove, kartice i sačuvane podatke';
  @override
  String get openSettingsAction => TranslationOverrides.string(_root.$meta, 'mediaPreviews.openSettingsAction', {}) ?? 'Otvori podešavanja';
  @override
  String get openSettingsActionSubtitle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.openSettingsActionSubtitle', {}) ??
      'Prilagodite ponašanje aplikacije pre podešavanja izvora';
  @override
  String get helpSectionTitle => TranslationOverrides.string(_root.$meta, 'mediaPreviews.helpSectionTitle', {}) ?? 'Potrebna vam je pomoć?';
  @override
  String get booruSourcesArticle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.booruSourcesArticle', {}) ?? 'Kako dodati booru konfiguraciju i kako one funkcionišu';
  @override
  String get booruSourcesArticleSubtitle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.booruSourcesArticleSubtitle', {}) ??
      'Uputstva za korisnike koji podešavaju svoju prvu booru konfiguraciju';
  @override
  String get backupRestoreArticle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.backupRestoreArticle', {}) ?? 'Vraćanje podataka iz rezervne kopije';
  @override
  String get backupRestoreArticleSubtitle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.backupRestoreArticleSubtitle', {}) ??
      'Uputstva za korisnike koji prelaze sa prethodne aplikacije ili verzije';
  @override
  String get restoringPreviousSession =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoringPreviousSession', {}) ?? 'Vraćanje prethodne sesije…';
  @override
  String get copiedFileURL =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.copiedFileURL', {}) ?? 'URL datoteke je kopiran u privremenu memoriju!';
}

// Path: viewer
class _Translations$viewer$sr_RS extends Translations$viewer$en {
  _Translations$viewer$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$viewer$tutorial$sr_RS tutorial = _Translations$viewer$tutorial$sr_RS._(_root);
  @override
  late final _Translations$viewer$appBar$sr_RS appBar = _Translations$viewer$appBar$sr_RS._(_root);
  @override
  late final _Translations$viewer$notes$sr_RS notes = _Translations$viewer$notes$sr_RS._(_root);
}

// Path: common
class _Translations$common$sr_RS extends Translations$common$en {
  _Translations$common$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'common.selectABooru', {}) ?? 'Izaberite booru';
  @override
  String get booruItemCopiedToClipboard =>
      TranslationOverrides.string(_root.$meta, 'common.booruItemCopiedToClipboard', {}) ?? 'Booru stavka je kopirana u privremenu memoriju';
}

// Path: gallery
class _Translations$gallery$sr_RS extends Translations$gallery$en {
  _Translations$gallery$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get snatchQuestion => TranslationOverrides.string(_root.$meta, 'gallery.snatchQuestion', {}) ?? 'Preuzmi?';
  @override
  String get noPostUrl => TranslationOverrides.string(_root.$meta, 'gallery.noPostUrl', {}) ?? 'Nema URL-a objave!';
  @override
  String get loadingFile => TranslationOverrides.string(_root.$meta, 'gallery.loadingFile', {}) ?? 'Učitavanje datoteke…';
  @override
  String get loadingFileMessage => TranslationOverrides.string(_root.$meta, 'gallery.loadingFileMessage', {}) ?? 'Ovo može potrajati, sačekajte…';
  @override
  String sources({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'gallery.sources', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
        count,
        one: 'Izvor',
        few: 'Izvori',
        other: 'Izvori',
      );
}

// Path: galleryButtons
class _Translations$galleryButtons$sr_RS extends Translations$galleryButtons$en {
  _Translations$galleryButtons$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get snatch => TranslationOverrides.string(_root.$meta, 'galleryButtons.snatch', {}) ?? 'Preuzmi';
  @override
  String get favourite => TranslationOverrides.string(_root.$meta, 'galleryButtons.favourite', {}) ?? 'Omiljeno';
  @override
  String get info => TranslationOverrides.string(_root.$meta, 'galleryButtons.info', {}) ?? 'Informacije';
  @override
  String get share => TranslationOverrides.string(_root.$meta, 'galleryButtons.share', {}) ?? 'Podeli';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'galleryButtons.select', {}) ?? 'Izaberi';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'galleryButtons.open', {}) ?? 'Otvori u pregledaču';
  @override
  String get slideshow => TranslationOverrides.string(_root.$meta, 'galleryButtons.slideshow', {}) ?? 'Projekcija slajdova';
  @override
  String get reloadNoScale => TranslationOverrides.string(_root.$meta, 'galleryButtons.reloadNoScale', {}) ?? 'Uključi/isključi skaliranje';
  @override
  String get toggleQuality => TranslationOverrides.string(_root.$meta, 'galleryButtons.toggleQuality', {}) ?? 'Promeni kvalitet';
  @override
  String get externalPlayer => TranslationOverrides.string(_root.$meta, 'galleryButtons.externalPlayer', {}) ?? 'Spoljni plejer';
  @override
  String get imageSearch => TranslationOverrides.string(_root.$meta, 'galleryButtons.imageSearch', {}) ?? 'Pretraga po slici';
}

// Path: media
class _Translations$media$sr_RS extends Translations$media$en {
  _Translations$media$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$media$loading$sr_RS loading = _Translations$media$loading$sr_RS._(_root);
  @override
  late final _Translations$media$video$sr_RS video = _Translations$media$video$sr_RS._(_root);
}

// Path: imageStats
class _Translations$imageStats$sr_RS extends Translations$imageStats$en {
  _Translations$imageStats$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String live({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.live', {'count': count}) ?? 'Aktivne slike: ${count}';
  @override
  String pending({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.pending', {'count': count}) ?? 'Na čekanju: ${count}';
  @override
  String total({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.total', {'count': count}) ?? 'Ukupno: ${count}';
  @override
  String size({required String size}) => TranslationOverrides.string(_root.$meta, 'imageStats.size', {'size': size}) ?? 'Veličina: ${size}';
  @override
  String max({required String max}) => TranslationOverrides.string(_root.$meta, 'imageStats.max', {'max': max}) ?? 'Maks: ${max}';
}

// Path: preview
class _Translations$preview$sr_RS extends Translations$preview$en {
  _Translations$preview$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$preview$error$sr_RS error = _Translations$preview$error$sr_RS._(_root);
}

// Path: tagType
class _Translations$tagType$sr_RS extends Translations$tagType$en {
  _Translations$tagType$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get artist => TranslationOverrides.string(_root.$meta, 'tagType.artist', {}) ?? 'Umetnik';
  @override
  String get character => TranslationOverrides.string(_root.$meta, 'tagType.character', {}) ?? 'Lik';
  @override
  String get copyright => TranslationOverrides.string(_root.$meta, 'tagType.copyright', {}) ?? 'Franšiza';
  @override
  String get meta => TranslationOverrides.string(_root.$meta, 'tagType.meta', {}) ?? 'Meta';
  @override
  String get species => TranslationOverrides.string(_root.$meta, 'tagType.species', {}) ?? 'Vrsta';
  @override
  String get lore => TranslationOverrides.string(_root.$meta, 'tagType.lore', {}) ?? 'Lore';
  @override
  String get none => TranslationOverrides.string(_root.$meta, 'tagType.none', {}) ?? 'Nijedno/Opšte';
}

// Path: tabs.filters
class _Translations$tabs$filters$sr_RS extends Translations$tabs$filters$en {
  _Translations$tabs$filters$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get loaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.loaded', {}) ?? 'Učitano';
  @override
  String get tagType => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagType', {}) ?? 'Tip oznake';
  @override
  String get multibooru => TranslationOverrides.string(_root.$meta, 'tabs.filters.multibooru', {}) ?? 'Multibooru';
  @override
  String get duplicates => TranslationOverrides.string(_root.$meta, 'tabs.filters.duplicates', {}) ?? 'Duplikati';
  @override
  String get checkDuplicatesOnSameBooru =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.checkDuplicatesOnSameBooru', {}) ?? 'Proveri duplikate na istom Booru-u';
  @override
  String get emptySearchQuery => TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? 'Prazan upit za pretragu';
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'tabs.filters.title', {}) ?? 'Filteri kartica';
  @override
  String get all => TranslationOverrides.string(_root.$meta, 'tabs.filters.all', {}) ?? 'Sve';
  @override
  String get notLoaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.notLoaded', {}) ?? 'Nije učitano';
  @override
  String get enabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.enabled', {}) ?? 'Omogućeno';
  @override
  String get disabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.disabled', {}) ?? 'Onemogućeno';
  @override
  String get willAlsoEnableSorting =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.willAlsoEnableSorting', {}) ?? 'Takođe će omogućiti sortiranje';
  @override
  String get tagTypeFilterHelp =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.tagTypeFilterHelp', {}) ??
      'Filtriraj kartice koje sadrže barem jednu oznaku izabranog tipa';
  @override
  String get any => TranslationOverrides.string(_root.$meta, 'tabs.filters.any', {}) ?? 'Bilo koji';
  @override
  String get apply => TranslationOverrides.string(_root.$meta, 'tabs.filters.apply', {}) ?? 'Primeni';
}

// Path: tabs.move
class _Translations$tabs$move$sr_RS extends Translations$tabs$move$en {
  _Translations$tabs$move$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get moveToTop => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToTop', {}) ?? 'Premesti na vrh';
  @override
  String get moveToBottom => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToBottom', {}) ?? 'Premesti na dno';
  @override
  String get tabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.tabNumber', {}) ?? 'Broj kartice';
  @override
  String get invalidTabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidTabNumber', {}) ?? 'Nevažeći broj kartice';
  @override
  String get invalidInput => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidInput', {}) ?? 'Nevažeći unos';
  @override
  String get outOfRange => TranslationOverrides.string(_root.$meta, 'tabs.move.outOfRange', {}) ?? 'Van opsega';
  @override
  String get pleaseEnterValidTabNumber =>
      TranslationOverrides.string(_root.$meta, 'tabs.move.pleaseEnterValidTabNumber', {}) ?? 'Unesite važeći broj kartice';
  @override
  String moveTo({required String formattedNumber}) =>
      TranslationOverrides.string(_root.$meta, 'tabs.move.moveTo', {'formattedNumber': formattedNumber}) ?? 'Premesti na #${formattedNumber}';
  @override
  String get preview => TranslationOverrides.string(_root.$meta, 'tabs.move.preview', {}) ?? 'Pregled:';
}

// Path: webview.navigation
class _Translations$webview$navigation$sr_RS extends Translations$webview$navigation$en {
  _Translations$webview$navigation$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get enterUrlLabel => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterUrlLabel', {}) ?? 'Unesite URL';
  @override
  String get enterCustomUrl => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterCustomUrl', {}) ?? 'Unesite prilagođeni URL';
  @override
  String navigateTo({required String url}) =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.navigateTo', {'url': url}) ?? 'Idi na ${url}';
  @override
  String get listCookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.listCookies', {}) ?? 'Prikaži kolačiće';
  @override
  String get clearCookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.clearCookies', {}) ?? 'Obriši kolačiće';
  @override
  String get cookiesGone => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookiesGone', {}) ?? 'Bilo je kolačića. Sada su nestali';
  @override
  String get getFavicon => TranslationOverrides.string(_root.$meta, 'webview.navigation.getFavicon', {}) ?? 'Preuzmi favicon';
  @override
  String get noFaviconFound => TranslationOverrides.string(_root.$meta, 'webview.navigation.noFaviconFound', {}) ?? 'Favicon nije pronađen';
  @override
  String get host => TranslationOverrides.string(_root.$meta, 'webview.navigation.host', {}) ?? 'Host:';
  @override
  String get textAboveSelectable =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.textAboveSelectable', {}) ?? '(tekst iznad se može označiti)';
  @override
  String get copyUrl => TranslationOverrides.string(_root.$meta, 'webview.navigation.copyUrl', {}) ?? 'Kopiraj URL';
  @override
  String get copiedUrlToClipboard =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.copiedUrlToClipboard', {}) ?? 'URL je kopiran u privremenu memoriju';
  @override
  String get cookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookies', {}) ?? 'Kolačići';
  @override
  String get favicon => TranslationOverrides.string(_root.$meta, 'webview.navigation.favicon', {}) ?? 'Favicon';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'webview.navigation.history', {}) ?? 'Istorija';
  @override
  String get noBackHistoryItem =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.noBackHistoryItem', {}) ?? 'Nema prethodne stavke u istoriji';
  @override
  String get noForwardHistoryItem =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.noForwardHistoryItem', {}) ?? 'Nema sledeće stavke u istoriji';
}

// Path: settings.language
class _Translations$settings$language$sr_RS extends Translations$settings$language$en {
  _Translations$settings$language$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? 'Jezik';
  @override
  String get system => TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? 'Sistemski';
  @override
  String get helpUsTranslate => TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? 'Pomozite nam u prevodu';
  @override
  String get visitForDetails =>
      TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ??
      'Posetite <a href=\'https://github.com/NO-ob/LoliSnatcher_Droid/blob/master/CONTRIBUTING.md#localization--translations\'>GitHub</a> za detalje ili dodirnite sliku ispod da biste otišli na POEditor';
}

// Path: settings.booru
class _Translations$settings$booru$sr_RS extends Translations$settings$booru$en {
  _Translations$settings$booru$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Booru sajtovi i pretraga';
  @override
  String get defaultTags => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? 'Podrazumevane oznake';
  @override
  String get itemsPerPage => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'Broj preuzetih stavki po stranici';
  @override
  String get itemsPerPageTip =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'Neki booru sajtovi mogu ignorisati ovo';
  @override
  String get itemsPerPagePlaceholder => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPagePlaceholder', {}) ?? '10-100';
  @override
  String get addBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Dodaj Booru konfiguraciju';
  @override
  String get shareBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? 'Podeli Booru konfiguraciju';
  @override
  String shareBooruDialogMsgMobile({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
      'Podelite konfiguraciju za ${booruName} kao link.\n\nUključiti korisničko ime / API ključ?';
  @override
  String shareBooruDialogMsgDesktop({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
      'Kopirajte link konfiguracije za ${booruName} u privremenu memoriju.\n\nUključiti korisničko ime / API ključ?';
  @override
  String get booruSharing => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? 'Deljenje Booru konfiguracija';
  @override
  String get booruSharingMsgAndroid =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ??
      'Kako automatski otvarati linkove Booru konfiguracija u aplikaciji na Androidu 12 i novijim:\n1) Dodirnite dugme ispod da biste otvorili sistemska podešavanja za podrazumevane linkove aplikacije\n2) Dodirnite «Dodaj link» i izaberite sve dostupne opcije';
  @override
  String get addedBoorus => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? 'Dodati Booru sajtovi';
  @override
  String get editBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? 'Uredi Booru konfiguraciju';
  @override
  String get importBooru =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? 'Uvezi Booru konfiguraciju iz privremene memorije';
  @override
  String get onlyLSURLsSupported =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ?? 'Podržani su samo loli.snatcher URL-ovi';
  @override
  String get deleteBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? 'Obriši Booru konfiguraciju';
  @override
  String get deleteBooruError =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ?? 'Došlo je do greške prilikom brisanja Booru konfiguracije!';
  @override
  String get booruDeleted => TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? 'Booru konfiguracija je obrisana';
  @override
  String get booruDropdownInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ??
      'Izabrani booru postaje podrazumevani nakon čuvanja.\n\nPodrazumevani booru se prikazuje prvi u padajućim menijima';
  @override
  String get changeDefaultBooru =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? 'Promeniti podrazumevani Booru?';
  @override
  String get changeTo => TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? 'Promeni na: ';
  @override
  String get keepCurrentBooru =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? 'Dodirnite [Ne] da zadržite trenutni: ';
  @override
  String get changeToNewBooru =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? 'Dodirnite [Da] da promenite na: ';
  @override
  String get booruConfigLinkCopied =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ??
      'Link Booru konfiguracije je kopiran u privremenu memoriju';
  @override
  String get noBooruSelected => TranslationOverrides.string(_root.$meta, 'settings.booru.noBooruSelected', {}) ?? 'Nijedan Booru nije izabran!';
  @override
  String get cantDeleteThisBooru =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? 'Nije moguće obrisati ovaj Booru!';
  @override
  String get removeRelatedTabsFirst =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.removeRelatedTabsFirst', {}) ?? 'Prvo uklonite povezane kartice';
  @override
  String get sourceLimitNotice =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.sourceLimitNotice', {}) ??
      'Ponašanje podešavanja nekih izvora može zavisiti od podešavanja kompatibilnosti u nastavku. Sadržaj hostuju i pružaju spoljni sajtovi i aplikacija nema kontrolu nad njim.';
  @override
  String get advanced => TranslationOverrides.string(_root.$meta, 'settings.booru.advanced', {}) ?? 'Napredno';
  @override
  String get expandedSourceCompatibility =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.expandedSourceCompatibility', {}) ?? 'Kompatibilnost podešavanja izvora';
  @override
  String get expandedSourceCompatibilitySubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.expandedSourceCompatibilitySubtitle', {}) ??
      'Podesite način na koji se obrađuju podešavanja kompatibilnosti izvora';
  @override
  String get expandedSourceCompatibilityConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.expandedSourceCompatibilityConfirm', {}) ??
      'Promena ovoga može uticati na rad izvora. Sadržaj hostuju i pružaju spoljni sajtovi i aplikacija nema kontrolu nad njim. Želite li da nastavite?';
  @override
  String get sourceUnavailableCurrentSettings =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.sourceUnavailableCurrentSettings', {}) ?? 'Ovaj sajt nije dostupan.';
}

// Path: settings.booruEditor
class _Translations$settings$booruEditor$sr_RS extends Translations$settings$booruEditor$en {
  _Translations$settings$booruEditor$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? 'Booru uređivač';
  @override
  String get testBooruFailedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'Testiranje Booru-a nije uspelo';
  @override
  String get testBooruFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ??
      'Parametri konfiguracije možda nisu tačni, booru ne dozvoljava pristup putem API-ja, zahtev nije vratio nikakve podatke ili je došlo do mrežne greške.';
  @override
  String get saveBooru => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Sačuvaj Booru';
  @override
  String get runningTest => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? 'Testiranje u toku…';
  @override
  String get booruConfigExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? 'Ova Booru konfiguracija već postoji';
  @override
  String get booruSameNameExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ??
      'Booru konfiguracija sa istim imenom već postoji';
  @override
  String get booruSameUrlExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ??
      'Booru konfiguracija sa istim URL-om već postoji';
  @override
  String get thisBooruConfigWontBeAdded =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ?? 'Ova booru konfiguracija neće biti dodata';
  @override
  String get booruConfigSaved =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? 'Booru konfiguracija je sačuvana';
  @override
  String get existingTabsNeedReload =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ??
      'Postojeće kartice sa ovim Booru-om moraju se ponovo učitati da bi se primenile promene!';
  @override
  String get failedVerifyApiHydrus =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ?? 'Neuspešna provera API pristupa za Hydrus';
  @override
  String get accessKeyRequestedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? 'Zatražen je pristupni ključ';
  @override
  String get accessKeyRequestedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ??
      'Dodirnite „U redu“ u Hydrus-u, a zatim primenite. Nakon toga možete dodirnuti „Testiraj Booru“';
  @override
  String get accessKeyFailedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? 'Neuspešno pribavljanje pristupnog ključa';
  @override
  String get accessKeyFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ?? 'Da li vam je otvoren prozor za zahtev u Hydrus-u?';
  @override
  String get hydrusInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ??
      'Da biste dobili Hydrus ključ, potrebno je da otvorite dijalog za zahtev u Hydrus klijentu. Services > Review services > Client API > Add > From API request';
  @override
  String get getHydrusApiKey => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? 'Pribavi Hydrus API ključ';
  @override
  String get booruName => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? 'Ime Booru-a';
  @override
  String get booruNameRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? 'Ime Booru-a je obavezno!';
  @override
  String get booruUrl => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? 'Booru URL';
  @override
  String get booruUrlRequired => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? 'Booru URL je obavezan!';
  @override
  String get booruType => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruType', {}) ?? 'Tip Booru-a';
  @override
  String get booruFavicon => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? 'Favicon URL';
  @override
  String get booruFaviconPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '(Automatski se popunjava ako je prazno)';
  @override
  String get booruDefTags => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? 'Podrazumevane oznake';
  @override
  String get booruDefTagsPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTagsPlaceholder', {}) ?? 'Podrazumevana pretraga za booru';
  @override
  String get booruDefaultInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefaultInstructions', {}) ??
      'Polja ispod mogu biti obavezna za neke booru sajtove';
  @override
  String get booruConfigShouldSave =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigShouldSave', {}) ?? 'Potvrdite čuvanje ove booru konfiguracije';
  @override
  String booruConfigSelectedType({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSelectedType', {'booruType': booruType}) ??
      'Izabrani/otkriveni tip booru-a: ${booruType}';
}

// Path: settings.interface
class _Translations$settings$interface$sr_RS extends Translations$settings$interface$en {
  _Translations$settings$interface$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? 'Interfejs';
  @override
  String get appUIMode => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIMode', {}) ?? 'Režim interfejsa aplikacije';
  @override
  String get appUIModeWarningTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarningTitle', {}) ?? 'Režim interfejsa aplikacije';
  @override
  String get appUIModeWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarning', {}) ??
      'Koristiti Desktop režim? Može izazvati probleme na mobilnom uređaju. ZASTARELO.';
  @override
  String get appUIModeHelpMobile =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpMobile', {}) ?? '- Mobile - Uobičajeni interfejs za mobilne uređaje';
  @override
  String get appUIModeHelpDesktop =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpDesktop', {}) ??
      '- Desktop - Interfejs u stilu Ahoviewer-a [ZASTARELO, POTREBNA PRERADA]';
  @override
  String get appUIModeHelpWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpWarning', {}) ??
      '[Upozorenje]: Nemojte postavljati režim interfejsa na Desktop na telefonu jer možete pokvariti aplikaciju i možda ćete morati da obrišete sva podešavanja, uključujući Booru konfiguracije.';
  @override
  String get handSide => TranslationOverrides.string(_root.$meta, 'settings.interface.handSide', {}) ?? 'Dominantna ruka';
  @override
  String get handSideHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.handSideHelp', {}) ?? 'Prilagođava pozicije elemenata interfejsa izabranoj strani';
  @override
  String get showSearchBarInPreviewGrid =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.showSearchBarInPreviewGrid', {}) ?? 'Prikaži traku za pretragu u mreži pregleda';
  @override
  String get moveInputToTopInSearchView =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.moveInputToTopInSearchView', {}) ??
      'Premesti polje za unos na vrh u prikazu pretrage';
  @override
  String get searchViewQuickActionsPanel =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewQuickActionsPanel', {}) ?? 'Panel brzih radnji u prikazu pretrage';
  @override
  String get searchViewInputAutofocus =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewInputAutofocus', {}) ?? 'Automatski fokus na unos u prikazu pretrage';
  @override
  String get disableVibration => TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibration', {}) ?? 'Onemogući vibraciju';
  @override
  String get disableVibrationSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibrationSubtitle', {}) ??
      'Vibracija se i dalje može javiti pri nekim radnjama, čak i kada je onemogućena';
  @override
  String get usePredictiveBack =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.usePredictiveBack', {}) ?? 'Prediktivni pokret za nazad';
  @override
  String get previewColumnsPortrait =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsPortrait', {}) ?? 'Kolone pregleda (uspravno)';
  @override
  String get previewColumnsLandscape =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsLandscape', {}) ?? 'Kolone pregleda (položeno)';
  @override
  String get previewQuality => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQuality', {}) ?? 'Kvalitet pregleda';
  @override
  String get previewQualityHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelp', {}) ?? 'Menja rezoluciju slika u mreži pregleda';
  @override
  String get previewQualityHelpSample =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpSample', {}) ??
      ' - Umanjena slika - Srednja rezolucija; aplikacija će prikazati minijaturu dok se učitava slika višeg kvaliteta';
  @override
  String get previewQualityHelpThumbnail =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpThumbnail', {}) ?? ' - Minijatura - Niska rezolucija';
  @override
  String get previewQualityHelpNote =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpNote', {}) ??
      '[Napomena]: Opcija „Umanjena slika“ može primetno smanjiti performanse, posebno ako imate previše kolona u mreži pregleda';
  @override
  String get previewDisplay => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplay', {}) ?? 'Prikaz pregleda';
  @override
  String get previewDisplayFallback =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallback', {}) ?? 'Rezervni prikaz pregleda';
  @override
  String get previewDisplayFallbackHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallbackHelp', {}) ??
      'Ovo će se koristiti kada stepenasti raspored nije moguć';
  @override
  String get dontScaleImages => TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImages', {}) ?? 'Ne skaliraj slike';
  @override
  String get dontScaleImagesSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesSubtitle', {}) ?? 'Može smanjiti performanse';
  @override
  String get dontScaleImagesWarningTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningTitle', {}) ?? 'Upozorenje';
  @override
  String get dontScaleImagesWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarning', {}) ??
      'Da li ste sigurni da želite da onemogućite skaliranje slika?';
  @override
  String get dontScaleImagesWarningMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningMsg', {}) ??
      'Ovo može negativno uticati na performanse, posebno na starijim uređajima';
  @override
  String get gifThumbnails => TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnails', {}) ?? 'GIF sličice';
  @override
  String get gifThumbnailsRequires =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnailsRequires', {}) ?? 'Zahteva «Ne skaliraj slike»';
  @override
  String get scrollPreviewsButtonsPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.scrollPreviewsButtonsPosition', {}) ?? 'Položaj dugmadi za pomeranje pregleda';
  @override
  String get mouseWheelScrollModifier =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.mouseWheelScrollModifier', {}) ?? 'Modifikator pomeranja točkićem miša';
  @override
  String get scrollModifier => TranslationOverrides.string(_root.$meta, 'settings.interface.scrollModifier', {}) ?? 'Modifikator pomeranja';
  @override
  late final _Translations$settings$interface$previewQualityValues$sr_RS previewQualityValues =
      _Translations$settings$interface$previewQualityValues$sr_RS._(_root);
  @override
  late final _Translations$settings$interface$previewDisplayModeValues$sr_RS previewDisplayModeValues =
      _Translations$settings$interface$previewDisplayModeValues$sr_RS._(_root);
  @override
  late final _Translations$settings$interface$appModeValues$sr_RS appModeValues = _Translations$settings$interface$appModeValues$sr_RS._(_root);
  @override
  late final _Translations$settings$interface$handSideValues$sr_RS handSideValues = _Translations$settings$interface$handSideValues$sr_RS._(_root);
}

// Path: settings.theme
class _Translations$settings$theme$sr_RS extends Translations$settings$theme$en {
  _Translations$settings$theme$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? 'Teme';
  @override
  String get themeMode => TranslationOverrides.string(_root.$meta, 'settings.theme.themeMode', {}) ?? 'Režim teme';
  @override
  String get blackBg => TranslationOverrides.string(_root.$meta, 'settings.theme.blackBg', {}) ?? 'Crna pozadina';
  @override
  String get useDynamicColor => TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? 'Koristi dinamičku boju';
  @override
  String get android12PlusOnly => TranslationOverrides.string(_root.$meta, 'settings.theme.android12PlusOnly', {}) ?? 'Samo za Android 12+';
  @override
  String get theme => TranslationOverrides.string(_root.$meta, 'settings.theme.theme', {}) ?? 'Tema';
  @override
  String get primaryColor => TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? 'Primarna boja';
  @override
  String get secondaryColor => TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? 'Sekundarna boja';
  @override
  String get enableDrawerMascot =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.enableDrawerMascot', {}) ?? 'Omogući maskotu u bočnom meniju';
  @override
  String get setCustomMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.setCustomMascot', {}) ?? 'Postavi prilagođenu maskotu';
  @override
  String get removeCustomMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? 'Ukloni prilagođenu maskotu';
  @override
  String get currentMascotPath => TranslationOverrides.string(_root.$meta, 'settings.theme.currentMascotPath', {}) ?? 'Trenutna putanja do maskote';
  @override
  String get system => TranslationOverrides.string(_root.$meta, 'settings.theme.system', {}) ?? 'Sistemska';
  @override
  String get light => TranslationOverrides.string(_root.$meta, 'settings.theme.light', {}) ?? 'Svetla';
  @override
  String get dark => TranslationOverrides.string(_root.$meta, 'settings.theme.dark', {}) ?? 'Tamna';
  @override
  String get pink => TranslationOverrides.string(_root.$meta, 'settings.theme.pink', {}) ?? 'Roze';
  @override
  String get purple => TranslationOverrides.string(_root.$meta, 'settings.theme.purple', {}) ?? 'Ljubičasta';
  @override
  String get blue => TranslationOverrides.string(_root.$meta, 'settings.theme.blue', {}) ?? 'Plava';
  @override
  String get teal => TranslationOverrides.string(_root.$meta, 'settings.theme.teal', {}) ?? 'Tirkizna';
  @override
  String get red => TranslationOverrides.string(_root.$meta, 'settings.theme.red', {}) ?? 'Crvena';
  @override
  String get green => TranslationOverrides.string(_root.$meta, 'settings.theme.green', {}) ?? 'Zelena';
  @override
  String get halloween => TranslationOverrides.string(_root.$meta, 'settings.theme.halloween', {}) ?? 'Noć veštica';
  @override
  String get custom => TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? 'Prilagođena';
  @override
  String get selectColor => TranslationOverrides.string(_root.$meta, 'settings.theme.selectColor', {}) ?? 'Izaberite boju';
  @override
  String get selectedColor => TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColor', {}) ?? 'Izabrana boja';
  @override
  String get selectedColorAndShades =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColorAndShades', {}) ?? 'Izabrana boja i njene nijanse';
  @override
  String get fontFamily => TranslationOverrides.string(_root.$meta, 'settings.theme.fontFamily', {}) ?? 'Font';
  @override
  String get systemDefault => TranslationOverrides.string(_root.$meta, 'settings.theme.systemDefault', {}) ?? 'Podrazumevani sistemski font';
  @override
  String get viewMoreFonts => TranslationOverrides.string(_root.$meta, 'settings.theme.viewMoreFonts', {}) ?? 'Prikaži više fontova';
  @override
  String get fontPreviewText =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.fontPreviewText', {}) ?? 'Ljubazni fenjerdžija čađavog lica hoće da mi pokaže štos.';
  @override
  String get customFont => TranslationOverrides.string(_root.$meta, 'settings.theme.customFont', {}) ?? 'Prilagođeni font';
  @override
  String get customFontSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.customFontSubtitle', {}) ?? 'Unesite naziv bilo kog Google fonta';
  @override
  String get fontName => TranslationOverrides.string(_root.$meta, 'settings.theme.fontName', {}) ?? 'Naziv fonta';
  @override
  String get customFontHint =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.customFontHint', {}) ?? 'Pregledajte fontove na fonts.google.com';
  @override
  String get fontNotFound => TranslationOverrides.string(_root.$meta, 'settings.theme.fontNotFound', {}) ?? 'Font nije pronađen';
}

// Path: settings.viewer
class _Translations$settings$viewer$sr_RS extends Translations$settings$viewer$en {
  _Translations$settings$viewer$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? 'Pregledač';
  @override
  String get preloadAmount => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadAmount', {}) ?? 'Količina za predučitavanje';
  @override
  String get preloadSizeLimit =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimit', {}) ?? 'Ograničenje veličine predučitavanja';
  @override
  String get preloadSizeLimitSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimitSubtitle', {}) ?? 'u GB, 0 za bez ograničenja';
  @override
  String get preloadHeightLimit =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimit', {}) ?? 'Ograničenje visine predučitavanja';
  @override
  String get preloadHeightLimitSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimitSubtitle', {}) ?? 'u pikselima, 0 za bez ograničenja';
  @override
  String get imageQuality => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQuality', {}) ?? 'Kvalitet slike';
  @override
  String get viewerScrollDirection =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerScrollDirection', {}) ?? 'Smer listanja u pregledaču';
  @override
  String get viewerToolbarPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerToolbarPosition', {}) ?? 'Položaj trake sa alatkama u pregledaču';
  @override
  String get zoomButtonPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.zoomButtonPosition', {}) ?? 'Položaj dugmeta za zumiranje';
  @override
  String get changePageButtonsPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.changePageButtonsPosition', {}) ?? 'Položaj dugmadi za promenu stranice';
  @override
  String get hideToolbarWhenOpeningViewer =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.hideToolbarWhenOpeningViewer', {}) ??
      'Sakrij traku sa alatkama prilikom otvaranja pregledača';
  @override
  String get expandDetailsByDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.expandDetailsByDefault', {}) ?? 'Podrazumevano proširi detalje';
  @override
  String get hideTranslationNotesByDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.hideTranslationNotesByDefault', {}) ?? 'Podrazumevano sakrij beleške o prevodu';
  @override
  String get enableRotation => TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotation', {}) ?? 'Omogući rotaciju';
  @override
  String get enableRotationSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotationSubtitle', {}) ?? 'Dvaput dodirnite za resetovanje';
  @override
  String get toolbarButtonsOrder =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarButtonsOrder', {}) ?? 'Redosled dugmadi na traci sa alatkama';
  @override
  String get buttonsOrder => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonsOrder', {}) ?? 'Redosled dugmadi';
  @override
  String get longPressToChangeItemOrder =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToChangeItemOrder', {}) ?? 'Dugo pritisnite da promenite redosled stavki.';
  @override
  String get atLeast4ButtonsVisibleOnToolbar =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.atLeast4ButtonsVisibleOnToolbar', {}) ??
      'Najmanje 4 dugmeta sa ove liste će uvek biti vidljiva na traci sa alatkama.';
  @override
  String get otherButtonsWillGoIntoOverflow =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.otherButtonsWillGoIntoOverflow', {}) ??
      'Ostala dugmad će ići u meni sa više opcija (tri tačke).';
  @override
  String get longPressToMoveItems =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToMoveItems', {}) ?? 'Dugo pritisnite da biste premestili stavke';
  @override
  String get onlyForVideos => TranslationOverrides.string(_root.$meta, 'settings.viewer.onlyForVideos', {}) ?? 'Samo za video zapise';
  @override
  String get thisButtonCannotBeDisabled =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.thisButtonCannotBeDisabled', {}) ?? 'Ovo dugme se ne može onemogućiti';
  @override
  String get defaultShareAction =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.defaultShareAction', {}) ?? 'Podrazumevana radnja deljenja';
  @override
  String get shareActions => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActions', {}) ?? 'Radnje deljenja';
  @override
  String get shareActionsAsk =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsAsk', {}) ?? '- Pitaj - uvek pitaj šta treba deliti';
  @override
  String get shareActionsPostURL => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURL', {}) ?? '- URL objave';
  @override
  String get shareActionsFileURL =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFileURL', {}) ??
      '- URL datoteke - deli direktnu vezu ka originalnoj datoteci (možda neće raditi na nekim sajtovima)';
  @override
  String get shareActionsPostURLFileURLFileWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURLFileURLFileWithTags', {}) ??
      '- URL objave/URL datoteke/Datoteka sa oznakama - deli URL/datoteku i oznake koje izaberete';
  @override
  String get shareActionsFile =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFile', {}) ??
      '- Datoteka - deli samu datoteku, učitavanje može potrajati, napredak će biti prikazan na dugmetu za deljenje';
  @override
  String get shareActionsHydrus =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsHydrus', {}) ?? '- Hydrus - šalje URL objave u Hydrus za uvoz';
  @override
  String get shareActionsNoteIfFileSavedInCache =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsNoteIfFileSavedInCache', {}) ??
      '[Napomena]: Ako je datoteka sačuvana u kešu, biće učitana odatle. U suprotnom, ponovo će biti učitana sa mreže.';
  @override
  String get shareActionsTip =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsTip', {}) ??
      '[Savet]: Meni radnji deljenja možete otvoriti dugim pritiskom na dugme za deljenje.';
  @override
  String get useVolumeButtonsForScrolling =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.useVolumeButtonsForScrolling', {}) ?? 'Koristi tastere za jačinu zvuka za listanje';
  @override
  String get volumeButtonsScrolling =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrolling', {}) ?? 'Listanje tasterima za jačinu zvuka';
  @override
  String get volumeButtonsScrollingHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollingHelp', {}) ??
      'Koristite tastere za jačinu zvuka za listanje kroz preglede i pregledač';
  @override
  String get volumeButtonsVolumeDown =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeDown', {}) ?? ' - Smanjivanje jačine zvuka - sledeća stavka';
  @override
  String get volumeButtonsVolumeUp =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeUp', {}) ?? ' - Pojačavanje jačine zvuka - prethodna stavka';
  @override
  String get volumeButtonsInViewer => TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsInViewer', {}) ?? 'U pregledaču:';
  @override
  String get volumeButtonsToolbarVisible =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarVisible', {}) ??
      ' - Traka sa alatkama vidljiva - kontroliše jačinu zvuka';
  @override
  String get volumeButtonsToolbarHidden =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarHidden', {}) ??
      ' - Traka sa alatkama sakrivena - kontroliše listanje';
  @override
  String get volumeButtonsScrollSpeed =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollSpeed', {}) ?? 'Brzina listanja tasterima za jačinu zvuka';
  @override
  String get slideshowDurationInMs =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowDurationInMs', {}) ?? 'Trajanje projekcije slajdova (u ms)';
  @override
  String get slideshow => TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshow', {}) ?? 'Projekcija slajdova';
  @override
  String get slideshowWIPNote =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowWIPNote', {}) ?? '[U izradi] Video zapisi/GIF-ovi: samo ručno listanje';
  @override
  String get preventDeviceFromSleeping =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preventDeviceFromSleeping', {}) ?? 'Spreči uređaj da pređe u stanje spavanja';
  @override
  String get viewerOpenCloseAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerOpenCloseAnimation', {}) ?? 'Animacija otvaranja/zatvaranja pregledača';
  @override
  String get viewerPageChangeAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerPageChangeAnimation', {}) ?? 'Animacija promene stranice u pregledaču';
  @override
  String get usingDefaultAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.usingDefaultAnimation', {}) ?? 'Koristi se podrazumevana animacija';
  @override
  String get usingCustomAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.usingCustomAnimation', {}) ?? 'Koristi se prilagođena animacija';
  @override
  String get kannaLoadingGif => TranslationOverrides.string(_root.$meta, 'settings.viewer.kannaLoadingGif', {}) ?? 'Kanna GIF za učitavanje';
  @override
  late final _Translations$settings$viewer$imageQualityValues$sr_RS imageQualityValues = _Translations$settings$viewer$imageQualityValues$sr_RS._(
    _root,
  );
  @override
  late final _Translations$settings$viewer$scrollDirectionValues$sr_RS scrollDirectionValues =
      _Translations$settings$viewer$scrollDirectionValues$sr_RS._(_root);
  @override
  late final _Translations$settings$viewer$toolbarPositionValues$sr_RS toolbarPositionValues =
      _Translations$settings$viewer$toolbarPositionValues$sr_RS._(_root);
  @override
  late final _Translations$settings$viewer$buttonPositionValues$sr_RS buttonPositionValues =
      _Translations$settings$viewer$buttonPositionValues$sr_RS._(_root);
  @override
  late final _Translations$settings$viewer$shareActionValues$sr_RS shareActionValues = _Translations$settings$viewer$shareActionValues$sr_RS._(_root);
}

// Path: settings.video
class _Translations$settings$video$sr_RS extends Translations$settings$video$en {
  _Translations$settings$video$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? 'Video';
  @override
  String get disableVideos => TranslationOverrides.string(_root.$meta, 'settings.video.disableVideos', {}) ?? 'Onemogući video zapise';
  @override
  String get disableVideosHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.disableVideosHelp', {}) ??
      'Korisno na slabijim uređajima koji se ruše prilikom pokušaja učitavanja video zapisa. Pruža opcije za gledanje video zapisa u spoljnom plejeru ili pregledaču.';
  @override
  String get autoplayVideos => TranslationOverrides.string(_root.$meta, 'settings.video.autoplayVideos', {}) ?? 'Automatski reprodukuj video zapise';
  @override
  String get startVideosMuted => TranslationOverrides.string(_root.$meta, 'settings.video.startVideosMuted', {}) ?? 'Pokreni video zapise bez zvuka';
  @override
  String get experimental => TranslationOverrides.string(_root.$meta, 'settings.video.experimental', {}) ?? '[Eksperimentalno]';
  @override
  String get videoPlayerBackend =>
      TranslationOverrides.string(_root.$meta, 'settings.video.videoPlayerBackend', {}) ?? 'Pozadinski sistem video plejera';
  @override
  String get backendDefault => TranslationOverrides.string(_root.$meta, 'settings.video.backendDefault', {}) ?? 'Podrazumevano';
  @override
  String get backendMPV => TranslationOverrides.string(_root.$meta, 'settings.video.backendMPV', {}) ?? 'MPV';
  @override
  String get backendMDK => TranslationOverrides.string(_root.$meta, 'settings.video.backendMDK', {}) ?? 'MDK';
  @override
  String get backendDefaultHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendDefaultHelp', {}) ??
      'Zasnovano na exoplayer-u. Ima najbolju kompatibilnost sa uređajima, ali može imati problema sa 4K video zapisima, nekim kodecima ili starijim uređajima';
  @override
  String get backendMPVHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendMPVHelp', {}) ??
      'Zasnovano na libmpv-u, ima napredna podešavanja koja mogu pomoći u rešavanju problema sa nekim kodecima/uređajima\n[MOŽE IZAZVATI RUŠENJE]';
  @override
  String get backendMDKHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendMDKHelp', {}) ??
      'Zasnovano na libmdk-u, može imati bolje performanse za neke kodeke/uređaje\n[MOŽE IZAZVATI RUŠENJE]';
  @override
  String get mpvSettingsHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.mpvSettingsHelp', {}) ??
      'Isprobajte različite vrednosti \'MPV\' podešavanja ispod ako video zapisi ne rade ispravno ili prijavljuju greške kodeka:';
  @override
  String get mpvUseHardwareAcceleration =>
      TranslationOverrides.string(_root.$meta, 'settings.video.mpvUseHardwareAcceleration', {}) ?? 'MPV: koristi hardversko ubrzanje';
  @override
  String get mpvVO => TranslationOverrides.string(_root.$meta, 'settings.video.mpvVO', {}) ?? 'MPV: VO';
  @override
  String get mpvHWDEC => TranslationOverrides.string(_root.$meta, 'settings.video.mpvHWDEC', {}) ?? 'MPV: HWDEC';
  @override
  String get videoCacheMode => TranslationOverrides.string(_root.$meta, 'settings.video.videoCacheMode', {}) ?? 'Režim keširanja video zapisa';
  @override
  late final _Translations$settings$video$cacheModes$sr_RS cacheModes = _Translations$settings$video$cacheModes$sr_RS._(_root);
  @override
  late final _Translations$settings$video$cacheModeValues$sr_RS cacheModeValues = _Translations$settings$video$cacheModeValues$sr_RS._(_root);
  @override
  late final _Translations$settings$video$videoBackendModeValues$sr_RS videoBackendModeValues =
      _Translations$settings$video$videoBackendModeValues$sr_RS._(_root);
}

// Path: settings.downloads
class _Translations$settings$downloads$sr_RS extends Translations$settings$downloads$en {
  _Translations$settings$downloads$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get fromNextItemInQueue =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.fromNextItemInQueue', {}) ?? 'Od sledeće stavke u redu';
  @override
  String get pleaseProvideStoragePermission =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.pleaseProvideStoragePermission', {}) ??
      'Dodelite dozvolu za pristup skladištu kako biste preuzimali datoteke';
  @override
  String get noItemsSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsSelected', {}) ?? 'Nijedna stavka nije izabrana';
  @override
  String get noItemsQueued => TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsQueued', {}) ?? 'Nema stavki u redu';
  @override
  String get batch => TranslationOverrides.string(_root.$meta, 'settings.downloads.batch', {}) ?? 'Grupno';
  @override
  String get snatchSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? 'Preuzmi izabrano';
  @override
  String get removeSnatchedStatusFromSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ??
      'Ukloni status preuzetog sa izabranih stavki';
  @override
  String get favouriteSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? 'Dodaj izabrano u omiljeno';
  @override
  String get unfavouriteSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? 'Ukloni izabrano iz omiljenih';
  @override
  String get clearSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? 'Obriši izabrano';
  @override
  String get updatingData => TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? 'Ažuriranje podataka…';
}

// Path: settings.database
class _Translations$settings$database$sr_RS extends Translations$settings$database$en {
  _Translations$settings$database$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? 'Baza podataka';
  @override
  String get indexingDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? 'Indeksiranje baze podataka';
  @override
  String get droppingIndexes => TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? 'Uklanjanje indeksa';
  @override
  String get enableDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.enableDatabase', {}) ?? 'Omogući bazu podataka';
  @override
  String get enableIndexing => TranslationOverrides.string(_root.$meta, 'settings.database.enableIndexing', {}) ?? 'Omogući indeksiranje';
  @override
  String get enableSearchHistory =>
      TranslationOverrides.string(_root.$meta, 'settings.database.enableSearchHistory', {}) ?? 'Omogući istoriju pretrage';
  @override
  String get enableTagTypeFetching =>
      TranslationOverrides.string(_root.$meta, 'settings.database.enableTagTypeFetching', {}) ?? 'Omogući preuzimanje tipova oznaka';
  @override
  String get sankakuTypeToUpdate =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuTypeToUpdate', {}) ?? 'Sankaku tip za ažuriranje';
  @override
  String get searchQuery => TranslationOverrides.string(_root.$meta, 'settings.database.searchQuery', {}) ?? 'Upit za pretragu';
  @override
  String get searchQueryOptional =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchQueryOptional', {}) ?? '(opciono, može usporiti proces)';
  @override
  String get cantLeavePageNow =>
      TranslationOverrides.string(_root.$meta, 'settings.database.cantLeavePageNow', {}) ?? 'Trenutno ne možete napustiti stranicu!';
  @override
  String get sankakuDataUpdating =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDataUpdating', {}) ??
      'Sankaku podaci se ažuriraju, sačekajte dok se ne završi ili otkažite ručno na dnu stranice';
  @override
  String get pleaseWaitTitle => TranslationOverrides.string(_root.$meta, 'settings.database.pleaseWaitTitle', {}) ?? 'Sačekajte!';
  @override
  String get indexesBeingChanged => TranslationOverrides.string(_root.$meta, 'settings.database.indexesBeingChanged', {}) ?? 'Indeksi se menjaju';
  @override
  String get databaseInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfo', {}) ?? 'Čuva omiljene stavke i prati preuzete stavke';
  @override
  String get databaseInfoSnatch =>
      TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfoSnatch', {}) ?? 'Preuzete stavke se neće ponovo preuzimati';
  @override
  String get indexingInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.indexingInfo', {}) ??
      'Ubrzava pretragu baze podataka, ali koristi više prostora na disku (do 2x).\n\nNemojte napuštati stranicu niti zatvarati aplikaciju tokom indeksiranja.';
  @override
  String get createIndexesDebug =>
      TranslationOverrides.string(_root.$meta, 'settings.database.createIndexesDebug', {}) ?? 'Kreiraj indekse [Otklanjanje grešaka]';
  @override
  String get dropIndexesDebug =>
      TranslationOverrides.string(_root.$meta, 'settings.database.dropIndexesDebug', {}) ?? 'Ukloni indekse [Otklanjanje grešaka]';
  @override
  String get searchHistoryInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryInfo', {}) ?? 'Zahteva da baza podataka bude omogućena.';
  @override
  String searchHistoryRecords({required int limit}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryRecords', {'limit': limit}) ?? 'Čuva poslednjih ${limit} pretraga';
  @override
  String get searchHistoryTapInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryTapInfo', {}) ?? 'Dodirnite unos za radnje (Obriši, Omiljeno…)';
  @override
  String get searchHistoryFavouritesInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryFavouritesInfo', {}) ??
      'Omiljeni upiti su zakačeni na vrh liste i neće se računati u ograničenje.';
  @override
  String get tagTypeFetchingInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingInfo', {}) ?? 'Preuzima tipove oznaka sa podržanih Booru sajtova';
  @override
  String get tagTypeFetchingWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingWarning', {}) ?? 'Može izazvati ograničenje broja zahteva';
  @override
  String get deleteDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabase', {}) ?? 'Obriši bazu podataka';
  @override
  String get deleteDatabaseConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabaseConfirm', {}) ?? 'Obrisati bazu podataka?';
  @override
  String get databaseDeleted => TranslationOverrides.string(_root.$meta, 'settings.database.databaseDeleted', {}) ?? 'Baza podataka je obrisana!';
  @override
  String get appRestartRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.database.appRestartRequired', {}) ?? 'Potrebno je ponovno pokretanje aplikacije!';
  @override
  String get clearSnatchedItems =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearSnatchedItems', {}) ?? 'Obriši istoriju preuzimanja';
  @override
  String get clearAllSnatchedConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearAllSnatchedConfirm', {}) ?? 'Obrisati celu istoriju preuzimanja?';
  @override
  String get snatchedItemsCleared =>
      TranslationOverrides.string(_root.$meta, 'settings.database.snatchedItemsCleared', {}) ?? 'Istorija preuzimanja je obrisana';
  @override
  String get appRestartMayBeRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.database.appRestartMayBeRequired', {}) ??
      'Možda će biti potrebno ponovno pokretanje aplikacije!';
  @override
  String get clearFavouritedItems =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearFavouritedItems', {}) ?? 'Obriši omiljene stavke';
  @override
  String get clearAllFavouritedConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearAllFavouritedConfirm', {}) ?? 'Obrisati sve omiljene stavke?';
  @override
  String get favouritesCleared =>
      TranslationOverrides.string(_root.$meta, 'settings.database.favouritesCleared', {}) ?? 'Omiljene stavke su obrisane';
  @override
  String get clearSearchHistory => TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistory', {}) ?? 'Obriši istoriju pretrage';
  @override
  String get clearSearchHistoryConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistoryConfirm', {}) ?? 'Obrisati istoriju pretrage?';
  @override
  String get searchHistoryCleared =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryCleared', {}) ?? 'Istorija pretrage je obrisana';
  @override
  String get sankakuFavouritesUpdate =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdate', {}) ?? 'Ažuriranje Sankaku omiljenih stavki';
  @override
  String get sankakuFavouritesUpdateStarted =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateStarted', {}) ??
      'Ažuriranje Sankaku omiljenih stavki je započeto';
  @override
  String get sankakuNewUrlsInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuNewUrlsInfo', {}) ??
      'Novi URL-ovi slika biće preuzeti za Sankaku stavke u vašim omiljenim';
  @override
  String get sankakuDontLeavePage =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDontLeavePage', {}) ??
      'Nemojte napuštati ovu stranicu dok se proces ne završi ili ne zaustavi';
  @override
  String get noSankakuConfigFound =>
      TranslationOverrides.string(_root.$meta, 'settings.database.noSankakuConfigFound', {}) ?? 'Sankaku konfiguracija nije pronađena!';
  @override
  String get sankakuFavouritesUpdateComplete =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateComplete', {}) ??
      'Ažuriranje Sankaku omiljenih stavki je završeno';
  @override
  String get failedItemsPurgeStartedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeStartedTitle', {}) ?? 'Čišćenje neuspelih stavki je započeto';
  @override
  String get failedItemsPurgeInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeInfo', {}) ??
      'Stavke koje nisu uspele da se ažuriraju biće uklonjene iz baze podataka';
  @override
  String get updateSankakuUrls => TranslationOverrides.string(_root.$meta, 'settings.database.updateSankakuUrls', {}) ?? 'Ažuriraj Sankaku URL-ove';
  @override
  String updating({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.updating', {'count': count}) ?? 'Ažuriranje stavki: ${count}';
  @override
  String left({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.left', {'count': count}) ?? 'Preostalo: ${count}';
  @override
  String done({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.done', {'count': count}) ?? 'Završeno: ${count}';
  @override
  String failedSkipped({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedSkipped', {'count': count}) ?? 'Neuspelo/preskočeno: ${count}';
  @override
  String get sankakuRateLimitWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuRateLimitWarning', {}) ??
      'Zaustavite i pokušajte ponovo kasnije ako vidite da broj \'Neuspelo\' konstantno raste, možda ste dostigli ograničenje broja zahteva i/ili Sankaku blokira zahteve sa vaše IP adrese.';
  @override
  String get skipCurrentItem =>
      TranslationOverrides.string(_root.$meta, 'settings.database.skipCurrentItem', {}) ?? 'Pritisnite ovde da preskočite trenutnu stavku';
  @override
  String get useIfStuck =>
      TranslationOverrides.string(_root.$meta, 'settings.database.useIfStuck', {}) ?? 'Koristite ako izgleda da se stavka zaglavila';
  @override
  String get pressToStop => TranslationOverrides.string(_root.$meta, 'settings.database.pressToStop', {}) ?? 'Pritisnite ovde da zaustavite';
  @override
  String purgeFailedItems({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.purgeFailedItems', {'count': count}) ?? 'Očisti neuspele stavke (${count})';
  @override
  String retryFailedItems({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.retryFailedItems', {'count': count}) ??
      'Ponovo ažuriraj stavke čije ažuriranje nije uspelo (${count})';
}

// Path: settings.backupAndRestore
class _Translations$settings$backupAndRestore$sr_RS extends Translations$settings$backupAndRestore$en {
  _Translations$settings$backupAndRestore$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.title', {}) ?? 'Rezervna kopija i vraćanje';
  @override
  String get duplicateFileDetectedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedTitle', {}) ?? 'Otkriven je duplikat datoteke!';
  @override
  String duplicateFileDetectedMsg({required String fileName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
      'Datoteka ${fileName} već postoji. Želite li da je prepišete? Ako izaberete ne, kreiranje rezervne kopije biće otkazano.';
  @override
  String get androidOnlyFeatureMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ??
      'Ova funkcija je dostupna samo na Androidu. U verzijama za računare možete kopirati i nalepiti datoteke iz fascikle podataka aplikacije ili u nju, u zavisnosti od vašeg sistema.';
  @override
  String get selectBackupDir =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? 'Izaberite direktorijum rezervne kopije';
  @override
  String get failedToGetBackupPath =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ??
      'Preuzimanje putanje rezervne kopije nije uspelo';
  @override
  String backupPathMsg({required String backupPath}) =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ??
      'Putanja rezervne kopije je: ${backupPath}';
  @override
  String get noBackupDirSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ?? 'Nije izabran direktorijum rezervne kopije';
  @override
  String get restoreInfoMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ?? 'Datoteke moraju biti u korenu direktorijuma';
  @override
  String get backupSettings =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? 'Napravi rezervnu kopiju podešavanja';
  @override
  String get restoreSettings =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? 'Vrati podešavanja iz rezervne kopije';
  @override
  String get settingsBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ?? 'Podešavanja su sačuvana u settings.json';
  @override
  String get settingsRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? 'Podešavanja su vraćena iz rezervne kopije';
  @override
  String get backupSettingsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ??
      'Pravljenje rezervne kopije podešavanja nije uspelo';
  @override
  String get restoreSettingsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ?? 'Vraćanje podešavanja nije uspelo';
  @override
  String get resetBackupDir =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.resetBackupDir', {}) ?? 'Resetuj direktorijum rezervne kopije';
  @override
  String get backupBoorus =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ?? 'Napravi rezervnu kopiju podešavanja booru sajtova';
  @override
  String get restoreBoorus =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? 'Vrati podešavanja booru sajtova';
  @override
  String get boorusBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ??
      'Rezervna kopija podešavanja booru sajtova je sačuvana u boorus.json';
  @override
  String get boorusRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ??
      'Podešavanja booru sajtova su vraćena iz rezervne kopije';
  @override
  String get backupBoorusError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ??
      'Pravljenje rezervne kopije podešavanja booru sajtova nije uspelo';
  @override
  String get restoreBoorusError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ??
      'Vraćanje podešavanja booru sajtova nije uspelo';
  @override
  String get backupDatabase =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? 'Napravi rezervnu kopiju baze podataka';
  @override
  String get restoreDatabase => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? 'Vrati bazu podataka';
  @override
  String get restoreDatabaseInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ??
      'Može potrajati u zavisnosti od veličine baze podataka, aplikacija će se ponovo pokrenuti nakon uspešnog vraćanja';
  @override
  String get databaseBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ??
      'Rezervna kopija baze podataka je sačuvana u store.db';
  @override
  String get databaseRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ??
      'Baza podataka je vraćena iz rezervne kopije! Aplikacija će se ponovo pokrenuti za nekoliko sekundi!';
  @override
  String get backupDatabaseError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ??
      'Pravljenje rezervne kopije baze podataka nije uspelo';
  @override
  String get restoreDatabaseError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ?? 'Vraćanje baze podataka nije uspelo';
  @override
  String get databaseFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ??
      'Datoteka baze podataka nije pronađena ili se ne može pročitati!';
  @override
  String get backupTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? 'Napravi rezervnu kopiju oznaka';
  @override
  String get restoreTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? 'Vrati oznake';
  @override
  String get restoreTagsInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ??
      'Može potrajati ako imate puno oznaka. Ako ste izvršili vraćanje baze podataka, ne morate ovo raditi jer je to već uključeno u bazu podataka';
  @override
  String get tagsBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? 'Rezervna kopija oznaka je sačuvana u tags.json';
  @override
  String get tagsRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? 'Oznake su vraćene iz rezervne kopije';
  @override
  String get backupTagsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? 'Pravljenje rezervne kopije oznaka nije uspelo';
  @override
  String get restoreTagsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? 'Vraćanje oznaka nije uspelo';
  @override
  String get tagsFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsFileNotFound', {}) ??
      'Datoteka sa oznakama nije pronađena ili se ne može pročitati!';
  @override
  String get operationTakesTooLongMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.operationTakesTooLongMsg', {}) ??
      'Pritisnite Sakrij ispod ako predugo traje, radnja će se nastaviti u pozadini';
  @override
  String get backupFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupFileNotFound', {}) ??
      'Datoteka rezervne kopije nije pronađena ili se ne može pročitati!';
  @override
  String get backupDirNoAccess =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDirNoAccess', {}) ??
      'Nema pristupa direktorijumu za rezervne kopije!';
  @override
  String get backupCancelled =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? 'Pravljenje rezervne kopije je otkazano';
}

// Path: settings.network
class _Translations$settings$network$sr_RS extends Translations$settings$network$en {
  _Translations$settings$network$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? 'Mreža';
  @override
  String get enableSelfSignedSSLCertificates =>
      TranslationOverrides.string(_root.$meta, 'settings.network.enableSelfSignedSSLCertificates', {}) ?? 'Omogući samopotpisane SSL sertifikate';
  @override
  String get proxy => TranslationOverrides.string(_root.$meta, 'settings.network.proxy', {}) ?? 'Proksi';
  @override
  String get proxySubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.network.proxySubtitle', {}) ??
      'Ne primenjuje se na režim strimovanja videa, umesto toga koristite režim keširanja videa';
  @override
  String get customUserAgent => TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgent', {}) ?? 'Prilagođeni User-Agent';
  @override
  String get customUserAgentTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgentTitle', {}) ?? 'Prilagođeni User-Agent';
  @override
  String get keepEmptyForDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.network.keepEmptyForDefault', {}) ??
      'Ostavite prazno da biste koristili podrazumevanu vrednost';
  @override
  String defaultUserAgent({required String agent}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.defaultUserAgent', {'agent': agent}) ?? 'Podrazumevano: ${agent}';
  @override
  String get userAgentUsedOnRequests =>
      TranslationOverrides.string(_root.$meta, 'settings.network.userAgentUsedOnRequests', {}) ?? 'Koristi se za većinu Booru zahteva i Webview';
  @override
  String get valueSavedAfterLeaving =>
      TranslationOverrides.string(_root.$meta, 'settings.network.valueSavedAfterLeaving', {}) ?? 'Čuva se pri napuštanju stranice';
  @override
  String get setBrowserUserAgent =>
      TranslationOverrides.string(_root.$meta, 'settings.network.setBrowserUserAgent', {}) ??
      'Dodirnite ovde da biste koristili User-Agent Chrome pregledača (preporučuje se samo ako sajt zabranjuje korisničke agente koji nisu iz pregledača)';
  @override
  String get cookieCleaner => TranslationOverrides.string(_root.$meta, 'settings.network.cookieCleaner', {}) ?? 'Čistač kolačića';
  @override
  String get selectBooruToClearCookies =>
      TranslationOverrides.string(_root.$meta, 'settings.network.selectBooruToClearCookies', {}) ??
      'Izaberite Booru za brisanje kolačića ili ostavite prazno da obrišete sve';
  @override
  String cookiesFor({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookiesFor', {'booruName': booruName}) ?? 'Kolačići za ${booruName}:';
  @override
  String cookieDeleted({required String cookieName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookieDeleted', {'cookieName': cookieName}) ?? 'Kolačić «${cookieName}» je obrisan';
  @override
  String get clearCookies => TranslationOverrides.string(_root.$meta, 'settings.network.clearCookies', {}) ?? 'Obriši kolačiće';
  @override
  String clearCookiesFor({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.clearCookiesFor', {'booruName': booruName}) ?? 'Obriši kolačiće za ${booruName}';
  @override
  String cookiesForBooruDeleted({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookiesForBooruDeleted', {'booruName': booruName}) ??
      'Kolačići za ${booruName} su obrisani';
  @override
  String get allCookiesDeleted => TranslationOverrides.string(_root.$meta, 'settings.network.allCookiesDeleted', {}) ?? 'Svi kolačići su obrisani';
}

// Path: settings.privacy
class _Translations$settings$privacy$sr_RS extends Translations$settings$privacy$en {
  _Translations$settings$privacy$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? 'Privatnost';
  @override
  String get appLock => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? 'Zaključavanje aplikacije';
  @override
  String get appLockMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ??
      'Zaključajte aplikaciju ručno ili nakon isteka perioda neaktivnosti. Zahteva PIN/biometriju';
  @override
  String get autoLockAfter => TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfter', {}) ?? 'Automatsko zaključavanje nakon';
  @override
  String get autoLockAfterTip =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfterTip', {}) ?? 'u sekundama, 0 za onemogućavanje';
  @override
  String get bluronLeave =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeave', {}) ?? 'Zamućenje ekrana pri napuštanju aplikacije';
  @override
  String get bluronLeaveMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeaveMsg', {}) ??
      'Možda neće raditi na nekim uređajima zbog sistemskih ograničenja';
  @override
  String get incognitoKeyboard => TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboard', {}) ?? 'Inkognito tastatura';
  @override
  String get incognitoKeyboardMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboardMsg', {}) ??
      'Sprečava tastaturu da čuva istoriju kucanja.\nPrimenjuje se na većinu polja za unos teksta';
  @override
  String get appDisplayName => TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayName', {}) ?? 'Prikazano ime aplikacije';
  @override
  String get appDisplayNameDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayNameDescription', {}) ??
      'Promenite način na koji se naziv aplikacije prikazuje u pokretaču';
  @override
  String get appAliasChanged => TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChanged', {}) ?? 'Naziv aplikacije je promenjen';
  @override
  String get appAliasRestartHint =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasRestartHint', {}) ??
      'Promena naziva aplikacije stupiće na snagu nakon ponovnog pokretanja aplikacije. Nekim pokretačima je možda potrebno dodatno vreme ili ponovno pokretanje sistema radi ažuriranja.';
  @override
  String get appAliasChangeFailed =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChangeFailed', {}) ??
      'Promena naziva aplikacije nije uspela. Pokušajte ponovo.';
  @override
  String get restartNow => TranslationOverrides.string(_root.$meta, 'settings.privacy.restartNow', {}) ?? 'Ponovo pokreni sada';
}

// Path: settings.performance
class _Translations$settings$performance$sr_RS extends Translations$settings$performance$en {
  _Translations$settings$performance$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.performance.title', {}) ?? 'Performanse';
  @override
  String get lowPerformanceMode =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceMode', {}) ?? 'Režim niskih performansi';
  @override
  String get lowPerformanceModeSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeSubtitle', {}) ??
      'Preporučuje se za starije uređaje i uređaje sa malo RAM memorije';
  @override
  String get lowPerformanceModeDialogTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogTitle', {}) ?? 'Režim niskih performansi';
  @override
  String get lowPerformanceModeDialogDisablesDetailed =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesDetailed', {}) ??
      '- Onemogućava detaljne informacije o napretku učitavanja';
  @override
  String get lowPerformanceModeDialogDisablesResourceIntensive =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive', {}) ??
      '- Onemogućava elemente koji zahtevaju mnogo resursa (zamućenja, animiranu neprozirnost, pojedine animacije…)';
  @override
  String get lowPerformanceModeDialogSetsOptimal =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogSetsOptimal', {}) ??
      'Postavlja optimalna podešavanja za ove opcije (možete ih kasnije zasebno promeniti):';
  @override
  String get autoplayVideos =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.autoplayVideos', {}) ?? 'Automatski reprodukuj video zapise';
  @override
  String get disableVideos => TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideos', {}) ?? 'Onemogući video zapise';
  @override
  String get disableVideosHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideosHelp', {}) ??
      'Korisno na slabijim uređajima koji se ruše pri pokušaju učitavanja videa. Daje opcije za gledanje videa u spoljnom plejeru ili pregledaču.';
}

// Path: settings.cache
class _Translations$settings$cache$sr_RS extends Translations$settings$cache$en {
  _Translations$settings$cache$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? 'Preuzimanje i keširanje';
  @override
  String get snatchQuality => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchQuality', {}) ?? 'Kvalitet preuzimanja';
  @override
  String get snatchCooldown => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchCooldown', {}) ?? 'Pauza između preuzimanja (u ms)';
  @override
  String get pleaseEnterAValidTimeout =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.pleaseEnterAValidTimeout', {}) ?? 'Unesite važeću vrednost vremenskog ograničenja';
  @override
  String get biggerThan10 => TranslationOverrides.string(_root.$meta, 'settings.cache.biggerThan10', {}) ?? 'Unesite vrednost veću od 10 ms';
  @override
  String get showDownloadNotifications =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.showDownloadNotifications', {}) ?? 'Prikaži obaveštenja o preuzimanju';
  @override
  String get snatchItemsOnFavouriting =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.snatchItemsOnFavouriting', {}) ?? 'Preuzmi stavke prilikom dodavanja u omiljene';
  @override
  String get favouriteItemsOnSnatching =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.favouriteItemsOnSnatching', {}) ?? 'Dodaj stavke u omiljene prilikom preuzimanja';
  @override
  String get writeImageDataOnSave =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.writeImageDataOnSave', {}) ?? 'Zapiši podatke o slici u JSON prilikom čuvanja';
  @override
  String get requiresCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.requiresCustomStorageDirectory', {}) ?? 'Zahteva prilagođeni direktorijum';
  @override
  String get setStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.setStorageDirectory', {}) ?? 'Postavi direktorijum za skladištenje';
  @override
  String currentPath({required String path}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.currentPath', {'path': path}) ?? 'Trenutno: ${path}';
  @override
  String get resetStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.resetStorageDirectory', {}) ?? 'Resetuj direktorijum za skladištenje';
  @override
  String get cachePreviews => TranslationOverrides.string(_root.$meta, 'settings.cache.cachePreviews', {}) ?? 'Keširaj preglede';
  @override
  String get cacheMedia => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheMedia', {}) ?? 'Keširaj medije';
  @override
  String get videoCacheMode => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheMode', {}) ?? 'Režim keširanja videa';
  @override
  String get videoCacheModesTitle => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModesTitle', {}) ?? 'Režimi keširanja videa';
  @override
  String get videoCacheModeStream =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStream', {}) ??
      '- Strimovanje - Ne keširaj, započni reprodukciju što je pre moguće';
  @override
  String get videoCacheModeCache =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeCache', {}) ??
      '- Keširanje - Čuva datoteku u skladištu uređaja, reprodukuje tek kada se preuzimanje završi';
  @override
  String get videoCacheModeStreamCache =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStreamCache', {}) ??
      '- Strimovanje+keširanje - Kombinacija oba, ali trenutno dovodi do dvostrukog preuzimanja';
  @override
  String get videoCacheNoteEnable =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheNoteEnable', {}) ??
      '[Napomena]: Video zapisi će se keširati samo ako je opcija \'Keširaj medije\' omogućena.';
  @override
  String get videoCacheWarningDesktop =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheWarningDesktop', {}) ??
      '[Upozorenje]: Na računaru režim strimovanja može raditi nepravilno za pojedine Booru sajtove.';
  @override
  String get deleteCacheAfter => TranslationOverrides.string(_root.$meta, 'settings.cache.deleteCacheAfter', {}) ?? 'Obriši keš nakon:';
  @override
  String get neverDeleteDuration => TranslationOverrides.string(_root.$meta, 'settings.cache.neverDeleteDuration', {}) ?? 'Nikada';
  @override
  String get cacheSizeLimit => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheSizeLimit', {}) ?? 'Ograničenje veličine keša (u GB)';
  @override
  String get maximumTotalCacheSize =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.maximumTotalCacheSize', {}) ?? 'Maksimalna ukupna veličina keša';
  @override
  String get cacheStats => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheStats', {}) ?? 'Statistika keša:';
  @override
  String get loading => TranslationOverrides.string(_root.$meta, 'settings.cache.loading', {}) ?? 'Učitavanje…';
  @override
  String get empty => TranslationOverrides.string(_root.$meta, 'settings.cache.empty', {}) ?? 'Prazno';
  @override
  String inFilesPlural({required String size, required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.inFilesPlural', {'size': size, 'count': count}) ?? '${size}, broj datoteka: ${count}';
  @override
  String inFileSingular({required String size}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.inFileSingular', {'size': size}) ?? '${size}, 1 datoteka';
  @override
  String get cacheTypeTotal => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeTotal', {}) ?? 'Ukupno';
  @override
  String get cacheTypeFavicons => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeFavicons', {}) ?? 'Favikoni';
  @override
  String get cacheTypeThumbnails => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeThumbnails', {}) ?? 'Minijature';
  @override
  String get cacheTypeSamples => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeSamples', {}) ?? 'Uzorci';
  @override
  String get cacheTypeMedia => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeMedia', {}) ?? 'Mediji';
  @override
  String get cacheTypeWebView => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeWebView', {}) ?? 'Webview';
  @override
  String get cacheCleared => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheCleared', {}) ?? 'Keš je obrisan';
  @override
  String clearedCacheType({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheType', {'type': type}) ?? 'Obrisan je keš za: ${type}';
  @override
  String get clearAllCache => TranslationOverrides.string(_root.$meta, 'settings.cache.clearAllCache', {}) ?? 'Obriši sav keš';
  @override
  String get clearedCacheCompletely =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheCompletely', {}) ?? 'Keš je potpuno obrisan';
  @override
  String get appRestartRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.appRestartRequired', {}) ?? 'Možda je potrebno ponovno pokretanje aplikacije!';
  @override
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'settings.cache.errorExclamation', {}) ?? 'Greška!';
  @override
  String get notAvailableForPlatform =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.notAvailableForPlatform', {}) ?? 'Trenutno nije dostupno za ovu platformu';
}

// Path: settings.itemFilters
class _Translations$settings$itemFilters$sr_RS extends Translations$settings$itemFilters$en {
  _Translations$settings$itemFilters$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.title', {}) ?? 'Filteri';
  @override
  String get hidden => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.hidden', {}) ?? 'Skriveno';
  @override
  String get marked => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.marked', {}) ?? 'Označeno';
  @override
  String get duplicateFilter => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.duplicateFilter', {}) ?? 'Duplirani filter';
  @override
  String alreadyInList({required String tag, required String type}) =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.alreadyInList', {'tag': tag, 'type': type}) ??
      '\'${tag}\' se već nalazi na listi: ${type}';
  @override
  String get noFiltersFound => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersFound', {}) ?? 'Nisu pronađeni filteri';
  @override
  String get noFiltersAdded => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersAdded', {}) ?? 'Nema dodatih filtera';
  @override
  String get removeHidden =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeHidden', {}) ??
      'Potpuno sakrij stavke koje odgovaraju skrivenim filterima';
  @override
  String get removeMarked =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeMarked', {}) ??
      'Potpuno sakrij stavke koje odgovaraju označenim filterima';
  @override
  String get removeFavourited => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeFavourited', {}) ?? 'Sakrij omiljene stavke';
  @override
  String get removeSnatched => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeSnatched', {}) ?? 'Sakrij preuzete stavke';
  @override
  String get removeAI => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeAI', {}) ?? 'Sakrij stavke označene kao AI';
}

// Path: settings.sync
class _Translations$settings$sync$sr_RS extends Translations$settings$sync$en {
  _Translations$settings$sync$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? 'Sinhronizacija';
  @override
  String get dbError =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ?? 'Baza podataka mora biti omogućena za korišćenje sinhronizacije';
  @override
  String get errorTitle => TranslationOverrides.string(_root.$meta, 'settings.sync.errorTitle', {}) ?? 'Greška!';
  @override
  String get pleaseEnterIPAndPort =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.pleaseEnterIPAndPort', {}) ?? 'Unesite IP adresu i port.';
  @override
  String get selectWhatYouWantToDo =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.selectWhatYouWantToDo', {}) ?? 'Izaberite šta želite da uradite';
  @override
  String get sendDataToDevice => TranslationOverrides.string(_root.$meta, 'settings.sync.sendDataToDevice', {}) ?? 'POŠALJI podatke NA drugi uređaj';
  @override
  String get receiveDataFromDevice =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.receiveDataFromDevice', {}) ?? 'PRIMI podatke SA drugog uređaja';
  @override
  String get senderInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.senderInstructions', {}) ??
      'Pokrenite server na drugom uređaju, unesite njegovu IP adresu/port, a zatim dodirnite Pokreni sinhronizaciju';
  @override
  String get ipAddress => TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddress', {}) ?? 'IP adresa';
  @override
  String get ipAddressPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddressPlaceholder', {}) ?? 'IP adresa hosta (npr. 192.168.1.1)';
  @override
  String get port => TranslationOverrides.string(_root.$meta, 'settings.sync.port', {}) ?? 'Port';
  @override
  String get portPlaceholder => TranslationOverrides.string(_root.$meta, 'settings.sync.portPlaceholder', {}) ?? 'Port hosta (npr. 7777)';
  @override
  String get sendFavourites => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavourites', {}) ?? 'Pošalji omiljene';
  @override
  String favouritesCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.favouritesCount', {'count': count}) ?? 'Omiljeno: ${count}';
  @override
  String get sendFavouritesLegacy =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavouritesLegacy', {}) ?? 'Pošalji omiljene (zastarelo)';
  @override
  String get syncFavsFrom => TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFrom', {}) ?? 'Sinhronizuj omiljene od #…';
  @override
  String get syncFavsFromHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText1', {}) ??
      'Omogućava podešavanje odakle sinhronizacija treba da počne, što je korisno ako ste ranije već sinhronizovali sve svoje omiljene stavke i želite da sinhronizujete samo najnovije stavke';
  @override
  String get syncFavsFromHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText2', {}) ??
      'Ako želite da sinhronizujete od početka, ostavite ovo polje prazno';
  @override
  String get syncFavsFromHelpText3 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText3', {}) ??
      'Primer: Imate X omiljenih stavki, postavite ovo polje na 100, sinhronizacija će početi od stavke #100 i trajati dok ne stigne do X';
  @override
  String get syncFavsFromHelpText4 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText4', {}) ??
      'Redosled omiljenih stavki: od najstarijih (0) do najnovijih (X)';
  @override
  String get sendSnatchedHistory =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.sendSnatchedHistory', {}) ?? 'Pošalji istoriju preuzimanja';
  @override
  String snatchedCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.snatchedCount', {'count': count}) ?? 'Preuzeto: ${count}';
  @override
  String get syncSnatchedFrom => TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFrom', {}) ?? 'Sinhronizuj preuzeto od #…';
  @override
  String get syncSnatchedFromHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText1', {}) ??
      'Omogućava podešavanje odakle sinhronizacija treba da počne, što je korisno ako ste ranije već sinhronizovali celu istoriju preuzimanja i želite da sinhronizujete samo najnovije stavke';
  @override
  String get syncSnatchedFromHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText2', {}) ??
      'Ako želite da sinhronizujete od početka, ostavite ovo polje prazno';
  @override
  String get syncSnatchedFromHelpText3 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText3', {}) ??
      'Primer: Imate X preuzetih stavki, postavite ovo polje na 100, sinhronizacija će početi od stavke #100 i trajati dok ne stigne do X';
  @override
  String get syncSnatchedFromHelpText4 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText4', {}) ??
      'Redosled preuzetih: od najstarijih (0) do najnovijih (X)';
  @override
  String get sendSettings => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSettings', {}) ?? 'Pošalji podešavanja';
  @override
  String get sendBooruConfigs => TranslationOverrides.string(_root.$meta, 'settings.sync.sendBooruConfigs', {}) ?? 'Pošalji Booru konfiguracije';
  @override
  String configsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.configsCount', {'count': count}) ?? 'Konfiguracije: ${count}';
  @override
  String get sendTabs => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTabs', {}) ?? 'Pošalji kartice';
  @override
  String tabsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsCount', {'count': count}) ?? 'Kartice: ${count}';
  @override
  String get tabsSyncMode => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncMode', {}) ?? 'Režim sinhronizacije kartica';
  @override
  String get tabsSyncModeMerge =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeMerge', {}) ??
      'Objedini: Objedinjuje kartice sa ovog uređaja na drugom uređaju, pri čemu će kartice sa nepoznatim Booru sajtovima i već postojeće kartice biti zanemarene';
  @override
  String get tabsSyncModeReplace =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeReplace', {}) ??
      'Zameni: Potpuno zamenjuje kartice na drugom uređaju karticama sa ovog uređaja';
  @override
  String get merge => TranslationOverrides.string(_root.$meta, 'settings.sync.merge', {}) ?? 'Objedini';
  @override
  String get replace => TranslationOverrides.string(_root.$meta, 'settings.sync.replace', {}) ?? 'Zameni';
  @override
  String get sendTags => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTags', {}) ?? 'Pošalji oznake';
  @override
  String tagsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsCount', {'count': count}) ?? 'Oznake: ${count}';
  @override
  String get tagsSyncMode => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncMode', {}) ?? 'Režim sinhronizacije oznaka';
  @override
  String get tagsSyncModePreferTypeIfNone =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModePreferTypeIfNone', {}) ??
      'Sačuvaj postojeći tip: Pri uvozu ne prepisuj postojeći poznati tip oznake nepoznatim tipom.';
  @override
  String get tagsSyncModeOverwrite =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModeOverwrite', {}) ??
      'Prepiši: Sve oznake će biti dodate, ako oznaka i tip oznake postoje na drugom uređaju biće prepisani';
  @override
  String get preferTypeIfNone => TranslationOverrides.string(_root.$meta, 'settings.sync.preferTypeIfNone', {}) ?? 'Sačuvaj tip';
  @override
  String get overwrite => TranslationOverrides.string(_root.$meta, 'settings.sync.overwrite', {}) ?? 'Prepiši';
  @override
  String get testConnection => TranslationOverrides.string(_root.$meta, 'settings.sync.testConnection', {}) ?? 'Testiraj vezu';
  @override
  String get testConnectionHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText1', {}) ?? 'Šalje probni zahtev drugom uređaju.';
  @override
  String get testConnectionHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText2', {}) ?? 'Prikazuje obaveštenje o uspehu/neuspehu.';
  @override
  String get startSync => TranslationOverrides.string(_root.$meta, 'settings.sync.startSync', {}) ?? 'Pokreni sinhronizaciju';
  @override
  String get portAndIPCannotBeEmpty =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.portAndIPCannotBeEmpty', {}) ?? 'Polja za port i IP ne mogu biti prazna!';
  @override
  String get nothingSelectedToSync =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.nothingSelectedToSync', {}) ?? 'Niste izabrali ništa za sinhronizaciju!';
  @override
  String get statsOfThisDevice => TranslationOverrides.string(_root.$meta, 'settings.sync.statsOfThisDevice', {}) ?? 'Statistika ovog uređaja:';
  @override
  String get receiverInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.receiverInstructions', {}) ??
      'Pokrenite server za prijem podataka. Izbegavajte javni Wi-Fi iz bezbednosnih razloga';
  @override
  String get availableNetworkInterfaces =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.availableNetworkInterfaces', {}) ?? 'Dostupni mrežni interfejsi';
  @override
  String selectedInterfaceIP({required String ip}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.selectedInterfaceIP', {'ip': ip}) ?? 'IP izabranog interfejsa: ${ip}';
  @override
  String get serverPort => TranslationOverrides.string(_root.$meta, 'settings.sync.serverPort', {}) ?? 'Port servera';
  @override
  String get serverPortPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.serverPortPlaceholder', {}) ?? '(biće podrazumevano \'8080\' ako je prazno)';
  @override
  String get startReceiverServer => TranslationOverrides.string(_root.$meta, 'settings.sync.startReceiverServer', {}) ?? 'Pokreni prijemni server';
}

// Path: settings.about
class _Translations$settings$about$sr_RS extends Translations$settings$about$en {
  _Translations$settings$about$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.about.title', {}) ?? 'O aplikaciji';
  @override
  String get appDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ??
      'LoliSnatcher je softver otvorenog koda licenciran pod GPLv3 licencom, a izvorni kod je dostupan na GitHub-u. Molimo prijavite sve probleme ili zahteve za novim funkcijama u odeljku za probleme (issues) u spremištu.';
  @override
  String get appOnGitHub => TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? 'LoliSnatcher na GitHub-u';
  @override
  String get contact => TranslationOverrides.string(_root.$meta, 'settings.about.contact', {}) ?? 'Kontakt';
  @override
  String get emailCopied => TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? 'Imejl je kopiran u privremenu memoriju';
  @override
  String get logoArtistThanks =>
      TranslationOverrides.string(_root.$meta, 'settings.about.logoArtistThanks', {}) ??
      'Veliko hvala autoru Showers-U što nam je omogućio korišćenje svog umetničkog rada za logotip aplikacije. Pogledajte njegov rad na platformi Pixiv';
  @override
  String get developers => TranslationOverrides.string(_root.$meta, 'settings.about.developers', {}) ?? 'Programeri';
  @override
  String get localizers => TranslationOverrides.string(_root.$meta, 'settings.about.localizers', {}) ?? 'Prevodioci';
  @override
  String get releases => TranslationOverrides.string(_root.$meta, 'settings.about.releases', {}) ?? 'Izdanja';
  @override
  String get releasesMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.about.releasesMsg', {}) ??
      'Najnovija verzija i kompletan dnevnik promena mogu se naći na GitHub stranici sa izdanjima:';
  @override
  String get licenses => TranslationOverrides.string(_root.$meta, 'settings.about.licenses', {}) ?? 'Licence';
}

// Path: settings.checkForUpdates
class _Translations$settings$checkForUpdates$sr_RS extends Translations$settings$checkForUpdates$en {
  _Translations$settings$checkForUpdates$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.title', {}) ?? 'Provera ažuriranja';
  @override
  String get updateAvailable => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateAvailable', {}) ?? 'Ažuriranje je dostupno!';
  @override
  String get whatsNew => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.whatsNew', {}) ?? 'Šta je novo';
  @override
  String get updateChangelog =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? 'Dnevnik promena ažuriranja';
  @override
  String get updateCheckError =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? 'Greška pri proveri ažuriranja!';
  @override
  String get youHaveLatestVersion =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? 'Imate najnoviju verziju';
  @override
  String get viewLatestChangelog =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ?? 'Pogledaj najnoviji dnevnik promena';
  @override
  String get currentVersion => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? 'Trenutna verzija';
  @override
  String get changelog => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? 'Dnevnik promena';
  @override
  String get visitPlayStore => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? 'Poseti Play prodavnicu';
  @override
  String get visitReleases => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? 'Poseti izdanja';
}

// Path: settings.logs
class _Translations$settings$logs$sr_RS extends Translations$settings$logs$en {
  _Translations$settings$logs$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.logs.title', {}) ?? 'Dnevnici';
  @override
  String get shareLogs => TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogs', {}) ?? 'Podeli dnevnike';
  @override
  String get shareLogsWarningTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningTitle', {}) ?? 'Podeliti dnevnike sa spoljnom aplikacijom?';
  @override
  String get shareLogsWarningMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningMsg', {}) ??
      '[UPOZORENJE]: Dnevnici mogu sadržati osetljive informacije, delite sa oprezom!';
}

// Path: settings.help
class _Translations$settings$help$sr_RS extends Translations$settings$help$en {
  _Translations$settings$help$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? 'Pomoć';
}

// Path: settings.debug
class _Translations$settings$debug$sr_RS extends Translations$settings$debug$en {
  _Translations$settings$debug$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.debug.title', {}) ?? 'Otklanjanje grešaka';
  @override
  String get enabledSnackbarMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.enabledSnackbarMsg', {}) ?? 'Režim otklanjanja grešaka je omogućen!';
  @override
  String get disabledSnackbarMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.disabledSnackbarMsg', {}) ?? 'Režim otklanjanja grešaka je onemogućen!';
  @override
  String get alreadyEnabledSnackbarMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.alreadyEnabledSnackbarMsg', {}) ?? 'Režim otklanjanja grešaka je već omogućen!';
  @override
  String get showPerformanceGraph =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.showPerformanceGraph', {}) ?? 'Prikaži grafikon performansi';
  @override
  String get showFPSGraph => TranslationOverrides.string(_root.$meta, 'settings.debug.showFPSGraph', {}) ?? 'Prikaži FPS grafikon';
  @override
  String get showImageStats => TranslationOverrides.string(_root.$meta, 'settings.debug.showImageStats', {}) ?? 'Prikaži statistiku slika';
  @override
  String get showVideoStats => TranslationOverrides.string(_root.$meta, 'settings.debug.showVideoStats', {}) ?? 'Prikaži statistiku video zapisa';
  @override
  String get blurImagesAndMuteVideosDevOnly =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.blurImagesAndMuteVideosDevOnly', {}) ??
      'Zamuti slike + isključi zvuk videa [samo za programere]';
  @override
  String get enableDragScrollOnListsDesktopOnly =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.enableDragScrollOnListsDesktopOnly', {}) ??
      'Omogući pomeranje prevlačenjem na listama [Samo za desktop]';
  @override
  String animationSpeed({required double speed}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.animationSpeed', {'speed': speed}) ?? 'Brzina animacije (${speed})';
  @override
  String get tagsManager => TranslationOverrides.string(_root.$meta, 'settings.debug.tagsManager', {}) ?? 'Upravljač oznakama';
  @override
  String resolution({required String width, required String height}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.resolution', {'width': width, 'height': height}) ?? 'Rez: ${width}x${height}';
  @override
  String pixelRatio({required String ratio}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.pixelRatio', {'ratio': ratio}) ?? 'Odnos piksela: ${ratio}';
  @override
  String get logger => TranslationOverrides.string(_root.$meta, 'settings.debug.logger', {}) ?? 'Beleženje dnevnika';
  @override
  String get webview => TranslationOverrides.string(_root.$meta, 'settings.debug.webview', {}) ?? 'Webview';
  @override
  String get deleteAllCookies => TranslationOverrides.string(_root.$meta, 'settings.debug.deleteAllCookies', {}) ?? 'Obriši sve kolačiće';
  @override
  String get clearSecureStorage => TranslationOverrides.string(_root.$meta, 'settings.debug.clearSecureStorage', {}) ?? 'Očisti bezbedno skladište';
  @override
  String get getSessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.getSessionString', {}) ?? 'Preuzmi string sesije';
  @override
  String get setSessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.setSessionString', {}) ?? 'Postavi string sesije';
  @override
  String get sessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.sessionString', {}) ?? 'String sesije';
  @override
  String get restoredSessionFromString =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.restoredSessionFromString', {}) ?? 'Sesija je obnovljena iz stringa';
}

// Path: settings.logging
class _Translations$settings$logging$sr_RS extends Translations$settings$logging$en {
  _Translations$settings$logging$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get logger => TranslationOverrides.string(_root.$meta, 'settings.logging.logger', {}) ?? 'Beleženje dnevnika';
  @override
  String get captureLogcat => TranslationOverrides.string(_root.$meta, 'settings.logging.captureLogcat', {}) ?? 'Snimaj Android logcat';
  @override
  String get captureLogcatDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.logging.captureLogcatDescription', {}) ??
      'Beleži poruke upozorenja i grešaka iz Android procesa ove aplikacije';
}

// Path: settings.webview
class _Translations$settings$webview$sr_RS extends Translations$settings$webview$en {
  _Translations$settings$webview$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get openWebview => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? 'Otvori Webview';
  @override
  String get openWebviewTip =>
      TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? 'za prijavu ili preuzimanje kolačića';
}

// Path: settings.dirPicker
class _Translations$settings$dirPicker$sr_RS extends Translations$settings$dirPicker$en {
  _Translations$settings$dirPicker$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get directoryName => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryName', {}) ?? 'Naziv direktorijuma';
  @override
  String get selectADirectory => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.selectADirectory', {}) ?? 'Izaberite direktorijum';
  @override
  String get closeWithoutChoosing =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.closeWithoutChoosing', {}) ??
      'Da li želite da zatvorite birač bez izbora direktorijuma?';
  @override
  String get no => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.no', {}) ?? 'Ne';
  @override
  String get yes => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.yes', {}) ?? 'Da';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.error', {}) ?? 'Greška!';
  @override
  String get failedToCreateDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.failedToCreateDirectory', {}) ?? 'Kreiranje direktorijuma nije uspelo';
  @override
  String get directoryNotWritable =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryNotWritable', {}) ?? 'U direktorijum nije moguće upisivati!';
  @override
  String get newDirectory => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.newDirectory', {}) ?? 'Novi direktorijum';
  @override
  String get create => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.create', {}) ?? 'Kreiraj';
}

// Path: viewer.tutorial
class _Translations$viewer$tutorial$sr_RS extends Translations$viewer$tutorial$en {
  _Translations$viewer$tutorial$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get images => TranslationOverrides.string(_root.$meta, 'viewer.tutorial.images', {}) ?? 'Slike';
  @override
  String get tapLongTapToggleImmersive =>
      TranslationOverrides.string(_root.$meta, 'viewer.tutorial.tapLongTapToggleImmersive', {}) ??
      'Dodir/dugi dodir: uključi/isključi imerzivni režim';
  @override
  String get doubleTapFitScreen =>
      TranslationOverrides.string(_root.$meta, 'viewer.tutorial.doubleTapFitScreen', {}) ??
      'Dvostruki dodir: prilagodi ekranu / originalna veličina / resetuj zum';
}

// Path: viewer.appBar
class _Translations$viewer$appBar$sr_RS extends Translations$viewer$appBar$en {
  _Translations$viewer$appBar$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get cantStartSlideshow =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.cantStartSlideshow', {}) ?? 'Nije moguće pokrenuti projekciju slajdova';
  @override
  String get reachedLastLoadedItem =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.reachedLastLoadedItem', {}) ?? 'Dostignuta je poslednja učitana stavka';
  @override
  String get pause => TranslationOverrides.string(_root.$meta, 'viewer.appBar.pause', {}) ?? 'Pauza';
  @override
  String get start => TranslationOverrides.string(_root.$meta, 'viewer.appBar.start', {}) ?? 'Pokreni';
  @override
  String get unfavourite => TranslationOverrides.string(_root.$meta, 'viewer.appBar.unfavourite', {}) ?? 'Ukloni iz omiljenih';
  @override
  String get deselect => TranslationOverrides.string(_root.$meta, 'viewer.appBar.deselect', {}) ?? 'Poništi izbor';
  @override
  String get reloadWithScaling => TranslationOverrides.string(_root.$meta, 'viewer.appBar.reloadWithScaling', {}) ?? 'Ponovo učitaj sa skaliranjem';
  @override
  String get loadSampleQuality => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadSampleQuality', {}) ?? 'Učitaj umanjenu sliku';
  @override
  String get loadHighQuality => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadHighQuality', {}) ?? 'Učitaj sliku visokog kvaliteta';
  @override
  String get dropSnatchedStatus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.dropSnatchedStatus', {}) ?? 'Ukloni status preuzeto';
  @override
  String get setSnatchedStatus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.setSnatchedStatus', {}) ?? 'Postavi status preuzeto';
  @override
  String get snatch => TranslationOverrides.string(_root.$meta, 'viewer.appBar.snatch', {}) ?? 'Preuzmi';
  @override
  String get forced => TranslationOverrides.string(_root.$meta, 'viewer.appBar.forced', {}) ?? '(forsirano)';
  @override
  String get hydrusShare => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusShare', {}) ?? 'Hydrus deljenje';
  @override
  String get whichUrlToShareToHydrus =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.whichUrlToShareToHydrus', {}) ?? 'Koji URL želite da podelite na Hydrus?';
  @override
  String get postURL => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURL', {}) ?? 'URL objave';
  @override
  String get fileURL => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURL', {}) ?? 'URL datoteke';
  @override
  String get hydrusNotConfigured => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusNotConfigured', {}) ?? 'Hydrus nije konfigurisan!';
  @override
  String get shareFile => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareFile', {}) ?? 'Podeli datoteku';
  @override
  String get alreadyDownloadingThisFile =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingThisFile', {}) ??
      'Ova datoteka se već preuzima radi deljenja, želite li da prekinete?';
  @override
  String get alreadyDownloadingFile =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingFile', {}) ??
      'Datoteka se već preuzima radi deljenja. Želite li da prekinete trenutno preuzimanje i podelite novu datoteku?';
  @override
  String get current => TranslationOverrides.string(_root.$meta, 'viewer.appBar.current', {}) ?? 'Trenutno:';
  @override
  String get kNew => TranslationOverrides.string(_root.$meta, 'viewer.appBar.kNew', {}) ?? 'Novo:';
  @override
  String get shareNew => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareNew', {}) ?? 'Podeli novo';
  @override
  String get abort => TranslationOverrides.string(_root.$meta, 'viewer.appBar.abort', {}) ?? 'Prekini';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'viewer.appBar.error', {}) ?? 'Greška!';
  @override
  String get savingFileError =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.savingFileError', {}) ?? 'Došlo je do greške prilikom čuvanja datoteke pre deljenja';
  @override
  String get whatToShare => TranslationOverrides.string(_root.$meta, 'viewer.appBar.whatToShare', {}) ?? 'Šta želite da podelite?';
  @override
  String get postURLWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURLWithTags', {}) ?? 'URL objave sa oznakama';
  @override
  String get fileURLWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURLWithTags', {}) ?? 'URL datoteke sa oznakama';
  @override
  String get file => TranslationOverrides.string(_root.$meta, 'viewer.appBar.file', {}) ?? 'Datoteka';
  @override
  String get fileWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileWithTags', {}) ?? 'Datoteka sa oznakama';
  @override
  String get hydrus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrus', {}) ?? 'Hydrus';
  @override
  String get selectTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.selectTags', {}) ?? 'Izaberite oznake';
}

// Path: viewer.notes
class _Translations$viewer$notes$sr_RS extends Translations$viewer$notes$en {
  _Translations$viewer$notes$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get note => TranslationOverrides.string(_root.$meta, 'viewer.notes.note', {}) ?? 'Beleška';
  @override
  String get notes => TranslationOverrides.string(_root.$meta, 'viewer.notes.notes', {}) ?? 'Beleške';
  @override
  String coordinates({required int posX, required int posY}) =>
      TranslationOverrides.string(_root.$meta, 'viewer.notes.coordinates', {'posX': posX, 'posY': posY}) ?? 'X:${posX}, Y:${posY}';
}

// Path: media.loading
class _Translations$media$loading$sr_RS extends Translations$media$loading$en {
  _Translations$media$loading$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get rendering => TranslationOverrides.string(_root.$meta, 'media.loading.rendering', {}) ?? 'Renderovanje…';
  @override
  String get loadingAndRenderingFromCache =>
      TranslationOverrides.string(_root.$meta, 'media.loading.loadingAndRenderingFromCache', {}) ?? 'Učitavanje i renderovanje iz keša…';
  @override
  String get loadingFromCache => TranslationOverrides.string(_root.$meta, 'media.loading.loadingFromCache', {}) ?? 'Učitavanje iz keša…';
  @override
  String get buffering => TranslationOverrides.string(_root.$meta, 'media.loading.buffering', {}) ?? 'Baferovanje…';
  @override
  String get loading => TranslationOverrides.string(_root.$meta, 'media.loading.loading', {}) ?? 'Učitavanje…';
  @override
  String get loadAnyway => TranslationOverrides.string(_root.$meta, 'media.loading.loadAnyway', {}) ?? 'Učitaj svejedno';
  @override
  String get restartLoading => TranslationOverrides.string(_root.$meta, 'media.loading.restartLoading', {}) ?? 'Ponovo pokreni učitavanje';
  @override
  String get stopLoading => TranslationOverrides.string(_root.$meta, 'media.loading.stopLoading', {}) ?? 'Zaustavi učitavanje';
  @override
  String startedSecondsAgo({required int seconds}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.startedSecondsAgo', {'seconds': seconds}) ?? 'Započeto pre ${seconds}s';
  @override
  late final _Translations$media$loading$stopReasons$sr_RS stopReasons = _Translations$media$loading$stopReasons$sr_RS._(_root);
  @override
  String get fileIsZeroBytes => TranslationOverrides.string(_root.$meta, 'media.loading.fileIsZeroBytes', {}) ?? 'Datoteka ima 0 bajtova';
  @override
  String fileSize({required String size}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.fileSize', {'size': size}) ?? 'Veličina datoteke: ${size}';
  @override
  String sizeLimit({required String limit}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.sizeLimit', {'limit': limit}) ?? 'Ograničenje: ${limit}';
  @override
  String get tryChangingVideoBackend =>
      TranslationOverrides.string(_root.$meta, 'media.loading.tryChangingVideoBackend', {}) ??
      'Česti problemi sa reprodukcijom? Pokušajte da promenite [Podešavanja > Video > Pozadinski sistem video plejera]';
}

// Path: media.video
class _Translations$media$video$sr_RS extends Translations$media$video$en {
  _Translations$media$video$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get videosDisabledOrNotSupported =>
      TranslationOverrides.string(_root.$meta, 'media.video.videosDisabledOrNotSupported', {}) ?? 'Video zapisi su onemogućeni ili nisu podržani';
  @override
  String get openVideoInExternalPlayer =>
      TranslationOverrides.string(_root.$meta, 'media.video.openVideoInExternalPlayer', {}) ?? 'Otvori video u spoljnom plejeru';
  @override
  String get openVideoInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openVideoInBrowser', {}) ?? 'Otvori video u pregledaču';
  @override
  String get failedToLoadItemData =>
      TranslationOverrides.string(_root.$meta, 'media.video.failedToLoadItemData', {}) ?? 'Učitavanje podataka o stavci nije uspelo';
  @override
  String get loadingItemData => TranslationOverrides.string(_root.$meta, 'media.video.loadingItemData', {}) ?? 'Učitavanje podataka o stavci…';
  @override
  String get retry => TranslationOverrides.string(_root.$meta, 'media.video.retry', {}) ?? 'Pokušaj ponovo';
  @override
  String get openFileInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openFileInBrowser', {}) ?? 'Otvori datoteku u pregledaču';
  @override
  String get openPostInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openPostInBrowser', {}) ?? 'Otvori objavu u pregledaču';
  @override
  String get currentlyChecking => TranslationOverrides.string(_root.$meta, 'media.video.currentlyChecking', {}) ?? 'Trenutno se proverava:';
  @override
  String unknownFileFormat({required String fileExt}) =>
      TranslationOverrides.string(_root.$meta, 'media.video.unknownFileFormat', {'fileExt': fileExt}) ??
      'Nepoznat format datoteke (.${fileExt}), dodirnite ovde da biste otvorili u pregledaču';
}

// Path: preview.error
class _Translations$preview$error$sr_RS extends Translations$preview$error$en {
  _Translations$preview$error$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get noResults => TranslationOverrides.string(_root.$meta, 'preview.error.noResults', {}) ?? 'Nema rezultata';
  @override
  String get noResultsSubtitle =>
      TranslationOverrides.string(_root.$meta, 'preview.error.noResultsSubtitle', {}) ??
      'Promenite upit za pretragu ili dodirnite da biste pokušali ponovo';
  @override
  String get reachedEnd => TranslationOverrides.string(_root.$meta, 'preview.error.reachedEnd', {}) ?? 'Stigli ste do kraja';
  @override
  String reachedEndSubtitle({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.reachedEndSubtitle', {'pageNum': pageNum}) ??
      'Učitane stranice: ${pageNum}\nDodirnite ovde da biste ponovo učitali poslednju stranicu';
  @override
  String loadingPage({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.loadingPage', {'pageNum': pageNum}) ?? 'Učitavanje stranice #${pageNum}…';
  @override
  String startedAgo({required num seconds}) =>
      TranslationOverrides.plural(_root.$meta, 'preview.error.startedAgo', {'seconds': seconds}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
        seconds,
        one: 'Započeto pre ${seconds} sekundu',
        few: 'Započeto pre ${seconds} sekunde',
        other: 'Započeto pre ${seconds} sekundi',
      );
  @override
  String get tapToRetryIfStuck =>
      TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetryIfStuck', {}) ??
      'Dodirnite da biste pokušali ponovo ako zahtev deluje zaglavljeno ili predugo traje';
  @override
  String errorLoadingPage({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.errorLoadingPage', {'pageNum': pageNum}) ??
      'Greška pri učitavanju stranice #${pageNum}';
  @override
  String get errorWithMessage =>
      TranslationOverrides.string(_root.$meta, 'preview.error.errorWithMessage', {}) ?? 'Dodirnite ovde da biste pokušali ponovo';
  @override
  String get errorNoResultsLoaded =>
      TranslationOverrides.string(_root.$meta, 'preview.error.errorNoResultsLoaded', {}) ?? 'Greška, nijedan rezultat nije učitan';
  @override
  String get tapToRetry => TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetry', {}) ?? 'Dodirnite ovde da biste pokušali ponovo';
}

// Path: settings.interface.previewQualityValues
class _Translations$settings$interface$previewQualityValues$sr_RS extends Translations$settings$interface$previewQualityValues$en {
  _Translations$settings$interface$previewQualityValues$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get thumbnail => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.thumbnail', {}) ?? 'Minijatura';
  @override
  String get sample => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.sample', {}) ?? 'Umanjena slika';
}

// Path: settings.interface.previewDisplayModeValues
class _Translations$settings$interface$previewDisplayModeValues$sr_RS extends Translations$settings$interface$previewDisplayModeValues$en {
  _Translations$settings$interface$previewDisplayModeValues$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get square => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.square', {}) ?? 'Kvadrat';
  @override
  String get rectangle => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.rectangle', {}) ?? 'Pravougaonik';
  @override
  String get staggered =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.staggered', {}) ?? 'Stepenasti raspored';
}

// Path: settings.interface.appModeValues
class _Translations$settings$interface$appModeValues$sr_RS extends Translations$settings$interface$appModeValues$en {
  _Translations$settings$interface$appModeValues$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get desktop => TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.desktop', {}) ?? 'Za računar';
  @override
  String get mobile => TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.mobile', {}) ?? 'Mobilni';
}

// Path: settings.interface.handSideValues
class _Translations$settings$interface$handSideValues$sr_RS extends Translations$settings$interface$handSideValues$en {
  _Translations$settings$interface$handSideValues$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get left => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.left', {}) ?? 'Levo';
  @override
  String get right => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.right', {}) ?? 'Desno';
}

// Path: settings.viewer.imageQualityValues
class _Translations$settings$viewer$imageQualityValues$sr_RS extends Translations$settings$viewer$imageQualityValues$en {
  _Translations$settings$viewer$imageQualityValues$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get sample => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.sample', {}) ?? 'Umanjena slika';
  @override
  String get fullRes => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.fullRes', {}) ?? 'Original';
}

// Path: settings.viewer.scrollDirectionValues
class _Translations$settings$viewer$scrollDirectionValues$sr_RS extends Translations$settings$viewer$scrollDirectionValues$en {
  _Translations$settings$viewer$scrollDirectionValues$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get horizontal => TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.horizontal', {}) ?? 'Horizontalno';
  @override
  String get vertical => TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.vertical', {}) ?? 'Vertikalno';
}

// Path: settings.viewer.toolbarPositionValues
class _Translations$settings$viewer$toolbarPositionValues$sr_RS extends Translations$settings$viewer$toolbarPositionValues$en {
  _Translations$settings$viewer$toolbarPositionValues$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get top => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.top', {}) ?? 'Gore';
  @override
  String get bottom => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.bottom', {}) ?? 'Dole';
}

// Path: settings.viewer.buttonPositionValues
class _Translations$settings$viewer$buttonPositionValues$sr_RS extends Translations$settings$viewer$buttonPositionValues$en {
  _Translations$settings$viewer$buttonPositionValues$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get disabled => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.disabled', {}) ?? 'Onemogućeno';
  @override
  String get left => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.left', {}) ?? 'Levo';
  @override
  String get right => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.right', {}) ?? 'Desno';
}

// Path: settings.viewer.shareActionValues
class _Translations$settings$viewer$shareActionValues$sr_RS extends Translations$settings$viewer$shareActionValues$en {
  _Translations$settings$viewer$shareActionValues$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get ask => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.ask', {}) ?? 'Pitaj';
  @override
  String get postUrl => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrl', {}) ?? 'URL objave';
  @override
  String get postUrlWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrlWithTags', {}) ?? 'URL objave sa oznakama';
  @override
  String get fileUrl => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrl', {}) ?? 'URL datoteke';
  @override
  String get fileUrlWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrlWithTags', {}) ?? 'URL datoteke sa oznakama';
  @override
  String get file => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.file', {}) ?? 'Datoteka';
  @override
  String get fileWithTags => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileWithTags', {}) ?? 'Datoteka sa oznakama';
  @override
  String get hydrus => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.hydrus', {}) ?? 'Hydrus';
}

// Path: settings.video.cacheModes
class _Translations$settings$video$cacheModes$sr_RS extends Translations$settings$video$cacheModes$en {
  _Translations$settings$video$cacheModes$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.title', {}) ?? 'Režimi keširanja video zapisa';
  @override
  String get streamMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamMode', {}) ??
      '- Strimovanje - Ne keširaj, započni reprodukciju što je pre moguće';
  @override
  String get cacheMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheMode', {}) ??
      '- Keširanje - Čuva datoteku u skladištu uređaja, reprodukuje tek kada se preuzimanje završi';
  @override
  String get streamCacheMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamCacheMode', {}) ??
      '- Strimovanje+keširanje - Kombinacija oba, ali trenutno dovodi do dvostrukog preuzimanja';
  @override
  String get cacheNote =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheNote', {}) ??
      '[Napomena]: Video zapisi će se keširati samo ako je opcija \'Keširaj medije\' omogućena.';
  @override
  String get desktopWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.desktopWarning', {}) ??
      '[Upozorenje]: Na računaru režim strimovanja može raditi nepravilno za neke Booru sajtove.';
}

// Path: settings.video.cacheModeValues
class _Translations$settings$video$cacheModeValues$sr_RS extends Translations$settings$video$cacheModeValues$en {
  _Translations$settings$video$cacheModeValues$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get stream => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.stream', {}) ?? 'Strimovanje';
  @override
  String get cache => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.cache', {}) ?? 'Keširanje';
  @override
  String get streamCache => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.streamCache', {}) ?? 'Strimovanje+keširanje';
}

// Path: settings.video.videoBackendModeValues
class _Translations$settings$video$videoBackendModeValues$sr_RS extends Translations$settings$video$videoBackendModeValues$en {
  _Translations$settings$video$videoBackendModeValues$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get normal => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.normal', {}) ?? 'Podrazumevano';
  @override
  String get mpv => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mpv', {}) ?? 'MPV';
  @override
  String get mdk => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mdk', {}) ?? 'MDK';
}

// Path: media.loading.stopReasons
class _Translations$media$loading$stopReasons$sr_RS extends Translations$media$loading$stopReasons$en {
  _Translations$media$loading$stopReasons$sr_RS._(TranslationsSrRs root) : this._root = root, super.internal(root);

  final TranslationsSrRs _root; // ignore: unused_field

  // Translations
  @override
  String get stoppedByUser => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.stoppedByUser', {}) ?? 'Zaustavio korisnik';
  @override
  String get loadingError => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.loadingError', {}) ?? 'Greška pri učitavanju';
  @override
  String get fileIsTooBig => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.fileIsTooBig', {}) ?? 'Datoteka je prevelika';
  @override
  String get hiddenByFilters => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.hiddenByFilters', {}) ?? 'Sakriveno filterima:';
  @override
  String get videoError => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.videoError', {}) ?? 'Greška video zapisa';
}

/// The flat map containing all translations for locale <sr-RS>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsSrRs {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
          'locale' => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'sr-RS',
          'localeName' => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'Srpski',
          'appName' => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher',
          'error' => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Greška',
          'errorExclamation' => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'Greška!',
          'success' => TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Uspešno',
          'successExclamation' => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? 'Uspešno!',
          'cancel' => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Otkaži',
          'kReturn' => TranslationOverrides.string(_root.$meta, 'kReturn', {}) ?? 'Nazad',
          'later' => TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Kasnije',
          'close' => TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Zatvori',
          'ok' => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'U redu',
          'yes' => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Da',
          'no' => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'Ne',
          'pleaseWait' => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Sačekajte…',
          'show' => TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Prikaži',
          'hide' => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Sakrij',
          'enable' => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'Omogući',
          'disable' => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Onemogući',
          'add' => TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Dodaj',
          'exclude' => TranslationOverrides.string(_root.$meta, 'exclude', {}) ?? 'Izuzmi',
          'edit' => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? 'Uredi',
          'remove' => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? 'Ukloni',
          'save' => TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Sačuvaj',
          'delete' => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? 'Obriši',
          'confirm' => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? 'Potvrdi',
          'retry' => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? 'Pokušaj ponovo',
          'clear' => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? 'Očisti',
          'copy' => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Kopiraj',
          'copied' => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Kopirano',
          'copiedToClipboard' => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? 'Kopirano u privremenu memoriju',
          'nothingFound' => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? 'Ništa nije pronađeno',
          'paste' => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Nalepi',
          'copyErrorText' => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Kopiraj grešku',
          'booru' => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru',
          'goToSettings' => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'Idi u podešavanja',
          'thisMayTakeSomeTime' => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'Ovo može potrajati…',
          'exitTheAppQuestion' => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? 'Izaći iz aplikacije?',
          'closeTheApp' => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Zatvori aplikaciju',
          'invalidUrl' => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'Nevažeći URL!',
          'clipboardIsEmpty' => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'Privremena memorija je prazna!',
          'failedToOpenLink' => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'Otvaranje veze nije uspelo',
          'apiKey' => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'API ključ',
          'userId' => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'ID korisnika',
          'login' => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Korisničko ime',
          'password' => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Lozinka',
          'pause' => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Pauziraj',
          'resume' => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Nastavi',
          'discord' => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord',
          'visitOurDiscord' => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Posetite naš Discord server',
          'item' => TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Stavka',
          'select' => TranslationOverrides.string(_root.$meta, 'select', {}) ?? 'Izaberi',
          'selectAll' => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Izaberi sve',
          'reset' => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'Resetuj',
          'open' => TranslationOverrides.string(_root.$meta, 'open', {}) ?? 'Otvori',
          'openInNewTab' => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? 'Otvori u novoj kartici',
          'move' => TranslationOverrides.string(_root.$meta, 'move', {}) ?? 'Premesti',
          'shuffle' => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? 'Promešaj',
          'sort' => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? 'Sortiraj',
          'go' => TranslationOverrides.string(_root.$meta, 'go', {}) ?? 'Idi',
          'search' => TranslationOverrides.string(_root.$meta, 'search', {}) ?? 'Pretraži',
          'filter' => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? 'Filter',
          'or' => TranslationOverrides.string(_root.$meta, 'or', {}) ?? 'Ili (~)',
          'page' => TranslationOverrides.string(_root.$meta, 'page', {}) ?? 'Stranica',
          'pageNumber' => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? 'Stranica #',
          'tags' => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'Oznake',
          'type' => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'Tip',
          'name' => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Naziv',
          'address' => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'Adresa',
          'username' => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'Korisničko ime',
          'favourites' => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'Omiljeno',
          'downloads' => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'Preuzimanja',
          'secondsShort' => TranslationOverrides.string(_root.$meta, 'secondsShort', {}) ?? 's',
          'minutesShort' => TranslationOverrides.string(_root.$meta, 'minutesShort', {}) ?? 'm',
          'hoursShort' => TranslationOverrides.string(_root.$meta, 'hoursShort', {}) ?? 'h',
          'daysShort' => TranslationOverrides.string(_root.$meta, 'daysShort', {}) ?? 'd',
          'leaveThisPageQuestion' => TranslationOverrides.string(_root.$meta, 'leaveThisPageQuestion', {}) ?? 'Napustiti ovu stranicu?',
          'pageWillCloseAutomatically' =>
            TranslationOverrides.string(_root.$meta, 'pageWillCloseAutomatically', {}) ?? 'Ova stranica će se automatski zatvoriti',
          'stay' => TranslationOverrides.string(_root.$meta, 'stay', {}) ?? 'Ostani',
          'leaveNow' => TranslationOverrides.string(_root.$meta, 'leaveNow', {}) ?? 'Napusti odmah',
          'validationErrors.required' => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Unesite vrednost',
          'validationErrors.invalid' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Unesite važeću vrednost',
          'validationErrors.invalidNumber' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? 'Unesite broj',
          'validationErrors.invalidNumericValue' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? 'Unesite važeću brojčanu vrednost',
          'validationErrors.tooSmall' => ({
            required double min,
          }) => TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Unesite vrednost veću od ${min}',
          'validationErrors.tooBig' => ({
            required double max,
          }) => TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Unesite vrednost manju od ${max}',
          'validationErrors.rangeError' =>
            ({required double min, required double max}) =>
                TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ??
                'Unesite vrednost između ${min} i ${max}',
          'validationErrors.greaterThanOrEqualZero' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? 'Unesite vrednost veću ili jednaku 0',
          'validationErrors.lessThan4' => TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? 'Unesite vrednost manju od 4',
          'validationErrors.biggerThan100' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? 'Unesite vrednost veću od 100',
          'validationErrors.moreThan4ColumnsWarning' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ??
                'Korišćenje više od 4 kolone može uticati na performanse',
          'validationErrors.moreThan8ColumnsWarning' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ??
                'Korišćenje više od 8 kolona može uticati na performanse',
          'init.initError' => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Greška pri inicijalizaciji!',
          'init.settingUpProxy' => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Podešavanje proksija…',
          'init.loadingDatabase' => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Učitavanje baze podataka…',
          'init.loadingBoorus' => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Učitavanje booru sajtova…',
          'init.loadingTags' => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Učitavanje oznaka…',
          'init.restoringTabs' => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Vraćanje kartica…',
          'permissions.localNetworkRequired' =>
            TranslationOverrides.string(_root.$meta, 'permissions.localNetworkRequired', {}) ??
                'Za otvaranje ove adrese potreban je pristup lokalnoj mreži. Odobrite dozvolu „Uređaji u blizini“, pa pokušajte ponovo.',
          'permissions.localNetworkExplanationTitle' =>
            TranslationOverrides.string(_root.$meta, 'permissions.localNetworkExplanationTitle', {}) ?? 'Pristup lokalnoj mreži',
          'permissions.localNetworkExplanation' => TranslationOverrides.string(_root.$meta, 'permissions.localNetworkExplanation', {}) ?? 'Za otvaranje lokalnih booru servera ili sinhronizaciju sa drugim uređajem, aplikaciji je potreban pristup vašoj lokalnoj mreži. Android će prikazati zahtev za dozvolu „Uređaji u blizini“.',
          'permissions.noAccessToCustomStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ??
                'Nema pristupa prilagođenom direktorijumu za skladištenje',
          'permissions.pleaseSetStorageDirectoryAgain' =>
            TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ??
                'Ponovo postavite direktorijum za skladištenje kako biste aplikaciji omogućili pristup',
          'permissions.currentPath' => ({
            required String path,
          }) => TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? 'Trenutna putanja: ${path}',
          'permissions.setDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? 'Postavi direktorijum',
          'permissions.currentlyNotAvailableForThisPlatform' =>
            TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ?? 'Nije dostupno na ovoj platformi',
          'permissions.resetDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? 'Resetuj direktorijum',
          'permissions.afterResetFilesWillBeSavedToDefaultDirectory' =>
            TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ??
                'Nakon resetovanja, datoteke će se čuvati u podrazumevanom direktorijumu',
          'authentication.pleaseAuthenticateToUseTheApp' =>
            TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ??
                'Potvrdite identitet da biste koristili aplikaciju',
          'authentication.noBiometricHardwareAvailable' =>
            TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? 'Biometrijski hardver nije dostupan',
          'authentication.temporaryLockout' =>
            TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? 'Privremeno zaključavanje',
          'authentication.somethingWentWrong' =>
            ({required String error}) =>
                TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ??
                'Došlo je do greške tokom autentifikacije: ${error}',
          'searchHandler.removedLastTab' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? 'Poslednja kartica je uklonjena',
          'searchHandler.resettingSearchToDefaultTags' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? 'Vraćanje na podrazumevane oznake',
          'searchHandler.uoh' => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'UOOOOOOOHHH',
          'searchHandler.ratingsChanged' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? 'Kategorije sadržaja su promenjene',
          'searchHandler.ratingsChangedMessage' =>
            ({required String booruType}) =>
                TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
                'Na ${booruType} [rating:safe] je sada zamenjen sa [rating:general] i [rating:sensitive]',
          'searchHandler.appFixedRatingAutomatically' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ??
                'Kategorija sadržaja je automatski ispravljena. Koristite ispravnu kategoriju sadržaja u budućim pretragama',
          'searchHandler.tabsRestored' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? 'Kartice su vraćene',
          'searchHandler.restoredTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
                  count,
                  one: 'Vraćena je ${count} kartica iz prethodne sesije',
                  few: 'Vraćene su ${count} kartice iz prethodne sesije',
                  other: 'Vraćeno je ${count} kartica iz prethodne sesije',
                ),
          'searchHandler.someRestoredTabsHadIssues' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ??
                'Neke vraćene kartice su imale nepoznate booru sajtove ili neispravne znakove.',
          'searchHandler.theyWereSetToDefaultOrIgnored' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ??
                'Postavljene su na podrazumevane ili su ignorisane.',
          'searchHandler.listOfBrokenTabs' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? 'Spisak neispravnih kartica:',
          'searchHandler.tabsMerged' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? 'Kartice su spojene',
          'searchHandler.addedTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
                  count,
                  one: 'Dodata je ${count} nova kartica',
                  few: 'Dodate su ${count} nove kartice',
                  other: 'Dodato je ${count} novih kartica',
                ),
          'searchHandler.tabsReplaced' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? 'Kartice su zamenjene',
          'searchHandler.receivedTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
                  count,
                  one: 'Primljena je ${count} kartica',
                  few: 'Primljene su ${count} kartice',
                  other: 'Primljeno je ${count} kartica',
                ),
          'snatcher.title' => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Preuzimanje',
          'snatcher.snatchingHistory' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'Istorija preuzimanja',
          'snatcher.enterTags' => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'Unesite oznake',
          'snatcher.amount' => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? 'Količina',
          'snatcher.amountOfFilesToSnatch' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? 'Broj datoteka za preuzimanje',
          'snatcher.delayInMs' => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? 'Pauza (u ms)',
          'snatcher.delayBetweenEachDownload' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? 'Pauza između svakog preuzimanja',
          'snatcher.snatchFiles' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? 'Preuzmi datoteke',
          'snatcher.itemWasAlreadySnatched' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? 'Stavka je već ranije preuzeta',
          'snatcher.failedToSnatchItem' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? 'Preuzimanje stavke nije uspelo',
          'snatcher.itemWasCancelled' => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? 'Stavka je otkazana',
          'snatcher.startingNextQueueItem' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? 'Pokretanje sledeće stavke u redu…',
          'snatcher.itemsSnatched' => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? 'Preuzete stavke',
          'snatcher.snatchedCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
                  count,
                  one: 'Preuzeta: ${count} stavka',
                  few: 'Preuzete: ${count} stavke',
                  other: 'Preuzeto: ${count} stavki',
                ),
          'snatcher.filesAlreadySnatched' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
                  count,
                  one: '${count} datoteka je već preuzeta',
                  few: '${count} datoteke su već preuzete',
                  other: '${count} datoteka je već preuzeto',
                ),
          'snatcher.failedToSnatchFiles' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
                  count,
                  one: 'Preuzimanje ${count} datoteke nije uspelo',
                  few: 'Preuzimanje ${count} datoteke nije uspelo',
                  other: 'Preuzimanje ${count} datoteka nije uspelo',
                ),
          'snatcher.cancelledFiles' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
                  count,
                  one: 'Otkazana je ${count} datoteka',
                  few: 'Otkazane su ${count} datoteke',
                  other: 'Otkazano je ${count} datoteka',
                ),
          'snatcher.snatchingImages' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? 'Preuzimanje slika',
          'snatcher.doNotCloseApp' => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? 'Ne zatvarajte aplikaciju!',
          'snatcher.addedItemToQueue' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? 'Stavka je dodata u red za preuzimanje',
          'snatcher.addedItemsToQueue' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
                  count,
                  one: 'Dodata je ${count} stavka u red za preuzimanje',
                  few: 'Dodate su ${count} stavke u red za preuzimanje',
                  other: 'Dodato je ${count} stavki u red za preuzimanje',
                ),
          'multibooru.title' => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? 'Multibooru',
          'multibooru.multibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Multibooru režim',
          'multibooru.multibooruRequiresAtLeastTwoBoorus' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ??
                'Zahteva najmanje 2 konfigurisana booru sajta',
          'multibooru.selectSecondaryBoorus' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Izaberite dodatne booru sajtove:',
          'multibooru.akaMultibooruMode' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? 'odnosno Multibooru režim',
          'multibooru.labelSecondaryBoorusToInclude' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? 'Dodatni booru sajtovi za uključivanje',
          'hydrus.importError' => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'Došlo je do greške prilikom uvoza u Hydrus',
          'hydrus.apiPermissionsRequired' =>
            TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ??
                'Možda niste dali odgovarajuće API dozvole, ovo se može izmeniti u Review Services',
          'hydrus.addTagsToFile' => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? 'Dodaj oznake datoteci',
          'hydrus.addUrls' => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'Dodaj URL-ove',
          'tabs.tab' => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? 'Kartica',
          'tabs.addBoorusInSettings' =>
            TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? 'Dodajte booru sajtove u podešavanjima',
          'tabs.selectABooru' => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? 'Izaberite Booru',
          'tabs.secondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? 'Dodatni booru sajtovi',
          'tabs.addNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? 'Dodaj novu karticu',
          'tabs.selectABooruOrLeaveEmpty' =>
            TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? 'Izaberite booru ili ostavite prazno',
          'tabs.addPosition' => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? 'Pozicija dodavanja',
          'tabs.addModePrevTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? 'Prethodna kartica',
          'tabs.addModeNextTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? 'Sledeća kartica',
          'tabs.addModeListEnd' => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? 'Kraj liste',
          'tabs.usedQuery' => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? 'Korišćeni upit',
          'tabs.queryModeDefault' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? 'Podrazumevano',
          'tabs.queryModeCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? 'Trenutno',
          'tabs.queryModeCustom' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? 'Prilagođeno',
          'tabs.customQuery' => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? 'Prilagođeni upit',
          'tabs.empty' => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '[prazno]',
          'tabs.addSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? 'Dodaj dodatne booru sajtove',
          'tabs.keepSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? 'Zadrži dodatne booru sajtove',
          'tabs.startFromCustomPageNumber' =>
            TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? 'Započni od prilagođenog broja stranice',
          'tabs.switchToNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? 'Prebaci na novu karticu',
          'tabs.add' => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? 'Dodaj',
          'tabs.tabsManager' => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? 'Upravljač karticama',
          'tabs.selectMode' => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? 'Režim izbora',
          'tabs.sortMode' => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? 'Sortiraj kartice',
          'tabs.help' => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? 'Pomoć',
          'tabs.deleteTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? 'Obriši kartice',
          'tabs.deleteDuplicateTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteDuplicateTabs', {}) ?? 'Obriši duplirane kartice',
          'tabs.deleteDuplicateTabsQuestion' =>
            TranslationOverrides.string(_root.$meta, 'tabs.deleteDuplicateTabsQuestion', {}) ??
                'Pronađene su duplirane kartice. Izaberite kartice koje želite da zadržite u svakoj grupi:',
          'tabs.keepFirstDuplicateTabs' => TranslationOverrides.string(_root.$meta, 'tabs.keepFirstDuplicateTabs', {}) ?? 'Zadrži prvu',
          'tabs.keepLastDuplicateTabs' => TranslationOverrides.string(_root.$meta, 'tabs.keepLastDuplicateTabs', {}) ?? 'Zadrži poslednju',
          'tabs.skipDuplicateTabDelete' => TranslationOverrides.string(_root.$meta, 'tabs.skipDuplicateTabDelete', {}) ?? 'Preskoči',
          'tabs.shuffleTabs' => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? 'Promešaj kartice',
          'tabs.tabRandomlyShuffled' => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? 'Kartice su nasumično promešane',
          'tabs.tabOrderSaved' => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? 'Redosled kartica je sačuvan',
          'tabs.scrollToCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? 'Pomeri do trenutne kartice',
          'tabs.scrollToTop' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? 'Pomeri na vrh',
          'tabs.scrollToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? 'Pomeri na dno',
          'tabs.filterTabsByBooru' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? 'Filtriraj po booru sajtu, statusu, duplikatima…',
          'tabs.scrolling' => TranslationOverrides.string(_root.$meta, 'tabs.scrolling', {}) ?? 'Pomeranje:',
          'tabs.sorting' => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? 'Sortiranje:',
          'tabs.defaultTabsOrder' => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? 'Podrazumevani redosled kartica',
          'tabs.sortAlphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? 'Sortiraj abecedno',
          'tabs.sortAlphabeticallyReversed' =>
            TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? 'Sortiraj abecedno (obrnuto)',
          'tabs.sortByBooruName' => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? 'Sortiraj po imenu booru sajta abecedno',
          'tabs.sortByBooruNameReversed' =>
            TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ?? 'Sortiraj po imenu booru sajta abecedno (obrnuto)',
          'tabs.longPressSortToSave' =>
            TranslationOverrides.string(_root.$meta, 'tabs.longPressSortToSave', {}) ??
                'Dugo pritisnite dugme za sortiranje da biste sačuvali trenutni redosled',
          'tabs.select' => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? 'Izbor:',
          'tabs.toggleSelectMode' => TranslationOverrides.string(_root.$meta, 'tabs.toggleSelectMode', {}) ?? 'Uključi/isključi režim izbora',
          'tabs.onTheBottomOfPage' => TranslationOverrides.string(_root.$meta, 'tabs.onTheBottomOfPage', {}) ?? 'Na dnu stranice: ',
          'tabs.selectDeselectAll' => TranslationOverrides.string(_root.$meta, 'tabs.selectDeselectAll', {}) ?? 'Izaberi/poništi izbor svih kartica',
          'tabs.deleteSelectedTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? 'Obriši izabrane kartice',
          'tabs.longPressToMove' =>
            TranslationOverrides.string(_root.$meta, 'tabs.longPressToMove', {}) ?? 'Dugo pritisnite karticu da biste je premestili',
          'tabs.numbersInBottomRight' =>
            TranslationOverrides.string(_root.$meta, 'tabs.numbersInBottomRight', {}) ?? 'Brojevi u donjem desnom uglu kartice:',
          'tabs.firstNumberTabIndex' =>
            TranslationOverrides.string(_root.$meta, 'tabs.firstNumberTabIndex', {}) ?? 'Prvi broj - indeks kartice u podrazumevanom redosledu liste',
          'tabs.secondNumberTabIndex' =>
            TranslationOverrides.string(_root.$meta, 'tabs.secondNumberTabIndex', {}) ??
                'Drugi broj - indeks kartice u trenutnom redosledu liste, prikazuje se kada je filtriranje/sortiranje aktivno',
          'tabs.specialFilters' => TranslationOverrides.string(_root.$meta, 'tabs.specialFilters', {}) ?? 'Specijalni filteri:',
          'tabs.loadedFilter' =>
            TranslationOverrides.string(_root.$meta, 'tabs.loadedFilter', {}) ?? '«Učitano» - prikaži kartice koje imaju učitane stavke',
          'tabs.notLoadedFilter' =>
            TranslationOverrides.string(_root.$meta, 'tabs.notLoadedFilter', {}) ??
                '«Nije učitano» - prikaži kartice koje nisu učitane i/ili imaju nula stavki',
          'tabs.notLoadedItalic' =>
            TranslationOverrides.string(_root.$meta, 'tabs.notLoadedItalic', {}) ?? 'Kartice koje nisu učitane imaju tekst u kurzivu',
          'tabs.noTabsFound' => TranslationOverrides.string(_root.$meta, 'tabs.noTabsFound', {}) ?? 'Nema pronađenih kartica',
          'tabs.copy' => TranslationOverrides.string(_root.$meta, 'tabs.copy', {}) ?? 'Kopiraj',
          'tabs.moveAction' => TranslationOverrides.string(_root.$meta, 'tabs.moveAction', {}) ?? 'Premesti',
          'tabs.remove' => TranslationOverrides.string(_root.$meta, 'tabs.remove', {}) ?? 'Ukloni',
          'tabs.shuffle' => TranslationOverrides.string(_root.$meta, 'tabs.shuffle', {}) ?? 'Promešaj',
          'tabs.sort' => TranslationOverrides.string(_root.$meta, 'tabs.sort', {}) ?? 'Sortiraj',
          'tabs.shuffleTabsQuestion' =>
            TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabsQuestion', {}) ?? 'Nasumično promešati redosled kartica?',
          'tabs.saveTabsInCurrentOrder' =>
            TranslationOverrides.string(_root.$meta, 'tabs.saveTabsInCurrentOrder', {}) ?? 'Sačuvati kartice u trenutnom redosledu sortiranja?',
          'tabs.byBooru' => TranslationOverrides.string(_root.$meta, 'tabs.byBooru', {}) ?? 'Po booru sajtu',
          'tabs.alphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.alphabetically', {}) ?? 'Abecedno',
          'tabs.reversed' => TranslationOverrides.string(_root.$meta, 'tabs.reversed', {}) ?? '(obrnuto)',
          'tabs.areYouSureDeleteTabs' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'tabs.areYouSureDeleteTabs', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
                  count,
                  one: 'Da li ste sigurni da želite da obrišete ${count} karticu?',
                  few: 'Da li ste sigurni da želite da obrišete ${count} kartice?',
                  other: 'Da li ste sigurni da želite da obrišete ${count} kartica?',
                ),
          'tabs.filters.loaded' => TranslationOverrides.string(_root.$meta, 'tabs.filters.loaded', {}) ?? 'Učitano',
          'tabs.filters.tagType' => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagType', {}) ?? 'Tip oznake',
          'tabs.filters.multibooru' => TranslationOverrides.string(_root.$meta, 'tabs.filters.multibooru', {}) ?? 'Multibooru',
          'tabs.filters.duplicates' => TranslationOverrides.string(_root.$meta, 'tabs.filters.duplicates', {}) ?? 'Duplikati',
          'tabs.filters.checkDuplicatesOnSameBooru' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.checkDuplicatesOnSameBooru', {}) ?? 'Proveri duplikate na istom Booru-u',
          'tabs.filters.emptySearchQuery' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? 'Prazan upit za pretragu',
          'tabs.filters.title' => TranslationOverrides.string(_root.$meta, 'tabs.filters.title', {}) ?? 'Filteri kartica',
          'tabs.filters.all' => TranslationOverrides.string(_root.$meta, 'tabs.filters.all', {}) ?? 'Sve',
          'tabs.filters.notLoaded' => TranslationOverrides.string(_root.$meta, 'tabs.filters.notLoaded', {}) ?? 'Nije učitano',
          'tabs.filters.enabled' => TranslationOverrides.string(_root.$meta, 'tabs.filters.enabled', {}) ?? 'Omogućeno',
          'tabs.filters.disabled' => TranslationOverrides.string(_root.$meta, 'tabs.filters.disabled', {}) ?? 'Onemogućeno',
          'tabs.filters.willAlsoEnableSorting' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.willAlsoEnableSorting', {}) ?? 'Takođe će omogućiti sortiranje',
          'tabs.filters.tagTypeFilterHelp' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.tagTypeFilterHelp', {}) ??
                'Filtriraj kartice koje sadrže barem jednu oznaku izabranog tipa',
          'tabs.filters.any' => TranslationOverrides.string(_root.$meta, 'tabs.filters.any', {}) ?? 'Bilo koji',
          'tabs.filters.apply' => TranslationOverrides.string(_root.$meta, 'tabs.filters.apply', {}) ?? 'Primeni',
          'tabs.move.moveToTop' => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToTop', {}) ?? 'Premesti na vrh',
          'tabs.move.moveToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToBottom', {}) ?? 'Premesti na dno',
          'tabs.move.tabNumber' => TranslationOverrides.string(_root.$meta, 'tabs.move.tabNumber', {}) ?? 'Broj kartice',
          'tabs.move.invalidTabNumber' => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidTabNumber', {}) ?? 'Nevažeći broj kartice',
          'tabs.move.invalidInput' => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidInput', {}) ?? 'Nevažeći unos',
          'tabs.move.outOfRange' => TranslationOverrides.string(_root.$meta, 'tabs.move.outOfRange', {}) ?? 'Van opsega',
          'tabs.move.pleaseEnterValidTabNumber' =>
            TranslationOverrides.string(_root.$meta, 'tabs.move.pleaseEnterValidTabNumber', {}) ?? 'Unesite važeći broj kartice',
          'tabs.move.moveTo' =>
            ({required String formattedNumber}) =>
                TranslationOverrides.string(_root.$meta, 'tabs.move.moveTo', {'formattedNumber': formattedNumber}) ??
                'Premesti na #${formattedNumber}',
          'tabs.move.preview' => TranslationOverrides.string(_root.$meta, 'tabs.move.preview', {}) ?? 'Pregled:',
          'history.searchHistory' => TranslationOverrides.string(_root.$meta, 'history.searchHistory', {}) ?? 'Istorija pretrage',
          'history.searchHistoryIsEmpty' =>
            TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsEmpty', {}) ?? 'Istorija pretrage je prazna',
          'history.searchHistoryIsDisabled' =>
            TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsDisabled', {}) ?? 'Istorija pretrage je onemogućena',
          'history.searchHistoryRequiresDatabase' =>
            TranslationOverrides.string(_root.$meta, 'history.searchHistoryRequiresDatabase', {}) ??
                'Omogućite bazu podataka u podešavanjima za istoriju pretrage',
          'history.lastSearch' => ({
            required String search,
          }) => TranslationOverrides.string(_root.$meta, 'history.lastSearch', {'search': search}) ?? 'Poslednja pretraga: ${search}',
          'history.lastSearchWithDate' => ({
            required String date,
          }) => TranslationOverrides.string(_root.$meta, 'history.lastSearchWithDate', {'date': date}) ?? 'Poslednja pretraga: ${date}',
          'history.unknownBooruType' => TranslationOverrides.string(_root.$meta, 'history.unknownBooruType', {}) ?? 'Nepoznat tip booru sajta!',
          'history.unknownBooru' => ({
            required String name,
            required String type,
          }) => TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ?? 'Nepoznat booru (${name}-${type})',
          'history.open' => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? 'Otvori',
          'history.openInNewTab' => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? 'Otvori u novoj kartici',
          'history.removeFromFavourites' => TranslationOverrides.string(_root.$meta, 'history.removeFromFavourites', {}) ?? 'Ukloni iz omiljenih',
          'history.setAsFavourite' => TranslationOverrides.string(_root.$meta, 'history.setAsFavourite', {}) ?? 'Postavi kao omiljeno',
          'history.copy' => TranslationOverrides.string(_root.$meta, 'history.copy', {}) ?? 'Kopiraj',
          'history.delete' => TranslationOverrides.string(_root.$meta, 'history.delete', {}) ?? 'Obriši',
          'history.deleteHistoryEntries' => TranslationOverrides.string(_root.$meta, 'history.deleteHistoryEntries', {}) ?? 'Obriši stavke istorije',
          'history.deleteItemsConfirm' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'history.deleteItemsConfirm', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
                  count,
                  one: 'Da li ste sigurni da želite da obrišete ${count} stavku?',
                  few: 'Da li ste sigurni da želite da obrišete ${count} stavke?',
                  other: 'Da li ste sigurni da želite da obrišete ${count} stavki?',
                ),
          'history.clearSelection' => TranslationOverrides.string(_root.$meta, 'history.clearSelection', {}) ?? 'Poništi izbor',
          'history.deleteItems' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'history.deleteItems', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
                  count,
                  one: 'Obriši ${count} stavku',
                  few: 'Obriši ${count} stavke',
                  other: 'Obriši ${count} stavki',
                ),
          'webview.title' => TranslationOverrides.string(_root.$meta, 'webview.title', {}) ?? 'Webview',
          'webview.notSupportedOnDevice' =>
            TranslationOverrides.string(_root.$meta, 'webview.notSupportedOnDevice', {}) ?? 'Nije podržano na ovom uređaju',
          'webview.captcha' => TranslationOverrides.string(_root.$meta, 'webview.captcha', {}) ?? 'Captcha',
          'webview.captchaCheckDescription' =>
            TranslationOverrides.string(_root.$meta, 'webview.captchaCheckDescription', {}) ??
                'Otkrivena je moguća Captcha, rešite je i vratite se kada završite',
          'webview.captchaCompleted' => TranslationOverrides.string(_root.$meta, 'webview.captchaCompleted', {}) ?? 'Captcha je rešena',
          'webview.navigation.enterUrlLabel' => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterUrlLabel', {}) ?? 'Unesite URL',
          'webview.navigation.enterCustomUrl' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.enterCustomUrl', {}) ?? 'Unesite prilagođeni URL',
          'webview.navigation.navigateTo' => ({
            required String url,
          }) => TranslationOverrides.string(_root.$meta, 'webview.navigation.navigateTo', {'url': url}) ?? 'Idi na ${url}',
          'webview.navigation.listCookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.listCookies', {}) ?? 'Prikaži kolačiće',
          'webview.navigation.clearCookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.clearCookies', {}) ?? 'Obriši kolačiće',
          'webview.navigation.cookiesGone' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.cookiesGone', {}) ?? 'Bilo je kolačića. Sada su nestali',
          'webview.navigation.getFavicon' => TranslationOverrides.string(_root.$meta, 'webview.navigation.getFavicon', {}) ?? 'Preuzmi favicon',
          'webview.navigation.noFaviconFound' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noFaviconFound', {}) ?? 'Favicon nije pronađen',
          'webview.navigation.host' => TranslationOverrides.string(_root.$meta, 'webview.navigation.host', {}) ?? 'Host:',
          'webview.navigation.textAboveSelectable' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.textAboveSelectable', {}) ?? '(tekst iznad se može označiti)',
          'webview.navigation.copyUrl' => TranslationOverrides.string(_root.$meta, 'webview.navigation.copyUrl', {}) ?? 'Kopiraj URL',
          'webview.navigation.copiedUrlToClipboard' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.copiedUrlToClipboard', {}) ?? 'URL je kopiran u privremenu memoriju',
          'webview.navigation.cookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookies', {}) ?? 'Kolačići',
          'webview.navigation.favicon' => TranslationOverrides.string(_root.$meta, 'webview.navigation.favicon', {}) ?? 'Favicon',
          'webview.navigation.history' => TranslationOverrides.string(_root.$meta, 'webview.navigation.history', {}) ?? 'Istorija',
          'webview.navigation.noBackHistoryItem' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noBackHistoryItem', {}) ?? 'Nema prethodne stavke u istoriji',
          'webview.navigation.noForwardHistoryItem' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noForwardHistoryItem', {}) ?? 'Nema sledeće stavke u istoriji',
          'settings.title' => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Podešavanja',
          'settings.language.title' => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? 'Jezik',
          'settings.language.system' => TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? 'Sistemski',
          'settings.language.helpUsTranslate' =>
            TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? 'Pomozite nam u prevodu',
          'settings.language.visitForDetails' => TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ?? 'Posetite <a href=\'https://github.com/NO-ob/LoliSnatcher_Droid/blob/master/CONTRIBUTING.md#localization--translations\'>GitHub</a> za detalje ili dodirnite sliku ispod da biste otišli na POEditor',
          'settings.booru.title' => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Booru sajtovi i pretraga',
          'settings.booru.defaultTags' => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? 'Podrazumevane oznake',
          'settings.booru.itemsPerPage' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'Broj preuzetih stavki po stranici',
          'settings.booru.itemsPerPageTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'Neki booru sajtovi mogu ignorisati ovo',
          'settings.booru.itemsPerPagePlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPagePlaceholder', {}) ?? '10-100',
          'settings.booru.addBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Dodaj Booru konfiguraciju',
          'settings.booru.shareBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? 'Podeli Booru konfiguraciju',
          'settings.booru.shareBooruDialogMsgMobile' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
                'Podelite konfiguraciju za ${booruName} kao link.\n\nUključiti korisničko ime / API ključ?',
          'settings.booru.shareBooruDialogMsgDesktop' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
                'Kopirajte link konfiguracije za ${booruName} u privremenu memoriju.\n\nUključiti korisničko ime / API ključ?',
          'settings.booru.booruSharing' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? 'Deljenje Booru konfiguracija',
          'settings.booru.booruSharingMsgAndroid' => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ?? 'Kako automatski otvarati linkove Booru konfiguracija u aplikaciji na Androidu 12 i novijim:\n1) Dodirnite dugme ispod da biste otvorili sistemska podešavanja za podrazumevane linkove aplikacije\n2) Dodirnite «Dodaj link» i izaberite sve dostupne opcije',
          'settings.booru.addedBoorus' => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? 'Dodati Booru sajtovi',
          'settings.booru.editBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? 'Uredi Booru konfiguraciju',
          'settings.booru.importBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? 'Uvezi Booru konfiguraciju iz privremene memorije',
          'settings.booru.onlyLSURLsSupported' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ?? 'Podržani su samo loli.snatcher URL-ovi',
          'settings.booru.deleteBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? 'Obriši Booru konfiguraciju',
          'settings.booru.deleteBooruError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ??
                'Došlo je do greške prilikom brisanja Booru konfiguracije!',
          'settings.booru.booruDeleted' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? 'Booru konfiguracija je obrisana',
          'settings.booru.booruDropdownInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ??
                'Izabrani booru postaje podrazumevani nakon čuvanja.\n\nPodrazumevani booru se prikazuje prvi u padajućim menijima',
          'settings.booru.changeDefaultBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? 'Promeniti podrazumevani Booru?',
          'settings.booru.changeTo' => TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? 'Promeni na: ',
          'settings.booru.keepCurrentBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? 'Dodirnite [Ne] da zadržite trenutni: ',
          'settings.booru.changeToNewBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? 'Dodirnite [Da] da promenite na: ',
          'settings.booru.booruConfigLinkCopied' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ??
                'Link Booru konfiguracije je kopiran u privremenu memoriju',
          'settings.booru.noBooruSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.noBooruSelected', {}) ?? 'Nijedan Booru nije izabran!',
          'settings.booru.cantDeleteThisBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? 'Nije moguće obrisati ovaj Booru!',
          'settings.booru.removeRelatedTabsFirst' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.removeRelatedTabsFirst', {}) ?? 'Prvo uklonite povezane kartice',
          'settings.booru.sourceLimitNotice' => TranslationOverrides.string(_root.$meta, 'settings.booru.sourceLimitNotice', {}) ?? 'Ponašanje podešavanja nekih izvora može zavisiti od podešavanja kompatibilnosti u nastavku. Sadržaj hostuju i pružaju spoljni sajtovi i aplikacija nema kontrolu nad njim.',
          'settings.booru.advanced' => TranslationOverrides.string(_root.$meta, 'settings.booru.advanced', {}) ?? 'Napredno',
          'settings.booru.expandedSourceCompatibility' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.expandedSourceCompatibility', {}) ?? 'Kompatibilnost podešavanja izvora',
          'settings.booru.expandedSourceCompatibilitySubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.expandedSourceCompatibilitySubtitle', {}) ??
                'Podesite način na koji se obrađuju podešavanja kompatibilnosti izvora',
          'settings.booru.expandedSourceCompatibilityConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.expandedSourceCompatibilityConfirm', {}) ?? 'Promena ovoga može uticati na rad izvora. Sadržaj hostuju i pružaju spoljni sajtovi i aplikacija nema kontrolu nad njim. Želite li da nastavite?',
          'settings.booru.sourceUnavailableCurrentSettings' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.sourceUnavailableCurrentSettings', {}) ?? 'Ovaj sajt nije dostupan.',
          'settings.booruEditor.title' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? 'Booru uređivač',
          'settings.booruEditor.testBooruFailedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'Testiranje Booru-a nije uspelo',
          'settings.booruEditor.testBooruFailedMsg' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ?? 'Parametri konfiguracije možda nisu tačni, booru ne dozvoljava pristup putem API-ja, zahtev nije vratio nikakve podatke ili je došlo do mrežne greške.',
          'settings.booruEditor.saveBooru' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Sačuvaj Booru',
          'settings.booruEditor.runningTest' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? 'Testiranje u toku…',
          'settings.booruEditor.booruConfigExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? 'Ova Booru konfiguracija već postoji',
          'settings.booruEditor.booruSameNameExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ??
                'Booru konfiguracija sa istim imenom već postoji',
          'settings.booruEditor.booruSameUrlExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ??
                'Booru konfiguracija sa istim URL-om već postoji',
          'settings.booruEditor.thisBooruConfigWontBeAdded' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ??
                'Ova booru konfiguracija neće biti dodata',
          'settings.booruEditor.booruConfigSaved' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? 'Booru konfiguracija je sačuvana',
          'settings.booruEditor.existingTabsNeedReload' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ??
                'Postojeće kartice sa ovim Booru-om moraju se ponovo učitati da bi se primenile promene!',
          'settings.booruEditor.failedVerifyApiHydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ?? 'Neuspešna provera API pristupa za Hydrus',
          'settings.booruEditor.accessKeyRequestedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? 'Zatražen je pristupni ključ',
          'settings.booruEditor.accessKeyRequestedMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ??
                'Dodirnite „U redu“ u Hydrus-u, a zatim primenite. Nakon toga možete dodirnuti „Testiraj Booru“',
          'settings.booruEditor.accessKeyFailedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? 'Neuspešno pribavljanje pristupnog ključa',
          'settings.booruEditor.accessKeyFailedMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ??
                'Da li vam je otvoren prozor za zahtev u Hydrus-u?',
          'settings.booruEditor.hydrusInstructions' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ?? 'Da biste dobili Hydrus ključ, potrebno je da otvorite dijalog za zahtev u Hydrus klijentu. Services > Review services > Client API > Add > From API request',
          'settings.booruEditor.getHydrusApiKey' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? 'Pribavi Hydrus API ključ',
          'settings.booruEditor.booruName' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? 'Ime Booru-a',
          'settings.booruEditor.booruNameRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? 'Ime Booru-a je obavezno!',
          'settings.booruEditor.booruUrl' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? 'Booru URL',
          'settings.booruEditor.booruUrlRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? 'Booru URL je obavezan!',
          'settings.booruEditor.booruType' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruType', {}) ?? 'Tip Booru-a',
          'settings.booruEditor.booruFavicon' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? 'Favicon URL',
          'settings.booruEditor.booruFaviconPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '(Automatski se popunjava ako je prazno)',
          'settings.booruEditor.booruDefTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? 'Podrazumevane oznake',
          'settings.booruEditor.booruDefTagsPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTagsPlaceholder', {}) ?? 'Podrazumevana pretraga za booru',
          'settings.booruEditor.booruDefaultInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefaultInstructions', {}) ??
                'Polja ispod mogu biti obavezna za neke booru sajtove',
          'settings.booruEditor.booruConfigShouldSave' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigShouldSave', {}) ?? 'Potvrdite čuvanje ove booru konfiguracije',
          'settings.booruEditor.booruConfigSelectedType' =>
            ({required String booruType}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSelectedType', {'booruType': booruType}) ??
                'Izabrani/otkriveni tip booru-a: ${booruType}',
          'settings.interface.title' => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? 'Interfejs',
          'settings.interface.appUIMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIMode', {}) ?? 'Režim interfejsa aplikacije',
          'settings.interface.appUIModeWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarningTitle', {}) ?? 'Režim interfejsa aplikacije',
          'settings.interface.appUIModeWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarning', {}) ??
                'Koristiti Desktop režim? Može izazvati probleme na mobilnom uređaju. ZASTARELO.',
          'settings.interface.appUIModeHelpMobile' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpMobile', {}) ??
                '- Mobile - Uobičajeni interfejs za mobilne uređaje',
          'settings.interface.appUIModeHelpDesktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpDesktop', {}) ??
                '- Desktop - Interfejs u stilu Ahoviewer-a [ZASTARELO, POTREBNA PRERADA]',
          'settings.interface.appUIModeHelpWarning' => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpWarning', {}) ?? '[Upozorenje]: Nemojte postavljati režim interfejsa na Desktop na telefonu jer možete pokvariti aplikaciju i možda ćete morati da obrišete sva podešavanja, uključujući Booru konfiguracije.',
          'settings.interface.handSide' => TranslationOverrides.string(_root.$meta, 'settings.interface.handSide', {}) ?? 'Dominantna ruka',
          'settings.interface.handSideHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.handSideHelp', {}) ??
                'Prilagođava pozicije elemenata interfejsa izabranoj strani',
          'settings.interface.showSearchBarInPreviewGrid' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.showSearchBarInPreviewGrid', {}) ??
                'Prikaži traku za pretragu u mreži pregleda',
          'settings.interface.moveInputToTopInSearchView' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.moveInputToTopInSearchView', {}) ??
                'Premesti polje za unos na vrh u prikazu pretrage',
          'settings.interface.searchViewQuickActionsPanel' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewQuickActionsPanel', {}) ?? 'Panel brzih radnji u prikazu pretrage',
          'settings.interface.searchViewInputAutofocus' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewInputAutofocus', {}) ??
                'Automatski fokus na unos u prikazu pretrage',
          'settings.interface.disableVibration' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibration', {}) ?? 'Onemogući vibraciju',
          'settings.interface.disableVibrationSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibrationSubtitle', {}) ??
                'Vibracija se i dalje može javiti pri nekim radnjama, čak i kada je onemogućena',
          'settings.interface.usePredictiveBack' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.usePredictiveBack', {}) ?? 'Prediktivni pokret za nazad',
          'settings.interface.previewColumnsPortrait' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsPortrait', {}) ?? 'Kolone pregleda (uspravno)',
          'settings.interface.previewColumnsLandscape' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsLandscape', {}) ?? 'Kolone pregleda (položeno)',
          'settings.interface.previewQuality' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQuality', {}) ?? 'Kvalitet pregleda',
          'settings.interface.previewQualityHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelp', {}) ?? 'Menja rezoluciju slika u mreži pregleda',
          'settings.interface.previewQualityHelpSample' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpSample', {}) ??
                ' - Umanjena slika - Srednja rezolucija; aplikacija će prikazati minijaturu dok se učitava slika višeg kvaliteta',
          'settings.interface.previewQualityHelpThumbnail' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpThumbnail', {}) ?? ' - Minijatura - Niska rezolucija',
          'settings.interface.previewQualityHelpNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpNote', {}) ??
                '[Napomena]: Opcija „Umanjena slika“ može primetno smanjiti performanse, posebno ako imate previše kolona u mreži pregleda',
          'settings.interface.previewDisplay' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplay', {}) ?? 'Prikaz pregleda',
          'settings.interface.previewDisplayFallback' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallback', {}) ?? 'Rezervni prikaz pregleda',
          'settings.interface.previewDisplayFallbackHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallbackHelp', {}) ??
                'Ovo će se koristiti kada stepenasti raspored nije moguć',
          'settings.interface.dontScaleImages' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImages', {}) ?? 'Ne skaliraj slike',
          'settings.interface.dontScaleImagesSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesSubtitle', {}) ?? 'Može smanjiti performanse',
          'settings.interface.dontScaleImagesWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningTitle', {}) ?? 'Upozorenje',
          'settings.interface.dontScaleImagesWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarning', {}) ??
                'Da li ste sigurni da želite da onemogućite skaliranje slika?',
          'settings.interface.dontScaleImagesWarningMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningMsg', {}) ??
                'Ovo može negativno uticati na performanse, posebno na starijim uređajima',
          'settings.interface.gifThumbnails' => TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnails', {}) ?? 'GIF sličice',
          'settings.interface.gifThumbnailsRequires' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnailsRequires', {}) ?? 'Zahteva «Ne skaliraj slike»',
          'settings.interface.scrollPreviewsButtonsPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.scrollPreviewsButtonsPosition', {}) ??
                'Položaj dugmadi za pomeranje pregleda',
          'settings.interface.mouseWheelScrollModifier' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.mouseWheelScrollModifier', {}) ?? 'Modifikator pomeranja točkićem miša',
          'settings.interface.scrollModifier' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.scrollModifier', {}) ?? 'Modifikator pomeranja',
          'settings.interface.previewQualityValues.thumbnail' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.thumbnail', {}) ?? 'Minijatura',
          'settings.interface.previewQualityValues.sample' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.sample', {}) ?? 'Umanjena slika',
          'settings.interface.previewDisplayModeValues.square' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.square', {}) ?? 'Kvadrat',
          'settings.interface.previewDisplayModeValues.rectangle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.rectangle', {}) ?? 'Pravougaonik',
          'settings.interface.previewDisplayModeValues.staggered' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.staggered', {}) ?? 'Stepenasti raspored',
          'settings.interface.appModeValues.desktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.desktop', {}) ?? 'Za računar',
          'settings.interface.appModeValues.mobile' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.mobile', {}) ?? 'Mobilni',
          'settings.interface.handSideValues.left' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.left', {}) ?? 'Levo',
          'settings.interface.handSideValues.right' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.right', {}) ?? 'Desno',
          'settings.theme.title' => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? 'Teme',
          'settings.theme.themeMode' => TranslationOverrides.string(_root.$meta, 'settings.theme.themeMode', {}) ?? 'Režim teme',
          'settings.theme.blackBg' => TranslationOverrides.string(_root.$meta, 'settings.theme.blackBg', {}) ?? 'Crna pozadina',
          'settings.theme.useDynamicColor' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? 'Koristi dinamičku boju',
          'settings.theme.android12PlusOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.android12PlusOnly', {}) ?? 'Samo za Android 12+',
          'settings.theme.theme' => TranslationOverrides.string(_root.$meta, 'settings.theme.theme', {}) ?? 'Tema',
          'settings.theme.primaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? 'Primarna boja',
          'settings.theme.secondaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? 'Sekundarna boja',
          'settings.theme.enableDrawerMascot' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.enableDrawerMascot', {}) ?? 'Omogući maskotu u bočnom meniju',
          'settings.theme.setCustomMascot' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.setCustomMascot', {}) ?? 'Postavi prilagođenu maskotu',
          'settings.theme.removeCustomMascot' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? 'Ukloni prilagođenu maskotu',
          'settings.theme.currentMascotPath' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.currentMascotPath', {}) ?? 'Trenutna putanja do maskote',
          'settings.theme.system' => TranslationOverrides.string(_root.$meta, 'settings.theme.system', {}) ?? 'Sistemska',
          'settings.theme.light' => TranslationOverrides.string(_root.$meta, 'settings.theme.light', {}) ?? 'Svetla',
          'settings.theme.dark' => TranslationOverrides.string(_root.$meta, 'settings.theme.dark', {}) ?? 'Tamna',
          'settings.theme.pink' => TranslationOverrides.string(_root.$meta, 'settings.theme.pink', {}) ?? 'Roze',
          'settings.theme.purple' => TranslationOverrides.string(_root.$meta, 'settings.theme.purple', {}) ?? 'Ljubičasta',
          'settings.theme.blue' => TranslationOverrides.string(_root.$meta, 'settings.theme.blue', {}) ?? 'Plava',
          'settings.theme.teal' => TranslationOverrides.string(_root.$meta, 'settings.theme.teal', {}) ?? 'Tirkizna',
          'settings.theme.red' => TranslationOverrides.string(_root.$meta, 'settings.theme.red', {}) ?? 'Crvena',
          'settings.theme.green' => TranslationOverrides.string(_root.$meta, 'settings.theme.green', {}) ?? 'Zelena',
          'settings.theme.halloween' => TranslationOverrides.string(_root.$meta, 'settings.theme.halloween', {}) ?? 'Noć veštica',
          'settings.theme.custom' => TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? 'Prilagođena',
          'settings.theme.selectColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.selectColor', {}) ?? 'Izaberite boju',
          'settings.theme.selectedColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColor', {}) ?? 'Izabrana boja',
          'settings.theme.selectedColorAndShades' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColorAndShades', {}) ?? 'Izabrana boja i njene nijanse',
          'settings.theme.fontFamily' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontFamily', {}) ?? 'Font',
          'settings.theme.systemDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.systemDefault', {}) ?? 'Podrazumevani sistemski font',
          'settings.theme.viewMoreFonts' => TranslationOverrides.string(_root.$meta, 'settings.theme.viewMoreFonts', {}) ?? 'Prikaži više fontova',
          'settings.theme.fontPreviewText' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.fontPreviewText', {}) ??
                'Ljubazni fenjerdžija čađavog lica hoće da mi pokaže štos.',
          'settings.theme.customFont' => TranslationOverrides.string(_root.$meta, 'settings.theme.customFont', {}) ?? 'Prilagođeni font',
          'settings.theme.customFontSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.customFontSubtitle', {}) ?? 'Unesite naziv bilo kog Google fonta',
          'settings.theme.fontName' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontName', {}) ?? 'Naziv fonta',
          'settings.theme.customFontHint' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.customFontHint', {}) ?? 'Pregledajte fontove na fonts.google.com',
          'settings.theme.fontNotFound' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontNotFound', {}) ?? 'Font nije pronađen',
          'settings.viewer.title' => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? 'Pregledač',
          'settings.viewer.preloadAmount' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadAmount', {}) ?? 'Količina za predučitavanje',
          'settings.viewer.preloadSizeLimit' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimit', {}) ?? 'Ograničenje veličine predučitavanja',
          'settings.viewer.preloadSizeLimitSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimitSubtitle', {}) ?? 'u GB, 0 za bez ograničenja',
          'settings.viewer.preloadHeightLimit' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimit', {}) ?? 'Ograničenje visine predučitavanja',
          'settings.viewer.preloadHeightLimitSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimitSubtitle', {}) ?? 'u pikselima, 0 za bez ograničenja',
          'settings.viewer.imageQuality' => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQuality', {}) ?? 'Kvalitet slike',
          'settings.viewer.viewerScrollDirection' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerScrollDirection', {}) ?? 'Smer listanja u pregledaču',
          'settings.viewer.viewerToolbarPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerToolbarPosition', {}) ?? 'Položaj trake sa alatkama u pregledaču',
          'settings.viewer.zoomButtonPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.zoomButtonPosition', {}) ?? 'Položaj dugmeta za zumiranje',
          'settings.viewer.changePageButtonsPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.changePageButtonsPosition', {}) ?? 'Položaj dugmadi za promenu stranice',
          'settings.viewer.hideToolbarWhenOpeningViewer' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.hideToolbarWhenOpeningViewer', {}) ??
                'Sakrij traku sa alatkama prilikom otvaranja pregledača',
          'settings.viewer.expandDetailsByDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.expandDetailsByDefault', {}) ?? 'Podrazumevano proširi detalje',
          'settings.viewer.hideTranslationNotesByDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.hideTranslationNotesByDefault', {}) ?? 'Podrazumevano sakrij beleške o prevodu',
          'settings.viewer.enableRotation' => TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotation', {}) ?? 'Omogući rotaciju',
          'settings.viewer.enableRotationSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotationSubtitle', {}) ?? 'Dvaput dodirnite za resetovanje',
          'settings.viewer.toolbarButtonsOrder' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarButtonsOrder', {}) ?? 'Redosled dugmadi na traci sa alatkama',
          'settings.viewer.buttonsOrder' => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonsOrder', {}) ?? 'Redosled dugmadi',
          'settings.viewer.longPressToChangeItemOrder' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToChangeItemOrder', {}) ??
                'Dugo pritisnite da promenite redosled stavki.',
          'settings.viewer.atLeast4ButtonsVisibleOnToolbar' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.atLeast4ButtonsVisibleOnToolbar', {}) ??
                'Najmanje 4 dugmeta sa ove liste će uvek biti vidljiva na traci sa alatkama.',
          'settings.viewer.otherButtonsWillGoIntoOverflow' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.otherButtonsWillGoIntoOverflow', {}) ??
                'Ostala dugmad će ići u meni sa više opcija (tri tačke).',
          'settings.viewer.longPressToMoveItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToMoveItems', {}) ?? 'Dugo pritisnite da biste premestili stavke',
          'settings.viewer.onlyForVideos' => TranslationOverrides.string(_root.$meta, 'settings.viewer.onlyForVideos', {}) ?? 'Samo za video zapise',
          'settings.viewer.thisButtonCannotBeDisabled' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.thisButtonCannotBeDisabled', {}) ?? 'Ovo dugme se ne može onemogućiti',
          'settings.viewer.defaultShareAction' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.defaultShareAction', {}) ?? 'Podrazumevana radnja deljenja',
          'settings.viewer.shareActions' => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActions', {}) ?? 'Radnje deljenja',
          'settings.viewer.shareActionsAsk' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsAsk', {}) ?? '- Pitaj - uvek pitaj šta treba deliti',
          'settings.viewer.shareActionsPostURL' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURL', {}) ?? '- URL objave',
          'settings.viewer.shareActionsFileURL' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFileURL', {}) ??
                '- URL datoteke - deli direktnu vezu ka originalnoj datoteci (možda neće raditi na nekim sajtovima)',
          'settings.viewer.shareActionsPostURLFileURLFileWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURLFileURLFileWithTags', {}) ??
                '- URL objave/URL datoteke/Datoteka sa oznakama - deli URL/datoteku i oznake koje izaberete',
          'settings.viewer.shareActionsFile' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFile', {}) ??
                '- Datoteka - deli samu datoteku, učitavanje može potrajati, napredak će biti prikazan na dugmetu za deljenje',
          'settings.viewer.shareActionsHydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsHydrus', {}) ?? '- Hydrus - šalje URL objave u Hydrus za uvoz',
          'settings.viewer.shareActionsNoteIfFileSavedInCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsNoteIfFileSavedInCache', {}) ??
                '[Napomena]: Ako je datoteka sačuvana u kešu, biće učitana odatle. U suprotnom, ponovo će biti učitana sa mreže.',
          'settings.viewer.shareActionsTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsTip', {}) ??
                '[Savet]: Meni radnji deljenja možete otvoriti dugim pritiskom na dugme za deljenje.',
          'settings.viewer.useVolumeButtonsForScrolling' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.useVolumeButtonsForScrolling', {}) ??
                'Koristi tastere za jačinu zvuka za listanje',
          'settings.viewer.volumeButtonsScrolling' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrolling', {}) ?? 'Listanje tasterima za jačinu zvuka',
          'settings.viewer.volumeButtonsScrollingHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollingHelp', {}) ??
                'Koristite tastere za jačinu zvuka za listanje kroz preglede i pregledač',
          'settings.viewer.volumeButtonsVolumeDown' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeDown', {}) ?? ' - Smanjivanje jačine zvuka - sledeća stavka',
          'settings.viewer.volumeButtonsVolumeUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeUp', {}) ?? ' - Pojačavanje jačine zvuka - prethodna stavka',
          'settings.viewer.volumeButtonsInViewer' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsInViewer', {}) ?? 'U pregledaču:',
          'settings.viewer.volumeButtonsToolbarVisible' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarVisible', {}) ??
                ' - Traka sa alatkama vidljiva - kontroliše jačinu zvuka',
          'settings.viewer.volumeButtonsToolbarHidden' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarHidden', {}) ??
                ' - Traka sa alatkama sakrivena - kontroliše listanje',
          'settings.viewer.volumeButtonsScrollSpeed' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollSpeed', {}) ?? 'Brzina listanja tasterima za jačinu zvuka',
          'settings.viewer.slideshowDurationInMs' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowDurationInMs', {}) ?? 'Trajanje projekcije slajdova (u ms)',
          'settings.viewer.slideshow' => TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshow', {}) ?? 'Projekcija slajdova',
          'settings.viewer.slideshowWIPNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowWIPNote', {}) ??
                '[U izradi] Video zapisi/GIF-ovi: samo ručno listanje',
          'settings.viewer.preventDeviceFromSleeping' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preventDeviceFromSleeping', {}) ?? 'Spreči uređaj da pređe u stanje spavanja',
          'settings.viewer.viewerOpenCloseAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerOpenCloseAnimation', {}) ?? 'Animacija otvaranja/zatvaranja pregledača',
          'settings.viewer.viewerPageChangeAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerPageChangeAnimation', {}) ?? 'Animacija promene stranice u pregledaču',
          'settings.viewer.usingDefaultAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.usingDefaultAnimation', {}) ?? 'Koristi se podrazumevana animacija',
          'settings.viewer.usingCustomAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.usingCustomAnimation', {}) ?? 'Koristi se prilagođena animacija',
          'settings.viewer.kannaLoadingGif' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.kannaLoadingGif', {}) ?? 'Kanna GIF za učitavanje',
          'settings.viewer.imageQualityValues.sample' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.sample', {}) ?? 'Umanjena slika',
          'settings.viewer.imageQualityValues.fullRes' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.fullRes', {}) ?? 'Original',
          'settings.viewer.scrollDirectionValues.horizontal' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.horizontal', {}) ?? 'Horizontalno',
          'settings.viewer.scrollDirectionValues.vertical' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.vertical', {}) ?? 'Vertikalno',
          'settings.viewer.toolbarPositionValues.top' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.top', {}) ?? 'Gore',
          'settings.viewer.toolbarPositionValues.bottom' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.bottom', {}) ?? 'Dole',
          'settings.viewer.buttonPositionValues.disabled' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.disabled', {}) ?? 'Onemogućeno',
          'settings.viewer.buttonPositionValues.left' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.left', {}) ?? 'Levo',
          'settings.viewer.buttonPositionValues.right' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.right', {}) ?? 'Desno',
          'settings.viewer.shareActionValues.ask' => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.ask', {}) ?? 'Pitaj',
          'settings.viewer.shareActionValues.postUrl' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrl', {}) ?? 'URL objave',
          'settings.viewer.shareActionValues.postUrlWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrlWithTags', {}) ?? 'URL objave sa oznakama',
          'settings.viewer.shareActionValues.fileUrl' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrl', {}) ?? 'URL datoteke',
          'settings.viewer.shareActionValues.fileUrlWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrlWithTags', {}) ?? 'URL datoteke sa oznakama',
          'settings.viewer.shareActionValues.file' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.file', {}) ?? 'Datoteka',
          'settings.viewer.shareActionValues.fileWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileWithTags', {}) ?? 'Datoteka sa oznakama',
          'settings.viewer.shareActionValues.hydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.hydrus', {}) ?? 'Hydrus',
          'settings.video.title' => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? 'Video',
          'settings.video.disableVideos' => TranslationOverrides.string(_root.$meta, 'settings.video.disableVideos', {}) ?? 'Onemogući video zapise',
          _ => null,
        } ??
        switch (path) {
          'settings.video.disableVideosHelp' => TranslationOverrides.string(_root.$meta, 'settings.video.disableVideosHelp', {}) ?? 'Korisno na slabijim uređajima koji se ruše prilikom pokušaja učitavanja video zapisa. Pruža opcije za gledanje video zapisa u spoljnom plejeru ili pregledaču.',
          'settings.video.autoplayVideos' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.autoplayVideos', {}) ?? 'Automatski reprodukuj video zapise',
          'settings.video.startVideosMuted' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.startVideosMuted', {}) ?? 'Pokreni video zapise bez zvuka',
          'settings.video.experimental' => TranslationOverrides.string(_root.$meta, 'settings.video.experimental', {}) ?? '[Eksperimentalno]',
          'settings.video.videoPlayerBackend' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoPlayerBackend', {}) ?? 'Pozadinski sistem video plejera',
          'settings.video.backendDefault' => TranslationOverrides.string(_root.$meta, 'settings.video.backendDefault', {}) ?? 'Podrazumevano',
          'settings.video.backendMPV' => TranslationOverrides.string(_root.$meta, 'settings.video.backendMPV', {}) ?? 'MPV',
          'settings.video.backendMDK' => TranslationOverrides.string(_root.$meta, 'settings.video.backendMDK', {}) ?? 'MDK',
          'settings.video.backendDefaultHelp' => TranslationOverrides.string(_root.$meta, 'settings.video.backendDefaultHelp', {}) ?? 'Zasnovano na exoplayer-u. Ima najbolju kompatibilnost sa uređajima, ali može imati problema sa 4K video zapisima, nekim kodecima ili starijim uređajima',
          'settings.video.backendMPVHelp' => TranslationOverrides.string(_root.$meta, 'settings.video.backendMPVHelp', {}) ?? 'Zasnovano na libmpv-u, ima napredna podešavanja koja mogu pomoći u rešavanju problema sa nekim kodecima/uređajima\n[MOŽE IZAZVATI RUŠENJE]',
          'settings.video.backendMDKHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.backendMDKHelp', {}) ??
                'Zasnovano na libmdk-u, može imati bolje performanse za neke kodeke/uređaje\n[MOŽE IZAZVATI RUŠENJE]',
          'settings.video.mpvSettingsHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.mpvSettingsHelp', {}) ??
                'Isprobajte različite vrednosti \'MPV\' podešavanja ispod ako video zapisi ne rade ispravno ili prijavljuju greške kodeka:',
          'settings.video.mpvUseHardwareAcceleration' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.mpvUseHardwareAcceleration', {}) ?? 'MPV: koristi hardversko ubrzanje',
          'settings.video.mpvVO' => TranslationOverrides.string(_root.$meta, 'settings.video.mpvVO', {}) ?? 'MPV: VO',
          'settings.video.mpvHWDEC' => TranslationOverrides.string(_root.$meta, 'settings.video.mpvHWDEC', {}) ?? 'MPV: HWDEC',
          'settings.video.videoCacheMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoCacheMode', {}) ?? 'Režim keširanja video zapisa',
          'settings.video.cacheModes.title' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.title', {}) ?? 'Režimi keširanja video zapisa',
          'settings.video.cacheModes.streamMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamMode', {}) ??
                '- Strimovanje - Ne keširaj, započni reprodukciju što je pre moguće',
          'settings.video.cacheModes.cacheMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheMode', {}) ??
                '- Keširanje - Čuva datoteku u skladištu uređaja, reprodukuje tek kada se preuzimanje završi',
          'settings.video.cacheModes.streamCacheMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamCacheMode', {}) ??
                '- Strimovanje+keširanje - Kombinacija oba, ali trenutno dovodi do dvostrukog preuzimanja',
          'settings.video.cacheModes.cacheNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheNote', {}) ??
                '[Napomena]: Video zapisi će se keširati samo ako je opcija \'Keširaj medije\' omogućena.',
          'settings.video.cacheModes.desktopWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.desktopWarning', {}) ??
                '[Upozorenje]: Na računaru režim strimovanja može raditi nepravilno za neke Booru sajtove.',
          'settings.video.cacheModeValues.stream' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.stream', {}) ?? 'Strimovanje',
          'settings.video.cacheModeValues.cache' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.cache', {}) ?? 'Keširanje',
          'settings.video.cacheModeValues.streamCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.streamCache', {}) ?? 'Strimovanje+keširanje',
          'settings.video.videoBackendModeValues.normal' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.normal', {}) ?? 'Podrazumevano',
          'settings.video.videoBackendModeValues.mpv' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mpv', {}) ?? 'MPV',
          'settings.video.videoBackendModeValues.mdk' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mdk', {}) ?? 'MDK',
          'settings.downloads.fromNextItemInQueue' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.fromNextItemInQueue', {}) ?? 'Od sledeće stavke u redu',
          'settings.downloads.pleaseProvideStoragePermission' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.pleaseProvideStoragePermission', {}) ??
                'Dodelite dozvolu za pristup skladištu kako biste preuzimali datoteke',
          'settings.downloads.noItemsSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsSelected', {}) ?? 'Nijedna stavka nije izabrana',
          'settings.downloads.noItemsQueued' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsQueued', {}) ?? 'Nema stavki u redu',
          'settings.downloads.batch' => TranslationOverrides.string(_root.$meta, 'settings.downloads.batch', {}) ?? 'Grupno',
          'settings.downloads.snatchSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? 'Preuzmi izabrano',
          'settings.downloads.removeSnatchedStatusFromSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ??
                'Ukloni status preuzetog sa izabranih stavki',
          'settings.downloads.favouriteSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? 'Dodaj izabrano u omiljeno',
          'settings.downloads.unfavouriteSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? 'Ukloni izabrano iz omiljenih',
          'settings.downloads.clearSelected' => TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? 'Obriši izabrano',
          'settings.downloads.updatingData' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? 'Ažuriranje podataka…',
          'settings.database.title' => TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? 'Baza podataka',
          'settings.database.indexingDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? 'Indeksiranje baze podataka',
          'settings.database.droppingIndexes' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? 'Uklanjanje indeksa',
          'settings.database.enableDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableDatabase', {}) ?? 'Omogući bazu podataka',
          'settings.database.enableIndexing' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableIndexing', {}) ?? 'Omogući indeksiranje',
          'settings.database.enableSearchHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableSearchHistory', {}) ?? 'Omogući istoriju pretrage',
          'settings.database.enableTagTypeFetching' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableTagTypeFetching', {}) ?? 'Omogući preuzimanje tipova oznaka',
          'settings.database.sankakuTypeToUpdate' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuTypeToUpdate', {}) ?? 'Sankaku tip za ažuriranje',
          'settings.database.searchQuery' => TranslationOverrides.string(_root.$meta, 'settings.database.searchQuery', {}) ?? 'Upit za pretragu',
          'settings.database.searchQueryOptional' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchQueryOptional', {}) ?? '(opciono, može usporiti proces)',
          'settings.database.cantLeavePageNow' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.cantLeavePageNow', {}) ?? 'Trenutno ne možete napustiti stranicu!',
          'settings.database.sankakuDataUpdating' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDataUpdating', {}) ??
                'Sankaku podaci se ažuriraju, sačekajte dok se ne završi ili otkažite ručno na dnu stranice',
          'settings.database.pleaseWaitTitle' => TranslationOverrides.string(_root.$meta, 'settings.database.pleaseWaitTitle', {}) ?? 'Sačekajte!',
          'settings.database.indexesBeingChanged' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexesBeingChanged', {}) ?? 'Indeksi se menjaju',
          'settings.database.databaseInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfo', {}) ?? 'Čuva omiljene stavke i prati preuzete stavke',
          'settings.database.databaseInfoSnatch' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfoSnatch', {}) ?? 'Preuzete stavke se neće ponovo preuzimati',
          'settings.database.indexingInfo' => TranslationOverrides.string(_root.$meta, 'settings.database.indexingInfo', {}) ?? 'Ubrzava pretragu baze podataka, ali koristi više prostora na disku (do 2x).\n\nNemojte napuštati stranicu niti zatvarati aplikaciju tokom indeksiranja.',
          'settings.database.createIndexesDebug' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.createIndexesDebug', {}) ?? 'Kreiraj indekse [Otklanjanje grešaka]',
          'settings.database.dropIndexesDebug' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.dropIndexesDebug', {}) ?? 'Ukloni indekse [Otklanjanje grešaka]',
          'settings.database.searchHistoryInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryInfo', {}) ?? 'Zahteva da baza podataka bude omogućena.',
          'settings.database.searchHistoryRecords' =>
            ({required int limit}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryRecords', {'limit': limit}) ??
                'Čuva poslednjih ${limit} pretraga',
          'settings.database.searchHistoryTapInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryTapInfo', {}) ?? 'Dodirnite unos za radnje (Obriši, Omiljeno…)',
          'settings.database.searchHistoryFavouritesInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryFavouritesInfo', {}) ??
                'Omiljeni upiti su zakačeni na vrh liste i neće se računati u ograničenje.',
          'settings.database.tagTypeFetchingInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingInfo', {}) ??
                'Preuzima tipove oznaka sa podržanih Booru sajtova',
          'settings.database.tagTypeFetchingWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingWarning', {}) ?? 'Može izazvati ograničenje broja zahteva',
          'settings.database.deleteDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabase', {}) ?? 'Obriši bazu podataka',
          'settings.database.deleteDatabaseConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabaseConfirm', {}) ?? 'Obrisati bazu podataka?',
          'settings.database.databaseDeleted' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseDeleted', {}) ?? 'Baza podataka je obrisana!',
          'settings.database.appRestartRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.appRestartRequired', {}) ?? 'Potrebno je ponovno pokretanje aplikacije!',
          'settings.database.clearSnatchedItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSnatchedItems', {}) ?? 'Obriši istoriju preuzimanja',
          'settings.database.clearAllSnatchedConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearAllSnatchedConfirm', {}) ?? 'Obrisati celu istoriju preuzimanja?',
          'settings.database.snatchedItemsCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.snatchedItemsCleared', {}) ?? 'Istorija preuzimanja je obrisana',
          'settings.database.appRestartMayBeRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.appRestartMayBeRequired', {}) ??
                'Možda će biti potrebno ponovno pokretanje aplikacije!',
          'settings.database.clearFavouritedItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearFavouritedItems', {}) ?? 'Obriši omiljene stavke',
          'settings.database.clearAllFavouritedConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearAllFavouritedConfirm', {}) ?? 'Obrisati sve omiljene stavke?',
          'settings.database.favouritesCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.favouritesCleared', {}) ?? 'Omiljene stavke su obrisane',
          'settings.database.clearSearchHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistory', {}) ?? 'Obriši istoriju pretrage',
          'settings.database.clearSearchHistoryConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistoryConfirm', {}) ?? 'Obrisati istoriju pretrage?',
          'settings.database.searchHistoryCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryCleared', {}) ?? 'Istorija pretrage je obrisana',
          'settings.database.sankakuFavouritesUpdate' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdate', {}) ?? 'Ažuriranje Sankaku omiljenih stavki',
          'settings.database.sankakuFavouritesUpdateStarted' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateStarted', {}) ??
                'Ažuriranje Sankaku omiljenih stavki je započeto',
          'settings.database.sankakuNewUrlsInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuNewUrlsInfo', {}) ??
                'Novi URL-ovi slika biće preuzeti za Sankaku stavke u vašim omiljenim',
          'settings.database.sankakuDontLeavePage' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDontLeavePage', {}) ??
                'Nemojte napuštati ovu stranicu dok se proces ne završi ili ne zaustavi',
          'settings.database.noSankakuConfigFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.noSankakuConfigFound', {}) ?? 'Sankaku konfiguracija nije pronađena!',
          'settings.database.sankakuFavouritesUpdateComplete' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateComplete', {}) ??
                'Ažuriranje Sankaku omiljenih stavki je završeno',
          'settings.database.failedItemsPurgeStartedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeStartedTitle', {}) ?? 'Čišćenje neuspelih stavki je započeto',
          'settings.database.failedItemsPurgeInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeInfo', {}) ??
                'Stavke koje nisu uspele da se ažuriraju biće uklonjene iz baze podataka',
          'settings.database.updateSankakuUrls' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.updateSankakuUrls', {}) ?? 'Ažuriraj Sankaku URL-ove',
          'settings.database.updating' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.database.updating', {'count': count}) ?? 'Ažuriranje stavki: ${count}',
          'settings.database.left' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.database.left', {'count': count}) ?? 'Preostalo: ${count}',
          'settings.database.done' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.database.done', {'count': count}) ?? 'Završeno: ${count}',
          'settings.database.failedSkipped' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.database.failedSkipped', {'count': count}) ?? 'Neuspelo/preskočeno: ${count}',
          'settings.database.sankakuRateLimitWarning' => TranslationOverrides.string(_root.$meta, 'settings.database.sankakuRateLimitWarning', {}) ?? 'Zaustavite i pokušajte ponovo kasnije ako vidite da broj \'Neuspelo\' konstantno raste, možda ste dostigli ograničenje broja zahteva i/ili Sankaku blokira zahteve sa vaše IP adrese.',
          'settings.database.skipCurrentItem' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.skipCurrentItem', {}) ?? 'Pritisnite ovde da preskočite trenutnu stavku',
          'settings.database.useIfStuck' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.useIfStuck', {}) ?? 'Koristite ako izgleda da se stavka zaglavila',
          'settings.database.pressToStop' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.pressToStop', {}) ?? 'Pritisnite ovde da zaustavite',
          'settings.database.purgeFailedItems' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.purgeFailedItems', {'count': count}) ??
                'Očisti neuspele stavke (${count})',
          'settings.database.retryFailedItems' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.retryFailedItems', {'count': count}) ??
                'Ponovo ažuriraj stavke čije ažuriranje nije uspelo (${count})',
          'settings.backupAndRestore.title' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.title', {}) ?? 'Rezervna kopija i vraćanje',
          'settings.backupAndRestore.duplicateFileDetectedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedTitle', {}) ?? 'Otkriven je duplikat datoteke!',
          'settings.backupAndRestore.duplicateFileDetectedMsg' =>
            ({required String fileName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
                'Datoteka ${fileName} već postoji. Želite li da je prepišete? Ako izaberete ne, kreiranje rezervne kopije biće otkazano.',
          'settings.backupAndRestore.androidOnlyFeatureMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ?? 'Ova funkcija je dostupna samo na Androidu. U verzijama za računare možete kopirati i nalepiti datoteke iz fascikle podataka aplikacije ili u nju, u zavisnosti od vašeg sistema.',
          'settings.backupAndRestore.selectBackupDir' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? 'Izaberite direktorijum rezervne kopije',
          'settings.backupAndRestore.failedToGetBackupPath' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ??
                'Preuzimanje putanje rezervne kopije nije uspelo',
          'settings.backupAndRestore.backupPathMsg' =>
            ({required String backupPath}) =>
                TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ??
                'Putanja rezervne kopije je: ${backupPath}',
          'settings.backupAndRestore.noBackupDirSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ??
                'Nije izabran direktorijum rezervne kopije',
          'settings.backupAndRestore.restoreInfoMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ?? 'Datoteke moraju biti u korenu direktorijuma',
          'settings.backupAndRestore.backupSettings' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? 'Napravi rezervnu kopiju podešavanja',
          'settings.backupAndRestore.restoreSettings' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? 'Vrati podešavanja iz rezervne kopije',
          'settings.backupAndRestore.settingsBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ?? 'Podešavanja su sačuvana u settings.json',
          'settings.backupAndRestore.settingsRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? 'Podešavanja su vraćena iz rezervne kopije',
          'settings.backupAndRestore.backupSettingsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ??
                'Pravljenje rezervne kopije podešavanja nije uspelo',
          'settings.backupAndRestore.restoreSettingsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ?? 'Vraćanje podešavanja nije uspelo',
          'settings.backupAndRestore.resetBackupDir' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.resetBackupDir', {}) ?? 'Resetuj direktorijum rezervne kopije',
          'settings.backupAndRestore.backupBoorus' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ??
                'Napravi rezervnu kopiju podešavanja booru sajtova',
          'settings.backupAndRestore.restoreBoorus' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? 'Vrati podešavanja booru sajtova',
          'settings.backupAndRestore.boorusBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ??
                'Rezervna kopija podešavanja booru sajtova je sačuvana u boorus.json',
          'settings.backupAndRestore.boorusRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ??
                'Podešavanja booru sajtova su vraćena iz rezervne kopije',
          'settings.backupAndRestore.backupBoorusError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ??
                'Pravljenje rezervne kopije podešavanja booru sajtova nije uspelo',
          'settings.backupAndRestore.restoreBoorusError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ??
                'Vraćanje podešavanja booru sajtova nije uspelo',
          'settings.backupAndRestore.backupDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? 'Napravi rezervnu kopiju baze podataka',
          'settings.backupAndRestore.restoreDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? 'Vrati bazu podataka',
          'settings.backupAndRestore.restoreDatabaseInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ??
                'Može potrajati u zavisnosti od veličine baze podataka, aplikacija će se ponovo pokrenuti nakon uspešnog vraćanja',
          'settings.backupAndRestore.databaseBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ??
                'Rezervna kopija baze podataka je sačuvana u store.db',
          'settings.backupAndRestore.databaseRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ??
                'Baza podataka je vraćena iz rezervne kopije! Aplikacija će se ponovo pokrenuti za nekoliko sekundi!',
          'settings.backupAndRestore.backupDatabaseError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ??
                'Pravljenje rezervne kopije baze podataka nije uspelo',
          'settings.backupAndRestore.restoreDatabaseError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ?? 'Vraćanje baze podataka nije uspelo',
          'settings.backupAndRestore.databaseFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ??
                'Datoteka baze podataka nije pronađena ili se ne može pročitati!',
          'settings.backupAndRestore.backupTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? 'Napravi rezervnu kopiju oznaka',
          'settings.backupAndRestore.restoreTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? 'Vrati oznake',
          'settings.backupAndRestore.restoreTagsInfo' => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ?? 'Može potrajati ako imate puno oznaka. Ako ste izvršili vraćanje baze podataka, ne morate ovo raditi jer je to već uključeno u bazu podataka',
          'settings.backupAndRestore.tagsBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ??
                'Rezervna kopija oznaka je sačuvana u tags.json',
          'settings.backupAndRestore.tagsRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? 'Oznake su vraćene iz rezervne kopije',
          'settings.backupAndRestore.backupTagsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ??
                'Pravljenje rezervne kopije oznaka nije uspelo',
          'settings.backupAndRestore.restoreTagsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? 'Vraćanje oznaka nije uspelo',
          'settings.backupAndRestore.tagsFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsFileNotFound', {}) ??
                'Datoteka sa oznakama nije pronađena ili se ne može pročitati!',
          'settings.backupAndRestore.operationTakesTooLongMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.operationTakesTooLongMsg', {}) ??
                'Pritisnite Sakrij ispod ako predugo traje, radnja će se nastaviti u pozadini',
          'settings.backupAndRestore.backupFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupFileNotFound', {}) ??
                'Datoteka rezervne kopije nije pronađena ili se ne može pročitati!',
          'settings.backupAndRestore.backupDirNoAccess' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDirNoAccess', {}) ??
                'Nema pristupa direktorijumu za rezervne kopije!',
          'settings.backupAndRestore.backupCancelled' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? 'Pravljenje rezervne kopije je otkazano',
          'settings.network.title' => TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? 'Mreža',
          'settings.network.enableSelfSignedSSLCertificates' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.enableSelfSignedSSLCertificates', {}) ??
                'Omogući samopotpisane SSL sertifikate',
          'settings.network.proxy' => TranslationOverrides.string(_root.$meta, 'settings.network.proxy', {}) ?? 'Proksi',
          'settings.network.proxySubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.proxySubtitle', {}) ??
                'Ne primenjuje se na režim strimovanja videa, umesto toga koristite režim keširanja videa',
          'settings.network.customUserAgent' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgent', {}) ?? 'Prilagođeni User-Agent',
          'settings.network.customUserAgentTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgentTitle', {}) ?? 'Prilagođeni User-Agent',
          'settings.network.keepEmptyForDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.keepEmptyForDefault', {}) ??
                'Ostavite prazno da biste koristili podrazumevanu vrednost',
          'settings.network.defaultUserAgent' => ({
            required String agent,
          }) => TranslationOverrides.string(_root.$meta, 'settings.network.defaultUserAgent', {'agent': agent}) ?? 'Podrazumevano: ${agent}',
          'settings.network.userAgentUsedOnRequests' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.userAgentUsedOnRequests', {}) ??
                'Koristi se za većinu Booru zahteva i Webview',
          'settings.network.valueSavedAfterLeaving' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.valueSavedAfterLeaving', {}) ?? 'Čuva se pri napuštanju stranice',
          'settings.network.setBrowserUserAgent' => TranslationOverrides.string(_root.$meta, 'settings.network.setBrowserUserAgent', {}) ?? 'Dodirnite ovde da biste koristili User-Agent Chrome pregledača (preporučuje se samo ako sajt zabranjuje korisničke agente koji nisu iz pregledača)',
          'settings.network.cookieCleaner' => TranslationOverrides.string(_root.$meta, 'settings.network.cookieCleaner', {}) ?? 'Čistač kolačića',
          'settings.network.selectBooruToClearCookies' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.selectBooruToClearCookies', {}) ??
                'Izaberite Booru za brisanje kolačića ili ostavite prazno da obrišete sve',
          'settings.network.cookiesFor' => ({
            required String booruName,
          }) => TranslationOverrides.string(_root.$meta, 'settings.network.cookiesFor', {'booruName': booruName}) ?? 'Kolačići za ${booruName}:',
          'settings.network.cookieDeleted' =>
            ({required String cookieName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookieDeleted', {'cookieName': cookieName}) ??
                'Kolačić «${cookieName}» je obrisan',
          'settings.network.clearCookies' => TranslationOverrides.string(_root.$meta, 'settings.network.clearCookies', {}) ?? 'Obriši kolačiće',
          'settings.network.clearCookiesFor' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.clearCookiesFor', {'booruName': booruName}) ??
                'Obriši kolačiće za ${booruName}',
          'settings.network.cookiesForBooruDeleted' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookiesForBooruDeleted', {'booruName': booruName}) ??
                'Kolačići za ${booruName} su obrisani',
          'settings.network.allCookiesDeleted' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.allCookiesDeleted', {}) ?? 'Svi kolačići su obrisani',
          'settings.privacy.title' => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? 'Privatnost',
          'settings.privacy.appLock' => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? 'Zaključavanje aplikacije',
          'settings.privacy.appLockMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ??
                'Zaključajte aplikaciju ručno ili nakon isteka perioda neaktivnosti. Zahteva PIN/biometriju',
          'settings.privacy.autoLockAfter' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfter', {}) ?? 'Automatsko zaključavanje nakon',
          'settings.privacy.autoLockAfterTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfterTip', {}) ?? 'u sekundama, 0 za onemogućavanje',
          'settings.privacy.bluronLeave' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeave', {}) ?? 'Zamućenje ekrana pri napuštanju aplikacije',
          'settings.privacy.bluronLeaveMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeaveMsg', {}) ??
                'Možda neće raditi na nekim uređajima zbog sistemskih ograničenja',
          'settings.privacy.incognitoKeyboard' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboard', {}) ?? 'Inkognito tastatura',
          'settings.privacy.incognitoKeyboardMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboardMsg', {}) ??
                'Sprečava tastaturu da čuva istoriju kucanja.\nPrimenjuje se na većinu polja za unos teksta',
          'settings.privacy.appDisplayName' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayName', {}) ?? 'Prikazano ime aplikacije',
          'settings.privacy.appDisplayNameDescription' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayNameDescription', {}) ??
                'Promenite način na koji se naziv aplikacije prikazuje u pokretaču',
          'settings.privacy.appAliasChanged' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChanged', {}) ?? 'Naziv aplikacije je promenjen',
          'settings.privacy.appAliasRestartHint' => TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasRestartHint', {}) ?? 'Promena naziva aplikacije stupiće na snagu nakon ponovnog pokretanja aplikacije. Nekim pokretačima je možda potrebno dodatno vreme ili ponovno pokretanje sistema radi ažuriranja.',
          'settings.privacy.appAliasChangeFailed' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChangeFailed', {}) ??
                'Promena naziva aplikacije nije uspela. Pokušajte ponovo.',
          'settings.privacy.restartNow' => TranslationOverrides.string(_root.$meta, 'settings.privacy.restartNow', {}) ?? 'Ponovo pokreni sada',
          'settings.performance.title' => TranslationOverrides.string(_root.$meta, 'settings.performance.title', {}) ?? 'Performanse',
          'settings.performance.lowPerformanceMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceMode', {}) ?? 'Režim niskih performansi',
          'settings.performance.lowPerformanceModeSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeSubtitle', {}) ??
                'Preporučuje se za starije uređaje i uređaje sa malo RAM memorije',
          'settings.performance.lowPerformanceModeDialogTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogTitle', {}) ?? 'Režim niskih performansi',
          'settings.performance.lowPerformanceModeDialogDisablesDetailed' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesDetailed', {}) ??
                '- Onemogućava detaljne informacije o napretku učitavanja',
          'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive', {}) ??
                '- Onemogućava elemente koji zahtevaju mnogo resursa (zamućenja, animiranu neprozirnost, pojedine animacije…)',
          'settings.performance.lowPerformanceModeDialogSetsOptimal' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogSetsOptimal', {}) ??
                'Postavlja optimalna podešavanja za ove opcije (možete ih kasnije zasebno promeniti):',
          'settings.performance.autoplayVideos' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.autoplayVideos', {}) ?? 'Automatski reprodukuj video zapise',
          'settings.performance.disableVideos' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideos', {}) ?? 'Onemogući video zapise',
          'settings.performance.disableVideosHelp' => TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideosHelp', {}) ?? 'Korisno na slabijim uređajima koji se ruše pri pokušaju učitavanja videa. Daje opcije za gledanje videa u spoljnom plejeru ili pregledaču.',
          'settings.cache.title' => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? 'Preuzimanje i keširanje',
          'settings.cache.snatchQuality' => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchQuality', {}) ?? 'Kvalitet preuzimanja',
          'settings.cache.snatchCooldown' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.snatchCooldown', {}) ?? 'Pauza između preuzimanja (u ms)',
          'settings.cache.pleaseEnterAValidTimeout' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.pleaseEnterAValidTimeout', {}) ??
                'Unesite važeću vrednost vremenskog ograničenja',
          'settings.cache.biggerThan10' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.biggerThan10', {}) ?? 'Unesite vrednost veću od 10 ms',
          'settings.cache.showDownloadNotifications' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.showDownloadNotifications', {}) ?? 'Prikaži obaveštenja o preuzimanju',
          'settings.cache.snatchItemsOnFavouriting' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.snatchItemsOnFavouriting', {}) ?? 'Preuzmi stavke prilikom dodavanja u omiljene',
          'settings.cache.favouriteItemsOnSnatching' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.favouriteItemsOnSnatching', {}) ??
                'Dodaj stavke u omiljene prilikom preuzimanja',
          'settings.cache.writeImageDataOnSave' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.writeImageDataOnSave', {}) ?? 'Zapiši podatke o slici u JSON prilikom čuvanja',
          'settings.cache.requiresCustomStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.requiresCustomStorageDirectory', {}) ?? 'Zahteva prilagođeni direktorijum',
          'settings.cache.setStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.setStorageDirectory', {}) ?? 'Postavi direktorijum za skladištenje',
          'settings.cache.currentPath' => ({
            required String path,
          }) => TranslationOverrides.string(_root.$meta, 'settings.cache.currentPath', {'path': path}) ?? 'Trenutno: ${path}',
          'settings.cache.resetStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.resetStorageDirectory', {}) ?? 'Resetuj direktorijum za skladištenje',
          'settings.cache.cachePreviews' => TranslationOverrides.string(_root.$meta, 'settings.cache.cachePreviews', {}) ?? 'Keširaj preglede',
          'settings.cache.cacheMedia' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheMedia', {}) ?? 'Keširaj medije',
          'settings.cache.videoCacheMode' => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheMode', {}) ?? 'Režim keširanja videa',
          'settings.cache.videoCacheModesTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModesTitle', {}) ?? 'Režimi keširanja videa',
          'settings.cache.videoCacheModeStream' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStream', {}) ??
                '- Strimovanje - Ne keširaj, započni reprodukciju što je pre moguće',
          'settings.cache.videoCacheModeCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeCache', {}) ??
                '- Keširanje - Čuva datoteku u skladištu uređaja, reprodukuje tek kada se preuzimanje završi',
          'settings.cache.videoCacheModeStreamCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStreamCache', {}) ??
                '- Strimovanje+keširanje - Kombinacija oba, ali trenutno dovodi do dvostrukog preuzimanja',
          'settings.cache.videoCacheNoteEnable' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheNoteEnable', {}) ??
                '[Napomena]: Video zapisi će se keširati samo ako je opcija \'Keširaj medije\' omogućena.',
          'settings.cache.videoCacheWarningDesktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheWarningDesktop', {}) ??
                '[Upozorenje]: Na računaru režim strimovanja može raditi nepravilno za pojedine Booru sajtove.',
          'settings.cache.deleteCacheAfter' => TranslationOverrides.string(_root.$meta, 'settings.cache.deleteCacheAfter', {}) ?? 'Obriši keš nakon:',
          'settings.cache.neverDeleteDuration' => TranslationOverrides.string(_root.$meta, 'settings.cache.neverDeleteDuration', {}) ?? 'Nikada',
          'settings.cache.cacheSizeLimit' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.cacheSizeLimit', {}) ?? 'Ograničenje veličine keša (u GB)',
          'settings.cache.maximumTotalCacheSize' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.maximumTotalCacheSize', {}) ?? 'Maksimalna ukupna veličina keša',
          'settings.cache.cacheStats' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheStats', {}) ?? 'Statistika keša:',
          'settings.cache.loading' => TranslationOverrides.string(_root.$meta, 'settings.cache.loading', {}) ?? 'Učitavanje…',
          'settings.cache.empty' => TranslationOverrides.string(_root.$meta, 'settings.cache.empty', {}) ?? 'Prazno',
          'settings.cache.inFilesPlural' =>
            ({required String size, required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.cache.inFilesPlural', {'size': size, 'count': count}) ??
                '${size}, broj datoteka: ${count}',
          'settings.cache.inFileSingular' => ({
            required String size,
          }) => TranslationOverrides.string(_root.$meta, 'settings.cache.inFileSingular', {'size': size}) ?? '${size}, 1 datoteka',
          'settings.cache.cacheTypeTotal' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeTotal', {}) ?? 'Ukupno',
          'settings.cache.cacheTypeFavicons' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeFavicons', {}) ?? 'Favikoni',
          'settings.cache.cacheTypeThumbnails' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeThumbnails', {}) ?? 'Minijature',
          'settings.cache.cacheTypeSamples' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeSamples', {}) ?? 'Uzorci',
          'settings.cache.cacheTypeMedia' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeMedia', {}) ?? 'Mediji',
          'settings.cache.cacheTypeWebView' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeWebView', {}) ?? 'Webview',
          'settings.cache.cacheCleared' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheCleared', {}) ?? 'Keš je obrisan',
          'settings.cache.clearedCacheType' => ({
            required String type,
          }) => TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheType', {'type': type}) ?? 'Obrisan je keš za: ${type}',
          'settings.cache.clearAllCache' => TranslationOverrides.string(_root.$meta, 'settings.cache.clearAllCache', {}) ?? 'Obriši sav keš',
          'settings.cache.clearedCacheCompletely' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheCompletely', {}) ?? 'Keš je potpuno obrisan',
          'settings.cache.appRestartRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.appRestartRequired', {}) ?? 'Možda je potrebno ponovno pokretanje aplikacije!',
          'settings.cache.errorExclamation' => TranslationOverrides.string(_root.$meta, 'settings.cache.errorExclamation', {}) ?? 'Greška!',
          'settings.cache.notAvailableForPlatform' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.notAvailableForPlatform', {}) ?? 'Trenutno nije dostupno za ovu platformu',
          'settings.itemFilters.title' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.title', {}) ?? 'Filteri',
          'settings.itemFilters.hidden' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.hidden', {}) ?? 'Skriveno',
          'settings.itemFilters.marked' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.marked', {}) ?? 'Označeno',
          'settings.itemFilters.duplicateFilter' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.duplicateFilter', {}) ?? 'Duplirani filter',
          'settings.itemFilters.alreadyInList' =>
            ({required String tag, required String type}) =>
                TranslationOverrides.string(_root.$meta, 'settings.itemFilters.alreadyInList', {'tag': tag, 'type': type}) ??
                '\'${tag}\' se već nalazi na listi: ${type}',
          'settings.itemFilters.noFiltersFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersFound', {}) ?? 'Nisu pronađeni filteri',
          'settings.itemFilters.noFiltersAdded' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersAdded', {}) ?? 'Nema dodatih filtera',
          'settings.itemFilters.removeHidden' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeHidden', {}) ??
                'Potpuno sakrij stavke koje odgovaraju skrivenim filterima',
          'settings.itemFilters.removeMarked' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeMarked', {}) ??
                'Potpuno sakrij stavke koje odgovaraju označenim filterima',
          'settings.itemFilters.removeFavourited' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeFavourited', {}) ?? 'Sakrij omiljene stavke',
          'settings.itemFilters.removeSnatched' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeSnatched', {}) ?? 'Sakrij preuzete stavke',
          'settings.itemFilters.removeAI' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeAI', {}) ?? 'Sakrij stavke označene kao AI',
          'settings.sync.title' => TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? 'Sinhronizacija',
          'settings.sync.dbError' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ?? 'Baza podataka mora biti omogućena za korišćenje sinhronizacije',
          'settings.sync.errorTitle' => TranslationOverrides.string(_root.$meta, 'settings.sync.errorTitle', {}) ?? 'Greška!',
          'settings.sync.pleaseEnterIPAndPort' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.pleaseEnterIPAndPort', {}) ?? 'Unesite IP adresu i port.',
          'settings.sync.selectWhatYouWantToDo' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.selectWhatYouWantToDo', {}) ?? 'Izaberite šta želite da uradite',
          'settings.sync.sendDataToDevice' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendDataToDevice', {}) ?? 'POŠALJI podatke NA drugi uređaj',
          'settings.sync.receiveDataFromDevice' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.receiveDataFromDevice', {}) ?? 'PRIMI podatke SA drugog uređaja',
          'settings.sync.senderInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.senderInstructions', {}) ??
                'Pokrenite server na drugom uređaju, unesite njegovu IP adresu/port, a zatim dodirnite Pokreni sinhronizaciju',
          'settings.sync.ipAddress' => TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddress', {}) ?? 'IP adresa',
          'settings.sync.ipAddressPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddressPlaceholder', {}) ?? 'IP adresa hosta (npr. 192.168.1.1)',
          'settings.sync.port' => TranslationOverrides.string(_root.$meta, 'settings.sync.port', {}) ?? 'Port',
          'settings.sync.portPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.portPlaceholder', {}) ?? 'Port hosta (npr. 7777)',
          'settings.sync.sendFavourites' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavourites', {}) ?? 'Pošalji omiljene',
          'settings.sync.favouritesCount' => ({
            required String count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.sync.favouritesCount', {'count': count}) ?? 'Omiljeno: ${count}',
          'settings.sync.sendFavouritesLegacy' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavouritesLegacy', {}) ?? 'Pošalji omiljene (zastarelo)',
          'settings.sync.syncFavsFrom' => TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFrom', {}) ?? 'Sinhronizuj omiljene od #…',
          'settings.sync.syncFavsFromHelpText1' => TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText1', {}) ?? 'Omogućava podešavanje odakle sinhronizacija treba da počne, što je korisno ako ste ranije već sinhronizovali sve svoje omiljene stavke i želite da sinhronizujete samo najnovije stavke',
          'settings.sync.syncFavsFromHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText2', {}) ??
                'Ako želite da sinhronizujete od početka, ostavite ovo polje prazno',
          'settings.sync.syncFavsFromHelpText3' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText3', {}) ??
                'Primer: Imate X omiljenih stavki, postavite ovo polje na 100, sinhronizacija će početi od stavke #100 i trajati dok ne stigne do X',
          'settings.sync.syncFavsFromHelpText4' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText4', {}) ??
                'Redosled omiljenih stavki: od najstarijih (0) do najnovijih (X)',
          'settings.sync.sendSnatchedHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendSnatchedHistory', {}) ?? 'Pošalji istoriju preuzimanja',
          'settings.sync.snatchedCount' => ({
            required String count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.sync.snatchedCount', {'count': count}) ?? 'Preuzeto: ${count}',
          'settings.sync.syncSnatchedFrom' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFrom', {}) ?? 'Sinhronizuj preuzeto od #…',
          'settings.sync.syncSnatchedFromHelpText1' => TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText1', {}) ?? 'Omogućava podešavanje odakle sinhronizacija treba da počne, što je korisno ako ste ranije već sinhronizovali celu istoriju preuzimanja i želite da sinhronizujete samo najnovije stavke',
          'settings.sync.syncSnatchedFromHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText2', {}) ??
                'Ako želite da sinhronizujete od početka, ostavite ovo polje prazno',
          'settings.sync.syncSnatchedFromHelpText3' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText3', {}) ??
                'Primer: Imate X preuzetih stavki, postavite ovo polje na 100, sinhronizacija će početi od stavke #100 i trajati dok ne stigne do X',
          'settings.sync.syncSnatchedFromHelpText4' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText4', {}) ??
                'Redosled preuzetih: od najstarijih (0) do najnovijih (X)',
          'settings.sync.sendSettings' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSettings', {}) ?? 'Pošalji podešavanja',
          'settings.sync.sendBooruConfigs' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendBooruConfigs', {}) ?? 'Pošalji Booru konfiguracije',
          'settings.sync.configsCount' => ({
            required String count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.sync.configsCount', {'count': count}) ?? 'Konfiguracije: ${count}',
          'settings.sync.sendTabs' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTabs', {}) ?? 'Pošalji kartice',
          'settings.sync.tabsCount' => ({
            required String count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsCount', {'count': count}) ?? 'Kartice: ${count}',
          'settings.sync.tabsSyncMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncMode', {}) ?? 'Režim sinhronizacije kartica',
          'settings.sync.tabsSyncModeMerge' => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeMerge', {}) ?? 'Objedini: Objedinjuje kartice sa ovog uređaja na drugom uređaju, pri čemu će kartice sa nepoznatim Booru sajtovima i već postojeće kartice biti zanemarene',
          'settings.sync.tabsSyncModeReplace' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeReplace', {}) ??
                'Zameni: Potpuno zamenjuje kartice na drugom uređaju karticama sa ovog uređaja',
          'settings.sync.merge' => TranslationOverrides.string(_root.$meta, 'settings.sync.merge', {}) ?? 'Objedini',
          'settings.sync.replace' => TranslationOverrides.string(_root.$meta, 'settings.sync.replace', {}) ?? 'Zameni',
          'settings.sync.sendTags' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTags', {}) ?? 'Pošalji oznake',
          'settings.sync.tagsCount' => ({
            required String count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsCount', {'count': count}) ?? 'Oznake: ${count}',
          'settings.sync.tagsSyncMode' => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncMode', {}) ?? 'Režim sinhronizacije oznaka',
          'settings.sync.tagsSyncModePreferTypeIfNone' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModePreferTypeIfNone', {}) ??
                'Sačuvaj postojeći tip: Pri uvozu ne prepisuj postojeći poznati tip oznake nepoznatim tipom.',
          'settings.sync.tagsSyncModeOverwrite' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModeOverwrite', {}) ??
                'Prepiši: Sve oznake će biti dodate, ako oznaka i tip oznake postoje na drugom uređaju biće prepisani',
          'settings.sync.preferTypeIfNone' => TranslationOverrides.string(_root.$meta, 'settings.sync.preferTypeIfNone', {}) ?? 'Sačuvaj tip',
          'settings.sync.overwrite' => TranslationOverrides.string(_root.$meta, 'settings.sync.overwrite', {}) ?? 'Prepiši',
          'settings.sync.testConnection' => TranslationOverrides.string(_root.$meta, 'settings.sync.testConnection', {}) ?? 'Testiraj vezu',
          'settings.sync.testConnectionHelpText1' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText1', {}) ?? 'Šalje probni zahtev drugom uređaju.',
          'settings.sync.testConnectionHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText2', {}) ?? 'Prikazuje obaveštenje o uspehu/neuspehu.',
          'settings.sync.startSync' => TranslationOverrides.string(_root.$meta, 'settings.sync.startSync', {}) ?? 'Pokreni sinhronizaciju',
          'settings.sync.portAndIPCannotBeEmpty' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.portAndIPCannotBeEmpty', {}) ?? 'Polja za port i IP ne mogu biti prazna!',
          'settings.sync.nothingSelectedToSync' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.nothingSelectedToSync', {}) ?? 'Niste izabrali ništa za sinhronizaciju!',
          'settings.sync.statsOfThisDevice' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.statsOfThisDevice', {}) ?? 'Statistika ovog uređaja:',
          'settings.sync.receiverInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.receiverInstructions', {}) ??
                'Pokrenite server za prijem podataka. Izbegavajte javni Wi-Fi iz bezbednosnih razloga',
          'settings.sync.availableNetworkInterfaces' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.availableNetworkInterfaces', {}) ?? 'Dostupni mrežni interfejsi',
          'settings.sync.selectedInterfaceIP' => ({
            required String ip,
          }) => TranslationOverrides.string(_root.$meta, 'settings.sync.selectedInterfaceIP', {'ip': ip}) ?? 'IP izabranog interfejsa: ${ip}',
          'settings.sync.serverPort' => TranslationOverrides.string(_root.$meta, 'settings.sync.serverPort', {}) ?? 'Port servera',
          'settings.sync.serverPortPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.serverPortPlaceholder', {}) ?? '(biće podrazumevano \'8080\' ako je prazno)',
          'settings.sync.startReceiverServer' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.startReceiverServer', {}) ?? 'Pokreni prijemni server',
          'settings.about.title' => TranslationOverrides.string(_root.$meta, 'settings.about.title', {}) ?? 'O aplikaciji',
          'settings.about.appDescription' => TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ?? 'LoliSnatcher je softver otvorenog koda licenciran pod GPLv3 licencom, a izvorni kod je dostupan na GitHub-u. Molimo prijavite sve probleme ili zahteve za novim funkcijama u odeljku za probleme (issues) u spremištu.',
          'settings.about.appOnGitHub' => TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? 'LoliSnatcher na GitHub-u',
          'settings.about.contact' => TranslationOverrides.string(_root.$meta, 'settings.about.contact', {}) ?? 'Kontakt',
          'settings.about.emailCopied' =>
            TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? 'Imejl je kopiran u privremenu memoriju',
          'settings.about.logoArtistThanks' => TranslationOverrides.string(_root.$meta, 'settings.about.logoArtistThanks', {}) ?? 'Veliko hvala autoru Showers-U što nam je omogućio korišćenje svog umetničkog rada za logotip aplikacije. Pogledajte njegov rad na platformi Pixiv',
          'settings.about.developers' => TranslationOverrides.string(_root.$meta, 'settings.about.developers', {}) ?? 'Programeri',
          'settings.about.localizers' => TranslationOverrides.string(_root.$meta, 'settings.about.localizers', {}) ?? 'Prevodioci',
          'settings.about.releases' => TranslationOverrides.string(_root.$meta, 'settings.about.releases', {}) ?? 'Izdanja',
          'settings.about.releasesMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.about.releasesMsg', {}) ??
                'Najnovija verzija i kompletan dnevnik promena mogu se naći na GitHub stranici sa izdanjima:',
          'settings.about.licenses' => TranslationOverrides.string(_root.$meta, 'settings.about.licenses', {}) ?? 'Licence',
          'settings.checkForUpdates.title' => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.title', {}) ?? 'Provera ažuriranja',
          'settings.checkForUpdates.updateAvailable' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateAvailable', {}) ?? 'Ažuriranje je dostupno!',
          'settings.checkForUpdates.whatsNew' => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.whatsNew', {}) ?? 'Šta je novo',
          'settings.checkForUpdates.updateChangelog' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? 'Dnevnik promena ažuriranja',
          'settings.checkForUpdates.updateCheckError' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? 'Greška pri proveri ažuriranja!',
          'settings.checkForUpdates.youHaveLatestVersion' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? 'Imate najnoviju verziju',
          'settings.checkForUpdates.viewLatestChangelog' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ?? 'Pogledaj najnoviji dnevnik promena',
          'settings.checkForUpdates.currentVersion' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? 'Trenutna verzija',
          'settings.checkForUpdates.changelog' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? 'Dnevnik promena',
          'settings.checkForUpdates.visitPlayStore' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? 'Poseti Play prodavnicu',
          'settings.checkForUpdates.visitReleases' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? 'Poseti izdanja',
          'settings.logs.title' => TranslationOverrides.string(_root.$meta, 'settings.logs.title', {}) ?? 'Dnevnici',
          'settings.logs.shareLogs' => TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogs', {}) ?? 'Podeli dnevnike',
          'settings.logs.shareLogsWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningTitle', {}) ?? 'Podeliti dnevnike sa spoljnom aplikacijom?',
          'settings.logs.shareLogsWarningMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningMsg', {}) ??
                '[UPOZORENJE]: Dnevnici mogu sadržati osetljive informacije, delite sa oprezom!',
          'settings.help.title' => TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? 'Pomoć',
          'settings.debug.title' => TranslationOverrides.string(_root.$meta, 'settings.debug.title', {}) ?? 'Otklanjanje grešaka',
          'settings.debug.enabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.enabledSnackbarMsg', {}) ?? 'Režim otklanjanja grešaka je omogućen!',
          'settings.debug.disabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.disabledSnackbarMsg', {}) ?? 'Režim otklanjanja grešaka je onemogućen!',
          'settings.debug.alreadyEnabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.alreadyEnabledSnackbarMsg', {}) ?? 'Režim otklanjanja grešaka je već omogućen!',
          'settings.debug.showPerformanceGraph' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.showPerformanceGraph', {}) ?? 'Prikaži grafikon performansi',
          'settings.debug.showFPSGraph' => TranslationOverrides.string(_root.$meta, 'settings.debug.showFPSGraph', {}) ?? 'Prikaži FPS grafikon',
          'settings.debug.showImageStats' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.showImageStats', {}) ?? 'Prikaži statistiku slika',
          'settings.debug.showVideoStats' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.showVideoStats', {}) ?? 'Prikaži statistiku video zapisa',
          'settings.debug.blurImagesAndMuteVideosDevOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.blurImagesAndMuteVideosDevOnly', {}) ??
                'Zamuti slike + isključi zvuk videa [samo za programere]',
          'settings.debug.enableDragScrollOnListsDesktopOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.enableDragScrollOnListsDesktopOnly', {}) ??
                'Omogući pomeranje prevlačenjem na listama [Samo za desktop]',
          'settings.debug.animationSpeed' => ({
            required double speed,
          }) => TranslationOverrides.string(_root.$meta, 'settings.debug.animationSpeed', {'speed': speed}) ?? 'Brzina animacije (${speed})',
          'settings.debug.tagsManager' => TranslationOverrides.string(_root.$meta, 'settings.debug.tagsManager', {}) ?? 'Upravljač oznakama',
          'settings.debug.resolution' =>
            ({required String width, required String height}) =>
                TranslationOverrides.string(_root.$meta, 'settings.debug.resolution', {'width': width, 'height': height}) ??
                'Rez: ${width}x${height}',
          'settings.debug.pixelRatio' => ({
            required String ratio,
          }) => TranslationOverrides.string(_root.$meta, 'settings.debug.pixelRatio', {'ratio': ratio}) ?? 'Odnos piksela: ${ratio}',
          'settings.debug.logger' => TranslationOverrides.string(_root.$meta, 'settings.debug.logger', {}) ?? 'Beleženje dnevnika',
          'settings.debug.webview' => TranslationOverrides.string(_root.$meta, 'settings.debug.webview', {}) ?? 'Webview',
          'settings.debug.deleteAllCookies' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.deleteAllCookies', {}) ?? 'Obriši sve kolačiće',
          'settings.debug.clearSecureStorage' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.clearSecureStorage', {}) ?? 'Očisti bezbedno skladište',
          'settings.debug.getSessionString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.getSessionString', {}) ?? 'Preuzmi string sesije',
          'settings.debug.setSessionString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.setSessionString', {}) ?? 'Postavi string sesije',
          'settings.debug.sessionString' => TranslationOverrides.string(_root.$meta, 'settings.debug.sessionString', {}) ?? 'String sesije',
          'settings.debug.restoredSessionFromString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.restoredSessionFromString', {}) ?? 'Sesija je obnovljena iz stringa',
          'settings.logging.logger' => TranslationOverrides.string(_root.$meta, 'settings.logging.logger', {}) ?? 'Beleženje dnevnika',
          'settings.logging.captureLogcat' =>
            TranslationOverrides.string(_root.$meta, 'settings.logging.captureLogcat', {}) ?? 'Snimaj Android logcat',
          'settings.logging.captureLogcatDescription' =>
            TranslationOverrides.string(_root.$meta, 'settings.logging.captureLogcatDescription', {}) ??
                'Beleži poruke upozorenja i grešaka iz Android procesa ove aplikacije',
          'settings.webview.openWebview' => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? 'Otvori Webview',
          'settings.webview.openWebviewTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? 'za prijavu ili preuzimanje kolačića',
          'settings.dirPicker.directoryName' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryName', {}) ?? 'Naziv direktorijuma',
          'settings.dirPicker.selectADirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.selectADirectory', {}) ?? 'Izaberite direktorijum',
          'settings.dirPicker.closeWithoutChoosing' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.closeWithoutChoosing', {}) ??
                'Da li želite da zatvorite birač bez izbora direktorijuma?',
          'settings.dirPicker.no' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.no', {}) ?? 'Ne',
          'settings.dirPicker.yes' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.yes', {}) ?? 'Da',
          'settings.dirPicker.error' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.error', {}) ?? 'Greška!',
          'settings.dirPicker.failedToCreateDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.failedToCreateDirectory', {}) ?? 'Kreiranje direktorijuma nije uspelo',
          'settings.dirPicker.directoryNotWritable' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryNotWritable', {}) ?? 'U direktorijum nije moguće upisivati!',
          'settings.dirPicker.newDirectory' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.newDirectory', {}) ?? 'Novi direktorijum',
          'settings.dirPicker.create' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.create', {}) ?? 'Kreiraj',
          'settings.version' => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? 'Verzija',
          'comments.title' => TranslationOverrides.string(_root.$meta, 'comments.title', {}) ?? 'Komentari',
          'comments.noComments' => TranslationOverrides.string(_root.$meta, 'comments.noComments', {}) ?? 'Nema komentara',
          'comments.noBooruAPIForComments' =>
            TranslationOverrides.string(_root.$meta, 'comments.noBooruAPIForComments', {}) ?? 'Ovaj Booru nema komentare ili ne postoji API za njih',
          'pageChanger.title' => TranslationOverrides.string(_root.$meta, 'pageChanger.title', {}) ?? 'Promena stranice',
          'pageChanger.pageLabel' => TranslationOverrides.string(_root.$meta, 'pageChanger.pageLabel', {}) ?? 'Stranica br.',
          'pageChanger.delayBetweenLoadings' =>
            TranslationOverrides.string(_root.$meta, 'pageChanger.delayBetweenLoadings', {}) ?? 'Kašnjenje između učitavanja (ms)',
          'pageChanger.delayInMs' => TranslationOverrides.string(_root.$meta, 'pageChanger.delayInMs', {}) ?? 'Kašnjenje u ms',
          'pageChanger.currentPage' => ({
            required int number,
          }) => TranslationOverrides.string(_root.$meta, 'pageChanger.currentPage', {'number': number}) ?? 'Trenutna stranica br. ${number}',
          'pageChanger.possibleMaxPage' => ({
            required int number,
          }) => TranslationOverrides.string(_root.$meta, 'pageChanger.possibleMaxPage', {'number': number}) ?? 'Moguća maks. stranica br. ~${number}',
          'pageChanger.searchCurrentlyRunning' =>
            TranslationOverrides.string(_root.$meta, 'pageChanger.searchCurrentlyRunning', {}) ?? 'Pretraga je trenutno u toku!',
          'pageChanger.jumpToPage' => TranslationOverrides.string(_root.$meta, 'pageChanger.jumpToPage', {}) ?? 'Idi na stranicu',
          'pageChanger.searchUntilPage' => TranslationOverrides.string(_root.$meta, 'pageChanger.searchUntilPage', {}) ?? 'Pretražuj do stranice',
          'pageChanger.stopSearching' => TranslationOverrides.string(_root.$meta, 'pageChanger.stopSearching', {}) ?? 'Zaustavi pretragu',
          'tagsFiltersDialogs.emptyInput' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.emptyInput', {}) ?? 'Prazan unos!',
          'tagsFiltersDialogs.addNewFilter' => ({
            required String type,
          }) => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.addNewFilter', {'type': type}) ?? '[Dodaj novi ${type} filter]',
          'tagsFiltersDialogs.newTagFilter' => ({
            required String type,
          }) => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newTagFilter', {'type': type}) ?? 'Novi ${type} filter oznaka',
          'tagsFiltersDialogs.newFilter' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newFilter', {}) ?? 'Novi filter',
          'tagsFiltersDialogs.editFilter' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.editFilter', {}) ?? 'Uredi filter',
          'tagsManager.title' => TranslationOverrides.string(_root.$meta, 'tagsManager.title', {}) ?? 'Oznake',
          'tagsManager.addTag' => TranslationOverrides.string(_root.$meta, 'tagsManager.addTag', {}) ?? 'Dodaj oznaku',
          'tagsManager.name' => TranslationOverrides.string(_root.$meta, 'tagsManager.name', {}) ?? 'Naziv',
          'tagsManager.type' => TranslationOverrides.string(_root.$meta, 'tagsManager.type', {}) ?? 'Tip',
          'tagsManager.add' => TranslationOverrides.string(_root.$meta, 'tagsManager.add', {}) ?? 'Dodaj',
          'tagsManager.staleAfter' => ({
            required String staleText,
          }) => TranslationOverrides.string(_root.$meta, 'tagsManager.staleAfter', {'staleText': staleText}) ?? 'Zastareva nakon: ${staleText}',
          'tagsManager.addedATab' => TranslationOverrides.string(_root.$meta, 'tagsManager.addedATab', {}) ?? 'Dodata je kartica',
          'tagsManager.addATab' => TranslationOverrides.string(_root.$meta, 'tagsManager.addATab', {}) ?? 'Dodaj karticu',
          'tagsManager.copy' => TranslationOverrides.string(_root.$meta, 'tagsManager.copy', {}) ?? 'Kopiraj',
          'tagsManager.setStale' => TranslationOverrides.string(_root.$meta, 'tagsManager.setStale', {}) ?? 'Postavi kao zastarelo',
          'tagsManager.resetStale' => TranslationOverrides.string(_root.$meta, 'tagsManager.resetStale', {}) ?? 'Resetuj zastarelost',
          'tagsManager.makeUnstaleable' => TranslationOverrides.string(_root.$meta, 'tagsManager.makeUnstaleable', {}) ?? 'Onemogući zastarevanje',
          'tagsManager.deleteTags' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'tagsManager.deleteTags', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
                  count,
                  one: 'Obriši ${count} oznaku',
                  few: 'Obriši ${count} oznake',
                  other: 'Obriši ${count} oznaka',
                ),
          'tagsManager.deleteTagsTitle' => TranslationOverrides.string(_root.$meta, 'tagsManager.deleteTagsTitle', {}) ?? 'Obriši oznake',
          'tagsManager.clearSelection' => TranslationOverrides.string(_root.$meta, 'tagsManager.clearSelection', {}) ?? 'Poništi izbor',
          'lockscreen.tapToAuthenticate' =>
            TranslationOverrides.string(_root.$meta, 'lockscreen.tapToAuthenticate', {}) ?? 'Dodirnite za potvrdu identiteta',
          'lockscreen.devUnlock' => TranslationOverrides.string(_root.$meta, 'lockscreen.devUnlock', {}) ?? 'OTKLJUČAJ ZA TESTIRANJE',
          'lockscreen.testingMessage' => TranslationOverrides.string(_root.$meta, 'lockscreen.testingMessage', {}) ?? '[TESTIRANJE]: Pritisnite ovo ako ne možete da otključate aplikaciju na uobičajen način. Prijavite programeru uz detalje o svom uređaju.',
          'loliSync.title' => TranslationOverrides.string(_root.$meta, 'loliSync.title', {}) ?? 'Sinhronizacija',
          'loliSync.stopSyncingQuestion' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.stopSyncingQuestion', {}) ?? 'Da li želite da zaustavite sinhronizaciju?',
          'loliSync.stopServerQuestion' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.stopServerQuestion', {}) ?? 'Da li želite da zaustavite server?',
          'loliSync.noConnection' => TranslationOverrides.string(_root.$meta, 'loliSync.noConnection', {}) ?? 'Nema veze',
          'loliSync.waitingForConnection' => TranslationOverrides.string(_root.$meta, 'loliSync.waitingForConnection', {}) ?? 'Čekanje na vezu…',
          'loliSync.startingServer' => TranslationOverrides.string(_root.$meta, 'loliSync.startingServer', {}) ?? 'Pokretanje servera…',
          'loliSync.keepScreenAwake' => TranslationOverrides.string(_root.$meta, 'loliSync.keepScreenAwake', {}) ?? 'Drži ekran uključenim',
          'loliSync.serverKilled' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.serverKilled', {}) ?? 'Server za sinhronizaciju je zaustavljen',
          'loliSync.testError' =>
            ({required int statusCode, required String reasonPhrase}) =>
                TranslationOverrides.string(_root.$meta, 'loliSync.testError', {'statusCode': statusCode, 'reasonPhrase': reasonPhrase}) ??
                'Greška pri testiranju: ${statusCode} ${reasonPhrase}',
          'loliSync.testErrorException' => ({
            required String error,
          }) => TranslationOverrides.string(_root.$meta, 'loliSync.testErrorException', {'error': error}) ?? 'Greška pri testiranju: ${error}',
          'loliSync.testSuccess' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.testSuccess', {}) ?? 'Probni zahtev je dobio pozitivan odgovor',
          'loliSync.testSuccessMessage' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.testSuccessMessage', {}) ??
                'Na drugom uređaju bi trebalo da se pojavi poruka \'Test\'',
          'imageSearch.title' => TranslationOverrides.string(_root.$meta, 'imageSearch.title', {}) ?? 'Pretraga po slici',
          'tagView.tags' => TranslationOverrides.string(_root.$meta, 'tagView.tags', {}) ?? 'Oznake',
          'tagView.comments' => TranslationOverrides.string(_root.$meta, 'tagView.comments', {}) ?? 'Komentari',
          'tagView.showNotes' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'tagView.showNotes', {'count': count}) ?? 'Prikaži beleške (${count})',
          'tagView.hideNotes' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'tagView.hideNotes', {'count': count}) ?? 'Sakrij beleške (${count})',
          'tagView.loadNotes' => TranslationOverrides.string(_root.$meta, 'tagView.loadNotes', {}) ?? 'Učitaj beleške',
          'tagView.thisTagAlreadyInSearch' =>
            TranslationOverrides.string(_root.$meta, 'tagView.thisTagAlreadyInSearch', {}) ?? 'Ova oznaka je već u trenutnom upitu za pretragu:',
          'tagView.addedToCurrentSearch' =>
            TranslationOverrides.string(_root.$meta, 'tagView.addedToCurrentSearch', {}) ?? 'Dodato u trenutni upit za pretragu:',
          'tagView.addedNewTab' => TranslationOverrides.string(_root.$meta, 'tagView.addedNewTab', {}) ?? 'Dodata nova kartica:',
          'tagView.id' => TranslationOverrides.string(_root.$meta, 'tagView.id', {}) ?? 'ID',
          'tagView.postURL' => TranslationOverrides.string(_root.$meta, 'tagView.postURL', {}) ?? 'URL objave',
          'tagView.uploader' => TranslationOverrides.string(_root.$meta, 'tagView.uploader', {}) ?? 'Otpremalac',
          'tagView.posted' => TranslationOverrides.string(_root.$meta, 'tagView.posted', {}) ?? 'Objavljeno',
          'tagView.details' => TranslationOverrides.string(_root.$meta, 'tagView.details', {}) ?? 'Detalji',
          'tagView.filename' => TranslationOverrides.string(_root.$meta, 'tagView.filename', {}) ?? 'Naziv datoteke',
          'tagView.url' => TranslationOverrides.string(_root.$meta, 'tagView.url', {}) ?? 'URL',
          'tagView.extension' => TranslationOverrides.string(_root.$meta, 'tagView.extension', {}) ?? 'Ekstenzija',
          'tagView.resolution' => TranslationOverrides.string(_root.$meta, 'tagView.resolution', {}) ?? 'Rezolucija',
          'tagView.size' => TranslationOverrides.string(_root.$meta, 'tagView.size', {}) ?? 'Veličina',
          'tagView.md5' => TranslationOverrides.string(_root.$meta, 'tagView.md5', {}) ?? 'MD5',
          'tagView.rating' => TranslationOverrides.string(_root.$meta, 'tagView.rating', {}) ?? 'Kategorija sadržaja',
          'tagView.score' => TranslationOverrides.string(_root.$meta, 'tagView.score', {}) ?? 'Broj poena',
          'tagView.noTagsFound' => TranslationOverrides.string(_root.$meta, 'tagView.noTagsFound', {}) ?? 'Nisu pronađene oznake',
          'tagView.copy' => TranslationOverrides.string(_root.$meta, 'tagView.copy', {}) ?? 'Kopiraj',
          'tagView.removeFromSearch' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromSearch', {}) ?? 'Ukloni iz pretrage',
          'tagView.addToSearch' => TranslationOverrides.string(_root.$meta, 'tagView.addToSearch', {}) ?? 'Dodaj u pretragu',
          'tagView.addedToSearchBar' => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBar', {}) ?? 'Dodato u traku za pretragu:',
          'tagView.excludeFromSearch' => TranslationOverrides.string(_root.$meta, 'tagView.excludeFromSearch', {}) ?? 'Izuzmi iz pretrage',
          'tagView.exclusionAddedToSearchBar' =>
            TranslationOverrides.string(_root.$meta, 'tagView.exclusionAddedToSearchBar', {}) ?? 'Dodato izuzimanje u traku za pretragu:',
          'tagView.addToMarked' => TranslationOverrides.string(_root.$meta, 'tagView.addToMarked', {}) ?? 'Dodaj u označeno',
          'tagView.addToHidden' => TranslationOverrides.string(_root.$meta, 'tagView.addToHidden', {}) ?? 'Dodaj u skriveno',
          'tagView.removeFromMarked' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromMarked', {}) ?? 'Ukloni iz označenog',
          'tagView.removeFromHidden' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromHidden', {}) ?? 'Ukloni iz skrivenog',
          'tagView.editTag' => TranslationOverrides.string(_root.$meta, 'tagView.editTag', {}) ?? 'Uredi oznaku',
          'tagView.sourceDialogTitle' => TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogTitle', {}) ?? 'Izvor',
          'tagView.preview' => TranslationOverrides.string(_root.$meta, 'tagView.preview', {}) ?? 'Pregled',
          'tagView.selectBooruToLoad' => TranslationOverrides.string(_root.$meta, 'tagView.selectBooruToLoad', {}) ?? 'Izaberite Booru za učitavanje',
          'tagView.previewIsLoading' => TranslationOverrides.string(_root.$meta, 'tagView.previewIsLoading', {}) ?? 'Pregled se učitava…',
          'tagView.failedToLoadPreview' =>
            TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreview', {}) ?? 'Učitavanje pregleda nije uspelo',
          'tagView.tapToTryAgain' => TranslationOverrides.string(_root.$meta, 'tagView.tapToTryAgain', {}) ?? 'Dodirnite za ponovni pokušaj',
          'tagView.copiedFileURL' =>
            TranslationOverrides.string(_root.$meta, 'tagView.copiedFileURL', {}) ?? 'URL datoteke je kopiran u privremenu memoriju',
          'tagView.tagPreviews' => TranslationOverrides.string(_root.$meta, 'tagView.tagPreviews', {}) ?? 'Pregledi oznaka',
          'tagView.currentState' => TranslationOverrides.string(_root.$meta, 'tagView.currentState', {}) ?? 'Trenutno stanje',
          'tagView.history' => TranslationOverrides.string(_root.$meta, 'tagView.history', {}) ?? 'Istorija',
          'tagView.failedToLoadPreviewPage' =>
            TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreviewPage', {}) ?? 'Učitavanje stranice pregleda nije uspelo',
          'tagView.tryAgain' => TranslationOverrides.string(_root.$meta, 'tagView.tryAgain', {}) ?? 'Pokušajte ponovo',
          'tagView.detectedLinks' => TranslationOverrides.string(_root.$meta, 'tagView.detectedLinks', {}) ?? 'Otkriveni linkovi:',
          'tagView.relatedTabs' => TranslationOverrides.string(_root.$meta, 'tagView.relatedTabs', {}) ?? 'Povezane kartice',
          'tagView.tabsWithOnlyTag' =>
            TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTag', {}) ?? 'Kartice koje sadrže samo ovu oznaku',
          'tagView.tabsWithOnlyTagDifferentBooru' =>
            TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTagDifferentBooru', {}) ??
                'Kartice koje sadrže samo ovu oznaku ali na drugom Booru-u',
          'tagView.tabsContainingTag' =>
            TranslationOverrides.string(_root.$meta, 'tagView.tabsContainingTag', {}) ?? 'Kartice koje sadrže ovu oznaku',
          'pinnedTags.pinnedTags' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedTags', {}) ?? 'Zakačene oznake',
          'pinnedTags.pinTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinTag', {}) ?? 'Zakači oznaku',
          'pinnedTags.unpinTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinTag', {}) ?? 'Otkači oznaku',
          'pinnedTags.pin' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pin', {}) ?? 'Zakači',
          'pinnedTags.unpin' => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpin', {}) ?? 'Otkači',
          'pinnedTags.pinQuestion' => ({
            required String tag,
          }) => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinQuestion', {'tag': tag}) ?? 'Zakačiti «${tag}» u brzi pristup?',
          'pinnedTags.unpinQuestion' => ({
            required String tag,
          }) => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinQuestion', {'tag': tag}) ?? 'Ukloniti «${tag}» iz zakačenih oznaka?',
          'pinnedTags.onlyForBooru' => ({
            required String name,
          }) => TranslationOverrides.string(_root.$meta, 'pinnedTags.onlyForBooru', {'name': name}) ?? 'Samo za ${name}',
          'pinnedTags.labelsOptional' => TranslationOverrides.string(_root.$meta, 'pinnedTags.labelsOptional', {}) ?? 'Labele (opciono)',
          'pinnedTags.typeAndPressAdd' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.typeAndPressAdd', {}) ??
                'Unesite tekst i pritisnite dugme Dodaj da biste uključili labelu',
          'pinnedTags.selectExistingLabel' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.selectExistingLabel', {}) ?? 'Izaberite postojeću labelu',
          'pinnedTags.tagPinned' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagPinned', {}) ?? 'Oznaka je zakačena',
          'pinnedTags.pinnedForBooru' =>
            ({required String name, required String labels}) =>
                TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedForBooru', {'name': name, 'labels': labels}) ??
                'Zakačeno za ${name}${labels}',
          'pinnedTags.pinnedGloballyWithLabels' => ({
            required String labels,
          }) => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedGloballyWithLabels', {'labels': labels}) ?? 'Zakačeno globalno${labels}',
          'pinnedTags.tagUnpinned' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagUnpinned', {}) ?? 'Oznaka je otkačena',
          'pinnedTags.all' => TranslationOverrides.string(_root.$meta, 'pinnedTags.all', {}) ?? 'Sve',
          'pinnedTags.reorderPinnedTags' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.reorderPinnedTags', {}) ?? 'Promeni redosled zakačenih oznaka',
          'pinnedTags.saving' => TranslationOverrides.string(_root.$meta, 'pinnedTags.saving', {}) ?? 'Čuvanje…',
          'pinnedTags.reorder' => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorder', {}) ?? 'Promeni redosled',
          'pinnedTags.addTagManually' => TranslationOverrides.string(_root.$meta, 'pinnedTags.addTagManually', {}) ?? 'Dodaj oznaku ručno',
          'pinnedTags.noTagsMatchSearch' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.noTagsMatchSearch', {}) ?? 'Nijedna oznaka ne odgovara vašoj pretrazi',
          'pinnedTags.noPinnedTagsYet' => TranslationOverrides.string(_root.$meta, 'pinnedTags.noPinnedTagsYet', {}) ?? 'Još nema zakačenih oznaka',
          'pinnedTags.editLabels' => TranslationOverrides.string(_root.$meta, 'pinnedTags.editLabels', {}) ?? 'Uredi labele',
          'pinnedTags.labels' => TranslationOverrides.string(_root.$meta, 'pinnedTags.labels', {}) ?? 'Labele',
          'pinnedTags.addPinnedTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.addPinnedTag', {}) ?? 'Dodaj zakačenu oznaku',
          'pinnedTags.tagQuery' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQuery', {}) ?? 'Upit oznake',
          'pinnedTags.tagQueryHint' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQueryHint', {}) ?? 'naziv_oznake',
          'pinnedTags.rawQueryHelp' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.rawQueryHelp', {}) ??
                'Možete uneti bilo koji upit za pretragu, uključujući oznake sa razmacima',
          'searchBar.searchForTags' => TranslationOverrides.string(_root.$meta, 'searchBar.searchForTags', {}) ?? 'Pretraži oznake',
          'searchBar.failedToLoadSuggestions' =>
            ({required String msg}) =>
                TranslationOverrides.string(_root.$meta, 'searchBar.failedToLoadSuggestions', {'msg': msg}) ??
                'Učitavanje predloga nije uspelo. Dodirnite za ponovni pokušaj${msg}',
          'searchBar.noSuggestionsFound' =>
            TranslationOverrides.string(_root.$meta, 'searchBar.noSuggestionsFound', {}) ?? 'Nema pronađenih predloga',
          'searchBar.tagSuggestionsNotAvailable' =>
            TranslationOverrides.string(_root.$meta, 'searchBar.tagSuggestionsNotAvailable', {}) ?? 'Predlozi oznaka nisu dostupni za ovaj Booru',
          'searchBar.copiedTagToClipboard' => ({
            required String tag,
          }) => TranslationOverrides.string(_root.$meta, 'searchBar.copiedTagToClipboard', {'tag': tag}) ?? 'Kopirano «${tag}» u privremenu memoriju',
          'searchBar.prefix' => TranslationOverrides.string(_root.$meta, 'searchBar.prefix', {}) ?? 'Prefiks',
          'searchBar.exclude' => TranslationOverrides.string(_root.$meta, 'searchBar.exclude', {}) ?? 'Izuzmi (—)',
          'searchBar.booruNumberPrefix' => TranslationOverrides.string(_root.$meta, 'searchBar.booruNumberPrefix', {}) ?? 'Booru (N#)',
          'searchBar.metatags' => TranslationOverrides.string(_root.$meta, 'searchBar.metatags', {}) ?? 'Metaoznake',
          'searchBar.freeMetatags' => TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatags', {}) ?? 'Metaoznake van limita',
          'searchBar.freeMetatagsDescription' =>
            TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatagsDescription', {}) ??
                'Ove metaoznake se ne računaju u ograničenje broja oznaka u pretrazi',
          'searchBar.free' => TranslationOverrides.string(_root.$meta, 'searchBar.free', {}) ?? 'Van limita',
          'searchBar.single' => TranslationOverrides.string(_root.$meta, 'searchBar.single', {}) ?? 'Pojedinačno',
          'searchBar.range' => TranslationOverrides.string(_root.$meta, 'searchBar.range', {}) ?? 'Opseg',
          'searchBar.popular' => TranslationOverrides.string(_root.$meta, 'searchBar.popular', {}) ?? 'Popularno',
          'searchBar.selectDate' => TranslationOverrides.string(_root.$meta, 'searchBar.selectDate', {}) ?? 'Izaberite datum',
          'searchBar.selectDatesRange' => TranslationOverrides.string(_root.$meta, 'searchBar.selectDatesRange', {}) ?? 'Izaberite opseg datuma',
          'searchBar.history' => TranslationOverrides.string(_root.$meta, 'searchBar.history', {}) ?? 'Istorija',
          'searchBar.more' => TranslationOverrides.string(_root.$meta, 'searchBar.more', {}) ?? '…',
          'mobileHome.selectBooruForWebview' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.selectBooruForWebview', {}) ?? 'Izaberite Booru za Webview',
          'mobileHome.lockApp' => TranslationOverrides.string(_root.$meta, 'mobileHome.lockApp', {}) ?? 'Zaključaj aplikaciju',
          'mobileHome.fileAlreadyExists' => TranslationOverrides.string(_root.$meta, 'mobileHome.fileAlreadyExists', {}) ?? 'Datoteka već postoji',
          'mobileHome.failedToDownload' => TranslationOverrides.string(_root.$meta, 'mobileHome.failedToDownload', {}) ?? 'Preuzimanje nije uspelo',
          'mobileHome.cancelledByUser' => TranslationOverrides.string(_root.$meta, 'mobileHome.cancelledByUser', {}) ?? 'Otkazao korisnik',
          _ => null,
        } ??
        switch (path) {
          'mobileHome.saveAnyway' => TranslationOverrides.string(_root.$meta, 'mobileHome.saveAnyway', {}) ?? 'Ipak sačuvaj',
          'mobileHome.skip' => TranslationOverrides.string(_root.$meta, 'mobileHome.skip', {}) ?? 'Preskoči',
          'mobileHome.retryAll' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'mobileHome.retryAll', {'count': count}) ?? 'Pokušaj ponovo za sve (${count})',
          'mobileHome.existingFailedOrCancelledItems' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.existingFailedOrCancelledItems', {}) ?? 'Postojeće, neuspele ili otkazane stavke',
          'mobileHome.clearAllRetryableItems' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.clearAllRetryableItems', {}) ?? 'Očisti sve stavke koje se mogu ponoviti',
          'desktopHome.snatcher' => TranslationOverrides.string(_root.$meta, 'desktopHome.snatcher', {}) ?? 'Preuzimanje',
          'desktopHome.addBoorusInSettings' =>
            TranslationOverrides.string(_root.$meta, 'desktopHome.addBoorusInSettings', {}) ?? 'Dodajte booru sajtove u podešavanjima',
          'desktopHome.settings' => TranslationOverrides.string(_root.$meta, 'desktopHome.settings', {}) ?? 'Podešavanja',
          'desktopHome.save' => TranslationOverrides.string(_root.$meta, 'desktopHome.save', {}) ?? 'Sačuvaj',
          'desktopHome.noItemsSelected' =>
            TranslationOverrides.string(_root.$meta, 'desktopHome.noItemsSelected', {}) ?? 'Nijedna stavka nije izabrana',
          'galleryView.noItems' => TranslationOverrides.string(_root.$meta, 'galleryView.noItems', {}) ?? 'Nema stavki',
          'galleryView.noItemSelected' =>
            TranslationOverrides.string(_root.$meta, 'galleryView.noItemSelected', {}) ?? 'Nijedna stavka nije izabrana',
          'galleryView.close' => TranslationOverrides.string(_root.$meta, 'galleryView.close', {}) ?? 'Zatvori',
          'mediaPreviews.noBooruConfigsFound' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.noBooruConfigsFound', {}) ?? 'Nisu pronađene booru konfiguracije',
          'mediaPreviews.addNewBooru' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? 'Dodaj novi Booru',
          'mediaPreviews.help' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.help', {}) ?? 'Pomoć',
          'mediaPreviews.settings' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.settings', {}) ?? 'Podešavanja',
          'mediaPreviews.onboardingTitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.onboardingTitle', {}) ?? 'Podesite svoj prvi izvor',
          'mediaPreviews.onboardingSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.onboardingSubtitle', {}) ??
                'Dodajte booru konfiguraciju ili vratite rezervnu kopiju da biste započeli pregledanje',
          'mediaPreviews.addBooruAction' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addBooruAction', {}) ?? 'Dodaj novi booru',
          'mediaPreviews.addBooruActionSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.addBooruActionSubtitle', {}) ??
                'Povežite sajt dodavanjem njegovog URL-a i podešavanja pretrage',
          'mediaPreviews.restoreBackupAction' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoreBackupAction', {}) ??
                'Vrati podatke iz rezervne kopije ili upravljaj kopijama',
          'mediaPreviews.restoreBackupActionSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoreBackupActionSubtitle', {}) ??
                'Vratite podešavanja, booru sajtove, kartice i sačuvane podatke',
          'mediaPreviews.openSettingsAction' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.openSettingsAction', {}) ?? 'Otvori podešavanja',
          'mediaPreviews.openSettingsActionSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.openSettingsActionSubtitle', {}) ??
                'Prilagodite ponašanje aplikacije pre podešavanja izvora',
          'mediaPreviews.helpSectionTitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.helpSectionTitle', {}) ?? 'Potrebna vam je pomoć?',
          'mediaPreviews.booruSourcesArticle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.booruSourcesArticle', {}) ??
                'Kako dodati booru konfiguraciju i kako one funkcionišu',
          'mediaPreviews.booruSourcesArticleSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.booruSourcesArticleSubtitle', {}) ??
                'Uputstva za korisnike koji podešavaju svoju prvu booru konfiguraciju',
          'mediaPreviews.backupRestoreArticle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.backupRestoreArticle', {}) ?? 'Vraćanje podataka iz rezervne kopije',
          'mediaPreviews.backupRestoreArticleSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.backupRestoreArticleSubtitle', {}) ??
                'Uputstva za korisnike koji prelaze sa prethodne aplikacije ili verzije',
          'mediaPreviews.restoringPreviousSession' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoringPreviousSession', {}) ?? 'Vraćanje prethodne sesije…',
          'mediaPreviews.copiedFileURL' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.copiedFileURL', {}) ?? 'URL datoteke je kopiran u privremenu memoriju!',
          'viewer.tutorial.images' => TranslationOverrides.string(_root.$meta, 'viewer.tutorial.images', {}) ?? 'Slike',
          'viewer.tutorial.tapLongTapToggleImmersive' =>
            TranslationOverrides.string(_root.$meta, 'viewer.tutorial.tapLongTapToggleImmersive', {}) ??
                'Dodir/dugi dodir: uključi/isključi imerzivni režim',
          'viewer.tutorial.doubleTapFitScreen' =>
            TranslationOverrides.string(_root.$meta, 'viewer.tutorial.doubleTapFitScreen', {}) ??
                'Dvostruki dodir: prilagodi ekranu / originalna veličina / resetuj zum',
          'viewer.appBar.cantStartSlideshow' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.cantStartSlideshow', {}) ?? 'Nije moguće pokrenuti projekciju slajdova',
          'viewer.appBar.reachedLastLoadedItem' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.reachedLastLoadedItem', {}) ?? 'Dostignuta je poslednja učitana stavka',
          'viewer.appBar.pause' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.pause', {}) ?? 'Pauza',
          'viewer.appBar.start' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.start', {}) ?? 'Pokreni',
          'viewer.appBar.unfavourite' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.unfavourite', {}) ?? 'Ukloni iz omiljenih',
          'viewer.appBar.deselect' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.deselect', {}) ?? 'Poništi izbor',
          'viewer.appBar.reloadWithScaling' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.reloadWithScaling', {}) ?? 'Ponovo učitaj sa skaliranjem',
          'viewer.appBar.loadSampleQuality' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadSampleQuality', {}) ?? 'Učitaj umanjenu sliku',
          'viewer.appBar.loadHighQuality' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadHighQuality', {}) ?? 'Učitaj sliku visokog kvaliteta',
          'viewer.appBar.dropSnatchedStatus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.dropSnatchedStatus', {}) ?? 'Ukloni status preuzeto',
          'viewer.appBar.setSnatchedStatus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.setSnatchedStatus', {}) ?? 'Postavi status preuzeto',
          'viewer.appBar.snatch' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.snatch', {}) ?? 'Preuzmi',
          'viewer.appBar.forced' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.forced', {}) ?? '(forsirano)',
          'viewer.appBar.hydrusShare' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusShare', {}) ?? 'Hydrus deljenje',
          'viewer.appBar.whichUrlToShareToHydrus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.whichUrlToShareToHydrus', {}) ?? 'Koji URL želite da podelite na Hydrus?',
          'viewer.appBar.postURL' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURL', {}) ?? 'URL objave',
          'viewer.appBar.fileURL' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURL', {}) ?? 'URL datoteke',
          'viewer.appBar.hydrusNotConfigured' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusNotConfigured', {}) ?? 'Hydrus nije konfigurisan!',
          'viewer.appBar.shareFile' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareFile', {}) ?? 'Podeli datoteku',
          'viewer.appBar.alreadyDownloadingThisFile' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingThisFile', {}) ??
                'Ova datoteka se već preuzima radi deljenja, želite li da prekinete?',
          'viewer.appBar.alreadyDownloadingFile' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingFile', {}) ??
                'Datoteka se već preuzima radi deljenja. Želite li da prekinete trenutno preuzimanje i podelite novu datoteku?',
          'viewer.appBar.current' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.current', {}) ?? 'Trenutno:',
          'viewer.appBar.kNew' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.kNew', {}) ?? 'Novo:',
          'viewer.appBar.shareNew' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareNew', {}) ?? 'Podeli novo',
          'viewer.appBar.abort' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.abort', {}) ?? 'Prekini',
          'viewer.appBar.error' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.error', {}) ?? 'Greška!',
          'viewer.appBar.savingFileError' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.savingFileError', {}) ??
                'Došlo je do greške prilikom čuvanja datoteke pre deljenja',
          'viewer.appBar.whatToShare' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.whatToShare', {}) ?? 'Šta želite da podelite?',
          'viewer.appBar.postURLWithTags' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURLWithTags', {}) ?? 'URL objave sa oznakama',
          'viewer.appBar.fileURLWithTags' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURLWithTags', {}) ?? 'URL datoteke sa oznakama',
          'viewer.appBar.file' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.file', {}) ?? 'Datoteka',
          'viewer.appBar.fileWithTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileWithTags', {}) ?? 'Datoteka sa oznakama',
          'viewer.appBar.hydrus' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrus', {}) ?? 'Hydrus',
          'viewer.appBar.selectTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.selectTags', {}) ?? 'Izaberite oznake',
          'viewer.notes.note' => TranslationOverrides.string(_root.$meta, 'viewer.notes.note', {}) ?? 'Beleška',
          'viewer.notes.notes' => TranslationOverrides.string(_root.$meta, 'viewer.notes.notes', {}) ?? 'Beleške',
          'viewer.notes.coordinates' => ({
            required int posX,
            required int posY,
          }) => TranslationOverrides.string(_root.$meta, 'viewer.notes.coordinates', {'posX': posX, 'posY': posY}) ?? 'X:${posX}, Y:${posY}',
          'common.selectABooru' => TranslationOverrides.string(_root.$meta, 'common.selectABooru', {}) ?? 'Izaberite booru',
          'common.booruItemCopiedToClipboard' =>
            TranslationOverrides.string(_root.$meta, 'common.booruItemCopiedToClipboard', {}) ?? 'Booru stavka je kopirana u privremenu memoriju',
          'gallery.snatchQuestion' => TranslationOverrides.string(_root.$meta, 'gallery.snatchQuestion', {}) ?? 'Preuzmi?',
          'gallery.noPostUrl' => TranslationOverrides.string(_root.$meta, 'gallery.noPostUrl', {}) ?? 'Nema URL-a objave!',
          'gallery.loadingFile' => TranslationOverrides.string(_root.$meta, 'gallery.loadingFile', {}) ?? 'Učitavanje datoteke…',
          'gallery.loadingFileMessage' =>
            TranslationOverrides.string(_root.$meta, 'gallery.loadingFileMessage', {}) ?? 'Ovo može potrajati, sačekajte…',
          'gallery.sources' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'gallery.sources', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
                  count,
                  one: 'Izvor',
                  few: 'Izvori',
                  other: 'Izvori',
                ),
          'galleryButtons.snatch' => TranslationOverrides.string(_root.$meta, 'galleryButtons.snatch', {}) ?? 'Preuzmi',
          'galleryButtons.favourite' => TranslationOverrides.string(_root.$meta, 'galleryButtons.favourite', {}) ?? 'Omiljeno',
          'galleryButtons.info' => TranslationOverrides.string(_root.$meta, 'galleryButtons.info', {}) ?? 'Informacije',
          'galleryButtons.share' => TranslationOverrides.string(_root.$meta, 'galleryButtons.share', {}) ?? 'Podeli',
          'galleryButtons.select' => TranslationOverrides.string(_root.$meta, 'galleryButtons.select', {}) ?? 'Izaberi',
          'galleryButtons.open' => TranslationOverrides.string(_root.$meta, 'galleryButtons.open', {}) ?? 'Otvori u pregledaču',
          'galleryButtons.slideshow' => TranslationOverrides.string(_root.$meta, 'galleryButtons.slideshow', {}) ?? 'Projekcija slajdova',
          'galleryButtons.reloadNoScale' =>
            TranslationOverrides.string(_root.$meta, 'galleryButtons.reloadNoScale', {}) ?? 'Uključi/isključi skaliranje',
          'galleryButtons.toggleQuality' => TranslationOverrides.string(_root.$meta, 'galleryButtons.toggleQuality', {}) ?? 'Promeni kvalitet',
          'galleryButtons.externalPlayer' => TranslationOverrides.string(_root.$meta, 'galleryButtons.externalPlayer', {}) ?? 'Spoljni plejer',
          'galleryButtons.imageSearch' => TranslationOverrides.string(_root.$meta, 'galleryButtons.imageSearch', {}) ?? 'Pretraga po slici',
          'media.loading.rendering' => TranslationOverrides.string(_root.$meta, 'media.loading.rendering', {}) ?? 'Renderovanje…',
          'media.loading.loadingAndRenderingFromCache' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.loadingAndRenderingFromCache', {}) ?? 'Učitavanje i renderovanje iz keša…',
          'media.loading.loadingFromCache' => TranslationOverrides.string(_root.$meta, 'media.loading.loadingFromCache', {}) ?? 'Učitavanje iz keša…',
          'media.loading.buffering' => TranslationOverrides.string(_root.$meta, 'media.loading.buffering', {}) ?? 'Baferovanje…',
          'media.loading.loading' => TranslationOverrides.string(_root.$meta, 'media.loading.loading', {}) ?? 'Učitavanje…',
          'media.loading.loadAnyway' => TranslationOverrides.string(_root.$meta, 'media.loading.loadAnyway', {}) ?? 'Učitaj svejedno',
          'media.loading.restartLoading' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.restartLoading', {}) ?? 'Ponovo pokreni učitavanje',
          'media.loading.stopLoading' => TranslationOverrides.string(_root.$meta, 'media.loading.stopLoading', {}) ?? 'Zaustavi učitavanje',
          'media.loading.startedSecondsAgo' => ({
            required int seconds,
          }) => TranslationOverrides.string(_root.$meta, 'media.loading.startedSecondsAgo', {'seconds': seconds}) ?? 'Započeto pre ${seconds}s',
          'media.loading.stopReasons.stoppedByUser' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.stoppedByUser', {}) ?? 'Zaustavio korisnik',
          'media.loading.stopReasons.loadingError' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.loadingError', {}) ?? 'Greška pri učitavanju',
          'media.loading.stopReasons.fileIsTooBig' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.fileIsTooBig', {}) ?? 'Datoteka je prevelika',
          'media.loading.stopReasons.hiddenByFilters' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.hiddenByFilters', {}) ?? 'Sakriveno filterima:',
          'media.loading.stopReasons.videoError' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.videoError', {}) ?? 'Greška video zapisa',
          'media.loading.fileIsZeroBytes' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.fileIsZeroBytes', {}) ?? 'Datoteka ima 0 bajtova',
          'media.loading.fileSize' => ({
            required String size,
          }) => TranslationOverrides.string(_root.$meta, 'media.loading.fileSize', {'size': size}) ?? 'Veličina datoteke: ${size}',
          'media.loading.sizeLimit' => ({
            required String limit,
          }) => TranslationOverrides.string(_root.$meta, 'media.loading.sizeLimit', {'limit': limit}) ?? 'Ograničenje: ${limit}',
          'media.loading.tryChangingVideoBackend' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.tryChangingVideoBackend', {}) ??
                'Česti problemi sa reprodukcijom? Pokušajte da promenite [Podešavanja > Video > Pozadinski sistem video plejera]',
          'media.video.videosDisabledOrNotSupported' =>
            TranslationOverrides.string(_root.$meta, 'media.video.videosDisabledOrNotSupported', {}) ??
                'Video zapisi su onemogućeni ili nisu podržani',
          'media.video.openVideoInExternalPlayer' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openVideoInExternalPlayer', {}) ?? 'Otvori video u spoljnom plejeru',
          'media.video.openVideoInBrowser' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openVideoInBrowser', {}) ?? 'Otvori video u pregledaču',
          'media.video.failedToLoadItemData' =>
            TranslationOverrides.string(_root.$meta, 'media.video.failedToLoadItemData', {}) ?? 'Učitavanje podataka o stavci nije uspelo',
          'media.video.loadingItemData' =>
            TranslationOverrides.string(_root.$meta, 'media.video.loadingItemData', {}) ?? 'Učitavanje podataka o stavci…',
          'media.video.retry' => TranslationOverrides.string(_root.$meta, 'media.video.retry', {}) ?? 'Pokušaj ponovo',
          'media.video.openFileInBrowser' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openFileInBrowser', {}) ?? 'Otvori datoteku u pregledaču',
          'media.video.openPostInBrowser' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openPostInBrowser', {}) ?? 'Otvori objavu u pregledaču',
          'media.video.currentlyChecking' =>
            TranslationOverrides.string(_root.$meta, 'media.video.currentlyChecking', {}) ?? 'Trenutno se proverava:',
          'media.video.unknownFileFormat' =>
            ({required String fileExt}) =>
                TranslationOverrides.string(_root.$meta, 'media.video.unknownFileFormat', {'fileExt': fileExt}) ??
                'Nepoznat format datoteke (.${fileExt}), dodirnite ovde da biste otvorili u pregledaču',
          'imageStats.live' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'imageStats.live', {'count': count}) ?? 'Aktivne slike: ${count}',
          'imageStats.pending' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'imageStats.pending', {'count': count}) ?? 'Na čekanju: ${count}',
          'imageStats.total' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'imageStats.total', {'count': count}) ?? 'Ukupno: ${count}',
          'imageStats.size' => ({
            required String size,
          }) => TranslationOverrides.string(_root.$meta, 'imageStats.size', {'size': size}) ?? 'Veličina: ${size}',
          'imageStats.max' => ({required String max}) => TranslationOverrides.string(_root.$meta, 'imageStats.max', {'max': max}) ?? 'Maks: ${max}',
          'preview.error.noResults' => TranslationOverrides.string(_root.$meta, 'preview.error.noResults', {}) ?? 'Nema rezultata',
          'preview.error.noResultsSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.noResultsSubtitle', {}) ??
                'Promenite upit za pretragu ili dodirnite da biste pokušali ponovo',
          'preview.error.reachedEnd' => TranslationOverrides.string(_root.$meta, 'preview.error.reachedEnd', {}) ?? 'Stigli ste do kraja',
          'preview.error.reachedEndSubtitle' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.reachedEndSubtitle', {'pageNum': pageNum}) ??
                'Učitane stranice: ${pageNum}\nDodirnite ovde da biste ponovo učitali poslednju stranicu',
          'preview.error.loadingPage' => ({
            required int pageNum,
          }) => TranslationOverrides.string(_root.$meta, 'preview.error.loadingPage', {'pageNum': pageNum}) ?? 'Učitavanje stranice #${pageNum}…',
          'preview.error.startedAgo' =>
            ({required num seconds}) =>
                TranslationOverrides.plural(_root.$meta, 'preview.error.startedAgo', {'seconds': seconds}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('sr_RS'))(
                  seconds,
                  one: 'Započeto pre ${seconds} sekundu',
                  few: 'Započeto pre ${seconds} sekunde',
                  other: 'Započeto pre ${seconds} sekundi',
                ),
          'preview.error.tapToRetryIfStuck' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetryIfStuck', {}) ??
                'Dodirnite da biste pokušali ponovo ako zahtev deluje zaglavljeno ili predugo traje',
          'preview.error.errorLoadingPage' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.errorLoadingPage', {'pageNum': pageNum}) ??
                'Greška pri učitavanju stranice #${pageNum}',
          'preview.error.errorWithMessage' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.errorWithMessage', {}) ?? 'Dodirnite ovde da biste pokušali ponovo',
          'preview.error.errorNoResultsLoaded' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.errorNoResultsLoaded', {}) ?? 'Greška, nijedan rezultat nije učitan',
          'preview.error.tapToRetry' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetry', {}) ?? 'Dodirnite ovde da biste pokušali ponovo',
          'tagType.artist' => TranslationOverrides.string(_root.$meta, 'tagType.artist', {}) ?? 'Umetnik',
          'tagType.character' => TranslationOverrides.string(_root.$meta, 'tagType.character', {}) ?? 'Lik',
          'tagType.copyright' => TranslationOverrides.string(_root.$meta, 'tagType.copyright', {}) ?? 'Franšiza',
          'tagType.meta' => TranslationOverrides.string(_root.$meta, 'tagType.meta', {}) ?? 'Meta',
          'tagType.species' => TranslationOverrides.string(_root.$meta, 'tagType.species', {}) ?? 'Vrsta',
          'tagType.lore' => TranslationOverrides.string(_root.$meta, 'tagType.lore', {}) ?? 'Lore',
          'tagType.none' => TranslationOverrides.string(_root.$meta, 'tagType.none', {}) ?? 'Nijedno/Opšte',
          _ => null,
        };
  }
}
