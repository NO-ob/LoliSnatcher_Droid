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
  String get yes => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Si';
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
  String get thisMayTakeSomeTime => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'Potrebbe richiedere un pò di tempo…';
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
  String get apiKey => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'API Key';
  @override
  String get userId => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'ID Utente';
  @override
  String get login => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Login';
  @override
  String get password => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Password';
  @override
  String get pause => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Pause';
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
  String get tags => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'Tags';
  @override
  String get type => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'Tipo';
  @override
  String get name => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Nome';
  @override
  String get address => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'Indirizzo';
  @override
  String get username => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'Nomeutente';
  @override
  String get favourites => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'Preferiti';
  @override
  String get downloads => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'Downloads';
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
      TranslationOverrides.string(_root.$meta, 'validationErrors.rangeError', {'min': min, 'max': max}) ??
      'Inserisci un valore tra ${min} and ${max}';
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
  String get loadingDatabase => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Caricando il database…';
  @override
  String get loadingBoorus => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Caricamento boorus…';
  @override
  String get loadingTags => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Caricamento tags…';
  @override
  String get restoringTabs => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Ripristinando le schede…';
}

// Path: permissions
class _Translations$permissions$it_IT extends Translations$permissions$en {
  _Translations$permissions$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get noAccessToCustomStorageDirectory =>
      TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ?? 'Nessun accesso alla cartella selezionata';
  @override
  String get pleaseSetStorageDirectoryAgain =>
      TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ??
      'Seleziona nuovamente la cartella per garantire l\'accesso all\'app';
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
      TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ??
      'Nessun riconoscimento biometrico hardware disponibile';
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
      TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? 'Ripristinando i tags di default';
  @override
  String get uoh => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'UOOOOOOOHHH';
  @override
  String get ratingsChanged => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? 'Ratings cambiati';
  @override
  String ratingsChangedMessage({required String booruType}) =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
      'Su ${booruType} [rating:safe] è stato rimpiazzato da [rating:general] e [rating:sensitive]';
  @override
  String get appFixedRatingAutomatically =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ??
      'I ratings sono stati auto-fixati. Usa i rating corretti nelle ricerche future';
  @override
  String get tabsRestored => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? 'Schede ripristinate';
  @override
  String restoredTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('it'))(
        count,
        one: 'Ripristinata ${count} scheda da una sessione precedente',
        many: 'Ripristinate ${count} schede da una sessione precedente',
      );
  @override
  String get someRestoredTabsHadIssues =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ??
      'Alcune schede ripristinate hanno boorus sconosciute o caratteri danneggiati.';
  @override
  String get theyWereSetToDefaultOrIgnored =>
      TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ?? 'Sono stati impostati su default o ignorati.';
  @override
  String get listOfBrokenTabs => TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? 'Lista delle schede danneggiate:';
  @override
  String get tabsMerged => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? 'Schede unite';
  @override
  String addedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('it'))(
        count,
        many: 'Aggiunte ${count} nuove schede',
      );
  @override
  String get tabsReplaced => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? 'Schede sostituite';
  @override
  String receivedTabsCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('it'))(
        count,
        one: 'Ricevuta ${count} scheda',
        many: 'Ricevute ${count} schede',
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
  String get snatchingHistory => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'Storico di Snatching';
  @override
  String get enterTags => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'Inserisci tags';
  @override
  String get amount => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? 'Quantità';
  @override
  String get amountOfFilesToSnatch =>
      TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? 'Quantità di file da Snatchare';
  @override
  String get delayInMs => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? 'Ritardo (in ms)';
  @override
  String get delayBetweenEachDownload =>
      TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? 'Ritardo tra ogni download';
  @override
  String get snatchFiles => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? 'Snatch files';
  @override
  String get itemWasAlreadySnatched =>
      TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? 'L\'oggetto è stato già snatchato';
  @override
  String get failedToSnatchItem => TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? 'Snatch dell\'oggetto fallito';
  @override
  String get itemWasCancelled => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? 'L\'oggetto è stato cancellato';
  @override
  String get startingNextQueueItem =>
      TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? 'Iniziando il prossimo oggetto in coda';
  @override
  String get itemsSnatched => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? 'Oggetti snatchati';
  @override
  String snatchedCount({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('it'))(
        count,
        one: 'Snatchato: ${count} oggetto',
        many: 'Snatchati: ${count} oggetti',
      );
  @override
  String filesAlreadySnatched({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('it'))(
        count,
        one: '${count} file è stato già snatchato',
        many: '${count} files sono stati già snatchati',
      );
  @override
  String failedToSnatchFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('it'))(
        count,
        one: 'Snatch di ${count} file fallito',
        many: 'Snatch di ${count} files fallito',
      );
  @override
  String cancelledFiles({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('it'))(
        count,
        one: 'Cancellato ${count} file',
        many: 'Cancellati ${count} files',
      );
  @override
  String get snatchingImages => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? 'Snatching immagini';
  @override
  String get doNotCloseApp => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? 'Non chiudere l\'app!';
  @override
  String get addedItemToQueue =>
      TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? 'Aggiunti gli oggetti alla coda di snatch';
  @override
  String addedItemsToQueue({required num count}) =>
      TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('it'))(
        count,
        one: 'aggiunto ${count} oggetto alla coda di snatch',
        many: 'aggiunti ${count} oggetti alla coda di snatch',
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
      TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ?? 'Si necessita di almeno 2 boorus configurato';
  @override
  String get selectSecondaryBoorus => TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Seleziona altri boorus:';
  @override
  String get akaMultibooruMode => TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? 'aka Modalità multibooru';
  @override
  String get labelSecondaryBoorusToInclude =>
      TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? 'boorus secondari da includere';
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
      'Potresti non aver dato i permessi API corretti, possono essere modificati in Review Service';
  @override
  String get addTagsToFile => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? 'Agiungi i tags al file';
  @override
  String get addUrls => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'Aggiungi URLs';
}

// Path: tabs
class _Translations$tabs$it_IT extends Translations$tabs$en {
  _Translations$tabs$it_IT._(TranslationsItIt root) : this._root = root, super.internal(root);

  final TranslationsItIt _root; // ignore: unused_field

  // Translations
  @override
  String get tab => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? 'Schede';
  @override
  String get addBoorusInSettings => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? 'Aggiungi boorus in impostazioni';
  @override
  String get selectABooru => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? 'Seleziona un Booru';
  @override
  String get secondaryBoorus => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? 'Boorus secondari';
  @override
  String get addNewTab => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? 'Aggiungi nuova scheda';
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
      'yes' => TranslationOverrides.string(_root.$meta, 'yes', {}) ?? 'Si',
      'no' => TranslationOverrides.string(_root.$meta, 'no', {}) ?? 'No',
      'pleaseWait' => TranslationOverrides.string(_root.$meta, 'pleaseWait', {}) ?? 'Attendere prego…',
      'show' => TranslationOverrides.string(_root.$meta, 'show', {}) ?? 'Mostra',
      'hide' => TranslationOverrides.string(_root.$meta, 'hide', {}) ?? 'Nascondi',
      'enable' => TranslationOverrides.string(_root.$meta, 'enable', {}) ?? 'Abilita',
      'disable' => TranslationOverrides.string(_root.$meta, 'disable', {}) ?? 'Disabilita',
      'add' => TranslationOverrides.string(_root.$meta, 'add', {}) ?? 'Aggiungi',
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
      'thisMayTakeSomeTime' => TranslationOverrides.string(_root.$meta, 'thisMayTakeSomeTime', {}) ?? 'Potrebbe richiedere un pò di tempo…',
      'exitTheAppQuestion' => TranslationOverrides.string(_root.$meta, 'exitTheAppQuestion', {}) ?? 'Chiudere l\'app?',
      'closeTheApp' => TranslationOverrides.string(_root.$meta, 'closeTheApp', {}) ?? 'Chiudi applicazione',
      'invalidUrl' => TranslationOverrides.string(_root.$meta, 'invalidUrl', {}) ?? 'URL non valido!',
      'clipboardIsEmpty' => TranslationOverrides.string(_root.$meta, 'clipboardIsEmpty', {}) ?? 'Appunti vuoti!',
      'failedToOpenLink' => TranslationOverrides.string(_root.$meta, 'failedToOpenLink', {}) ?? 'Impossibile aprire il link',
      'apiKey' => TranslationOverrides.string(_root.$meta, 'apiKey', {}) ?? 'API Key',
      'userId' => TranslationOverrides.string(_root.$meta, 'userId', {}) ?? 'ID Utente',
      'login' => TranslationOverrides.string(_root.$meta, 'login', {}) ?? 'Login',
      'password' => TranslationOverrides.string(_root.$meta, 'password', {}) ?? 'Password',
      'pause' => TranslationOverrides.string(_root.$meta, 'pause', {}) ?? 'Pause',
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
      'tags' => TranslationOverrides.string(_root.$meta, 'tags', {}) ?? 'Tags',
      'type' => TranslationOverrides.string(_root.$meta, 'type', {}) ?? 'Tipo',
      'name' => TranslationOverrides.string(_root.$meta, 'name', {}) ?? 'Nome',
      'address' => TranslationOverrides.string(_root.$meta, 'address', {}) ?? 'Indirizzo',
      'username' => TranslationOverrides.string(_root.$meta, 'username', {}) ?? 'Nomeutente',
      'favourites' => TranslationOverrides.string(_root.$meta, 'favourites', {}) ?? 'Preferiti',
      'downloads' => TranslationOverrides.string(_root.$meta, 'downloads', {}) ?? 'Downloads',
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
            'Inserisci un valore tra ${min} and ${max}',
      'validationErrors.greaterThanOrEqualZero' =>
        TranslationOverrides.string(_root.$meta, 'validationErrors.greaterThanOrEqualZero', {}) ?? 'Inserisci un valore pari o maggiore di 0',
      'validationErrors.lessThan4' => TranslationOverrides.string(_root.$meta, 'validationErrors.lessThan4', {}) ?? 'Inserisci un valore minore di 4',
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
      'init.loadingDatabase' => TranslationOverrides.string(_root.$meta, 'init.loadingDatabase', {}) ?? 'Caricando il database…',
      'init.loadingBoorus' => TranslationOverrides.string(_root.$meta, 'init.loadingBoorus', {}) ?? 'Caricamento boorus…',
      'init.loadingTags' => TranslationOverrides.string(_root.$meta, 'init.loadingTags', {}) ?? 'Caricamento tags…',
      'init.restoringTabs' => TranslationOverrides.string(_root.$meta, 'init.restoringTabs', {}) ?? 'Ripristinando le schede…',
      'permissions.noAccessToCustomStorageDirectory' =>
        TranslationOverrides.string(_root.$meta, 'permissions.noAccessToCustomStorageDirectory', {}) ?? 'Nessun accesso alla cartella selezionata',
      'permissions.pleaseSetStorageDirectoryAgain' =>
        TranslationOverrides.string(_root.$meta, 'permissions.pleaseSetStorageDirectoryAgain', {}) ??
            'Seleziona nuovamente la cartella per garantire l\'accesso all\'app',
      'permissions.currentPath' => ({
        required String path,
      }) => TranslationOverrides.string(_root.$meta, 'permissions.currentPath', {'path': path}) ?? 'Percorso attuale: ${path}',
      'permissions.setDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.setDirectory', {}) ?? 'Imposta cartella',
      'permissions.currentlyNotAvailableForThisPlatform' =>
        TranslationOverrides.string(_root.$meta, 'permissions.currentlyNotAvailableForThisPlatform', {}) ?? 'Non disponibile su questa piattaforma',
      'permissions.resetDirectory' => TranslationOverrides.string(_root.$meta, 'permissions.resetDirectory', {}) ?? 'Resetta cartella',
      'permissions.afterResetFilesWillBeSavedToDefaultDirectory' =>
        TranslationOverrides.string(_root.$meta, 'permissions.afterResetFilesWillBeSavedToDefaultDirectory', {}) ??
            'I file saranno salvati nella cartella di default dopo il reset',
      'authentication.pleaseAuthenticateToUseTheApp' =>
        TranslationOverrides.string(_root.$meta, 'authentication.pleaseAuthenticateToUseTheApp', {}) ?? 'Autenticati per usare l\'app',
      'authentication.noBiometricHardwareAvailable' =>
        TranslationOverrides.string(_root.$meta, 'authentication.noBiometricHardwareAvailable', {}) ??
            'Nessun riconoscimento biometrico hardware disponibile',
      'authentication.temporaryLockout' =>
        TranslationOverrides.string(_root.$meta, 'authentication.temporaryLockout', {}) ?? 'Bloccato temporaneamente',
      'authentication.somethingWentWrong' =>
        ({required String error}) =>
            TranslationOverrides.string(_root.$meta, 'authentication.somethingWentWrong', {'error': error}) ??
            'Qualcosa è andato storto durante l\'autenticazione: ${error}',
      'searchHandler.removedLastTab' => TranslationOverrides.string(_root.$meta, 'searchHandler.removedLastTab', {}) ?? 'Ultima scheda rimossa',
      'searchHandler.resettingSearchToDefaultTags' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.resettingSearchToDefaultTags', {}) ?? 'Ripristinando i tags di default',
      'searchHandler.uoh' => TranslationOverrides.string(_root.$meta, 'searchHandler.uoh', {}) ?? 'UOOOOOOOHHH',
      'searchHandler.ratingsChanged' => TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChanged', {}) ?? 'Ratings cambiati',
      'searchHandler.ratingsChangedMessage' =>
        ({required String booruType}) =>
            TranslationOverrides.string(_root.$meta, 'searchHandler.ratingsChangedMessage', {'booruType': booruType}) ??
            'Su ${booruType} [rating:safe] è stato rimpiazzato da [rating:general] e [rating:sensitive]',
      'searchHandler.appFixedRatingAutomatically' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.appFixedRatingAutomatically', {}) ??
            'I ratings sono stati auto-fixati. Usa i rating corretti nelle ricerche future',
      'searchHandler.tabsRestored' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsRestored', {}) ?? 'Schede ripristinate',
      'searchHandler.restoredTabsCount' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'searchHandler.restoredTabsCount', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('it'))(
              count,
              one: 'Ripristinata ${count} scheda da una sessione precedente',
              many: 'Ripristinate ${count} schede da una sessione precedente',
            ),
      'searchHandler.someRestoredTabsHadIssues' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.someRestoredTabsHadIssues', {}) ??
            'Alcune schede ripristinate hanno boorus sconosciute o caratteri danneggiati.',
      'searchHandler.theyWereSetToDefaultOrIgnored' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.theyWereSetToDefaultOrIgnored', {}) ?? 'Sono stati impostati su default o ignorati.',
      'searchHandler.listOfBrokenTabs' =>
        TranslationOverrides.string(_root.$meta, 'searchHandler.listOfBrokenTabs', {}) ?? 'Lista delle schede danneggiate:',
      'searchHandler.tabsMerged' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsMerged', {}) ?? 'Schede unite',
      'searchHandler.addedTabsCount' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'searchHandler.addedTabsCount', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('it'))(
              count,
              many: 'Aggiunte ${count} nuove schede',
            ),
      'searchHandler.tabsReplaced' => TranslationOverrides.string(_root.$meta, 'searchHandler.tabsReplaced', {}) ?? 'Schede sostituite',
      'searchHandler.receivedTabsCount' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'searchHandler.receivedTabsCount', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('it'))(
              count,
              one: 'Ricevuta ${count} scheda',
              many: 'Ricevute ${count} schede',
            ),
      'snatcher.title' => TranslationOverrides.string(_root.$meta, 'snatcher.title', {}) ?? 'Snatcher',
      'snatcher.snatchingHistory' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingHistory', {}) ?? 'Storico di Snatching',
      'snatcher.enterTags' => TranslationOverrides.string(_root.$meta, 'snatcher.enterTags', {}) ?? 'Inserisci tags',
      'snatcher.amount' => TranslationOverrides.string(_root.$meta, 'snatcher.amount', {}) ?? 'Quantità',
      'snatcher.amountOfFilesToSnatch' =>
        TranslationOverrides.string(_root.$meta, 'snatcher.amountOfFilesToSnatch', {}) ?? 'Quantità di file da Snatchare',
      'snatcher.delayInMs' => TranslationOverrides.string(_root.$meta, 'snatcher.delayInMs', {}) ?? 'Ritardo (in ms)',
      'snatcher.delayBetweenEachDownload' =>
        TranslationOverrides.string(_root.$meta, 'snatcher.delayBetweenEachDownload', {}) ?? 'Ritardo tra ogni download',
      'snatcher.snatchFiles' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchFiles', {}) ?? 'Snatch files',
      'snatcher.itemWasAlreadySnatched' =>
        TranslationOverrides.string(_root.$meta, 'snatcher.itemWasAlreadySnatched', {}) ?? 'L\'oggetto è stato già snatchato',
      'snatcher.failedToSnatchItem' => TranslationOverrides.string(_root.$meta, 'snatcher.failedToSnatchItem', {}) ?? 'Snatch dell\'oggetto fallito',
      'snatcher.itemWasCancelled' => TranslationOverrides.string(_root.$meta, 'snatcher.itemWasCancelled', {}) ?? 'L\'oggetto è stato cancellato',
      'snatcher.startingNextQueueItem' =>
        TranslationOverrides.string(_root.$meta, 'snatcher.startingNextQueueItem', {}) ?? 'Iniziando il prossimo oggetto in coda',
      'snatcher.itemsSnatched' => TranslationOverrides.string(_root.$meta, 'snatcher.itemsSnatched', {}) ?? 'Oggetti snatchati',
      'snatcher.snatchedCount' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'snatcher.snatchedCount', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('it'))(
              count,
              one: 'Snatchato: ${count} oggetto',
              many: 'Snatchati: ${count} oggetti',
            ),
      'snatcher.filesAlreadySnatched' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'snatcher.filesAlreadySnatched', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('it'))(
              count,
              one: '${count} file è stato già snatchato',
              many: '${count} files sono stati già snatchati',
            ),
      'snatcher.failedToSnatchFiles' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'snatcher.failedToSnatchFiles', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('it'))(
              count,
              one: 'Snatch di ${count} file fallito',
              many: 'Snatch di ${count} files fallito',
            ),
      'snatcher.cancelledFiles' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'snatcher.cancelledFiles', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('it'))(
              count,
              one: 'Cancellato ${count} file',
              many: 'Cancellati ${count} files',
            ),
      'snatcher.snatchingImages' => TranslationOverrides.string(_root.$meta, 'snatcher.snatchingImages', {}) ?? 'Snatching immagini',
      'snatcher.doNotCloseApp' => TranslationOverrides.string(_root.$meta, 'snatcher.doNotCloseApp', {}) ?? 'Non chiudere l\'app!',
      'snatcher.addedItemToQueue' =>
        TranslationOverrides.string(_root.$meta, 'snatcher.addedItemToQueue', {}) ?? 'Aggiunti gli oggetti alla coda di snatch',
      'snatcher.addedItemsToQueue' =>
        ({required num count}) =>
            TranslationOverrides.plural(_root.$meta, 'snatcher.addedItemsToQueue', {'count': count}) ??
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('it'))(
              count,
              one: 'aggiunto ${count} oggetto alla coda di snatch',
              many: 'aggiunti ${count} oggetti alla coda di snatch',
            ),
      'multibooru.title' => TranslationOverrides.string(_root.$meta, 'multibooru.title', {}) ?? 'Multibooru',
      'multibooru.multibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.multibooruMode', {}) ?? 'Modalità Multibooru',
      'multibooru.multibooruRequiresAtLeastTwoBoorus' =>
        TranslationOverrides.string(_root.$meta, 'multibooru.multibooruRequiresAtLeastTwoBoorus', {}) ??
            'Si necessita di almeno 2 boorus configurato',
      'multibooru.selectSecondaryBoorus' =>
        TranslationOverrides.string(_root.$meta, 'multibooru.selectSecondaryBoorus', {}) ?? 'Seleziona altri boorus:',
      'multibooru.akaMultibooruMode' => TranslationOverrides.string(_root.$meta, 'multibooru.akaMultibooruMode', {}) ?? 'aka Modalità multibooru',
      'multibooru.labelSecondaryBoorusToInclude' =>
        TranslationOverrides.string(_root.$meta, 'multibooru.labelSecondaryBoorusToInclude', {}) ?? 'boorus secondari da includere',
      'hydrus.importError' => TranslationOverrides.string(_root.$meta, 'hydrus.importError', {}) ?? 'Qualcosa è andato storto importando su hydrus',
      'hydrus.apiPermissionsRequired' =>
        TranslationOverrides.string(_root.$meta, 'hydrus.apiPermissionsRequired', {}) ??
            'Potresti non aver dato i permessi API corretti, possono essere modificati in Review Service',
      'hydrus.addTagsToFile' => TranslationOverrides.string(_root.$meta, 'hydrus.addTagsToFile', {}) ?? 'Agiungi i tags al file',
      'hydrus.addUrls' => TranslationOverrides.string(_root.$meta, 'hydrus.addUrls', {}) ?? 'Aggiungi URLs',
      'tabs.tab' => TranslationOverrides.string(_root.$meta, 'tabs.tab', {}) ?? 'Schede',
      'tabs.addBoorusInSettings' => TranslationOverrides.string(_root.$meta, 'tabs.addBoorusInSettings', {}) ?? 'Aggiungi boorus in impostazioni',
      'tabs.selectABooru' => TranslationOverrides.string(_root.$meta, 'tabs.selectABooru', {}) ?? 'Seleziona un Booru',
      'tabs.secondaryBoorus' => TranslationOverrides.string(_root.$meta, 'tabs.secondaryBoorus', {}) ?? 'Boorus secondari',
      'tabs.addNewTab' => TranslationOverrides.string(_root.$meta, 'tabs.addNewTab', {}) ?? 'Aggiungi nuova scheda',
      _ => null,
    };
  }
}
