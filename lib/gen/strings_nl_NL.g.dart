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
class TranslationsNlNl extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  /// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
  TranslationsNlNl({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : _meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.nlNl,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
    _meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <nl-NL>.
  final TranslationMetadata<AppLocale, Translations> _meta;
  @override
  TranslationMetadata<AppLocale, Translations> get $meta => _meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => _meta.getTranslation(key) ?? super[key];

  late final TranslationsNlNl _root = this; // ignore: unused_field

  @override
  TranslationsNlNl $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsNlNl(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'nl-NL';
  @override
  String get localeName => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'Dutch';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Foutmelding';
  @override
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'Foutmelding!';
  @override
  String get success => TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Geslaagd';
  @override
  String get successExclamation => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? 'Geslaagd!';
  @override
  String get cancel => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Annuleer';
  @override
  String get kReturn => TranslationOverrides.string(_root.$meta, 'kReturn', {}) ?? 'Terug';
  @override
  String get later => TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Straks';
  @override
  String get close => TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Sluiten';
  @override
  String get ok => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'Ok';
  @override
  String get yes => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Ja';
  @override
  String get no => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'Nee';
  @override
  String get pleaseWait => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Wacht alstublieft…';
  @override
  String get show => TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Vertoon';
  @override
  String get hide => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Verberg';
  @override
  String get enable => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'Inschakelen';
  @override
  String get disable => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Uitschakelen';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Toevoegen';
  @override
  String get edit => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? 'Bewerk';
  @override
  String get remove => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? 'Weghalen';
  @override
  String get save => TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Opslaan';
  @override
  String get delete => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? 'Wissen';
  @override
  String get confirm => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? 'Bevestig';
  @override
  String get retry => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? 'Opnieuw';
  @override
  String get clear => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? 'Leeg';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Kopieer';
  @override
  String get copied => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Gekopieerd';
  @override
  String get copiedToClipboard => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? 'Gekopieerd naar klembord';
  @override
  String get nothingFound => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? 'Niks gevonden';
  @override
  String get paste => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Plak';
  @override
  String get copyErrorText => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Kopieer-foutmelding';
  @override
  String get goToSettings => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'Ga naar instellingen';
  @override
  String get thisMayTakeSomeTime => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'Dit kan even duren…';
  @override
  String get exitTheAppQuestion => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? 'Sluit de app?';
  @override
  String get closeTheApp => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Sluit de app';
  @override
  String get invalidUrl => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'Ongeldige URL!';
  @override
  String get clipboardIsEmpty => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'Klembord is leeg!';
  @override
  String get failedToOpenLink => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'Kon link niet openen';
  @override
  String get apiKey => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'API-sleutel';
  @override
  String get userId => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'Gebruikers ID';
  @override
  String get login => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Inloggen';
  @override
  String get password => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Wachtwoord';
  @override
  String get pause => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Pauzeer';
  @override
  String get resume => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Hervat';
  @override
  String get discord => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord';
  @override
  String get visitOurDiscord => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Bezoek onze Discord server';
  @override
  String get item => TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Item';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'select', {}) ?? 'Selecteer';
  @override
  String get selectAll => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Selecteer alles';
  @override
  String get reset => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'Reset';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'open', {}) ?? 'Open';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? 'Open in nieuw tabblad';
  @override
  String get move => TranslationOverrides.string(_root.$meta, 'move', {}) ?? 'Verplaats';
  @override
  String get shuffle => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? 'Husselen';
  @override
  String get sort => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? 'Sorteer';
  @override
  String get go => TranslationOverrides.string(_root.$meta, 'go', {}) ?? 'Ga';
  @override
  String get search => TranslationOverrides.string(_root.$meta, 'search', {}) ?? 'Zoek';
  @override
  String get filter => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? 'Filter';
  @override
  String get or => TranslationOverrides.string(_root.$meta, 'or', {}) ?? 'Of (~)';
  @override
  String get page => TranslationOverrides.string(_root.$meta, 'page', {}) ?? 'Pagina';
  @override
  String get pageNumber => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? 'Pagina #';
  @override
  String get tags => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'Labels';
  @override
  String get type => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'Type';
  @override
  String get name => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Naam\n';
  @override
  String get address => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'Adres';
  @override
  String get username => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'Gebruikersnaam';
  @override
  String get favourites => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'Favorieten';
  @override
  String get downloads => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'Downloads';
  @override
  late final _Translations$validationErrors$nl_NL validationErrors = _Translations$validationErrors$nl_NL._(_root);
  @override
  late final _Translations$init$nl_NL init = _Translations$init$nl_NL._(_root);
  @override
  late final _Translations$permissions$nl_NL permissions = _Translations$permissions$nl_NL._(_root);
  @override
  late final _Translations$authentication$nl_NL authentication = _Translations$authentication$nl_NL._(_root);
  @override
  late final _Translations$searchHandler$nl_NL searchHandler = _Translations$searchHandler$nl_NL._(_root);
  @override
  late final _Translations$snatcher$nl_NL snatcher = _Translations$snatcher$nl_NL._(_root);
  @override
  late final _Translations$multibooru$nl_NL multibooru = _Translations$multibooru$nl_NL._(_root);
  @override
  late final _Translations$hydrus$nl_NL hydrus = _Translations$hydrus$nl_NL._(_root);
  @override
  late final _Translations$tabs$nl_NL tabs = _Translations$tabs$nl_NL._(_root);
  @override
  late final _Translations$history$nl_NL history = _Translations$history$nl_NL._(_root);
  @override
  late final _Translations$webview$nl_NL webview = _Translations$webview$nl_NL._(_root);
  @override
  late final _Translations$settings$nl_NL settings = _Translations$settings$nl_NL._(_root);
  @override
  late final _Translations$pageChanger$nl_NL pageChanger = _Translations$pageChanger$nl_NL._(_root);
  @override
  late final _Translations$tagsManager$nl_NL tagsManager = _Translations$tagsManager$nl_NL._(_root);
  @override
  late final _Translations$tagView$nl_NL tagView = _Translations$tagView$nl_NL._(_root);
  @override
  late final _Translations$mobileHome$nl_NL mobileHome = _Translations$mobileHome$nl_NL._(_root);
  @override
  late final _Translations$desktopHome$nl_NL desktopHome = _Translations$desktopHome$nl_NL._(_root);
  @override
  late final _Translations$galleryView$nl_NL galleryView = _Translations$galleryView$nl_NL._(_root);
  @override
  late final _Translations$mediaPreviews$nl_NL mediaPreviews = _Translations$mediaPreviews$nl_NL._(_root);
  @override
  late final _Translations$viewer$nl_NL viewer = _Translations$viewer$nl_NL._(_root);
  @override
  late final _Translations$common$nl_NL common = _Translations$common$nl_NL._(_root);
  @override
  late final _Translations$media$nl_NL media = _Translations$media$nl_NL._(_root);
}

// Path: validationErrors
class _Translations$validationErrors$nl_NL extends Translations$validationErrors$en {
  _Translations$validationErrors$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get required => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Voer alstublieft een waarde in';
  @override
  String get invalid => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Voer alstublieft een geldige waarde in';
  @override
  String get invalidNumber => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? 'Voer alstublieft een nummer in';
  @override
  String get invalidNumericValue =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? 'Voer alstublieft een geldig nummer in';
  @override
  String tooSmall({required double min}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Voer alstublieft een waarde in groter dan ${min}';
  @override
  String tooBig({required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Voer alstublieft een waarde in kleiner dan ${max}';
  @override
  String rangeError({required double min, required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ??
      'Voer alstublieft een waarde in tussen ${min} en ${max}';
  @override
  String get greaterThanOrEqualZero =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ??
      'Voer alstublieft een waarde in groter of gelijk aan nul';
  @override
  String get lessThan4 =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? 'Voer alstublieft een waarde in lager dan vier';
  @override
  String get biggerThan100 =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? 'Voer alstublieft een waarde in groter dan honderd';
  @override
  String get moreThan4ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ??
      'Het gebruik van vier of meer kolommen kan de prestaties negatief beïnvloeden';
  @override
  String get moreThan8ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ??
      'Het gebruik van acht of meer kolommen kan de prestaties negatief beïnvloeden';
}

// Path: init
class _Translations$init$nl_NL extends Translations$init$en {
  _Translations$init$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get initError => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Initialisatiefout!';
  @override
  String get settingUpProxy => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Proxy instellen…';
  @override
  String get loadingDatabase => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Database laden…';
  @override
  String get loadingBoorus => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Boorus laden…';
  @override
  String get loadingTags => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Labels laden…';
  @override
  String get restoringTabs => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Tabbladen herstellen…';
}

// Path: permissions
class _Translations$permissions$nl_NL extends Translations$permissions$en {
  _Translations$permissions$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get noAccessToCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ?? 'Geen toegang tot alternatieve opslaglocatie';
  @override
  String get pleaseSetStorageDirectoryAgain =>
      TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ??
      'Stel de alternatieve opslaglocatie opnieuw in om de app toegang te kunnen verlenen';
  @override
  String currentPath({required String path}) =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? 'Huidig pad: ${path}';
  @override
  String get setDirectory => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? 'Instellen locatie';
  @override
  String get currentlyNotAvailableForThisPlatform =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ?? 'Niet beschikbaar op dit platform';
  @override
  String get resetDirectory => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? 'Reset map';
  @override
  String get afterResetFilesWillBeSavedToDefaultDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ??
      'Bestanden zullen automatisch naar hun standaard opslaglocatie worden opgeslagen na de reset';
}

// Path: authentication
class _Translations$authentication$nl_NL extends Translations$authentication$en {
  _Translations$authentication$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get pleaseAuthenticateToUseTheApp =>
      TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ??
      'Identificeer alstublieft om de app te gebruiken';
  @override
  String get noBiometricHardwareAvailable =>
      TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? 'Geen biometrische hardware beschikbaar';
  @override
  String get temporaryLockout => TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? 'Tijdelijke uitsluiting';
  @override
  String somethingWentWrong({required String error}) =>
      TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ??
      'Er ging iets fout tijdens de identificatie: ${error}';
}

// Path: searchHandler
class _Translations$searchHandler$nl_NL extends Translations$searchHandler$en {
  _Translations$searchHandler$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get removedLastTab => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? 'Laatste tabblad verwijderd';
  @override
  String get resettingSearchToDefaultTags =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? 'Standaard labels worden teruggezet';
  @override
  String get ratingsChanged => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? 'Beoordelingen gewijzigd';
  @override
  String ratingsChangedMessage({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
      'Op ${booruType} [rating:safe] is nu vervangen voor [rating:general] en [rating:sensitive]';
  @override
  String get appFixedRatingAutomatically =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ??
      'Beoordeling was automatisch opgelost. Gebruik bij toekomstige zoekopdrachten de juiste beoordeling';
  @override
  String get tabsRestored => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? 'Tabbladen hersteld';
  @override
  String restoredTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: '${count} tabblad hersteld van vorige sessie',
        few: '${count} tabbladen hersteld van vorige sessie',
        many: '${count} tabbladen hersteld van vorige sessie',
        other: '${count} tabbladen hersteld van vorige sessie',
      );
  @override
  String get someRestoredTabsHadIssues =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ??
      'Sommige herstelde tabbladen hadden onbekende boorus of gebroken karakters.';
  @override
  String get theyWereSetToDefaultOrIgnored =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ?? 'Ze zijn hersteld of genegeerd.';
  @override
  String get listOfBrokenTabs => TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? 'Lijst van gebroken tabbladen:';
  @override
  String get tabsMerged => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? 'Tabbladen samengevoegd';
  @override
  String addedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: '${count} nieuwe tabbladen toegevoegd',
        few: '${count} nieuwe tabbladen toegevoegd',
        many: '${count} nieuwe tabbladen toegevoegd',
        other: '${count} nieuwe tabbladen toegevoegd',
      );
  @override
  String get tabsReplaced => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? 'Tabbladen vervangen';
  @override
  String receivedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: '${count} tabblad ontvangen',
        few: '${count} tabbladen ontvangen',
        many: '${count} tabbladen ontvangen',
        other: '${count} tabbladen ontvangen',
      );
}

// Path: snatcher
class _Translations$snatcher$nl_NL extends Translations$snatcher$en {
  _Translations$snatcher$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Downloader';
  @override
  String get snatchingHistory => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'Downloadgeschiedenis';
  @override
  String get enterTags => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'Labels invoeren';
  @override
  String get amount => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? 'Hoeveelheid';
  @override
  String get amountOfFilesToSnatch =>
      TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? 'Hoeveelheid bestanden te downloaden';
  @override
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? 'Vertraging (in ms)';
  @override
  String get delayBetweenEachDownload =>
      TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? 'Vertraging tussen iedere download';
  @override
  String get snatchFiles => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? 'Download bestanden';
  @override
  String get itemWasAlreadySnatched =>
      TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? 'Item is al eerder gedownload';
  @override
  String get failedToSnatchItem => TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? 'Kon item niet downloaden';
  @override
  String get itemWasCancelled => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? 'Item was geannuleerd';
  @override
  String get startingNextQueueItem =>
      TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? 'Begint aan volgend item in wachtrij…';
  @override
  String get itemsSnatched => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? 'Items gedownload';
  @override
  String snatchedCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: 'Gedownload: ${count} item',
        few: 'Gedownload: ${count} items',
        many: 'Gedownload: ${count} items',
        other: 'Gedownload: ${count} items',
      );
  @override
  String filesAlreadySnatched({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: '${count} bestand is al gedownload',
        few: '${count} bestanden zijn al gedownload',
        many: '${count} bestanden zijn al gedownload',
        other: '${count} bestanden zijn al gedownload',
      );
  @override
  String failedToSnatchFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: '${count} bestand downloaden mislukt',
        few: '${count} bestanden downloaden mislukt',
        many: '${count} bestanden downloaden mislukt',
        other: '${count} bestanden downloaden mislukt',
      );
  @override
  String cancelledFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: '${count} bestand geannuleerd',
        few: '${count} bestanden geannuleerd',
        many: '${count} bestanden geannuleerd',
        other: '${count} bestanden geannuleerd',
      );
  @override
  String get snatchingImages => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? 'Afbeeldingen downloaden';
  @override
  String get doNotCloseApp => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? 'Sluit de app niet!';
  @override
  String get addedItemToQueue => TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? 'Item toegevoegd aan downloadwachtrij';
  @override
  String addedItemsToQueue({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: '${count} item toegevoegd aan downloadwachtrij ',
        few: '${count} items toegevoegd aan downloadwachtrij',
        many: '${count} items toegevoegd aan downloadwachtrij',
        other: '${count} items toegevoegd aan downloadwachtrij',
      );
}

// Path: multibooru
class _Translations$multibooru$nl_NL extends Translations$multibooru$en {
  _Translations$multibooru$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get multibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Multibooru-modus';
  @override
  String get multibooruRequiresAtLeastTwoBoorus =>
      TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ??
      'Vereist tenminste twee geconfigureerde boorus';
  @override
  String get selectSecondaryBoorus =>
      TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Selecteer aanvullende boorus:';
  @override
  String get akaMultibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? 'aka Multibooru-modus';
  @override
  String get labelSecondaryBoorusToInclude =>
      TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? 'Secundaire boorus om erbij te betrekken';
}

// Path: hydrus
class _Translations$hydrus$nl_NL extends Translations$hydrus$en {
  _Translations$hydrus$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get importError => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'Er ging iets mis met het importeren naar hydrus';
  @override
  String get apiPermissionsRequired =>
      TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ??
      'U heeft misschien niet de juiste API rechten afgegeven, deze kan u bewerken in Review Services';
  @override
  String get addTagsToFile => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? 'Labels aan bestand toevoegen';
  @override
  String get addUrls => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'URLs toevoegen';
}

// Path: tabs
class _Translations$tabs$nl_NL extends Translations$tabs$en {
  _Translations$tabs$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get tab => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? 'Tabblad';
  @override
  String get addBoorusInSettings => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? 'Boorus toevoegen aan instellingen';
  @override
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? 'Selecteer een Booru';
  @override
  String get secondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? 'Secundaire booru';
  @override
  String get addNewTab => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? 'Nieuw tabblad toevoegen';
  @override
  String get selectABooruOrLeaveEmpty =>
      TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? 'Selecteer een booru of laat leeg';
  @override
  String get addPosition => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? 'Positie toevoegen';
  @override
  String get addModePrevTab => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? 'Vorig tabblad';
  @override
  String get addModeNextTab => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? 'Volgend tabblad';
  @override
  String get addModeListEnd => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? 'Einde lijst';
  @override
  String get usedQuery => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? 'Gebruikte aanvraag';
  @override
  String get queryModeDefault => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? 'Standaard';
  @override
  String get queryModeCurrent => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? 'Huidig';
  @override
  String get queryModeCustom => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? 'Aangepast';
  @override
  String get customQuery => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? 'Aangepast verzoek';
  @override
  String get empty => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '[leeg]';
  @override
  String get addSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? 'Voeg secundaire boorus toe';
  @override
  String get keepSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? 'Behoudt secundaire boorus';
  @override
  String get startFromCustomPageNumber =>
      TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? 'Start vanaf een aangepast paginanummer';
  @override
  String get switchToNewTab => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? 'Wissel naar nieuw tabblad';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? 'Toevoegen';
  @override
  String get tabsManager => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? 'Tabblad beheerder';
  @override
  String get selectMode => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? 'Selecteer modus';
  @override
  String get sortMode => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? 'Sorteer tabbladen';
  @override
  String get help => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? 'Help';
  @override
  String get deleteTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? 'Wis tabbladen';
  @override
  String get tabOrderSaved => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? 'Tabblad volgorde opgeslagen';
  @override
  String get scrollToCurrent => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? 'Scroll naar huidig tabblad';
  @override
  String get scrollToTop => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? 'Scroll naar de top';
  @override
  String get scrollToBottom => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? 'Scroll naar de bodem';
  @override
  String get filterTabsByBooru => TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? 'Filter op booru, staat, duplicaties…';
  @override
  String get sorting => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? 'Sorteren:';
  @override
  String get defaultTabsOrder => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? 'Standaard tabblad volgorde';
  @override
  String get sortAlphabetically => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? 'Sorteer alfabetisch';
  @override
  String get sortAlphabeticallyReversed =>
      TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? 'Sorteer alfabetisch (omgekeerd)';
  @override
  String get onTheBottomOfPage => TranslationOverrides.string(_root.$meta, 'tabs.onTheBottomOfPage', {}) ?? 'Beneden de pagina: ';
  @override
  String get deleteSelectedTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? 'Wis geselecteerde tabbladen';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tabs.copy', {}) ?? 'Kopieer';
  @override
  String get moveAction => TranslationOverrides.string(_root.$meta, 'tabs.moveAction', {}) ?? 'Verplaats';
  @override
  String get shuffle => TranslationOverrides.string(_root.$meta, 'tabs.shuffle', {}) ?? 'Husselen';
  @override
  String get sort => TranslationOverrides.string(_root.$meta, 'tabs.sort', {}) ?? 'Sorteer';
  @override
  String get byBooru => TranslationOverrides.string(_root.$meta, 'tabs.byBooru', {}) ?? 'Van booru';
  @override
  String get alphabetically => TranslationOverrides.string(_root.$meta, 'tabs.alphabetically', {}) ?? 'Alfabetisch';
  @override
  String get reversed => TranslationOverrides.string(_root.$meta, 'tabs.reversed', {}) ?? '(omgekeerd)';
  @override
  String areYouSureDeleteTabs({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'tabs.areYouSureDeleteTabs', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: 'Weet u zeker u wilt ${count} tabblad wissen?',
        few: 'Weet u zeker u wilt ${count} tabbladen wissen?',
        many: 'Weet u zeker u wilt ${count} tabbladen wissen?',
        other: 'Weet u zeker u wilt ${count} tabbladen wissen?',
      );
  @override
  late final _Translations$tabs$filters$nl_NL filters = _Translations$tabs$filters$nl_NL._(_root);
  @override
  late final _Translations$tabs$move$nl_NL move = _Translations$tabs$move$nl_NL._(_root);
}

// Path: history
class _Translations$history$nl_NL extends Translations$history$en {
  _Translations$history$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get searchHistory => TranslationOverrides.string(_root.$meta, 'history.searchHistory', {}) ?? 'Zoekgeschiedenis';
  @override
  String get searchHistoryIsEmpty => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsEmpty', {}) ?? 'Zoekgeschiedenis is leeg';
  @override
  String get searchHistoryIsDisabled =>
      TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsDisabled', {}) ?? 'Zoekgeschiedenis is uitgeschakeld';
  @override
  String lastSearch({required String search}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearch', {'search': search}) ?? 'Laatste zoekopdracht: ${search}';
  @override
  String lastSearchWithDate({required String date}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearchWithDate', {'date': date}) ?? 'Laatste zoekopdracht: ${date}';
  @override
  String get unknownBooruType => TranslationOverrides.string(_root.$meta, 'history.unknownBooruType', {}) ?? 'Onbekend Booru type!';
  @override
  String unknownBooru({required String name, required String type}) =>
      TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ?? 'Onbekende booru (${name}-${type})';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? 'Open';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? 'Open in nieuw tabblad';
  @override
  String get removeFromFavourites => TranslationOverrides.string(_root.$meta, 'history.removeFromFavourites', {}) ?? 'Verwijder uit favorieten';
  @override
  String get setAsFavourite => TranslationOverrides.string(_root.$meta, 'history.setAsFavourite', {}) ?? 'Stel in als favoriet';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'history.copy', {}) ?? 'Kopieer';
  @override
  String get delete => TranslationOverrides.string(_root.$meta, 'history.delete', {}) ?? 'Wissen';
  @override
  String get deleteHistoryEntries => TranslationOverrides.string(_root.$meta, 'history.deleteHistoryEntries', {}) ?? 'Wis geschiedenis inzendingen';
  @override
  String get clearSelection => TranslationOverrides.string(_root.$meta, 'history.clearSelection', {}) ?? 'Leeg selectie';
  @override
  String deleteItems({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'history.deleteItems', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: 'Wis ${count} item',
        few: 'Wis ${count} items',
        many: 'Wis ${count} items',
        other: 'Wis ${count} items',
      );
}

// Path: webview
class _Translations$webview$nl_NL extends Translations$webview$en {
  _Translations$webview$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$webview$navigation$nl_NL navigation = _Translations$webview$navigation$nl_NL._(_root);
}

// Path: settings
class _Translations$settings$nl_NL extends Translations$settings$en {
  _Translations$settings$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$settings$booru$nl_NL booru = _Translations$settings$booru$nl_NL._(_root);
  @override
  late final _Translations$settings$booruEditor$nl_NL booruEditor = _Translations$settings$booruEditor$nl_NL._(_root);
  @override
  late final _Translations$settings$theme$nl_NL theme = _Translations$settings$theme$nl_NL._(_root);
  @override
  late final _Translations$settings$viewer$nl_NL viewer = _Translations$settings$viewer$nl_NL._(_root);
  @override
  late final _Translations$settings$database$nl_NL database = _Translations$settings$database$nl_NL._(_root);
  @override
  late final _Translations$settings$network$nl_NL network = _Translations$settings$network$nl_NL._(_root);
  @override
  late final _Translations$settings$cache$nl_NL cache = _Translations$settings$cache$nl_NL._(_root);
  @override
  late final _Translations$settings$itemFilters$nl_NL itemFilters = _Translations$settings$itemFilters$nl_NL._(_root);
  @override
  late final _Translations$settings$debug$nl_NL debug = _Translations$settings$debug$nl_NL._(_root);
}

// Path: pageChanger
class _Translations$pageChanger$nl_NL extends Translations$pageChanger$en {
  _Translations$pageChanger$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get jumpToPage => TranslationOverrides.string(_root.$meta, 'pageChanger.jumpToPage', {}) ?? 'Spring naar pagina';
  @override
  String get searchUntilPage => TranslationOverrides.string(_root.$meta, 'pageChanger.searchUntilPage', {}) ?? 'Zoek tot pagina';
  @override
  String get stopSearching => TranslationOverrides.string(_root.$meta, 'pageChanger.stopSearching', {}) ?? 'Stop met zoeken';
}

// Path: tagsManager
class _Translations$tagsManager$nl_NL extends Translations$tagsManager$en {
  _Translations$tagsManager$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'tagsManager.add', {}) ?? 'Toevoegen';
  @override
  String get addedATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addedATab', {}) ?? 'Tabblad toegevoegd';
  @override
  String get addATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addATab', {}) ?? 'Tabblad toevoegen';
  @override
  String deleteTags({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'tagsManager.deleteTags', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: 'Wis ${count} label',
        few: 'Wis ${count} labels',
        many: 'Wis ${count} labels',
        other: 'Wis ${count} labels',
      );
  @override
  String get deleteTagsTitle => TranslationOverrides.string(_root.$meta, 'tagsManager.deleteTagsTitle', {}) ?? 'Wis labels';
}

// Path: tagView
class _Translations$tagView$nl_NL extends Translations$tagView$en {
  _Translations$tagView$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get addedNewTab => TranslationOverrides.string(_root.$meta, 'tagView.addedNewTab', {}) ?? 'Tabblad toegevoegd:';
  @override
  String get addedToSearchBar => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBar', {}) ?? 'Aan zoekbalk toegevoegd:';
  @override
  String get failedToLoadPreviewPage =>
      TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreviewPage', {}) ?? 'Voorbeeld pagina mislukt te laden';
}

// Path: mobileHome
class _Translations$mobileHome$nl_NL extends Translations$mobileHome$en {
  _Translations$mobileHome$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get clearAllRetryableItems =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.clearAllRetryableItems', {}) ?? 'Maak alle items voor een nieuwe poging vrij';
}

// Path: desktopHome
class _Translations$desktopHome$nl_NL extends Translations$desktopHome$en {
  _Translations$desktopHome$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get addBoorusInSettings =>
      TranslationOverrides.string(_root.$meta, 'desktopHome.addBoorusInSettings', {}) ?? 'Boorus toevoegen in de instellingen';
  @override
  String get noItemsSelected => TranslationOverrides.string(_root.$meta, 'desktopHome.noItemsSelected', {}) ?? 'Geen items geselecteerd';
}

// Path: galleryView
class _Translations$galleryView$nl_NL extends Translations$galleryView$en {
  _Translations$galleryView$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get noItems => TranslationOverrides.string(_root.$meta, 'galleryView.noItems', {}) ?? 'Geen items';
  @override
  String get noItemSelected => TranslationOverrides.string(_root.$meta, 'galleryView.noItemSelected', {}) ?? 'Geen item geselecteerd';
}

// Path: mediaPreviews
class _Translations$mediaPreviews$nl_NL extends Translations$mediaPreviews$en {
  _Translations$mediaPreviews$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get addNewBooru => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? 'New Booru toevoegen';
}

// Path: viewer
class _Translations$viewer$nl_NL extends Translations$viewer$en {
  _Translations$viewer$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$viewer$appBar$nl_NL appBar = _Translations$viewer$appBar$nl_NL._(_root);
}

// Path: common
class _Translations$common$nl_NL extends Translations$common$en {
  _Translations$common$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get booruItemCopiedToClipboard =>
      TranslationOverrides.string(_root.$meta, 'common.booruItemCopiedToClipboard', {}) ?? 'Booru item gekopieerd naar klembord';
}

// Path: media
class _Translations$media$nl_NL extends Translations$media$en {
  _Translations$media$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$media$video$nl_NL video = _Translations$media$video$nl_NL._(_root);
}

// Path: tabs.filters
class _Translations$tabs$filters$nl_NL extends Translations$tabs$filters$en {
  _Translations$tabs$filters$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get loaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.loaded', {}) ?? 'Geladen';
  @override
  String get tagType => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagType', {}) ?? 'Label type';
  @override
  String get duplicates => TranslationOverrides.string(_root.$meta, 'tabs.filters.duplicates', {}) ?? 'Duplicaten';
  @override
  String get checkDuplicatesOnSameBooru =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.checkDuplicatesOnSameBooru', {}) ?? 'Controleer voor duplicaten op dezelfde Booru';
  @override
  String get emptySearchQuery => TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? 'Lege zoekopdrachr';
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'tabs.filters.title', {}) ?? 'Tabblad filters';
  @override
  String get all => TranslationOverrides.string(_root.$meta, 'tabs.filters.all', {}) ?? 'Alle';
  @override
  String get notLoaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.notLoaded', {}) ?? 'Niet geladen';
  @override
  String get enabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.enabled', {}) ?? 'Ingeschakeld';
  @override
  String get disabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.disabled', {}) ?? 'Uitgeschakeld';
  @override
  String get willAlsoEnableSorting =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.willAlsoEnableSorting', {}) ?? 'Zal ook sorteren activeren';
  @override
  String get any => TranslationOverrides.string(_root.$meta, 'tabs.filters.any', {}) ?? 'Elk';
  @override
  String get apply => TranslationOverrides.string(_root.$meta, 'tabs.filters.apply', {}) ?? 'Toepassen';
}

// Path: tabs.move
class _Translations$tabs$move$nl_NL extends Translations$tabs$move$en {
  _Translations$tabs$move$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get moveToTop => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToTop', {}) ?? 'Verplaats naar boven';
  @override
  String get moveToBottom => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToBottom', {}) ?? 'Verplaats naar beneden';
  @override
  String get tabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.tabNumber', {}) ?? 'Tabblad nummer';
  @override
  String get invalidTabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidTabNumber', {}) ?? 'Ongeldig tabblad nummer';
  @override
  String get invalidInput => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidInput', {}) ?? 'Ongeldige invoer';
  @override
  String get outOfRange => TranslationOverrides.string(_root.$meta, 'tabs.move.outOfRange', {}) ?? 'Buiten bereik';
  @override
  String get pleaseEnterValidTabNumber =>
      TranslationOverrides.string(_root.$meta, 'tabs.move.pleaseEnterValidTabNumber', {}) ?? 'Geef alstublieft een geldig tabblad nummer';
  @override
  String get preview => TranslationOverrides.string(_root.$meta, 'tabs.move.preview', {}) ?? 'Voorbeeld:';
}

// Path: webview.navigation
class _Translations$webview$navigation$nl_NL extends Translations$webview$navigation$en {
  _Translations$webview$navigation$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get enterCustomUrl => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterCustomUrl', {}) ?? 'Voer aangepaste URL in';
}

// Path: settings.booru
class _Translations$settings$booru$nl_NL extends Translations$settings$booru$en {
  _Translations$settings$booru$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get itemsPerPage => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'Items downloaded per pagina';
  @override
  String get itemsPerPageTip => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'Soms zullen boorus dit weigeren';
  @override
  String get addBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Booru configuratie toevoegen';
  @override
  String get addedBoorus => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? 'Boorus toegevoegd';
  @override
  String get deleteBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? 'Wis Booru configuratie';
  @override
  String get deleteBooruError =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ??
      'Er ging iets mis tijdens het wissen van een Booru configuratie!';
  @override
  String get booruDeleted => TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? 'Booru configuratie gewist';
  @override
  String get cantDeleteThisBooru =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? 'Kan deze Booru niet wissen!';
}

// Path: settings.booruEditor
class _Translations$settings$booruEditor$nl_NL extends Translations$settings$booruEditor$en {
  _Translations$settings$booruEditor$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get accessKeyRequestedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? 'Toegangssleutel aangevraagd';
  @override
  String get accessKeyFailedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? 'Toegangssleutel ophalen mislukt';
  @override
  String get accessKeyFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ?? 'Heeft u het aanvraagscherm open in Hydrus?';
}

// Path: settings.theme
class _Translations$settings$theme$nl_NL extends Translations$settings$theme$en {
  _Translations$settings$theme$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get setCustomMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.setCustomMascot', {}) ?? 'Stel aangepaste mascotte in';
  @override
  String get removeCustomMascot =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? 'Verwijder aangepaste mascotte';
  @override
  String get custom => TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? 'Gepersonaliseerd';
  @override
  String get customFont => TranslationOverrides.string(_root.$meta, 'settings.theme.customFont', {}) ?? 'Aangepast lettertype';
  @override
  String get customFontSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.customFontSubtitle', {}) ?? 'Geef de naam van een Google lettertype';
  @override
  String get customFontHint =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.customFontHint', {}) ?? 'Doorzoek lettertypen op fonts.google.com';
}

// Path: settings.viewer
class _Translations$settings$viewer$nl_NL extends Translations$settings$viewer$en {
  _Translations$settings$viewer$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get changePageButtonsPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.changePageButtonsPosition', {}) ?? 'Verplaats positie van knoppen op pagina';
  @override
  String get usingCustomAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.usingCustomAnimation', {}) ?? 'Aangepaste animatie van toepassing';
}

// Path: settings.database
class _Translations$settings$database$nl_NL extends Translations$settings$database$en {
  _Translations$settings$database$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get searchQuery => TranslationOverrides.string(_root.$meta, 'settings.database.searchQuery', {}) ?? 'Zoekopdracht';
  @override
  String get searchQueryOptional =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchQueryOptional', {}) ?? '(optioneel, kan het proces trager maken)';
  @override
  String get searchHistoryTapInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryTapInfo', {}) ?? 'Druk optie voor actie (wis, favoriet…)';
  @override
  String get deleteDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabase', {}) ?? 'Wis database';
  @override
  String get deleteDatabaseConfirm => TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabaseConfirm', {}) ?? 'Wis database?';
  @override
  String get databaseDeleted => TranslationOverrides.string(_root.$meta, 'settings.database.databaseDeleted', {}) ?? 'Database gewist!';
}

// Path: settings.network
class _Translations$settings$network$nl_NL extends Translations$settings$network$en {
  _Translations$settings$network$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get allCookiesDeleted => TranslationOverrides.string(_root.$meta, 'settings.network.allCookiesDeleted', {}) ?? 'Alle cookies verwijderd';
}

// Path: settings.cache
class _Translations$settings$cache$nl_NL extends Translations$settings$cache$en {
  _Translations$settings$cache$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get deleteCacheAfter => TranslationOverrides.string(_root.$meta, 'settings.cache.deleteCacheAfter', {}) ?? 'Wis tijdelijk geheugen na:';
  @override
  String get neverDeleteDuration => TranslationOverrides.string(_root.$meta, 'settings.cache.neverDeleteDuration', {}) ?? 'Nooit';
}

// Path: settings.itemFilters
class _Translations$settings$itemFilters$nl_NL extends Translations$settings$itemFilters$en {
  _Translations$settings$itemFilters$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.title', {}) ?? 'Filters';
  @override
  String get hidden => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.hidden', {}) ?? 'Verborgen';
  @override
  String get marked => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.marked', {}) ?? 'Gemarkeerd';
  @override
  String get duplicateFilter => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.duplicateFilter', {}) ?? 'Dubbele filter';
  @override
  String get noFiltersFound => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersFound', {}) ?? 'Geen filters gevonden';
  @override
  String get noFiltersAdded => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersAdded', {}) ?? 'Geen filters toegevoegd';
  @override
  String get removeHidden =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeHidden', {}) ??
      'Verberg alle items met de overeenkomende verborgen filters';
  @override
  String get removeMarked =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeMarked', {}) ??
      'Verberg alle items met de overeenkomende gemarkeerde filters';
  @override
  String get removeFavourited => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeFavourited', {}) ?? 'Verwijder favoriete items';
  @override
  String get removeSnatched => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeSnatched', {}) ?? 'Verwijder gedownloade items';
  @override
  String get removeAI => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeAI', {}) ?? 'Verwijder AI items';
}

// Path: settings.debug
class _Translations$settings$debug$nl_NL extends Translations$settings$debug$en {
  _Translations$settings$debug$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get deleteAllCookies => TranslationOverrides.string(_root.$meta, 'settings.debug.deleteAllCookies', {}) ?? 'Wis alle cookies';
}

// Path: viewer.appBar
class _Translations$viewer$appBar$nl_NL extends Translations$viewer$appBar$en {
  _Translations$viewer$appBar$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get abort => TranslationOverrides.string(_root.$meta, 'viewer.appBar.abort', {}) ?? 'Afbreken';
}

// Path: media.video
class _Translations$media$video$nl_NL extends Translations$media$video$en {
  _Translations$media$video$nl_NL._(TranslationsNlNl root) : this._root = root, super.internal(root);

  final TranslationsNlNl _root; // ignore: unused_field

  // Translations
  @override
  String get failedToLoadItemData => TranslationOverrides.string(_root.$meta, 'media.video.failedToLoadItemData', {}) ?? 'Kon item data niet laden';
  @override
  String get loadingItemData => TranslationOverrides.string(_root.$meta, 'media.video.loadingItemData', {}) ?? 'Item data laden…';
}

/// The flat map containing all translations for locale <nl-NL>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsNlNl {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'locale' => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'nl-NL',
      'localeName' => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'Dutch',
      'error' => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Foutmelding',
      'errorExclamation' => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'Foutmelding!',
      'success' => TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Geslaagd',
      'successExclamation' => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? 'Geslaagd!',
      'cancel' => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Annuleer',
      'kReturn' => TranslationOverrides.string(_root.$meta, 'kReturn', {}) ?? 'Terug',
      'later' => TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Straks',
      'close' => TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Sluiten',
      'ok' => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'Ok',
      'yes' => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Ja',
      'no' => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'Nee',
      'pleaseWait' => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Wacht alstublieft…',
      'show' => TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Vertoon',
      'hide' => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Verberg',
      'enable' => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'Inschakelen',
      'disable' => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Uitschakelen',
      'add' => TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Toevoegen',
      'edit' => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? 'Bewerk',
      'remove' => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? 'Weghalen',
      'save' => TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Opslaan',
      'delete' => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? 'Wissen',
      'confirm' => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? 'Bevestig',
      'retry' => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? 'Opnieuw',
      'clear' => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? 'Leeg',
      'copy' => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Kopieer',
      'copied' => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Gekopieerd',
      'copiedToClipboard' => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? 'Gekopieerd naar klembord',
      'nothingFound' => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? 'Niks gevonden',
      'paste' => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Plak',
      'copyErrorText' => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Kopieer-foutmelding',
      'goToSettings' => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'Ga naar instellingen',
      'thisMayTakeSomeTime' => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'Dit kan even duren…',
      'exitTheAppQuestion' => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? 'Sluit de app?',
      'closeTheApp' => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Sluit de app',
      'invalidUrl' => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'Ongeldige URL!',
      'clipboardIsEmpty' => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'Klembord is leeg!',
      'failedToOpenLink' => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'Kon link niet openen',
      'apiKey' => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'API-sleutel',
      'userId' => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'Gebruikers ID',
      'login' => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Inloggen',
      'password' => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Wachtwoord',
      'pause' => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Pauzeer',
      'resume' => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Hervat',
      'discord' => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord',
      'visitOurDiscord' => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Bezoek onze Discord server',
      'item' => TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Item',
      'select' => TranslationOverrides.string(_root.$meta, 'select', {}) ?? 'Selecteer',
      'selectAll' => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Selecteer alles',
      'reset' => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'Reset',
      'open' => TranslationOverrides.string(_root.$meta, 'open', {}) ?? 'Open',
      'openInNewTab' => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? 'Open in nieuw tabblad',
      'move' => TranslationOverrides.string(_root.$meta, 'move', {}) ?? 'Verplaats',
      'shuffle' => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? 'Husselen',
      'sort' => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? 'Sorteer',
      'go' => TranslationOverrides.string(_root.$meta, 'go', {}) ?? 'Ga',
      'search' => TranslationOverrides.string(_root.$meta, 'search', {}) ?? 'Zoek',
      'filter' => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? 'Filter',
      'or' => TranslationOverrides.string(_root.$meta, 'or', {}) ?? 'Of (~)',
      'page' => TranslationOverrides.string(_root.$meta, 'page', {}) ?? 'Pagina',
      'pageNumber' => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? 'Pagina #',
      'tags' => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'Labels',
      'type' => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'Type',
      'name' => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Naam\n',
      'address' => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'Adres',
      'username' => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'Gebruikersnaam',
      'favourites' => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'Favorieten',
      'downloads' => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'Downloads',
      'validationErrors.required' => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Voer alstublieft een waarde in',
      'validationErrors.invalid' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Voer alstublieft een geldige waarde in',
      'validationErrors.invalidNumber' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? 'Voer alstublieft een nummer in',
      'validationErrors.invalidNumericValue' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? 'Voer alstublieft een geldig nummer in',
      'validationErrors.tooSmall' => ({
        required double min,
      }) => TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Voer alstublieft een waarde in groter dan ${min}',
      'validationErrors.tooBig' => ({
        required double max,
      }) => TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Voer alstublieft een waarde in kleiner dan ${max}',
      'validationErrors.rangeError' =>
        ({required double min, required double max}) =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ??
            'Voer alstublieft een waarde in tussen ${min} en ${max}',
      'validationErrors.greaterThanOrEqualZero' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ??
            'Voer alstublieft een waarde in groter of gelijk aan nul',
      'validationErrors.lessThan4' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? 'Voer alstublieft een waarde in lager dan vier',
      'validationErrors.biggerThan100' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? 'Voer alstublieft een waarde in groter dan honderd',
      'validationErrors.moreThan4ColumnsWarning' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ??
            'Het gebruik van vier of meer kolommen kan de prestaties negatief beïnvloeden',
      'validationErrors.moreThan8ColumnsWarning' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ??
            'Het gebruik van acht of meer kolommen kan de prestaties negatief beïnvloeden',
      'init.initError' => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Initialisatiefout!',
      'init.settingUpProxy' => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Proxy instellen…',
      'init.loadingDatabase' => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Database laden…',
      'init.loadingBoorus' => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Boorus laden…',
      'init.loadingTags' => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Labels laden…',
      'init.restoringTabs' => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Tabbladen herstellen…',
      'permissions.noAccessToCustomStorageDirectory' =>
        TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ?? 'Geen toegang tot alternatieve opslaglocatie',
      'permissions.pleaseSetStorageDirectoryAgain' =>
        TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ??
            'Stel de alternatieve opslaglocatie opnieuw in om de app toegang te kunnen verlenen',
      'permissions.currentPath' => ({
        required String path,
      }) => TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? 'Huidig pad: ${path}',
      'permissions.setDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? 'Instellen locatie',
      'permissions.currentlyNotAvailableForThisPlatform' =>
        TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ?? 'Niet beschikbaar op dit platform',
      'permissions.resetDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? 'Reset map',
      'permissions.afterResetFilesWillBeSavedToDefaultDirectory' =>
        TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ??
            'Bestanden zullen automatisch naar hun standaard opslaglocatie worden opgeslagen na de reset',
      'authentication.pleaseAuthenticateToUseTheApp' =>
        TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ??
            'Identificeer alstublieft om de app te gebruiken',
      'authentication.noBiometricHardwareAvailable' =>
        TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? 'Geen biometrische hardware beschikbaar',
      'authentication.temporaryLockout' =>
        TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? 'Tijdelijke uitsluiting',
      'authentication.somethingWentWrong' =>
        ({required String error}) =>
            TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ??
            'Er ging iets fout tijdens de identificatie: ${error}',
      'searchHandler.removedLastTab' => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? 'Laatste tabblad verwijderd',
      'searchHandler.resettingSearchToDefaultTags' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? 'Standaard labels worden teruggezet',
      'searchHandler.ratingsChanged' => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? 'Beoordelingen gewijzigd',
      'searchHandler.ratingsChangedMessage' =>
        ({required String booruType}) =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
            'Op ${booruType} [rating:safe] is nu vervangen voor [rating:general] en [rating:sensitive]',
      'searchHandler.appFixedRatingAutomatically' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ??
            'Beoordeling was automatisch opgelost. Gebruik bij toekomstige zoekopdrachten de juiste beoordeling',
      'searchHandler.tabsRestored' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? 'Tabbladen hersteld',
      'searchHandler.restoredTabsCount' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
              count,
              one: '${count} tabblad hersteld van vorige sessie',
              few: '${count} tabbladen hersteld van vorige sessie',
              many: '${count} tabbladen hersteld van vorige sessie',
              other: '${count} tabbladen hersteld van vorige sessie',
            ),
      'searchHandler.someRestoredTabsHadIssues' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ??
            'Sommige herstelde tabbladen hadden onbekende boorus of gebroken karakters.',
      'searchHandler.theyWereSetToDefaultOrIgnored' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ?? 'Ze zijn hersteld of genegeerd.',
      'searchHandler.listOfBrokenTabs' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? 'Lijst van gebroken tabbladen:',
      'searchHandler.tabsMerged' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? 'Tabbladen samengevoegd',
      'searchHandler.addedTabsCount' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
              count,
              one: '${count} nieuwe tabbladen toegevoegd',
              few: '${count} nieuwe tabbladen toegevoegd',
              many: '${count} nieuwe tabbladen toegevoegd',
              other: '${count} nieuwe tabbladen toegevoegd',
            ),
      'searchHandler.tabsReplaced' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? 'Tabbladen vervangen',
      'searchHandler.receivedTabsCount' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
              count,
              one: '${count} tabblad ontvangen',
              few: '${count} tabbladen ontvangen',
              many: '${count} tabbladen ontvangen',
              other: '${count} tabbladen ontvangen',
            ),
      'snatcher.title' => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Downloader',
      'snatcher.snatchingHistory' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'Downloadgeschiedenis',
      'snatcher.enterTags' => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'Labels invoeren',
      'snatcher.amount' => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? 'Hoeveelheid',
      'snatcher.amountOfFilesToSnatch' =>
        TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? 'Hoeveelheid bestanden te downloaden',
      'snatcher.delayInMs' => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? 'Vertraging (in ms)',
      'snatcher.delayBetweenEachDownload' =>
        TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? 'Vertraging tussen iedere download',
      'snatcher.snatchFiles' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? 'Download bestanden',
      'snatcher.itemWasAlreadySnatched' =>
        TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? 'Item is al eerder gedownload',
      'snatcher.failedToSnatchItem' => TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? 'Kon item niet downloaden',
      'snatcher.itemWasCancelled' => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? 'Item was geannuleerd',
      'snatcher.startingNextQueueItem' =>
        TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? 'Begint aan volgend item in wachtrij…',
      'snatcher.itemsSnatched' => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? 'Items gedownload',
      'snatcher.snatchedCount' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
              count,
              one: 'Gedownload: ${count} item',
              few: 'Gedownload: ${count} items',
              many: 'Gedownload: ${count} items',
              other: 'Gedownload: ${count} items',
            ),
      'snatcher.filesAlreadySnatched' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
              count,
              one: '${count} bestand is al gedownload',
              few: '${count} bestanden zijn al gedownload',
              many: '${count} bestanden zijn al gedownload',
              other: '${count} bestanden zijn al gedownload',
            ),
      'snatcher.failedToSnatchFiles' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
              count,
              one: '${count} bestand downloaden mislukt',
              few: '${count} bestanden downloaden mislukt',
              many: '${count} bestanden downloaden mislukt',
              other: '${count} bestanden downloaden mislukt',
            ),
      'snatcher.cancelledFiles' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
              count,
              one: '${count} bestand geannuleerd',
              few: '${count} bestanden geannuleerd',
              many: '${count} bestanden geannuleerd',
              other: '${count} bestanden geannuleerd',
            ),
      'snatcher.snatchingImages' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? 'Afbeeldingen downloaden',
      'snatcher.doNotCloseApp' => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? 'Sluit de app niet!',
      'snatcher.addedItemToQueue' =>
        TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? 'Item toegevoegd aan downloadwachtrij',
      'snatcher.addedItemsToQueue' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
              count,
              one: '${count} item toegevoegd aan downloadwachtrij ',
              few: '${count} items toegevoegd aan downloadwachtrij',
              many: '${count} items toegevoegd aan downloadwachtrij',
              other: '${count} items toegevoegd aan downloadwachtrij',
            ),
      'multibooru.multibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Multibooru-modus',
      'multibooru.multibooruRequiresAtLeastTwoBoorus' =>
        TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ??
            'Vereist tenminste twee geconfigureerde boorus',
      'multibooru.selectSecondaryBoorus' =>
        TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Selecteer aanvullende boorus:',
      'multibooru.akaMultibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? 'aka Multibooru-modus',
      'multibooru.labelSecondaryBoorusToInclude' =>
        TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? 'Secundaire boorus om erbij te betrekken',
      'hydrus.importError' => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'Er ging iets mis met het importeren naar hydrus',
      'hydrus.apiPermissionsRequired' =>
        TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ??
            'U heeft misschien niet de juiste API rechten afgegeven, deze kan u bewerken in Review Services',
      'hydrus.addTagsToFile' => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? 'Labels aan bestand toevoegen',
      'hydrus.addUrls' => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'URLs toevoegen',
      'tabs.tab' => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? 'Tabblad',
      'tabs.addBoorusInSettings' => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? 'Boorus toevoegen aan instellingen',
      'tabs.selectABooru' => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? 'Selecteer een Booru',
      'tabs.secondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? 'Secundaire booru',
      'tabs.addNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? 'Nieuw tabblad toevoegen',
      'tabs.selectABooruOrLeaveEmpty' =>
        TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? 'Selecteer een booru of laat leeg',
      'tabs.addPosition' => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? 'Positie toevoegen',
      'tabs.addModePrevTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? 'Vorig tabblad',
      'tabs.addModeNextTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? 'Volgend tabblad',
      'tabs.addModeListEnd' => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? 'Einde lijst',
      'tabs.usedQuery' => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? 'Gebruikte aanvraag',
      'tabs.queryModeDefault' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? 'Standaard',
      'tabs.queryModeCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? 'Huidig',
      'tabs.queryModeCustom' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? 'Aangepast',
      'tabs.customQuery' => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? 'Aangepast verzoek',
      'tabs.empty' => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '[leeg]',
      'tabs.addSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? 'Voeg secundaire boorus toe',
      'tabs.keepSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? 'Behoudt secundaire boorus',
      'tabs.startFromCustomPageNumber' =>
        TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? 'Start vanaf een aangepast paginanummer',
      'tabs.switchToNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? 'Wissel naar nieuw tabblad',
      'tabs.add' => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? 'Toevoegen',
      'tabs.tabsManager' => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? 'Tabblad beheerder',
      'tabs.selectMode' => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? 'Selecteer modus',
      'tabs.sortMode' => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? 'Sorteer tabbladen',
      'tabs.help' => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? 'Help',
      'tabs.deleteTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? 'Wis tabbladen',
      'tabs.tabOrderSaved' => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? 'Tabblad volgorde opgeslagen',
      'tabs.scrollToCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? 'Scroll naar huidig tabblad',
      'tabs.scrollToTop' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? 'Scroll naar de top',
      'tabs.scrollToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? 'Scroll naar de bodem',
      'tabs.filterTabsByBooru' => TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? 'Filter op booru, staat, duplicaties…',
      'tabs.sorting' => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? 'Sorteren:',
      'tabs.defaultTabsOrder' => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? 'Standaard tabblad volgorde',
      'tabs.sortAlphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? 'Sorteer alfabetisch',
      'tabs.sortAlphabeticallyReversed' =>
        TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? 'Sorteer alfabetisch (omgekeerd)',
      'tabs.onTheBottomOfPage' => TranslationOverrides.string(_root.$meta, 'tabs.onTheBottomOfPage', {}) ?? 'Beneden de pagina: ',
      'tabs.deleteSelectedTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? 'Wis geselecteerde tabbladen',
      'tabs.copy' => TranslationOverrides.string(_root.$meta, 'tabs.copy', {}) ?? 'Kopieer',
      'tabs.moveAction' => TranslationOverrides.string(_root.$meta, 'tabs.moveAction', {}) ?? 'Verplaats',
      'tabs.shuffle' => TranslationOverrides.string(_root.$meta, 'tabs.shuffle', {}) ?? 'Husselen',
      'tabs.sort' => TranslationOverrides.string(_root.$meta, 'tabs.sort', {}) ?? 'Sorteer',
      'tabs.byBooru' => TranslationOverrides.string(_root.$meta, 'tabs.byBooru', {}) ?? 'Van booru',
      'tabs.alphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.alphabetically', {}) ?? 'Alfabetisch',
      'tabs.reversed' => TranslationOverrides.string(_root.$meta, 'tabs.reversed', {}) ?? '(omgekeerd)',
      'tabs.areYouSureDeleteTabs' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'tabs.areYouSureDeleteTabs', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
              count,
              one: 'Weet u zeker u wilt ${count} tabblad wissen?',
              few: 'Weet u zeker u wilt ${count} tabbladen wissen?',
              many: 'Weet u zeker u wilt ${count} tabbladen wissen?',
              other: 'Weet u zeker u wilt ${count} tabbladen wissen?',
            ),
      'tabs.filters.loaded' => TranslationOverrides.string(_root.$meta, 'tabs.filters.loaded', {}) ?? 'Geladen',
      'tabs.filters.tagType' => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagType', {}) ?? 'Label type',
      'tabs.filters.duplicates' => TranslationOverrides.string(_root.$meta, 'tabs.filters.duplicates', {}) ?? 'Duplicaten',
      'tabs.filters.checkDuplicatesOnSameBooru' =>
        TranslationOverrides.string(_root.$meta, 'tabs.filters.checkDuplicatesOnSameBooru', {}) ?? 'Controleer voor duplicaten op dezelfde Booru',
      'tabs.filters.emptySearchQuery' => TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? 'Lege zoekopdrachr',
      'tabs.filters.title' => TranslationOverrides.string(_root.$meta, 'tabs.filters.title', {}) ?? 'Tabblad filters',
      'tabs.filters.all' => TranslationOverrides.string(_root.$meta, 'tabs.filters.all', {}) ?? 'Alle',
      'tabs.filters.notLoaded' => TranslationOverrides.string(_root.$meta, 'tabs.filters.notLoaded', {}) ?? 'Niet geladen',
      'tabs.filters.enabled' => TranslationOverrides.string(_root.$meta, 'tabs.filters.enabled', {}) ?? 'Ingeschakeld',
      'tabs.filters.disabled' => TranslationOverrides.string(_root.$meta, 'tabs.filters.disabled', {}) ?? 'Uitgeschakeld',
      'tabs.filters.willAlsoEnableSorting' =>
        TranslationOverrides.string(_root.$meta, 'tabs.filters.willAlsoEnableSorting', {}) ?? 'Zal ook sorteren activeren',
      'tabs.filters.any' => TranslationOverrides.string(_root.$meta, 'tabs.filters.any', {}) ?? 'Elk',
      'tabs.filters.apply' => TranslationOverrides.string(_root.$meta, 'tabs.filters.apply', {}) ?? 'Toepassen',
      'tabs.move.moveToTop' => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToTop', {}) ?? 'Verplaats naar boven',
      'tabs.move.moveToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToBottom', {}) ?? 'Verplaats naar beneden',
      'tabs.move.tabNumber' => TranslationOverrides.string(_root.$meta, 'tabs.move.tabNumber', {}) ?? 'Tabblad nummer',
      'tabs.move.invalidTabNumber' => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidTabNumber', {}) ?? 'Ongeldig tabblad nummer',
      'tabs.move.invalidInput' => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidInput', {}) ?? 'Ongeldige invoer',
      'tabs.move.outOfRange' => TranslationOverrides.string(_root.$meta, 'tabs.move.outOfRange', {}) ?? 'Buiten bereik',
      'tabs.move.pleaseEnterValidTabNumber' =>
        TranslationOverrides.string(_root.$meta, 'tabs.move.pleaseEnterValidTabNumber', {}) ?? 'Geef alstublieft een geldig tabblad nummer',
      'tabs.move.preview' => TranslationOverrides.string(_root.$meta, 'tabs.move.preview', {}) ?? 'Voorbeeld:',
      'history.searchHistory' => TranslationOverrides.string(_root.$meta, 'history.searchHistory', {}) ?? 'Zoekgeschiedenis',
      'history.searchHistoryIsEmpty' => TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsEmpty', {}) ?? 'Zoekgeschiedenis is leeg',
      'history.searchHistoryIsDisabled' =>
        TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsDisabled', {}) ?? 'Zoekgeschiedenis is uitgeschakeld',
      'history.lastSearch' => ({
        required String search,
      }) => TranslationOverrides.string(_root.$meta, 'history.lastSearch', {'search': search}) ?? 'Laatste zoekopdracht: ${search}',
      'history.lastSearchWithDate' => ({
        required String date,
      }) => TranslationOverrides.string(_root.$meta, 'history.lastSearchWithDate', {'date': date}) ?? 'Laatste zoekopdracht: ${date}',
      'history.unknownBooruType' => TranslationOverrides.string(_root.$meta, 'history.unknownBooruType', {}) ?? 'Onbekend Booru type!',
      'history.unknownBooru' => ({
        required String name,
        required String type,
      }) => TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ?? 'Onbekende booru (${name}-${type})',
      'history.open' => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? 'Open',
      'history.openInNewTab' => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? 'Open in nieuw tabblad',
      'history.removeFromFavourites' => TranslationOverrides.string(_root.$meta, 'history.removeFromFavourites', {}) ?? 'Verwijder uit favorieten',
      'history.setAsFavourite' => TranslationOverrides.string(_root.$meta, 'history.setAsFavourite', {}) ?? 'Stel in als favoriet',
      'history.copy' => TranslationOverrides.string(_root.$meta, 'history.copy', {}) ?? 'Kopieer',
      'history.delete' => TranslationOverrides.string(_root.$meta, 'history.delete', {}) ?? 'Wissen',
      'history.deleteHistoryEntries' =>
        TranslationOverrides.string(_root.$meta, 'history.deleteHistoryEntries', {}) ?? 'Wis geschiedenis inzendingen',
      'history.clearSelection' => TranslationOverrides.string(_root.$meta, 'history.clearSelection', {}) ?? 'Leeg selectie',
      'history.deleteItems' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'history.deleteItems', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
              count,
              one: 'Wis ${count} item',
              few: 'Wis ${count} items',
              many: 'Wis ${count} items',
              other: 'Wis ${count} items',
            ),
      'webview.navigation.enterCustomUrl' =>
        TranslationOverrides.string(_root.$meta, 'webview.navigation.enterCustomUrl', {}) ?? 'Voer aangepaste URL in',
      'settings.booru.itemsPerPage' => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'Items downloaded per pagina',
      'settings.booru.itemsPerPageTip' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'Soms zullen boorus dit weigeren',
      'settings.booru.addBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Booru configuratie toevoegen',
      'settings.booru.addedBoorus' => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? 'Boorus toegevoegd',
      'settings.booru.deleteBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? 'Wis Booru configuratie',
      'settings.booru.deleteBooruError' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ??
            'Er ging iets mis tijdens het wissen van een Booru configuratie!',
      'settings.booru.booruDeleted' => TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? 'Booru configuratie gewist',
      'settings.booru.cantDeleteThisBooru' =>
        TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? 'Kan deze Booru niet wissen!',
      'settings.booruEditor.accessKeyRequestedTitle' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? 'Toegangssleutel aangevraagd',
      'settings.booruEditor.accessKeyFailedTitle' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? 'Toegangssleutel ophalen mislukt',
      'settings.booruEditor.accessKeyFailedMsg' =>
        TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ?? 'Heeft u het aanvraagscherm open in Hydrus?',
      'settings.theme.setCustomMascot' =>
        TranslationOverrides.string(_root.$meta, 'settings.theme.setCustomMascot', {}) ?? 'Stel aangepaste mascotte in',
      'settings.theme.removeCustomMascot' =>
        TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? 'Verwijder aangepaste mascotte',
      'settings.theme.custom' => TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? 'Gepersonaliseerd',
      'settings.theme.customFont' => TranslationOverrides.string(_root.$meta, 'settings.theme.customFont', {}) ?? 'Aangepast lettertype',
      'settings.theme.customFontSubtitle' =>
        TranslationOverrides.string(_root.$meta, 'settings.theme.customFontSubtitle', {}) ?? 'Geef de naam van een Google lettertype',
      'settings.theme.customFontHint' =>
        TranslationOverrides.string(_root.$meta, 'settings.theme.customFontHint', {}) ?? 'Doorzoek lettertypen op fonts.google.com',
      'settings.viewer.changePageButtonsPosition' =>
        TranslationOverrides.string(_root.$meta, 'settings.viewer.changePageButtonsPosition', {}) ?? 'Verplaats positie van knoppen op pagina',
      'settings.viewer.usingCustomAnimation' =>
        TranslationOverrides.string(_root.$meta, 'settings.viewer.usingCustomAnimation', {}) ?? 'Aangepaste animatie van toepassing',
      'settings.database.searchQuery' => TranslationOverrides.string(_root.$meta, 'settings.database.searchQuery', {}) ?? 'Zoekopdracht',
      'settings.database.searchQueryOptional' =>
        TranslationOverrides.string(_root.$meta, 'settings.database.searchQueryOptional', {}) ?? '(optioneel, kan het proces trager maken)',
      'settings.database.searchHistoryTapInfo' =>
        TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryTapInfo', {}) ?? 'Druk optie voor actie (wis, favoriet…)',
      'settings.database.deleteDatabase' => TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabase', {}) ?? 'Wis database',
      'settings.database.deleteDatabaseConfirm' =>
        TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabaseConfirm', {}) ?? 'Wis database?',
      'settings.database.databaseDeleted' => TranslationOverrides.string(_root.$meta, 'settings.database.databaseDeleted', {}) ?? 'Database gewist!',
      'settings.network.allCookiesDeleted' =>
        TranslationOverrides.string(_root.$meta, 'settings.network.allCookiesDeleted', {}) ?? 'Alle cookies verwijderd',
      'settings.cache.deleteCacheAfter' =>
        TranslationOverrides.string(_root.$meta, 'settings.cache.deleteCacheAfter', {}) ?? 'Wis tijdelijk geheugen na:',
      'settings.cache.neverDeleteDuration' => TranslationOverrides.string(_root.$meta, 'settings.cache.neverDeleteDuration', {}) ?? 'Nooit',
      'settings.itemFilters.title' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.title', {}) ?? 'Filters',
      'settings.itemFilters.hidden' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.hidden', {}) ?? 'Verborgen',
      'settings.itemFilters.marked' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.marked', {}) ?? 'Gemarkeerd',
      'settings.itemFilters.duplicateFilter' =>
        TranslationOverrides.string(_root.$meta, 'settings.itemFilters.duplicateFilter', {}) ?? 'Dubbele filter',
      'settings.itemFilters.noFiltersFound' =>
        TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersFound', {}) ?? 'Geen filters gevonden',
      'settings.itemFilters.noFiltersAdded' =>
        TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersAdded', {}) ?? 'Geen filters toegevoegd',
      'settings.itemFilters.removeHidden' =>
        TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeHidden', {}) ??
            'Verberg alle items met de overeenkomende verborgen filters',
      'settings.itemFilters.removeMarked' =>
        TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeMarked', {}) ??
            'Verberg alle items met de overeenkomende gemarkeerde filters',
      'settings.itemFilters.removeFavourited' =>
        TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeFavourited', {}) ?? 'Verwijder favoriete items',
      'settings.itemFilters.removeSnatched' =>
        TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeSnatched', {}) ?? 'Verwijder gedownloade items',
      'settings.itemFilters.removeAI' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeAI', {}) ?? 'Verwijder AI items',
      'settings.debug.deleteAllCookies' => TranslationOverrides.string(_root.$meta, 'settings.debug.deleteAllCookies', {}) ?? 'Wis alle cookies',
      'pageChanger.jumpToPage' => TranslationOverrides.string(_root.$meta, 'pageChanger.jumpToPage', {}) ?? 'Spring naar pagina',
      'pageChanger.searchUntilPage' => TranslationOverrides.string(_root.$meta, 'pageChanger.searchUntilPage', {}) ?? 'Zoek tot pagina',
      'pageChanger.stopSearching' => TranslationOverrides.string(_root.$meta, 'pageChanger.stopSearching', {}) ?? 'Stop met zoeken',
      'tagsManager.add' => TranslationOverrides.string(_root.$meta, 'tagsManager.add', {}) ?? 'Toevoegen',
      'tagsManager.addedATab' => TranslationOverrides.string(_root.$meta, 'tagsManager.addedATab', {}) ?? 'Tabblad toegevoegd',
      'tagsManager.addATab' => TranslationOverrides.string(_root.$meta, 'tagsManager.addATab', {}) ?? 'Tabblad toevoegen',
      'tagsManager.deleteTags' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'tagsManager.deleteTags', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
              count,
              one: 'Wis ${count} label',
              few: 'Wis ${count} labels',
              many: 'Wis ${count} labels',
              other: 'Wis ${count} labels',
            ),
      'tagsManager.deleteTagsTitle' => TranslationOverrides.string(_root.$meta, 'tagsManager.deleteTagsTitle', {}) ?? 'Wis labels',
      'tagView.addedNewTab' => TranslationOverrides.string(_root.$meta, 'tagView.addedNewTab', {}) ?? 'Tabblad toegevoegd:',
      'tagView.addedToSearchBar' => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBar', {}) ?? 'Aan zoekbalk toegevoegd:',
      'tagView.failedToLoadPreviewPage' =>
        TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreviewPage', {}) ?? 'Voorbeeld pagina mislukt te laden',
      'mobileHome.clearAllRetryableItems' =>
        TranslationOverrides.string(_root.$meta, 'mobileHome.clearAllRetryableItems', {}) ?? 'Maak alle items voor een nieuwe poging vrij',
      'desktopHome.addBoorusInSettings' =>
        TranslationOverrides.string(_root.$meta, 'desktopHome.addBoorusInSettings', {}) ?? 'Boorus toevoegen in de instellingen',
      'desktopHome.noItemsSelected' => TranslationOverrides.string(_root.$meta, 'desktopHome.noItemsSelected', {}) ?? 'Geen items geselecteerd',
      'galleryView.noItems' => TranslationOverrides.string(_root.$meta, 'galleryView.noItems', {}) ?? 'Geen items',
      'galleryView.noItemSelected' => TranslationOverrides.string(_root.$meta, 'galleryView.noItemSelected', {}) ?? 'Geen item geselecteerd',
      'mediaPreviews.addNewBooru' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? 'New Booru toevoegen',
      'viewer.appBar.abort' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.abort', {}) ?? 'Afbreken',
      'common.booruItemCopiedToClipboard' =>
        TranslationOverrides.string(_root.$meta, 'common.booruItemCopiedToClipboard', {}) ?? 'Booru item gekopieerd naar klembord',
      'media.video.failedToLoadItemData' =>
        TranslationOverrides.string(_root.$meta, 'media.video.failedToLoadItemData', {}) ?? 'Kon item data niet laden',
      'media.video.loadingItemData' => TranslationOverrides.string(_root.$meta, 'media.video.loadingItemData', {}) ?? 'Item data laden…',
      _ => null,
    };
  }
}
