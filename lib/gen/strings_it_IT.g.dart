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
class TranslationsItIt extends Translations with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  /// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
  TranslationsItIt({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : _meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.itIt,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ),
       super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
    _meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <it-IT>.
  final TranslationMetadata<AppLocale, Translations> _meta;
  @override
  TranslationMetadata<AppLocale, Translations> get $meta => _meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => _meta.getTranslation(key) ?? super[key];

  late final TranslationsItIt _root = this; // ignore: unused_field

  @override
  TranslationsItIt $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsItIt(meta: meta ?? this.$meta);

  // Translations
  @override
  String get locale => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'it-IT';
  @override
  String get localeName => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'Italiano';
  @override
  String get appName => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Errore';
  @override
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'Errore!';
  @override
  String get success => TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Successo';
  @override
  String get successExclamation => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? 'Successo!';
  @override
  String get cancel => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Annulla';
  @override
  String get kReturn => TranslationOverrides.string(_root.$meta, 'kReturn', {}) ?? 'Indietro';
  @override
  String get later => TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Dopo';
  @override
  String get close => TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Chiudi';
  @override
  String get ok => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'Ok';
  @override
  String get yes => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Sì';
  @override
  String get no => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'No';
  @override
  String get pleaseWait => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Attendere prego…';
  @override
  String get show => TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Mostra';
  @override
  String get hide => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Nascondi';
  @override
  String get enable => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'Abilita';
  @override
  String get disable => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Disabilita';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Aggiungi';
  @override
  String get exclude => TranslationOverrides.string(_root.$meta, 'exclude', {}) ?? 'Escludi';
  @override
  String get edit => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? 'Modifica';
  @override
  String get remove => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? 'Rimuovi';
  @override
  String get save => TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Salva';
  @override
  String get delete => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? 'Elimina';
  @override
  String get confirm => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? 'Conferma';
  @override
  String get retry => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? 'Riprova';
  @override
  String get clear => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? 'Pulisci';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Copia';
  @override
  String get copied => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Copiato';
  @override
  String get copiedToClipboard => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? 'Copiato negli appunti';
  @override
  String get nothingFound => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? 'Nessun risultato';
  @override
  String get paste => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Incolla';
  @override
  String get copyErrorText => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Copia errore';
  @override
  String get booru => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru';
  @override
  String get goToSettings => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'Impostazioni';
  @override
  String get thisMayTakeSomeTime => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'Potrebbe richiedere un po\' di tempo…';
  @override
  String get exitTheAppQuestion => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? 'Chiudere l\'app?';
  @override
  String get closeTheApp => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Chiudi applicazione';
  @override
  String get invalidUrl => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'URL non valido!';
  @override
  String get clipboardIsEmpty => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'Appunti vuoti!';
  @override
  String get failedToOpenLink => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'Impossibile aprire il link';
  @override
  String get apiKey => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'Chiave API';
  @override
  String get userId => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'ID Utente';
  @override
  String get login => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Nome utente';
  @override
  String get password => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Password';
  @override
  String get pause => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Metti in pausa';
  @override
  String get resume => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Riprendi';
  @override
  String get discord => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord';
  @override
  String get visitOurDiscord => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Visita il nostro server Discord';
  @override
  String get item => TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Oggetto';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'select', {}) ?? 'Seleziona';
  @override
  String get selectAll => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Seleziona tutto';
  @override
  String get reset => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'Reset';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'open', {}) ?? 'Apri';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? 'Apri in nuova scheda';
  @override
  String get move => TranslationOverrides.string(_root.$meta, 'move', {}) ?? 'Sposta';
  @override
  String get shuffle => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? 'Mischia';
  @override
  String get sort => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? 'Ordina';
  @override
  String get go => TranslationOverrides.string(_root.$meta, 'go', {}) ?? 'Vai';
  @override
  String get search => TranslationOverrides.string(_root.$meta, 'search', {}) ?? 'Cerca';
  @override
  String get filter => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? 'Filtra';
  @override
  String get or => TranslationOverrides.string(_root.$meta, 'or', {}) ?? 'O (~)';
  @override
  String get page => TranslationOverrides.string(_root.$meta, 'page', {}) ?? 'Pagina';
  @override
  String get pageNumber => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? 'Pagina #';
  @override
  String get tags => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'Tag';
  @override
  String get type => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'Tipo';
  @override
  String get name => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Nome';
  @override
  String get address => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'Indirizzo';
  @override
  String get username => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'Nome utente';
  @override
  String get favourites => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'Preferiti';
  @override
  String get downloads => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'Download';
  @override
  String get secondsShort => TranslationOverrides.string(_root.$meta, 'secondsShort', {}) ?? 's';
  @override
  String get minutesShort => TranslationOverrides.string(_root.$meta, 'minutesShort', {}) ?? 'm';
  @override
  String get hoursShort => TranslationOverrides.string(_root.$meta, 'hoursShort', {}) ?? 'h';
  @override
  String get daysShort => TranslationOverrides.string(_root.$meta, 'daysShort', {}) ?? 'g';
  @override
  String get leaveThisPageQuestion => TranslationOverrides.string(_root.$meta, 'leaveThisPageQuestion', {}) ?? 'Lasciare questa pagina?';
  @override
  String get pageWillCloseAutomatically =>
      TranslationOverrides.string(_root.$meta, 'pageWillCloseAutomatically', {}) ?? 'Questa pagina si chiuderà automaticamente';
  @override
  String get stay => TranslationOverrides.string(_root.$meta, 'stay', {}) ?? 'Rimani';
  @override
  String get leaveNow => TranslationOverrides.string(_root.$meta, 'leaveNow', {}) ?? 'Esci ora';
  @override
  late final _Translations$validationErrors$it_IT validationErrors = _Translations$validationErrors$it_IT._(_root);
  @override
  late final _Translations$init$it_IT init = _Translations$init$it_IT._(_root);
  @override
  late final _Translations$permissions$it_IT permissions = _Translations$permissions$it_IT._(_root);
  @override
  late final _Translations$authentication$it_IT authentication = _Translations$authentication$it_IT._(_root);
  @override
  late final _Translations$searchHandler$it_IT searchHandler = _Translations$searchHandler$it_IT._(_root);
  @override
  late final _Translations$snatcher$it_IT snatcher = _Translations$snatcher$it_IT._(_root);
  @override
  late final _Translations$multibooru$it_IT multibooru = _Translations$multibooru$it_IT._(_root);
  @override
  late final _Translations$hydrus$it_IT hydrus = _Translations$hydrus$it_IT._(_root);
  @override
  late final _Translations$tabs$it_IT tabs = _Translations$tabs$it_IT._(_root);
  @override
  late final _Translations$history$it_IT history = _Translations$history$it_IT._(_root);
  @override
  late final _Translations$webview$it_IT webview = _Translations$webview$it_IT._(_root);
  @override
  late final _Translations$settings$it_IT settings = _Translations$settings$it_IT._(_root);
  @override
  late final _Translations$comments$it_IT comments = _Translations$comments$it_IT._(_root);
  @override
  late final _Translations$pageChanger$it_IT pageChanger = _Translations$pageChanger$it_IT._(_root);
  @override
  late final _Translations$tagsFiltersDialogs$it_IT tagsFiltersDialogs = _Translations$tagsFiltersDialogs$it_IT._(_root);
  @override
  late final _Translations$tagsManager$it_IT tagsManager = _Translations$tagsManager$it_IT._(_root);
  @override
  late final _Translations$lockscreen$it_IT lockscreen = _Translations$lockscreen$it_IT._(_root);
  @override
  late final _Translations$loliSync$it_IT loliSync = _Translations$loliSync$it_IT._(_root);
  @override
  late final _Translations$imageSearch$it_IT imageSearch = _Translations$imageSearch$it_IT._(_root);
  @override
  late final _Translations$tagView$it_IT tagView = _Translations$tagView$it_IT._(_root);
  @override
  late final _Translations$pinnedTags$it_IT pinnedTags = _Translations$pinnedTags$it_IT._(_root);
  @override
  late final _Translations$searchBar$it_IT searchBar = _Translations$searchBar$it_IT._(_root);
  @override
  late final _Translations$mobileHome$it_IT mobileHome = _Translations$mobileHome$it_IT._(_root);
  @override
  late final _Translations$desktopHome$it_IT desktopHome = _Translations$desktopHome$it_IT._(_root);
  @override
  late final _Translations$galleryView$it_IT galleryView = _Translations$galleryView$it_IT._(_root);
  @override
  late final _Translations$mediaPreviews$it_IT mediaPreviews = _Translations$mediaPreviews$it_IT._(_root);
  @override
  late final _Translations$viewer$it_IT viewer = _Translations$viewer$it_IT._(_root);
  @override
  late final _Translations$common$it_IT common = _Translations$common$it_IT._(_root);
  @override
  late final _Translations$gallery$it_IT gallery = _Translations$gallery$it_IT._(_root);
  @override
  late final _Translations$galleryButtons$it_IT galleryButtons = _Translations$galleryButtons$it_IT._(_root);
  @override
  late final _Translations$media$it_IT media = _Translations$media$it_IT._(_root);
  @override
  late final _Translations$imageStats$it_IT imageStats = _Translations$imageStats$it_IT._(_root);
  @override
  late final _Translations$preview$it_IT preview = _Translations$preview$it_IT._(_root);
  @override
  late final _Translations$tagType$it_IT tagType = _Translations$tagType$it_IT._(_root);
}

// Path: validationErrors
class _Translations$validationErrors$it_IT extends Translations$validationErrors$en {
  _Translations$validationErrors$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get required => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Inserisci un valore';
  @override
  String get invalid => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Inserisci un valore valido';
  @override
  String get invalidNumber => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? 'Inserisci un numero';
  @override
  String get invalidNumericValue =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? 'Inserisci un valore numerico valido';
  @override
  String tooSmall({required double min}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Inserisci un valore maggiore di ${min}';
  @override
  String tooBig({required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Inserisci un valore minore di ${max}';
  @override
  String rangeError({required double min, required double max}) =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ?? 'Inserisci un valore tra ${min} e ${max}';
  @override
  String get greaterThanOrEqualZero =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? 'Inserisci un valore pari o maggiore di 0';
  @override
  String get lessThan4 => TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? 'Inserisci un valore minore di 4';
  @override
  String get biggerThan100 => TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? 'Inserisci un valore maggiore di 100';
  @override
  String get moreThan4ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ??
      'Usare più di 4 colonne può influenzare le prestazioni';
  @override
  String get moreThan8ColumnsWarning =>
      TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ??
      'Usare più di 8 colonne può influenzare le prestazioni';
}

// Path: init
class _Translations$init$it_IT extends Translations$init$en {
  _Translations$init$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get initError => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Errore di inizializzazione!';
  @override
  String get settingUpProxy => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Impostazione proxy…';
  @override
  String get loadingDatabase => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Caricamento del database…';
  @override
  String get loadingBoorus => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Caricamento booru…';
  @override
  String get loadingTags => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Caricamento tag…';
  @override
  String get restoringTabs => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Ripristino delle schede…';
}

// Path: permissions
class _Translations$permissions$it_IT extends Translations$permissions$en {
  _Translations$permissions$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get localNetworkRequired =>
      TranslationOverrides.string(_root.$meta, 'permissions.localNetworkRequired', {}) ??
      'Per aprire questo indirizzo è necessario l\'accesso alla rete locale. Concedi l\'autorizzazione «Dispositivi nelle vicinanze», poi riprova.';
  @override
  String get localNetworkExplanationTitle =>
      TranslationOverrides.string(_root.$meta, 'permissions.localNetworkExplanationTitle', {}) ?? 'Accesso alla rete locale';
  @override
  String get localNetworkExplanation =>
      TranslationOverrides.string(_root.$meta, 'permissions.localNetworkExplanation', {}) ??
      'Per aprire server booru locali o sincronizzarsi con un altro dispositivo, l\'app deve poter accedere alla rete locale. Android mostrerà una richiesta di autorizzazione per i «Dispositivi nelle vicinanze».';
  @override
  String get noAccessToCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ?? 'Nessun accesso alla cartella selezionata';
  @override
  String get pleaseSetStorageDirectoryAgain =>
      TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ??
      'Seleziona nuovamente la cartella per consentire all\'app di accedervi';
  @override
  String currentPath({required String path}) =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? 'Percorso attuale: ${path}';
  @override
  String get setDirectory => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? 'Imposta cartella';
  @override
  String get currentlyNotAvailableForThisPlatform =>
      TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ?? 'Non disponibile su questa piattaforma';
  @override
  String get resetDirectory => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? 'Resetta cartella';
  @override
  String get afterResetFilesWillBeSavedToDefaultDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ??
      'I file saranno salvati nella cartella di default dopo il reset';
}

// Path: authentication
class _Translations$authentication$it_IT extends Translations$authentication$en {
  _Translations$authentication$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get pleaseAuthenticateToUseTheApp =>
      TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ?? 'Autenticati per usare l\'app';
  @override
  String get noBiometricHardwareAvailable =>
      TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? 'Nessun hardware biometrico disponibile';
  @override
  String get temporaryLockout => TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? 'Bloccato temporaneamente';
  @override
  String somethingWentWrong({required String error}) =>
      TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ??
      'Qualcosa è andato storto durante l\'autenticazione: ${error}';
}

// Path: searchHandler
class _Translations$searchHandler$it_IT extends Translations$searchHandler$en {
  _Translations$searchHandler$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get removedLastTab => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? 'Ultima scheda rimossa';
  @override
  String get resettingSearchToDefaultTags =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? 'Ripristinando i tag di default';
  @override
  String get uoh => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'UOOOOOOOHHH';
  @override
  String get ratingsChanged => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? 'Classificazioni modificate';
  @override
  String ratingsChangedMessage({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
      'Su ${booruType} [rating:safe] è stato rimpiazzato da [rating:general] e [rating:sensitive]';
  @override
  String get appFixedRatingAutomatically =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ??
      'La classificazione è stata corretta automaticamente. Usa la classificazione corretta nelle ricerche future';
  @override
  String get tabsRestored => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? 'Schede ripristinate';
  @override
  String restoredTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
        count,
        one: 'Ripristinata ${count} scheda dalla sessione precedente',
        many: 'Ripristinate ${count} schede dalla sessione precedente',
        other: 'Ripristinate ${count} schede dalla sessione precedente',
      );
  @override
  String get someRestoredTabsHadIssues =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ??
      'Alcune schede ripristinate avevano booru sconosciuti o caratteri danneggiati.';
  @override
  String get theyWereSetToDefaultOrIgnored =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ??
      'Sono state reimpostate sui valori predefiniti o ignorate.';
  @override
  String get listOfBrokenTabs => TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? 'Lista delle schede danneggiate:';
  @override
  String get tabsMerged => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? 'Schede unite';
  @override
  String addedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
        count,
        one: 'Aggiunta ${count} nuova scheda',
        many: 'Aggiunte ${count} nuove schede',
        other: 'Aggiunte ${count} nuove schede',
      );
  @override
  String get tabsReplaced => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? 'Schede sostituite';
  @override
  String receivedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
        count,
        one: 'Ricevuta ${count} scheda',
        many: 'Ricevute ${count} schede',
        other: 'Ricevute ${count} schede',
      );
}

// Path: snatcher
class _Translations$snatcher$it_IT extends Translations$snatcher$en {
  _Translations$snatcher$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Snatcher';
  @override
  String get snatchingHistory => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'Cronologia dei download';
  @override
  String get enterTags => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'Inserisci tag';
  @override
  String get amount => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? 'Quantità';
  @override
  String get amountOfFilesToSnatch => TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? 'Numero di file da scaricare';
  @override
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? 'Ritardo (in ms)';
  @override
  String get delayBetweenEachDownload =>
      TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? 'Ritardo tra ogni download';
  @override
  String get snatchFiles => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? 'Scarica file';
  @override
  String get itemWasAlreadySnatched =>
      TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? 'L\'elemento è già stato scaricato';
  @override
  String get failedToSnatchItem => TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? 'Impossibile scaricare l\'elemento';
  @override
  String get itemWasCancelled =>
      TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? 'Il download dell\'elemento è stato annullato';
  @override
  String get startingNextQueueItem =>
      TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? 'Avvio del prossimo elemento in coda…';
  @override
  String get itemsSnatched => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? 'Elementi scaricati';
  @override
  String snatchedCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
        count,
        one: 'Scaricato: ${count} elemento',
        many: 'Scaricati: ${count} elementi',
        other: 'Scaricati: ${count} elementi',
      );
  @override
  String filesAlreadySnatched({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
        count,
        one: '${count} file è già stato scaricato',
        many: '${count} file sono già stati scaricati',
        other: '${count} file sono già stati scaricati',
      );
  @override
  String failedToSnatchFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
        count,
        one: 'Impossibile scaricare ${count} file',
        many: 'Impossibile scaricare ${count} file',
        other: 'Impossibile scaricare ${count} file',
      );
  @override
  String cancelledFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
        count,
        one: 'Annullato il download di ${count} file',
        many: 'Annullato il download di ${count} file',
        other: 'Annullato il download di ${count} file',
      );
  @override
  String get snatchingImages => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? 'Download delle immagini';
  @override
  String get doNotCloseApp => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? 'Non chiudere l\'app!';
  @override
  String get addedItemToQueue =>
      TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? 'Elemento aggiunto alla coda di download';
  @override
  String addedItemsToQueue({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
        count,
        one: 'Aggiunto ${count} elemento alla coda di download',
        many: 'Aggiunti ${count} elementi alla coda di download',
        other: 'Aggiunti ${count} elementi alla coda di download',
      );
}

// Path: multibooru
class _Translations$multibooru$it_IT extends Translations$multibooru$en {
  _Translations$multibooru$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? 'Multibooru';
  @override
  String get multibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Modalità Multibooru';
  @override
  String get multibooruRequiresAtLeastTwoBoorus =>
      TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ?? 'Sono necessari almeno 2 booru configurati';
  @override
  String get selectSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Seleziona altri booru:';
  @override
  String get akaMultibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? 'ovvero modalità Multibooru';
  @override
  String get labelSecondaryBoorusToInclude =>
      TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? 'Booru secondari da includere';
}

// Path: hydrus
class _Translations$hydrus$it_IT extends Translations$hydrus$en {
  _Translations$hydrus$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get importError => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'Qualcosa è andato storto importando su hydrus';
  @override
  String get apiPermissionsRequired =>
      TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ??
      'Potresti non aver concesso i permessi API corretti; puoi modificarli in «Review Services»';
  @override
  String get addTagsToFile => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? 'Aggiungi i tag al file';
  @override
  String get addUrls => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'Aggiungi URL';
}

// Path: tabs
class _Translations$tabs$it_IT extends Translations$tabs$en {
  _Translations$tabs$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get tab => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? 'Scheda';
  @override
  String get addBoorusInSettings => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? 'Aggiungi booru in impostazioni';
  @override
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? 'Seleziona un Booru';
  @override
  String get secondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? 'Booru secondari';
  @override
  String get addNewTab => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? 'Aggiungi nuova scheda';
  @override
  String get selectABooruOrLeaveEmpty =>
      TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? 'Seleziona un booru o lascia vuoto';
  @override
  String get addPosition => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? 'Posizione di inserimento';
  @override
  String get addModePrevTab => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? 'Scheda precedente';
  @override
  String get addModeNextTab => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? 'Scheda successiva';
  @override
  String get addModeListEnd => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? 'Fine lista';
  @override
  String get usedQuery => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? 'Query usata';
  @override
  String get queryModeDefault => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? 'Predefinita';
  @override
  String get queryModeCurrent => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? 'Attuale';
  @override
  String get queryModeCustom => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? 'Personalizzata';
  @override
  String get customQuery => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? 'Query personalizzata';
  @override
  String get empty => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '[vuoto]';
  @override
  String get addSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? 'Aggiungi booru secondari';
  @override
  String get keepSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? 'Mantieni booru secondari';
  @override
  String get startFromCustomPageNumber =>
      TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? 'Inizia da un numero pagina personalizzato';
  @override
  String get switchToNewTab => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? 'Vai alla nuova scheda';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? 'Aggiungi';
  @override
  String get tabsManager => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? 'Gestione schede';
  @override
  String get selectMode => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? 'Modalità di selezione';
  @override
  String get sortMode => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? 'Ordina Schede';
  @override
  String get help => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? 'Aiuto';
  @override
  String get deleteTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? 'Elimina schede';
  @override
  String get deleteDuplicateTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteDuplicateTabs', {}) ?? 'Elimina schede duplicate';
  @override
  String get deleteDuplicateTabsQuestion =>
      TranslationOverrides.string(_root.$meta, 'tabs.deleteDuplicateTabsQuestion', {}) ??
      'Schede duplicate trovate. Seleziona le schede che vuoi mantenere in ogni gruppo:';
  @override
  String get keepFirstDuplicateTabs => TranslationOverrides.string(_root.$meta, 'tabs.keepFirstDuplicateTabs', {}) ?? 'Mantieni la prima';
  @override
  String get keepLastDuplicateTabs => TranslationOverrides.string(_root.$meta, 'tabs.keepLastDuplicateTabs', {}) ?? 'Mantieni l\'ultima';
  @override
  String get skipDuplicateTabDelete => TranslationOverrides.string(_root.$meta, 'tabs.skipDuplicateTabDelete', {}) ?? 'Salta';
  @override
  String get shuffleTabs => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? 'Mischia schede';
  @override
  String get tabRandomlyShuffled => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? 'Schede mischiate casualmente';
  @override
  String get tabOrderSaved => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? 'Ordine schede salvato';
  @override
  String get scrollToCurrent => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? 'Vai alla scheda corrente';
  @override
  String get scrollToTop => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? 'Torna all\'inizio';
  @override
  String get scrollToBottom => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? 'Vai alla fine';
  @override
  String get filterTabsByBooru => TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? 'Filtra per booru, stato, duplicati…';
  @override
  String get scrolling => TranslationOverrides.string(_root.$meta, 'tabs.scrolling', {}) ?? 'Scorrimento:';
  @override
  String get sorting => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? 'Ordinamento:';
  @override
  String get defaultTabsOrder => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? 'Ordine predefinito delle schede';
  @override
  String get sortAlphabetically => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? 'Ordina in ordine alfabetico';
  @override
  String get sortAlphabeticallyReversed =>
      TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? 'Ordina in ordine alfabetico (invertito)';
  @override
  String get sortByBooruName => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? 'Ordina alfabeticamente per nome booru';
  @override
  String get sortByBooruNameReversed =>
      TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ?? 'Ordina alfabeticamente per nome booru (invertito)';
  @override
  String get longPressSortToSave =>
      TranslationOverrides.string(_root.$meta, 'tabs.longPressSortToSave', {}) ?? 'Premi a lungo il pulsante ordina per salvare l\'ordine attuale';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? 'Seleziona:';
  @override
  String get toggleSelectMode => TranslationOverrides.string(_root.$meta, 'tabs.toggleSelectMode', {}) ?? 'Attiva/disattiva la modalità di selezione';
  @override
  String get onTheBottomOfPage => TranslationOverrides.string(_root.$meta, 'tabs.onTheBottomOfPage', {}) ?? 'In fondo alla pagina: ';
  @override
  String get selectDeselectAll => TranslationOverrides.string(_root.$meta, 'tabs.selectDeselectAll', {}) ?? 'Seleziona/deseleziona tutte le schede';
  @override
  String get deleteSelectedTabs => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? 'Elimina le schede selezionate';
  @override
  String get longPressToMove => TranslationOverrides.string(_root.$meta, 'tabs.longPressToMove', {}) ?? 'Premi a lungo su una scheda per spostarla';
  @override
  String get numbersInBottomRight =>
      TranslationOverrides.string(_root.$meta, 'tabs.numbersInBottomRight', {}) ?? 'Numeri in basso a destra della scheda:';
  @override
  String get firstNumberTabIndex =>
      TranslationOverrides.string(_root.$meta, 'tabs.firstNumberTabIndex', {}) ??
      'Primo numero - indice della scheda nell\'ordine predefinito della lista';
  @override
  String get secondNumberTabIndex =>
      TranslationOverrides.string(_root.$meta, 'tabs.secondNumberTabIndex', {}) ??
      'Secondo numero - indice della scheda nell\'ordine attuale della lista, appare quando il filtro/ordinamento è attivo';
  @override
  String get specialFilters => TranslationOverrides.string(_root.$meta, 'tabs.specialFilters', {}) ?? 'Filtri speciali:';
  @override
  String get loadedFilter =>
      TranslationOverrides.string(_root.$meta, 'tabs.loadedFilter', {}) ?? '«Caricato» - mostra le schede che hanno caricato elementi';
  @override
  String get notLoadedFilter =>
      TranslationOverrides.string(_root.$meta, 'tabs.notLoadedFilter', {}) ??
      '«Non caricato» - mostra le schede che non sono caricate e/o hanno zero elementi';
  @override
  String get notLoadedItalic =>
      TranslationOverrides.string(_root.$meta, 'tabs.notLoadedItalic', {}) ?? 'Le schede non caricate hanno il testo in corsivo';
  @override
  String get noTabsFound => TranslationOverrides.string(_root.$meta, 'tabs.noTabsFound', {}) ?? 'Nessuna scheda trovata';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tabs.copy', {}) ?? 'Copia';
  @override
  String get moveAction => TranslationOverrides.string(_root.$meta, 'tabs.moveAction', {}) ?? 'Sposta';
  @override
  String get remove => TranslationOverrides.string(_root.$meta, 'tabs.remove', {}) ?? 'Rimuovi';
  @override
  String get shuffle => TranslationOverrides.string(_root.$meta, 'tabs.shuffle', {}) ?? 'Mischia';
  @override
  String get sort => TranslationOverrides.string(_root.$meta, 'tabs.sort', {}) ?? 'Ordina';
  @override
  String get shuffleTabsQuestion =>
      TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabsQuestion', {}) ?? 'Vuoi mischiare l\'ordine delle schede in modo casuale?';
  @override
  String get saveTabsInCurrentOrder =>
      TranslationOverrides.string(_root.$meta, 'tabs.saveTabsInCurrentOrder', {}) ?? 'Vuoi salvare le schede nell\'ordine attuale?';
  @override
  String get byBooru => TranslationOverrides.string(_root.$meta, 'tabs.byBooru', {}) ?? 'Per booru';
  @override
  String get alphabetically => TranslationOverrides.string(_root.$meta, 'tabs.alphabetically', {}) ?? 'Alfabeticamente';
  @override
  String get reversed => TranslationOverrides.string(_root.$meta, 'tabs.reversed', {}) ?? '(invertito)';
  @override
  String areYouSureDeleteTabs({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'tabs.areYouSureDeleteTabs', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
        count,
        one: 'Sei sicuro di voler eliminare ${count} scheda?',
        many: 'Sei sicuro di voler eliminare ${count} schede?',
        other: 'Sei sicuro di voler eliminare ${count} schede?',
      );
  @override
  late final _Translations$tabs$filters$it_IT filters = _Translations$tabs$filters$it_IT._(_root);
  @override
  late final _Translations$tabs$move$it_IT move = _Translations$tabs$move$it_IT._(_root);
}

// Path: history
class _Translations$history$it_IT extends Translations$history$en {
  _Translations$history$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get searchHistory => TranslationOverrides.string(_root.$meta, 'history.searchHistory', {}) ?? 'Cronologia di ricerca';
  @override
  String get searchHistoryIsEmpty =>
      TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsEmpty', {}) ?? 'La cronologia di ricerca è vuota';
  @override
  String get searchHistoryIsDisabled =>
      TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsDisabled', {}) ?? 'Cronologia di ricerca disabilitata';
  @override
  String get searchHistoryRequiresDatabase =>
      TranslationOverrides.string(_root.$meta, 'history.searchHistoryRequiresDatabase', {}) ??
      'Abilita il database nelle impostazioni per la cronologia di ricerca';
  @override
  String lastSearch({required String search}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearch', {'search': search}) ?? 'Ultima ricerca: ${search}';
  @override
  String lastSearchWithDate({required String date}) =>
      TranslationOverrides.string(_root.$meta, 'history.lastSearchWithDate', {'date': date}) ?? 'Ultima ricerca: ${date}';
  @override
  String get unknownBooruType => TranslationOverrides.string(_root.$meta, 'history.unknownBooruType', {}) ?? 'Tipo di Booru sconosciuto!';
  @override
  String unknownBooru({required String name, required String type}) =>
      TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ?? 'Booru sconosciuto (${name}-${type})';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? 'Apri';
  @override
  String get openInNewTab => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? 'Apri in nuova scheda';
  @override
  String get removeFromFavourites => TranslationOverrides.string(_root.$meta, 'history.removeFromFavourites', {}) ?? 'Rimuovi dai preferiti';
  @override
  String get setAsFavourite => TranslationOverrides.string(_root.$meta, 'history.setAsFavourite', {}) ?? 'Imposta come preferito';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'history.copy', {}) ?? 'Copia';
  @override
  String get delete => TranslationOverrides.string(_root.$meta, 'history.delete', {}) ?? 'Elimina';
  @override
  String get deleteHistoryEntries => TranslationOverrides.string(_root.$meta, 'history.deleteHistoryEntries', {}) ?? 'Elimina voci della cronologia';
  @override
  String deleteItemsConfirm({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'history.deleteItemsConfirm', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
        count,
        one: 'Sei sicuro di voler eliminare ${count} elemento?',
        many: 'Sei sicuro di voler eliminare ${count} elementi?',
        other: 'Sei sicuro di voler eliminare ${count} elementi?',
      );
  @override
  String get clearSelection => TranslationOverrides.string(_root.$meta, 'history.clearSelection', {}) ?? 'Deseleziona tutto';
  @override
  String deleteItems({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'history.deleteItems', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
        count,
        one: 'Elimina ${count} elemento',
        many: 'Elimina ${count} elementi',
        other: 'Elimina ${count} elementi',
      );
}

// Path: webview
class _Translations$webview$it_IT extends Translations$webview$en {
  _Translations$webview$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'webview.title', {}) ?? 'Webview';
  @override
  String get notSupportedOnDevice =>
      TranslationOverrides.string(_root.$meta, 'webview.notSupportedOnDevice', {}) ?? 'Non supportato su questo dispositivo';
  @override
  String get captcha => TranslationOverrides.string(_root.$meta, 'webview.captcha', {}) ?? 'Captcha';
  @override
  String get captchaCheckDescription =>
      TranslationOverrides.string(_root.$meta, 'webview.captchaCheckDescription', {}) ??
      'Possibile captcha rilevato, per favore risolvilo e torna indietro quando hai finito';
  @override
  String get captchaCompleted => TranslationOverrides.string(_root.$meta, 'webview.captchaCompleted', {}) ?? 'Captcha completato';
  @override
  late final _Translations$webview$navigation$it_IT navigation = _Translations$webview$navigation$it_IT._(_root);
}

// Path: settings
class _Translations$settings$it_IT extends Translations$settings$en {
  _Translations$settings$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Impostazioni';
  @override
  late final _Translations$settings$language$it_IT language = _Translations$settings$language$it_IT._(_root);
  @override
  late final _Translations$settings$booru$it_IT booru = _Translations$settings$booru$it_IT._(_root);
  @override
  late final _Translations$settings$booruEditor$it_IT booruEditor = _Translations$settings$booruEditor$it_IT._(_root);
  @override
  late final _Translations$settings$interface$it_IT interface = _Translations$settings$interface$it_IT._(_root);
  @override
  late final _Translations$settings$theme$it_IT theme = _Translations$settings$theme$it_IT._(_root);
  @override
  late final _Translations$settings$viewer$it_IT viewer = _Translations$settings$viewer$it_IT._(_root);
  @override
  late final _Translations$settings$video$it_IT video = _Translations$settings$video$it_IT._(_root);
  @override
  late final _Translations$settings$downloads$it_IT downloads = _Translations$settings$downloads$it_IT._(_root);
  @override
  late final _Translations$settings$database$it_IT database = _Translations$settings$database$it_IT._(_root);
  @override
  late final _Translations$settings$backupAndRestore$it_IT backupAndRestore = _Translations$settings$backupAndRestore$it_IT._(_root);
  @override
  late final _Translations$settings$network$it_IT network = _Translations$settings$network$it_IT._(_root);
  @override
  late final _Translations$settings$privacy$it_IT privacy = _Translations$settings$privacy$it_IT._(_root);
  @override
  late final _Translations$settings$performance$it_IT performance = _Translations$settings$performance$it_IT._(_root);
  @override
  late final _Translations$settings$cache$it_IT cache = _Translations$settings$cache$it_IT._(_root);
  @override
  late final _Translations$settings$itemFilters$it_IT itemFilters = _Translations$settings$itemFilters$it_IT._(_root);
  @override
  late final _Translations$settings$sync$it_IT sync = _Translations$settings$sync$it_IT._(_root);
  @override
  late final _Translations$settings$about$it_IT about = _Translations$settings$about$it_IT._(_root);
  @override
  late final _Translations$settings$checkForUpdates$it_IT checkForUpdates = _Translations$settings$checkForUpdates$it_IT._(_root);
  @override
  late final _Translations$settings$logs$it_IT logs = _Translations$settings$logs$it_IT._(_root);
  @override
  late final _Translations$settings$help$it_IT help = _Translations$settings$help$it_IT._(_root);
  @override
  late final _Translations$settings$debug$it_IT debug = _Translations$settings$debug$it_IT._(_root);
  @override
  late final _Translations$settings$logging$it_IT logging = _Translations$settings$logging$it_IT._(_root);
  @override
  late final _Translations$settings$webview$it_IT webview = _Translations$settings$webview$it_IT._(_root);
  @override
  late final _Translations$settings$dirPicker$it_IT dirPicker = _Translations$settings$dirPicker$it_IT._(_root);
  @override
  String get version => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? 'Versione';
}

// Path: comments
class _Translations$comments$it_IT extends Translations$comments$en {
  _Translations$comments$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'comments.title', {}) ?? 'Commenti';
  @override
  String get noComments => TranslationOverrides.string(_root.$meta, 'comments.noComments', {}) ?? 'Nessun commento';
  @override
  String get noBooruAPIForComments =>
      TranslationOverrides.string(_root.$meta, 'comments.noBooruAPIForComments', {}) ?? 'Questo Booru non ha commenti o non ci sono API per essi';
}

// Path: pageChanger
class _Translations$pageChanger$it_IT extends Translations$pageChanger$en {
  _Translations$pageChanger$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'pageChanger.title', {}) ?? 'Selettore pagine';
  @override
  String get pageLabel => TranslationOverrides.string(_root.$meta, 'pageChanger.pageLabel', {}) ?? 'Pagina #';
  @override
  String get delayBetweenLoadings =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.delayBetweenLoadings', {}) ?? 'Ritardo tra i caricamenti (ms)';
  @override
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'pageChanger.delayInMs', {}) ?? 'Ritardo in ms';
  @override
  String currentPage({required int number}) =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.currentPage', {'number': number}) ?? 'Pagina corrente #${number}';
  @override
  String possibleMaxPage({required int number}) =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.possibleMaxPage', {'number': number}) ?? 'Possibile pagina massima #~${number}';
  @override
  String get searchCurrentlyRunning =>
      TranslationOverrides.string(_root.$meta, 'pageChanger.searchCurrentlyRunning', {}) ?? 'Ricerca attualmente in esecuzione!';
  @override
  String get jumpToPage => TranslationOverrides.string(_root.$meta, 'pageChanger.jumpToPage', {}) ?? 'Salta alla pagina';
  @override
  String get searchUntilPage => TranslationOverrides.string(_root.$meta, 'pageChanger.searchUntilPage', {}) ?? 'Cerca fino alla pagina';
  @override
  String get stopSearching => TranslationOverrides.string(_root.$meta, 'pageChanger.stopSearching', {}) ?? 'Ferma la ricerca';
}

// Path: tagsFiltersDialogs
class _Translations$tagsFiltersDialogs$it_IT extends Translations$tagsFiltersDialogs$en {
  _Translations$tagsFiltersDialogs$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get emptyInput => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.emptyInput', {}) ?? 'Input vuoto!';
  @override
  String addNewFilter({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.addNewFilter', {'type': type}) ?? '[Aggiungi nuovo filtro ${type}]';
  @override
  String newTagFilter({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newTagFilter', {'type': type}) ?? 'Nuovo filtro tag ${type}';
  @override
  String get newFilter => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newFilter', {}) ?? 'Nuovo filtro';
  @override
  String get editFilter => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.editFilter', {}) ?? 'Modifica filtro';
}

// Path: tagsManager
class _Translations$tagsManager$it_IT extends Translations$tagsManager$en {
  _Translations$tagsManager$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'tagsManager.title', {}) ?? 'Tag';
  @override
  String get addTag => TranslationOverrides.string(_root.$meta, 'tagsManager.addTag', {}) ?? 'Aggiungi tag';
  @override
  String get name => TranslationOverrides.string(_root.$meta, 'tagsManager.name', {}) ?? 'Nome';
  @override
  String get type => TranslationOverrides.string(_root.$meta, 'tagsManager.type', {}) ?? 'Tipo';
  @override
  String get add => TranslationOverrides.string(_root.$meta, 'tagsManager.add', {}) ?? 'Aggiungi';
  @override
  String staleAfter({required String staleText}) =>
      TranslationOverrides.string(_root.$meta, 'tagsManager.staleAfter', {'staleText': staleText}) ?? 'Scade dopo: ${staleText}';
  @override
  String get addedATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addedATab', {}) ?? 'Scheda aggiunta';
  @override
  String get addATab => TranslationOverrides.string(_root.$meta, 'tagsManager.addATab', {}) ?? 'Aggiungi scheda';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tagsManager.copy', {}) ?? 'Copia';
  @override
  String get setStale => TranslationOverrides.string(_root.$meta, 'tagsManager.setStale', {}) ?? 'Imposta come scaduto';
  @override
  String get resetStale => TranslationOverrides.string(_root.$meta, 'tagsManager.resetStale', {}) ?? 'Segna come aggiornato';
  @override
  String get makeUnstaleable => TranslationOverrides.string(_root.$meta, 'tagsManager.makeUnstaleable', {}) ?? 'Rendi non scadibile';
  @override
  String deleteTags({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'tagsManager.deleteTags', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
        count,
        one: 'Elimina ${count} tag',
        many: 'Elimina ${count} tag',
        other: 'Elimina ${count} tag',
      );
  @override
  String get deleteTagsTitle => TranslationOverrides.string(_root.$meta, 'tagsManager.deleteTagsTitle', {}) ?? 'Elimina tag';
  @override
  String get clearSelection => TranslationOverrides.string(_root.$meta, 'tagsManager.clearSelection', {}) ?? 'Cancella selezione';
}

// Path: lockscreen
class _Translations$lockscreen$it_IT extends Translations$lockscreen$en {
  _Translations$lockscreen$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get tapToAuthenticate => TranslationOverrides.string(_root.$meta, 'lockscreen.tapToAuthenticate', {}) ?? 'Tocca per autenticarti';
  @override
  String get devUnlock => TranslationOverrides.string(_root.$meta, 'lockscreen.devUnlock', {}) ?? 'SBLOCCO DEV';
  @override
  String get testingMessage =>
      TranslationOverrides.string(_root.$meta, 'lockscreen.testingMessage', {}) ??
      '[TESTING]: Premi qui se non riesci a sbloccare l\'app con i mezzi normali. Segnala allo sviluppatore fornendo dettagli sul tuo dispositivo.';
}

// Path: loliSync
class _Translations$loliSync$it_IT extends Translations$loliSync$en {
  _Translations$loliSync$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'loliSync.title', {}) ?? 'LoliSync';
  @override
  String get stopSyncingQuestion =>
      TranslationOverrides.string(_root.$meta, 'loliSync.stopSyncingQuestion', {}) ?? 'Vuoi fermare la sincronizzazione?';
  @override
  String get stopServerQuestion => TranslationOverrides.string(_root.$meta, 'loliSync.stopServerQuestion', {}) ?? 'Vuoi fermare il server?';
  @override
  String get noConnection => TranslationOverrides.string(_root.$meta, 'loliSync.noConnection', {}) ?? 'Nessuna connessione';
  @override
  String get waitingForConnection => TranslationOverrides.string(_root.$meta, 'loliSync.waitingForConnection', {}) ?? 'In attesa di connessione…';
  @override
  String get startingServer => TranslationOverrides.string(_root.$meta, 'loliSync.startingServer', {}) ?? 'Avvio server…';
  @override
  String get keepScreenAwake => TranslationOverrides.string(_root.$meta, 'loliSync.keepScreenAwake', {}) ?? 'Mantieni lo schermo acceso';
  @override
  String get serverKilled => TranslationOverrides.string(_root.$meta, 'loliSync.serverKilled', {}) ?? 'Server LoliSync interrotto';
  @override
  String testError({required int statusCode, required String reasonPhrase}) =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testError', {'statusCode': statusCode, 'reasonPhrase': reasonPhrase}) ??
      'Errore test: ${statusCode} ${reasonPhrase}';
  @override
  String testErrorException({required String error}) =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testErrorException', {'error': error}) ?? 'Errore test: ${error}';
  @override
  String get testSuccess =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testSuccess', {}) ?? 'La richiesta di test ha ricevuto una risposta positiva';
  @override
  String get testSuccessMessage =>
      TranslationOverrides.string(_root.$meta, 'loliSync.testSuccessMessage', {}) ??
      'Dovrebbe esserci un messaggio di \'Test\' sull\'altro dispositivo';
}

// Path: imageSearch
class _Translations$imageSearch$it_IT extends Translations$imageSearch$en {
  _Translations$imageSearch$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'imageSearch.title', {}) ?? 'Ricerca immagine';
}

// Path: tagView
class _Translations$tagView$it_IT extends Translations$tagView$en {
  _Translations$tagView$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get tags => TranslationOverrides.string(_root.$meta, 'tagView.tags', {}) ?? 'Tag';
  @override
  String get comments => TranslationOverrides.string(_root.$meta, 'tagView.comments', {}) ?? 'Commenti';
  @override
  String showNotes({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'tagView.showNotes', {'count': count}) ?? 'Mostra note (${count})';
  @override
  String hideNotes({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'tagView.hideNotes', {'count': count}) ?? 'Nascondi note (${count})';
  @override
  String get loadNotes => TranslationOverrides.string(_root.$meta, 'tagView.loadNotes', {}) ?? 'Carica note';
  @override
  String get thisTagAlreadyInSearch =>
      TranslationOverrides.string(_root.$meta, 'tagView.thisTagAlreadyInSearch', {}) ?? 'Questo tag è già nell\'attuale query di ricerca:';
  @override
  String get addedToCurrentSearch =>
      TranslationOverrides.string(_root.$meta, 'tagView.addedToCurrentSearch', {}) ?? 'Aggiunto all\'attuale query di ricerca:';
  @override
  String get addedNewTab => TranslationOverrides.string(_root.$meta, 'tagView.addedNewTab', {}) ?? 'Nuova scheda aggiunta:';
  @override
  String get id => TranslationOverrides.string(_root.$meta, 'tagView.id', {}) ?? 'ID';
  @override
  String get postURL => TranslationOverrides.string(_root.$meta, 'tagView.postURL', {}) ?? 'URL Post';
  @override
  String get uploader => TranslationOverrides.string(_root.$meta, 'tagView.uploader', {}) ?? 'Uploader';
  @override
  String get posted => TranslationOverrides.string(_root.$meta, 'tagView.posted', {}) ?? 'Pubblicato';
  @override
  String get details => TranslationOverrides.string(_root.$meta, 'tagView.details', {}) ?? 'Dettagli';
  @override
  String get filename => TranslationOverrides.string(_root.$meta, 'tagView.filename', {}) ?? 'Nome file';
  @override
  String get url => TranslationOverrides.string(_root.$meta, 'tagView.url', {}) ?? 'URL';
  @override
  String get extension => TranslationOverrides.string(_root.$meta, 'tagView.extension', {}) ?? 'Estensione';
  @override
  String get resolution => TranslationOverrides.string(_root.$meta, 'tagView.resolution', {}) ?? 'Risoluzione';
  @override
  String get size => TranslationOverrides.string(_root.$meta, 'tagView.size', {}) ?? 'Dimensione';
  @override
  String get md5 => TranslationOverrides.string(_root.$meta, 'tagView.md5', {}) ?? 'MD5';
  @override
  String get rating => TranslationOverrides.string(_root.$meta, 'tagView.rating', {}) ?? 'Classificazione del contenuto';
  @override
  String get score => TranslationOverrides.string(_root.$meta, 'tagView.score', {}) ?? 'Punteggio';
  @override
  String get noTagsFound => TranslationOverrides.string(_root.$meta, 'tagView.noTagsFound', {}) ?? 'Nessun tag trovato';
  @override
  String get copy => TranslationOverrides.string(_root.$meta, 'tagView.copy', {}) ?? 'Copia';
  @override
  String get removeFromSearch => TranslationOverrides.string(_root.$meta, 'tagView.removeFromSearch', {}) ?? 'Rimuovi dalla ricerca';
  @override
  String get addToSearch => TranslationOverrides.string(_root.$meta, 'tagView.addToSearch', {}) ?? 'Aggiungi alla ricerca';
  @override
  String get addedToSearchBar => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBar', {}) ?? 'Aggiunto alla barra di ricerca:';
  @override
  String get excludeFromSearch => TranslationOverrides.string(_root.$meta, 'tagView.excludeFromSearch', {}) ?? 'Escludi dalla ricerca';
  @override
  String get exclusionAddedToSearchBar =>
      TranslationOverrides.string(_root.$meta, 'tagView.exclusionAddedToSearchBar', {}) ?? 'Esclusione aggiunta alla barra di ricerca:';
  @override
  String get addToMarked => TranslationOverrides.string(_root.$meta, 'tagView.addToMarked', {}) ?? 'Aggiungi a Contrassegnati';
  @override
  String get addToHidden => TranslationOverrides.string(_root.$meta, 'tagView.addToHidden', {}) ?? 'Aggiungi a Nascosti';
  @override
  String get removeFromMarked => TranslationOverrides.string(_root.$meta, 'tagView.removeFromMarked', {}) ?? 'Rimuovi da Contrassegnati';
  @override
  String get removeFromHidden => TranslationOverrides.string(_root.$meta, 'tagView.removeFromHidden', {}) ?? 'Rimuovi da Nascosti';
  @override
  String get editTag => TranslationOverrides.string(_root.$meta, 'tagView.editTag', {}) ?? 'Modifica tag';
  @override
  String get sourceDialogTitle => TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogTitle', {}) ?? 'Fonte';
  @override
  String get preview => TranslationOverrides.string(_root.$meta, 'tagView.preview', {}) ?? 'Anteprima';
  @override
  String get selectBooruToLoad => TranslationOverrides.string(_root.$meta, 'tagView.selectBooruToLoad', {}) ?? 'Seleziona un booru da caricare';
  @override
  String get previewIsLoading => TranslationOverrides.string(_root.$meta, 'tagView.previewIsLoading', {}) ?? 'Anteprima in caricamento…';
  @override
  String get failedToLoadPreview =>
      TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreview', {}) ?? 'Impossibile caricare l\'anteprima';
  @override
  String get tapToTryAgain => TranslationOverrides.string(_root.$meta, 'tagView.tapToTryAgain', {}) ?? 'Tocca per riprovare';
  @override
  String get copiedFileURL => TranslationOverrides.string(_root.$meta, 'tagView.copiedFileURL', {}) ?? 'URL file copiato negli appunti';
  @override
  String get tagPreviews => TranslationOverrides.string(_root.$meta, 'tagView.tagPreviews', {}) ?? 'Anteprime tag';
  @override
  String get currentState => TranslationOverrides.string(_root.$meta, 'tagView.currentState', {}) ?? 'Stato attuale';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'tagView.history', {}) ?? 'Cronologia';
  @override
  String get failedToLoadPreviewPage =>
      TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreviewPage', {}) ?? 'Impossibile caricare pagina di anteprima';
  @override
  String get tryAgain => TranslationOverrides.string(_root.$meta, 'tagView.tryAgain', {}) ?? 'Riprova';
  @override
  String get detectedLinks => TranslationOverrides.string(_root.$meta, 'tagView.detectedLinks', {}) ?? 'Link rilevati:';
  @override
  String get relatedTabs => TranslationOverrides.string(_root.$meta, 'tagView.relatedTabs', {}) ?? 'Schede correlate';
  @override
  String get tabsWithOnlyTag => TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTag', {}) ?? 'Schede contenenti solo questo tag';
  @override
  String get tabsWithOnlyTagDifferentBooru =>
      TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTagDifferentBooru', {}) ??
      'Schede contenenti solo questo tag ma in un altro booru';
  @override
  String get tabsContainingTag => TranslationOverrides.string(_root.$meta, 'tagView.tabsContainingTag', {}) ?? 'Schede contenenti questo tag';
}

// Path: pinnedTags
class _Translations$pinnedTags$it_IT extends Translations$pinnedTags$en {
  _Translations$pinnedTags$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get pinnedTags => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedTags', {}) ?? 'Tag fissati';
  @override
  String get pinTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinTag', {}) ?? 'Fissa tag';
  @override
  String get unpinTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinTag', {}) ?? 'Rimuovi tag fissato';
  @override
  String get pin => TranslationOverrides.string(_root.$meta, 'pinnedTags.pin', {}) ?? 'Fissa';
  @override
  String get unpin => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpin', {}) ?? 'Rimuovi';
  @override
  String pinQuestion({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinQuestion', {'tag': tag}) ?? 'Fissare «${tag}» per accesso rapido?';
  @override
  String unpinQuestion({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinQuestion', {'tag': tag}) ?? 'Rimuovere «${tag}» dai tag fissati?';
  @override
  String onlyForBooru({required String name}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.onlyForBooru', {'name': name}) ?? 'Solo per ${name}';
  @override
  String get labelsOptional => TranslationOverrides.string(_root.$meta, 'pinnedTags.labelsOptional', {}) ?? 'Etichette (facoltative)';
  @override
  String get typeAndPressAdd =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.typeAndPressAdd', {}) ?? 'Digita e premi Aggiungi per includere un\'etichetta';
  @override
  String get selectExistingLabel => TranslationOverrides.string(_root.$meta, 'pinnedTags.selectExistingLabel', {}) ?? 'Seleziona etichetta esistente';
  @override
  String get tagPinned => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagPinned', {}) ?? 'Tag fissato';
  @override
  String pinnedForBooru({required String name, required String labels}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedForBooru', {'name': name, 'labels': labels}) ?? 'Fissato per ${name}${labels}';
  @override
  String pinnedGloballyWithLabels({required String labels}) =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedGloballyWithLabels', {'labels': labels}) ?? 'Fissato globalmente${labels}';
  @override
  String get tagUnpinned => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagUnpinned', {}) ?? 'Tag non più fissato';
  @override
  String get all => TranslationOverrides.string(_root.$meta, 'pinnedTags.all', {}) ?? 'Tutti';
  @override
  String get reorderPinnedTags => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorderPinnedTags', {}) ?? 'Riordina tag fissati';
  @override
  String get saving => TranslationOverrides.string(_root.$meta, 'pinnedTags.saving', {}) ?? 'Salvataggio…';
  @override
  String get reorder => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorder', {}) ?? 'Riordina';
  @override
  String get addTagManually => TranslationOverrides.string(_root.$meta, 'pinnedTags.addTagManually', {}) ?? 'Aggiungi tag manualmente';
  @override
  String get noTagsMatchSearch =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.noTagsMatchSearch', {}) ?? 'Nessun tag corrisponde alla tua ricerca';
  @override
  String get noPinnedTagsYet => TranslationOverrides.string(_root.$meta, 'pinnedTags.noPinnedTagsYet', {}) ?? 'Nessun tag fissato ancora';
  @override
  String get editLabels => TranslationOverrides.string(_root.$meta, 'pinnedTags.editLabels', {}) ?? 'Modifica etichette';
  @override
  String get labels => TranslationOverrides.string(_root.$meta, 'pinnedTags.labels', {}) ?? 'Etichette';
  @override
  String get addPinnedTag => TranslationOverrides.string(_root.$meta, 'pinnedTags.addPinnedTag', {}) ?? 'Aggiungi tag fissato';
  @override
  String get tagQuery => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQuery', {}) ?? 'Query tag';
  @override
  String get tagQueryHint => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQueryHint', {}) ?? 'nome_tag';
  @override
  String get rawQueryHelp =>
      TranslationOverrides.string(_root.$meta, 'pinnedTags.rawQueryHelp', {}) ?? 'Puoi inserire qualsiasi query, inclusi i tag con spazi';
}

// Path: searchBar
class _Translations$searchBar$it_IT extends Translations$searchBar$en {
  _Translations$searchBar$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get searchForTags => TranslationOverrides.string(_root.$meta, 'searchBar.searchForTags', {}) ?? 'Cerca tag';
  @override
  String failedToLoadSuggestions({required String msg}) =>
      TranslationOverrides.string(_root.$meta, 'searchBar.failedToLoadSuggestions', {'msg': msg}) ??
      'Impossibile caricare suggerimenti. Tocca per riprovare${msg}';
  @override
  String get noSuggestionsFound => TranslationOverrides.string(_root.$meta, 'searchBar.noSuggestionsFound', {}) ?? 'Nessun suggerimento trovato';
  @override
  String get tagSuggestionsNotAvailable =>
      TranslationOverrides.string(_root.$meta, 'searchBar.tagSuggestionsNotAvailable', {}) ?? 'Suggerimenti tag non disponibili per questo booru';
  @override
  String copiedTagToClipboard({required String tag}) =>
      TranslationOverrides.string(_root.$meta, 'searchBar.copiedTagToClipboard', {'tag': tag}) ?? 'Copiato «${tag}» negli appunti';
  @override
  String get prefix => TranslationOverrides.string(_root.$meta, 'searchBar.prefix', {}) ?? 'Prefisso';
  @override
  String get exclude => TranslationOverrides.string(_root.$meta, 'searchBar.exclude', {}) ?? 'Escludi (—)';
  @override
  String get booruNumberPrefix => TranslationOverrides.string(_root.$meta, 'searchBar.booruNumberPrefix', {}) ?? 'Booru (N#)';
  @override
  String get metatags => TranslationOverrides.string(_root.$meta, 'searchBar.metatags', {}) ?? 'Metatag';
  @override
  String get freeMetatags => TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatags', {}) ?? 'Metatag esclusi dal conteggio';
  @override
  String get freeMetatagsDescription =>
      TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatagsDescription', {}) ??
      'Questi metatag non vengono conteggiati nel limite di tag per ricerca';
  @override
  String get free => TranslationOverrides.string(_root.$meta, 'searchBar.free', {}) ?? 'Non conteggiato';
  @override
  String get single => TranslationOverrides.string(_root.$meta, 'searchBar.single', {}) ?? 'Singolo';
  @override
  String get range => TranslationOverrides.string(_root.$meta, 'searchBar.range', {}) ?? 'Intervallo';
  @override
  String get popular => TranslationOverrides.string(_root.$meta, 'searchBar.popular', {}) ?? 'Popolare';
  @override
  String get selectDate => TranslationOverrides.string(_root.$meta, 'searchBar.selectDate', {}) ?? 'Seleziona data';
  @override
  String get selectDatesRange => TranslationOverrides.string(_root.$meta, 'searchBar.selectDatesRange', {}) ?? 'Seleziona intervallo date';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'searchBar.history', {}) ?? 'Cronologia';
  @override
  String get more => TranslationOverrides.string(_root.$meta, 'searchBar.more', {}) ?? '…';
}

// Path: mobileHome
class _Translations$mobileHome$it_IT extends Translations$mobileHome$en {
  _Translations$mobileHome$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get selectBooruForWebview =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.selectBooruForWebview', {}) ?? 'Seleziona booru per webview';
  @override
  String get lockApp => TranslationOverrides.string(_root.$meta, 'mobileHome.lockApp', {}) ?? 'Blocca app';
  @override
  String get fileAlreadyExists => TranslationOverrides.string(_root.$meta, 'mobileHome.fileAlreadyExists', {}) ?? 'Il file esiste già';
  @override
  String get failedToDownload => TranslationOverrides.string(_root.$meta, 'mobileHome.failedToDownload', {}) ?? 'Download fallito';
  @override
  String get cancelledByUser => TranslationOverrides.string(_root.$meta, 'mobileHome.cancelledByUser', {}) ?? 'Annullato dall\'utente';
  @override
  String get saveAnyway => TranslationOverrides.string(_root.$meta, 'mobileHome.saveAnyway', {}) ?? 'Salva comunque';
  @override
  String get skip => TranslationOverrides.string(_root.$meta, 'mobileHome.skip', {}) ?? 'Salta';
  @override
  String retryAll({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.retryAll', {'count': count}) ?? 'Riprova tutti (${count})';
  @override
  String get existingFailedOrCancelledItems =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.existingFailedOrCancelledItems', {}) ??
      'Elementi già esistenti, download non riusciti o annullati';
  @override
  String get clearAllRetryableItems =>
      TranslationOverrides.string(_root.$meta, 'mobileHome.clearAllRetryableItems', {}) ?? 'Cancella tutti gli elementi riprovabili';
}

// Path: desktopHome
class _Translations$desktopHome$it_IT extends Translations$desktopHome$en {
  _Translations$desktopHome$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get snatcher => TranslationOverrides.string(_root.$meta, 'desktopHome.snatcher', {}) ?? 'Snatcher';
  @override
  String get addBoorusInSettings =>
      TranslationOverrides.string(_root.$meta, 'desktopHome.addBoorusInSettings', {}) ?? 'Aggiungi booru nelle impostazioni';
  @override
  String get settings => TranslationOverrides.string(_root.$meta, 'desktopHome.settings', {}) ?? 'Impostazioni';
  @override
  String get save => TranslationOverrides.string(_root.$meta, 'desktopHome.save', {}) ?? 'Salva';
  @override
  String get noItemsSelected => TranslationOverrides.string(_root.$meta, 'desktopHome.noItemsSelected', {}) ?? 'Nessun elemento selezionato';
}

// Path: galleryView
class _Translations$galleryView$it_IT extends Translations$galleryView$en {
  _Translations$galleryView$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get noItems => TranslationOverrides.string(_root.$meta, 'galleryView.noItems', {}) ?? 'Nessun elemento';
  @override
  String get noItemSelected => TranslationOverrides.string(_root.$meta, 'galleryView.noItemSelected', {}) ?? 'Nessun elemento selezionato';
  @override
  String get close => TranslationOverrides.string(_root.$meta, 'galleryView.close', {}) ?? 'Chiudi';
}

// Path: mediaPreviews
class _Translations$mediaPreviews$it_IT extends Translations$mediaPreviews$en {
  _Translations$mediaPreviews$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get noBooruConfigsFound =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.noBooruConfigsFound', {}) ?? 'Nessuna configurazione booru trovata';
  @override
  String get addNewBooru => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? 'Aggiungi nuovo Booru';
  @override
  String get help => TranslationOverrides.string(_root.$meta, 'mediaPreviews.help', {}) ?? 'Aiuto';
  @override
  String get settings => TranslationOverrides.string(_root.$meta, 'mediaPreviews.settings', {}) ?? 'Impostazioni';
  @override
  String get onboardingTitle => TranslationOverrides.string(_root.$meta, 'mediaPreviews.onboardingTitle', {}) ?? 'Configura la tua prima fonte';
  @override
  String get onboardingSubtitle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.onboardingSubtitle', {}) ??
      'Aggiungi una configurazione booru o ripristina un backup per iniziare a esplorare';
  @override
  String get addBooruAction => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addBooruAction', {}) ?? 'Aggiungi un nuovo booru';
  @override
  String get addBooruActionSubtitle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.addBooruActionSubtitle', {}) ??
      'Collega un sito inserendo il suo URL e le impostazioni di ricerca';
  @override
  String get restoreBackupAction =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoreBackupAction', {}) ?? 'Ripristina o gestisci i backup';
  @override
  String get restoreBackupActionSubtitle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoreBackupActionSubtitle', {}) ??
      'Ripristina impostazioni, booru, schede e dati salvati';
  @override
  String get openSettingsAction => TranslationOverrides.string(_root.$meta, 'mediaPreviews.openSettingsAction', {}) ?? 'Apri le impostazioni';
  @override
  String get openSettingsActionSubtitle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.openSettingsActionSubtitle', {}) ??
      'Configura il comportamento dell\'app prima di aggiungere le fonti';
  @override
  String get helpSectionTitle => TranslationOverrides.string(_root.$meta, 'mediaPreviews.helpSectionTitle', {}) ?? 'Hai bisogno di aiuto?';
  @override
  String get booruSourcesArticle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.booruSourcesArticle', {}) ?? 'Configurazioni booru: come aggiungerle e come funzionano';
  @override
  String get booruSourcesArticleSubtitle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.booruSourcesArticleSubtitle', {}) ?? 'Istruzioni per configurare il tuo primo booru';
  @override
  String get backupRestoreArticle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.backupRestoreArticle', {}) ?? 'Ripristino dei dati da un backup';
  @override
  String get backupRestoreArticleSubtitle =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.backupRestoreArticleSubtitle', {}) ??
      'Istruzioni per chi proviene da un\'app o una versione precedente';
  @override
  String get restoringPreviousSession =>
      TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoringPreviousSession', {}) ?? 'Ripristino della sessione precedente…';
  @override
  String get copiedFileURL => TranslationOverrides.string(_root.$meta, 'mediaPreviews.copiedFileURL', {}) ?? 'URL del file copiato negli appunti!';
}

// Path: viewer
class _Translations$viewer$it_IT extends Translations$viewer$en {
  _Translations$viewer$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$viewer$tutorial$it_IT tutorial = _Translations$viewer$tutorial$it_IT._(_root);
  @override
  late final _Translations$viewer$appBar$it_IT appBar = _Translations$viewer$appBar$it_IT._(_root);
  @override
  late final _Translations$viewer$notes$it_IT notes = _Translations$viewer$notes$it_IT._(_root);
}

// Path: common
class _Translations$common$it_IT extends Translations$common$en {
  _Translations$common$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'common.selectABooru', {}) ?? 'Seleziona un booru';
  @override
  String get booruItemCopiedToClipboard =>
      TranslationOverrides.string(_root.$meta, 'common.booruItemCopiedToClipboard', {}) ?? 'Elemento booru copiato negli appunti';
}

// Path: gallery
class _Translations$gallery$it_IT extends Translations$gallery$en {
  _Translations$gallery$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get snatchQuestion => TranslationOverrides.string(_root.$meta, 'gallery.snatchQuestion', {}) ?? 'Scaricare?';
  @override
  String get noPostUrl => TranslationOverrides.string(_root.$meta, 'gallery.noPostUrl', {}) ?? 'Nessun URL post!';
  @override
  String get loadingFile => TranslationOverrides.string(_root.$meta, 'gallery.loadingFile', {}) ?? 'Caricamento file…';
  @override
  String get loadingFileMessage =>
      TranslationOverrides.string(_root.$meta, 'gallery.loadingFileMessage', {}) ?? 'Potrebbe richiedere del tempo, attendi…';
  @override
  String sources({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'gallery.sources', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
        count,
        one: 'Fonte',
        many: 'Fonti',
        other: 'Fonti',
      );
}

// Path: galleryButtons
class _Translations$galleryButtons$it_IT extends Translations$galleryButtons$en {
  _Translations$galleryButtons$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get snatch => TranslationOverrides.string(_root.$meta, 'galleryButtons.snatch', {}) ?? 'Scarica';
  @override
  String get favourite => TranslationOverrides.string(_root.$meta, 'galleryButtons.favourite', {}) ?? 'Aggiungi ai preferiti';
  @override
  String get info => TranslationOverrides.string(_root.$meta, 'galleryButtons.info', {}) ?? 'Info';
  @override
  String get share => TranslationOverrides.string(_root.$meta, 'galleryButtons.share', {}) ?? 'Condividi';
  @override
  String get select => TranslationOverrides.string(_root.$meta, 'galleryButtons.select', {}) ?? 'Seleziona';
  @override
  String get open => TranslationOverrides.string(_root.$meta, 'galleryButtons.open', {}) ?? 'Apri nel browser';
  @override
  String get slideshow => TranslationOverrides.string(_root.$meta, 'galleryButtons.slideshow', {}) ?? 'Presentazione';
  @override
  String get reloadNoScale => TranslationOverrides.string(_root.$meta, 'galleryButtons.reloadNoScale', {}) ?? 'Alterna ridimensionamento';
  @override
  String get toggleQuality => TranslationOverrides.string(_root.$meta, 'galleryButtons.toggleQuality', {}) ?? 'Alterna qualità';
  @override
  String get externalPlayer => TranslationOverrides.string(_root.$meta, 'galleryButtons.externalPlayer', {}) ?? 'Lettore esterno';
  @override
  String get imageSearch => TranslationOverrides.string(_root.$meta, 'galleryButtons.imageSearch', {}) ?? 'Ricerca immagine';
}

// Path: media
class _Translations$media$it_IT extends Translations$media$en {
  _Translations$media$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$media$loading$it_IT loading = _Translations$media$loading$it_IT._(_root);
  @override
  late final _Translations$media$video$it_IT video = _Translations$media$video$it_IT._(_root);
}

// Path: imageStats
class _Translations$imageStats$it_IT extends Translations$imageStats$en {
  _Translations$imageStats$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String live({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.live', {'count': count}) ?? 'Immagini attive: ${count}';
  @override
  String pending({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.pending', {'count': count}) ?? 'In sospeso: ${count}';
  @override
  String total({required int count}) => TranslationOverrides.string(_root.$meta, 'imageStats.total', {'count': count}) ?? 'Totale: ${count}';
  @override
  String size({required String size}) => TranslationOverrides.string(_root.$meta, 'imageStats.size', {'size': size}) ?? 'Dimensione: ${size}';
  @override
  String max({required String max}) => TranslationOverrides.string(_root.$meta, 'imageStats.max', {'max': max}) ?? 'Max: ${max}';
}

// Path: preview
class _Translations$preview$it_IT extends Translations$preview$en {
  _Translations$preview$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  late final _Translations$preview$error$it_IT error = _Translations$preview$error$it_IT._(_root);
}

// Path: tagType
class _Translations$tagType$it_IT extends Translations$tagType$en {
  _Translations$tagType$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get artist => TranslationOverrides.string(_root.$meta, 'tagType.artist', {}) ?? 'Artista';
  @override
  String get character => TranslationOverrides.string(_root.$meta, 'tagType.character', {}) ?? 'Personaggio';
  @override
  String get copyright => TranslationOverrides.string(_root.$meta, 'tagType.copyright', {}) ?? 'Opera / serie';
  @override
  String get meta => TranslationOverrides.string(_root.$meta, 'tagType.meta', {}) ?? 'Meta';
  @override
  String get species => TranslationOverrides.string(_root.$meta, 'tagType.species', {}) ?? 'Specie';
  @override
  String get lore => TranslationOverrides.string(_root.$meta, 'tagType.lore', {}) ?? 'Lore';
  @override
  String get none => TranslationOverrides.string(_root.$meta, 'tagType.none', {}) ?? 'Nessuno/Generale';
}

// Path: tabs.filters
class _Translations$tabs$filters$it_IT extends Translations$tabs$filters$en {
  _Translations$tabs$filters$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get loaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.loaded', {}) ?? 'Caricato';
  @override
  String get tagType => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagType', {}) ?? 'Tipo di tag';
  @override
  String get multibooru => TranslationOverrides.string(_root.$meta, 'tabs.filters.multibooru', {}) ?? 'Multibooru';
  @override
  String get duplicates => TranslationOverrides.string(_root.$meta, 'tabs.filters.duplicates', {}) ?? 'Duplicati';
  @override
  String get checkDuplicatesOnSameBooru =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.checkDuplicatesOnSameBooru', {}) ?? 'Controlla duplicati sullo stesso Booru';
  @override
  String get emptySearchQuery => TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? 'Query di ricerca vuota';
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'tabs.filters.title', {}) ?? 'Filtri schede';
  @override
  String get all => TranslationOverrides.string(_root.$meta, 'tabs.filters.all', {}) ?? 'Tutti';
  @override
  String get notLoaded => TranslationOverrides.string(_root.$meta, 'tabs.filters.notLoaded', {}) ?? 'Non caricato';
  @override
  String get enabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.enabled', {}) ?? 'Abilitato';
  @override
  String get disabled => TranslationOverrides.string(_root.$meta, 'tabs.filters.disabled', {}) ?? 'Disabilitato';
  @override
  String get willAlsoEnableSorting =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.willAlsoEnableSorting', {}) ?? 'Abiliterà anche l\'ordinamento';
  @override
  String get tagTypeFilterHelp =>
      TranslationOverrides.string(_root.$meta, 'tabs.filters.tagTypeFilterHelp', {}) ??
      'Filtra le schede che contengono almeno un tag del tipo selezionato';
  @override
  String get any => TranslationOverrides.string(_root.$meta, 'tabs.filters.any', {}) ?? 'Qualsiasi';
  @override
  String get apply => TranslationOverrides.string(_root.$meta, 'tabs.filters.apply', {}) ?? 'Applica';
}

// Path: tabs.move
class _Translations$tabs$move$it_IT extends Translations$tabs$move$en {
  _Translations$tabs$move$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get moveToTop => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToTop', {}) ?? 'Sposta in alto';
  @override
  String get moveToBottom => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToBottom', {}) ?? 'Sposta in basso';
  @override
  String get tabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.tabNumber', {}) ?? 'Numero della scheda';
  @override
  String get invalidTabNumber => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidTabNumber', {}) ?? 'Numero della scheda non valido';
  @override
  String get invalidInput => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidInput', {}) ?? 'Input non valido';
  @override
  String get outOfRange => TranslationOverrides.string(_root.$meta, 'tabs.move.outOfRange', {}) ?? 'Fuori intervallo';
  @override
  String get pleaseEnterValidTabNumber =>
      TranslationOverrides.string(_root.$meta, 'tabs.move.pleaseEnterValidTabNumber', {}) ?? 'Inserisci un numero di scheda valido';
  @override
  String moveTo({required String formattedNumber}) =>
      TranslationOverrides.string(_root.$meta, 'tabs.move.moveTo', {'formattedNumber': formattedNumber}) ?? 'Sposta a #${formattedNumber}';
  @override
  String get preview => TranslationOverrides.string(_root.$meta, 'tabs.move.preview', {}) ?? 'Anteprima:';
}

// Path: webview.navigation
class _Translations$webview$navigation$it_IT extends Translations$webview$navigation$en {
  _Translations$webview$navigation$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get enterUrlLabel => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterUrlLabel', {}) ?? 'Inserisci un URL';
  @override
  String get enterCustomUrl => TranslationOverrides.string(_root.$meta, 'webview.navigation.enterCustomUrl', {}) ?? 'Inserisci un URL personalizzato';
  @override
  String navigateTo({required String url}) =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.navigateTo', {'url': url}) ?? 'Naviga su ${url}';
  @override
  String get listCookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.listCookies', {}) ?? 'Elenca i cookie';
  @override
  String get clearCookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.clearCookies', {}) ?? 'Cancella i cookie';
  @override
  String get cookiesGone => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookiesGone', {}) ?? 'C\'erano dei cookie. Ora sono spariti';
  @override
  String get getFavicon => TranslationOverrides.string(_root.$meta, 'webview.navigation.getFavicon', {}) ?? 'Ottieni favicon';
  @override
  String get noFaviconFound => TranslationOverrides.string(_root.$meta, 'webview.navigation.noFaviconFound', {}) ?? 'Nessuna favicon trovata';
  @override
  String get host => TranslationOverrides.string(_root.$meta, 'webview.navigation.host', {}) ?? 'Host:';
  @override
  String get textAboveSelectable =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.textAboveSelectable', {}) ?? '(il testo sopra è selezionabile)';
  @override
  String get copyUrl => TranslationOverrides.string(_root.$meta, 'webview.navigation.copyUrl', {}) ?? 'Copia URL';
  @override
  String get copiedUrlToClipboard =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.copiedUrlToClipboard', {}) ?? 'URL copiato negli appunti';
  @override
  String get cookies => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookies', {}) ?? 'Cookie';
  @override
  String get favicon => TranslationOverrides.string(_root.$meta, 'webview.navigation.favicon', {}) ?? 'Favicon';
  @override
  String get history => TranslationOverrides.string(_root.$meta, 'webview.navigation.history', {}) ?? 'Cronologia';
  @override
  String get noBackHistoryItem =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.noBackHistoryItem', {}) ?? 'Nessun elemento precedente nella cronologia';
  @override
  String get noForwardHistoryItem =>
      TranslationOverrides.string(_root.$meta, 'webview.navigation.noForwardHistoryItem', {}) ?? 'Nessun elemento successivo nella cronologia';
}

// Path: settings.language
class _Translations$settings$language$it_IT extends Translations$settings$language$en {
  _Translations$settings$language$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? 'Lingua';
  @override
  String get system => TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? 'Sistema';
  @override
  String get helpUsTranslate => TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? 'Aiutaci a tradurre';
  @override
  String get visitForDetails =>
      TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ??
      'Visita <a href=\'https://github.com/NO-ob/LoliSnatcher_Droid/blob/master/CONTRIBUTING.md#localization--translations\'>github</a> per i dettagli o premi sull\'immagine sotto per andare su POEditor';
}

// Path: settings.booru
class _Translations$settings$booru$it_IT extends Translations$settings$booru$en {
  _Translations$settings$booru$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Booru e Ricerca';
  @override
  String get defaultTags => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? 'Tag predefiniti';
  @override
  String get itemsPerPage => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'Elementi recuperati per pagina';
  @override
  String get itemsPerPageTip => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'Alcuni booru potrebbero ignorarlo';
  @override
  String get itemsPerPagePlaceholder => TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPagePlaceholder', {}) ?? '10-100';
  @override
  String get addBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Aggiungi configurazione Booru';
  @override
  String get shareBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? 'Condividi configurazione Booru';
  @override
  String shareBooruDialogMsgMobile({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
      'Condividi la configurazione di ${booruName} come link.\n\nIncludere il nome utente/la chiave API?';
  @override
  String shareBooruDialogMsgDesktop({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
      'Copia il link di configurazione di ${booruName} negli appunti.\n\nIncludere il nome utente/la chiave API?';
  @override
  String get booruSharing => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? 'Condivisione Booru';
  @override
  String get booruSharingMsgAndroid =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ??
      'Come aprire automaticamente i link di configurazione booru nell\'app su Android 12 e versioni successive:\n1) Tocca il pulsante qui sotto per aprire le impostazioni di sistema per l\'apertura predefinita dei link dell\'app\n2) Tocca «Aggiungi link» e seleziona tutte le opzioni disponibili';
  @override
  String get addedBoorus => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? 'Booru aggiunti';
  @override
  String get editBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? 'Modifica configurazione Booru';
  @override
  String get importBooru =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? 'Importa configurazione Booru dagli appunti';
  @override
  String get onlyLSURLsSupported =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ?? 'Sono supportati solo gli URL loli.snatcher';
  @override
  String get deleteBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? 'Elimina configurazione Booru';
  @override
  String get deleteBooruError =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ??
      'Qualcosa è andato storto durante l\'eliminazione di una configurazione Booru!';
  @override
  String get booruDeleted => TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? 'Configurazione Booru eliminata';
  @override
  String get booruDropdownInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ??
      'Il booru selezionato diventa predefinito dopo il salvataggio.\n\nIl booru predefinito appare per primo nei menu a tendina';
  @override
  String get changeDefaultBooru =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? 'Cambiare il Booru predefinito?';
  @override
  String get changeTo => TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? 'Cambia in: ';
  @override
  String get keepCurrentBooru =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? 'Tocca [No] per mantenere quello attuale: ';
  @override
  String get changeToNewBooru => TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? 'Tocca [Sì] per cambiare in: ';
  @override
  String get booruConfigLinkCopied =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ?? 'Link della configurazione Booru copiato negli appunti';
  @override
  String get noBooruSelected => TranslationOverrides.string(_root.$meta, 'settings.booru.noBooruSelected', {}) ?? 'Nessun Booru selezionato!';
  @override
  String get cantDeleteThisBooru =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? 'Impossibile eliminare questo Booru!';
  @override
  String get removeRelatedTabsFirst =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.removeRelatedTabsFirst', {}) ?? 'Rimuovi prima le schede correlate';
  @override
  String get sourceLimitNotice =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.sourceLimitNotice', {}) ??
      'Alcuni aspetti della configurazione delle fonti possono dipendere dalle impostazioni di compatibilità seguenti. I contenuti sono ospitati e forniti da siti esterni e non sono controllati dall\'app.';
  @override
  String get advanced => TranslationOverrides.string(_root.$meta, 'settings.booru.advanced', {}) ?? 'Impostazioni avanzate';
  @override
  String get expandedSourceCompatibility =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.expandedSourceCompatibility', {}) ?? 'Compatibilità della configurazione delle fonti';
  @override
  String get expandedSourceCompatibilitySubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.expandedSourceCompatibilitySubtitle', {}) ??
      'Modifica la gestione delle impostazioni di compatibilità delle fonti';
  @override
  String get expandedSourceCompatibilityConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.expandedSourceCompatibilityConfirm', {}) ??
      'Questa modifica può influire sul funzionamento delle fonti. I contenuti sono ospitati e forniti da siti esterni e non sono controllati dall\'app. Continuare?';
  @override
  String get sourceUnavailableCurrentSettings =>
      TranslationOverrides.string(_root.$meta, 'settings.booru.sourceUnavailableCurrentSettings', {}) ?? 'Questo sito non è disponibile.';
}

// Path: settings.booruEditor
class _Translations$settings$booruEditor$it_IT extends Translations$settings$booruEditor$en {
  _Translations$settings$booruEditor$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? 'Editor Booru';
  @override
  String get testBooruFailedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'Test del Booru fallito';
  @override
  String get testBooruFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ??
      'I parametri di configurazione potrebbero essere errati, il booru potrebbe non consentire l\'accesso alle API, la richiesta non ha restituito dati o si è verificato un errore di rete.';
  @override
  String get saveBooru => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Salva Booru';
  @override
  String get runningTest => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? 'Esecuzione del test…';
  @override
  String get booruConfigExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? 'Questa configurazione Booru esiste già';
  @override
  String get booruSameNameExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ??
      'Esiste già una configurazione Booru con lo stesso nome';
  @override
  String get booruSameUrlExistsError =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ??
      'Esiste già una configurazione Booru con lo stesso URL';
  @override
  String get thisBooruConfigWontBeAdded =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ??
      'Questa configurazione booru non verrà aggiunta';
  @override
  String get booruConfigSaved =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? 'Configurazione Booru salvata';
  @override
  String get existingTabsNeedReload =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ??
      'Le schede esistenti con questo Booru devono essere ricaricate per applicare le modifiche!';
  @override
  String get failedVerifyApiHydrus =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ?? 'Verifica dell\'accesso API per Hydrus fallita';
  @override
  String get accessKeyRequestedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? 'Chiave di accesso richiesta';
  @override
  String get accessKeyRequestedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ??
      'Tocca ok su Hydrus, quindi applica. Successivamente puoi toccare \'Test Booru\'';
  @override
  String get accessKeyFailedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? 'Impossibile ottenere la chiave di accesso';
  @override
  String get accessKeyFailedMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ?? 'La finestra di richiesta è aperta su Hydrus?';
  @override
  String get hydrusInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ??
      'Per ottenere la chiave Hydrus devi aprire la finestra di richiesta nel client Hydrus. Services > Review services > Client API > Add > From API request';
  @override
  String get getHydrusApiKey =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? 'Ottieni la chiave API di Hydrus';
  @override
  String get booruName => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? 'Nome Booru';
  @override
  String get booruNameRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? 'Il nome del Booru è richiesto!';
  @override
  String get booruUrl => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? 'URL del Booru';
  @override
  String get booruUrlRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? 'L\'URL del Booru è richiesto!';
  @override
  String get booruType => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruType', {}) ?? 'Tipo di Booru';
  @override
  String get booruFavicon => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? 'URL della Favicon';
  @override
  String get booruFaviconPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '(Si compila automaticamente se vuoto)';
  @override
  String get booruDefTags => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? 'Tag predefiniti';
  @override
  String get booruDefTagsPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTagsPlaceholder', {}) ?? 'Ricerca predefinita per il booru';
  @override
  String get booruDefaultInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefaultInstructions', {}) ??
      'I campi sottostanti potrebbero essere richiesti per alcuni booru';
  @override
  String get booruConfigShouldSave =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigShouldSave', {}) ??
      'Conferma il salvataggio di questa configurazione booru';
  @override
  String booruConfigSelectedType({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSelectedType', {'booruType': booruType}) ??
      'Tipo di booru selezionato/rilevato: ${booruType}';
}

// Path: settings.interface
class _Translations$settings$interface$it_IT extends Translations$settings$interface$en {
  _Translations$settings$interface$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? 'Interfaccia';
  @override
  String get appUIMode => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIMode', {}) ?? 'Modalità interfaccia app';
  @override
  String get appUIModeWarningTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarningTitle', {}) ?? 'Modalità interfaccia app';
  @override
  String get appUIModeWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarning', {}) ??
      'Usare la modalità Desktop? Può causare problemi su dispositivi mobili. DEPRECATA.';
  @override
  String get appUIModeHelpMobile =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpMobile', {}) ?? '- Mobile - Interfaccia mobile normale';
  @override
  String get appUIModeHelpDesktop =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpDesktop', {}) ??
      '- Desktop - Interfaccia stile Ahoviewer [DEPRECATA, DA RIVEDERE]';
  @override
  String get appUIModeHelpWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpWarning', {}) ??
      '[Attenzione]: Non impostare la modalità interfaccia su Desktop su un telefono; potresti bloccare l\'app e dover cancellare le tue impostazioni, incluse le configurazioni dei booru.';
  @override
  String get handSide => TranslationOverrides.string(_root.$meta, 'settings.interface.handSide', {}) ?? 'Mano dominante';
  @override
  String get handSideHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.handSideHelp', {}) ??
      'Regola la posizione degli elementi dell\'interfaccia sul lato selezionato';
  @override
  String get showSearchBarInPreviewGrid =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.showSearchBarInPreviewGrid', {}) ??
      'Mostra la barra di ricerca nella griglia di anteprima';
  @override
  String get moveInputToTopInSearchView =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.moveInputToTopInSearchView', {}) ??
      'Sposta il campo di inserimento in alto nella vista di ricerca';
  @override
  String get searchViewQuickActionsPanel =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewQuickActionsPanel', {}) ??
      'Pannello delle azioni rapide nella vista di ricerca';
  @override
  String get searchViewInputAutofocus =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewInputAutofocus', {}) ?? 'Focus automatico sul campo di ricerca';
  @override
  String get disableVibration => TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibration', {}) ?? 'Disattiva vibrazione';
  @override
  String get disableVibrationSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibrationSubtitle', {}) ??
      'Potrebbe comunque verificarsi su alcune azioni anche se disattivata';
  @override
  String get usePredictiveBack => TranslationOverrides.string(_root.$meta, 'settings.interface.usePredictiveBack', {}) ?? 'Gesto indietro predittivo';
  @override
  String get previewColumnsPortrait =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsPortrait', {}) ?? 'Colonne di anteprima (verticale)';
  @override
  String get previewColumnsLandscape =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsLandscape', {}) ?? 'Colonne di anteprima (orizzontale)';
  @override
  String get previewQuality => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQuality', {}) ?? 'Qualità dell\'anteprima';
  @override
  String get previewQualityHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelp', {}) ??
      'Modifica la risoluzione delle immagini nella griglia di anteprima';
  @override
  String get previewQualityHelpSample =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpSample', {}) ??
      '- Versione ridotta - Risoluzione media; l\'app mostrerà una miniatura come segnaposto mentre carica l\'immagine di qualità superiore';
  @override
  String get previewQualityHelpThumbnail =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpThumbnail', {}) ?? '- Miniatura - Bassa risoluzione';
  @override
  String get previewQualityHelpNote =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpNote', {}) ??
      '[Nota]: La qualità «Versione ridotta» può ridurre notevolmente le prestazioni, specialmente se ci sono troppe colonne nella griglia di anteprima';
  @override
  String get previewDisplay => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplay', {}) ?? 'Visualizzazione anteprima';
  @override
  String get previewDisplayFallback =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallback', {}) ?? 'Visualizzazione anteprima di riserva';
  @override
  String get previewDisplayFallbackHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallbackHelp', {}) ??
      'Questo verrà utilizzato quando l\'opzione A cascata non è possibile';
  @override
  String get dontScaleImages =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImages', {}) ?? 'Non ridimensionare le immagini';
  @override
  String get dontScaleImagesSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesSubtitle', {}) ?? 'Potrebbe ridurre le prestazioni';
  @override
  String get dontScaleImagesWarningTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningTitle', {}) ?? 'Attenzione';
  @override
  String get dontScaleImagesWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarning', {}) ??
      'Sei sicuro di voler disattivare il ridimensionamento delle immagini?';
  @override
  String get dontScaleImagesWarningMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningMsg', {}) ??
      'Questo può influire negativamente sulle prestazioni, specialmente sui dispositivi più vecchi';
  @override
  String get gifThumbnails => TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnails', {}) ?? 'Miniature GIF';
  @override
  String get gifThumbnailsRequires =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnailsRequires', {}) ?? 'Richiede «Non ridimensionare le immagini»';
  @override
  String get scrollPreviewsButtonsPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.scrollPreviewsButtonsPosition', {}) ??
      'Posizione dei pulsanti di scorrimento delle anteprime';
  @override
  String get mouseWheelScrollModifier =>
      TranslationOverrides.string(_root.$meta, 'settings.interface.mouseWheelScrollModifier', {}) ??
      'Modificatore di scorrimento della rotella del mouse';
  @override
  String get scrollModifier => TranslationOverrides.string(_root.$meta, 'settings.interface.scrollModifier', {}) ?? 'Modificatore di scorrimento';
  @override
  late final _Translations$settings$interface$previewQualityValues$it_IT previewQualityValues =
      _Translations$settings$interface$previewQualityValues$it_IT._(_root);
  @override
  late final _Translations$settings$interface$previewDisplayModeValues$it_IT previewDisplayModeValues =
      _Translations$settings$interface$previewDisplayModeValues$it_IT._(_root);
  @override
  late final _Translations$settings$interface$appModeValues$it_IT appModeValues = _Translations$settings$interface$appModeValues$it_IT._(_root);
  @override
  late final _Translations$settings$interface$handSideValues$it_IT handSideValues = _Translations$settings$interface$handSideValues$it_IT._(_root);
}

// Path: settings.theme
class _Translations$settings$theme$it_IT extends Translations$settings$theme$en {
  _Translations$settings$theme$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? 'Temi';
  @override
  String get themeMode => TranslationOverrides.string(_root.$meta, 'settings.theme.themeMode', {}) ?? 'Modalità tema';
  @override
  String get blackBg => TranslationOverrides.string(_root.$meta, 'settings.theme.blackBg', {}) ?? 'Sfondo nero';
  @override
  String get useDynamicColor => TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? 'Usa colore dinamico';
  @override
  String get android12PlusOnly => TranslationOverrides.string(_root.$meta, 'settings.theme.android12PlusOnly', {}) ?? 'Solo Android 12+';
  @override
  String get theme => TranslationOverrides.string(_root.$meta, 'settings.theme.theme', {}) ?? 'Tema';
  @override
  String get primaryColor => TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? 'Colore primario';
  @override
  String get secondaryColor => TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? 'Colore secondario';
  @override
  String get enableDrawerMascot =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.enableDrawerMascot', {}) ?? 'Abilita la mascotte del menu laterale';
  @override
  String get setCustomMascot => TranslationOverrides.string(_root.$meta, 'settings.theme.setCustomMascot', {}) ?? 'Imposta mascotte personalizzata';
  @override
  String get removeCustomMascot =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? 'Rimuovi mascotte personalizzata';
  @override
  String get currentMascotPath =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.currentMascotPath', {}) ?? 'Percorso della mascotte attuale';
  @override
  String get system => TranslationOverrides.string(_root.$meta, 'settings.theme.system', {}) ?? 'Sistema';
  @override
  String get light => TranslationOverrides.string(_root.$meta, 'settings.theme.light', {}) ?? 'Chiaro';
  @override
  String get dark => TranslationOverrides.string(_root.$meta, 'settings.theme.dark', {}) ?? 'Scuro';
  @override
  String get pink => TranslationOverrides.string(_root.$meta, 'settings.theme.pink', {}) ?? 'Rosa';
  @override
  String get purple => TranslationOverrides.string(_root.$meta, 'settings.theme.purple', {}) ?? 'Viola';
  @override
  String get blue => TranslationOverrides.string(_root.$meta, 'settings.theme.blue', {}) ?? 'Blu';
  @override
  String get teal => TranslationOverrides.string(_root.$meta, 'settings.theme.teal', {}) ?? 'Teal';
  @override
  String get red => TranslationOverrides.string(_root.$meta, 'settings.theme.red', {}) ?? 'Rosso';
  @override
  String get green => TranslationOverrides.string(_root.$meta, 'settings.theme.green', {}) ?? 'Verde';
  @override
  String get halloween => TranslationOverrides.string(_root.$meta, 'settings.theme.halloween', {}) ?? 'Halloween';
  @override
  String get custom => TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? 'Personalizzato';
  @override
  String get selectColor => TranslationOverrides.string(_root.$meta, 'settings.theme.selectColor', {}) ?? 'Seleziona colore';
  @override
  String get selectedColor => TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColor', {}) ?? 'Colore selezionato';
  @override
  String get selectedColorAndShades =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColorAndShades', {}) ?? 'Colore selezionato e le sue sfumature';
  @override
  String get fontFamily => TranslationOverrides.string(_root.$meta, 'settings.theme.fontFamily', {}) ?? 'Font';
  @override
  String get systemDefault => TranslationOverrides.string(_root.$meta, 'settings.theme.systemDefault', {}) ?? 'Predefinito di sistema';
  @override
  String get viewMoreFonts => TranslationOverrides.string(_root.$meta, 'settings.theme.viewMoreFonts', {}) ?? 'Mostra altri font';
  @override
  String get fontPreviewText =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.fontPreviewText', {}) ??
      'Il veloce gatto gioca in giardino. À È É Ì Ò Ù — à è é ì ò ù — ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  @override
  String get customFont => TranslationOverrides.string(_root.$meta, 'settings.theme.customFont', {}) ?? 'Font personalizzato';
  @override
  String get customFontSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.theme.customFontSubtitle', {}) ?? 'Inserisci il nome di qualsiasi Google Font';
  @override
  String get fontName => TranslationOverrides.string(_root.$meta, 'settings.theme.fontName', {}) ?? 'Nome del font';
  @override
  String get customFontHint => TranslationOverrides.string(_root.$meta, 'settings.theme.customFontHint', {}) ?? 'Sfoglia i font su fonts.google.com';
  @override
  String get fontNotFound => TranslationOverrides.string(_root.$meta, 'settings.theme.fontNotFound', {}) ?? 'Font non trovato';
}

// Path: settings.viewer
class _Translations$settings$viewer$it_IT extends Translations$settings$viewer$en {
  _Translations$settings$viewer$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? 'Visualizzatore';
  @override
  String get preloadAmount => TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadAmount', {}) ?? 'Quantità di precaricamento';
  @override
  String get preloadSizeLimit =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimit', {}) ?? 'Limite dimensione precaricamento';
  @override
  String get preloadSizeLimitSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimitSubtitle', {}) ?? 'in GB, 0 per nessun limite';
  @override
  String get preloadHeightLimit =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimit', {}) ?? 'Limite altezza precaricamento';
  @override
  String get preloadHeightLimitSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimitSubtitle', {}) ?? 'in pixel, 0 per nessun limite';
  @override
  String get imageQuality => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQuality', {}) ?? 'Qualità dell\'immagine';
  @override
  String get viewerScrollDirection =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerScrollDirection', {}) ?? 'Direzione dello scorrimento';
  @override
  String get viewerToolbarPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerToolbarPosition', {}) ?? 'Posizione della barra degli strumenti';
  @override
  String get zoomButtonPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.zoomButtonPosition', {}) ?? 'Posizione del pulsante di zoom';
  @override
  String get changePageButtonsPosition =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.changePageButtonsPosition', {}) ?? 'Posizione dei pulsanti cambia pagina';
  @override
  String get hideToolbarWhenOpeningViewer =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.hideToolbarWhenOpeningViewer', {}) ??
      'Nascondi la barra degli strumenti all\'apertura del visualizzatore';
  @override
  String get expandDetailsByDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.expandDetailsByDefault', {}) ?? 'Espandi i dettagli per impostazione predefinita';
  @override
  String get hideTranslationNotesByDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.hideTranslationNotesByDefault', {}) ??
      'Nascondi le note di traduzione per impostazione predefinita';
  @override
  String get enableRotation => TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotation', {}) ?? 'Abilita rotazione';
  @override
  String get enableRotationSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotationSubtitle', {}) ?? 'Tocca due volte per ripristinare';
  @override
  String get toolbarButtonsOrder =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarButtonsOrder', {}) ?? 'Ordine dei pulsanti della barra degli strumenti';
  @override
  String get buttonsOrder => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonsOrder', {}) ?? 'Ordine dei pulsanti';
  @override
  String get longPressToChangeItemOrder =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToChangeItemOrder', {}) ??
      'Premi a lungo per modificare l\'ordine degli elementi.';
  @override
  String get atLeast4ButtonsVisibleOnToolbar =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.atLeast4ButtonsVisibleOnToolbar', {}) ??
      'Almeno 4 pulsanti di questo elenco saranno sempre visibili sulla barra degli strumenti.';
  @override
  String get otherButtonsWillGoIntoOverflow =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.otherButtonsWillGoIntoOverflow', {}) ??
      'Gli altri pulsanti saranno disponibili nel menu delle altre opzioni (tre punti).';
  @override
  String get longPressToMoveItems =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToMoveItems', {}) ?? 'Premi a lungo per spostare gli elementi';
  @override
  String get onlyForVideos => TranslationOverrides.string(_root.$meta, 'settings.viewer.onlyForVideos', {}) ?? 'Solo per i video';
  @override
  String get thisButtonCannotBeDisabled =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.thisButtonCannotBeDisabled', {}) ?? 'Questo pulsante non può essere disabilitato';
  @override
  String get defaultShareAction =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.defaultShareAction', {}) ?? 'Azione di condivisione predefinita';
  @override
  String get shareActions => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActions', {}) ?? 'Azioni di condivisione';
  @override
  String get shareActionsAsk =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsAsk', {}) ?? '- Chiedi - chiedi sempre cosa condividere';
  @override
  String get shareActionsPostURL => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURL', {}) ?? '- URL del post';
  @override
  String get shareActionsFileURL =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFileURL', {}) ??
      '- URL del file - condivide il link diretto al file originale (potrebbe non funzionare con alcuni siti)';
  @override
  String get shareActionsPostURLFileURLFileWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURLFileURLFileWithTags', {}) ??
      '- URL post/URL file/File con tag - condivide l\'url/file e i tag selezionati';
  @override
  String get shareActionsFile =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFile', {}) ??
      '- File - condivide il file stesso, potrebbe richiedere del tempo per caricarsi, il progresso verrà mostrato sul pulsante Condividi';
  @override
  String get shareActionsHydrus =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsHydrus', {}) ??
      '- Hydrus - invia l\'url del post a Hydrus per l\'importazione';
  @override
  String get shareActionsNoteIfFileSavedInCache =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsNoteIfFileSavedInCache', {}) ??
      '[Nota]: Se il file è salvato nella cache, verrà caricato da lì. Altrimenti verrà caricato nuovamente dalla rete.';
  @override
  String get shareActionsTip =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsTip', {}) ??
      '[Suggerimento]: Puoi aprire il menu delle azioni di condivisione premendo a lungo il pulsante Condividi.';
  @override
  String get useVolumeButtonsForScrolling =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.useVolumeButtonsForScrolling', {}) ?? 'Usa i pulsanti del volume per lo scorrimento';
  @override
  String get volumeButtonsScrolling =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrolling', {}) ?? 'Scorrimento con pulsanti del volume';
  @override
  String get volumeButtonsScrollingHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollingHelp', {}) ??
      'Usa i pulsanti del volume per scorrere tra le anteprime e il visualizzatore';
  @override
  String get volumeButtonsVolumeDown =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeDown', {}) ?? ' - Abbassa volume - elemento successivo';
  @override
  String get volumeButtonsVolumeUp =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeUp', {}) ?? ' - Alza volume - elemento precedente';
  @override
  String get volumeButtonsInViewer => TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsInViewer', {}) ?? 'Nel visualizzatore:';
  @override
  String get volumeButtonsToolbarVisible =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarVisible', {}) ??
      ' - Barra degli strumenti visibile - controlla il volume';
  @override
  String get volumeButtonsToolbarHidden =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarHidden', {}) ??
      ' - Barra degli strumenti nascosta - controlla lo scorrimento';
  @override
  String get volumeButtonsScrollSpeed =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollSpeed', {}) ?? 'Velocità di scorrimento con i pulsanti del volume';
  @override
  String get slideshowDurationInMs =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowDurationInMs', {}) ?? 'Durata della presentazione (in ms)';
  @override
  String get slideshow => TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshow', {}) ?? 'Presentazione';
  @override
  String get slideshowWIPNote =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowWIPNote', {}) ?? '[WIP] Video/GIF: solo scorrimento manuale';
  @override
  String get preventDeviceFromSleeping =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.preventDeviceFromSleeping', {}) ?? 'Impedisci al dispositivo di andare in standby';
  @override
  String get viewerOpenCloseAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerOpenCloseAnimation', {}) ??
      'Animazione di apertura/chiusura del visualizzatore';
  @override
  String get viewerPageChangeAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerPageChangeAnimation', {}) ?? 'Animazione di cambio pagina del visualizzatore';
  @override
  String get usingDefaultAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.usingDefaultAnimation', {}) ?? 'Utilizzo dell\'animazione predefinita';
  @override
  String get usingCustomAnimation =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.usingCustomAnimation', {}) ?? 'Utilizzo dell\'animazione personalizzata';
  @override
  String get kannaLoadingGif => TranslationOverrides.string(_root.$meta, 'settings.viewer.kannaLoadingGif', {}) ?? 'GIF di caricamento Kanna';
  @override
  late final _Translations$settings$viewer$imageQualityValues$it_IT imageQualityValues = _Translations$settings$viewer$imageQualityValues$it_IT._(
    _root,
  );
  @override
  late final _Translations$settings$viewer$scrollDirectionValues$it_IT scrollDirectionValues =
      _Translations$settings$viewer$scrollDirectionValues$it_IT._(_root);
  @override
  late final _Translations$settings$viewer$toolbarPositionValues$it_IT toolbarPositionValues =
      _Translations$settings$viewer$toolbarPositionValues$it_IT._(_root);
  @override
  late final _Translations$settings$viewer$buttonPositionValues$it_IT buttonPositionValues =
      _Translations$settings$viewer$buttonPositionValues$it_IT._(_root);
  @override
  late final _Translations$settings$viewer$shareActionValues$it_IT shareActionValues = _Translations$settings$viewer$shareActionValues$it_IT._(_root);
}

// Path: settings.video
class _Translations$settings$video$it_IT extends Translations$settings$video$en {
  _Translations$settings$video$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? 'Video';
  @override
  String get disableVideos => TranslationOverrides.string(_root.$meta, 'settings.video.disableVideos', {}) ?? 'Disattiva video';
  @override
  String get disableVideosHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.disableVideosHelp', {}) ??
      'Utile su dispositivi di fascia bassa che si bloccano quando si tenta di caricare video. Offre invece opzioni per visualizzare il video in un lettore esterno o nel browser.';
  @override
  String get autoplayVideos => TranslationOverrides.string(_root.$meta, 'settings.video.autoplayVideos', {}) ?? 'Riproduzione automatica video';
  @override
  String get startVideosMuted =>
      TranslationOverrides.string(_root.$meta, 'settings.video.startVideosMuted', {}) ?? 'Avvia video con audio disattivato';
  @override
  String get experimental => TranslationOverrides.string(_root.$meta, 'settings.video.experimental', {}) ?? '[Sperimentale]';
  @override
  String get videoPlayerBackend => TranslationOverrides.string(_root.$meta, 'settings.video.videoPlayerBackend', {}) ?? 'Backend del lettore video';
  @override
  String get backendDefault => TranslationOverrides.string(_root.$meta, 'settings.video.backendDefault', {}) ?? 'Predefinito';
  @override
  String get backendMPV => TranslationOverrides.string(_root.$meta, 'settings.video.backendMPV', {}) ?? 'MPV';
  @override
  String get backendMDK => TranslationOverrides.string(_root.$meta, 'settings.video.backendMDK', {}) ?? 'MDK';
  @override
  String get backendDefaultHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendDefaultHelp', {}) ??
      'Basato su exoplayer. Ha la migliore compatibilità con i dispositivi, potrebbe riscontrare problemi con video in 4K, alcuni codec o dispositivi più vecchi';
  @override
  String get backendMPVHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendMPVHelp', {}) ??
      'Basato su libmpv, dispone di impostazioni avanzate che potrebbero aiutare a risolvere i problemi con alcuni codec/dispositivi\n[PUÒ CAUSARE CRASH]';
  @override
  String get backendMDKHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.backendMDKHelp', {}) ??
      'Basato su libmdk, potrebbe avere prestazioni migliori con alcuni codec/dispositivi\n[PUÒ CAUSARE CRASH]';
  @override
  String get mpvSettingsHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.video.mpvSettingsHelp', {}) ??
      'Prova valori diversi per le impostazioni \'MPV\' di seguito se i video non funzionano correttamente o restituiscono errori di codec:';
  @override
  String get mpvUseHardwareAcceleration =>
      TranslationOverrides.string(_root.$meta, 'settings.video.mpvUseHardwareAcceleration', {}) ?? 'MPV: usa l\'accelerazione hardware';
  @override
  String get mpvVO => TranslationOverrides.string(_root.$meta, 'settings.video.mpvVO', {}) ?? 'MPV: VO';
  @override
  String get mpvHWDEC => TranslationOverrides.string(_root.$meta, 'settings.video.mpvHWDEC', {}) ?? 'MPV: HWDEC';
  @override
  String get videoCacheMode => TranslationOverrides.string(_root.$meta, 'settings.video.videoCacheMode', {}) ?? 'Modalità cache video';
  @override
  late final _Translations$settings$video$cacheModes$it_IT cacheModes = _Translations$settings$video$cacheModes$it_IT._(_root);
  @override
  late final _Translations$settings$video$cacheModeValues$it_IT cacheModeValues = _Translations$settings$video$cacheModeValues$it_IT._(_root);
  @override
  late final _Translations$settings$video$videoBackendModeValues$it_IT videoBackendModeValues =
      _Translations$settings$video$videoBackendModeValues$it_IT._(_root);
}

// Path: settings.downloads
class _Translations$settings$downloads$it_IT extends Translations$settings$downloads$en {
  _Translations$settings$downloads$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get fromNextItemInQueue =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.fromNextItemInQueue', {}) ?? 'Dal prossimo elemento in coda';
  @override
  String get pleaseProvideStoragePermission =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.pleaseProvideStoragePermission', {}) ??
      'Fornisci il permesso di archiviazione per poter scaricare i file';
  @override
  String get noItemsSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsSelected', {}) ?? 'Nessun elemento selezionato';
  @override
  String get noItemsQueued => TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsQueued', {}) ?? 'Nessun elemento in coda';
  @override
  String get batch => TranslationOverrides.string(_root.$meta, 'settings.downloads.batch', {}) ?? 'Batch';
  @override
  String get snatchSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? 'Scarica gli elementi selezionati';
  @override
  String get removeSnatchedStatusFromSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ??
      'Rimuovi lo stato «Scaricato» dagli elementi selezionati';
  @override
  String get favouriteSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? 'Aggiungi selezionati ai preferiti';
  @override
  String get unfavouriteSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? 'Rimuovi selezionati dai preferiti';
  @override
  String get clearSelected => TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? 'Cancella selezionati';
  @override
  String get updatingData => TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? 'Aggiornamento dei dati…';
}

// Path: settings.database
class _Translations$settings$database$it_IT extends Translations$settings$database$en {
  _Translations$settings$database$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? 'Database';
  @override
  String get indexingDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? 'Indicizzazione del database';
  @override
  String get droppingIndexes => TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? 'Eliminazione degli indici';
  @override
  String get enableDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.enableDatabase', {}) ?? 'Abilita database';
  @override
  String get enableIndexing => TranslationOverrides.string(_root.$meta, 'settings.database.enableIndexing', {}) ?? 'Abilita indicizzazione';
  @override
  String get enableSearchHistory =>
      TranslationOverrides.string(_root.$meta, 'settings.database.enableSearchHistory', {}) ?? 'Abilita cronologia delle ricerche';
  @override
  String get enableTagTypeFetching =>
      TranslationOverrides.string(_root.$meta, 'settings.database.enableTagTypeFetching', {}) ?? 'Abilita il recupero del tipo di tag';
  @override
  String get sankakuTypeToUpdate =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuTypeToUpdate', {}) ?? 'Tipo Sankaku da aggiornare';
  @override
  String get searchQuery => TranslationOverrides.string(_root.$meta, 'settings.database.searchQuery', {}) ?? 'Query di ricerca';
  @override
  String get searchQueryOptional =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchQueryOptional', {}) ?? '(opzionale, potrebbe rallentare il processo)';
  @override
  String get cantLeavePageNow =>
      TranslationOverrides.string(_root.$meta, 'settings.database.cantLeavePageNow', {}) ?? 'Impossibile lasciare la pagina in questo momento!';
  @override
  String get sankakuDataUpdating =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDataUpdating', {}) ??
      'I dati di Sankaku sono in fase di aggiornamento, attendi fino al termine o annulla manualmente in fondo alla pagina';
  @override
  String get pleaseWaitTitle => TranslationOverrides.string(_root.$meta, 'settings.database.pleaseWaitTitle', {}) ?? 'Attendi prego!';
  @override
  String get indexesBeingChanged =>
      TranslationOverrides.string(_root.$meta, 'settings.database.indexesBeingChanged', {}) ?? 'Gli indici sono in fase di modifica';
  @override
  String get databaseInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfo', {}) ??
      'Memorizza i preferiti e tiene traccia degli elementi scaricati';
  @override
  String get databaseInfoSnatch =>
      TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfoSnatch', {}) ?? 'Gli elementi scaricati non verranno riscaricati';
  @override
  String get indexingInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.indexingInfo', {}) ??
      'Velocizza le ricerche nel database ma usa più spazio su disco (fino a 2x).\n\nNon lasciare la pagina o chiudere l\'app durante l\'indicizzazione.';
  @override
  String get createIndexesDebug => TranslationOverrides.string(_root.$meta, 'settings.database.createIndexesDebug', {}) ?? 'Crea Indici [Debug]';
  @override
  String get dropIndexesDebug => TranslationOverrides.string(_root.$meta, 'settings.database.dropIndexesDebug', {}) ?? 'Elimina Indici [Debug]';
  @override
  String get searchHistoryInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryInfo', {}) ?? 'Richiede che il database sia abilitato.';
  @override
  String searchHistoryRecords({required int limit}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryRecords', {'limit': limit}) ?? 'Salva le ultime ${limit} ricerche';
  @override
  String get searchHistoryTapInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryTapInfo', {}) ?? 'Tocca la voce per le azioni (Elimina, Preferito…)';
  @override
  String get searchHistoryFavouritesInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryFavouritesInfo', {}) ??
      'Le ricerche preferite sono fissate in cima alla lista e non verranno conteggiate nel limite.';
  @override
  String get tagTypeFetchingInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingInfo', {}) ?? 'Recupera i tipi di tag dai booru supportati';
  @override
  String get tagTypeFetchingWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingWarning', {}) ?? 'Potrebbe causare limitazioni di frequenza';
  @override
  String get deleteDatabase => TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabase', {}) ?? 'Elimina database';
  @override
  String get deleteDatabaseConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabaseConfirm', {}) ?? 'Eliminare il database?';
  @override
  String get databaseDeleted => TranslationOverrides.string(_root.$meta, 'settings.database.databaseDeleted', {}) ?? 'Database eliminato!';
  @override
  String get appRestartRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.database.appRestartRequired', {}) ?? 'È necessario riavviare l\'app!';
  @override
  String get clearSnatchedItems =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearSnatchedItems', {}) ?? 'Cancella la cronologia dei download';
  @override
  String get clearAllSnatchedConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearAllSnatchedConfirm', {}) ?? 'Cancellare tutta la cronologia dei download?';
  @override
  String get snatchedItemsCleared =>
      TranslationOverrides.string(_root.$meta, 'settings.database.snatchedItemsCleared', {}) ?? 'Cronologia dei download cancellata';
  @override
  String get appRestartMayBeRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.database.appRestartMayBeRequired', {}) ?? 'Potrebbe essere necessario riavviare l\'app!';
  @override
  String get clearFavouritedItems =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearFavouritedItems', {}) ?? 'Cancella elementi preferiti';
  @override
  String get clearAllFavouritedConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearAllFavouritedConfirm', {}) ?? 'Cancellare tutti gli elementi preferiti?';
  @override
  String get favouritesCleared => TranslationOverrides.string(_root.$meta, 'settings.database.favouritesCleared', {}) ?? 'Preferiti cancellati';
  @override
  String get clearSearchHistory =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistory', {}) ?? 'Cancella cronologia di ricerca';
  @override
  String get clearSearchHistoryConfirm =>
      TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistoryConfirm', {}) ?? 'Cancellare la cronologia di ricerca?';
  @override
  String get searchHistoryCleared =>
      TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryCleared', {}) ?? 'Cronologia di ricerca cancellata';
  @override
  String get sankakuFavouritesUpdate =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdate', {}) ?? 'Aggiornamento preferiti Sankaku';
  @override
  String get sankakuFavouritesUpdateStarted =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateStarted', {}) ?? 'Aggiornamento preferiti Sankaku avviato';
  @override
  String get sankakuNewUrlsInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuNewUrlsInfo', {}) ??
      'Verranno recuperati nuovi url delle immagini per gli elementi Sankaku nei tuoi preferiti';
  @override
  String get sankakuDontLeavePage =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDontLeavePage', {}) ??
      'Non lasciare questa pagina finché il processo non è completo o interrotto';
  @override
  String get noSankakuConfigFound =>
      TranslationOverrides.string(_root.$meta, 'settings.database.noSankakuConfigFound', {}) ?? 'Nessuna configurazione Sankaku trovata!';
  @override
  String get sankakuFavouritesUpdateComplete =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateComplete', {}) ??
      'Aggiornamento preferiti Sankaku completato';
  @override
  String get failedItemsPurgeStartedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeStartedTitle', {}) ?? 'Eliminazione elementi falliti avviata';
  @override
  String get failedItemsPurgeInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeInfo', {}) ??
      'Gli elementi che non è stato possibile aggiornare verranno rimossi dal database';
  @override
  String get updateSankakuUrls => TranslationOverrides.string(_root.$meta, 'settings.database.updateSankakuUrls', {}) ?? 'Aggiorna URL Sankaku';
  @override
  String updating({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.updating', {'count': count}) ?? 'Aggiornamento degli elementi: ${count}';
  @override
  String left({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.left', {'count': count}) ?? 'Rimanenti: ${count}';
  @override
  String done({required int count}) => TranslationOverrides.string(_root.$meta, 'settings.database.done', {'count': count}) ?? 'Completati: ${count}';
  @override
  String failedSkipped({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.failedSkipped', {'count': count}) ?? 'Falliti/Saltati: ${count}';
  @override
  String get sankakuRateLimitWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.database.sankakuRateLimitWarning', {}) ??
      'Fermati e riprova più tardi se inizi a vedere il numero \'Falliti\' crescere costantemente, potresti aver raggiunto il limite di richieste e/o Sankaku blocca le richieste dal tuo IP.';
  @override
  String get skipCurrentItem =>
      TranslationOverrides.string(_root.$meta, 'settings.database.skipCurrentItem', {}) ?? 'Premi qui per saltare l\'elemento corrente';
  @override
  String get useIfStuck =>
      TranslationOverrides.string(_root.$meta, 'settings.database.useIfStuck', {}) ?? 'Usa se l\'elemento sembra essere bloccato';
  @override
  String get pressToStop =>
      TranslationOverrides.string(_root.$meta, 'settings.database.pressToStop', {}) ?? 'Premi qui per interrompere l\'operazione';
  @override
  String purgeFailedItems({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.purgeFailedItems', {'count': count}) ?? 'Elimina elementi falliti (${count})';
  @override
  String retryFailedItems({required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.database.retryFailedItems', {'count': count}) ??
      'Riprova l\'aggiornamento degli elementi non riusciti (${count})';
}

// Path: settings.backupAndRestore
class _Translations$settings$backupAndRestore$it_IT extends Translations$settings$backupAndRestore$en {
  _Translations$settings$backupAndRestore$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.title', {}) ?? 'Backup e Ripristino';
  @override
  String get duplicateFileDetectedTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedTitle', {}) ?? 'File duplicato rilevato!';
  @override
  String duplicateFileDetectedMsg({required String fileName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
      'Il file ${fileName} esiste già. Vuoi sovrascriverlo? Se scegli no, il backup verrà annullato.';
  @override
  String get androidOnlyFeatureMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ??
      'Questa funzione è disponibile solo su Android, sulle versioni Desktop puoi semplicemente copiare/incollare i file da/verso la cartella dati dell\'app, in base al tuo sistema';
  @override
  String get selectBackupDir =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? 'Seleziona cartella di backup';
  @override
  String get failedToGetBackupPath =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ?? 'Impossibile ottenere il percorso di backup';
  @override
  String backupPathMsg({required String backupPath}) =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ??
      'Il percorso di backup è: ${backupPath}';
  @override
  String get noBackupDirSelected =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ?? 'Nessuna cartella di backup selezionata';
  @override
  String get restoreInfoMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ??
      'I file devono trovarsi nella radice della cartella selezionata';
  @override
  String get backupSettings =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? 'Esegui il backup delle impostazioni';
  @override
  String get restoreSettings =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? 'Ripristina impostazioni';
  @override
  String get settingsBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ?? 'Impostazioni salvate su settings.json';
  @override
  String get settingsRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? 'Impostazioni ripristinate dal backup';
  @override
  String get backupSettingsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ??
      'Impossibile eseguire il backup delle impostazioni';
  @override
  String get restoreSettingsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ?? 'Impossibile ripristinare le impostazioni';
  @override
  String get resetBackupDir =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.resetBackupDir', {}) ?? 'Reimposta cartella di backup';
  @override
  String get backupBoorus =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ??
      'Esegui il backup delle configurazioni dei siti booru';
  @override
  String get restoreBoorus =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? 'Ripristina le configurazioni dei siti booru';
  @override
  String get boorusBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ?? 'Booru salvati su boorus.json';
  @override
  String get boorusRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ?? 'Booru ripristinati dal backup';
  @override
  String get backupBoorusError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ?? 'Impossibile eseguire il backup dei booru';
  @override
  String get restoreBoorusError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ?? 'Impossibile ripristinare i booru';
  @override
  String get backupDatabase =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? 'Esegui il backup del database';
  @override
  String get restoreDatabase => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? 'Ripristina database';
  @override
  String get restoreDatabaseInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ??
      'Potrebbe richiedere del tempo a seconda delle dimensioni del database, riavvierà l\'app in caso di successo';
  @override
  String get databaseBackedUp =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ?? 'Database salvato su store.db';
  @override
  String get databaseRestored =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ??
      'Database ripristinato dal backup! L\'app si riavvierà tra pochi secondi!';
  @override
  String get backupDatabaseError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ?? 'Impossibile eseguire il backup del database';
  @override
  String get restoreDatabaseError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ?? 'Impossibile ripristinare il database';
  @override
  String get databaseFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ??
      'File del database non trovato o illeggibile!';
  @override
  String get backupTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? 'Esegui il backup dei tag';
  @override
  String get restoreTags => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? 'Ripristina tag';
  @override
  String get restoreTagsInfo =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ??
      'Potrebbe richiedere del tempo se hai molti tag. Se hai già ripristinato il database, questa operazione non è necessaria perché i tag sono già inclusi nel database';
  @override
  String get tagsBackedUp => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? 'Tag salvati su tags.json';
  @override
  String get tagsRestored => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? 'Tag ripristinati dal backup';
  @override
  String get backupTagsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? 'Impossibile eseguire il backup dei tag';
  @override
  String get restoreTagsError =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? 'Impossibile ripristinare i tag';
  @override
  String get tagsFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsFileNotFound', {}) ?? 'File dei tag non trovato o illeggibile!';
  @override
  String get operationTakesTooLongMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.operationTakesTooLongMsg', {}) ??
      'Premi Nascondi in basso se impiega troppo tempo, l\'operazione continuerà in background';
  @override
  String get backupFileNotFound =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupFileNotFound', {}) ?? 'File di backup non trovato o illeggibile!';
  @override
  String get backupDirNoAccess =>
      TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDirNoAccess', {}) ?? 'Nessun accesso alla cartella di backup!';
  @override
  String get backupCancelled => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? 'Backup annullato';
}

// Path: settings.network
class _Translations$settings$network$it_IT extends Translations$settings$network$en {
  _Translations$settings$network$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? 'Rete';
  @override
  String get enableSelfSignedSSLCertificates =>
      TranslationOverrides.string(_root.$meta, 'settings.network.enableSelfSignedSSLCertificates', {}) ?? 'Abilita certificati SSL autofirmati';
  @override
  String get proxy => TranslationOverrides.string(_root.$meta, 'settings.network.proxy', {}) ?? 'Proxy';
  @override
  String get proxySubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.network.proxySubtitle', {}) ??
      'Non si applica alla modalità video stream, usa invece la modalità video cache';
  @override
  String get customUserAgent => TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgent', {}) ?? 'User-Agent Personalizzato';
  @override
  String get customUserAgentTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgentTitle', {}) ?? 'User-Agent Personalizzato';
  @override
  String get keepEmptyForDefault =>
      TranslationOverrides.string(_root.$meta, 'settings.network.keepEmptyForDefault', {}) ?? 'Lascia vuoto per usare il valore predefinito';
  @override
  String defaultUserAgent({required String agent}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.defaultUserAgent', {'agent': agent}) ?? 'Predefinito: ${agent}';
  @override
  String get userAgentUsedOnRequests =>
      TranslationOverrides.string(_root.$meta, 'settings.network.userAgentUsedOnRequests', {}) ??
      'Usato per la maggior parte delle richieste booru e webview';
  @override
  String get valueSavedAfterLeaving =>
      TranslationOverrides.string(_root.$meta, 'settings.network.valueSavedAfterLeaving', {}) ?? 'Salvato all\'uscita dalla pagina';
  @override
  String get setBrowserUserAgent =>
      TranslationOverrides.string(_root.$meta, 'settings.network.setBrowserUserAgent', {}) ??
      'Tocca qui per usare l\'User-Agent del browser Chrome (consigliato solo quando il sito blocca user agent non browser)';
  @override
  String get cookieCleaner => TranslationOverrides.string(_root.$meta, 'settings.network.cookieCleaner', {}) ?? 'Pulizia cookie';
  @override
  String get selectBooruToClearCookies =>
      TranslationOverrides.string(_root.$meta, 'settings.network.selectBooruToClearCookies', {}) ??
      'Seleziona un booru per cancellare i cookie o lascia vuoto per cancellarli tutti';
  @override
  String cookiesFor({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookiesFor', {'booruName': booruName}) ?? 'Cookie per ${booruName}:';
  @override
  String cookieDeleted({required String cookieName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookieDeleted', {'cookieName': cookieName}) ?? 'Cookie «${cookieName}» eliminato';
  @override
  String get clearCookies => TranslationOverrides.string(_root.$meta, 'settings.network.clearCookies', {}) ?? 'Cancella cookie';
  @override
  String clearCookiesFor({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.clearCookiesFor', {'booruName': booruName}) ?? 'Cancella cookie per ${booruName}';
  @override
  String cookiesForBooruDeleted({required String booruName}) =>
      TranslationOverrides.string(_root.$meta, 'settings.network.cookiesForBooruDeleted', {'booruName': booruName}) ??
      'Cookie per ${booruName} eliminati';
  @override
  String get allCookiesDeleted => TranslationOverrides.string(_root.$meta, 'settings.network.allCookiesDeleted', {}) ?? 'Tutti i cookie eliminati';
}

// Path: settings.privacy
class _Translations$settings$privacy$it_IT extends Translations$settings$privacy$en {
  _Translations$settings$privacy$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? 'Privacy';
  @override
  String get appLock => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? 'Blocco app';
  @override
  String get appLockMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ??
      'Blocca l\'app manualmente o dopo un periodo di inattività. Richiede PIN/biometria';
  @override
  String get autoLockAfter => TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfter', {}) ?? 'Blocco automatico dopo';
  @override
  String get autoLockAfterTip =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfterTip', {}) ?? 'in secondi, 0 per disabilitare';
  @override
  String get bluronLeave =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeave', {}) ?? 'Sfoca lo schermo quando si esce dall\'app';
  @override
  String get bluronLeaveMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeaveMsg', {}) ??
      'Potrebbe non funzionare su alcuni dispositivi a causa di limitazioni di sistema';
  @override
  String get incognitoKeyboard => TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboard', {}) ?? 'Tastiera in incognito';
  @override
  String get incognitoKeyboardMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboardMsg', {}) ??
      'Impedisce alla tastiera di salvare la cronologia di digitazione.\nApplicato alla maggior parte degli input di testo';
  @override
  String get appDisplayName => TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayName', {}) ?? 'Nome di visualizzazione dell\'app';
  @override
  String get appDisplayNameDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayNameDescription', {}) ??
      'Cambia come il nome dell\'app appare nel tuo launcher';
  @override
  String get appAliasChanged => TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChanged', {}) ?? 'Nome dell\'app modificato';
  @override
  String get appAliasRestartHint =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasRestartHint', {}) ??
      'Il cambio del nome dell\'app avrà effetto dopo il riavvio. Alcuni launcher potrebbero richiedere tempo aggiuntivo o un riavvio del sistema.';
  @override
  String get appAliasChangeFailed =>
      TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChangeFailed', {}) ?? 'Impossibile cambiare il nome dell\'app. Riprova.';
  @override
  String get restartNow => TranslationOverrides.string(_root.$meta, 'settings.privacy.restartNow', {}) ?? 'Riavvia ora';
}

// Path: settings.performance
class _Translations$settings$performance$it_IT extends Translations$settings$performance$en {
  _Translations$settings$performance$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.performance.title', {}) ?? 'Prestazioni';
  @override
  String get lowPerformanceMode =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceMode', {}) ?? 'Modalità prestazioni ridotte';
  @override
  String get lowPerformanceModeSubtitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeSubtitle', {}) ??
      'Consigliata per vecchi dispositivi e dispositivi con poca RAM';
  @override
  String get lowPerformanceModeDialogTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogTitle', {}) ?? 'Modalità prestazioni ridotte';
  @override
  String get lowPerformanceModeDialogDisablesDetailed =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesDetailed', {}) ??
      '- Disabilita le informazioni dettagliate sul progresso del caricamento';
  @override
  String get lowPerformanceModeDialogDisablesResourceIntensive =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive', {}) ??
      '- Disabilita elementi ad uso intensivo di risorse (sfocature, opacità animate, alcune animazioni…)';
  @override
  String get lowPerformanceModeDialogSetsOptimal =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogSetsOptimal', {}) ??
      'Imposta parametri ottimali per queste opzioni (puoi cambiarle separatamente in seguito):';
  @override
  String get autoplayVideos => TranslationOverrides.string(_root.$meta, 'settings.performance.autoplayVideos', {}) ?? 'Riproduzione automatica video';
  @override
  String get disableVideos => TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideos', {}) ?? 'Disattiva video';
  @override
  String get disableVideosHelp =>
      TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideosHelp', {}) ??
      'Utile su dispositivi di fascia bassa che si bloccano caricando video. Offre opzioni per visualizzare il video in un lettore esterno o browser.';
}

// Path: settings.cache
class _Translations$settings$cache$it_IT extends Translations$settings$cache$en {
  _Translations$settings$cache$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? 'Download e cache';
  @override
  String get snatchQuality => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchQuality', {}) ?? 'Qualità dei download';
  @override
  String get snatchCooldown => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchCooldown', {}) ?? 'Intervallo tra i download (in ms)';
  @override
  String get pleaseEnterAValidTimeout =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.pleaseEnterAValidTimeout', {}) ?? 'Inserisci un valore di tempo di attesa valido';
  @override
  String get biggerThan10 => TranslationOverrides.string(_root.$meta, 'settings.cache.biggerThan10', {}) ?? 'Inserisci un valore maggiore di 10ms';
  @override
  String get showDownloadNotifications =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.showDownloadNotifications', {}) ?? 'Mostra notifiche di download';
  @override
  String get snatchItemsOnFavouriting =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.snatchItemsOnFavouriting', {}) ?? 'Scarica gli elementi all\'aggiunta ai preferiti';
  @override
  String get favouriteItemsOnSnatching =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.favouriteItemsOnSnatching', {}) ?? 'Aggiungi ai preferiti al download';
  @override
  String get writeImageDataOnSave =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.writeImageDataOnSave', {}) ?? 'Scrivi dati immagine su JSON al salvataggio';
  @override
  String get requiresCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.requiresCustomStorageDirectory', {}) ?? 'Richiede una cartella personalizzata';
  @override
  String get setStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.setStorageDirectory', {}) ?? 'Imposta cartella di archiviazione';
  @override
  String currentPath({required String path}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.currentPath', {'path': path}) ?? 'Attuale: ${path}';
  @override
  String get resetStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.resetStorageDirectory', {}) ?? 'Reimposta cartella di archiviazione';
  @override
  String get cachePreviews => TranslationOverrides.string(_root.$meta, 'settings.cache.cachePreviews', {}) ?? 'Metti le anteprime in cache';
  @override
  String get cacheMedia => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheMedia', {}) ?? 'Metti i media in cache';
  @override
  String get videoCacheMode => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheMode', {}) ?? 'Modalità cache video';
  @override
  String get videoCacheModesTitle => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModesTitle', {}) ?? 'Modalità cache video';
  @override
  String get videoCacheModeStream =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStream', {}) ??
      '- Stream - Non usare cache, avvia la riproduzione il prima possibile';
  @override
  String get videoCacheModeCache =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeCache', {}) ??
      '- Cache - Salva il file nella memoria, si riproduce solo al termine del download';
  @override
  String get videoCacheModeStreamCache =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStreamCache', {}) ??
      '- Stream+Cache - Mix di entrambi, ma attualmente causa un doppio download';
  @override
  String get videoCacheNoteEnable =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheNoteEnable', {}) ??
      '[Nota]: I video andranno in cache solo se \'Metti i media in cache\' è abilitato.';
  @override
  String get videoCacheWarningDesktop =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheWarningDesktop', {}) ??
      '[Attenzione]: Su desktop la modalità Stream potrebbe non funzionare correttamente per alcuni Booru.';
  @override
  String get deleteCacheAfter => TranslationOverrides.string(_root.$meta, 'settings.cache.deleteCacheAfter', {}) ?? 'Elimina cache dopo:';
  @override
  String get neverDeleteDuration => TranslationOverrides.string(_root.$meta, 'settings.cache.neverDeleteDuration', {}) ?? 'Mai';
  @override
  String get cacheSizeLimit => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheSizeLimit', {}) ?? 'Limite dimensione cache (in GB)';
  @override
  String get maximumTotalCacheSize =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.maximumTotalCacheSize', {}) ?? 'Dimensione massima totale della cache';
  @override
  String get cacheStats => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheStats', {}) ?? 'Statistiche cache:';
  @override
  String get loading => TranslationOverrides.string(_root.$meta, 'settings.cache.loading', {}) ?? 'Caricamento…';
  @override
  String get empty => TranslationOverrides.string(_root.$meta, 'settings.cache.empty', {}) ?? 'Vuota';
  @override
  String inFilesPlural({required String size, required int count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.inFilesPlural', {'size': size, 'count': count}) ?? '${size}, file: ${count}';
  @override
  String inFileSingular({required String size}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.inFileSingular', {'size': size}) ?? '${size}, 1 file';
  @override
  String get cacheTypeTotal => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeTotal', {}) ?? 'Totale';
  @override
  String get cacheTypeFavicons => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeFavicons', {}) ?? 'Favicon';
  @override
  String get cacheTypeThumbnails => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeThumbnails', {}) ?? 'Miniature';
  @override
  String get cacheTypeSamples => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeSamples', {}) ?? 'Sample';
  @override
  String get cacheTypeMedia => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeMedia', {}) ?? 'Media';
  @override
  String get cacheTypeWebView => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeWebView', {}) ?? 'Webview';
  @override
  String get cacheCleared => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheCleared', {}) ?? 'Cache cancellata';
  @override
  String clearedCacheType({required String type}) =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheType', {'type': type}) ?? 'Cache ${type} cancellata';
  @override
  String get clearAllCache => TranslationOverrides.string(_root.$meta, 'settings.cache.clearAllCache', {}) ?? 'Cancella tutta la cache';
  @override
  String get clearedCacheCompletely =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheCompletely', {}) ?? 'Cache completamente cancellata';
  @override
  String get appRestartRequired =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.appRestartRequired', {}) ?? 'Potrebbe essere necessario riavviare l\'app!';
  @override
  String get errorExclamation => TranslationOverrides.string(_root.$meta, 'settings.cache.errorExclamation', {}) ?? 'Errore!';
  @override
  String get notAvailableForPlatform =>
      TranslationOverrides.string(_root.$meta, 'settings.cache.notAvailableForPlatform', {}) ?? 'Attualmente non disponibile per questa piattaforma';
}

// Path: settings.itemFilters
class _Translations$settings$itemFilters$it_IT extends Translations$settings$itemFilters$en {
  _Translations$settings$itemFilters$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.title', {}) ?? 'Filtri';
  @override
  String get hidden => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.hidden', {}) ?? 'Nascosto';
  @override
  String get marked => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.marked', {}) ?? 'Contrassegnato';
  @override
  String get duplicateFilter => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.duplicateFilter', {}) ?? 'Filtro duplicato';
  @override
  String alreadyInList({required String tag, required String type}) =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.alreadyInList', {'tag': tag, 'type': type}) ??
      '\'${tag}\' è già nella lista ${type}';
  @override
  String get noFiltersFound => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersFound', {}) ?? 'Nessun filtro trovato';
  @override
  String get noFiltersAdded => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersAdded', {}) ?? 'Nessun filtro aggiunto';
  @override
  String get removeHidden =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeHidden', {}) ??
      'Nascondi completamente gli elementi che corrispondono ai filtri Nascosti';
  @override
  String get removeMarked =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeMarked', {}) ??
      'Nascondi completamente gli elementi che corrispondono ai filtri Contrassegnati';
  @override
  String get removeFavourited =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeFavourited', {}) ?? 'Nascondi gli elementi preferiti';
  @override
  String get removeSnatched =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeSnatched', {}) ?? 'Nascondi gli elementi già scaricati';
  @override
  String get removeAI =>
      TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeAI', {}) ?? 'Nascondi gli elementi contrassegnati come generati dall\'IA';
}

// Path: settings.sync
class _Translations$settings$sync$it_IT extends Translations$settings$sync$en {
  _Translations$settings$sync$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? 'LoliSync';
  @override
  String get dbError =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ?? 'Il database deve essere abilitato per usare LoliSync';
  @override
  String get errorTitle => TranslationOverrides.string(_root.$meta, 'settings.sync.errorTitle', {}) ?? 'Errore!';
  @override
  String get pleaseEnterIPAndPort =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.pleaseEnterIPAndPort', {}) ?? 'Inserisci indirizzo IP e porta.';
  @override
  String get selectWhatYouWantToDo =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.selectWhatYouWantToDo', {}) ?? 'Seleziona cosa vuoi fare';
  @override
  String get sendDataToDevice =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.sendDataToDevice', {}) ?? 'INVIA dati AD un altro dispositivo';
  @override
  String get receiveDataFromDevice =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.receiveDataFromDevice', {}) ?? 'RICEVI dati DA un altro dispositivo';
  @override
  String get senderInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.senderInstructions', {}) ??
      'Avvia il server sull\'altro dispositivo, inserisci il suo IP/porta, poi tocca Inizia sincronizzazione';
  @override
  String get ipAddress => TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddress', {}) ?? 'Indirizzo IP';
  @override
  String get ipAddressPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddressPlaceholder', {}) ?? 'Indirizzo IP Host (es. 192.168.1.1)';
  @override
  String get port => TranslationOverrides.string(_root.$meta, 'settings.sync.port', {}) ?? 'Porta';
  @override
  String get portPlaceholder => TranslationOverrides.string(_root.$meta, 'settings.sync.portPlaceholder', {}) ?? 'Porta Host (es. 7777)';
  @override
  String get sendFavourites => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavourites', {}) ?? 'Invia preferiti';
  @override
  String favouritesCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.favouritesCount', {'count': count}) ?? 'Preferiti: ${count}';
  @override
  String get sendFavouritesLegacy => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavouritesLegacy', {}) ?? 'Invia preferiti (Legacy)';
  @override
  String get syncFavsFrom => TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFrom', {}) ?? 'Sincronizza preferiti da #…';
  @override
  String get syncFavsFromHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText1', {}) ??
      'Permette di impostare da dove deve iniziare la sincronizzazione, utile se hai già sincronizzato tutti i tuoi preferiti e vuoi sincronizzare solo i più recenti';
  @override
  String get syncFavsFromHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText2', {}) ??
      'Se vuoi sincronizzare dall\'inizio lascia questo campo vuoto';
  @override
  String get syncFavsFromHelpText3 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText3', {}) ??
      'Esempio: Hai X preferiti, imposta questo campo a 100, la sincronizzazione inizierà dall\'elemento #100 fino a raggiungere X';
  @override
  String get syncFavsFromHelpText4 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText4', {}) ??
      'Ordine dei preferiti: dal meno recente (0) al più recente (X)';
  @override
  String get sendSnatchedHistory =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.sendSnatchedHistory', {}) ?? 'Invia la cronologia dei download';
  @override
  String snatchedCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.snatchedCount', {'count': count}) ?? 'Scaricati: ${count}';
  @override
  String get syncSnatchedFrom => TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFrom', {}) ?? 'Sincronizza scaricati da #…';
  @override
  String get syncSnatchedFromHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText1', {}) ??
      'Permette di impostare da dove deve iniziare la sincronizzazione, utile se hai già sincronizzato la cronologia dei download e vuoi sincronizzare solo i più recenti';
  @override
  String get syncSnatchedFromHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText2', {}) ??
      'Se vuoi sincronizzare dall\'inizio lascia questo campo vuoto';
  @override
  String get syncSnatchedFromHelpText3 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText3', {}) ??
      'Esempio: Hai X elementi scaricati, imposta questo campo a 100, la sincronizzazione inizierà dall\'elemento #100 fino a raggiungere X';
  @override
  String get syncSnatchedFromHelpText4 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText4', {}) ??
      'Ordine dei download: Dal più vecchio (0) al più recente (X)';
  @override
  String get sendSettings => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSettings', {}) ?? 'Invia impostazioni';
  @override
  String get sendBooruConfigs => TranslationOverrides.string(_root.$meta, 'settings.sync.sendBooruConfigs', {}) ?? 'Invia configurazioni booru';
  @override
  String configsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.configsCount', {'count': count}) ?? 'Configurazioni: ${count}';
  @override
  String get sendTabs => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTabs', {}) ?? 'Invia schede';
  @override
  String tabsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsCount', {'count': count}) ?? 'Schede: ${count}';
  @override
  String get tabsSyncMode => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncMode', {}) ?? 'Modalità sincronizzazione schede';
  @override
  String get tabsSyncModeMerge =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeMerge', {}) ??
      'Unisci: aggiungi le schede di questo dispositivo a quelle dell\'altro. Le schede già presenti e quelle associate a booru sconosciuti verranno ignorate.';
  @override
  String get tabsSyncModeReplace =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeReplace', {}) ??
      'Sostituisci: Sostituisci completamente le schede sull\'altro dispositivo con le schede di questo';
  @override
  String get merge => TranslationOverrides.string(_root.$meta, 'settings.sync.merge', {}) ?? 'Unisci';
  @override
  String get replace => TranslationOverrides.string(_root.$meta, 'settings.sync.replace', {}) ?? 'Sostituisci';
  @override
  String get sendTags => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTags', {}) ?? 'Invia tag';
  @override
  String tagsCount({required String count}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsCount', {'count': count}) ?? 'Tag: ${count}';
  @override
  String get tagsSyncMode => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncMode', {}) ?? 'Modalità sincronizzazione tag';
  @override
  String get tagsSyncModePreferTypeIfNone =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModePreferTypeIfNone', {}) ??
      'Conserva il tipo esistente: durante l\'importazione, non sovrascrivere un tipo di tag noto con uno sconosciuto.';
  @override
  String get tagsSyncModeOverwrite =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModeOverwrite', {}) ??
      'Sovrascrivi: tutti i tag verranno aggiunti. Se un tag esiste già sull\'altro dispositivo, i suoi dati e il suo tipo verranno sovrascritti.';
  @override
  String get preferTypeIfNone => TranslationOverrides.string(_root.$meta, 'settings.sync.preferTypeIfNone', {}) ?? 'Preserva tipo';
  @override
  String get overwrite => TranslationOverrides.string(_root.$meta, 'settings.sync.overwrite', {}) ?? 'Sovrascrivi';
  @override
  String get testConnection => TranslationOverrides.string(_root.$meta, 'settings.sync.testConnection', {}) ?? 'Testa connessione';
  @override
  String get testConnectionHelpText1 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText1', {}) ?? 'Invia una richiesta di test all\'altro dispositivo.';
  @override
  String get testConnectionHelpText2 =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText2', {}) ?? 'Mostra notifica di successo/fallimento.';
  @override
  String get startSync => TranslationOverrides.string(_root.$meta, 'settings.sync.startSync', {}) ?? 'Inizia sincronizzazione';
  @override
  String get portAndIPCannotBeEmpty =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.portAndIPCannotBeEmpty', {}) ?? 'I campi Porta e IP non possono essere vuoti!';
  @override
  String get nothingSelectedToSync =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.nothingSelectedToSync', {}) ?? 'Non hai selezionato nulla da sincronizzare!';
  @override
  String get statsOfThisDevice =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.statsOfThisDevice', {}) ?? 'Statistiche di questo dispositivo:';
  @override
  String get receiverInstructions =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.receiverInstructions', {}) ??
      'Avvia il server per ricevere dati. Evita WiFi pubblici per sicurezza';
  @override
  String get availableNetworkInterfaces =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.availableNetworkInterfaces', {}) ?? 'Interfacce di rete disponibili';
  @override
  String selectedInterfaceIP({required String ip}) =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.selectedInterfaceIP', {'ip': ip}) ?? 'IP interfaccia selezionata: ${ip}';
  @override
  String get serverPort => TranslationOverrides.string(_root.$meta, 'settings.sync.serverPort', {}) ?? 'Porta server';
  @override
  String get serverPortPlaceholder =>
      TranslationOverrides.string(_root.$meta, 'settings.sync.serverPortPlaceholder', {}) ?? '(sarà \'8080\' come predefinito se vuoto)';
  @override
  String get startReceiverServer => TranslationOverrides.string(_root.$meta, 'settings.sync.startReceiverServer', {}) ?? 'Avvia server ricevitore';
}

// Path: settings.about
class _Translations$settings$about$it_IT extends Translations$settings$about$en {
  _Translations$settings$about$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.about.title', {}) ?? 'Informazioni';
  @override
  String get appDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ??
      'LoliSnatcher è open source e rilasciato con licenza GPLv3, il codice sorgente è disponibile su github. Segnala eventuali problemi o richieste di funzionalità nella sezione issues della repo.';
  @override
  String get appOnGitHub => TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? 'LoliSnatcher su Github';
  @override
  String get contact => TranslationOverrides.string(_root.$meta, 'settings.about.contact', {}) ?? 'Contatti';
  @override
  String get emailCopied => TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? 'Email copiata negli appunti';
  @override
  String get logoArtistThanks =>
      TranslationOverrides.string(_root.$meta, 'settings.about.logoArtistThanks', {}) ??
      'Un grande ringraziamento a Showers-U per averci permesso di utilizzare le loro illustrazioni per il logo dell\'app. Dai un\'occhiata al loro Pixiv';
  @override
  String get developers => TranslationOverrides.string(_root.$meta, 'settings.about.developers', {}) ?? 'Sviluppatori';
  @override
  String get localizers => TranslationOverrides.string(_root.$meta, 'settings.about.localizers', {}) ?? 'Traduttori';
  @override
  String get releases => TranslationOverrides.string(_root.$meta, 'settings.about.releases', {}) ?? 'Rilasci';
  @override
  String get releasesMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.about.releasesMsg', {}) ??
      'L\'ultima versione e i changelog completi possono essere trovati alla pagina Github Releases:';
  @override
  String get licenses => TranslationOverrides.string(_root.$meta, 'settings.about.licenses', {}) ?? 'Licenze';
}

// Path: settings.checkForUpdates
class _Translations$settings$checkForUpdates$it_IT extends Translations$settings$checkForUpdates$en {
  _Translations$settings$checkForUpdates$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.title', {}) ?? 'Controlla aggiornamenti';
  @override
  String get updateAvailable =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateAvailable', {}) ?? 'Aggiornamento disponibile!';
  @override
  String get whatsNew => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.whatsNew', {}) ?? 'Novità';
  @override
  String get updateChangelog =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? 'Changelog dell\'aggiornamento';
  @override
  String get updateCheckError =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? 'Errore controllo aggiornamenti!';
  @override
  String get youHaveLatestVersion =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? 'Hai l\'ultima versione';
  @override
  String get viewLatestChangelog =>
      TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ?? 'Visualizza l\'ultimo changelog';
  @override
  String get currentVersion => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? 'Versione corrente';
  @override
  String get changelog => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? 'Changelog';
  @override
  String get visitPlayStore => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? 'Visita il Play Store';
  @override
  String get visitReleases => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? 'Visita i rilasci';
}

// Path: settings.logs
class _Translations$settings$logs$it_IT extends Translations$settings$logs$en {
  _Translations$settings$logs$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.logs.title', {}) ?? 'Log';
  @override
  String get shareLogs => TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogs', {}) ?? 'Condividi log';
  @override
  String get shareLogsWarningTitle =>
      TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningTitle', {}) ?? 'Condividere i log su un\'app esterna?';
  @override
  String get shareLogsWarningMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningMsg', {}) ??
      '[ATTENZIONE]: I log potrebbero contenere informazioni sensibili, condividi con cautela!';
}

// Path: settings.help
class _Translations$settings$help$it_IT extends Translations$settings$help$en {
  _Translations$settings$help$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? 'Aiuto';
}

// Path: settings.debug
class _Translations$settings$debug$it_IT extends Translations$settings$debug$en {
  _Translations$settings$debug$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.debug.title', {}) ?? 'Debug';
  @override
  String get enabledSnackbarMsg => TranslationOverrides.string(_root.$meta, 'settings.debug.enabledSnackbarMsg', {}) ?? 'Modalità debug abilitata!';
  @override
  String get disabledSnackbarMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.disabledSnackbarMsg', {}) ?? 'Modalità debug disabilitata!';
  @override
  String get alreadyEnabledSnackbarMsg =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.alreadyEnabledSnackbarMsg', {}) ?? 'La modalità debug è già abilitata!';
  @override
  String get showPerformanceGraph =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.showPerformanceGraph', {}) ?? 'Mostra grafico prestazioni';
  @override
  String get showFPSGraph => TranslationOverrides.string(_root.$meta, 'settings.debug.showFPSGraph', {}) ?? 'Mostra grafico FPS';
  @override
  String get showImageStats => TranslationOverrides.string(_root.$meta, 'settings.debug.showImageStats', {}) ?? 'Mostra statistiche immagini';
  @override
  String get showVideoStats => TranslationOverrides.string(_root.$meta, 'settings.debug.showVideoStats', {}) ?? 'Mostra statistiche video';
  @override
  String get blurImagesAndMuteVideosDevOnly =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.blurImagesAndMuteVideosDevOnly', {}) ??
      'Sfoca le immagini + silenzia i video [solo sviluppatori]';
  @override
  String get enableDragScrollOnListsDesktopOnly =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.enableDragScrollOnListsDesktopOnly', {}) ??
      'Abilita scorrimento tramite trascinamento nelle liste [Solo Desktop]';
  @override
  String animationSpeed({required double speed}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.animationSpeed', {'speed': speed}) ?? 'Velocità animazione (${speed})';
  @override
  String get tagsManager => TranslationOverrides.string(_root.$meta, 'settings.debug.tagsManager', {}) ?? 'Gestore Tag';
  @override
  String resolution({required String width, required String height}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.resolution', {'width': width, 'height': height}) ?? 'Ris: ${width}x${height}';
  @override
  String pixelRatio({required String ratio}) =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.pixelRatio', {'ratio': ratio}) ?? 'Rapporto pixel: ${ratio}';
  @override
  String get logger => TranslationOverrides.string(_root.$meta, 'settings.debug.logger', {}) ?? 'Logger';
  @override
  String get webview => TranslationOverrides.string(_root.$meta, 'settings.debug.webview', {}) ?? 'Webview';
  @override
  String get deleteAllCookies => TranslationOverrides.string(_root.$meta, 'settings.debug.deleteAllCookies', {}) ?? 'Elimina tutti i cookie';
  @override
  String get clearSecureStorage => TranslationOverrides.string(_root.$meta, 'settings.debug.clearSecureStorage', {}) ?? 'Svuota archiviazione sicura';
  @override
  String get getSessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.getSessionString', {}) ?? 'Ottieni stringa di sessione';
  @override
  String get setSessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.setSessionString', {}) ?? 'Imposta stringa di sessione';
  @override
  String get sessionString => TranslationOverrides.string(_root.$meta, 'settings.debug.sessionString', {}) ?? 'Stringa di sessione';
  @override
  String get restoredSessionFromString =>
      TranslationOverrides.string(_root.$meta, 'settings.debug.restoredSessionFromString', {}) ?? 'Sessione ripristinata da stringa';
}

// Path: settings.logging
class _Translations$settings$logging$it_IT extends Translations$settings$logging$en {
  _Translations$settings$logging$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get logger => TranslationOverrides.string(_root.$meta, 'settings.logging.logger', {}) ?? 'Logger';
  @override
  String get captureLogcat => TranslationOverrides.string(_root.$meta, 'settings.logging.captureLogcat', {}) ?? 'Cattura logcat Android';
  @override
  String get captureLogcatDescription =>
      TranslationOverrides.string(_root.$meta, 'settings.logging.captureLogcatDescription', {}) ??
      'Registra avvisi e messaggi di errore del processo Android dell\'app';
}

// Path: settings.webview
class _Translations$settings$webview$it_IT extends Translations$settings$webview$en {
  _Translations$settings$webview$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get openWebview => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? 'Apri webview';
  @override
  String get openWebviewTip => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? 'per accedere o ottenere cookie';
}

// Path: settings.dirPicker
class _Translations$settings$dirPicker$it_IT extends Translations$settings$dirPicker$en {
  _Translations$settings$dirPicker$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get directoryName => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryName', {}) ?? 'Nome cartella';
  @override
  String get selectADirectory => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.selectADirectory', {}) ?? 'Seleziona una cartella';
  @override
  String get closeWithoutChoosing =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.closeWithoutChoosing', {}) ??
      'Vuoi chiudere il selettore senza scegliere una cartella?';
  @override
  String get no => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.no', {}) ?? 'No';
  @override
  String get yes => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.yes', {}) ?? 'Sì';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.error', {}) ?? 'Errore!';
  @override
  String get failedToCreateDirectory =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.failedToCreateDirectory', {}) ?? 'Impossibile creare cartella';
  @override
  String get directoryNotWritable =>
      TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryNotWritable', {}) ?? 'La cartella non è scrivibile!';
  @override
  String get newDirectory => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.newDirectory', {}) ?? 'Nuova cartella';
  @override
  String get create => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.create', {}) ?? 'Crea';
}

// Path: viewer.tutorial
class _Translations$viewer$tutorial$it_IT extends Translations$viewer$tutorial$en {
  _Translations$viewer$tutorial$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get images => TranslationOverrides.string(_root.$meta, 'viewer.tutorial.images', {}) ?? 'Immagini';
  @override
  String get tapLongTapToggleImmersive =>
      TranslationOverrides.string(_root.$meta, 'viewer.tutorial.tapLongTapToggleImmersive', {}) ?? 'Tocco/Tocco lungo: alterna modalità immersiva';
  @override
  String get doubleTapFitScreen =>
      TranslationOverrides.string(_root.$meta, 'viewer.tutorial.doubleTapFitScreen', {}) ??
      'Doppio tocco: adatta allo schermo / dimensione originale / reset zoom';
}

// Path: viewer.appBar
class _Translations$viewer$appBar$it_IT extends Translations$viewer$appBar$en {
  _Translations$viewer$appBar$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get cantStartSlideshow =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.cantStartSlideshow', {}) ?? 'Impossibile avviare la Presentazione';
  @override
  String get reachedLastLoadedItem =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.reachedLastLoadedItem', {}) ?? 'Raggiunto l\'ultimo elemento caricato';
  @override
  String get pause => TranslationOverrides.string(_root.$meta, 'viewer.appBar.pause', {}) ?? 'Pausa';
  @override
  String get start => TranslationOverrides.string(_root.$meta, 'viewer.appBar.start', {}) ?? 'Avvia';
  @override
  String get unfavourite => TranslationOverrides.string(_root.$meta, 'viewer.appBar.unfavourite', {}) ?? 'Rimuovi dai preferiti';
  @override
  String get deselect => TranslationOverrides.string(_root.$meta, 'viewer.appBar.deselect', {}) ?? 'Deseleziona';
  @override
  String get reloadWithScaling => TranslationOverrides.string(_root.$meta, 'viewer.appBar.reloadWithScaling', {}) ?? 'Ricarica con ridimensionamento';
  @override
  String get loadSampleQuality =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadSampleQuality', {}) ?? 'Carica la versione a risoluzione ridotta';
  @override
  String get loadHighQuality => TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadHighQuality', {}) ?? 'Carica in alta qualità';
  @override
  String get dropSnatchedStatus =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.dropSnatchedStatus', {}) ?? 'Rimuovi il contrassegno «Scaricato»';
  @override
  String get setSnatchedStatus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.setSnatchedStatus', {}) ?? 'Segna come scaricato';
  @override
  String get snatch => TranslationOverrides.string(_root.$meta, 'viewer.appBar.snatch', {}) ?? 'Scarica';
  @override
  String get forced => TranslationOverrides.string(_root.$meta, 'viewer.appBar.forced', {}) ?? '(forzato)';
  @override
  String get hydrusShare => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusShare', {}) ?? 'Condividi su Hydrus';
  @override
  String get whichUrlToShareToHydrus =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.whichUrlToShareToHydrus', {}) ?? 'Quale URL vuoi condividere su Hydrus?';
  @override
  String get postURL => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURL', {}) ?? 'URL Post';
  @override
  String get fileURL => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURL', {}) ?? 'URL File';
  @override
  String get hydrusNotConfigured => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusNotConfigured', {}) ?? 'Hydrus non è configurato!';
  @override
  String get shareFile => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareFile', {}) ?? 'Condividi file';
  @override
  String get alreadyDownloadingThisFile =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingThisFile', {}) ??
      'Sto già scaricando questo file per la condivisione, vuoi annullare?';
  @override
  String get alreadyDownloadingFile =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingFile', {}) ??
      'È già in corso il download di un file da condividere. Vuoi annullare il download corrente e condividere un altro file?';
  @override
  String get current => TranslationOverrides.string(_root.$meta, 'viewer.appBar.current', {}) ?? 'Attuale:';
  @override
  String get kNew => TranslationOverrides.string(_root.$meta, 'viewer.appBar.kNew', {}) ?? 'Nuovo:';
  @override
  String get shareNew => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareNew', {}) ?? 'Condividi nuovo';
  @override
  String get abort => TranslationOverrides.string(_root.$meta, 'viewer.appBar.abort', {}) ?? 'Annulla';
  @override
  String get error => TranslationOverrides.string(_root.$meta, 'viewer.appBar.error', {}) ?? 'Errore!';
  @override
  String get savingFileError =>
      TranslationOverrides.string(_root.$meta, 'viewer.appBar.savingFileError', {}) ??
      'Qualcosa è andato storto salvando il File prima della Condivisione';
  @override
  String get whatToShare => TranslationOverrides.string(_root.$meta, 'viewer.appBar.whatToShare', {}) ?? 'Cosa vuoi condividere?';
  @override
  String get postURLWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURLWithTags', {}) ?? 'URL Post con tag';
  @override
  String get fileURLWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURLWithTags', {}) ?? 'URL File con tag';
  @override
  String get file => TranslationOverrides.string(_root.$meta, 'viewer.appBar.file', {}) ?? 'File';
  @override
  String get fileWithTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileWithTags', {}) ?? 'File con tag';
  @override
  String get hydrus => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrus', {}) ?? 'Hydrus';
  @override
  String get selectTags => TranslationOverrides.string(_root.$meta, 'viewer.appBar.selectTags', {}) ?? 'Seleziona tag';
}

// Path: viewer.notes
class _Translations$viewer$notes$it_IT extends Translations$viewer$notes$en {
  _Translations$viewer$notes$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get note => TranslationOverrides.string(_root.$meta, 'viewer.notes.note', {}) ?? 'Nota';
  @override
  String get notes => TranslationOverrides.string(_root.$meta, 'viewer.notes.notes', {}) ?? 'Note';
  @override
  String coordinates({required int posX, required int posY}) =>
      TranslationOverrides.string(_root.$meta, 'viewer.notes.coordinates', {'posX': posX, 'posY': posY}) ?? 'X:${posX}, Y:${posY}';
}

// Path: media.loading
class _Translations$media$loading$it_IT extends Translations$media$loading$en {
  _Translations$media$loading$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get rendering => TranslationOverrides.string(_root.$meta, 'media.loading.rendering', {}) ?? 'Rendering…';
  @override
  String get loadingAndRenderingFromCache =>
      TranslationOverrides.string(_root.$meta, 'media.loading.loadingAndRenderingFromCache', {}) ?? 'Caricamento e rendering dalla cache…';
  @override
  String get loadingFromCache => TranslationOverrides.string(_root.$meta, 'media.loading.loadingFromCache', {}) ?? 'Caricamento dalla cache…';
  @override
  String get buffering => TranslationOverrides.string(_root.$meta, 'media.loading.buffering', {}) ?? 'Buffering…';
  @override
  String get loading => TranslationOverrides.string(_root.$meta, 'media.loading.loading', {}) ?? 'Caricamento…';
  @override
  String get loadAnyway => TranslationOverrides.string(_root.$meta, 'media.loading.loadAnyway', {}) ?? 'Carica comunque';
  @override
  String get restartLoading => TranslationOverrides.string(_root.$meta, 'media.loading.restartLoading', {}) ?? 'Riavvia caricamento';
  @override
  String get stopLoading => TranslationOverrides.string(_root.$meta, 'media.loading.stopLoading', {}) ?? 'Ferma caricamento';
  @override
  String startedSecondsAgo({required int seconds}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.startedSecondsAgo', {'seconds': seconds}) ?? 'Iniziato ${seconds}s fa';
  @override
  late final _Translations$media$loading$stopReasons$it_IT stopReasons = _Translations$media$loading$stopReasons$it_IT._(_root);
  @override
  String get fileIsZeroBytes =>
      TranslationOverrides.string(_root.$meta, 'media.loading.fileIsZeroBytes', {}) ?? 'Il file ha una dimensione di 0 byte';
  @override
  String fileSize({required String size}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.fileSize', {'size': size}) ?? 'Dimensione file: ${size}';
  @override
  String sizeLimit({required String limit}) =>
      TranslationOverrides.string(_root.$meta, 'media.loading.sizeLimit', {'limit': limit}) ?? 'Limite: ${limit}';
  @override
  String get tryChangingVideoBackend =>
      TranslationOverrides.string(_root.$meta, 'media.loading.tryChangingVideoBackend', {}) ??
      'Problemi di riproduzione frequenti? Prova a cambiare [Impostazioni > Video > Backend del lettore video]';
}

// Path: media.video
class _Translations$media$video$it_IT extends Translations$media$video$en {
  _Translations$media$video$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get videosDisabledOrNotSupported =>
      TranslationOverrides.string(_root.$meta, 'media.video.videosDisabledOrNotSupported', {}) ?? 'Video disabilitati o non supportati';
  @override
  String get openVideoInExternalPlayer =>
      TranslationOverrides.string(_root.$meta, 'media.video.openVideoInExternalPlayer', {}) ?? 'Apri video nel lettore esterno';
  @override
  String get openVideoInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openVideoInBrowser', {}) ?? 'Apri video nel browser';
  @override
  String get failedToLoadItemData =>
      TranslationOverrides.string(_root.$meta, 'media.video.failedToLoadItemData', {}) ?? 'Impossibile caricare i dati dell\'elemento';
  @override
  String get loadingItemData => TranslationOverrides.string(_root.$meta, 'media.video.loadingItemData', {}) ?? 'Caricamento dati elemento…';
  @override
  String get retry => TranslationOverrides.string(_root.$meta, 'media.video.retry', {}) ?? 'Riprova';
  @override
  String get openFileInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openFileInBrowser', {}) ?? 'Apri file nel browser';
  @override
  String get openPostInBrowser => TranslationOverrides.string(_root.$meta, 'media.video.openPostInBrowser', {}) ?? 'Apri post nel browser';
  @override
  String get currentlyChecking => TranslationOverrides.string(_root.$meta, 'media.video.currentlyChecking', {}) ?? 'Controllo in corso:';
  @override
  String unknownFileFormat({required String fileExt}) =>
      TranslationOverrides.string(_root.$meta, 'media.video.unknownFileFormat', {'fileExt': fileExt}) ??
      'Formato file sconosciuto (.${fileExt}), tocca qui per aprire nel browser';
}

// Path: preview.error
class _Translations$preview$error$it_IT extends Translations$preview$error$en {
  _Translations$preview$error$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get noResults => TranslationOverrides.string(_root.$meta, 'preview.error.noResults', {}) ?? 'Nessun risultato';
  @override
  String get noResultsSubtitle =>
      TranslationOverrides.string(_root.$meta, 'preview.error.noResultsSubtitle', {}) ?? 'Cambia la query di ricerca o tocca per riprovare';
  @override
  String get reachedEnd => TranslationOverrides.string(_root.$meta, 'preview.error.reachedEnd', {}) ?? 'Hai raggiunto la fine';
  @override
  String reachedEndSubtitle({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.reachedEndSubtitle', {'pageNum': pageNum}) ??
      'Pagine caricate: ${pageNum}\nTocca qui per ricaricare l\'ultima pagina';
  @override
  String loadingPage({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.loadingPage', {'pageNum': pageNum}) ?? 'Caricamento pagina #${pageNum}…';
  @override
  String startedAgo({required num seconds}) =>
      TranslationOverrides.plural(_root.$meta, 'preview.error.startedAgo', {'seconds': seconds}) ??
      (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
        seconds,
        one: 'Iniziato ${seconds} secondo fa',
        many: 'Iniziato ${seconds} secondi fa',
        other: 'Iniziato ${seconds} secondi fa',
      );
  @override
  String get tapToRetryIfStuck =>
      TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetryIfStuck', {}) ??
      'Tocca per riprovare se la richiesta sembra bloccata o impiega troppo tempo';
  @override
  String errorLoadingPage({required int pageNum}) =>
      TranslationOverrides.string(_root.$meta, 'preview.error.errorLoadingPage', {'pageNum': pageNum}) ?? 'Errore caricamento pagina #${pageNum}';
  @override
  String get errorWithMessage => TranslationOverrides.string(_root.$meta, 'preview.error.errorWithMessage', {}) ?? 'Tocca qui per riprovare';
  @override
  String get errorNoResultsLoaded =>
      TranslationOverrides.string(_root.$meta, 'preview.error.errorNoResultsLoaded', {}) ?? 'Errore, nessun risultato caricato';
  @override
  String get tapToRetry => TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetry', {}) ?? 'Tocca qui per riprovare';
}

// Path: settings.interface.previewQualityValues
class _Translations$settings$interface$previewQualityValues$it_IT extends Translations$settings$interface$previewQualityValues$en {
  _Translations$settings$interface$previewQualityValues$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get thumbnail => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.thumbnail', {}) ?? 'Miniatura';
  @override
  String get sample => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.sample', {}) ?? 'Versione ridotta';
}

// Path: settings.interface.previewDisplayModeValues
class _Translations$settings$interface$previewDisplayModeValues$it_IT extends Translations$settings$interface$previewDisplayModeValues$en {
  _Translations$settings$interface$previewDisplayModeValues$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get square => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.square', {}) ?? 'Quadrato';
  @override
  String get rectangle => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.rectangle', {}) ?? 'Rettangolo';
  @override
  String get staggered => TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.staggered', {}) ?? 'A cascata';
}

// Path: settings.interface.appModeValues
class _Translations$settings$interface$appModeValues$it_IT extends Translations$settings$interface$appModeValues$en {
  _Translations$settings$interface$appModeValues$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get desktop => TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.desktop', {}) ?? 'Desktop';
  @override
  String get mobile => TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.mobile', {}) ?? 'Mobile';
}

// Path: settings.interface.handSideValues
class _Translations$settings$interface$handSideValues$it_IT extends Translations$settings$interface$handSideValues$en {
  _Translations$settings$interface$handSideValues$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get left => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.left', {}) ?? 'Sinistra';
  @override
  String get right => TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.right', {}) ?? 'Destra';
}

// Path: settings.viewer.imageQualityValues
class _Translations$settings$viewer$imageQualityValues$it_IT extends Translations$settings$viewer$imageQualityValues$en {
  _Translations$settings$viewer$imageQualityValues$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get sample => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.sample', {}) ?? 'Versione ridotta';
  @override
  String get fullRes => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.fullRes', {}) ?? 'Originale';
}

// Path: settings.viewer.scrollDirectionValues
class _Translations$settings$viewer$scrollDirectionValues$it_IT extends Translations$settings$viewer$scrollDirectionValues$en {
  _Translations$settings$viewer$scrollDirectionValues$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get horizontal => TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.horizontal', {}) ?? 'Orizzontale';
  @override
  String get vertical => TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.vertical', {}) ?? 'Verticale';
}

// Path: settings.viewer.toolbarPositionValues
class _Translations$settings$viewer$toolbarPositionValues$it_IT extends Translations$settings$viewer$toolbarPositionValues$en {
  _Translations$settings$viewer$toolbarPositionValues$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get top => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.top', {}) ?? 'In alto';
  @override
  String get bottom => TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.bottom', {}) ?? 'In basso';
}

// Path: settings.viewer.buttonPositionValues
class _Translations$settings$viewer$buttonPositionValues$it_IT extends Translations$settings$viewer$buttonPositionValues$en {
  _Translations$settings$viewer$buttonPositionValues$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get disabled => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.disabled', {}) ?? 'Disabilitato';
  @override
  String get left => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.left', {}) ?? 'Sinistra';
  @override
  String get right => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.right', {}) ?? 'Destra';
}

// Path: settings.viewer.shareActionValues
class _Translations$settings$viewer$shareActionValues$it_IT extends Translations$settings$viewer$shareActionValues$en {
  _Translations$settings$viewer$shareActionValues$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get ask => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.ask', {}) ?? 'Chiedi';
  @override
  String get postUrl => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrl', {}) ?? 'URL del post';
  @override
  String get postUrlWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrlWithTags', {}) ?? 'URL del post con tag';
  @override
  String get fileUrl => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrl', {}) ?? 'URL del file';
  @override
  String get fileUrlWithTags =>
      TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrlWithTags', {}) ?? 'URL del file con tag';
  @override
  String get file => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.file', {}) ?? 'File';
  @override
  String get fileWithTags => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileWithTags', {}) ?? 'File con tag';
  @override
  String get hydrus => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.hydrus', {}) ?? 'Hydrus';
}

// Path: settings.video.cacheModes
class _Translations$settings$video$cacheModes$it_IT extends Translations$settings$video$cacheModes$en {
  _Translations$settings$video$cacheModes$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get title => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.title', {}) ?? 'Modalità di cache video';
  @override
  String get streamMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamMode', {}) ??
      '- Stream - Non salvare in cache, avvia la riproduzione il prima possibile';
  @override
  String get cacheMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheMode', {}) ??
      '- Cache - Salva il file nella memoria del dispositivo, si riproduce solo al completamento del download';
  @override
  String get streamCacheMode =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamCacheMode', {}) ??
      '- Stream+Cache - Un mix di entrambi, ma attualmente porta a un doppio download';
  @override
  String get cacheNote =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheNote', {}) ??
      '[Nota]: I video verranno salvati in cache solo se l\'opzione \'Metti i media in cache\' è abilitata.';
  @override
  String get desktopWarning =>
      TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.desktopWarning', {}) ??
      '[Attenzione]: Su desktop la modalità Stream potrebbe funzionare in modo errato con alcuni Booru.';
}

// Path: settings.video.cacheModeValues
class _Translations$settings$video$cacheModeValues$it_IT extends Translations$settings$video$cacheModeValues$en {
  _Translations$settings$video$cacheModeValues$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get stream => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.stream', {}) ?? 'Stream';
  @override
  String get cache => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.cache', {}) ?? 'Cache';
  @override
  String get streamCache => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.streamCache', {}) ?? 'Stream+Cache';
}

// Path: settings.video.videoBackendModeValues
class _Translations$settings$video$videoBackendModeValues$it_IT extends Translations$settings$video$videoBackendModeValues$en {
  _Translations$settings$video$videoBackendModeValues$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get normal => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.normal', {}) ?? 'Predefinito';
  @override
  String get mpv => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mpv', {}) ?? 'MPV';
  @override
  String get mdk => TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mdk', {}) ?? 'MDK';
}

// Path: media.loading.stopReasons
class _Translations$media$loading$stopReasons$it_IT extends Translations$media$loading$stopReasons$en {
  _Translations$media$loading$stopReasons$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get stoppedByUser => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.stoppedByUser', {}) ?? 'Interrotto dall\'utente';
  @override
  String get loadingError => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.loadingError', {}) ?? 'Errore di caricamento';
  @override
  String get fileIsTooBig => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.fileIsTooBig', {}) ?? 'File troppo grande';
  @override
  String get hiddenByFilters => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.hiddenByFilters', {}) ?? 'Nascosto dai filtri:';
  @override
  String get videoError => TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.videoError', {}) ?? 'Errore video';
}

/// The flat map containing all translations for locale <it-IT>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsItIt {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
          'locale' => TranslationOverrides.string(_root.$meta, 'locale', {}) ?? 'it-IT',
          'localeName' => TranslationOverrides.string(_root.$meta, 'localeName', {}) ?? 'Italiano',
          'appName' => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'LoliSnatcher',
          'error' => TranslationOverrides.string(_root.$meta, 'error', {}) ?? 'Errore',
          'errorExclamation' => TranslationOverrides.string(_root.$meta, 'errorExclamation', {}) ?? 'Errore!',
          'success' => TranslationOverrides.string(_root.$meta, 'success', {}) ?? 'Successo',
          'successExclamation' => TranslationOverrides.string(_root.$meta, 'successExclamation', {}) ?? 'Successo!',
          'cancel' => TranslationOverrides.string(_root.$meta, 'cancel', {}) ?? 'Annulla',
          'kReturn' => TranslationOverrides.string(_root.$meta, 'kReturn', {}) ?? 'Indietro',
          'later' => TranslationOverrides.string(_root.$meta, 'later', {}) ?? 'Dopo',
          'close' => TranslationOverrides.string(_root.$meta, 'close', {}) ?? 'Chiudi',
          'ok' => TranslationOverrides.string(_root.$meta, 'ok', {}) ?? 'Ok',
          'yes' => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Sì',
          'no' => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'No',
          'pleaseWait' => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Attendere prego…',
          'show' => TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Mostra',
          'hide' => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Nascondi',
          'enable' => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'Abilita',
          'disable' => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Disabilita',
          'add' => TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Aggiungi',
          'exclude' => TranslationOverrides.string(_root.$meta, 'exclude', {}) ?? 'Escludi',
          'edit' => TranslationOverrides.string(_root.$meta, 'edit', {}) ?? 'Modifica',
          'remove' => TranslationOverrides.string(_root.$meta, 'remove', {}) ?? 'Rimuovi',
          'save' => TranslationOverrides.string(_root.$meta, 'save', {}) ?? 'Salva',
          'delete' => TranslationOverrides.string(_root.$meta, 'delete', {}) ?? 'Elimina',
          'confirm' => TranslationOverrides.string(_root.$meta, 'confirm', {}) ?? 'Conferma',
          'retry' => TranslationOverrides.string(_root.$meta, 'retry', {}) ?? 'Riprova',
          'clear' => TranslationOverrides.string(_root.$meta, 'clear', {}) ?? 'Pulisci',
          'copy' => TranslationOverrides.string(_root.$meta, 'copy', {}) ?? 'Copia',
          'copied' => TranslationOverrides.string(_root.$meta, 'copied', {}) ?? 'Copiato',
          'copiedToClipboard' => TranslationOverrides.string(_root.$meta, 'copiedToClipboard', {}) ?? 'Copiato negli appunti',
          'nothingFound' => TranslationOverrides.string(_root.$meta, 'nothingFound', {}) ?? 'Nessun risultato',
          'paste' => TranslationOverrides.string(_root.$meta, 'paste', {}) ?? 'Incolla',
          'copyErrorText' => TranslationOverrides.string(_root.$meta, 'copyErrorText', {}) ?? 'Copia errore',
          'booru' => TranslationOverrides.string(_root.$meta, 'booru', {}) ?? 'Booru',
          'goToSettings' => TranslationOverrides.string(_root.$meta, 'goToSettings', {}) ?? 'Impostazioni',
          'thisMayTakeSomeTime' => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'Potrebbe richiedere un po\' di tempo…',
          'exitTheAppQuestion' => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? 'Chiudere l\'app?',
          'closeTheApp' => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Chiudi applicazione',
          'invalidUrl' => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'URL non valido!',
          'clipboardIsEmpty' => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'Appunti vuoti!',
          'failedToOpenLink' => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'Impossibile aprire il link',
          'apiKey' => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'Chiave API',
          'userId' => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'ID Utente',
          'login' => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Nome utente',
          'password' => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Password',
          'pause' => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Metti in pausa',
          'resume' => TranslationOverrides.string(_root.$meta, 'resume', {}) ?? 'Riprendi',
          'discord' => TranslationOverrides.string(_root.$meta, 'discord', {}) ?? 'Discord',
          'visitOurDiscord' => TranslationOverrides.string(_root.$meta, 'visitOurDiscord', {}) ?? 'Visita il nostro server Discord',
          'item' => TranslationOverrides.string(_root.$meta, 'item', {}) ?? 'Oggetto',
          'select' => TranslationOverrides.string(_root.$meta, 'select', {}) ?? 'Seleziona',
          'selectAll' => TranslationOverrides.string(_root.$meta, 'selectAll', {}) ?? 'Seleziona tutto',
          'reset' => TranslationOverrides.string(_root.$meta, 'reset', {}) ?? 'Reset',
          'open' => TranslationOverrides.string(_root.$meta, 'open', {}) ?? 'Apri',
          'openInNewTab' => TranslationOverrides.string(_root.$meta, 'openInNewTab', {}) ?? 'Apri in nuova scheda',
          'move' => TranslationOverrides.string(_root.$meta, 'move', {}) ?? 'Sposta',
          'shuffle' => TranslationOverrides.string(_root.$meta, 'shuffle', {}) ?? 'Mischia',
          'sort' => TranslationOverrides.string(_root.$meta, 'sort', {}) ?? 'Ordina',
          'go' => TranslationOverrides.string(_root.$meta, 'go', {}) ?? 'Vai',
          'search' => TranslationOverrides.string(_root.$meta, 'search', {}) ?? 'Cerca',
          'filter' => TranslationOverrides.string(_root.$meta, 'filter', {}) ?? 'Filtra',
          'or' => TranslationOverrides.string(_root.$meta, 'or', {}) ?? 'O (~)',
          'page' => TranslationOverrides.string(_root.$meta, 'page', {}) ?? 'Pagina',
          'pageNumber' => TranslationOverrides.string(_root.$meta, 'pageNumber', {}) ?? 'Pagina #',
          'tags' => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'Tag',
          'type' => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'Tipo',
          'name' => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Nome',
          'address' => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'Indirizzo',
          'username' => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'Nome utente',
          'favourites' => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'Preferiti',
          'downloads' => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'Download',
          'secondsShort' => TranslationOverrides.string(_root.$meta, 'secondsShort', {}) ?? 's',
          'minutesShort' => TranslationOverrides.string(_root.$meta, 'minutesShort', {}) ?? 'm',
          'hoursShort' => TranslationOverrides.string(_root.$meta, 'hoursShort', {}) ?? 'h',
          'daysShort' => TranslationOverrides.string(_root.$meta, 'daysShort', {}) ?? 'g',
          'leaveThisPageQuestion' => TranslationOverrides.string(_root.$meta, 'leaveThisPageQuestion', {}) ?? 'Lasciare questa pagina?',
          'pageWillCloseAutomatically' =>
            TranslationOverrides.string(_root.$meta, 'pageWillCloseAutomatically', {}) ?? 'Questa pagina si chiuderà automaticamente',
          'stay' => TranslationOverrides.string(_root.$meta, 'stay', {}) ?? 'Rimani',
          'leaveNow' => TranslationOverrides.string(_root.$meta, 'leaveNow', {}) ?? 'Esci ora',
          'validationErrors.required' => TranslationOverrides.string(_root.$meta, 'validationErrors.required', {}) ?? 'Inserisci un valore',
          'validationErrors.invalid' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalid', {}) ?? 'Inserisci un valore valido',
          'validationErrors.invalidNumber' => TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumber', {}) ?? 'Inserisci un numero',
          'validationErrors.invalidNumericValue' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.invalidNumericValue', {}) ?? 'Inserisci un valore numerico valido',
          'validationErrors.tooSmall' => ({
            required double min,
          }) => TranslationOverrides.string(_root.$meta, 'validationErrors.tooSmall', {'min': min}) ?? 'Inserisci un valore maggiore di ${min}',
          'validationErrors.tooBig' => ({
            required double max,
          }) => TranslationOverrides.string(_root.$meta, 'validationErrors.tooBig', {'max': max}) ?? 'Inserisci un valore minore di ${max}',
          'validationErrors.rangeError' =>
            ({required double min, required double max}) =>
                TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ??
                'Inserisci un valore tra ${min} e ${max}',
          'validationErrors.greaterThanOrEqualZero' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? 'Inserisci un valore pari o maggiore di 0',
          'validationErrors.lessThan4' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? 'Inserisci un valore minore di 4',
          'validationErrors.biggerThan100' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.biggerThan100', {}) ?? 'Inserisci un valore maggiore di 100',
          'validationErrors.moreThan4ColumnsWarning' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan4ColumnsWarning', {}) ??
                'Usare più di 4 colonne può influenzare le prestazioni',
          'validationErrors.moreThan8ColumnsWarning' =>
            TranslationOverrides.string(_root.$meta, 'validationErrors.moreThan8ColumnsWarning', {}) ??
                'Usare più di 8 colonne può influenzare le prestazioni',
          'init.initError' => TranslationOverrides.string(_root.$meta, 'init.initError', {}) ?? 'Errore di inizializzazione!',
          'init.settingUpProxy' => TranslationOverrides.string(_root.$meta, 'init.settingUpProxy', {}) ?? 'Impostazione proxy…',
          'init.loadingDatabase' => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Caricamento del database…',
          'init.loadingBoorus' => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Caricamento booru…',
          'init.loadingTags' => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Caricamento tag…',
          'init.restoringTabs' => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Ripristino delle schede…',
          'permissions.localNetworkRequired' => TranslationOverrides.string(_root.$meta, 'permissions.localNetworkRequired', {}) ?? 'Per aprire questo indirizzo è necessario l\'accesso alla rete locale. Concedi l\'autorizzazione «Dispositivi nelle vicinanze», poi riprova.',
          'permissions.localNetworkExplanationTitle' =>
            TranslationOverrides.string(_root.$meta, 'permissions.localNetworkExplanationTitle', {}) ?? 'Accesso alla rete locale',
          'permissions.localNetworkExplanation' => TranslationOverrides.string(_root.$meta, 'permissions.localNetworkExplanation', {}) ?? 'Per aprire server booru locali o sincronizzarsi con un altro dispositivo, l\'app deve poter accedere alla rete locale. Android mostrerà una richiesta di autorizzazione per i «Dispositivi nelle vicinanze».',
          'permissions.noAccessToCustomStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ??
                'Nessun accesso alla cartella selezionata',
          'permissions.pleaseSetStorageDirectoryAgain' =>
            TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ??
                'Seleziona nuovamente la cartella per consentire all\'app di accedervi',
          'permissions.currentPath' => ({
            required String path,
          }) => TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? 'Percorso attuale: ${path}',
          'permissions.setDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? 'Imposta cartella',
          'permissions.currentlyNotAvailableForThisPlatform' =>
            TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ??
                'Non disponibile su questa piattaforma',
          'permissions.resetDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? 'Resetta cartella',
          'permissions.afterResetFilesWillBeSavedToDefaultDirectory' =>
            TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ??
                'I file saranno salvati nella cartella di default dopo il reset',
          'authentication.pleaseAuthenticateToUseTheApp' =>
            TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ?? 'Autenticati per usare l\'app',
          'authentication.noBiometricHardwareAvailable' =>
            TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ?? 'Nessun hardware biometrico disponibile',
          'authentication.temporaryLockout' =>
            TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? 'Bloccato temporaneamente',
          'authentication.somethingWentWrong' =>
            ({required String error}) =>
                TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ??
                'Qualcosa è andato storto durante l\'autenticazione: ${error}',
          'searchHandler.removedLastTab' => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? 'Ultima scheda rimossa',
          'searchHandler.resettingSearchToDefaultTags' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? 'Ripristinando i tag di default',
          'searchHandler.uoh' => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'UOOOOOOOHHH',
          'searchHandler.ratingsChanged' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? 'Classificazioni modificate',
          'searchHandler.ratingsChangedMessage' =>
            ({required String booruType}) =>
                TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
                'Su ${booruType} [rating:safe] è stato rimpiazzato da [rating:general] e [rating:sensitive]',
          'searchHandler.appFixedRatingAutomatically' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ??
                'La classificazione è stata corretta automaticamente. Usa la classificazione corretta nelle ricerche future',
          'searchHandler.tabsRestored' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? 'Schede ripristinate',
          'searchHandler.restoredTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
                  count,
                  one: 'Ripristinata ${count} scheda dalla sessione precedente',
                  many: 'Ripristinate ${count} schede dalla sessione precedente',
                  other: 'Ripristinate ${count} schede dalla sessione precedente',
                ),
          'searchHandler.someRestoredTabsHadIssues' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ??
                'Alcune schede ripristinate avevano booru sconosciuti o caratteri danneggiati.',
          'searchHandler.theyWereSetToDefaultOrIgnored' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ??
                'Sono state reimpostate sui valori predefiniti o ignorate.',
          'searchHandler.listOfBrokenTabs' =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? 'Lista delle schede danneggiate:',
          'searchHandler.tabsMerged' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? 'Schede unite',
          'searchHandler.addedTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
                  count,
                  one: 'Aggiunta ${count} nuova scheda',
                  many: 'Aggiunte ${count} nuove schede',
                  other: 'Aggiunte ${count} nuove schede',
                ),
          'searchHandler.tabsReplaced' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? 'Schede sostituite',
          'searchHandler.receivedTabsCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
                  count,
                  one: 'Ricevuta ${count} scheda',
                  many: 'Ricevute ${count} schede',
                  other: 'Ricevute ${count} schede',
                ),
          'snatcher.title' => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Snatcher',
          'snatcher.snatchingHistory' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'Cronologia dei download',
          'snatcher.enterTags' => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'Inserisci tag',
          'snatcher.amount' => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? 'Quantità',
          'snatcher.amountOfFilesToSnatch' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? 'Numero di file da scaricare',
          'snatcher.delayInMs' => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? 'Ritardo (in ms)',
          'snatcher.delayBetweenEachDownload' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? 'Ritardo tra ogni download',
          'snatcher.snatchFiles' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? 'Scarica file',
          'snatcher.itemWasAlreadySnatched' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? 'L\'elemento è già stato scaricato',
          'snatcher.failedToSnatchItem' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? 'Impossibile scaricare l\'elemento',
          'snatcher.itemWasCancelled' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? 'Il download dell\'elemento è stato annullato',
          'snatcher.startingNextQueueItem' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? 'Avvio del prossimo elemento in coda…',
          'snatcher.itemsSnatched' => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? 'Elementi scaricati',
          'snatcher.snatchedCount' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
                  count,
                  one: 'Scaricato: ${count} elemento',
                  many: 'Scaricati: ${count} elementi',
                  other: 'Scaricati: ${count} elementi',
                ),
          'snatcher.filesAlreadySnatched' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
                  count,
                  one: '${count} file è già stato scaricato',
                  many: '${count} file sono già stati scaricati',
                  other: '${count} file sono già stati scaricati',
                ),
          'snatcher.failedToSnatchFiles' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
                  count,
                  one: 'Impossibile scaricare ${count} file',
                  many: 'Impossibile scaricare ${count} file',
                  other: 'Impossibile scaricare ${count} file',
                ),
          'snatcher.cancelledFiles' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
                  count,
                  one: 'Annullato il download di ${count} file',
                  many: 'Annullato il download di ${count} file',
                  other: 'Annullato il download di ${count} file',
                ),
          'snatcher.snatchingImages' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? 'Download delle immagini',
          'snatcher.doNotCloseApp' => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? 'Non chiudere l\'app!',
          'snatcher.addedItemToQueue' =>
            TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? 'Elemento aggiunto alla coda di download',
          'snatcher.addedItemsToQueue' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
                  count,
                  one: 'Aggiunto ${count} elemento alla coda di download',
                  many: 'Aggiunti ${count} elementi alla coda di download',
                  other: 'Aggiunti ${count} elementi alla coda di download',
                ),
          'multibooru.title' => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? 'Multibooru',
          'multibooru.multibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Modalità Multibooru',
          'multibooru.multibooruRequiresAtLeastTwoBoorus' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ??
                'Sono necessari almeno 2 booru configurati',
          'multibooru.selectSecondaryBoorus' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Seleziona altri booru:',
          'multibooru.akaMultibooruMode' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? 'ovvero modalità Multibooru',
          'multibooru.labelSecondaryBoorusToInclude' =>
            TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? 'Booru secondari da includere',
          'hydrus.importError' =>
            TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'Qualcosa è andato storto importando su hydrus',
          'hydrus.apiPermissionsRequired' =>
            TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ??
                'Potresti non aver concesso i permessi API corretti; puoi modificarli in «Review Services»',
          'hydrus.addTagsToFile' => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? 'Aggiungi i tag al file',
          'hydrus.addUrls' => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'Aggiungi URL',
          'tabs.tab' => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? 'Scheda',
          'tabs.addBoorusInSettings' => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? 'Aggiungi booru in impostazioni',
          'tabs.selectABooru' => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? 'Seleziona un Booru',
          'tabs.secondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? 'Booru secondari',
          'tabs.addNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? 'Aggiungi nuova scheda',
          'tabs.selectABooruOrLeaveEmpty' =>
            TranslationOverrides.string(_root.$meta, 'tabs.selectABooruOrLeaveEmpty', {}) ?? 'Seleziona un booru o lascia vuoto',
          'tabs.addPosition' => TranslationOverrides.string(_root.$meta, 'tabs.addPosition', {}) ?? 'Posizione di inserimento',
          'tabs.addModePrevTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModePrevTab', {}) ?? 'Scheda precedente',
          'tabs.addModeNextTab' => TranslationOverrides.string(_root.$meta, 'tabs.addModeNextTab', {}) ?? 'Scheda successiva',
          'tabs.addModeListEnd' => TranslationOverrides.string(_root.$meta, 'tabs.addModeListEnd', {}) ?? 'Fine lista',
          'tabs.usedQuery' => TranslationOverrides.string(_root.$meta, 'tabs.usedQuery', {}) ?? 'Query usata',
          'tabs.queryModeDefault' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeDefault', {}) ?? 'Predefinita',
          'tabs.queryModeCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCurrent', {}) ?? 'Attuale',
          'tabs.queryModeCustom' => TranslationOverrides.string(_root.$meta, 'tabs.queryModeCustom', {}) ?? 'Personalizzata',
          'tabs.customQuery' => TranslationOverrides.string(_root.$meta, 'tabs.customQuery', {}) ?? 'Query personalizzata',
          'tabs.empty' => TranslationOverrides.string(_root.$meta, 'tabs.empty', {}) ?? '[vuoto]',
          'tabs.addSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.addSecondaryBoorus', {}) ?? 'Aggiungi booru secondari',
          'tabs.keepSecondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.keepSecondaryBoorus', {}) ?? 'Mantieni booru secondari',
          'tabs.startFromCustomPageNumber' =>
            TranslationOverrides.string(_root.$meta, 'tabs.startFromCustomPageNumber', {}) ?? 'Inizia da un numero pagina personalizzato',
          'tabs.switchToNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.switchToNewTab', {}) ?? 'Vai alla nuova scheda',
          'tabs.add' => TranslationOverrides.string(_root.$meta, 'tabs.add', {}) ?? 'Aggiungi',
          'tabs.tabsManager' => TranslationOverrides.string(_root.$meta, 'tabs.tabsManager', {}) ?? 'Gestione schede',
          'tabs.selectMode' => TranslationOverrides.string(_root.$meta, 'tabs.selectMode', {}) ?? 'Modalità di selezione',
          'tabs.sortMode' => TranslationOverrides.string(_root.$meta, 'tabs.sortMode', {}) ?? 'Ordina Schede',
          'tabs.help' => TranslationOverrides.string(_root.$meta, 'tabs.help', {}) ?? 'Aiuto',
          'tabs.deleteTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteTabs', {}) ?? 'Elimina schede',
          'tabs.deleteDuplicateTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteDuplicateTabs', {}) ?? 'Elimina schede duplicate',
          'tabs.deleteDuplicateTabsQuestion' =>
            TranslationOverrides.string(_root.$meta, 'tabs.deleteDuplicateTabsQuestion', {}) ??
                'Schede duplicate trovate. Seleziona le schede che vuoi mantenere in ogni gruppo:',
          'tabs.keepFirstDuplicateTabs' => TranslationOverrides.string(_root.$meta, 'tabs.keepFirstDuplicateTabs', {}) ?? 'Mantieni la prima',
          'tabs.keepLastDuplicateTabs' => TranslationOverrides.string(_root.$meta, 'tabs.keepLastDuplicateTabs', {}) ?? 'Mantieni l\'ultima',
          'tabs.skipDuplicateTabDelete' => TranslationOverrides.string(_root.$meta, 'tabs.skipDuplicateTabDelete', {}) ?? 'Salta',
          'tabs.shuffleTabs' => TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabs', {}) ?? 'Mischia schede',
          'tabs.tabRandomlyShuffled' => TranslationOverrides.string(_root.$meta, 'tabs.tabRandomlyShuffled', {}) ?? 'Schede mischiate casualmente',
          'tabs.tabOrderSaved' => TranslationOverrides.string(_root.$meta, 'tabs.tabOrderSaved', {}) ?? 'Ordine schede salvato',
          'tabs.scrollToCurrent' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToCurrent', {}) ?? 'Vai alla scheda corrente',
          'tabs.scrollToTop' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToTop', {}) ?? 'Torna all\'inizio',
          'tabs.scrollToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.scrollToBottom', {}) ?? 'Vai alla fine',
          'tabs.filterTabsByBooru' => TranslationOverrides.string(_root.$meta, 'tabs.filterTabsByBooru', {}) ?? 'Filtra per booru, stato, duplicati…',
          'tabs.scrolling' => TranslationOverrides.string(_root.$meta, 'tabs.scrolling', {}) ?? 'Scorrimento:',
          'tabs.sorting' => TranslationOverrides.string(_root.$meta, 'tabs.sorting', {}) ?? 'Ordinamento:',
          'tabs.defaultTabsOrder' => TranslationOverrides.string(_root.$meta, 'tabs.defaultTabsOrder', {}) ?? 'Ordine predefinito delle schede',
          'tabs.sortAlphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabetically', {}) ?? 'Ordina in ordine alfabetico',
          'tabs.sortAlphabeticallyReversed' =>
            TranslationOverrides.string(_root.$meta, 'tabs.sortAlphabeticallyReversed', {}) ?? 'Ordina in ordine alfabetico (invertito)',
          'tabs.sortByBooruName' => TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruName', {}) ?? 'Ordina alfabeticamente per nome booru',
          'tabs.sortByBooruNameReversed' =>
            TranslationOverrides.string(_root.$meta, 'tabs.sortByBooruNameReversed', {}) ?? 'Ordina alfabeticamente per nome booru (invertito)',
          'tabs.longPressSortToSave' =>
            TranslationOverrides.string(_root.$meta, 'tabs.longPressSortToSave', {}) ??
                'Premi a lungo il pulsante ordina per salvare l\'ordine attuale',
          'tabs.select' => TranslationOverrides.string(_root.$meta, 'tabs.select', {}) ?? 'Seleziona:',
          'tabs.toggleSelectMode' =>
            TranslationOverrides.string(_root.$meta, 'tabs.toggleSelectMode', {}) ?? 'Attiva/disattiva la modalità di selezione',
          'tabs.onTheBottomOfPage' => TranslationOverrides.string(_root.$meta, 'tabs.onTheBottomOfPage', {}) ?? 'In fondo alla pagina: ',
          'tabs.selectDeselectAll' =>
            TranslationOverrides.string(_root.$meta, 'tabs.selectDeselectAll', {}) ?? 'Seleziona/deseleziona tutte le schede',
          'tabs.deleteSelectedTabs' => TranslationOverrides.string(_root.$meta, 'tabs.deleteSelectedTabs', {}) ?? 'Elimina le schede selezionate',
          'tabs.longPressToMove' =>
            TranslationOverrides.string(_root.$meta, 'tabs.longPressToMove', {}) ?? 'Premi a lungo su una scheda per spostarla',
          'tabs.numbersInBottomRight' =>
            TranslationOverrides.string(_root.$meta, 'tabs.numbersInBottomRight', {}) ?? 'Numeri in basso a destra della scheda:',
          'tabs.firstNumberTabIndex' =>
            TranslationOverrides.string(_root.$meta, 'tabs.firstNumberTabIndex', {}) ??
                'Primo numero - indice della scheda nell\'ordine predefinito della lista',
          'tabs.secondNumberTabIndex' =>
            TranslationOverrides.string(_root.$meta, 'tabs.secondNumberTabIndex', {}) ??
                'Secondo numero - indice della scheda nell\'ordine attuale della lista, appare quando il filtro/ordinamento è attivo',
          'tabs.specialFilters' => TranslationOverrides.string(_root.$meta, 'tabs.specialFilters', {}) ?? 'Filtri speciali:',
          'tabs.loadedFilter' =>
            TranslationOverrides.string(_root.$meta, 'tabs.loadedFilter', {}) ?? '«Caricato» - mostra le schede che hanno caricato elementi',
          'tabs.notLoadedFilter' =>
            TranslationOverrides.string(_root.$meta, 'tabs.notLoadedFilter', {}) ??
                '«Non caricato» - mostra le schede che non sono caricate e/o hanno zero elementi',
          'tabs.notLoadedItalic' =>
            TranslationOverrides.string(_root.$meta, 'tabs.notLoadedItalic', {}) ?? 'Le schede non caricate hanno il testo in corsivo',
          'tabs.noTabsFound' => TranslationOverrides.string(_root.$meta, 'tabs.noTabsFound', {}) ?? 'Nessuna scheda trovata',
          'tabs.copy' => TranslationOverrides.string(_root.$meta, 'tabs.copy', {}) ?? 'Copia',
          'tabs.moveAction' => TranslationOverrides.string(_root.$meta, 'tabs.moveAction', {}) ?? 'Sposta',
          'tabs.remove' => TranslationOverrides.string(_root.$meta, 'tabs.remove', {}) ?? 'Rimuovi',
          'tabs.shuffle' => TranslationOverrides.string(_root.$meta, 'tabs.shuffle', {}) ?? 'Mischia',
          'tabs.sort' => TranslationOverrides.string(_root.$meta, 'tabs.sort', {}) ?? 'Ordina',
          'tabs.shuffleTabsQuestion' =>
            TranslationOverrides.string(_root.$meta, 'tabs.shuffleTabsQuestion', {}) ?? 'Vuoi mischiare l\'ordine delle schede in modo casuale?',
          'tabs.saveTabsInCurrentOrder' =>
            TranslationOverrides.string(_root.$meta, 'tabs.saveTabsInCurrentOrder', {}) ?? 'Vuoi salvare le schede nell\'ordine attuale?',
          'tabs.byBooru' => TranslationOverrides.string(_root.$meta, 'tabs.byBooru', {}) ?? 'Per booru',
          'tabs.alphabetically' => TranslationOverrides.string(_root.$meta, 'tabs.alphabetically', {}) ?? 'Alfabeticamente',
          'tabs.reversed' => TranslationOverrides.string(_root.$meta, 'tabs.reversed', {}) ?? '(invertito)',
          'tabs.areYouSureDeleteTabs' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'tabs.areYouSureDeleteTabs', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
                  count,
                  one: 'Sei sicuro di voler eliminare ${count} scheda?',
                  many: 'Sei sicuro di voler eliminare ${count} schede?',
                  other: 'Sei sicuro di voler eliminare ${count} schede?',
                ),
          'tabs.filters.loaded' => TranslationOverrides.string(_root.$meta, 'tabs.filters.loaded', {}) ?? 'Caricato',
          'tabs.filters.tagType' => TranslationOverrides.string(_root.$meta, 'tabs.filters.tagType', {}) ?? 'Tipo di tag',
          'tabs.filters.multibooru' => TranslationOverrides.string(_root.$meta, 'tabs.filters.multibooru', {}) ?? 'Multibooru',
          'tabs.filters.duplicates' => TranslationOverrides.string(_root.$meta, 'tabs.filters.duplicates', {}) ?? 'Duplicati',
          'tabs.filters.checkDuplicatesOnSameBooru' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.checkDuplicatesOnSameBooru', {}) ?? 'Controlla duplicati sullo stesso Booru',
          'tabs.filters.emptySearchQuery' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.emptySearchQuery', {}) ?? 'Query di ricerca vuota',
          'tabs.filters.title' => TranslationOverrides.string(_root.$meta, 'tabs.filters.title', {}) ?? 'Filtri schede',
          'tabs.filters.all' => TranslationOverrides.string(_root.$meta, 'tabs.filters.all', {}) ?? 'Tutti',
          'tabs.filters.notLoaded' => TranslationOverrides.string(_root.$meta, 'tabs.filters.notLoaded', {}) ?? 'Non caricato',
          'tabs.filters.enabled' => TranslationOverrides.string(_root.$meta, 'tabs.filters.enabled', {}) ?? 'Abilitato',
          'tabs.filters.disabled' => TranslationOverrides.string(_root.$meta, 'tabs.filters.disabled', {}) ?? 'Disabilitato',
          'tabs.filters.willAlsoEnableSorting' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.willAlsoEnableSorting', {}) ?? 'Abiliterà anche l\'ordinamento',
          'tabs.filters.tagTypeFilterHelp' =>
            TranslationOverrides.string(_root.$meta, 'tabs.filters.tagTypeFilterHelp', {}) ??
                'Filtra le schede che contengono almeno un tag del tipo selezionato',
          'tabs.filters.any' => TranslationOverrides.string(_root.$meta, 'tabs.filters.any', {}) ?? 'Qualsiasi',
          'tabs.filters.apply' => TranslationOverrides.string(_root.$meta, 'tabs.filters.apply', {}) ?? 'Applica',
          'tabs.move.moveToTop' => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToTop', {}) ?? 'Sposta in alto',
          'tabs.move.moveToBottom' => TranslationOverrides.string(_root.$meta, 'tabs.move.moveToBottom', {}) ?? 'Sposta in basso',
          'tabs.move.tabNumber' => TranslationOverrides.string(_root.$meta, 'tabs.move.tabNumber', {}) ?? 'Numero della scheda',
          'tabs.move.invalidTabNumber' =>
            TranslationOverrides.string(_root.$meta, 'tabs.move.invalidTabNumber', {}) ?? 'Numero della scheda non valido',
          'tabs.move.invalidInput' => TranslationOverrides.string(_root.$meta, 'tabs.move.invalidInput', {}) ?? 'Input non valido',
          'tabs.move.outOfRange' => TranslationOverrides.string(_root.$meta, 'tabs.move.outOfRange', {}) ?? 'Fuori intervallo',
          'tabs.move.pleaseEnterValidTabNumber' =>
            TranslationOverrides.string(_root.$meta, 'tabs.move.pleaseEnterValidTabNumber', {}) ?? 'Inserisci un numero di scheda valido',
          'tabs.move.moveTo' => ({
            required String formattedNumber,
          }) => TranslationOverrides.string(_root.$meta, 'tabs.move.moveTo', {'formattedNumber': formattedNumber}) ?? 'Sposta a #${formattedNumber}',
          'tabs.move.preview' => TranslationOverrides.string(_root.$meta, 'tabs.move.preview', {}) ?? 'Anteprima:',
          'history.searchHistory' => TranslationOverrides.string(_root.$meta, 'history.searchHistory', {}) ?? 'Cronologia di ricerca',
          'history.searchHistoryIsEmpty' =>
            TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsEmpty', {}) ?? 'La cronologia di ricerca è vuota',
          'history.searchHistoryIsDisabled' =>
            TranslationOverrides.string(_root.$meta, 'history.searchHistoryIsDisabled', {}) ?? 'Cronologia di ricerca disabilitata',
          'history.searchHistoryRequiresDatabase' =>
            TranslationOverrides.string(_root.$meta, 'history.searchHistoryRequiresDatabase', {}) ??
                'Abilita il database nelle impostazioni per la cronologia di ricerca',
          'history.lastSearch' => ({
            required String search,
          }) => TranslationOverrides.string(_root.$meta, 'history.lastSearch', {'search': search}) ?? 'Ultima ricerca: ${search}',
          'history.lastSearchWithDate' => ({
            required String date,
          }) => TranslationOverrides.string(_root.$meta, 'history.lastSearchWithDate', {'date': date}) ?? 'Ultima ricerca: ${date}',
          'history.unknownBooruType' => TranslationOverrides.string(_root.$meta, 'history.unknownBooruType', {}) ?? 'Tipo di Booru sconosciuto!',
          'history.unknownBooru' =>
            ({required String name, required String type}) =>
                TranslationOverrides.string(_root.$meta, 'history.unknownBooru', {'name': name, 'type': type}) ??
                'Booru sconosciuto (${name}-${type})',
          'history.open' => TranslationOverrides.string(_root.$meta, 'history.open', {}) ?? 'Apri',
          'history.openInNewTab' => TranslationOverrides.string(_root.$meta, 'history.openInNewTab', {}) ?? 'Apri in nuova scheda',
          'history.removeFromFavourites' => TranslationOverrides.string(_root.$meta, 'history.removeFromFavourites', {}) ?? 'Rimuovi dai preferiti',
          'history.setAsFavourite' => TranslationOverrides.string(_root.$meta, 'history.setAsFavourite', {}) ?? 'Imposta come preferito',
          'history.copy' => TranslationOverrides.string(_root.$meta, 'history.copy', {}) ?? 'Copia',
          'history.delete' => TranslationOverrides.string(_root.$meta, 'history.delete', {}) ?? 'Elimina',
          'history.deleteHistoryEntries' =>
            TranslationOverrides.string(_root.$meta, 'history.deleteHistoryEntries', {}) ?? 'Elimina voci della cronologia',
          'history.deleteItemsConfirm' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'history.deleteItemsConfirm', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
                  count,
                  one: 'Sei sicuro di voler eliminare ${count} elemento?',
                  many: 'Sei sicuro di voler eliminare ${count} elementi?',
                  other: 'Sei sicuro di voler eliminare ${count} elementi?',
                ),
          'history.clearSelection' => TranslationOverrides.string(_root.$meta, 'history.clearSelection', {}) ?? 'Deseleziona tutto',
          'history.deleteItems' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'history.deleteItems', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
                  count,
                  one: 'Elimina ${count} elemento',
                  many: 'Elimina ${count} elementi',
                  other: 'Elimina ${count} elementi',
                ),
          'webview.title' => TranslationOverrides.string(_root.$meta, 'webview.title', {}) ?? 'Webview',
          'webview.notSupportedOnDevice' =>
            TranslationOverrides.string(_root.$meta, 'webview.notSupportedOnDevice', {}) ?? 'Non supportato su questo dispositivo',
          'webview.captcha' => TranslationOverrides.string(_root.$meta, 'webview.captcha', {}) ?? 'Captcha',
          'webview.captchaCheckDescription' =>
            TranslationOverrides.string(_root.$meta, 'webview.captchaCheckDescription', {}) ??
                'Possibile captcha rilevato, per favore risolvilo e torna indietro quando hai finito',
          'webview.captchaCompleted' => TranslationOverrides.string(_root.$meta, 'webview.captchaCompleted', {}) ?? 'Captcha completato',
          'webview.navigation.enterUrlLabel' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.enterUrlLabel', {}) ?? 'Inserisci un URL',
          'webview.navigation.enterCustomUrl' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.enterCustomUrl', {}) ?? 'Inserisci un URL personalizzato',
          'webview.navigation.navigateTo' => ({
            required String url,
          }) => TranslationOverrides.string(_root.$meta, 'webview.navigation.navigateTo', {'url': url}) ?? 'Naviga su ${url}',
          'webview.navigation.listCookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.listCookies', {}) ?? 'Elenca i cookie',
          'webview.navigation.clearCookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.clearCookies', {}) ?? 'Cancella i cookie',
          'webview.navigation.cookiesGone' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.cookiesGone', {}) ?? 'C\'erano dei cookie. Ora sono spariti',
          'webview.navigation.getFavicon' => TranslationOverrides.string(_root.$meta, 'webview.navigation.getFavicon', {}) ?? 'Ottieni favicon',
          'webview.navigation.noFaviconFound' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noFaviconFound', {}) ?? 'Nessuna favicon trovata',
          'webview.navigation.host' => TranslationOverrides.string(_root.$meta, 'webview.navigation.host', {}) ?? 'Host:',
          'webview.navigation.textAboveSelectable' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.textAboveSelectable', {}) ?? '(il testo sopra è selezionabile)',
          'webview.navigation.copyUrl' => TranslationOverrides.string(_root.$meta, 'webview.navigation.copyUrl', {}) ?? 'Copia URL',
          'webview.navigation.copiedUrlToClipboard' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.copiedUrlToClipboard', {}) ?? 'URL copiato negli appunti',
          'webview.navigation.cookies' => TranslationOverrides.string(_root.$meta, 'webview.navigation.cookies', {}) ?? 'Cookie',
          'webview.navigation.favicon' => TranslationOverrides.string(_root.$meta, 'webview.navigation.favicon', {}) ?? 'Favicon',
          'webview.navigation.history' => TranslationOverrides.string(_root.$meta, 'webview.navigation.history', {}) ?? 'Cronologia',
          'webview.navigation.noBackHistoryItem' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noBackHistoryItem', {}) ?? 'Nessun elemento precedente nella cronologia',
          'webview.navigation.noForwardHistoryItem' =>
            TranslationOverrides.string(_root.$meta, 'webview.navigation.noForwardHistoryItem', {}) ?? 'Nessun elemento successivo nella cronologia',
          'settings.title' => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Impostazioni',
          'settings.language.title' => TranslationOverrides.string(_root.$meta, 'settings.language.title', {}) ?? 'Lingua',
          'settings.language.system' => TranslationOverrides.string(_root.$meta, 'settings.language.system', {}) ?? 'Sistema',
          'settings.language.helpUsTranslate' =>
            TranslationOverrides.string(_root.$meta, 'settings.language.helpUsTranslate', {}) ?? 'Aiutaci a tradurre',
          'settings.language.visitForDetails' => TranslationOverrides.string(_root.$meta, 'settings.language.visitForDetails', {}) ?? 'Visita <a href=\'https://github.com/NO-ob/LoliSnatcher_Droid/blob/master/CONTRIBUTING.md#localization--translations\'>github</a> per i dettagli o premi sull\'immagine sotto per andare su POEditor',
          'settings.booru.title' => TranslationOverrides.string(_root.$meta, 'settings.booru.title', {}) ?? 'Booru e Ricerca',
          'settings.booru.defaultTags' => TranslationOverrides.string(_root.$meta, 'settings.booru.defaultTags', {}) ?? 'Tag predefiniti',
          'settings.booru.itemsPerPage' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPage', {}) ?? 'Elementi recuperati per pagina',
          'settings.booru.itemsPerPageTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPageTip', {}) ?? 'Alcuni booru potrebbero ignorarlo',
          'settings.booru.itemsPerPagePlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.itemsPerPagePlaceholder', {}) ?? '10-100',
          'settings.booru.addBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.addBooru', {}) ?? 'Aggiungi configurazione Booru',
          'settings.booru.shareBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooru', {}) ?? 'Condividi configurazione Booru',
          'settings.booru.shareBooruDialogMsgMobile' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgMobile', {'booruName': booruName}) ??
                'Condividi la configurazione di ${booruName} come link.\n\nIncludere il nome utente/la chiave API?',
          'settings.booru.shareBooruDialogMsgDesktop' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booru.shareBooruDialogMsgDesktop', {'booruName': booruName}) ??
                'Copia il link di configurazione di ${booruName} negli appunti.\n\nIncludere il nome utente/la chiave API?',
          'settings.booru.booruSharing' => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharing', {}) ?? 'Condivisione Booru',
          'settings.booru.booruSharingMsgAndroid' => TranslationOverrides.string(_root.$meta, 'settings.booru.booruSharingMsgAndroid', {}) ?? 'Come aprire automaticamente i link di configurazione booru nell\'app su Android 12 e versioni successive:\n1) Tocca il pulsante qui sotto per aprire le impostazioni di sistema per l\'apertura predefinita dei link dell\'app\n2) Tocca «Aggiungi link» e seleziona tutte le opzioni disponibili',
          'settings.booru.addedBoorus' => TranslationOverrides.string(_root.$meta, 'settings.booru.addedBoorus', {}) ?? 'Booru aggiunti',
          'settings.booru.editBooru' => TranslationOverrides.string(_root.$meta, 'settings.booru.editBooru', {}) ?? 'Modifica configurazione Booru',
          'settings.booru.importBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.importBooru', {}) ?? 'Importa configurazione Booru dagli appunti',
          'settings.booru.onlyLSURLsSupported' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.onlyLSURLsSupported', {}) ?? 'Sono supportati solo gli URL loli.snatcher',
          'settings.booru.deleteBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooru', {}) ?? 'Elimina configurazione Booru',
          'settings.booru.deleteBooruError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.deleteBooruError', {}) ??
                'Qualcosa è andato storto durante l\'eliminazione di una configurazione Booru!',
          'settings.booru.booruDeleted' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruDeleted', {}) ?? 'Configurazione Booru eliminata',
          'settings.booru.booruDropdownInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruDropdownInfo', {}) ??
                'Il booru selezionato diventa predefinito dopo il salvataggio.\n\nIl booru predefinito appare per primo nei menu a tendina',
          'settings.booru.changeDefaultBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.changeDefaultBooru', {}) ?? 'Cambiare il Booru predefinito?',
          'settings.booru.changeTo' => TranslationOverrides.string(_root.$meta, 'settings.booru.changeTo', {}) ?? 'Cambia in: ',
          'settings.booru.keepCurrentBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.keepCurrentBooru', {}) ?? 'Tocca [No] per mantenere quello attuale: ',
          'settings.booru.changeToNewBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.changeToNewBooru', {}) ?? 'Tocca [Sì] per cambiare in: ',
          'settings.booru.booruConfigLinkCopied' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.booruConfigLinkCopied', {}) ??
                'Link della configurazione Booru copiato negli appunti',
          'settings.booru.noBooruSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.noBooruSelected', {}) ?? 'Nessun Booru selezionato!',
          'settings.booru.cantDeleteThisBooru' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.cantDeleteThisBooru', {}) ?? 'Impossibile eliminare questo Booru!',
          'settings.booru.removeRelatedTabsFirst' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.removeRelatedTabsFirst', {}) ?? 'Rimuovi prima le schede correlate',
          'settings.booru.sourceLimitNotice' => TranslationOverrides.string(_root.$meta, 'settings.booru.sourceLimitNotice', {}) ?? 'Alcuni aspetti della configurazione delle fonti possono dipendere dalle impostazioni di compatibilità seguenti. I contenuti sono ospitati e forniti da siti esterni e non sono controllati dall\'app.',
          'settings.booru.advanced' => TranslationOverrides.string(_root.$meta, 'settings.booru.advanced', {}) ?? 'Impostazioni avanzate',
          'settings.booru.expandedSourceCompatibility' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.expandedSourceCompatibility', {}) ??
                'Compatibilità della configurazione delle fonti',
          'settings.booru.expandedSourceCompatibilitySubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.expandedSourceCompatibilitySubtitle', {}) ??
                'Modifica la gestione delle impostazioni di compatibilità delle fonti',
          'settings.booru.expandedSourceCompatibilityConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.expandedSourceCompatibilityConfirm', {}) ?? 'Questa modifica può influire sul funzionamento delle fonti. I contenuti sono ospitati e forniti da siti esterni e non sono controllati dall\'app. Continuare?',
          'settings.booru.sourceUnavailableCurrentSettings' =>
            TranslationOverrides.string(_root.$meta, 'settings.booru.sourceUnavailableCurrentSettings', {}) ?? 'Questo sito non è disponibile.',
          'settings.booruEditor.title' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.title', {}) ?? 'Editor Booru',
          'settings.booruEditor.testBooruFailedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedTitle', {}) ?? 'Test del Booru fallito',
          'settings.booruEditor.testBooruFailedMsg' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.testBooruFailedMsg', {}) ?? 'I parametri di configurazione potrebbero essere errati, il booru potrebbe non consentire l\'accesso alle API, la richiesta non ha restituito dati o si è verificato un errore di rete.',
          'settings.booruEditor.saveBooru' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.saveBooru', {}) ?? 'Salva Booru',
          'settings.booruEditor.runningTest' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.runningTest', {}) ?? 'Esecuzione del test…',
          'settings.booruEditor.booruConfigExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigExistsError', {}) ?? 'Questa configurazione Booru esiste già',
          'settings.booruEditor.booruSameNameExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameNameExistsError', {}) ??
                'Esiste già una configurazione Booru con lo stesso nome',
          'settings.booruEditor.booruSameUrlExistsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruSameUrlExistsError', {}) ??
                'Esiste già una configurazione Booru con lo stesso URL',
          'settings.booruEditor.thisBooruConfigWontBeAdded' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.thisBooruConfigWontBeAdded', {}) ??
                'Questa configurazione booru non verrà aggiunta',
          'settings.booruEditor.booruConfigSaved' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSaved', {}) ?? 'Configurazione Booru salvata',
          'settings.booruEditor.existingTabsNeedReload' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.existingTabsNeedReload', {}) ??
                'Le schede esistenti con questo Booru devono essere ricaricate per applicare le modifiche!',
          'settings.booruEditor.failedVerifyApiHydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.failedVerifyApiHydrus', {}) ??
                'Verifica dell\'accesso API per Hydrus fallita',
          'settings.booruEditor.accessKeyRequestedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedTitle', {}) ?? 'Chiave di accesso richiesta',
          'settings.booruEditor.accessKeyRequestedMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyRequestedMsg', {}) ??
                'Tocca ok su Hydrus, quindi applica. Successivamente puoi toccare \'Test Booru\'',
          'settings.booruEditor.accessKeyFailedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedTitle', {}) ?? 'Impossibile ottenere la chiave di accesso',
          'settings.booruEditor.accessKeyFailedMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.accessKeyFailedMsg', {}) ?? 'La finestra di richiesta è aperta su Hydrus?',
          'settings.booruEditor.hydrusInstructions' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.hydrusInstructions', {}) ?? 'Per ottenere la chiave Hydrus devi aprire la finestra di richiesta nel client Hydrus. Services > Review services > Client API > Add > From API request',
          'settings.booruEditor.getHydrusApiKey' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.getHydrusApiKey', {}) ?? 'Ottieni la chiave API di Hydrus',
          'settings.booruEditor.booruName' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruName', {}) ?? 'Nome Booru',
          'settings.booruEditor.booruNameRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruNameRequired', {}) ?? 'Il nome del Booru è richiesto!',
          'settings.booruEditor.booruUrl' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrl', {}) ?? 'URL del Booru',
          'settings.booruEditor.booruUrlRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruUrlRequired', {}) ?? 'L\'URL del Booru è richiesto!',
          'settings.booruEditor.booruType' => TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruType', {}) ?? 'Tipo di Booru',
          'settings.booruEditor.booruFavicon' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFavicon', {}) ?? 'URL della Favicon',
          'settings.booruEditor.booruFaviconPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruFaviconPlaceholder', {}) ?? '(Si compila automaticamente se vuoto)',
          'settings.booruEditor.booruDefTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTags', {}) ?? 'Tag predefiniti',
          'settings.booruEditor.booruDefTagsPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefTagsPlaceholder', {}) ?? 'Ricerca predefinita per il booru',
          'settings.booruEditor.booruDefaultInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruDefaultInstructions', {}) ??
                'I campi sottostanti potrebbero essere richiesti per alcuni booru',
          'settings.booruEditor.booruConfigShouldSave' =>
            TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigShouldSave', {}) ??
                'Conferma il salvataggio di questa configurazione booru',
          'settings.booruEditor.booruConfigSelectedType' =>
            ({required String booruType}) =>
                TranslationOverrides.string(_root.$meta, 'settings.booruEditor.booruConfigSelectedType', {'booruType': booruType}) ??
                'Tipo di booru selezionato/rilevato: ${booruType}',
          'settings.interface.title' => TranslationOverrides.string(_root.$meta, 'settings.interface.title', {}) ?? 'Interfaccia',
          'settings.interface.appUIMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIMode', {}) ?? 'Modalità interfaccia app',
          'settings.interface.appUIModeWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarningTitle', {}) ?? 'Modalità interfaccia app',
          'settings.interface.appUIModeWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeWarning', {}) ??
                'Usare la modalità Desktop? Può causare problemi su dispositivi mobili. DEPRECATA.',
          'settings.interface.appUIModeHelpMobile' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpMobile', {}) ?? '- Mobile - Interfaccia mobile normale',
          'settings.interface.appUIModeHelpDesktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpDesktop', {}) ??
                '- Desktop - Interfaccia stile Ahoviewer [DEPRECATA, DA RIVEDERE]',
          'settings.interface.appUIModeHelpWarning' => TranslationOverrides.string(_root.$meta, 'settings.interface.appUIModeHelpWarning', {}) ?? '[Attenzione]: Non impostare la modalità interfaccia su Desktop su un telefono; potresti bloccare l\'app e dover cancellare le tue impostazioni, incluse le configurazioni dei booru.',
          'settings.interface.handSide' => TranslationOverrides.string(_root.$meta, 'settings.interface.handSide', {}) ?? 'Mano dominante',
          'settings.interface.handSideHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.handSideHelp', {}) ??
                'Regola la posizione degli elementi dell\'interfaccia sul lato selezionato',
          'settings.interface.showSearchBarInPreviewGrid' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.showSearchBarInPreviewGrid', {}) ??
                'Mostra la barra di ricerca nella griglia di anteprima',
          'settings.interface.moveInputToTopInSearchView' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.moveInputToTopInSearchView', {}) ??
                'Sposta il campo di inserimento in alto nella vista di ricerca',
          'settings.interface.searchViewQuickActionsPanel' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewQuickActionsPanel', {}) ??
                'Pannello delle azioni rapide nella vista di ricerca',
          'settings.interface.searchViewInputAutofocus' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.searchViewInputAutofocus', {}) ?? 'Focus automatico sul campo di ricerca',
          'settings.interface.disableVibration' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibration', {}) ?? 'Disattiva vibrazione',
          'settings.interface.disableVibrationSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.disableVibrationSubtitle', {}) ??
                'Potrebbe comunque verificarsi su alcune azioni anche se disattivata',
          'settings.interface.usePredictiveBack' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.usePredictiveBack', {}) ?? 'Gesto indietro predittivo',
          'settings.interface.previewColumnsPortrait' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsPortrait', {}) ?? 'Colonne di anteprima (verticale)',
          'settings.interface.previewColumnsLandscape' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewColumnsLandscape', {}) ?? 'Colonne di anteprima (orizzontale)',
          'settings.interface.previewQuality' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQuality', {}) ?? 'Qualità dell\'anteprima',
          'settings.interface.previewQualityHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelp', {}) ??
                'Modifica la risoluzione delle immagini nella griglia di anteprima',
          'settings.interface.previewQualityHelpSample' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpSample', {}) ?? '- Versione ridotta - Risoluzione media; l\'app mostrerà una miniatura come segnaposto mentre carica l\'immagine di qualità superiore',
          'settings.interface.previewQualityHelpThumbnail' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpThumbnail', {}) ?? '- Miniatura - Bassa risoluzione',
          'settings.interface.previewQualityHelpNote' => TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityHelpNote', {}) ?? '[Nota]: La qualità «Versione ridotta» può ridurre notevolmente le prestazioni, specialmente se ci sono troppe colonne nella griglia di anteprima',
          'settings.interface.previewDisplay' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplay', {}) ?? 'Visualizzazione anteprima',
          'settings.interface.previewDisplayFallback' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallback', {}) ?? 'Visualizzazione anteprima di riserva',
          'settings.interface.previewDisplayFallbackHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayFallbackHelp', {}) ??
                'Questo verrà utilizzato quando l\'opzione A cascata non è possibile',
          'settings.interface.dontScaleImages' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImages', {}) ?? 'Non ridimensionare le immagini',
          'settings.interface.dontScaleImagesSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesSubtitle', {}) ?? 'Potrebbe ridurre le prestazioni',
          'settings.interface.dontScaleImagesWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningTitle', {}) ?? 'Attenzione',
          'settings.interface.dontScaleImagesWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarning', {}) ??
                'Sei sicuro di voler disattivare il ridimensionamento delle immagini?',
          'settings.interface.dontScaleImagesWarningMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.dontScaleImagesWarningMsg', {}) ??
                'Questo può influire negativamente sulle prestazioni, specialmente sui dispositivi più vecchi',
          'settings.interface.gifThumbnails' => TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnails', {}) ?? 'Miniature GIF',
          'settings.interface.gifThumbnailsRequires' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.gifThumbnailsRequires', {}) ?? 'Richiede «Non ridimensionare le immagini»',
          'settings.interface.scrollPreviewsButtonsPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.scrollPreviewsButtonsPosition', {}) ??
                'Posizione dei pulsanti di scorrimento delle anteprime',
          'settings.interface.mouseWheelScrollModifier' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.mouseWheelScrollModifier', {}) ??
                'Modificatore di scorrimento della rotella del mouse',
          'settings.interface.scrollModifier' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.scrollModifier', {}) ?? 'Modificatore di scorrimento',
          'settings.interface.previewQualityValues.thumbnail' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.thumbnail', {}) ?? 'Miniatura',
          'settings.interface.previewQualityValues.sample' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewQualityValues.sample', {}) ?? 'Versione ridotta',
          'settings.interface.previewDisplayModeValues.square' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.square', {}) ?? 'Quadrato',
          'settings.interface.previewDisplayModeValues.rectangle' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.rectangle', {}) ?? 'Rettangolo',
          'settings.interface.previewDisplayModeValues.staggered' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.previewDisplayModeValues.staggered', {}) ?? 'A cascata',
          'settings.interface.appModeValues.desktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.desktop', {}) ?? 'Desktop',
          'settings.interface.appModeValues.mobile' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.appModeValues.mobile', {}) ?? 'Mobile',
          'settings.interface.handSideValues.left' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.left', {}) ?? 'Sinistra',
          'settings.interface.handSideValues.right' =>
            TranslationOverrides.string(_root.$meta, 'settings.interface.handSideValues.right', {}) ?? 'Destra',
          'settings.theme.title' => TranslationOverrides.string(_root.$meta, 'settings.theme.title', {}) ?? 'Temi',
          'settings.theme.themeMode' => TranslationOverrides.string(_root.$meta, 'settings.theme.themeMode', {}) ?? 'Modalità tema',
          'settings.theme.blackBg' => TranslationOverrides.string(_root.$meta, 'settings.theme.blackBg', {}) ?? 'Sfondo nero',
          'settings.theme.useDynamicColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.useDynamicColor', {}) ?? 'Usa colore dinamico',
          'settings.theme.android12PlusOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.android12PlusOnly', {}) ?? 'Solo Android 12+',
          'settings.theme.theme' => TranslationOverrides.string(_root.$meta, 'settings.theme.theme', {}) ?? 'Tema',
          'settings.theme.primaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.primaryColor', {}) ?? 'Colore primario',
          'settings.theme.secondaryColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.secondaryColor', {}) ?? 'Colore secondario',
          'settings.theme.enableDrawerMascot' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.enableDrawerMascot', {}) ?? 'Abilita la mascotte del menu laterale',
          'settings.theme.setCustomMascot' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.setCustomMascot', {}) ?? 'Imposta mascotte personalizzata',
          'settings.theme.removeCustomMascot' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.removeCustomMascot', {}) ?? 'Rimuovi mascotte personalizzata',
          'settings.theme.currentMascotPath' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.currentMascotPath', {}) ?? 'Percorso della mascotte attuale',
          'settings.theme.system' => TranslationOverrides.string(_root.$meta, 'settings.theme.system', {}) ?? 'Sistema',
          'settings.theme.light' => TranslationOverrides.string(_root.$meta, 'settings.theme.light', {}) ?? 'Chiaro',
          'settings.theme.dark' => TranslationOverrides.string(_root.$meta, 'settings.theme.dark', {}) ?? 'Scuro',
          'settings.theme.pink' => TranslationOverrides.string(_root.$meta, 'settings.theme.pink', {}) ?? 'Rosa',
          'settings.theme.purple' => TranslationOverrides.string(_root.$meta, 'settings.theme.purple', {}) ?? 'Viola',
          'settings.theme.blue' => TranslationOverrides.string(_root.$meta, 'settings.theme.blue', {}) ?? 'Blu',
          'settings.theme.teal' => TranslationOverrides.string(_root.$meta, 'settings.theme.teal', {}) ?? 'Teal',
          'settings.theme.red' => TranslationOverrides.string(_root.$meta, 'settings.theme.red', {}) ?? 'Rosso',
          'settings.theme.green' => TranslationOverrides.string(_root.$meta, 'settings.theme.green', {}) ?? 'Verde',
          'settings.theme.halloween' => TranslationOverrides.string(_root.$meta, 'settings.theme.halloween', {}) ?? 'Halloween',
          'settings.theme.custom' => TranslationOverrides.string(_root.$meta, 'settings.theme.custom', {}) ?? 'Personalizzato',
          'settings.theme.selectColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.selectColor', {}) ?? 'Seleziona colore',
          'settings.theme.selectedColor' => TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColor', {}) ?? 'Colore selezionato',
          'settings.theme.selectedColorAndShades' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.selectedColorAndShades', {}) ?? 'Colore selezionato e le sue sfumature',
          'settings.theme.fontFamily' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontFamily', {}) ?? 'Font',
          'settings.theme.systemDefault' => TranslationOverrides.string(_root.$meta, 'settings.theme.systemDefault', {}) ?? 'Predefinito di sistema',
          'settings.theme.viewMoreFonts' => TranslationOverrides.string(_root.$meta, 'settings.theme.viewMoreFonts', {}) ?? 'Mostra altri font',
          'settings.theme.fontPreviewText' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.fontPreviewText', {}) ??
                'Il veloce gatto gioca in giardino. À È É Ì Ò Ù — à è é ì ò ù — ABCDEFGHIJKLMNOPQRSTUVWXYZ',
          'settings.theme.customFont' => TranslationOverrides.string(_root.$meta, 'settings.theme.customFont', {}) ?? 'Font personalizzato',
          'settings.theme.customFontSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.customFontSubtitle', {}) ?? 'Inserisci il nome di qualsiasi Google Font',
          'settings.theme.fontName' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontName', {}) ?? 'Nome del font',
          'settings.theme.customFontHint' =>
            TranslationOverrides.string(_root.$meta, 'settings.theme.customFontHint', {}) ?? 'Sfoglia i font su fonts.google.com',
          'settings.theme.fontNotFound' => TranslationOverrides.string(_root.$meta, 'settings.theme.fontNotFound', {}) ?? 'Font non trovato',
          'settings.viewer.title' => TranslationOverrides.string(_root.$meta, 'settings.viewer.title', {}) ?? 'Visualizzatore',
          'settings.viewer.preloadAmount' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadAmount', {}) ?? 'Quantità di precaricamento',
          'settings.viewer.preloadSizeLimit' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimit', {}) ?? 'Limite dimensione precaricamento',
          'settings.viewer.preloadSizeLimitSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadSizeLimitSubtitle', {}) ?? 'in GB, 0 per nessun limite',
          'settings.viewer.preloadHeightLimit' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimit', {}) ?? 'Limite altezza precaricamento',
          'settings.viewer.preloadHeightLimitSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preloadHeightLimitSubtitle', {}) ?? 'in pixel, 0 per nessun limite',
          'settings.viewer.imageQuality' => TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQuality', {}) ?? 'Qualità dell\'immagine',
          'settings.viewer.viewerScrollDirection' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerScrollDirection', {}) ?? 'Direzione dello scorrimento',
          'settings.viewer.viewerToolbarPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerToolbarPosition', {}) ?? 'Posizione della barra degli strumenti',
          'settings.viewer.zoomButtonPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.zoomButtonPosition', {}) ?? 'Posizione del pulsante di zoom',
          'settings.viewer.changePageButtonsPosition' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.changePageButtonsPosition', {}) ?? 'Posizione dei pulsanti cambia pagina',
          'settings.viewer.hideToolbarWhenOpeningViewer' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.hideToolbarWhenOpeningViewer', {}) ??
                'Nascondi la barra degli strumenti all\'apertura del visualizzatore',
          'settings.viewer.expandDetailsByDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.expandDetailsByDefault', {}) ??
                'Espandi i dettagli per impostazione predefinita',
          'settings.viewer.hideTranslationNotesByDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.hideTranslationNotesByDefault', {}) ??
                'Nascondi le note di traduzione per impostazione predefinita',
          'settings.viewer.enableRotation' => TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotation', {}) ?? 'Abilita rotazione',
          'settings.viewer.enableRotationSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.enableRotationSubtitle', {}) ?? 'Tocca due volte per ripristinare',
          'settings.viewer.toolbarButtonsOrder' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarButtonsOrder', {}) ?? 'Ordine dei pulsanti della barra degli strumenti',
          'settings.viewer.buttonsOrder' => TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonsOrder', {}) ?? 'Ordine dei pulsanti',
          'settings.viewer.longPressToChangeItemOrder' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToChangeItemOrder', {}) ??
                'Premi a lungo per modificare l\'ordine degli elementi.',
          'settings.viewer.atLeast4ButtonsVisibleOnToolbar' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.atLeast4ButtonsVisibleOnToolbar', {}) ??
                'Almeno 4 pulsanti di questo elenco saranno sempre visibili sulla barra degli strumenti.',
          'settings.viewer.otherButtonsWillGoIntoOverflow' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.otherButtonsWillGoIntoOverflow', {}) ??
                'Gli altri pulsanti saranno disponibili nel menu delle altre opzioni (tre punti).',
          'settings.viewer.longPressToMoveItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.longPressToMoveItems', {}) ?? 'Premi a lungo per spostare gli elementi',
          'settings.viewer.onlyForVideos' => TranslationOverrides.string(_root.$meta, 'settings.viewer.onlyForVideos', {}) ?? 'Solo per i video',
          'settings.viewer.thisButtonCannotBeDisabled' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.thisButtonCannotBeDisabled', {}) ??
                'Questo pulsante non può essere disabilitato',
          'settings.viewer.defaultShareAction' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.defaultShareAction', {}) ?? 'Azione di condivisione predefinita',
          'settings.viewer.shareActions' => TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActions', {}) ?? 'Azioni di condivisione',
          'settings.viewer.shareActionsAsk' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsAsk', {}) ?? '- Chiedi - chiedi sempre cosa condividere',
          'settings.viewer.shareActionsPostURL' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURL', {}) ?? '- URL del post',
          'settings.viewer.shareActionsFileURL' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFileURL', {}) ??
                '- URL del file - condivide il link diretto al file originale (potrebbe non funzionare con alcuni siti)',
          'settings.viewer.shareActionsPostURLFileURLFileWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsPostURLFileURLFileWithTags', {}) ??
                '- URL post/URL file/File con tag - condivide l\'url/file e i tag selezionati',
          'settings.viewer.shareActionsFile' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsFile', {}) ??
                '- File - condivide il file stesso, potrebbe richiedere del tempo per caricarsi, il progresso verrà mostrato sul pulsante Condividi',
          'settings.viewer.shareActionsHydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsHydrus', {}) ??
                '- Hydrus - invia l\'url del post a Hydrus per l\'importazione',
          'settings.viewer.shareActionsNoteIfFileSavedInCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsNoteIfFileSavedInCache', {}) ??
                '[Nota]: Se il file è salvato nella cache, verrà caricato da lì. Altrimenti verrà caricato nuovamente dalla rete.',
          'settings.viewer.shareActionsTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionsTip', {}) ??
                '[Suggerimento]: Puoi aprire il menu delle azioni di condivisione premendo a lungo il pulsante Condividi.',
          'settings.viewer.useVolumeButtonsForScrolling' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.useVolumeButtonsForScrolling', {}) ??
                'Usa i pulsanti del volume per lo scorrimento',
          'settings.viewer.volumeButtonsScrolling' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrolling', {}) ?? 'Scorrimento con pulsanti del volume',
          'settings.viewer.volumeButtonsScrollingHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollingHelp', {}) ??
                'Usa i pulsanti del volume per scorrere tra le anteprime e il visualizzatore',
          'settings.viewer.volumeButtonsVolumeDown' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeDown', {}) ?? ' - Abbassa volume - elemento successivo',
          'settings.viewer.volumeButtonsVolumeUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsVolumeUp', {}) ?? ' - Alza volume - elemento precedente',
          'settings.viewer.volumeButtonsInViewer' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsInViewer', {}) ?? 'Nel visualizzatore:',
          'settings.viewer.volumeButtonsToolbarVisible' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarVisible', {}) ??
                ' - Barra degli strumenti visibile - controlla il volume',
          'settings.viewer.volumeButtonsToolbarHidden' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsToolbarHidden', {}) ??
                ' - Barra degli strumenti nascosta - controlla lo scorrimento',
          'settings.viewer.volumeButtonsScrollSpeed' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.volumeButtonsScrollSpeed', {}) ??
                'Velocità di scorrimento con i pulsanti del volume',
          'settings.viewer.slideshowDurationInMs' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowDurationInMs', {}) ?? 'Durata della presentazione (in ms)',
          'settings.viewer.slideshow' => TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshow', {}) ?? 'Presentazione',
          'settings.viewer.slideshowWIPNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.slideshowWIPNote', {}) ?? '[WIP] Video/GIF: solo scorrimento manuale',
          'settings.viewer.preventDeviceFromSleeping' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.preventDeviceFromSleeping', {}) ??
                'Impedisci al dispositivo di andare in standby',
          'settings.viewer.viewerOpenCloseAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerOpenCloseAnimation', {}) ??
                'Animazione di apertura/chiusura del visualizzatore',
          'settings.viewer.viewerPageChangeAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.viewerPageChangeAnimation', {}) ??
                'Animazione di cambio pagina del visualizzatore',
          'settings.viewer.usingDefaultAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.usingDefaultAnimation', {}) ?? 'Utilizzo dell\'animazione predefinita',
          'settings.viewer.usingCustomAnimation' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.usingCustomAnimation', {}) ?? 'Utilizzo dell\'animazione personalizzata',
          'settings.viewer.kannaLoadingGif' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.kannaLoadingGif', {}) ?? 'GIF di caricamento Kanna',
          'settings.viewer.imageQualityValues.sample' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.sample', {}) ?? 'Versione ridotta',
          'settings.viewer.imageQualityValues.fullRes' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.imageQualityValues.fullRes', {}) ?? 'Originale',
          'settings.viewer.scrollDirectionValues.horizontal' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.horizontal', {}) ?? 'Orizzontale',
          'settings.viewer.scrollDirectionValues.vertical' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.scrollDirectionValues.vertical', {}) ?? 'Verticale',
          'settings.viewer.toolbarPositionValues.top' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.top', {}) ?? 'In alto',
          'settings.viewer.toolbarPositionValues.bottom' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.toolbarPositionValues.bottom', {}) ?? 'In basso',
          'settings.viewer.buttonPositionValues.disabled' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.disabled', {}) ?? 'Disabilitato',
          'settings.viewer.buttonPositionValues.left' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.left', {}) ?? 'Sinistra',
          'settings.viewer.buttonPositionValues.right' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.buttonPositionValues.right', {}) ?? 'Destra',
          'settings.viewer.shareActionValues.ask' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.ask', {}) ?? 'Chiedi',
          'settings.viewer.shareActionValues.postUrl' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrl', {}) ?? 'URL del post',
          'settings.viewer.shareActionValues.postUrlWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.postUrlWithTags', {}) ?? 'URL del post con tag',
          'settings.viewer.shareActionValues.fileUrl' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrl', {}) ?? 'URL del file',
          'settings.viewer.shareActionValues.fileUrlWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileUrlWithTags', {}) ?? 'URL del file con tag',
          'settings.viewer.shareActionValues.file' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.file', {}) ?? 'File',
          'settings.viewer.shareActionValues.fileWithTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.fileWithTags', {}) ?? 'File con tag',
          'settings.viewer.shareActionValues.hydrus' =>
            TranslationOverrides.string(_root.$meta, 'settings.viewer.shareActionValues.hydrus', {}) ?? 'Hydrus',
          'settings.video.title' => TranslationOverrides.string(_root.$meta, 'settings.video.title', {}) ?? 'Video',
          'settings.video.disableVideos' => TranslationOverrides.string(_root.$meta, 'settings.video.disableVideos', {}) ?? 'Disattiva video',
          _ => null,
        } ??
        switch (path) {
          'settings.video.disableVideosHelp' => TranslationOverrides.string(_root.$meta, 'settings.video.disableVideosHelp', {}) ?? 'Utile su dispositivi di fascia bassa che si bloccano quando si tenta di caricare video. Offre invece opzioni per visualizzare il video in un lettore esterno o nel browser.',
          'settings.video.autoplayVideos' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.autoplayVideos', {}) ?? 'Riproduzione automatica video',
          'settings.video.startVideosMuted' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.startVideosMuted', {}) ?? 'Avvia video con audio disattivato',
          'settings.video.experimental' => TranslationOverrides.string(_root.$meta, 'settings.video.experimental', {}) ?? '[Sperimentale]',
          'settings.video.videoPlayerBackend' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoPlayerBackend', {}) ?? 'Backend del lettore video',
          'settings.video.backendDefault' => TranslationOverrides.string(_root.$meta, 'settings.video.backendDefault', {}) ?? 'Predefinito',
          'settings.video.backendMPV' => TranslationOverrides.string(_root.$meta, 'settings.video.backendMPV', {}) ?? 'MPV',
          'settings.video.backendMDK' => TranslationOverrides.string(_root.$meta, 'settings.video.backendMDK', {}) ?? 'MDK',
          'settings.video.backendDefaultHelp' => TranslationOverrides.string(_root.$meta, 'settings.video.backendDefaultHelp', {}) ?? 'Basato su exoplayer. Ha la migliore compatibilità con i dispositivi, potrebbe riscontrare problemi con video in 4K, alcuni codec o dispositivi più vecchi',
          'settings.video.backendMPVHelp' => TranslationOverrides.string(_root.$meta, 'settings.video.backendMPVHelp', {}) ?? 'Basato su libmpv, dispone di impostazioni avanzate che potrebbero aiutare a risolvere i problemi con alcuni codec/dispositivi\n[PUÒ CAUSARE CRASH]',
          'settings.video.backendMDKHelp' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.backendMDKHelp', {}) ??
                'Basato su libmdk, potrebbe avere prestazioni migliori con alcuni codec/dispositivi\n[PUÒ CAUSARE CRASH]',
          'settings.video.mpvSettingsHelp' => TranslationOverrides.string(_root.$meta, 'settings.video.mpvSettingsHelp', {}) ?? 'Prova valori diversi per le impostazioni \'MPV\' di seguito se i video non funzionano correttamente o restituiscono errori di codec:',
          'settings.video.mpvUseHardwareAcceleration' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.mpvUseHardwareAcceleration', {}) ?? 'MPV: usa l\'accelerazione hardware',
          'settings.video.mpvVO' => TranslationOverrides.string(_root.$meta, 'settings.video.mpvVO', {}) ?? 'MPV: VO',
          'settings.video.mpvHWDEC' => TranslationOverrides.string(_root.$meta, 'settings.video.mpvHWDEC', {}) ?? 'MPV: HWDEC',
          'settings.video.videoCacheMode' => TranslationOverrides.string(_root.$meta, 'settings.video.videoCacheMode', {}) ?? 'Modalità cache video',
          'settings.video.cacheModes.title' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.title', {}) ?? 'Modalità di cache video',
          'settings.video.cacheModes.streamMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamMode', {}) ??
                '- Stream - Non salvare in cache, avvia la riproduzione il prima possibile',
          'settings.video.cacheModes.cacheMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheMode', {}) ??
                '- Cache - Salva il file nella memoria del dispositivo, si riproduce solo al completamento del download',
          'settings.video.cacheModes.streamCacheMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.streamCacheMode', {}) ??
                '- Stream+Cache - Un mix di entrambi, ma attualmente porta a un doppio download',
          'settings.video.cacheModes.cacheNote' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.cacheNote', {}) ??
                '[Nota]: I video verranno salvati in cache solo se l\'opzione \'Metti i media in cache\' è abilitata.',
          'settings.video.cacheModes.desktopWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModes.desktopWarning', {}) ??
                '[Attenzione]: Su desktop la modalità Stream potrebbe funzionare in modo errato con alcuni Booru.',
          'settings.video.cacheModeValues.stream' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.stream', {}) ?? 'Stream',
          'settings.video.cacheModeValues.cache' => TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.cache', {}) ?? 'Cache',
          'settings.video.cacheModeValues.streamCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.cacheModeValues.streamCache', {}) ?? 'Stream+Cache',
          'settings.video.videoBackendModeValues.normal' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.normal', {}) ?? 'Predefinito',
          'settings.video.videoBackendModeValues.mpv' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mpv', {}) ?? 'MPV',
          'settings.video.videoBackendModeValues.mdk' =>
            TranslationOverrides.string(_root.$meta, 'settings.video.videoBackendModeValues.mdk', {}) ?? 'MDK',
          'settings.downloads.fromNextItemInQueue' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.fromNextItemInQueue', {}) ?? 'Dal prossimo elemento in coda',
          'settings.downloads.pleaseProvideStoragePermission' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.pleaseProvideStoragePermission', {}) ??
                'Fornisci il permesso di archiviazione per poter scaricare i file',
          'settings.downloads.noItemsSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsSelected', {}) ?? 'Nessun elemento selezionato',
          'settings.downloads.noItemsQueued' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.noItemsQueued', {}) ?? 'Nessun elemento in coda',
          'settings.downloads.batch' => TranslationOverrides.string(_root.$meta, 'settings.downloads.batch', {}) ?? 'Batch',
          'settings.downloads.snatchSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.snatchSelected', {}) ?? 'Scarica gli elementi selezionati',
          'settings.downloads.removeSnatchedStatusFromSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.removeSnatchedStatusFromSelected', {}) ??
                'Rimuovi lo stato «Scaricato» dagli elementi selezionati',
          'settings.downloads.favouriteSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.favouriteSelected', {}) ?? 'Aggiungi selezionati ai preferiti',
          'settings.downloads.unfavouriteSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.unfavouriteSelected', {}) ?? 'Rimuovi selezionati dai preferiti',
          'settings.downloads.clearSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.clearSelected', {}) ?? 'Cancella selezionati',
          'settings.downloads.updatingData' =>
            TranslationOverrides.string(_root.$meta, 'settings.downloads.updatingData', {}) ?? 'Aggiornamento dei dati…',
          'settings.database.title' => TranslationOverrides.string(_root.$meta, 'settings.database.title', {}) ?? 'Database',
          'settings.database.indexingDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexingDatabase', {}) ?? 'Indicizzazione del database',
          'settings.database.droppingIndexes' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.droppingIndexes', {}) ?? 'Eliminazione degli indici',
          'settings.database.enableDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableDatabase', {}) ?? 'Abilita database',
          'settings.database.enableIndexing' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableIndexing', {}) ?? 'Abilita indicizzazione',
          'settings.database.enableSearchHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableSearchHistory', {}) ?? 'Abilita cronologia delle ricerche',
          'settings.database.enableTagTypeFetching' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.enableTagTypeFetching', {}) ?? 'Abilita il recupero del tipo di tag',
          'settings.database.sankakuTypeToUpdate' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuTypeToUpdate', {}) ?? 'Tipo Sankaku da aggiornare',
          'settings.database.searchQuery' => TranslationOverrides.string(_root.$meta, 'settings.database.searchQuery', {}) ?? 'Query di ricerca',
          'settings.database.searchQueryOptional' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchQueryOptional', {}) ?? '(opzionale, potrebbe rallentare il processo)',
          'settings.database.cantLeavePageNow' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.cantLeavePageNow', {}) ?? 'Impossibile lasciare la pagina in questo momento!',
          'settings.database.sankakuDataUpdating' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDataUpdating', {}) ??
                'I dati di Sankaku sono in fase di aggiornamento, attendi fino al termine o annulla manualmente in fondo alla pagina',
          'settings.database.pleaseWaitTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.pleaseWaitTitle', {}) ?? 'Attendi prego!',
          'settings.database.indexesBeingChanged' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.indexesBeingChanged', {}) ?? 'Gli indici sono in fase di modifica',
          'settings.database.databaseInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfo', {}) ??
                'Memorizza i preferiti e tiene traccia degli elementi scaricati',
          'settings.database.databaseInfoSnatch' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseInfoSnatch', {}) ?? 'Gli elementi scaricati non verranno riscaricati',
          'settings.database.indexingInfo' => TranslationOverrides.string(_root.$meta, 'settings.database.indexingInfo', {}) ?? 'Velocizza le ricerche nel database ma usa più spazio su disco (fino a 2x).\n\nNon lasciare la pagina o chiudere l\'app durante l\'indicizzazione.',
          'settings.database.createIndexesDebug' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.createIndexesDebug', {}) ?? 'Crea Indici [Debug]',
          'settings.database.dropIndexesDebug' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.dropIndexesDebug', {}) ?? 'Elimina Indici [Debug]',
          'settings.database.searchHistoryInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryInfo', {}) ?? 'Richiede che il database sia abilitato.',
          'settings.database.searchHistoryRecords' =>
            ({required int limit}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryRecords', {'limit': limit}) ??
                'Salva le ultime ${limit} ricerche',
          'settings.database.searchHistoryTapInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryTapInfo', {}) ??
                'Tocca la voce per le azioni (Elimina, Preferito…)',
          'settings.database.searchHistoryFavouritesInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryFavouritesInfo', {}) ??
                'Le ricerche preferite sono fissate in cima alla lista e non verranno conteggiate nel limite.',
          'settings.database.tagTypeFetchingInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingInfo', {}) ?? 'Recupera i tipi di tag dai booru supportati',
          'settings.database.tagTypeFetchingWarning' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.tagTypeFetchingWarning', {}) ?? 'Potrebbe causare limitazioni di frequenza',
          'settings.database.deleteDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabase', {}) ?? 'Elimina database',
          'settings.database.deleteDatabaseConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.deleteDatabaseConfirm', {}) ?? 'Eliminare il database?',
          'settings.database.databaseDeleted' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.databaseDeleted', {}) ?? 'Database eliminato!',
          'settings.database.appRestartRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.appRestartRequired', {}) ?? 'È necessario riavviare l\'app!',
          'settings.database.clearSnatchedItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSnatchedItems', {}) ?? 'Cancella la cronologia dei download',
          'settings.database.clearAllSnatchedConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearAllSnatchedConfirm', {}) ??
                'Cancellare tutta la cronologia dei download?',
          'settings.database.snatchedItemsCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.snatchedItemsCleared', {}) ?? 'Cronologia dei download cancellata',
          'settings.database.appRestartMayBeRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.appRestartMayBeRequired', {}) ??
                'Potrebbe essere necessario riavviare l\'app!',
          'settings.database.clearFavouritedItems' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearFavouritedItems', {}) ?? 'Cancella elementi preferiti',
          'settings.database.clearAllFavouritedConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearAllFavouritedConfirm', {}) ?? 'Cancellare tutti gli elementi preferiti?',
          'settings.database.favouritesCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.favouritesCleared', {}) ?? 'Preferiti cancellati',
          'settings.database.clearSearchHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistory', {}) ?? 'Cancella cronologia di ricerca',
          'settings.database.clearSearchHistoryConfirm' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.clearSearchHistoryConfirm', {}) ?? 'Cancellare la cronologia di ricerca?',
          'settings.database.searchHistoryCleared' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.searchHistoryCleared', {}) ?? 'Cronologia di ricerca cancellata',
          'settings.database.sankakuFavouritesUpdate' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdate', {}) ?? 'Aggiornamento preferiti Sankaku',
          'settings.database.sankakuFavouritesUpdateStarted' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateStarted', {}) ??
                'Aggiornamento preferiti Sankaku avviato',
          'settings.database.sankakuNewUrlsInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuNewUrlsInfo', {}) ??
                'Verranno recuperati nuovi url delle immagini per gli elementi Sankaku nei tuoi preferiti',
          'settings.database.sankakuDontLeavePage' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuDontLeavePage', {}) ??
                'Non lasciare questa pagina finché il processo non è completo o interrotto',
          'settings.database.noSankakuConfigFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.noSankakuConfigFound', {}) ?? 'Nessuna configurazione Sankaku trovata!',
          'settings.database.sankakuFavouritesUpdateComplete' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.sankakuFavouritesUpdateComplete', {}) ??
                'Aggiornamento preferiti Sankaku completato',
          'settings.database.failedItemsPurgeStartedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeStartedTitle', {}) ?? 'Eliminazione elementi falliti avviata',
          'settings.database.failedItemsPurgeInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.failedItemsPurgeInfo', {}) ??
                'Gli elementi che non è stato possibile aggiornare verranno rimossi dal database',
          'settings.database.updateSankakuUrls' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.updateSankakuUrls', {}) ?? 'Aggiorna URL Sankaku',
          'settings.database.updating' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.database.updating', {'count': count}) ?? 'Aggiornamento degli elementi: ${count}',
          'settings.database.left' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.database.left', {'count': count}) ?? 'Rimanenti: ${count}',
          'settings.database.done' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.database.done', {'count': count}) ?? 'Completati: ${count}',
          'settings.database.failedSkipped' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.database.failedSkipped', {'count': count}) ?? 'Falliti/Saltati: ${count}',
          'settings.database.sankakuRateLimitWarning' => TranslationOverrides.string(_root.$meta, 'settings.database.sankakuRateLimitWarning', {}) ?? 'Fermati e riprova più tardi se inizi a vedere il numero \'Falliti\' crescere costantemente, potresti aver raggiunto il limite di richieste e/o Sankaku blocca le richieste dal tuo IP.',
          'settings.database.skipCurrentItem' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.skipCurrentItem', {}) ?? 'Premi qui per saltare l\'elemento corrente',
          'settings.database.useIfStuck' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.useIfStuck', {}) ?? 'Usa se l\'elemento sembra essere bloccato',
          'settings.database.pressToStop' =>
            TranslationOverrides.string(_root.$meta, 'settings.database.pressToStop', {}) ?? 'Premi qui per interrompere l\'operazione',
          'settings.database.purgeFailedItems' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.purgeFailedItems', {'count': count}) ??
                'Elimina elementi falliti (${count})',
          'settings.database.retryFailedItems' =>
            ({required int count}) =>
                TranslationOverrides.string(_root.$meta, 'settings.database.retryFailedItems', {'count': count}) ??
                'Riprova l\'aggiornamento degli elementi non riusciti (${count})',
          'settings.backupAndRestore.title' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.title', {}) ?? 'Backup e Ripristino',
          'settings.backupAndRestore.duplicateFileDetectedTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedTitle', {}) ?? 'File duplicato rilevato!',
          'settings.backupAndRestore.duplicateFileDetectedMsg' =>
            ({required String fileName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.duplicateFileDetectedMsg', {'fileName': fileName}) ??
                'Il file ${fileName} esiste già. Vuoi sovrascriverlo? Se scegli no, il backup verrà annullato.',
          'settings.backupAndRestore.androidOnlyFeatureMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.androidOnlyFeatureMsg', {}) ?? 'Questa funzione è disponibile solo su Android, sulle versioni Desktop puoi semplicemente copiare/incollare i file da/verso la cartella dati dell\'app, in base al tuo sistema',
          'settings.backupAndRestore.selectBackupDir' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.selectBackupDir', {}) ?? 'Seleziona cartella di backup',
          'settings.backupAndRestore.failedToGetBackupPath' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.failedToGetBackupPath', {}) ??
                'Impossibile ottenere il percorso di backup',
          'settings.backupAndRestore.backupPathMsg' =>
            ({required String backupPath}) =>
                TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupPathMsg', {'backupPath': backupPath}) ??
                'Il percorso di backup è: ${backupPath}',
          'settings.backupAndRestore.noBackupDirSelected' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.noBackupDirSelected', {}) ?? 'Nessuna cartella di backup selezionata',
          'settings.backupAndRestore.restoreInfoMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreInfoMsg', {}) ??
                'I file devono trovarsi nella radice della cartella selezionata',
          'settings.backupAndRestore.backupSettings' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettings', {}) ?? 'Esegui il backup delle impostazioni',
          'settings.backupAndRestore.restoreSettings' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettings', {}) ?? 'Ripristina impostazioni',
          'settings.backupAndRestore.settingsBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsBackedUp', {}) ?? 'Impostazioni salvate su settings.json',
          'settings.backupAndRestore.settingsRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.settingsRestored', {}) ?? 'Impostazioni ripristinate dal backup',
          'settings.backupAndRestore.backupSettingsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupSettingsError', {}) ??
                'Impossibile eseguire il backup delle impostazioni',
          'settings.backupAndRestore.restoreSettingsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreSettingsError', {}) ??
                'Impossibile ripristinare le impostazioni',
          'settings.backupAndRestore.resetBackupDir' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.resetBackupDir', {}) ?? 'Reimposta cartella di backup',
          'settings.backupAndRestore.backupBoorus' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorus', {}) ??
                'Esegui il backup delle configurazioni dei siti booru',
          'settings.backupAndRestore.restoreBoorus' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorus', {}) ?? 'Ripristina le configurazioni dei siti booru',
          'settings.backupAndRestore.boorusBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusBackedUp', {}) ?? 'Booru salvati su boorus.json',
          'settings.backupAndRestore.boorusRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.boorusRestored', {}) ?? 'Booru ripristinati dal backup',
          'settings.backupAndRestore.backupBoorusError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupBoorusError', {}) ?? 'Impossibile eseguire il backup dei booru',
          'settings.backupAndRestore.restoreBoorusError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreBoorusError', {}) ?? 'Impossibile ripristinare i booru',
          'settings.backupAndRestore.backupDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabase', {}) ?? 'Esegui il backup del database',
          'settings.backupAndRestore.restoreDatabase' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabase', {}) ?? 'Ripristina database',
          'settings.backupAndRestore.restoreDatabaseInfo' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseInfo', {}) ??
                'Potrebbe richiedere del tempo a seconda delle dimensioni del database, riavvierà l\'app in caso di successo',
          'settings.backupAndRestore.databaseBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseBackedUp', {}) ?? 'Database salvato su store.db',
          'settings.backupAndRestore.databaseRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseRestored', {}) ??
                'Database ripristinato dal backup! L\'app si riavvierà tra pochi secondi!',
          'settings.backupAndRestore.backupDatabaseError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDatabaseError', {}) ??
                'Impossibile eseguire il backup del database',
          'settings.backupAndRestore.restoreDatabaseError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreDatabaseError', {}) ?? 'Impossibile ripristinare il database',
          'settings.backupAndRestore.databaseFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.databaseFileNotFound', {}) ??
                'File del database non trovato o illeggibile!',
          'settings.backupAndRestore.backupTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTags', {}) ?? 'Esegui il backup dei tag',
          'settings.backupAndRestore.restoreTags' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTags', {}) ?? 'Ripristina tag',
          'settings.backupAndRestore.restoreTagsInfo' => TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsInfo', {}) ?? 'Potrebbe richiedere del tempo se hai molti tag. Se hai già ripristinato il database, questa operazione non è necessaria perché i tag sono già inclusi nel database',
          'settings.backupAndRestore.tagsBackedUp' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsBackedUp', {}) ?? 'Tag salvati su tags.json',
          'settings.backupAndRestore.tagsRestored' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsRestored', {}) ?? 'Tag ripristinati dal backup',
          'settings.backupAndRestore.backupTagsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupTagsError', {}) ?? 'Impossibile eseguire il backup dei tag',
          'settings.backupAndRestore.restoreTagsError' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.restoreTagsError', {}) ?? 'Impossibile ripristinare i tag',
          'settings.backupAndRestore.tagsFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.tagsFileNotFound', {}) ?? 'File dei tag non trovato o illeggibile!',
          'settings.backupAndRestore.operationTakesTooLongMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.operationTakesTooLongMsg', {}) ??
                'Premi Nascondi in basso se impiega troppo tempo, l\'operazione continuerà in background',
          'settings.backupAndRestore.backupFileNotFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupFileNotFound', {}) ??
                'File di backup non trovato o illeggibile!',
          'settings.backupAndRestore.backupDirNoAccess' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupDirNoAccess', {}) ?? 'Nessun accesso alla cartella di backup!',
          'settings.backupAndRestore.backupCancelled' =>
            TranslationOverrides.string(_root.$meta, 'settings.backupAndRestore.backupCancelled', {}) ?? 'Backup annullato',
          'settings.network.title' => TranslationOverrides.string(_root.$meta, 'settings.network.title', {}) ?? 'Rete',
          'settings.network.enableSelfSignedSSLCertificates' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.enableSelfSignedSSLCertificates', {}) ?? 'Abilita certificati SSL autofirmati',
          'settings.network.proxy' => TranslationOverrides.string(_root.$meta, 'settings.network.proxy', {}) ?? 'Proxy',
          'settings.network.proxySubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.proxySubtitle', {}) ??
                'Non si applica alla modalità video stream, usa invece la modalità video cache',
          'settings.network.customUserAgent' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgent', {}) ?? 'User-Agent Personalizzato',
          'settings.network.customUserAgentTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.customUserAgentTitle', {}) ?? 'User-Agent Personalizzato',
          'settings.network.keepEmptyForDefault' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.keepEmptyForDefault', {}) ?? 'Lascia vuoto per usare il valore predefinito',
          'settings.network.defaultUserAgent' => ({
            required String agent,
          }) => TranslationOverrides.string(_root.$meta, 'settings.network.defaultUserAgent', {'agent': agent}) ?? 'Predefinito: ${agent}',
          'settings.network.userAgentUsedOnRequests' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.userAgentUsedOnRequests', {}) ??
                'Usato per la maggior parte delle richieste booru e webview',
          'settings.network.valueSavedAfterLeaving' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.valueSavedAfterLeaving', {}) ?? 'Salvato all\'uscita dalla pagina',
          'settings.network.setBrowserUserAgent' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.setBrowserUserAgent', {}) ??
                'Tocca qui per usare l\'User-Agent del browser Chrome (consigliato solo quando il sito blocca user agent non browser)',
          'settings.network.cookieCleaner' => TranslationOverrides.string(_root.$meta, 'settings.network.cookieCleaner', {}) ?? 'Pulizia cookie',
          'settings.network.selectBooruToClearCookies' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.selectBooruToClearCookies', {}) ??
                'Seleziona un booru per cancellare i cookie o lascia vuoto per cancellarli tutti',
          'settings.network.cookiesFor' => ({
            required String booruName,
          }) => TranslationOverrides.string(_root.$meta, 'settings.network.cookiesFor', {'booruName': booruName}) ?? 'Cookie per ${booruName}:',
          'settings.network.cookieDeleted' =>
            ({required String cookieName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookieDeleted', {'cookieName': cookieName}) ??
                'Cookie «${cookieName}» eliminato',
          'settings.network.clearCookies' => TranslationOverrides.string(_root.$meta, 'settings.network.clearCookies', {}) ?? 'Cancella cookie',
          'settings.network.clearCookiesFor' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.clearCookiesFor', {'booruName': booruName}) ??
                'Cancella cookie per ${booruName}',
          'settings.network.cookiesForBooruDeleted' =>
            ({required String booruName}) =>
                TranslationOverrides.string(_root.$meta, 'settings.network.cookiesForBooruDeleted', {'booruName': booruName}) ??
                'Cookie per ${booruName} eliminati',
          'settings.network.allCookiesDeleted' =>
            TranslationOverrides.string(_root.$meta, 'settings.network.allCookiesDeleted', {}) ?? 'Tutti i cookie eliminati',
          'settings.privacy.title' => TranslationOverrides.string(_root.$meta, 'settings.privacy.title', {}) ?? 'Privacy',
          'settings.privacy.appLock' => TranslationOverrides.string(_root.$meta, 'settings.privacy.appLock', {}) ?? 'Blocco app',
          'settings.privacy.appLockMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appLockMsg', {}) ??
                'Blocca l\'app manualmente o dopo un periodo di inattività. Richiede PIN/biometria',
          'settings.privacy.autoLockAfter' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfter', {}) ?? 'Blocco automatico dopo',
          'settings.privacy.autoLockAfterTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.autoLockAfterTip', {}) ?? 'in secondi, 0 per disabilitare',
          'settings.privacy.bluronLeave' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeave', {}) ?? 'Sfoca lo schermo quando si esce dall\'app',
          'settings.privacy.bluronLeaveMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.bluronLeaveMsg', {}) ??
                'Potrebbe non funzionare su alcuni dispositivi a causa di limitazioni di sistema',
          'settings.privacy.incognitoKeyboard' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboard', {}) ?? 'Tastiera in incognito',
          'settings.privacy.incognitoKeyboardMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.incognitoKeyboardMsg', {}) ??
                'Impedisce alla tastiera di salvare la cronologia di digitazione.\nApplicato alla maggior parte degli input di testo',
          'settings.privacy.appDisplayName' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayName', {}) ?? 'Nome di visualizzazione dell\'app',
          'settings.privacy.appDisplayNameDescription' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appDisplayNameDescription', {}) ??
                'Cambia come il nome dell\'app appare nel tuo launcher',
          'settings.privacy.appAliasChanged' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChanged', {}) ?? 'Nome dell\'app modificato',
          'settings.privacy.appAliasRestartHint' => TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasRestartHint', {}) ?? 'Il cambio del nome dell\'app avrà effetto dopo il riavvio. Alcuni launcher potrebbero richiedere tempo aggiuntivo o un riavvio del sistema.',
          'settings.privacy.appAliasChangeFailed' =>
            TranslationOverrides.string(_root.$meta, 'settings.privacy.appAliasChangeFailed', {}) ??
                'Impossibile cambiare il nome dell\'app. Riprova.',
          'settings.privacy.restartNow' => TranslationOverrides.string(_root.$meta, 'settings.privacy.restartNow', {}) ?? 'Riavvia ora',
          'settings.performance.title' => TranslationOverrides.string(_root.$meta, 'settings.performance.title', {}) ?? 'Prestazioni',
          'settings.performance.lowPerformanceMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceMode', {}) ?? 'Modalità prestazioni ridotte',
          'settings.performance.lowPerformanceModeSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeSubtitle', {}) ??
                'Consigliata per vecchi dispositivi e dispositivi con poca RAM',
          'settings.performance.lowPerformanceModeDialogTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogTitle', {}) ?? 'Modalità prestazioni ridotte',
          'settings.performance.lowPerformanceModeDialogDisablesDetailed' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesDetailed', {}) ??
                '- Disabilita le informazioni dettagliate sul progresso del caricamento',
          'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogDisablesResourceIntensive', {}) ??
                '- Disabilita elementi ad uso intensivo di risorse (sfocature, opacità animate, alcune animazioni…)',
          'settings.performance.lowPerformanceModeDialogSetsOptimal' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.lowPerformanceModeDialogSetsOptimal', {}) ??
                'Imposta parametri ottimali per queste opzioni (puoi cambiarle separatamente in seguito):',
          'settings.performance.autoplayVideos' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.autoplayVideos', {}) ?? 'Riproduzione automatica video',
          'settings.performance.disableVideos' =>
            TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideos', {}) ?? 'Disattiva video',
          'settings.performance.disableVideosHelp' => TranslationOverrides.string(_root.$meta, 'settings.performance.disableVideosHelp', {}) ?? 'Utile su dispositivi di fascia bassa che si bloccano caricando video. Offre opzioni per visualizzare il video in un lettore esterno o browser.',
          'settings.cache.title' => TranslationOverrides.string(_root.$meta, 'settings.cache.title', {}) ?? 'Download e cache',
          'settings.cache.snatchQuality' => TranslationOverrides.string(_root.$meta, 'settings.cache.snatchQuality', {}) ?? 'Qualità dei download',
          'settings.cache.snatchCooldown' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.snatchCooldown', {}) ?? 'Intervallo tra i download (in ms)',
          'settings.cache.pleaseEnterAValidTimeout' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.pleaseEnterAValidTimeout', {}) ??
                'Inserisci un valore di tempo di attesa valido',
          'settings.cache.biggerThan10' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.biggerThan10', {}) ?? 'Inserisci un valore maggiore di 10ms',
          'settings.cache.showDownloadNotifications' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.showDownloadNotifications', {}) ?? 'Mostra notifiche di download',
          'settings.cache.snatchItemsOnFavouriting' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.snatchItemsOnFavouriting', {}) ??
                'Scarica gli elementi all\'aggiunta ai preferiti',
          'settings.cache.favouriteItemsOnSnatching' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.favouriteItemsOnSnatching', {}) ?? 'Aggiungi ai preferiti al download',
          'settings.cache.writeImageDataOnSave' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.writeImageDataOnSave', {}) ?? 'Scrivi dati immagine su JSON al salvataggio',
          'settings.cache.requiresCustomStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.requiresCustomStorageDirectory', {}) ?? 'Richiede una cartella personalizzata',
          'settings.cache.setStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.setStorageDirectory', {}) ?? 'Imposta cartella di archiviazione',
          'settings.cache.currentPath' => ({
            required String path,
          }) => TranslationOverrides.string(_root.$meta, 'settings.cache.currentPath', {'path': path}) ?? 'Attuale: ${path}',
          'settings.cache.resetStorageDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.resetStorageDirectory', {}) ?? 'Reimposta cartella di archiviazione',
          'settings.cache.cachePreviews' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.cachePreviews', {}) ?? 'Metti le anteprime in cache',
          'settings.cache.cacheMedia' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheMedia', {}) ?? 'Metti i media in cache',
          'settings.cache.videoCacheMode' => TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheMode', {}) ?? 'Modalità cache video',
          'settings.cache.videoCacheModesTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModesTitle', {}) ?? 'Modalità cache video',
          'settings.cache.videoCacheModeStream' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStream', {}) ??
                '- Stream - Non usare cache, avvia la riproduzione il prima possibile',
          'settings.cache.videoCacheModeCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeCache', {}) ??
                '- Cache - Salva il file nella memoria, si riproduce solo al termine del download',
          'settings.cache.videoCacheModeStreamCache' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheModeStreamCache', {}) ??
                '- Stream+Cache - Mix di entrambi, ma attualmente causa un doppio download',
          'settings.cache.videoCacheNoteEnable' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheNoteEnable', {}) ??
                '[Nota]: I video andranno in cache solo se \'Metti i media in cache\' è abilitato.',
          'settings.cache.videoCacheWarningDesktop' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.videoCacheWarningDesktop', {}) ??
                '[Attenzione]: Su desktop la modalità Stream potrebbe non funzionare correttamente per alcuni Booru.',
          'settings.cache.deleteCacheAfter' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.deleteCacheAfter', {}) ?? 'Elimina cache dopo:',
          'settings.cache.neverDeleteDuration' => TranslationOverrides.string(_root.$meta, 'settings.cache.neverDeleteDuration', {}) ?? 'Mai',
          'settings.cache.cacheSizeLimit' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.cacheSizeLimit', {}) ?? 'Limite dimensione cache (in GB)',
          'settings.cache.maximumTotalCacheSize' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.maximumTotalCacheSize', {}) ?? 'Dimensione massima totale della cache',
          'settings.cache.cacheStats' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheStats', {}) ?? 'Statistiche cache:',
          'settings.cache.loading' => TranslationOverrides.string(_root.$meta, 'settings.cache.loading', {}) ?? 'Caricamento…',
          'settings.cache.empty' => TranslationOverrides.string(_root.$meta, 'settings.cache.empty', {}) ?? 'Vuota',
          'settings.cache.inFilesPlural' => ({
            required String size,
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.cache.inFilesPlural', {'size': size, 'count': count}) ?? '${size}, file: ${count}',
          'settings.cache.inFileSingular' => ({
            required String size,
          }) => TranslationOverrides.string(_root.$meta, 'settings.cache.inFileSingular', {'size': size}) ?? '${size}, 1 file',
          'settings.cache.cacheTypeTotal' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeTotal', {}) ?? 'Totale',
          'settings.cache.cacheTypeFavicons' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeFavicons', {}) ?? 'Favicon',
          'settings.cache.cacheTypeThumbnails' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeThumbnails', {}) ?? 'Miniature',
          'settings.cache.cacheTypeSamples' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeSamples', {}) ?? 'Sample',
          'settings.cache.cacheTypeMedia' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeMedia', {}) ?? 'Media',
          'settings.cache.cacheTypeWebView' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheTypeWebView', {}) ?? 'Webview',
          'settings.cache.cacheCleared' => TranslationOverrides.string(_root.$meta, 'settings.cache.cacheCleared', {}) ?? 'Cache cancellata',
          'settings.cache.clearedCacheType' => ({
            required String type,
          }) => TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheType', {'type': type}) ?? 'Cache ${type} cancellata',
          'settings.cache.clearAllCache' => TranslationOverrides.string(_root.$meta, 'settings.cache.clearAllCache', {}) ?? 'Cancella tutta la cache',
          'settings.cache.clearedCacheCompletely' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.clearedCacheCompletely', {}) ?? 'Cache completamente cancellata',
          'settings.cache.appRestartRequired' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.appRestartRequired', {}) ?? 'Potrebbe essere necessario riavviare l\'app!',
          'settings.cache.errorExclamation' => TranslationOverrides.string(_root.$meta, 'settings.cache.errorExclamation', {}) ?? 'Errore!',
          'settings.cache.notAvailableForPlatform' =>
            TranslationOverrides.string(_root.$meta, 'settings.cache.notAvailableForPlatform', {}) ??
                'Attualmente non disponibile per questa piattaforma',
          'settings.itemFilters.title' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.title', {}) ?? 'Filtri',
          'settings.itemFilters.hidden' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.hidden', {}) ?? 'Nascosto',
          'settings.itemFilters.marked' => TranslationOverrides.string(_root.$meta, 'settings.itemFilters.marked', {}) ?? 'Contrassegnato',
          'settings.itemFilters.duplicateFilter' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.duplicateFilter', {}) ?? 'Filtro duplicato',
          'settings.itemFilters.alreadyInList' =>
            ({required String tag, required String type}) =>
                TranslationOverrides.string(_root.$meta, 'settings.itemFilters.alreadyInList', {'tag': tag, 'type': type}) ??
                '\'${tag}\' è già nella lista ${type}',
          'settings.itemFilters.noFiltersFound' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersFound', {}) ?? 'Nessun filtro trovato',
          'settings.itemFilters.noFiltersAdded' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.noFiltersAdded', {}) ?? 'Nessun filtro aggiunto',
          'settings.itemFilters.removeHidden' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeHidden', {}) ??
                'Nascondi completamente gli elementi che corrispondono ai filtri Nascosti',
          'settings.itemFilters.removeMarked' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeMarked', {}) ??
                'Nascondi completamente gli elementi che corrispondono ai filtri Contrassegnati',
          'settings.itemFilters.removeFavourited' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeFavourited', {}) ?? 'Nascondi gli elementi preferiti',
          'settings.itemFilters.removeSnatched' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeSnatched', {}) ?? 'Nascondi gli elementi già scaricati',
          'settings.itemFilters.removeAI' =>
            TranslationOverrides.string(_root.$meta, 'settings.itemFilters.removeAI', {}) ??
                'Nascondi gli elementi contrassegnati come generati dall\'IA',
          'settings.sync.title' => TranslationOverrides.string(_root.$meta, 'settings.sync.title', {}) ?? 'LoliSync',
          'settings.sync.dbError' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.dbError', {}) ?? 'Il database deve essere abilitato per usare LoliSync',
          'settings.sync.errorTitle' => TranslationOverrides.string(_root.$meta, 'settings.sync.errorTitle', {}) ?? 'Errore!',
          'settings.sync.pleaseEnterIPAndPort' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.pleaseEnterIPAndPort', {}) ?? 'Inserisci indirizzo IP e porta.',
          'settings.sync.selectWhatYouWantToDo' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.selectWhatYouWantToDo', {}) ?? 'Seleziona cosa vuoi fare',
          'settings.sync.sendDataToDevice' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendDataToDevice', {}) ?? 'INVIA dati AD un altro dispositivo',
          'settings.sync.receiveDataFromDevice' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.receiveDataFromDevice', {}) ?? 'RICEVI dati DA un altro dispositivo',
          'settings.sync.senderInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.senderInstructions', {}) ??
                'Avvia il server sull\'altro dispositivo, inserisci il suo IP/porta, poi tocca Inizia sincronizzazione',
          'settings.sync.ipAddress' => TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddress', {}) ?? 'Indirizzo IP',
          'settings.sync.ipAddressPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.ipAddressPlaceholder', {}) ?? 'Indirizzo IP Host (es. 192.168.1.1)',
          'settings.sync.port' => TranslationOverrides.string(_root.$meta, 'settings.sync.port', {}) ?? 'Porta',
          'settings.sync.portPlaceholder' => TranslationOverrides.string(_root.$meta, 'settings.sync.portPlaceholder', {}) ?? 'Porta Host (es. 7777)',
          'settings.sync.sendFavourites' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavourites', {}) ?? 'Invia preferiti',
          'settings.sync.favouritesCount' => ({
            required String count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.sync.favouritesCount', {'count': count}) ?? 'Preferiti: ${count}',
          'settings.sync.sendFavouritesLegacy' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendFavouritesLegacy', {}) ?? 'Invia preferiti (Legacy)',
          'settings.sync.syncFavsFrom' => TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFrom', {}) ?? 'Sincronizza preferiti da #…',
          'settings.sync.syncFavsFromHelpText1' => TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText1', {}) ?? 'Permette di impostare da dove deve iniziare la sincronizzazione, utile se hai già sincronizzato tutti i tuoi preferiti e vuoi sincronizzare solo i più recenti',
          'settings.sync.syncFavsFromHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText2', {}) ??
                'Se vuoi sincronizzare dall\'inizio lascia questo campo vuoto',
          'settings.sync.syncFavsFromHelpText3' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText3', {}) ??
                'Esempio: Hai X preferiti, imposta questo campo a 100, la sincronizzazione inizierà dall\'elemento #100 fino a raggiungere X',
          'settings.sync.syncFavsFromHelpText4' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncFavsFromHelpText4', {}) ??
                'Ordine dei preferiti: dal meno recente (0) al più recente (X)',
          'settings.sync.sendSnatchedHistory' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendSnatchedHistory', {}) ?? 'Invia la cronologia dei download',
          'settings.sync.snatchedCount' => ({
            required String count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.sync.snatchedCount', {'count': count}) ?? 'Scaricati: ${count}',
          'settings.sync.syncSnatchedFrom' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFrom', {}) ?? 'Sincronizza scaricati da #…',
          'settings.sync.syncSnatchedFromHelpText1' => TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText1', {}) ?? 'Permette di impostare da dove deve iniziare la sincronizzazione, utile se hai già sincronizzato la cronologia dei download e vuoi sincronizzare solo i più recenti',
          'settings.sync.syncSnatchedFromHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText2', {}) ??
                'Se vuoi sincronizzare dall\'inizio lascia questo campo vuoto',
          'settings.sync.syncSnatchedFromHelpText3' => TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText3', {}) ?? 'Esempio: Hai X elementi scaricati, imposta questo campo a 100, la sincronizzazione inizierà dall\'elemento #100 fino a raggiungere X',
          'settings.sync.syncSnatchedFromHelpText4' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.syncSnatchedFromHelpText4', {}) ??
                'Ordine dei download: Dal più vecchio (0) al più recente (X)',
          'settings.sync.sendSettings' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendSettings', {}) ?? 'Invia impostazioni',
          'settings.sync.sendBooruConfigs' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.sendBooruConfigs', {}) ?? 'Invia configurazioni booru',
          'settings.sync.configsCount' => ({
            required String count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.sync.configsCount', {'count': count}) ?? 'Configurazioni: ${count}',
          'settings.sync.sendTabs' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTabs', {}) ?? 'Invia schede',
          'settings.sync.tabsCount' => ({
            required String count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsCount', {'count': count}) ?? 'Schede: ${count}',
          'settings.sync.tabsSyncMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncMode', {}) ?? 'Modalità sincronizzazione schede',
          'settings.sync.tabsSyncModeMerge' => TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeMerge', {}) ?? 'Unisci: aggiungi le schede di questo dispositivo a quelle dell\'altro. Le schede già presenti e quelle associate a booru sconosciuti verranno ignorate.',
          'settings.sync.tabsSyncModeReplace' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tabsSyncModeReplace', {}) ??
                'Sostituisci: Sostituisci completamente le schede sull\'altro dispositivo con le schede di questo',
          'settings.sync.merge' => TranslationOverrides.string(_root.$meta, 'settings.sync.merge', {}) ?? 'Unisci',
          'settings.sync.replace' => TranslationOverrides.string(_root.$meta, 'settings.sync.replace', {}) ?? 'Sostituisci',
          'settings.sync.sendTags' => TranslationOverrides.string(_root.$meta, 'settings.sync.sendTags', {}) ?? 'Invia tag',
          'settings.sync.tagsCount' => ({
            required String count,
          }) => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsCount', {'count': count}) ?? 'Tag: ${count}',
          'settings.sync.tagsSyncMode' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncMode', {}) ?? 'Modalità sincronizzazione tag',
          'settings.sync.tagsSyncModePreferTypeIfNone' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModePreferTypeIfNone', {}) ??
                'Conserva il tipo esistente: durante l\'importazione, non sovrascrivere un tipo di tag noto con uno sconosciuto.',
          'settings.sync.tagsSyncModeOverwrite' => TranslationOverrides.string(_root.$meta, 'settings.sync.tagsSyncModeOverwrite', {}) ?? 'Sovrascrivi: tutti i tag verranno aggiunti. Se un tag esiste già sull\'altro dispositivo, i suoi dati e il suo tipo verranno sovrascritti.',
          'settings.sync.preferTypeIfNone' => TranslationOverrides.string(_root.$meta, 'settings.sync.preferTypeIfNone', {}) ?? 'Preserva tipo',
          'settings.sync.overwrite' => TranslationOverrides.string(_root.$meta, 'settings.sync.overwrite', {}) ?? 'Sovrascrivi',
          'settings.sync.testConnection' => TranslationOverrides.string(_root.$meta, 'settings.sync.testConnection', {}) ?? 'Testa connessione',
          'settings.sync.testConnectionHelpText1' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText1', {}) ??
                'Invia una richiesta di test all\'altro dispositivo.',
          'settings.sync.testConnectionHelpText2' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.testConnectionHelpText2', {}) ?? 'Mostra notifica di successo/fallimento.',
          'settings.sync.startSync' => TranslationOverrides.string(_root.$meta, 'settings.sync.startSync', {}) ?? 'Inizia sincronizzazione',
          'settings.sync.portAndIPCannotBeEmpty' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.portAndIPCannotBeEmpty', {}) ?? 'I campi Porta e IP non possono essere vuoti!',
          'settings.sync.nothingSelectedToSync' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.nothingSelectedToSync', {}) ?? 'Non hai selezionato nulla da sincronizzare!',
          'settings.sync.statsOfThisDevice' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.statsOfThisDevice', {}) ?? 'Statistiche di questo dispositivo:',
          'settings.sync.receiverInstructions' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.receiverInstructions', {}) ??
                'Avvia il server per ricevere dati. Evita WiFi pubblici per sicurezza',
          'settings.sync.availableNetworkInterfaces' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.availableNetworkInterfaces', {}) ?? 'Interfacce di rete disponibili',
          'settings.sync.selectedInterfaceIP' => ({
            required String ip,
          }) => TranslationOverrides.string(_root.$meta, 'settings.sync.selectedInterfaceIP', {'ip': ip}) ?? 'IP interfaccia selezionata: ${ip}',
          'settings.sync.serverPort' => TranslationOverrides.string(_root.$meta, 'settings.sync.serverPort', {}) ?? 'Porta server',
          'settings.sync.serverPortPlaceholder' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.serverPortPlaceholder', {}) ?? '(sarà \'8080\' come predefinito se vuoto)',
          'settings.sync.startReceiverServer' =>
            TranslationOverrides.string(_root.$meta, 'settings.sync.startReceiverServer', {}) ?? 'Avvia server ricevitore',
          'settings.about.title' => TranslationOverrides.string(_root.$meta, 'settings.about.title', {}) ?? 'Informazioni',
          'settings.about.appDescription' => TranslationOverrides.string(_root.$meta, 'settings.about.appDescription', {}) ?? 'LoliSnatcher è open source e rilasciato con licenza GPLv3, il codice sorgente è disponibile su github. Segnala eventuali problemi o richieste di funzionalità nella sezione issues della repo.',
          'settings.about.appOnGitHub' => TranslationOverrides.string(_root.$meta, 'settings.about.appOnGitHub', {}) ?? 'LoliSnatcher su Github',
          'settings.about.contact' => TranslationOverrides.string(_root.$meta, 'settings.about.contact', {}) ?? 'Contatti',
          'settings.about.emailCopied' => TranslationOverrides.string(_root.$meta, 'settings.about.emailCopied', {}) ?? 'Email copiata negli appunti',
          'settings.about.logoArtistThanks' => TranslationOverrides.string(_root.$meta, 'settings.about.logoArtistThanks', {}) ?? 'Un grande ringraziamento a Showers-U per averci permesso di utilizzare le loro illustrazioni per il logo dell\'app. Dai un\'occhiata al loro Pixiv',
          'settings.about.developers' => TranslationOverrides.string(_root.$meta, 'settings.about.developers', {}) ?? 'Sviluppatori',
          'settings.about.localizers' => TranslationOverrides.string(_root.$meta, 'settings.about.localizers', {}) ?? 'Traduttori',
          'settings.about.releases' => TranslationOverrides.string(_root.$meta, 'settings.about.releases', {}) ?? 'Rilasci',
          'settings.about.releasesMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.about.releasesMsg', {}) ??
                'L\'ultima versione e i changelog completi possono essere trovati alla pagina Github Releases:',
          'settings.about.licenses' => TranslationOverrides.string(_root.$meta, 'settings.about.licenses', {}) ?? 'Licenze',
          'settings.checkForUpdates.title' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.title', {}) ?? 'Controlla aggiornamenti',
          'settings.checkForUpdates.updateAvailable' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateAvailable', {}) ?? 'Aggiornamento disponibile!',
          'settings.checkForUpdates.whatsNew' => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.whatsNew', {}) ?? 'Novità',
          'settings.checkForUpdates.updateChangelog' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateChangelog', {}) ?? 'Changelog dell\'aggiornamento',
          'settings.checkForUpdates.updateCheckError' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.updateCheckError', {}) ?? 'Errore controllo aggiornamenti!',
          'settings.checkForUpdates.youHaveLatestVersion' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.youHaveLatestVersion', {}) ?? 'Hai l\'ultima versione',
          'settings.checkForUpdates.viewLatestChangelog' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.viewLatestChangelog', {}) ?? 'Visualizza l\'ultimo changelog',
          'settings.checkForUpdates.currentVersion' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.currentVersion', {}) ?? 'Versione corrente',
          'settings.checkForUpdates.changelog' => TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.changelog', {}) ?? 'Changelog',
          'settings.checkForUpdates.visitPlayStore' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitPlayStore', {}) ?? 'Visita il Play Store',
          'settings.checkForUpdates.visitReleases' =>
            TranslationOverrides.string(_root.$meta, 'settings.checkForUpdates.visitReleases', {}) ?? 'Visita i rilasci',
          'settings.logs.title' => TranslationOverrides.string(_root.$meta, 'settings.logs.title', {}) ?? 'Log',
          'settings.logs.shareLogs' => TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogs', {}) ?? 'Condividi log',
          'settings.logs.shareLogsWarningTitle' =>
            TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningTitle', {}) ?? 'Condividere i log su un\'app esterna?',
          'settings.logs.shareLogsWarningMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.logs.shareLogsWarningMsg', {}) ??
                '[ATTENZIONE]: I log potrebbero contenere informazioni sensibili, condividi con cautela!',
          'settings.help.title' => TranslationOverrides.string(_root.$meta, 'settings.help.title', {}) ?? 'Aiuto',
          'settings.debug.title' => TranslationOverrides.string(_root.$meta, 'settings.debug.title', {}) ?? 'Debug',
          'settings.debug.enabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.enabledSnackbarMsg', {}) ?? 'Modalità debug abilitata!',
          'settings.debug.disabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.disabledSnackbarMsg', {}) ?? 'Modalità debug disabilitata!',
          'settings.debug.alreadyEnabledSnackbarMsg' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.alreadyEnabledSnackbarMsg', {}) ?? 'La modalità debug è già abilitata!',
          'settings.debug.showPerformanceGraph' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.showPerformanceGraph', {}) ?? 'Mostra grafico prestazioni',
          'settings.debug.showFPSGraph' => TranslationOverrides.string(_root.$meta, 'settings.debug.showFPSGraph', {}) ?? 'Mostra grafico FPS',
          'settings.debug.showImageStats' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.showImageStats', {}) ?? 'Mostra statistiche immagini',
          'settings.debug.showVideoStats' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.showVideoStats', {}) ?? 'Mostra statistiche video',
          'settings.debug.blurImagesAndMuteVideosDevOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.blurImagesAndMuteVideosDevOnly', {}) ??
                'Sfoca le immagini + silenzia i video [solo sviluppatori]',
          'settings.debug.enableDragScrollOnListsDesktopOnly' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.enableDragScrollOnListsDesktopOnly', {}) ??
                'Abilita scorrimento tramite trascinamento nelle liste [Solo Desktop]',
          'settings.debug.animationSpeed' => ({
            required double speed,
          }) => TranslationOverrides.string(_root.$meta, 'settings.debug.animationSpeed', {'speed': speed}) ?? 'Velocità animazione (${speed})',
          'settings.debug.tagsManager' => TranslationOverrides.string(_root.$meta, 'settings.debug.tagsManager', {}) ?? 'Gestore Tag',
          'settings.debug.resolution' =>
            ({required String width, required String height}) =>
                TranslationOverrides.string(_root.$meta, 'settings.debug.resolution', {'width': width, 'height': height}) ??
                'Ris: ${width}x${height}',
          'settings.debug.pixelRatio' => ({
            required String ratio,
          }) => TranslationOverrides.string(_root.$meta, 'settings.debug.pixelRatio', {'ratio': ratio}) ?? 'Rapporto pixel: ${ratio}',
          'settings.debug.logger' => TranslationOverrides.string(_root.$meta, 'settings.debug.logger', {}) ?? 'Logger',
          'settings.debug.webview' => TranslationOverrides.string(_root.$meta, 'settings.debug.webview', {}) ?? 'Webview',
          'settings.debug.deleteAllCookies' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.deleteAllCookies', {}) ?? 'Elimina tutti i cookie',
          'settings.debug.clearSecureStorage' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.clearSecureStorage', {}) ?? 'Svuota archiviazione sicura',
          'settings.debug.getSessionString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.getSessionString', {}) ?? 'Ottieni stringa di sessione',
          'settings.debug.setSessionString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.setSessionString', {}) ?? 'Imposta stringa di sessione',
          'settings.debug.sessionString' => TranslationOverrides.string(_root.$meta, 'settings.debug.sessionString', {}) ?? 'Stringa di sessione',
          'settings.debug.restoredSessionFromString' =>
            TranslationOverrides.string(_root.$meta, 'settings.debug.restoredSessionFromString', {}) ?? 'Sessione ripristinata da stringa',
          'settings.logging.logger' => TranslationOverrides.string(_root.$meta, 'settings.logging.logger', {}) ?? 'Logger',
          'settings.logging.captureLogcat' =>
            TranslationOverrides.string(_root.$meta, 'settings.logging.captureLogcat', {}) ?? 'Cattura logcat Android',
          'settings.logging.captureLogcatDescription' =>
            TranslationOverrides.string(_root.$meta, 'settings.logging.captureLogcatDescription', {}) ??
                'Registra avvisi e messaggi di errore del processo Android dell\'app',
          'settings.webview.openWebview' => TranslationOverrides.string(_root.$meta, 'settings.webview.openWebview', {}) ?? 'Apri webview',
          'settings.webview.openWebviewTip' =>
            TranslationOverrides.string(_root.$meta, 'settings.webview.openWebviewTip', {}) ?? 'per accedere o ottenere cookie',
          'settings.dirPicker.directoryName' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryName', {}) ?? 'Nome cartella',
          'settings.dirPicker.selectADirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.selectADirectory', {}) ?? 'Seleziona una cartella',
          'settings.dirPicker.closeWithoutChoosing' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.closeWithoutChoosing', {}) ??
                'Vuoi chiudere il selettore senza scegliere una cartella?',
          'settings.dirPicker.no' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.no', {}) ?? 'No',
          'settings.dirPicker.yes' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.yes', {}) ?? 'Sì',
          'settings.dirPicker.error' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.error', {}) ?? 'Errore!',
          'settings.dirPicker.failedToCreateDirectory' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.failedToCreateDirectory', {}) ?? 'Impossibile creare cartella',
          'settings.dirPicker.directoryNotWritable' =>
            TranslationOverrides.string(_root.$meta, 'settings.dirPicker.directoryNotWritable', {}) ?? 'La cartella non è scrivibile!',
          'settings.dirPicker.newDirectory' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.newDirectory', {}) ?? 'Nuova cartella',
          'settings.dirPicker.create' => TranslationOverrides.string(_root.$meta, 'settings.dirPicker.create', {}) ?? 'Crea',
          'settings.version' => TranslationOverrides.string(_root.$meta, 'settings.version', {}) ?? 'Versione',
          'comments.title' => TranslationOverrides.string(_root.$meta, 'comments.title', {}) ?? 'Commenti',
          'comments.noComments' => TranslationOverrides.string(_root.$meta, 'comments.noComments', {}) ?? 'Nessun commento',
          'comments.noBooruAPIForComments' =>
            TranslationOverrides.string(_root.$meta, 'comments.noBooruAPIForComments', {}) ??
                'Questo Booru non ha commenti o non ci sono API per essi',
          'pageChanger.title' => TranslationOverrides.string(_root.$meta, 'pageChanger.title', {}) ?? 'Selettore pagine',
          'pageChanger.pageLabel' => TranslationOverrides.string(_root.$meta, 'pageChanger.pageLabel', {}) ?? 'Pagina #',
          'pageChanger.delayBetweenLoadings' =>
            TranslationOverrides.string(_root.$meta, 'pageChanger.delayBetweenLoadings', {}) ?? 'Ritardo tra i caricamenti (ms)',
          'pageChanger.delayInMs' => TranslationOverrides.string(_root.$meta, 'pageChanger.delayInMs', {}) ?? 'Ritardo in ms',
          'pageChanger.currentPage' => ({
            required int number,
          }) => TranslationOverrides.string(_root.$meta, 'pageChanger.currentPage', {'number': number}) ?? 'Pagina corrente #${number}',
          'pageChanger.possibleMaxPage' => ({
            required int number,
          }) => TranslationOverrides.string(_root.$meta, 'pageChanger.possibleMaxPage', {'number': number}) ?? 'Possibile pagina massima #~${number}',
          'pageChanger.searchCurrentlyRunning' =>
            TranslationOverrides.string(_root.$meta, 'pageChanger.searchCurrentlyRunning', {}) ?? 'Ricerca attualmente in esecuzione!',
          'pageChanger.jumpToPage' => TranslationOverrides.string(_root.$meta, 'pageChanger.jumpToPage', {}) ?? 'Salta alla pagina',
          'pageChanger.searchUntilPage' => TranslationOverrides.string(_root.$meta, 'pageChanger.searchUntilPage', {}) ?? 'Cerca fino alla pagina',
          'pageChanger.stopSearching' => TranslationOverrides.string(_root.$meta, 'pageChanger.stopSearching', {}) ?? 'Ferma la ricerca',
          'tagsFiltersDialogs.emptyInput' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.emptyInput', {}) ?? 'Input vuoto!',
          'tagsFiltersDialogs.addNewFilter' => ({
            required String type,
          }) => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.addNewFilter', {'type': type}) ?? '[Aggiungi nuovo filtro ${type}]',
          'tagsFiltersDialogs.newTagFilter' => ({
            required String type,
          }) => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newTagFilter', {'type': type}) ?? 'Nuovo filtro tag ${type}',
          'tagsFiltersDialogs.newFilter' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.newFilter', {}) ?? 'Nuovo filtro',
          'tagsFiltersDialogs.editFilter' => TranslationOverrides.string(_root.$meta, 'tagsFiltersDialogs.editFilter', {}) ?? 'Modifica filtro',
          'tagsManager.title' => TranslationOverrides.string(_root.$meta, 'tagsManager.title', {}) ?? 'Tag',
          'tagsManager.addTag' => TranslationOverrides.string(_root.$meta, 'tagsManager.addTag', {}) ?? 'Aggiungi tag',
          'tagsManager.name' => TranslationOverrides.string(_root.$meta, 'tagsManager.name', {}) ?? 'Nome',
          'tagsManager.type' => TranslationOverrides.string(_root.$meta, 'tagsManager.type', {}) ?? 'Tipo',
          'tagsManager.add' => TranslationOverrides.string(_root.$meta, 'tagsManager.add', {}) ?? 'Aggiungi',
          'tagsManager.staleAfter' => ({
            required String staleText,
          }) => TranslationOverrides.string(_root.$meta, 'tagsManager.staleAfter', {'staleText': staleText}) ?? 'Scade dopo: ${staleText}',
          'tagsManager.addedATab' => TranslationOverrides.string(_root.$meta, 'tagsManager.addedATab', {}) ?? 'Scheda aggiunta',
          'tagsManager.addATab' => TranslationOverrides.string(_root.$meta, 'tagsManager.addATab', {}) ?? 'Aggiungi scheda',
          'tagsManager.copy' => TranslationOverrides.string(_root.$meta, 'tagsManager.copy', {}) ?? 'Copia',
          'tagsManager.setStale' => TranslationOverrides.string(_root.$meta, 'tagsManager.setStale', {}) ?? 'Imposta come scaduto',
          'tagsManager.resetStale' => TranslationOverrides.string(_root.$meta, 'tagsManager.resetStale', {}) ?? 'Segna come aggiornato',
          'tagsManager.makeUnstaleable' => TranslationOverrides.string(_root.$meta, 'tagsManager.makeUnstaleable', {}) ?? 'Rendi non scadibile',
          'tagsManager.deleteTags' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'tagsManager.deleteTags', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
                  count,
                  one: 'Elimina ${count} tag',
                  many: 'Elimina ${count} tag',
                  other: 'Elimina ${count} tag',
                ),
          'tagsManager.deleteTagsTitle' => TranslationOverrides.string(_root.$meta, 'tagsManager.deleteTagsTitle', {}) ?? 'Elimina tag',
          'tagsManager.clearSelection' => TranslationOverrides.string(_root.$meta, 'tagsManager.clearSelection', {}) ?? 'Cancella selezione',
          'lockscreen.tapToAuthenticate' => TranslationOverrides.string(_root.$meta, 'lockscreen.tapToAuthenticate', {}) ?? 'Tocca per autenticarti',
          'lockscreen.devUnlock' => TranslationOverrides.string(_root.$meta, 'lockscreen.devUnlock', {}) ?? 'SBLOCCO DEV',
          'lockscreen.testingMessage' => TranslationOverrides.string(_root.$meta, 'lockscreen.testingMessage', {}) ?? '[TESTING]: Premi qui se non riesci a sbloccare l\'app con i mezzi normali. Segnala allo sviluppatore fornendo dettagli sul tuo dispositivo.',
          'loliSync.title' => TranslationOverrides.string(_root.$meta, 'loliSync.title', {}) ?? 'LoliSync',
          'loliSync.stopSyncingQuestion' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.stopSyncingQuestion', {}) ?? 'Vuoi fermare la sincronizzazione?',
          'loliSync.stopServerQuestion' => TranslationOverrides.string(_root.$meta, 'loliSync.stopServerQuestion', {}) ?? 'Vuoi fermare il server?',
          'loliSync.noConnection' => TranslationOverrides.string(_root.$meta, 'loliSync.noConnection', {}) ?? 'Nessuna connessione',
          'loliSync.waitingForConnection' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.waitingForConnection', {}) ?? 'In attesa di connessione…',
          'loliSync.startingServer' => TranslationOverrides.string(_root.$meta, 'loliSync.startingServer', {}) ?? 'Avvio server…',
          'loliSync.keepScreenAwake' => TranslationOverrides.string(_root.$meta, 'loliSync.keepScreenAwake', {}) ?? 'Mantieni lo schermo acceso',
          'loliSync.serverKilled' => TranslationOverrides.string(_root.$meta, 'loliSync.serverKilled', {}) ?? 'Server LoliSync interrotto',
          'loliSync.testError' =>
            ({required int statusCode, required String reasonPhrase}) =>
                TranslationOverrides.string(_root.$meta, 'loliSync.testError', {'statusCode': statusCode, 'reasonPhrase': reasonPhrase}) ??
                'Errore test: ${statusCode} ${reasonPhrase}',
          'loliSync.testErrorException' => ({
            required String error,
          }) => TranslationOverrides.string(_root.$meta, 'loliSync.testErrorException', {'error': error}) ?? 'Errore test: ${error}',
          'loliSync.testSuccess' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.testSuccess', {}) ?? 'La richiesta di test ha ricevuto una risposta positiva',
          'loliSync.testSuccessMessage' =>
            TranslationOverrides.string(_root.$meta, 'loliSync.testSuccessMessage', {}) ??
                'Dovrebbe esserci un messaggio di \'Test\' sull\'altro dispositivo',
          'imageSearch.title' => TranslationOverrides.string(_root.$meta, 'imageSearch.title', {}) ?? 'Ricerca immagine',
          'tagView.tags' => TranslationOverrides.string(_root.$meta, 'tagView.tags', {}) ?? 'Tag',
          'tagView.comments' => TranslationOverrides.string(_root.$meta, 'tagView.comments', {}) ?? 'Commenti',
          'tagView.showNotes' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'tagView.showNotes', {'count': count}) ?? 'Mostra note (${count})',
          'tagView.hideNotes' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'tagView.hideNotes', {'count': count}) ?? 'Nascondi note (${count})',
          'tagView.loadNotes' => TranslationOverrides.string(_root.$meta, 'tagView.loadNotes', {}) ?? 'Carica note',
          'tagView.thisTagAlreadyInSearch' =>
            TranslationOverrides.string(_root.$meta, 'tagView.thisTagAlreadyInSearch', {}) ?? 'Questo tag è già nell\'attuale query di ricerca:',
          'tagView.addedToCurrentSearch' =>
            TranslationOverrides.string(_root.$meta, 'tagView.addedToCurrentSearch', {}) ?? 'Aggiunto all\'attuale query di ricerca:',
          'tagView.addedNewTab' => TranslationOverrides.string(_root.$meta, 'tagView.addedNewTab', {}) ?? 'Nuova scheda aggiunta:',
          'tagView.id' => TranslationOverrides.string(_root.$meta, 'tagView.id', {}) ?? 'ID',
          'tagView.postURL' => TranslationOverrides.string(_root.$meta, 'tagView.postURL', {}) ?? 'URL Post',
          'tagView.uploader' => TranslationOverrides.string(_root.$meta, 'tagView.uploader', {}) ?? 'Uploader',
          'tagView.posted' => TranslationOverrides.string(_root.$meta, 'tagView.posted', {}) ?? 'Pubblicato',
          'tagView.details' => TranslationOverrides.string(_root.$meta, 'tagView.details', {}) ?? 'Dettagli',
          'tagView.filename' => TranslationOverrides.string(_root.$meta, 'tagView.filename', {}) ?? 'Nome file',
          'tagView.url' => TranslationOverrides.string(_root.$meta, 'tagView.url', {}) ?? 'URL',
          'tagView.extension' => TranslationOverrides.string(_root.$meta, 'tagView.extension', {}) ?? 'Estensione',
          'tagView.resolution' => TranslationOverrides.string(_root.$meta, 'tagView.resolution', {}) ?? 'Risoluzione',
          'tagView.size' => TranslationOverrides.string(_root.$meta, 'tagView.size', {}) ?? 'Dimensione',
          'tagView.md5' => TranslationOverrides.string(_root.$meta, 'tagView.md5', {}) ?? 'MD5',
          'tagView.rating' => TranslationOverrides.string(_root.$meta, 'tagView.rating', {}) ?? 'Classificazione del contenuto',
          'tagView.score' => TranslationOverrides.string(_root.$meta, 'tagView.score', {}) ?? 'Punteggio',
          'tagView.noTagsFound' => TranslationOverrides.string(_root.$meta, 'tagView.noTagsFound', {}) ?? 'Nessun tag trovato',
          'tagView.copy' => TranslationOverrides.string(_root.$meta, 'tagView.copy', {}) ?? 'Copia',
          'tagView.removeFromSearch' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromSearch', {}) ?? 'Rimuovi dalla ricerca',
          'tagView.addToSearch' => TranslationOverrides.string(_root.$meta, 'tagView.addToSearch', {}) ?? 'Aggiungi alla ricerca',
          'tagView.addedToSearchBar' => TranslationOverrides.string(_root.$meta, 'tagView.addedToSearchBar', {}) ?? 'Aggiunto alla barra di ricerca:',
          'tagView.excludeFromSearch' => TranslationOverrides.string(_root.$meta, 'tagView.excludeFromSearch', {}) ?? 'Escludi dalla ricerca',
          'tagView.exclusionAddedToSearchBar' =>
            TranslationOverrides.string(_root.$meta, 'tagView.exclusionAddedToSearchBar', {}) ?? 'Esclusione aggiunta alla barra di ricerca:',
          'tagView.addToMarked' => TranslationOverrides.string(_root.$meta, 'tagView.addToMarked', {}) ?? 'Aggiungi a Contrassegnati',
          'tagView.addToHidden' => TranslationOverrides.string(_root.$meta, 'tagView.addToHidden', {}) ?? 'Aggiungi a Nascosti',
          'tagView.removeFromMarked' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromMarked', {}) ?? 'Rimuovi da Contrassegnati',
          'tagView.removeFromHidden' => TranslationOverrides.string(_root.$meta, 'tagView.removeFromHidden', {}) ?? 'Rimuovi da Nascosti',
          'tagView.editTag' => TranslationOverrides.string(_root.$meta, 'tagView.editTag', {}) ?? 'Modifica tag',
          'tagView.sourceDialogTitle' => TranslationOverrides.string(_root.$meta, 'tagView.sourceDialogTitle', {}) ?? 'Fonte',
          'tagView.preview' => TranslationOverrides.string(_root.$meta, 'tagView.preview', {}) ?? 'Anteprima',
          'tagView.selectBooruToLoad' =>
            TranslationOverrides.string(_root.$meta, 'tagView.selectBooruToLoad', {}) ?? 'Seleziona un booru da caricare',
          'tagView.previewIsLoading' => TranslationOverrides.string(_root.$meta, 'tagView.previewIsLoading', {}) ?? 'Anteprima in caricamento…',
          'tagView.failedToLoadPreview' =>
            TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreview', {}) ?? 'Impossibile caricare l\'anteprima',
          'tagView.tapToTryAgain' => TranslationOverrides.string(_root.$meta, 'tagView.tapToTryAgain', {}) ?? 'Tocca per riprovare',
          'tagView.copiedFileURL' => TranslationOverrides.string(_root.$meta, 'tagView.copiedFileURL', {}) ?? 'URL file copiato negli appunti',
          'tagView.tagPreviews' => TranslationOverrides.string(_root.$meta, 'tagView.tagPreviews', {}) ?? 'Anteprime tag',
          'tagView.currentState' => TranslationOverrides.string(_root.$meta, 'tagView.currentState', {}) ?? 'Stato attuale',
          'tagView.history' => TranslationOverrides.string(_root.$meta, 'tagView.history', {}) ?? 'Cronologia',
          'tagView.failedToLoadPreviewPage' =>
            TranslationOverrides.string(_root.$meta, 'tagView.failedToLoadPreviewPage', {}) ?? 'Impossibile caricare pagina di anteprima',
          'tagView.tryAgain' => TranslationOverrides.string(_root.$meta, 'tagView.tryAgain', {}) ?? 'Riprova',
          'tagView.detectedLinks' => TranslationOverrides.string(_root.$meta, 'tagView.detectedLinks', {}) ?? 'Link rilevati:',
          'tagView.relatedTabs' => TranslationOverrides.string(_root.$meta, 'tagView.relatedTabs', {}) ?? 'Schede correlate',
          'tagView.tabsWithOnlyTag' => TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTag', {}) ?? 'Schede contenenti solo questo tag',
          'tagView.tabsWithOnlyTagDifferentBooru' =>
            TranslationOverrides.string(_root.$meta, 'tagView.tabsWithOnlyTagDifferentBooru', {}) ??
                'Schede contenenti solo questo tag ma in un altro booru',
          'tagView.tabsContainingTag' => TranslationOverrides.string(_root.$meta, 'tagView.tabsContainingTag', {}) ?? 'Schede contenenti questo tag',
          'pinnedTags.pinnedTags' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedTags', {}) ?? 'Tag fissati',
          'pinnedTags.pinTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinTag', {}) ?? 'Fissa tag',
          'pinnedTags.unpinTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinTag', {}) ?? 'Rimuovi tag fissato',
          'pinnedTags.pin' => TranslationOverrides.string(_root.$meta, 'pinnedTags.pin', {}) ?? 'Fissa',
          'pinnedTags.unpin' => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpin', {}) ?? 'Rimuovi',
          'pinnedTags.pinQuestion' => ({
            required String tag,
          }) => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinQuestion', {'tag': tag}) ?? 'Fissare «${tag}» per accesso rapido?',
          'pinnedTags.unpinQuestion' => ({
            required String tag,
          }) => TranslationOverrides.string(_root.$meta, 'pinnedTags.unpinQuestion', {'tag': tag}) ?? 'Rimuovere «${tag}» dai tag fissati?',
          'pinnedTags.onlyForBooru' => ({
            required String name,
          }) => TranslationOverrides.string(_root.$meta, 'pinnedTags.onlyForBooru', {'name': name}) ?? 'Solo per ${name}',
          'pinnedTags.labelsOptional' => TranslationOverrides.string(_root.$meta, 'pinnedTags.labelsOptional', {}) ?? 'Etichette (facoltative)',
          'pinnedTags.typeAndPressAdd' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.typeAndPressAdd', {}) ?? 'Digita e premi Aggiungi per includere un\'etichetta',
          'pinnedTags.selectExistingLabel' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.selectExistingLabel', {}) ?? 'Seleziona etichetta esistente',
          'pinnedTags.tagPinned' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagPinned', {}) ?? 'Tag fissato',
          'pinnedTags.pinnedForBooru' =>
            ({required String name, required String labels}) =>
                TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedForBooru', {'name': name, 'labels': labels}) ??
                'Fissato per ${name}${labels}',
          'pinnedTags.pinnedGloballyWithLabels' => ({
            required String labels,
          }) => TranslationOverrides.string(_root.$meta, 'pinnedTags.pinnedGloballyWithLabels', {'labels': labels}) ?? 'Fissato globalmente${labels}',
          'pinnedTags.tagUnpinned' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagUnpinned', {}) ?? 'Tag non più fissato',
          'pinnedTags.all' => TranslationOverrides.string(_root.$meta, 'pinnedTags.all', {}) ?? 'Tutti',
          'pinnedTags.reorderPinnedTags' => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorderPinnedTags', {}) ?? 'Riordina tag fissati',
          'pinnedTags.saving' => TranslationOverrides.string(_root.$meta, 'pinnedTags.saving', {}) ?? 'Salvataggio…',
          'pinnedTags.reorder' => TranslationOverrides.string(_root.$meta, 'pinnedTags.reorder', {}) ?? 'Riordina',
          'pinnedTags.addTagManually' => TranslationOverrides.string(_root.$meta, 'pinnedTags.addTagManually', {}) ?? 'Aggiungi tag manualmente',
          'pinnedTags.noTagsMatchSearch' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.noTagsMatchSearch', {}) ?? 'Nessun tag corrisponde alla tua ricerca',
          'pinnedTags.noPinnedTagsYet' => TranslationOverrides.string(_root.$meta, 'pinnedTags.noPinnedTagsYet', {}) ?? 'Nessun tag fissato ancora',
          'pinnedTags.editLabels' => TranslationOverrides.string(_root.$meta, 'pinnedTags.editLabels', {}) ?? 'Modifica etichette',
          'pinnedTags.labels' => TranslationOverrides.string(_root.$meta, 'pinnedTags.labels', {}) ?? 'Etichette',
          'pinnedTags.addPinnedTag' => TranslationOverrides.string(_root.$meta, 'pinnedTags.addPinnedTag', {}) ?? 'Aggiungi tag fissato',
          'pinnedTags.tagQuery' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQuery', {}) ?? 'Query tag',
          'pinnedTags.tagQueryHint' => TranslationOverrides.string(_root.$meta, 'pinnedTags.tagQueryHint', {}) ?? 'nome_tag',
          'pinnedTags.rawQueryHelp' =>
            TranslationOverrides.string(_root.$meta, 'pinnedTags.rawQueryHelp', {}) ?? 'Puoi inserire qualsiasi query, inclusi i tag con spazi',
          'searchBar.searchForTags' => TranslationOverrides.string(_root.$meta, 'searchBar.searchForTags', {}) ?? 'Cerca tag',
          'searchBar.failedToLoadSuggestions' =>
            ({required String msg}) =>
                TranslationOverrides.string(_root.$meta, 'searchBar.failedToLoadSuggestions', {'msg': msg}) ??
                'Impossibile caricare suggerimenti. Tocca per riprovare${msg}',
          'searchBar.noSuggestionsFound' =>
            TranslationOverrides.string(_root.$meta, 'searchBar.noSuggestionsFound', {}) ?? 'Nessun suggerimento trovato',
          'searchBar.tagSuggestionsNotAvailable' =>
            TranslationOverrides.string(_root.$meta, 'searchBar.tagSuggestionsNotAvailable', {}) ??
                'Suggerimenti tag non disponibili per questo booru',
          'searchBar.copiedTagToClipboard' => ({
            required String tag,
          }) => TranslationOverrides.string(_root.$meta, 'searchBar.copiedTagToClipboard', {'tag': tag}) ?? 'Copiato «${tag}» negli appunti',
          'searchBar.prefix' => TranslationOverrides.string(_root.$meta, 'searchBar.prefix', {}) ?? 'Prefisso',
          'searchBar.exclude' => TranslationOverrides.string(_root.$meta, 'searchBar.exclude', {}) ?? 'Escludi (—)',
          'searchBar.booruNumberPrefix' => TranslationOverrides.string(_root.$meta, 'searchBar.booruNumberPrefix', {}) ?? 'Booru (N#)',
          'searchBar.metatags' => TranslationOverrides.string(_root.$meta, 'searchBar.metatags', {}) ?? 'Metatag',
          'searchBar.freeMetatags' => TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatags', {}) ?? 'Metatag esclusi dal conteggio',
          'searchBar.freeMetatagsDescription' =>
            TranslationOverrides.string(_root.$meta, 'searchBar.freeMetatagsDescription', {}) ??
                'Questi metatag non vengono conteggiati nel limite di tag per ricerca',
          'searchBar.free' => TranslationOverrides.string(_root.$meta, 'searchBar.free', {}) ?? 'Non conteggiato',
          'searchBar.single' => TranslationOverrides.string(_root.$meta, 'searchBar.single', {}) ?? 'Singolo',
          'searchBar.range' => TranslationOverrides.string(_root.$meta, 'searchBar.range', {}) ?? 'Intervallo',
          'searchBar.popular' => TranslationOverrides.string(_root.$meta, 'searchBar.popular', {}) ?? 'Popolare',
          'searchBar.selectDate' => TranslationOverrides.string(_root.$meta, 'searchBar.selectDate', {}) ?? 'Seleziona data',
          'searchBar.selectDatesRange' => TranslationOverrides.string(_root.$meta, 'searchBar.selectDatesRange', {}) ?? 'Seleziona intervallo date',
          'searchBar.history' => TranslationOverrides.string(_root.$meta, 'searchBar.history', {}) ?? 'Cronologia',
          'searchBar.more' => TranslationOverrides.string(_root.$meta, 'searchBar.more', {}) ?? '…',
          'mobileHome.selectBooruForWebview' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.selectBooruForWebview', {}) ?? 'Seleziona booru per webview',
          'mobileHome.lockApp' => TranslationOverrides.string(_root.$meta, 'mobileHome.lockApp', {}) ?? 'Blocca app',
          'mobileHome.fileAlreadyExists' => TranslationOverrides.string(_root.$meta, 'mobileHome.fileAlreadyExists', {}) ?? 'Il file esiste già',
          'mobileHome.failedToDownload' => TranslationOverrides.string(_root.$meta, 'mobileHome.failedToDownload', {}) ?? 'Download fallito',
          'mobileHome.cancelledByUser' => TranslationOverrides.string(_root.$meta, 'mobileHome.cancelledByUser', {}) ?? 'Annullato dall\'utente',
          _ => null,
        } ??
        switch (path) {
          'mobileHome.saveAnyway' => TranslationOverrides.string(_root.$meta, 'mobileHome.saveAnyway', {}) ?? 'Salva comunque',
          'mobileHome.skip' => TranslationOverrides.string(_root.$meta, 'mobileHome.skip', {}) ?? 'Salta',
          'mobileHome.retryAll' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'mobileHome.retryAll', {'count': count}) ?? 'Riprova tutti (${count})',
          'mobileHome.existingFailedOrCancelledItems' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.existingFailedOrCancelledItems', {}) ??
                'Elementi già esistenti, download non riusciti o annullati',
          'mobileHome.clearAllRetryableItems' =>
            TranslationOverrides.string(_root.$meta, 'mobileHome.clearAllRetryableItems', {}) ?? 'Cancella tutti gli elementi riprovabili',
          'desktopHome.snatcher' => TranslationOverrides.string(_root.$meta, 'desktopHome.snatcher', {}) ?? 'Snatcher',
          'desktopHome.addBoorusInSettings' =>
            TranslationOverrides.string(_root.$meta, 'desktopHome.addBoorusInSettings', {}) ?? 'Aggiungi booru nelle impostazioni',
          'desktopHome.settings' => TranslationOverrides.string(_root.$meta, 'desktopHome.settings', {}) ?? 'Impostazioni',
          'desktopHome.save' => TranslationOverrides.string(_root.$meta, 'desktopHome.save', {}) ?? 'Salva',
          'desktopHome.noItemsSelected' =>
            TranslationOverrides.string(_root.$meta, 'desktopHome.noItemsSelected', {}) ?? 'Nessun elemento selezionato',
          'galleryView.noItems' => TranslationOverrides.string(_root.$meta, 'galleryView.noItems', {}) ?? 'Nessun elemento',
          'galleryView.noItemSelected' => TranslationOverrides.string(_root.$meta, 'galleryView.noItemSelected', {}) ?? 'Nessun elemento selezionato',
          'galleryView.close' => TranslationOverrides.string(_root.$meta, 'galleryView.close', {}) ?? 'Chiudi',
          'mediaPreviews.noBooruConfigsFound' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.noBooruConfigsFound', {}) ?? 'Nessuna configurazione booru trovata',
          'mediaPreviews.addNewBooru' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addNewBooru', {}) ?? 'Aggiungi nuovo Booru',
          'mediaPreviews.help' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.help', {}) ?? 'Aiuto',
          'mediaPreviews.settings' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.settings', {}) ?? 'Impostazioni',
          'mediaPreviews.onboardingTitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.onboardingTitle', {}) ?? 'Configura la tua prima fonte',
          'mediaPreviews.onboardingSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.onboardingSubtitle', {}) ??
                'Aggiungi una configurazione booru o ripristina un backup per iniziare a esplorare',
          'mediaPreviews.addBooruAction' => TranslationOverrides.string(_root.$meta, 'mediaPreviews.addBooruAction', {}) ?? 'Aggiungi un nuovo booru',
          'mediaPreviews.addBooruActionSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.addBooruActionSubtitle', {}) ??
                'Collega un sito inserendo il suo URL e le impostazioni di ricerca',
          'mediaPreviews.restoreBackupAction' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoreBackupAction', {}) ?? 'Ripristina o gestisci i backup',
          'mediaPreviews.restoreBackupActionSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoreBackupActionSubtitle', {}) ??
                'Ripristina impostazioni, booru, schede e dati salvati',
          'mediaPreviews.openSettingsAction' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.openSettingsAction', {}) ?? 'Apri le impostazioni',
          'mediaPreviews.openSettingsActionSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.openSettingsActionSubtitle', {}) ??
                'Configura il comportamento dell\'app prima di aggiungere le fonti',
          'mediaPreviews.helpSectionTitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.helpSectionTitle', {}) ?? 'Hai bisogno di aiuto?',
          'mediaPreviews.booruSourcesArticle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.booruSourcesArticle', {}) ??
                'Configurazioni booru: come aggiungerle e come funzionano',
          'mediaPreviews.booruSourcesArticleSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.booruSourcesArticleSubtitle', {}) ??
                'Istruzioni per configurare il tuo primo booru',
          'mediaPreviews.backupRestoreArticle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.backupRestoreArticle', {}) ?? 'Ripristino dei dati da un backup',
          'mediaPreviews.backupRestoreArticleSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.backupRestoreArticleSubtitle', {}) ??
                'Istruzioni per chi proviene da un\'app o una versione precedente',
          'mediaPreviews.restoringPreviousSession' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.restoringPreviousSession', {}) ?? 'Ripristino della sessione precedente…',
          'mediaPreviews.copiedFileURL' =>
            TranslationOverrides.string(_root.$meta, 'mediaPreviews.copiedFileURL', {}) ?? 'URL del file copiato negli appunti!',
          'viewer.tutorial.images' => TranslationOverrides.string(_root.$meta, 'viewer.tutorial.images', {}) ?? 'Immagini',
          'viewer.tutorial.tapLongTapToggleImmersive' =>
            TranslationOverrides.string(_root.$meta, 'viewer.tutorial.tapLongTapToggleImmersive', {}) ??
                'Tocco/Tocco lungo: alterna modalità immersiva',
          'viewer.tutorial.doubleTapFitScreen' =>
            TranslationOverrides.string(_root.$meta, 'viewer.tutorial.doubleTapFitScreen', {}) ??
                'Doppio tocco: adatta allo schermo / dimensione originale / reset zoom',
          'viewer.appBar.cantStartSlideshow' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.cantStartSlideshow', {}) ?? 'Impossibile avviare la Presentazione',
          'viewer.appBar.reachedLastLoadedItem' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.reachedLastLoadedItem', {}) ?? 'Raggiunto l\'ultimo elemento caricato',
          'viewer.appBar.pause' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.pause', {}) ?? 'Pausa',
          'viewer.appBar.start' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.start', {}) ?? 'Avvia',
          'viewer.appBar.unfavourite' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.unfavourite', {}) ?? 'Rimuovi dai preferiti',
          'viewer.appBar.deselect' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.deselect', {}) ?? 'Deseleziona',
          'viewer.appBar.reloadWithScaling' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.reloadWithScaling', {}) ?? 'Ricarica con ridimensionamento',
          'viewer.appBar.loadSampleQuality' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadSampleQuality', {}) ?? 'Carica la versione a risoluzione ridotta',
          'viewer.appBar.loadHighQuality' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.loadHighQuality', {}) ?? 'Carica in alta qualità',
          'viewer.appBar.dropSnatchedStatus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.dropSnatchedStatus', {}) ?? 'Rimuovi il contrassegno «Scaricato»',
          'viewer.appBar.setSnatchedStatus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.setSnatchedStatus', {}) ?? 'Segna come scaricato',
          'viewer.appBar.snatch' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.snatch', {}) ?? 'Scarica',
          'viewer.appBar.forced' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.forced', {}) ?? '(forzato)',
          'viewer.appBar.hydrusShare' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusShare', {}) ?? 'Condividi su Hydrus',
          'viewer.appBar.whichUrlToShareToHydrus' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.whichUrlToShareToHydrus', {}) ?? 'Quale URL vuoi condividere su Hydrus?',
          'viewer.appBar.postURL' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURL', {}) ?? 'URL Post',
          'viewer.appBar.fileURL' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURL', {}) ?? 'URL File',
          'viewer.appBar.hydrusNotConfigured' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrusNotConfigured', {}) ?? 'Hydrus non è configurato!',
          'viewer.appBar.shareFile' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareFile', {}) ?? 'Condividi file',
          'viewer.appBar.alreadyDownloadingThisFile' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingThisFile', {}) ??
                'Sto già scaricando questo file per la condivisione, vuoi annullare?',
          'viewer.appBar.alreadyDownloadingFile' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.alreadyDownloadingFile', {}) ??
                'È già in corso il download di un file da condividere. Vuoi annullare il download corrente e condividere un altro file?',
          'viewer.appBar.current' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.current', {}) ?? 'Attuale:',
          'viewer.appBar.kNew' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.kNew', {}) ?? 'Nuovo:',
          'viewer.appBar.shareNew' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.shareNew', {}) ?? 'Condividi nuovo',
          'viewer.appBar.abort' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.abort', {}) ?? 'Annulla',
          'viewer.appBar.error' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.error', {}) ?? 'Errore!',
          'viewer.appBar.savingFileError' =>
            TranslationOverrides.string(_root.$meta, 'viewer.appBar.savingFileError', {}) ??
                'Qualcosa è andato storto salvando il File prima della Condivisione',
          'viewer.appBar.whatToShare' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.whatToShare', {}) ?? 'Cosa vuoi condividere?',
          'viewer.appBar.postURLWithTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.postURLWithTags', {}) ?? 'URL Post con tag',
          'viewer.appBar.fileURLWithTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileURLWithTags', {}) ?? 'URL File con tag',
          'viewer.appBar.file' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.file', {}) ?? 'File',
          'viewer.appBar.fileWithTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.fileWithTags', {}) ?? 'File con tag',
          'viewer.appBar.hydrus' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.hydrus', {}) ?? 'Hydrus',
          'viewer.appBar.selectTags' => TranslationOverrides.string(_root.$meta, 'viewer.appBar.selectTags', {}) ?? 'Seleziona tag',
          'viewer.notes.note' => TranslationOverrides.string(_root.$meta, 'viewer.notes.note', {}) ?? 'Nota',
          'viewer.notes.notes' => TranslationOverrides.string(_root.$meta, 'viewer.notes.notes', {}) ?? 'Note',
          'viewer.notes.coordinates' => ({
            required int posX,
            required int posY,
          }) => TranslationOverrides.string(_root.$meta, 'viewer.notes.coordinates', {'posX': posX, 'posY': posY}) ?? 'X:${posX}, Y:${posY}',
          'common.selectABooru' => TranslationOverrides.string(_root.$meta, 'common.selectABooru', {}) ?? 'Seleziona un booru',
          'common.booruItemCopiedToClipboard' =>
            TranslationOverrides.string(_root.$meta, 'common.booruItemCopiedToClipboard', {}) ?? 'Elemento booru copiato negli appunti',
          'gallery.snatchQuestion' => TranslationOverrides.string(_root.$meta, 'gallery.snatchQuestion', {}) ?? 'Scaricare?',
          'gallery.noPostUrl' => TranslationOverrides.string(_root.$meta, 'gallery.noPostUrl', {}) ?? 'Nessun URL post!',
          'gallery.loadingFile' => TranslationOverrides.string(_root.$meta, 'gallery.loadingFile', {}) ?? 'Caricamento file…',
          'gallery.loadingFileMessage' =>
            TranslationOverrides.string(_root.$meta, 'gallery.loadingFileMessage', {}) ?? 'Potrebbe richiedere del tempo, attendi…',
          'gallery.sources' =>
            ({required num count}) =>
                TranslationOverrides.plural(_root.$meta, 'gallery.sources', {'count': count}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
                  count,
                  one: 'Fonte',
                  many: 'Fonti',
                  other: 'Fonti',
                ),
          'galleryButtons.snatch' => TranslationOverrides.string(_root.$meta, 'galleryButtons.snatch', {}) ?? 'Scarica',
          'galleryButtons.favourite' => TranslationOverrides.string(_root.$meta, 'galleryButtons.favourite', {}) ?? 'Aggiungi ai preferiti',
          'galleryButtons.info' => TranslationOverrides.string(_root.$meta, 'galleryButtons.info', {}) ?? 'Info',
          'galleryButtons.share' => TranslationOverrides.string(_root.$meta, 'galleryButtons.share', {}) ?? 'Condividi',
          'galleryButtons.select' => TranslationOverrides.string(_root.$meta, 'galleryButtons.select', {}) ?? 'Seleziona',
          'galleryButtons.open' => TranslationOverrides.string(_root.$meta, 'galleryButtons.open', {}) ?? 'Apri nel browser',
          'galleryButtons.slideshow' => TranslationOverrides.string(_root.$meta, 'galleryButtons.slideshow', {}) ?? 'Presentazione',
          'galleryButtons.reloadNoScale' =>
            TranslationOverrides.string(_root.$meta, 'galleryButtons.reloadNoScale', {}) ?? 'Alterna ridimensionamento',
          'galleryButtons.toggleQuality' => TranslationOverrides.string(_root.$meta, 'galleryButtons.toggleQuality', {}) ?? 'Alterna qualità',
          'galleryButtons.externalPlayer' => TranslationOverrides.string(_root.$meta, 'galleryButtons.externalPlayer', {}) ?? 'Lettore esterno',
          'galleryButtons.imageSearch' => TranslationOverrides.string(_root.$meta, 'galleryButtons.imageSearch', {}) ?? 'Ricerca immagine',
          'media.loading.rendering' => TranslationOverrides.string(_root.$meta, 'media.loading.rendering', {}) ?? 'Rendering…',
          'media.loading.loadingAndRenderingFromCache' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.loadingAndRenderingFromCache', {}) ?? 'Caricamento e rendering dalla cache…',
          'media.loading.loadingFromCache' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.loadingFromCache', {}) ?? 'Caricamento dalla cache…',
          'media.loading.buffering' => TranslationOverrides.string(_root.$meta, 'media.loading.buffering', {}) ?? 'Buffering…',
          'media.loading.loading' => TranslationOverrides.string(_root.$meta, 'media.loading.loading', {}) ?? 'Caricamento…',
          'media.loading.loadAnyway' => TranslationOverrides.string(_root.$meta, 'media.loading.loadAnyway', {}) ?? 'Carica comunque',
          'media.loading.restartLoading' => TranslationOverrides.string(_root.$meta, 'media.loading.restartLoading', {}) ?? 'Riavvia caricamento',
          'media.loading.stopLoading' => TranslationOverrides.string(_root.$meta, 'media.loading.stopLoading', {}) ?? 'Ferma caricamento',
          'media.loading.startedSecondsAgo' => ({
            required int seconds,
          }) => TranslationOverrides.string(_root.$meta, 'media.loading.startedSecondsAgo', {'seconds': seconds}) ?? 'Iniziato ${seconds}s fa',
          'media.loading.stopReasons.stoppedByUser' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.stoppedByUser', {}) ?? 'Interrotto dall\'utente',
          'media.loading.stopReasons.loadingError' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.loadingError', {}) ?? 'Errore di caricamento',
          'media.loading.stopReasons.fileIsTooBig' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.fileIsTooBig', {}) ?? 'File troppo grande',
          'media.loading.stopReasons.hiddenByFilters' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.hiddenByFilters', {}) ?? 'Nascosto dai filtri:',
          'media.loading.stopReasons.videoError' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.stopReasons.videoError', {}) ?? 'Errore video',
          'media.loading.fileIsZeroBytes' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.fileIsZeroBytes', {}) ?? 'Il file ha una dimensione di 0 byte',
          'media.loading.fileSize' => ({
            required String size,
          }) => TranslationOverrides.string(_root.$meta, 'media.loading.fileSize', {'size': size}) ?? 'Dimensione file: ${size}',
          'media.loading.sizeLimit' => ({
            required String limit,
          }) => TranslationOverrides.string(_root.$meta, 'media.loading.sizeLimit', {'limit': limit}) ?? 'Limite: ${limit}',
          'media.loading.tryChangingVideoBackend' =>
            TranslationOverrides.string(_root.$meta, 'media.loading.tryChangingVideoBackend', {}) ??
                'Problemi di riproduzione frequenti? Prova a cambiare [Impostazioni > Video > Backend del lettore video]',
          'media.video.videosDisabledOrNotSupported' =>
            TranslationOverrides.string(_root.$meta, 'media.video.videosDisabledOrNotSupported', {}) ?? 'Video disabilitati o non supportati',
          'media.video.openVideoInExternalPlayer' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openVideoInExternalPlayer', {}) ?? 'Apri video nel lettore esterno',
          'media.video.openVideoInBrowser' =>
            TranslationOverrides.string(_root.$meta, 'media.video.openVideoInBrowser', {}) ?? 'Apri video nel browser',
          'media.video.failedToLoadItemData' =>
            TranslationOverrides.string(_root.$meta, 'media.video.failedToLoadItemData', {}) ?? 'Impossibile caricare i dati dell\'elemento',
          'media.video.loadingItemData' =>
            TranslationOverrides.string(_root.$meta, 'media.video.loadingItemData', {}) ?? 'Caricamento dati elemento…',
          'media.video.retry' => TranslationOverrides.string(_root.$meta, 'media.video.retry', {}) ?? 'Riprova',
          'media.video.openFileInBrowser' => TranslationOverrides.string(_root.$meta, 'media.video.openFileInBrowser', {}) ?? 'Apri file nel browser',
          'media.video.openPostInBrowser' => TranslationOverrides.string(_root.$meta, 'media.video.openPostInBrowser', {}) ?? 'Apri post nel browser',
          'media.video.currentlyChecking' => TranslationOverrides.string(_root.$meta, 'media.video.currentlyChecking', {}) ?? 'Controllo in corso:',
          'media.video.unknownFileFormat' =>
            ({required String fileExt}) =>
                TranslationOverrides.string(_root.$meta, 'media.video.unknownFileFormat', {'fileExt': fileExt}) ??
                'Formato file sconosciuto (.${fileExt}), tocca qui per aprire nel browser',
          'imageStats.live' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'imageStats.live', {'count': count}) ?? 'Immagini attive: ${count}',
          'imageStats.pending' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'imageStats.pending', {'count': count}) ?? 'In sospeso: ${count}',
          'imageStats.total' => ({
            required int count,
          }) => TranslationOverrides.string(_root.$meta, 'imageStats.total', {'count': count}) ?? 'Totale: ${count}',
          'imageStats.size' => ({
            required String size,
          }) => TranslationOverrides.string(_root.$meta, 'imageStats.size', {'size': size}) ?? 'Dimensione: ${size}',
          'imageStats.max' => ({required String max}) => TranslationOverrides.string(_root.$meta, 'imageStats.max', {'max': max}) ?? 'Max: ${max}',
          'preview.error.noResults' => TranslationOverrides.string(_root.$meta, 'preview.error.noResults', {}) ?? 'Nessun risultato',
          'preview.error.noResultsSubtitle' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.noResultsSubtitle', {}) ?? 'Cambia la query di ricerca o tocca per riprovare',
          'preview.error.reachedEnd' => TranslationOverrides.string(_root.$meta, 'preview.error.reachedEnd', {}) ?? 'Hai raggiunto la fine',
          'preview.error.reachedEndSubtitle' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.reachedEndSubtitle', {'pageNum': pageNum}) ??
                'Pagine caricate: ${pageNum}\nTocca qui per ricaricare l\'ultima pagina',
          'preview.error.loadingPage' => ({
            required int pageNum,
          }) => TranslationOverrides.string(_root.$meta, 'preview.error.loadingPage', {'pageNum': pageNum}) ?? 'Caricamento pagina #${pageNum}…',
          'preview.error.startedAgo' =>
            ({required num seconds}) =>
                TranslationOverrides.plural(_root.$meta, 'preview.error.startedAgo', {'seconds': seconds}) ??
                (_root.$meta.cardinalResolver ?? LocalizationPluralRules.cardinal('it_IT'))(
                  seconds,
                  one: 'Iniziato ${seconds} secondo fa',
                  many: 'Iniziato ${seconds} secondi fa',
                  other: 'Iniziato ${seconds} secondi fa',
                ),
          'preview.error.tapToRetryIfStuck' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetryIfStuck', {}) ??
                'Tocca per riprovare se la richiesta sembra bloccata o impiega troppo tempo',
          'preview.error.errorLoadingPage' =>
            ({required int pageNum}) =>
                TranslationOverrides.string(_root.$meta, 'preview.error.errorLoadingPage', {'pageNum': pageNum}) ??
                'Errore caricamento pagina #${pageNum}',
          'preview.error.errorWithMessage' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.errorWithMessage', {}) ?? 'Tocca qui per riprovare',
          'preview.error.errorNoResultsLoaded' =>
            TranslationOverrides.string(_root.$meta, 'preview.error.errorNoResultsLoaded', {}) ?? 'Errore, nessun risultato caricato',
          'preview.error.tapToRetry' => TranslationOverrides.string(_root.$meta, 'preview.error.tapToRetry', {}) ?? 'Tocca qui per riprovare',
          'tagType.artist' => TranslationOverrides.string(_root.$meta, 'tagType.artist', {}) ?? 'Artista',
          'tagType.character' => TranslationOverrides.string(_root.$meta, 'tagType.character', {}) ?? 'Personaggio',
          'tagType.copyright' => TranslationOverrides.string(_root.$meta, 'tagType.copyright', {}) ?? 'Opera / serie',
          'tagType.meta' => TranslationOverrides.string(_root.$meta, 'tagType.meta', {}) ?? 'Meta',
          'tagType.species' => TranslationOverrides.string(_root.$meta, 'tagType.species', {}) ?? 'Specie',
          'tagType.lore' => TranslationOverrides.string(_root.$meta, 'tagType.lore', {}) ?? 'Lore',
          'tagType.none' => TranslationOverrides.string(_root.$meta, 'tagType.none', {}) ?? 'Nessuno/Generale',
          _ => null,
        };
  }
}
